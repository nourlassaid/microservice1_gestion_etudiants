const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');
const nodemailer = require('nodemailer');
const { swaggerSpec, swaggerUi } = require('./swagger');

const app = express();
const port = process.env.PORT || 4000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

const client = require('prom-client');

// Enable Prometheus metrics collection
const register = new client.Registry();
client.collectDefaultMetrics({ register });

// Create a histogram metric for utilisateur-ms service
const utilisateurRequestDurationMicroseconds = new client.Histogram({
  name: 'utilisateur_request_duration_seconds',
  help: 'Duration of utilisateur-ms service HTTP requests in microseconds',
  labelNames: ['method', 'route', 'code'],
  buckets: [0.1, 0.3, 0.5, 0.7, 1, 3, 5, 7, 10]
});

// Register the histogram for utilisateur-ms service
register.registerMetric(utilisateurRequestDurationMicroseconds);

// Middleware to measure request duration for utilisateur-ms service
app.use((req, res, next) => {
  const end = utilisateurRequestDurationMicroseconds.startTimer();
  res.on('finish', () => {
    end({ method: req.method, route: req.url, code: res.statusCode });
  });
  next();
});

// Route to expose Prometheus metrics
app.get('/metrics', async (req, res) => {
  try {
    const metrics = await register.metrics();
    res.set('Content-Type', register.contentType);
    res.end(metrics);
  } catch (error) {
    console.error('Error generating metrics:', error);
    res.status(500).send('Error generating metrics');
  }
});

const pool = mysql.createPool({
  connectionLimit: 10,
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '0000',
  database: process.env.DB_NAME || 'formation_management'
});

pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to the database:', err);
  } else {
    console.log('Connected to the database');
    connection.release();
  }
});

app.post('/etudiants', (req, res) => {
  const etudiant = req.body;
  console.log('Received student data:', etudiant); // Log incoming data

  const today = new Date();
  const formattedDate = today.toISOString().split('T')[0];

  if (!etudiant.cin || !etudiant.nom || !etudiant.prenom || !etudiant.email) {
    console.error('Missing required fields');
    return res.status(400).send('Missing required fields');
  }

  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting connection from pool:', err);
      return res.status(500).send('Error getting connection from pool');
    }

    connection.query('SELECT * FROM etudiants WHERE cin = ?', etudiant.cin, (error, results) => {
      if (error) {
        console.error('Error checking for existing student:', error);
        connection.release();
        return res.status(500).send('Error checking for existing student');
      }
      if (results.length > 0) {
        console.log('Student with the same cin already exists');
        connection.release();
        return res.status(400).send('Student with the same cin already exists');
      }
      connection.query('INSERT INTO etudiants SET ?', { ...etudiant, date_inscription: formattedDate }, (error, results) => {
        connection.release();
        if (error) {
          console.error('Error inserting student:', error);
          return res.status(500).send('Error inserting student');
        }
        console.log('Student inserted successfully');
        res.status(201).send({ id: results.insertId, message: 'Student added successfully' });
      });
    });
  });
});

app.get('/etudiants', (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting connection from pool:', err);
      return res.status(500).send('Error getting connection from pool');
    }

    connection.query('SELECT * FROM etudiants', (error, results) => {
      connection.release();
      if (error) {
        console.error('Error fetching students:', error);
        return res.status(500).send('Error fetching students');
      }
      res.status(200).json(results);
    });
  });
});

// Swagger documentation endpoint
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

module.exports = app;

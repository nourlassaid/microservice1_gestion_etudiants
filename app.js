const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 4000;

// Middleware pour autoriser les requêtes provenant du port 4200 (le port de développement Angular)
app.use(cors({
  origin: 'http://localhost:4200',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
}));

// Configuration de MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '0000',
  database: 'formation_management'
});

// Connexion à la base de données
db.connect((err) => {
  if (err) throw err;
  console.log('Connected to database');
});

// Middleware pour parser les requêtes JSON
app.use(bodyParser.json());

// Opérations CRUD pour les étudiants
// POST - Ajouter un nouvel étudiant
app.post('/students', (req, res) => {
  const studentData = req.body;
  db.query('INSERT INTO etudiants SET ?', studentData, (err, result) => {
    if (err) {
      console.error('Error adding student: ', err);
      res.status(500).json({ error: 'An error occurred while adding student' });
    } else {
      res.status(201).json({ message: 'Student added successfully', id: result.insertId });
    }
  });
});

// GET - Récupérer tous les étudiants
app.get('/students', (req, res) => {
  db.query('SELECT * FROM etudiants', (err, rows) => {
    if (err) {
      console.error('Error getting students: ', err);
      res.status(500).json({ error: 'An error occurred while getting students' });
    } else {
      res.status(200).json(rows);
    }
  });
});

// GET - Rechercher des étudiants par nom ou prénom
app.get('/students/search', (req, res) => {
  const searchTerm = req.query.search;
  const queryString = `SELECT * FROM etudiants WHERE nom LIKE '%${searchTerm}%' OR prenom LIKE '%${searchTerm}%'`;
  db.query(queryString, (err, rows) => {
    if (err) {
      console.error('Error searching for students: ', err);
      res.status(500).json({ error: 'An error occurred while searching for students' });
    } else {
      res.status(200).json(rows);
    }
  });
});


// GET - Rechercher des étudiants par nom ou prénom
app.get('/students/search/:term', (req, res) => {
  const searchTerm = req.params.term;
  const queryString = `SELECT * FROM etudiants WHERE nom LIKE '%${searchTerm}%' OR prenom LIKE '%${searchTerm}%'`;
  db.query(queryString, (err, rows) => {
    if (err) {
      console.error('Error searching for students: ', err);
      res.status(500).json({ error: 'An error occurred while searching for students' });
    } else {
      res.status(200).json(rows);
    }
  });
});


// PUT - Mettre à jour un étudiant
app.put('/students/:id', (req, res) => {
  const id = req.params.id;
  const newData = req.body;
  db.query('UPDATE etudiants SET ? WHERE id = ?', [newData, id], (err, result) => {
    if (err) {
      console.error('Error updating student: ', err);
      res.status(500).json({ error: 'An error occurred while updating student' });
    } else {
      if (result.affectedRows > 0) {
        res.status(200).json({ message: 'Student updated successfully' });
      } else {
        res.status(404).json({ error: 'Student not found' });
      }
    }
  });
});

// DELETE - Supprimer un étudiant
app.delete('/students/:id', (req, res) => {
  const id = req.params.id;
  db.query('DELETE FROM etudiants WHERE id = ?', id, (err, result) => {
    if (err) {
      console.error('Error deleting student: ', err);
      res.status(500).json({ error: 'An error occurred while deleting student' });
    } else {
      if (result.affectedRows > 0) {
        res.status(200).json({ message: 'Student deleted successfully' });
      } else {
        res.status(404).json({ error: 'Student not found' });
      }
    }
  });
});

// Démarrer le serveur
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

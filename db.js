const mysql = require('mysql');
require('dotenv').config();

const db = mysql.createConnection({
  host: process.env.MYSQL_HOST || 'localhost', // Utilise MYSQL_HOST s'il est défini dans .env, sinon utilise 'mysql-service'
  user: process.env.MYSQL_USER || 'root', // Utilise MYSQL_USER s'il est défini dans .env, sinon utilise 'root'
  password: process.env.MYSQL_PASSWORD || '0000', // Utilise MYSQL_PASSWORD s'il est défini dans .env, sinon utilise '0000'
  database: process.env.MYSQL_DATABASE || 'formation_management', // Utilise MYSQL_DATABASE s'il est défini dans .env, sinon utilise 'formation_management'
 
});

db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à la base de données : ', err);
    return;
  }
  console.log('Connecté à la base de données MySQL');
});

module.exports = db;

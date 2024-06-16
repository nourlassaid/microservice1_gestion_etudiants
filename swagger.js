const swaggerJsdoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'API pour la gestion des étudiants',
      description: 'API permettant de gérer les opérations CRUD sur les étudiants',
      version: '1.0.0',
    },
    servers: [
      {
        url: 'http://localhost:4000',
      },
    ],
  },
  apis: ['./app.js'],
};

const swaggerSpec = swaggerJsdoc(options);

module.exports = { swaggerSpec, swaggerUi };

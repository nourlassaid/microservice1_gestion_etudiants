const request = require('supertest');
const app = require('../app');
const faker = require('faker');

describe('Student Routes', () => {
  it('should create a new student', async () => {
    const studentData = {
      nom: faker.name.lastName(),
      prenom: faker.name.firstName(),
      cin: faker.datatype.string({ length: 10, numeric: true }),
      groupe: 'Gb',
      mot_de_passe: faker.internet.password(),
      email: faker.internet.email(),
      groupeSpecialite: 'informatique',
      sexe: faker.random.arrayElement(['M', 'F', 'O']),
      telephone: faker.phone.phoneNumber(),
      niveaux: 'licence',
      date_inscription: '2024-05-24',
      departement: 'informatique',
      etat: 'en attente'
    };

    const res = await request(app)
      .post('/etudiants')
      .send(studentData);

    expect(res.statusCode).toEqual(201);
    expect(res.body.message).toEqual('Student added successfully');

    // Optional: Implement cleanup logic here
  });

  it('should get all students', async () => {
    const res = await request(app).get('/etudiants');
    expect(res.statusCode).toEqual(200);
    // Add more assertions to verify the response body
  });
});

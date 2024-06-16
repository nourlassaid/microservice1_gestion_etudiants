const { Builder, By, until } = require('selenium-webdriver');
const chrome = require('selenium-webdriver/chrome');

// Configuration du timeout
jest.setTimeout(30000); // Augmenter le timeout par défaut pour Jest

// Instance du driver
let driver;

// Avant chaque test, instancier le driver
beforeAll(async () => {
  driver = await new Builder().forBrowser('chrome').build();
});

// Après chaque test, fermer le driver
afterAll(async () => {
  await driver.quit();
});

// Test pour vérifier la page d'accueil
test('should navigate to home page and verify title', async () => {
  // Navigation vers la page d'accueil
  await driver.get('http://localhost:4000/');

  // Vérification du titre de la page
  let title = await driver.getTitle();
  expect(title).toBe('Expected Title'); // Remplacez par le titre attendu
});

// Test pour vérifier la connexion avec des identifiants valides
test('should log in with valid credentials', async () => {
  // Navigation vers la page de connexion
  await driver.get('http://localhost:4000/login');

  // Remplissage des champs de connexion
  await driver.findElement(By.name('username')).sendKeys('testUser');
  await driver.findElement(By.name('password')).sendKeys('testPassword');

  // Clic sur le bouton de connexion
  await driver.findElement(By.id('loginButton')).click();

  // Attente de redirection vers le tableau de bord
  await driver.wait(until.urlContains('dashboard'), 10000);

  // Vérification de l'URL après la connexion
  let url = await driver.getCurrentUrl();
  expect(url).toContain('dashboard');
});

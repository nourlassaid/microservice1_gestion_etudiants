



-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 22 mai 2024 à 11:07
-- Version du serveur : 8.0.36
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Base de données : `formation_management`
--

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `role`) VALUES
(1, 'Directeur Othmen', 'Directeur'),
(2, 'Responsable Soufienne', 'Responsable'),
(3, 'Etudiant Ahmed', 'Etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `groupeSpecialite` varchar(255) DEFAULT NULL,
  `sexe` varchar(10) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `niveaux` varchar(255) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `etat` enum('en attente','accepté','refusé') DEFAULT 'en attente',
  `classe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `nom`, `prenom`, `groupe`, `cin`, `mot_de_passe`, `email`, `groupeSpecialite`, `sexe`, `telephone`, `niveaux`, `date_inscription`, `departement`, `etat`, `classe`) VALUES
(139, 'Jane', 'Doe', NULL, NULL, 'password', 'jane.doe@example.com', NULL, NULL, '123456789', '1', NULL, 'Informatique', 'en attente', NULL),
(140, 'Doe', 'John', NULL, 'unique-cin-by795iwxt', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(141, 'Doe', 'John', NULL, 'unique-cin-wir75k41z', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(142, 'v', 'c', NULL, 'unique-cin-d4musfccv', '0000', '09720775', NULL, NULL, 'c', 'c', NULL, 'c', 'en attente', NULL),
(143, 'Doe', 'John', NULL, 'unique-cin-ovz9vo51t', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(144, 'Doe', 'John', NULL, 'unique-cin-6jru81436', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(145, 'Doe', 'John', NULL, 'unique-cin-vsg4wgzcm', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(146, 'Doe', 'John', NULL, 'unique-cin-xu42xk1fv', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', NULL, NULL, 'CS', 'en attente', NULL),
(147, 'Doe', 'John', NULL, 'unique-cin-mf6cnxlki', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(148, 'Doe', 'John', NULL, 'unique-cin-pstgzo0rc', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', NULL, NULL, 'CS', 'en attente', NULL),
(149, 'Doe', 'John', NULL, 'unique-cin-4cahj4x5w', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', NULL, NULL, 'CS', 'en attente', NULL),
(150, 'Doe', 'John', NULL, 'unique-cin-8o7456wom', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', 'Undergraduate', NULL, 'CS', 'en attente', NULL),
(151, 'Doe', 'John', NULL, 'unique-cin-42l8945dp', 'password123', 'john.doe@example.com', NULL, NULL, '1234567890', NULL, NULL, 'CS', 'en attente', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `date`, `time`, `location`, `category`) VALUES
(2, 'hac', 'Description de l\'événement', '2024-05-15', '18:00:00', 'Lieu de l\'événement', 'Catégorie de l\'événement'),
(3, 'Titre de l\'événement', 'Description de l\'événement', '2024-05-15', '18:00:00', 'Lieu de l\'événement', 'Catégorie de l\'événement'),
(5, 'd', 's', '2024-05-16', NULL, 's', 's'),
(6, 'ttt', 'ttt', '2024-05-30', '12:00:00', 'tozeur', 'hac'),
(7, 'ttt', 'ttt', '2024-05-30', '12:00:00', 'tozeur', 'hac'),
(8, 'ttt', 'ss', '2024-05-05', NULL, 'tozeur', 'hac'),
(9, 'ttt', 'ss', '2024-05-05', NULL, 'tozeur', 'hac'),
(10, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(11, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(12, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(13, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(14, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(15, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(16, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(17, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(18, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(19, 'ttt', 'qq', '2024-05-04', NULL, 'tozeur', 'hac'),
(20, 'ttt', 'x', '2024-05-25', NULL, 'tozeur', 'hac'),
(21, 'ttt', 'tyy', '2024-05-30', '12:05:00', 'tozeur', 'ô'),
(22, 'ttt', 'tyy', '2024-05-30', '12:05:00', 'tozeur', 'ô'),
(23, 'ttt', 'tyy', '2024-05-30', '12:05:00', 'tozeur', 'ô'),
(24, 'ttt', 'tyy', '2024-05-30', '12:05:00', 'tozeur', 'ô'),
(25, 'ttt', 'ggg', '2024-06-04', NULL, 'tozeur', 'ô'),
(26, 'ttt', 'ggg', '2024-06-04', NULL, 'tozeur', 'ô'),
(27, 'ttt', 'ggg', '2024-06-04', NULL, 'tozeur', 'ô'),
(28, 'ttt', 'fff', '2024-06-07', NULL, 'tozeur', 'ô'),
(29, 'ttt', 'lll', '2024-05-02', '14:01:00', 'tozeur', 'p'),
(30, 'ttt', 'lll', '2024-05-02', '14:01:00', 'tozeur', 'p'),
(31, 'ttt', 'lll', '2024-05-02', '14:01:00', 'tozeur', 'p'),
(32, 'ttt', 'lll', '2024-05-02', '14:01:00', 'tozeur', 'p'),
(33, 'ttt', 'lll', '2024-05-02', '14:01:00', 'tozeur', 'p'),
(34, 'ttt', 'dd', '2024-06-09', NULL, 'i', 'i'),
(35, 'mmm', 'i', '2024-05-03', NULL, 'i', 'i'),
(36, 'mmm', 'i', '2024-05-03', NULL, 'i', 'i'),
(37, 'mmm', 'i', '2024-05-03', NULL, 'i', 'i'),
(38, 'w', 'ww', '2024-06-01', NULL, 'o', 'i'),
(40, 'evenement 1', 'Description de l\'événement', '2024-05-20', '10:00:00', 'iset', 'Catégorie de l\'événement');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `capacite_max` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id`, `nom`, `description`, `date_debut`, `date_fin`, `lieu`) VALUES
(9, 'Formation 4', 'Description de la formation 4', '2024-06-01', '2024-06-15', '4C ISET Tozeur'),
(10, 'Formation 5', 'Description de la formation 5', '2024-07-01', '2024-07-15', '4C ISET Tozeur'),
(11, 'Formation 1', 'Description de la formation 1', '2024-03-01', '2024-03-15', '4C ISET Tozeur'),
(12, 'Formation 2', 'Description de la formation 2', '2024-04-01', '2024-04-15', '4C ISET Tozeur'),
(13, 'Formation 3', 'Description de la formation 3', '2024-05-01', '2024-05-15', '4C ISET Tozeur'),
(14, 'Formation 4', 'Description de la formation 4', '2024-06-01', '2024-06-15', '4C ISET Tozeur'),
(15, 'Formation 5', 'Description de la formation 5', '2024-07-01', '2024-07-15', '4C ISET Tozeur'),
(18, 'Formation 1', 'Description de la formation 1', '2024-03-01', '2024-03-15', '4C ISET Tozeur'),
(19, 'Formation 2', 'Description de la formation 2', '2024-04-01', '2024-04-15', '4C ISET Tozeur'),
(20, 'Formation 3', 'Description de la formation 3', '2024-05-01', '2024-05-15', '4C ISET Tozeur'),
(21, 'Formation 4', 'Description de la formation 4', '2024-06-01', '2024-06-15', '4C ISET Tozeur'),
(22, 'Formation 5', 'Description de la formation 5', '2024-07-01', '2024-07-15', '4C ISET Tozeur'),
(23, 'Formation 1', 'Description de la formation 1', '2024-03-01', '2024-03-15', '4C ISET Tozeur'),
(24, 'Formation 2', 'Description de la formation 2', '2024-04-01', '2024-04-15', '4C ISET Tozeur'),
(25, 'Formation 3', 'Description de la formation 3', '2024-05-01', '2024-05-15', '4C ISET Tozeur'),
(26, 'Formation 4', 'Description de la formation 4', '2024-06-01', '2024-06-15', '4C ISET Tozeur'),
(28, 'Formation 1', 'Description de la formation 1', '2024-03-01', '2024-03-15', '4C ISET Tozeur'),
(35, 'Formation en développement web', 'Formation complète sur les technologies web modernes', '2024-05-01', '2024-06-30', 'En ligne'),
(38, 'react', 'formation 1', '2024-04-03', '2024-04-19', 'tozeur'),
(39, 'scrum', NULL, '2024-04-19', '2024-05-11', 'tozeur'),
(40, 'scrum2', 'formation 1', NULL, NULL, 'tozeur'),
(42, 'cisco3', 'dd', '2024-05-29', '2024-06-09', 'tozeur'),
(43, 'New Formation', 'Description', '2024-01-01', '2024-01-31', 'Paris'),
(44, NULL, 'Description de l\'événement', NULL, NULL, NULL),
(45, NULL, 'Description de l\'événement', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

CREATE TABLE `inscriptions` (
  `id` int NOT NULL,
  `formation_id` int DEFAULT NULL,
  `etudiant_id` int DEFAULT NULL,
  `participation` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `responsible_person_id` int NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participations`
--

CREATE TABLE `participations` (
  `id` int NOT NULL,
  `idFormation` int DEFAULT NULL,
  `idEtudiant` int DEFAULT NULL,
  `date_participation` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `responsible_persons`
--

CREATE TABLE `responsible_persons` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `responsible_persons`
--

INSERT INTO `responsible_persons` (`id`, `name`, `email`, `phone`, `photo_url`) VALUES
(1, 'John Doe', 'john@example.com', '1234567890', NULL),
(2, 'Jane Smith', 'jane@example.com', '0987654321', NULL),
(3, 'Directeur Othmen', 'othmen@example.com', '123-456-7890', 'path/to/othmen.jpg'),
(4, 'Responsable Soufienne', 'soufienne@example.com', '098-765-4321', 'path/to/soufienne.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `statistiques`
--

CREATE TABLE `statistiques` (
  `id` int NOT NULL,
  `nom_formation` varchar(255) NOT NULL,
  `nombre_inscriptions` int NOT NULL,
  `taux_participation` float DEFAULT NULL,
  `date_statistique` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `statistiques`
--

INSERT INTO `statistiques` (`id`, `nom_formation`, `nombre_inscriptions`, `taux_participation`, `date_statistique`) VALUES
(1, 'Formation A', 50, 0.8, '2024-04-15'),
(2, 'Formation A', 50, 0.8, '2024-04-15'),
(3, 'Formation A', 50, 0.8, '2024-04-15'),
(4, 'Formation B', 60, 0.7, '2024-04-16'),
(5, 'Formation C', 70, 0.9, '2024-04-17');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `cin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `cin`, `password`) VALUES
(1, '09720775', '09720775');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int NOT NULL,
  `cin` varchar(20) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `cin`, `mot_de_passe`, `nom`, `prenom`, `email`, `date_inscription`) VALUES
(1, '09720775', '0000', 'nour', 'lassaid', 'nourlassaid505@gmail.com', '2024-03-12 21:25:16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cin` (`cin`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formation_id` (`formation_id`),
  ADD KEY `etudiant_id` (`etudiant_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `responsible_person_id` (`responsible_person_id`);

--
-- Index pour la table `participations`
--
ALTER TABLE `participations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFormation` (`idFormation`),
  ADD KEY `idEtudiant` (`idEtudiant`);

--
-- Index pour la table `responsible_persons`
--
ALTER TABLE `responsible_persons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statistiques`
--
ALTER TABLE `statistiques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cin` (`cin`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participations`
--
ALTER TABLE `participations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responsible_persons`
--
ALTER TABLE `responsible_persons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `statistiques`
--
ALTER TABLE `statistiques`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `inscriptions_ibfk_1` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `inscriptions_ibfk_2` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`responsible_person_id`) REFERENCES `responsible_persons` (`id`);

--
-- Contraintes pour la table `participations`
--
ALTER TABLE `participations`
  ADD CONSTRAINT `participations_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `participations_ibfk_2` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

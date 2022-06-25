-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 25 juin 2022 à 07:32
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jarvis`
--

-- --------------------------------------------------------

--
-- Structure de la table `appareils`
--

DROP TABLE IF EXISTS `appareils`;
CREATE TABLE IF NOT EXISTS `appareils` (
  `id_appareil` int(11) NOT NULL AUTO_INCREMENT,
  `nom_appareil` varchar(45) DEFAULT NULL,
  `type_appareil` varchar(45) DEFAULT NULL,
  `Piece_id_piece` int(11) NOT NULL,
  PRIMARY KEY (`id_appareil`),
  KEY `fk_Appareils_Piece1_idx` (`Piece_id_piece`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `appareils`
--

INSERT INTO `appareils` (`id_appareil`, `nom_appareil`, `type_appareil`, `Piece_id_piece`) VALUES
(1, 'MEIZU', 'TELEPHONE', 1),
(2, 'TECNO', 'ECOUTER', 1),
(3, 'SAMSUNG', 'TV', 2),
(4, 'ASUS', 'LAPTOP', 3),
(5, 'AQUOS', 'TELEPHONE', 5);

-- --------------------------------------------------------

--
-- Structure de la table `co-proprietaire`
--

DROP TABLE IF EXISTS `co-proprietaire`;
CREATE TABLE IF NOT EXISTS `co-proprietaire` (
  `id_co-pro` int(11) NOT NULL AUTO_INCREMENT,
  `Utilisateur_id_u` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_co-pro`),
  KEY `fk_Co-proprietaire_Utilisateur1_idx` (`Utilisateur_id_u`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `co-proprietaire`
--

INSERT INTO `co-proprietaire` (`id_co-pro`, `Utilisateur_id_u`) VALUES
(3, 12),
(4, 14);

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
CREATE TABLE IF NOT EXISTS `contenir` (
  `Domicile_id_domicile` int(11) NOT NULL,
  `Utilisateur_id_u` int(11) NOT NULL,
  PRIMARY KEY (`Domicile_id_domicile`,`Utilisateur_id_u`),
  KEY `fk_Domicile_has_Utilisateur_Utilisateur1_idx` (`Utilisateur_id_u`),
  KEY `fk_Domicile_has_Utilisateur_Domicile1_idx` (`Domicile_id_domicile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`Domicile_id_domicile`, `Utilisateur_id_u`) VALUES
(1, 12),
(1, 13),
(2, 14),
(3, 15),
(3, 16);

-- --------------------------------------------------------

--
-- Structure de la table `domicile`
--

DROP TABLE IF EXISTS `domicile`;
CREATE TABLE IF NOT EXISTS `domicile` (
  `id_domicile` int(11) NOT NULL AUTO_INCREMENT,
  `annee_construction` date DEFAULT NULL,
  `superficie` float DEFAULT NULL,
  `Proprietaire_id_pro` int(11) NOT NULL,
  PRIMARY KEY (`id_domicile`),
  KEY `fk_Domicile_Proprietaire1_idx` (`Proprietaire_id_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `domicile`
--

INSERT INTO `domicile` (`id_domicile`, `annee_construction`, `superficie`, `Proprietaire_id_pro`) VALUES
(1, '2001-01-03', 456.2, 1),
(2, '1985-05-16', 865, 2),
(3, '2018-11-24', 563, 3);

-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

DROP TABLE IF EXISTS `inviter`;
CREATE TABLE IF NOT EXISTS `inviter` (
  `Proprietaire_id_pro` int(11) NOT NULL,
  `Utilisateur_id_u` int(11) NOT NULL,
  PRIMARY KEY (`Proprietaire_id_pro`,`Utilisateur_id_u`),
  KEY `fk_Proprietaire_has_Utilisateur_Utilisateur1_idx` (`Utilisateur_id_u`),
  KEY `fk_Proprietaire_has_Utilisateur_Proprietaire1_idx` (`Proprietaire_id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id_m` int(11) NOT NULL AUTO_INCREMENT,
  `Utilisateur_id_u` int(11) DEFAULT NULL,
  `lien_parente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_m`),
  KEY `fk_Membre_Utilisateur_idx` (`Utilisateur_id_u`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_m`, `Utilisateur_id_u`, `lien_parente`) VALUES
(7, 13, NULL),
(8, 15, NULL),
(9, 16, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

DROP TABLE IF EXISTS `piece`;
CREATE TABLE IF NOT EXISTS `piece` (
  `id_piece` int(11) NOT NULL AUTO_INCREMENT,
  `nom_piece` varchar(45) DEFAULT NULL,
  `Domicile_id_domicile` int(11) NOT NULL,
  PRIMARY KEY (`id_piece`),
  KEY `fk_Piece_Domicile1_idx` (`Domicile_id_domicile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `piece`
--

INSERT INTO `piece` (`id_piece`, `nom_piece`, `Domicile_id_domicile`) VALUES
(1, 'SALON', 1),
(2, 'CHAMBRE MANGE', 1),
(3, 'BED ROOM', 2),
(4, 'BATH ROOM', 2),
(5, 'SIMPLE', 3);

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

DROP TABLE IF EXISTS `proprietaire`;
CREATE TABLE IF NOT EXISTS `proprietaire` (
  `id_pro` int(11) NOT NULL AUTO_INCREMENT,
  `Utilisateur_id_u` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pro`),
  KEY `fk_Proprietaire_Utilisateur1_idx` (`Utilisateur_id_u`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `proprietaire`
--

INSERT INTO `proprietaire` (`id_pro`, `Utilisateur_id_u`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `synthetiser_co-proprietaire`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `synthetiser_co-proprietaire`;
CREATE TABLE IF NOT EXISTS `synthetiser_co-proprietaire` (
`id_co-pro` int(11)
,`Utilisateur_id_u` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `synthetiser_membre`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `synthetiser_membre`;
CREATE TABLE IF NOT EXISTS `synthetiser_membre` (
`id_m` int(11)
,`Utilisateur_id_u` int(11)
,`lien_parente` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `synthetiser_proprietaire`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `synthetiser_proprietaire`;
CREATE TABLE IF NOT EXISTS `synthetiser_proprietaire` (
`id_pro` int(11)
,`Utilisateur_id_u` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `synthetiser_utilisateur`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `synthetiser_utilisateur`;
CREATE TABLE IF NOT EXISTS `synthetiser_utilisateur` (
`id_u` int(11)
,`prenom_u` varchar(255)
,`nom_u` varchar(45)
,`date_de_naissance` date
,`email_u` varchar(255)
,`sexe_u` varchar(1)
,`mdp_u` varchar(255)
,`lien_parente` int(11)
,`heure_invitation` date
);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_u` int(11) NOT NULL AUTO_INCREMENT,
  `prenom_u` varchar(255) DEFAULT NULL,
  `nom_u` varchar(45) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `email_u` varchar(255) DEFAULT NULL,
  `sexe_u` varchar(1) DEFAULT NULL,
  `mdp_u` varchar(255) DEFAULT NULL,
  `lien_parente` int(11) DEFAULT NULL,
  `heure_invitation` date DEFAULT NULL,
  PRIMARY KEY (`id_u`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_u`, `prenom_u`, `nom_u`, `date_de_naissance`, `email_u`, `sexe_u`, `mdp_u`, `lien_parente`, `heure_invitation`) VALUES
(1, 'Mike', 'PETER', '1998-07-16', 'mike@gmail.fr', 'H', '4562', NULL, NULL),
(2, 'Victorino', 'RAMAMINIRINA', '2001-07-21', 'victorino@gmail.com', 'H', '2001', NULL, NULL),
(3, 'Thonny', 'RANDRIANASOLO', '2001-05-15', 'thonny@gmail.com', 'H', '21052105', NULL, NULL),
(12, 'Bruno', 'MARC', '2016-05-13', 'bruno@gmail.fr', 'H', '45445', 1, NULL),
(13, 'Lali', 'RAMAMBASOA', '1998-05-12', 'lali@gmail.com', 'F', '4523', 0, NULL),
(14, 'Alphonsia', 'ALBUNETTE', '2000-06-17', 'alphonsia@gmail.com', 'F', '5865', 1, NULL),
(15, 'Melinah', 'RAKOTOMALALA', '2003-12-18', 'melinah@gmail.com', 'F', 'f45d6', 0, NULL),
(16, 'Juvance', 'RAHARINIRINA', '2002-05-06', 'juvance@gmail.com', 'H', '45226', 0, NULL);

--
-- Déclencheurs `utilisateur`
--
DROP TRIGGER IF EXISTS `add_after_insert_utilisateur`;
DELIMITER $$
CREATE TRIGGER `add_after_insert_utilisateur` AFTER INSERT ON `utilisateur` FOR EACH ROW BEGIN
IF(new.lien_parente=0) THEN INSERT INTO `membre`(Utilisateur_id_u) values (new.id_u);
ELSEIF(new.lien_parente=1) THEN INSERT INTO `co-proprietaire`(Utilisateur_id_u) values (new.id_u);
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la vue `synthetiser_co-proprietaire`
--
DROP TABLE IF EXISTS `synthetiser_co-proprietaire`;

DROP VIEW IF EXISTS `synthetiser_co-proprietaire`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `synthetiser_co-proprietaire`  AS SELECT `co-proprietaire`.`id_co-pro` AS `id_co-pro`, `co-proprietaire`.`Utilisateur_id_u` AS `Utilisateur_id_u` FROM `co-proprietaire` ;

-- --------------------------------------------------------

--
-- Structure de la vue `synthetiser_membre`
--
DROP TABLE IF EXISTS `synthetiser_membre`;

DROP VIEW IF EXISTS `synthetiser_membre`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `synthetiser_membre`  AS SELECT `membre`.`id_m` AS `id_m`, `membre`.`Utilisateur_id_u` AS `Utilisateur_id_u`, `membre`.`lien_parente` AS `lien_parente` FROM `membre` ;

-- --------------------------------------------------------

--
-- Structure de la vue `synthetiser_proprietaire`
--
DROP TABLE IF EXISTS `synthetiser_proprietaire`;

DROP VIEW IF EXISTS `synthetiser_proprietaire`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `synthetiser_proprietaire`  AS SELECT `proprietaire`.`id_pro` AS `id_pro`, `proprietaire`.`Utilisateur_id_u` AS `Utilisateur_id_u` FROM `proprietaire` ;

-- --------------------------------------------------------

--
-- Structure de la vue `synthetiser_utilisateur`
--
DROP TABLE IF EXISTS `synthetiser_utilisateur`;

DROP VIEW IF EXISTS `synthetiser_utilisateur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `synthetiser_utilisateur`  AS SELECT `utilisateur`.`id_u` AS `id_u`, `utilisateur`.`prenom_u` AS `prenom_u`, `utilisateur`.`nom_u` AS `nom_u`, `utilisateur`.`date_de_naissance` AS `date_de_naissance`, `utilisateur`.`email_u` AS `email_u`, `utilisateur`.`sexe_u` AS `sexe_u`, `utilisateur`.`mdp_u` AS `mdp_u`, `utilisateur`.`lien_parente` AS `lien_parente`, `utilisateur`.`heure_invitation` AS `heure_invitation` FROM `utilisateur` ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appareils`
--
ALTER TABLE `appareils`
  ADD CONSTRAINT `fk_Appareils_Piece1` FOREIGN KEY (`Piece_id_piece`) REFERENCES `piece` (`id_piece`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `co-proprietaire`
--
ALTER TABLE `co-proprietaire`
  ADD CONSTRAINT `fk_Co-proprietaire_Utilisateur1` FOREIGN KEY (`Utilisateur_id_u`) REFERENCES `utilisateur` (`id_u`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `fk_Domicile_has_Utilisateur_Domicile1` FOREIGN KEY (`Domicile_id_domicile`) REFERENCES `domicile` (`id_domicile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Domicile_has_Utilisateur_Utilisateur1` FOREIGN KEY (`Utilisateur_id_u`) REFERENCES `utilisateur` (`id_u`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `domicile`
--
ALTER TABLE `domicile`
  ADD CONSTRAINT `fk_Domicile_Proprietaire1` FOREIGN KEY (`Proprietaire_id_pro`) REFERENCES `proprietaire` (`id_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD CONSTRAINT `fk_Proprietaire_has_Utilisateur_Proprietaire1` FOREIGN KEY (`Proprietaire_id_pro`) REFERENCES `proprietaire` (`id_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proprietaire_has_Utilisateur_Utilisateur1` FOREIGN KEY (`Utilisateur_id_u`) REFERENCES `utilisateur` (`id_u`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `fk_Membre_Utilisateur` FOREIGN KEY (`Utilisateur_id_u`) REFERENCES `utilisateur` (`id_u`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `piece`
--
ALTER TABLE `piece`
  ADD CONSTRAINT `fk_Piece_Domicile1` FOREIGN KEY (`Domicile_id_domicile`) REFERENCES `domicile` (`id_domicile`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD CONSTRAINT `fk_Proprietaire_Utilisateur1` FOREIGN KEY (`Utilisateur_id_u`) REFERENCES `utilisateur` (`id_u`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

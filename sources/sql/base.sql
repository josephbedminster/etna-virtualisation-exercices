-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 11 Juin 2017 à 19:40
-- Version du serveur :  5.5.55-0+deb8u1
-- Version de PHP :  7.1.5-1+0~20170522123046.25+jessie~1.gbpb8686b

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `etna`
--

-- --------------------------------------------------------

--
-- Structure de la table `LINK_USER_UE`
--

CREATE TABLE `LINK_USER_UE` (
  `ID_UE` int(1) NOT NULL,
  `ID_USER` int(1) NOT NULL,
  `RUN` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `LINK_USER_UE`
--

-- --------------------------------------------------------

--
-- Structure de la table `T_EXERCICE`
--

CREATE TABLE `T_EXERCICE` (
  `ID_EXERCICE` int(11) NOT NULL,
  `NOM` varchar(255) NOT NULL,
  `CONTAINER_PATH` varchar(1000) NOT NULL,
  `CONTAINER_IMG` varchar(255) NOT NULL,
  `ID_UE` int(1) NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `DISABLE` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `T_EXERCICE`
--

INSERT INTO `T_EXERCICE` (`ID_EXERCICE`, `NOM`, `CONTAINER_PATH`, `CONTAINER_IMG`, `ID_UE`, `DESCRIPTION`, `DISABLE`) VALUES
(1, 'Docker Newbie', 'exercice1', '', 2, 'Instancier un Docker', 0),
(2, 'Docker Pro', 'exercice2', '', 1, 'Code Camp Virtuel', 0);

-- --------------------------------------------------------

--
-- Structure de la table `T_ROLE`
--

CREATE TABLE `T_ROLE` (
  `ID_ROLE` int(11) NOT NULL,
  `NOM` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `T_ROLE`
--

INSERT INTO `T_ROLE` (`ID_ROLE`, `NOM`) VALUES
(0, 'prof'),
(1, 'student');

-- --------------------------------------------------------

--
-- Structure de la table `T_UE`
--

CREATE TABLE `T_UE` (
  `ID_UE` int(11) NOT NULL,
  `NOM` varchar(255) NOT NULL,
  `ID_ACTIVITY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `T_UE`
--

-- --------------------------------------------------------

--
-- Structure de la table `T_USER`
--

CREATE TABLE `T_USER` (
  `ID_USER` int(1) NOT NULL,
  `ROLE` int(1) NOT NULL,
  `LOGIN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `T_USER`
--

INSERT INTO `T_USER` (`ID_USER`, `ROLE`, `LOGIN`) VALUES
(1, 0, 'bedmin_j'),
(2, 0, 'lequer_r');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `LINK_USER_UE`
--
ALTER TABLE `LINK_USER_UE`
  ADD KEY `ID_UE` (`ID_UE`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Index pour la table `T_EXERCICE`
--
ALTER TABLE `T_EXERCICE`
  ADD PRIMARY KEY (`ID_EXERCICE`);

--
-- Index pour la table `T_ROLE`
--
ALTER TABLE `T_ROLE`
  ADD PRIMARY KEY (`ID_ROLE`);

--
-- Index pour la table `T_UE`
--
ALTER TABLE `T_UE`
  ADD PRIMARY KEY (`ID_UE`);

--
-- Index pour la table `T_USER`
--
ALTER TABLE `T_USER`
  ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `T_EXERCICE`
--
ALTER TABLE `T_EXERCICE`
  MODIFY `ID_EXERCICE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT pour la table `T_ROLE`
--
ALTER TABLE `T_ROLE`
  MODIFY `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `T_UE`
--
ALTER TABLE `T_UE`
  MODIFY `ID_UE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT pour la table `T_USER`
--
ALTER TABLE `T_USER`
  MODIFY `ID_USER` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `LINK_USER_UE`
--
ALTER TABLE `LINK_USER_UE`
  ADD CONSTRAINT `FK_UE_USER_1` FOREIGN KEY (`ID_UE`) REFERENCES `T_UE` (`ID_UE`),
  ADD CONSTRAINT `FK_UE_USER_2` FOREIGN KEY (`ID_USER`) REFERENCES `T_USER` (`ID_USER`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

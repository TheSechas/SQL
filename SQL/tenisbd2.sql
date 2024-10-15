-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 23, 2024 at 06:52 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tenisbd`
--

CREATE DATABASE IF NOT EXISTS `tenisbd`;

USE `tenisbd`;

-- --------------------------------------------------------

--
-- Table structure for table `grandslams`
--

DROP TABLE IF EXISTS `grandslams`;
CREATE TABLE IF NOT EXISTS `grandslams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `participantes` int NOT NULL,
  `premio` decimal(10,2) NOT NULL,
  `pista` enum('TIERRA','HIERBA','DURA') NOT NULL,
  `ciudad` varchar(55) NOT NULL,
  `pais` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `grandslams`
--

INSERT INTO `grandslams` (`id`, `nombre`, `participantes`, `premio`, `pista`, `ciudad`, `pais`) VALUES
(1, 'ROLAND GARROS', 256, 42900000.00, 'TIERRA', 'PARIS', 'FRANCIA'),
(2, 'US OPEN', 256, 57462000.00, 'DURA', 'WASHINGTON', 'EEUU'),
(3, 'WIMBLEDON', 128, 52238655.00, 'HIERBA', 'LONDRES', 'REINO UNIDO'),
(4, 'OPEN AUSTRALIA', 128, 76500000.00, 'DURA', 'MELBOURNE', 'AUSTRALIA');

-- --------------------------------------------------------

--
-- Table structure for table `participaciones`
--

DROP TABLE IF EXISTS `participaciones`;
CREATE TABLE IF NOT EXISTS `participaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idTenista` int NOT NULL,
  `idGrandSlam` int NOT NULL,
  `edicion` int NOT NULL,
  `campeon` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `participacionesTOtenistas` (`idTenista`),
  KEY `participacionesTOgrandslams` (`idGrandSlam`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `participaciones`
--

INSERT INTO `participaciones` (`id`, `idTenista`, `idGrandSlam`, `edicion`, `campeon`) VALUES
(1, 1, 1, 2018, 1),
(2, 1, 1, 2019, 1),
(3, 1, 1, 2020, 1),
(4, 1, 1, 2022, 1),
(5, 1, 2, 2017, 1),
(6, 1, 2, 2019, 1),
(7, 1, 1, 2021, 0),
(8, 1, 2, 2018, 0),
(9, 1, 2, 2021, 0),
(10, 1, 2, 2020, 0),
(11, 1, 3, 2017, 0),
(12, 1, 3, 2018, 0),
(13, 1, 3, 2018, 0),
(14, 1, 3, 2019, 0),
(15, 1, 3, 2020, 0),
(16, 1, 3, 2021, 0),
(17, 1, 3, 2022, 0),
(18, 1, 4, 2017, 0),
(19, 1, 4, 2018, 0),
(20, 1, 4, 2019, 0),
(21, 1, 4, 2020, 0),
(22, 1, 4, 2021, 0),
(23, 1, 4, 2022, 0),
(24, 2, 2, 2022, 1),
(25, 2, 1, 2022, 0),
(26, 2, 3, 2022, 0),
(27, 2, 4, 2022, 0),
(28, 1, 1, 2017, 1),
(29, 3, 1, 2017, 0),
(30, 3, 1, 2018, 0),
(31, 3, 1, 2019, 0),
(32, 3, 1, 2020, 0),
(33, 3, 1, 2021, 0),
(34, 3, 2, 2017, 0),
(35, 3, 2, 2018, 0),
(36, 3, 2, 2019, 0),
(37, 3, 2, 2020, 0),
(38, 3, 2, 2021, 0),
(39, 3, 3, 2017, 1),
(40, 3, 3, 2018, 0),
(41, 3, 3, 2019, 0),
(42, 3, 3, 2020, 0),
(43, 3, 3, 2021, 0),
(44, 3, 4, 2017, 1),
(45, 3, 4, 2018, 1),
(46, 3, 4, 2019, 0),
(47, 3, 4, 2020, 0),
(48, 3, 4, 2021, 0),
(49, 5, 1, 2017, 0),
(50, 5, 1, 2021, 1),
(51, 5, 1, 2022, 0),
(52, 5, 1, 2020, 0),
(53, 5, 1, 2019, 0),
(54, 5, 1, 2018, 0),
(55, 5, 2, 2018, 1),
(56, 5, 2, 2017, 0),
(57, 5, 2, 2019, 0),
(58, 5, 2, 2020, 0),
(59, 5, 2, 2021, 0),
(60, 5, 2, 2022, 0),
(61, 5, 3, 2018, 1),
(62, 5, 3, 2019, 1),
(63, 5, 3, 2017, 0),
(64, 5, 3, 2020, 0),
(65, 5, 3, 2021, 1),
(66, 5, 3, 2022, 1),
(67, 5, 4, 2017, 0),
(68, 5, 4, 2018, 0),
(69, 5, 4, 2019, 1),
(70, 5, 4, 2020, 1),
(71, 5, 4, 2021, 1),
(72, 5, 4, 2022, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patrocinadores`
--

DROP TABLE IF EXISTS `patrocinadores`;
CREATE TABLE IF NOT EXISTS `patrocinadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `nacionalidad` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patrocinadores`
--

INSERT INTO `patrocinadores` (`id`, `nombre`, `nacionalidad`) VALUES
(1, 'NIKE', 'EEUU'),
(2, 'REEBOK', 'UNITED KINGDOM'),
(3, 'ADIDAS', 'ALEMANIA'),
(4, 'KELME', 'ESPAÑA');

-- --------------------------------------------------------

--
-- Table structure for table `tenistas`
--

DROP TABLE IF EXISTS `tenistas`;
CREATE TABLE IF NOT EXISTS `tenistas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `apellido1` varchar(55) NOT NULL,
  `apellido2` varchar(55) DEFAULT NULL,
  `mano` enum('ZURDO','DIESTRO') NOT NULL,
  `activo` tinyint NOT NULL,
  `idPatrocinador` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TenistasTOPatrocinadoresFK` (`idPatrocinador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tenistas`
--

INSERT INTO `tenistas` (`id`, `nombre`, `apellido1`, `apellido2`, `mano`, `activo`, `idPatrocinador`) VALUES
(1, 'RAFAEL', 'NADAL', 'PARERA', 'ZURDO', 0, 4),
(2, 'CARLOS', 'ALCARAZ', 'GARFIA', 'DIESTRO', 1, 1),
(3, 'ROGER', 'FEDERER', '', 'DIESTRO', 0, 1),
(4, 'JOE', 'MCENROE', '', 'DIESTRO', 0, 2),
(5, 'NOVAK', 'DJOKOVIC', '', 'DIESTRO', 1, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participaciones`
--
ALTER TABLE `participaciones`
  ADD CONSTRAINT `participacionesTOgrandslams` FOREIGN KEY (`idGrandSlam`) REFERENCES `grandslams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `participacionesTOtenistas` FOREIGN KEY (`idTenista`) REFERENCES `tenistas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tenistas`
--
ALTER TABLE `tenistas`
  ADD CONSTRAINT `TenistasTOPatrocinadoresFK` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinadores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

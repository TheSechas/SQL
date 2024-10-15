-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 02, 2024 at 09:21 AM
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
-- Database: `programario`
--

CREATE DATABASE IF NOT EXISTS programario;

USE programario;

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `dni` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`dni`, `nombre`, `edad`) VALUES
(1, 'Pepe Pérez', 45),
(2, 'Juan González', 45),
(3, 'María Gómez', 33),
(4, 'Javier Casado', 18),
(5, 'Nuria Sánchez', 29),
(6, 'Antonio Navarro', 58);

-- --------------------------------------------------------

--
-- Table structure for table `comercio`
--

DROP TABLE IF EXISTS `comercio`;
CREATE TABLE IF NOT EXISTS `comercio` (
  `cif` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ciudad` int NOT NULL,
  PRIMARY KEY (`cif`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comercio`
--

INSERT INTO `comercio` (`cif`, `nombre`, `ciudad`) VALUES
(1, 'El Corte Inglés', 0),
(2, 'El Corte Inglés', 0),
(3, 'Jump', 0),
(4, 'Centro Mail', 0),
(5, 'FNAC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `desarrolla`
--

DROP TABLE IF EXISTS `desarrolla`;
CREATE TABLE IF NOT EXISTS `desarrolla` (
  `id_fab` int NOT NULL,
  `codigo` int NOT NULL,
  KEY `id_fab` (`id_fab`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `desarrolla`
--

INSERT INTO `desarrolla` (`id_fab`, `codigo`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(6, 13),
(4, 14),
(5, 15),
(5, 16),
(3, 17),
(3, 18),
(5, 19),
(4, 20);

-- --------------------------------------------------------

--
-- Table structure for table `distribuye`
--

DROP TABLE IF EXISTS `distribuye`;
CREATE TABLE IF NOT EXISTS `distribuye` (
  `cif` int NOT NULL,
  `codigo` int NOT NULL,
  `cantidad` int NOT NULL,
  KEY `cif` (`cif`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `distribuye`
--

INSERT INTO `distribuye` (`cif`, `codigo`, `cantidad`) VALUES
(1, 1, 10),
(1, 2, 11),
(1, 6, 5),
(1, 7, 3),
(1, 10, 5),
(1, 13, 7),
(2, 1, 6),
(2, 2, 6),
(2, 6, 4),
(2, 7, 7),
(3, 10, 8),
(3, 13, 5),
(4, 14, 3),
(4, 20, 6),
(5, 15, 8),
(5, 16, 2),
(5, 17, 3),
(5, 19, 6),
(5, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `divisiones`
--

DROP TABLE IF EXISTS `divisiones`;
CREATE TABLE IF NOT EXISTS `divisiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `numEquipos` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `divisiones`
--

INSERT INTO `divisiones` (`id`, `nombre`, `numEquipos`) VALUES
(1, 'primera', 20),
(2, 'segunda', 22),
(3, 'segundaB', 64),
(4, 'premier', 20),
(5, 'first', 22),
(6, 'seriaA', 20),
(7, 'serieB', 22);

-- --------------------------------------------------------

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `idDivision` varchar(55) NOT NULL,
  `presupuesto` decimal(11,2) NOT NULL,
  `idGrupoUltra` varchar(55) NOT NULL,
  `idEstadio` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
CREATE TABLE IF NOT EXISTS `fabricante` (
  `id_fab` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `pais` varchar(30) NOT NULL,
  PRIMARY KEY (`id_fab`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fabricante`
--

INSERT INTO `fabricante` (`id_fab`, `nombre`, `pais`) VALUES
(1, 'Oracle', 'Estados Unidos'),
(2, 'Microsoft', 'Estados Unidos'),
(3, 'IBM', 'Estados Unidos'),
(4, 'Dinamic', 'España'),
(5, 'Borland', 'Estados Unidos'),
(6, 'Symantec', 'Estados Unidos');

-- --------------------------------------------------------

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
CREATE TABLE IF NOT EXISTS `programa` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programa`
--

INSERT INTO `programa` (`codigo`, `nombre`, `version`) VALUES
(1, 'Application Server', '9i'),
(2, 'Oracle Database', '8i'),
(3, 'Database', '9i'),
(4, 'Database', '10g'),
(5, 'Developer', '6i'),
(6, 'Access', '97'),
(7, 'Access', '2000'),
(8, 'Access', 'XP'),
(9, 'Windows', '98'),
(10, 'Windows', 'XP Professional'),
(11, 'Windows', 'XP Home Edition'),
(12, 'Windows', '2003 Server'),
(13, 'Norton Internet Security', '2004'),
(14, 'Freddy Hardest', NULL),
(15, 'Paradox', '2'),
(16, 'C++ Builder', '5.5'),
(17, 'DB/2', '2.0'),
(18, 'OS/2', '1.0'),
(19, 'JBuilder', 'X'),
(20, 'La prisión', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `registra`
--

DROP TABLE IF EXISTS `registra`;
CREATE TABLE IF NOT EXISTS `registra` (
  `cif` int NOT NULL,
  `dni` int NOT NULL,
  `codigo` int NOT NULL,
  `medio` varchar(20) NOT NULL,
  KEY `cif` (`cif`),
  KEY `dni` (`dni`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `registra`
--

INSERT INTO `registra` (`cif`, `dni`, `codigo`, `medio`) VALUES
(1, 1, 1, 'Internet'),
(1, 3, 4, 'Tarjeta postal'),
(4, 2, 10, 'Teléfono'),
(4, 1, 10, 'Tarjeta postal'),
(5, 2, 12, 'Internet'),
(2, 4, 15, 'Internet');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `desarrolla`
--
ALTER TABLE `desarrolla`
  ADD CONSTRAINT `desarrollaTOfabricanteFK` FOREIGN KEY (`id_fab`) REFERENCES `fabricante` (`id_fab`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `desarrollaTOprogramaFK` FOREIGN KEY (`codigo`) REFERENCES `programa` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `distribuye`
--
ALTER TABLE `distribuye`
  ADD CONSTRAINT `distribuyeTOcomercioFK` FOREIGN KEY (`cif`) REFERENCES `comercio` (`cif`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `distribuyeTOprogramaFK` FOREIGN KEY (`codigo`) REFERENCES `programa` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `registra`
--
ALTER TABLE `registra`
  ADD CONSTRAINT `registraTOclienteFK` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `registraTOcomercioFK` FOREIGN KEY (`cif`) REFERENCES `comercio` (`cif`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `registraTOprogramaFK` FOREIGN KEY (`codigo`) REFERENCES `programa` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

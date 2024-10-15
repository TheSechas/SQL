-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 25, 2024 at 10:50 PM
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
-- Database: `futbolinternacional`
--

CREATE DATABASE futbolultrasasir;

USE futbolultrasasir;

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

--
-- Dumping data for table `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `idDivision`, `presupuesto`, `idGrupoUltra`, `idEstadio`) VALUES
(1, 'Deportivo de La Coruña', 'segundaB', 100.00, 'riazor blues', 'riazor'),
(2, 'Barcelona', 'primera', 100000000.00, 'boixos nois', 'camp nou'),
(3, 'Milan FC', 'serieA', 50000000.00, 'curva sud', 'san siro'),
(4, 'Inter de Milan', 'serieA', 55000000.00, 'curva nod', 'san siro'),
(5, 'Tottenham', 'premier', 500000000.00, 'yid army', 'wembley'),
(6, 'Bournemouth', 'first', 50000000.00, 'hooligans', 'dean court'),
(7, 'Manchester United', 'premier', 888000000.00, 'the red army', 'old trafford'),
(8, 'Chelsea FC', 'premier', 888000000.00, 'the chelsea headhunters', 'stamford bridge'),
(9, 'Arsenal', 'premier', 700000000.00, 'gooners', 'emirates stadium'),
(10, 'Real Madrid', 'primera', 999000000.00, 'ultrasur', 'santiago bernabeu'),
(11, 'Athletic de Bilbao', 'primera', 80000000.00, 'herri norte', 'estadio de san mames');

-- --------------------------------------------------------

--
-- Table structure for table `estadios`
--

DROP TABLE IF EXISTS `estadios`;
CREATE TABLE IF NOT EXISTS `estadios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `patrocinador` varchar(55) DEFAULT NULL,
  `olimpico` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estadios`
--

INSERT INTO `estadios` (`id`, `nombre`, `patrocinador`, `olimpico`) VALUES
(1, 'Riazor', 'ABANCA', 0),
(2, 'Camp Nou', 'RAKUTEN', 0),
(3, 'Wembley', NULL, 1),
(4, 'San Siro', NULL, 0),
(5, 'Dean Court', NULL, 0),
(6, 'Old Trafford', NULL, 0),
(7, 'Stamford Bridge', NULL, 0),
(8, 'Emirates Stadium', 'EMIRATES STADIUM', 0),
(9, 'Santiago Bernabeu', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `federaciones`
--

DROP TABLE IF EXISTS `federaciones`;
CREATE TABLE IF NOT EXISTS `federaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `pais` varchar(55) DEFAULT NULL,
  `ligas` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `federaciones`
--

INSERT INTO `federaciones` (`id`, `nombre`, `pais`, `ligas`) VALUES
(1, 'Federacion española', 'ESPAÑA', 3),
(2, 'The Football Association', 'INGLATERRA', 2),
(3, 'Federazione Italiana Giuoco Calcio', 'ITALIA', 2),
(4, 'UEFA', '', 0),
(5, 'CONMEBOL', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ligas`
--

DROP TABLE IF EXISTS `ligas`;
CREATE TABLE IF NOT EXISTS `ligas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `pais` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ligas`
--

INSERT INTO `ligas` (`id`, `nombre`, `pais`) VALUES
(1, 'liga BBVA', 'ESPAÑA'),
(2, 'liga Santander', 'ESPAÑA'),
(3, 'liga Federacion', 'ESPAÑA'),
(4, 'premier', 'INGLATERRA'),
(5, 'EFL Championship', 'INGLATERRA'),
(6, 'Serie A TIM', 'ITALIA'),
(7, 'Serie B TIM', 'ITALIA');

-- --------------------------------------------------------

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
CREATE TABLE IF NOT EXISTS `torneos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `numEquipos` int NOT NULL,
  `premio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `torneos`
--

INSERT INTO `torneos` (`id`, `nombre`, `numEquipos`, `premio`) VALUES
(1, 'UEFA ChampionsLeague', 32, 100000000.00),
(2, 'Europa League', 64, 25000000.00),
(3, 'Libertadores', 32, 25000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `ultras`
--

DROP TABLE IF EXISTS `ultras`;
CREATE TABLE IF NOT EXISTS `ultras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreBanda` varchar(55) NOT NULL,
  `violencia` enum('baja','media','alta') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ultras`
--

INSERT INTO `ultras` (`id`, `nombreBanda`, `violencia`) VALUES
(1, 'Riazor Blues', 'media'),
(2, 'Boixos Nois', 'alta'),
(3, 'Yid Army', 'alta'),
(4, 'Curva Sud', 'alta'),
(5, 'Curva Nod', 'alta'),
(6, 'Hooligans', 'alta'),
(7, 'The Red Army', 'alta'),
(8, 'The Chelsea Headhunters', 'alta'),
(9, 'Gooners', 'alta'),
(10, 'Ultrasur', 'alta'),
(11, 'Herri Norte', 'media');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

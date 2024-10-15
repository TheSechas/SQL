-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-01-2024 a las 09:47:15
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE futbolultrasasir;

USE futbolultrasasir;

DROP TABLE IF EXISTS `divisiones`;
CREATE TABLE IF NOT EXISTS `divisiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `numEquipos` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `divisiones` (`id`, `nombre`, `numEquipos`) VALUES
(1, 'primera', 20),
(2, 'segunda', 22),
(3, 'segundaB', 64),
(4, 'premier', 20),
(5, 'first', 22),
(6, 'seriaA', 20),
(7, 'serieB', 22);

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `idDivision` int NOT NULL,
  `presupuesto` decimal(15,0) DEFAULT NULL,
  `idUltra` int NOT NULL,
  `idEstadio` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDivisionEquipos` (`idDivision`),
  KEY `idUltrasEquipos` (`idUltra`),
  KEY `idEstadioEquipos` (`idEstadio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `equipos` (`id`, `nombre`, `idDivision`, `presupuesto`, `idUltra`, `idEstadio`) VALUES
(1, 'Deportivo de la coruña', 3, 100000000, 1, 1),
(2, 'Barcelona', 1, 1000000000, 2, 2),
(3, 'Milan FC', 6, 50000000, 4, 4),
(4, 'inter de milan', 6, 55000000, 5, 4),
(5, 'Tottenham', 4, 500000000, 3, 3),
(6, 'Bournemouth', 5, 50000000, 6, 5),
(7, 'Manchester United', 4, 888000000, 7, 6),
(8, 'Chelsea FC', 4, 888000000, 8, 7),
(9, 'arsenal', 4, 700000000, 9, 8),
(10, 'real madrid', 1, 999000000, 10, 9),
(11, 'athletic de bilbao', 1, 80000000, 11, 10);

DROP TABLE IF EXISTS `estadios`;
CREATE TABLE IF NOT EXISTS `estadios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `patrocinador` varchar(55) DEFAULT NULL,
  `olimpico` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `federaciones`;
CREATE TABLE IF NOT EXISTS `federaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `pais` varchar(55) DEFAULT NULL,
  `ligas` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `federaciones` (`id`, `nombre`, `pais`, `ligas`) VALUES
(1, 'Federacion española', 'ESPAÑA', 3),
(2, 'The Football Association', 'INGLATERRA', 2),
(3, 'Federazione Italiana Giuoco Calcio', 'ITALIA', 2),
(4, 'UEFA', '', 0),
(5, 'CONMEBOL', '', 0);

DROP TABLE IF EXISTS `ligas`;
CREATE TABLE IF NOT EXISTS `ligas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `pais` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ligas` (`id`, `nombre`, `pais`) VALUES
(1, 'liga BBVA', 'ESPAÑA'),
(2, 'liga Santander', 'ESPAÑA'),
(3, 'liga Federacion', 'ESPAÑA'),
(4, 'premier', 'INGLATERRA'),
(5, 'EFL Championship', 'INGLATERRA'),
(6, 'Serie A TIM', 'ITALIA'),
(7, 'Serie B TIM', 'ITALIA');

DROP TABLE IF EXISTS `torneos`;
CREATE TABLE IF NOT EXISTS `torneos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `numEquipos` int NOT NULL,
  `premio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `torneos` (`id`, `nombre`, `numEquipos`, `premio`) VALUES
(1, 'UEFA ChampionsLeague', 32, 100000000.00),
(2, 'Europa League', 64, 25000000.00),
(3, 'Libertadores', 32, 25000000.00);

DROP TABLE IF EXISTS `ultras`;
CREATE TABLE IF NOT EXISTS `ultras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreBanda` varchar(55) NOT NULL,
  `violencia` enum('baja','media','alta') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

ALTER TABLE `equipos`
  ADD CONSTRAINT `idDivisionEquipos` FOREIGN KEY (`idDivision`) REFERENCES `divisiones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idEstadioEquipos` FOREIGN KEY (`idEstadio`) REFERENCES `estadios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idUltrasEquipos` FOREIGN KEY (`idUltra`) REFERENCES `ultras` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

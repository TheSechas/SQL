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
-- Database: `zoobdasir`
--

CREATE DATABASE IF NOT EXISTS `zoobdasir`;

USE `zoobdasir`;


-- --------------------------------------------------------

--
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
CREATE TABLE IF NOT EXISTS `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `especie` enum('PRIMATES','FELINOS','REPTILES') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `peso` decimal(6,2) NOT NULL,
  `peligroso` tinyint NOT NULL,
  `idZona` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `animalesTOzonasFK` (`idZona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animales`
--

INSERT INTO `animales` (`id`, `nombre`, `especie`, `peso`, `peligroso`, `idZona`) VALUES
(1, 'JONY', 'PRIMATES', 150.34, 1, 1),
(2, 'LUCAS', 'FELINOS', 25.55, 1, 2),
(3, 'MILI', 'REPTILES', 3.43, 0, 3),
(4, 'COPITO', 'PRIMATES', 140.00, 0, 1),
(5, 'GARDFIELD', 'FELINOS', 12.25, 0, 2),
(6, 'ARAÑA', 'FELINOS', 5.50, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `animalescuidadores`
--

DROP TABLE IF EXISTS `animalescuidadores`;
CREATE TABLE IF NOT EXISTS `animalescuidadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idanimal` int NOT NULL,
  `idcuidador` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `animalescuidadoresTOanimalesFK` (`idanimal`),
  KEY `animalescuidadoresTOcuidadoresFK` (`idcuidador`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animalescuidadores`
--

INSERT INTO `animalescuidadores` (`id`, `idanimal`, `idcuidador`, `fecha`) VALUES
(1, 1, 1, '2024-01-01'),
(2, 1, 2, '2024-01-01'),
(3, 2, 3, '2024-01-02'),
(4, 2, 2, '2024-01-02'),
(5, 2, 1, '2024-01-03'),
(6, 3, 1, '2024-01-04'),
(7, 4, 1, '2024-01-05'),
(8, 5, 4, '2024-01-01'),
(9, 6, 4, '2024-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `cuidadores`
--

DROP TABLE IF EXISTS `cuidadores`;
CREATE TABLE IF NOT EXISTS `cuidadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido1` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido2` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `especialidad` enum('VETERINARIO','LIMPIADOR','CIRUJANO','INVESTIGADOR') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuidadores`
--

INSERT INTO `cuidadores` (`id`, `nombre`, `apellido1`, `apellido2`, `especialidad`) VALUES
(1, 'DIEGO', 'COELLO', NULL, 'VETERINARIO'),
(2, 'DANIEL', 'SANCHEZ', NULL, 'LIMPIADOR'),
(3, 'ELOY', 'CIRUJANO', NULL, 'CIRUJANO'),
(4, 'SABELA', 'COBELO', NULL, 'INVESTIGADOR');

-- --------------------------------------------------------

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
CREATE TABLE IF NOT EXISTS `zonas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `metroscuadrados` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zonas`
--

INSERT INTO `zonas` (`id`, `nombre`, `metroscuadrados`) VALUES
(1, 'NORTE', 100),
(2, 'SUR', 300),
(3, 'OESTE', 250),
(4, 'ESTE', 300);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animales`
--
ALTER TABLE `animales`
  ADD CONSTRAINT `animalesTOzonasFK` FOREIGN KEY (`idZona`) REFERENCES `zonas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `animalescuidadores`
--
ALTER TABLE `animalescuidadores`
  ADD CONSTRAINT `animalescuidadoresTOanimalesFK` FOREIGN KEY (`idanimal`) REFERENCES `animales` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `animalescuidadoresTOcuidadoresFK` FOREIGN KEY (`idcuidador`) REFERENCES `cuidadores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

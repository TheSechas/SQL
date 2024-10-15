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
-- Database: `veterinariaasir`
--

CREATE DATABASE IF NOT EXISTS `veterinariaasir`;

USE `veterinariaasir`;


-- --------------------------------------------------------

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
CREATE TABLE IF NOT EXISTS `mascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `especie` enum('P','G') COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` enum('H','M') COLLATE utf8mb4_general_ci NOT NULL,
  `ubicacion` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` enum('A','B') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mascotas`
--

INSERT INTO `mascotas` (`id_mascota`, `nombre`, `especie`, `sexo`, `ubicacion`, `estado`) VALUES
(1, 'BUDY', 'P', 'M', 'E05', 'B'),
(2, 'PIPO', 'P', 'M', 'E02', 'B'),
(3, 'NUNA', 'P', 'H', 'E02', 'A'),
(4, 'BRUTS', 'P', 'M', 'E03', 'A'),
(5, 'AMERICO', 'G', 'M', 'E04', 'A'),
(6, 'SOMBRA', 'P', 'H', 'E05', 'A'),
(7, 'AMAYA', 'G', 'H', 'E04', 'A'),
(8, 'TALIA', 'G', 'H', 'E01', 'B'),
(9, 'TRABIS', 'P', 'M', 'E02', 'A'),
(10, 'TESA', 'G', 'H', 'E01', 'A'),
(11, 'TITITO', 'G', 'M', 'E04', 'B'),
(12, 'TRUCA', 'P', 'H', 'E02', 'A'),
(13, 'ZULAY', 'P', 'H', 'E05', 'A'),
(14, 'DANDI', 'G', 'M', 'E04', 'A'),
(15, 'RAS', 'G', 'M', 'E01', 'A'),
(16, 'CANELA', 'P', 'H', 'E02', 'A');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

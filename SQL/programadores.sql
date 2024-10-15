-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2024 at 05:23 PM
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
-- Database: `programadores`
--
CREATE DATABASE IF NOT EXISTS `programadores` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `programadores`;

-- --------------------------------------------------------

--
-- Table structure for table `lenguajes`
--

DROP TABLE IF EXISTS `lenguajes`;
CREATE TABLE IF NOT EXISTS `lenguajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `tipo` varchar(25) NOT NULL,
  `dificultad` enum('FACIL','MEDIO','DIFICIL') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `nombre`, `tipo`, `dificultad`) VALUES
(1, 'JAVA', 'POO', 'MEDIO'),
(2, 'C++', 'ESTRUCTURADO', 'DIFICIL'),
(3, 'C#', 'POO', 'MEDIO'),
(4, 'SQL', 'BASE DE DATOS', 'FACIL'),
(5, 'ERLANG', 'LOGICO', 'DIFICIL'),
(6, 'JAVASCRIPT', 'POO', 'FACIL');

-- --------------------------------------------------------

--
-- Table structure for table `lenguajesprogramadores`
--

DROP TABLE IF EXISTS `lenguajesprogramadores`;
CREATE TABLE IF NOT EXISTS `lenguajesprogramadores` (
  `idLenguaje` int NOT NULL,
  `idProgramador` int NOT NULL,
  KEY `paco` (`idLenguaje`),
  KEY `paco2` (`idProgramador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lenguajesprogramadores`
--

INSERT INTO `lenguajesprogramadores` (`idLenguaje`, `idProgramador`) VALUES
(1, 1),
(3, 1),
(6, 1),
(2, 2),
(3, 3),
(4, 3),
(6, 5),
(1, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `programadores`
--

DROP TABLE IF EXISTS `programadores`;
CREATE TABLE IF NOT EXISTS `programadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `apellido1` varchar(55) NOT NULL,
  `apellido2` varchar(55) DEFAULT NULL,
  `edad` int NOT NULL,
  `idSistema` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paco3` (`idSistema`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programadores`
--

INSERT INTO `programadores` (`id`, `nombre`, `apellido1`, `apellido2`, `edad`, `idSistema`) VALUES
(1, 'DAVID', 'SUAREZ', 'LAREO', 37, 1),
(2, 'FERNANDO', 'MIRANDA', 'FERNANDEZ', 20, 2),
(3, 'CRISTINA', 'GARCIA', NULL, 23, 3),
(4, 'AMARA', 'ROCA', 'IGLESIAS', 25, 2),
(5, 'OANA', 'MINTOIU', NULL, 30, 1),
(6, 'ENRIQUE', 'PAZ', 'PEREZ', 40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sistemas`
--

DROP TABLE IF EXISTS `sistemas`;
CREATE TABLE IF NOT EXISTS `sistemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `libre` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sistemas`
--

INSERT INTO `sistemas` (`id`, `nombre`, `libre`) VALUES
(1, 'WINDOWS', 0),
(2, 'IOS', 0),
(3, 'LINUX', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lenguajesprogramadores`
--
ALTER TABLE `lenguajesprogramadores`
  ADD CONSTRAINT `paco` FOREIGN KEY (`idLenguaje`) REFERENCES `lenguajes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `paco2` FOREIGN KEY (`idProgramador`) REFERENCES `programadores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `programadores`
--
ALTER TABLE `programadores`
  ADD CONSTRAINT `paco3` FOREIGN KEY (`idSistema`) REFERENCES `sistemas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- 1. Muestra la información del/os programador/es de menor edad (FUNCION MIN y subconsulta).

SELECT *
FROM Programadores
WHERE edad = (SELECT MIN(edad) FROM Programadores);

-- 2. Muestra la información de los programadores que no tienen segundo apellido y cuyo nombre supero a los 6 caracteres.

SELECT *
FROM programadores
WHERE apellido2 IS NULL AND LENGTH(nombre) > 6;

-- 3. Muestra la información de los programadores cuyo nombre contenga la letra “m” ó no tengan segundo apellido ó el primer apellido contenga 2 letras A.

SELECT *
FROM programadores
WHERE nombre LIKE "%m%" OR apellido2 IS NULL OR apellido1 LIKE "%a%a%";

-- 4. Muestra la información de los programdores cuyo nombre contenga la letra “m” y dos letras “a” ó que tengan menos de 30 años.

SELECT *
FROM programadores
WHERE (nombre LIKE "%m%" AND nombre LIKE "%a%a%") OR edad < 30;

-- 5. Muestra la información de los programadores cuyas edades estén comprendidas entre los 25 y los 30 años.

SELECT *
FROM programadores
WHERE edad BETWEEN 25 AND 30;

-- 6. Muestra la información de los programadores cuya edad sea superior a la media de las edades de todos los programadores (FUNCION AVG y subconsulta). 
-- Ordena los resultados por orden ascendente según la edad, en caso de tener la misma edad, por orden alfabético.

SELECT *
FROM programadores
WHERE edad >(SELECT AVG(edad)
			FROM programadores)  
ORDER BY edad ASC, nombre ASC;

-- 7. Muestra la información de los programadores cuya edad esté entre 25 y 30 años y sea superior al promedio de las edades de los trabajadores cuyos nombres contengan la letra “m” (subconsultas).

SELECT *
FROM programadores
WHERE edad BETWEEN 25 AND 30 AND edad >(SELECT AVG(edad)
										FROM programadores
                                        WHERE nombre LIKE "%m%");

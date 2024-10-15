-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2024 at 09:56 AM
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
-- Database: `ponferon`
--
CREATE DATABASE IF NOT EXISTS `ponferon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ponferon`;

-- --------------------------------------------------------

--
-- Table structure for table `guias`
--

DROP TABLE IF EXISTS `guias`;
CREATE TABLE IF NOT EXISTS `guias` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(125) NOT NULL,
  `edad` int NOT NULL,
  `idLocalizacion` int NOT NULL,
  KEY `idLocalizacionTOLocalizacionFK` (`idLocalizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guias`
--

INSERT INTO `guias` (`dni`, `nombre`, `apellidos`, `edad`, `idLocalizacion`) VALUES
('34786787T', 'Furia', 'Obregon Garcia', 20, 1),
('12345678Q', 'Ey Thor', 'Pardina', 22, 2),
('32346556P', 'Adrione', 'Golfzalez Blanco', 29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `localizaciones`
--

DROP TABLE IF EXISTS `localizaciones`;
CREATE TABLE IF NOT EXISTS `localizaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(3) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `km` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `localizaciones`
--

INSERT INTO `localizaciones` (`id`, `abreviatura`, `nombre`, `km`) VALUES
(1, 'PON', 'Ponferrada', 283000),
(2, 'NAR', 'Naron', 67000);

-- --------------------------------------------------------

--
-- Table structure for table `pubs`
--

DROP TABLE IF EXISTS `pubs`;
CREATE TABLE IF NOT EXISTS `pubs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `valoracion` enum('1','2','3','4','5') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pubs`
--

INSERT INTO `pubs` (`id`, `nombre`, `valoracion`) VALUES
(1, 'Budda Club', '4'),
(2, 'Pub Odeon', '4'),
(3, 'Pub Bamboo', '3'),
(4, 'Cardebelle', '5'),
(5, 'La Suite', '4'),
(6, 'Estrela Do Pronto', '4');

-- --------------------------------------------------------

--
-- Table structure for table `pubslocal`
--

DROP TABLE IF EXISTS `pubslocal`;
CREATE TABLE IF NOT EXISTS `pubslocal` (
  `idPubs` int NOT NULL,
  `idLocal` int NOT NULL,
  KEY `idLocalTOLocalizacionFK` (`idLocal`),
  KEY `idPubsTOPubsFK` (`idPubs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pubslocal`
--

INSERT INTO `pubslocal` (`idPubs`, `idLocal`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guias`
--
ALTER TABLE `guias`
  ADD CONSTRAINT `idLocalizacionTOLocalizacionFK` FOREIGN KEY (`idLocalizacion`) REFERENCES `localizaciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pubslocal`
--
ALTER TABLE `pubslocal`
  ADD CONSTRAINT `idLocalTOLocalizacionFK` FOREIGN KEY (`idLocal`) REFERENCES `localizaciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idPubsTOPubsFK` FOREIGN KEY (`idPubs`) REFERENCES `pubs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


3. Muestra por pantalla los pub que tengan como segunda letra de su nombre la “u” y una valoración mayor a 3. (1 punto)

SELECT nombre
FROM pubs
WHERE nombre LIKE "_u%" AND valoracion > 3;

4. Muestra por pantalla la media de las valoraciones de los pub de nuestra base de datos, el dato debe mostrarse en una columna resultante que diga “Valoración media de los pubs”. (1 punto)

SELECT AVG(valoracion) AS "valoracion media de los pubs"
FROM pubs;

5. Muestra el nombre, los apellidos y la edad del guía más joven de la base de datos. (1 punto)

SELECT nombre, apellidos, MIN(edad)
FROM guias;

6. Muestra el pub con mayor valoración de la base de datos. (0.5 puntos)

SELECT nombre, MAX(valoracion)
FROM pubs;

7. Muestra todos los datos del guía cuyo nombre tenga la letra “r” en antepenúltima posición, tenga 20 o 23 años y su dni empiece por “3” y acabe en “t” (el filtro del dni hacerlo de una sola vez). (1 punto)

SELECT *
FROM guias
WHERE nombre LIKE "%r__" AND edad BETWEEN 20 AND 23 AND dni LIKE "3%T";

8. Muestra un resultado con nombre de columna “Número de pubs” que nos muestre el número de pubs que hay almacenados y sean de Narón. (1 punto)

SELECT COUNT(*) AS "Número de pubs"
FROM pubs
WHERE id IN(SELECT idPubs
			FROM pubslocal
			WHERE idLocal = 2);

9. Haz que el Budda Club de Ponferrada pase a tener una valoración igual a 3. (0.5 puntos)

UPDATE pubs
SET valoracion = 3
WHERE id = 1;

10. Muestra la información de los guías que trabajan en Ponferrada, así como la información de los pubs de Ponferrada. (1 punto).

SELECT *
FROM guias
WHERE idLocalizacion = 1;

SELECT *
FROM pubs
WHERE id IN(SELECT idPubs
			FROM pubslocal
			WHERE idLocal = 1);

11. Elimina el pub con menor valoración. (1 punto).

DELETE FROM pubs
WHERE valoracion = (SELECT min_valoracion 
                    FROM (SELECT MIN(valoracion)
                          AS min_valoracion FROM pubs));
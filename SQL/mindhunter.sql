-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 06, 2024 at 08:55 AM
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
-- Database: `mindhunter`
--
CREATE DATABASE IF NOT EXISTS `mindhunter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `mindhunter`;

-- --------------------------------------------------------

--
-- Table structure for table `asesinos`
--

DROP TABLE IF EXISTS `asesinos`;
CREATE TABLE IF NOT EXISTS `asesinos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `apodo` varchar(45) DEFAULT NULL,
  `sexo` enum('M','F') NOT NULL,
  `edad` int DEFAULT NULL,
  `idModus` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idModusTOModusoperandiFK` (`idModus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asesinos`
--

INSERT INTO `asesinos` (`id`, `nombre`, `apellidos`, `apodo`, `sexo`, `edad`, `idModus`) VALUES
(1, 'Harold', 'Frederik Shipman', 'dr. Muerte', 'M', NULL, 3),
(2, 'Aleksandr', 'Pichushkin', 'el asesino del martillo', 'M', NULL, 1),
(3, 'Alexe', 'Khaterina Popova', 'Madame Popova', 'F', NULL, 2),
(4, 'Irina', 'Gaidamachuk', 'El Demonio con vestido', 'F', NULL, 4),
(5, 'Francisca', 'Ballesteros', 'La viuda negra', 'F', NULL, 3),
(6, 'Yago', 'Ares', 'El inocente', 'M', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `asesinovictimas`
--

DROP TABLE IF EXISTS `asesinovictimas`;
CREATE TABLE IF NOT EXISTS `asesinovictimas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idAsesino` int NOT NULL,
  `idVictima` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAsesinoTOAsesinosFK` (`idAsesino`),
  KEY `idVictimaTOVictimasFK` (`idVictima`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asesinovictimas`
--

INSERT INTO `asesinovictimas` (`id`, `idAsesino`, `idVictima`, `Fecha`) VALUES
(1, 1, 1, '2020-03-06'),
(2, 1, 2, '2020-03-03'),
(3, 1, 3, '2020-02-01'),
(4, 2, 4, '1999-05-05'),
(5, 2, 5, '1998-06-06'),
(6, 2, 6, '1997-07-07'),
(7, 3, 7, '1888-08-08'),
(8, 3, 8, '1888-09-09'),
(9, 4, 9, '2020-01-01'),
(10, 4, 10, '2020-01-01'),
(11, 4, 11, '2019-03-02'),
(12, 4, 12, '2019-05-01'),
(13, 4, 13, '2017-07-07'),
(14, 5, 14, '2004-01-01'),
(15, 5, 15, '2003-03-03'),
(16, 5, 16, '2002-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `fechaencarcelados`
--

DROP TABLE IF EXISTS `fechaencarcelados`;
CREATE TABLE IF NOT EXISTS `fechaencarcelados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idAsesino` int NOT NULL,
  `idPrision` int NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAsesino2TOAsesinosFK` (`idAsesino`),
  KEY `idPrision2TOPrisionesFK` (`idPrision`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fechaencarcelados`
--

INSERT INTO `fechaencarcelados` (`id`, `idAsesino`, `idPrision`, `Fecha`) VALUES
(1, 1, 1, '2020-04-04'),
(2, 2, 2, '2000-05-18'),
(3, 3, 3, '1900-10-20'),
(4, 4, 2, '2020-03-02'),
(5, 5, 2, '2005-12-31'),
(6, 6, 2, '2020-03-09'),
(7, 2, 1, '1999-12-13'),
(8, 4, 1, '2020-01-02'),
(9, 5, 1, '2004-01-02'),
(10, 2, 1, '2002-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `modusoperandi`
--

DROP TABLE IF EXISTS `modusoperandi`;
CREATE TABLE IF NOT EXISTS `modusoperandi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modus` enum('arma blanca','arma de fuego','veneno','a mano') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `modusoperandi`
--

INSERT INTO `modusoperandi` (`id`, `modus`) VALUES
(1, 'arma blanca'),
(2, 'arma de fuego'),
(3, 'veneno'),
(4, 'a mano');

-- --------------------------------------------------------

--
-- Table structure for table `prisiones`
--

DROP TABLE IF EXISTS `prisiones`;
CREATE TABLE IF NOT EXISTS `prisiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `dimensiones` int NOT NULL,
  `seguridad` enum('maxima','alta','media','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prisiones`
--

INSERT INTO `prisiones` (`id`, `nombre`, `dimensiones`, `seguridad`) VALUES
(1, 'Alcatraz', 999, 'maxima'),
(2, 'Teixeiro', 500, 'media'),
(3, 'Robben Island', 750, 'maxima'),
(4, 'Isla del Diablo', 650, 'maxima');

-- --------------------------------------------------------

--
-- Table structure for table `victimas`
--

DROP TABLE IF EXISTS `victimas`;
CREATE TABLE IF NOT EXISTS `victimas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `victimas`
--

INSERT INTO `victimas` (`id`, `nombre`, `apellidos`, `edad`) VALUES
(1, 'Daniel', 'Vázquez', 19),
(2, 'Heitor', 'Sardina', 20),
(3, 'Héctor', 'Niqui', 20),
(4, 'Pablo', 'Molina Cánovas', 18),
(5, 'Cristian', 'Pombo', 21),
(6, 'Diego', 'Vizoso', 22),
(7, 'David', 'Ferreiro', 20),
(8, 'Javier', 'Romero', 19),
(9, 'Adrián', 'González Franco', 85),
(10, 'Daniel', 'Esperante', 78),
(11, 'Juan', 'Vidal', 69),
(12, 'Pablo', 'Seoane', 89),
(13, 'Jaime', 'García', 80),
(14, 'Jesús', 'Carreira', 19),
(15, 'Raquel', 'Fariña', 22),
(16, 'Nuria', 'Bodelón', 20),
(17, 'Manuel', 'Rico López', 34);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asesinos`
--
ALTER TABLE `asesinos`
  ADD CONSTRAINT `idModusTOModusoperandiFK` FOREIGN KEY (`idModus`) REFERENCES `modusoperandi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `asesinovictimas`
--
ALTER TABLE `asesinovictimas`
  ADD CONSTRAINT `idAsesinoTOAsesinosFK` FOREIGN KEY (`idAsesino`) REFERENCES `asesinos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idVictimaTOVictimasFK` FOREIGN KEY (`idVictima`) REFERENCES `victimas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `fechaencarcelados`
--
ALTER TABLE `fechaencarcelados`
  ADD CONSTRAINT `idAsesino2TOAsesinosFK` FOREIGN KEY (`idAsesino`) REFERENCES `asesinos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idPrision2TOPrisionesFK` FOREIGN KEY (`idPrision`) REFERENCES `prisiones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



    1. Inserta la prisión “Isla del diablo” en la Guayana Francesa con 650m y seguridad máxima.

    INSERT INTO `prisiones` (`id`, `nombre`, `dimensiones`, `seguridad`) VALUES 
    (NULL, 'Isla del Diablo', '650', 'maxima');

    2. Inserta una víctima llamada Manuel Rico López 34 años. ¿Se puede hacer esto? En caso de que pueda hacerse, ¿qué información aportaría este dato al estudio del criminólogo?

    INSERT INTO `victimas` (`id`, `nombre`, `apellidos`, `edad`) VALUES 
    (NULL, 'Manuel', 'Rico López', '38', "1985-09-16");

    3. ¿Cuántos asesinos hubo en Teixeiro?

    SELECT COUNT(*) AS "Asesinos"
    FROM fechaencarcelados 
    WHERE idPrision =(SELECT id
                      FROM prisiones 
                      WHERE nombre = 'Teixeiro');

    4. ¿Cuántos asesinos hay en la prisión que menos asesinos alberga a lo largo de nuestro registro?

    SELECT COUNT(idAsesino), idPrision 
    FROM fechaencarcelados
    GROUP BY idPrision
    HAVING COUNT(idAsesino) <= ALL (SELECT COUNT(idAsesino)
                                    FROM fechaencarcelados
                                    GROUP BY idPrision);

    5. ¿Cuántos asesinos hay en prisiones con más de 650 metros cuadrados en nuestro registro?

    SELECT COUNT(*) AS "Asesino"
    FROM fechaencarcelados
    WHERE idPrision IN(SELECT id
					FROM prisiones
					WHERE dimensiones >= 650);

    6. ¿Cuál es la media de edad de las víctimas de “El demonio con vestido”?

    SELECT AVG(edad)
    FROM victimas
    WHERE id IN(SELECT idVictima
			FROM asesinovictimas
			WHERE idAsesino = (SELECT id
								FROM asesinos
								WHERE apodo LIKE "EL DEMONIO CON VESTIDO"));

    7. ¿Quién asesinó a Heitor? (descubridlo y le damos un premio)

    SELECT nombre
    FROM asesinos
    WHERE id = (SELECT idAsesino
			FROM asesinovictimas
			WHERE idVictima = (SELECT id
                                FROM victimas
                                WHERE nombre = "HEITOR"));

    8. ¿Qué encarcelado como asesino es inocente? (aún no sabréis hacerla, creo ;)

    SELECT id, nombre, apellidos, apodo
    FROM asesinos
    WHERE apodo LIKE "El Inocente";

    SELECT a.id, a.nombre, a.apellidos, a.apodo
    FROM asesinos a
    LEFT JOIN asesinovictimas av ON a.id = av.idAsesino
    WHERE av.idAsesino IS NULL;

    9. ¿Qué asesino tiene más víctimas en su expediente?

    

    10. ¿Qué asesinos acaban con sus víctimas usando veneno?



    11. ¿Qué asesino/s femenino/s es/son lo/s que menos víctimas tiene/n?



    12. Tras pasar por la puerta de San Pedro, Adrián González cansó a este pobre hombrecillo que lo mandó directo al infierno para no aguantarlo, Satanás, tras torturarlo con incesante placer acabó cogiendo baja 
    por depresión tras escuchar todos los lamentos de Adrián, entre cielo e infierno acordaron hacerlo inmortal por lo que tendremos que actualizar los valores de la base de datos (la frase anterior es trampa), 
    borrando a Adrián González de lista de víctimas.



    13. Actualizar la tabla víctimas para que aquellas víctimas que tengan como penúltima letra del nombre una “a”, cuyo campo apellidos acaba en “o” y tenga 21 años se llamen “Cristiano” y se apelliden “Ronaldo”.



    14. Muestra los datos de las víctimas de asesinos encarcelados en Robben Island.



    15. Muestra un listado de las víctimas por empezando por las más recientes y acabando por las que lleven más tiempo fallecidas.



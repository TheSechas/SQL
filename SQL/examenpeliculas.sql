-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 15, 2024 at 11:13 AM
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
-- Database: `examenpeliculas`
--

CREATE DATABASE IF NOT EXISTS "examenpeliculas"

USE "examenpeliculas"

-- --------------------------------------------------------

--
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
CREATE TABLE IF NOT EXISTS `actores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `actores`
--

INSERT INTO `actores` (`id`, `nombre`, `fecha_nacimiento`, `nacionalidad`) VALUES
(1, 'Brad Pitt', '1963-12-18', 'Estados Unidos'),
(2, 'Angelina Jolie', '1975-06-04', 'Estados Unidos'),
(3, 'Johnny Depp', '1963-06-09', 'Estados Unidos'),
(4, 'Scarlett Johansson', '1984-11-22', 'Estados Unidos'),
(5, 'Denzel Washington', '1954-12-28', 'Estados Unidos'),
(6, 'Apátrido', '1954-12-28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `actores_peliculas`
--

DROP TABLE IF EXISTS `actores_peliculas`;
CREATE TABLE IF NOT EXISTS `actores_peliculas` (
  `id_actor` int NOT NULL,
  `id_pelicula` int NOT NULL,
  KEY `Actores_PeliculasTOActoresFK` (`id_actor`),
  KEY `Actores_PeliculasTOPeliculasFK` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `actores_peliculas`
--

INSERT INTO `actores_peliculas` (`id_actor`, `id_pelicula`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(1, 6),
(2, 7),
(3, 6),
(4, 8),
(5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE IF NOT EXISTS `peliculas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `director` varchar(55) NOT NULL,
  `anho_estreno` int NOT NULL,
  `duracion_minutos` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `director`, `anho_estreno`, `duracion_minutos`) VALUES
(1, 'Fight Club', 'David Fincher', 1999, 139),
(2, 'Maleficent', 'Robert Stromberg', 2014, 97),
(3, 'Pirates of the Caribbean: The Curse of the Black Pearl', 'Gore Verbinski', 2003, 143),
(4, 'The Avengers', 'Joss Whedon', 2012, 143),
(5, 'Training Day', 'Antoine Fuqua', 2001, 122),
(6, 'Inception', 'Christopher Nolan', 2010, 148),
(7, 'The Shawshank Redemption', 'Frank Darabont', 1994, 142),
(8, 'The Godfather', 'Francis Ford Coppola', 1972, 175),
(9, 'The Dark Knight', 'Christopher Nolan', 2008, 152),
(10, 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 2001, 178),
(11, 'Toy Story 3', 'Lee Unkrich', 2010, 103),
(12, 'Black Swan', 'Darren Aronofsky', 2010, 108),
(13, 'The Curious Case of Benjamin Button', 'David Fincher', 2008, 166),
(14, 'Slumdog Millionaire', 'Danny Boyle', 2008, 120),
(15, 'A Beautiful Mind', 'Ron Howard', 2001, 135),
(16, 'Mulholland Drive', 'David Lynch', 2001, 147),
(17, 'Amélie', 'Jean-Pierre Jeunet', 2001, 122);

-- --------------------------------------------------------

--
-- Table structure for table `premios`
--

DROP TABLE IF EXISTS `premios`;
CREATE TABLE IF NOT EXISTS `premios` (
  `nombre` varchar(55) NOT NULL,
  `categoria` varchar(150) NOT NULL,
  `anho` int NOT NULL,
  `id_actor` int NOT NULL,
  KEY `PremiosTOActoresFK` (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `premios`
--

INSERT INTO `premios` (`nombre`, `categoria`, `anho`, `id_actor`) VALUES
('Oscar', 'Mejor Actor de Reparto', 2020, 1),
('Oscar', 'Mejor Actriz', 2000, 2),
('Oscar', 'Mejor Actor', 2004, 3),
('Oscar', 'Mejor Actriz de Reparto', 2020, 4),
('Oscar', 'Mejor Actor', 2002, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actores_peliculas`
--
ALTER TABLE `actores_peliculas`
  ADD CONSTRAINT `Actores_PeliculasTOActoresFK` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Actores_PeliculasTOPeliculasFK` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `premios`
--
ALTER TABLE `premios`
  ADD CONSTRAINT `PremiosTOActoresFK` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- 1 Muestra cuántas películas de nuestra base de datos han sido filmadas en cada año (0.5 puntos).

SELECT COUNT(titulo), anho_estreno
FROM peliculas
GROUP BY anho_estreno;

-- 2 Muestra cuántas películas de nuestra base de datos han sido filmadas en cada año siempre y cuando tengan un título de más de 7 caracteres. (1 punto)

SELECT COUNT(titulo), anho_estreno
FROM peliculas
WHERE LENGTH(titulo) > 7
GROUP BY anho_estreno;

-- 3 Muestra los años posteriores al año 2000 en donde se hayan filmado más de 2 películas. (2 puntos).

SELECT COUNT(*) AS numeroPeliculas, anho_estreno
FROM peliculas
WHERE anho_estreno > 2000
GROUP BY anho_estreno
HAVING numeroPeliculas > 2;

-- 4 Muestra SOLAMENTE los ids de los actores mostrando en cuántas han actuado cada uno de ellos. (1 punto).

SELECT id_actor, COUNT(id_pelicula)
FROM actores_peliculas
GROUP BY id_actor;

-- 5 Muestra la información de los actores que hayan actuado para “David Fincher” (1 punto).

SELECT *
FROM actores
WHERE id =(SELECT id_actor
			FROM actores_peliculas
			WHERE id_pelicula IN(SELECT id
								FROM peliculas
								WHERE director LIKE "DAVID FINCHER"));

-- 6 Muestra la información de los actores que hayan actuado para “David Fincher” y que hayan nacido en diciembre del año 1963 (1.5 puntos).

SELECT *
FROM actores
WHERE fecha_nacimiento LIKE YEAR(fecha_nacimiento) = 1963 AND MONTH(fecha_nacimiento) = 12 AND 
                    id =(SELECT id_actor
												FROM actores_peliculas
												WHERE id_pelicula IN(SELECT id
																	FROM peliculas
																	WHERE director LIKE "DAVID FINCHER"));

-- 7 Muestra el nombre de los actores que hayan filmado más de 2 películas (2 puntos).

SELECT nombre
FROM actores
WHERE id IN(SELECT id_actor
			FROM actores_peliculas
			GROUP BY id_actor
			HAVING COUNT(id_pelicula) > 2);

-- 8 Muestra la información de los actores que tengan un país y hayan nacido antes de 1970 ó que simplemente,
--tengan un nombre que empiece por la letra “d” y termine por la letra “n” (por nombre entenderemos nombre y apellido) (0.5 puntos).

SELECT *
FROM actores
WHERE nacionalidad IS NOT NULL AND YEAR(fecha_nacimiento) < 1970 OR nombre LIKE "D%n";

-- ENTREGA TAREA


-- 1 - Muestra el nombre de los actores y de los directores que hayan participado en "Fight Club"



-- 2 - Muestra el nombre de los actores que hayan participado en la película "Fight Club"

SELECT nombre
FROM actores
WHERE id IN (SELECT id_actor
            FROM actores_peliculas
            WHERE id_pelicula = 1);

-- 3 - Muestra el nombre de los directores que hayan dirigido películas en las que actuaron 2 o más actores.

SELECT director
FROM peliculas
WHERE id IN (SELECT id_actor
            FROM actores_peliculas
            WHERE id_pelicula IN(SELECT id_pelicula
                                FROM actores_peliculas
                                GROUP BY id_pelicula
                                HAVING COUNT(id_pelicula) >= 2));

-- 4 - Muestra los actores que nacieron en los meses de junio, julio, agosto, septiembre, noviembre o diciembre.

SELECT nombre, fecha_nacimiento
FROM actores
WHERE MONTH(fecha_nacimiento) IN (6, 7, 8, 9, 10, 11, 12);




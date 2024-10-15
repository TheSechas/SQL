- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2023 at 09:04 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asir23bd`
--
CREATE DATABASE asir23bd;
USE asir23bd;


-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(55) NOT NULL,
  `apellido2` varchar(55) DEFAULT NULL,
  `edad` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `lugar` varchar(55) NOT NULL,
  `centro` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
CREATE TABLE IF NOT EXISTS `asignaturas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `acronimo` varchar(5) NOT NULL,
  `horas` int NOT NULL,
  `dificultad` enum('ALTA','MEDIA','BAJA') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- --------------------------------------------------------

--
-- Table structure for table `centros`
--

DROP TABLE IF EXISTS `centros`;
CREATE TABLE IF NOT EXISTS `centros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` enum('PUBLICO','CONCERTADO','PRIVADO') NOT NULL,
  `provincia` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- --------------------------------------------------------

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
CREATE TABLE IF NOT EXISTS `profesores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) NOT NULL,
  `apellido1` varchar(55) NOT NULL,
  `apellido2` varchar(55) DEFAULT NULL,
  `edad` int NOT NULL,
  `salario` decimal(6,2) NOT NULL,
  `correoElectronico` varchar(155) NOT NULL,
  `especialidad` varchar(25) NOT NULL,
  `idCentro` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profesoresToCentrosFK` (`idCentro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- --------------------------------------------------------

--
-- Table structure for table `profesoresasignaturas`
--

DROP TABLE IF EXISTS `profesoresasignaturas`;
CREATE TABLE IF NOT EXISTS `profesoresasignaturas` (
  `idProfesor` int NOT NULL,
  `idAsignatura` int NOT NULL,
  PRIMARY KEY (`idProfesor`,`idAsignatura`),
  KEY `idAsignaturasToProfesoresFK` (`idAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesoresToCentrosFK` FOREIGN KEY (`idCentro`) REFERENCES `centros`(`id`);

--
-- Constraints for table `profesoresasignaturas`
--
ALTER TABLE `profesoresasignaturas`
  ADD CONSTRAINT `idAsignaturasToProfesoresFK` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `idProfesorToProfesoresFK` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


ALTER TABLE alumnos
CHANGE COLUMN centro idCentro INT(2) NOT NULL,
ADD CONSTRAINT idCentroToCentrosFK FOREIGN KEY(idCentro) REFERENCES centros(id);

CREATE TABLE alumnosasignaturas (
  idAlumno INT(2) NOT NULL,
  idAsignatura INT(2) NOT NULL,
  PRIMARY KEY(idAlumno, idAsignatura)
);

ALTER TABLE alumnosasignaturas
ADD CONSTRAINT idAlumnoToAlumnosFK FOREIGN KEY(idAlumno) REFERENCES alumnos(id),
ADD CONSTRAINT idAsignaturaToAsignaturasFK FOREIGN KEY(idAsignatura) REFERENCES asignaturas(id);



INSERT INTO `centros` (`id`, `nombre`, `tipo`, `provincia`) 
VALUES
(1, 'Liceo La Paz', 'CONCERTADO', 'A CORUÑA'),
(2, 'Obradoiro', 'PRIVADO', 'A CORUÑA'),
(3, 'Eusebio da Garda', 'PUBLICO', 'A CORUÑA');



INSERT INTO `alumnos` (`id`, `nombre`, `apellido1`, `apellido2`, `edad`, `email`, `lugar`, `idCentro`) 
VALUES
(1, 'Marcos', 'Aller', 'Amor', 18, 'marcos@gmail.com', 'OLEIROS', 1),
(2, 'Miguel', 'Carballo', 'Beltrán', 18, 'miguel@hotmail.com', 'A CORUÑA', 1),
(3, 'Julián', 'Cortés', 'Casal', 19, 'julian@gmail.com', 'A CORUÑA', 1),
(4, 'Miguel Ángel', 'Darriba', 'Uzal', 21, 'miguelangel@hotmail.es', 'O BURGO', 1),
(5, 'Iker', 'Fernández', 'Bonilla', 19, 'iker@gmail.com', 'CEE', 1),
(6, 'Daniel', 'Fernández', 'Miranda', 27, 'daniel@yahoo.es', 'OVIEDO', 1),
(7, 'Xián', 'Ferreiro', 'López', 26, 'xian@gmail.com', 'GIJON', 1),
(8, 'Sergio', 'González', 'García', 20, 'sergio@gmail.com', 'O BURGO', 1),
(9, 'Jorge', 'González', 'Lastra', 18, 'jorge@yahoo.es', 'PORTAZGO', 1),
(10, 'Javier', 'Hervada', 'Carnero', 21, 'javier@hotmail.com', 'A CORUÑA', 1),
(11, 'Hugo', 'Lamas', 'Ferreiro', 31, 'hugo@gmail.com', 'FERROL', 1),
(12, 'Carlos', 'Liste', 'Cabarcas', 21, 'carglos@yahoo.es', 'PORTAZGO', 1),
(13, 'Jose Antonio', 'Lodeiro', 'Espiñeiro', 23, 'joseantonio@gmail.com', 'A CORUÑA', 1),
(14, 'Álvaro', 'López', 'López', 20, 'alvaro@gmail.com', 'SANTA CRUZ', 1),
(15, 'Lucas', 'Meizoso', 'De Bernardo', 19, 'lucas@yahoo.es', 'CULLEREDO', 1),
(16, 'Aarón', 'Naveira', 'Taibo', 23, 'aaron@gmail.com', 'SADA', 1),
(17, 'Yoel', 'Otero', 'Sánchez', 19, 'yoel@yahoo.es', 'SADA', 1),
(18, 'Adrián', 'Pazo', 'Álvarez', 20, 'adrian@gmail.com', 'TEMPLE', 1),
(19, 'Martin', 'Reboredo', 'Orgeira', 21, 'martin@yahoo.es', 'CARRAL', 1),
(20, 'Javier', 'Riveiro', 'Paz', 20, 'javier@hotmail.es', 'A CORUÑA', 1),
(21, 'Álvaro', 'Rodríguez', 'González', 20, 'alvaro@yahoo.es', 'PERILLO', 1),
(22, 'Sara', 'Vázquez', 'Freire', 18, 'sara@yahoo.es', 'LOUREDA', 1),
(23, 'Aitor', 'Vigo', 'Cruz', 21, 'aitor@gmail.com', 'A CORUÑA', 1),
(24, 'Nicolás', 'Álvarez', 'Pérez', 18, 'nicolas@hotmail.com', 'BAIO', 1),
(25, 'Jesús', 'Ares', 'Armesto', 23, 'jesus@hotmail.com', 'OLEIROS', 1),
(26, 'Jose Manuel', 'Blanco', 'García', 26, 'josemanuel@hotmail.com', 'A CORUÑA', 1),
(27, 'Adrián', 'Canedo', 'Bello', 18, 'adrian@hotmail.com', 'A CORUÑA', 1),
(28, 'Ana', 'Caramés', 'Canosa', 23, 'ana@hotmail.com', 'A CORUÑA', 1),
(29, 'Andrea', 'Carracedo', 'Caamaño', 18, 'andrea@hotmail.com', 'SADA', 1),
(30, 'Adrián', 'Castro', 'Beiro', 21, 'adrian@gmail.com', 'A CORUÑA', 1),
(31, 'Sabela', 'Cobelo', 'Losada', 31, 'sabela@gmail.com', 'OLEIROS', 1),
(32, 'Diego', 'Coello', 'Morán', 33, 'diego@gmail.com', 'LUGO', 1),
(33, 'Antonio', 'Devesa', 'Varela', 23, 'antonio@gmail.com', 'A CORUÑA', 1),
(34, 'Ángel', 'Fernández', 'Blanco', 18, 'angel@gmail.com', 'OURENSE', 1),
(35, 'Mateo', 'Fernández', 'Rivera', 19, 'mateo@gmail.com', 'OURENSE', 1),
(36, 'Sofía', 'Ferreiro', 'Rodríguez', 19, 'sofia@yahoo.es', 'A CORUÑA', 1),
(37, 'Eloy', 'García', 'Martínez', 18, 'eloy@yahoo.es', 'VIGO', 1),
(38, 'Laura', 'Lodeiro', 'Casas', 21, 'laura@yahoo.es', 'VIGO', 1),
(39, 'Manuel', 'Loira', 'Vázquez', 25, 'manuel@yahoo.es', 'CARBALLIÑO', 1),
(40, 'Eloy', 'Lozano', 'Barrios', 19, 'eloy@yahoo.es', 'SADA', 1),
(41, 'Nicolás', 'Manteiga', 'Camba', 20, 'nicolas@yahoo.es', 'CARBALLO', 1),
(42, 'Alejandro', 'Mejía', 'González', 20, 'alejandro@hotmail.com', 'MUROS', 1),
(43, 'Isaías', 'Quesada', 'Vilariño', 19, 'isaias@hotmail.es', 'CANGAS', 1),
(44, 'Elena', 'Rodríguez', 'Fustes', 18, 'elena@hotmail.es', 'A CORUÑA', 1),
(45, 'Pablo', 'Rodríguez', 'Santos', 18, 'pablo@hotmail.es', 'CEE', 1),
(46, 'Rubén', 'Sampaio', 'Calvo', 18, 'ruben@hotmail.es', 'LAXE', 1),
(47, 'Alejandro', 'Sánchez', 'Cernadas', 19, 'alejandro@hotmail.es', 'FISTERRA', 1),
(48, 'Daniel', 'Sánchez', 'Vázquez', 29, 'daniel@liceolapaz.net', 'A CORUÑA', 1),
(49, 'Jacobo', 'Sánchez de Movellán', 'Formoso', 18, 'jacobo@liceolapaz.net', 'A CORUÑA', 1),
(50, 'Daniil', 'Shumkin', NULL, 19, 'daniil@liceolapaz.net', 'SADA', 1),
(51, 'Xenxo', 'Taboas', 'Alonso', 19, 'xenxo@liceolapaz.net', 'OLEIROS', 1),
(52, 'Paula Alejandra', 'Vargas', 'Silva', 23, 'paulaalejandra@liceolapaz.net', 'MERA', 1),
(53, 'Francisco', 'Vázquez', 'Zabalia', 23, 'francisco@liceolapaz.net', 'A CORUÑA', 1);



INSERT INTO `asignaturas` (`id`, `nombre`, `acronimo`, `horas`, `dificultad`) 
VALUES
(1, 'Base de datos', 'BBDDD', 80, 'ALTA'),
(3, 'Formación y Orientación Laboral', 'FOL', 55, 'BAJA'),
(4, 'Lenguaje de marcas', 'LM', 60, 'BAJA'),
(5, 'Sistemas y redes', 'SYR', 70, 'MEDIA'),
(7, 'Implementación de Sistema', 'ISO', 90, 'ALTA'),
(9, 'Programacion', 'PROG', 90, 'ALTA'),
(10, 'Entornos de Desarrollo', 'ENTD', 76, 'MEDIA'),
(11, 'Sistemas informaticos', 'SIS', 80, 'BAJA'),
(12, 'Fundamentos Hardware', 'FH', 66, 'BAJA');



INSERT INTO `profesores` (`id`, `nombre`, `apellido1`, `apellido2`, `edad`, `salario`, `correoElectronico`, `especialidad`, `idCentro`) VALUES
(1, 'Manuel', 'Rico', 'López', 38, '0.00', 'manuel@gmail.com', 'INFORMATICA', 1),
(2, 'Xabier', 'Pérez', 'Maestre', 44, '0.00', 'xabier@mundo-r.com', 'INFORMATICA', 1),
(3, 'Mónica', 'Pérez', 'Sueiro', 35, '0.00', 'monica@hotmail.com', 'INFORMATICA', 1),
(4, 'Jose Antonio', 'Pereira', 'Suárez', 41, '0.00', 'joseantonio@gmail.com', 'INFORMATICA', 1),
(5, 'Begoña', 'Cambeiro', 'Núñez', 42, '0.00', 'begoña@gmail.com', 'INFORMATICA', 1),
(6, 'Jesús', 'Varela', 'Sánchez', 44, '0.00', 'jesus@gmail.com', 'DERECHO', 1),
(9, 'Jesús', 'Pérez', 'Roca', 42, '0.00', 'jesusroca@gmail.com', 'INFORMATICA', 1),
(10, 'Eva', 'Castro', 'Pedreira', 40, '0.00', 'evacastro@gmail.com', 'DERECHO', 1);



INSERT INTO `profesoresasignaturas` (`idProfesor`, `idAsignatura`) VALUES
(1, 1),
(6, 3),
(10, 3),
(3, 4),
(9, 4),
(4, 5),
(2, 7),
(9, 9),
(5, 10),
(4, 11),
(5, 12);



INSERT INTO alumnosasignaturas (idAlumno, idAsignatura)
VALUES
(24,1),
(24,10),
(24,4),
(24,9),
(24,11),
(25,1),
(25,10),
(25,4),
(25,9),
(25,11),
(26,1),
(26,10),
(26,4),
(26,9),
(26,11),
(27,1),
(27,10),
(27,3),
(27,4),
(27,9),
(27,11),
(28,1),
(28,10),
(28,3),
(28,4),
(28,9),
(28,11),
(29,1),
(29,10),
(29,3),
(29,4),
(29,9),
(29,11),
(30,1),
(30,10),
(30,3),
(30,4),
(30,9),
(30,11),
(31,1),
(31,10),
(31,3),
(31,4),
(31,9),
(31,11),
(32,1),
(32,10),
(32,3),
(32,4),
(32,9),
(32,11),
(33,1),
(33,10),
(33,4),
(33,9),
(33,11),
(34,1),
(34,10),
(34,3),
(34,4),
(34,9),
(34,11),
(35,1),
(35,10),
(35,4),
(35,9),
(35,11),
(36,1),
(36,10),
(36,3),
(36,4),
(36,9),
(36,11),
(37,1),
(37,10),
(37,4),
(37,9),
(37,11),
(38,1),
(38,10),
(38,3),
(38,4),
(38,9),
(38,11),
(39,1),
(39,4),
(39,9),
(40,1),
(40,10),
(40,3),
(40,4),
(40,9),
(40,11),
(41,1),
(41,10),
(41,4),
(41,9),
(41,11),
(42,1),
(42,10),
(42,4),
(42,9),
(42,11),
(43,1),
(43,10),
(43,3),
(43,4),
(43,9),
(43,11),
(44,1),
(44,10),
(44,3),
(44,4),
(44,9),
(44,11),
(45,1),
(45,10),
(45,3),
(45,4),
(45,9),
(45,11),
(46,1),
(46,10),
(46,4),
(46,9),
(46,11),
(47,1),
(47,10),
(47,3),
(47,4),
(47,9),
(47,11),
(48,1),
(48,10),
(48,3),
(48,4),
(48,9),
(48,11),
(49,1),
(49,10),
(49,3),
(49,4),
(49,9),
(49,11),
(50,1),
(50,10),
(50,3),
(50,4),
(50,9),
(50,11),
(51,1),
(51,10),
(51,4),
(51,9),
(51,11),
(52,1),
(52,10),
(52,4),
(52,9),
(52,11),
(53,1),
(53,10),
(53,4),
(53,9),
(53,11),
(21,1),
(21,3),
(21,4), 
(21,5),
(21,7),
(21,12),
(16,1),
(16,5),
(16,7),
(16,12),
(9,1),
(9,3),
(9,4),
(9,5),
(9,7),
(9,12),
(2,1),
(2,3), 
(2,4), 
(2,5), 
(2,7),
(2,12),
(15,1),
(15,3),
(15,4),
(15,5),
(15,7),
(15,12),
(5,1),
(5,3),
(5,4),
(5,5),
(5,7),
(5,12),
(13,1),
(13,3),
(13,4),
(13,5),
(13,7),
(13,12),
(20,1),
(20,4),
(20,5),
(20,7),
(20,12),
(11,1),
(11,4),
(11,5),
(11,7),
(11,12),
(3,1),
(3,3),
(3,4),
(3,5),
(3,7),
(3,12),
(8,1),
(8,5),
(8,7),
(8,12),
(1,1),
(1,3),
(1,4),
(1,5),
(1,7),
(1,12),
(12,1),
(12,4),
(12,5),
(12,7), 
(12,12),
(10,1),
(10,3),
(10,4),
(10,5),
(10,7),
(10,12),
(23,1),
(23,3),
(23,4),
(23,5), 
(23,7),
(23,12),
(17,1),
(17,5),
(17,7),
(17,12),
(19,1),
(19,3),
(19,4),
(19,5),
(19,7),
(19,12),
(18,1),
(18,3),
(18,4),
(18,5),
(18,7),
(18,12),
(14,1),
(14,3),
(14,4),
(14,5),
(14,7),
(14,12),
(22,1),
(22,3),
(22,4),
(22,5),
(22,7),
(22,12),
(4,1),
(4,3),
(4,4),
(4,5),
(4,7),
(4,12),
(6,1),
(6,3),
(6,4),
(6,5),
(6,7),
(6,12),
(7,1),
(7,3),
(7,4),
(7,5),
(7,7),
(7,12);

1.Muestra la información de los profesores cuyo nombre tiene más de 3 letras e imparten en el Liceo.

SELECT nombre
FROM profesores
WHERE LENGTH(nombre) > 3 AND idCentro = (SELECT id
										FROM centros
										WHERE nombre LIKE "LICEO LA PAZ");

2.Muestra el nombre de las asignaturas de dificultad dificil.

SELECT nombre
FROM asignaturas
WHERE difcultad LIKE "DIFÍCIL";

3.Muestra el id de los profesores que imparten asignaturas de dificultad dificil.

SELECT id
FROM profesores
WHERE idAsignatura = (SELECT id
                      FROM asignaturas
                      WHERE difcultad LIKE "DIFÍCIL");

4.Muestra el id de los profesores que imparten más de una asignatura siempre y cuando las asignaturas tengan más de 50 horas.

SELECT id
FROM profesores
WHERE idAsignatura IN(SELECT id
                    FROM asignaturas
                    WHERE duracion > 50)
GROUP BY idAsignatura
HAVING COUNT(*) > 1;

5.Muestra el nombre de los profesores que imparten más de una asignatura.

SELECT nombre
FROM profesores
WHERE idAsignatura
GROUP BY idAsignatura
HAVING COUNT(*) > 1;

6.Muestra cuántas asignaturas estudia cada id de alumno.

SELECT idAlumno, COUNT(*) AS num_asignaturas
FROM alumnosasignaturas
GROUP BY idAlumno;

7.Muestra cuántos alumnos están matriculados en cada asignatura.

SELECT idAsignatura, COUNT(*) AS num_alumnos
FROM alumnosasignaturas
GROUP BY idAsignatura;

8.Muestra los ids de las asignaturas que tienen más de 15 alumnos matriculados.

SELECT idAsignatura
FROM alumnosasignaturas
GROUP BY idAsignatura
HAVING COUNT(*) > 15;

9.Muestra los ids de las asignaturas que tienen menos de 15 alumnos matriculados.

SELECT idAsignatura
FROM alumnosasignaturas
GROUP BY idAsignatura
HAVING COUNT(*) < 15;

10.Muestra toda la información de las asignaturas que tienen más de 3 alumnos matriculados cuyo apellido1 contenga una "A".

SELECT *
FROM asignaturas
WHERE id IN (SELECT idAsignatura
            FROM alumnosasignaturas
            WHERE idAlumno IN (SELECT id
                              FROM alumnos
                              WHERE apellido1 LIKE '%A%')
            GROUP BY idAsignatura
            HAVING COUNT(*) > 3);


11.Muestra la edad media de los alumnos que están matriculados en la asignatura de programación.

SELECT AVG(edad) AS edad_media
FROM alumnos
WHERE id IN (
    SELECT idAlumno
    FROM alumnosasignaturas
    WHERE idAsignatura = (
        SELECT id
        FROM asignaturas
        WHERE nombre = 'Programacion'
    )
);


12.Muestra la información de los alumnos que están matriculados en nun centro concertado.

SELECT *
FROM alumnos
WHERE idCentro IN (
    SELECT id
    FROM centros
    WHERE tipo = 'CONCERTADO'
);


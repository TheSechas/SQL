-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-04-2024 a las 15:28:01
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: carrerasfutbolisticas
--
CREATE DATABASE IF NOT EXISTS carrerasfutbolisticas DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE carrerasfutbolisticas;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla carreras
--

CREATE TABLE carreras (
  id int NOT NULL,
  idJugador int DEFAULT NULL,
  idEquipo int DEFAULT NULL,
  fechaInicio date DEFAULT NULL,
  fechaFin date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla carreras
--

INSERT INTO carreras (id, idJugador, idEquipo, fechaInicio, fechaFin) VALUES
(1, 1, 2, '2004-03-09', '2021-07-01'),
(2, 2, 1, '2020-07-01', NULL),
(3, 3, 12, '2020-07-01', NULL),
(4, 4, 12, '2021-07-01', NULL),
(5, 5, 3, '2020-07-01', NULL),
(6, 6, 7, '2017-07-01', '2020-06-30'),
(7, 7, 9, '2014-07-01', '2020-06-30'),
(8, 8, 11, '2018-07-01', '2020-06-30'),
(9, 9, 6, '2015-07-01', NULL),
(10, 10, 4, '2008-07-01', '2012-06-30'),
(11, 11, 3, '2005-07-01', '2018-06-30'),
(12, 12, 2, '2018-07-01', '2021-06-30'),
(13, 13, 5, '2007-07-01', NULL),
(14, 14, 8, '2010-07-01', '2018-06-30'),
(15, 15, 10, '2016-07-01', '2018-06-30'),
(16, 16, 12, '2015-07-01', '2017-06-30'),
(17, 17, 13, '2013-07-01', '2015-06-30'),
(18, 18, 14, '2018-07-01', '2020-06-30'),
(19, 19, 15, '2012-07-01', '2016-06-30'),
(20, 20, 16, '2009-07-01', '2014-06-30'),
(21, 1, 12, '2021-07-01', '2023-09-01'),
(22, 1, 3, '2010-07-01', '2020-06-30'),
(23, 2, 2, '2009-07-01', '2018-06-30'),
(24, 3, 1, '2011-07-01', '2014-06-30'),
(25, 4, 6, '2012-07-01', '2016-06-30'),
(26, 5, 4, '2013-07-01', '2017-06-30'),
(27, 6, 10, '2008-07-01', '2012-06-30'),
(28, 7, 12, '2010-07-01', '2014-06-30'),
(29, 8, 14, '2012-07-01', '2016-06-30'),
(30, 9, 16, '2014-07-01', '2018-06-30'),
(31, 10, 18, '2016-07-01', '2020-06-30'),
(32, 11, 20, '2018-07-01', NULL),
(33, 12, 13, '2011-07-01', NULL),
(34, 13, 17, '2013-07-01', NULL),
(35, 14, 19, '2015-07-01', NULL),
(36, 15, 11, '2017-07-01', NULL),
(37, 16, 5, '2019-07-01', NULL),
(38, 17, 4, '2014-07-01', NULL),
(39, 18, 3, '2012-07-01', NULL),
(40, 19, 2, '2010-07-01', NULL),
(41, 20, 1, '2008-07-01', NULL),
(42, 1, 7, '2018-07-01', NULL),
(43, 2, 8, '2019-07-01', NULL),
(44, 3, 9, '2020-07-01', NULL),
(45, 4, 10, '2021-07-01', NULL),
(46, 5, 11, '2022-07-01', NULL),
(47, 6, 12, '2023-07-01', NULL),
(48, 7, 13, '2024-07-01', NULL),
(49, 8, 14, '2025-07-01', NULL),
(50, 9, 15, '2026-07-01', NULL),
(51, 10, 16, '2027-07-01', NULL),
(52, 11, 17, '2028-07-01', NULL),
(53, 12, 18, '2029-07-01', NULL),
(54, 13, 19, '2030-07-01', NULL),
(55, 14, 20, '2031-07-01', NULL),
(56, 15, 1, '2032-07-01', NULL),
(57, 16, 2, '2033-07-01', NULL),
(58, 17, 3, '2034-07-01', NULL),
(59, 18, 4, '2035-07-01', NULL),
(60, 19, 5, '2036-07-01', NULL),
(61, 20, 6, '2037-07-01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla equipos
--

CREATE TABLE equipos (
  id int NOT NULL,
  nombre varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  ciudad varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  estadio varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla equipos
--

INSERT INTO equipos (id, nombre, ciudad, estadio) VALUES
(1, 'Real Madrid', 'Madrid', 'Santiago Bernabéu'),
(2, 'FC Barcelona', 'Barcelona', 'Camp Nou'),
(3, 'Atlético de Madrid', 'Madrid', 'Wanda Metropolitano'),
(4, 'Valencia CF', 'Valencia', 'Mestalla'),
(5, 'Sevilla FC', 'Sevilla', 'Ramón Sánchez-Pizjuán'),
(6, 'Manchester United', 'Manchester', 'Old Trafford'),
(7, 'Liverpool FC', 'Liverpool', 'Anfield'),
(8, 'Juventus', 'Turín', 'Allianz Stadium'),
(9, 'AC Milan', 'Milán', 'San Siro'),
(10, 'Bayern Munich', 'Múnich', 'Allianz Arena'),
(11, 'Borussia Dortmund', 'Dortmund', 'Signal Iduna Park'),
(12, 'Paris Saint-Germain', 'París', 'Parc des Princes'),
(13, 'Olympique de Marsella', 'Marsella', 'Stade Vélodrome'),
(14, 'Ajax', 'Ámsterdam', 'Johan Cruyff Arena'),
(15, 'Feyenoord', 'Róterdam', 'De Kuip'),
(16, 'Benfica', 'Lisboa', 'Estádio da Luz'),
(17, 'Porto', 'Oporto', 'Estádio do Dragão'),
(18, 'Galatasaray', 'Estambul', 'Türk Telekom Stadium'),
(19, 'Besiktas', 'Estambul', 'Vodafone Park'),
(20, 'Rangers FC', 'Glasgow', 'Ibrox Stadium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla jugadores
--

CREATE TABLE jugadores (
  id int NOT NULL,
  nombre varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  edad int DEFAULT NULL,
  nacionalidad varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  posicion varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla jugadores
--

INSERT INTO jugadores (id, nombre, edad, nacionalidad, posicion) VALUES
(1, 'Lionel Messi', 34, 'Argentina', 'Delantero'),
(2, 'Cristiano Ronaldo', 37, 'Portugal', 'Delantero'),
(3, 'Neymar Jr.', 30, 'Brasil', 'Delantero'),
(4, 'Kylian Mbappé', 23, 'Francia', 'Delantero'),
(5, 'Luis Suárez', 35, 'Uruguay', 'Delantero'),
(6, 'Mohamed Salah', 29, 'Egipto', 'Delantero'),
(7, 'Robert Lewandowski', 33, 'Polonia', 'Delantero'),
(8, 'Erling Haaland', 21, 'Noruega', 'Delantero'),
(9, 'Kevin De Bruyne', 30, 'Bélgica', 'Centrocampista'),
(10, 'Luka Modric', 36, 'Croacia', 'Centrocampista'),
(11, 'Sergio Ramos', 36, 'España', 'Defensa'),
(12, 'Virgil van Dijk', 30, 'Países Bajos', 'Defensa'),
(13, 'Jan Oblak', 29, 'Eslovenia', 'Portero'),
(14, 'Thibaut Courtois', 29, 'Bélgica', 'Portero'),
(15, 'Gianluigi Donnarumma', 23, 'Italia', 'Portero'),
(16, 'Marc-André ter Stegen', 30, 'Alemania', 'Portero'),
(17, 'João Félix', 22, 'Portugal', 'Delantero'),
(18, 'Antoine Griezmann', 31, 'Francia', 'Delantero'),
(19, 'Raheem Sterling', 29, 'Inglaterra', 'Delantero'),
(20, 'Harry Kane', 29, 'Inglaterra', 'Delantero');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla carreras
--
ALTER TABLE carreras
  ADD PRIMARY KEY (id),
  ADD KEY idJugador (idJugador),
  ADD KEY idEquipo (idEquipo);

--
-- Indices de la tabla equipos
--
ALTER TABLE equipos
  ADD PRIMARY KEY (id);

--
-- Indices de la tabla jugadores
--
ALTER TABLE jugadores
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla carreras
--
ALTER TABLE carreras
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla equipos
--
ALTER TABLE equipos
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla jugadores
--
ALTER TABLE jugadores
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

ALTER TABLE carreras
  ADD CONSTRAINT carreras_ibfk_1 FOREIGN KEY (idJugador) REFERENCES jugadores (id),
  ADD CONSTRAINT carreras_ibfk_2 FOREIGN KEY (idEquipo) REFERENCES equipos (id);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
FUNCIONES DE AGRUPACIÓN:
- COUNT(*)
- COUNT(columna)
- COUNT(DISTINCT(columna))
- MAX(columna)
- MIN(columna)
- AVG(columna)

FUNCIONES:
- CHAR_LENGTH(columna)
- LENGTH(columna)
- CONCAT(columna1, columna2, ... , columnaN)
- CONCAT_WS(columna1, separador, columna2, separador..., columnaN)
- LOWER(columna)
- UPPER(columna)
- FLOOR(columna)
- ROUND(columna)
- DAY(columna)
- MONTH(columna)
- YEAR(columna)
Sabiendo que estas carreras no se adecúan a la realidad, haz los siguientes ejercicios:

*/

1. Muestra la información de los equipos en los que haya jugado Lionel Messi.

SELECT nombre
FROM carrerafutbol.equipos
WHERE id IN (
	SELECT idEquipo
    FROM carreras
    WHERE idjugador = (
		SELECT id
        FROM jugadores
        WHERE nombre LIKE "lionel Messi"));

2. Muestra en cuántos equipos ha jugado a lo largo de su carrera cada idJugador.

SELECT idJugador, count(DISTINT(ideuipo)) AS "equipos distintos"	
FROM carrerafutbol.carreras
GROUP BY idJugador;

3. Muestra cuál es el jugador más veterano de nuestra base de datos.

SELECT *
FROM jugadores
WHERE edad = (
	SELECT max(edad)
    FROM jugadores);

4. Muetra en una única consulta, en 3 columnas, la edad del jugador más joven, 
la del jugador más veterano y la media de edad de todos los jugadores.

SELECT min(EDAD), max(EDAD), avg(EDAD)
FROM carrerafutbol.jugadores;

5. Muestra los jugadores que ficharon en algún momento por el Real Madrid.
SELECT *
FROM jugadores
WHERE id IN (
  SELECT idJugador
  FROM carrerafutbol.carreras
  WHERE idEquipo = (
    SELECT id
    FROM equipos
    WHERE nombre LIKE "real madrid"
    )
  );

6. Muestra la información de los jugadores que ficharon por algún equipo de la ciudad de Estambul.
select id
from jugadores
WHERE id IN(
  SELECT *
  FROM carreras
  WHERE idequipo IN (
    SELECT id
    FROM equipos
    WHERE ciudad LIKE "estambul"
    )
  )

7. Muestra la información de los jugadores cuyo nombre contiene más de 6 caracteres.

SELECT *
FROM carrerafutbol.jugadores
WHERE CHAR_LENGTH(nombre) > 6;


8. Muestra la información de los jugadores cuyo nombre y apellidos tiene menos de 25 caracteres.

SELECT *
FROM carrerafutbol.jugadores
WHERE CHAR_LENGTH(nombre) < 25;

9. Muestra los ids de los jugadores que abandonaron su equipo en el segundo semestre de cualquier año.
SELECT *
FROM jugadores
WHERE id = (
  SELECT DISTINT id
  FROM carreras
  WHERE MONTH(fechafin) BETWEEN 6 AND 12
  );

10. Muestra los jugadores que NO han terminado su carrera.

SELECT idJugador
FROM carrerafutbol.carreras
WHERE fechaFin IS NULL;

11. Muestra la información de los equipos que tienen jugadores que NO han terminado su carrera.

SELECT * 
FROM jugadores
WHERE id in(
  SELECT idjugador
  FROM carreras
  WHERE fechafin is null);


12. Muestra cuántos jugadores ficharon por algún equipo en el año 2020.

SELECT COUNT(DISTINCT(idjugador)) AS "Fichajes2020"
FROM carreras
WHERE YEAR(fechainicio) = 2020;

13. Muestra cuántos id de jugadores hay en cada id de equipo de nuestra base de datos.

SELECT idEquipo, COUNT(*) AS "NºJugadores"
FROM carreras
GROUP BY idEquipo

SELECT COUNT(DISTINCT(idjugador)),idequipo
FROM carreras
GROUP BY idequipo;


14. Muestra cuántos jugadores de nuestra base de datos jugaron en más de 2 equipos a lo largo de su carrera.

SELECT COUNT(DISTINCT(idEquipo)) AS "numEquipos" ,idJugador
FROM carreras
GROUP BY idJugador
HAVING numEquipos > 2;


15. Muestra el nombre de los equipos que tienen más de 2 jugadores en nuestra base de datos.

SELECT COUNT(DISTINCT(idJug)) AS "numJug" ,idEquipos
FROM carreras
GROUP BY idJugador
HAVING numJug > 2;


SELECT COUNT(DISTINCT(idJugador)) AS "numJugadores", equipos.nombre
FROM carreras inner join equipos ON carreras.idEquipo = equipos.id
GROUP BY carreras.idequipo
HAVING numJugadores > 2



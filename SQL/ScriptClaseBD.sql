-- ********** PARA CONECTARSE AL SERVIDOR **********--
mysql -u root -p
Enter password: ****

-- ********** CREATE ********** --

--CREAR UNA BASE DE DATOS--
CREATE DATABASE nombreBD;
USE nombreBD;

-- MOSTRAR BASES DE DATOS --
SHOW DATABASE;

CREATE DATABASE aviones;

-- SELECIONAR BASE DE DATOS --
USE aviones;

-- CREAR TABLA --
CREATE TABLE aviones ( 
    id INT(1) PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(25) NOT NULL, 
    fechaCreacion INT(4) NULL, 
    asientos INT(3) NULL 
);

-- MOSTRAR TABLAS --
SHOW TABLES;

-- VER CONTENIDO DE LA TABLA -- 
DESCRIBE aviones;

CREATE TABLE pilotos (
    id INT(1) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    apellido1 VARCHAR(55) NOT NULL,
    apellido2 VARCHAR(55) NULL,
    telefono INT(13) NULL,
    email VARCHAR(255) NOT NULL
);

DESCRIBE pilotos;

-- PARA ACTUALIZAR TABLAS --
ALTER TABLE;

-- PARA AÑADIR COLUMNA (TINYINT) --
ALTER TABLE pilotos
ADD COLUMN tipoPiloto BOOLEAN NOT NULL;

-- PARA ELIMINAR COLUMNA --
    ALTER TABLE pilotos
    DROP COLUMN tipoPiloto;

-- PARA MODIFICAR UNA COLUMNA --
ALTER TABLE pilotos
MODIFY COLUMN telefono INT(14) NOT NULL;

-- RENOMBRAR COLUMNA --
ALTER TABLE pilotos
RENAME COLUMN telefono TO tlf;

-- PARA INSERTAR DATOS --
INSERT INTO pilotos (nombre, apellido1, apellido2, tlf, email)
VALUES ("Alberto", "Silva", NULL, 0034687765493, "albertito@gmail.com");

-- VER DATOS --
SELECT *
FROM pilotos;

-- EL CAMPO DE TLF TIENE UN NÚMERO DIFERENTE PORQUE CON "INT" NO SIRVE PARA TANTOS DÍGITOS --

ALTER TABLE pilotos
MODIFY COLUMN tlf BIGINT NOT NULL;

-- ACTUALIZAR DATOS --
UPDATE pilotos
SET tlf= 0034687765493
WHERE id = 1;

-- HACEMOS MÁS INSERTS --
INSERT INTO pilotos (nombre, apellido1, apellido2, tlf, email)
VALUES ("Juan Manuel", "Pérez", "González", 0034565666765, "lococonalas@gmail.com");
INSERT INTO pilotos (nombre, apellido1, apellido2, tlf, email)
VALUES ("Marcos", "Caamaño", "Pérez", 0034676543223, "caamaño@hotmail.com");

-- INSERCCIONES MÚLTIPLES --
INSERT INTO pilotos (nombre, apellido1, apellido2, tlf, email)
VALUES ("Pedro", "González", "García", 0034678787765, "losgarcia@gmail.com"),
("Jesús", "Nazaret", NULL, 0034687765666, "HEAVEANSdoor@gmail.com"),
("Mario", "Bros", NULL, 0034655436678, "fontaneriamario@gmail.com");

-- BORRAR REGISTROS DE UNA TABLA --
-- DELETE
-- FROM nombreTabla
-- WHERE col=valor;
DELETE 
FROM pilotos
WHERE id = 5;

INSERT INTO pilotos (nombre, apellido1, apellido2, tlf, email)
VALUES ("Satán", "Lucifer", NULL, 0034657987666, "calentitoelinfierno@hotmail.com");

ALTER TABLE pilotos 
MODIFY COLUMN id INT(3) PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE pilotos 
MODIFY COLUMN id INT(3);

/*  1
    CREAR UNA TABLA AVIONES FORMADA POR LAS SIGUIENTES COLUMNAS;
    id INT(3) PK AI,
    nombre VARCHAR(25) NN,
    reaccion TINYINT(1) NN,
    combate tinyint(1) nn,
    velocidadMaxima DECIMAL(5,2) NN;
*/

CREATE TABLE aviones (
    id INT(3) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    reaccion TINYINT(1) NOT NULL,
    combate TINYINT(1) NOT NULL,
    velocidadMaxima DECIMAL(5,2) NOT NULL
);

/*  2
    Inserta los siguientes aviones;
    BOEING 747, 1, 0, 777.20
    F 55, 1, 1, 999.99
    EURO FIGHTER, 1, 1, 999.99
    avion de papel, 0, 0, 1.00
    AIRBUS 333, 1, 0, 566.77
*/

INSERT INTO aviones (nombre, reaccion, combate, velocidadMaxima)
VALUES ("BOEING 747", 1, 0, 777.20),
("F 55", 1, 1, 999.99),
("EURO FIGHTER", 1, 1, 999.99),
("avion de papel", 0, 0, 1.00),
("AIRBUS 333", 1, 0, 566.77);

-- Nueva base de datos "LIGAFC" --

CREATE DATABASE LIGAFC;

USE LIGAFC

CREATE TABLE equipos(
    nombre VARCHAR(155) NOT NULL,
    localidad VARCHAR(55) NOT NULL,
    estadio VARCHAR(155) NOT NULL,
    presupuesto BIGINT(10) NOT NULL,
    campeon TINYINT(1) NOT NULL
);

INSERT INTO equipos (nombre, localidad, estadio, presupuesto, campeon)
VALUES ("FCBARCELONA", "BARCELONA", "SPOTIFY CAMP NOU", 300000000, 1),
("RMADRID", "MADRID", "SANTIAGO BERNABEU", 500000000, 1),
("RSOCIEDAD", "SAN SEBASTIAN", "REALE ARENA", 60000000, 1),
("ATHLETIC DE BILBAO", "BILBAO", "SAN MAMÉS", 90000000, 1),
("RBETIS", "SEVILLA", "BENITO VILLAMARÍN", 6000000, 0),
("ATLÉTICO DE MADRID", "MADRID", "WANDA STADIUM", 250000000, 1),
("OSASUNA", "PAMPLONA", "EL SADAR", 30000000, 0),
("VILLARREAL", "VILLARREAL", "ESTADIO DE LA CERÁMICA", 50000000, 0),
("RAYO VALLECANO", "MADRID", "VALLECAS", 15000000, 0),
("MALLORCA", "MALLORCA", "SAN MOIX", 20000000, 0),
("VALLADOLID", "VALLADOLID", "ZORRILLA", 15000000, 0),
("VALENCIA", "VALENCIA", "MESTALLA", 100000000, 1),
("GIRONA", "GIRONA", "MONTILIVI", 15000000, 0),
("ALMERÍA", "ALMERÍA", "JUEGOS DEL MEDITERRÁNEO", 25000000, 0),
("GETAFE", "GETAFE", "ALFONSO PÉREZ", 25000000, 0),
("ESPANYOL", "BARCELONA", "RCDE STADIUM", 30000000, 0),
("SEVILLA", "SEVILLA", "SÁNCHEZ PIZJUÁN", 99000000, 1),
("CELTA", "VIGO", "BALAÍDOS", 40000000, 0),
("CÁDIZ", "CÁDIZ", "NUEVO MIRANDILLA", 15000000, 0),
("ELCHE", "ELCHE", "MARTÍNEZ VALERO", 9000000, 0);

ALTER TABLE equipos 
ADD COLUMN id INT(10) AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE equipos
RENAME COLUMN localidad TO ciudad;

CREATE TABLE estadios (
    id INT(2) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    capacidad BIGINT(7) NOT NULL
);

INSERT INTO estadios (nombre, capacidad) 
VALUES
("SPOTIFY CAMP NOU", 110000),
("SANTIAGO BERNABEU", 99000),
("REALE ARENA", 55000),
("SAN MAMÉS", 55000),
("BENITO VILLAMARÍN", 40000),
("WANDA STADIUM", 75000),
("EL SADAR", 30000),
("ESTADIO DE LA CERÁMICA", 25000),
("VALLECAS", 20000),
("SAN MOIX", 15000),
("ZORRILLA", 18000),
("MESTALLA", 55000),
("MONTILIVI", 17000),
("JUEGOS DEL MEDITERRÁNEO", 18000),
("ALFONSO PÉREZ", 21000),
("RCDE STADIUM", 25000),
("SÁNCHEZ PIZJUÁN", 60000),
("BALAÍDOS", 19000),
("NUEVO MIRANDILLA", 12000),
("MARTÍNEZ VALERO", 11000);

ALTER TABLE equipos
MODIFY COLUMN campeon TINYINT(1) NOT NULL AFTER nombre;

DROP TABLE equipos;

CREATE TABLE equipos (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(155) NOT NULL,
    campeon TINYINT(1) NOT NULL,
    ciudad VARCHAR(55) NOT NULL,
    estadio VARCHAR(155) NOT NULL,
    presupuesto BIGINT(10) NOT NULL
);

INSERT INTO equipos (nombre, campeon, ciudad, estadio, presupuesto)
VALUES
("F.C.BARCELONA", 1, "BARCELONA", "SPOTIFY CAMP NOU", 300000000),
("R.MADRID", 1, "MADRID", "SANTIAGO BERNABEU", 500000000),
("R.SOCIEDAD", 1, "SAN SEBASTIAN", "REALE ARENA", 60000000),
("ATHLETIC DE BILBAO", 1, "BILBAO", "SAN MAMÉS", 90000000),
("R.BETIS", 0, "SEVILLA", "BENITO VILLAMARÍN", 6000000),
("ATLÉTICO DE MADRID", 1, "MADRID", "WANDA STADIUM", 250000000),
("OSASUNA", 0, "PAMPLONA", "EL SADAR", 30000000),
("VILLARREAL", 0, "VILLARREAL", "ESTADIO DE LA CERÁMICA", 50000000),
("RAYO VALLECANO", 0, "MADRID", "VALLECAS", 15000000),
("MALLORCA", 0, "MALLORCA", "SAN MOIX", 20000000),
("VALLADOLID", 0, "VALLADOLID", "ZORRILLA", 15000000),
("VALENCIA", 1, "VALENCIA", "MESTALLA", 100000000),
("GIRONA", 0, "GIRONA", "MONTILIVI", 15000000),
("ALMERÍA", 0, "ALMERÍA", "JUEGOS DEL MEDITERRÁNEO", 25000000),
("GETAFE", 0, "GETAFE", "ALFONSO PÉREZ", 25000000),
("ESPANYOL", 0, "BARCELONA", "RCDE STADIUM", 30000000),
("SEVILLA", 1, "SEVILLA", "SÁNCHEZ PIZJUÁN", 99000000),
("CELTA", 0, "VIGO", "BALAÍDOS", 40000000),
("CÁDIZ", 0, "CÁDIZ", "NUEVO MIRANDILLA", 15000000),
("ELCHE", 0, "ELCHE", "MARTÍNEZ VALERO", 9000000);

CREATE TABLE ligas (
    id INT(2) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(155) NOT NULL,
    pais VARCHAR(55) NOT NULL
);

INSERT INTO ligas (nombre, pais) 
VALUES
("LIGA BBVA", "ESPAÑA"),
("PREMIER", "INGLATERRA"),
("CALCIO", "ITALIA"),
("MLS", "EEUU"),
("LIGUE 1", "FRANCIA");

ALTER TABLE equipos 
MODIFY COLUMN presupuesto DECIMAL(12,2) NOT NULL;

-- CREAMOS DATABASES MUSICA --

CREATE DATABASE musica;

USE musica

CREATE TABLE grupos (
    idGrupo INT(2) NOT NULL,
    nombre VARCHAR(55) NOT NULL,
    integrantes INT(2) NOT NULL,
    fechaCreacion DATE NOT NULL,
    genero VARCHAR (55) NOT NULL,
    activo TINYINT(1) NOT NULL
);

CREATE TABLE discografica (
    idDiscografica INT(2) NOT NULL,
    nombre VARCHAR(55) NOT NULL
);

CREATE TABLE festivales (
    idFestivales INT(2) NOT NULL,
    nombre VARCHAR(55) NOT NULL,
    actuaciones INT(2) NOT NULL,
    precioEntrada INT(4) NOT NULL
);

---------------------------------------------


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


-------------------------------------------

1.

CREATE DATABASE examensuenhosdb;

USE examensuenhosdb;

CREATE TABLE familiares (
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    parentesco VARCHAR(20) NOT NULL
);

CREATE TABLE suenhos (
    tiposuenho ENUM("SUEÑO", "PESADILLA"),
    duracionsuenho INT(2) NOT NULL,
    protagonista TINYINT(1) NOT NULL
);

INSERT INTO familiares (nombre, apellido, parentesco) VALUES
("Oana", "Vázquez", "prima"),
("Martin", "Vázquez", "padre"),
("María", "López", "madre");

INSERT INTO suenhos (tiposuenho, duracionsuenho, protagonista) VALUES
("SUEÑO", 1, 1),
("SUEÑO", 2, 1),
("PESADILLA",1,0),
("PESADILLA",3,1),
("SUEÑO", 2, 1),
("PESADILLA",2,1);



2. 

ALTER TABLE familiares
ADD COLUMN id INT(2) PRIMARY KEY AUTO_INCREMENT FIRST; --NO HACIA FALTA EL "FIRST"

ALTER TABLE suenhos
ADD COLUMN id INT(2) PRIMARY KEY AUTO_INCREMENT FIRST;

3. 

SELECT *
FROM familiares
WHERE apellido LIKE "_A%EZ";

4. 
SELECT *
FROM suenhos
WHERE protagonista = 0;

5. 
SELECT *
FROM familiares
WHERE nombre LIKE "oana" OR parentesco = "MADRE";

SELECT *
FROM familiares
WHERE nombre LIKE "oana" OR parentesco LIKE "MADRE";

6. 
ALTER TABLE familiares
ADD COLUMN edad INT(3) AFTER apellido;

7.
ALTER TABLE familiares
DROP COLUMN parentesco;

8.
-- HAY QUE CAMBIAR EL NOMBRE DE LA COLUMNA Y SU TIPO DE DATO EN UNA OPERACION => CHANGE --
--RENAME => SOLO RENOMBRA--
--MODIFY => SOLO CAMBIA EL TIPO DE DATO, O SU LONGITUD, O LOS EXTRAS, O TODO ESTO --
--CHANGE => HACE UN RENAME Y UN MODIFY --

ALTER TABLE suenhos
CHANGE COLUMN tiposuenho suenhoPesadilla VARCHAR(10) NOT NULL;


-- EN CASO DE TENER DE INICIO EL VARCHAR --
ALTER TABLE suenhos
CHANGE COLUMN tiposuenho suenhoPesadilla ENUM("SUEÑO", "PESADILLA") NOT NULL;

9. 
SELECT *
FROM suenhos
WHERE suenhoPesadilla = "PESADILLA" AND duracionsuenho IN(1,2,3,6) AND protagonista = 1;

10.

-- PARA RELACIONAR LAS TABLAS, en el enunciado nos dice que cada sueño será único de cada familiar --
-- cada familiar tendrá más de 1 sueño --
-- 1:N => creando columna --
-- en la tabla que tenga el 1 de la cardinalidad, es decir, un sueño, solo tendrá un dueño (familiar)--

ALTER TABLE suenhos
ADD COLUMN idFamiliar INT(2) NOT NULL;

UPDATE suenhos
SET idFamiliar = 1
WHERE id IN(1,2);

UPDATE suenhos
SET idFamiliar = 2
WHERE id IN(3,4);

UPDATE suenhos
SET idFamiliar = 3
WHERE id IN(5,6);

ALTER TABLE suenhos
ADD CONSTRAINT idSuenhosToFamiliaresFK FOREIGN KEY(idFamiliar) REFERENCES familiares(id);

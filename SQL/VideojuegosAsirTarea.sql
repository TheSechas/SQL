--Imaginemos que somos propietarios de una tienda de videojuegos en línea y queremos gestionar nuestro inventario y las transacciones de los clientes. 
--Para ello, necesitamos crear una base de datos que almacene información sobre los videojuegos y las consolas que tenemos disponibles, así como los clientes y sus compras. 
--Además, queremos mantener un registro de las reseñas que los clientes dejan sobre los juegos que han comprado.

--La base de datos deberá contener al menos dos tablas intermedias que formen parte de relaciones N:M. 
--Por ejemplo, una tabla que relacione los clientes con los juegos que han comprado y otra tabla que relacione los juegos con las consolas en las que están disponibles. 
--La tabla de interacción entre clientes y juegos podría almacenar información como la fecha de compra o la calificación que el cliente ha dado al juego.

--Además, necesitaremos una relación 1:N entre las tablas de clientes y compras, ya que un cliente puede realizar múltiples compras pero cada compra está asociada a un único cliente.

--Una vez creada la base de datos, insertaremos datos de muestra para simular el inventario de la tienda, las compras de los clientes y las reseñas de los juegos.


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2024 at 11:25 AM
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
-- Database: `videojuegosasir`
--

CREATE DATABASE IF NOT EXISTS `videojuegosasir`;

USE `videojuegosasir`;


-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
    `id_cliente` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(55) NOT NULL,
    `email` varchar(100) NOT NULL,
    PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`) VALUES
(1, 'Juan García', 'juan@gmail.com'),
(2, 'María Seoane', 'maria@gmail.com'),
(3, 'Andrés Alguacil', 'andres@gmail.com'),
(4, 'Guille Millet', 'guille@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
    `id_compra` int NOT NULL AUTO_INCREMENT,
    `id_cliente` int NOT NULL,
    `fecha_compra` date NOT NULL,
    PRIMARY KEY (`id_compra`),
    KEY `idClientesTOclientesFK` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `compras`
--

INSERT INTO `compras` (`id_compra`, `id_cliente`, `fecha_compra`) VALUES
(1, 1, '2024-02-02'),
(2, 2, '2024-02-07'),
(3, 3, '2024-02-05'),
(4, 4, '2024-02-09');

-- --------------------------------------------------------

--
-- Table structure for table `compras_juegos`
--

DROP TABLE IF EXISTS `compras_juegos`;
CREATE TABLE IF NOT EXISTS `compras_juegos` (
    `id_compra` int NOT NULL,
    `id_juego` int NOT NULL,
    `cantidad` int NOT NULL,
    KEY `idComprasTOcomprasFK` (`id_compra`),
    KEY `idJuegosTOjuegosFK` (`id_juego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `compras_juegos`
--

INSERT INTO `compras_juegos` (`id_compra`, `id_juego`, `cantidad`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `consolas`
--

DROP TABLE IF EXISTS `consolas`;
CREATE TABLE IF NOT EXISTS `consolas` (
    `id_consola` int NOT NULL AUTO_INCREMENT,
    `nombre` enum('PS5','XBOX ONE','PC','NINTENDO SWITCH') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `fabricante` enum('SONY','MICROSOFT','NINTENDO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id_consola`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `consolas`
--

INSERT INTO `consolas` (`id_consola`, `nombre`, `fabricante`) VALUES
(1, 'PS5', 'SONY'),
(2, 'PC', 'MICROSOFT'),
(3, 'XBOX ONE', 'MICROSOFT'),
(4, 'NINTENDO SWITCH', 'NINTENDO');

-- --------------------------------------------------------

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
CREATE TABLE IF NOT EXISTS `juegos` (
    `id_juego` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `precio` decimal(10,2) NOT NULL,
    `plataforma` enum('PS5','XBOX ONE','PC','NINTENDO SWITCH') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id_juego`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `juegos`
--

INSERT INTO `juegos` (`id_juego`, `nombre`, `precio`, `plataforma`) VALUES
(1, 'The Witcher 3: Wild Hunt', 29.99, 'PC'),
(2, 'The Legend of Zelda: Breath of the Wild', 49.99, 'NINTENDO SWITCH'),
(3, 'The Last Of Us Parte II Remastered', 69.99, 'PS5'),
(4, 'Starfield', 59.99, 'XBOX ONE');

-- --------------------------------------------------------

--
-- Table structure for table `juegos_consola`
--

DROP TABLE IF EXISTS `juegos_consola`;
CREATE TABLE IF NOT EXISTS `juegos_consola` (
    `id_juego` int NOT NULL,
    `id_consola` int NOT NULL,
    KEY `idJuegoTOjuegoFK` (`id_juego`),
    KEY `idConsolaTOconsolaFK` (`id_consola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `juegos_consola`
--

INSERT INTO `juegos_consola` (`id_juego`, `id_consola`) VALUES
(1, 2),
(2, 4),
(3, 1),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `resenhas`
--

DROP TABLE IF EXISTS `resenhas`;
CREATE TABLE IF NOT EXISTS `resenhas` (
    `id_resenha` int NOT NULL AUTO_INCREMENT,
    `id_cliente` int NOT NULL,
    `id_juego` int NOT NULL,
    `calificacion` enum('1 ESTRELLA','2 ESTRELLAS','3 ESTRELLAS','4 ESTRELLAS','5 ESTRELLAS') NOT NULL,
    PRIMARY KEY (`id_resenha`),
    KEY `idClienteTOclientesFK` (`id_cliente`),
    KEY `idJuegoTOjuegosFK` (`id_juego`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `resenhas`
--

INSERT INTO `resenhas` (`id_resenha`, `id_cliente`, `id_juego`, `calificacion`) VALUES
(1, 1, 3, '5 ESTRELLAS'),
(2, 2, 2, '4 ESTRELLAS'),
(3, 3, 1, '3 ESTRELLAS'),
(4, 4, 4, '2 ESTRELLAS');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
    ADD CONSTRAINT `idClientesTOclientesFK` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `compras_juegos`
--
ALTER TABLE `compras_juegos`
    ADD CONSTRAINT `idComprasTOcomprasFK` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    ADD CONSTRAINT `idJuegosTOjuegosFK` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `juegos_consola`
--
ALTER TABLE `juegos_consola`
    ADD CONSTRAINT `idConsolaTOconsolaFK` FOREIGN KEY (`id_consola`) REFERENCES `consolas` (`id_consola`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    ADD CONSTRAINT `idJuegoTOjuegoFK` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `resenhas`
--
ALTER TABLE `resenhas`
    ADD CONSTRAINT `idClienteTOclientesFK` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    ADD CONSTRAINT `idJuegoTOjuegosFK` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


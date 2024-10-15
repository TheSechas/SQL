-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ciclismo` DEFAULT CHARACTER SET utf8 ;
USE `ciclismo` ;

-- -----------------------------------------------------
-- Table `mydb`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclismo`.`equipo` (
  `nomeq` VARCHAR(20) NOT NULL,
  `director` VARCHAR(50) NULL,
  PRIMARY KEY (`nomeq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ciclista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclismo`.`ciclista` (
  `dorsal` INT(11) NOT NULL,
  `normal` VARCHAR(50) NULL,
  `edad` INT(11) NULL,
  `nomeq` VARCHAR(20) NULL,
  PRIMARY KEY (`dorsal`),
  CONSTRAINT `ciclistaTOequipo`
    FOREIGN KEY (`nomeq`)
    REFERENCES `ciclismo`.`equipo` (`nomeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `ciclistaTOequipo_idx` ON `ciclismo`.`ciclista` (`nomeq` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`etapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclismo`.`etapa` (
  `netapa` INT(11) NOT NULL,
  `km` INT(11) NULL,
  `salida` VARCHAR(20) NULL,
  `llegada` VARCHAR(20) NULL,
  `dorsal` INT(11) NULL,
  PRIMARY KEY (`netapa`),
  CONSTRAINT `etapaTOciclista`
    FOREIGN KEY (`dorsal`)
    REFERENCES `ciclismo`.`ciclista` (`dorsal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `etapaTOciclista_idx` ON `ciclismo`.`etapa` (`dorsal` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`maillot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclismo`.`maillot` (
  `codigo` VARCHAR(3) NOT NULL,
  `tipo` VARCHAR(20) NULL,
  `color` VARCHAR(20) NULL,
  `premio` INT(11) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`llevar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclismo`.`llevar` (
  `dorsal` INT(11) NOT NULL,
  `netapa` INT(11) NOT NULL,
  `codigo` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`dorsal`, `codigo`, `netapa`),
  CONSTRAINT `llevarTOciclista`
    FOREIGN KEY (`dorsal`)
    REFERENCES `ciclismo`.`ciclista` (`dorsal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llevarTOetapa`
    FOREIGN KEY (`netapa`)
    REFERENCES `ciclismo`.`etapa` (`netapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llevarTOmaillot`
    FOREIGN KEY (`codigo`)
    REFERENCES `ciclismo`.`maillot` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `llevarTOetapa_idx` ON `ciclismo`.`llevar` (`netapa` ASC) VISIBLE;

CREATE INDEX `llevarTOmailto_idx` ON `ciclismo`.`llevar` (`codigo` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`puerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclismo`.`puerto` (
  `nompuerto` VARCHAR(20) NOT NULL,
  `altura` INT(11) NULL,
  `categoria` VARCHAR(1) NULL,
  `pendiente` INT(11) NULL,
  `netapa` INT(11) NULL,
  `dorsal` INT(11) NULL,
  PRIMARY KEY (`nompuerto`),
  CONSTRAINT `puertoTOetapa`
    FOREIGN KEY (`netapa`)
    REFERENCES `ciclismo`.`etapa` (`netapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `puertoTOciclista`
    FOREIGN KEY (`dorsal`)
    REFERENCES `ciclismo`.`ciclista` (`dorsal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `puertoTOetapa_idx` ON `ciclismo`.`puerto` (`netapa` ASC) VISIBLE;

CREATE INDEX `puertoTOciclista_idx` ON `ciclismo`.`puerto` (`dorsal` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO equipo VALUES ('Amore Vita', 'Ricardo Padacci');
INSERT INTO equipo VALUES ('Banesto', 'Miguel Echevarría');
INSERT INTO equipo VALUES ('Bresciali-Refin', 'Pietro Armani');
INSERT INTO equipo VALUES ('Carrera', 'Luigi Petroni');
INSERT INTO equipo VALUES ('Gatorade', 'Gian Luca Pacceli');
INSERT INTO equipo VALUES ('Kelme', 'Álvaro Pino');
INSERT INTO equipo VALUES ('Mapei-Clas', 'Juan Fernández');
INSERT INTO equipo VALUES ('Navigare', 'Lorenzo Sciacci');
INSERT INTO equipo VALUES ('Telecom', 'Morgan Reikacrd');
INSERT INTO equipo VALUES ('TVM', 'Steevens Henk');

INSERT INTO ciclista VALUES (1, 'Miguel Indurain', 21, 'Banesto');
INSERT INTO ciclista VALUES (2, 'Pedro Delgado', 29, 'Banesto');
INSERT INTO ciclista VALUES (3, 'Alex Zulle', 20, 'Navigare');
INSERT INTO ciclista VALUES (4, 'Alessio Di Basco', 30, 'TVM');
INSERT INTO ciclista VALUES (5, 'Armand', 17, 'Amore Vita');
INSERT INTO ciclista VALUES (8, 'Jean Van Poppel', 24, 'Bresciali-Refin');
INSERT INTO ciclista VALUES (9, 'Maximo Podel', 17, 'Telecom');
INSERT INTO ciclista VALUES (10, 'Mario Cipollini', 31, 'Carrera');
INSERT INTO ciclista VALUES (11, 'Eddy Seigneur', 20, 'Amore Vita');
INSERT INTO ciclista VALUES (12, 'Alessio Di Basco', 34, 'Bresciali-Refin');
INSERT INTO ciclista VALUES (13, 'Gianni Bugno', 24, 'Gatorade');
INSERT INTO ciclista VALUES (15, 'Jesús Montoya', 25, 'Amore Vita');
INSERT INTO ciclista VALUES (16, 'Dimitri Konishev', 27, 'Amore Vita');
INSERT INTO ciclista VALUES (17, 'Bruno Lealli', 30, 'Amore Vita');
INSERT INTO ciclista VALUES (20, 'Alfonso Gutiérrez', 27, 'Navigare');
INSERT INTO ciclista VALUES (22, 'Giorgio Furlan', 22, 'Kelme');
INSERT INTO ciclista VALUES (26, 'Mikel Zarrabeitia', 30, 'Carrera');
INSERT INTO ciclista VALUES (27, 'Laurent Jalabert', 22, 'Banesto');
INSERT INTO ciclista VALUES (30, 'Melchor Mauri', 26, 'Mapei-Clas');
INSERT INTO ciclista VALUES (31, 'Per Pedersen', 33, 'Banesto');
INSERT INTO ciclista VALUES (32, 'Tony Rominger', 31, 'Kelme');
INSERT INTO ciclista VALUES (33, 'Stefenao della Sveitia', 26, 'Amore Vita');
INSERT INTO ciclista VALUES (34, 'Clauido Chiapucci', 23, 'Amore Vita');
INSERT INTO ciclista VALUES (35, 'Gian Mateo Faluca', 34, 'TVM');

INSERT INTO etapa VALUES (1, 35, 'Valladolid', 'Ávila', 1);
INSERT INTO etapa VALUES (2, 70, 'Salamanca', 'Zamora', 2);
INSERT INTO etapa VALUES (3, 150, 'Zamora', 'Almendralejo', 1);
INSERT INTO etapa VALUES (4, 330, 'Córdoba', 'Granada', 1);
INSERT INTO etapa VALUES (5, 150, 'Granada', 'Almería', 3);

INSERT INTO puerto VALUES ('Puerto Alfa', 2489, '1', 34, 2, 3);
INSERT INTO puerto VALUES ('Puerto Beta', 2789, '1', 44, 4, 3);
INSERT INTO puerto VALUES ('Puerto Efe', 2500, 'E', 17, 4, 2);
INSERT INTO puerto VALUES ('Puerto Triple', 2500, 'E', 17, 4, 2);
INSERT INTO puerto VALUES ('Puerto Nuevo', 2500, 'a', 17, 4, 1);
INSERT INTO puerto VALUES ('Puerto Otro', 2500, 'E', 17, 4, 1);
INSERT INTO puerto VALUES ('Puerto Uno', 2500, 'E', 23, 1, 2);

INSERT INTO maillot VALUES ('MGE', 'General', 'Amarillo', 1000000);
INSERT INTO maillot VALUES ('MMO', 'Montaña', 'Blanco y rojo', 500000);
INSERT INTO maillot VALUES ('MMS', 'Más sufrido', 'Estrellitas rojas', 400000);
INSERT INTO maillot VALUES ('MMV', 'Metas volantes', 'Rojo', 400000);
INSERT INTO maillot VALUES ('MRE', 'Regularidad', 'Verde', 300000);
INSERT INTO maillot VALUES ('MSE', 'Sprint especial', 'Rosa', 300000);

INSERT INTO llevar VALUES (1, 3, 'MGE');
INSERT INTO llevar VALUES (1, 4, 'MGE');
INSERT INTO llevar VALUES (2, 2, 'MGE');
INSERT INTO llevar VALUES (3, 1, 'MGE');
INSERT INTO llevar VALUES (3, 1, 'MMV');
INSERT INTO llevar VALUES (3, 4, 'MRE');
INSERT INTO llevar VALUES (4, 1, 'MMO');
INSERT INTO llevar VALUES (5, 2, 'MMO');
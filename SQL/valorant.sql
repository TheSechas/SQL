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
CREATE SCHEMA IF NOT EXISTS `valorant` DEFAULT CHARACTER SET utf8 ;
USE `valorant` ;

-- -----------------------------------------------------
-- Table `mydb`.`rangos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valorant`.`rangos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rango` ENUM("HIERRO", "BRONCE", "PLATA", "ORO", "PLATINO", "DIAMANTE", "ASCENDENTE", "INMORTAL", "RADIANT") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valorant`.`jugadores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `edad` INT NOT NULL,
  `rango` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rangoTOtangos`
    FOREIGN KEY (`rango`)
    REFERENCES `valorant`.`rangos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `rangoTOtangos_idx` ON `valorant`.`jugadores` (`rango` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`personajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valorant`.`personajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `rol` ENUM("DUELISTA", "CENTINELA", "CONTROLADOR", "INICIADOR") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mapas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valorant`.`mapas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `tipo` ENUM("DEFENSIVO", "ATACANTE") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`partidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valorant`.`partidas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idjugador` INT NOT NULL,
  `idpersonaje` INT NOT NULL,
  `victoria` TINYINT(1) NOT NULL,
  `mapa` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `idjugadorTOjugadores`
    FOREIGN KEY (`idjugador`)
    REFERENCES `valorant`.`jugadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idpersonajeTOpersonajes`
    FOREIGN KEY (`idpersonaje`)
    REFERENCES `valorant`.`personajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mapaTOmapas`
    FOREIGN KEY (`mapa`)
    REFERENCES `valorant`.`mapas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idjugadorTOjugadores_idx` ON `valorant`.`partidas` (`idjugador` ASC) VISIBLE;

CREATE INDEX `idpersonajeTOpersonajes_idx` ON `valorant`.`partidas` (`idpersonaje` ASC) VISIBLE;

CREATE INDEX `mapaTOmapas_idx` ON `valorant`.`partidas` (`mapa` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

    1. USANDO WORKBENCH, CREA EL DIAGRAMA DE LA BASE DE DATOS Y LA BASE DE DATOS USANDO INGENIERÍA DIRECTA.



    2. MUESTRA LA CATEGORÍA CON LA QUE MÁS JUGADORES HAN GANADO ALGUNA PARTIDA.



    3. ¿CUÁL ES EL JUGADOR QUE MÁS DERROTAS HA SUFRIDO?



    4. ¿CUÁL ES EL MAPA DONDE MÁS VICTORIAS HAN COSECHADO NUESTROS JUGADORES UTILIZANDO UN PERSONAJE DUELISTA?



    5. CREA UNA VISTA EN LA QUE SE MUESTRE CUÁNTAS PARTIDAS HA JUGADO CADA JUGADOR, ASÍ COMO EL NOMBRE DE CADA JUGADOR Y EN UNA CELDA TODOS LOS PERSONAJES CON LOS QUE HA JUGADO.



    6. MUESTRA LOS DATOS DE LOS JUGADORES QUE NO HAYAN JUGADO NINGUNA PARTIDA Y AQUELLOS JUGADORES QUE HAYAN PERDIDO ALGUNA PARTIDA JUGANDO CON ASTRA.




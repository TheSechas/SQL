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
CREATE SCHEMA IF NOT EXISTS `tiendaRopaAsir` DEFAULT CHARACTER SET utf8 ;
USE `tiendaRopaAsir` ;

-- -----------------------------------------------------
-- Table `mydb`.`camisetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`camisetas` (
  `id` INT NOT NULL,
  `codigoProducto` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `material` VARCHAR(155) NOT NULL,
  `talla` ENUM("S", "M", "L", "XL") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `codigoProducto_UNIQUE` ON `tiendaRopaAsir`.`camisetas` (`codigoProducto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`pantalones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`pantalones` (
  `id` INT NOT NULL,
  `codigoProducto` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `talla` ENUM("36", "37", "38", "39", "40", "41", "42", "43") NOT NULL,
  `tipo` ENUM("SKINNY", "SLIM", "REGULAR") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `codigoProducto_UNIQUE` ON `tiendaRopaAsir`.`pantalones` (`codigoProducto` ASC) VISIBLE;

-- -----------------------------------------------------
-- Table `mydb`.`sucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`sucursales` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`calzados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`calzados` (
  `id` INT NOT NULL,
  `codigoProducto` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `talla` ENUM("36", "37", "38", "39", "40", "41", "42", "43") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.` clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `email` VARCHAR(155) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `email_UNIQUE` ON `tiendaRopaAsir`.` clientes` (`email` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`ventas` (
  `id` INT NOT NULL,
  `idSucursal` INT NOT NULL,
  `codigoProducto` VARCHAR(7) NOT NULL,
  `idCliente` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  `metodos` ENUM("TARJETA", "TARJETA REGALO", "BIZUM", "BITCOIN", "REMBOLSO") NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ventasTOsucursales`
    FOREIGN KEY (`idSucursal`)
    REFERENCES `tiendaRopaAsir`.`sucursales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ventasTOcamisetas`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `tiendaRopaAsir`.`camisetas` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ventasTOpantalones`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `tiendaRopaAsir`.`pantalones` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ventasTOcalzados`
    FOREIGN KEY (`codigoProducto`)
    REFERENCES `tiendaRopaAsir`.`calzados` (`codigoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ventasTOclientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `tiendaRopaAsir`.` clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `ventasTOsucursales_idx` ON `tiendaRopaAsir`.`ventas` (`idSucursal` ASC) VISIBLE;

CREATE INDEX `ventasTOcamisetas_idx` ON `tiendaRopaAsir`.`ventas` (`codigoProducto` ASC) VISIBLE;

CREATE INDEX `ventasTOclientes_idx` ON `tiendaRopaAsir`.`ventas` (`idCliente` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`proevedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`proevedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `CIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `CIF_UNIQUE` ON `tiendaRopaAsir`.`proevedores` (`CIF` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`proevedoresSucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendaRopaAsir`.`proevedoresSucursales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idProevedor` INT NOT NULL,
  `idSucursal` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `proevedoresSucursalesTOproevedores`
    FOREIGN KEY (`idProevedor`)
    REFERENCES `tiendaRopaAsir`.`proevedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `proevedoresSucursalesTOsucursales`
    FOREIGN KEY (`idSucursal`)
    REFERENCES `tiendaRopaAsir`.`sucursales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `proevedoresSucursalesTOproevedores_idx` ON `tiendaRopaAsir`.`proevedoresSucursales` (`idProevedor` ASC) VISIBLE;

CREATE INDEX `proevedoresSucursalesTOsucursales_idx` ON `tiendaRopaAsir`.`proevedoresSucursales` (`idSucursal` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

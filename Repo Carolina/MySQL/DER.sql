-- MySQL Script generated by MySQL Workbench
-- Sat May 20 17:02:34 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PRODUCCION_ DIARIA_ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCCION_ DIARIA_ID` (
  `idPRODUCCION_ DIARIA_ID` INT NOT NULL,
  `PRODUCCION_ DIARIA_ID` VARCHAR(45) NULL,
  PRIMARY KEY (`idPRODUCCION_ DIARIA_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTOS` (
  `PRODUCTOS_ID` INT NOT NULL AUTO_INCREMENT,
  `Pan Integral` VARCHAR(45) NOT NULL,
  `Donas` VARCHAR(45) NOT NULL,
  `Cafe` VARCHAR(45) NOT NULL,
  `Masas Secas` VARCHAR(45) NOT NULL,
  `Tortas` VARCHAR(45) NOT NULL,
  `Pan Blanco` VARCHAR(45) NOT NULL,
  `Facturas` VARCHAR(45) NOT NULL,
  `Criollos` VARCHAR(45) NOT NULL,
  `PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID` INT NOT NULL,
  PRIMARY KEY (`PRODUCTOS_ID`, `PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID`),
  CONSTRAINT `fk_PRODUCTOS_PRODUCCION_ DIARIA_ID`
    FOREIGN KEY (`PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID`)
    REFERENCES `mydb`.`PRODUCCION_ DIARIA_ID` (`idPRODUCCION_ DIARIA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PRODUCTOS_PRODUCCION_ DIARIA_ID_idx` ON `mydb`.`PRODUCTOS` (`PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`MATERIA PRIMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MATERIA PRIMA` (
  `INSUMOS_ID` INT NOT NULL,
  `Agua` VARCHAR(45) NOT NULL,
  `Aceite` VARCHAR(45) NOT NULL,
  `Manteca` VARCHAR(45) NOT NULL,
  `Fruta Abrillantada` VARCHAR(45) NOT NULL,
  `Sal` VARCHAR(45) NOT NULL,
  `Dulce de Batata` VARCHAR(45) NOT NULL,
  `Miel` VARCHAR(45) NOT NULL,
  `Harina Integral` VARCHAR(45) NOT NULL,
  `Azuca Negra` VARCHAR(45) NOT NULL,
  `Azucar Blanco` VARCHAR(45) NOT NULL,
  `Frutas Secas` VARCHAR(45) NOT NULL,
  `Huevos` VARCHAR(45) NOT NULL,
  `Chocolates` VARCHAR(45) NOT NULL,
  `Leche` VARCHAR(45) NOT NULL,
  `Cafe` VARCHAR(45) NOT NULL,
  `Harina` VARCHAR(45) NOT NULL,
  `Membrillo` VARCHAR(45) NOT NULL,
  `PRODUCTOS_PRODUCTOS_ID` INT NOT NULL,
  `PRODUCTOS_PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID` INT NOT NULL,
  PRIMARY KEY (`INSUMOS_ID`, `PRODUCTOS_PRODUCTOS_ID`, `PRODUCTOS_PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID`),
  CONSTRAINT `fk_MATERIA PRIMA_PRODUCTOS1`
    FOREIGN KEY (`PRODUCTOS_PRODUCTOS_ID` , `PRODUCTOS_PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID`)
    REFERENCES `mydb`.`PRODUCTOS` (`PRODUCTOS_ID` , `PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_MATERIA PRIMA_PRODUCTOS1_idx` ON `mydb`.`MATERIA PRIMA` (`PRODUCTOS_PRODUCTOS_ID` ASC, `PRODUCTOS_PRODUCCION_ DIARIA_ID_idPRODUCCION_ DIARIA_ID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
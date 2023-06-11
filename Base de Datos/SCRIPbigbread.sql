-- MySQL Script generated by MySQL Workbench
-- Sun Jun 11 12:04:27 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bigbread
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bigbread
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bigbread` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bigbread` ;

-- -----------------------------------------------------
-- Table `bigbread`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigbread`.`ingredientes` (
  `id_ingrediente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ingrediente`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bigbread`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigbread`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `pedido` VARCHAR(255) NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bigbread`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigbread`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bigbread`.`pedidos_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigbread`.`pedidos_has_productos` (
  `pedidos_id` INT NOT NULL,
  `productos_id_producto` INT NOT NULL,
  PRIMARY KEY (`pedidos_id`, `productos_id_producto`),
  INDEX `fk_pedidos_has_productos_productos1_idx` (`productos_id_producto` ASC) VISIBLE,
  INDEX `fk_pedidos_has_productos_pedidos_idx` (`pedidos_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_has_productos_pedidos`
    FOREIGN KEY (`pedidos_id`)
    REFERENCES `bigbread`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_has_productos_productos1`
    FOREIGN KEY (`productos_id_producto`)
    REFERENCES `bigbread`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bigbread`.`ingredientes_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigbread`.`ingredientes_has_productos` (
  `ingredientes_id_ingrediente` INT NOT NULL,
  `productos_id_producto` INT NOT NULL,
  PRIMARY KEY (`ingredientes_id_ingrediente`, `productos_id_producto`),
  INDEX `fk_ingredientes_has_productos_productos1_idx` (`productos_id_producto` ASC) VISIBLE,
  INDEX `fk_ingredientes_has_productos_ingredientes1_idx` (`ingredientes_id_ingrediente` ASC) VISIBLE,
  CONSTRAINT `fk_ingredientes_has_productos_ingredientes1`
    FOREIGN KEY (`ingredientes_id_ingrediente`)
    REFERENCES `bigbread`.`ingredientes` (`id_ingrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredientes_has_productos_productos1`
    FOREIGN KEY (`productos_id_producto`)
    REFERENCES `bigbread`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

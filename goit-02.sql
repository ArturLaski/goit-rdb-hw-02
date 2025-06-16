-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goit-02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goit-02` DEFAULT CHARACTER SET utf8 ;
USE `goit-02` ;

-- -----------------------------------------------------
-- Table `client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-02`.`client` (
  `id` INT NOT NULL,
  `lastname` VARCHAR(45) NULL,
  `firstname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-02`.`order` (
  `id` INT NOT NULL,
  `order_number` INT NULL,
  `order_date` DATE NULL,
  `client_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_order_client` (`client_id`),
  CONSTRAINT `fk_order_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `goit-02`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-02`.`goods` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `order_quantity` INT NULL,
  `order_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_goods_order` (`order_id`),
  CONSTRAINT `fk_goods_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `goit-02`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
PRIMARY
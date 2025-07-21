CREATE SCHEMA IF NOT EXISTS `goit-02` DEFAULT CHARACTER SET utf8;
USE `goit-02`;

-- Clients Table
CREATE TABLE IF NOT EXISTS `client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NOT NULL,
  `client_address` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Orders Table
CREATE TABLE IF NOT EXISTS `order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_number` INT NOT NULL,
  `order_date` DATE,
  `client_id` INT,
  PRIMARY KEY (`id`),
  INDEX `idx_order_client` (`client_id`),
  CONSTRAINT `fk_order_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `client` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Order Details Table
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45),
  `order_quantity` INT,
  `order_id` INT,
  PRIMARY KEY (`id`),
  INDEX `idx_goods_order` (`order_id`),
  CONSTRAINT `fk_goods_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema meta_capstoneproject
-- -----------------------------------------------------
-- Database with exercises from the Coursera course of Meta Capstone project
-- 

-- -----------------------------------------------------
-- Schema meta_capstoneproject
--
-- Database with exercises from the Coursera course of Meta Capstone project
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meta_capstoneproject` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` ;
USE `meta_capstoneproject` ;

-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`Customers` (
  `CustomerID` VARCHAR(25) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`Bookings` (
  `BookingID` VARCHAR(25) NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  `TableNo` INT NOT NULL,
  `DateBooking` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_customer_bookings_customerid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_bookings_customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `meta_capstoneproject`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`Orders` (
  `OrderID` VARCHAR(5) NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_customer_orders_customerid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_orders_customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `meta_capstoneproject`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`Menu` (
  `MenuID` VARCHAR(25) NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_orders_menu_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_menu_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`Staff` (
  `StaffID` VARCHAR(25) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `Staffcol` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL DEFAULT 0,
  PRIMARY KEY (`StaffID`, `FirstName`),
  INDEX `fk_orders_staff_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_staff_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`OrderDeliveryStatus` (
  `OrderStatusID` VARCHAR(25) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  `DeliveryDate` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `fk_orders_orderdeliverystatus_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_orderdeliverystatus_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meta_capstoneproject`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstoneproject`.`MenuItems` (
  `MenuItemsID` VARCHAR(45) NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  `StarterName` VARCHAR(45) NULL,
  `DesertName` VARCHAR(45) NULL,
  `Drinks` VARCHAR(45) NULL,
  `MenuID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemsID`),
  INDEX `fk_menu_menuitems_menuid_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_menu_menuitems_menuid`
    FOREIGN KEY (`MenuID`)
    REFERENCES `meta_capstoneproject`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `BookingID` VARCHAR(25) COLLATE 'utf8mb3_bin' NOT NULL,
  `OrderID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `TableNo` INT NOT NULL,
  `DateBooking` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_order_bookings_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_order_bookings_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`orders` (`OrderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `CustomerID` VARCHAR(25) COLLATE 'utf8mb3_bin' NOT NULL,
  `FirstName` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `LastName` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `PhoneNumber` INT NULL DEFAULT NULL,
  `Email` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `MenuID` VARCHAR(25) COLLATE 'utf8mb3_bin' NOT NULL,
  `MenuName` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `OrderID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `Cuisines` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_orders_menu_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_menu_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`orders` (`OrderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitems` (
  `MenuItemsID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `CourseName` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `StarterName` VARCHAR(45) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `DesertName` VARCHAR(45) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `Drinks` VARCHAR(45) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `MenuID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  PRIMARY KEY (`MenuItemsID`),
  INDEX `fk_menu_menuitems_menuid_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_menu_menuitems_menuid`
    FOREIGN KEY (`MenuID`)
    REFERENCES `meta_capstoneproject`.`menu` (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderdeliverystatus` (
  `OrderStatusID` VARCHAR(25) COLLATE 'utf8mb3_bin' NOT NULL,
  `OrderID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `DeliveryStatus` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `DeliveryDate` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `fk_orders_orderdeliverystatus_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_orderdeliverystatus_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`orders` (`OrderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `OrderID` VARCHAR(5) COLLATE 'utf8mb3_bin' NOT NULL,
  `CustomerID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_customer_orders_customerid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_orders_customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `meta_capstoneproject`.`customers` (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff` (
  `StaffID` VARCHAR(25) COLLATE 'utf8mb3_bin' NOT NULL,
  `FirstName` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `LastName` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `OrderID` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `Staffcol` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `Role` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `Salary` DECIMAL(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`StaffID`, `FirstName`),
  INDEX `fk_orders_staff_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_staff_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`orders` (`OrderID`))
ENGINE = InnoDB;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`ordersview` (`OrderID` INT, `Quantity` INT, `TotalCost` INT);

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `CancelOrder`(IN order_id INT, OUT successdeletion VARCHAR(24) )
BEGIN
	SET SQL_SAFE_UPDATES = 0;
    DELETE FROM Orders WHERE OrderID = CONCAT('O00',order_id) ;
	SET SQL_SAFE_UPDATES = 1;
    SET successdeletion = CONCAT('Order ' ,order_id,' cancelled');
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
SELECT Quantity AS 'Max Quantity in Order'
FROM Orders 
ORDER BY Quantity DESC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `littlelemondb`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`ordersview`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin1`@`%` SQL SECURITY DEFINER VIEW `littlelemondb`.`ordersview` AS select `littlelemondb`.`orders`.`OrderID` AS `OrderID`,`littlelemondb`.`orders`.`Quantity` AS `Quantity`,`littlelemondb`.`orders`.`TotalCost` AS `TotalCost` from `littlelemondb`.`orders` where (`littlelemondb`.`orders`.`Quantity` >= 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
CREATE SCHEMA IF NOT EXISTS `LittleLemonDb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `LittleLemonDb` ;

-- -----------------------------------------------------
-- Table `LittleLemonDb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`Customers` (
  `CustomerID` VARCHAR(25) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`Orders` (
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
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`Bookings` (
  `BookingID` VARCHAR(25) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `TableNo` INT NOT NULL,
  `DateBooking` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_order_bookings_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_order_bookings_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`Menu` (
  `MenuID` VARCHAR(25) NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_orders_menu_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_menu_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`Staff` (
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
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`OrderDeliveryStatus` (
  `OrderStatusID` VARCHAR(25) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  `DeliveryDate` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `fk_orders_orderdeliverystatus_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_orderdeliverystatus_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDb`.`MenuItems` (
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
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

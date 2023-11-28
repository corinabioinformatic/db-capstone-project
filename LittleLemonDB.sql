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
-- Schema LittleLemonDB
--
-- Database with exercises from the Coursera course of Meta Capstone project
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` VARCHAR(25) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` VARCHAR(25) NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  `TableNo` INT NOT NULL,
  `DateBooking` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_customers_bookings_customerid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customers_bookings_customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `meta_capstoneproject`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` VARCHAR(5) NOT NULL,
  `BookingID` VARCHAR(45) NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_bookings_orders_bookingid_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_orders_bookingid`
    FOREIGN KEY (`BookingID`)
    REFERENCES `meta_capstoneproject`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` VARCHAR(25) NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `OrderID` VARCHAR(45) NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  `Starters` VARCHAR(45) NULL,
  `Courses` VARCHAR(45) NOT NULL,
  `Drinks` VARCHAR(45) NULL,
  `Desserts` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_orders_menu_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_menu_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `meta_capstoneproject`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
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
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

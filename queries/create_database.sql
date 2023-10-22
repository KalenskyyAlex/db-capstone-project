-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Address` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Deliveries` (
  `DeliveryID` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `EmployeeID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_Deliveries_1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Deliveries_2_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Deliveries_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_db`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Deliveries_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `little_lemon_db`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingSlot` TIME NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNo` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_2_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_db`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `little_lemon_db`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `Discount` DECIMAL(10,2) NULL,
  `MenuItemID` INT NULL,
  `BookingID` INT NULL,
  `DeliveryID` INT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_1_idx` (`MenuItemID` ASC) VISIBLE,
  INDEX `fk_Orders_2_idx` (`DeliveryID` ASC) VISIBLE,
  INDEX `fk_Orders_3_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_4_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `little_lemon_db`.`MenuItems` (`MenuItemID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Orders_2`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `little_lemon_db`.`Deliveries` (`DeliveryID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Orders_3`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_db`.`Bookings` (`BookingID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Orders_4`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_db`.`Customers` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

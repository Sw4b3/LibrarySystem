-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LibraryDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LibraryDB` ;

-- -----------------------------------------------------
-- Schema LibraryDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LibraryDB` DEFAULT CHARACTER SET utf8 ;
USE `LibraryDB` ;

-- -----------------------------------------------------
-- Table `LibraryDB`.`Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LibraryDB`.`Book` ;

CREATE TABLE IF NOT EXISTS `LibraryDB`.`Book` (
  `ISBN` VARCHAR(45) NOT NULL,
  `Title` VARCHAR(50) NULL,
  `Author` VARCHAR(45) NULL,
  `YearPublished` VARCHAR(45) NULL,
  `Edition` VARCHAR(45) NULL,
  `Category` VARCHAR(45) NULL,
  `Publisher` VARCHAR(45) NULL,
  `Copies` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `ALL_DATA` (`ISBN` ASC, `Title` ASC, `Author` ASC, `YearPublished` ASC, `Edition` ASC, `Category` ASC, `Publisher` ASC, `Copies` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryDB`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LibraryDB`.`Customer` ;

CREATE TABLE IF NOT EXISTS `LibraryDB`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `ALL_DATA` (`CustomerID` ASC, `Title` ASC, `FirstName` ASC, `LastName` ASC, `Phone` ASC, `Address` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryDB`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LibraryDB`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LibraryDB`.`Staff` (
  `Username` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `UserPassword` VARCHAR(45) NULL,
  `Active` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryDB`.`BookReserve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LibraryDB`.`BookReserve` ;

CREATE TABLE IF NOT EXISTS `LibraryDB`.`BookReserve` (
  `Ref` VARCHAR(45) NOT NULL,
  `ISBN` VARCHAR(45) NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  `StaffID` VARCHAR(45) NOT NULL,
  `BookingDate` VARCHAR(45) NULL,
  `ReturnDate` VARCHAR(45) NULL DEFAULT 'Not Returned',
  PRIMARY KEY (`Ref`, `ISBN`, `CustomerID`, `StaffID`),
  INDEX `fk_BookReserve_Book_idx` (`ISBN` ASC),
  INDEX `fk_BookReserve_Customer1_idx` (`CustomerID` ASC),
  INDEX `fk_BookReserve_Staff1_idx` (`StaffID` ASC))
ENGINE = InnoDB;

USE `LibraryDB` ;

-- -----------------------------------------------------
-- procedure getBook
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`getBook`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `getBook` ()
BEGIN
SELECT *
FROM Book USE INDEX(ALL_DATA);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getBooking
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`getBooking`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `getBooking` ()
BEGIN
SELECT * FROM BookReserveView;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCustomer
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`getCustomer`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `getCustomer` ()
BEGIN
SELECT *
FROM Customer USE INDEX(ALL_DATA);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertCustomer
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`insertCustomer`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `insertCustomer` ( title VARCHAR(45),firstName VARCHAR(45), lastName VARCHAR(45), phone VARCHAR(45),Address VARCHAR(45))
BEGIN
INSERT INTO customer (Title, FirstName, LastName, Phone, Address)
VALUES (title, firstName,lastName,phone,Address);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertBook
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`insertBook`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `insertBook` (isbn VARCHAR(45), title VARCHAR(45),author VARCHAR(45),yearPublished VARCHAR(45),edition VARCHAR(45),category VARCHAR(45),publisher VARCHAR(45), copies VARCHAR(45))
BEGIN
INSERT INTO book (ISBN, Title, Author, YearPublished, Edition,Category, Publisher,Copies)
VALUES (isbn, title,author,yearPublished,edition,category,publisher, copies);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure updateBook
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`updateBook`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `updateBook` (isbn VARCHAR(45), title VARCHAR(45),author VARCHAR(45),yearPublished VARCHAR(45),edition VARCHAR(45),category VARCHAR(45),publisher VARCHAR(45), copies VARCHAR(45))
BEGIN
	UPDATE book set Title=title, 
    Author=author,
	YearPublished=yearPublished,
	Edition=edition ,
	Category=category ,
	Publisher=publisher,
    Copies=copies 
	WHERE ISBN=isbn;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure updateCustomer
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`updateCustomer`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `updateCustomer` (id VARCHAR(45),title VARCHAR(45),firstName VARCHAR(45), lastName VARCHAR(45), phone VARCHAR(45),Address VARCHAR(45))
BEGIN
	UPDATE Customer set Title=title, 
    FirstName=firstName,
	LastName=lastName,
	Phone=phone ,
	Address=address 
	WHERE CustomerID=id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertUser
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`insertUser`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `insertUser` ( username VARCHAR(45),firstName VARCHAR(45), lastName VARCHAR(45), userPassword VARCHAR(45))
BEGIN
INSERT INTO Staff (Username, FirstName, LastName, userPassword)
VALUES (username, firstName,lastName,userPassword);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure signOut
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`signOut`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `signOut` (username VARCHAR(45))
BEGIN
UPDATE Staff set Active=0 
WHERE Username=username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getUser
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`getUser`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `getUser` ()
BEGIN
	SELECT Username, UserPassword FROM Staff;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure signIn
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`signIn`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `signIn` (username VARCHAR(45), userPassword VARCHAR(45))
BEGIN
UPDATE Staff set Active=1 
WHERE Username=username AND UserPassword=userPassword;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertBookReserve
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`insertBookReserve`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `insertBookReserve` (ref VARCHAR(45), isbn VARCHAR(45),customerID VARCHAR(45),staffID VARCHAR(45),bookingDate VARCHAR(45))
BEGIN
INSERT INTO bookReserve (Ref, ISBN,CustomerID,StaffID ,BookingDate)
VALUES (ref, isbn,customerID,staffID ,bookingDate);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getStaff
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`getStaff`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `getStaff` ()
BEGIN
	SELECT * FROM StaffView;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure returnBook
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`returnBook`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `returnBook` (refernce VARCHAR(45), returnDate VARCHAR(45))
BEGIN
UPDATE BookReserve 
SET ReturnDate= current_date()
WHERE Ref=refernce;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure convertMemberToID
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`convertMemberToID`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `convertMemberToID` (fname VARCHAR(45),lname VARCHAR(45))
BEGIN
	SELECT CustomerID 
    FROM Customer
    WHERE FirstName=fname AND LastName=lname;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure convertStaffToID
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`convertStaffToID`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `convertStaffToID` (fname VARCHAR(45),lname VARCHAR(45))
BEGIN
	SELECT Username 
    FROM Staff
    WHERE FirstName=fname AND LastName=lname;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure convertBookToID
-- -----------------------------------------------------

USE `LibraryDB`;
DROP procedure IF EXISTS `LibraryDB`.`convertBookToID`;

DELIMITER $$
USE `LibraryDB`$$
CREATE PROCEDURE `convertBookToID` (bookname VARCHAR(45))
BEGIN
	SELECT ISBN 
    FROM Book
    WHERE Title=bookname;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `LibraryDB`.`StaffView`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `LibraryDB`.`StaffView` ;
USE `LibraryDB`;
CREATE  OR REPLACE VIEW `StaffView` AS
SELECT FirstName, LastName, Active
FROM Staff;

-- -----------------------------------------------------
-- View `LibraryDB`.`BookReserveView`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `LibraryDB`.`BookReserveView` ;
USE `LibraryDB`;
CREATE  OR REPLACE VIEW `BookReserveView` AS
SELECT Ref, ISBN, CustomerID, BookingDate, ReturnDate
FROM bookreserve;
USE `LibraryDB`;

DELIMITER $$

USE `LibraryDB`$$
DROP TRIGGER IF EXISTS `LibraryDB`.`BookReserve_AFTER_INSERT` $$
USE `LibraryDB`$$
CREATE DEFINER = CURRENT_USER TRIGGER `LibraryDB`.`BookReserve_AFTER_INSERT` AFTER INSERT ON `BookReserve` FOR EACH ROW
BEGIN
UPDATE Book
SET Copies = Copies-1
WHERE Book.ISBN=NEW.ISBN;
END$$


USE `LibraryDB`$$
DROP TRIGGER IF EXISTS `LibraryDB`.`BookReserve_AFTER_UPDATE` $$
USE `LibraryDB`$$
CREATE DEFINER = CURRENT_USER TRIGGER `LibraryDB`.`BookReserve_AFTER_UPDATE` AFTER UPDATE ON `BookReserve` FOR EACH ROW
BEGIN
UPDATE Book
SET Copies = Copies+1
WHERE Book.ISBN=NEW.ISBN;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `LibraryDB`.`Book`
-- -----------------------------------------------------
START TRANSACTION;
USE `LibraryDB`;
INSERT INTO `LibraryDB`.`Book` (`ISBN`, `Title`, `Author`, `YearPublished`, `Edition`, `Category`, `Publisher`, `Copies`) VALUES ('978-0545139700', 'Harry Potter and the Deathly Hallows', 'Rowling', '2009', '1', 'Fantasy', ' Arthur A. Levine Books', '5');
INSERT INTO `LibraryDB`.`Book` (`ISBN`, `Title`, `Author`, `YearPublished`, `Edition`, `Category`, `Publisher`, `Copies`) VALUES ('978-0545139702', 'Lord of the Rings', 'Tolkien', '2008', '3', 'Fantasy', NULL, '2');
INSERT INTO `LibraryDB`.`Book` (`ISBN`, `Title`, `Author`, `YearPublished`, `Edition`, `Category`, `Publisher`, `Copies`) VALUES ('978-0545139745', 'The Da Vinci Code', 'Brown', '2003', '2', 'Mystery', NULL, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `LibraryDB`.`Customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `LibraryDB`;
INSERT INTO `LibraryDB`.`Customer` (`CustomerID`, `Title`, `FirstName`, `LastName`, `Phone`, `Address`) VALUES (1, 'Mr.', 'Andrew', 'Schwabe', '076-387-1862', '32 Canigou Ave, 6 Canigou Mansion, Rondebosch');

COMMIT;


-- -----------------------------------------------------
-- Data for table `LibraryDB`.`Staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `LibraryDB`;
INSERT INTO `LibraryDB`.`Staff` (`Username`, `FirstName`, `LastName`, `UserPassword`, `Active`) VALUES ('AndrewS', 'Andrew', 'Schwabe', 'Passowrd', 0);

COMMIT;


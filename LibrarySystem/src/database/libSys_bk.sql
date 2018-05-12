-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'JK Rowling');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `ISBN` varchar(45) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `AuthorID` int(11) NOT NULL,
  `YearPublished` varchar(45) DEFAULT NULL,
  `Edition` varchar(45) DEFAULT NULL,
  `GenreID` int(11) NOT NULL,
  `PublisherID` int(11) NOT NULL,
  `Copies` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ISBN`,`AuthorID`,`GenreID`,`PublisherID`),
  KEY `ALL_DATA` (`ISBN`,`Title`,`YearPublished`,`Edition`,`Copies`,`PublisherID`,`AuthorID`),
  KEY `fk_Book_Publisher1_idx` (`PublisherID`),
  KEY `fk_Book_Author1_idx` (`AuthorID`),
  KEY `fk_Book_Genre1_idx` (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('978-0545139700','Harry Potter and the Deathly Hallows',1,'2009','1',1,1,'5'),('978-0545139702','Lord of the Rings',1,'2008','3',1,1,'2'),('978-0545139745','The Da Vinci Code',1,'2003','2',1,1,'1');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookreserve`
--

DROP TABLE IF EXISTS `bookreserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookreserve` (
  `Ref` varchar(45) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `CustomerID` varchar(45) NOT NULL,
  `StaffID` varchar(45) NOT NULL,
  `BookingDate` varchar(45) DEFAULT NULL,
  `ReturnDate` varchar(45) DEFAULT 'Not Returned',
  PRIMARY KEY (`Ref`,`ISBN`,`CustomerID`,`StaffID`),
  KEY `fk_BookReserve_Book_idx` (`ISBN`),
  KEY `fk_BookReserve_Customer1_idx` (`CustomerID`),
  KEY `fk_BookReserve_Staff1_idx` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookreserve`
--

LOCK TABLES `bookreserve` WRITE;
/*!40000 ALTER TABLE `bookreserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookreserve` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LibraryDB`.`BookReserve_AFTER_INSERT` AFTER INSERT ON `BookReserve` FOR EACH ROW
BEGIN
UPDATE Book
SET Copies = Copies-1
WHERE Book.ISBN=NEW.ISBN;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LibraryDB`.`BookReserve_AFTER_UPDATE` AFTER UPDATE ON `BookReserve` FOR EACH ROW
BEGIN
UPDATE Book
SET Copies = Copies+1
WHERE Book.ISBN=NEW.ISBN;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `bookreserveview`
--

DROP TABLE IF EXISTS `bookreserveview`;
/*!50001 DROP VIEW IF EXISTS `bookreserveview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookreserveview` AS SELECT 
 1 AS `Ref`,
 1 AS `ISBN`,
 1 AS `CustomerID`,
 1 AS `BookingDate`,
 1 AS `ReturnDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bookview`
--

DROP TABLE IF EXISTS `bookview`;
/*!50001 DROP VIEW IF EXISTS `bookview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookview` AS SELECT 
 1 AS `ISBN`,
 1 AS `Title`,
 1 AS `Col_placeholder1`,
 1 AS `YearPublished`,
 1 AS `Edition`,
 1 AS `(SELECT GenreName FROM genre WHERE genre.GenreID=book.GenreID)`,
 1 AS `Col_placeholder2`,
 1 AS `Copies`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `ALL_DATA` (`CustomerID`,`FirstName`,`LastName`,`Phone`,`Address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Andrew','Schwabe','076-387-1862','32 Canigou Ave, 6 Canigou Mansion, Rondebosch');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetype`
--

DROP TABLE IF EXISTS `employeetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeetype` (
  `TypeID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetype`
--

LOCK TABLES `employeetype` WRITE;
/*!40000 ALTER TABLE `employeetype` DISABLE KEYS */;
INSERT INTO `employeetype` VALUES (1,'Admin'),(2,'Non-Admin');
/*!40000 ALTER TABLE `employeetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `GenreID` int(11) NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Tragedy'),(2,'Fantasy'),(3,'Mythology'),(4,'Adventure'),(5,'Mystery'),(6,'Romance'),(7,'Drama'),(8,'Horror');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `PublisherID` int(11) NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Pearson');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Username` varchar(45) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `UserPassword` varchar(45) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '0',
  `TypeID` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`TypeID`),
  KEY `fk_Staff_EmployeeType1_idx` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('Admin','','','Admin',0,1),('AndrewSchwabe','Andrew','Schwabe','Password',0,1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staffview`
--

DROP TABLE IF EXISTS `staffview`;
/*!50001 DROP VIEW IF EXISTS `staffview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `staffview` AS SELECT 
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Active`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bookreserveview`
--

/*!50001 DROP VIEW IF EXISTS `bookreserveview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookreserveview` AS select `bookreserve`.`Ref` AS `Ref`,`bookreserve`.`ISBN` AS `ISBN`,`bookreserve`.`CustomerID` AS `CustomerID`,`bookreserve`.`BookingDate` AS `BookingDate`,`bookreserve`.`ReturnDate` AS `ReturnDate` from `bookreserve` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bookview`
--

/*!50001 DROP VIEW IF EXISTS `bookview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookview` AS select `book`.`ISBN` AS `ISBN`,`book`.`Title` AS `Title`,(select `author`.`AuthorName` from `author` where (`author`.`AuthorID` = `book`.`AuthorID`)) AS `Col_placeholder1`,`book`.`YearPublished` AS `YearPublished`,`book`.`Edition` AS `Edition`,(select `genre`.`GenreName` from `genre` where (`genre`.`GenreID` = `book`.`GenreID`)) AS `(SELECT GenreName FROM genre WHERE genre.GenreID=book.GenreID)`,(select `publisher`.`PublisherName` from `publisher` where (`publisher`.`PublisherID` = `book`.`PublisherID`)) AS `Col_placeholder2`,`book`.`Copies` AS `Copies` from `book` USE INDEX (PRIMARY) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staffview`
--

/*!50001 DROP VIEW IF EXISTS `staffview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staffview` AS select `staff`.`FirstName` AS `FirstName`,`staff`.`LastName` AS `LastName`,`staff`.`Active` AS `Active` from `staff` where (`staff`.`Username` <> 'Admin') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-12 20:22:18

-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: Bookstore
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bookId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `inventoryAmount` int(11) DEFAULT NULL,
  `publisher` varchar(200) DEFAULT NULL,
  `publicationYear` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `reviewRating` int(11) DEFAULT NULL,
  `photo` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'The Dead Key','D. M. Pulley',22,'Thomas & Mercer','2015','Fiction',11.99,7,'./uploadFiles/dead-key.jpg'),(3,'The Girl on the Train','Paula Hawkins',35,'Riverhead Books','2015','Horror',16.17,7,'./uploadFiles/girl-on-train.png'),(4,'The Alchemist','Paulo Coelho',0,'HarperOne','2006','Fiction',8.92,9,'./uploadFiles/the-alchemist.png'),(6,'The American Sniper','Scott McEwen',2,'Harper','2013','Biography',6.17,8,'./uploadFiles/american-sniper.png'),(8,'The Life-Changing Magic','Marie Kondo',0,'Ten Speed Press','2014','Biography',10.19,4,'./uploadFiles/the-life-changing-magic.png'),(9,'The Purple Door','Samantha Bowers',375,'Penguin Books','1943','Mystery',234,5,'./uploadFiles/bookcover.jpg'),(11,'James Watt','Andrew Carnegie',6,'Scots Publications','2012','Poetry',12,3,'./uploadFiles/James_Watt_book.jpg'),(12,'Cabinet Maker Series','Tom Clancy',10,'Upholsterer\'s Companion','1870','Horror',12,7,'./uploadFiles/covers_stokes.jpg'),(13,'Ethics of Interrogation','Tad Marquez',22,'Lavasoft','2011','Children',7.46,3,'./uploadFiles/an_ethics_of_interrogation.large.jpg'),(14,'Finances','Rylee Jacobs',35,'Microsoft','2008','Poetry',6.85,2,'./uploadFiles/closing_time.large.jpg'),(15,'Media Relations','Zachery Hopkins',35,'Sibelius','2007','Biography',5.66,7,'./uploadFiles/even_silence_has_an_end.large.jpg'),(16,'Quality Assurance','Hu Tucker',8,'Finale','2014','Biography',6.82,5,'./uploadFiles/i_hotel.large.jpg'),(17,'Sales and Marketing','Marah Merritt',24,'Chami','2004','Mystery',5.36,2,'./uploadFiles/stolen_world.large.jpg'),(18,'The Pale King','Fay Aguirre',9,'Microsoft','2012','Horror',6.54,4,'./uploadFiles/the_pale_king_1.large.jpg'),(19,'Wall Street','Salvador Vance',44,'Sibelius','2004','Romance',3.03,8,'./uploadFiles/wall_street.large.jpg'),(20,'Advertising','Adrian Riggs',18,'Finale','2005','Fiction',7.78,7,'./uploadFiles/your_presence_is_requested_at_suvanto.large.jpg'),(21,'Customer Service','Rebekah Vang',6,'Google','2005','Children',7.8,7,'./uploadFiles/the_colossus_of_maroussi.large.jpg'),(22,'Finances','Thor Chan',19,'Adobe','2005','Romance',2.94,2,'./uploadFiles/mr_peanut.large.jpg'),(23,'Pillars of the Earth','Ken Follet',21,'Kingsbridge Publications','1989','Fiction',120,9,'./uploadFiles/us_pillars_of_the_earth_tie_in_2010.jpg'),(24,'Julie of the Wolves','Jean George',15,'Penguin Books','1972','Biography',3,1,'./uploadFiles/386286_1693.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `ratingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `bookId` int(10) unsigned NOT NULL,
  `ratingDate` date NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`ratingId`),
  KEY `userId` (`userId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (100,77,2,'2015-03-01',10),(101,77,3,'2015-03-01',9),(102,77,4,'2015-03-01',10),(103,77,4,'2015-03-01',10),(104,77,2,'2015-03-01',10),(105,77,4,'2015-03-01',10),(106,77,4,'2015-03-01',10),(107,77,4,'2015-03-01',10),(108,77,2,'2015-03-01',1),(109,77,9,'2015-03-03',9),(110,77,2,'2015-03-03',10),(111,77,15,'2015-03-03',7),(112,77,16,'2015-03-03',10),(113,77,14,'2015-03-03',4),(114,77,16,'2015-03-03',6),(115,77,12,'2015-03-03',7),(116,77,20,'2015-03-03',8),(117,77,18,'2015-03-03',5),(118,77,13,'2015-03-03',4),(119,77,17,'2015-03-03',3),(120,77,11,'2015-03-03',1),(121,77,11,'2015-03-03',7),(122,77,19,'2015-03-03',7),(123,77,19,'2015-03-03',8),(124,77,22,'2015-03-03',2),(125,77,2,'2015-03-03',4),(126,77,13,'2015-03-03',3),(127,77,9,'2015-03-03',10),(128,77,21,'2015-03-03',4),(129,77,21,'2015-03-03',7),(130,77,6,'2015-03-03',5),(131,77,6,'2015-03-03',8),(132,77,6,'2015-03-03',10),(133,77,8,'2015-03-03',4),(134,77,8,'2015-03-03',1),(135,77,20,'2015-03-03',9),(136,77,20,'2015-03-03',9),(137,77,20,'2015-03-03',10),(138,77,2,'5559-08-24',10),(139,77,2,'5559-08-24',10),(140,77,2,'2015-03-05',10),(141,77,9,'2015-03-07',3),(142,77,9,'2015-03-07',2),(143,77,9,'2015-03-07',1),(144,100,21,'2015-03-07',7),(145,100,9,'2015-03-07',3),(146,99,23,'2015-03-07',9),(147,99,4,'2015-03-07',6),(148,99,9,'2015-03-07',7),(149,99,11,'2015-03-07',2),(150,99,18,'2015-03-07',4),(151,99,8,'2015-03-07',10),(152,99,16,'2015-03-07',1),(153,99,19,'2015-03-07',10),(154,99,15,'2015-03-07',6),(155,99,3,'2015-03-07',7),(156,99,3,'2015-03-07',7),(157,99,20,'2015-03-07',2),(158,99,6,'2015-03-07',10),(159,101,2,'2015-03-07',3),(160,101,14,'2015-03-07',2),(161,101,21,'2015-03-07',10),(162,101,23,'2015-03-07',10),(163,101,15,'2015-03-07',10),(164,101,4,'2015-03-07',8),(165,99,17,'2015-03-07',2),(166,99,8,'2015-03-07',3),(167,99,14,'2015-03-07',2),(168,99,24,'2015-03-07',1),(169,99,9,'2015-03-07',10),(170,99,24,'2015-03-07',1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transactionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharedTransID` int(10) DEFAULT NULL,
  `transactionDate` date DEFAULT NULL,
  `bookId` int(10) unsigned DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `transactionAmount` double DEFAULT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `userId` (`userId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (66,1,'2015-01-27',2,77,37.08),(67,1,'2014-02-27',3,77,37.08),(68,1,'2013-01-15',4,77,37.08),(70,2,'2015-02-27',2,77,28.16),(110,14,'2015-03-02',2,77,11.99),(111,15,'2013-01-04',4,77,54.45),(112,16,'2013-01-08',2,77,54.45),(113,17,'2013-01-03',2,77,5.55),(114,18,'2015-03-03',9,77,234),(115,19,'2015-03-03',2,77,31.1),(116,19,'2015-03-03',4,77,31.1),(117,19,'2015-01-03',8,77,31.1),(118,20,'2015-03-03',13,77,7.46),(119,21,'2015-01-03',14,77,6.85),(121,23,'2015-03-03',22,77,2.94),(122,24,'2014-06-25',18,77,6.54),(123,25,'2015-03-03',11,77,12),(124,26,'2015-03-03',20,77,7.78),(125,27,'2014-10-29',15,77,24.48),(126,27,'2015-03-03',16,77,24.48),(127,27,'2015-03-03',11,77,24.48),(128,28,'2015-03-03',12,77,31.46),(129,28,'2015-03-03',12,77,31.46),(130,28,'2014-03-03',13,77,31.46),(131,29,'2014-11-11',2,77,11.99),(132,30,'2015-03-03',3,77,250.17),(133,30,'2015-03-03',9,77,250.17),(134,31,'2015-03-03',14,77,6.85),(135,32,'2014-12-25',9,77,234),(136,33,'2015-03-03',6,77,6.17),(137,34,'2015-03-05',12,77,12),(138,35,'2015-03-05',9,77,241.8),(139,35,'2015-03-05',21,77,241.8),(143,38,'2015-03-05',2,97,20.91),(144,38,'2015-03-05',4,97,20.91),(145,39,'2015-03-06',3,77,288.77),(146,39,'2015-03-06',16,77,288.77),(147,39,'2015-03-06',12,77,288.77),(148,39,'2015-03-06',9,77,288.77),(149,39,'2015-03-06',20,77,288.77),(150,39,'2015-03-06',11,77,288.77),(151,40,'2015-03-07',6,77,39.38),(152,40,'2015-03-07',8,77,39.38),(153,40,'2015-03-07',3,77,39.38),(154,40,'2015-03-07',14,77,39.38),(155,41,'2015-03-07',20,80,35.94),(156,41,'2015-03-07',2,80,35.94),(157,41,'2015-03-07',3,80,35.94),(158,42,'2015-03-07',12,80,27.26),(159,42,'2015-03-07',13,80,27.26),(160,42,'2015-03-07',21,80,27.26),(161,43,'2015-03-07',21,100,241.8),(162,43,'2015-03-07',9,100,241.8),(163,44,'2015-03-07',23,99,131.99),(164,44,'2015-03-07',2,99,131.99),(165,45,'2015-03-07',8,99,22.19),(166,45,'2015-03-07',11,99,22.19),(167,46,'2015-03-07',13,99,7.46),(168,47,'2015-03-07',12,99,38.92),(169,47,'2015-03-07',18,99,38.92),(170,47,'2015-03-07',8,99,38.92),(171,47,'2015-03-07',8,99,38.92),(172,48,'2015-03-07',16,99,13.64),(173,48,'2015-03-07',16,99,13.64),(174,49,'2015-03-07',19,99,8.39),(175,49,'2015-03-07',17,99,8.39),(176,50,'2015-03-07',15,99,5.66),(177,51,'2015-03-07',3,99,16.17),(178,52,'2015-03-07',3,99,16.17),(179,53,'2015-03-07',12,99,12),(180,54,'2015-03-07',22,99,2.94),(181,55,'2015-03-07',2,101,18.84),(182,55,'2015-03-07',14,101,18.84),(183,56,'2015-03-07',21,101,7.8),(184,57,'2015-03-07',22,101,2.94),(185,58,'2015-03-07',22,101,2.94),(186,59,'2015-03-07',15,101,19.66),(187,59,'2015-03-07',18,101,19.66),(188,59,'2015-03-07',13,101,19.66),(189,60,'2015-03-07',3,99,16.17),(190,61,'2015-03-07',17,99,239.36),(191,61,'2015-03-07',9,99,239.36),(192,62,'2015-03-07',12,99,12),(193,63,'2015-03-07',14,99,6.85),(194,64,'2015-03-07',24,99,1),(195,65,'2015-03-07',13,99,7.46),(196,66,'2015-03-07',2,99,245.99),(197,66,'2015-03-07',9,99,245.99),(198,67,'2015-03-07',24,99,1),(199,67,'2015-03-07',24,77,1),(200,68,'2015-03-07',24,99,1),(201,69,'2015-03-07',2,99,11.99),(202,70,'2015-03-07',24,99,3),(203,71,'2015-03-07',9,99,234),(204,72,'2015-03-07',23,99,120),(205,73,'2015-03-09',3,77,16.17);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) DEFAULT NULL,
  `lastName` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (77,'Josh','Brunner','joshuaebrunner@gmail.com','password','1993-09-22'),(80,'Kristen','Carlsteen','kristencarlsteen@gmail.com','password','1994-09-14'),(97,'Cole','Goodling','cole@cole.com','password','1956-10-22'),(98,'Tony','Bracher','tonyb@tonyb.com','password','1920-01-12'),(99,'John','Timerland ','johntland@hotmail.com','password1234','1965-09-26'),(100,'Bob','Tamber','bobtamber@me.com','pass123','1970-02-10'),(101,'Kelly','Sanders','kelly_sanders@AOL.com','Ilikedogs7!','1982-07-08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-10 11:27:34

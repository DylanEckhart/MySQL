-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `opleiding`
--

DROP TABLE IF EXISTS `opleiding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opleiding` (
  `opleidingscode` varchar(3) NOT NULL,
  `naam` varchar(30) DEFAULT NULL,
  `niveau` char(1) DEFAULT NULL,
  PRIMARY KEY (`opleidingscode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opleiding`
--

LOCK TABLES `opleiding` WRITE;
/*!40000 ALTER TABLE `opleiding` DISABLE KEYS */;
INSERT INTO `opleiding` VALUES ('AO','ApplicatieOntwikkeling','4'),('DT2','DeskTopPublishing','2'),('DT3','DeskTopPublishing','3'),('IB','ICT Beheerder','4'),('MBI','Medewerker Beheer ICT','3'),('MV','MediaVormgeving','4');
/*!40000 ALTER TABLE `opleiding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentnr` varchar(5) NOT NULL,
  `roepnaam` varchar(10) DEFAULT NULL,
  `voorletters` varchar(10) DEFAULT NULL,
  `tussenvoegsels` varchar(8) DEFAULT NULL,
  `achternaam` varchar(25) DEFAULT NULL,
  `adres` varchar(25) DEFAULT NULL,
  `postcode` varchar(7) DEFAULT NULL,
  `woonplaats` varchar(25) DEFAULT NULL,
  `geslacht` char(1) DEFAULT NULL,
  `telefoon` varchar(11) DEFAULT NULL,
  `geboortedatum` date DEFAULT NULL,
  `uitgeschreven` date DEFAULT NULL,
  `schoolgeld` decimal(6,2) DEFAULT NULL,
  `betaald` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`studentnr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1111','Piet','P','','Pietersen','Pietstraat 2','1111PP','Almere','m','0361234567','1995-02-20',NULL,500.00,500.00),('12345','Timo','T','','Dokter','Tasmaniëstraat 73','1339PA','Almere','m','06-14712859','2004-06-05',NULL,500.00,500.00),('1313','Janneke','J','','Simonsen','Revestraat 2','2222VR','Almere','v','0365467890','1995-04-10',NULL,500.00,200.00),('2121','Ton','A','van','Zetten','Revestraat 44','2121VR','Almere','m','0367654321','1995-12-02',NULL,500.00,500.00),('2222','Jan','J','','Jansen','Janstraat 34','2222JJ','Almere','m','0369876543','1995-11-20','2020-11-17',500.00,500.00),('3232','Annemieke','A','de','Groot','Januaristraat 15','1335RT','Zeewolde','v','0368912765','1995-10-03',NULL,500.00,500.00),('3333','Willem','W','','Willemsen','Willemstraat 45','3333WW','Almere','m','','1998-10-02',NULL,200.00,200.00),('4444','Berend','B','Van Der','Tol','Lotstraat 5','4455BT','Lelystad','m','','1994-04-03','2015-09-06',500.00,0.00),('5555','Cynthia','C','de','Bruin','Almerestraat 10','1553CW','Zeewolde','','0665789431','1996-05-05',NULL,500.00,500.00),('6666','Angelique','A','de','Hoed','Hoedenstraat 12','1663LW','Lelystad','v','0320654378','1998-06-06',NULL,200.00,100.00),('7777','Robert','R','','Robertsen','Mozartstraat 10','1313DE','Almere','m','069876540','1997-02-02',NULL,500.00,250.00);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentopleiding`
--

DROP TABLE IF EXISTS `studentopleiding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentopleiding` (
  `studentnr` varchar(5) DEFAULT NULL,
  `opleidingscode` varchar(3) DEFAULT NULL,
  `startdatum` date DEFAULT NULL,
  `einddatum` date DEFAULT NULL,
  `diploma` tinyint(1) DEFAULT '0',
  KEY `studentnr` (`studentnr`),
  KEY `opleidingscode` (`opleidingscode`),
  CONSTRAINT `studentopleiding_ibfk_1` FOREIGN KEY (`studentnr`) REFERENCES `student` (`studentnr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `studentopleiding_ibfk_2` FOREIGN KEY (`opleidingscode`) REFERENCES `opleiding` (`opleidingscode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentopleiding`
--

LOCK TABLES `studentopleiding` WRITE;
/*!40000 ALTER TABLE `studentopleiding` DISABLE KEYS */;
INSERT INTO `studentopleiding` VALUES ('1111','AO','2015-08-01',NULL,0),('2222','MV','2015-08-01',NULL,0),('3333','DT3','2015-08-01',NULL,0),('4444','DT2','2015-08-01',NULL,0),('5555','MBI','2015-08-01',NULL,0),('6666','IB','2015-08-01',NULL,0),('7777','DT3','2015-09-01',NULL,0),('7777','DT3','2015-09-01',NULL,0);
/*!40000 ALTER TABLE `studentopleiding` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-24 10:40:22

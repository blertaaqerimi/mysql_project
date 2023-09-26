-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: urban_trafic
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buses` (
  `BusID` int NOT NULL AUTO_INCREMENT,
  `BusNumber` varchar(20) NOT NULL,
  `Capacity` int DEFAULT NULL,
  `Manufacturer` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`BusID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (1,'Bus-001',50,'Manufacturer A','Model X',2020),(2,'Bus-002',45,'Manufacturer B','Model Y',2019),(3,'Bus-003',55,'Manufacturer C','Model Z',2021),(4,'Bus-004',60,'Manufacturer D','Model W',2022),(5,'Bus-005',50,'Manufacturer E','Model V',2021),(6,'Bus-006',45,'Manufacturer F','Model U',2020),(7,'Bus-007',55,'Manufacturer G','Model T',2021),(8,'Bus-008',60,'Manufacturer H','Model S',2022),(9,'Bus-009',50,'Manufacturer I','Model R',2020),(10,'Bus-010',55,'Manufacturer J','Model Q',2022),(11,'Bus-011',60,'Manufacturer K','Model P',2021),(12,'Bus-012',50,'Manufacturer L','Model O',2020),(13,'Bus-013',55,'Manufacturer M','Model N',2022),(14,'Bus-014',60,'Manufacturer O','Model M',2021),(15,'Bus-015',50,'Manufacturer P','Model L',2020),(16,'Bus-016',55,'Manufacturer Q','Model K',2022),(17,'Bus-017',60,'Manufacturer R','Model J',2021),(18,'Bus-018',50,'Manufacturer S','Model I',2020),(19,'Bus-019',55,'Manufacturer T','Model H',2022),(20,'Bus-020',60,'Manufacturer U','Model G',2021),(21,'Bus-021',50,'Manufacturer V','Model F',2020);
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busschedule`
--

DROP TABLE IF EXISTS `busschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busschedule` (
  `ScheduleId` int NOT NULL AUTO_INCREMENT,
  `BusId` int DEFAULT NULL,
  `RouteId` int DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `StopID` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleId`),
  KEY `BusId` (`BusId`),
  KEY `RouteId` (`RouteId`),
  KEY `StopID` (`StopID`),
  CONSTRAINT `busschedule_ibfk_1` FOREIGN KEY (`BusId`) REFERENCES `buses` (`BusID`),
  CONSTRAINT `busschedule_ibfk_2` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteID`),
  CONSTRAINT `busschedule_ibfk_3` FOREIGN KEY (`StopID`) REFERENCES `busstops` (`StopID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busschedule`
--

LOCK TABLES `busschedule` WRITE;
/*!40000 ALTER TABLE `busschedule` DISABLE KEYS */;
INSERT INTO `busschedule` VALUES (1,1,1,'08:00:00','09:30:00',1),(2,1,1,'09:30:00','11:00:00',2),(3,2,2,'08:15:00','09:45:00',2),(4,2,2,'09:45:00','11:15:00',3),(5,4,4,'08:30:00','10:00:00',4),(6,4,4,'10:00:00','11:30:00',5),(7,5,5,'08:45:00','10:15:00',5),(8,5,5,'10:15:00','11:45:00',6),(9,6,6,'08:20:00','09:50:00',4),(10,6,6,'09:50:00','11:20:00',6),(11,7,7,'08:15:00','09:45:00',7),(12,7,7,'09:45:00','11:15:00',8),(13,8,8,'08:30:00','10:00:00',8),(14,8,8,'10:00:00','11:30:00',9),(15,9,9,'08:20:00','09:50:00',7),(16,9,9,'09:50:00','11:20:00',9),(17,10,10,'08:30:00','10:00:00',10),(18,10,10,'10:00:00','11:30:00',11),(19,11,11,'08:45:00','10:15:00',11),(20,11,11,'10:15:00','11:45:00',12),(21,12,12,'08:15:00','09:45:00',10),(22,12,12,'09:45:00','11:15:00',12),(23,13,13,'08:15:00','09:45:00',13),(24,13,13,'09:45:00','11:15:00',14),(25,14,14,'08:30:00','10:00:00',14),(26,14,14,'10:00:00','11:30:00',15),(27,15,15,'08:45:00','10:15:00',15),(28,15,15,'10:15:00','11:45:00',13),(29,16,16,'08:30:00','10:00:00',16),(30,16,16,'10:00:00','11:30:00',17),(31,17,17,'08:45:00','10:15:00',17),(32,17,17,'10:15:00','11:45:00',18),(33,18,18,'08:15:00','09:45:00',16),(34,18,18,'09:45:00','11:15:00',18),(35,19,19,'08:30:00','10:00:00',19),(36,19,19,'10:00:00','11:30:00',20),(37,20,20,'08:45:00','10:15:00',20),(38,20,20,'10:15:00','11:45:00',21),(39,21,21,'08:15:00','09:45:00',19),(40,21,21,'09:45:00','11:15:00',21);
/*!40000 ALTER TABLE `busschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busstops`
--

DROP TABLE IF EXISTS `busstops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busstops` (
  `StopID` int NOT NULL AUTO_INCREMENT,
  `StopName` varchar(100) NOT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`StopID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busstops`
--

LOCK TABLES `busstops` WRITE;
/*!40000 ALTER TABLE `busstops` DISABLE KEYS */;
INSERT INTO `busstops` VALUES (1,'Stop 1',42.123456,-71.654321),(2,'Stop 2',42.234567,-71.543210),(3,'Stop 3',42.345678,-71.432109),(4,'Stop 4',42.456789,-71.321098),(5,'Stop 5',42.567890,-71.210987),(6,'Stop 6',42.678901,-71.109876),(7,'Stop 7',42.789012,-71.098765),(8,'Stop 8',42.890123,-70.987654),(9,'Stop 9',42.901234,-70.876543),(10,'Stop 10',42.912345,-70.765432),(11,'Stop 11',42.923456,-70.654321),(12,'Stop 12',42.934567,-70.543210),(13,'Stop 13',42.945678,-70.432109),(14,'Stop 14',42.956789,-70.321098),(15,'Stop 15',42.967890,-70.210987),(16,'Stop 16',42.978901,-70.109876),(17,'Stop 17',42.989012,-69.987654),(18,'Stop 18',42.990123,-69.876543),(19,'Stop 19',42.901234,-69.765432),(20,'Stop 20',42.912345,-69.654321),(21,'Stop 21',42.923456,-69.543210);
/*!40000 ALTER TABLE `busstops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bustrips`
--

DROP TABLE IF EXISTS `bustrips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bustrips` (
  `TripID` int NOT NULL AUTO_INCREMENT,
  `ScheduleID` int DEFAULT NULL,
  `TripDate` date DEFAULT NULL,
  PRIMARY KEY (`TripID`),
  KEY `ScheduleID` (`ScheduleID`),
  CONSTRAINT `bustrips_ibfk_1` FOREIGN KEY (`ScheduleID`) REFERENCES `busschedule` (`ScheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bustrips`
--

LOCK TABLES `bustrips` WRITE;
/*!40000 ALTER TABLE `bustrips` DISABLE KEYS */;
INSERT INTO `bustrips` VALUES (1,1,'2023-09-20'),(2,2,'2023-09-21'),(3,3,'2023-09-22'),(4,4,'2023-09-23'),(5,5,'2023-09-24'),(6,6,'2023-09-25'),(7,7,'2023-09-26'),(8,8,'2023-09-27'),(9,9,'2023-09-28'),(10,10,'2023-09-29'),(11,11,'2023-09-30'),(12,12,'2023-10-01'),(13,13,'2023-10-02'),(14,14,'2023-10-03'),(15,15,'2023-10-04'),(16,16,'2023-10-05'),(17,17,'2023-10-06'),(18,18,'2023-10-07'),(19,19,'2023-10-08'),(20,20,'2023-10-09'),(21,21,'2023-10-10');
/*!40000 ALTER TABLE `bustrips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'John','Doe','john.doe@example.com','123-456-7890'),(2,'Jane','Smith','jane.smith@example.com','987-654-3210'),(3,'Alice','Johnson','alice.johnson@example.com','555-123-4567'),(4,'Bob','Johnson','bob.johnson@example.com','555-987-6543'),(5,'Emily','Davis','emily.davis@example.com','123-789-4560'),(6,'Michael','Smith','michael.smith@example.com','987-123-7890'),(7,'Sarah','Wilson','sarah.wilson@example.com','555-789-1234'),(8,'David','Brown','david.brown@example.com','123-456-7890'),(9,'Linda','Martinez','linda.martinez@example.com','987-654-3210'),(10,'Mark','Anderson','mark.anderson@example.com','555-123-7890'),(11,'Jennifer','Lee','jennifer.lee@example.com','123-789-4560'),(12,'Robert','Taylor','robert.taylor@example.com','987-456-1230'),(13,'Karen','Harris','karen.harris@example.com','555-789-1234'),(14,'Michael','Clark','michael.clark@example.com','123-456-7890'),(15,'Jessica','Brown','jessica.brown@example.com','987-654-3210'),(16,'Eric','Johnson','eric.johnson@example.com','555-123-7890'),(17,'Samantha','Davis','samantha.davis@example.com','123-789-4560'),(18,'Matthew','Smith','matthew.smith@example.com','987-456-1230'),(19,'Liam','Martin','liam.martin@example.com','555-123-7890'),(20,'Olivia','White','olivia.white@example.com','123-789-4560'),(21,'William','Johnson','william.johnson@example.com','987-456-1230');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `RouteID` int NOT NULL AUTO_INCREMENT,
  `RouteName` varchar(100) NOT NULL,
  `Description` text,
  `TotalDistance` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'Route A','Description for Route A',30.50),(2,'Route B','Description for Route B',25.00),(3,'Route C','Description for Route C',35.80),(4,'Route D','Description for Route D',28.30),(5,'Route E','Description for Route E',22.70),(6,'Route F','Description for Route F',33.20),(7,'Route G','Description for Route G',31.40),(8,'Route H','Description for Route H',27.60),(9,'Route I','Description for Route I',35.10),(10,'Route J','Description for Route J',29.80),(11,'Route K','Description for Route K',26.30),(12,'Route L','Description for Route L',34.70),(13,'Route M','Description for Route M',30.10),(14,'Route N','Description for Route N',25.80),(15,'Route O','Description for Route O',32.50),(16,'Route P','Description for Route P',29.30),(17,'Route Q','Description for Route Q',24.60),(18,'Route R','Description for Route R',31.90),(19,'Route S','Description for Route S',28.70),(20,'Route T','Description for Route T',23.20),(21,'Route U','Description for Route U',30.50);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routestops`
--

DROP TABLE IF EXISTS `routestops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routestops` (
  `RouteStopID` int NOT NULL AUTO_INCREMENT,
  `RouteID` int DEFAULT NULL,
  `StopID` int DEFAULT NULL,
  PRIMARY KEY (`RouteStopID`),
  KEY `RouteID` (`RouteID`),
  KEY `StopID` (`StopID`),
  CONSTRAINT `routestops_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`),
  CONSTRAINT `routestops_ibfk_2` FOREIGN KEY (`StopID`) REFERENCES `busstops` (`StopID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestops`
--

LOCK TABLES `routestops` WRITE;
/*!40000 ALTER TABLE `routestops` DISABLE KEYS */;
INSERT INTO `routestops` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,3),(5,3,1),(6,3,3),(7,4,4),(8,4,5),(9,5,5),(10,5,6),(11,6,4),(12,6,6),(13,7,7),(14,7,8),(15,8,8),(16,8,9),(17,9,7),(18,9,9),(19,10,10),(20,10,11),(21,11,11),(22,11,12),(23,12,10),(24,12,12),(25,13,13),(26,13,14),(27,14,14),(28,14,15),(29,15,13),(30,15,15),(31,16,16),(32,16,17),(33,17,17),(34,17,18),(35,18,16),(36,18,18),(37,19,19),(38,19,20),(39,20,20),(40,20,21),(41,21,19),(42,21,21);
/*!40000 ALTER TABLE `routestops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_passenger`
--

DROP TABLE IF EXISTS `trip_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_passenger` (
  `TripPassengerID` int NOT NULL AUTO_INCREMENT,
  `TripID` int NOT NULL,
  `PassengerID` int NOT NULL,
  PRIMARY KEY (`TripPassengerID`),
  UNIQUE KEY `unique_trip_passenger` (`TripID`,`PassengerID`),
  KEY `fk_trip_passenger_passenger` (`PassengerID`),
  CONSTRAINT `fk_trip_passenger_passenger` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`),
  CONSTRAINT `fk_trip_passenger_trip` FOREIGN KEY (`TripID`) REFERENCES `bustrips` (`TripID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_passenger`
--

LOCK TABLES `trip_passenger` WRITE;
/*!40000 ALTER TABLE `trip_passenger` DISABLE KEYS */;
INSERT INTO `trip_passenger` VALUES (85,1,10),(88,1,11),(89,1,12),(87,1,20),(86,1,21),(90,2,1),(91,2,3),(92,2,4),(93,2,5),(98,3,1),(94,3,3),(99,3,10),(96,3,14),(95,3,15),(100,3,16),(97,3,20),(102,4,12),(101,4,19),(103,5,17),(104,5,18),(105,5,19),(106,5,20),(107,6,3),(108,6,5),(110,6,6),(109,6,7),(111,6,9),(112,6,10);
/*!40000 ALTER TABLE `trip_passenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26 18:29:33

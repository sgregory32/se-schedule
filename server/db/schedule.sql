CREATE DATABASE  IF NOT EXISTS `schedule` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schedule`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: schedule
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `id` int NOT NULL AUTO_INCREMENT,
  `degree_type_id` int NOT NULL,
  `year_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_degree_degree_type_id_idx` (`degree_type_id`),
  KEY `fk_degree_year_idx` (`year_id`),
  CONSTRAINT `fk_degree_degree_type_id` FOREIGN KEY (`degree_type_id`) REFERENCES `degree_type` (`id`),
  CONSTRAINT `fk_degree_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,1,1,'Systems Engineering Non-Resident Master\'s (Curriculum 311)'),(2,1,1,'Aviation Systems Engineering Master\'s - USNTPS Grads Only (Curriculum 312)'),(3,1,1,'Systems Engineering Management Master\'s - Systems Integrated Development (Curriculum 711)'),(4,1,1,'Joint Executive Systems Engineering Management Master\'s  - Product Development for 21st Century (Curriculum 721)'),(5,1,1,'Systems Engineering Management Master\'s - Systems & Program Management (Curriculum 722)'),(6,2,1,'Tier I- SE Fundamentals Certificates (Curriculum 282)'),(7,2,1,'Tier II- SE and SEM Core Certificates (Curricula 131 and 171)'),(8,2,1,'Tier III- Domain Specialty Certificates (Curricula 132, 133, 134, 135, 136, 137, 138, 172, 173, 232, 242)'),(9,2,1,'Tier IV- SE and SEM Capstone Certificates (Curricula 130 and 170)'),(10,1,2,'Systems Engineering Non-Resident Master\'s (Curriculum 311)'),(11,1,2,'Aviation Systems Engineering Master\'s - USNTPS Grads Only (Curriculum 312)'),(12,1,2,'Systems Engineering Management Master\'s - Systems Integrated Development (Curriculum 711)'),(13,1,2,'Joint Executive Systems Engineering Management Master\'s  - Product Development for 21st Century (Curriculum 721)'),(14,1,2,'Systems Engineering Management Master\'s - Systems & Program Management (Curriculum 722)'),(15,2,2,'Tier I- SE Fundamentals Certificates (Curriculum 282)'),(16,2,2,'Tier II- SE and SEM Core Certificates (Curricula 131 and 171)'),(17,2,2,'Tier III- Domain Specialty Certificates (Curricula 132, 133, 134, 135, 136, 137, 138, 172, 173, 232, 242)'),(18,2,2,'Tier IV- SE and SEM Capstone Certificates (Curricula 130 and 170)'),(19,1,3,'Systems Engineering Non-Resident Master\'s (Curriculum 311)'),(20,1,3,'Aviation Systems Engineering Master\'s - USNTPS Grads Only (Curriculum 312)'),(21,1,3,'Systems Engineering Management Master\'s - Systems Integrated Development (Curriculum 711)'),(22,1,3,'Joint Executive Systems Engineering Management Master\'s  - Product Development for 21st Century (Curriculum 721)'),(23,1,3,'Systems Engineering Management Master\'s - Systems & Program Management (Curriculum 722)'),(24,2,3,'Tier I- SE Fundamentals Certificates (Curriculum 282)'),(25,2,3,'Tier II- SE and SEM Core Certificates (Curricula 131 and 171)'),(26,2,3,'Tier III- Domain Specialty Certificates (Curricula 132, 133, 134, 135, 136, 137, 138, 172, 173, 232, 242)'),(27,2,3,'Tier IV- SE and SEM Capstone Certificates (Curricula 130 and 170)');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_type`
--

DROP TABLE IF EXISTS `degree_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_type`
--

LOCK TABLES `degree_type` WRITE;
/*!40000 ALTER TABLE `degree_type` DISABLE KEYS */;
INSERT INTO `degree_type` VALUES (1,'Master\'s Degree'),(2,'Stackable Certificates');
/*!40000 ALTER TABLE `degree_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `degree_id` int DEFAULT NULL,
  `curriculum` varchar(64) NOT NULL DEFAULT '',
  `fall` varchar(64) NOT NULL DEFAULT '',
  `winter` varchar(64) NOT NULL DEFAULT '',
  `spring` varchar(64) NOT NULL DEFAULT '',
  `summer` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_detail_degree_idx` (`degree_id`),
  CONSTRAINT `fk_detail_degree` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES (1,1,'Domain Focus','311-221G/O System of Systems','311-222S/O SOS, MBSE, SPM','Cancelled','311-224O DigE, MBSE, STA'),(2,1,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters'),(3,2,'Domain Focus','','','312-223A Aviation Systems',''),(4,2,'#Courses/Duration','','','8 crs, 1 crs/q, 8 quarters',''),(5,3,'Domain Focus','','711-222P Systems Program Management','Cancelled','711-224P  Systems Tech and Advancement'),(6,3,'#Courses/Duration','','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters'),(7,4,'Elective Track','721-221 Various Elective Tracks','','',''),(8,4,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','','',''),(9,5,'Domain Focus','722-221G/P Systems Program Management','','',''),(10,5,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','','',''),(11,6,'#Focus','282-221G/O Advanced SE','282-222S/O Combat Systems','Cancelled','282-224O/P Advanced SE'),(12,6,'#Focus','282-221S Advanced SE','282-222P Advanced SE','',''),(13,6,'#Focus','282-221G/P System Software Engineering','','',''),(14,6,'#Courses/Duration','4 crs, 1 crs/q, 4 quarters','4 crs, 1 crs/q, 4 quarters','4 crs, 1 crs/q, 4 quarters','4 crs, 1 crs/q, 4 quarters'),(15,7,'SE','131-221G/O Systems Capability & Design','131-222S/O Systems Capability & Design','Cancelled','131-224O Systems Capability & Design'),(16,7,'SEM','','171-222P Systems Integrated Develop','Cancelled','171-224P Systems Integrated Develop'),(17,7,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(18,8,'Specialty','','138-222O Digital Engineering ','Cancelled','135-224O Systems Test & Evaluation'),(19,8,'Specialty','','133-222 MBSE*','Cancelled','173-224P Systems Program Management'),(20,8,'Specialty','','','232-223O Lead Systems Integration',''),(21,8,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(22,9,'SE','','130-222O SE Capstone','Cancelled','130-224O SE Capstone'),(23,9,'SEM','','','',''),(24,9,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(25,10,'Domain Focus','311-231G/O System of Systems','311-232O SEI-NWS','311-233O DigE, MBSE, TBD-DDM','311-234O R&ME, SSE, STA'),(26,10,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters'),(27,11,'Domain Focus','','','312-233A Aviation Systems',''),(28,11,'#Courses/Duration','','','8 crs, 1 crs/q, 8 quarters',''),(29,12,'Domain Focus','','711-232P Systems Program Mangement ','711-233P TBD-DDM','711-234P Systems Tech & Advancement'),(30,12,'#Courses/Duration','','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters'),(31,13,'Elective Track','721-231 Various Elective Tracks','','',''),(32,13,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','','',''),(33,14,'Domain Focus','722-231G/P Systems Program Management','','',''),(34,14,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','','',''),(35,15,'#Focus','282-231G/O Systems Software','282-232O/P Combat Systems','282-233O/P Emergent Sys Behavior','282-234O/P Advanced SE'),(36,15,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(37,16,'SE','131-231G/O Systems Capability & Design','131-232O Systems Capability & Design','131-233O Systems Capability & Design','131-234O Systems Capability & Design'),(38,16,'SEM','','171-232P Systems Integrated Develop','171-233P Systems Integrated Develop','171-234P Systems Integrated Develop'),(39,16,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(40,17,'Specialty','132-231G/O System of Systems','132-232S/O System of Systems','134-233* Aviation Sytems','133-234O MBSE'),(41,17,'Specialty','173-231G/P System Program Management','133-232S/O MBSE ','','138-234O DigE'),(42,17,'Specialty','','173-232S/O System Program Management','','172-234P STA'),(43,17,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(44,18,'SE','130-231G/O SE Capstone','130-232O SE Capstone','130-233O SE Capstone','130-234O SE Capstone'),(45,18,'SEM','','170-232P SEM Capstone*','','170-242P SEM Capstone*'),(46,18,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(47,19,'Domain Focus','311-241G/O System of Systems','311-242O TBD','311-243O TBD','311-244O TBD'),(48,19,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters'),(49,20,'Domain Focus','','','312-243A Aviation System',''),(50,20,'#Courses/Duration','','','8 crs, 1 crs/q, 8 quarters',''),(51,21,'Domain Focus','','711-242P SPM','711-243P STA','711-244P SPM'),(52,21,'#Courses/Duration','','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters','16 crs, 2 crs/q, 8 quarters'),(53,22,'Elective Track','721-241 Various Elective Tracks','','',''),(54,22,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','','',''),(55,23,'Domain Focus','722-241G/P SPM','','',''),(56,23,'#Courses/Duration','16 crs, 2 crs/q, 8 quarters','','',''),(57,24,'#Focus','282-241G/O Advanced SE','282-242O/P TBD','282-243O/P TBD','282-244O/P TBD'),(58,24,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(60,25,'SE','131-241G/O Systems Capability & Design','131-242O Systems Capability & Design','131-243O Systems Capability & Design','131-244O Systems Capability & Design'),(61,25,'SEM','','171-242P Systems Integrated Develop','171-243P Systems Integrated Develop','171-244P Systems Integrated Develop'),(62,25,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(63,26,'Specialty','132-241G/O System of Systems','174-242O SEI-NWS','133-243O MBSE','135-234O Systems T&E'),(64,26,'Specialty','173-241G/P SPM','172-242P STA ','138-243 Digital Engineering','172-244P STA '),(65,26,'Specialty','','','173-243P SPM',''),(66,26,'Specialty','','','135-233* Systems T&E',''),(67,26,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter'),(68,27,'SE','130-241G/O SE Capstone','130-242O SE Capstone','130-243O SE Capstone','130-244O SE Capstone'),(69,27,'SEM','','170-242P SEM Capstone','','170-244P SEM Capstone'),(70,27,'#Courses/Duration','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter','4 crs, 1 crs/q, 4 quarter');
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_id` int NOT NULL,
  `value` varchar(192) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_note_year_idx` (`year_id`),
  CONSTRAINT `fk_note_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,1,'133-222 MBSE will leverage SE4930, SE4935, and SE442 from 311-212O'),(2,1,'170-222P and170-224P SEM Capstone has been deleted due to low demand'),(3,1,'135-223* SE3900 begins in 22/3 for those who do not meet the prerequisite requirements for 135-224O'),(4,1,'134-223* Same- 134 has a 3 course overlap with 135 thus allowing for additional tailoring/marketing analysis'),(5,1,'173-224P has not been approved as a certificate  of 10 Dec 2021'),(6,1,'711-224P Changed Mission Engineering to SPM due Mission Engineering courses not being develped and  approved'),(7,2,'282-232O/P, 282-233O/P, 282-234O/P - Combined for efficiency purposes due to projected lower enrollments'),(8,2,'137-233* SE3900 begins in 23/3 for those who do not meet the prerequisite requirements for 137-234O'),(9,2,'242-223* SE3900 begins in 23/3 for those who do not meet the prerequisite requirements for 242-234O'),(10,2,'SEI-NWS = Systems Engineering and integration of Naval Weapon Systems'),(11,2,'170-232P/234P* may be required for individualized purposes (will need to assess as we get closer)');
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` year NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,2022),(2,2023),(3,2024);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08  9:11:30

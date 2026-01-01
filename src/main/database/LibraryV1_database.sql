-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

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
-- Table structure for table `book_issued`
--

DROP TABLE IF EXISTS `book_issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_issued` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `issue_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `due_date` timestamp NULL DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `book_condition` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assignment_notes` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `return_notes` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `fk_book` (`book_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_issued`
--

LOCK TABLES `book_issued` WRITE;
/*!40000 ALTER TABLE `book_issued` DISABLE KEYS */;
INSERT INTO `book_issued` VALUES (1,21,8,'2025-12-09 07:00:00','2025-11-13 07:00:00','2025-12-11 07:00:00','RETURN','lost','test1','nk,.n'),(2,28,34,'2025-12-09 07:00:00','2024-06-10 06:00:00','2025-12-08 07:00:00','RETURN','fair','Test2','ngjgjjhg'),(3,30,30,'2025-12-09 07:00:00','2026-02-03 07:00:00',NULL,'ISSUED',NULL,'Notes A',NULL),(4,19,35,'2025-12-14 07:00:00','2025-12-18 07:00:00',NULL,'ISSUED',NULL,'Opt.',NULL),(5,30,1,'2025-12-14 07:00:00','2025-12-12 07:00:00',NULL,'ISSUED',NULL,'Ass',NULL);
/*!40000 ALTER TABLE `book_issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_copies` int NOT NULL,
  `available_copies` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (19,'Advanced Java Programming','Michael Johnson','technology','978-0-321-35668-0','Pearson',8,7,'2025-11-30 07:00:00',NULL),(20,'History of Modern Africa','Dr. Samuel Nkwenti','history','978-1-8473-1125-4','Oxford Press',10,6,'2025-11-30 07:00:00',NULL),(21,'The Psychology of Success','Carol Dweck','non-fiction','978-0-345-47223-2','Random House',20,10,'2025-12-01 07:00:00',NULL),(22,'Cooking Made Simple','Julia Fernandez','science','978-1-78475-481-7','Penguin Books',6,4,'2025-12-01 07:00:00',NULL),(23,'The Art of War','Sun Tzu','history','978-0-190-18416-5','Oxford Classics',15,14,'2025-12-01 07:00:00',NULL),(24,'The Lost Kingdom','James Rolins','biography','978-1-5028-9462-9','Simon & Schuster',18,12,'2025-12-02 07:00:00',NULL),(28,'Understanding Economics','Paul Krugman','romance','978-0-393-34584-8','W.W. Norton',11,12,'2025-12-03 07:00:00',NULL),(30,'Machine Learning Basics','Andrew Ng','mystery','978-1-78536-456-5','MIT Press',9,3,'2025-12-03 07:00:00','Available');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USER',
  `phone_no` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Brice','Djonassi','brice@example.com','motdepasseHasheOuNon','USER','+1-403-555-1234','1234 5th Ave, Lethbridge, AB','2025-11-29 18:55:54'),(8,'Alice','Johnson','alice@example.com','pass','USER','+1-403-111-1111','Address 1','2025-11-30 20:31:11'),(28,'AAM','BBN','CC@FF.GG','13597b26','USER','+1-555-123-4569','EEN','2025-12-04 07:00:00'),(29,'Ethan','McGregor','ethan.mcgregor@example.com','1681da0f','ADMIN','+1 587-555-1298','4827 Oak Ridge Dr, Lethbridge, AB T1K 4V2','2025-12-05 07:00:00'),(30,'Sophia','Turner','sophia.turner24@example.com','a0ae268b','USER','+1 403-555-7834','129 Fairway Gate, Calgary, AB T3M 2L8','2025-12-05 07:00:00'),(32,'Marcus','Nolan','marcus.nolan88@example.com','1d5ea801','ADMIN','+1 825-555-6007','77 Maple Crescent, Edmonton, AB T6V 1R3','2025-12-05 07:00:00'),(34,'Claire','Dupont','claire.dupont@example.com','44b0b4a2','USER','+1 587-555-9441','19 Riverbend Way, Red Deer, AB T4N 6L1','2025-12-05 07:00:00'),(35,'Daniel','Kim','daniel.kim33@example.com','bd966465','USER','+1 403-555-5720','350 Heritage Blvd, Lethbridge, AB T1H 5R5','2025-12-05 07:00:00');
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

-- Dump completed on 2026-01-01 14:23:22

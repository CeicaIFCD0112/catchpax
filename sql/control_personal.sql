CREATE DATABASE  IF NOT EXISTS `control_personal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `control_personal`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: control_personal
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` enum('entrada','salida') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,'02311234A','2024-06-05 13:35:40','entrada'),(2,'01231235S','2024-06-05 13:55:31','entrada'),(3,'01231235S','2024-06-05 13:56:06','entrada'),(4,'01231235S','2024-06-05 14:55:02','salida'),(5,'02727165H','2024-06-05 15:06:34','entrada'),(6,'02727165H','2024-06-05 15:06:39','entrada'),(7,'02727165H','2024-06-05 15:06:59','salida'),(8,'02727165H','2024-06-05 15:07:05','salida'),(9,'01111111','2024-06-05 15:13:43','entrada'),(10,'02727165H','2024-06-05 15:15:33','salida'),(11,'11111111A','2024-06-05 16:46:24','entrada'),(12,'11111111A','2024-06-05 16:46:38','salida'),(13,'11111111A','2024-06-05 16:47:00','salida');
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'pepe','Balseiro','02727165D','$2y$10$GpcQNw6wPNo65sqYv.Sah.4.x9BMfMEF33JRz1MsFhwUw4L5I7A62'),(2,'Davi','Peres','01231235S','$2y$10$Oc1v8yuNyLNlmJLigYx1AeMvrZBASRRoFfY6vGunyWq6mAmXrQRV.'),(4,'admin','Peres','02311234A','$2y$10$MgieG4amnVcM.jbPXGFoP.DKcD7Kzo6uirhiHQNTxF6.IPt1n9qwi'),(7,'Ricardo','López ','02727165H','$2y$10$xaJwt36w7OtjrY/bIEZDOO1TuNUqQKkgIy51q.SSv4TkUfalz/TgK'),(8,'tonas','lopes','01111111','$2y$10$L6IWDDywwnT5/cStEhV7Yeb.MtM1Cvk1cNQRz3rBa7bvNQ0YxpdKy'),(9,'tomas','ror','11111111A','$2y$10$iLHpz6tckAJpaYNWbkgFFupqCI0QrItY61qu96.yQif.uRdYv8zxW');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-05 19:37:39

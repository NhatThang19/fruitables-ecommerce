-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fruitables
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'default_user.jpg','/admin/images/default/default_user.jpg'),(2,'default_fruit.jpg','/admin/images/default/default_fruit.jpg'),(3,'default_origin.jpg','/admin/images/default/default_origin.jpg'),(4,'default_category.jpg','/admin/images/default/default_category.jpg'),(5,'1724247810609-vietnam.jpg','/admin/images/origin/1724247810609-vietnam.jpg'),(6,'1724247823571-japan.jpg','/admin/images/origin/1724247823571-japan.jpg'),(7,'1724247833758-american.jpg','/admin/images/origin/1724247833758-american.jpg'),(8,'1724248007857-melonicon.jpg','/admin/images/category/1724248007857-melonicon.jpg'),(9,'1724248020923-nhoicon.jpg','/admin/images/category/1724248020923-nhoicon.jpg'),(10,'1724248030907-appicon.jpg','/admin/images/category/1724248030907-appicon.jpg'),(11,'1724248512991-nhoruby.jpg','/admin/images/product/1724248512991-nhoruby.jpg'),(12,'1724248513039-nhoruby3.jpg','/admin/images/product/1724248513039-nhoruby3.jpg'),(13,'1724248513053-nhoruby2.jpg','/admin/images/product/1724248513053-nhoruby2.jpg'),(14,'1724248513065-nhoruby1.jpg','/admin/images/product/1724248513065-nhoruby1.jpg'),(15,'1724248833528-nho.jpg','/admin/images/product/1724248833528-nho.jpg'),(16,'1724248833556-nho3.jpg','/admin/images/product/1724248833556-nho3.jpg'),(17,'1724248833589-nho2.jpg','/admin/images/product/1724248833589-nho2.jpg'),(18,'1724248833603-nho1.jpg','/admin/images/product/1724248833603-nho1.jpg'),(19,'1724249124719-apple1.jpg','/admin/images/product/1724249124719-apple1.jpg'),(20,'1724249124762-apple3.jpg','/admin/images/product/1724249124762-apple3.jpg'),(21,'1724249124773-apple2.jpg','/admin/images/product/1724249124773-apple2.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 21:07:45

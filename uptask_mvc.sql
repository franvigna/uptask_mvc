-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: uptask_mvc
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proyecto` varchar(60) DEFAULT NULL,
  `url` varchar(32) DEFAULT NULL,
  `propietarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propietarioId` (`propietarioId`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`propietarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (2,' ¿por que hay chicos con diabetes?','27dcc7b90ed862196444faabcb1c1066',24),(6,' Tienda Virtual','352c2a883c7bc9a89822ffe1e32681e1',22),(7,' crear una API para shopify','14d67fa5f227de78cfbba7d58878bddf',22),(8,' logotipo para e-commerce','a777a1a34f16c3f0c88ae863f077f3d4',22),(15,' ordenar la pieza','a9f848cbcc48c2944c5daf76990ec8a8',22);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `proyectoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyectoId` (`proyectoId`),
  CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`proyectoId`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (4,' diseñar la interfaz',0,6),(11,' crear foto de perfil',0,6),(12,' coso',0,7),(13,' coso',2,7),(14,' coso',0,7),(15,' coso',0,7),(16,' coso',0,7),(17,' coso',0,7),(18,' coso',0,7),(19,' coso',0,7),(20,' coso',0,7),(21,' coso',0,7),(22,' coso',0,7),(23,' coso',0,7),(24,' coso',0,7),(25,' coso',0,7),(26,' coso',0,7),(27,' coso',0,7),(28,' coso',0,7),(29,' coso',0,7),(30,' coso',0,7),(31,' coso',0,7),(32,' coso',0,7),(33,' coso',0,7),(34,' coso',0,7),(35,' coso',0,7),(36,' coso',0,7),(37,' coso',0,7),(38,' coso',0,7),(39,' coso',0,7),(40,' coso',0,7),(41,' coso',0,7),(42,' coso',0,7),(43,' coso',0,7),(44,' coso',0,7),(45,' una tarea x',0,8),(46,' una tarea x',0,8),(47,' una tarea x',0,8),(48,' una tarea x',0,8),(49,' una tarea x',0,8),(50,' una tarea x',0,8),(51,' una tarea x',0,8),(52,' una tarea x',0,8),(53,' una tarea x',0,8),(54,' una tarea x',0,8),(55,' una tarea x',0,8),(56,' una tarea x',0,8),(57,' una tarea x',0,8),(58,' una tarea x',0,8),(59,' una tarea x',0,8),(60,' una tarea x',0,8),(61,' una tarea x',0,8),(62,' una tarea x',0,8),(63,' una tarea x',0,8),(64,' una tarea x',0,8),(65,' una tarea x',0,8),(66,' una tarea x',0,8),(67,' una tarea x',0,8),(68,' una tarea x',0,8),(69,' una tarea x',0,8),(70,' una tarea x',0,8),(71,' una tarea x',0,8),(72,' cualquier cosa',0,NULL),(73,' cualquier cosa',0,NULL),(74,' cualquier cosa',0,NULL),(75,' cualquier cosa',0,NULL),(76,' cualquier cosa',0,NULL),(77,' cualquier cosa',0,NULL),(78,' cualquier cosa',0,NULL),(79,' cualquier cosa',0,NULL),(80,' cualquier cosa',0,NULL),(81,' cualquier cosa',0,NULL),(82,' cualquier cosa',0,NULL),(83,' cualquier cosa',0,NULL),(84,' cualquier cosa',0,NULL),(85,' cualquier cosa',0,NULL),(86,' cualquier cosa',0,NULL),(87,' cualquier cosa',0,NULL),(88,' cualquier cosa',0,NULL),(89,' cualquier cosa',0,NULL),(90,' cualquier cosa',0,NULL),(91,' cualquier cosa',0,NULL),(92,' cualquier cosa',0,NULL),(93,' cualquier cosa',0,NULL),(94,' cualquier cosa',0,NULL),(95,' cualquier cosa',0,NULL),(96,' cualquier cosa',0,NULL),(97,' cualquier cosa',0,NULL),(98,' cualquier cosa',0,NULL),(99,' cualquier cosa',0,NULL),(100,' cualquier cosa',0,NULL),(101,' cualquier cosa',0,NULL),(102,' cualquier cosa',0,NULL),(103,' cualquier cosa',0,NULL),(104,' cualquier cosa',0,NULL),(105,' cualquier cosa',0,NULL),(106,' cualquier cosa',0,NULL),(107,' cualquier cosa',0,NULL),(108,' cualquier cosa',0,NULL),(109,' cualquier cosa',0,NULL),(110,' cualquier cosa',0,NULL),(111,' cualquier cosa',0,NULL),(112,' cualquier cosa',0,NULL),(113,' cualquier cosa',0,NULL),(114,' cualquier cosa',0,NULL),(115,' cualquier cosa',0,NULL),(116,' cualquier cosa',0,NULL),(129,' doblar la ropa',1,15),(130,' tender la cama',2,15),(131,'limpiar la mesa',0,15),(132,'instalar photoshop',1,6),(133,'seguridad de los datos',1,6),(134,'no cree nada flaco',2,6),(135,'una mas no le hace mal a nadie',2,6),(136,'hola memo',2,6);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (22,'Francisco','correo@correo.com','$2y$10$dXjT5Zxk4IeIEGz3WutqWemI2lseFXBORE/miu1nYH16YvF.pzsIK','',1),(23,' FranVigna','franvigna.04@gmail.com','$2y$10$OJVI0HxqNW3nIbKk4hR86O5lmowce1WhC.YH7oHRm0ORer/0t4Wd.','',1),(24,' sonia','sonia@sonia.com','$2y$10$nPwN7C9UFyx082xs0CdAjOYRcnR35A3oVH1ghT39x7Ubhzs5K7faS','',1),(25,' ivi','ivi@ivi.com','$2y$10$ATHDRUrBuqC2Pet8q6gnke6ctI777KRXGqnGP6oEWUBHYZ1s1FY3S','',1);
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

-- Dump completed on 2022-08-17 21:25:32

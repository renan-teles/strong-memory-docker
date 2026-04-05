SET NAMES utf8mb4;

CREATE DATABASE  IF NOT EXISTS `strong_memory_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `strong_memory_db`;
-- MySQL dump
--
-- Database: strong_memory_db
-- ------------------------------------------------------
-- Server 

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
-- Table structure for table `difficulties`
--

DROP TABLE IF EXISTS `difficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difficulties` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `difficulty` varchar(15) NOT NULL,
  `translation` varchar(15) NOT NULL,
  `max_quantity_words` tinyint(4) NOT NULL,
  `increase_display_time_seconds` tinyint(4) NOT NULL,
  `increase_typing_time_seconds` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `difficulty` (`difficulty`),
  UNIQUE KEY `translation` (`translation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulties`
--

LOCK TABLES `difficulties` WRITE;
/*!40000 ALTER TABLE `difficulties` DISABLE KEYS */;
INSERT INTO `difficulties` VALUES (1,'easy','fácil',15,5,5),(2,'normal','normal',25,3,3),(3,'hard','difícil',40,2,2);
/*!40000 ALTER TABLE `difficulties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,'ROLE_ADMINISTRATOR'),(1,'ROLE_PLAYER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_score_records`
--

DROP TABLE IF EXISTS `user_score_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_score_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `difficulty_id` tinyint(4) NOT NULL,
  `score` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `difficulty_id` (`difficulty_id`),
  CONSTRAINT `user_score_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_score_records_ibfk_2` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_score_records`
--

LOCK TABLES `user_score_records` WRITE;
/*!40000 ALTER TABLE `user_score_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_score_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(4) NOT NULL,
  `username` varchar(180) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `word_suggestions`
--

DROP TABLE IF EXISTS `word_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `word_suggestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `suggested_word` varchar(255) NOT NULL,
  `suggested_difficulty` varchar(15) NOT NULL,
  `suggested_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `suggested_at` (`suggested_at`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `word_suggestions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `word_suggestions`
--

LOCK TABLES `word_suggestions` WRITE;
/*!40000 ALTER TABLE `word_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `word_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `difficulty_id` tinyint(4) NOT NULL,
  `word` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`),
  KEY `difficulty_id` (`difficulty_id`),
  CONSTRAINT `words_ibfk_1` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,1,'sol'),(2,1,'lua'),(3,1,'mar'),(4,1,'pai'),(5,1,'mãe'),(6,1,'rio'),(7,1,'céu'),(8,1,'ira'),(9,1,'fé'),(10,1,'chá'),(11,1,'ovo'),(12,1,'pão'),(13,1,'mel'),(14,1,'sal'),(15,1,'bem'),(16,1,'mal'),(17,1,'sim'),(18,1,'não'),(19,1,'dia'),(20,1,'mês'),(21,1,'ano'),(22,1,'lar'),(23,1,'rei'),(24,1,'lei'),(25,1,'voz'),(26,1,'dor'),(27,1,'cor'),(28,1,'luz'),(29,1,'tia'),(30,1,'tio'),(31,1,'avó'),(32,1,'paz'),(33,1,'bar'),(34,1,'rua'),(35,1,'pé'),(36,1,'ver'),(37,1,'ser'),(38,1,'ter'),(39,1,'ir'),(40,1,'vir'),(41,1,'dar'),(42,1,'ler'),(43,1,'por'),(44,1,'fim'),(45,1,'ato'),(46,1,'asa'),(47,1,'emo'),(48,1,'elo'),(49,1,'eco'),(50,1,'pá'),(51,2,'casa'),(52,2,'carro'),(53,2,'porta'),(54,2,'janela'),(55,2,'livro'),(56,2,'caderno'),(57,2,'escola'),(58,2,'cidade'),(59,2,'amigo'),(60,2,'amiga'),(61,2,'família'),(62,2,'trabalho'),(63,2,'dinheiro'),(64,2,'comida'),(65,2,'bebida'),(66,2,'mercado'),(67,2,'shopping'),(68,2,'hospital'),(69,2,'igreja'),(70,2,'praia'),(71,2,'campo'),(72,2,'estrada'),(73,2,'viagem'),(74,2,'feriado'),(75,2,'domingo'),(76,2,'segunda'),(77,2,'sábado'),(78,2,'futebol'),(79,2,'cinema'),(80,2,'música'),(81,2,'notícia'),(82,2,'jornal'),(83,2,'revista'),(84,2,'programa'),(85,2,'internet'),(86,2,'celular'),(87,2,'computador'),(88,2,'teclado'),(89,2,'monitor'),(90,2,'mouse'),(91,2,'energia'),(92,2,'natureza'),(93,2,'cultura'),(94,2,'história'),(95,2,'educaçao'),(96,2,'governo'),(97,2,'empresa'),(98,2,'produto'),(99,2,'cliente'),(100,2,'serviço'),(101,3,'inconstitucionalidade'),(102,3,'anticonstitucional'),(103,3,'extraordinariamente'),(104,3,'interdisciplinaridade'),(105,3,'multidisciplinaridade'),(106,3,'hiperresponsabilidade'),(107,3,'contrarrevolucionário'),(108,3,'incompatibilidade'),(109,3,'imprevisibilidade'),(110,3,'inquestionabilidade'),(111,3,'irreversibilidade'),(112,3,'incomensurabilidade'),(113,3,'interoperabilidade'),(114,3,'intransponibilidade'),(115,3,'desproporcionalidade'),(116,3,'contraditoriedade'),(117,3,'incongruência'),(118,3,'inexorabilidade'),(119,3,'imponderabilidade'),(120,3,'impenetrabilidade'),(121,3,'imperceptibilidade'),(122,3,'intangibilidade'),(123,3,'indeterminabilidade'),(124,3,'inexpugnabilidade'),(125,3,'indissociabilidade'),(126,3,'imputabilidade'),(127,3,'incompreensibilidade'),(128,3,'incognoscibilidade'),(129,3,'irrepreensibilidade'),(130,3,'interdependência'),(131,3,'contradistinção'),(132,3,'irreconciliável'),(133,3,'insubordinação'),(134,3,'intransigência'),(135,3,'contraproducente'),(136,3,'descaracterização'),(137,3,'despropositadamente'),(138,3,'superdimensionamento'),(139,3,'subdesenvolvimento'),(140,3,'sobrecarregamento'),(141,3,'desestabilizção'),(142,3,'descontinuidade'),(143,3,'heterogeneidade'),(144,3,'homogeneização'),(145,3,'inadequabilidade'),(146,3,'irretratabilidade'),(147,3,'irrefutabilidade'),(148,3,'incomunicabilidade'),(149,3,'impossibilidade'),(150,3,'desproporcional');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'strong_memory_db'
--

--
-- Dumping routines for database 'strong_memory_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

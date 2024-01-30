-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: subscriber
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,'user1@example.com','User1','LastName1','subscribed'),(2,'user2@example.com','User2','LastName2','subscribed'),(3,'user3@example.com','User3','LastName3','unsubscribed'),(4,'user4@example.com','User4','LastName4','unsubscribed'),(5,'user5@example.com','User5','LastName5','unsubscribed'),(6,'user6@example.com','User6','LastName6','subscribed'),(7,'user7@example.com','User7','LastName7','subscribed'),(8,'user8@example.com','User8','LastName8','subscribed'),(9,'user9@example.com','User9','LastName9','subscribed'),(10,'user10@example.com','User10','LastName10','subscribed'),(11,'user11@example.com','User11','LastName11','subscribed'),(12,'user12@example.com','User12','LastName12','unsubscribed'),(13,'user13@example.com','User13','LastName13','subscribed'),(14,'user14@example.com','User14','LastName14','subscribed'),(15,'user15@example.com','User15','LastName15','subscribed'),(16,'user16@example.com','User16','LastName16','subscribed'),(17,'user17@example.com','User17','LastName17','subscribed'),(18,'user18@example.com','User18','LastName18','unsubscribed'),(19,'user19@example.com','User19','LastName19','subscribed'),(20,'user20@example.com','User20','LastName20','subscribed'),(21,'user21@example.com','User21','LastName21','unsubscribed'),(22,'user22@example.com','User22','LastName22','subscribed'),(23,'user23@example.com','User23','LastName23','subscribed'),(24,'user24@example.com','User24','LastName24','subscribed'),(25,'user25@example.com','User25','LastName25','unsubscribed'),(26,'user26@example.com','User26','LastName26','subscribed'),(27,'user27@example.com','User27','LastName27','subscribed'),(28,'user28@example.com','User28','LastName28','subscribed'),(29,'user29@example.com','User29','LastName29','subscribed'),(30,'user30@example.com','User30','LastName30','subscribed'),(31,'user31@example.com','User31','LastName31','subscribed'),(32,'user32@example.com','User32','LastName32','subscribed'),(33,'user33@example.com','User33','LastName33','subscribed'),(34,'user34@example.com','User34','LastName34','unsubscribed'),(35,'user35@example.com','User35','LastName35','subscribed'),(36,'user36@example.com','User36','LastName36','subscribed'),(37,'user37@example.com','User37','LastName37','unsubscribed'),(38,'user38@example.com','User38','LastName38','subscribed'),(39,'user39@example.com','User39','LastName39','subscribed'),(40,'user40@example.com','User40','LastName40','unsubscribed'),(41,'user41@example.com','User41','LastName41','subscribed'),(42,'user42@example.com','User42','LastName42','subscribed'),(43,'user43@example.com','User43','LastName43','subscribed'),(44,'user44@example.com','User44','LastName44','subscribed'),(45,'user45@example.com','User45','LastName45','subscribed'),(46,'user46@example.com','User46','LastName46','subscribed'),(47,'user47@example.com','User47','LastName47','unsubscribed'),(48,'user48@example.com','User48','LastName48','subscribed'),(49,'user49@example.com','User49','LastName49','subscribed'),(50,'user50@example.com','User50','LastName50','subscribed'),(64,'user1@example.com','User1','LastName1','subscribed'),(65,'user2@example.com','User2','LastName2','subscribed'),(66,'user3@example.com','User3','LastName3','subscribed'),(67,'user4@example.com','User4','LastName4','subscribed'),(68,'user5@example.com','User5','LastName5','subscribed'),(69,'user6@example.com','User6','LastName6','subscribed'),(70,'user7@example.com','User7','LastName7','subscribed'),(71,'user8@example.com','User8','LastName8','subscribed'),(72,'user9@example.com','User9','LastName9','subscribed'),(73,'user10@example.com','User10','LastName10','subscribed'),(74,'user11@example.com','User11','LastName11','unsubscribed'),(75,'user12@example.com','User12','LastName12','unsubscribed'),(76,'user13@example.com','User13','LastName13','subscribed'),(77,'user14@example.com','User14','LastName14','subscribed'),(78,'user15@example.com','User15','LastName15','unsubscribed'),(79,'user16@example.com','User16','LastName16','subscribed'),(80,'user17@example.com','User17','LastName17','subscribed'),(81,'user18@example.com','User18','LastName18','subscribed'),(82,'user19@example.com','User19','LastName19','subscribed'),(83,'user20@example.com','User20','LastName20','unsubscribed'),(84,'user21@example.com','User21','LastName21','subscribed'),(85,'user22@example.com','User22','LastName22','subscribed'),(86,'user23@example.com','User23','LastName23','unsubscribed'),(87,'user24@example.com','User24','LastName24','subscribed'),(88,'user25@example.com','User25','LastName25','unsubscribed'),(89,'user26@example.com','User26','LastName26','subscribed'),(90,'user27@example.com','User27','LastName27','subscribed'),(91,'user28@example.com','User28','LastName28','subscribed'),(92,'user29@example.com','User29','LastName29','subscribed'),(93,'user30@example.com','User30','LastName30','subscribed'),(94,'user31@example.com','User31','LastName31','subscribed'),(95,'user32@example.com','User32','LastName32','subscribed'),(96,'user33@example.com','User33','LastName33','subscribed'),(97,'user34@example.com','User34','LastName34','subscribed'),(98,'user35@example.com','User35','LastName35','subscribed'),(99,'user36@example.com','User36','LastName36','subscribed'),(100,'user37@example.com','User37','LastName37','subscribed'),(101,'user38@example.com','User38','LastName38','subscribed'),(102,'user39@example.com','User39','LastName39','subscribed'),(103,'user40@example.com','User40','LastName40','subscribed'),(104,'user41@example.com','User41','LastName41','unsubscribed'),(105,'user42@example.com','User42','LastName42','subscribed'),(106,'user43@example.com','User43','LastName43','subscribed'),(107,'user44@example.com','User44','LastName44','subscribed'),(108,'user45@example.com','User45','LastName45','subscribed'),(109,'user46@example.com','User46','LastName46','unsubscribed'),(110,'user47@example.com','User47','LastName47','unsubscribed'),(111,'user48@example.com','User48','LastName48','subscribed'),(112,'user49@example.com','User49','LastName49','subscribed'),(113,'user50@example.com','User50','LastName50','unsubscribed'),(114,'user51@example.com','User51','LastName51','unsubscribed'),(115,'user52@example.com','User52','LastName52','subscribed'),(116,'user53@example.com','User53','LastName53','subscribed'),(117,'user54@example.com','User54','LastName54','subscribed'),(118,'user55@example.com','User55','LastName55','subscribed'),(119,'user56@example.com','User56','LastName56','subscribed'),(120,'user57@example.com','User57','LastName57','subscribed'),(121,'user58@example.com','User58','LastName58','subscribed'),(122,'user59@example.com','User59','LastName59','subscribed'),(123,'user60@example.com','User60','LastName60','unsubscribed'),(124,'user61@example.com','User61','LastName61','subscribed'),(125,'user62@example.com','User62','LastName62','subscribed'),(126,'user63@example.com','User63','LastName63','unsubscribed'),(127,'user64@example.com','User64','LastName64','subscribed'),(128,'user65@example.com','User65','LastName65','subscribed'),(129,'user66@example.com','User66','LastName66','unsubscribed'),(130,'user67@example.com','User67','LastName67','subscribed'),(131,'user68@example.com','User68','LastName68','subscribed'),(132,'user69@example.com','User69','LastName69','unsubscribed'),(133,'user70@example.com','User70','LastName70','subscribed'),(134,'user71@example.com','User71','LastName71','subscribed'),(135,'user72@example.com','User72','LastName72','subscribed'),(136,'user73@example.com','User73','LastName73','subscribed'),(137,'user74@example.com','User74','LastName74','subscribed'),(138,'user75@example.com','User75','LastName75','subscribed'),(139,'user76@example.com','User76','LastName76','subscribed'),(140,'user77@example.com','User77','LastName77','unsubscribed'),(141,'user78@example.com','User78','LastName78','unsubscribed'),(142,'user79@example.com','User79','LastName79','subscribed'),(143,'user80@example.com','User80','LastName80','subscribed'),(144,'user81@example.com','User81','LastName81','unsubscribed'),(145,'user82@example.com','User82','LastName82','subscribed'),(146,'user83@example.com','User83','LastName83','unsubscribed'),(147,'user84@example.com','User84','LastName84','subscribed'),(148,'user85@example.com','User85','LastName85','subscribed'),(149,'user86@example.com','User86','LastName86','subscribed'),(150,'user87@example.com','User87','LastName87','subscribed'),(151,'user88@example.com','User88','LastName88','subscribed'),(191,'user1@example.com','User1','LastName1','subscribed'),(192,'user2@example.com','User2','LastName2','unsubscribed'),(193,'user3@example.com','User3','LastName3','subscribed'),(194,'user4@example.com','User4','LastName4','subscribed'),(195,'user5@example.com','User5','LastName5','subscribed'),(196,'user6@example.com','User6','LastName6','subscribed'),(197,'user7@example.com','User7','LastName7','subscribed'),(198,'user8@example.com','User8','LastName8','subscribed'),(199,'user9@example.com','User9','LastName9','subscribed'),(200,'user10@example.com','User10','LastName10','subscribed'),(201,'user11@example.com','User11','LastName11','unsubscribed'),(202,'user12@example.com','User12','LastName12','subscribed'),(203,'user13@example.com','User13','LastName13','subscribed'),(204,'user14@example.com','User14','LastName14','subscribed'),(205,'user15@example.com','User15','LastName15','subscribed'),(206,'user16@example.com','User16','LastName16','subscribed'),(207,'user17@example.com','User17','LastName17','unsubscribed'),(208,'user18@example.com','User18','LastName18','unsubscribed'),(209,'user19@example.com','User19','LastName19','subscribed'),(210,'user20@example.com','User20','LastName20','subscribed'),(211,'user21@example.com','User21','LastName21','subscribed'),(212,'user22@example.com','User22','LastName22','subscribed'),(213,'user23@example.com','User23','LastName23','subscribed'),(214,'user24@example.com','User24','LastName24','subscribed'),(215,'user25@example.com','User25','LastName25','subscribed'),(216,'user26@example.com','User26','LastName26','unsubscribed'),(217,'user27@example.com','User27','LastName27','unsubscribed'),(218,'user28@example.com','User28','LastName28','subscribed'),(219,'user29@example.com','User29','LastName29','subscribed'),(220,'user30@example.com','User30','LastName30','unsubscribed'),(221,'user31@example.com','User31','LastName31','unsubscribed'),(222,'user32@example.com','User32','LastName32','subscribed'),(223,'user33@example.com','User33','LastName33','subscribed'),(224,'user34@example.com','User34','LastName34','subscribed'),(225,'user35@example.com','User35','LastName35','subscribed'),(226,'user36@example.com','User36','LastName36','unsubscribed'),(227,'user37@example.com','User37','LastName37','subscribed'),(228,'user38@example.com','User38','LastName38','subscribed'),(229,'user39@example.com','User39','LastName39','subscribed'),(230,'user40@example.com','User40','LastName40','subscribed'),(231,'user41@example.com','User41','LastName41','subscribed'),(232,'user42@example.com','User42','LastName42','subscribed'),(233,'user43@example.com','User43','LastName43','subscribed'),(234,'user44@example.com','User44','LastName44','subscribed'),(235,'user45@example.com','User45','LastName45','subscribed'),(236,'user46@example.com','User46','LastName46','subscribed'),(237,'user47@example.com','User47','LastName47','subscribed'),(238,'user48@example.com','User48','LastName48','subscribed'),(239,'user49@example.com','User49','LastName49','subscribed'),(240,'user50@example.com','User50','LastName50','subscribed'),(241,'user51@example.com','User51','LastName51','subscribed'),(242,'user52@example.com','User52','LastName52','subscribed'),(243,'user53@example.com','User53','LastName53','subscribed'),(244,'user54@example.com','User54','LastName54','subscribed'),(245,'user55@example.com','User55','LastName55','subscribed'),(246,'user56@example.com','User56','LastName56','subscribed'),(247,'user57@example.com','User57','LastName57','unsubscribed'),(248,'user58@example.com','User58','LastName58','subscribed'),(249,'user59@example.com','User59','LastName59','subscribed'),(250,'user60@example.com','User60','LastName60','subscribed'),(251,'user61@example.com','User61','LastName61','subscribed'),(252,'user62@example.com','User62','LastName62','subscribed'),(253,'user63@example.com','User63','LastName63','subscribed'),(254,'user64@example.com','User64','LastName64','subscribed'),(255,'user65@example.com','User65','LastName65','unsubscribed'),(256,'user66@example.com','User66','LastName66','subscribed'),(257,'user67@example.com','User67','LastName67','unsubscribed'),(258,'user68@example.com','User68','LastName68','subscribed'),(259,'user69@example.com','User69','LastName69','subscribed'),(260,'user70@example.com','User70','LastName70','subscribed'),(261,'user71@example.com','User71','LastName71','unsubscribed'),(262,'user72@example.com','User72','LastName72','subscribed'),(263,'user73@example.com','User73','LastName73','subscribed'),(264,'user74@example.com','User74','LastName74','subscribed'),(265,'user75@example.com','User75','LastName75','subscribed'),(266,'user76@example.com','User76','LastName76','unsubscribed'),(267,'user77@example.com','User77','LastName77','subscribed'),(268,'user78@example.com','User78','LastName78','subscribed'),(269,'user79@example.com','User79','LastName79','subscribed'),(270,'user80@example.com','User80','LastName80','subscribed'),(271,'user81@example.com','User81','LastName81','subscribed'),(272,'user82@example.com','User82','LastName82','subscribed'),(273,'user83@example.com','User83','LastName83','subscribed'),(274,'user84@example.com','User84','LastName84','subscribed'),(275,'user85@example.com','User85','LastName85','unsubscribed'),(276,'user86@example.com','User86','LastName86','subscribed'),(277,'user87@example.com','User87','LastName87','unsubscribed'),(278,'user88@example.com','User88','LastName88','subscribed');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30  0:33:44
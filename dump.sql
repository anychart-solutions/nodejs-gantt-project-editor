-- MySQL dump 10.13  Distrib 5.6.38, for osx10.9 (x86_64)
--
-- Host: localhost    Database: gantt_project
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromTask` int(11) NOT NULL,
  `connectTo` int(11) NOT NULL,
  `connType` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from` (`fromTask`),
  KEY `to` (`connectTo`),
  CONSTRAINT `connector_ibfk_1` FOREIGN KEY (`fromTask`) REFERENCES `task` (`id`),
  CONSTRAINT `connector_ibfk_2` FOREIGN KEY (`connectTo`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `last_modified` bigint(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'May-2019',1557294752965,0),(2,'June-2019',1559635304425,0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `actualStart` bigint(11) DEFAULT NULL,
  `actualEnd` bigint(11) DEFAULT NULL,
  `baselineStart` bigint(11) DEFAULT NULL,
  `baselineEnd` bigint(11) DEFAULT NULL,
  `progressValue` decimal(10,2) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `project` int(11) NOT NULL,
  `last_modified` bigint(20) NOT NULL,
  `assignee` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `task` (`project`),
  KEY `assignee` (`assignee`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `task` (`id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`project`) REFERENCES `project` (`id`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`assignee`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'AnyChart 8.6.1',NULL,NULL,NULL,NULL,NULL,NULL,1,1559286847492,NULL,0,NULL),(2,'DVF-3947 Plot controls',NULL,NULL,NULL,NULL,NULL,1,1,1558511055475,NULL,0,NULL),(3,'Codebase',1558051200000,1558539958452,NULL,NULL,1.00,2,1,1558683442455,NULL,0,NULL),(4,'API',1558875199538,1559220799535,NULL,NULL,1.00,2,1,1559286514281,NULL,0,NULL),(5,'QA',1559001600000,1559174399999,NULL,NULL,NULL,2,1,1558683757444,NULL,0,NULL),(6,'Freeboard 1.0',NULL,NULL,NULL,NULL,NULL,NULL,1,1558510105395,NULL,0,NULL),(7,'Codebase',1557705600000,1557964799999,NULL,NULL,1.00,6,1,1558516476961,NULL,0,NULL),(8,'Web page',1557792000000,1557878399999,NULL,NULL,1.00,6,1,1558515317961,NULL,0,NULL),(9,'Web Content',1558396800000,1558655999999,NULL,NULL,0.20,6,1,1558505429133,NULL,0,NULL),(10,'Tableau 1.0',NULL,NULL,NULL,NULL,NULL,NULL,1,1558510099008,NULL,0,NULL),(11,'Qlik 3.4',NULL,NULL,NULL,NULL,NULL,NULL,1,1558510123086,NULL,0,NULL),(12,'Codebase',1557792000000,1559347199998,NULL,NULL,0.70,10,1,1559271492391,NULL,0,NULL),(13,'Web page',1557878400000,1557964799999,NULL,NULL,1.00,10,1,1558515279343,NULL,0,NULL),(14,'Web page Content',1558915200000,1559347199999,NULL,NULL,NULL,10,1,1558510384742,NULL,0,NULL),(15,'License Server',1558929230662,1559534030659,NULL,NULL,0.40,10,1,1559271521138,NULL,0,NULL),(16,'License Server',1557878400000,1558066710664,NULL,NULL,1.00,6,1,1558517050215,NULL,0,NULL),(17,'Gantt Performance',1557100800000,1557878399999,NULL,NULL,1.00,11,1,1558516619808,NULL,0,NULL),(18,'Gantt Printing',1557705600000,1559260799998,NULL,NULL,1.00,11,1,1559270323570,NULL,0,NULL),(19,'Gantt Separated Tooltips',1559260800000,1559347199999,NULL,NULL,1.00,11,1,1559287165784,NULL,0,NULL),(20,'Gantt Milestones preview',1558483200000,1558569599999,NULL,NULL,1.00,11,1,1558516681017,NULL,0,NULL),(21,'Errors data mapping',1558051200000,1558483199999,NULL,NULL,1.00,11,1,1558517010421,NULL,0,NULL),(22,'Client-side Export',1558483200000,1559433599998,NULL,NULL,0.20,1,1,1559271958582,NULL,0,NULL),(23,'DVF-4236 ganttToolbar rework',1556668800000,1558569599998,NULL,NULL,1.00,1,1,1558516945625,NULL,0,NULL),(24,'DVF-4235 Gantt Milestone preview',NULL,NULL,NULL,NULL,NULL,1,1,1558517194503,NULL,0,NULL),(25,'Gantt Themes flatting',1558396800000,1558742399998,NULL,NULL,1.00,30,1,1559271615114,NULL,0,NULL),(26,'Bugfixes',NULL,NULL,NULL,NULL,NULL,1,1,1558511619249,NULL,0,NULL),(27,'DVF-4201 Legend redraw',1558310400000,1558742399998,NULL,NULL,0.90,26,1,1559271478060,NULL,0,NULL),(28,'DVF-4242 Paginator overlap',1559088000000,1559347199999,NULL,NULL,NULL,26,1,1558515212220,NULL,0,NULL),(29,'DVF-4228 Stock range annotations',NULL,NULL,NULL,NULL,NULL,1,1,1558683541763,NULL,0,NULL),(30,'DVF-4244 Gantt separate tooltip',NULL,NULL,NULL,NULL,NULL,1,1,1558517732638,NULL,0,NULL),(31,'Stock Indicators\n(alpha)',1558483200000,1559260799999,NULL,NULL,1.00,11,1,1559271017486,NULL,0,NULL),(32,'Gantt 3k points sample',1557273600000,1558483199999,NULL,NULL,1.00,11,1,1558515060502,NULL,0,NULL),(33,'\nResearch:\nusers scripts',1556668800000,1557446399998,NULL,NULL,1.00,11,1,1559287179517,NULL,0,NULL),(34,'Codebase',1557100800000,1557532799999,NULL,NULL,1.00,24,1,1558517586163,NULL,0,NULL),(35,'API',1557705600000,1557878399999,NULL,NULL,1.00,24,1,1558517624050,NULL,0,NULL),(36,'QA',1557713530374,1557964799999,NULL,NULL,1.00,24,1,1558517674643,NULL,0,NULL),(37,'Codebase',1558569600000,1558828799998,NULL,NULL,1.00,30,1,1559271652376,NULL,0,NULL),(38,'QA',1558915200000,1559174399998,NULL,NULL,1.00,30,1,1559271662059,NULL,0,NULL),(39,'API',1559174400000,1559347199999,NULL,NULL,0.30,30,1,1559271674774,NULL,0,NULL),(40,'Gantt clip problem',1559088000000,1559347199998,NULL,NULL,1.00,11,1,1559270365927,NULL,0,NULL),(41,'Codebase',1558396800000,1558569599999,NULL,NULL,1.00,29,1,1558683527433,NULL,0,NULL),(42,'API',1558569600000,1558742399999,NULL,NULL,1.00,29,1,1558683565872,NULL,0,NULL),(43,'QA',1558656000000,1559174399997,NULL,NULL,1.00,29,1,1559286956918,NULL,0,NULL),(44,'Qlik 3.5',NULL,NULL,NULL,NULL,NULL,NULL,2,1559635358924,NULL,0,NULL),(45,'Freeboard',NULL,NULL,NULL,NULL,NULL,NULL,2,1559635390515,NULL,0,NULL),(46,'Tableau',NULL,NULL,NULL,NULL,NULL,NULL,2,1559635401476,NULL,0,NULL),(47,'Irwidget',NULL,NULL,NULL,NULL,NULL,NULL,2,1559635418660,NULL,0,NULL),(48,'AnyChart',NULL,NULL,NULL,NULL,NULL,NULL,2,1559635448556,NULL,0,NULL),(49,'Web content',NULL,NULL,1559779200000,1560297599999,NULL,45,2,1560240291415,7,0,NULL),(50,'Testing in Real Account',1559520000000,1559779199999,NULL,NULL,1.00,45,2,1560240281902,11,0,NULL),(51,'Продукты для покупки в PayPro',1560384000000,NULL,NULL,NULL,NULL,45,2,1560240263863,7,0,NULL),(52,'Проблема с лицензированием',1559520000000,1559951999999,NULL,NULL,0.70,46,2,1560238994700,9,0,NULL),(53,'Testing in Real Account',NULL,NULL,NULL,NULL,NULL,46,2,1559635768214,NULL,0,NULL),(54,'Web content',NULL,NULL,1560124800000,1560383999999,NULL,46,2,1560238931077,7,0,NULL),(55,'Продукты для покупки в PayPro',1560384000000,NULL,NULL,NULL,NULL,46,2,1560238920268,7,0,NULL),(56,'!!! Plot controls',NULL,NULL,NULL,NULL,NULL,48,2,1560238775710,NULL,1,NULL),(57,'1 Plot splitter DVF-4261',1560124800000,1561247999998,1560124800000,1561247999998,0.10,48,2,1560238794695,3,0,NULL),(58,'? переработка tech indicators',NULL,NULL,NULL,NULL,NULL,48,2,1559636571446,NULL,0,NULL),(59,'? persistent task',NULL,NULL,NULL,NULL,NULL,48,2,1559636607941,NULL,0,NULL),(60,'client-side export',1559520000000,1560470399999,1559520000000,1559951999999,0.90,48,2,1560238874012,10,0,NULL),(61,'1 EOD Данные',NULL,NULL,NULL,NULL,NULL,44,2,1559717827973,NULL,0,NULL),(62,'4 Offline version',1560124800000,1560297599999,1560124800000,1560297599999,0.70,44,2,1560240725471,4,0,NULL),(63,'2 tech indicators',NULL,NULL,NULL,NULL,NULL,44,2,1559724973248,NULL,0,NULL),(64,'4 new types / decision',NULL,NULL,NULL,NULL,NULL,44,2,1559719703021,NULL,0,NULL),(65,'4.5 drawing tools annotations research',NULL,NULL,NULL,NULL,NULL,44,2,1559720597238,NULL,0,NULL),(66,'5 gantt editing',NULL,NULL,NULL,NULL,NULL,44,2,1559720627293,NULL,0,NULL),(67,'? gantt range picker / selector',NULL,NULL,NULL,NULL,NULL,48,2,1559637985938,NULL,0,NULL),(68,'? gantt marquee navigation',NULL,NULL,NULL,NULL,NULL,48,2,1559638006867,NULL,0,NULL),(69,'3 documentations / demos',NULL,NULL,NULL,NULL,NULL,44,2,1559718242160,NULL,0,NULL),(70,'Постановка задач',1560729600000,NULL,NULL,NULL,NULL,47,2,1560238887557,7,0,NULL),(71,'Environment',NULL,NULL,NULL,NULL,NULL,NULL,2,1559638713512,NULL,0,NULL),(72,'Internal Planning Shit',1559779200000,1559951999999,NULL,NULL,1.00,71,2,1560238749562,3,0,NULL),(73,'License server нормализация',NULL,NULL,1560729600000,1560815999999,NULL,71,2,1560238659631,1,0,NULL),(74,'2 NPrinting',NULL,NULL,1560211200000,1560556799999,NULL,44,2,1560240784801,8,0,NULL),(75,'2 Snapshot / Printing ENV-1309',1559865600000,1560470399999,1559865600000,1560556799999,0.50,44,2,1560240795856,1,0,NULL),(76,'2 Testing\n(ибо TED и release)',NULL,NULL,NULL,NULL,NULL,44,2,1559718490602,NULL,0,NULL),(77,'2 TED',NULL,NULL,NULL,NULL,NULL,44,2,1559718498201,NULL,0,NULL),(78,'4.5 Custom theme / Settings',NULL,NULL,NULL,NULL,NULL,44,2,1559719840332,NULL,0,NULL),(79,'2 3d pie / donut ENV-1315',NULL,NULL,1560297600000,1560383999999,NULL,44,2,1560240814288,10,0,NULL),(80,'Support',NULL,NULL,NULL,NULL,NULL,NULL,2,1559717369406,NULL,0,NULL),(81,'UBS. Stock crosshair',NULL,NULL,NULL,NULL,NULL,80,2,1559712960158,NULL,0,NULL),(82,'UBS. Stock gaps',NULL,NULL,NULL,NULL,NULL,80,2,1559717354930,NULL,0,NULL),(83,'1 Yahoo tech indicators\n(DVF-4263)',1560124800000,1560297599999,1560124800000,1560297599999,1.00,48,2,1560238817147,9,0,NULL),(84,'demo-server',NULL,NULL,NULL,NULL,NULL,69,2,1559724397419,NULL,0,NULL),(85,'demos\n(health, finince etc)',NULL,NULL,NULL,NULL,NULL,69,2,1559724442050,NULL,0,NULL),(86,'documentation content',NULL,NULL,NULL,NULL,NULL,69,2,1559724455665,NULL,0,NULL),(87,'documentation engine ?',NULL,NULL,NULL,NULL,NULL,69,2,1559724472913,NULL,0,NULL),(88,'research',NULL,NULL,1559692800000,1560211199999,NULL,69,2,1560240775269,7,0,NULL),(89,'KEYS. BLOCKER',1559779200000,1560556799999,NULL,NULL,NULL,46,2,1560238912251,12,0,NULL),(90,'Функционал в плагин ENV-1306',1560211200000,1561075199999,1560297600000,1560988799998,NULL,61,2,1560240698620,11,0,NULL),(91,'Панель над чартом',NULL,NULL,1560902400000,1561075199999,NULL,61,2,1560240714791,11,0,NULL),(92,'Research. Сохранение настроек в модели для viewer ENV-1313',NULL,NULL,1560124800000,1560297599999,NULL,44,2,1560240823228,10,0,NULL),(93,'Редактирование серий CE\n(ENV-1307)',1559865600000,1560211199999,1559865600000,1560297599999,1.00,63,2,1560240755120,11,0,NULL),(94,'Панель над чартом',1560211200000,1560470399999,1560211200000,1560383999998,NULL,63,2,1560236511048,NULL,0,NULL),(95,'Desk retirement',NULL,NULL,NULL,NULL,NULL,71,2,1559809180641,NULL,0,NULL),(96,'DVF-4262. Gantt fix\n(8.6.1 broke)',1559865600000,1559951999999,1559865600000,1559951999999,1.00,48,2,1560238864798,3,0,NULL),(97,'TI,EOD,DT panels layout ENV-1314',NULL,NULL,1560729600000,1561161599997,NULL,44,2,1560240314826,2,0,NULL),(98,'Enterprise Viewer Fix',1560470400000,1560556799999,NULL,NULL,NULL,44,2,1560489159112,1,0,NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `last_modified` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kagakin','https://avatars0.githubusercontent.com/u/301098?s=96&v=4',0,1560230884166),(2,'Baranov','https://avatars3.githubusercontent.com/u/14055212?s=96&v=4',0,1560230925474),(3,'Kudryavtsev','https://avatars3.githubusercontent.com/u/1116634?s=96&v=4',0,1560230908342),(4,'Vitaly','https://avatars2.githubusercontent.com/u/696305?s=96&v=4',0,1560230865294),(7,'Timothy','https://avatars0.githubusercontent.com/u/683710?s=96&v=4',0,1560230836576),(8,'Shestakov','https://avatars3.githubusercontent.com/u/24609062?s=96&v=4',0,1560230944792),(9,'Chengaev','https://avatars2.githubusercontent.com/u/28252648?s=96&v=4',0,1560230962821),(10,'Kurnoy','https://avatars2.githubusercontent.com/u/4188229?s=96&v=4',0,1560230978956),(11,'Chernetsky','https://avatars2.githubusercontent.com/u/843248?s=96&v=4',0,1560231005590),(12,'Baranchuk','https://avatars3.githubusercontent.com/u/703367?s=96&v=4',0,1560231019566);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-14 15:34:08

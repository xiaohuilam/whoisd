-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sld
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb8u1-log

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
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `name` varchar(255) NOT NULL,
  `ownerc_fk` varchar(12) DEFAULT NULL,
  `techc_fk` varchar(12) DEFAULT NULL,
  `adminc_fk` varchar(12) DEFAULT NULL,
  `zonec_fk` varchar(12) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `dnskey1_flags` varchar(3) DEFAULT NULL,
  `dnskey1_algo` varchar(3) DEFAULT NULL,
  `dnskey1_key` varchar(2048) DEFAULT NULL,
  `dnskey2_flags` varchar(3) DEFAULT NULL,
  `dnskey2_algo` varchar(3) DEFAULT NULL,
  `dnskey2_key` varchar(2048) DEFAULT NULL,
  `nserver1_name` varchar(255) DEFAULT NULL,
  `nserver1_ip` varchar(16) DEFAULT NULL,
  `nserver2_name` varchar(255) DEFAULT NULL,
  `nserver2_ip` varchar(16) DEFAULT NULL,
  `nserver3_name` varchar(255) DEFAULT NULL,
  `nserver3_ip` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES ('example.com','','','','','2016-02-29 22:08:29','2016-03-13 20:12:20',257,8,'AwEAAduGeZTXLX2tgqUb+KO4Ffsd4UHFNLktX5plzou9kVTROlKuj56ZZwvk30TzpYJguUMGrhdTRwPRZ8Ey/Hv714/spXBai5rxCmi0WBalV/tyO/+tCxtiOA6PQPzmbo6PKTg5DQi47hUG1l1wfBgbmJe2xATaRY9IczrlhxKaofRfZK9UGCCmXTCRDp5mqkIZwChKpjOWTuCCiVCPcWJ6KT9pBPu92ctAfdIPr9dBO08ePYWbZnIto/3C04eEOOcUxDMKzsuhh6d8RUptM/ellHsoWsKs+1bYwdFyJLxRKPNE0t5e/RF7fBSR7cOnIivXsD76WbfAJH8lTHPPmRaoqMU=',0,0,'','ns1.example.com','127.0.0.1','ns2.example.com','127.0.0.1','',''),('example.net','','','','','2016-03-17 21:32:46','2016-03-17 22:20:18',257,8,'AwEAAcJDg0GgwSGOXXIoemEavJUGQVw9jgxLS1hBd2fSYoz8opyPANlI64V2VYvjIo7osCRdXwanZXRQECcWPpBTXXUyBJPO/lHgLES23YoR4kHbELrGEp5Pg57+83Ch07KShkKHPtq8d1KSE8XUDqud489jHolSb8S7IiWdQHq1Fe4AK6MojjNf/xpol6L9OqluEVgJd7wahybHGbQKCAKN6Izrr4aYGu8i/FsD8sr/h0uQ7Y573uZYn1l87R3Q6fHq3Vkxb8z+H8sv35AD2eXPuvaqXYA3B4sWPjPqdBgQGNPek1uzrfdX2uoh8IaF1YeqXR9/kKq8rwgaJNp+aAs56Mc=',0,0,'','ns1.example.com','','ns2.example.com','','',''),('example.org','','','','','2015-12-30 23:39:49','2015-12-30 23:39:49',0,0,'',0,0,'','ns1.example.com','','ns2.example.com','','','');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handles`
--

DROP TABLE IF EXISTS `handles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handles` (
  `hid` varchar(12) NOT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handles`
--

LOCK TABLES `handles` WRITE;
/*!40000 ALTER TABLE `handles` DISABLE KEYS */;
/*!40000 ALTER TABLE `handles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-17 22:46:30

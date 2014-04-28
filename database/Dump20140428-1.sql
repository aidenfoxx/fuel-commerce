CREATE DATABASE  IF NOT EXISTS `fuelcommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fuelcommerce`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: fuelcommerce
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `fuel_migration`
--

DROP TABLE IF EXISTS `fuel_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_migration` (
  `type` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `migration` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_migration`
--

LOCK TABLES `fuel_migration` WRITE;
/*!40000 ALTER TABLE `fuel_migration` DISABLE KEYS */;
INSERT INTO `fuel_migration` VALUES ('app','default','001_create_products'),('app','default','002_create_product_variants'),('package','auth','001_auth_create_usertables'),('package','auth','002_auth_create_grouptables'),('package','auth','003_auth_create_roletables'),('package','auth','004_auth_create_permissiontables'),('package','auth','005_auth_create_authdefaults'),('package','auth','006_auth_add_authactions'),('package','auth','007_auth_add_permissionsfilter'),('package','auth','008_auth_create_providers'),('package','auth','009_auth_create_oauth2tables'),('package','auth','010_auth_fix_jointables'),('app','default','003_create_orders'),('app','default','004_create_order_lines');
/*!40000 ALTER TABLE `fuel_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_order_lines`
--

DROP TABLE IF EXISTS `fuel_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_order_lines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `quantity` int(3) NOT NULL,
  `price` decimal(5,2) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product_id`),
  KEY `order` (`order_id`),
  CONSTRAINT `product` FOREIGN KEY (`product_id`) REFERENCES `fuel_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `fuel_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_order_lines`
--

LOCK TABLES `fuel_order_lines` WRITE;
/*!40000 ALTER TABLE `fuel_order_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_orders`
--

DROP TABLE IF EXISTS `fuel_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address_1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` tinyint(1) unsigned NOT NULL,
  `card_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users` (`user_id`),
  CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `fuel_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_orders`
--

LOCK TABLES `fuel_orders` WRITE;
/*!40000 ALTER TABLE `fuel_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_product_variants`
--

DROP TABLE IF EXISTS `fuel_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_product_variants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price_difference` decimal(10,0) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products` (`product_id`),
  CONSTRAINT `products` FOREIGN KEY (`product_id`) REFERENCES `fuel_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_product_variants`
--

LOCK TABLES `fuel_product_variants` WRITE;
/*!40000 ALTER TABLE `fuel_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_products`
--

DROP TABLE IF EXISTS `fuel_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(5,2) unsigned NOT NULL,
  `stock` int(3) unsigned NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_products`
--

LOCK TABLES `fuel_products` WRITE;
/*!40000 ALTER TABLE `fuel_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_users`
--

DROP TABLE IF EXISTS `fuel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `group` int(11) NOT NULL DEFAULT '1',
  `email` varchar(255) NOT NULL,
  `last_login` varchar(25) NOT NULL,
  `login_hash` varchar(255) NOT NULL,
  `profile_fields` text NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_users`
--

LOCK TABLES `fuel_users` WRITE;
/*!40000 ALTER TABLE `fuel_users` DISABLE KEYS */;
INSERT INTO `fuel_users` VALUES (1,'Admin','p710MsEBUgPeIvU/CjjCkXNcOP6cld3AQHhYPnz9SxM=',2,'admin@adam.com','1398695202','54e6d66427ff9d24a1c098748443b4e36fb27657','a:1:{s:8:\"fullname\";s:5:\"Admin\";}',1398695202,0);
/*!40000 ALTER TABLE `fuel_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_users_clients`
--

DROP TABLE IF EXISTS `fuel_users_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_users_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `client_id` varchar(32) NOT NULL DEFAULT '',
  `client_secret` varchar(32) NOT NULL DEFAULT '',
  `redirect_uri` varchar(255) NOT NULL DEFAULT '',
  `auto_approve` tinyint(1) NOT NULL DEFAULT '0',
  `autonomous` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('development','pending','approved','rejected') NOT NULL DEFAULT 'development',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `notes` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_users_clients`
--

LOCK TABLES `fuel_users_clients` WRITE;
/*!40000 ALTER TABLE `fuel_users_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_users_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_users_providers`
--

DROP TABLE IF EXISTS `fuel_users_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_users_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `provider` varchar(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires` int(12) DEFAULT '0',
  `refresh_token` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_users_providers`
--

LOCK TABLES `fuel_users_providers` WRITE;
/*!40000 ALTER TABLE `fuel_users_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_users_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_users_scopes`
--

DROP TABLE IF EXISTS `fuel_users_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_users_scopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_users_scopes`
--

LOCK TABLES `fuel_users_scopes` WRITE;
/*!40000 ALTER TABLE `fuel_users_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_users_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_users_sessions`
--

DROP TABLE IF EXISTS `fuel_users_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_users_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(32) NOT NULL DEFAULT '',
  `redirect_uri` varchar(255) NOT NULL DEFAULT '',
  `type_id` varchar(64) NOT NULL,
  `type` enum('user','auto') NOT NULL DEFAULT 'user',
  `code` text NOT NULL,
  `access_token` varchar(50) NOT NULL DEFAULT '',
  `stage` enum('request','granted') NOT NULL DEFAULT 'request',
  `first_requested` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `limited_access` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oauth_sessions_ibfk_1` (`client_id`),
  CONSTRAINT `oauth_sessions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `fuel_users_clients` (`client_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_users_sessions`
--

LOCK TABLES `fuel_users_sessions` WRITE;
/*!40000 ALTER TABLE `fuel_users_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_users_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_users_sessionscopes`
--

DROP TABLE IF EXISTS `fuel_users_sessionscopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_users_sessionscopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `access_token` varchar(50) NOT NULL DEFAULT '',
  `scope` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `access_token` (`access_token`),
  KEY `scope` (`scope`),
  CONSTRAINT `oauth_sessionscopes_ibfk_1` FOREIGN KEY (`scope`) REFERENCES `fuel_users_scopes` (`scope`),
  CONSTRAINT `oauth_sessionscopes_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `fuel_users_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_users_sessionscopes`
--

LOCK TABLES `fuel_users_sessionscopes` WRITE;
/*!40000 ALTER TABLE `fuel_users_sessionscopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuel_users_sessionscopes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-28 15:27:18

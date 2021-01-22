-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: openmenu
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `FoodMenu`
--

DROP TABLE IF EXISTS `FoodMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FoodMenu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `short_description` longtext,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `retail_price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `tax_included` tinyint(1) DEFAULT NULL,
  `point` decimal(10,2) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FoodMenu_sku_unique` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodMenu`
--

LOCK TABLES `FoodMenu` WRITE;
/*!40000 ALTER TABLE `FoodMenu` DISABLE KEYS */;
INSERT INTO `FoodMenu` VALUES (1,'CURRMEE','Curry Mee 1',NULL,NULL,7.50,7.50,NULL,1,7.00,'2021-01-03 08:16:34',1,1,'2020-12-26 04:14:00','2021-01-03 08:16:34');
/*!40000 ALTER TABLE `FoodMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodMenu__bundle_food_menus`
--

DROP TABLE IF EXISTS `FoodMenu__bundle_food_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FoodMenu__bundle_food_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FoodMenu_id` int(11) DEFAULT NULL,
  `food-menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodMenu__bundle_food_menus`
--

LOCK TABLES `FoodMenu__bundle_food_menus` WRITE;
/*!40000 ALTER TABLE `FoodMenu__bundle_food_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `FoodMenu__bundle_food_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodMenu_components`
--

DROP TABLE IF EXISTS `FoodMenu_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FoodMenu_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `FoodMenu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FoodMenu_id_fk` (`FoodMenu_id`),
  CONSTRAINT `FoodMenu_id_fk` FOREIGN KEY (`FoodMenu_id`) REFERENCES `FoodMenu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodMenu_components`
--

LOCK TABLES `FoodMenu_components` WRITE;
/*!40000 ALTER TABLE `FoodMenu_components` DISABLE KEYS */;
INSERT INTO `FoodMenu_components` VALUES (1,'Options',1,'components_attribute_item_options',1,1),(2,'Options',2,'components_attribute_item_options',2,1),(3,'AddOns',1,'components_attribute_item_addons',1,1),(4,'AddOns',2,'components_attribute_item_addons',2,1);
/*!40000 ALTER TABLE `FoodMenu_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaas`
--

DROP TABLE IF EXISTS `aaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `stuff` longtext,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaas`
--

LOCK TABLES `aaas` WRITE;
/*!40000 ALTER TABLE `aaas` DISABLE KEYS */;
INSERT INTO `aaas` VALUES (1,'ddd','{\"aaa\":1}',NULL,1,1,'2020-12-26 04:06:53','2020-12-26 04:06:53');
/*!40000 ALTER TABLE `aaas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audience_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `xxx` varchar(255) DEFAULT NULL,
  `bbb` varchar(255) DEFAULT NULL,
  `kkk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_attribute_item_addons`
--

DROP TABLE IF EXISTS `components_attribute_item_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_attribute_item_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `description` longtext,
  `selling_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_attribute_item_addons`
--

LOCK TABLES `components_attribute_item_addons` WRITE;
/*!40000 ALTER TABLE `components_attribute_item_addons` DISABLE KEYS */;
INSERT INTO `components_attribute_item_addons` VALUES (1,'Boiled Egg','BEGG',NULL,1.50),(2,'SAMBAL','SAMBAL',NULL,0.00);
/*!40000 ALTER TABLE `components_attribute_item_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_attribute_item_options`
--

DROP TABLE IF EXISTS `components_attribute_item_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_attribute_item_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price_adjustment` decimal(10,2) DEFAULT NULL,
  `description` longtext,
  `sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_attribute_item_options`
--

LOCK TABLES `components_attribute_item_options` WRITE;
/*!40000 ALTER TABLE `components_attribute_item_options` DISABLE KEYS */;
INSERT INTO `components_attribute_item_options` VALUES (1,'Large',1.00,NULL,'CURRYMEE-L'),(2,'CURRYMEE',0.00,NULL,'CURRYMEE');
/*!40000 ALTER TABLE `components_attribute_item_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_attribute_order_items`
--

DROP TABLE IF EXISTS `components_attribute_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_attribute_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `discount_seller` decimal(10,2) DEFAULT NULL,
  `discount_platform` decimal(10,2) DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `discount_total` decimal(10,2) DEFAULT NULL,
  `retail_price` decimal(10,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `food_menu` int(11) DEFAULT NULL,
  `addon_total` decimal(10,2) DEFAULT NULL,
  `tax_included` tinyint(1) DEFAULT NULL,
  `point_total` decimal(10,2) DEFAULT NULL,
  `sales_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_attribute_order_items`
--

LOCK TABLES `components_attribute_order_items` WRITE;
/*!40000 ALTER TABLE `components_attribute_order_items` DISABLE KEYS */;
INSERT INTO `components_attribute_order_items` VALUES (3,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(4,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(5,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(6,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(7,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(8,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(9,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(10,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(11,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(12,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(13,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(14,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(15,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(16,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(17,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(18,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(19,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(20,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(21,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(22,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(23,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(24,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(25,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(26,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(27,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(28,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(29,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(30,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(31,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(32,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(33,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(34,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(35,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(36,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(37,'CURRMEE',2.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,15.00),(48,'CURRMEE',1.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,7.50),(49,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50),(50,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50),(51,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50),(52,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50),(55,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50),(56,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50),(57,'CURRMEE',5.00,7.50,NULL,NULL,NULL,NULL,0.00,7.50,'Curry Mee 1',1,0.00,1,NULL,37.50);
/*!40000 ALTER TABLE `components_attribute_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_attribute_order_items_components`
--

DROP TABLE IF EXISTS `components_attribute_order_items_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_attribute_order_items_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_attribute_order_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_attribute_order_item_id_fk` (`components_attribute_order_item_id`),
  CONSTRAINT `components_attribute_order_item_id_fk` FOREIGN KEY (`components_attribute_order_item_id`) REFERENCES `components_attribute_order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_attribute_order_items_components`
--

LOCK TABLES `components_attribute_order_items_components` WRITE;
/*!40000 ALTER TABLE `components_attribute_order_items_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_attribute_order_items_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_attribute_product_attributes`
--

DROP TABLE IF EXISTS `components_attribute_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_attribute_product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `retail_price` decimal(10,2) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `package_length` decimal(10,2) DEFAULT NULL,
  `package_weight` decimal(10,2) DEFAULT NULL,
  `package_height` decimal(10,2) DEFAULT NULL,
  `package_width` decimal(10,2) DEFAULT NULL,
  `package_content` longtext,
  `color_code` varchar(255) DEFAULT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `retail_price_currency` varchar(255) DEFAULT NULL,
  `uk_size` varchar(255) DEFAULT NULL,
  `upc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_attribute_product_attributes`
--

LOCK TABLES `components_attribute_product_attributes` WRITE;
/*!40000 ALTER TABLE `components_attribute_product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_attribute_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (1,'model_def_strapi::core-store','{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}','object',NULL,NULL),(2,'model_def_attribute.item-addon','{\"uid\":\"attribute.item-addon\",\"collectionName\":\"components_attribute_item_addons\",\"info\":{\"name\":\"ItemAddon\",\"icon\":\"apple-alt\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"sku\":{\"type\":\"string\"},\"image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"description\":{\"type\":\"richtext\"},\"selling_price\":{\"type\":\"decimal\"}}}','object',NULL,NULL),(3,'model_def_attribute.item-option','{\"uid\":\"attribute.item-option\",\"collectionName\":\"components_attribute_item_options\",\"info\":{\"name\":\"ItemOption\",\"icon\":\"grip-horizontal\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"price_adjustment\":{\"type\":\"decimal\",\"default\":0,\"required\":true},\"image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"description\":{\"type\":\"richtext\"},\"sku\":{\"type\":\"string\",\"required\":true}}}','object',NULL,NULL),(4,'model_def_attribute.order-item','{\"uid\":\"attribute.order-item\",\"collectionName\":\"components_attribute_order_items\",\"info\":{\"name\":\"OrderItem\",\"icon\":\"box\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"sku\":{\"type\":\"string\"},\"quantity\":{\"type\":\"decimal\",\"required\":true},\"selling_price\":{\"type\":\"decimal\"},\"tax\":{\"type\":\"decimal\"},\"discount_seller\":{\"type\":\"decimal\"},\"discount_platform\":{\"type\":\"decimal\"},\"discount_code\":{\"type\":\"string\"},\"discount_total\":{\"type\":\"decimal\"},\"retail_price\":{\"type\":\"decimal\"},\"name\":{\"type\":\"string\"},\"food_menu\":{\"model\":\"food-menu\"},\"option\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.item-option\"},\"addon\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.item-addon\"},\"addon_total\":{\"type\":\"decimal\"},\"tax_included\":{\"type\":\"boolean\",\"default\":true,\"required\":true},\"point_total\":{\"type\":\"decimal\"},\"sales_total\":{\"type\":\"decimal\"}}}','object',NULL,NULL),(5,'model_def_attribute.product-attributes','{\"uid\":\"attribute.product-attributes\",\"collectionName\":\"components_attribute_product_attributes\",\"info\":{\"name\":\"product_attributes\",\"icon\":\"boxes\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"sku\":{\"type\":\"string\",\"required\":true},\"retail_price\":{\"type\":\"decimal\"},\"color\":{\"type\":\"string\"},\"package_length\":{\"type\":\"decimal\"},\"package_weight\":{\"type\":\"decimal\"},\"package_height\":{\"type\":\"decimal\"},\"package_width\":{\"type\":\"decimal\"},\"package_content\":{\"type\":\"richtext\"},\"images\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"color_code\":{\"type\":\"string\"},\"dimension\":{\"type\":\"string\"},\"retail_price_currency\":{\"type\":\"string\"},\"uk_size\":{\"type\":\"string\"},\"upc\":{\"type\":\"string\"}}}','object',NULL,NULL),(6,'model_def_attribute.product-feature','{\"uid\":\"attribute.product-feature\",\"collectionName\":\"product_feature\",\"info\":{\"name\":\"Product feature\",\"icon\":\"info\"},\"options\":{\"timestamps\":false},\"attributes\":{\"feature\":{\"type\":\"text\"}}}','object',NULL,NULL),(7,'model_def_application::aaa.aaa','{\"uid\":\"application::aaa.aaa\",\"collectionName\":\"aaas\",\"kind\":\"collectionType\",\"info\":{\"name\":\"aaa\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"name\":{\"type\":\"string\"},\"stuff\":{\"type\":\"json\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(8,'model_def_application::brand.brand','{\"uid\":\"application::brand.brand\",\"collectionName\":\"brand\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Brand\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(9,'model_def_application::channel.channel','{\"uid\":\"application::channel.channel\",\"collectionName\":\"channel\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Channel\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"attributes\":{\"name\":{\"type\":\"string\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(10,'model_def_application::country.country','{\"uid\":\"application::country.country\",\"collectionName\":\"country\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Country\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\"},\"code\":{\"type\":\"string\"},\"order\":{\"via\":\"recipient_country\",\"model\":\"order\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(11,'model_def_application::food-menu.food-menu','{\"uid\":\"application::food-menu.food-menu\",\"collectionName\":\"FoodMenu\",\"kind\":\"collectionType\",\"info\":{\"name\":\"FoodMenu\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"sku\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"name\":{\"type\":\"string\"},\"description\":{\"type\":\"richtext\"},\"short_description\":{\"type\":\"text\"},\"selling_price\":{\"type\":\"decimal\"},\"retail_price\":{\"type\":\"decimal\"},\"images\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"thumb\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Options\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.item-option\"},\"AddOns\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.item-addon\"},\"bundle_food_menus\":{\"collection\":\"food-menu\",\"attribute\":\"food-menu\",\"column\":\"id\",\"isVirtual\":true},\"tax\":{\"type\":\"decimal\"},\"tax_included\":{\"type\":\"boolean\",\"default\":true,\"required\":true},\"point\":{\"type\":\"decimal\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(12,'model_def_application::model.model','{\"uid\":\"application::model.model\",\"collectionName\":\"model\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Model\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\"},\"brand\":{\"model\":\"brand\",\"via\":\"models\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(13,'model_def_application::order.order','{\"uid\":\"application::order.order\",\"collectionName\":\"orders\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Order\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"attributes\":{\"confirmed_at\":{\"type\":\"datetime\"},\"confirmed\":{\"type\":\"boolean\",\"default\":false},\"paid\":{\"type\":\"boolean\",\"default\":false},\"paid_at\":{\"type\":\"datetime\"},\"discount_seller\":{\"type\":\"decimal\"},\"discount_platform\":{\"type\":\"decimal\"},\"discount_code\":{\"type\":\"string\"},\"channel_order_id\":{\"type\":\"string\"},\"channel\":{\"type\":\"enumeration\",\"enum\":[\"dinein\",\"delivery\",\"pickup\",\"grab\",\"foodpanda\"]},\"request_delivery_at\":{\"type\":\"datetime\"},\"shipping_at\":{\"type\":\"datetime\"},\"recipient_name\":{\"type\":\"string\"},\"recipient_address\":{\"type\":\"richtext\"},\"recipient_contact\":{\"type\":\"string\"},\"recipient_postcode\":{\"type\":\"string\"},\"recipient_country\":{\"model\":\"country\",\"via\":\"order\"},\"order_at\":{\"type\":\"datetime\"},\"recipient_state\":{\"type\":\"string\"},\"recipient_city\":{\"type\":\"string\"},\"shipping_status\":{\"type\":\"enumeration\",\"enum\":[\"pending\",\"shipped\",\"delivered\",\"failed\",\"to_return\",\"returned\",\"cancel\"]},\"state\":{\"type\":\"enumeration\",\"enum\":[\"created\",\"confirmed\",\"delivered\",\"cancelled\"],\"default\":\"created\",\"required\":true},\"channel_updated_at\":{\"type\":\"datetime\"},\"shipping_method\":{\"model\":\"shipping-method\",\"via\":\"orders\"},\"shipping_fee\":{\"type\":\"decimal\"},\"sales_total\":{\"type\":\"decimal\"},\"paid_total\":{\"type\":\"decimal\"},\"tax\":{\"type\":\"decimal\"},\"order_id\":{\"type\":\"string\",\"unique\":true},\"items\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.order-item\"},\"addon_total\":{\"type\":\"decimal\"},\"discount_total\":{\"type\":\"decimal\"},\"point_total\":{\"type\":\"decimal\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(14,'model_def_application::product-attribute-pricing.product-attribute-pricing','{\"uid\":\"application::product-attribute-pricing.product-attribute-pricing\",\"collectionName\":\"product_attribute_pricing\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Product Attribute Pricing\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"country\":{\"model\":\"country\",\"via\":\"product_attribute_pricings\"},\"channel\":{\"via\":\"product_attribute_pricings\",\"model\":\"channel\"},\"date_from\":{\"type\":\"datetime\"},\"date_to\":{\"type\":\"datetime\"},\"selling_price\":{\"type\":\"decimal\",\"required\":true},\"attribute_sku\":{\"type\":\"string\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(15,'model_def_application::product-category.product-category','{\"uid\":\"application::product-category.product-category\",\"collectionName\":\"product_categories\",\"kind\":\"collectionType\",\"info\":{\"name\":\"product_category\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\"},\"sap_code\":{\"type\":\"string\",\"maxLength\":50},\"laz_code\":{\"type\":\"string\",\"maxLength\":50},\"laz_name\":{\"type\":\"string\"},\"parent_category\":{\"model\":\"product-category\",\"via\":\"product_categories\"},\"product_categories\":{\"collection\":\"product-category\",\"via\":\"parent_category\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(16,'model_def_application::product-pricing.product-pricing','{\"uid\":\"application::product-pricing.product-pricing\",\"collectionName\":\"product_pricing\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Product pricing\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"date_from\":{\"type\":\"datetime\"},\"date_to\":{\"type\":\"datetime\"},\"selling_price\":{\"type\":\"decimal\"},\"channel\":{\"via\":\"product_pricings\",\"model\":\"channel\"},\"country\":{\"model\":\"country\",\"via\":\"product_pricings\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(17,'model_def_application::product-upload.product-upload','{\"uid\":\"application::product-upload.product-upload\",\"collectionName\":\"product_upload\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Product upload\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"upload\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"files\"],\"plugin\":\"upload\",\"required\":true},\"status\":{\"type\":\"enumeration\",\"enum\":[\"pending\",\"processing\",\"success\",\"failed\"],\"required\":true,\"default\":\"pending\"},\"logs\":{\"type\":\"richtext\"},\"result\":{\"type\":\"text\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(18,'model_def_application::product.product','{\"uid\":\"application::product.product\",\"collectionName\":\"products\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Product\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"description\":{\"type\":\"richtext\"},\"thumb\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"images\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"sku\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"uom\":{\"type\":\"string\"},\"material_name\":{\"type\":\"text\"},\"material_short_name\":{\"type\":\"string\"},\"season_code\":{\"type\":\"string\"},\"season_year\":{\"type\":\"string\"},\"retail_price_currency\":{\"type\":\"string\"},\"size\":{\"type\":\"string\"},\"age_range\":{\"type\":\"string\"},\"product_pricings\":{\"collection\":\"product-pricing\",\"via\":\"product\",\"isVirtual\":true},\"model\":{\"model\":\"model\",\"via\":\"products\"},\"product_attributes\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.product-attributes\"},\"product_attribute_pricings\":{\"collection\":\"product-attribute-pricing\",\"via\":\"product\",\"isVirtual\":true},\"features\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"attribute.product-feature\"},\"gender\":{\"type\":\"enumeration\",\"enum\":[\"both\",\"male\",\"female\"]},\"push_description\":{\"type\":\"richtext\"},\"for_child\":{\"type\":\"boolean\"},\"retail_price\":{\"type\":\"decimal\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(19,'model_def_application::shipping-method.shipping-method','{\"uid\":\"application::shipping-method.shipping-method\",\"collectionName\":\"shipping_methods\",\"kind\":\"collectionType\",\"info\":{\"name\":\"ShippingMethod\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"name\":{\"type\":\"string\"},\"delivery_type\":{\"type\":\"enumeration\",\"enum\":[\"express\",\"normal\"]},\"fee\":{\"type\":\"decimal\"},\"tax_percent\":{\"type\":\"decimal\"},\"orders\":{\"via\":\"shipping_method\",\"collection\":\"order\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(20,'model_def_strapi::webhooks','{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}','object',NULL,NULL),(21,'model_def_strapi::permission','{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"fields\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}','object',NULL,NULL),(22,'model_def_strapi::role','{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}','object',NULL,NULL),(23,'model_def_strapi::user','{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true}}}','object',NULL,NULL),(24,'model_def_plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(25,'model_def_plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(26,'model_def_plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(27,'model_def_plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"subscribe\":{\"type\":\"boolean\",\"default\":true,\"required\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(28,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true}','object','development',''),(29,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\"},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]}}','object','',''),(30,'plugin_content_manager_configuration_components::attribute.item-addon','{\"uid\":\"attribute.item-addon\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"sku\":{\"edit\":{\"label\":\"Sku\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sku\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Image\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":false,\"sortable\":false}},\"selling_price\":{\"edit\":{\"label\":\"Selling_price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Selling_price\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"sku\",\"image\"],\"edit\":[[{\"name\":\"sku\",\"size\":6},{\"name\":\"name\",\"size\":6}],[{\"name\":\"selling_price\",\"size\":4},{\"name\":\"image\",\"size\":6}],[{\"name\":\"description\",\"size\":12}]],\"editRelations\":[]},\"isComponent\":true}','object','',''),(31,'plugin_content_manager_configuration_components::attribute.item-option','{\"uid\":\"attribute.item-option\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"price_adjustment\":{\"edit\":{\"label\":\"Price_adjustment\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Price_adjustment\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Image\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":false,\"sortable\":false}},\"sku\":{\"edit\":{\"label\":\"Sku\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sku\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"price_adjustment\",\"image\"],\"edit\":[[{\"name\":\"sku\",\"size\":6},{\"name\":\"name\",\"size\":6}],[{\"name\":\"price_adjustment\",\"size\":4},{\"name\":\"image\",\"size\":6}],[{\"name\":\"description\",\"size\":12}]],\"editRelations\":[]},\"isComponent\":true}','object','',''),(32,'plugin_content_manager_configuration_components::attribute.order-item','{\"uid\":\"attribute.order-item\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"sku\",\"defaultSortBy\":\"sku\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"sku\":{\"edit\":{\"label\":\"Sku\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sku\",\"searchable\":true,\"sortable\":true}},\"quantity\":{\"edit\":{\"label\":\"Quantity\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Quantity\",\"searchable\":true,\"sortable\":true}},\"selling_price\":{\"edit\":{\"label\":\"Selling_price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Selling_price\",\"searchable\":true,\"sortable\":true}},\"tax\":{\"edit\":{\"label\":\"Tax\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tax\",\"searchable\":true,\"sortable\":true}},\"discount_seller\":{\"edit\":{\"label\":\"Discount_seller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_seller\",\"searchable\":true,\"sortable\":true}},\"discount_platform\":{\"edit\":{\"label\":\"Discount_platform\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_platform\",\"searchable\":true,\"sortable\":true}},\"discount_code\":{\"edit\":{\"label\":\"Discount_code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_code\",\"searchable\":true,\"sortable\":true}},\"discount_total\":{\"edit\":{\"label\":\"Discount_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_total\",\"searchable\":true,\"sortable\":true}},\"retail_price\":{\"edit\":{\"label\":\"Retail_price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Retail_price\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"food_menu\":{\"edit\":{\"label\":\"Food_menu\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"sku\"},\"list\":{\"label\":\"Food_menu\",\"searchable\":false,\"sortable\":false}},\"option\":{\"edit\":{\"label\":\"Option\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Option\",\"searchable\":false,\"sortable\":false}},\"addon\":{\"edit\":{\"label\":\"Addon\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Addon\",\"searchable\":false,\"sortable\":false}},\"addon_total\":{\"edit\":{\"label\":\"Addon_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Addon_total\",\"searchable\":true,\"sortable\":true}},\"tax_included\":{\"edit\":{\"label\":\"Tax_included\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tax_included\",\"searchable\":true,\"sortable\":true}},\"point_total\":{\"edit\":{\"label\":\"Point_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Point_total\",\"searchable\":true,\"sortable\":true}},\"sales_total\":{\"edit\":{\"label\":\"Sales_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sales_total\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"sku\",\"quantity\",\"selling_price\"],\"edit\":[[{\"name\":\"sku\",\"size\":6},{\"name\":\"quantity\",\"size\":4}],[{\"name\":\"selling_price\",\"size\":4},{\"name\":\"tax\",\"size\":4},{\"name\":\"discount_seller\",\"size\":4}],[{\"name\":\"discount_platform\",\"size\":4},{\"name\":\"discount_code\",\"size\":6}],[{\"name\":\"discount_total\",\"size\":4},{\"name\":\"retail_price\",\"size\":4}],[{\"name\":\"name\",\"size\":6},{\"name\":\"food_menu\",\"size\":6}],[{\"name\":\"option\",\"size\":12}],[{\"name\":\"addon\",\"size\":12}],[{\"name\":\"addon_total\",\"size\":4},{\"name\":\"tax_included\",\"size\":4},{\"name\":\"point_total\",\"size\":4}],[{\"name\":\"sales_total\",\"size\":4}]],\"editRelations\":[]},\"isComponent\":true}','object','',''),(33,'plugin_content_manager_configuration_components::attribute.product-attributes','{\"uid\":\"attribute.product-attributes\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"sku\",\"defaultSortBy\":\"sku\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"sku\":{\"edit\":{\"label\":\"Sku\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sku\",\"searchable\":true,\"sortable\":true}},\"retail_price\":{\"edit\":{\"label\":\"Retail_price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Retail_price\",\"searchable\":true,\"sortable\":true}},\"color\":{\"edit\":{\"label\":\"Color\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Color\",\"searchable\":true,\"sortable\":true}},\"package_length\":{\"edit\":{\"label\":\"Package_length\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Package_length\",\"searchable\":true,\"sortable\":true}},\"package_weight\":{\"edit\":{\"label\":\"Package_weight\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Package_weight\",\"searchable\":true,\"sortable\":true}},\"package_height\":{\"edit\":{\"label\":\"Package_height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Package_height\",\"searchable\":true,\"sortable\":true}},\"package_width\":{\"edit\":{\"label\":\"Package_width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Package_width\",\"searchable\":true,\"sortable\":true}},\"package_content\":{\"edit\":{\"label\":\"Package_content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Package_content\",\"searchable\":false,\"sortable\":false}},\"images\":{\"edit\":{\"label\":\"Images\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Images\",\"searchable\":false,\"sortable\":false}},\"color_code\":{\"edit\":{\"label\":\"Color_code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Color_code\",\"searchable\":true,\"sortable\":true}},\"dimension\":{\"edit\":{\"label\":\"Dimension\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dimension\",\"searchable\":true,\"sortable\":true}},\"retail_price_currency\":{\"edit\":{\"label\":\"Retail_price_currency\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Retail_price_currency\",\"searchable\":true,\"sortable\":true}},\"uk_size\":{\"edit\":{\"label\":\"Uk_size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Uk_size\",\"searchable\":true,\"sortable\":true}},\"upc\":{\"edit\":{\"label\":\"Upc\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Upc\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"sku\",\"retail_price\",\"color\"],\"edit\":[[{\"name\":\"sku\",\"size\":6},{\"name\":\"retail_price\",\"size\":4}],[{\"name\":\"color\",\"size\":6},{\"name\":\"package_length\",\"size\":4}],[{\"name\":\"package_weight\",\"size\":4},{\"name\":\"package_height\",\"size\":4},{\"name\":\"package_width\",\"size\":4}],[{\"name\":\"package_content\",\"size\":12}],[{\"name\":\"images\",\"size\":6},{\"name\":\"color_code\",\"size\":6}],[{\"name\":\"dimension\",\"size\":6},{\"name\":\"retail_price_currency\",\"size\":6}],[{\"name\":\"uk_size\",\"size\":6},{\"name\":\"upc\",\"size\":6}]],\"editRelations\":[]},\"isComponent\":true}','object','',''),(34,'plugin_content_manager_configuration_components::attribute.product-feature','{\"uid\":\"attribute.product-feature\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"feature\":{\"edit\":{\"label\":\"Feature\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Feature\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"feature\"],\"edit\":[[{\"name\":\"feature\",\"size\":6}]],\"editRelations\":[]},\"isComponent\":true}','object','',''),(35,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),(38,'plugin_content_manager_configuration_content_types::application::channel.channel','{\"uid\":\"application::channel.channel\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\"],\"edit\":[[{\"name\":\"name\",\"size\":6}]],\"editRelations\":[]}}','object','',''),(39,'plugin_content_manager_configuration_content_types::application::country.country','{\"uid\":\"application::country.country\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"order\":{\"edit\":{\"label\":\"Order\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"discount_code\"},\"list\":{\"label\":\"Order\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]],\"editRelations\":[\"order\"]}}','object','',''),(40,'plugin_content_manager_configuration_content_types::application::food-menu.food-menu','{\"uid\":\"application::food-menu.food-menu\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"sku\",\"defaultSortBy\":\"sku\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"sku\":{\"edit\":{\"label\":\"Sku\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sku\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":false,\"sortable\":false}},\"short_description\":{\"edit\":{\"label\":\"Short_description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Short_description\",\"searchable\":true,\"sortable\":true}},\"selling_price\":{\"edit\":{\"label\":\"Selling_price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Selling_price\",\"searchable\":true,\"sortable\":true}},\"retail_price\":{\"edit\":{\"label\":\"Retail_price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Retail_price\",\"searchable\":true,\"sortable\":true}},\"images\":{\"edit\":{\"label\":\"Images\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Images\",\"searchable\":false,\"sortable\":false}},\"thumb\":{\"edit\":{\"label\":\"Thumb\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Thumb\",\"searchable\":false,\"sortable\":false}},\"Options\":{\"edit\":{\"label\":\"Options\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Options\",\"searchable\":false,\"sortable\":false}},\"AddOns\":{\"edit\":{\"label\":\"AddOns\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AddOns\",\"searchable\":false,\"sortable\":false}},\"bundle_food_menus\":{\"edit\":{\"label\":\"Bundle_food_menus\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"sku\"},\"list\":{\"label\":\"Bundle_food_menus\",\"searchable\":false,\"sortable\":false}},\"tax\":{\"edit\":{\"label\":\"Tax\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tax\",\"searchable\":true,\"sortable\":true}},\"tax_included\":{\"edit\":{\"label\":\"Tax_included\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tax_included\",\"searchable\":true,\"sortable\":true}},\"point\":{\"edit\":{\"label\":\"Point\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Point\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"sku\",\"name\",\"short_description\"],\"editRelations\":[\"bundle_food_menus\"],\"edit\":[[{\"name\":\"sku\",\"size\":6},{\"name\":\"name\",\"size\":6}],[{\"name\":\"description\",\"size\":12}],[{\"name\":\"short_description\",\"size\":6},{\"name\":\"selling_price\",\"size\":4}],[{\"name\":\"retail_price\",\"size\":4},{\"name\":\"images\",\"size\":6}],[{\"name\":\"thumb\",\"size\":6}],[{\"name\":\"Options\",\"size\":12}],[{\"name\":\"AddOns\",\"size\":12}],[{\"name\":\"tax\",\"size\":4},{\"name\":\"tax_included\",\"size\":4},{\"name\":\"point\",\"size\":4}]]}}','object','',''),(42,'plugin_content_manager_configuration_content_types::application::order.order','{\"uid\":\"application::order.order\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"order_id\",\"defaultSortBy\":\"discount_code\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"items\":{\"edit\":{\"label\":\"Items\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Items\",\"searchable\":false,\"sortable\":false}},\"channel\":{\"edit\":{\"label\":\"Channel\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Channel\",\"searchable\":true,\"sortable\":true}},\"shipping_status\":{\"edit\":{\"label\":\"Shipping_status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Shipping_status\",\"searchable\":true,\"sortable\":true}},\"shipping_at\":{\"edit\":{\"label\":\"Shipping_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Shipping_at\",\"searchable\":true,\"sortable\":true}},\"order_at\":{\"edit\":{\"label\":\"Order_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Order_at\",\"searchable\":true,\"sortable\":true}},\"addon_total\":{\"edit\":{\"label\":\"Addon_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Addon_total\",\"searchable\":true,\"sortable\":true}},\"paid_at\":{\"edit\":{\"label\":\"Paid_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Paid_at\",\"searchable\":true,\"sortable\":true}},\"discount_total\":{\"edit\":{\"label\":\"Discount_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_total\",\"searchable\":true,\"sortable\":true}},\"channel_order_id\":{\"edit\":{\"label\":\"Channel_order_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Channel_order_id\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"discount_code\":{\"edit\":{\"label\":\"Discount_code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_code\",\"searchable\":true,\"sortable\":true}},\"recipient_state\":{\"edit\":{\"label\":\"Recipient_state\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Recipient_state\",\"searchable\":true,\"sortable\":true}},\"tax\":{\"edit\":{\"label\":\"Tax\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tax\",\"searchable\":true,\"sortable\":true}},\"paid\":{\"edit\":{\"label\":\"Paid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Paid\",\"searchable\":true,\"sortable\":true}},\"order_id\":{\"edit\":{\"label\":\"Order_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Order_id\",\"searchable\":true,\"sortable\":true}},\"request_delivery_at\":{\"edit\":{\"label\":\"Request_delivery_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Request_delivery_at\",\"searchable\":true,\"sortable\":true}},\"recipient_address\":{\"edit\":{\"label\":\"Recipient_address\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Recipient_address\",\"searchable\":false,\"sortable\":false}},\"recipient_country\":{\"edit\":{\"label\":\"Recipient_country\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Recipient_country\",\"searchable\":false,\"sortable\":false}},\"paid_total\":{\"edit\":{\"label\":\"Paid_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Paid_total\",\"searchable\":true,\"sortable\":true}},\"state\":{\"edit\":{\"label\":\"State\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"State\",\"searchable\":true,\"sortable\":true}},\"recipient_name\":{\"edit\":{\"label\":\"Recipient_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Recipient_name\",\"searchable\":true,\"sortable\":true}},\"discount_platform\":{\"edit\":{\"label\":\"Discount_platform\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_platform\",\"searchable\":true,\"sortable\":true}},\"sales_total\":{\"edit\":{\"label\":\"Sales_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sales_total\",\"searchable\":true,\"sortable\":true}},\"recipient_city\":{\"edit\":{\"label\":\"Recipient_city\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Recipient_city\",\"searchable\":true,\"sortable\":true}},\"shipping_method\":{\"edit\":{\"label\":\"Shipping_method\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Shipping_method\",\"searchable\":false,\"sortable\":false}},\"confirmed_at\":{\"edit\":{\"label\":\"Confirmed_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed_at\",\"searchable\":true,\"sortable\":true}},\"recipient_postcode\":{\"edit\":{\"label\":\"Recipient_postcode\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Recipient_postcode\",\"searchable\":true,\"sortable\":true}},\"channel_updated_at\":{\"edit\":{\"label\":\"Channel_updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Channel_updated_at\",\"searchable\":true,\"sortable\":true}},\"shipping_fee\":{\"edit\":{\"label\":\"Shipping_fee\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Shipping_fee\",\"searchable\":true,\"sortable\":true}},\"point_total\":{\"edit\":{\"label\":\"Point_total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Point_total\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}},\"recipient_contact\":{\"edit\":{\"label\":\"Recipient_contact\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Recipient_contact\",\"searchable\":true,\"sortable\":true}},\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"discount_seller\":{\"edit\":{\"label\":\"Discount_seller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Discount_seller\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"confirmed_at\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"paid\",\"size\":4},{\"name\":\"paid_at\",\"size\":6}],[{\"name\":\"discount_seller\",\"size\":4},{\"name\":\"discount_platform\",\"size\":4}],[{\"name\":\"discount_code\",\"size\":6},{\"name\":\"channel_order_id\",\"size\":6}],[{\"name\":\"channel\",\"size\":6},{\"name\":\"request_delivery_at\",\"size\":6}],[{\"name\":\"shipping_at\",\"size\":6},{\"name\":\"recipient_name\",\"size\":6}],[{\"name\":\"recipient_address\",\"size\":12}],[{\"name\":\"recipient_contact\",\"size\":6},{\"name\":\"recipient_postcode\",\"size\":6}],[{\"name\":\"order_at\",\"size\":6},{\"name\":\"recipient_state\",\"size\":6}],[{\"name\":\"recipient_city\",\"size\":6},{\"name\":\"shipping_status\",\"size\":6}],[{\"name\":\"state\",\"size\":6},{\"name\":\"channel_updated_at\",\"size\":6}],[{\"name\":\"shipping_fee\",\"size\":4},{\"name\":\"sales_total\",\"size\":4},{\"name\":\"paid_total\",\"size\":4}],[{\"name\":\"tax\",\"size\":4},{\"name\":\"order_id\",\"size\":6}],[{\"name\":\"items\",\"size\":12}],[{\"name\":\"addon_total\",\"size\":4},{\"name\":\"discount_total\",\"size\":4},{\"name\":\"point_total\",\"size\":4}]],\"editRelations\":[\"recipient_country\",\"shipping_method\"],\"list\":[\"id\",\"confirmed_at\",\"confirmed\",\"paid\"]}}','object','',''),(48,'plugin_content_manager_configuration_content_types::application::shipping-method.shipping-method','{\"uid\":\"application::shipping-method.shipping-method\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"delivery_type\":{\"edit\":{\"label\":\"Delivery_type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Delivery_type\",\"searchable\":true,\"sortable\":true}},\"fee\":{\"edit\":{\"label\":\"Fee\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Fee\",\"searchable\":true,\"sortable\":true}},\"tax_percent\":{\"edit\":{\"label\":\"Tax_percent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tax_percent\",\"searchable\":true,\"sortable\":true}},\"orders\":{\"edit\":{\"label\":\"Orders\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"discount_code\"},\"list\":{\"label\":\"Orders\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"delivery_type\",\"fee\"],\"editRelations\":[\"orders\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"delivery_type\",\"size\":6}],[{\"name\":\"fee\",\"size\":4},{\"name\":\"tax_percent\",\"size\":4}]]}}','object','',''),(49,'plugin_content_manager_configuration_content_types::strapi::permission','{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"fields\":{\"edit\":{\"label\":\"Fields\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Fields\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"fields\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}','object','',''),(50,'plugin_content_manager_configuration_content_types::strapi::role','{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}','object','',''),(51,'plugin_content_manager_configuration_content_types::strapi::user','{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}','object','',''),(52,'plugin_content_manager_configuration_content_types::plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}','object','',''),(53,'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}','object','',''),(54,'plugin_content_manager_configuration_content_types::plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}','object','',''),(55,'plugin_content_manager_configuration_content_types::plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"subscribe\":{\"edit\":{\"label\":\"Subscribe\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subscribe\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"subscribe\",\"size\":4}]]}}','object','',''),(56,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object','',''),(57,'model_def_plugins::navigation.audience','{\"uid\":\"plugins::navigation.audience\",\"collectionName\":\"audience\",\"kind\":\"collectionType\",\"info\":{\"name\":\"audience\",\"description\":\"\"},\"options\":{\"increments\":true,\"comment\":\"Audience\",\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"key\":{\"type\":\"uid\",\"targetField\":\"name\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(58,'model_def_plugins::navigation.navigation','{\"uid\":\"plugins::navigation.navigation\",\"collectionName\":\"navigations\",\"kind\":\"collectionType\",\"info\":{\"name\":\"navigation\",\"description\":\"Navigation container\"},\"options\":{\"increments\":true,\"isManaged\":false,\"comment\":\"\",\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"slug\":{\"type\":\"uid\",\"target\":\"name\",\"configurable\":false,\"required\":true},\"visible\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"items\":{\"collection\":\"navigationitem\",\"plugin\":\"navigation\",\"via\":\"master\",\"configurable\":false,\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(59,'model_def_plugins::navigation.navigationitem','{\"uid\":\"plugins::navigation.navigationitem\",\"collectionName\":\"navigations_items\",\"kind\":\"collectionType\",\"info\":{\"name\":\"navigationItem\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"isManaged\":false,\"comment\":\"Navigation Item\"},\"attributes\":{\"title\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"type\":{\"type\":\"enumeration\",\"enum\":[\"INTERNAL\",\"EXTERNAL\"],\"default\":\"INTERNAL\",\"configurable\":false},\"path\":{\"type\":\"uid\",\"targetField\":\"title\",\"configurable\":false},\"externalPath\":{\"type\":\"text\",\"configurable\":false},\"uiRouterKey\":{\"type\":\"string\",\"configurable\":false},\"menuAttached\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"order\":{\"type\":\"integer\",\"default\":0,\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"parent\":{\"columnName\":\"parent\",\"model\":\"navigationItem\",\"plugin\":\"navigation\",\"configurable\":false,\"default\":null},\"master\":{\"columnName\":\"master\",\"model\":\"navigation\",\"plugin\":\"navigation\",\"configurable\":false},\"audience\":{\"collection\":\"audience\",\"plugin\":\"navigation\",\"attribute\":\"audience\",\"column\":\"id\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(60,'plugin_content_manager_configuration_content_types::plugins::navigation.audience','{\"uid\":\"plugins::navigation.audience\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"key\":{\"edit\":{\"label\":\"Key\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Key\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"key\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"key\",\"size\":6}]]}}','object','',''),(61,'plugin_content_manager_configuration_content_types::plugins::navigation.navigation','{\"uid\":\"plugins::navigation.navigation\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"visible\":{\"edit\":{\"label\":\"Visible\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Visible\",\"searchable\":true,\"sortable\":true}},\"items\":{\"edit\":{\"label\":\"Items\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"Items\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"visible\"],\"editRelations\":[\"items\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"visible\",\"size\":4}]]}}','object','',''),(62,'plugin_content_manager_configuration_content_types::plugins::navigation.navigationitem','{\"uid\":\"plugins::navigation.navigationitem\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"uiRouterKey\",\"defaultSortBy\":\"uiRouterKey\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"path\":{\"edit\":{\"label\":\"Path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Path\",\"searchable\":true,\"sortable\":true}},\"externalPath\":{\"edit\":{\"label\":\"ExternalPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ExternalPath\",\"searchable\":true,\"sortable\":true}},\"uiRouterKey\":{\"edit\":{\"label\":\"UiRouterKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"UiRouterKey\",\"searchable\":true,\"sortable\":true}},\"menuAttached\":{\"edit\":{\"label\":\"MenuAttached\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"MenuAttached\",\"searchable\":true,\"sortable\":true}},\"order\":{\"edit\":{\"label\":\"Order\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Order\",\"searchable\":true,\"sortable\":true}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"parent\":{\"edit\":{\"label\":\"Parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"Parent\",\"searchable\":false,\"sortable\":false}},\"master\":{\"edit\":{\"label\":\"Master\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Master\",\"searchable\":false,\"sortable\":false}},\"audience\":{\"edit\":{\"label\":\"Audience\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Audience\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"type\",\"path\"],\"editRelations\":[\"related\",\"parent\",\"master\",\"audience\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"type\",\"size\":6}],[{\"name\":\"path\",\"size\":6},{\"name\":\"externalPath\",\"size\":6}],[{\"name\":\"uiRouterKey\",\"size\":6},{\"name\":\"menuAttached\",\"size\":4}],[{\"name\":\"order\",\"size\":4}]]}}','object','','');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Malaysia','MY',43,1,1,'2021-01-20 09:40:10','2021-01-22 10:32:04');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations`
--

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
INSERT INTO `navigations` VALUES (1,'Main navigation','main-navigation',1,NULL,NULL);
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items`
--

DROP TABLE IF EXISTS `navigations_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `externalPath` longtext,
  `uiRouterKey` varchar(255) DEFAULT NULL,
  `menuAttached` tinyint(1) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `master` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_items_path_unique` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items`
--

LOCK TABLES `navigations_items` WRITE;
/*!40000 ALTER TABLE `navigations_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items__audience`
--

DROP TABLE IF EXISTS `navigations_items__audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items__audience` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navigations_item_id` int(11) DEFAULT NULL,
  `audience_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items__audience`
--

LOCK TABLES `navigations_items__audience` WRITE;
/*!40000 ALTER TABLE `navigations_items__audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_items__audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_morph`
--

DROP TABLE IF EXISTS `navigations_items_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navigations_items_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_morph`
--

LOCK TABLES `navigations_items_morph` WRITE;
/*!40000 ALTER TABLE `navigations_items_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_items_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `discount_seller` decimal(10,2) DEFAULT NULL,
  `discount_platform` decimal(10,2) DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `channel_order_id` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `request_delivery_at` datetime DEFAULT NULL,
  `shipping_at` datetime DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_address` longtext,
  `recipient_contact` varchar(255) DEFAULT NULL,
  `recipient_postcode` varchar(255) DEFAULT NULL,
  `recipient_country` int(11) DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  `recipient_state` varchar(255) DEFAULT NULL,
  `recipient_city` varchar(255) DEFAULT NULL,
  `shipping_status` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `channel_updated_at` datetime DEFAULT NULL,
  `shipping_method` int(11) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `sales_total` decimal(10,2) DEFAULT NULL,
  `paid_total` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `addon_total` decimal(10,2) DEFAULT NULL,
  `discount_total` decimal(10,2) DEFAULT NULL,
  `point_total` decimal(10,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_id_unique` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,0,0,NULL,0.00,0.00,NULL,NULL,'pickup','2020-12-26 07:30:00',NULL,'James','MY',NULL,NULL,NULL,'2021-01-22 09:41:23',NULL,NULL,NULL,'created',NULL,NULL,NULL,157.50,NULL,0.00,'TKKGDO3ASN',0.00,0.00,147.00,1,1,'2020-12-26 04:35:07','2021-01-22 09:41:23'),(3,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 09:57:38','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'6VKPMYCDAC',0.00,0.00,14.00,NULL,NULL,'2021-01-20 09:57:38','2021-01-20 10:01:06'),(4,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:01:06','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'HZI7060F4W',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:01:06','2021-01-20 10:01:33'),(5,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:01:33','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'O3XDAS4FHB',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:01:33','2021-01-20 10:02:10'),(6,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:02:10','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'L18FP8S2IV',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:02:10','2021-01-20 10:02:25'),(7,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:02:25','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'LMDZKNV0RV',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:02:25','2021-01-20 10:02:33'),(8,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:02:33','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'82WOBMI38F',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:02:33','2021-01-20 10:02:41'),(9,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:02:41','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'0M2O0M3YZ6',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:02:41','2021-01-20 10:02:48'),(10,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:02:48','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'QFPB8VAOZP',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:02:48','2021-01-20 10:02:55'),(11,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:02:55','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'0FZL9ISMGE',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:02:55','2021-01-20 10:03:03'),(12,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:03:03','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'NPG01PPXQP',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:03:03','2021-01-20 10:03:30'),(13,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:03:30','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'B3M8SPMOPI',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:03:30','2021-01-20 10:03:39'),(14,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:03:39','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'UBQZ5VCO0F',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:03:39','2021-01-20 10:04:17'),(15,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:04:17','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'T7A0WXYR3S',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:04:17','2021-01-20 10:04:26'),(16,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:04:25','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'D7AMN8UHB2',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:04:25','2021-01-20 10:04:37'),(17,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:04:37','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'7VQC0JEQT0',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:04:37','2021-01-20 10:04:46'),(18,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:04:45','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'QEG36453XE',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:04:45','2021-01-20 10:05:17'),(19,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:05:17','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'WMP58I1ECC',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:05:17','2021-01-20 10:05:57'),(20,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:05:56','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'MFHS0TADLM',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:05:56','2021-01-20 10:06:13'),(21,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:06:13','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'OSUJX000DQ',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:06:13','2021-01-20 10:07:47'),(22,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:07:47','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'HVPRJTGG94',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:07:47','2021-01-20 10:09:19'),(23,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:09:19','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'VERTZCGW74',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:09:19','2021-01-20 10:15:40'),(24,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:15:40','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'URT9YZ3Q81',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:15:40','2021-01-20 10:28:22'),(25,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:28:21','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'VV0NEKGQP2',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:28:21','2021-01-20 10:29:14'),(26,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:29:14','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'2M0JSFBEPD',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:29:14','2021-01-20 10:30:44'),(27,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:30:44','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'JUUIOPWKT8',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:30:44','2021-01-20 10:32:21'),(28,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:32:21','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'CAKAQTGEN2',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:32:21','2021-01-20 10:46:18'),(29,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:46:18','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'OAX0N2XLUF',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:46:18','2021-01-20 10:48:50'),(30,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-20 10:48:50','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'OGTMUDTSVN',0.00,0.00,14.00,NULL,NULL,'2021-01-20 10:48:50','2021-01-21 03:30:22'),(31,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:30:22','kuala lumpur',NULL,NULL,'created',NULL,NULL,NULL,15.00,NULL,0.00,'1PT9YDFHYN',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:30:22','2021-01-21 03:30:48'),(32,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:30:48','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'7X7957WQDG',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:30:48','2021-01-21 03:30:56'),(33,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:30:56','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'4BCI9G90B6',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:30:56','2021-01-21 03:31:02'),(34,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:31:02','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'EI652ZP95G',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:31:02','2021-01-21 03:41:02'),(35,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:41:03','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'IP82A7XSVA',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:41:02','2021-01-21 03:41:09'),(36,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:41:09','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'YCD6OG2YZG',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:41:08','2021-01-21 03:41:15'),(37,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'james','somewhere',NULL,NULL,NULL,'2021-01-21 03:41:15','kuala lumpur',NULL,NULL,'cancelled',NULL,NULL,NULL,15.00,NULL,0.00,'0P8FFWVG1F',0.00,0.00,14.00,NULL,NULL,'2021-01-21 03:41:14','2021-01-22 10:06:35'),(38,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-01-22 09:59:32',NULL,NULL,NULL,'created',NULL,NULL,NULL,0.00,NULL,0.00,'O7OZABSK85',0.00,0.00,0.00,NULL,NULL,'2021-01-22 09:59:33','2021-01-22 09:59:33'),(39,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'abu',NULL,NULL,NULL,NULL,'2021-01-22 10:12:53',NULL,NULL,NULL,'created',NULL,NULL,NULL,75.00,NULL,0.00,'HWVH49AM7E',0.00,0.00,70.00,NULL,NULL,'2021-01-22 10:00:04','2021-01-22 10:13:17'),(40,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'aaaaa',NULL,NULL,NULL,NULL,'2021-01-22 10:13:17',NULL,NULL,NULL,'cancelled',NULL,NULL,NULL,37.50,NULL,0.00,'YESJS77JSB',0.00,0.00,35.00,NULL,NULL,'2021-01-22 10:13:16','2021-01-22 10:18:48'),(41,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'vvvv',NULL,NULL,NULL,NULL,'2021-01-22 10:18:48',NULL,NULL,NULL,'confirmed',NULL,NULL,NULL,0.00,NULL,0.00,'CU5MJPWM5U',0.00,0.00,0.00,NULL,NULL,'2021-01-22 10:18:48','2021-01-22 10:23:02'),(42,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'dvdsvsdv',NULL,NULL,NULL,NULL,'2021-01-22 10:23:02',NULL,NULL,NULL,'cancelled',NULL,NULL,NULL,0.00,NULL,0.00,'SOKAOMYDJ5',0.00,0.00,0.00,NULL,NULL,'2021-01-22 10:22:48','2021-01-22 10:32:04'),(43,NULL,0,0,NULL,0.00,0.00,NULL,NULL,NULL,NULL,NULL,'yyyy',NULL,NULL,NULL,1,'2021-01-22 10:32:04',NULL,NULL,NULL,'cancelled',NULL,NULL,NULL,0.00,NULL,0.00,'NKE3Q8NVDC',0.00,0.00,0.00,NULL,NULL,'2021-01-22 10:32:04','2021-01-22 10:32:04');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_components`
--

DROP TABLE IF EXISTS `orders_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_fk` (`order_id`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_components`
--

LOCK TABLES `orders_components` WRITE;
/*!40000 ALTER TABLE `orders_components` DISABLE KEYS */;
INSERT INTO `orders_components` VALUES (3,'items',1,'components_attribute_order_items',3,3),(4,'items',1,'components_attribute_order_items',4,4),(5,'items',1,'components_attribute_order_items',5,5),(6,'items',1,'components_attribute_order_items',6,6),(7,'items',1,'components_attribute_order_items',7,7),(8,'items',1,'components_attribute_order_items',8,8),(9,'items',1,'components_attribute_order_items',9,9),(10,'items',1,'components_attribute_order_items',10,10),(11,'items',1,'components_attribute_order_items',11,11),(12,'items',1,'components_attribute_order_items',12,12),(13,'items',1,'components_attribute_order_items',13,13),(14,'items',1,'components_attribute_order_items',14,14),(15,'items',1,'components_attribute_order_items',15,15),(16,'items',1,'components_attribute_order_items',16,16),(17,'items',1,'components_attribute_order_items',17,17),(18,'items',1,'components_attribute_order_items',18,18),(19,'items',1,'components_attribute_order_items',19,19),(20,'items',1,'components_attribute_order_items',20,20),(21,'items',1,'components_attribute_order_items',21,21),(22,'items',1,'components_attribute_order_items',22,22),(23,'items',1,'components_attribute_order_items',23,23),(24,'items',1,'components_attribute_order_items',24,24),(25,'items',1,'components_attribute_order_items',25,25),(26,'items',1,'components_attribute_order_items',26,26),(27,'items',1,'components_attribute_order_items',27,27),(28,'items',1,'components_attribute_order_items',28,28),(29,'items',1,'components_attribute_order_items',29,29),(30,'items',1,'components_attribute_order_items',30,30),(31,'items',1,'components_attribute_order_items',31,31),(32,'items',1,'components_attribute_order_items',32,32),(33,'items',1,'components_attribute_order_items',33,33),(34,'items',1,'components_attribute_order_items',34,34),(35,'items',1,'components_attribute_order_items',35,35),(36,'items',1,'components_attribute_order_items',36,36),(37,'items',1,'components_attribute_order_items',37,37),(48,'items',1,'components_attribute_order_items',48,1),(49,'items',2,'components_attribute_order_items',49,1),(50,'items',3,'components_attribute_order_items',50,1),(51,'items',4,'components_attribute_order_items',51,1),(52,'items',5,'components_attribute_order_items',52,1),(55,'items',1,'components_attribute_order_items',55,39),(56,'items',2,'components_attribute_order_items',56,39),(57,'items',1,'components_attribute_order_items',57,40);
/*!40000 ALTER TABLE `orders_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_pricing`
--

DROP TABLE IF EXISTS `product_attribute_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_pricing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `attribute_sku` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_pricing`
--

LOCK TABLES `product_attribute_pricing` WRITE;
/*!40000 ALTER TABLE `product_attribute_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sap_code` varchar(255) DEFAULT NULL,
  `laz_code` varchar(255) DEFAULT NULL,
  `laz_name` varchar(255) DEFAULT NULL,
  `parent_category` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feature`
--

DROP TABLE IF EXISTS `product_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feature` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feature`
--

LOCK TABLES `product_feature` WRITE;
/*!40000 ALTER TABLE `product_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_pricing`
--

DROP TABLE IF EXISTS `product_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_pricing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_pricing`
--

LOCK TABLES `product_pricing` WRITE;
/*!40000 ALTER TABLE `product_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_upload`
--

DROP TABLE IF EXISTS `product_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `logs` longtext,
  `result` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_upload`
--

LOCK TABLES `product_upload` WRITE;
/*!40000 ALTER TABLE `product_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `sku` varchar(255) NOT NULL,
  `uom` varchar(255) DEFAULT NULL,
  `material_name` longtext,
  `material_short_name` varchar(255) DEFAULT NULL,
  `season_code` varchar(255) DEFAULT NULL,
  `season_year` varchar(255) DEFAULT NULL,
  `retail_price_currency` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `age_range` varchar(255) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `push_description` longtext,
  `for_child` tinyint(1) DEFAULT NULL,
  `retail_price` decimal(10,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_components`
--

DROP TABLE IF EXISTS `products_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_fk` (`product_id`),
  CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_components`
--

LOCK TABLES `products_components` WRITE;
/*!40000 ALTER TABLE `products_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `delivery_type` varchar(255) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `tax_percent` decimal(10,2) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_methods`
--

LOCK TABLES `shipping_methods` WRITE;
/*!40000 ALTER TABLE `shipping_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_administrator`
--

DROP TABLE IF EXISTS `strapi_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_administrator`
--

LOCK TABLES `strapi_administrator` WRITE;
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;
INSERT INTO `strapi_administrator` VALUES (1,'james','tan',NULL,'c00lways@gmail.com','$2a$10$PeMfwmL.gbW4qgrV83vGL.1Z8.bYIHvCQlp9Ps/J.2l8Isx6YYd8O',NULL,NULL,1,NULL),(2,'sys','1','sys','james+1@mercstudioo.com','$2a$10$5y2Rshs.z7i2fNUGsb0x6eYqjbT8IanZR2.DC4f3A/KB4.MN/.Tdm',NULL,'deeaf7934aae8746b77a9e804e89bdb2b690996e',1,NULL);
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_permission`
--

DROP TABLE IF EXISTS `strapi_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fields` longtext,
  `conditions` longtext,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_permission`
--

LOCK TABLES `strapi_permission` WRITE;
/*!40000 ALTER TABLE `strapi_permission` DISABLE KEYS */;
INSERT INTO `strapi_permission` VALUES (4,'plugins::content-manager.explorer.create','application::channel.channel','[\"name\"]','[]',2,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(6,'plugins::content-manager.explorer.create','application::country.country','[\"name\",\"code\",\"order\"]','[]',2,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(8,'plugins::content-manager.explorer.create','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(10,'plugins::content-manager.explorer.create','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(13,'plugins::content-manager.explorer.create','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(16,'plugins::content-manager.explorer.read','application::channel.channel','[\"name\"]','[]',2,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(17,'plugins::content-manager.explorer.read','application::country.country','[\"name\",\"code\",\"order\"]','[]',2,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(18,'plugins::content-manager.explorer.read','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(20,'plugins::content-manager.explorer.read','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(26,'plugins::content-manager.explorer.read','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(29,'plugins::content-manager.explorer.update','application::channel.channel','[\"name\"]','[]',2,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(30,'plugins::content-manager.explorer.update','application::country.country','[\"name\",\"code\",\"order\"]','[]',2,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(31,'plugins::content-manager.explorer.update','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(33,'plugins::content-manager.explorer.update','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(39,'plugins::content-manager.explorer.update','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(42,'plugins::content-manager.explorer.delete','application::channel.channel',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(43,'plugins::content-manager.explorer.delete','application::country.country',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(44,'plugins::content-manager.explorer.delete','application::food-menu.food-menu',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(46,'plugins::content-manager.explorer.delete','application::order.order',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(52,'plugins::content-manager.explorer.delete','application::shipping-method.shipping-method',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(54,'plugins::content-manager.explorer.publish','application::food-menu.food-menu',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(55,'plugins::content-manager.explorer.publish','application::shipping-method.shipping-method',NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(56,'plugins::upload.read',NULL,NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(57,'plugins::upload.assets.create',NULL,NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(58,'plugins::upload.assets.update',NULL,NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(59,'plugins::upload.assets.download',NULL,NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(60,'plugins::upload.assets.copy-link',NULL,NULL,'[]',2,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(63,'plugins::content-manager.explorer.create','application::channel.channel','[\"name\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(64,'plugins::content-manager.explorer.create','application::country.country','[\"name\",\"code\",\"order\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(65,'plugins::content-manager.explorer.create','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(67,'plugins::content-manager.explorer.create','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(73,'plugins::content-manager.explorer.create','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(76,'plugins::content-manager.explorer.read','application::channel.channel','[\"name\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(77,'plugins::content-manager.explorer.read','application::country.country','[\"name\",\"code\",\"order\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(78,'plugins::content-manager.explorer.read','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(80,'plugins::content-manager.explorer.read','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(86,'plugins::content-manager.explorer.read','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:11'),(89,'plugins::content-manager.explorer.update','application::channel.channel','[\"name\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(90,'plugins::content-manager.explorer.update','application::country.country','[\"name\",\"code\",\"order\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2021-01-22 10:21:13'),(91,'plugins::content-manager.explorer.update','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:11','2020-12-26 03:54:12'),(93,'plugins::content-manager.explorer.update','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(99,'plugins::content-manager.explorer.update','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(102,'plugins::content-manager.explorer.delete','application::channel.channel',NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(103,'plugins::content-manager.explorer.delete','application::country.country',NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(104,'plugins::content-manager.explorer.delete','application::food-menu.food-menu',NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(106,'plugins::content-manager.explorer.delete','application::order.order',NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(112,'plugins::content-manager.explorer.delete','application::shipping-method.shipping-method',NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(113,'plugins::upload.read',NULL,NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(114,'plugins::upload.assets.create',NULL,NULL,'[]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(115,'plugins::upload.assets.update',NULL,NULL,'[\"admin::is-creator\"]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(116,'plugins::upload.assets.download',NULL,NULL,'[]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(117,'plugins::upload.assets.copy-link',NULL,NULL,'[]',3,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(121,'plugins::content-manager.explorer.create','application::country.country','[\"name\",\"code\",\"order\"]','[]',1,'2020-12-26 03:54:12','2021-01-22 10:21:13'),(122,'plugins::content-manager.explorer.create','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(124,'plugins::content-manager.explorer.create','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(130,'plugins::content-manager.explorer.create','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(131,'plugins::content-manager.explorer.create','plugins::users-permissions.user','[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmed\",\"blocked\",\"role\",\"subscribe\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(135,'plugins::content-manager.explorer.read','application::country.country','[\"name\",\"code\",\"order\"]','[]',1,'2020-12-26 03:54:12','2021-01-22 10:21:13'),(136,'plugins::content-manager.explorer.read','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(138,'plugins::content-manager.explorer.read','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(144,'plugins::content-manager.explorer.read','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(145,'plugins::content-manager.explorer.read','plugins::users-permissions.user','[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmed\",\"blocked\",\"role\",\"subscribe\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(149,'plugins::content-manager.explorer.update','application::country.country','[\"name\",\"code\",\"order\"]','[]',1,'2020-12-26 03:54:12','2021-01-22 10:21:13'),(150,'plugins::content-manager.explorer.update','application::food-menu.food-menu','[\"sku\",\"name\",\"description\",\"short_description\",\"selling_price\",\"retail_price\",\"images\",\"thumb\",\"Options.name\",\"Options.price_adjustment\",\"Options.image\",\"Options.description\",\"Options.sku\",\"AddOns.name\",\"AddOns.sku\",\"AddOns.image\",\"AddOns.description\",\"AddOns.selling_price\",\"bundle_food_menus\",\"tax\",\"tax_included\",\"point\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(152,'plugins::content-manager.explorer.update','application::order.order','[\"confirmed_at\",\"confirmed\",\"paid\",\"paid_at\",\"discount_seller\",\"discount_platform\",\"discount_code\",\"channel_order_id\",\"channel\",\"request_delivery_at\",\"shipping_at\",\"recipient_name\",\"recipient_address\",\"recipient_contact\",\"recipient_postcode\",\"recipient_country\",\"order_at\",\"recipient_state\",\"recipient_city\",\"shipping_status\",\"state\",\"channel_updated_at\",\"shipping_method\",\"shipping_fee\",\"sales_total\",\"paid_total\",\"tax\",\"order_id\",\"items.sku\",\"items.quantity\",\"items.selling_price\",\"items.tax\",\"items.discount_seller\",\"items.discount_platform\",\"items.discount_code\",\"items.discount_total\",\"items.retail_price\",\"items.name\",\"items.food_menu\",\"items.option.name\",\"items.option.price_adjustment\",\"items.option.image\",\"items.option.description\",\"items.option.sku\",\"items.addon.name\",\"items.addon.sku\",\"items.addon.image\",\"items.addon.description\",\"items.addon.selling_price\",\"items.addon_total\",\"items.tax_included\",\"items.point_total\",\"items.sales_total\",\"addon_total\",\"discount_total\",\"point_total\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(158,'plugins::content-manager.explorer.update','application::shipping-method.shipping-method','[\"name\",\"delivery_type\",\"fee\",\"tax_percent\",\"orders\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(159,'plugins::content-manager.explorer.update','plugins::users-permissions.user','[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmed\",\"blocked\",\"role\",\"subscribe\"]','[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(162,'plugins::content-manager.explorer.delete','application::channel.channel',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(163,'plugins::content-manager.explorer.delete','application::country.country',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(164,'plugins::content-manager.explorer.delete','application::food-menu.food-menu',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(166,'plugins::content-manager.explorer.delete','application::order.order',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(172,'plugins::content-manager.explorer.delete','application::shipping-method.shipping-method',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(173,'plugins::content-manager.explorer.delete','plugins::users-permissions.user',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(175,'plugins::content-manager.explorer.publish','application::food-menu.food-menu',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(176,'plugins::content-manager.explorer.publish','application::shipping-method.shipping-method',NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(177,'plugins::content-type-builder.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(178,'plugins::upload.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(179,'plugins::upload.assets.create',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(180,'plugins::upload.assets.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(181,'plugins::upload.assets.download',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(182,'plugins::upload.assets.copy-link',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(183,'plugins::upload.settings.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(184,'plugins::content-manager.single-types.configure-view',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(185,'plugins::content-manager.collection-types.configure-view',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(186,'plugins::content-manager.components.configure-layout',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(187,'plugins::users-permissions.roles.create',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(188,'plugins::users-permissions.roles.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(189,'plugins::users-permissions.roles.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(190,'plugins::users-permissions.roles.delete',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(191,'plugins::users-permissions.providers.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(192,'plugins::users-permissions.providers.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(193,'plugins::users-permissions.email-templates.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(194,'plugins::users-permissions.email-templates.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(195,'plugins::users-permissions.advanced-settings.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(196,'plugins::users-permissions.advanced-settings.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(197,'admin::marketplace.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(198,'admin::marketplace.plugins.install',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(199,'admin::marketplace.plugins.uninstall',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(200,'admin::webhooks.create',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(201,'admin::webhooks.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(202,'admin::webhooks.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(203,'admin::webhooks.delete',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:12'),(204,'admin::users.create',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:13'),(205,'admin::users.read',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:13'),(206,'admin::users.update',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:13'),(207,'admin::users.delete',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:13'),(208,'admin::roles.create',NULL,NULL,'[]',1,'2020-12-26 03:54:12','2020-12-26 03:54:13'),(209,'admin::roles.read',NULL,NULL,'[]',1,'2020-12-26 03:54:13','2020-12-26 03:54:13'),(210,'admin::roles.update',NULL,NULL,'[]',1,'2020-12-26 03:54:13','2020-12-26 03:54:13'),(211,'admin::roles.delete',NULL,NULL,'[]',1,'2020-12-26 03:54:13','2020-12-26 03:54:13'),(212,'plugins::content-manager.explorer.create','plugins::navigation.audience','[\"name\",\"key\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(213,'plugins::content-manager.explorer.create','plugins::navigation.navigation','[\"name\",\"slug\",\"visible\",\"items\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(214,'plugins::content-manager.explorer.create','plugins::navigation.navigationitem','[\"title\",\"type\",\"path\",\"externalPath\",\"uiRouterKey\",\"menuAttached\",\"order\",\"related\",\"parent\",\"master\",\"audience\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(215,'plugins::content-manager.explorer.read','plugins::navigation.audience','[\"name\",\"key\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(216,'plugins::content-manager.explorer.read','plugins::navigation.navigation','[\"name\",\"slug\",\"visible\",\"items\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(217,'plugins::content-manager.explorer.read','plugins::navigation.navigationitem','[\"title\",\"type\",\"path\",\"externalPath\",\"uiRouterKey\",\"menuAttached\",\"order\",\"related\",\"parent\",\"master\",\"audience\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(218,'plugins::content-manager.explorer.update','plugins::navigation.audience','[\"name\",\"key\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(219,'plugins::content-manager.explorer.update','plugins::navigation.navigation','[\"name\",\"slug\",\"visible\",\"items\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(220,'plugins::content-manager.explorer.update','plugins::navigation.navigationitem','[\"title\",\"type\",\"path\",\"externalPath\",\"uiRouterKey\",\"menuAttached\",\"order\",\"related\",\"parent\",\"master\",\"audience\"]','[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(221,'plugins::content-manager.explorer.delete','plugins::navigation.audience',NULL,'[]',1,'2021-01-02 15:58:12','2021-01-02 15:58:13'),(222,'plugins::content-manager.explorer.delete','plugins::navigation.navigation',NULL,'[]',1,'2021-01-02 15:58:13','2021-01-02 15:58:13'),(223,'plugins::content-manager.explorer.delete','plugins::navigation.navigationitem',NULL,'[]',1,'2021-01-02 15:58:13','2021-01-02 15:58:13'),(224,'plugins::navigation.read',NULL,NULL,'[]',1,'2021-01-02 15:58:13','2021-01-02 15:58:13'),(225,'plugins::navigation.update',NULL,NULL,'[]',1,'2021-01-02 15:58:13','2021-01-02 15:58:13'),(232,'plugins::content-manager.explorer.create','application::channel.channel','[\"name\"]','[]',1,'2021-01-20 07:26:40','2021-01-22 10:21:13'),(233,'plugins::content-manager.explorer.read','application::channel.channel','[\"name\"]','[]',1,'2021-01-20 07:26:40','2021-01-22 10:21:13'),(234,'plugins::content-manager.explorer.update','application::channel.channel','[\"name\"]','[]',1,'2021-01-20 07:26:40','2021-01-22 10:21:13');
/*!40000 ALTER TABLE `strapi_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_role`
--

DROP TABLE IF EXISTS `strapi_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_role`
--

LOCK TABLES `strapi_role` WRITE;
/*!40000 ALTER TABLE `strapi_role` DISABLE KEYS */;
INSERT INTO `strapi_role` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2020-12-26 03:54:11','2020-12-26 03:54:11'),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2020-12-26 03:54:11','2020-12-26 03:54:11'),(3,'Author','strapi-author','Authors can manage the content they have created.','2020-12-26 03:54:11','2020-12-26 03:54:11');
/*!40000 ALTER TABLE `strapi_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_users_roles`
--

DROP TABLE IF EXISTS `strapi_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_users_roles`
--

LOCK TABLES `strapi_users_roles` WRITE;
/*!40000 ALTER TABLE `strapi_users_roles` DISABLE KEYS */;
INSERT INTO `strapi_users_roles` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `strapi_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
INSERT INTO `upload_file` VALUES (1,'index.jpeg','','',300,168,'{\"thumbnail\":{\"name\":\"thumbnail_index.jpeg\",\"hash\":\"thumbnail_index_0ec3c9cfd1\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"width\":245,\"height\":137,\"size\":11.88,\"path\":null,\"url\":\"https://res.cloudinary.com/c00lways/image/upload/v1608955968/thumbnail_index_0ec3c9cfd1.jpg\",\"provider_metadata\":{\"public_id\":\"thumbnail_index_0ec3c9cfd1\",\"resource_type\":\"image\"}}}','index_0ec3c9cfd1','.jpeg','image/jpeg',15.38,'https://res.cloudinary.com/c00lways/image/upload/v1608955965/index_0ec3c9cfd1.jpg',NULL,'cloudinary','{\"public_id\":\"index_0ec3c9cfd1\",\"resource_type\":\"image\"}',1,1,'2020-12-26 04:12:48','2020-12-26 04:12:48'),(2,'CurryLaksa-1.jpg','','',680,544,'{\"thumbnail\":{\"name\":\"thumbnail_CurryLaksa-1.jpg\",\"hash\":\"thumbnail_Curry_Laksa_1_28f98e2ae5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":195,\"height\":156,\"size\":10.85,\"path\":null,\"url\":\"https://res.cloudinary.com/c00lways/image/upload/v1608955968/thumbnail_Curry_Laksa_1_28f98e2ae5.jpg\",\"provider_metadata\":{\"public_id\":\"thumbnail_Curry_Laksa_1_28f98e2ae5\",\"resource_type\":\"image\"}},\"small\":{\"name\":\"small_CurryLaksa-1.jpg\",\"hash\":\"small_Curry_Laksa_1_28f98e2ae5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":400,\"size\":49.58,\"path\":null,\"url\":\"https://res.cloudinary.com/c00lways/image/upload/v1608955969/small_Curry_Laksa_1_28f98e2ae5.jpg\",\"provider_metadata\":{\"public_id\":\"small_Curry_Laksa_1_28f98e2ae5\",\"resource_type\":\"image\"}}}','Curry_Laksa_1_28f98e2ae5','.jpg','image/jpeg',84.90,'https://res.cloudinary.com/c00lways/image/upload/v1608955966/Curry_Laksa_1_28f98e2ae5.jpg',NULL,'cloudinary','{\"public_id\":\"Curry_Laksa_1_28f98e2ae5\",\"resource_type\":\"image\"}',1,1,'2020-12-26 04:12:50','2020-12-26 04:12:50'),(3,'boied egg.jpeg','','',276,183,'{\"thumbnail\":{\"name\":\"thumbnail_boied egg.jpeg\",\"hash\":\"thumbnail_boied_egg_5660a883a0\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"width\":235,\"height\":156,\"size\":3.95,\"path\":null,\"url\":\"https://res.cloudinary.com/c00lways/image/upload/v1608956069/thumbnail_boied_egg_5660a883a0.jpg\",\"provider_metadata\":{\"public_id\":\"thumbnail_boied_egg_5660a883a0\",\"resource_type\":\"image\"}}}','boied_egg_5660a883a0','.jpeg','image/jpeg',3.90,'https://res.cloudinary.com/c00lways/image/upload/v1608956067/boied_egg_5660a883a0.jpg',NULL,'cloudinary','{\"public_id\":\"boied_egg_5660a883a0\",\"resource_type\":\"image\"}',1,1,'2020-12-26 04:14:30','2020-12-26 04:14:30'),(4,'tumis.jpg','','',500,750,'{\"thumbnail\":{\"name\":\"thumbnail_tumis.jpg\",\"hash\":\"thumbnail_tumis_520a463de9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":104,\"height\":156,\"size\":4.27,\"path\":null,\"url\":\"https://res.cloudinary.com/c00lways/image/upload/v1608956116/thumbnail_tumis_520a463de9.jpg\",\"provider_metadata\":{\"public_id\":\"thumbnail_tumis_520a463de9\",\"resource_type\":\"image\"}},\"small\":{\"name\":\"small_tumis.jpg\",\"hash\":\"small_tumis_520a463de9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":333,\"height\":500,\"size\":29.29,\"path\":null,\"url\":\"https://res.cloudinary.com/c00lways/image/upload/v1608956122/small_tumis_520a463de9.jpg\",\"provider_metadata\":{\"public_id\":\"small_tumis_520a463de9\",\"resource_type\":\"image\"}}}','tumis_520a463de9','.jpg','image/jpeg',58.81,'https://res.cloudinary.com/c00lways/image/upload/v1608956114/tumis_520a463de9.jpg',NULL,'cloudinary','{\"public_id\":\"tumis_520a463de9\",\"resource_type\":\"image\"}',1,1,'2020-12-26 04:15:23','2020-12-26 04:15:23');
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_morph`
--

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
INSERT INTO `upload_file_morph` VALUES (24,3,1,'components_attribute_item_addons','image',1),(25,4,2,'components_attribute_item_addons','image',1),(26,1,1,'FoodMenu','images',1),(27,2,1,'FoodMenu','images',2),(28,2,1,'FoodMenu','thumb',1);
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (25,'application','channel','count',0,'',1,NULL,NULL),(26,'application','channel','count',1,'',2,NULL,NULL),(27,'application','channel','create',0,'',1,NULL,NULL),(28,'application','channel','create',0,'',2,NULL,NULL),(29,'application','channel','delete',0,'',1,NULL,NULL),(30,'application','channel','delete',0,'',2,NULL,NULL),(31,'application','channel','find',0,'',1,NULL,NULL),(32,'application','channel','find',1,'',2,NULL,NULL),(33,'application','channel','findone',0,'',1,NULL,NULL),(34,'application','channel','findone',1,'',2,NULL,NULL),(35,'application','channel','update',0,'',1,NULL,NULL),(36,'application','channel','update',0,'',2,NULL,NULL),(37,'application','country','count',1,'',1,NULL,NULL),(38,'application','country','count',1,'',2,NULL,NULL),(39,'application','country','create',0,'',1,NULL,NULL),(40,'application','country','create',0,'',2,NULL,NULL),(41,'application','country','delete',0,'',1,NULL,NULL),(42,'application','country','delete',0,'',2,NULL,NULL),(43,'application','country','find',1,'',1,NULL,NULL),(44,'application','country','find',1,'',2,NULL,NULL),(45,'application','country','findone',1,'',1,NULL,NULL),(46,'application','country','findone',1,'',2,NULL,NULL),(47,'application','country','update',0,'',1,NULL,NULL),(48,'application','country','update',0,'',2,NULL,NULL),(49,'application','food-menu','count',1,'',1,NULL,NULL),(50,'application','food-menu','count',1,'',2,NULL,NULL),(51,'application','food-menu','create',0,'',1,NULL,NULL),(52,'application','food-menu','create',0,'',2,NULL,NULL),(53,'application','food-menu','delete',0,'',1,NULL,NULL),(54,'application','food-menu','delete',0,'',2,NULL,NULL),(55,'application','food-menu','find',1,'',1,NULL,NULL),(56,'application','food-menu','find',1,'',2,NULL,NULL),(57,'application','food-menu','findone',1,'',1,NULL,NULL),(58,'application','food-menu','findone',1,'',2,NULL,NULL),(59,'application','food-menu','update',0,'',1,NULL,NULL),(60,'application','food-menu','update',0,'',2,NULL,NULL),(73,'application','order','count',1,'',1,NULL,NULL),(74,'application','order','count',1,'',2,NULL,NULL),(75,'application','order','create',1,'',1,NULL,NULL),(76,'application','order','create',1,'',2,NULL,NULL),(77,'application','order','delete',0,'',1,NULL,NULL),(78,'application','order','delete',0,'',2,NULL,NULL),(79,'application','order','find',1,'',1,NULL,NULL),(80,'application','order','find',1,'',2,NULL,NULL),(81,'application','order','findone',1,'',1,NULL,NULL),(82,'application','order','findone',1,'',2,NULL,NULL),(83,'application','order','update',1,'',1,NULL,NULL),(84,'application','order','update',1,'',2,NULL,NULL),(145,'application','shipping-method','count',1,'',1,NULL,NULL),(146,'application','shipping-method','count',1,'',2,NULL,NULL),(147,'application','shipping-method','create',0,'',1,NULL,NULL),(148,'application','shipping-method','create',0,'',2,NULL,NULL),(149,'application','shipping-method','delete',0,'',1,NULL,NULL),(150,'application','shipping-method','delete',0,'',2,NULL,NULL),(151,'application','shipping-method','find',1,'',1,NULL,NULL),(152,'application','shipping-method','find',1,'',2,NULL,NULL),(153,'application','shipping-method','findone',1,'',1,NULL,NULL),(154,'application','shipping-method','findone',1,'',2,NULL,NULL),(155,'application','shipping-method','update',0,'',1,NULL,NULL),(156,'application','shipping-method','update',0,'',2,NULL,NULL),(157,'content-manager','collection-types','bulkdelete',0,'',1,NULL,NULL),(158,'content-manager','collection-types','bulkdelete',0,'',2,NULL,NULL),(159,'content-manager','collection-types','create',0,'',1,NULL,NULL),(160,'content-manager','collection-types','create',0,'',2,NULL,NULL),(161,'content-manager','collection-types','delete',0,'',1,NULL,NULL),(162,'content-manager','collection-types','delete',0,'',2,NULL,NULL),(163,'content-manager','collection-types','find',0,'',1,NULL,NULL),(164,'content-manager','collection-types','find',0,'',2,NULL,NULL),(165,'content-manager','collection-types','findone',0,'',1,NULL,NULL),(166,'content-manager','collection-types','findone',0,'',2,NULL,NULL),(167,'content-manager','collection-types','previewmanyrelations',0,'',1,NULL,NULL),(168,'content-manager','collection-types','previewmanyrelations',0,'',2,NULL,NULL),(169,'content-manager','collection-types','publish',0,'',1,NULL,NULL),(170,'content-manager','collection-types','publish',0,'',2,NULL,NULL),(171,'content-manager','collection-types','unpublish',0,'',1,NULL,NULL),(172,'content-manager','collection-types','unpublish',0,'',2,NULL,NULL),(173,'content-manager','collection-types','update',0,'',1,NULL,NULL),(174,'content-manager','collection-types','update',0,'',2,NULL,NULL),(175,'content-manager','components','findcomponentconfiguration',0,'',1,NULL,NULL),(176,'content-manager','components','findcomponentconfiguration',0,'',2,NULL,NULL),(177,'content-manager','components','findcomponents',0,'',1,NULL,NULL),(178,'content-manager','components','findcomponents',0,'',2,NULL,NULL),(179,'content-manager','components','updatecomponentconfiguration',0,'',1,NULL,NULL),(180,'content-manager','components','updatecomponentconfiguration',0,'',2,NULL,NULL),(181,'content-manager','content-types','findcontenttypeconfiguration',0,'',1,NULL,NULL),(182,'content-manager','content-types','findcontenttypeconfiguration',0,'',2,NULL,NULL),(183,'content-manager','content-types','findcontenttypes',0,'',1,NULL,NULL),(184,'content-manager','content-types','findcontenttypes',0,'',2,NULL,NULL),(185,'content-manager','content-types','updatecontenttypeconfiguration',0,'',1,NULL,NULL),(186,'content-manager','content-types','updatecontenttypeconfiguration',0,'',2,NULL,NULL),(187,'content-manager','relations','find',0,'',1,NULL,NULL),(188,'content-manager','relations','find',0,'',2,NULL,NULL),(189,'content-manager','single-types','createorupdate',0,'',1,NULL,NULL),(190,'content-manager','single-types','createorupdate',0,'',2,NULL,NULL),(191,'content-manager','single-types','delete',0,'',1,NULL,NULL),(192,'content-manager','single-types','delete',0,'',2,NULL,NULL),(193,'content-manager','single-types','find',0,'',1,NULL,NULL),(194,'content-manager','single-types','find',0,'',2,NULL,NULL),(195,'content-manager','single-types','publish',0,'',1,NULL,NULL),(196,'content-manager','single-types','publish',0,'',2,NULL,NULL),(197,'content-manager','single-types','unpublish',0,'',1,NULL,NULL),(198,'content-manager','single-types','unpublish',0,'',2,NULL,NULL),(199,'content-manager','uid','checkuidavailability',0,'',1,NULL,NULL),(200,'content-manager','uid','checkuidavailability',0,'',2,NULL,NULL),(201,'content-manager','uid','generateuid',0,'',1,NULL,NULL),(202,'content-manager','uid','generateuid',0,'',2,NULL,NULL),(203,'content-type-builder','builder','getreservednames',0,'',1,NULL,NULL),(204,'content-type-builder','builder','getreservednames',0,'',2,NULL,NULL),(205,'content-type-builder','componentcategories','deletecategory',0,'',1,NULL,NULL),(206,'content-type-builder','componentcategories','deletecategory',0,'',2,NULL,NULL),(207,'content-type-builder','componentcategories','editcategory',0,'',1,NULL,NULL),(208,'content-type-builder','componentcategories','editcategory',0,'',2,NULL,NULL),(209,'content-type-builder','components','createcomponent',0,'',1,NULL,NULL),(210,'content-type-builder','components','createcomponent',0,'',2,NULL,NULL),(211,'content-type-builder','components','deletecomponent',0,'',1,NULL,NULL),(212,'content-type-builder','components','deletecomponent',0,'',2,NULL,NULL),(213,'content-type-builder','components','getcomponent',0,'',1,NULL,NULL),(214,'content-type-builder','components','getcomponent',0,'',2,NULL,NULL),(215,'content-type-builder','components','getcomponents',0,'',1,NULL,NULL),(216,'content-type-builder','components','getcomponents',0,'',2,NULL,NULL),(217,'content-type-builder','components','updatecomponent',0,'',1,NULL,NULL),(218,'content-type-builder','components','updatecomponent',0,'',2,NULL,NULL),(219,'content-type-builder','connections','getconnections',0,'',1,NULL,NULL),(220,'content-type-builder','connections','getconnections',0,'',2,NULL,NULL),(221,'content-type-builder','contenttypes','createcontenttype',0,'',1,NULL,NULL),(222,'content-type-builder','contenttypes','createcontenttype',0,'',2,NULL,NULL),(223,'content-type-builder','contenttypes','deletecontenttype',0,'',1,NULL,NULL),(224,'content-type-builder','contenttypes','deletecontenttype',0,'',2,NULL,NULL),(225,'content-type-builder','contenttypes','getcontenttype',0,'',1,NULL,NULL),(226,'content-type-builder','contenttypes','getcontenttype',0,'',2,NULL,NULL),(227,'content-type-builder','contenttypes','getcontenttypes',0,'',1,NULL,NULL),(228,'content-type-builder','contenttypes','getcontenttypes',0,'',2,NULL,NULL),(229,'content-type-builder','contenttypes','updatecontenttype',0,'',1,NULL,NULL),(230,'content-type-builder','contenttypes','updatecontenttype',0,'',2,NULL,NULL),(231,'email','email','send',0,'',1,NULL,NULL),(232,'email','email','send',0,'',2,NULL,NULL),(233,'upload','upload','count',0,'',1,NULL,NULL),(234,'upload','upload','count',0,'',2,NULL,NULL),(235,'upload','upload','destroy',0,'',1,NULL,NULL),(236,'upload','upload','destroy',0,'',2,NULL,NULL),(237,'upload','upload','find',0,'',1,NULL,NULL),(238,'upload','upload','find',0,'',2,NULL,NULL),(239,'upload','upload','findone',0,'',1,NULL,NULL),(240,'upload','upload','findone',0,'',2,NULL,NULL),(241,'upload','upload','getsettings',0,'',1,NULL,NULL),(242,'upload','upload','getsettings',0,'',2,NULL,NULL),(243,'upload','upload','search',0,'',1,NULL,NULL),(244,'upload','upload','search',0,'',2,NULL,NULL),(245,'upload','upload','updatesettings',0,'',1,NULL,NULL),(246,'upload','upload','updatesettings',0,'',2,NULL,NULL),(247,'upload','upload','upload',0,'',1,NULL,NULL),(248,'upload','upload','upload',0,'',2,NULL,NULL),(249,'users-permissions','auth','callback',0,'',1,NULL,NULL),(250,'users-permissions','auth','callback',1,'',2,NULL,NULL),(251,'users-permissions','auth','connect',1,'',1,NULL,NULL),(252,'users-permissions','auth','connect',1,'',2,NULL,NULL),(253,'users-permissions','auth','emailconfirmation',0,'',1,NULL,NULL),(254,'users-permissions','auth','emailconfirmation',1,'',2,NULL,NULL),(255,'users-permissions','auth','forgotpassword',0,'',1,NULL,NULL),(256,'users-permissions','auth','forgotpassword',1,'',2,NULL,NULL),(257,'users-permissions','auth','register',0,'',1,NULL,NULL),(258,'users-permissions','auth','register',1,'',2,NULL,NULL),(259,'users-permissions','auth','resetpassword',0,'',1,NULL,NULL),(260,'users-permissions','auth','resetpassword',1,'',2,NULL,NULL),(261,'users-permissions','auth','sendemailconfirmation',0,'',1,NULL,NULL),(262,'users-permissions','auth','sendemailconfirmation',0,'',2,NULL,NULL),(263,'users-permissions','user','count',0,'',1,NULL,NULL),(264,'users-permissions','user','count',0,'',2,NULL,NULL),(265,'users-permissions','user','create',0,'',1,NULL,NULL),(266,'users-permissions','user','create',0,'',2,NULL,NULL),(267,'users-permissions','user','destroy',0,'',1,NULL,NULL),(268,'users-permissions','user','destroy',0,'',2,NULL,NULL),(269,'users-permissions','user','destroyall',0,'',1,NULL,NULL),(270,'users-permissions','user','destroyall',0,'',2,NULL,NULL),(271,'users-permissions','user','find',0,'',1,NULL,NULL),(272,'users-permissions','user','find',0,'',2,NULL,NULL),(273,'users-permissions','user','findone',0,'',1,NULL,NULL),(274,'users-permissions','user','findone',0,'',2,NULL,NULL),(275,'users-permissions','user','me',1,'',1,NULL,NULL),(276,'users-permissions','user','me',1,'',2,NULL,NULL),(277,'users-permissions','user','update',0,'',1,NULL,NULL),(278,'users-permissions','user','update',0,'',2,NULL,NULL),(279,'users-permissions','userspermissions','createrole',0,'',1,NULL,NULL),(280,'users-permissions','userspermissions','createrole',0,'',2,NULL,NULL),(281,'users-permissions','userspermissions','deleterole',0,'',1,NULL,NULL),(282,'users-permissions','userspermissions','deleterole',0,'',2,NULL,NULL),(283,'users-permissions','userspermissions','getadvancedsettings',0,'',1,NULL,NULL),(284,'users-permissions','userspermissions','getadvancedsettings',0,'',2,NULL,NULL),(285,'users-permissions','userspermissions','getemailtemplate',0,'',1,NULL,NULL),(286,'users-permissions','userspermissions','getemailtemplate',0,'',2,NULL,NULL),(287,'users-permissions','userspermissions','getpermissions',0,'',1,NULL,NULL),(288,'users-permissions','userspermissions','getpermissions',0,'',2,NULL,NULL),(289,'users-permissions','userspermissions','getpolicies',0,'',1,NULL,NULL),(290,'users-permissions','userspermissions','getpolicies',0,'',2,NULL,NULL),(291,'users-permissions','userspermissions','getproviders',0,'',1,NULL,NULL),(292,'users-permissions','userspermissions','getproviders',0,'',2,NULL,NULL),(293,'users-permissions','userspermissions','getrole',1,'',1,NULL,NULL),(294,'users-permissions','userspermissions','getrole',0,'',2,NULL,NULL),(295,'users-permissions','userspermissions','getroles',1,'',1,NULL,NULL),(296,'users-permissions','userspermissions','getroles',0,'',2,NULL,NULL),(297,'users-permissions','userspermissions','getroutes',0,'',1,NULL,NULL),(298,'users-permissions','userspermissions','getroutes',0,'',2,NULL,NULL),(299,'users-permissions','userspermissions','index',0,'',1,NULL,NULL),(300,'users-permissions','userspermissions','index',0,'',2,NULL,NULL),(301,'users-permissions','userspermissions','searchusers',0,'',1,NULL,NULL),(302,'users-permissions','userspermissions','searchusers',0,'',2,NULL,NULL),(303,'users-permissions','userspermissions','updateadvancedsettings',0,'',1,NULL,NULL),(304,'users-permissions','userspermissions','updateadvancedsettings',0,'',2,NULL,NULL),(305,'users-permissions','userspermissions','updateemailtemplate',0,'',1,NULL,NULL),(306,'users-permissions','userspermissions','updateemailtemplate',0,'',2,NULL,NULL),(307,'users-permissions','userspermissions','updateproviders',0,'',1,NULL,NULL),(308,'users-permissions','userspermissions','updateproviders',0,'',2,NULL,NULL),(309,'users-permissions','userspermissions','updaterole',0,'',1,NULL,NULL),(310,'users-permissions','userspermissions','updaterole',0,'',2,NULL,NULL),(311,'navigation','navigation','config',0,'',1,NULL,NULL),(312,'navigation','navigation','config',0,'',2,NULL,NULL),(313,'navigation','navigation','get',0,'',1,NULL,NULL),(314,'navigation','navigation','get',0,'',2,NULL,NULL),(315,'navigation','navigation','getbyid',0,'',1,NULL,NULL),(316,'navigation','navigation','getbyid',0,'',2,NULL,NULL),(317,'navigation','navigation','post',0,'',1,NULL,NULL),(318,'navigation','navigation','post',0,'',2,NULL,NULL),(319,'navigation','navigation','put',0,'',1,NULL,NULL),(320,'navigation','navigation','put',0,'',2,NULL,NULL),(321,'navigation','navigation','render',0,'',1,NULL,NULL),(322,'navigation','navigation','render',0,'',2,NULL,NULL),(323,'application','order','cancelorder',1,'isauthenticated',1,NULL,NULL),(324,'application','order','cancelorder',1,'',2,NULL,NULL);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (1,'Authenticated','Default role given to authenticated user.','authenticated',NULL,NULL),(2,'Public','Default role given to unauthenticated user.','public',NULL,NULL);
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_user`
--

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
INSERT INTO `users-permissions_user` VALUES (1,'sys1','c00lways@gmail.com','local','$2a$10$AyeLH4.oogVvyeXo7Roud.OtkenjdtZiRdC1jK41kxd8zUoAVj4Ce',NULL,1,0,1,1,1,1,'2020-12-26 10:49:12','2021-01-20 08:01:06');
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'openmenu'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22 19:08:32

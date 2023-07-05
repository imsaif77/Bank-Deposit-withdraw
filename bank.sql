-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (24,'App\\Models\\User',1,'auth_token','737255a88a5ad903f4d7f4525aa5595a62ddd2eb4b982f87197c882719ce3f28','[\"*\"]',NULL,NULL,'2023-07-04 06:19:51','2023-07-04 06:19:51'),(25,'App\\Models\\User',1,'auth_token','605d2d7c05c340e364d7e9d7a0f0d9ee3a80d9356412bb50d8c94b71f5c00084','[\"*\"]',NULL,NULL,'2023-07-04 06:20:14','2023-07-04 06:20:14'),(26,'App\\Models\\User',2,'auth_token','cec36c8de036ae903ca022cf00063e0d79f8aa011abbac1cfa2094adc6b320bb','[\"*\"]','2023-07-04 07:41:06',NULL,'2023-07-04 06:20:42','2023-07-04 07:41:06'),(27,'App\\Models\\User',2,'auth_token','7e01627495442b188473afc89f29d6ed754970e6a71bf125d2ee2abf79844961','[\"*\"]',NULL,NULL,'2023-07-04 06:42:39','2023-07-04 06:42:39'),(28,'App\\Models\\User',2,'auth_token','c2abf6a2e776f43ca00fea3fc990ff2ce319f38734240d510ef589e32993d11e','[\"*\"]','2023-07-04 07:03:37',NULL,'2023-07-04 06:43:43','2023-07-04 07:03:37'),(29,'App\\Models\\User',1,'auth_token','70656d21f2424bb3c68f16b05c22280f4a951e4943b88cf7d3b9c878a1e371f0','[\"*\"]','2023-07-04 07:02:22',NULL,'2023-07-04 06:48:19','2023-07-04 07:02:22'),(30,'App\\Models\\User',1,'auth_token','e42b21594fdc910e0c408a96bee90d7e74092b55564de184aa21fd996afc0e3b','[\"*\"]','2023-07-04 07:16:16',NULL,'2023-07-04 07:03:11','2023-07-04 07:16:16'),(31,'App\\Models\\User',1,'auth_token','b1e70352f37cce7fccc6e82440ebff24fa28662e00451d8998f88f8a986afec1','[\"*\"]','2023-07-04 23:47:36',NULL,'2023-07-04 07:03:47','2023-07-04 23:47:36'),(32,'App\\Models\\User',1,'auth_token','95edc938a39e3e80b3127b60d684c5c751bf082f4bb2446beedb2d37d2e4c69f','[\"*\"]',NULL,NULL,'2023-07-04 07:27:12','2023-07-04 07:27:12'),(33,'App\\Models\\User',1,'auth_token','e1d33d6ea62518dfd2343f4d2c2f71c625ca5c00680f7caa42392d919be98695','[\"*\"]',NULL,NULL,'2023-07-04 07:41:09','2023-07-04 07:41:09'),(34,'App\\Models\\User',1,'auth_token','de6de71b81c7e6e4adde5361ea978524b6f4b4e8842007e2457edbfe57c8d9ba','[\"*\"]','2023-07-04 23:57:47',NULL,'2023-07-04 07:41:17','2023-07-04 23:57:47'),(35,'App\\Models\\User',1,'auth_token','fd1995ccec110c274355811e99e7b847383050d72494e90bb8bf1c9297a6e520','[\"*\"]',NULL,NULL,'2023-07-04 07:53:34','2023-07-04 07:53:34'),(36,'App\\Models\\User',1,'auth_token','5f7724e2a7e87bf6cd6bbef976206590c9b140d15c366f5074206124060b3ea6','[\"*\"]',NULL,NULL,'2023-07-04 23:39:45','2023-07-04 23:39:45'),(37,'App\\Models\\User',1,'auth_token','1fcc7a23589996a03f9359641d03268ddaf1eb9625e2ad92db7f3fd955ae5de4','[\"*\"]','2023-07-05 00:45:18',NULL,'2023-07-04 23:43:52','2023-07-05 00:45:18'),(38,'App\\Models\\User',1,'auth_token','c2d77eadf42be58cf5c6a13ce7c708d021c1b88584134561482ec0b4281b2374','[\"*\"]','2023-07-05 01:02:13',NULL,'2023-07-04 23:58:46','2023-07-05 01:02:13'),(39,'App\\Models\\User',16,'auth_token','e3b83664b300c89c476fbf09d563fd2f1064730f63011d137249a2aedf2a2d7b','[\"*\"]',NULL,NULL,'2023-07-05 01:03:04','2023-07-05 01:03:04'),(40,'App\\Models\\User',16,'auth_token','84789db92ea3ae82c16eb84688e1be98707cd386421b16841114b4a1eb4d6690','[\"*\"]','2023-07-05 01:03:32',NULL,'2023-07-05 01:03:29','2023-07-05 01:03:32');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'radha',100,'Deposit','2023-07-04 03:00:27','2023-07-04 03:00:27'),(2,'radha',100,'Deposit','2023-07-04 03:01:20','2023-07-04 03:01:20'),(3,'radha',100,'Withdrawal','2023-07-04 03:06:03','2023-07-04 03:06:03'),(4,'radha',100,'Deposit','2023-07-04 07:04:40','2023-07-04 07:04:40'),(5,'radha',100,'Withdrawal','2023-07-04 07:07:22','2023-07-04 07:07:22'),(6,'radha',2,'Deposit','2023-07-04 07:11:09','2023-07-04 07:11:09'),(7,'radha',100,'Deposit','2023-07-04 23:47:36','2023-07-04 23:47:36'),(8,'radha',23,'Withdrawal','2023-07-05 00:27:52','2023-07-05 00:27:52');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'radhasawant','radha','radha45@gmail.com',NULL,'$2y$10$U0ZkeNgM8PIomGvxfgw8jO4ZXgLUtfJBCiV2xKTkmGkMLUL3gQOLW','customer',612,NULL,'2023-07-04 02:09:30','2023-07-05 00:27:52'),(2,'radhasawant1','radha1','radha451@gmail.com',NULL,'$2y$10$e6tPIKn0ofy.97iCwr4Zyu04d8hChHui4IY7TipL2o0TeZfL/yVnG','customer',0,NULL,'2023-07-04 04:52:56','2023-07-04 04:52:56'),(3,'kjfnk','kjfdj','ndkjf@gmail.com',NULL,'$2y$10$dPk22kPfwjct1tiXIncfEOMObEhfNSU5eDTatYhyD7tX/d2HbXSHO','customer',0,NULL,'2023-07-04 05:07:24','2023-07-04 05:07:24'),(6,'kjfnk','kjfdjgffg','ndkdfdjf@gmail.com',NULL,'$2y$10$IlfrlGFZHReRqjO2FUVu7etNnXzMkY.ImEZzPoOO8vbQIUniVZmSK','customer',0,NULL,'2023-07-04 05:13:37','2023-07-04 05:13:37'),(7,'kjfnk','kjfdjgffffg','ndkdfdffjf@gmail.com',NULL,'$2y$10$kjouwBAa6HgEKGbztFMv1u/DSfv3PMz4eI.Az3YA1FWUqtaPOzVIq','customer',0,NULL,'2023-07-04 05:14:16','2023-07-04 05:14:16'),(8,'kjfnk','kjfdjgffffdffg','ndkddffdffjf@gmail.com',NULL,'$2y$10$7Epy/M1Ru/hjuLp86FWswOHxZiKBnHT0kaYOfBUCtdaU6HFDwBAEC','customer',0,NULL,'2023-07-04 05:14:46','2023-07-04 05:14:46'),(9,'kjfnk','kjfdjgffffdffgdfsf','dffdds@gmail.com',NULL,'$2y$10$qla/uKgGeqH3HA./sCJUH.PARZdH4AWJPHfSOhfRRNeukiT.fN0eS','customer',0,NULL,'2023-07-04 05:14:56','2023-07-04 05:14:56'),(10,'kjfnk','kjfdjgfdffffdffgdfsffd','dffdddfdfs@gmail.com',NULL,'$2y$10$3GaDT8jP.6pOUKTM/OdJXePd7eO475IWoyLu7ZqATu1aAnjkfMjMS','customer',0,NULL,'2023-07-04 05:15:03','2023-07-04 05:15:03'),(11,'kjfnk','dfsf','fdsf@gmail.com',NULL,'$2y$10$vMK5uxaQqvbaZpfJsum4jO/FjUyXgYHkGwT0gualmOldf57vDMXLK','customer',0,NULL,'2023-07-04 05:15:16','2023-07-04 05:15:16'),(16,'banker','banker','banker@gmail.com',NULL,'$2y$10$3ruO57O1Bnd8CyoLsooYF.dsc5hGFCLh2Df49z3bALPaPOWvRcwXK','banker',0,NULL,'2023-07-05 01:03:04','2023-07-05 01:03:04');
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

-- Dump completed on 2023-07-05 12:18:25

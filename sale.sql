-- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: sale
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add customer',7,'add_customer'),(20,'Can change customer',7,'change_customer'),(21,'Can delete customer',7,'delete_customer'),(22,'Can add result',8,'add_result'),(23,'Can change result',8,'change_result'),(24,'Can delete result',8,'delete_result'),(25,'Can add product',9,'add_product'),(26,'Can change product',9,'change_product'),(27,'Can delete product',9,'delete_product'),(28,'Can add staff',10,'add_staff'),(29,'Can change staff',10,'change_staff'),(30,'Can delete staff',10,'delete_staff'),(31,'Can add salary',11,'add_salary'),(32,'Can change salary',11,'change_salary'),(33,'Can delete salary',11,'delete_salary');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'manager','customer'),(9,'manager','product'),(8,'manager','result'),(11,'manager','salary'),(10,'manager','staff'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-10 07:20:08.209458'),(2,'auth','0001_initial','2017-05-10 07:20:09.458145'),(3,'admin','0001_initial','2017-05-10 07:20:09.703313'),(4,'admin','0002_logentry_remove_auto_add','2017-05-10 07:20:09.842479'),(5,'contenttypes','0002_remove_content_type_name','2017-05-10 07:20:10.052135'),(6,'auth','0002_alter_permission_name_max_length','2017-05-10 07:20:10.152211'),(7,'auth','0003_alter_user_email_max_length','2017-05-10 07:20:10.252546'),(8,'auth','0004_alter_user_username_opts','2017-05-10 07:20:10.295759'),(9,'auth','0005_alter_user_last_login_null','2017-05-10 07:20:10.401180'),(10,'auth','0006_require_contenttypes_0002','2017-05-10 07:20:10.406187'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-10 07:20:10.439843'),(12,'auth','0008_alter_user_username_max_length','2017-05-10 07:20:10.552040'),(13,'sessions','0001_initial','2017-05-10 07:20:10.661121'),(14,'manager','0001_initial','2017-05-10 11:25:23.129054'),(15,'manager','0002_auto_20170510_1422','2017-05-10 14:22:08.155334'),(16,'manager','0003_auto_20170510_1424','2017-05-10 14:24:34.508939'),(17,'manager','0004_auto_20170510_1428','2017-05-10 14:28:04.252102'),(18,'manager','0005_auto_20170511_0559','2017-05-11 05:59:45.513929'),(19,'manager','0006_auto_20170511_0600','2017-05-11 06:01:02.654231'),(20,'manager','0007_auto_20170512_0919','2017-05-12 09:20:08.979389'),(21,'manager','0008_auto_20170512_0946','2017-05-12 09:46:27.023717'),(22,'manager','0009_result_dealtime','2017-05-16 02:43:32.812332'),(23,'manager','0010_result_number','2017-05-16 09:49:13.693569'),(24,'manager','0011_salary','2017-05-16 15:53:09.151468'),(25,'manager','0012_auto_20170516_2359','2017-05-16 15:59:32.087626'),(26,'manager','0013_auto_20170517_1151','2017-05-17 03:52:04.110013'),(27,'manager','0014_remove_salary_saled','2017-05-17 14:46:13.994583');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5t8yxczcikc7vanlalv3jxl4vd5oi3bq','YWQ0MmY3ZTI2MDQzMGNlZjA2Y2U2YzVmZWY2YWU2NzZjNTM5NzY5Nzp7InVzZXJuYW1lIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowLCJyb2xlIjoiYWRtaW4ifQ==','2017-05-25 10:07:27.848346'),('6c1y52s87mzmkidhi1xpct6o5n86xpsh','OTg2M2IwYmQxMjZkYWM0YmY4ZTJkNWM2ZTY2MjFlOGVjOWFmNjVkMDp7InVzZXJuYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlzX2xvZ2luIjp0cnVlfQ==','2017-05-31 07:53:00.750182'),('6hotyj2mn35k07uh8ze4b1rcgchcmfs3','NGUyZGUyZDBhODE5Zjk5NTExOTU4YzMwOTg1Mjg0MmE4NGRlOWM0ODp7InVzZXJuYW1lIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZSwicm9sZSI6ImFkbWluIn0=','2017-05-25 09:31:40.867149'),('gx7jvneuf1aipda3q859ll6j013gwyb9','OThhMjEzZjU2ZDY1ODgyYWE1ZjRmNWFhOGZiYjdjMjUzMWFlZDc2ZDp7InVzZXJuYW1lIjoiXHU2NzRlXHU1NmRiIiwicm9sZSI6Ilx1OTUwMFx1NTUyZSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiaXNfbG9naW4iOnRydWV9','2017-05-26 13:31:10.474322'),('hlvcam4ibpt0uhazuv8fvxbg9otrjzre','MGE5OWUxY2RiODQ1OGNmZjllMDllNzc1YmZkMzY2MGJhOGFmMDE4Njp7InVzZXJuYW1lIjoiXHU3MzhiXHU0ZTk0IiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJyb2xlIjoiXHU0ZjFhXHU4YmExIiwiaXNfbG9naW4iOnRydWV9','2017-05-31 03:36:37.122679'),('j7s6z973su4mbngyguggmjcyxfaun9er','ZDA3N2RmN2RlZDhlNzIzYzFlMjliMDNhMDE4MDViZDY5NGNmNjMzMzp7InJvbGUiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4iLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-05-25 10:24:26.874895'),('o8voo141xy0977abe3lzi1exmh6u6m1w','OTg2M2IwYmQxMjZkYWM0YmY4ZTJkNWM2ZTY2MjFlOGVjOWFmNjVkMDp7InVzZXJuYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlzX2xvZ2luIjp0cnVlfQ==','2017-05-31 15:12:52.098091'),('of37h94lg5dtos2y277cd0cb4pp8uvdb','NDEzZmU0YmI3YjcwZmU1ZWRhNDA3MzJmYjk4MmRmZDQ3NjJiM2JhYTp7InVzZXJuYW1lIjoiXHU2NzRlXHU1NmRiIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJpc19sb2dpbiI6dHJ1ZSwicm9sZSI6Ilx1OTUwMFx1NTUyZSJ9','2017-05-26 06:16:36.097579'),('uccnf97ak0jbfk2mko7qh6dk5eohvonc','MzdjMTFlMjgyNzJjNzllZDgyMDVkMTk3NWU0MmQyZTMzMGQ3ZGVlMTp7InVzZXJuYW1lIjoiXHU2NzRlXHU1NmRiIiwiaXNfbG9naW4iOnRydWUsInJvbGUiOiJcdTk1MDBcdTU1MmUiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-05-25 16:15:45.958801'),('uktu0v00wsqgdxqyyiftdqc8ij5ad9zb','ZDBiOTJmMGI3YjVlZmYzZjU1NjA5MTZjZjM1ZTIxMzYyNTE3ZjkwZjp7InVzZXJuYW1lIjoiXHU2NzRlXHU1NmRiIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJyb2xlIjoiXHU5NTAwXHU1NTJlIiwiaXNfbG9naW4iOnRydWV9','2017-05-30 10:45:02.197231'),('x8ya5l79brtpzp6i569z6ecvvk9ehh1d','OTUzYjVkYjM2YWZlZTUwZDU2ZjlhNzNhYzNhMmQ2MWMyYzJhYjg1Njp7InVzZXJuYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2017-05-30 03:56:54.786150'),('yikmfes8te98ref9ac5woqulmj8vvr0g','MGE5OWUxY2RiODQ1OGNmZjllMDllNzc1YmZkMzY2MGJhOGFmMDE4Njp7InVzZXJuYW1lIjoiXHU3MzhiXHU0ZTk0IiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJyb2xlIjoiXHU0ZjFhXHU4YmExIiwiaXNfbG9naW4iOnRydWV9','2017-05-30 15:13:36.580292'),('z67uaq7l0e7x6h520vbcy3dhnui7oe9f','ZDY5N2EzZjllMDFjZmUxMjZlYzkxYmU3YmQ3ODQ3N2E5N2M3NzljNTp7InVzZXJuYW1lIjoiXHU2NzRlXHU1NmRiIiwicm9sZSI6Ilx1OTUwMFx1NTUyZSIsImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-05-26 03:54:40.335822');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_customer`
--

DROP TABLE IF EXISTS `manager_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(32) NOT NULL,
  `ctelphone` varchar(32) NOT NULL,
  `car` varchar(64) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_customer`
--

LOCK TABLES `manager_customer` WRITE;
/*!40000 ALTER TABLE `manager_customer` DISABLE KEYS */;
INSERT INTO `manager_customer` VALUES (1,'王麻子','13133133456','皮卡','2017-05-12 09:20:36.333460'),(2,'李杰','13133234567','皮卡','2017-05-12 10:12:16.951469');
/*!40000 ALTER TABLE `manager_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_product`
--

DROP TABLE IF EXISTS `manager_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(64) NOT NULL,
  `cost` varchar(32) NOT NULL,
  `price` varchar(32) NOT NULL,
  `number` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_product`
--

LOCK TABLES `manager_product` WRITE;
/*!40000 ALTER TABLE `manager_product` DISABLE KEYS */;
INSERT INTO `manager_product` VALUES (1,'壳牌润滑油','100','200',300,300),(2,'王牌润滑油','20','30',300,295);
/*!40000 ALTER TABLE `manager_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_result`
--

DROP TABLE IF EXISTS `manager_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay` varchar(64) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `dealtime` datetime(6) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_result_customer_id_782d7446_fk` (`customer_id`),
  KEY `manager_result_product_id_9ddf92d7_fk` (`product_id`),
  KEY `manager_result_staff_id_ade2b787_fk` (`staff_id`),
  CONSTRAINT `manager_result_customer_id_782d7446_fk` FOREIGN KEY (`customer_id`) REFERENCES `manager_customer` (`cid`),
  CONSTRAINT `manager_result_product_id_9ddf92d7_fk` FOREIGN KEY (`product_id`) REFERENCES `manager_product` (`pid`),
  CONSTRAINT `manager_result_staff_id_ade2b787_fk` FOREIGN KEY (`staff_id`) REFERENCES `manager_staff` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_result`
--

LOCK TABLES `manager_result` WRITE;
/*!40000 ALTER TABLE `manager_result` DISABLE KEYS */;
INSERT INTO `manager_result` VALUES (1,'1000',1,1,2,'2017-05-16 03:41:23.446367',1),(2,'1000',1,1,3,'2017-05-16 03:53:03.091821',1),(3,'600',2,2,3,'2017-05-16 09:44:21.485617',1),(4,'600',2,2,3,'2017-05-16 10:39:45.909370',3),(5,'600',1,2,3,'2017-05-16 13:33:46.589049',1),(6,'1000',2,2,3,'2017-05-16 13:35:25.831291',1);
/*!40000 ALTER TABLE `manager_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_salary`
--

DROP TABLE IF EXISTS `manager_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission` int(11) NOT NULL,
  `month` varchar(32) NOT NULL,
  `final` varchar(32) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_salary_staff_id_a4a49bcb_fk_manager_staff_sid` (`staff_id`),
  CONSTRAINT `manager_salary_staff_id_a4a49bcb_fk_manager_staff_sid` FOREIGN KEY (`staff_id`) REFERENCES `manager_staff` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_salary`
--

LOCK TABLES `manager_salary` WRITE;
/*!40000 ALTER TABLE `manager_salary` DISABLE KEYS */;
INSERT INTO `manager_salary` VALUES (1,135,'2017-5','3135',2),(2,717,'2017-5','3717',3),(3,0,'2017-5','3000',5),(4,0,'2017-1','3000',2),(5,0,'2017-1','3000',3),(6,0,'2017-1','3000',5);
/*!40000 ALTER TABLE `manager_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_staff`
--

DROP TABLE IF EXISTS `manager_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_staff` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(32) NOT NULL,
  `spassword` varchar(64) NOT NULL,
  `sex` varchar(16) NOT NULL,
  `age` int(11) NOT NULL,
  `stelphone` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL,
  `role` varchar(32) NOT NULL,
  `basic` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_staff`
--

LOCK TABLES `manager_staff` WRITE;
/*!40000 ALTER TABLE `manager_staff` DISABLE KEYS */;
INSERT INTO `manager_staff` VALUES (2,'张三','','男',23,'13133233343','市场','销售',3000),(3,'李四','123456','男',24,'17719183467','市场','销售',3000),(4,'admin','admin','男',24,'13387563645','admin','admin',3000),(5,'王五','123456','男',36,'13311232341','财务','会计',3000);
/*!40000 ALTER TABLE `manager_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-17 23:25:58

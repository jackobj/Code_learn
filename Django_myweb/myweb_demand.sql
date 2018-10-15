-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: myweb_demand
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(20) NOT NULL,
  `admin_password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add admin',8,'add_admin'),(30,'Can change admin',8,'change_admin'),(31,'Can delete admin',8,'delete_admin'),(32,'Can view admin',8,'view_admin'),(33,'Can add personal_ center',9,'add_personal_center'),(34,'Can change personal_ center',9,'change_personal_center'),(35,'Can delete personal_ center',9,'delete_personal_center'),(36,'Can view personal_ center',9,'view_personal_center'),(37,'Can add second_ display',10,'add_second_display'),(38,'Can change second_ display',10,'change_second_display'),(39,'Can delete second_ display',10,'delete_second_display'),(40,'Can view second_ display',10,'view_second_display'),(41,'Can add demand',11,'add_demand'),(42,'Can change demand',11,'change_demand'),(43,'Can delete demand',11,'delete_demand'),(44,'Can view demand',11,'view_demand'),(45,'Can add first_ display',12,'add_first_display'),(46,'Can change first_ display',12,'change_first_display'),(47,'Can delete first_ display',12,'delete_first_display'),(48,'Can view first_ display',12,'view_first_display'),(49,'Can add comment',13,'add_comment'),(50,'Can change comment',13,'change_comment'),(51,'Can delete comment',13,'delete_comment'),(52,'Can view comment',13,'view_comment');
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
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$pgQWA1zIsDYi$UDAniMgkUXYgZjrf+nHmkgGJtFhhaquF8e3S8FhzJu4=','2018-09-08 02:51:15.371030',1,'admin','','','admin@qq.com',1,1,'2018-09-08 02:50:40.881947');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `demand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_demand_id_9a3e7016_fk_demand_id` (`demand_id`),
  CONSTRAINT `comment_demand_id_9a3e7016_fk_demand_id` FOREIGN KEY (`demand_id`) REFERENCES `demand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'hahah                                 ','2018-09-08 08:01:00.423811',3),(2,'sjdlasjdlasjdsahdoashiodhasd','2018-09-10 01:03:02.845752',2),(3,'hilfsdhfjsdfljsd                                ','2018-09-10 01:17:14.054684',4),(4,'hafjadsjfdsaopf','2018-09-10 01:45:48.802219',3),(5,'gjsdgjsd[gkdsz[fgsdg                ','2018-09-10 01:46:01.120830',3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demand`
--

DROP TABLE IF EXISTS `demand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `details` longtext NOT NULL,
  `image` varchar(50) NOT NULL,
  `files` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `bounty` int(11) NOT NULL,
  `demand_tel` varchar(13) NOT NULL,
  `address` varchar(50) NOT NULL,
  `add_service` int(11) NOT NULL,
  `taocan` varchar(20) NOT NULL,
  `onclick` int(11) NOT NULL,
  `review` int(11) NOT NULL,
  `personal_center_id` int(11) NOT NULL,
  `second_display_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demand_personal_center_id_cc7473c4_fk_personal_center_id` (`personal_center_id`),
  KEY `demand_second_display_id_ad3153ea_fk_second_display_id` (`second_display_id`),
  CONSTRAINT `demand_personal_center_id_cc7473c4_fk_personal_center_id` FOREIGN KEY (`personal_center_id`) REFERENCES `personal_center` (`id`),
  CONSTRAINT `demand_second_display_id_ad3153ea_fk_second_display_id` FOREIGN KEY (`second_display_id`) REFERENCES `second_display` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demand`
--

LOCK TABLES `demand` WRITE;
/*!40000 ALTER TABLE `demand` DISABLE KEYS */;
INSERT INTO `demand` VALUES (1,' 继续要100万作为启动资金做融资','在的哈大大拉卡撒法拉放撒法拉库---投资                            ','static/IMG/动物.jpg','static/Fil/历史.jpg','2018-09-12',600,'18926039854','湖北省十堰市丹江口市',500,'套餐三',0,2,3,17),(2,'阿斯顿吉拉圣诞节了','在的哈大大拉卡撒法拉放撒法拉库-- 急啊是大势件大事','static/IMG/动物.jpg','static/Fil/历史.jpg','2018-09-20',4688,'18926039854','福建省三明市清流县',700,'套餐二',0,2,3,17),(3,'加拿大炸了','大技术的大声联动卡萨；打开了                            ','static/IMG/动物.jpg','static/Fil/地理.jpg','2018-09-06',600,'18926039854','浙江省宁波市北仑区',0,'套餐二',0,2,3,8),(4,'过气网红主播求礼物','                            fjo;dsafjas;odfj','static/IMG/科技.jpg','static/Fil/动物.jpg','2018-09-12',1000,'45445646','福建省厦门市湖里区',0,'套餐二',0,2,4,8);
/*!40000 ALTER TABLE `demand` ENABLE KEYS */;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-09-08 02:51:50.998002','1','Admin object (1)',1,'[{\"added\": {}}]',8,1),(2,'2018-09-08 02:52:30.666292','1','First_Display object (1)',1,'[{\"added\": {}}]',12,1),(3,'2018-09-08 02:52:38.786583','2','First_Display object (2)',1,'[{\"added\": {}}]',12,1),(4,'2018-09-08 02:52:45.086205','3','First_Display object (3)',1,'[{\"added\": {}}]',12,1),(5,'2018-09-08 02:52:54.393400','4','First_Display object (4)',1,'[{\"added\": {}}]',12,1),(6,'2018-09-08 02:53:00.885358','5','First_Display object (5)',1,'[{\"added\": {}}]',12,1),(7,'2018-09-08 02:53:08.483783','6','First_Display object (6)',1,'[{\"added\": {}}]',12,1),(8,'2018-09-08 02:53:27.736985','1','Second_Display object (1)',1,'[{\"added\": {}}]',10,1),(9,'2018-09-08 02:53:37.584293','2','Second_Display object (2)',1,'[{\"added\": {}}]',10,1),(10,'2018-09-08 02:53:45.866742','3','Second_Display object (3)',1,'[{\"added\": {}}]',10,1),(11,'2018-09-08 02:53:53.973663','4','Second_Display object (4)',1,'[{\"added\": {}}]',10,1),(12,'2018-09-08 02:54:00.732162','5','Second_Display object (5)',1,'[{\"added\": {}}]',10,1),(13,'2018-09-08 02:54:08.488702','6','Second_Display object (6)',1,'[{\"added\": {}}]',10,1),(14,'2018-09-08 02:54:19.362866','7','Second_Display object (7)',1,'[{\"added\": {}}]',10,1),(15,'2018-09-08 02:54:29.840301','8','Second_Display object (8)',1,'[{\"added\": {}}]',10,1),(16,'2018-09-08 02:54:43.035382','9','Second_Display object (9)',1,'[{\"added\": {}}]',10,1),(17,'2018-09-08 02:54:53.206175','10','Second_Display object (10)',1,'[{\"added\": {}}]',10,1),(18,'2018-09-08 02:55:02.846948','11','Second_Display object (11)',1,'[{\"added\": {}}]',10,1),(19,'2018-09-08 02:55:09.937157','12','Second_Display object (12)',1,'[{\"added\": {}}]',10,1),(20,'2018-09-08 02:55:19.633561','13','Second_Display object (13)',1,'[{\"added\": {}}]',10,1),(21,'2018-09-08 02:55:26.436044','14','Second_Display object (14)',1,'[{\"added\": {}}]',10,1),(22,'2018-09-08 02:55:34.517406','15','Second_Display object (15)',1,'[{\"added\": {}}]',10,1),(23,'2018-09-08 02:55:42.665804','16','Second_Display object (16)',1,'[{\"added\": {}}]',10,1),(24,'2018-09-08 02:55:50.653747','17','Second_Display object (17)',1,'[{\"added\": {}}]',10,1),(25,'2018-09-08 02:56:07.290689','18','Second_Display object (18)',1,'[{\"added\": {}}]',10,1),(26,'2018-09-08 02:56:14.741745','19','Second_Display object (19)',1,'[{\"added\": {}}]',10,1),(27,'2018-09-08 02:56:23.308339','20','Second_Display object (20)',1,'[{\"added\": {}}]',10,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(13,'zj_comment','comment'),(8,'zj_login_register','admin'),(7,'zj_login_register','user'),(9,'zj_presonal_center','personal_center'),(11,'zj_release_demand','demand'),(12,'zj_release_demand','first_display'),(10,'zj_release_demand','second_display');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-07 13:18:14.428595'),(2,'auth','0001_initial','2018-09-07 13:18:24.248067'),(3,'admin','0001_initial','2018-09-07 13:18:26.289285'),(4,'admin','0002_logentry_remove_auto_add','2018-09-07 13:18:26.350023'),(5,'admin','0003_logentry_add_action_flag_choices','2018-09-07 13:18:26.412407'),(6,'contenttypes','0002_remove_content_type_name','2018-09-07 13:18:27.542251'),(7,'auth','0002_alter_permission_name_max_length','2018-09-07 13:18:28.380441'),(8,'auth','0003_alter_user_email_max_length','2018-09-07 13:18:29.078000'),(9,'auth','0004_alter_user_username_opts','2018-09-07 13:18:29.134881'),(10,'auth','0005_alter_user_last_login_null','2018-09-07 13:18:29.774389'),(11,'auth','0006_require_contenttypes_0002','2018-09-07 13:18:29.816242'),(12,'auth','0007_alter_validators_add_error_messages','2018-09-07 13:18:29.870347'),(13,'auth','0008_alter_user_username_max_length','2018-09-07 13:18:30.547313'),(14,'auth','0009_alter_user_last_name_max_length','2018-09-07 13:18:31.341398'),(15,'sessions','0001_initial','2018-09-07 13:18:32.276500'),(16,'zj_login_register','0001_initial','2018-09-07 13:18:32.928642'),(17,'zj_presonal_center','0001_initial','2018-09-07 13:18:33.973698'),(18,'zj_release_demand','0001_initial','2018-09-07 13:18:37.551913'),(19,'zj_comment','0001_initial','2018-09-07 13:18:38.522040');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('n4j8xtg68shf7d5i90b1f58d5rz5w15g','YjcwODJlZjk2Y2FmNjhmZjUyMmU3ZGM1Nzc2MGFlOWQ2M2ViZmVlZTp7InVzZXIiOiJcdTdmNTFcdTdlYTJcdTRlM2JcdTY0YWQiLCJ1c2VyX3RlbCI6IjE4OTI2MDM5ODUwIn0=','2018-09-24 02:12:04.668091'),('vbaoe0ip8vvqbk1vje1by6wuq46du9za','MmJmOTIxZDIwNDhmOTU2N2I5YWMwNDY1NGM4M2UzNWRiMGZlNTBkZTp7ImNvZGUiOiJRNzJOIn0=','2018-09-24 02:06:33.131991');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_display`
--

DROP TABLE IF EXISTS `first_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_display`
--

LOCK TABLES `first_display` WRITE;
/*!40000 ALTER TABLE `first_display` DISABLE KEYS */;
INSERT INTO `first_display` VALUES (1,'宠物'),(2,'房产'),(3,'二手市场'),(4,'寻人寻物'),(5,'我要人脉'),(6,'本地生活');
/*!40000 ALTER TABLE `first_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_center`
--

DROP TABLE IF EXISTS `personal_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mypic` varchar(50) NOT NULL,
  `industry` varchar(30) NOT NULL,
  `company` varchar(30) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `atname` varchar(20) NOT NULL,
  `cprofile` varchar(200) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `wechat` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `sdemand` int(11) NOT NULL,
  `vcinformation` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `personal_center_user_id_e7c773e5_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_center`
--

LOCK TABLES `personal_center` WRITE;
/*!40000 ALTER TABLE `personal_center` DISABLE KEYS */;
INSERT INTO `personal_center` VALUES (1,'static/IMG/a.jpg','38','家里吨大学','新媒体','经理','猪也能上天','迷住也能上树，家里种地，发家致富/。','28545148','风轻云淡','qwe@nimei.com',1,2,0,2),(3,'static/IMG/文化.jpg','14','摄影有限公司','新媒体','经理','天下无贼','我们是专业的摄影公司               ','415435464','464','das@dasd.com',1,2,0,3),(4,'static/IMG/b.jpg','直播/网红',' 武汉斗鱼','新媒体','经理','网红主播','游戏主播，就属你最皮\r\n                    ','65413241864','442165468','qwhq@fdsf.com',1,2,0,5);
/*!40000 ALTER TABLE `personal_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_display`
--

DROP TABLE IF EXISTS `second_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `second_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(20) NOT NULL,
  `first_display_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `second_display_first_display_id_ffe10519_fk_first_display_id` (`first_display_id`),
  CONSTRAINT `second_display_first_display_id_ffe10519_fk_first_display_id` FOREIGN KEY (`first_display_id`) REFERENCES `first_display` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_display`
--

LOCK TABLES `second_display` WRITE;
/*!40000 ALTER TABLE `second_display` DISABLE KEYS */;
INSERT INTO `second_display` VALUES (1,'出售宠物',1),(2,'购买宠物',1),(3,'我要租房',2),(4,'我要转租',2),(5,'我要合租',2),(6,'我要买卖',3),(7,'手机电脑',3),(8,'电动摩托',3),(9,'服装包装',3),(10,'家具家电',3),(11,'票务图书',3),(12,'其他',3),(13,'寻人启示',4),(14,'寻物启示',4),(15,'职场人脉',5),(16,'生活人脉',5),(17,'其他人脉',5),(18,'贷款信用卡',6),(19,'聚会活动',6),(20,'美食优惠',6);
/*!40000 ALTER TABLE `second_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(13) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'18818568325','39ee488c7696d8f3ee3456218666a3c9'),(2,'15800000000','96bdf4f97e473adff48bf632d2f9693d'),(3,'18926039854','0659c7992e268962384eb17fafe88364'),(4,'18900000000','2569d419bfea999ff13fd1f7f4498b89'),(5,'18926039850','0659c7992e268962384eb17fafe88364'),(6,'18926039851','0659c7992e268962384eb17fafe88364');
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

-- Dump completed on 2018-09-10 10:19:57

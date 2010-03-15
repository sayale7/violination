# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: violination_development
# Generation Time: 2010-03-14 19:38:54 +0100
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`)
VALUES
	('20100308202240'),
	('20100308223010'),
	('20100308223137'),
	('20100309142055'),
	('20100309142158'),
	('20100309143345'),
	('20100310172918'),
	('20100311154524');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tag_names
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag_names`;

CREATE TABLE `tag_names` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tag_names` WRITE;
/*!40000 ALTER TABLE `tag_names` DISABLE KEYS */;
INSERT INTO `tag_names` (`id`,`tag_id`,`value`,`language`,`created_at`,`updated_at`)
VALUES
	(149,80,'Werkstatt Übersicht','de','2010-03-12 07:57:24','2010-03-12 07:57:24'),
	(150,80,'Overview of my Work','en','2010-03-12 07:57:24','2010-03-12 07:57:24'),
	(153,82,'Neubau','de','2010-03-12 07:57:57','2010-03-12 07:57:57'),
	(154,82,'New Building','en','2010-03-12 07:57:57','2010-03-12 07:57:57'),
	(157,84,'Geigenangebot','de','2010-03-12 08:39:57','2010-03-12 08:39:57'),
	(158,84,'Violin offer','en','2010-03-12 08:39:57','2010-03-12 08:39:57'),
	(159,85,'Meisterinstrumente','de','2010-03-12 08:40:22','2010-03-12 08:40:22'),
	(160,85,'Masterinstruments','en','2010-03-12 08:40:22','2010-03-12 08:40:22'),
	(163,87,'Geige','de','2010-03-12 08:42:40','2010-03-12 08:42:40'),
	(164,87,'violin','en','2010-03-12 08:42:40','2010-03-12 08:42:40'),
	(165,88,'4/4','de','2010-03-12 08:47:54','2010-03-12 08:47:54'),
	(166,88,'4/4','en','2010-03-12 08:47:54','2010-03-12 08:47:54'),
	(167,89,'3/4','de','2010-03-12 08:48:52','2010-03-12 08:48:52'),
	(168,89,'3/4','en','2010-03-12 08:48:52','2010-03-12 08:48:52'),
	(169,90,'1/2','de','2010-03-12 08:49:09','2010-03-12 08:49:09'),
	(170,90,'1/2','en','2010-03-12 08:49:09','2010-03-12 08:49:09'),
	(171,91,'Setup','de','2010-03-12 09:56:23','2010-03-12 09:56:23'),
	(172,91,'Setup','en','2010-03-12 09:56:23','2010-03-12 09:56:23'),
	(173,92,'Geige','de','2010-03-12 09:56:35','2010-03-12 09:56:35'),
	(174,92,'Violin','en','2010-03-12 09:56:35','2010-03-12 09:56:35'),
	(175,93,'Bratsche','de','2010-03-12 09:56:52','2010-03-12 09:56:52'),
	(176,93,'Viola','en','2010-03-12 09:56:52','2010-03-12 09:56:52'),
	(177,94,'Bratsche','de','2010-03-12 09:57:06','2010-03-12 09:57:06'),
	(178,94,'Viola','en','2010-03-12 09:57:06','2010-03-12 09:57:06'),
	(179,95,'1/2','de','2010-03-12 09:57:33','2010-03-12 09:57:33'),
	(180,95,'1/2','en','2010-03-12 09:57:33','2010-03-12 09:57:33'),
	(181,96,'3/4','de','2010-03-12 09:57:46','2010-03-12 09:57:46'),
	(182,96,'3/4','en','2010-03-12 09:57:46','2010-03-12 09:57:46'),
	(183,97,'4/4','de','2010-03-12 09:58:05','2010-03-12 09:58:05'),
	(184,97,'4/4','en','2010-03-12 09:58:05','2010-03-12 09:58:05'),
	(185,98,'1/4','de','2010-03-14 16:13:45','2010-03-14 16:13:45'),
	(186,98,'1/4','en','2010-03-14 16:13:45','2010-03-14 16:13:45');

/*!40000 ALTER TABLE `tag_names` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table taggings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggings`;

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`,`updated_at`)
VALUES
	(253,97,1,'User','2010-03-14 14:57:48','2010-03-14 14:57:48'),
	(268,93,1,'User','2010-03-14 16:47:12','2010-03-14 16:47:12'),
	(279,88,1,'User','2010-03-14 17:07:58','2010-03-14 17:07:58'),
	(281,82,1,'User','2010-03-14 17:08:24','2010-03-14 17:08:24'),
	(285,89,1,'User','2010-03-14 17:08:35','2010-03-14 17:08:35'),
	(287,96,1,'User','2010-03-14 17:10:24','2010-03-14 17:10:24'),
	(294,90,1,'User','2010-03-14 17:45:20','2010-03-14 17:45:20'),
	(296,87,1,'User','2010-03-14 17:58:16','2010-03-14 17:58:16'),
	(297,94,1,'User','2010-03-14 17:58:17','2010-03-14 17:58:17'),
	(299,85,1,'User','2010-03-14 17:58:54','2010-03-14 17:58:54'),
	(300,91,1,'User','2010-03-14 17:59:51','2010-03-14 17:59:51'),
	(301,84,1,'User','2010-03-14 17:59:53','2010-03-14 17:59:53'),
	(302,92,1,'User','2010-03-14 17:59:59','2010-03-14 17:59:59'),
	(303,98,1,'User','2010-03-14 18:00:08','2010-03-14 18:00:08'),
	(304,95,1,'User','2010-03-14 18:00:23','2010-03-14 18:00:23'),
	(305,80,1,'User','2010-03-14 18:03:13','2010-03-14 18:03:13');

/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `parent_id` int(11) default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`,`taggable_type`,`created_at`,`updated_at`,`parent_id`,`position`)
VALUES
	(80,'User','2010-03-12 07:57:24','2010-03-12 15:56:51',NULL,0),
	(82,'User','2010-03-12 07:57:57','2010-03-14 16:12:52',80,0),
	(84,'User','2010-03-12 08:39:57','2010-03-12 15:56:51',NULL,1),
	(85,'User','2010-03-12 08:40:22','2010-03-12 08:40:22',84,0),
	(87,'User','2010-03-12 08:42:40','2010-03-12 08:42:40',82,0),
	(88,'User','2010-03-12 08:47:54','2010-03-12 09:53:13',87,2),
	(89,'User','2010-03-12 08:48:52','2010-03-12 09:53:13',87,1),
	(90,'User','2010-03-12 08:49:09','2010-03-12 09:53:12',87,0),
	(91,'User','2010-03-12 09:56:23','2010-03-14 16:12:52',80,1),
	(92,'User','2010-03-12 09:56:35','2010-03-12 09:56:35',91,0),
	(93,'User','2010-03-12 09:56:52','2010-03-12 09:56:52',91,1),
	(94,'User','2010-03-12 09:57:06','2010-03-12 09:57:06',82,1),
	(95,'User','2010-03-12 09:57:33','2010-03-12 09:57:33',94,0),
	(96,'User','2010-03-12 09:57:46','2010-03-12 09:57:46',94,1),
	(97,'User','2010-03-12 09:58:05','2010-03-12 09:58:05',94,2),
	(98,'User','2010-03-14 16:13:45','2010-03-14 16:13:45',93,0);

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `password_hash` varchar(255) collate utf8_unicode_ci default NULL,
  `password_salt` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`email`,`password_hash`,`password_salt`,`created_at`,`updated_at`)
VALUES
	(1,'thomas','thomas.kohler@gmx.at','19fcfa817cd5f5939817febcdcf985ab809363b3','f333a49adfd3043e91073f1d8122066d256ed736','2010-03-08 20:25:32','2010-03-09 10:48:16'),
	(2,'alex','alex.lang@gmx.at','009bfeae03133cee1fbd19bbcfcbb7106ba2f4bd','273b9e4935a294e1505f487d2666de8343904f34','2010-03-11 15:26:26','2010-03-11 15:26:26');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

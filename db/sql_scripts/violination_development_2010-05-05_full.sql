# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.81)
# Database: violination_development
# Generation Time: 2010-05-05 14:21:54 +0200
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `contact` tinyint(1) default NULL,
  `item_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`,`user_id`,`contact`,`item_type`,`created_at`,`updated_at`)
VALUES
	(6,6,0,'Stringg','2010-04-13 16:55:09','2010-04-13 16:56:23'),
	(7,6,0,'Bow','2010-04-13 17:01:10','2010-04-13 17:01:10'),
	(8,6,0,'Stringg','2010-04-14 08:09:10','2010-04-14 08:09:10'),
	(9,2,0,'Stringg','2010-04-14 08:15:22','2010-04-14 08:15:22'),
	(10,2,0,'Stringg','2010-04-14 08:16:45','2010-04-14 08:16:45');

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL auto_increment,
  `lat` decimal(15,10) default NULL,
  `lng` decimal(15,10) default NULL,
  `distance` float default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`,`lat`,`lng`,`distance`,`taggable_id`,`taggable_type`,`created_at`,`updated_at`,`address`)
VALUES
	(2,48.3654574000,10.8947684000,NULL,2,'User','2010-04-16 14:53:21','2010-04-16 16:23:30',NULL),
	(3,NULL,NULL,NULL,4,'User','2010-04-16 14:53:21','2010-04-16 14:53:21',NULL),
	(4,48.2182322000,16.3997216000,NULL,6,'User','2010-04-16 14:53:21','2010-04-17 16:23:20','Ausstellungsstraße 15, 1020 Wien, Österreich');

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table photo_containers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `photo_containers`;

CREATE TABLE `photo_containers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `photo_containers` WRITE;
/*!40000 ALTER TABLE `photo_containers` DISABLE KEYS */;
INSERT INTO `photo_containers` (`id`,`name`,`user_id`,`created_at`,`updated_at`)
VALUES
	(1,'Redaktionellss',6,'2010-04-18 14:21:17','2010-04-18 14:43:50');

/*!40000 ALTER TABLE `photo_containers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `filename` varchar(255) collate utf8_unicode_ci default NULL,
  `thumbnail` varchar(255) collate utf8_unicode_ci default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `photo_container_id` int(11) default NULL,
  `description` varchar(1000) collate utf8_unicode_ci default 'Violination.com',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `photo_container_type` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3412 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` (`id`,`parent_id`,`content_type`,`filename`,`thumbnail`,`size`,`width`,`height`,`photo_container_id`,`description`,`created_at`,`updated_at`,`photo_container_type`)
VALUES
	(3402,NULL,'image/jpeg','8.jpeg',NULL,68553,800,532,7,'Violination.com','2010-04-13 17:02:12','2010-04-13 17:02:12','Item'),
	(3403,3402,'image/jpeg','8_thumb.jpeg','thumb',68553,140,140,7,'Violination.com','2010-04-13 17:02:13','2010-04-13 17:02:13','Item'),
	(3404,NULL,'image/jpeg','instrumentimages3.jpeg',NULL,449353,1228,2126,6,'Violination.com','2010-04-15 08:56:52','2010-04-15 08:56:52','Item'),
	(3405,3404,'image/jpeg','instrumentimages3_thumb.jpeg','thumb',449353,140,140,6,'Violination.com','2010-04-15 08:56:53','2010-04-15 08:56:53','Item'),
	(3408,NULL,'image/jpeg','image001.jpg',NULL,144728,917,610,1,'Violination.comddd','2010-04-18 14:26:22','2010-04-18 14:27:13','PhotoContainer'),
	(3409,3408,'image/jpeg','image001_thumb.jpg','thumb',144728,140,140,1,'Violination.com','2010-04-18 14:26:22','2010-04-18 14:26:22','PhotoContainer'),
	(3410,NULL,'image/jpeg','image003.jpg',NULL,120256,917,610,1,'Violination.com','2010-04-18 14:43:59','2010-04-18 14:43:59','PhotoContainer'),
	(3411,3410,'image/jpeg','image003_thumb.jpg','thumb',120256,140,140,1,'Violination.com','2010-04-18 14:43:59','2010-04-18 14:43:59','PhotoContainer');

/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;


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
	('20100311154524'),
	('20100315162717'),
	('20100316095404'),
	('20100316103159'),
	('20100318215716'),
	('20100318225327'),
	('20100318225833'),
	('20100319124404'),
	('20100319124505'),
	('20100319134606'),
	('20100319134627'),
	('20100322165616'),
	('20100322170144'),
	('20100323100414'),
	('20100326181430'),
	('20100326182506'),
	('20100405085014'),
	('20100407075359'),
	('20100407081224'),
	('20100407082749'),
	('20100411133639'),
	('20100414123908'),
	('20100416111450'),
	('20100416183314'),
	('20100416183706'),
	('20100416184014'),
	('20100416184404'),
	('20100416185032'),
	('20100416185528'),
	('20100416185556'),
	('20100418124903'),
	('20100418125835'),
	('20100418141141');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sitenames
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitenames`;

CREATE TABLE `sitenames` (
  `id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitenames` WRITE;
/*!40000 ALTER TABLE `sitenames` DISABLE KEYS */;
INSERT INTO `sitenames` (`id`,`site_id`,`value`,`language`,`created_at`,`updated_at`)
VALUES
	(1,5,'deutscherdd','de','2010-04-16 21:37:29','2010-04-16 22:11:49'),
	(2,5,'name','en','2010-04-16 21:37:30','2010-04-16 21:37:30'),
	(3,6,'asdf','de','2010-04-16 22:19:05','2010-04-16 22:19:05'),
	(4,6,'asdf','en','2010-04-16 22:19:05','2010-04-16 22:19:05'),
	(5,7,'dd','de','2010-04-16 22:39:42','2010-04-16 22:39:42'),
	(6,7,'ddd','en','2010-04-16 22:39:42','2010-04-16 22:39:42'),
	(7,8,'sdf','de','2010-04-16 22:45:40','2010-04-16 22:45:40'),
	(8,8,'sdf','en','2010-04-16 22:45:40','2010-04-16 22:45:40'),
	(9,9,'asdfddddddd','de','2010-04-16 22:52:30','2010-04-19 20:44:34'),
	(10,9,'asdf','en','2010-04-16 22:52:30','2010-04-16 22:52:30'),
	(11,10,'asdf','de','2010-04-16 22:52:38','2010-04-16 22:52:38'),
	(12,10,'asdf','en','2010-04-16 22:52:38','2010-04-16 22:52:38'),
	(13,11,'johann','de','2010-04-17 07:46:47','2010-04-17 07:46:47'),
	(14,11,'johann','en','2010-04-17 07:46:47','2010-04-17 07:46:47'),
	(15,12,'neuer eintrag','de','2010-04-17 08:00:38','2010-04-17 08:00:38'),
	(16,12,'neuer eintrag','en','2010-04-17 08:00:38','2010-04-17 08:00:38'),
	(17,13,'Startsteite rechts','de','2010-04-17 10:17:51','2010-04-17 10:17:51'),
	(18,13,'Home right','en','2010-04-17 10:17:51','2010-04-17 10:17:51'),
	(19,14,'asdf','de','2010-04-17 10:21:50','2010-04-17 10:21:50'),
	(20,14,'asf','en','2010-04-17 10:21:50','2010-04-17 10:21:50');

/*!40000 ALTER TABLE `sitenames` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL auto_increment,
  `siteable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `parent_id` int(11) default NULL,
  `active` tinyint(1) default NULL,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` (`id`,`siteable_type`,`parent_id`,`active`,`position`,`created_at`,`updated_at`)
VALUES
	(5,'Editorial',NULL,1,1,'2010-04-16 21:37:29','2010-04-19 20:44:40'),
	(6,'Editorial',NULL,1,0,'2010-04-16 22:19:05','2010-04-19 20:44:40'),
	(9,'Editorial',NULL,1,2,'2010-04-16 22:52:30','2010-04-16 22:52:30'),
	(12,'Editorial',6,1,0,'2010-04-17 08:00:38','2010-04-17 08:00:38'),
	(13,'Startright',NULL,1,0,'2010-04-17 10:17:51','2010-04-17 10:17:51'),
	(14,'Startleft',NULL,1,0,'2010-04-17 10:21:50','2010-04-17 10:21:50');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sitetextnames
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitetextnames`;

CREATE TABLE `sitetextnames` (
  `id` int(11) NOT NULL auto_increment,
  `sitetext_id` int(11) default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `content` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitetextnames` WRITE;
/*!40000 ALTER TABLE `sitetextnames` DISABLE KEYS */;
INSERT INTO `sitetextnames` (`id`,`sitetext_id`,`value`,`language`,`created_at`,`updated_at`,`content`)
VALUES
	(3,3,'deutschsd','de','2010-04-17 08:53:30','2010-04-17 09:45:01','<p>johannasdfasdf</p>'),
	(4,3,'englishas','en','2010-04-17 08:53:30','2010-04-17 09:44:31',''),
	(5,4,'deuschddddddd','de','2010-04-17 09:59:21','2010-04-18 13:07:16','<p>sdfsdfsdf</p>\r\n<p>sdfsdf</p>\r\n<p>sdf</p>\r\n<p>sdf</p>\r\n<p>sd</p>\r\n<p>f</p>'),
	(6,4,'englischdddddddd','en','2010-04-17 09:59:21','2010-04-17 09:59:21',''),
	(7,5,'ddd','de','2010-04-17 10:04:12','2010-04-17 10:04:12',''),
	(8,5,'ddd','en','2010-04-17 10:04:12','2010-04-17 10:04:12',''),
	(9,6,'Start rechts','de','2010-04-17 10:18:14','2010-04-17 10:18:22','<p>rechte seite</p>'),
	(10,6,'home right','en','2010-04-17 10:18:14','2010-04-17 10:18:14',''),
	(11,7,'asdf','de','2010-04-17 10:21:56','2010-04-17 10:22:03','<p>adsasd</p>'),
	(12,7,'asdf','en','2010-04-17 10:21:56','2010-04-17 10:21:56',''),
	(13,8,'erster eintrag','de','2010-04-17 17:04:20','2010-04-17 17:04:25','<p>asdfasdf</p>'),
	(14,8,'first entry','en','2010-04-17 17:04:20','2010-04-17 17:04:20',''),
	(15,9,'sdf','de','2010-04-17 18:06:06','2010-04-17 18:06:06',''),
	(16,9,'sdf','en','2010-04-17 18:06:06','2010-04-17 18:06:06',''),
	(17,10,'drei','de','2010-04-18 13:08:11','2010-04-18 13:24:45','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'),
	(18,10,'dfgdfg','en','2010-04-18 13:08:11','2010-04-18 13:08:11',''),
	(19,11,'eins','de','2010-04-18 13:08:27','2010-04-18 13:49:30','<h2>Gewissenhaft</h2>\r\n<p><img src=\"http://violination.com/Violination/img/tetzlaff.jpg\" alt=\"Christian Tetzlaff\" width=\"100\" height=\"150\" />Solo und in Kammerensembles hat Christian Tetzlaff sich die Reputation als &bdquo;einer der brillantesten und neugierigsten K&uuml;nstler der neuen Generation&ldquo; (New York Times) erworben. Viele seiner Interpretationen klassischer und moderner Violinkonzerte haben Referenzstatus. Vor einem Auftritt am Oldenburger Staatstheater ergab sich die Gelegenheit, dass Hans Dieter Gr&uuml;nefeld mit Christian Tetzlaff &uuml;ber seine Ansichten und Praxis als Solist sprechen konnte.</p>\r\n<p><a href=\"../../show_sites?site=17\">mehr lesen ...</a></p>'),
	(20,11,'sdfgsdfg','en','2010-04-18 13:08:27','2010-04-18 13:08:27',''),
	(21,12,'zwei','de','2010-04-18 13:17:23','2010-04-18 13:24:39','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'),
	(22,12,'dsfgsdfg','en','2010-04-18 13:17:23','2010-04-18 13:17:23','');

/*!40000 ALTER TABLE `sitetextnames` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sitetexts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitetexts`;

CREATE TABLE `sitetexts` (
  `id` int(11) NOT NULL auto_increment,
  `textable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `active` tinyint(1) default NULL,
  `archive` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `textable_id` int(11) default NULL,
  `position` int(11) default NULL,
  `align` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitetexts` WRITE;
/*!40000 ALTER TABLE `sitetexts` DISABLE KEYS */;
INSERT INTO `sitetexts` (`id`,`textable_type`,`active`,`archive`,`created_at`,`updated_at`,`textable_id`,`position`,`align`)
VALUES
	(3,'Editorial',1,0,'2010-04-17 08:53:30','2010-04-17 10:04:25',6,1,NULL),
	(4,'Editorial',1,0,'2010-04-17 09:59:21','2010-04-18 13:06:10',6,0,'full'),
	(6,'Startright',1,0,'2010-04-17 10:18:14','2010-04-17 10:18:14',13,0,NULL),
	(7,'Startleft',1,0,'2010-04-17 10:21:56','2010-04-17 10:21:56',14,0,NULL),
	(8,'Editorial',1,0,'2010-04-17 17:04:20','2010-04-18 12:54:02',12,0,'left'),
	(9,'Startleft',1,0,'2010-04-17 18:06:06','2010-04-17 18:06:06',14,1,NULL),
	(10,'Editorial',1,0,'2010-04-18 13:08:11','2010-04-18 13:25:02',5,1,'right'),
	(11,'Editorial',1,0,'2010-04-18 13:08:27','2010-04-18 13:22:43',5,0,'left'),
	(12,'Editorial',1,0,'2010-04-18 13:17:23','2010-04-18 13:25:02',5,2,'full');

/*!40000 ALTER TABLE `sitetexts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tag_names` WRITE;
/*!40000 ALTER TABLE `tag_names` DISABLE KEYS */;
INSERT INTO `tag_names` (`id`,`tag_id`,`value`,`language`,`created_at`,`updated_at`)
VALUES
	(446,1,'Art','de','2010-04-01 10:14:39','2010-04-01 10:14:39'),
	(447,1,'Größe','en','2010-04-01 10:14:39','2010-04-01 10:14:39'),
	(448,2,'Preis','de','2010-04-01 11:21:21','2010-04-01 11:21:21'),
	(449,2,'Price','en','2010-04-01 11:21:21','2010-04-01 11:21:21'),
	(450,3,'Geige','de','2010-04-01 11:21:51','2010-04-12 18:26:21'),
	(451,3,'Masterinstrument','en','2010-04-01 11:21:51','2010-04-04 20:56:45'),
	(456,6,'Art','de','2010-04-02 15:48:53','2010-04-02 15:48:53'),
	(457,6,'Kind','en','2010-04-02 15:48:53','2010-04-02 15:48:53'),
	(458,7,'Preis','de','2010-04-02 15:49:01','2010-04-02 15:49:01'),
	(459,7,'Price','en','2010-04-02 15:49:01','2010-04-02 15:49:01'),
	(460,8,'Meisterbogen','de','2010-04-02 15:49:26','2010-04-02 15:49:26'),
	(461,8,'Master bow','en','2010-04-02 15:49:26','2010-04-02 15:49:26'),
	(462,9,'Werkstatt Bogen','de','2010-04-02 15:49:54','2010-04-02 15:49:54'),
	(463,9,'Workshop Bow','en','2010-04-02 15:49:54','2010-04-02 15:49:54'),
	(466,11,'Größe','de','2010-04-04 22:34:18','2010-04-06 13:13:30'),
	(467,11,'Size','en','2010-04-04 22:34:18','2010-04-06 13:13:30'),
	(472,14,'Beschreibung','de','2010-04-06 16:20:59','2010-04-06 16:20:59'),
	(473,14,'Description','en','2010-04-06 16:20:59','2010-04-06 16:20:59'),
	(482,19,'Mein persönliches leben','de','2010-04-09 15:27:02','2010-04-09 15:27:02'),
	(483,19,'My personal life','en','2010-04-09 15:27:02','2010-04-09 15:27:02'),
	(484,20,'johann','de','2010-04-09 15:36:22','2010-04-09 15:36:22'),
	(485,20,'joahn','en','2010-04-09 15:36:22','2010-04-09 15:36:22'),
	(486,21,'Geigenbau','de','2010-04-12 12:18:49','2010-04-12 12:18:49'),
	(487,21,'','en','2010-04-12 12:18:49','2010-04-12 12:18:49'),
	(488,22,'Geige','de','2010-04-12 12:20:32','2010-04-12 12:20:32'),
	(489,22,'','en','2010-04-12 12:20:32','2010-04-12 12:20:32'),
	(490,23,'Bratsche','de','2010-04-12 12:20:40','2010-04-12 12:20:40'),
	(491,23,'','en','2010-04-12 12:20:40','2010-04-12 12:20:40'),
	(492,24,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa','de','2010-04-12 12:20:52','2010-04-12 14:28:06'),
	(493,24,'','en','2010-04-12 12:20:52','2010-04-12 12:20:52'),
	(494,25,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa','de','2010-04-12 12:21:04','2010-04-12 14:28:20'),
	(495,25,'','en','2010-04-12 12:21:04','2010-04-12 12:21:04'),
	(496,26,'q/1','de','2010-04-12 12:21:19','2010-04-12 12:21:19'),
	(497,26,'','en','2010-04-12 12:21:19','2010-04-12 12:21:19'),
	(498,27,'1/1','de','2010-04-12 12:21:25','2010-04-12 12:21:25'),
	(499,27,'','en','2010-04-12 12:21:25','2010-04-12 12:21:25'),
	(500,28,'Bratsche','de','2010-04-12 15:01:10','2010-04-13 07:37:57'),
	(501,28,'','en','2010-04-12 15:01:10','2010-04-12 15:01:10'),
	(502,29,'sdfgsdfg','de','2010-04-12 15:01:16','2010-04-12 15:01:16'),
	(503,29,'','en','2010-04-12 15:01:16','2010-04-12 15:01:16'),
	(504,30,'Qualität','de','2010-04-12 18:25:53','2010-04-12 18:25:53'),
	(505,30,'','en','2010-04-12 18:25:53','2010-04-12 18:25:53'),
	(506,31,'Meisterinstrument','de','2010-04-12 18:26:08','2010-04-12 18:26:08'),
	(507,31,'','en','2010-04-12 18:26:08','2010-04-12 18:26:08'),
	(508,32,'Adresse','de','2010-04-12 20:36:03','2010-04-12 20:36:03'),
	(509,32,'Address','en','2010-04-12 20:36:03','2010-04-12 20:36:03'),
	(510,33,'braTsche','de','2010-04-13 09:22:07','2010-04-14 21:24:35'),
	(511,33,'','en','2010-04-13 09:22:07','2010-04-13 09:22:07'),
	(512,34,'fabriksinstrument','de','2010-04-13 09:22:49','2010-04-13 09:22:49'),
	(513,34,'','en','2010-04-13 09:22:49','2010-04-13 09:22:49'),
	(514,35,'Beschreibung','de','2010-04-13 17:01:34','2010-04-13 17:01:34'),
	(515,35,'Description','en','2010-04-13 17:01:34','2010-04-13 17:01:34');

/*!40000 ALTER TABLE `tag_names` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tag_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag_values`;

CREATE TABLE `tag_values` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(2000) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tag_values` WRITE;
/*!40000 ALTER TABLE `tag_values` DISABLE KEYS */;
INSERT INTO `tag_values` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`language`,`value`,`created_at`,`updated_at`)
VALUES
	(159,32,2,'User','de','Ausstellungsstrasse 3/15, 1020 augsburg, Österreich','2010-04-12 20:51:34','2010-04-14 08:16:26'),
	(160,32,2,'User','en','Ausstellungsstrasse 3/15, 1020 augsburg, Österreich','2010-04-12 20:51:34','2010-04-14 08:16:26'),
	(161,28,2,'Workshop','de',NULL,'2010-04-13 07:37:43','2010-04-13 07:37:43'),
	(162,28,2,'Workshop','en',NULL,'2010-04-13 07:37:43','2010-04-13 07:37:43'),
	(163,29,2,'Workshop','de',NULL,'2010-04-13 07:37:47','2010-04-13 07:37:47'),
	(164,29,2,'Workshop','en',NULL,'2010-04-13 07:37:47','2010-04-13 07:37:47'),
	(181,1,6,'Item','de',NULL,'2010-04-13 16:55:11','2010-04-13 16:55:11'),
	(182,1,6,'Item','en',NULL,'2010-04-13 16:55:11','2010-04-13 16:55:11'),
	(183,3,6,'Item','de',NULL,'2010-04-13 16:55:13','2010-04-13 16:55:13'),
	(184,3,6,'Item','en',NULL,'2010-04-13 16:55:13','2010-04-13 16:55:13'),
	(185,2,6,'Item','de','1200,00','2010-04-13 16:55:15','2010-04-13 16:55:21'),
	(186,2,6,'Item','en','1200,00','2010-04-13 16:55:15','2010-04-13 16:55:21'),
	(187,11,6,'Item','de','4/4','2010-04-13 16:55:23','2010-04-13 16:55:31'),
	(188,11,6,'Item','en','','2010-04-13 16:55:23','2010-04-13 16:55:31'),
	(189,14,6,'Item','de','Geige aus meinem gebrauch','2010-04-13 16:55:32','2010-04-13 16:55:47'),
	(190,14,6,'Item','en','','2010-04-13 16:55:32','2010-04-13 16:55:47'),
	(191,30,6,'Item','de',NULL,'2010-04-13 16:55:49','2010-04-13 16:55:49'),
	(192,30,6,'Item','en',NULL,'2010-04-13 16:55:49','2010-04-13 16:55:49'),
	(193,31,6,'Item','de',NULL,'2010-04-13 16:55:55','2010-04-13 16:55:55'),
	(194,31,6,'Item','en',NULL,'2010-04-13 16:55:55','2010-04-13 16:55:55'),
	(195,21,12,'Workshop','de',NULL,'2010-04-13 16:56:57','2010-04-13 16:56:57'),
	(196,21,12,'Workshop','en',NULL,'2010-04-13 16:56:57','2010-04-13 16:56:57'),
	(197,28,12,'Workshop','de',NULL,'2010-04-13 16:56:58','2010-04-13 16:56:58'),
	(198,28,12,'Workshop','en',NULL,'2010-04-13 16:56:58','2010-04-13 16:56:58'),
	(199,22,12,'Workshop','de',NULL,'2010-04-13 16:57:01','2010-04-13 16:57:01'),
	(200,22,12,'Workshop','en',NULL,'2010-04-13 16:57:01','2010-04-13 16:57:01'),
	(201,23,12,'Workshop','de',NULL,'2010-04-13 16:57:01','2010-04-13 16:57:01'),
	(202,23,12,'Workshop','en',NULL,'2010-04-13 16:57:01','2010-04-13 16:57:01'),
	(203,24,12,'Workshop','de',NULL,'2010-04-13 16:57:04','2010-04-13 16:57:04'),
	(204,24,12,'Workshop','en',NULL,'2010-04-13 16:57:04','2010-04-13 16:57:04'),
	(205,25,12,'Workshop','de',NULL,'2010-04-13 16:57:05','2010-04-13 16:57:05'),
	(206,25,12,'Workshop','en',NULL,'2010-04-13 16:57:05','2010-04-13 16:57:05'),
	(207,26,12,'Workshop','de',NULL,'2010-04-13 16:57:10','2010-04-13 16:57:10'),
	(208,26,12,'Workshop','en',NULL,'2010-04-13 16:57:10','2010-04-13 16:57:10'),
	(209,27,12,'Workshop','de',NULL,'2010-04-13 16:57:10','2010-04-13 16:57:10'),
	(210,27,12,'Workshop','en',NULL,'2010-04-13 16:57:10','2010-04-13 16:57:10'),
	(211,29,12,'Workshop','de',NULL,'2010-04-13 16:57:33','2010-04-13 16:57:33'),
	(212,29,12,'Workshop','en',NULL,'2010-04-13 16:57:33','2010-04-13 16:57:33'),
	(213,6,7,'Item','de',NULL,'2010-04-13 17:01:12','2010-04-13 17:01:12'),
	(214,6,7,'Item','en',NULL,'2010-04-13 17:01:12','2010-04-13 17:01:12'),
	(215,8,7,'Item','de',NULL,'2010-04-13 17:01:15','2010-04-13 17:01:15'),
	(216,8,7,'Item','en',NULL,'2010-04-13 17:01:15','2010-04-13 17:01:15'),
	(217,7,7,'Item','de','1200,00','2010-04-13 17:01:16','2010-04-13 17:01:21'),
	(218,7,7,'Item','en','1200,00','2010-04-13 17:01:16','2010-04-13 17:01:21'),
	(219,35,7,'Item','de','asdasdf','2010-04-13 17:01:49','2010-04-13 17:01:53'),
	(220,35,7,'Item','en','','2010-04-13 17:01:49','2010-04-13 17:01:53'),
	(221,19,6,'User','de','asdf','2010-04-13 17:11:14','2010-04-13 17:11:19'),
	(222,19,6,'User','en','','2010-04-13 17:11:14','2010-04-13 17:11:19'),
	(223,20,6,'User','de','adfs','2010-04-13 17:11:14','2010-04-13 17:11:23'),
	(224,20,6,'User','en','','2010-04-13 17:11:14','2010-04-13 17:11:23'),
	(225,32,6,'User','de','Ausstellungsstrasse 3/15 1020 wien','2010-04-13 17:11:15','2010-04-14 08:24:45'),
	(226,32,6,'User','en','Ausstellungsstrasse 3/15 1020 wien','2010-04-13 17:11:15','2010-04-14 08:24:45'),
	(227,1,8,'Item','de',NULL,'2010-04-14 08:09:12','2010-04-14 08:09:12'),
	(228,1,8,'Item','en',NULL,'2010-04-14 08:09:12','2010-04-14 08:09:12'),
	(229,3,8,'Item','de',NULL,'2010-04-14 08:09:16','2010-04-14 08:09:16'),
	(230,3,8,'Item','en',NULL,'2010-04-14 08:09:16','2010-04-14 08:09:16'),
	(231,2,8,'Item','de','1200,00','2010-04-14 08:09:17','2010-04-14 08:09:27'),
	(232,2,8,'Item','en','1200,00','2010-04-14 08:09:17','2010-04-14 08:09:27'),
	(233,11,8,'Item','de','2/4','2010-04-14 08:09:29','2010-04-14 08:09:39'),
	(234,11,8,'Item','en','','2010-04-14 08:09:29','2010-04-14 08:09:39'),
	(235,30,8,'Item','de',NULL,'2010-04-14 08:09:40','2010-04-14 08:09:40'),
	(236,30,8,'Item','en',NULL,'2010-04-14 08:09:40','2010-04-14 08:09:40'),
	(237,31,8,'Item','de',NULL,'2010-04-14 08:09:46','2010-04-14 08:09:46'),
	(238,31,8,'Item','en',NULL,'2010-04-14 08:09:46','2010-04-14 08:09:46'),
	(239,1,9,'Item','de',NULL,'2010-04-14 08:15:24','2010-04-14 08:15:24'),
	(240,1,9,'Item','en',NULL,'2010-04-14 08:15:24','2010-04-14 08:15:24'),
	(241,33,9,'Item','de',NULL,'2010-04-14 08:15:28','2010-04-14 08:15:28'),
	(242,33,9,'Item','en',NULL,'2010-04-14 08:15:28','2010-04-14 08:15:28'),
	(243,11,9,'Item','de','4000,00','2010-04-14 08:15:31','2010-04-14 08:15:38'),
	(244,11,9,'Item','en','','2010-04-14 08:15:31','2010-04-14 08:15:38'),
	(245,30,9,'Item','de',NULL,'2010-04-14 08:15:41','2010-04-14 08:15:41'),
	(246,30,9,'Item','en',NULL,'2010-04-14 08:15:41','2010-04-14 08:15:41'),
	(247,31,9,'Item','de',NULL,'2010-04-14 08:15:45','2010-04-14 08:15:45'),
	(248,31,9,'Item','en',NULL,'2010-04-14 08:15:45','2010-04-14 08:15:45'),
	(249,1,10,'Item','de',NULL,'2010-04-14 08:16:47','2010-04-14 08:16:47'),
	(250,1,10,'Item','en',NULL,'2010-04-14 08:16:47','2010-04-14 08:16:47'),
	(251,3,10,'Item','de',NULL,'2010-04-14 08:16:53','2010-04-14 08:16:53'),
	(252,3,10,'Item','en',NULL,'2010-04-14 08:16:53','2010-04-14 08:16:53'),
	(253,30,10,'Item','de',NULL,'2010-04-14 08:16:55','2010-04-14 08:16:55'),
	(254,30,10,'Item','en',NULL,'2010-04-14 08:16:55','2010-04-14 08:16:55'),
	(255,34,10,'Item','de',NULL,'2010-04-14 08:16:58','2010-04-14 08:16:58'),
	(256,34,10,'Item','en',NULL,'2010-04-14 08:16:58','2010-04-14 08:16:58'),
	(257,33,6,'Item','de',NULL,'2010-04-14 20:53:28','2010-04-14 20:53:28'),
	(258,33,6,'Item','en',NULL,'2010-04-14 20:53:28','2010-04-14 20:53:28');

/*!40000 ALTER TABLE `tag_values` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`,`updated_at`)
VALUES
	(208,32,2,'User','2010-04-12 20:51:34','2010-04-12 20:51:34'),
	(213,28,2,'Workshop','2010-04-13 07:37:43','2010-04-13 07:37:43'),
	(214,29,2,'Workshop','2010-04-13 07:37:47','2010-04-13 07:37:47'),
	(224,1,6,'Item','2010-04-13 16:55:11','2010-04-13 16:55:11'),
	(226,2,6,'Item','2010-04-13 16:55:15','2010-04-13 16:55:15'),
	(227,11,6,'Item','2010-04-13 16:55:23','2010-04-13 16:55:23'),
	(228,14,6,'Item','2010-04-13 16:55:32','2010-04-13 16:55:32'),
	(229,30,6,'Item','2010-04-13 16:55:49','2010-04-13 16:55:49'),
	(230,31,6,'Item','2010-04-13 16:55:54','2010-04-13 16:55:54'),
	(231,21,12,'Workshop','2010-04-13 16:56:57','2010-04-13 16:56:57'),
	(232,28,12,'Workshop','2010-04-13 16:56:58','2010-04-13 16:56:58'),
	(233,22,12,'Workshop','2010-04-13 16:57:01','2010-04-13 16:57:01'),
	(234,23,12,'Workshop','2010-04-13 16:57:01','2010-04-13 16:57:01'),
	(235,24,12,'Workshop','2010-04-13 16:57:04','2010-04-13 16:57:04'),
	(236,25,12,'Workshop','2010-04-13 16:57:05','2010-04-13 16:57:05'),
	(237,26,12,'Workshop','2010-04-13 16:57:10','2010-04-13 16:57:10'),
	(238,27,12,'Workshop','2010-04-13 16:57:10','2010-04-13 16:57:10'),
	(239,29,12,'Workshop','2010-04-13 16:57:33','2010-04-13 16:57:33'),
	(240,6,7,'Item','2010-04-13 17:01:12','2010-04-13 17:01:12'),
	(241,8,7,'Item','2010-04-13 17:01:15','2010-04-13 17:01:15'),
	(242,7,7,'Item','2010-04-13 17:01:16','2010-04-13 17:01:16'),
	(243,35,7,'Item','2010-04-13 17:01:49','2010-04-13 17:01:49'),
	(244,19,6,'User','2010-04-13 17:11:14','2010-04-13 17:11:14'),
	(245,20,6,'User','2010-04-13 17:11:14','2010-04-13 17:11:14'),
	(246,32,6,'User','2010-04-13 17:11:15','2010-04-13 17:11:15'),
	(247,1,8,'Item','2010-04-14 08:09:12','2010-04-14 08:09:12'),
	(248,3,8,'Item','2010-04-14 08:09:16','2010-04-14 08:09:16'),
	(249,2,8,'Item','2010-04-14 08:09:17','2010-04-14 08:09:17'),
	(250,11,8,'Item','2010-04-14 08:09:29','2010-04-14 08:09:29'),
	(251,30,8,'Item','2010-04-14 08:09:40','2010-04-14 08:09:40'),
	(252,31,8,'Item','2010-04-14 08:09:46','2010-04-14 08:09:46'),
	(253,1,9,'Item','2010-04-14 08:15:24','2010-04-14 08:15:24'),
	(254,33,9,'Item','2010-04-14 08:15:28','2010-04-14 08:15:28'),
	(255,11,9,'Item','2010-04-14 08:15:31','2010-04-14 08:15:31'),
	(256,30,9,'Item','2010-04-14 08:15:41','2010-04-14 08:15:41'),
	(257,31,9,'Item','2010-04-14 08:15:45','2010-04-14 08:15:45'),
	(258,1,10,'Item','2010-04-14 08:16:47','2010-04-14 08:16:47'),
	(259,3,10,'Item','2010-04-14 08:16:53','2010-04-14 08:16:53'),
	(260,30,10,'Item','2010-04-14 08:16:55','2010-04-14 08:16:55'),
	(261,34,10,'Item','2010-04-14 08:16:58','2010-04-14 08:16:58'),
	(262,33,6,'Item','2010-04-14 20:53:28','2010-04-14 20:53:28');

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
  `value_type` varchar(255) collate utf8_unicode_ci default NULL,
  `visible` tinyint(1) default '1',
  `searchable` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`,`taggable_type`,`created_at`,`updated_at`,`parent_id`,`position`,`value_type`,`visible`,`searchable`)
VALUES
	(1,'Stringg','2010-04-01 10:14:39','2010-04-14 19:57:25',NULL,0,'textfeld',1,0),
	(2,'Stringg','2010-04-01 11:21:21','2010-04-14 18:21:10',NULL,1,'preisfeld',1,0),
	(3,'Stringg','2010-04-01 11:21:51','2010-04-01 11:21:51',1,0,'textfeld',1,1),
	(6,'Bow','2010-04-02 15:48:53','2010-04-02 15:48:53',NULL,0,'textfeld',1,0),
	(7,'Bow','2010-04-02 15:49:00','2010-04-02 15:49:05',NULL,1,'preisfeld',1,0),
	(8,'Bow','2010-04-02 15:49:26','2010-04-15 10:02:35',6,0,'textfeld',1,1),
	(9,'Bow','2010-04-02 15:49:54','2010-04-15 10:02:40',6,1,'textfeld',1,1),
	(11,'Stringg','2010-04-04 22:34:18','2010-04-14 19:57:48',NULL,2,'einzelfeld',1,1),
	(14,'Stringg','2010-04-06 16:20:59','2010-04-13 16:59:13',NULL,4,'beschreibungsfeld',0,0),
	(19,'User','2010-04-09 15:27:02','2010-04-11 14:23:56',NULL,0,'beschreibungsfeld',1,0),
	(20,'User','2010-04-09 15:36:22','2010-04-13 17:11:05',NULL,1,'beschreibungsfeld',0,0),
	(21,'Workshop','2010-04-12 12:18:49','2010-04-14 23:04:59',NULL,0,'textfeld',1,1),
	(22,'Workshop','2010-04-12 12:20:32','2010-04-12 12:20:32',21,0,'textfeld',1,0),
	(23,'Workshop','2010-04-12 12:20:40','2010-04-12 12:20:40',21,1,'textfeld',1,0),
	(24,'Workshop','2010-04-12 12:20:52','2010-04-12 12:20:52',22,0,'textfeld',1,0),
	(25,'Workshop','2010-04-12 12:21:04','2010-04-12 12:21:04',22,1,'textfeld',1,0),
	(26,'Workshop','2010-04-12 12:21:19','2010-04-12 12:21:19',23,0,'textfeld',1,0),
	(27,'Workshop','2010-04-12 12:21:25','2010-04-12 12:21:25',23,1,'textfeld',1,0),
	(28,'Workshop','2010-04-12 15:01:10','2010-04-12 15:01:10',NULL,1,'textfeld',1,0),
	(29,'Workshop','2010-04-12 15:01:16','2010-04-12 15:01:16',28,0,'textfeld',1,0),
	(30,'Stringg','2010-04-12 18:25:53','2010-04-14 18:21:11',NULL,3,'textfeld',1,0),
	(31,'Stringg','2010-04-12 18:26:08','2010-04-14 19:57:59',30,0,'textfeld',1,1),
	(32,'User','2010-04-12 20:36:03','2010-04-14 21:54:02',NULL,2,'textfeld',1,1),
	(33,'Stringg','2010-04-13 09:22:07','2010-04-14 18:37:48',1,1,'textfeld',1,1),
	(34,'Stringg','2010-04-13 09:22:49','2010-04-14 19:58:06',30,1,'textfeld',1,1),
	(35,'Bow','2010-04-13 17:01:34','2010-04-13 17:01:38',NULL,2,'beschreibungsfeld',0,0);

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
  `firstname` varchar(255) collate utf8_unicode_ci default '',
  `lastname` varchar(255) collate utf8_unicode_ci default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`email`,`password_hash`,`password_salt`,`created_at`,`updated_at`,`firstname`,`lastname`)
VALUES
	(2,'alex','alex.lang@gmx.at','009bfeae03133cee1fbd19bbcfcbb7106ba2f4bd','273b9e4935a294e1505f487d2666de8343904f34','2010-03-11 15:26:26','2010-03-11 15:26:26','',''),
	(4,'michl','michl@michl.com','97b5fe7fd7af77a11e6a975aa7135236f8b7eb24','fff81665d5dbdda3361936f7246ed0465a371733','2010-04-13 16:33:02','2010-04-13 16:33:02','michl','löne'),
	(6,'thomas','thomas.kohler@gmx.at','85a6f6069b8135f9ef93c113e2181f7ec22d9ccc','4cc994d2a0f9272fb014d50cc43b8705058dc950','2010-04-13 16:37:23','2010-04-14 23:26:56','thomas','kohler');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workshops
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workshops`;

CREATE TABLE `workshops` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `description` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `workshops` WRITE;
/*!40000 ALTER TABLE `workshops` DISABLE KEYS */;
INSERT INTO `workshops` (`id`,`user_id`,`created_at`,`updated_at`,`description`)
VALUES
	(2,2,'2010-03-23 10:17:15','2010-04-06 16:09:10','sss'),
	(10,4,'2010-04-13 16:33:02','2010-04-13 16:33:02',NULL),
	(12,6,'2010-04-13 16:37:23','2010-04-16 19:25:42','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui\r\n\r\np ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui of\r\n\r\nficia deserunt mollit anim id est laborum.'),
	(13,6,'2010-04-13 16:37:35','2010-04-13 16:37:35',NULL),
	(14,6,'2010-04-14 23:26:56','2010-04-14 23:26:56',NULL);

/*!40000 ALTER TABLE `workshops` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

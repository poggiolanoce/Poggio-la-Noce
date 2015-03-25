# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: poggia
# Generation Time: 2015-01-21 06:03:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table craft_assetfiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfiles`;

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,1,1,'philosophy-image.jpg','image',335,494,86712,'2015-01-12 18:58:52','2015-01-12 18:58:53','2015-01-20 01:14:53','572feb6f-8562-456b-b1ca-d7452c86c576'),
	(7,2,2,'philosophy-banner.jpg','image',1440,482,118936,'2015-01-12 19:02:01','2015-01-12 19:02:01','2015-01-20 01:14:54','2bfbe8b2-6a41-4fe2-ae07-fcc61c4062da'),
	(11,3,3,'gigio-bottle.png','image',195,742,177345,'2015-01-12 22:25:42','2015-01-12 22:25:42','2015-01-20 01:14:55','2d8e79c6-1b4d-4e24-9ed2-6144c88e8a4b'),
	(12,3,3,'gigio-art.jpg','image',170,288,16882,'2015-01-12 22:27:01','2015-01-12 22:27:01','2015-01-20 01:14:55','a563f78b-5663-4a39-9b13-a53efa5ea262'),
	(15,3,3,'gigetto-art.jpg','image',170,289,19557,'2015-01-12 23:30:08','2015-01-12 23:30:09','2015-01-20 01:14:55','1299b062-e8b0-464a-9b41-e9434726bc0a'),
	(18,3,3,'gigeno-art.jpg','image',170,289,19794,'2015-01-12 23:36:16','2015-01-12 23:36:16','2015-01-20 01:14:55','6e72bac1-6131-4df3-9072-453b02f38f5d'),
	(21,3,3,'pinko-pallino-art.jpg','image',170,288,21203,'2015-01-12 23:37:08','2015-01-12 23:37:08','2015-01-20 01:14:55','a4e24d59-ef46-48f4-9123-3a5b5348b45b'),
	(24,3,3,'paonazzo-art.jpg','image',170,288,20422,'2015-01-13 00:39:17','2015-01-12 23:38:05','2015-01-20 01:14:55','0f800e37-969b-441a-945a-47a956fbda3d'),
	(26,2,2,'Slide1.gif','image',1448,770,43850,'2015-01-13 03:11:46','2015-01-13 03:11:46','2015-01-20 01:14:53','fff2fadb-2a17-40e5-9fa0-700743d08586'),
	(27,2,2,'Slide2.gif','image',1448,770,44754,'2015-01-13 03:12:00','2015-01-13 03:12:00','2015-01-20 01:14:53','09627eb2-61e5-40bc-8711-585b3652e487'),
	(28,2,2,'Slide3.gif','image',1448,770,46397,'2015-01-13 03:12:14','2015-01-13 03:12:14','2015-01-20 01:14:53','7668c3af-5604-4597-bb54-e308142cacde'),
	(50,2,2,'olive_oil_banner_photo_02.jpg','image',1440,482,154210,'2015-01-19 21:00:56','2015-01-19 21:00:56','2015-01-20 01:14:54','78987f19-844a-4589-b4df-a5abdc71c6fc'),
	(52,2,2,'about.jpg','image',1440,482,109985,'2015-01-19 21:05:08','2015-01-19 21:05:09','2015-01-20 01:14:53','717c49d3-da4d-4995-a70a-380bd375faaf'),
	(53,2,2,'vineyard_banner_photo.jpg','image',1440,482,204925,'2015-01-19 22:05:26','2015-01-19 22:05:26','2015-01-20 01:14:54','d1a46a1f-4c73-4be7-8b50-d24ee2ef836b'),
	(54,2,2,'wine-banner.jpg','image',1440,482,69276,'2015-01-13 00:05:43','2015-01-19 23:25:54','2015-01-20 01:14:54','a6e56914-8b19-4dd0-833a-d2d652c91d1b'),
	(55,3,4,'paonazzo-bottle.png','image',202,752,155075,'2015-01-19 21:08:42','2015-01-19 23:25:54','2015-01-20 01:14:54','1e0f748d-b0a5-4c2a-bc75-44e7a1e4250f'),
	(56,3,3,'gigino-bottle.png','image',202,752,150725,'2015-01-19 21:13:48','2015-01-19 23:35:47','2015-01-20 01:14:55','3bbffa3e-76b0-4398-ac10-da6047ea5691'),
	(57,3,3,'gigetto-bottle.png','image',202,752,124107,'2015-01-19 21:13:48','2015-01-19 23:49:20','2015-01-20 01:14:55','8ce213e1-d070-4ea9-bea7-5b17596b4c92'),
	(58,3,3,'gigio.png','image',202,752,175230,'2015-01-19 21:08:38','2015-01-19 23:49:20','2015-01-20 01:14:55','4f0f678c-cd2e-44db-9faf-831ec66a23c9'),
	(59,3,3,'pinko-pallino-bottle.png','image',202,752,161228,'2015-01-19 21:12:21','2015-01-19 23:49:21','2015-01-20 01:14:55','169d1c89-290d-4639-be1b-fa8bfb5fedc3'),
	(60,3,3,'paonazzo.png','image',202,752,155075,'2015-01-19 23:50:31','2015-01-19 23:51:17','2015-01-20 01:14:55','b59467ff-6191-4973-ba3a-aa09f4c91ef3'),
	(61,1,1,'about_sidebar_image.png','image',382,496,79254,'2015-01-20 00:09:16','2015-01-20 00:13:46','2015-01-20 01:14:53','20e9035a-5732-4d16-80d0-c9e0563e946c'),
	(62,1,1,'olive-oil-bottle.jpg','image',334,928,68323,'2015-01-20 00:19:47','2015-01-20 00:13:46','2015-01-20 01:14:53','77c863a0-3860-4181-bf50-78335e091a75'),
	(63,1,1,'about_sidebar_image.gif','image',380,741,41113,'2015-01-20 00:24:16','2015-01-20 00:24:24','2015-01-20 01:14:53','85f13aa9-6846-4a30-9d9e-c528b51d26b7'),
	(64,1,1,'vinyard_sidebar.jpg','image',334,594,88823,'2015-01-20 00:46:02','2015-01-20 00:46:15','2015-01-20 01:14:53','53f7dbfc-d4ab-4402-917d-cbe7c6dbfeef'),
	(65,2,2,'slide1.jpg','image',2695,2020,6919539,'2015-01-15 06:08:14','2015-01-20 01:14:54','2015-01-20 01:14:54','502f9ee7-84ab-4740-9022-9a3ad5c9acf0'),
	(66,2,2,'slide2.jpg','image',3072,1728,1627581,'2015-01-15 06:01:00','2015-01-20 01:14:54','2015-01-20 01:14:54','87683e1e-4d1c-4a93-bd73-336f6fdc292c'),
	(67,2,2,'slide3.jpg','image',3072,1728,2615977,'2015-01-15 06:01:02','2015-01-20 01:14:54','2015-01-20 01:14:54','1eaa6d10-226f-4c66-89ce-97b34991a375'),
	(68,2,2,'slide4.jpg','image',3072,1728,2485399,'2015-01-15 06:08:14','2015-01-20 01:14:54','2015-01-20 01:14:54','6af76973-06d0-4eef-b176-b95133e062cc'),
	(69,2,2,'slide5.jpg','image',2695,2020,6561050,'2015-01-15 06:08:12','2015-01-20 01:14:54','2015-01-20 01:14:54','0af8ec47-aafc-435d-b9aa-3d4759aecc13');

/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assetfolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfolders`;

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Page Images','','2015-01-12 18:44:48','2015-01-12 18:44:48','a8ec864e-b113-4d10-939b-decd833955ea'),
	(2,NULL,2,'Banner Images','','2015-01-12 18:45:15','2015-01-12 18:45:15','24b5e0ce-02c9-4828-b381-3b5919d83a2e'),
	(3,NULL,3,'Wine Images','','2015-01-12 21:44:21','2015-01-12 21:44:21','a325d28c-cf0b-4322-b302-452f285f2b39'),
	(4,3,3,'bottles','bottles/','2015-01-19 23:25:53','2015-01-19 23:25:53','35442ff5-bb70-417f-a10e-c3b87cca2d46');

/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_assetsources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetsources`;

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;

INSERT INTO `craft_assetsources` (`id`, `name`, `handle`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Page Images','pageImages','Local','{\"path\":\"{fileSystemPath}\\/public\\/images\\/pages\\/\",\"url\":\"{siteUrl}\\/images\\/pages\\/\"}',1,10,'2015-01-12 18:44:48','2015-01-12 18:44:48','d2361994-ee53-4ab9-9ae0-d784ed5af6b0'),
	(2,'Banner Images','bannerImages','Local','{\"path\":\"{fileSystemPath}\\/public\\/images\\/banners\\/\",\"url\":\"{siteUrl}\\/images\\/banners\\/\"}',2,11,'2015-01-12 18:45:15','2015-01-12 18:45:15','3e05e82d-9e6f-490d-9e80-6d2d261f222f'),
	(3,'Wine Images','wineImages','Local','{\"path\":\"{fileSystemPath}public\\/images\\/wine\\/\",\"url\":\"{siteUrl}\\/images\\/wine\\/\"}',3,22,'2015-01-12 21:44:21','2015-01-19 22:07:35','215b76cd-beb4-4bdc-aba4-42ccc893a198');

/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categories`;

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups`;

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_categorygroups_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_primaryPhone` text COLLATE utf8_unicode_ci,
  `field_primaryEmail` text COLLATE utf8_unicode_ci,
  `field_primaryAddress` text COLLATE utf8_unicode_ci,
  `field_pageSubtitle` text COLLATE utf8_unicode_ci,
  `field_pageBody` text COLLATE utf8_unicode_ci,
  `field_wineDescription` text COLLATE utf8_unicode_ci,
  `field_wineAdditionalDetails` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_primaryPhone`, `field_primaryEmail`, `field_primaryAddress`, `field_pageSubtitle`, `field_pageBody`, `field_wineDescription`, `field_wineAdditionalDetails`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en_us',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-09 19:54:27','2015-01-09 19:56:04','3452d2cc-e362-4b41-abc2-7342f08b0087'),
	(2,2,'en_us','Welcome to Poggia.dev!','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Poggia.dev will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-09 19:54:28','2015-01-09 21:40:33','d3161996-113b-4df6-b355-8231e0b3b7db'),
	(3,3,'en_us','We just installed Craft!','<p>Craft is the CMS that’s powering Poggia.dev. It’s beautiful, powerful, flexible, and easy-to-use, and it’s made by Pixel &amp; Tonic. We can’t wait to dive in and see what it’s capable of!</p><!--pagebreak--><p>This is even more captivating content, which you couldn’t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.</p><p>Craft: a nice alternative to Word, if you’re making a website.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-09 19:54:29','2015-01-09 21:40:33','98b24f58-ec93-4313-948c-4d320883c4df'),
	(4,4,'en_us',NULL,NULL,'999–123-4567','info@poggiolanoce.com','12345 VINEYARD RD, FIESOLE, TUSCANY, ITALY',NULL,NULL,NULL,NULL,'2015-01-09 21:30:34','2015-01-09 22:25:17','8c31e978-d000-40c6-8d84-a9321144d7ba'),
	(5,4,'it',NULL,NULL,'999–123-4567','info@poggiolanoce.com','12345 VINEYARD RD, FIESOLE, TUSCANY, ITALY',NULL,NULL,NULL,NULL,'2015-01-09 21:40:33','2015-01-09 22:25:17','388c3ecf-0af1-411c-aa19-6dfa437caf53'),
	(6,5,'en_us','philosophy-image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 18:58:52','2015-01-20 01:14:53','69412b7e-1ec8-476f-9a8b-d349c189d716'),
	(7,5,'it','philosophy-image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 18:58:53','2015-01-12 18:58:53','2d9978a7-007e-4097-b606-c5ff8de25f7d'),
	(8,6,'en_us','Philosophy',NULL,NULL,NULL,NULL,'Our Process','<h2>Our work begins at the vineyard</h2><p>We are driven by our love for great wine and we set out from the very beginning with an uncompromising eye for detail to produce the most beautiful, healthy grapes, thus yielding the best possible wine this terroir can enable. Our commitment to achieve excellence begins in the vineyard, where we tend to each vine individually.<br></p><ul><li>Passing through the vineyard, row by row, several times each week.</li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.</li><li>Thinning grape bunches and constantly monitoring the health of the berries.</li></ul><h2>Our dedication carries over to the cellar</h2><p>The same level of dedication and focus carries over to the cellar where the wine is made. We harvest manually and carry the fruit in small trays to the destemmer. Even before the fruit goes to the destemmer, Enzo performs a selection of the grape clusters, prying open each cluster to check for immature berries and imperfections that can develop inside of each closed cluster. After the destemming process, the individual berries roll onto a sorting table where several people check for additional berry imperfections. Only perfect fruit will make it to the fermentation tanks. This is for all the wines we produce, not just our top wine. In addition, we use only the best equipment available. For example, our Bucher destemmer detaches the berries from the stems using rubber-revolving arms, to allow for the berries to remain virtually intact so that we are able to perform an effective selection by hand on the sorting table.<br></p><p>Fermentation occurs naturally relying on indigenous yeast present on the skins. All aspects of vinification that take place during and after fermentation are performed in an un-intrusive manner, whether we do pump-overs or pressing of the must after fermentation. For aging, the juice is transferred to barriques from the best suppliers in France, typically French oak, medium toast, fine grain, with a mixture of both new and used barriques and \"botti\". Further aging will occur in bottles, between 6 months to a year depending on the type of wine.</p><p>This type of uncompromising, detailed work is only possible because our estate is very small, allowing us to put great focus on the quality of what we produce. Working on such a small, human-dimension scale, allows our small team of three people (Claire, Enzo and Roberto) to be 100% devoted to this vineyard, the land and the resulting great products that can derive from it.</p>',NULL,NULL,'2015-01-12 18:58:59','2015-01-20 00:43:20','fd4f7bc8-bd3e-47f4-a6c6-3cd3f73487a1'),
	(9,6,'it','philosophy',NULL,NULL,NULL,NULL,'Our Proccezzzo!','<h2>Our work begins at the vineyard</h2><p>We are driven by our love for great wine and we set out from the very beginning with an uncompromising eye for detail to produce the most beautiful, healthy grapes, thus yielding the best possible wine this terroir can enable. Our commitment to achieve excellence begins in the vineyard, where we tend to each vine individually.<br></p><ul><li>Passing through the vineyard, row by row, several times each week.</li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.</li><li>Thinning grape bunches and constantly monitoring the health of the berries.</li></ul><h2>Our dedication carries over to the cellar</h2><p>The same level of dedication and focus carries over to the cellar where the wine is made. We harvest manually and carry the fruit in small trays to the destemmer. Even before the fruit goes to the destemmer, Enzo performs a selection of the grape clusters, prying open each cluster to check for immature berries and imperfections that can develop inside of each closed cluster. After the destemming process, the individual berries roll onto a sorting table where several people check for additional berry imperfections. Only perfect fruit will make it to the fermentation tanks. This is for all the wines we produce, not just our top wine. In addition, we use only the best equipment available. For example, our Bucher destemmer detaches the berries from the stems using rubber-revolving arms, to allow for the berries to remain virtually intact so that we are able to perform an effective selection by hand on the sorting table.<br></p><p>Fermentation occurs naturally relying on indigenous yeast present on the skins. All aspects of vinification that take place during and after fermentation are performed in an un-intrusive manner, whether we do pump-overs or pressing of the must after fermentation. For aging, the juice is transferred to barriques from the best suppliers in France, typically French oak, medium toast, fine grain, with a mixture of both new and used barriques and \"botti\". Further aging will occur in bottles, between 6 months to a year depending on the type of wine.</p><p>This type of uncompromising, detailed work is only possible because our estate is very small, allowing us to put great focus on the quality of what we produce. Working on such a small, human-dimension scale, allows our small team of three people (Claire, Enzo and Roberto) to be 100% devoted to this vineyard, the land and the resulting great products that can derive from it.</p>',NULL,NULL,'2015-01-12 18:58:59','2015-01-20 00:43:20','aa1bee02-5348-4521-b985-eb337e93b936'),
	(10,7,'en_us','philosophy-banner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 19:02:01','2015-01-20 01:14:54','075bb60d-54d9-4996-9899-868f1d529991'),
	(11,7,'it','philosophy-banner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 19:02:01','2015-01-12 19:02:01','4e09d294-10e2-40a4-a949-49c9eaa3069b'),
	(12,9,'en_us','Gigio',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Gigiò is the estate\'s first-born and flagship wine. It is a blend of Sangiovese (90%) and Teroldego (10%). Aged for three years before release, it is the product of the most mature and fully developed fruit in the vineyard. We pull all the stops for this wine. And it shows in the glass. It is a complex, age-worthy wine, with deep colors and lively fruits, with persistent acidity and finish. We like to think of it as a wine for meditation.<br></p>','<p><strong>Altitude:</strong> 800 ft elavation, 250 meters above sea level</p><p><strong>Vineyard Size:</strong> 5 acres</p><p><strong>Year Planted:</strong> Partly in 2000 and partly in 2006</p><p><strong>Training System: </strong>Spur-pruned cordon for the Sangiovese and Guyot for the Teroldego</p><p><strong>Harvest:</strong> Typically end of September to the first ten days of October depending on the seasons for the Sangiovese. The Teroldego grapes tend to ripen earlier and are harvested earlier (around the 20th of September).</p><p>The Gigió Sangiovese grapes benefit from the most hang time allowing for greater phenological maturity. They are handpicked and brought immediately to the cellar for further selection.</p><p><strong>Ageing: </strong>The wine will age in French oak barriques (225L each) for 12 months to 18 months depending on the year. Our barriques come from some of the best tonneleries in France and are typically fine grain medium toast. We use a mixture of new and used barriques to avoid excessive wood accent. Following the aging in barriques, the wine is further aged in bottle for another year.</p><p><strong>Bottles Produced: </strong>3000 bottles.</p><p><strong>Alcohol:</strong> 13% to 14%</p><p><strong>Potential Cellaring:</strong> 15+ years.</p>','2015-01-12 22:24:03','2015-01-19 23:58:39','a2e09fe5-2ae1-4793-8c11-d6d5f4bcb850'),
	(13,9,'it','Gigio',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br></p>','2015-01-12 22:24:03','2015-01-12 22:27:51','4baed401-6a61-4d4f-b80b-56c444ea1547'),
	(14,11,'en_us','gigio-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 22:25:42','2015-01-20 01:14:55','cebfd3c7-ba8d-45e8-8382-0184bc7bd179'),
	(15,11,'it','gigio-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 22:25:42','2015-01-12 22:25:42','5483f3ad-1620-4a53-89c6-66fbf5739e20'),
	(16,12,'en_us','gigio-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 22:27:01','2015-01-20 01:14:55','696d8fa7-01d5-4fe4-a0d4-9c345ddb233d'),
	(17,12,'it','gigio-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 22:27:01','2015-01-12 22:27:01','3a436194-4b54-4535-84af-640d53bc82f9'),
	(18,13,'en_us','Gigetto',NULL,NULL,NULL,NULL,NULL,NULL,'<p>We think of it as the little brother of Gigiò. It is a wine of surprising immediacy, while still offering plenty of experiences to the nose and palate. Gigetto was born out of our own wish to drink a pleasant, genuine wine, yet with exceptional fruit and easier drinkability. Gigetto is released a year earlier than Gigiò and typically ages in large size botte only a few months.<br></p>','','2015-01-12 23:28:52','2015-01-19 23:53:35','49cce00b-8f60-48b0-b2ba-5b49afd46568'),
	(19,13,'it','Gigio',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br></p>','2015-01-12 23:28:52','2015-01-12 23:28:52','0560ade4-8ed7-4cf0-a807-b4d5f7776677'),
	(20,15,'en_us','gigetto-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:30:09','2015-01-20 01:14:55','5e625795-1680-4fc4-a800-150279c7bcf7'),
	(21,15,'it','gigetto-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:30:09','2015-01-12 23:30:09','d8829d40-c262-44e8-b773-9e5fb47a00bd'),
	(22,16,'en_us','Gigino',NULL,NULL,NULL,NULL,NULL,NULL,'<p>This might be considered Gigetto\'s twin brother except for the fact that Gigino is \"Sangiovese in purezza\", meaning 100% sangiovese, with no blending of other grape varietals. This wine came about because we noticed that some segments of the vineyard were especially well suited for Sangiovese, yielding a very classic stile Sangiovese. The Sangiovese fruit from these segments of the vineyard produce a wine with perfect balance, freshness and elegance.<br></p>','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br></p>','2015-01-12 23:36:06','2015-01-19 23:57:35','088be79a-4e75-4e5a-8a7f-03b6a0118b99'),
	(23,16,'it','Gigetto',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br></p>','2015-01-12 23:36:06','2015-01-12 23:36:06','c5cc1749-729a-42ac-9ce7-2467bde5578f'),
	(24,18,'en_us','gigeno-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:36:16','2015-01-20 01:14:55','810ca4fd-d476-47b2-8eb2-45f1507c7f06'),
	(25,18,'it','gigeno-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:36:16','2015-01-12 23:36:16','7b00bb02-a2dc-41b3-bc84-97933657cdde'),
	(26,19,'en_us','Pinko Pallino',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Is a Rosé bottling produced from a blend of both early harvested Sangiovese fruit and the bleeding off part of the juice from the later harvested Gigiò fruit. (Bleeding off some of the Gigiò juice allows us to achieve higher concentration for the Gigiò final wine). The quality of the fruit for this Rosé wine is therefore of the highest quality we produce. It is a gorgeous, radiant pink, grapefruit color, dry, with long acidity and structure, yet very easy to drink on a hot summer day. Pinko Pallino is released just six months after harvest and it is only aged in steel vats.<br></p>','','2015-01-12 23:36:56','2015-01-19 23:54:50','f7f2cfd0-67a1-4931-aa20-2a39da1fecc3'),
	(27,19,'it','Gigino',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br></p>','2015-01-12 23:36:56','2015-01-12 23:36:56','d9f5201a-ff3a-4599-8f29-aeb7249a7be9'),
	(28,21,'en_us','pinko-pallino-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:37:08','2015-01-20 01:14:55','4eb9d212-58f5-463d-be27-392a1876badc'),
	(29,21,'it','pinko-pallino-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:37:08','2015-01-12 23:37:08','13a54457-67fb-42db-a24b-4fe8cb5ffbf8'),
	(30,22,'en_us','Paonazzo',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Coming soon!<br></p>','<p>Coming soon!</p>','2015-01-12 23:37:53','2015-01-19 23:59:58','b7fbea8e-264e-42b2-b198-2e7eba7fba54'),
	(31,22,'it','Pinko Pallino',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br></p>','2015-01-12 23:37:53','2015-01-12 23:37:53','5f030eba-1ed1-4396-b9b3-41cd844c596e'),
	(32,24,'en_us','paonazzo-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:38:05','2015-01-20 01:14:55','e3f34827-a339-4f0b-8f5d-bb241b2a1270'),
	(33,24,'it','paonazzo-art',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-12 23:38:05','2015-01-12 23:38:05','40ddc84f-c208-427c-9d35-9f9a4fcf50a7'),
	(36,26,'en_us','Slide1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-13 03:11:46','2015-01-20 01:14:53','ba735383-295b-4b40-b5a3-1ab2d0fa3209'),
	(37,26,'it','Slide1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-13 03:11:46','2015-01-13 03:11:46','da773209-9937-4813-b2b2-a9a580ae343b'),
	(38,27,'en_us','Slide2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-13 03:12:00','2015-01-20 01:14:53','084ecc39-1bd9-4c47-92ac-426647f66e0e'),
	(39,27,'it','Slide2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-13 03:12:00','2015-01-13 03:12:00','8634334e-58b8-47b1-af48-bf19b3d95fd3'),
	(40,28,'en_us','Slide3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-13 03:12:14','2015-01-20 01:14:53','f98889b1-3b39-443e-be9a-d6520a279b9a'),
	(41,28,'it','Slide3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-13 03:12:14','2015-01-13 03:12:14','fad6de3e-2a89-4744-b827-e51de1e670cd'),
	(42,29,'en_us','Home',NULL,NULL,NULL,NULL,'','',NULL,NULL,'2015-01-13 03:12:19','2015-01-20 21:50:38','06b69fff-c5ec-4eda-8bb3-5310baf7762b'),
	(43,29,'it','Home',NULL,NULL,NULL,NULL,'','',NULL,NULL,'2015-01-13 03:12:19','2015-01-20 21:50:38','8de0c5a9-fde5-432b-aa9c-56a997a7a615'),
	(62,42,'en_us','About',NULL,NULL,NULL,NULL,'Learn more about us','<h2>The Poggio La Noce Estate</h2><p>\r\n	The estate was founded by husband and wife team, Enzo Schiano and Claire Beliard, in 2000. Nestled in the hills of Fiesole, Tuscany, facing south/south-west, the property sits in some of the most beautiful countryside just outside Florence, amidst hills sprinkled with medieval bell towers and castle ruins.\r\n</p><p>\r\n	The property consists of one vineyard (5 acres) cultivated with mostly Sangiovese grapes and a small percentage of Teroldego, in a mix of older vines (15 years+) and younger ones (8 years+). The vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel.\r\n</p><p>\r\n	From the beginning, we set out to farm organically and have been certified organic since 2006.\r\n</p><h2>Our Team</h2><p>\r\n	Husband and wife, Enzo Schiano and Claire Beliard are the owners of the Poggio la Noce estate. Enzo is Italian and Claire is French. They share the vision and love for making great wines.\r\n</p><p>\r\n	Roberto Corti is Poggio la Noce\'s employee. Roberto studied agronomy at the university of Florence and cares for all aspects of the vineyard work as well as that of the cellar, and manages the wine making along with Claire and Enzo. And of course all this under the careful guardianship of our beloved Maremmano Shepard dog, Marcellino.\r\n</p><p>\r\n	Our consulting team is made up of Valentino Ciarla, our technical oenologist, as well as Stefano Dini and GianLuca Grassi, who are our agronomists.\r\n</p>',NULL,NULL,'2015-01-14 17:42:46','2015-01-20 22:18:04','4161c31e-ec63-4071-8d72-0488fff696e6'),
	(63,42,'it','About',NULL,NULL,NULL,NULL,'Learn more about us','<h2>The Poggio La Noce Estate</h2><p>\r\n	The estate was founded by husband and wife team, Enzo Schiano and Claire Beliard, in 2000. Nestled in the hills of Fiesole, Tuscany, facing south/south-west, the property sits in some of the most beautiful countryside just outside Florence, amidst hills sprinkled with medieval bell towers and castle ruins.\r\n</p><p>\r\n	The property consists of one vineyard (5 acres) cultivated with mostly Sangiovese grapes and a small percentage of Teroldego, in a mix of older vines (15 years+) and younger ones (8 years+). The vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel.\r\n</p><p>\r\n	From the beginning, we set out to farm organically and have been certified organic since 2006.\r\n</p><h2>Our Team</h2><p>\r\n	Husband and wife, Enzo Schiano and Claire Beliard are the owners of the Poggio la Noce estate. Enzo is Italian and Claire is French. They share the vision and love for making great wines.\r\n</p><p>\r\n	Roberto Corti is Poggio la Noce\'s employee. Roberto studied agronomy at the university of Florence and cares for all aspects of the vineyard work as well as that of the cellar, and manages the wine making along with Claire and Enzo. And of course all this under the careful guardianship of our beloved Maremmano Shepard dog, Marcellino.\r\n</p><p>\r\n	Our consulting team is made up of Valentino Ciarla, our technical oenologist, as well as Stefano Dini and GianLuca Grassi, who are our agronomists.\r\n</p>',NULL,NULL,'2015-01-14 17:42:46','2015-01-20 22:18:04','4408ea75-31ea-41cc-9569-baba0d6132fa'),
	(64,44,'en_us','Vineyard',NULL,NULL,NULL,NULL,'Our Vines','<p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone.<br></p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. </p>',NULL,NULL,'2015-01-14 17:43:38','2015-01-20 22:25:13','42e26419-4b44-4282-bf63-c8e101fe6ba3'),
	(65,44,'it','Vineyard',NULL,NULL,NULL,NULL,'Our Vines','<p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone.<br></p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. </p>',NULL,NULL,'2015-01-14 17:43:38','2015-01-20 22:25:13','afde81e2-58c3-476e-905d-8978f553b2e4'),
	(66,46,'en_us','Olive Oil',NULL,NULL,NULL,NULL,'Our Olive Oil','<p>We produce an Organic Extra Virgin Olive Oil of the highest quality and extraordinary purity. Our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity, absolutely vital for a smooth, fragrant product.<br></p><p>We fertilize and care for our 1,500 olive trees exclusively with organic-certified products and prune by hand. With only 1,500 olive trees, our farm uses traditional picking methodology, hand picking each olive in its prime state of ripeness. Hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch. </p><p>Our olives are pressed directly at the estate the same day, using our own small modern cold press. Pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity, which is responsible for the smoothness and intensity of Poggio La Noce olive oil.</p><p>Three types of cultivars are cultivated at the estate: Frantoio, Leccino and Morailo to allow for a smooth delicate yet intense final blend.</p><p>Enjoy this all-natural extra virgin olive oil on salads, bruschette or simply with fresh bread and you will savor a most intense fragrance, resembling artichokes, fresh grass and almonds.</p>',NULL,NULL,'2015-01-14 17:44:33','2015-01-20 19:27:40','137d74db-ec22-42c1-8005-7eee6e2abe27'),
	(67,46,'it','Olive Oil',NULL,NULL,NULL,NULL,'Olives everywhere','<p>We produce an Organic Extra Virgin Olive Oil of the highest quality and extraordinary purity. Our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity, absolutely vital for a smooth, fragrant product.<br></p><p>We fertilize and care for our 1,500 olive trees exclusively with organic-certified products and prune by hand. With only 1,500 olive trees, our farm uses traditional picking methodology, hand picking each olive in its prime state of ripeness. Hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch. </p><p>Our olives are pressed directly at the estate the same day, using our own small modern cold press. Pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity, which is responsible for the smoothness and intensity of Poggio La Noce olive oil.</p><p>Three types of cultivars are cultivated at the estate: Frantoio, Leccino and Morailo to allow for a smooth delicate yet intense final blend.</p><p>Enjoy this all-natural extra virgin olive oil on salads, bruschette or simply with fresh bread and you will savor a most intense fragrance, resembling artichokes, fresh grass and almonds.</p>',NULL,NULL,'2015-01-14 17:44:33','2015-01-20 19:27:40','4980afa2-6e30-4058-af76-2c8e1291d5c7'),
	(68,48,'en_us','Contact',NULL,NULL,NULL,NULL,'Contact us','<p>Get in touch with us by writing in the box below. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>',NULL,NULL,'2015-01-14 17:46:00','2015-01-14 17:51:00','b62071ae-3ec7-4206-90fd-1e116bcde848'),
	(69,48,'it','Contact',NULL,NULL,NULL,NULL,'Contact us','<p>Get in touch with us by writing in the box below. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>',NULL,NULL,'2015-01-14 17:46:00','2015-01-14 17:51:00','0e75e803-064a-43f2-a7c9-0e55eb704237'),
	(70,50,'en_us','olive oil banner photo 02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 21:00:56','2015-01-20 01:14:54','9761fda3-2007-42d8-af89-52b8d860dd70'),
	(71,50,'it','olive oil banner photo 02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 21:00:56','2015-01-19 21:00:56','d9e99f3d-fcbf-4128-848f-cabaed2055fa'),
	(72,52,'en_us','about',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 21:05:09','2015-01-20 01:14:53','78847687-067b-4470-8dc2-d9772e53eabc'),
	(73,52,'it','about',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 21:05:09','2015-01-19 21:05:09','b1e048fc-3628-499b-85f9-fef141417274'),
	(74,53,'en_us','vineyard banner photo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 22:05:26','2015-01-20 01:14:54','f66db6d0-99f9-4d4a-a0d3-4bf26bad3d5f'),
	(75,53,'it','vineyard banner photo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 22:05:26','2015-01-19 22:05:26','11b59730-0a0e-4511-ae83-7a654571dee6'),
	(76,54,'en_us','wine-banner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:25:54','2015-01-20 01:14:54','a6d789ad-2060-48ae-b7db-210165f184a7'),
	(77,54,'it','wine-banner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:25:54','2015-01-19 23:25:54','a777fa6a-7854-4bcd-a1b5-c3bc526d8bf9'),
	(78,55,'en_us','paonazzo-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:25:54','2015-01-20 01:14:54','cbdce177-bb9b-457a-8fd0-bc48fe845e80'),
	(79,55,'it','paonazzo-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:25:54','2015-01-19 23:25:54','bb5bf602-91ff-43ef-8b6a-e306f6a31098'),
	(80,56,'en_us','gigino-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:35:47','2015-01-20 01:14:55','caada8e7-33b0-40de-9044-23c5a1ebbd32'),
	(81,56,'it','gigino-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:35:47','2015-01-19 23:35:47','d9934d34-00ce-41cc-85a6-50f13af884a0'),
	(82,57,'en_us','gigetto-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:49:20','2015-01-20 01:14:55','4ea79c3a-f09c-4b3d-bac7-1573c424942c'),
	(83,57,'it','gigetto-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:49:20','2015-01-19 23:49:20','53e1eebf-8f02-4b26-ba88-45d99d45132b'),
	(84,58,'en_us','gigio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:49:20','2015-01-20 01:14:55','518fc50c-ec3b-460b-9d29-1415dedfbdb5'),
	(85,58,'it','gigio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:49:20','2015-01-19 23:49:20','5c78bf2a-d158-4867-a7c7-7337ade8830d'),
	(86,59,'en_us','pinko-pallino-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:49:21','2015-01-20 01:14:55','124b21b0-05c3-4b9a-a0ec-1ddf34b44923'),
	(87,59,'it','pinko-pallino-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:49:21','2015-01-19 23:49:21','398d0a2f-5db8-4538-beb5-1dba820f2dab'),
	(88,60,'en_us','paonazzo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:51:17','2015-01-20 01:14:55','e9f2a08e-8166-4dd5-b55f-e3b5c001b1cd'),
	(89,60,'it','paonazzo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-19 23:51:17','2015-01-19 23:51:17','ebfba17f-11a0-4aa5-bf61-7b68f9301c2d'),
	(90,61,'en_us','about sidebar image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:13:46','2015-01-20 01:14:53','9245ccd8-7f54-4387-85fd-f2741a1f80e6'),
	(91,61,'it','about sidebar image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:13:46','2015-01-20 00:13:46','df237d17-c50b-457e-b8f8-3efce047ce47'),
	(92,62,'en_us','olive-oil-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:13:46','2015-01-20 01:14:53','64aacc31-d29f-47e3-992c-a364b15db499'),
	(93,62,'it','olive-oil-bottle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:13:46','2015-01-20 00:13:46','de65dec2-56b0-4ea7-8d68-576c61e9a8fd'),
	(94,63,'en_us','about sidebar image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:24:24','2015-01-20 01:14:53','52402e9a-d3a8-442d-a766-5dfc16128046'),
	(95,63,'it','about sidebar image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:24:24','2015-01-20 00:24:24','46c2cccb-3b8f-4fd5-a685-7444d6ae8276'),
	(96,64,'en_us','vinyard sidebar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:46:15','2015-01-20 01:14:53','7f2851cc-ebdb-4cf5-a3f3-b76cd3054ed6'),
	(97,64,'it','vinyard sidebar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 00:46:15','2015-01-20 00:46:15','c23204de-5739-4f5e-8a1a-2dd5f050637f'),
	(98,65,'en_us','slide1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','fa9368d0-760e-44b2-91b0-0dd017155e95'),
	(99,65,'it','slide1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','c4e5f827-b30d-47df-bbfd-fd7aa181461d'),
	(100,66,'en_us','slide2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','52a32ca6-5015-4d00-9d71-cd9ea76b0633'),
	(101,66,'it','slide2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','1ba4af41-8975-4f04-beed-e2fb5cab0502'),
	(102,67,'en_us','slide3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','5e58c3c4-b66d-454c-9571-6a561c27750a'),
	(103,67,'it','slide3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','844a2d72-42f4-41d9-86f1-27452b37dc96'),
	(104,68,'en_us','slide4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','5022434d-7210-40a4-b144-4aeb56e706e4'),
	(105,68,'it','slide4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','8c03b899-3a72-41d3-9d40-db00e1522463'),
	(106,69,'en_us','slide5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','a096bf80-b3f7-4662-84dc-31bfd2ce26c4'),
	(107,69,'it','slide5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-20 01:14:54','2015-01-20 01:14:54','781a85e3-c84a-45a1-9f58-268a74203cfd');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_deprecationerrors`;

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User',1,0,'2015-01-09 19:54:27','2015-01-09 19:56:04','6f82837c-8de8-40a8-bf0b-1c3f833cf5a2'),
	(2,'Entry',1,0,'2015-01-09 19:54:28','2015-01-09 21:40:33','cd44db33-6705-46a4-9755-440498a571e5'),
	(3,'Entry',1,0,'2015-01-09 19:54:29','2015-01-09 21:40:33','1f14b33d-f3e6-49c5-896d-979f528da68e'),
	(4,'GlobalSet',1,0,'2015-01-09 21:30:34','2015-01-09 22:25:17','929805e8-e8e0-43dd-b183-ef0cfcc006e8'),
	(5,'Asset',1,0,'2015-01-12 18:58:52','2015-01-20 01:14:53','8d586e6f-5b53-4767-a1d9-b95df13db4f8'),
	(6,'Entry',1,0,'2015-01-12 18:58:59','2015-01-20 00:43:20','4fc6e96f-f22e-4002-bf10-81c86e5e8f2c'),
	(7,'Asset',1,0,'2015-01-12 19:02:01','2015-01-20 01:14:54','4e18353c-cdd6-438c-8c22-4cd3166bf3a1'),
	(8,'MatrixBlock',1,0,'2015-01-12 19:02:11','2015-01-20 00:43:20','ca6575db-b9f3-4c39-9122-cf5e6c4c04eb'),
	(9,'Entry',1,0,'2015-01-12 22:24:03','2015-01-19 23:58:39','2d9c7190-989a-4de2-b05e-ff11e08679a2'),
	(10,'MatrixBlock',1,0,'2015-01-12 22:24:03','2015-01-19 23:58:39','297f4ccf-23be-4dd8-bebb-dd1113bde205'),
	(11,'Asset',1,0,'2015-01-12 22:25:42','2015-01-20 01:14:55','b097f935-8118-446f-8aa1-94b203bd5414'),
	(12,'Asset',1,0,'2015-01-12 22:27:01','2015-01-20 01:14:55','caa204ec-5510-407b-9a6b-ceebf76b07ad'),
	(13,'Entry',1,0,'2015-01-12 23:28:52','2015-01-19 23:53:35','3692aab9-54f6-4bf3-90b3-d32e4bbb9e44'),
	(14,'MatrixBlock',1,0,'2015-01-12 23:28:52','2015-01-19 23:53:35','9a070ea3-6e51-4695-817f-62253915eee9'),
	(15,'Asset',1,0,'2015-01-12 23:30:09','2015-01-20 01:14:55','33298d8d-9911-48d3-a6e9-e2ded0f1b556'),
	(16,'Entry',1,0,'2015-01-12 23:36:06','2015-01-19 23:57:35','6d13e484-aa18-4b2c-bc77-d8dc9e6526d9'),
	(17,'MatrixBlock',1,0,'2015-01-12 23:36:06','2015-01-19 23:57:35','ce746251-5990-4f92-b450-eee57c8a4f45'),
	(18,'Asset',1,0,'2015-01-12 23:36:16','2015-01-20 01:14:55','91027339-03ad-43e8-8d32-3e44f45e1a0d'),
	(19,'Entry',1,0,'2015-01-12 23:36:56','2015-01-19 23:54:50','6df70f75-cfe2-4454-bb56-f22bc3a74397'),
	(20,'MatrixBlock',1,0,'2015-01-12 23:36:56','2015-01-19 23:54:50','b22e3d16-5ade-4753-a3a4-906b26131115'),
	(21,'Asset',1,0,'2015-01-12 23:37:08','2015-01-20 01:14:55','3fd08004-0351-4ed4-9d73-6dd0b9c680c4'),
	(22,'Entry',1,0,'2015-01-12 23:37:53','2015-01-19 23:59:58','e2667006-e5ae-46f2-8089-5020143da49f'),
	(23,'MatrixBlock',1,0,'2015-01-12 23:37:53','2015-01-19 23:59:58','76392c00-c69e-4ba7-9533-df2916ddd95d'),
	(24,'Asset',1,0,'2015-01-12 23:38:05','2015-01-20 01:14:55','a08dbaf3-b45b-4a96-a5c7-08111413907f'),
	(26,'Asset',1,0,'2015-01-13 03:11:46','2015-01-20 01:14:53','e24dd360-caff-46fa-8494-b559805c1032'),
	(27,'Asset',1,0,'2015-01-13 03:12:00','2015-01-20 01:14:53','3c6fac7b-d687-4f88-ad8a-3414353ad3c6'),
	(28,'Asset',1,0,'2015-01-13 03:12:14','2015-01-20 01:14:53','213b78a3-29e9-4773-a110-2b9a1f81f1ba'),
	(29,'Entry',1,0,'2015-01-13 03:12:19','2015-01-20 21:50:38','0c211739-c755-4176-b924-2f8fb3f13003'),
	(30,'MatrixBlock',1,0,'2015-01-13 03:12:19','2015-01-20 21:50:39','ff88d410-79fe-4694-a910-2a67374402d8'),
	(31,'MatrixBlock',1,0,'2015-01-13 03:12:19','2015-01-20 21:50:39','2be25dd9-4336-42f9-b0a0-46fbbf3f7851'),
	(32,'MatrixBlock',1,0,'2015-01-13 03:12:19','2015-01-20 21:50:39','a126bfea-9a75-444d-a6b0-1b8db4ce68ee'),
	(42,'Entry',1,0,'2015-01-14 17:42:46','2015-01-20 22:18:04','108c1dcb-5c6e-446e-aa62-0be17c55c941'),
	(43,'MatrixBlock',1,0,'2015-01-14 17:42:46','2015-01-20 22:18:04','2cf6f7cc-c97b-424a-b787-3df9a770f2f3'),
	(44,'Entry',1,0,'2015-01-14 17:43:38','2015-01-20 22:25:13','c43ecc87-8e45-4952-8c19-9f0d67e7300d'),
	(45,'MatrixBlock',1,0,'2015-01-14 17:43:38','2015-01-20 22:25:13','d4e838bd-2c68-4d21-9b73-b3dd3260d748'),
	(46,'Entry',1,0,'2015-01-14 17:44:33','2015-01-20 19:27:40','7a51d542-480a-4434-9afa-de1066bada3e'),
	(47,'MatrixBlock',1,0,'2015-01-14 17:44:33','2015-01-20 19:27:40','b8d65306-5709-4e84-a4d1-52cf59600918'),
	(48,'Entry',1,0,'2015-01-14 17:46:00','2015-01-14 17:51:00','a2aa18c3-9113-4368-9188-c0b2b849aa82'),
	(49,'MatrixBlock',1,0,'2015-01-14 17:46:00','2015-01-14 17:51:00','fe905242-03d8-435e-9551-f01356449dce'),
	(50,'Asset',1,0,'2015-01-19 21:00:56','2015-01-20 01:14:54','cf2222a2-8bb8-4958-962d-797c01db75c9'),
	(52,'Asset',1,0,'2015-01-19 21:05:09','2015-01-20 01:14:53','b8d91324-757d-44e3-8a26-31018c2cdd9f'),
	(53,'Asset',1,0,'2015-01-19 22:05:26','2015-01-20 01:14:54','aa988060-acf9-4e9b-b750-4eb59d5ff134'),
	(54,'Asset',1,0,'2015-01-19 23:25:54','2015-01-20 01:14:54','fc8be046-7cce-406e-8586-1a1a2b90f300'),
	(55,'Asset',1,0,'2015-01-19 23:25:54','2015-01-20 01:14:54','42635e9c-9db2-4777-9618-6c856c02af4a'),
	(56,'Asset',1,0,'2015-01-19 23:35:47','2015-01-20 01:14:55','b9717a42-63e8-4593-8ce5-3bb4ba65cb33'),
	(57,'Asset',1,0,'2015-01-19 23:49:20','2015-01-20 01:14:55','2204aa8f-8093-4e88-9438-9075715e16aa'),
	(58,'Asset',1,0,'2015-01-19 23:49:20','2015-01-20 01:14:55','5bc0452e-e543-40e0-9acf-a500a8fe9992'),
	(59,'Asset',1,0,'2015-01-19 23:49:21','2015-01-20 01:14:55','0a76bb32-fb6c-44a0-ab60-caadeeaa60fb'),
	(60,'Asset',1,0,'2015-01-19 23:51:17','2015-01-20 01:14:55','4056216b-051e-4625-998d-a94d4115bcf4'),
	(61,'Asset',1,0,'2015-01-20 00:13:46','2015-01-20 01:14:53','1adf41f8-8ff7-4c72-af20-a0aa240ac226'),
	(62,'Asset',1,0,'2015-01-20 00:13:46','2015-01-20 01:14:53','e38bcf79-f368-419c-9307-5484dc2d9a50'),
	(63,'Asset',1,0,'2015-01-20 00:24:24','2015-01-20 01:14:53','17957b16-f4e1-4887-8ff4-fe1203f5929f'),
	(64,'Asset',1,0,'2015-01-20 00:46:15','2015-01-20 01:14:53','b8cc4ab1-933e-4d94-86a9-b4ea8afd1005'),
	(65,'Asset',1,0,'2015-01-20 01:14:54','2015-01-20 01:14:54','1978fa85-4d55-4c88-8091-d6270f269914'),
	(66,'Asset',1,0,'2015-01-20 01:14:54','2015-01-20 01:14:54','a37639a7-9c4e-4d5c-ac71-fe185c56422f'),
	(67,'Asset',1,0,'2015-01-20 01:14:54','2015-01-20 01:14:54','076fb8d8-8364-450b-a98b-a60109b77144'),
	(68,'Asset',1,0,'2015-01-20 01:14:54','2015-01-20 01:14:54','14bbdf03-b304-4068-b1d5-db78bbc8931c'),
	(69,'Asset',1,0,'2015-01-20 01:14:54','2015-01-20 01:14:54','46d984f3-948b-42cd-8812-1c504e8d79f8'),
	(70,'MatrixBlock',1,0,'2015-01-20 01:15:59','2015-01-20 21:50:39','b8b60e4e-7ffe-4758-979a-ec7dee27d8aa'),
	(71,'MatrixBlock',1,0,'2015-01-20 01:15:59','2015-01-20 21:50:39','3ddc7a7d-819a-4d43-bea6-2f16077472d9');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_i18n`;

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en_us','',NULL,1,'2015-01-09 19:54:27','2015-01-09 19:56:04','b3a3006e-64c5-4172-86b4-0c867b964ec2'),
	(2,2,'en_us','homepage','__home__',1,'2015-01-09 19:54:28','2015-01-09 21:40:33','b511c5d8-d794-4c46-9f8a-087539bd01ad'),
	(3,3,'en_us','we-just-installed-craft','news/2015/we-just-installed-craft',1,'2015-01-09 19:54:29','2015-01-09 21:40:33','cbef56fa-4f27-45f4-a53c-56578b0a1156'),
	(4,4,'en_us','',NULL,1,'2015-01-09 21:30:34','2015-01-09 22:25:17','e2d246c9-3315-47c1-a370-75a5ea44c02c'),
	(5,4,'it','',NULL,1,'2015-01-09 21:40:33','2015-01-09 22:25:17','a610dea0-1515-456d-9221-6776f43d917c'),
	(6,5,'en_us','philosophy-image',NULL,1,'2015-01-12 18:58:53','2015-01-20 01:14:53','230c872e-b989-4df3-a9ba-e01b93f5a4b2'),
	(7,5,'it','philosophy-image',NULL,1,'2015-01-12 18:58:53','2015-01-20 01:14:53','28519c43-8c5d-40c8-a671-6f8ba8e2f644'),
	(8,6,'en_us','philosophy',NULL,1,'2015-01-12 18:58:59','2015-01-20 00:43:20','518a4bae-80d7-45e1-99ed-3db750fcda9f'),
	(9,6,'it','philosophy',NULL,1,'2015-01-12 18:58:59','2015-01-20 00:43:20','cf1a0e80-28b5-4180-b45f-198fefa8bf1e'),
	(10,7,'en_us','philosophy-banner',NULL,1,'2015-01-12 19:02:01','2015-01-20 01:14:54','05e0f990-8d48-43d4-bffc-5d565e93b31c'),
	(11,7,'it','philosophy-banner',NULL,1,'2015-01-12 19:02:01','2015-01-20 01:14:54','090efb67-2d9c-483b-9a5e-8067810ac09b'),
	(12,8,'en_us','',NULL,1,'2015-01-12 19:02:11','2015-01-20 00:43:20','89cff21d-4890-4470-9aee-9255ce005538'),
	(13,8,'it','',NULL,1,'2015-01-12 19:02:11','2015-01-20 00:43:20','2306a37a-f7d0-415f-bc58-0c174d76f058'),
	(14,9,'en_us','gigio',NULL,1,'2015-01-12 22:24:03','2015-01-19 23:58:39','11f4e956-d9df-47a2-bf7d-2b90807e306c'),
	(15,9,'it','gigio',NULL,0,'2015-01-12 22:24:03','2015-01-19 23:58:39','9c4f719a-85c8-4b07-9e98-a7fc19718340'),
	(16,10,'en_us','',NULL,1,'2015-01-12 22:24:03','2015-01-19 23:58:39','1fa03a6c-4c36-4146-a873-0b18b11d5e95'),
	(17,10,'it','',NULL,1,'2015-01-12 22:24:03','2015-01-19 23:58:39','c44ddf87-a5d5-40f6-9591-435ba5ea6350'),
	(18,11,'en_us','gigio-bottle',NULL,1,'2015-01-12 22:25:42','2015-01-20 01:14:55','60757aff-91db-459b-ab3d-71b0a05c3622'),
	(19,11,'it','gigio-bottle',NULL,1,'2015-01-12 22:25:42','2015-01-20 01:14:55','29aa3077-7581-4439-8a9b-f02b5c516987'),
	(20,12,'en_us','gigio-art',NULL,1,'2015-01-12 22:27:01','2015-01-20 01:14:55','33c60df7-dbd1-4aa8-9174-f2d8a9ad8c8e'),
	(21,12,'it','gigio-art',NULL,1,'2015-01-12 22:27:01','2015-01-20 01:14:55','a1db1d66-c600-4fac-9656-e47fdbb74a0b'),
	(22,13,'en_us','gigetto',NULL,1,'2015-01-12 23:28:52','2015-01-19 23:53:35','a3de3b54-7d38-452a-86db-e3c03de409a4'),
	(23,13,'it','gigio',NULL,1,'2015-01-12 23:28:52','2015-01-19 23:53:35','737a7009-3229-4104-a496-2ac1f19a14c6'),
	(24,14,'en_us','',NULL,1,'2015-01-12 23:28:52','2015-01-19 23:53:35','71fbb5ac-dfe3-4d98-91a1-e76366a13f3b'),
	(25,14,'it','',NULL,1,'2015-01-12 23:28:52','2015-01-19 23:53:35','ef178285-e543-4d03-9d55-e439f15f87c8'),
	(26,15,'en_us','gigetto-art',NULL,1,'2015-01-12 23:30:09','2015-01-20 01:14:55','9d4cba3b-9230-48fc-9f5f-85cdba5d40d9'),
	(27,15,'it','gigetto-art',NULL,1,'2015-01-12 23:30:09','2015-01-20 01:14:55','8ad7891b-a126-4f46-ad12-99f979050435'),
	(28,16,'en_us','gigino',NULL,1,'2015-01-12 23:36:06','2015-01-19 23:57:35','6bdccf07-05f0-4a62-b852-2b3af1d5bcc6'),
	(29,16,'it','gigio',NULL,1,'2015-01-12 23:36:06','2015-01-19 23:57:35','dd866341-2c9e-4008-ba73-ff342e39605e'),
	(30,17,'en_us','',NULL,1,'2015-01-12 23:36:06','2015-01-19 23:57:35','5eafbace-d91c-4ef9-8984-bf49bcc6b77e'),
	(31,17,'it','',NULL,1,'2015-01-12 23:36:06','2015-01-19 23:57:35','615292ff-b3ae-4228-9a29-754e9060ad63'),
	(32,18,'en_us','gigeno-art',NULL,1,'2015-01-12 23:36:16','2015-01-20 01:14:55','ecbf629b-235d-4089-aded-32cd16f9d4a9'),
	(33,18,'it','gigeno-art',NULL,1,'2015-01-12 23:36:16','2015-01-20 01:14:55','cac664f8-300b-4251-9799-a03d805c81ad'),
	(34,19,'en_us','pallino',NULL,1,'2015-01-12 23:36:56','2015-01-19 23:54:50','5d703c66-c5fb-4cfa-89d1-7d29efb71b82'),
	(35,19,'it','gigio',NULL,1,'2015-01-12 23:36:56','2015-01-19 23:54:50','97226e0a-5da1-4a3a-b14b-81e4f095f72e'),
	(36,20,'en_us','',NULL,1,'2015-01-12 23:36:56','2015-01-19 23:54:50','1dad9895-7403-4051-a79e-be3d299eb20c'),
	(37,20,'it','',NULL,1,'2015-01-12 23:36:56','2015-01-19 23:54:50','a8dc91c1-d586-4f73-9529-300a1d9c78ce'),
	(38,21,'en_us','pinko-pallino-art',NULL,1,'2015-01-12 23:37:08','2015-01-20 01:14:55','9ae65076-1de8-4539-84bd-c41d1eae8d82'),
	(39,21,'it','pinko-pallino-art',NULL,1,'2015-01-12 23:37:08','2015-01-20 01:14:55','506b9d28-1377-45b0-bc9d-bc24026f7ecb'),
	(40,22,'en_us','paonazzo',NULL,1,'2015-01-12 23:37:53','2015-01-19 23:59:58','a245077b-1a70-4cfb-9cca-bad7bec9a7f4'),
	(41,22,'it','gigio',NULL,1,'2015-01-12 23:37:53','2015-01-19 23:59:58','0f947975-c1ac-4348-bd88-e4c6b81f02fd'),
	(42,23,'en_us','',NULL,1,'2015-01-12 23:37:53','2015-01-19 23:59:58','54a46974-d443-4f85-b6e9-4b72e972c2ea'),
	(43,23,'it','',NULL,1,'2015-01-12 23:37:53','2015-01-19 23:59:58','19c7abf1-855a-4e6a-925e-c00211850d91'),
	(44,24,'en_us','paonazzo-art',NULL,1,'2015-01-12 23:38:05','2015-01-20 01:14:55','4067d0fc-4101-47fb-9ae0-8e47e7eec249'),
	(45,24,'it','paonazzo-art',NULL,1,'2015-01-12 23:38:05','2015-01-20 01:14:55','6c0c3b09-cff0-4d2e-9991-6d45f626c619'),
	(48,26,'en_us','slide1',NULL,1,'2015-01-13 03:11:46','2015-01-20 01:14:53','53196420-f80b-4f13-b78c-fca71e1089c8'),
	(49,26,'it','slide1',NULL,1,'2015-01-13 03:11:46','2015-01-20 01:14:53','7bf699c4-be42-4458-89ff-f1ed2b3bfbf8'),
	(50,27,'en_us','slide2',NULL,1,'2015-01-13 03:12:00','2015-01-20 01:14:53','8c90b2fa-5ac3-4c11-8057-275eab0da9bf'),
	(51,27,'it','slide2',NULL,1,'2015-01-13 03:12:00','2015-01-20 01:14:53','d0acc76c-1ffa-4d5d-ba9a-a6bd2805cf74'),
	(52,28,'en_us','slide3',NULL,1,'2015-01-13 03:12:14','2015-01-20 01:14:53','b3db8bea-b89d-43d8-9e54-83b2f93bab51'),
	(53,28,'it','slide3',NULL,1,'2015-01-13 03:12:14','2015-01-20 01:14:53','4beec9b4-43ed-497c-a9d3-99b82946ca3c'),
	(54,29,'en_us','home',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','bbc5ac34-5fdd-4ce7-ba35-c1291dfdcee1'),
	(55,29,'it','home',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','c65a5de0-cfde-4379-8644-e6af559c235a'),
	(56,30,'en_us','',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','f54c7069-8da7-49cb-b2c2-2cca5ecf29d4'),
	(57,30,'it','',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','b47063a8-8010-41a1-add2-989bf9f1f5ec'),
	(58,31,'en_us','',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','cc4bbb75-57f1-4be5-a093-f0684d4cb476'),
	(59,31,'it','',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','45178de0-ea6e-4d61-9bb2-ab492d23aed3'),
	(60,32,'en_us','',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','b30aee58-66d0-4b37-9f98-e6115fa4fbce'),
	(61,32,'it','',NULL,1,'2015-01-13 03:12:19','2015-01-20 21:50:39','d55c83c8-37e4-457a-9c50-7b62634b377d'),
	(80,42,'en_us','about',NULL,1,'2015-01-14 17:42:46','2015-01-20 22:18:04','e7c97e3e-5b01-44af-88c0-ebd81badd999'),
	(81,42,'it','about',NULL,1,'2015-01-14 17:42:46','2015-01-20 22:18:04','638f2e16-ab21-4dde-973e-b1808ceff449'),
	(82,43,'en_us','',NULL,1,'2015-01-14 17:42:46','2015-01-20 22:18:04','948c4154-dc7d-4e53-9682-759be48a1ed1'),
	(83,43,'it','',NULL,1,'2015-01-14 17:42:46','2015-01-20 22:18:04','1229adae-4ae1-4ca2-9009-bb614342ced6'),
	(84,44,'en_us','vineyard',NULL,1,'2015-01-14 17:43:38','2015-01-20 22:25:13','65e16dbe-ecb9-4778-9e82-81be670784ae'),
	(85,44,'it','vineyard',NULL,1,'2015-01-14 17:43:38','2015-01-20 22:25:13','d8d0b079-6214-4ed8-ab3b-6139046f2ab7'),
	(86,45,'en_us','',NULL,1,'2015-01-14 17:43:38','2015-01-20 22:25:13','9e381b2f-d019-4139-a327-4506d9a53fe7'),
	(87,45,'it','',NULL,1,'2015-01-14 17:43:38','2015-01-20 22:25:13','d70081fd-a263-4135-a8cd-1e105628814e'),
	(88,46,'en_us','olive-oil',NULL,1,'2015-01-14 17:44:33','2015-01-20 19:27:40','e09ca1f9-9d8e-4de3-bb37-15356b93cec6'),
	(89,46,'it','olive-oil',NULL,1,'2015-01-14 17:44:33','2015-01-20 19:27:40','d7e79051-8f15-4cb9-a3c9-c3b85c3b8dc6'),
	(90,47,'en_us','',NULL,1,'2015-01-14 17:44:33','2015-01-20 19:27:40','31ac0894-27e2-42e6-b62a-934b5ac2b487'),
	(91,47,'it','',NULL,1,'2015-01-14 17:44:33','2015-01-20 19:27:40','4b862c40-e6a4-490a-a157-9ce44540d27f'),
	(92,48,'en_us','contact',NULL,1,'2015-01-14 17:46:00','2015-01-14 17:51:00','eaa4ab5d-d0be-4aad-97d1-ce06fdbff3e0'),
	(93,48,'it','contact',NULL,1,'2015-01-14 17:46:00','2015-01-14 17:51:00','c882cdd5-4718-4b73-9f63-c9b350389daa'),
	(94,49,'en_us','',NULL,1,'2015-01-14 17:46:00','2015-01-14 17:51:00','a21ace73-2e8e-46b3-bbc3-5fbb917bf515'),
	(95,49,'it','',NULL,1,'2015-01-14 17:46:00','2015-01-14 17:51:00','a56f58fa-ec6c-4de3-b2c1-68d87e4db9f7'),
	(96,50,'en_us','olive-oil-banner-photo-02',NULL,1,'2015-01-19 21:00:56','2015-01-20 01:14:54','a7e31968-62f0-4e17-80a0-24e17f9b147c'),
	(97,50,'it','olive-oil-banner-photo-02',NULL,1,'2015-01-19 21:00:56','2015-01-20 01:14:54','08ffb011-d5ee-4031-9efa-d6f5f2d1fb6a'),
	(100,52,'en_us','about',NULL,1,'2015-01-19 21:05:09','2015-01-20 01:14:53','ddc3e11c-68c3-488c-90fb-0b2be99da608'),
	(101,52,'it','about',NULL,1,'2015-01-19 21:05:09','2015-01-20 01:14:53','c435da4e-3f86-46c2-b8de-809fb9f7e27a'),
	(102,53,'en_us','vineyard-banner-photo',NULL,1,'2015-01-19 22:05:26','2015-01-20 01:14:54','83d5e546-df3a-41de-93b2-d352617bba1f'),
	(103,53,'it','vineyard-banner-photo',NULL,1,'2015-01-19 22:05:26','2015-01-20 01:14:54','dff269c4-15ea-42db-9f8d-9a037c878b6f'),
	(104,54,'en_us','wine-banner',NULL,1,'2015-01-19 23:25:54','2015-01-20 01:14:54','7f7f6168-e9a6-43a4-a49d-15a669a8f9a9'),
	(105,54,'it','wine-banner',NULL,1,'2015-01-19 23:25:54','2015-01-20 01:14:54','b98f4b1f-4706-44c0-8c48-19bd9b424a4a'),
	(106,55,'en_us','paonazzo-bottle',NULL,1,'2015-01-19 23:25:54','2015-01-20 01:14:54','8e656e11-23b6-47fb-813e-a477370b0016'),
	(107,55,'it','paonazzo-bottle',NULL,1,'2015-01-19 23:25:54','2015-01-20 01:14:54','e71d761b-cf8e-4955-aa6c-a5b4d40eefb9'),
	(108,56,'en_us','gigino-bottle',NULL,1,'2015-01-19 23:35:47','2015-01-20 01:14:55','e3588115-4880-4a80-9b5b-b87f84f99b10'),
	(109,56,'it','gigino-bottle',NULL,1,'2015-01-19 23:35:47','2015-01-20 01:14:55','65b5cb4a-b10c-4b7a-81c5-83f32d2feae9'),
	(110,57,'en_us','gigetto-bottle',NULL,1,'2015-01-19 23:49:20','2015-01-20 01:14:55','471ef56c-498e-41f4-a6d8-ea38fb3f80fe'),
	(111,57,'it','gigetto-bottle',NULL,1,'2015-01-19 23:49:20','2015-01-20 01:14:55','f62efd4c-1d9f-4612-8e48-fadf756308cc'),
	(112,58,'en_us','gigio',NULL,1,'2015-01-19 23:49:20','2015-01-20 01:14:55','a5963652-858e-4a4c-a2b1-155f20d630d2'),
	(113,58,'it','gigio',NULL,1,'2015-01-19 23:49:20','2015-01-20 01:14:55','b29ed502-c243-46f1-a159-d7f26ea22e6b'),
	(114,59,'en_us','pinko-pallino-bottle',NULL,1,'2015-01-19 23:49:21','2015-01-20 01:14:55','45cfa4d2-95e3-4b7d-87ab-d90b1cd7ae84'),
	(115,59,'it','pinko-pallino-bottle',NULL,1,'2015-01-19 23:49:21','2015-01-20 01:14:55','0f24f5ba-7966-4bef-bc6c-283e3a47bb1d'),
	(116,60,'en_us','paonazzo',NULL,1,'2015-01-19 23:51:17','2015-01-20 01:14:55','d26c8c8b-cb69-4e7b-8c17-a8468f22813d'),
	(117,60,'it','paonazzo',NULL,1,'2015-01-19 23:51:17','2015-01-20 01:14:55','2bfe2ac0-5ff6-4a30-bbe9-dd6f0c8676c1'),
	(118,61,'en_us','about-sidebar-image',NULL,1,'2015-01-20 00:13:46','2015-01-20 01:14:53','9ba26614-f82a-44d8-8f42-d0338933f416'),
	(119,61,'it','about-sidebar-image',NULL,1,'2015-01-20 00:13:46','2015-01-20 01:14:53','8c8a931e-b642-4095-a034-a065a09ee840'),
	(120,62,'en_us','olive-oil-bottle',NULL,1,'2015-01-20 00:13:46','2015-01-20 01:14:53','ce5ef17c-d341-4dc1-bc7d-8bdea580361b'),
	(121,62,'it','olive-oil-bottle',NULL,1,'2015-01-20 00:13:46','2015-01-20 01:14:53','c60e377b-747d-41fc-9544-f7649cfcb079'),
	(122,63,'en_us','about-sidebar-image',NULL,1,'2015-01-20 00:24:24','2015-01-20 01:14:53','0470d245-249d-4d8e-8c37-f24e0b94ea55'),
	(123,63,'it','about-sidebar-image',NULL,1,'2015-01-20 00:24:24','2015-01-20 01:14:53','73a46c4e-acb7-498e-b21f-b18880359ab3'),
	(124,64,'en_us','vinyard-sidebar',NULL,1,'2015-01-20 00:46:15','2015-01-20 01:14:53','4df3cb59-e7f9-4990-bbe0-53bcc766653b'),
	(125,64,'it','vinyard-sidebar',NULL,1,'2015-01-20 00:46:15','2015-01-20 01:14:53','3accad6c-c514-4379-8466-187ef1201730'),
	(126,65,'en_us','slide1',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','fcfb5e22-5e22-4717-93ec-4c1b5cffc027'),
	(127,65,'it','slide1',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','fdb4c816-8eb8-4eca-bcb0-19dc7a808c55'),
	(128,66,'en_us','slide2',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','96a9c4a1-236a-4ca6-b16f-343d6573b5b1'),
	(129,66,'it','slide2',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','36dcff32-be87-4cd1-a6cc-46ffed9f4f62'),
	(130,67,'en_us','slide3',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','0c6b2eb6-eb8e-439a-868c-632094f832fd'),
	(131,67,'it','slide3',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','2c70577a-cd95-41f4-9997-7b30c175681b'),
	(132,68,'en_us','slide4',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','5fb83740-54e3-4b51-b14c-0fda37abf5c2'),
	(133,68,'it','slide4',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','92744725-580c-4e75-9f2c-75fb09e4a859'),
	(134,69,'en_us','slide5',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','1e6bcdd9-74aa-4990-a99f-3ba717039e5d'),
	(135,69,'it','slide5',NULL,1,'2015-01-20 01:14:54','2015-01-20 01:14:54','dc614ab5-63e9-4538-b474-557be9499404'),
	(136,70,'en_us','',NULL,1,'2015-01-20 01:15:59','2015-01-20 21:50:39','3c0e96f4-e409-4ded-9333-e8e6c786d7c5'),
	(137,70,'it','',NULL,1,'2015-01-20 01:15:59','2015-01-20 21:50:39','97bc837f-4476-4538-8170-04ccfc124a1c'),
	(138,71,'en_us','',NULL,1,'2015-01-20 01:15:59','2015-01-20 21:50:39','b7975807-b9cd-4498-a2dc-811629011da9'),
	(139,71,'it','',NULL,1,'2015-01-20 01:15:59','2015-01-20 21:50:39','803272de-3330-43eb-924c-d36c53184819');

/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_emailmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_emailmessages`;

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,1,NULL,'2015-01-09 19:54:28',NULL,'2015-01-09 19:54:28','2015-01-09 19:54:28','27dd2b65-5ea2-47c3-b3c8-398393561950'),
	(3,2,2,1,'2015-01-09 19:54:29',NULL,'2015-01-09 19:54:29','2015-01-09 19:54:29','d8ff410e-cb21-4713-8c76-aafc0cc1dacf'),
	(6,3,3,1,'2015-01-12 18:58:00',NULL,'2015-01-12 18:58:59','2015-01-20 00:43:20','d95ca80c-49cf-4189-a93a-eca3299dcedf'),
	(9,4,4,1,'2015-01-12 22:24:00',NULL,'2015-01-12 22:24:03','2015-01-19 23:58:39','b8ddd259-88bc-40d4-9e8f-1dbb010c1ebf'),
	(13,4,4,1,'2015-01-12 22:24:00',NULL,'2015-01-12 23:28:53','2015-01-19 23:53:35','bbf59f52-3647-4fd7-a8ae-7b98ff203e1b'),
	(16,4,4,1,'2015-01-12 22:24:00',NULL,'2015-01-12 23:36:06','2015-01-19 23:57:35','55553f2f-d243-4c5f-957c-92ff0a3ef261'),
	(19,4,4,1,'2015-01-12 22:24:00',NULL,'2015-01-12 23:36:56','2015-01-19 23:54:50','7ace1d0d-f9dd-499f-acb8-3fe8817796ae'),
	(22,4,4,1,'2015-01-12 22:24:00',NULL,'2015-01-12 23:37:53','2015-01-19 23:59:58','e89240ce-fa88-48e8-9758-604e2b0d4c70'),
	(29,3,3,1,'2015-01-13 03:12:00',NULL,'2015-01-13 03:12:19','2015-01-20 21:50:39','813df266-9f77-45db-9b9e-4030733e8e42'),
	(42,3,3,1,'2015-01-14 17:42:00',NULL,'2015-01-14 17:42:46','2015-01-20 22:18:04','2738c226-f826-49ec-b098-b3f53d1a6a9f'),
	(44,3,3,1,'2015-01-14 17:43:00',NULL,'2015-01-14 17:43:38','2015-01-20 22:25:13','17a48f2d-5a02-4358-b374-246409d58ca4'),
	(46,3,3,1,'2015-01-14 17:44:00',NULL,'2015-01-14 17:44:34','2015-01-20 19:27:40','d1697a2e-5e5c-4440-a8ae-da960de0fa01'),
	(48,3,3,1,'2015-01-14 17:46:00',NULL,'2015-01-14 17:46:00','2015-01-14 17:51:00','eb85d73e-cd18-49e2-9736-18cb1545af80');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,3,'Homepage','homepage',1,'Title',NULL,NULL,'2015-01-09 19:54:28','2015-01-09 19:54:28','fac576c9-c715-46f6-8afd-1616c00c6777'),
	(2,2,5,'News','news',1,'Title',NULL,NULL,'2015-01-09 19:54:29','2015-01-09 19:54:29','6cc6d706-9580-450f-a0c4-80f7b67da8a1'),
	(3,3,13,'Pages','pages',1,'Title',NULL,NULL,'2015-01-12 18:31:32','2015-01-12 18:51:21','3842fe39-0795-457b-9e6b-949e8ba16389'),
	(4,4,17,'Wine','wine',1,'Title',NULL,NULL,'2015-01-12 22:19:56','2015-01-12 22:20:19','4fc0a23d-7e5e-4756-803a-ff7a3fa0fc13');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,6,3,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089139,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":\"\",\"7\":\"<h2>Our work begins at the vineyard<\\/h2><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li><span><\\/span>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li><span><\\/span>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar<\\/h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"12\":[\"5\"],\"6\":\"Our Process\"}}','2015-01-12 18:58:59','2015-01-12 18:58:59','4ce4ebf5-05c6-478b-b2ce-443d99d0761d'),
	(2,6,3,1,'en_us',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089080,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Driven by our love for great wine, we strive to produce the best possible wine for this Terroir.\",\"bannerVideo\":\"veUluy0zAzU\",\"bannerImage\":[\"7\"]}}},\"7\":\"<h2>Our work begins at the vineyard<\\/h2><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar<\\/h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"12\":[\"5\"],\"6\":\"Our Process\"}}','2015-01-12 19:02:11','2015-01-12 19:02:11','e90410b8-3c56-4eb3-a884-d8f12247bf04'),
	(3,6,3,1,'en_us',3,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089080,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"8\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Driven by our love for great wine, we strive to produce the best possible wine for this Terroir.\",\"bannerVideo\":\"veUluy0zAzU\",\"bannerImage\":[\"7\"]}}},\"7\":\"<h2>Our work begins at the vineyard<\\/h2><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"5\"],\"6\":\"Our Process\"}}','2015-01-12 19:39:30','2015-01-12 19:39:30','388afdfa-fa2f-4330-8638-7447c60693a0'),
	(4,6,3,1,'it',1,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089080,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"8\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Forget about it.\",\"bannerVideo\":\"veUluy0zAzU\",\"bannerImage\":[\"7\"]}}},\"7\":\"<h2>Our work begins at the vineyard, eh!<\\/h2><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar, mama mia!<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"5\"],\"6\":\"Our Proccezzzo!\"}}','2015-01-12 20:07:40','2015-01-12 20:07:40','945354de-759a-407f-8333-fea9b6b6d8a8'),
	(5,9,4,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101443,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":\"\",\"24\":\"\",\"14\":\"<p><span style=\\\"font-size: 14px; line-height: 1.6em; background-color: initial;\\\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/span><br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<span><\\/span><br><\\/p>\",\"15\":{\"new1\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"<p>After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.<\\/p>\"}}}}}','2015-01-12 22:24:04','2015-01-12 22:24:04','53247df8-9cdd-4ce1-abc5-531689ca4f05'),
	(6,9,4,1,'it',1,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"<p>After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.<\\/p>\"}}}}}','2015-01-12 22:27:06','2015-01-12 22:27:06','e60a3e77-2585-4eec-9d3d-d6797b34b628'),
	(7,9,4,1,'en_us',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"<p>After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.<\\/p>\"}}}}}','2015-01-12 22:27:16','2015-01-12 22:27:16','2e1ff4b3-3700-4903-9975-5e9ef1b635ad'),
	(8,9,4,1,'en_us',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"<p>After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.<\\/p>\"}}}}}','2015-01-12 22:27:39','2015-01-12 22:27:39','70ac894c-7bb5-40ee-97f3-d54390ac45de'),
	(9,9,4,1,'it',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"<p>After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.<\\/p>\"}}}}}','2015-01-12 22:27:51','2015-01-12 22:27:51','f2b135ac-0202-4480-8f7d-6489dddb3f17'),
	(10,9,4,1,'en_us',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:00:22','2015-01-12 23:00:22','b0099321-d49b-49f3-9562-85111a20daf7'),
	(11,13,4,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:28:53','2015-01-12 23:28:53','b46fdc12-f629-4c5d-bae3-f8e9f3b719a7'),
	(12,13,4,1,'en_us',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigetto\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"15\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"14\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:30:14','2015-01-12 23:30:14','6430a426-f272-4441-8b6d-cad1efc8419f'),
	(13,16,4,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Gigetto\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"15\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"14\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:36:06','2015-01-12 23:36:06','344439f9-5186-44b9-a99c-699149c49234'),
	(14,16,4,1,'en_us',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigino\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"18\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"17\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:36:20','2015-01-12 23:36:20','d28d75cc-65a1-4b22-85db-2e5ad05aade0'),
	(15,19,4,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Gigino\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"18\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"17\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:36:56','2015-01-12 23:36:56','d6a6088a-0c4d-47f8-bfa7-e682bf4d8b79'),
	(16,19,4,1,'en_us',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Pinko Pallino\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"21\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"20\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:37:12','2015-01-12 23:37:12','266630ee-7ce4-462a-b80e-797faf91fc0b'),
	(17,22,4,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Pinko Pallino\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"21\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"20\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:37:53','2015-01-12 23:37:53','e1ef931c-f664-4805-8523-15cdabae8c80'),
	(18,22,4,1,'en_us',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"24\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:38:09','2015-01-12 23:38:09','2476cbeb-95f1-41f5-8827-687b49f276da'),
	(19,19,4,1,'en_us',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Pinko Pallino\",\"slug\":\"pallino\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"21\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"20\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:38:20','2015-01-12 23:38:20','2d71d17e-2d87-42aa-b938-dc01dcdf28d0'),
	(20,16,4,1,'en_us',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigino\",\"slug\":\"gigino\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"18\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"17\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:38:35','2015-01-12 23:38:35','9f6a3ce8-ab00-4eeb-92ee-5af4414b2aca'),
	(21,13,4,1,'en_us',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigetto\",\"slug\":\"gigetto\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"15\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"14\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-12 23:38:43','2015-01-12 23:38:43','feb01f0d-0786-4f03-98f5-94223216ffe2'),
	(22,22,4,1,'en_us',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":\"\",\"23\":[\"24\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-13 00:33:22','2015-01-13 00:33:22','45397ff0-108e-4389-9282-a3945f130bea'),
	(23,29,3,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118739,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 1 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"26\"]}},\"new2\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 2 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"27\"]}},\"new3\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 3 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"28\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-13 03:12:19','2015-01-13 03:12:19','e02e12f0-9e0f-4d39-a4a6-ab0afab5949c'),
	(24,6,3,1,'en_us',4,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089080,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"8\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Driven by our love for great wine, we strive to produce the best possible wine for this Terroir.\",\"bannerVideo\":\"veUluy0zAzU\",\"bannerImage\":[\"7\"]}}},\"7\":\"<h2>Our work begins at the vineyard, eh!<\\/h2><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar, mama mia!<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"5\"],\"6\":\"Our Process\"}}','2015-01-13 03:12:30','2015-01-13 03:12:30','a7468b07-1357-465c-99cb-3d7cd017248a'),
	(25,9,4,1,'en_us',5,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p><strong>Altitude:<\\/strong> 800 ft elavation, 250 meters above sea level<\\/p><p><strong>Vineyard Size:<\\/strong> 5 acres<\\/p><p><strong>Year Planted:<\\/strong> Partly in 2000 and partly in 2006<\\/p><p><strong>Training System: <\\/strong>Spur-pruned cordon for the Sangiovese and Guyot for the Teroldego<\\/p><p><strong>Harvest:<\\/strong> Typically end of September to the first ten days of October depending on the seasons for the Sangiovese. The Teroldego grapes tend to ripen earlier and are harvested earlier (around the 20th of September).<\\/p><p>The Gigi\\u00f3 Sangiovese grapes benefit from the most hang time allowing for greater phenological maturity. They are handpicked and brought immediately to the cellar for further selection.<\\/p><p><strong>Ageing: <\\/strong>The wine will age in French oak barriques (225L each) for 12 months to 18 months depending on the year. Our barriques come from some of the best tonneleries in France and are typically fine grain medium toast. We use a mixture of new and used barriques to avoid excessive wood accent. Following the aging in barriques, the wine is further aged in bottle for another year.<\\/p><p><strong>Bottles Produced: <\\/strong>3000 bottles.<\\/p><p><strong>Alcohol:<\\/strong> 13% to 14%<\\/p><p><strong>Potential Cellaring:<\\/strong> 15+ years.<\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-14 00:02:38','2015-01-14 00:02:38','b628a23c-3d08-4c98-aabe-0c44230b8c58'),
	(26,42,3,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1421257366,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"This is the about page\",\"bannerVideo\":\"\",\"bannerImage\":[\"33\"]}}},\"7\":\"<h2>Who we are<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<span><\\/span><\\/p><h2>What we do<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"38\"],\"6\":\"Learn more about us\"}}','2015-01-14 17:42:46','2015-01-14 17:42:46','5d98ad58-9a60-4334-aad0-1006db799061'),
	(27,44,3,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257418,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Vines everywhere\",\"bannerVideo\":\"\",\"bannerImage\":[\"37\"]}}},\"7\":\"<h2>Vines<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>More Vines<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"41\"],\"6\":\"Our Vines\"}}','2015-01-14 17:43:38','2015-01-14 17:43:38','45684ff5-cd27-42e3-b7a3-97079f97acd1'),
	(28,46,3,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257473,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Olive oil for everyone\",\"bannerVideo\":\"\",\"bannerImage\":[\"35\"]}}},\"7\":\"<h2>Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>More Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"40\"],\"6\":\"Olives everywhere\"}}','2015-01-14 17:44:34','2015-01-14 17:44:34','dca4195d-2671-4e88-9baa-699e12db50a6'),
	(29,48,3,1,'en_us',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Contact\",\"slug\":\"contact\",\"postDate\":1421257560,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Get in touch\",\"bannerVideo\":\"\",\"bannerImage\":[\"34\"]}}},\"7\":\"\",\"12\":[\"39\"],\"6\":\"Contact us\"}}','2015-01-14 17:46:00','2015-01-14 17:46:00','4609e347-3b1b-4b13-8b2a-0e77570c2372'),
	(30,48,3,1,'en_us',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Contact\",\"slug\":\"contact\",\"postDate\":1421257560,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"49\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Get in touch\",\"bannerVideo\":\"\",\"bannerImage\":[\"34\"]}}},\"7\":\"<p>Get in touch with us by writing in the box below. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <\\/p>\",\"12\":[\"39\"],\"6\":\"Contact us\"}}','2015-01-14 17:51:00','2015-01-14 17:51:00','7a732106-3009-4aa2-bbda-3a74f8d60429'),
	(31,29,3,1,'en_us',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118720,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"30\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 1 Text\",\"bannerVideo\":\"oF7cvWnIHPc\",\"bannerImage\":[\"26\"]}},\"31\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 2 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"27\"]}},\"32\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 3 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"28\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-14 22:36:57','2015-01-14 22:36:57','e6f5bdf0-f669-4bb1-b599-d3a3c75a0002'),
	(32,29,3,1,'en_us',3,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118720,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"30\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"bannerVideo\":\"oF7cvWnIHPc\",\"bannerImage\":[\"26\"]}},\"31\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 2 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"27\"]}},\"32\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 3 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"28\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-14 22:37:21','2015-01-14 22:37:21','d6e9b86f-6d5f-49f6-9572-db0de57c3f22'),
	(33,29,3,1,'en_us',4,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118720,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"30\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, isicing elit, sed isicing elit, sed \",\"bannerVideo\":\"oF7cvWnIHPc\",\"bannerImage\":[\"26\"]}},\"31\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 2 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"27\"]}},\"32\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 3 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"28\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-14 22:39:51','2015-01-14 22:39:51','6561132f-6959-4558-aa52-7af8bde19d35'),
	(34,46,3,1,'en_us',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"47\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Olive oil for everyone\",\"bannerVideo\":\"\",\"bannerImage\":[\"35\"]}},\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Olive Oil\",\"bannerVideo\":\"\",\"bannerImage\":[\"50\"]}}},\"7\":\"<h2>Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>More Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":\"\",\"6\":\"Olives everywhere\"}}','2015-01-19 21:02:03','2015-01-19 21:02:03','86ae4c0c-14c7-43f8-adc8-7594698379e1'),
	(35,46,3,1,'en_us',3,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"47\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Olive oil for everyone\",\"bannerVideo\":\"\",\"bannerImage\":[\"50\"]}}},\"7\":\"<h2>Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>More Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":\"\",\"6\":\"Olives everywhere\"}}','2015-01-19 21:02:47','2015-01-19 21:02:47','6454c8d1-1d16-4447-8f7d-9c5b4f5f885a'),
	(36,42,3,1,'en_us',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1421257320,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"43\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"This is the about page\",\"bannerVideo\":\"\",\"bannerImage\":[\"52\"]}}},\"7\":\"<h2>Who we are<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>What we do<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"38\"],\"6\":\"Learn more about us\"}}','2015-01-19 21:05:20','2015-01-19 21:05:20','9713daad-25f5-434c-bb81-59f54756d716'),
	(37,22,4,1,'en_us',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"15\"],\"23\":[\"24\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 21:50:11','2015-01-19 21:50:11','862a5418-9a92-49fd-978d-0df7b4774e3e'),
	(38,44,3,1,'en_us',2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257380,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"45\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Vines everywhere\",\"bannerVideo\":\"\",\"bannerImage\":[\"53\"]}}},\"7\":\"<h2>Vines<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>More Vines<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"41\"],\"6\":\"Our Vines\"}}','2015-01-19 22:07:09','2015-01-19 22:07:09','aab6e398-f9f0-4686-abc8-d4553c0144c9'),
	(39,22,4,1,'en_us',5,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"21\"],\"23\":[\"24\"],\"24\":[\"21\"],\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 22:11:26','2015-01-19 22:11:26','ab7fcf26-7583-4771-b062-478a5fa11561'),
	(40,42,3,1,'en_us',3,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1421257320,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"43\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Learn More About Us\",\"bannerVideo\":\"\",\"bannerImage\":[\"52\"]}}},\"7\":\"<h2>The Poggio La Noce Estate<\\/h2><p>The estate was founded by husband and wife team, Enzo Schiano and Claire Beliard, in 2000. Nestled in the hills of Fiesole, Tuscany, facing south\\/south-west, the property sits in some of the most beautiful countryside just outside Florence, amidst hills sprinkled with medieval bell towers and castle ruins. <\\/p><p>The property consists of one vineyard (5 acres) cultivated with mostly Sangiovese grapes and a small percentage of Teroldego, in a mix of older vines (15 years+) and younger ones (8 years+). The vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel.<\\/p><p>From the beginning, we set out to farm organically and have been certified organic since 2006.<span><\\/span><\\/p><h2>Our Team<\\/h2><p>Husband and wife, Enzo Schiano and Claire Beliard are the owners of the Poggio la Noce estate. Enzo is Italian and Claire is French. They share the vision and love for making great wines. <\\/p><p>Roberto Corti is Poggio la Noce\'s employee. Roberto studied agronomy at the university of Florence and cares for all aspects of the vineyard work as well as that of the cellar, and manages the wine making along with Claire and Enzo. And of course all this under the careful guardianship of our beloved Maremmano Shepard dog, Marcellino.<\\/p><p>Our consulting team is made up of Valentino Ciarla, our technical oenologist, as well as Stefano Dini and GianLuca Grassi, who are our agronomists.<\\/p>\",\"12\":[\"38\"],\"6\":\"Learn more about us\"}}','2015-01-19 22:13:00','2015-01-19 22:13:00','402f73db-3983-4914-bc38-9d5421d12a08'),
	(41,44,3,1,'en_us',3,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257380,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"45\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Vines everywhere\",\"bannerVideo\":\"\",\"bannerImage\":[\"53\"]}}},\"7\":\"<h2>The Vinyard<\\/h2><p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone. <\\/p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. <\\/p>\",\"12\":[\"41\"],\"6\":\"Our Vines\"}}','2015-01-19 22:15:38','2015-01-19 22:15:38','b61659cf-e48d-4e5b-bd04-48ffda5bde8e'),
	(42,16,4,1,'en_us',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigino\",\"slug\":\"gigino\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"56\"],\"23\":[\"18\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"17\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 23:36:08','2015-01-19 23:36:08','00eaff08-36c0-4486-9d65-c13d49b33e1b'),
	(43,19,4,1,'en_us',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Pinko Pallino\",\"slug\":\"pallino\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"59\"],\"23\":[\"21\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\/p>\",\"15\":{\"20\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 23:49:42','2015-01-19 23:49:42','ddc6bb0b-41a2-41a6-b47c-2f94f4502166'),
	(44,22,4,1,'en_us',6,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"60\"],\"23\":[\"24\"],\"24\":\"\",\"14\":\"<p><br><\\/p>\",\"13\":\"<p>Coming soon!<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 23:51:41','2015-01-19 23:51:41','cf049a4f-e11b-48c6-ab5b-ab200f52f977'),
	(45,22,4,1,'en_us',7,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"60\"],\"23\":[\"24\"],\"24\":\"\",\"14\":\"\",\"13\":\"<p>Coming soon!<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Gig\\u00edo red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 23:52:08','2015-01-19 23:52:08','cb9c6e26-afaa-4c33-8e62-5bccf2700410'),
	(46,13,4,1,'en_us',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigetto\",\"slug\":\"gigetto\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"57\"],\"23\":[\"15\"],\"24\":\"\",\"14\":\"<p><br><\\/p>\",\"13\":\"<p>We think of it as the little brother of Gigi\\u00f2. It is a wine of surprising immediacy, while still offering plenty of experiences to the nose and palate. Gigetto was born out of our own wish to drink a pleasant, genuine wine, yet with exceptional fruit and easier drinkability. Gigetto is released a year earlier than Gigi\\u00f2 and typically ages in large size botte only a few months.<span><\\/span><br><\\/p>\",\"15\":{\"14\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of Albarese and Galestro limestones\",\"vinificationAndMaturation\":\"The Gigetto grapes are picked first as we are trying to make a fresh fruit driven wine with less emphasis on concentration. After cluster and berry selection, vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in oak \\\"botti\\\" or large size barrels (1000L) for 3 to 6 months with further 6 month ageing in bottle.\"}}}}}','2015-01-19 23:53:35','2015-01-19 23:53:35','76dd68b0-df1b-48b9-87e1-4e646c64eda9'),
	(47,19,4,1,'en_us',5,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Pinko Pallino\",\"slug\":\"pallino\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"59\"],\"23\":[\"21\"],\"24\":\"\",\"14\":\"<p><br><\\/p>\",\"13\":\"<p>Is a Ros\\u00e9 bottling produced from a blend of both early harvested Sangiovese fruit and the bleeding off part of the juice from the later harvested Gigi\\u00f2 fruit. (Bleeding off some of the Gigi\\u00f2 juice allows us to achieve higher concentration for the Gigi\\u00f2 final wine). The quality of the fruit for this Ros\\u00e9 wine is therefore of the highest quality we produce. It is a gorgeous, radiant pink, grapefruit color, dry, with long acidity and structure, yet very easy to drink on a hot summer day. Pinko Pallino is released just six months after harvest and it is only aged in steel vats.<span><\\/span><br><\\/p>\",\"15\":{\"20\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Ros\\u00e9 Wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese\",\"exposition\":\"South South West\",\"soil\":\"Mixture of Alberese and Galestro limestones\",\"vinificationAndMaturation\":\"The Ros\\u00e9 grapes are the first to be harvested and we look to pick grapes with lower maturity level and less alcohol potential. The grape clusters are pressed whole immediately. The juice is then left to ferment in a steel vat at cooler temperatures. In parallel some of the bled off juice from Gigi\\u00f2 is also fermented separately. The two batches will then be blended together to build the final Ros\\u00e9 wine. The wine will rest in stainless steel vats for a few months at cooler temperatures (8 to 10 degrees celcius) until it is bottled. It releases roughly 6-9 months later.\"}}}}}','2015-01-19 23:54:50','2015-01-19 23:54:50','6c7ec9b7-8633-49a0-aa06-ad290bd0daf1'),
	(48,16,4,1,'en_us',5,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigino\",\"slug\":\"gigino\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"56\"],\"23\":[\"18\"],\"24\":\"\",\"14\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<br><\\/p>\",\"13\":\"<p>This might be considered Gigetto\'s twin brother except for the fact that Gigino is \\\"Sangiovese in purezza\\\", meaning 100% sangiovese, with no blending of other grape varietals. This wine came about because we noticed that some segments of the vineyard were especially well suited for Sangiovese, yielding a very classic stile Sangiovese. The Sangiovese fruit from these segments of the vineyard produce a wine with perfect balance, freshness and elegance.<span><\\/span><br><\\/p>\",\"15\":{\"17\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Red Wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese\",\"exposition\":\"South South West\",\"soil\":\"Mixture of Alberese and Galestro limestones\",\"vinificationAndMaturation\":\"The Gigino grapes are carefully selected from specific segments of the vineyard where the soil yields a very classic elegant style Sangiovese. After cluster and berry selection, vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in oak \\\"botti\\\" or large size barrels (1000L) for\\u00a012 months with further\\u00a012 month ageing in bottle.\"}}}}}','2015-01-19 23:57:35','2015-01-19 23:57:35','52a11fab-7639-43f4-900e-daeac433854a'),
	(49,9,4,1,'en_us',6,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Gigio\",\"slug\":\"gigio\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"11\"],\"23\":[\"12\"],\"24\":\"\",\"14\":\"<p><strong>Altitude:<\\/strong> 800 ft elavation, 250 meters above sea level<\\/p><p><strong>Vineyard Size:<\\/strong> 5 acres<\\/p><p><strong>Year Planted:<\\/strong> Partly in 2000 and partly in 2006<\\/p><p><strong>Training System: <\\/strong>Spur-pruned cordon for the Sangiovese and Guyot for the Teroldego<\\/p><p><strong>Harvest:<\\/strong> Typically end of September to the first ten days of October depending on the seasons for the Sangiovese. The Teroldego grapes tend to ripen earlier and are harvested earlier (around the 20th of September).<\\/p><p>The Gigi\\u00f3 Sangiovese grapes benefit from the most hang time allowing for greater phenological maturity. They are handpicked and brought immediately to the cellar for further selection.<\\/p><p><strong>Ageing: <\\/strong>The wine will age in French oak barriques (225L each) for 12 months to 18 months depending on the year. Our barriques come from some of the best tonneleries in France and are typically fine grain medium toast. We use a mixture of new and used barriques to avoid excessive wood accent. Following the aging in barriques, the wine is further aged in bottle for another year.<\\/p><p><strong>Bottles Produced: <\\/strong>3000 bottles.<\\/p><p><strong>Alcohol:<\\/strong> 13% to 14%<\\/p><p><strong>Potential Cellaring:<\\/strong> 15+ years.<\\/p>\",\"13\":\"<p>Gigi\\u00f2 is the estate\'s first-born and flagship wine. It is a blend of Sangiovese (90%) and Teroldego (10%). Aged for three years before release, it is the product of the most mature and fully developed fruit in the vineyard. We pull all the stops for this wine. And it shows in the glass. It is a complex, age-worthy wine, with deep colors and lively fruits, with persistent acidity and finish. We like to think of it as a wine for meditation.<span><\\/span><br><\\/p>\",\"15\":{\"10\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of Alberese and Galestro limestones\",\"vinificationAndMaturation\":\"After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.\"}}}}}','2015-01-19 23:58:39','2015-01-19 23:58:39','4ca62bf8-dfaf-494f-b9d1-a1bd923709f0'),
	(50,22,4,1,'en_us',8,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paonazzo\",\"slug\":\"paonazzo\",\"postDate\":1421101440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"22\":[\"60\"],\"23\":[\"24\"],\"24\":\"\",\"14\":\"<p>Coming soon!<\\/p>\",\"13\":\"<p>Coming soon!<br><\\/p>\",\"15\":{\"23\":{\"type\":\"specifications\",\"enabled\":\"1\",\"fields\":{\"wineType\":\"Red wine IGT Tuscany\",\"vineyardLocation\":\"Poggio La Noce, Fiesole\",\"grapes\":\"Sangiovese and Teroldego\",\"exposition\":\"South South West\",\"soil\":\"Mixture of albarese and galestro limestones\",\"vinificationAndMaturation\":\"Coming soon!\"}}}}}','2015-01-19 23:59:58','2015-01-19 23:59:58','e759d1aa-9ca5-4321-973d-c56447e300e7'),
	(51,46,3,1,'en_us',4,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"47\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Olive oil for everyone\",\"bannerVideo\":\"\",\"bannerImage\":[\"50\"]}}},\"7\":\"<h2>Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p><h2>More Oil<\\/h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"12\":[\"62\"],\"6\":\"Olives everywhere\"}}','2015-01-20 00:14:11','2015-01-20 00:14:11','d81c4475-e83c-446d-b3a3-736db7160568'),
	(52,42,3,1,'en_us',4,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1421257320,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"43\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Learn More About Us\",\"bannerVideo\":\"\",\"bannerImage\":[\"52\"]}}},\"7\":\"<h2>The Poggio La Noce Estate<\\/h2><p>The estate was founded by husband and wife team, Enzo Schiano and Claire Beliard, in 2000. Nestled in the hills of Fiesole, Tuscany, facing south\\/south-west, the property sits in some of the most beautiful countryside just outside Florence, amidst hills sprinkled with medieval bell towers and castle ruins. <\\/p><p>The property consists of one vineyard (5 acres) cultivated with mostly Sangiovese grapes and a small percentage of Teroldego, in a mix of older vines (15 years+) and younger ones (8 years+). The vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel.<\\/p><p>From the beginning, we set out to farm organically and have been certified organic since 2006.<\\/p><h2>Our Team<\\/h2><p>Husband and wife, Enzo Schiano and Claire Beliard are the owners of the Poggio la Noce estate. Enzo is Italian and Claire is French. They share the vision and love for making great wines. <\\/p><p>Roberto Corti is Poggio la Noce\'s employee. Roberto studied agronomy at the university of Florence and cares for all aspects of the vineyard work as well as that of the cellar, and manages the wine making along with Claire and Enzo. And of course all this under the careful guardianship of our beloved Maremmano Shepard dog, Marcellino.<\\/p><p>Our consulting team is made up of Valentino Ciarla, our technical oenologist, as well as Stefano Dini and GianLuca Grassi, who are our agronomists.<\\/p>\",\"12\":[\"61\"],\"6\":\"Learn more about us\"}}','2015-01-20 00:16:14','2015-01-20 00:16:14','104101ba-de9e-4b0e-a437-c03aadc3466b'),
	(53,42,3,1,'en_us',5,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1421257320,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"43\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Learn More About Us\",\"bannerVideo\":\"\",\"bannerImage\":[\"52\"]}}},\"7\":\"<h2>The Poggio La Noce Estate<\\/h2><p>The estate was founded by husband and wife team, Enzo Schiano and Claire Beliard, in 2000. Nestled in the hills of Fiesole, Tuscany, facing south\\/south-west, the property sits in some of the most beautiful countryside just outside Florence, amidst hills sprinkled with medieval bell towers and castle ruins. <\\/p><p>The property consists of one vineyard (5 acres) cultivated with mostly Sangiovese grapes and a small percentage of Teroldego, in a mix of older vines (15 years+) and younger ones (8 years+). The vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel.<\\/p><p>From the beginning, we set out to farm organically and have been certified organic since 2006.<\\/p><h2>Our Team<\\/h2><p>Husband and wife, Enzo Schiano and Claire Beliard are the owners of the Poggio la Noce estate. Enzo is Italian and Claire is French. They share the vision and love for making great wines. <\\/p><p>Roberto Corti is Poggio la Noce\'s employee. Roberto studied agronomy at the university of Florence and cares for all aspects of the vineyard work as well as that of the cellar, and manages the wine making along with Claire and Enzo. And of course all this under the careful guardianship of our beloved Maremmano Shepard dog, Marcellino.<\\/p><p>Our consulting team is made up of Valentino Ciarla, our technical oenologist, as well as Stefano Dini and GianLuca Grassi, who are our agronomists.<\\/p>\",\"12\":[\"63\"],\"6\":\"Learn more about us\"}}','2015-01-20 00:25:58','2015-01-20 00:25:58','97d01282-365c-4810-a971-36c868a2966d'),
	(54,6,3,1,'en_us',5,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089080,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"8\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Driven by our love for great wine, we strive to produce the best possible wine for this Terroir.\",\"bannerVideo\":\"veUluy0zAzU\",\"bannerImage\":[\"7\"]}}},\"7\":\"<h2>Our work begins at the vineyard<\\/h2><p>We are driven by our love for great wine and we set out from the very beginning with an uncompromising eye for detail to produce the most beautiful, healthy grapes, thus yielding the best possible wine this terroir can enable. Our commitment to achieve excellence begins in the vineyard, where we tend to each vine individually.<span><\\/span><br><\\/p><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar, mama mia!<\\/h2><p>The same level of dedication and focus carries over to the cellar where the wine is made. We harvest manually and carry the fruit in small trays to the destemmer. Even before the fruit goes to the destemmer, Enzo performs a selection of the grape clusters, prying open each cluster to check for immature berries and imperfections that can develop inside of each closed cluster. After the destemming process, the individual berries roll onto a sorting table where several people check for additional berry imperfections. Only perfect fruit will make it to the fermentation tanks. This is for all the wines we produce, not just our top wine. In addition, we use only the best equipment available. For example, our Bucher destemmer detaches the berries from the stems using rubber-revolving arms, to allow for the berries to remain virtually intact so that we are able to perform an effective selection by hand on the sorting table.<br><\\/p><p>Fermentation occurs naturally relying on indigenous yeast present on the skins. All aspects of vinification that take place during and after fermentation are performed in an un-intrusive manner, whether we do pump-overs or pressing of the must after fermentation. For aging, the juice is transferred to barriques from the best suppliers in France, typically French oak, medium toast, fine grain, with a mixture of both new and used barriques and \\\"botti\\\". Further aging will occur in bottles, between 6 months to a year depending on the type of wine.<\\/p><p>This type of uncompromising, detailed work is only possible because our estate is very small, allowing us to put great focus on the quality of what we produce. Working on such a small, human-dimension scale, allows our small team of three people (Claire, Enzo and Roberto) to be 100% devoted to this vineyard, the land and the resulting great products that can derive from it.<\\/p>\",\"12\":[\"5\"],\"6\":\"Our Process\"}}','2015-01-20 00:42:06','2015-01-20 00:42:06','ee92de11-512b-43c3-b31f-f1144b50dd64'),
	(55,6,3,1,'en_us',6,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Philosophy\",\"slug\":\"philosophy\",\"postDate\":1421089080,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"8\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Driven by our love for great wine, we strive to produce the best possible wine for this Terroir.\",\"bannerVideo\":\"veUluy0zAzU\",\"bannerImage\":[\"7\"]}}},\"7\":\"<h2>Our work begins at the vineyard<\\/h2><p>We are driven by our love for great wine and we set out from the very beginning with an uncompromising eye for detail to produce the most beautiful, healthy grapes, thus yielding the best possible wine this terroir can enable. Our commitment to achieve excellence begins in the vineyard, where we tend to each vine individually.<br><\\/p><ul><li>Passing through the vineyard, row by row, several times each week.<\\/li><li>Weeding and hoeing, pruning, cutting back leaves and fruit.<\\/li><li>Thinning grape bunches and constantly monitoring the health of the berries.<\\/li><\\/ul><h2>Our dedication carries over to the cellar<\\/h2><p>The same level of dedication and focus carries over to the cellar where the wine is made. We harvest manually and carry the fruit in small trays to the destemmer. Even before the fruit goes to the destemmer, Enzo performs a selection of the grape clusters, prying open each cluster to check for immature berries and imperfections that can develop inside of each closed cluster. After the destemming process, the individual berries roll onto a sorting table where several people check for additional berry imperfections. Only perfect fruit will make it to the fermentation tanks. This is for all the wines we produce, not just our top wine. In addition, we use only the best equipment available. For example, our Bucher destemmer detaches the berries from the stems using rubber-revolving arms, to allow for the berries to remain virtually intact so that we are able to perform an effective selection by hand on the sorting table.<br><\\/p><p>Fermentation occurs naturally relying on indigenous yeast present on the skins. All aspects of vinification that take place during and after fermentation are performed in an un-intrusive manner, whether we do pump-overs or pressing of the must after fermentation. For aging, the juice is transferred to barriques from the best suppliers in France, typically French oak, medium toast, fine grain, with a mixture of both new and used barriques and \\\"botti\\\". Further aging will occur in bottles, between 6 months to a year depending on the type of wine.<\\/p><p>This type of uncompromising, detailed work is only possible because our estate is very small, allowing us to put great focus on the quality of what we produce. Working on such a small, human-dimension scale, allows our small team of three people (Claire, Enzo and Roberto) to be 100% devoted to this vineyard, the land and the resulting great products that can derive from it.<\\/p>\",\"12\":[\"5\"],\"6\":\"Our Process\"}}','2015-01-20 00:43:20','2015-01-20 00:43:20','a9aa2f38-cabc-4c25-8f08-f1cba3382357'),
	(56,44,3,1,'en_us',4,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257380,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"45\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Vines everywhere\",\"bannerVideo\":\"\",\"bannerImage\":[\"53\"]}}},\"7\":\"<h2>The Vinyard<\\/h2><p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone. <\\/p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. <\\/p>\",\"12\":[\"64\"],\"6\":\"Our Vines\"}}','2015-01-20 00:46:39','2015-01-20 00:46:39','251ead2e-54bd-4417-9175-c4ff0f9be47c'),
	(57,44,3,1,'en_us',5,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257380,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"45\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"NEED TEXT\",\"bannerVideo\":\"\",\"bannerImage\":[\"53\"]}}},\"7\":\"<h2>The Vinyard<\\/h2><p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone. <\\/p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. <\\/p>\",\"12\":[\"64\"],\"6\":\"Our Vines\"}}','2015-01-20 00:47:06','2015-01-20 00:47:06','86112126-22c0-4fc7-be50-675af2f3b724'),
	(58,29,3,1,'en_us',5,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118720,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"30\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, isicing elit, sed isicing elit, sed \",\"bannerVideo\":\"oF7cvWnIHPc\",\"bannerImage\":[\"65\"]}},\"31\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 2 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"66\"]}},\"32\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 3 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"67\"]}},\"new1\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 4\",\"bannerVideo\":\"\",\"bannerImage\":[\"68\"]}},\"new2\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 5\",\"bannerVideo\":\"\",\"bannerImage\":[\"69\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-20 01:15:59','2015-01-20 01:15:59','d960e170-3456-4b3a-a536-f4db8030e291'),
	(59,29,3,1,'en_us',6,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118720,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"30\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, isicing elit, sed isicing elit, sed \",\"bannerVideo\":\"a6THrlLVopw\",\"bannerImage\":[\"65\"]}},\"31\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 2 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"66\"]}},\"32\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 3 Text\",\"bannerVideo\":\"\",\"bannerImage\":[\"67\"]}},\"70\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 4\",\"bannerVideo\":\"\",\"bannerImage\":[\"68\"]}},\"71\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Slide 5\",\"bannerVideo\":\"\",\"bannerImage\":[\"69\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-20 01:19:16','2015-01-20 01:19:16','6e3c72c9-4c4a-42c5-bcd4-36048fee12c1'),
	(60,46,3,1,'en_us',5,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"47\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A dedicated olive press that allows for immediate pressing, right at the estate, preserving the intense flavor and full fragrance of the olive oil.\",\"bannerVideo\":\"\",\"bannerImage\":[\"50\"]}}},\"7\":\"<h2>Our Olive Oil<\\/h2><p>We produce an Organic Extra Virgin Olive Oil of the highest quality and extraordinary purity. Our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity, absolutely vital for a smooth, fragrant product. <\\/p><p>We fertilize and care for our 1,500 olive trees exclusively with organic-certified products and prune by hand. With only 1,500 olive trees, our farm uses traditional picking methodology, hand picking each olive in its prime state of ripeness. Hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch. <\\/p><p>Our olives are pressed directly at the estate the same day, using our own small modern cold press. Pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity, which is responsible for the smoothness and intensity of Poggio La Noce olive oil.<\\/p><p>Three types of cultivars are cultivated at the estate: Frantoio, Leccino and Morailo to allow for a smooth delicate yet intense final blend.<\\/p><p>Enjoy this all-natural extra virgin olive oil on salads, bruschette or simply with freshbread and you will savor a most intense fragrance, resembling artichokes, fresh grass and almonds.<\\/p>\",\"12\":[\"62\"],\"6\":\"Olives everywhere\"}}','2015-01-20 19:26:50','2015-01-20 19:26:50','242b3738-43f2-4ddd-9c31-bab92916b76f'),
	(61,46,3,1,'en_us',6,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"47\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A dedicated olive press that allows for immediate pressing, right at the estate, preserving the intense flavor and full fragrance of the olive oil.\",\"bannerVideo\":\"\",\"bannerImage\":[\"50\"]}}},\"7\":\"<p>We produce an Organic Extra Virgin Olive Oil of the highest quality and extraordinary purity. Our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity, absolutely vital for a smooth, fragrant product.<br><\\/p><p>We fertilize and care for our 1,500 olive trees exclusively with organic-certified products and prune by hand. With only 1,500 olive trees, our farm uses traditional picking methodology, hand picking each olive in its prime state of ripeness. Hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch. <\\/p><p>Our olives are pressed directly at the estate the same day, using our own small modern cold press. Pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity, which is responsible for the smoothness and intensity of Poggio La Noce olive oil.<\\/p><p>Three types of cultivars are cultivated at the estate: Frantoio, Leccino and Morailo to allow for a smooth delicate yet intense final blend.<\\/p><p>Enjoy this all-natural extra virgin olive oil on salads, bruschette or simply with freshbread and you will savor a most intense fragrance, resembling artichokes, fresh grass and almonds.<\\/p>\",\"12\":[\"62\"],\"6\":\"Our Olive Oil\"}}','2015-01-20 19:27:28','2015-01-20 19:27:28','812e9ee9-4178-444f-865f-cc3ee6a58613'),
	(62,46,3,1,'en_us',7,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Olive Oil\",\"slug\":\"olive-oil\",\"postDate\":1421257440,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"47\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A dedicated olive press that allows for immediate pressing, right at the estate, preserving the intense flavor and full fragrance of the olive oil.\",\"bannerVideo\":\"\",\"bannerImage\":[\"50\"]}}},\"7\":\"<p>We produce an Organic Extra Virgin Olive Oil of the highest quality and extraordinary purity. Our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity, absolutely vital for a smooth, fragrant product.<br><\\/p><p>We fertilize and care for our 1,500 olive trees exclusively with organic-certified products and prune by hand. With only 1,500 olive trees, our farm uses traditional picking methodology, hand picking each olive in its prime state of ripeness. Hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch. <\\/p><p>Our olives are pressed directly at the estate the same day, using our own small modern cold press. Pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity, which is responsible for the smoothness and intensity of Poggio La Noce olive oil.<\\/p><p>Three types of cultivars are cultivated at the estate: Frantoio, Leccino and Morailo to allow for a smooth delicate yet intense final blend.<\\/p><p>Enjoy this all-natural extra virgin olive oil on salads, bruschette or simply with fresh bread and you will savor a most intense fragrance, resembling artichokes, fresh grass and almonds.<\\/p>\",\"12\":[\"62\"],\"6\":\"Our Olive Oil\"}}','2015-01-20 19:27:40','2015-01-20 19:27:40','342305ca-c0ab-4d33-a53b-bb2942b6b6c5'),
	(63,29,3,1,'en_us',7,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1421118720,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"30\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A harmonious union between man and nature to yield a beautiful wine\",\"bannerVideo\":\"a6THrlLVopw\",\"bannerImage\":[\"65\"]}},\"31\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A harmonious union between man and nature to yield a beautiful wine\",\"bannerVideo\":\"\",\"bannerImage\":[\"66\"]}},\"32\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A harmonious union between man and nature to yield a beautiful wine\",\"bannerVideo\":\"\",\"bannerImage\":[\"67\"]}},\"70\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A harmonious union between man and nature to yield a beautiful wine\",\"bannerVideo\":\"\",\"bannerImage\":[\"68\"]}},\"71\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"A harmonious union between man and nature to yield a beautiful wine\",\"bannerVideo\":\"\",\"bannerImage\":[\"69\"]}}},\"7\":\"\",\"12\":\"\",\"6\":\"\"}}','2015-01-20 21:50:39','2015-01-20 21:50:39','46c528db-ab80-4dd5-9ba0-2dbe5a76dac3'),
	(64,42,3,1,'en_us',6,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"About\",\"slug\":\"about\",\"postDate\":1421257320,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"43\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Learn More About Us\",\"bannerVideo\":\"\",\"bannerImage\":[\"52\"]}}},\"7\":\"<h2>The Poggio La Noce Estate<\\/h2><p>\\r\\n\\tThe estate was founded by husband and wife team, Enzo Schiano and Claire Beliard, in 2000. Nestled in the hills of Fiesole, Tuscany, facing south\\/south-west, the property sits in some of the most beautiful countryside just outside Florence, amidst hills sprinkled with medieval bell towers and castle ruins.\\r\\n<\\/p><p>\\r\\n\\tThe property consists of one vineyard (5 acres) cultivated with mostly Sangiovese grapes and a small percentage of Teroldego, in a mix of older vines (15 years+) and younger ones (8 years+). The vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel.\\r\\n<\\/p><p>\\r\\n\\tFrom the beginning, we set out to farm organically and have been certified organic since 2006.\\r\\n<\\/p><h2>Our Team<\\/h2><p>\\r\\n\\tHusband and wife, Enzo Schiano and Claire Beliard are the owners of the Poggio la Noce estate. Enzo is Italian and Claire is French. They share the vision and love for making great wines.\\r\\n<\\/p><p>\\r\\n\\tRoberto Corti is Poggio la Noce\'s employee. Roberto studied agronomy at the university of Florence and cares for all aspects of the vineyard work as well as that of the cellar, and manages the wine making along with Claire and Enzo. And of course all this under the careful guardianship of our beloved Maremmano Shepard dog, Marcellino.\\r\\n<\\/p><p>\\r\\n\\tOur consulting team is made up of Valentino Ciarla, our technical oenologist, as well as Stefano Dini and GianLuca Grassi, who are our agronomists.\\r\\n<\\/p>\",\"12\":[\"63\"],\"6\":\"Learn more about us\"}}','2015-01-20 22:18:04','2015-01-20 22:18:04','5c116829-c98c-4751-9943-1a442aaa070c'),
	(65,44,3,1,'en_us',6,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257380,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"45\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"Our Terroir\",\"bannerVideo\":\"\",\"bannerImage\":[\"53\"]}}},\"7\":\"<h2>The Vinyard<\\/h2><p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone. <\\/p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. <\\/p>\",\"12\":[\"64\"],\"6\":\"Our Vines\"}}','2015-01-20 22:24:35','2015-01-20 22:24:35','12c9c338-53fa-48c8-8653-cde2c732f804'),
	(66,44,3,1,'en_us',7,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Vineyard\",\"slug\":\"vineyard\",\"postDate\":1421257380,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":{\"45\":{\"type\":\"banner\",\"enabled\":\"1\",\"fields\":{\"bannerHeadline\":\"The Vinyard\",\"bannerVideo\":\"\",\"bannerImage\":[\"53\"]}}},\"7\":\"<p>The vineyard is situated at about 800 feet elevation facing, South-South West, giving it perfect sun exposure from morning to evening. It sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with Albarese and Galestro limestone.<br><\\/p><p>This hillside is proving to be a very special terroir for the Sangiovese grape, yielding beautiful fresh lively and elegant Sangiovese based wines with huge depth and good longevity potential. <\\/p>\",\"12\":[\"64\"],\"6\":\"Our Vines\"}}','2015-01-20 22:25:13','2015-01-20 22:25:13','886618ef-52bf-44bc-9862-fdd28e64c8a0');

/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','2015-01-09 19:54:28','2015-01-09 19:54:28','b4cc00cb-407b-4ff8-bc81-2aeaf5c4410b'),
	(2,'Globals','2015-01-09 22:23:08','2015-01-09 22:23:08','ade3375a-2288-40e2-b510-fe2789e924f2'),
	(3,'Page','2015-01-12 18:32:18','2015-01-12 18:32:18','8eee3ce7-fe60-4c0c-80a7-d740d28fcdf3'),
	(4,'Wine','2015-01-12 21:44:33','2015-01-12 21:44:33','0bf884c3-e374-4c23-acf0-69807b785cab');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,1,1,1,1,'2015-01-09 19:54:28','2015-01-09 19:54:28','188fb844-0ccc-42d9-8cc5-f1fa40e5a7e9'),
	(2,5,2,1,1,1,'2015-01-09 19:54:29','2015-01-09 19:54:29','0ee7cbcf-e454-4501-92f9-c77cef51f0c0'),
	(3,5,2,2,0,2,'2015-01-09 19:54:29','2015-01-09 19:54:29','4056fbf2-6ea0-4a2d-b76b-176c48b28f00'),
	(4,7,3,3,0,1,'2015-01-09 22:23:45','2015-01-09 22:23:45','0ead1e3d-d8ed-4a62-b2c5-57e07e3932d2'),
	(5,7,3,4,0,2,'2015-01-09 22:23:45','2015-01-09 22:23:45','159c18ed-0acb-4e19-9d12-fe1819e4808a'),
	(6,7,3,5,0,3,'2015-01-09 22:23:45','2015-01-09 22:23:45','1db62d2d-23d0-4d9d-91e0-c273b6267a4e'),
	(9,12,5,9,1,1,'2015-01-12 18:50:20','2015-01-12 18:50:20','395c237b-e021-4cd4-ae47-44390c02588e'),
	(10,12,5,10,0,2,'2015-01-12 18:50:20','2015-01-12 18:50:20','86d46f62-23cc-4f64-9a39-c439dfb7a5a6'),
	(11,12,5,11,1,3,'2015-01-12 18:50:20','2015-01-12 18:50:20','06784f6f-7398-4f3f-8600-a86fa55e04f2'),
	(12,13,6,6,0,1,'2015-01-12 18:51:21','2015-01-12 18:51:21','4f2e65e4-08a1-43db-965c-b7879175396b'),
	(13,13,6,7,0,2,'2015-01-12 18:51:21','2015-01-12 18:51:21','70dffef8-754c-4125-8231-2d1f3593e5cc'),
	(14,13,6,8,0,3,'2015-01-12 18:51:21','2015-01-12 18:51:21','6c044178-3d37-4aa2-b4e5-b2aced5b1d54'),
	(15,13,6,12,0,4,'2015-01-12 18:51:21','2015-01-12 18:51:21','73a27e36-369a-4771-87ac-aa6f35649dab'),
	(22,17,8,13,0,1,'2015-01-12 22:20:19','2015-01-12 22:20:19','a33d8307-3c89-483e-a35f-6ae3bf5e71c7'),
	(23,17,8,15,0,2,'2015-01-12 22:20:19','2015-01-12 22:20:19','8353fd3b-5fe6-44fa-9b8e-7e6d1ef27b77'),
	(24,17,8,14,0,3,'2015-01-12 22:20:19','2015-01-12 22:20:19','0e7d6d46-0781-4611-9dd8-613c389b4715'),
	(25,17,8,23,0,4,'2015-01-12 22:20:19','2015-01-12 22:20:19','3e05eee7-23d9-4504-88a8-fce339fe2ae7'),
	(26,17,8,24,0,5,'2015-01-12 22:20:19','2015-01-12 22:20:19','63eb21a4-46e8-4389-9d73-f3077ba54032'),
	(27,17,8,22,0,6,'2015-01-12 22:20:19','2015-01-12 22:20:19','bf3d66cf-4466-44c8-8a55-70aacc92e964'),
	(28,18,9,16,0,1,'2015-01-12 22:56:19','2015-01-12 22:56:19','f728ae02-eb4a-4ca5-b7b8-fb00c901cfda'),
	(29,18,9,17,0,2,'2015-01-12 22:56:19','2015-01-12 22:56:19','9c48e0d3-48c1-446e-b786-b20c81a02065'),
	(30,18,9,18,0,3,'2015-01-12 22:56:19','2015-01-12 22:56:19','bef64acc-d865-46cf-9918-900e04e4d0a2'),
	(31,18,9,19,0,4,'2015-01-12 22:56:19','2015-01-12 22:56:19','31de5a0e-8189-4f29-98a9-29ef38742e49'),
	(32,18,9,20,0,5,'2015-01-12 22:56:19','2015-01-12 22:56:19','74bf819f-0d29-4dfb-a7f5-ac997d2a498f'),
	(33,18,9,21,0,6,'2015-01-12 22:56:19','2015-01-12 22:56:19','9888624f-49fe-432b-a9b4-695a3648ec2f');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Tag','2015-01-09 19:54:28','2015-01-09 19:54:28','9913f74d-6aec-4baf-8c89-fe1738ca9cd7'),
	(3,'Entry','2015-01-09 19:54:28','2015-01-09 19:54:28','da12ff4d-4bd5-42fe-80bb-16eb4b01be8e'),
	(5,'Entry','2015-01-09 19:54:29','2015-01-09 19:54:29','730f37af-d167-4279-a02c-ab502260b7d3'),
	(7,'GlobalSet','2015-01-09 22:23:45','2015-01-09 22:23:45','013596c1-2e6c-4afe-a76f-b3d30adf9fb1'),
	(10,'Asset','2015-01-12 18:44:48','2015-01-12 18:44:48','c7e52b2a-b65f-4fc1-b039-575d16684819'),
	(11,'Asset','2015-01-12 18:45:15','2015-01-12 18:45:15','9bd90926-5683-473e-9918-b4a2a8a4161c'),
	(12,'MatrixBlock','2015-01-12 18:50:20','2015-01-12 18:50:20','04347eaa-dbdf-42e7-b30e-57b3c8d36a1d'),
	(13,'Entry','2015-01-12 18:51:21','2015-01-12 18:51:21','a32b1074-f376-4bef-9091-0fa299763907'),
	(17,'Entry','2015-01-12 22:20:19','2015-01-12 22:20:19','98d68c1a-8feb-4014-89b4-93f683b91027'),
	(18,'MatrixBlock','2015-01-12 22:56:19','2015-01-12 22:56:19','394d8260-0a76-48d8-b3a6-f2a41b967f29'),
	(22,'Asset','2015-01-19 22:07:35','2015-01-19 22:07:35','03bd82e9-8de6-4f8c-a002-7761336ab55a');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,'Content',1,'2015-01-09 19:54:28','2015-01-09 19:54:28','90ed7755-cee4-4256-a840-09752632d34d'),
	(2,5,'Content',1,'2015-01-09 19:54:29','2015-01-09 19:54:29','ca19c749-dfd6-40df-97ad-c2b68de06b57'),
	(3,7,'Content',1,'2015-01-09 22:23:45','2015-01-09 22:23:45','7c8aa498-12f5-43f7-b075-3ea2ab9c26c0'),
	(5,12,'Content',1,'2015-01-12 18:50:20','2015-01-12 18:50:20','0cd30a96-09ab-4124-842b-3ac6b7969da2'),
	(6,13,'Page',1,'2015-01-12 18:51:21','2015-01-12 18:51:21','8dcec006-68e0-4c1f-8300-c94eec9f0423'),
	(8,17,'Wine',1,'2015-01-12 22:20:19','2015-01-12 22:20:19','52c7661f-43c6-4815-8134-875f97cc11fe'),
	(9,18,'Content',1,'2015-01-12 22:56:19','2015-01-12 22:56:19','0bfcb120-57a0-4cb2-a865-72c591bf899d');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2015-01-09 19:54:28','2015-01-09 19:54:28','693dd68f-c700-42e3-8f4c-3748df0c93d2'),
	(2,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"taggroup:1\"}','2015-01-09 19:54:28','2015-01-09 19:54:28','b8e7a0fc-5c93-47d4-93af-ccc8c587a862'),
	(3,2,'Primary Phone','primaryPhone','global','Primary Phone Number',0,'PlainText','{\"placeholder\":\"Primary Phone Number\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-09 22:17:48','2015-01-09 22:25:57','f2b95c6c-d26c-4fc9-bfab-0913d5689331'),
	(4,2,'Primary Email','primaryEmail','global','Primary Email Address',0,'PlainText','{\"placeholder\":\"Primary Email Address\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-09 22:18:05','2015-01-09 22:23:22','08cf3c15-4a05-4553-804d-69d394b95ef1'),
	(5,2,'Primary Address','primaryAddress','global','Primary Address',0,'PlainText','{\"placeholder\":\"Primary Address\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-09 22:18:24','2015-01-09 22:23:15','1681d44f-755c-4341-84e9-9010e25a81ca'),
	(6,3,'Page Subtitle','pageSubtitle','global','Main heading for a page',1,'PlainText','{\"placeholder\":\"Main heading for a page\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 18:32:03','2015-01-12 18:32:25','fb48fcec-b278-44bf-95e2-d24b02c0efd5'),
	(7,3,'Page Body','pageBody','global','Main content for a page',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-01-12 18:35:11','2015-01-12 18:35:11','50f7185e-5dc4-4a6e-8a59-2bafa2387da8'),
	(8,3,'Page Banner','pageBanner','global','Main banner for the page',0,'Matrix','{\"maxBlocks\":\"8\"}','2015-01-12 18:42:12','2015-01-12 18:50:20','ba23fb6d-0e41-482e-bdea-45e6d22859df'),
	(9,NULL,'Banner Headline','bannerHeadline','matrixBlockType:1','Title for banner',1,'PlainText','{\"placeholder\":\"Title for banner\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\"}','2015-01-12 18:42:12','2015-01-12 18:50:20','88e25a2e-0cc6-4751-94e4-eaf7cc817f03'),
	(10,NULL,'Banner Video','bannerVideo','matrixBlockType:1','Youtube ID for video',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 18:42:12','2015-01-12 18:50:20','80fabd89-daf1-4646-a56c-c61d6aabc34e'),
	(11,NULL,'Banner Image','bannerImage','matrixBlockType:1','Image for banner',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:2\"],\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\"}','2015-01-12 18:50:20','2015-01-12 18:50:20','5d6b5f47-28a0-42a4-86ab-c9cd5ab64355'),
	(12,3,'Page Image','pageImage','global','Image for page',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\"}','2015-01-12 18:50:50','2015-01-12 18:50:50','ffd1411e-5fb9-4a5c-b482-b69684570bd2'),
	(13,4,'Wine Description','wineDescription','global','Opening description for wine',1,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-01-12 22:13:47','2015-01-12 22:14:17','963f08d4-2d5a-444f-8f87-d3d25f0f41bf'),
	(14,4,'Wine Additional Details','wineAdditionalDetails','global','Additional details about wine',1,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-01-12 22:14:13','2015-01-12 22:14:13','810967f3-e345-4007-adac-b9d7338607c9'),
	(15,4,'Wine Specifications','wineSpecifications','global','Specifications for wine',0,'Matrix','{\"maxBlocks\":\"1\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','af3d768f-c52a-4d37-a418-8eaf51cd34ab'),
	(16,NULL,'Wine Type','wineType','matrixBlockType:2','Type of wine',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','0dfab56c-6ed2-4b53-93c5-fa3b1e7bfaa2'),
	(17,NULL,'Vineyard Location','vineyardLocation','matrixBlockType:2','Location of vineyard',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','352e983b-379a-4034-9eb6-f48b450b43ae'),
	(18,NULL,'Grapes','grapes','matrixBlockType:2','Type of grape',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','18bfa37b-5f6b-4f7d-9294-049e9c8a4cb4'),
	(19,NULL,'Exposition','exposition','matrixBlockType:2','Type of exposition',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','7f749800-a31f-4f44-9636-8d987cc66796'),
	(20,NULL,'Soil','soil','matrixBlockType:2','Type of soil',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','27422811-6dd1-4838-8a36-de6838968c46'),
	(21,NULL,'Vinification and Maturation','vinificationAndMaturation','matrixBlockType:2','Vinification and Maturation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-12 22:17:20','2015-01-12 22:56:19','1b360040-d8d0-4383-a996-2758782baa52'),
	(22,4,'Bottle Image','bottleImage','global','Image of bottle',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:3\"],\"defaultUploadLocationSource\":\"3\",\"defaultUploadLocationSubpath\":\"bottles\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"targetLocale\":\"\",\"limit\":\"1\"}','2015-01-12 22:17:58','2015-01-12 22:17:58','c2071ef5-4aa9-40ae-ba72-1a13900e6ecd'),
	(23,4,'Bottle Label Image','bottleLabelImage','global','Image for wine label only',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:3\"],\"defaultUploadLocationSource\":\"3\",\"defaultUploadLocationSubpath\":\"labels\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\"}','2015-01-12 22:18:48','2015-01-12 22:18:48','c2cb592c-e7ad-45d4-8faf-719938f38827'),
	(24,4,'Bottle Title Image','bottleTitleImage','global','Image for bottle title',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:3\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"title\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\"}','2015-01-12 22:19:28','2015-01-12 22:19:28','1bbdc48b-424a-44ad-b0dc-7024838db20b');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,'Contact Information','contactinformation',7,'2015-01-09 21:30:34','2015-01-09 22:23:45','46c1fa60-6416-4e37-b5ba-3acbefe798a1');

/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `build`, `schemaVersion`, `releaseDate`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `track`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'2.3',2625,'2.3.1','2015-01-06 22:37:09',2,'Poggio La Noce','http://craft.dev','UTC',1,0,'stable','2015-01-09 19:54:26','2015-01-09 21:40:22','e10de232-2b0d-4821-aa94-69e05258ff25');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_locales`;

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	('en_us',1,'2015-01-09 19:54:26','2015-01-09 19:54:26','b5c7a92a-4d6d-4269-9123-ac1d70becc69'),
	('it',2,'2015-01-09 21:40:33','2015-01-09 21:40:33','81fbf83e-4615-497c-8b16-e4a665ac69aa');

/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(8,6,8,1,1,NULL,'2015-01-12 19:02:11','2015-01-20 00:43:20','233f8a21-27d2-4aac-b8b8-e3ef598d2a7c'),
	(10,9,15,2,1,NULL,'2015-01-12 22:24:03','2015-01-19 23:58:39','66f59a2e-c1ca-4186-b2ef-56442e485415'),
	(14,13,15,2,1,NULL,'2015-01-12 23:28:52','2015-01-19 23:53:35','d172a16e-9767-40d5-9b2f-d657292a271d'),
	(17,16,15,2,1,NULL,'2015-01-12 23:36:06','2015-01-19 23:57:35','5f9fbe40-d196-4966-9dbb-c909bc7748bd'),
	(20,19,15,2,1,NULL,'2015-01-12 23:36:56','2015-01-19 23:54:50','16eefe84-723a-4f54-b31b-509f6ed76fc5'),
	(23,22,15,2,1,NULL,'2015-01-12 23:37:53','2015-01-19 23:59:58','cffcfd00-7569-4e1c-9918-e3ac2314da24'),
	(30,29,8,1,1,NULL,'2015-01-13 03:12:19','2015-01-20 21:50:39','6ef98596-c480-4c46-bf7b-70e9c648f823'),
	(31,29,8,1,2,NULL,'2015-01-13 03:12:19','2015-01-20 21:50:39','d8f866aa-2949-4f83-a34e-51820afc70bc'),
	(32,29,8,1,3,NULL,'2015-01-13 03:12:19','2015-01-20 21:50:39','1218eb69-06f9-436f-9ae9-0694475368b4'),
	(43,42,8,1,1,NULL,'2015-01-14 17:42:46','2015-01-20 22:18:04','b87422f3-8d70-46a4-9852-12516525a0a2'),
	(45,44,8,1,1,NULL,'2015-01-14 17:43:38','2015-01-20 22:25:13','5ac76f1c-f963-40b7-9e50-7903268902ab'),
	(47,46,8,1,1,NULL,'2015-01-14 17:44:34','2015-01-20 19:27:40','cbc1d417-9a27-4c4f-9f65-eeb530afe781'),
	(49,48,8,1,1,NULL,'2015-01-14 17:46:00','2015-01-14 17:51:00','6a7a8e6d-762b-4368-af04-a3ef52ec4079'),
	(70,29,8,1,4,NULL,'2015-01-20 01:15:59','2015-01-20 21:50:39','4658407c-bac9-4cc4-ae7c-90fe561909f5'),
	(71,29,8,1,5,NULL,'2015-01-20 01:15:59','2015-01-20 21:50:39','029e5d87-8ce1-4e07-b65f-f96d2c7c0b3b');

/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,12,'Banner','banner',1,'2015-01-12 18:42:12','2015-01-12 18:50:20','d4a61790-9acf-457d-9aaa-86029b03444f'),
	(2,15,18,'Specifications','specifications',1,'2015-01-12 22:17:20','2015-01-12 22:56:19','b272b756-582c-4a5d-aba4-c55b944bc1b4');

/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixcontent_pagebanner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_pagebanner`;

CREATE TABLE `craft_matrixcontent_pagebanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_banner_bannerHeadline` text COLLATE utf8_unicode_ci,
  `field_banner_bannerVideo` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_pagebanner_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_pagebanner_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_pagebanner_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_pagebanner_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_matrixcontent_pagebanner` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_pagebanner` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_pagebanner` (`id`, `elementId`, `locale`, `field_banner_bannerHeadline`, `field_banner_bannerVideo`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,'en_us','Driven by our love for great wine, we strive to produce the best possible wine for this Terroir.','veUluy0zAzU','2015-01-12 19:02:11','2015-01-20 00:43:20','1ea9c3f7-30b2-4ef0-8f9b-7d1b678a4927'),
	(2,8,'it','Forget about it.','veUluy0zAzU','2015-01-12 19:02:11','2015-01-12 20:07:40','48d455f5-8ab2-4978-8efa-3b3061f8b332'),
	(3,30,'en_us','A harmonious union between man and nature to yield a beautiful wine','a6THrlLVopw','2015-01-13 03:12:19','2015-01-20 21:50:39','026fa915-da60-4cf6-9dcd-1138b4b42f09'),
	(4,30,'it','Slide 1 Text','','2015-01-13 03:12:19','2015-01-13 03:12:19','53d771a3-9c7e-49a7-be2f-890e7966a4a7'),
	(5,31,'en_us','A harmonious union between man and nature to yield a beautiful wine','','2015-01-13 03:12:19','2015-01-20 21:50:39','a1c16b78-6077-4cf2-a9b8-bd44077e4331'),
	(6,31,'it','Slide 2 Text','','2015-01-13 03:12:19','2015-01-13 03:12:19','860320af-1ef4-41cb-975d-493f0f3e5381'),
	(7,32,'en_us','A harmonious union between man and nature to yield a beautiful wine','','2015-01-13 03:12:19','2015-01-20 21:50:39','374ab29f-3f5b-4d44-933a-2869fed972ad'),
	(8,32,'it','Slide 3 Text','','2015-01-13 03:12:19','2015-01-13 03:12:19','e3ac4d4a-3aea-4059-af61-0ffb032c5daf'),
	(9,43,'en_us','Learn More About Us','','2015-01-14 17:42:46','2015-01-20 22:18:04','9bfbc7a3-996e-4737-aa9b-cdc0b4206fca'),
	(10,43,'it','This is the about page','','2015-01-14 17:42:46','2015-01-14 17:42:46','7607f01d-8314-4719-9956-1cac23cf7f2d'),
	(11,45,'en_us','The Vinyard','','2015-01-14 17:43:38','2015-01-20 22:25:13','aabab623-6146-430f-be65-070cae814476'),
	(12,45,'it','Vines everywhere','','2015-01-14 17:43:38','2015-01-14 17:43:38','c1171635-cb76-412d-a6f5-974470a10393'),
	(13,47,'en_us','A dedicated olive press that allows for immediate pressing, right at the estate, preserving the intense flavor and full fragrance of the olive oil.','','2015-01-14 17:44:33','2015-01-20 19:27:40','c1450f84-ccfd-4ab4-96fe-3f8f50284ac8'),
	(14,47,'it','Olive oil for everyone','','2015-01-14 17:44:33','2015-01-14 17:44:33','49367372-0984-4566-8bbf-13e109268673'),
	(15,49,'en_us','Get in touch','','2015-01-14 17:46:00','2015-01-14 17:51:00','1dcf1ef2-dfe5-43c1-9822-fe720f1e436d'),
	(16,49,'it','Get in touch','','2015-01-14 17:46:00','2015-01-14 17:46:00','5351e3c5-91f0-4abe-8672-45b3a1630c6a'),
	(17,70,'en_us','A harmonious union between man and nature to yield a beautiful wine','','2015-01-20 01:15:59','2015-01-20 21:50:39','ba352f0b-bc69-46d2-ad2d-3b1f9b92a0bf'),
	(18,70,'it','Slide 4','','2015-01-20 01:15:59','2015-01-20 01:15:59','819391a7-6f10-4a2b-a3b4-bfcc7eeced8b'),
	(19,71,'en_us','A harmonious union between man and nature to yield a beautiful wine','','2015-01-20 01:15:59','2015-01-20 21:50:39','f95f8c56-07c6-41b6-9ee9-d4e12d6cd028'),
	(20,71,'it','Slide 5','','2015-01-20 01:15:59','2015-01-20 01:15:59','1756be87-c922-4d8f-846a-3c2ab15ceb5f');

/*!40000 ALTER TABLE `craft_matrixcontent_pagebanner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixcontent_winespecifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_winespecifications`;

CREATE TABLE `craft_matrixcontent_winespecifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_specifications_wineType` text COLLATE utf8_unicode_ci,
  `field_specifications_vineyardLocation` text COLLATE utf8_unicode_ci,
  `field_specifications_grapes` text COLLATE utf8_unicode_ci,
  `field_specifications_exposition` text COLLATE utf8_unicode_ci,
  `field_specifications_soil` text COLLATE utf8_unicode_ci,
  `field_specifications_vinificationAndMaturation` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_winespecifications_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_winespecifications_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_winespecifications_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_winespecifications_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_matrixcontent_winespecifications` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_winespecifications` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_winespecifications` (`id`, `elementId`, `locale`, `field_specifications_wineType`, `field_specifications_vineyardLocation`, `field_specifications_grapes`, `field_specifications_exposition`, `field_specifications_soil`, `field_specifications_vinificationAndMaturation`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,10,'en_us','Red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of Alberese and Galestro limestones','After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.','2015-01-12 22:24:03','2015-01-19 23:58:39','cbdd5697-166f-4d08-8485-409ce3acd0e3'),
	(2,10,'it','Gigío red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of albarese and galestro limestones','After careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in a mix of new and used French oak barriques for 12 to 18 months with further 12 months ageing in bottle.','2015-01-12 22:24:03','2015-01-19 23:58:39','453b8cd8-8564-4c99-b3f1-cfa24b0df7c6'),
	(3,14,'en_us','Red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of Albarese and Galestro limestones','The Gigetto grapes are picked first as we are trying to make a fresh fruit driven wine with less emphasis on concentration. After cluster and berry selection, vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in oak \"botti\" or large size barrels (1000L) for 3 to 6 months with further 6 month ageing in bottle.','2015-01-12 23:28:52','2015-01-19 23:53:35','3b698afc-0cbf-4067-80bd-4aa0885ef206'),
	(4,14,'it','Gigío red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of albarese and galestro limestones','The Gigetto grapes are picked first as we are trying to make a fresh fruit driven wine with less emphasis on concentration. After cluster and berry selection, vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in oak \"botti\" or large size barrels (1000L) for 3 to 6 months with further 6 month ageing in bottle.','2015-01-12 23:28:52','2015-01-19 23:53:35','91c5f12e-d78b-49e0-bc69-c62a7c1728f5'),
	(5,17,'en_us','Red Wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese','South South West','Mixture of Alberese and Galestro limestones','The Gigino grapes are carefully selected from specific segments of the vineyard where the soil yields a very classic elegant style Sangiovese. After cluster and berry selection, vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in oak \"botti\" or large size barrels (1000L) for 12 months with further 12 month ageing in bottle.','2015-01-12 23:36:06','2015-01-19 23:57:35','4e63bcb5-948f-4f31-9818-1be8f6a5ea0f'),
	(6,17,'it','Gigío red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of albarese and galestro limestones','The Gigino grapes are carefully selected from specific segments of the vineyard where the soil yields a very classic elegant style Sangiovese. After cluster and berry selection, vinification occurs in temperature controlled stainless steel vats with indigenous yeast. Ageing occurs in oak \"botti\" or large size barrels (1000L) for 12 months with further 12 month ageing in bottle.','2015-01-12 23:36:06','2015-01-19 23:57:35','83feca55-f438-4e70-8146-7128d6f492e1'),
	(7,20,'en_us','Rosé Wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese','South South West','Mixture of Alberese and Galestro limestones','The Rosé grapes are the first to be harvested and we look to pick grapes with lower maturity level and less alcohol potential. The grape clusters are pressed whole immediately. The juice is then left to ferment in a steel vat at cooler temperatures. In parallel some of the bled off juice from Gigiò is also fermented separately. The two batches will then be blended together to build the final Rosé wine. The wine will rest in stainless steel vats for a few months at cooler temperatures (8 to 10 degrees celcius) until it is bottled. It releases roughly 6-9 months later.','2015-01-12 23:36:56','2015-01-19 23:54:50','a6993bd4-d26c-4205-80fb-a701d7276439'),
	(8,20,'it','Gigío red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of albarese and galestro limestones','The Rosé grapes are the first to be harvested and we look to pick grapes with lower maturity level and less alcohol potential. The grape clusters are pressed whole immediately. The juice is then left to ferment in a steel vat at cooler temperatures. In parallel some of the bled off juice from Gigiò is also fermented separately. The two batches will then be blended together to build the final Rosé wine. The wine will rest in stainless steel vats for a few months at cooler temperatures (8 to 10 degrees celcius) until it is bottled. It releases roughly 6-9 months later.','2015-01-12 23:36:56','2015-01-19 23:54:50','7e200953-0f93-44f4-8b29-51d0536e54ff'),
	(9,23,'en_us','Red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of albarese and galestro limestones','Coming soon!','2015-01-12 23:37:53','2015-01-19 23:59:58','301dde07-2e97-4e15-bc06-412bf518141a'),
	(10,23,'it','Gigío red wine IGT Tuscany','Poggio La Noce, Fiesole','Sangiovese and Teroldego','South South West','Mixture of albarese and galestro limestones','Coming soon!','2015-01-12 23:37:53','2015-01-19 23:59:58','f34fc1e1-9492-4b39-bb8b-abf53ec72a2e');

/*!40000 ALTER TABLE `craft_matrixcontent_winespecifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'m000000_000000_base','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','1a73d04b-0c9f-4174-a259-557123d63676'),
	(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','dc5157a1-c2d5-40ae-a46f-d97abbfa258c'),
	(3,NULL,'m140815_000001_add_format_to_transforms','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','95cc334b-9519-4687-b08d-d908e9c0c6a5'),
	(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','03e06bc3-248d-4581-99cf-a43a77d272dc'),
	(5,NULL,'m140829_000001_single_title_formats','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','82fba3a5-32bb-4dc7-ba97-5d12ccda4e0a'),
	(6,NULL,'m140831_000001_extended_cache_keys','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','65af5465-2dae-43bc-afaf-930a048228d1'),
	(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','dfc32c1b-78f7-421e-9f9f-0563262ac631'),
	(8,NULL,'m141008_000001_elements_index_tune','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','2db76dac-0b48-4d80-88b6-62496cba33a0'),
	(9,NULL,'m141009_000001_assets_source_handle','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','53d70b04-0a5a-4634-ad5f-29ea695f89b3'),
	(10,NULL,'m141024_000001_field_layout_tabs','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','77b75e36-1c68-43a4-afe4-2960afb3e2a5'),
	(11,NULL,'m141030_000001_drop_structure_move_permission','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','e7725cc5-53cd-4503-aec6-839ac0981357'),
	(12,NULL,'m141103_000001_tag_titles','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','0b2238b3-6abe-4273-995d-a9e82cc0d153'),
	(13,NULL,'m141109_000001_user_status_shuffle','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','90db2128-9a04-4d91-9611-b752bd5d7ef3'),
	(14,NULL,'m141126_000001_user_week_start_day','2015-01-09 19:54:26','2015-01-09 19:54:26','2015-01-09 19:54:26','ce7388b0-53b9-4bf8-8714-ab30893a0038');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'ContactForm','1.4',1,'{\"toEmail\":\"andy@bletchley.co\",\"prependSender\":\"On behalf of\",\"prependSubject\":\"New message from Poggio La Noce\",\"allowAttachments\":\"\",\"honeypotField\":\"location\"}','2015-01-09 22:37:43','2015-01-09 22:37:43','2015-01-14 23:11:25','eb793cd5-eefe-43a2-bf8d-09ca08427e09');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_rackspaceaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_rackspaceaccess`;

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceLocale`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(81,23,13,NULL,15,1,'2015-01-19 23:53:35','2015-01-19 23:53:35','a2ad40a5-0340-4f4c-9164-bf139935af64'),
	(82,22,13,NULL,57,1,'2015-01-19 23:53:35','2015-01-19 23:53:35','a17bd7c3-fdab-4479-960c-db4370751f59'),
	(83,23,19,NULL,21,1,'2015-01-19 23:54:50','2015-01-19 23:54:50','c527142b-28ab-4333-ac17-1ddcff19c398'),
	(84,22,19,NULL,59,1,'2015-01-19 23:54:50','2015-01-19 23:54:50','81fb6184-2869-4646-9a2d-9e51998fdc74'),
	(85,23,16,NULL,18,1,'2015-01-19 23:57:35','2015-01-19 23:57:35','80a80a5b-b045-4421-9c4c-2a86baa73f0b'),
	(86,22,16,NULL,56,1,'2015-01-19 23:57:35','2015-01-19 23:57:35','29b7bf38-1f59-4e2b-a889-306df02fa0bf'),
	(87,23,9,NULL,12,1,'2015-01-19 23:58:39','2015-01-19 23:58:39','ca9354ac-f6d2-4760-bc53-47f78529d077'),
	(88,22,9,NULL,11,1,'2015-01-19 23:58:39','2015-01-19 23:58:39','2504b5ec-7697-4af8-9d00-5c3bbb9dda10'),
	(89,23,22,NULL,24,1,'2015-01-19 23:59:58','2015-01-19 23:59:58','d393d41c-092b-4def-864a-2cab0f4c5817'),
	(90,22,22,NULL,60,1,'2015-01-19 23:59:58','2015-01-19 23:59:58','3fb861b1-63a4-40a6-8073-6c49db91e48c'),
	(99,11,8,NULL,7,1,'2015-01-20 00:43:20','2015-01-20 00:43:20','a663a23d-55a5-411c-bd60-09d320b11d5a'),
	(100,12,6,NULL,5,1,'2015-01-20 00:43:20','2015-01-20 00:43:20','0d107021-ab9a-46a8-9491-c537aacc0a94'),
	(119,11,47,NULL,50,1,'2015-01-20 19:27:40','2015-01-20 19:27:40','cf978778-ef3f-4686-9d08-384d990cf294'),
	(120,12,46,NULL,62,1,'2015-01-20 19:27:40','2015-01-20 19:27:40','b662540f-af7f-4cea-8430-1a9ea1070fbd'),
	(121,11,30,NULL,65,1,'2015-01-20 21:50:39','2015-01-20 21:50:39','5dabf9f0-9b4c-40f3-a1e5-a9e442f1c9ea'),
	(122,11,31,NULL,66,1,'2015-01-20 21:50:39','2015-01-20 21:50:39','852a0913-aee3-46af-ab85-fea06bbdbb99'),
	(123,11,32,NULL,67,1,'2015-01-20 21:50:39','2015-01-20 21:50:39','2aaa7066-5f0b-4e4b-a656-18d3146c9d84'),
	(124,11,70,NULL,68,1,'2015-01-20 21:50:39','2015-01-20 21:50:39','f9fc75a1-93d9-4283-9ab6-7c44a4620e73'),
	(125,11,71,NULL,69,1,'2015-01-20 21:50:39','2015-01-20 21:50:39','e31ad03b-db1d-4fbc-941b-a2fdbea14ea9'),
	(126,11,43,NULL,52,1,'2015-01-20 22:18:04','2015-01-20 22:18:04','75737924-38ae-4a0c-b934-9cf7cfc1c3de'),
	(127,12,42,NULL,63,1,'2015-01-20 22:18:04','2015-01-20 22:18:04','e4739965-d3ee-44ea-a670-4ec07be0aa18'),
	(130,11,45,NULL,53,1,'2015-01-20 22:25:13','2015-01-20 22:25:13','059ffbcf-f5ec-4641-bb8a-04acd1fa3578'),
	(131,12,44,NULL,64,1,'2015-01-20 22:25:13','2015-01-20 22:25:13','9a4c0d07-f3f2-4d84-a9fb-466db82acde0');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_routes`;

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;

INSERT INTO `craft_routes` (`id`, `locale`, `urlParts`, `urlPattern`, `template`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'[\"philosophy\"]','philosophy','standard_page',1,'2015-01-12 19:49:47','2015-01-12 19:49:47','7a5fc691-891c-4c35-beba-9a93c53ef5b9'),
	(2,NULL,'[\"about\"]','about','standard_page',2,'2015-01-12 19:51:42','2015-01-12 19:51:42','168bc5c1-fdde-42a7-86f1-66fbef49c2d7'),
	(3,NULL,'[\"vineyard\"]','vineyard','standard_page',3,'2015-01-12 19:52:00','2015-01-12 19:52:00','bcb07168-a046-4c34-92e8-a72531ab2184'),
	(4,NULL,'[\"olive-oil\"]','olive\\-oil','standard_page',4,'2015-01-12 19:53:33','2015-01-12 19:53:33','fc52e488-5735-4bd8-aab2-73c7f6a4c5a7');

/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`)
VALUES
	(5,'filename',0,'en_us',' philosophy image jpg '),
	(5,'extension',0,'en_us',' jpg '),
	(5,'kind',0,'en_us',' image '),
	(5,'slug',0,'en_us',' philosophy image '),
	(5,'title',0,'en_us',' philosophy image '),
	(5,'filename',0,'it',' philosophy image jpg '),
	(5,'extension',0,'it',' jpg '),
	(5,'kind',0,'it',' image '),
	(5,'slug',0,'it',' philosophy image '),
	(5,'title',0,'it',' philosophy image '),
	(7,'filename',0,'en_us',' philosophy banner jpg '),
	(7,'extension',0,'en_us',' jpg '),
	(7,'kind',0,'en_us',' image '),
	(7,'slug',0,'en_us',' philosophy banner '),
	(7,'title',0,'en_us',' philosophy banner '),
	(7,'filename',0,'it',' philosophy banner jpg '),
	(7,'extension',0,'it',' jpg '),
	(7,'kind',0,'it',' image '),
	(7,'slug',0,'it',' philosophy banner '),
	(7,'title',0,'it',' philosophy banner '),
	(12,'filename',0,'en_us',' gigio art jpg '),
	(12,'extension',0,'en_us',' jpg '),
	(12,'kind',0,'en_us',' image '),
	(12,'slug',0,'en_us',' gigio art '),
	(12,'title',0,'en_us',' gigio art '),
	(12,'filename',0,'it',' gigio art jpg '),
	(12,'extension',0,'it',' jpg '),
	(12,'kind',0,'it',' image '),
	(12,'slug',0,'it',' gigio art '),
	(12,'title',0,'it',' gigio art '),
	(11,'filename',0,'en_us',' gigio bottle png '),
	(11,'extension',0,'en_us',' png '),
	(11,'kind',0,'en_us',' image '),
	(11,'slug',0,'en_us',' gigio bottle '),
	(11,'title',0,'en_us',' gigio bottle '),
	(11,'filename',0,'it',' gigio bottle png '),
	(11,'extension',0,'it',' png '),
	(11,'kind',0,'it',' image '),
	(11,'slug',0,'it',' gigio bottle '),
	(11,'title',0,'it',' gigio bottle '),
	(15,'filename',0,'en_us',' gigetto art jpg '),
	(15,'extension',0,'en_us',' jpg '),
	(15,'kind',0,'en_us',' image '),
	(15,'slug',0,'en_us',' gigetto art '),
	(15,'title',0,'en_us',' gigetto art '),
	(15,'filename',0,'it',' gigetto art jpg '),
	(15,'extension',0,'it',' jpg '),
	(15,'kind',0,'it',' image '),
	(15,'slug',0,'it',' gigetto art '),
	(15,'title',0,'it',' gigetto art '),
	(18,'filename',0,'en_us',' gigeno art jpg '),
	(18,'extension',0,'en_us',' jpg '),
	(18,'kind',0,'en_us',' image '),
	(18,'slug',0,'en_us',' gigeno art '),
	(18,'title',0,'en_us',' gigeno art '),
	(18,'filename',0,'it',' gigeno art jpg '),
	(18,'extension',0,'it',' jpg '),
	(18,'kind',0,'it',' image '),
	(18,'slug',0,'it',' gigeno art '),
	(18,'title',0,'it',' gigeno art '),
	(21,'filename',0,'en_us',' pinko pallino art jpg '),
	(21,'extension',0,'en_us',' jpg '),
	(21,'kind',0,'en_us',' image '),
	(21,'slug',0,'en_us',' pinko pallino art '),
	(21,'title',0,'en_us',' pinko pallino art '),
	(21,'filename',0,'it',' pinko pallino art jpg '),
	(21,'extension',0,'it',' jpg '),
	(21,'kind',0,'it',' image '),
	(21,'slug',0,'it',' pinko pallino art '),
	(21,'title',0,'it',' pinko pallino art '),
	(24,'filename',0,'en_us',' paonazzo art jpg '),
	(24,'extension',0,'en_us',' jpg '),
	(24,'kind',0,'en_us',' image '),
	(24,'slug',0,'en_us',' paonazzo art '),
	(24,'title',0,'en_us',' paonazzo art '),
	(24,'filename',0,'it',' paonazzo art jpg '),
	(24,'extension',0,'it',' jpg '),
	(24,'kind',0,'it',' image '),
	(24,'slug',0,'it',' paonazzo art '),
	(24,'title',0,'it',' paonazzo art '),
	(26,'filename',0,'en_us',' slide1 gif '),
	(26,'extension',0,'en_us',' gif '),
	(26,'kind',0,'en_us',' image '),
	(26,'slug',0,'en_us',' slide1 '),
	(26,'title',0,'en_us',' slide1 '),
	(26,'filename',0,'it',' slide1 gif '),
	(26,'extension',0,'it',' gif '),
	(26,'kind',0,'it',' image '),
	(26,'slug',0,'it',' slide1 '),
	(26,'title',0,'it',' slide1 '),
	(27,'filename',0,'en_us',' slide2 gif '),
	(27,'extension',0,'en_us',' gif '),
	(27,'kind',0,'en_us',' image '),
	(27,'slug',0,'en_us',' slide2 '),
	(27,'title',0,'en_us',' slide2 '),
	(27,'filename',0,'it',' slide2 gif '),
	(27,'extension',0,'it',' gif '),
	(27,'kind',0,'it',' image '),
	(27,'slug',0,'it',' slide2 '),
	(27,'title',0,'it',' slide2 '),
	(28,'filename',0,'en_us',' slide3 gif '),
	(28,'extension',0,'en_us',' gif '),
	(28,'kind',0,'en_us',' image '),
	(28,'slug',0,'en_us',' slide3 '),
	(28,'title',0,'en_us',' slide3 '),
	(28,'filename',0,'it',' slide3 gif '),
	(28,'extension',0,'it',' gif '),
	(28,'kind',0,'it',' image '),
	(28,'slug',0,'it',' slide3 '),
	(28,'title',0,'it',' slide3 '),
	(50,'filename',0,'en_us',' olive_oil_banner_photo_02 jpg '),
	(50,'extension',0,'en_us',' jpg '),
	(50,'kind',0,'en_us',' image '),
	(50,'slug',0,'en_us',' olive oil banner photo 02 '),
	(50,'title',0,'en_us',' olive oil banner photo 02 '),
	(50,'filename',0,'it',' olive_oil_banner_photo_02 jpg '),
	(50,'extension',0,'it',' jpg '),
	(50,'kind',0,'it',' image '),
	(50,'slug',0,'it',' olive oil banner photo 02 '),
	(50,'title',0,'it',' olive oil banner photo 02 '),
	(52,'filename',0,'en_us',' about jpg '),
	(52,'extension',0,'en_us',' jpg '),
	(52,'kind',0,'en_us',' image '),
	(52,'slug',0,'en_us',' about '),
	(52,'title',0,'en_us',' about '),
	(52,'filename',0,'it',' about jpg '),
	(52,'extension',0,'it',' jpg '),
	(52,'kind',0,'it',' image '),
	(52,'slug',0,'it',' about '),
	(52,'title',0,'it',' about '),
	(53,'filename',0,'en_us',' vineyard_banner_photo jpg '),
	(53,'extension',0,'en_us',' jpg '),
	(53,'kind',0,'en_us',' image '),
	(53,'slug',0,'en_us',' vineyard banner photo '),
	(53,'title',0,'en_us',' vineyard banner photo '),
	(53,'filename',0,'it',' vineyard_banner_photo jpg '),
	(53,'extension',0,'it',' jpg '),
	(53,'kind',0,'it',' image '),
	(53,'slug',0,'it',' vineyard banner photo '),
	(53,'title',0,'it',' vineyard banner photo '),
	(54,'filename',0,'en_us',' wine banner jpg '),
	(54,'extension',0,'en_us',' jpg '),
	(54,'kind',0,'en_us',' image '),
	(54,'slug',0,'en_us',' wine banner '),
	(54,'title',0,'en_us',' wine banner '),
	(54,'filename',0,'it',' wine banner jpg '),
	(54,'extension',0,'it',' jpg '),
	(54,'kind',0,'it',' image '),
	(54,'slug',0,'it',' wine banner '),
	(54,'title',0,'it',' wine banner '),
	(55,'filename',0,'en_us',' paonazzo bottle png '),
	(55,'extension',0,'en_us',' png '),
	(55,'kind',0,'en_us',' image '),
	(55,'slug',0,'en_us',' paonazzo bottle '),
	(55,'title',0,'en_us',' paonazzo bottle '),
	(55,'filename',0,'it',' paonazzo bottle png '),
	(55,'extension',0,'it',' png '),
	(55,'kind',0,'it',' image '),
	(55,'slug',0,'it',' paonazzo bottle '),
	(55,'title',0,'it',' paonazzo bottle '),
	(2,'slug',0,'en_us',' homepage '),
	(2,'title',0,'en_us',' welcome to poggia dev '),
	(2,'field',1,'en_us',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon poggia dev will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
	(3,'slug',0,'en_us',' we just installed craft '),
	(3,'title',0,'en_us',' we just installed craft '),
	(3,'field',1,'en_us',' craft is the cms that s powering poggia dev it s beautiful powerful flexible and easy to use and it s made by pixel tonic we can t wait to dive in and see what it s capable of this is even more captivating content which you couldn t see on the news index page because it was entered after a page break and the news index template only likes to show the content on the first page craft a nice alternative to word if you re making a website '),
	(3,'field',2,'en_us',''),
	(6,'slug',0,'en_us',' philosophy '),
	(6,'title',0,'en_us',' philosophy '),
	(6,'field',6,'en_us',' our process '),
	(6,'field',7,'en_us',' our work begins at the vineyardwe are driven by our love for great wine and we set out from the very beginning with an uncompromising eye for detail to produce the most beautiful healthy grapes thus yielding the best possible wine this terroir can enable our commitment to achieve excellence begins in the vineyard where we tend to each vine individually passing through the vineyard row by row several times each week weeding and hoeing pruning cutting back leaves and fruit thinning grape bunches and constantly monitoring the health of the berries our dedication carries over to the cellarthe same level of dedication and focus carries over to the cellar where the wine is made we harvest manually and carry the fruit in small trays to the destemmer even before the fruit goes to the destemmer enzo performs a selection of the grape clusters prying open each cluster to check for immature berries and imperfections that can develop inside of each closed cluster after the destemming process the individual berries roll onto a sorting table where several people check for additional berry imperfections only perfect fruit will make it to the fermentation tanks this is for all the wines we produce not just our top wine in addition we use only the best equipment available for example our bucher destemmer detaches the berries from the stems using rubber revolving arms to allow for the berries to remain virtually intact so that we are able to perform an effective selection by hand on the sorting table fermentation occurs naturally relying on indigenous yeast present on the skins all aspects of vinification that take place during and after fermentation are performed in an un intrusive manner whether we do pump overs or pressing of the must after fermentation for aging the juice is transferred to barriques from the best suppliers in france typically french oak medium toast fine grain with a mixture of both new and used barriques and botti further aging will occur in bottles between 6 months to a year depending on the type of wine this type of uncompromising detailed work is only possible because our estate is very small allowing us to put great focus on the quality of what we produce working on such a small human dimension scale allows our small team of three people claire enzo and roberto to be 100% devoted to this vineyard the land and the resulting great products that can derive from it '),
	(6,'field',8,'en_us',' driven by our love for great wine we strive to produce the best possible wine for this terroir philosophy banner veuluy0zazu '),
	(6,'field',12,'en_us',' philosophy image '),
	(6,'slug',0,'it',' philosophy '),
	(6,'title',0,'it',' philosophy '),
	(6,'field',6,'it',' our proccezzzo '),
	(6,'field',7,'it',' our work begins at the vineyardwe are driven by our love for great wine and we set out from the very beginning with an uncompromising eye for detail to produce the most beautiful healthy grapes thus yielding the best possible wine this terroir can enable our commitment to achieve excellence begins in the vineyard where we tend to each vine individually passing through the vineyard row by row several times each week weeding and hoeing pruning cutting back leaves and fruit thinning grape bunches and constantly monitoring the health of the berries our dedication carries over to the cellarthe same level of dedication and focus carries over to the cellar where the wine is made we harvest manually and carry the fruit in small trays to the destemmer even before the fruit goes to the destemmer enzo performs a selection of the grape clusters prying open each cluster to check for immature berries and imperfections that can develop inside of each closed cluster after the destemming process the individual berries roll onto a sorting table where several people check for additional berry imperfections only perfect fruit will make it to the fermentation tanks this is for all the wines we produce not just our top wine in addition we use only the best equipment available for example our bucher destemmer detaches the berries from the stems using rubber revolving arms to allow for the berries to remain virtually intact so that we are able to perform an effective selection by hand on the sorting table fermentation occurs naturally relying on indigenous yeast present on the skins all aspects of vinification that take place during and after fermentation are performed in an un intrusive manner whether we do pump overs or pressing of the must after fermentation for aging the juice is transferred to barriques from the best suppliers in france typically french oak medium toast fine grain with a mixture of both new and used barriques and botti further aging will occur in bottles between 6 months to a year depending on the type of wine this type of uncompromising detailed work is only possible because our estate is very small allowing us to put great focus on the quality of what we produce working on such a small human dimension scale allows our small team of three people claire enzo and roberto to be 100% devoted to this vineyard the land and the resulting great products that can derive from it '),
	(6,'field',8,'it',' forget about it philosophy banner veuluy0zazu '),
	(6,'field',12,'it',' philosophy image '),
	(9,'slug',0,'en_us',' gigio '),
	(9,'title',0,'en_us',' gigio '),
	(9,'field',13,'en_us',' gigio is the estate s first born and flagship wine it is a blend of sangiovese 90% and teroldego 10% aged for three years before release it is the product of the most mature and fully developed fruit in the vineyard we pull all the stops for this wine and it shows in the glass it is a complex age worthy wine with deep colors and lively fruits with persistent acidity and finish we like to think of it as a wine for meditation '),
	(9,'field',15,'en_us',' south south west sangiovese and teroldego mixture of alberese and galestro limestones poggio la noce fiesole after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle red wine igt tuscany '),
	(9,'field',14,'en_us',' altitude 800 ft elavation 250 meters above sea levelvineyard size 5 acresyear planted partly in 2000 and partly in 2006training system spur pruned cordon for the sangiovese and guyot for the teroldegoharvest typically end of september to the first ten days of october depending on the seasons for the sangiovese the teroldego grapes tend to ripen earlier and are harvested earlier around the 20th of september the gigio sangiovese grapes benefit from the most hang time allowing for greater phenological maturity they are handpicked and brought immediately to the cellar for further selection ageing the wine will age in french oak barriques 225l each for 12 months to 18 months depending on the year our barriques come from some of the best tonneleries in france and are typically fine grain medium toast we use a mixture of new and used barriques to avoid excessive wood accent following the aging in barriques the wine is further aged in bottle for another year bottles produced 3000 bottles alcohol 13% to 14%potential cellaring 15 years '),
	(9,'field',23,'en_us',' gigio art '),
	(9,'field',24,'en_us',''),
	(9,'field',22,'en_us',' gigio bottle '),
	(9,'slug',0,'it',' gigio '),
	(9,'title',0,'it',' gigio '),
	(9,'field',13,'it',' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
	(9,'field',15,'it',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle gigio red wine igt tuscany '),
	(9,'field',14,'it',' sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur '),
	(9,'field',23,'it',' gigio art '),
	(9,'field',24,'it',''),
	(9,'field',22,'it',' gigio bottle '),
	(13,'slug',0,'en_us',' gigetto '),
	(13,'title',0,'en_us',' gigetto '),
	(13,'field',13,'en_us',' we think of it as the little brother of gigio it is a wine of surprising immediacy while still offering plenty of experiences to the nose and palate gigetto was born out of our own wish to drink a pleasant genuine wine yet with exceptional fruit and easier drinkability gigetto is released a year earlier than gigio and typically ages in large size botte only a few months '),
	(13,'field',15,'en_us',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole the gigetto grapes are picked first as we are trying to make a fresh fruit driven wine with less emphasis on concentration after cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in oak botti or large size barrels 1000l for 3 to 6 months with further 6 month ageing in bottle red wine igt tuscany '),
	(13,'field',14,'en_us',''),
	(13,'field',23,'en_us',' gigetto art '),
	(13,'field',24,'en_us',''),
	(13,'field',22,'en_us',' gigetto bottle '),
	(13,'slug',0,'it',' gigio '),
	(13,'title',0,'it',' gigio '),
	(13,'field',13,'it',' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
	(13,'field',15,'it',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle gigio red wine igt tuscany '),
	(13,'field',14,'it',' sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur '),
	(13,'field',23,'it',' gigetto art '),
	(13,'field',24,'it',''),
	(13,'field',22,'it',''),
	(16,'slug',0,'en_us',' gigino '),
	(16,'title',0,'en_us',' gigino '),
	(16,'field',13,'en_us',' this might be considered gigetto s twin brother except for the fact that gigino is sangiovese in purezza meaning 100% sangiovese with no blending of other grape varietals this wine came about because we noticed that some segments of the vineyard were especially well suited for sangiovese yielding a very classic stile sangiovese the sangiovese fruit from these segments of the vineyard produce a wine with perfect balance freshness and elegance '),
	(16,'field',15,'en_us',' south south west sangiovese mixture of alberese and galestro limestones poggio la noce fiesole the gigino grapes are carefully selected from specific segments of the vineyard where the soil yields a very classic elegant style sangiovese after cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in oak botti or large size barrels 1000l for 12 months with further 12 month ageing in bottle red wine igt tuscany '),
	(16,'field',14,'en_us',' sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur '),
	(16,'field',23,'en_us',' gigeno art '),
	(16,'field',24,'en_us',''),
	(16,'field',22,'en_us',' gigino bottle '),
	(16,'slug',0,'it',' gigio '),
	(16,'title',0,'it',' gigetto '),
	(16,'field',13,'it',' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
	(16,'field',15,'it',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle gigio red wine igt tuscany '),
	(16,'field',14,'it',' sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur '),
	(16,'field',23,'it',' gigeno art '),
	(16,'field',24,'it',''),
	(16,'field',22,'it',''),
	(19,'slug',0,'en_us',' pallino '),
	(19,'title',0,'en_us',' pinko pallino '),
	(19,'field',13,'en_us',' is a rose bottling produced from a blend of both early harvested sangiovese fruit and the bleeding off part of the juice from the later harvested gigio fruit bleeding off some of the gigio juice allows us to achieve higher concentration for the gigio final wine the quality of the fruit for this rose wine is therefore of the highest quality we produce it is a gorgeous radiant pink grapefruit color dry with long acidity and structure yet very easy to drink on a hot summer day pinko pallino is released just six months after harvest and it is only aged in steel vats '),
	(19,'field',15,'en_us',' south south west sangiovese mixture of alberese and galestro limestones poggio la noce fiesole the rose grapes are the first to be harvested and we look to pick grapes with lower maturity level and less alcohol potential the grape clusters are pressed whole immediately the juice is then left to ferment in a steel vat at cooler temperatures in parallel some of the bled off juice from gigio is also fermented separately the two batches will then be blended together to build the final rose wine the wine will rest in stainless steel vats for a few months at cooler temperatures 8 to 10 degrees celcius until it is bottled it releases roughly 6 9 months later rose wine igt tuscany '),
	(19,'field',14,'en_us',''),
	(19,'field',23,'en_us',' pinko pallino art '),
	(19,'field',24,'en_us',''),
	(19,'field',22,'en_us',' pinko pallino bottle '),
	(19,'slug',0,'it',' gigio '),
	(19,'title',0,'it',' gigino '),
	(19,'field',13,'it',' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
	(19,'field',15,'it',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle gigio red wine igt tuscany '),
	(19,'field',14,'it',' sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur '),
	(19,'field',23,'it',' pinko pallino art '),
	(19,'field',24,'it',''),
	(19,'field',22,'it',''),
	(22,'slug',0,'en_us',' paonazzo '),
	(22,'title',0,'en_us',' paonazzo '),
	(22,'field',13,'en_us',' coming soon '),
	(22,'field',15,'en_us',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole coming soon red wine igt tuscany '),
	(62,'slug',0,'en_us',' olive oil bottle '),
	(62,'title',0,'en_us',' olive oil bottle '),
	(22,'field',14,'en_us',' coming soon '),
	(63,'filename',0,'en_us',' about_sidebar_image gif '),
	(63,'extension',0,'en_us',' gif '),
	(63,'kind',0,'en_us',' image '),
	(63,'slug',0,'en_us',' about sidebar image '),
	(63,'title',0,'en_us',' about sidebar image '),
	(22,'field',23,'en_us',' paonazzo art '),
	(22,'field',24,'en_us',''),
	(22,'field',22,'en_us',' paonazzo '),
	(22,'slug',0,'it',' gigio '),
	(22,'title',0,'it',' pinko pallino '),
	(22,'field',13,'it',' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
	(22,'field',15,'it',' south south west sangiovese and teroldego mixture of albarese and galestro limestones poggio la noce fiesole after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle gigio red wine igt tuscany '),
	(22,'field',14,'it',' sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur '),
	(22,'field',23,'it',' paonazzo art '),
	(22,'field',24,'it',' pinko pallino art '),
	(22,'field',22,'it',' pinko pallino art '),
	(29,'slug',0,'en_us',' home '),
	(29,'title',0,'en_us',' home '),
	(29,'field',6,'en_us',''),
	(29,'field',7,'en_us',''),
	(29,'field',8,'en_us',' a harmonious union between man and nature to yield a beautiful wine slide1 a6thrllvopw a harmonious union between man and nature to yield a beautiful wine slide2 a harmonious union between man and nature to yield a beautiful wine slide3 a harmonious union between man and nature to yield a beautiful wine slide4 a harmonious union between man and nature to yield a beautiful wine slide5 '),
	(29,'field',12,'en_us',''),
	(29,'slug',0,'it',' home '),
	(29,'title',0,'it',' home '),
	(29,'field',6,'it',''),
	(29,'field',7,'it',''),
	(29,'field',8,'it',' slide 1 text slide1 slide 2 text slide2 slide 3 text slide3 '),
	(29,'field',12,'it',''),
	(42,'slug',0,'en_us',' about '),
	(42,'title',0,'en_us',' about '),
	(42,'field',6,'en_us',' learn more about us '),
	(42,'field',7,'en_us',' the poggio la noce estate the estate was founded by husband and wife team enzo schiano and claire beliard in 2000 nestled in the hills of fiesole tuscany facing south south west the property sits in some of the most beautiful countryside just outside florence amidst hills sprinkled with medieval bell towers and castle ruins the property consists of one vineyard 5 acres cultivated with mostly sangiovese grapes and a small percentage of teroldego in a mix of older vines 15 years and younger ones 8 years the vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel from the beginning we set out to farm organically and have been certified organic since 2006 our team husband and wife enzo schiano and claire beliard are the owners of the poggio la noce estate enzo is italian and claire is french they share the vision and love for making great wines roberto corti is poggio la noce s employee roberto studied agronomy at the university of florence and cares for all aspects of the vineyard work as well as that of the cellar and manages the wine making along with claire and enzo and of course all this under the careful guardianship of our beloved maremmano shepard dog marcellino our consulting team is made up of valentino ciarla our technical oenologist as well as stefano dini and gianluca grassi who are our agronomists '),
	(42,'field',8,'en_us',' learn more about us about '),
	(42,'field',12,'en_us',' about sidebar image '),
	(42,'slug',0,'it',' about '),
	(42,'title',0,'it',' about '),
	(42,'field',6,'it',' learn more about us '),
	(42,'field',7,'it',' the poggio la noce estate the estate was founded by husband and wife team enzo schiano and claire beliard in 2000 nestled in the hills of fiesole tuscany facing south south west the property sits in some of the most beautiful countryside just outside florence amidst hills sprinkled with medieval bell towers and castle ruins the property consists of one vineyard 5 acres cultivated with mostly sangiovese grapes and a small percentage of teroldego in a mix of older vines 15 years and younger ones 8 years the vineyard thanks to its small size and human dimension is cared for maniacally making it a real jewel from the beginning we set out to farm organically and have been certified organic since 2006 our team husband and wife enzo schiano and claire beliard are the owners of the poggio la noce estate enzo is italian and claire is french they share the vision and love for making great wines roberto corti is poggio la noce s employee roberto studied agronomy at the university of florence and cares for all aspects of the vineyard work as well as that of the cellar and manages the wine making along with claire and enzo and of course all this under the careful guardianship of our beloved maremmano shepard dog marcellino our consulting team is made up of valentino ciarla our technical oenologist as well as stefano dini and gianluca grassi who are our agronomists '),
	(42,'field',8,'it',' this is the about page about '),
	(42,'field',12,'it',''),
	(44,'slug',0,'en_us',' vineyard '),
	(44,'title',0,'en_us',' vineyard '),
	(44,'field',6,'en_us',' our vines '),
	(44,'field',7,'en_us',' the vineyard is situated at about 800 feet elevation facing south south west giving it perfect sun exposure from morning to evening it sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with albarese and galestro limestone this hillside is proving to be a very special terroir for the sangiovese grape yielding beautiful fresh lively and elegant sangiovese based wines with huge depth and good longevity potential '),
	(44,'field',8,'en_us',' the vinyard vineyard banner photo '),
	(44,'field',12,'en_us',' vinyard sidebar '),
	(44,'slug',0,'it',' vineyard '),
	(44,'title',0,'it',' vineyard '),
	(44,'field',6,'it',' our vines '),
	(44,'field',7,'it',' the vineyard is situated at about 800 feet elevation facing south south west giving it perfect sun exposure from morning to evening it sits on a hillside with steep incline providing good drainage and the soil is a mix of shaley clay with albarese and galestro limestone this hillside is proving to be a very special terroir for the sangiovese grape yielding beautiful fresh lively and elegant sangiovese based wines with huge depth and good longevity potential '),
	(44,'field',8,'it',' vines everywhere vineyard banner photo '),
	(44,'field',12,'it',''),
	(46,'slug',0,'en_us',' olive oil '),
	(46,'title',0,'en_us',' olive oil '),
	(46,'field',6,'en_us',' our olive oil '),
	(46,'field',7,'en_us',' we produce an organic extra virgin olive oil of the highest quality and extraordinary purity our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity absolutely vital for a smooth fragrant product we fertilize and care for our 1 500 olive trees exclusively with organic certified products and prune by hand with only 1 500 olive trees our farm uses traditional picking methodology hand picking each olive in its prime state of ripeness hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch our olives are pressed directly at the estate the same day using our own small modern cold press pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity which is responsible for the smoothness and intensity of poggio la noce olive oil three types of cultivars are cultivated at the estate frantoio leccino and morailo to allow for a smooth delicate yet intense final blend enjoy this all natural extra virgin olive oil on salads bruschette or simply with fresh bread and you will savor a most intense fragrance resembling artichokes fresh grass and almonds '),
	(46,'field',8,'en_us',' a dedicated olive press that allows for immediate pressing right at the estate preserving the intense flavor and full fragrance of the olive oil olive oil banner photo 02 '),
	(46,'field',12,'en_us',' olive oil bottle '),
	(46,'slug',0,'it',' olive oil '),
	(46,'title',0,'it',' olive oil '),
	(46,'field',6,'it',' olives everywhere '),
	(46,'field',7,'it',' we produce an organic extra virgin olive oil of the highest quality and extraordinary purity our product is exceptional because we are serious about our production process and because our terroir yields an extra virgin olive oil with unmatched low acidity absolutely vital for a smooth fragrant product we fertilize and care for our 1 500 olive trees exclusively with organic certified products and prune by hand with only 1 500 olive trees our farm uses traditional picking methodology hand picking each olive in its prime state of ripeness hand picking preserves the intensity of our olive oil due to optimum ripeness of the olive when it is plucked from the branch our olives are pressed directly at the estate the same day using our own small modern cold press pressing our olives immediately after picking helps preserve the intense flavor and full fragrance of the olive oil and ensures the lowest grade of acidity which is responsible for the smoothness and intensity of poggio la noce olive oil three types of cultivars are cultivated at the estate frantoio leccino and morailo to allow for a smooth delicate yet intense final blend enjoy this all natural extra virgin olive oil on salads bruschette or simply with fresh bread and you will savor a most intense fragrance resembling artichokes fresh grass and almonds '),
	(46,'field',8,'it',' olive oil for everyone olive oil banner photo 02 '),
	(46,'field',12,'it',''),
	(48,'slug',0,'en_us',' contact '),
	(48,'title',0,'en_us',' contact '),
	(48,'field',6,'en_us',' contact us '),
	(48,'field',7,'en_us',' get in touch with us by writing in the box below lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),
	(48,'field',8,'en_us',' get in touch '),
	(48,'field',12,'en_us',''),
	(48,'slug',0,'it',' contact '),
	(48,'title',0,'it',' contact '),
	(48,'field',6,'it',' contact us '),
	(48,'field',7,'it',' get in touch with us by writing in the box below lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),
	(48,'field',8,'it',' get in touch '),
	(48,'field',12,'it',''),
	(4,'slug',0,'en_us',''),
	(4,'field',3,'en_us',' 999 123 4567 '),
	(4,'field',4,'en_us',' info poggiolanoce com '),
	(4,'field',5,'en_us',' 12345 vineyard rd fiesole tuscany italy '),
	(4,'slug',0,'it',''),
	(4,'field',3,'it',' 999 123 4567 '),
	(4,'field',4,'it',' info poggiolanoce com '),
	(4,'field',5,'it',' 12345 vineyard rd fiesole tuscany italy '),
	(8,'slug',0,'en_us',''),
	(8,'field',9,'en_us',' driven by our love for great wine we strive to produce the best possible wine for this terroir '),
	(8,'field',10,'en_us',' veuluy0zazu '),
	(8,'field',11,'en_us',' philosophy banner '),
	(8,'slug',0,'it',''),
	(8,'field',9,'it',' forget about it '),
	(8,'field',10,'it',' veuluy0zazu '),
	(8,'field',11,'it',' philosophy banner '),
	(10,'slug',0,'en_us',''),
	(10,'field',16,'en_us',' red wine igt tuscany '),
	(10,'field',17,'en_us',' poggio la noce fiesole '),
	(10,'field',18,'en_us',' sangiovese and teroldego '),
	(10,'field',19,'en_us',' south south west '),
	(10,'field',20,'en_us',' mixture of alberese and galestro limestones '),
	(10,'field',21,'en_us',' after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle '),
	(10,'slug',0,'it',''),
	(10,'field',16,'it',' gigio red wine igt tuscany '),
	(10,'field',17,'it',' poggio la noce fiesole '),
	(10,'field',18,'it',' sangiovese and teroldego '),
	(10,'field',19,'it',' south south west '),
	(10,'field',20,'it',' mixture of albarese and galestro limestones '),
	(10,'field',21,'it',' after careful cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in a mix of new and used french oak barriques for 12 to 18 months with further 12 months ageing in bottle '),
	(14,'slug',0,'en_us',''),
	(14,'field',16,'en_us',' red wine igt tuscany '),
	(14,'field',17,'en_us',' poggio la noce fiesole '),
	(14,'field',18,'en_us',' sangiovese and teroldego '),
	(14,'field',19,'en_us',' south south west '),
	(14,'field',20,'en_us',' mixture of albarese and galestro limestones '),
	(14,'field',21,'en_us',' the gigetto grapes are picked first as we are trying to make a fresh fruit driven wine with less emphasis on concentration after cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in oak botti or large size barrels 1000l for 3 to 6 months with further 6 month ageing in bottle '),
	(14,'slug',0,'it',''),
	(14,'field',16,'it',' gigio red wine igt tuscany '),
	(14,'field',17,'it',' poggio la noce fiesole '),
	(14,'field',18,'it',' sangiovese and teroldego '),
	(14,'field',19,'it',' south south west '),
	(14,'field',20,'it',' mixture of albarese and galestro limestones '),
	(14,'field',21,'it',' the gigetto grapes are picked first as we are trying to make a fresh fruit driven wine with less emphasis on concentration after cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in oak botti or large size barrels 1000l for 3 to 6 months with further 6 month ageing in bottle '),
	(17,'slug',0,'en_us',''),
	(17,'field',16,'en_us',' red wine igt tuscany '),
	(17,'field',17,'en_us',' poggio la noce fiesole '),
	(17,'field',18,'en_us',' sangiovese '),
	(17,'field',19,'en_us',' south south west '),
	(17,'field',20,'en_us',' mixture of alberese and galestro limestones '),
	(17,'field',21,'en_us',' the gigino grapes are carefully selected from specific segments of the vineyard where the soil yields a very classic elegant style sangiovese after cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in oak botti or large size barrels 1000l for 12 months with further 12 month ageing in bottle '),
	(17,'slug',0,'it',''),
	(17,'field',16,'it',' gigio red wine igt tuscany '),
	(17,'field',17,'it',' poggio la noce fiesole '),
	(17,'field',18,'it',' sangiovese and teroldego '),
	(17,'field',19,'it',' south south west '),
	(17,'field',20,'it',' mixture of albarese and galestro limestones '),
	(17,'field',21,'it',' the gigino grapes are carefully selected from specific segments of the vineyard where the soil yields a very classic elegant style sangiovese after cluster and berry selection vinification occurs in temperature controlled stainless steel vats with indigenous yeast ageing occurs in oak botti or large size barrels 1000l for 12 months with further 12 month ageing in bottle '),
	(20,'slug',0,'en_us',''),
	(20,'field',16,'en_us',' rose wine igt tuscany '),
	(20,'field',17,'en_us',' poggio la noce fiesole '),
	(20,'field',18,'en_us',' sangiovese '),
	(20,'field',19,'en_us',' south south west '),
	(20,'field',20,'en_us',' mixture of alberese and galestro limestones '),
	(20,'field',21,'en_us',' the rose grapes are the first to be harvested and we look to pick grapes with lower maturity level and less alcohol potential the grape clusters are pressed whole immediately the juice is then left to ferment in a steel vat at cooler temperatures in parallel some of the bled off juice from gigio is also fermented separately the two batches will then be blended together to build the final rose wine the wine will rest in stainless steel vats for a few months at cooler temperatures 8 to 10 degrees celcius until it is bottled it releases roughly 6 9 months later '),
	(20,'slug',0,'it',''),
	(20,'field',16,'it',' gigio red wine igt tuscany '),
	(20,'field',17,'it',' poggio la noce fiesole '),
	(20,'field',18,'it',' sangiovese and teroldego '),
	(20,'field',19,'it',' south south west '),
	(20,'field',20,'it',' mixture of albarese and galestro limestones '),
	(20,'field',21,'it',' the rose grapes are the first to be harvested and we look to pick grapes with lower maturity level and less alcohol potential the grape clusters are pressed whole immediately the juice is then left to ferment in a steel vat at cooler temperatures in parallel some of the bled off juice from gigio is also fermented separately the two batches will then be blended together to build the final rose wine the wine will rest in stainless steel vats for a few months at cooler temperatures 8 to 10 degrees celcius until it is bottled it releases roughly 6 9 months later '),
	(23,'slug',0,'en_us',''),
	(23,'field',16,'en_us',' red wine igt tuscany '),
	(23,'field',17,'en_us',' poggio la noce fiesole '),
	(23,'field',18,'en_us',' sangiovese and teroldego '),
	(23,'field',19,'en_us',' south south west '),
	(23,'field',20,'en_us',' mixture of albarese and galestro limestones '),
	(23,'field',21,'en_us',' coming soon '),
	(62,'filename',0,'en_us',' olive oil bottle jpg '),
	(62,'extension',0,'en_us',' jpg '),
	(62,'kind',0,'en_us',' image '),
	(23,'slug',0,'it',''),
	(23,'field',16,'it',' gigio red wine igt tuscany '),
	(23,'field',17,'it',' poggio la noce fiesole '),
	(23,'field',18,'it',' sangiovese and teroldego '),
	(23,'field',19,'it',' south south west '),
	(23,'field',20,'it',' mixture of albarese and galestro limestones '),
	(23,'field',21,'it',' coming soon '),
	(61,'filename',0,'en_us',' about_sidebar_image png '),
	(61,'extension',0,'en_us',' png '),
	(61,'kind',0,'en_us',' image '),
	(61,'slug',0,'en_us',' about sidebar image '),
	(61,'title',0,'en_us',' about sidebar image '),
	(30,'slug',0,'en_us',''),
	(30,'field',9,'en_us',' a harmonious union between man and nature to yield a beautiful wine '),
	(30,'field',10,'en_us',' a6thrllvopw '),
	(30,'field',11,'en_us',' slide1 '),
	(30,'slug',0,'it',''),
	(30,'field',9,'it',' slide 1 text '),
	(30,'field',10,'it',''),
	(30,'field',11,'it',' slide1 '),
	(31,'slug',0,'en_us',''),
	(31,'field',9,'en_us',' a harmonious union between man and nature to yield a beautiful wine '),
	(31,'field',10,'en_us',''),
	(31,'field',11,'en_us',' slide2 '),
	(31,'slug',0,'it',''),
	(31,'field',9,'it',' slide 2 text '),
	(31,'field',10,'it',''),
	(31,'field',11,'it',' slide2 '),
	(32,'slug',0,'en_us',''),
	(32,'field',9,'en_us',' a harmonious union between man and nature to yield a beautiful wine '),
	(32,'field',10,'en_us',''),
	(32,'field',11,'en_us',' slide3 '),
	(32,'slug',0,'it',''),
	(32,'field',9,'it',' slide 3 text '),
	(32,'field',10,'it',''),
	(32,'field',11,'it',' slide3 '),
	(43,'slug',0,'en_us',''),
	(43,'field',9,'en_us',' learn more about us '),
	(43,'field',10,'en_us',''),
	(43,'field',11,'en_us',' about '),
	(43,'slug',0,'it',''),
	(43,'field',9,'it',' this is the about page '),
	(43,'field',10,'it',''),
	(43,'field',11,'it',' about '),
	(45,'slug',0,'en_us',''),
	(45,'field',9,'en_us',' the vinyard '),
	(45,'field',10,'en_us',''),
	(45,'field',11,'en_us',' vineyard banner photo '),
	(45,'slug',0,'it',''),
	(45,'field',9,'it',' vines everywhere '),
	(45,'field',10,'it',''),
	(45,'field',11,'it',' vineyard banner photo '),
	(47,'slug',0,'en_us',''),
	(47,'field',9,'en_us',' a dedicated olive press that allows for immediate pressing right at the estate preserving the intense flavor and full fragrance of the olive oil '),
	(47,'field',10,'en_us',''),
	(47,'field',11,'en_us',' olive oil banner photo 02 '),
	(47,'slug',0,'it',''),
	(47,'field',9,'it',' olive oil for everyone '),
	(47,'field',10,'it',''),
	(47,'field',11,'it',' olive oil banner photo 02 '),
	(49,'slug',0,'en_us',''),
	(49,'field',9,'en_us',' get in touch '),
	(49,'field',10,'en_us',''),
	(49,'field',11,'en_us',''),
	(49,'slug',0,'it',''),
	(49,'field',9,'it',' get in touch '),
	(49,'field',10,'it',''),
	(49,'field',11,'it',''),
	(1,'username',0,'en_us',' poggio '),
	(1,'firstname',0,'en_us',''),
	(1,'lastname',0,'en_us',''),
	(1,'fullname',0,'en_us',''),
	(1,'email',0,'en_us',' andy bletchley co '),
	(1,'slug',0,'en_us',''),
	(56,'filename',0,'en_us',' gigino bottle png '),
	(56,'extension',0,'en_us',' png '),
	(56,'kind',0,'en_us',' image '),
	(56,'slug',0,'en_us',' gigino bottle '),
	(56,'title',0,'en_us',' gigino bottle '),
	(57,'filename',0,'en_us',' gigetto bottle png '),
	(57,'extension',0,'en_us',' png '),
	(57,'kind',0,'en_us',' image '),
	(57,'slug',0,'en_us',' gigetto bottle '),
	(57,'title',0,'en_us',' gigetto bottle '),
	(58,'filename',0,'en_us',' gigio png '),
	(58,'extension',0,'en_us',' png '),
	(58,'kind',0,'en_us',' image '),
	(58,'slug',0,'en_us',' gigio '),
	(58,'title',0,'en_us',' gigio '),
	(59,'filename',0,'en_us',' pinko pallino bottle png '),
	(59,'extension',0,'en_us',' png '),
	(59,'kind',0,'en_us',' image '),
	(59,'slug',0,'en_us',' pinko pallino bottle '),
	(59,'title',0,'en_us',' pinko pallino bottle '),
	(60,'filename',0,'en_us',' paonazzo png '),
	(60,'extension',0,'en_us',' png '),
	(60,'kind',0,'en_us',' image '),
	(60,'slug',0,'en_us',' paonazzo '),
	(60,'title',0,'en_us',' paonazzo '),
	(64,'filename',0,'en_us',' vinyard_sidebar jpg '),
	(64,'extension',0,'en_us',' jpg '),
	(64,'kind',0,'en_us',' image '),
	(64,'slug',0,'en_us',' vinyard sidebar '),
	(64,'title',0,'en_us',' vinyard sidebar '),
	(65,'filename',0,'en_us',' slide1 jpg '),
	(65,'extension',0,'en_us',' jpg '),
	(65,'kind',0,'en_us',' image '),
	(65,'slug',0,'en_us',' slide1 '),
	(65,'title',0,'en_us',' slide1 '),
	(66,'filename',0,'en_us',' slide2 jpg '),
	(66,'extension',0,'en_us',' jpg '),
	(66,'kind',0,'en_us',' image '),
	(66,'slug',0,'en_us',' slide2 '),
	(66,'title',0,'en_us',' slide2 '),
	(67,'filename',0,'en_us',' slide3 jpg '),
	(67,'extension',0,'en_us',' jpg '),
	(67,'kind',0,'en_us',' image '),
	(67,'slug',0,'en_us',' slide3 '),
	(67,'title',0,'en_us',' slide3 '),
	(68,'filename',0,'en_us',' slide4 jpg '),
	(68,'extension',0,'en_us',' jpg '),
	(68,'kind',0,'en_us',' image '),
	(68,'slug',0,'en_us',' slide4 '),
	(68,'title',0,'en_us',' slide4 '),
	(69,'filename',0,'en_us',' slide5 jpg '),
	(69,'extension',0,'en_us',' jpg '),
	(69,'kind',0,'en_us',' image '),
	(69,'slug',0,'en_us',' slide5 '),
	(69,'title',0,'en_us',' slide5 '),
	(70,'field',9,'en_us',' a harmonious union between man and nature to yield a beautiful wine '),
	(70,'field',10,'en_us',''),
	(70,'field',11,'en_us',' slide4 '),
	(70,'slug',0,'en_us',''),
	(70,'field',9,'it',' slide 4 '),
	(70,'field',10,'it',''),
	(70,'field',11,'it',' slide4 '),
	(71,'field',9,'en_us',' a harmonious union between man and nature to yield a beautiful wine '),
	(71,'field',10,'en_us',''),
	(71,'field',11,'en_us',' slide5 '),
	(71,'slug',0,'en_us',''),
	(71,'field',9,'it',' slide 5 '),
	(71,'field',10,'it',''),
	(71,'field',11,'it',' slide5 ');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'Homepage','homepage','single',1,'index',1,'2015-01-09 19:54:28','2015-01-09 19:54:28','873f419a-b753-479b-bf3c-1d7d09ff35c2'),
	(2,NULL,'News','news','channel',1,'news/_entry',1,'2015-01-09 19:54:28','2015-01-09 19:54:28','e502f894-e162-4e8d-84cc-06425f364d52'),
	(3,1,'Pages','pages','structure',0,NULL,1,'2015-01-12 18:31:31','2015-01-12 18:31:31','834b28f9-5e08-4503-9fd3-38154cea14b0'),
	(4,2,'Wine','wine','structure',0,NULL,1,'2015-01-12 22:19:55','2015-01-12 22:19:55','cd5829f3-343e-4b00-8627-2f35e96c4692');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_i18n`;

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en_us',1,'__home__',NULL,'2015-01-09 19:54:28','2015-01-09 19:54:28','83de6225-6d24-423d-9912-80ff80f067c7'),
	(2,2,'en_us',1,'news/{postDate.year}/{slug}',NULL,'2015-01-09 19:54:28','2015-01-09 19:54:28','1376995a-78d2-4937-b0e3-ef4807ea474f'),
	(3,3,'en_us',1,NULL,NULL,'2015-01-12 18:31:31','2015-01-12 18:31:31','8be6bef9-4da5-46c5-932d-68bc265c0120'),
	(4,3,'it',1,NULL,NULL,'2015-01-12 18:31:31','2015-01-12 18:31:31','7f72f1a6-46a5-4a5a-a4f2-3a22862b901f'),
	(5,4,'en_us',1,NULL,NULL,'2015-01-12 22:19:55','2015-01-12 22:19:55','c661f430-de9b-49f7-b4ce-6f098b464290'),
	(6,4,'it',1,NULL,NULL,'2015-01-12 22:19:55','2015-01-12 22:19:55','e62b98dd-43c7-42bb-92e7-96ca77385fd8');

/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(13,1,'d77475d55e8b45ee8933b8478971c8388c30fb4eczozNjoiZDNkNmJlZWItZjQ2My00MmNlLWJlODYtNDZjMWYwYzJkMjY2Ijs=','2015-01-20 22:12:21','2015-01-20 22:12:21','72992155-45c8-4e44-a575-c00a12577a54');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structureelements`;

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,14,0,'2015-01-12 18:58:59','2015-01-12 18:58:59','8bc8d614-114a-4fa8-8853-8ae8ad10aa60'),
	(2,1,6,1,2,3,1,'2015-01-12 18:58:59','2015-01-12 18:58:59','e5570ac2-4654-4b69-97c4-85e2f5492231'),
	(3,2,NULL,3,1,12,0,'2015-01-12 22:24:03','2015-01-12 22:24:03','96124691-9eff-4091-96dd-ea12b472af28'),
	(4,2,9,3,2,3,1,'2015-01-12 22:24:03','2015-01-12 22:24:03','cda6be0e-90cd-4d6a-a207-88703b4202d3'),
	(5,2,13,3,4,5,1,'2015-01-12 23:28:53','2015-01-12 23:28:53','c2c66c2e-8a70-4a13-a7b1-e33851236f99'),
	(6,2,16,3,6,7,1,'2015-01-12 23:36:06','2015-01-12 23:36:06','ffbb3646-1c56-43ca-b4b3-989c82db9965'),
	(7,2,19,3,8,9,1,'2015-01-12 23:36:56','2015-01-12 23:36:56','dc03906c-0c4d-40f9-ae42-a02f0d52e048'),
	(8,2,22,3,10,11,1,'2015-01-12 23:37:53','2015-01-12 23:37:53','5fd7a744-f122-4e4d-aaf4-1ead88fc5c9b'),
	(9,1,29,1,4,5,1,'2015-01-13 03:12:19','2015-01-13 03:12:19','5209a28c-fd7d-4558-807a-378c5e8c4cf4'),
	(10,1,42,1,6,7,1,'2015-01-14 17:42:46','2015-01-14 17:42:46','10979fe3-2f95-42f7-89b6-3fabb06b5e05'),
	(11,1,44,1,8,9,1,'2015-01-14 17:43:38','2015-01-14 17:43:38','3db262e5-ba0b-4694-a797-9c135796f702'),
	(12,1,46,1,10,11,1,'2015-01-14 17:44:34','2015-01-14 17:44:34','85d94534-c1b0-47aa-add5-97e4fb8490e6'),
	(13,1,48,1,12,13,1,'2015-01-14 17:46:00','2015-01-14 17:46:00','217c9b05-0227-4ef7-8a96-2b43edcfe206');

/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structures`;

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'2015-01-12 18:31:31','2015-01-12 18:31:31','94a18ec3-ad6f-4015-a767-5ca05e37976c'),
	(2,NULL,'2015-01-12 22:19:55','2015-01-12 22:19:55','eb36e359-1587-40c7-a322-e53bb1e6c406');

/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemsettings`;

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'email','{\"template\":\"\",\"protocol\":\"php\",\"emailAddress\":\"andy@bletchley.co\",\"senderName\":\"Poggio La Noce\"}','2015-01-09 19:54:28','2015-01-14 23:16:29','5596e6d6-fe66-4d11-a968-9bfda159f04e');

/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_taggroups`;

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','default',1,'2015-01-09 19:54:28','2015-01-09 19:54:28','60972ff9-d3be-45fa-aca7-c2a5b7fdf4db');

/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tasks`;

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_templatecachecriteria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecachecriteria`;

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecacheelements`;

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecaches`;

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tokens`;

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'poggio',NULL,'','','andy@bletchley.co','$2a$13$oeBNQSJNms.BOqNj3suKGecaIwcSEiCVrayG4yQN5AHhsxe1L6VKa',NULL,0,1,0,0,0,0,0,'2015-01-20 22:12:21','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2015-01-09 19:56:04','2015-01-09 19:54:27','2015-01-20 22:12:21','a375664d-9e8e-4178-bec5-1e2137f173de');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'RecentEntries',1,NULL,1,'2015-01-09 19:55:40','2015-01-09 19:55:40','1d277c4a-00af-4b82-8120-3cdfd306b8f4'),
	(2,1,'GetHelp',2,NULL,1,'2015-01-09 19:55:40','2015-01-09 19:55:40','02a8086b-333e-4951-864c-d7e6a2a5674e'),
	(3,1,'Updates',3,NULL,1,'2015-01-09 19:55:40','2015-01-09 19:55:40','f73c297e-6f3f-462a-8761-8c14a6986e4a'),
	(4,1,'Feed',4,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',1,'2015-01-09 19:55:40','2015-01-09 19:55:40','9c2044ea-8b2d-44a7-9a1a-38cdfd9daaba');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

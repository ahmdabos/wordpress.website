-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: ::1    Database: local
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_ccg_fetched_images`
--

DROP TABLE IF EXISTS `wp_ccg_fetched_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_ccg_fetched_images` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ccg_fetched_images`
--

LOCK TABLES `wp_ccg_fetched_images` WRITE;
/*!40000 ALTER TABLE `wp_ccg_fetched_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ccg_fetched_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_chat_key`
--

DROP TABLE IF EXISTS `wp_chat_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_chat_key` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `publickey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_chat_key`
--

LOCK TABLES `wp_chat_key` WRITE;
/*!40000 ALTER TABLE `wp_chat_key` DISABLE KEYS */;
INSERT INTO `wp_chat_key` VALUES (1,'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');
/*!40000 ALTER TABLE `wp_chat_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_chatgpt_content_writer`
--

DROP TABLE IF EXISTS `wp_chatgpt_content_writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_chatgpt_content_writer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_token` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `temperature` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `max_tokens` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_chatgpt_content_writer`
--

LOCK TABLES `wp_chatgpt_content_writer` WRITE;
/*!40000 ALTER TABLE `wp_chatgpt_content_writer` DISABLE KEYS */;
INSERT INTO `wp_chatgpt_content_writer` VALUES (1,'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','0.5','2000','');
/*!40000 ALTER TABLE `wp_chatgpt_content_writer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2023-04-07 11:44:58','2023-04-07 11:44:58','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_contact_form_submissions`
--

DROP TABLE IF EXISTS `wp_contact_form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_contact_form_submissions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_contact_form_submissions`
--

LOCK TABLES `wp_contact_form_submissions` WRITE;
/*!40000 ALTER TABLE `wp_contact_form_submissions` DISABLE KEYS */;
INSERT INTO `wp_contact_form_submissions` VALUES (1,'2','ahmed@fi.ae','asdf','2023-04-17 08:50:23');
/*!40000 ALTER TABLE `wp_contact_form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_custom_contact_form_submissions`
--

DROP TABLE IF EXISTS `wp_custom_contact_form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_custom_contact_form_submissions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_custom_contact_form_submissions`
--

LOCK TABLES `wp_custom_contact_form_submissions` WRITE;
/*!40000 ALTER TABLE `wp_custom_contact_form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_custom_contact_form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=1095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://wordpress.website','yes');
INSERT INTO `wp_options` VALUES (2,'home','http://wordpress.website','yes');
INSERT INTO `wp_options` VALUES (3,'blogname','wordpress.website','yes');
INSERT INTO `wp_options` VALUES (4,'blogdescription','','yes');
INSERT INTO `wp_options` VALUES (5,'users_can_register','0','yes');
INSERT INTO `wp_options` VALUES (6,'admin_email','ahmed@fi.ae','yes');
INSERT INTO `wp_options` VALUES (7,'start_of_week','1','yes');
INSERT INTO `wp_options` VALUES (8,'use_balanceTags','0','yes');
INSERT INTO `wp_options` VALUES (9,'use_smilies','1','yes');
INSERT INTO `wp_options` VALUES (10,'require_name_email','1','yes');
INSERT INTO `wp_options` VALUES (11,'comments_notify','1','yes');
INSERT INTO `wp_options` VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `wp_options` VALUES (13,'rss_use_excerpt','0','yes');
INSERT INTO `wp_options` VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `wp_options` VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `wp_options` VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `wp_options` VALUES (17,'mailserver_port','110','yes');
INSERT INTO `wp_options` VALUES (18,'default_category','7','yes');
INSERT INTO `wp_options` VALUES (19,'default_comment_status','open','yes');
INSERT INTO `wp_options` VALUES (20,'default_ping_status','open','yes');
INSERT INTO `wp_options` VALUES (21,'default_pingback_flag','1','yes');
INSERT INTO `wp_options` VALUES (22,'posts_per_page','10','yes');
INSERT INTO `wp_options` VALUES (23,'date_format','F j, Y','yes');
INSERT INTO `wp_options` VALUES (24,'time_format','g:i a','yes');
INSERT INTO `wp_options` VALUES (25,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `wp_options` VALUES (26,'comment_moderation','0','yes');
INSERT INTO `wp_options` VALUES (27,'moderation_notify','1','yes');
INSERT INTO `wp_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `wp_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `wp_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `wp_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `wp_options` VALUES (33,'active_plugins','a:7:{i:0;s:29:\"localization/localization.php\";i:1;s:13:\"base/base.php\";i:2;s:55:\"chatgpt-content-generator/chatgpt-content-generator.php\";i:3;s:33:\"chatgpt-helper/chatgpt-helper.php\";i:4;s:35:\"compress-images/compress-images.php\";i:5;s:43:\"custom-contact-form/custom-contact-form.php\";i:6;s:21:\"custom-fields/acf.php\";}','yes');
INSERT INTO `wp_options` VALUES (34,'category_base','','yes');
INSERT INTO `wp_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `wp_options` VALUES (36,'comment_max_links','2','yes');
INSERT INTO `wp_options` VALUES (37,'gmt_offset','0','yes');
INSERT INTO `wp_options` VALUES (38,'default_email_category','1','yes');
INSERT INTO `wp_options` VALUES (39,'recently_edited','','no');
INSERT INTO `wp_options` VALUES (40,'template','wordpresstheme','yes');
INSERT INTO `wp_options` VALUES (41,'stylesheet','wordpresstheme','yes');
INSERT INTO `wp_options` VALUES (42,'comment_registration','0','yes');
INSERT INTO `wp_options` VALUES (43,'html_type','text/html','yes');
INSERT INTO `wp_options` VALUES (44,'use_trackback','0','yes');
INSERT INTO `wp_options` VALUES (45,'default_role','subscriber','yes');
INSERT INTO `wp_options` VALUES (46,'db_version','53496','yes');
INSERT INTO `wp_options` VALUES (47,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `wp_options` VALUES (48,'upload_path','','yes');
INSERT INTO `wp_options` VALUES (49,'blog_public','1','yes');
INSERT INTO `wp_options` VALUES (50,'default_link_category','2','yes');
INSERT INTO `wp_options` VALUES (51,'show_on_front','page','yes');
INSERT INTO `wp_options` VALUES (52,'tag_base','','yes');
INSERT INTO `wp_options` VALUES (53,'show_avatars','1','yes');
INSERT INTO `wp_options` VALUES (54,'avatar_rating','G','yes');
INSERT INTO `wp_options` VALUES (55,'upload_url_path','','yes');
INSERT INTO `wp_options` VALUES (56,'thumbnail_size_w','150','yes');
INSERT INTO `wp_options` VALUES (57,'thumbnail_size_h','150','yes');
INSERT INTO `wp_options` VALUES (58,'thumbnail_crop','1','yes');
INSERT INTO `wp_options` VALUES (59,'medium_size_w','300','yes');
INSERT INTO `wp_options` VALUES (60,'medium_size_h','300','yes');
INSERT INTO `wp_options` VALUES (61,'avatar_default','mystery','yes');
INSERT INTO `wp_options` VALUES (62,'large_size_w','1024','yes');
INSERT INTO `wp_options` VALUES (63,'large_size_h','1024','yes');
INSERT INTO `wp_options` VALUES (64,'image_default_link_type','none','yes');
INSERT INTO `wp_options` VALUES (65,'image_default_size','','yes');
INSERT INTO `wp_options` VALUES (66,'image_default_align','','yes');
INSERT INTO `wp_options` VALUES (67,'close_comments_for_old_posts','0','yes');
INSERT INTO `wp_options` VALUES (68,'close_comments_days_old','14','yes');
INSERT INTO `wp_options` VALUES (69,'thread_comments','1','yes');
INSERT INTO `wp_options` VALUES (70,'thread_comments_depth','5','yes');
INSERT INTO `wp_options` VALUES (71,'page_comments','0','yes');
INSERT INTO `wp_options` VALUES (72,'comments_per_page','50','yes');
INSERT INTO `wp_options` VALUES (73,'default_comments_page','newest','yes');
INSERT INTO `wp_options` VALUES (74,'comment_order','asc','yes');
INSERT INTO `wp_options` VALUES (75,'sticky_posts','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (76,'widget_categories','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (77,'widget_text','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (78,'widget_rss','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (79,'uninstall_plugins','a:0:{}','no');
INSERT INTO `wp_options` VALUES (80,'timezone_string','','yes');
INSERT INTO `wp_options` VALUES (81,'page_for_posts','0','yes');
INSERT INTO `wp_options` VALUES (82,'page_on_front','81','yes');
INSERT INTO `wp_options` VALUES (83,'default_post_format','0','yes');
INSERT INTO `wp_options` VALUES (84,'link_manager_enabled','0','yes');
INSERT INTO `wp_options` VALUES (85,'finished_splitting_shared_terms','1','yes');
INSERT INTO `wp_options` VALUES (86,'site_icon','0','yes');
INSERT INTO `wp_options` VALUES (87,'medium_large_size_w','768','yes');
INSERT INTO `wp_options` VALUES (88,'medium_large_size_h','0','yes');
INSERT INTO `wp_options` VALUES (89,'wp_page_for_privacy_policy','3','yes');
INSERT INTO `wp_options` VALUES (90,'show_comments_cookies_opt_in','1','yes');
INSERT INTO `wp_options` VALUES (91,'admin_email_lifespan','1696419897','yes');
INSERT INTO `wp_options` VALUES (92,'disallowed_keys','','no');
INSERT INTO `wp_options` VALUES (93,'comment_previously_approved','1','yes');
INSERT INTO `wp_options` VALUES (94,'auto_plugin_theme_update_emails','a:0:{}','no');
INSERT INTO `wp_options` VALUES (95,'auto_update_core_dev','enabled','yes');
INSERT INTO `wp_options` VALUES (96,'auto_update_core_minor','enabled','yes');
INSERT INTO `wp_options` VALUES (97,'auto_update_core_major','enabled','yes');
INSERT INTO `wp_options` VALUES (98,'wp_force_deactivated_plugins','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (99,'initial_db_version','53496','yes');
INSERT INTO `wp_options` VALUES (100,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"edit_theme_options\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes');
INSERT INTO `wp_options` VALUES (101,'fresh_site','0','yes');
INSERT INTO `wp_options` VALUES (102,'user_count','1','no');
INSERT INTO `wp_options` VALUES (103,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (104,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `wp_options` VALUES (105,'cron','a:12:{i:1688566146;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1688581531;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1688598816;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1688600313;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1688600699;a:1:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1688607762;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1688643182;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1688643899;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1688650962;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1688650963;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1688816699;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `wp_options` VALUES (106,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (107,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (108,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (109,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (110,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (111,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (112,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (113,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (114,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (115,'nonce_key','?ky&;+|+!#lzOMS-` *rXwEOf(h$LMiNJmYqfUjV0rnf;,-8Gv()r%A_u,)#K~<=','no');
INSERT INTO `wp_options` VALUES (116,'nonce_salt','BP+}DlBff6zj<@b{Qjt@+6#ld4E]KW*^::7r?}n=]{(IHO-mKc3]),ve]nCy;WhY','no');
INSERT INTO `wp_options` VALUES (117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (123,'recovery_keys','a:1:{s:22:\"foE08GT2gPFYG6en5UJrfb\";a:2:{s:10:\"hashed_key\";s:34:\"$P$B1gRxH9cEzde4DGP3B3tNrbQbzvoBk.\";s:10:\"created_at\";i:1688556442;}}','yes');
INSERT INTO `wp_options` VALUES (124,'theme_mods_twentytwentythree','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1681306972;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','yes');
INSERT INTO `wp_options` VALUES (125,'https_detection_errors','a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}','yes');
INSERT INTO `wp_options` VALUES (126,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.2.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.2.2-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.2.2\";s:7:\"version\";s:5:\"6.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:3:\"6.2\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.2.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.2.2-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.2-rollback-0.zip\";}s:7:\"current\";s:5:\"6.2.2\";s:7:\"version\";s:5:\"6.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:3:\"6.2\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1688565930;s:15:\"version_checked\";s:3:\"6.2\";s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (138,'_transient_health-check-site-status-result','{\"good\":14,\"recommended\":5,\"critical\":3}','yes');
INSERT INTO `wp_options` VALUES (141,'auth_key','wCV=R,J`C4cuOP+G2N;8[~xcW*_t)aGE,/k=5?}K5):xr]w!W}QVbM?52E|dH>3{','no');
INSERT INTO `wp_options` VALUES (142,'auth_salt','N,D[Xl2VSD,/iE!Zm2$f^m?A1&#j$-~&:7ipKeef.# N]U~U3!?WFthM?&u9OfY}','no');
INSERT INTO `wp_options` VALUES (143,'logged_in_key','x;tZj!b0<~T#n|!D1+Ve/sB&_0Us86=YVdU:&#jlmjci`gyWEXc-@F_ydN(jbds~','no');
INSERT INTO `wp_options` VALUES (144,'logged_in_salt','3Z3&LSybSB`#dC$QyH9S=v{cZ)`T()y##r^A@ia{29/Eg5V4-zq8-G>4L$eNq8:z','no');
INSERT INTO `wp_options` VALUES (160,'can_compress_scripts','1','no');
INSERT INTO `wp_options` VALUES (161,'current_theme','wordpress theme','yes');
INSERT INTO `wp_options` VALUES (162,'theme_mods_wordpresstheme','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:10;}s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (163,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (164,'recently_activated','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (167,'finished_updating_comment_type','1','yes');
INSERT INTO `wp_options` VALUES (168,'polylang','a:15:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:9:\"uninstall\";i:0;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:4:{i:0;s:7:\"sliders\";i:1;s:6:\"events\";i:2;s:4:\"news\";i:3;s:12:\"wp_locations\";}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"7.7.1\";s:16:\"first_activation\";i:1681307031;s:12:\"default_lang\";s:2:\"en\";s:9:\"nav_menus\";a:1:{s:14:\"wordpresstheme\";a:1:{s:6:\"menu-1\";a:2:{s:2:\"ar\";i:11;s:2:\"en\";i:10;}}}}','yes');
INSERT INTO `wp_options` VALUES (169,'polylang_wpml_strings','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (170,'widget_wp_location_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (171,'widget_polylang','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (172,'acf_version','14.3','yes');
INSERT INTO `wp_options` VALUES (185,'_transient_pll_translated_slugs','a:8:{s:8:\"category\";a:2:{s:4:\"slug\";s:8:\"category\";s:12:\"translations\";a:2:{s:2:\"ar\";s:8:\"category\";s:2:\"en\";s:8:\"category\";}}s:8:\"post_tag\";a:2:{s:4:\"slug\";s:3:\"tag\";s:12:\"translations\";a:2:{s:2:\"ar\";s:3:\"tag\";s:2:\"en\";s:3:\"tag\";}}s:11:\"post_format\";a:2:{s:4:\"slug\";s:4:\"type\";s:12:\"translations\";a:2:{s:2:\"ar\";s:4:\"type\";s:2:\"en\";s:4:\"type\";}}s:6:\"author\";a:2:{s:4:\"slug\";s:6:\"author\";s:12:\"translations\";a:2:{s:2:\"ar\";s:6:\"author\";s:2:\"en\";s:6:\"author\";}}s:6:\"search\";a:2:{s:4:\"slug\";s:6:\"search\";s:12:\"translations\";a:2:{s:2:\"ar\";s:6:\"search\";s:2:\"en\";s:6:\"search\";}}s:10:\"attachment\";a:2:{s:4:\"slug\";s:10:\"attachment\";s:12:\"translations\";a:2:{s:2:\"ar\";s:10:\"attachment\";s:2:\"en\";s:10:\"attachment\";}}s:5:\"paged\";a:2:{s:4:\"slug\";s:4:\"page\";s:12:\"translations\";a:2:{s:2:\"ar\";s:4:\"page\";s:2:\"en\";s:4:\"page\";}}s:5:\"front\";a:2:{s:4:\"slug\";s:0:\"\";s:12:\"translations\";a:2:{s:2:\"ar\";s:0:\"\";s:2:\"en\";s:0:\"\";}}}','yes');
INSERT INTO `wp_options` VALUES (189,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1688555641;s:7:\"checked\";a:1:{s:14:\"wordpresstheme\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (216,'recovery_mode_email_last_sent','1688556442','yes');
INSERT INTO `wp_options` VALUES (360,'chatgpt_client_api_key','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','yes');
INSERT INTO `wp_options` VALUES (370,'wp_calendar_block_has_published_posts','1','yes');
INSERT INTO `wp_options` VALUES (505,'secure_auth_key','N@ ,Rd?+O?`L`&Ts_WK1tgF;[69>K2z*}E!(ZVXi>W?kAAuZw<+C0uZcf [7jllZ','no');
INSERT INTO `wp_options` VALUES (506,'secure_auth_salt','hkq/*T#H]$t9HUDlvX ]?GmGYsu8rTguL6rvB81dzRId*yq@V77ALMr1f.4n|k$A','no');
INSERT INTO `wp_options` VALUES (687,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1688557156;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (926,'ccg_chatgpt_api_key','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','yes');
INSERT INTO `wp_options` VALUES (927,'ccg_chatgpt_temperature','0.7','yes');
INSERT INTO `wp_options` VALUES (928,'ccg_chatgpt_max_tokens','3500','yes');
INSERT INTO `wp_options` VALUES (929,'ccg_unsplash_api_key','rmtgjG8hm-Wko3Q6cR9TrpkEezIOXWDgHUl_7boirQA','yes');
INSERT INTO `wp_options` VALUES (930,'ccg_pixabay_api_key','36016466-c05a337cc6a4767e4e7bfa33d','yes');
INSERT INTO `wp_options` VALUES (931,'ccg_chatgpt_prompt','Write a comprehensible, SEO-friendly article between 1000 - 2000 words . Your writing should be in simple English and should not reveal any signs of AI generation. Include necessary tips and strategies relevant to the topic if you think it is required. The audience for this article includes entrepreneurs, business owners, and professional expertise. Craft an engaging and representative title, a brief synopsis of the article, and choose up to three suitable tags and two categories. The final content should be formatted as follows:\r\n[title]Article Title[/title]\r\n[excerpt]Article Summary[/excerpt]\r\n[tags]Article Tags, comma-separated[/tags]\r\n[categories]Article Categories, comma-separated[/categories]\r\n[details]Article Details, use HTML tags such as p, heading, ul, span.\r\nEnsure to incorporate keywords and phrases that are relevant to the topic and the audiences interests for better SEO.\r\nThe tone of the article should be professional yet accessible, to appeal to a wide audience including business owners and entrepreneurs.','yes');
INSERT INTO `wp_options` VALUES (941,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (1035,'_site_transient_timeout_php_check_9522db31646a2e4672d744b6f556967b','1688989025','no');
INSERT INTO `wp_options` VALUES (1036,'_site_transient_php_check_9522db31646a2e4672d744b6f556967b','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no');
INSERT INTO `wp_options` VALUES (1045,'_site_transient_timeout_browser_14d58a1ba286f087d9736249ec785314','1689083180','no');
INSERT INTO `wp_options` VALUES (1046,'_site_transient_browser_14d58a1ba286f087d9736249ec785314','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"114.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no');
INSERT INTO `wp_options` VALUES (1055,'_transient_pll_languages_list','a:2:{i:0;a:27:{s:7:\"term_id\";i:2;s:4:\"name\";s:2:\"ar\";s:4:\"slug\";s:2:\"ar\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:2;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:2:\"ar\";s:6:\"parent\";i:0;s:5:\"count\";i:2;s:10:\"tl_term_id\";i:3;s:19:\"tl_term_taxonomy_id\";i:3;s:8:\"tl_count\";i:1;s:6:\"locale\";R:9;s:6:\"is_rtl\";i:1;s:3:\"w3c\";s:2:\"ar\";s:8:\"facebook\";s:5:\"ar_AR\";s:8:\"flag_url\";s:97:\"https://wordpress.website/wp-content/plugins/localization/vendor/wpsyntex/polylang/flags/arab.png\";s:4:\"flag\";s:650:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAYAAAB24g05AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAAPwAAAD8BR5eJ4AAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAEOSURBVCiRpZHNSsNQEEbPTXOtoc1NmyhFK6ioCLXioq4UdOtz+Ia+g+7cFQURhYClikRtqGkTm8SFbkrSWHC23w9nZgTnnZR/jFYkiiRFJMX9+izBSRbZ6ks0BPcrEZ42np+g7SuOqiFi/xUOXji1Qtq+mo/ACSW2GvJsN9DkElEy4UH2qdeGOCOJV/4qJmhqJgsqpLNzzHLFpqEcTlpnKCugqZl/E/SiAU5osWkZGHINfxSwrgS3I4teNAA57ReZN6Zw+GlTW/XY3t0A4PHO5e2pzrX5DmK6IHtEAV3jAzXew70UuFeC6rhFtzLIhHNXAAhLCRfBDaXyjxwHE2I9Jz2rACDWBTHxrys/DPAN4YpPXyWy3BoAAAAASUVORK5CYII=\" title=\"ar\" alt=\"ar\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:8:\"home_url\";s:34:\"https://wordpress.website/ar/home/\";s:10:\"search_url\";s:29:\"https://wordpress.website/ar/\";s:4:\"host\";N;s:5:\"mo_id\";s:1:\"7\";s:13:\"page_on_front\";i:83;s:14:\"page_for_posts\";b:0;s:6:\"filter\";s:3:\"raw\";s:9:\"flag_code\";s:4:\"arab\";s:9:\"fallbacks\";a:0:{}}i:1;a:27:{s:7:\"term_id\";i:5;s:4:\"name\";s:2:\"en\";s:4:\"slug\";s:2:\"en\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:5;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:2:\"en\";s:6:\"parent\";i:0;s:5:\"count\";i:18;s:10:\"tl_term_id\";i:6;s:19:\"tl_term_taxonomy_id\";i:6;s:8:\"tl_count\";i:5;s:6:\"locale\";R:36;s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:2:\"en\";s:8:\"facebook\";N;s:8:\"flag_url\";s:95:\"https://wordpress.website/wp-content/plugins/localization/vendor/wpsyntex/polylang/flags/us.png\";s:4:\"flag\";s:926:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHzSURBVHjaYkxOP8IAB//+Mfz7w8Dwi4HhP5CcJb/n/7evb16/APL/gRFQDiAAw3JuAgAIBEDQ/iswEERjGzBQLEru97ll0g0+3HvqMn1SpqlqGsZMsZsIe0SICA5gt5a/AGIEarCPtFh+6N/ffwxA9OvP/7//QYwff/6fZahmePeB4dNHhi+fGb59Y4zyvHHmCEAAAW3YDzQYaJJ93a+vX79aVf58//69fvEPlpIfnz59+vDhw7t37968efP3b/SXL59OnjwIEEAsDP+YgY53b2b89++/awvLn98MDi2cVxl+/vl6mituCtBghi9f/v/48e/XL86krj9XzwEEEENy8g6gu22rfn78+NGs5Ofr16+ZC58+fvyYwX8rxOxXr169fPny+fPn1//93bJlBUAAsQADZMEBxj9/GBxb2P/9+S/R8u3vzxuyaX8ZHv3j8/YGms3w8ycQARmi2eE37t4ACCDGR4/uSkrKAS35B3TT////wADOgLOBIaXIyjBlwxKAAGKRXjCB0SOEaeu+/y9fMnz4AHQxCP348R/o+l+//sMZQBNLEvif3AcIIMZbty7Ly6t9ZmXl+fXj/38GoHH/UcGfP79//BBiYHjy9+8/oUkNAAHEwt1V/vI/KBY/QSISFqM/GBg+MzB8A6PfYC5EFiDAABqgW776MP0rAAAAAElFTkSuQmCC\" title=\"en\" alt=\"en\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:8:\"home_url\";s:34:\"https://wordpress.website/en/home/\";s:10:\"search_url\";s:29:\"https://wordpress.website/en/\";s:4:\"host\";N;s:5:\"mo_id\";s:1:\"8\";s:13:\"page_on_front\";i:81;s:14:\"page_for_posts\";b:0;s:6:\"filter\";s:3:\"raw\";s:9:\"flag_code\";s:2:\"us\";s:9:\"fallbacks\";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (1062,'rewrite_rules','a:139:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:56:\"^(ar|en)/wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:92:\"index.php?lang=$matches[1]&sitemap=$matches[2]&sitemap-subtype=$matches[3]&paged=$matches[4]\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:42:\"^(ar|en)/wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:64:\"index.php?lang=$matches[1]&sitemap=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:55:\"(ar|en)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:50:\"(ar|en)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:31:\"(ar|en)/category/(.+?)/embed/?$\";s:63:\"index.php?lang=$matches[1]&category_name=$matches[2]&embed=true\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:43:\"(ar|en)/category/(.+?)/page/?([0-9]{1,})/?$\";s:70:\"index.php?lang=$matches[1]&category_name=$matches[2]&paged=$matches[3]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:25:\"(ar|en)/category/(.+?)/?$\";s:52:\"index.php?lang=$matches[1]&category_name=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:52:\"(ar|en)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:47:\"(ar|en)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:28:\"(ar|en)/tag/([^/]+)/embed/?$\";s:53:\"index.php?lang=$matches[1]&tag=$matches[2]&embed=true\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:40:\"(ar|en)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?lang=$matches[1]&tag=$matches[2]&paged=$matches[3]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:22:\"(ar|en)/tag/([^/]+)/?$\";s:42:\"index.php?lang=$matches[1]&tag=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:53:\"(ar|en)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:48:\"(ar|en)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:29:\"(ar|en)/type/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&post_format=$matches[2]&embed=true\";s:41:\"(ar|en)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:23:\"(ar|en)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:40:\"(ar|en)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:35:\"(ar|en)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:16:\"(ar|en)/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:28:\"(ar|en)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:35:\"(ar|en)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?lang=$matches[1]&&page_id=81&cpage=$matches[2]\";s:10:\"(ar|en)/?$\";s:26:\"index.php?lang=$matches[1]\";s:49:\"(ar|en)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:44:\"(ar|en)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:25:\"(ar|en)/comments/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:52:\"(ar|en)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:47:\"(ar|en)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:28:\"(ar|en)/search/(.+)/embed/?$\";s:51:\"index.php?lang=$matches[1]&s=$matches[2]&embed=true\";s:40:\"(ar|en)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:22:\"(ar|en)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:55:\"(ar|en)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:50:\"(ar|en)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:31:\"(ar|en)/author/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&author_name=$matches[2]&embed=true\";s:43:\"(ar|en)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:25:\"(ar|en)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:77:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:72:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:53:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:91:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&embed=true\";s:65:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:47:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:64:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:59:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:40:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:75:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&embed=true\";s:52:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:34:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:51:\"(ar|en)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:46:\"(ar|en)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:27:\"(ar|en)/([0-9]{4})/embed/?$\";s:54:\"index.php?lang=$matches[1]&year=$matches[2]&embed=true\";s:39:\"(ar|en)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:21:\"(ar|en)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:35:\"(ar|en)/.?.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"(ar|en)/.?.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"(ar|en)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"(ar|en)/.?.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"(ar|en)/(.?.+?)/embed/?$\";s:58:\"index.php?lang=$matches[1]&pagename=$matches[2]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:28:\"(ar|en)/(.?.+?)/trackback/?$\";s:52:\"index.php?lang=$matches[1]&pagename=$matches[2]&tb=1\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:48:\"(ar|en)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:43:\"(ar|en)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:36:\"(ar|en)/(.?.+?)/page/?([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&paged=$matches[3]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:43:\"(ar|en)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&cpage=$matches[3]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:32:\"(ar|en)/(.?.+?)(?:/([0-9]+))?/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&page=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:35:\"(ar|en)/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"(ar|en)/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"(ar|en)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"(ar|en)/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"(ar|en)/([^/]+)/embed/?$\";s:54:\"index.php?lang=$matches[1]&name=$matches[2]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:28:\"(ar|en)/([^/]+)/trackback/?$\";s:48:\"index.php?lang=$matches[1]&name=$matches[2]&tb=1\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:48:\"(ar|en)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:43:\"(ar|en)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:36:\"(ar|en)/([^/]+)/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:43:\"(ar|en)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:32:\"(ar|en)/([^/]+)(?:/([0-9]+))?/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&page=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:24:\"(ar|en)/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"(ar|en)/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"(ar|en)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"(ar|en)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"(ar|en)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"(ar|en)/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes');
INSERT INTO `wp_options` VALUES (1084,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (9,7,'_pll_strings_translations','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (10,8,'_pll_strings_translations','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (17,13,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (18,13,'_edit_lock','1681307575:1');
INSERT INTO `wp_postmeta` VALUES (19,14,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (20,14,'_edit_lock','1681475676:1');
INSERT INTO `wp_postmeta` VALUES (21,14,'wp_location_phone','+1 (478) 313-4438');
INSERT INTO `wp_postmeta` VALUES (22,14,'wp_location_email','decigebit@mailinator.com');
INSERT INTO `wp_postmeta` VALUES (23,14,'wp_location_address','Eos fugiat incididu');
INSERT INTO `wp_postmeta` VALUES (24,14,'wp_location_trading_hours_monday','28');
INSERT INTO `wp_postmeta` VALUES (25,14,'wp_location_trading_hours_tuesday','22');
INSERT INTO `wp_postmeta` VALUES (26,14,'wp_location_trading_hours_wednesday','13');
INSERT INTO `wp_postmeta` VALUES (27,14,'wp_location_trading_hours_thursday','1');
INSERT INTO `wp_postmeta` VALUES (28,14,'wp_location_trading_hours_friday','18');
INSERT INTO `wp_postmeta` VALUES (29,14,'wp_location_trading_hours_saturday','25');
INSERT INTO `wp_postmeta` VALUES (30,14,'wp_location_trading_hours_sunday','3');
INSERT INTO `wp_postmeta` VALUES (31,15,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (32,15,'_edit_lock','1681808327:1');
INSERT INTO `wp_postmeta` VALUES (33,15,'wp_location_phone','+1 (376) 323-2148');
INSERT INTO `wp_postmeta` VALUES (34,15,'wp_location_email','piba@mailinator.com');
INSERT INTO `wp_postmeta` VALUES (35,15,'wp_location_address','Adipisci inventore a');
INSERT INTO `wp_postmeta` VALUES (36,15,'wp_location_trading_hours_monday','4');
INSERT INTO `wp_postmeta` VALUES (37,15,'wp_location_trading_hours_tuesday','5');
INSERT INTO `wp_postmeta` VALUES (38,15,'wp_location_trading_hours_wednesday','5');
INSERT INTO `wp_postmeta` VALUES (39,15,'wp_location_trading_hours_thursday','25');
INSERT INTO `wp_postmeta` VALUES (40,15,'wp_location_trading_hours_friday','17');
INSERT INTO `wp_postmeta` VALUES (41,15,'wp_location_trading_hours_saturday','15');
INSERT INTO `wp_postmeta` VALUES (42,15,'wp_location_trading_hours_sunday','19');
INSERT INTO `wp_postmeta` VALUES (43,16,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (44,16,'_edit_lock','1681374956:1');
INSERT INTO `wp_postmeta` VALUES (45,18,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (46,18,'_edit_lock','1681375013:1');
INSERT INTO `wp_postmeta` VALUES (47,14,'news_likes','1');
INSERT INTO `wp_postmeta` VALUES (56,26,'_edit_lock','1682321161:1');
INSERT INTO `wp_postmeta` VALUES (59,28,'_edit_lock','1685088289:1');
INSERT INTO `wp_postmeta` VALUES (66,47,'_edit_lock','1683873892:1');
INSERT INTO `wp_postmeta` VALUES (67,47,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (72,56,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (73,56,'_edit_lock','1682424759:1');
INSERT INTO `wp_postmeta` VALUES (74,68,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (75,68,'_edit_lock','1682409930:1');
INSERT INTO `wp_postmeta` VALUES (76,77,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (77,77,'_edit_lock','1684221901:1');
INSERT INTO `wp_postmeta` VALUES (78,45,'_edit_lock','1683873495:1');
INSERT INTO `wp_postmeta` VALUES (79,81,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (80,81,'_edit_lock','1683875030:1');
INSERT INTO `wp_postmeta` VALUES (81,81,'_wp_page_template','page-home.php');
INSERT INTO `wp_postmeta` VALUES (82,83,'_wp_page_template','page-home.php');
INSERT INTO `wp_postmeta` VALUES (83,83,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (84,83,'_edit_lock','1683874577:1');
INSERT INTO `wp_postmeta` VALUES (97,86,'_wp_attached_file','2023/04/steel-gray-color-solid-background-1920x1080-1.png');
INSERT INTO `wp_postmeta` VALUES (98,86,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:57:\"2023/04/steel-gray-color-solid-background-1920x1080-1.png\";s:8:\"filesize\";i:1156;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:57:\"steel-gray-color-solid-background-1920x1080-1-300x169.png\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:662;}s:5:\"large\";a:5:{s:4:\"file\";s:58:\"steel-gray-color-solid-background-1920x1080-1-1024x576.png\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3712;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:57:\"steel-gray-color-solid-background-1920x1080-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:489;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:57:\"steel-gray-color-solid-background-1920x1080-1-768x432.png\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2325;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:58:\"steel-gray-color-solid-background-1920x1080-1-1536x864.png\";s:5:\"width\";i:1536;s:6:\"height\";i:864;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7233;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (99,77,'_thumbnail_id','86');
INSERT INTO `wp_postmeta` VALUES (100,88,'_thumbnail_id','86');
INSERT INTO `wp_postmeta` VALUES (101,88,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (102,88,'_edit_lock','1684221983:1');
INSERT INTO `wp_postmeta` VALUES (103,90,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (104,90,'_edit_lock','1684222109:1');
INSERT INTO `wp_postmeta` VALUES (105,90,'_wp_page_template','page-news.php');
INSERT INTO `wp_postmeta` VALUES (106,92,'_wp_page_template','page-news.php');
INSERT INTO `wp_postmeta` VALUES (107,92,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (108,92,'_edit_lock','1684221981:1');
INSERT INTO `wp_postmeta` VALUES (109,95,'_wp_attached_file','2023/05/photo-1457305237443-44c3d5a30b89-scaled-1.jpg');
INSERT INTO `wp_postmeta` VALUES (110,95,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:680;s:4:\"file\";s:53:\"2023/05/photo-1457305237443-44c3d5a30b89-scaled-1.jpg\";s:8:\"filesize\";i:62355;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-1-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14178;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6817;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-1-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:58522;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (111,94,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (112,94,'_edit_lock','1684494388:1');
INSERT INTO `wp_postmeta` VALUES (113,94,'_thumbnail_id','100');
INSERT INTO `wp_postmeta` VALUES (116,97,'_wp_attached_file','2023/05/photo-1457305237443-44c3d5a30b89-scaled-2.jpg');
INSERT INTO `wp_postmeta` VALUES (117,97,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:680;s:4:\"file\";s:53:\"2023/05/photo-1457305237443-44c3d5a30b89-scaled-2.jpg\";s:8:\"filesize\";i:62355;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-2-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14178;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6817;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-2-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:58522;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (120,98,'_wp_attached_file','2023/05/photo-1457305237443-44c3d5a30b89-scaled-3.jpg');
INSERT INTO `wp_postmeta` VALUES (121,98,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:680;s:4:\"file\";s:53:\"2023/05/photo-1457305237443-44c3d5a30b89-scaled-3.jpg\";s:8:\"filesize\";i:62355;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-3-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14178;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6817;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-3-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:58522;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (124,99,'_wp_attached_file','2023/05/photo-1457305237443-44c3d5a30b89-scaled-4.jpg');
INSERT INTO `wp_postmeta` VALUES (125,99,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:680;s:4:\"file\";s:53:\"2023/05/photo-1457305237443-44c3d5a30b89-scaled-4.jpg\";s:8:\"filesize\";i:62355;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-4-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14178;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6817;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-4-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:58522;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (128,100,'_wp_attached_file','2023/05/photo-1457305237443-44c3d5a30b89-scaled-5.jpg');
INSERT INTO `wp_postmeta` VALUES (129,100,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:680;s:4:\"file\";s:53:\"2023/05/photo-1457305237443-44c3d5a30b89-scaled-5.jpg\";s:8:\"filesize\";i:62355;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-5-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14178;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6817;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"photo-1457305237443-44c3d5a30b89-scaled-5-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:58522;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (132,28,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (135,104,'_wp_attached_file','2023/06/photo-1505330622279-bf7d7fc918f4-scaled.jpg');
INSERT INTO `wp_postmeta` VALUES (136,104,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1709;s:4:\"file\";s:51:\"2023/06/photo-1505330622279-bf7d7fc918f4-scaled.jpg\";s:8:\"filesize\";i:388574;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:44:\"photo-1505330622279-bf7d7fc918f4-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12604;}s:5:\"large\";a:5:{s:4:\"file\";s:45:\"photo-1505330622279-bf7d7fc918f4-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:89335;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:44:\"photo-1505330622279-bf7d7fc918f4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5399;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:44:\"photo-1505330622279-bf7d7fc918f4-768x513.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:513;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:56402;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:46:\"photo-1505330622279-bf7d7fc918f4-1536x1025.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1025;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:168240;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:46:\"photo-1505330622279-bf7d7fc918f4-2048x1367.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1367;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:268956;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:36:\"photo-1505330622279-bf7d7fc918f4.jpg\";}');
INSERT INTO `wp_postmeta` VALUES (137,103,'_thumbnail_id','104');
INSERT INTO `wp_postmeta` VALUES (138,103,'_edit_lock','1685621158:1');
INSERT INTO `wp_postmeta` VALUES (139,103,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (140,107,'_wp_attached_file','2023/06/photo-1517048676732-d65bc937f952-scaled.jpg');
INSERT INTO `wp_postmeta` VALUES (141,107,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:51:\"2023/06/photo-1517048676732-d65bc937f952-scaled.jpg\";s:8:\"filesize\";i:376444;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:44:\"photo-1517048676732-d65bc937f952-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14879;}s:5:\"large\";a:5:{s:4:\"file\";s:45:\"photo-1517048676732-d65bc937f952-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:88886;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:44:\"photo-1517048676732-d65bc937f952-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7058;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:44:\"photo-1517048676732-d65bc937f952-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:57773;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:46:\"photo-1517048676732-d65bc937f952-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:164935;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:46:\"photo-1517048676732-d65bc937f952-2048x1365.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1365;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:260385;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:36:\"photo-1517048676732-d65bc937f952.jpg\";}');
INSERT INTO `wp_postmeta` VALUES (142,106,'_thumbnail_id','107');
INSERT INTO `wp_postmeta` VALUES (143,106,'_edit_lock','1685621920:1');
INSERT INTO `wp_postmeta` VALUES (144,108,'_wp_attached_file','2023/06/g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640.jpg.jpg');
INSERT INTO `wp_postmeta` VALUES (145,108,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:427;s:4:\"file\";s:149:\"2023/06/g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640.jpg.jpg\";s:8:\"filesize\";i:56805;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:149:\"g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640.jpg-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16957;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:149:\"g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7713;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (146,109,'_wp_attached_file','2023/06/gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640.jpg.jpg');
INSERT INTO `wp_postmeta` VALUES (147,109,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:427;s:4:\"file\";s:149:\"2023/06/gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640.jpg.jpg\";s:8:\"filesize\";i:36691;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:149:\"gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640.jpg-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11736;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:149:\"gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5778;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (148,111,'_wp_attached_file','2023/06/g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640.jpg.jpg');
INSERT INTO `wp_postmeta` VALUES (149,111,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:427;s:4:\"file\";s:149:\"2023/06/g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640.jpg.jpg\";s:8:\"filesize\";i:40897;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:149:\"g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640.jpg-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12676;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:149:\"g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6321;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (150,110,'_thumbnail_id','111');
INSERT INTO `wp_postmeta` VALUES (151,110,'_edit_lock','1685622571:1');
INSERT INTO `wp_postmeta` VALUES (152,114,'_wp_attached_file','2023/06/g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640.jpg.jpg');
INSERT INTO `wp_postmeta` VALUES (153,114,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:400;s:4:\"file\";s:149:\"2023/06/g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640.jpg.jpg\";s:8:\"filesize\";i:17579;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:149:\"g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640.jpg-300x188.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5714;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:149:\"g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640.jpg-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2999;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (154,113,'_thumbnail_id','114');
INSERT INTO `wp_postmeta` VALUES (155,113,'_edit_lock','1685622995:1');
INSERT INTO `wp_postmeta` VALUES (172,123,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (173,123,'_edit_lock','1686315858:1');
INSERT INTO `wp_postmeta` VALUES (184,128,'_wp_attached_file','2023/06/test-2-scaled.webp');
INSERT INTO `wp_postmeta` VALUES (185,128,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:26:\"2023/06/test-2-scaled.webp\";s:8:\"filesize\";i:187646;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"test-2-300x200.webp\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:11024;}s:5:\"large\";a:5:{s:4:\"file\";s:20:\"test-2-1024x683.webp\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:58480;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"test-2-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:5764;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"test-2-768x512.webp\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:39404;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:21:\"test-2-1536x1024.webp\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:98154;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:21:\"test-2-2048x1365.webp\";s:5:\"width\";i:2048;s:6:\"height\";i:1365;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:142644;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:11:\"test-2.webp\";}');
INSERT INTO `wp_postmeta` VALUES (186,129,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (187,129,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (188,129,'_menu_item_object_id','90');
INSERT INTO `wp_postmeta` VALUES (189,129,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (190,129,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (191,129,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (192,129,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (193,129,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (195,130,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (196,130,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (197,130,'_menu_item_object_id','83');
INSERT INTO `wp_postmeta` VALUES (198,130,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (199,130,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (200,130,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (201,130,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (202,130,'_menu_item_url','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2023-04-07 11:44:58','2023-04-07 11:44:58','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2023-04-07 11:44:58','2023-04-07 11:44:58','',0,'http://wordpress.website/?p=1',0,'post','',1);
INSERT INTO `wp_posts` VALUES (7,1,'2023-04-12 13:45:03','2023-04-12 13:45:03','','polylang_mo_2','','private','closed','closed','','polylang_mo_2','','','2023-04-12 13:45:03','2023-04-12 13:45:03','',0,'http://wordpress.website/?post_type=polylang_mo&p=7',0,'polylang_mo','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2023-04-12 13:45:23','2023-04-12 13:45:23','','polylang_mo_5','','private','closed','closed','','polylang_mo_5','','','2023-04-12 13:45:23','2023-04-12 13:45:23','',0,'http://wordpress.website/?post_type=polylang_mo&p=8',0,'polylang_mo','',0);
INSERT INTO `wp_posts` VALUES (13,1,'2023-04-12 13:52:55','0000-00-00 00:00:00','location details goes here location details goes here location details goes here location details goes here ','location 1','','draft','closed','closed','','','','','2023-04-12 13:52:55','2023-04-12 13:52:55','',0,'http://wordpress.website/?post_type=wp_locations&#038;p=13',0,'wp_locations','',0);
INSERT INTO `wp_posts` VALUES (14,1,'2023-04-12 13:53:56','2023-04-12 13:53:56','Et modi eaque maxime','Omnis et reprehender','','publish','closed','closed','','omnis-et-reprehender','','','2023-04-14 12:15:50','2023-04-14 12:15:50','',0,'http://wordpress.website/?post_type=wp_locations&#038;p=14',0,'wp_locations','',0);
INSERT INTO `wp_posts` VALUES (15,1,'2023-04-12 13:54:39','2023-04-12 13:54:39','Tempor quae cillum d','Voluptatum sed odit','','publish','closed','closed','','voluptatum-sed-odit','','','2023-04-12 13:54:39','2023-04-12 13:54:39','',0,'http://wordpress.website/?post_type=wp_locations&#038;p=15',0,'wp_locations','',0);
INSERT INTO `wp_posts` VALUES (16,1,'2023-04-13 08:38:10','2023-04-13 08:38:10','test','test','','publish','closed','closed','','test','','','2023-04-13 08:38:10','2023-04-13 08:38:10','',0,'http://wordpress.website/?post_type=sliders&#038;p=16',0,'sliders','',0);
INSERT INTO `wp_posts` VALUES (17,1,'2023-04-13 08:38:10','2023-04-13 08:38:10','test','test','','inherit','closed','closed','','16-revision-v1','','','2023-04-13 08:38:10','2023-04-13 08:38:10','',16,'http://wordpress.website/?p=17',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (18,1,'2023-04-13 08:38:34','2023-04-13 08:38:34','فحص ','فحص','','publish','closed','closed','','%d9%81%d8%ad%d8%b5','','','2023-04-13 08:38:34','2023-04-13 08:38:34','',0,'http://wordpress.website/?post_type=sliders&#038;p=18',0,'sliders','',0);
INSERT INTO `wp_posts` VALUES (19,1,'2023-04-13 08:38:34','2023-04-13 08:38:34','فحص ','فحص','','inherit','closed','closed','','18-revision-v1','','','2023-04-13 08:38:34','2023-04-13 08:38:34','',18,'http://wordpress.website/?p=19',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2023-04-24 06:55:23','2023-04-24 06:55:23','\r\nSearch engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. By optimizing a website, it can rank higher in search engine results, which can lead to more visitors and more conversions.\r\n\r\nSEO is important for a website because it helps to increase visibility and traffic. When a website is optimized for search engines, it can appear higher in search engine results, which can lead to more visitors. This increased visibility can lead to more conversions, as more people are likely to click on the website when it appears higher in search engine results.\r\n\r\nSEO is also important for a website because it helps to improve the user experience. When a website is optimized for search engines, it can be easier to navigate and more user-friendly. This can lead to more visitors staying on the website longer, which can lead to more conversions.\r\n\r\nSEO is also important for a website because it can help to build trust and credibility. When a website is optimized for search engines, it can appear more professional and trustworthy. This can lead to more people trusting the website and being more likely to purchase products or services from it.\r\n\r\nOverall, SEO is an important part of any website’s success. By optimizing a website for search engines, it can appear higher in search engine results, which can lead to more visitors and more conversions. SEO can also help to improve the user experience, build trust and credibility, and increase visibility and traffic.','SEO is important','','publish','closed','open','','seo-is-important','','','2023-04-24 06:55:23','2023-04-24 06:55:23','',0,'http://wordpress.website/seo-is-important/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (28,1,'2023-04-24 08:41:20','2023-04-24 08:41:20','As a web developer, it is important to create a website that not only looks great but also attracts the right audience. SEO, or search engine optimization, is a crucial aspect of achieving this goal. In this article, we will discuss some SEO secrets for web developers that will help you attract the right audience to your website.\r\n\r\n1. Understand Your Target Audience\r\n\r\nBefore creating a website, it is important to understand your target audience. This will help you create content that is relevant and useful to them. Conduct market research to identify your target audience\'s demographics, interests, and pain points.\r\n\r\n2. Conduct Keyword Research\r\n\r\nKeyword research is the process of identifying the keywords that your target audience is searching for. Use tools like Google Keyword Planner to identify relevant keywords that have high search volume and low competition. Use these keywords in your website\'s content, headings, and meta descriptions.\r\n\r\n3. Optimize Your Website\'s Structure\r\n\r\nYour website\'s structure is an important aspect of SEO. Ensure that your website\'s navigation is easy to use and logical. Use descriptive headings and subheadings to make it easier for both users and search engines to understand your content.\r\n\r\n4. Create High-Quality Content\r\n\r\nCreating high-quality content is crucial to attracting the right audience to your website. Your content should be informative, engaging, and relevant to your target audience. Use your target keywords in your content, but avoid keyword stuffing.\r\n\r\n5. Optimize Your Website\'s Speed\r\n\r\nWebsite speed is an important ranking factor for search engines. Ensure that your website\'s loading time is fast by optimizing images, reducing server response time, and using a content delivery network (CDN).\r\n\r\n6. Use Social Media\r\n\r\nSocial media is a great way to attract the right audience to your website. Share your content on social media platforms like Facebook, Twitter, and LinkedIn. Use hashtags to reach a wider audience.\r\n\r\n7. Monitor Your Website\'s Analytics\r\n\r\nMonitoring your website\'s analytics is important to understand your website\'s performance. Use tools like Google Analytics to track your website\'s traffic, bounce rate, and engagement. Use this data to optimize your website for better performance.\r\n\r\nIn conclusion, SEO is a crucial aspect of web development that can help you attract the right audience to your website. By understanding your target audience, conducting keyword research, optimizing your website\'s structure, creating high-quality content, optimizing your website\'s speed, using social media, and monitoring your website\'s analytics, you can attract the right audience to your website and achieve your business goals.','Mobile responsiveness is becoming increasingly important','','publish','closed','open','','mobile-responsiveness-is-becoming-increasingly-important','','','2023-05-26 05:53:38','2023-05-26 05:53:38','',0,'http://wordpress.website/mobile-responsiveness-is-becoming-increasingly-important/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (45,1,'2023-04-24 10:46:06','2023-04-24 10:46:06','Search engine optimization (SEO) is the process of optimizing a website to improve its visibility in search engine results pages (SERPs). SEO is an important part of any digital marketing strategy and can help to increase website traffic, leads, and sales.\r\n\r\nSEO involves optimizing a website’s content, structure, and code to make it more visible to search engines. This includes optimizing titles, descriptions, and keywords, as well as creating content that is relevant to the target audience. Additionally, SEO involves improving the website’s usability and making sure it is mobile-friendly.\r\n\r\nSEO can be a complex and time-consuming process, but it is essential for any website that wants to be successful. By optimizing a website for search engines, businesses can increase their visibility and reach more potential customers. Additionally, SEO can help to improve the user experience of a website, making it easier for visitors to find what they are looking for.\r\n\r\nSEO is an ongoing process and requires regular maintenance and updates. It is important to stay up-to-date with the latest SEO trends and techniques to ensure that a website remains competitive in the SERPs. Additionally, businesses should monitor their website’s performance to identify areas for improvement.\r\n\r\nOverall, SEO is an essential part of any digital marketing strategy and can help to increase website traffic, leads, and sales. By optimizing a website for search engines, businesses can increase their visibility and reach more potential customers. Additionally, SEO can help to improve the user experience of a website, making it easier for visitors to find what they are looking for.','test','','publish','closed','open','','test','','','2023-04-24 10:46:06','2023-04-24 10:46:06','',0,'http://wordpress.website/test/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (46,1,'2023-04-24 11:15:08','2023-04-24 11:15:08','SEO is important because it helps your website rank higher in search engine results, which in turn drives more traffic to your website. This increased traffic can lead to more sales, leads, and brand awareness. SEO also helps to build trust and credibility with your target audience, as well as improve the user experience of your website.','','','publish','closed','open','','46-2','','','2023-04-24 11:15:08','2023-04-24 11:15:08','',0,'http://wordpress.website/46-2/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (47,1,'2023-04-24 11:15:15','2023-04-24 11:15:15','fasdfasf','SEO is important','','publish','closed','open','','seo-is-important-2','','','2023-04-24 12:46:43','2023-04-24 12:46:43','',0,'http://wordpress.website/seo-is-important-2/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (49,1,'2023-04-24 12:46:43','2023-04-24 12:46:43','fasdfasf','SEO is important','','inherit','closed','closed','','47-revision-v1','','','2023-04-24 12:46:43','2023-04-24 12:46:43','',47,'http://wordpress.website/?p=49',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (55,1,'2023-04-24 14:00:48','2023-04-24 14:00:48','\n\nSearch engine optimization (SEO) is the process of optimizing a website to improve its visibility in search engine results. SEO involves making changes to the website\'s content, structure, and code to make it more attractive to search engines and improve its ranking in search engine results. SEO can help a website to rank higher in search engine results, resulting in more website visitors and potential customers.','SEO is important','','inherit','closed','closed','','47-autosave-v1','','','2023-04-24 14:00:48','2023-04-24 14:00:48','',47,'http://wordpress.website/?p=55',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (56,1,'2023-04-25 12:12:39','0000-00-00 00:00:00','\n\nWordPress is the most popular content management system (CMS) in the world, powering over 35% of all websites on the internet. It is an open-source platform, meaning it is free to use and modify. It is also highly customizable, allowing users to create a website that is tailored to their specific needs. WordPress is also incredibly user-friendly, making it easy for anyone to create a website without needing to know any coding. Additionally, WordPress is highly secure, making it a great choice for businesses that need to protect sensitive data. Finally, WordPress is well-supported, with a large community of developers and users who are always willing to help.','Why WordPress is the Best Platform for Website Development','','draft','closed','open','','','','','2023-04-25 12:12:39','2023-04-25 12:12:39','',0,'http://wordpress.website/?p=56',0,'post','',0);
INSERT INTO `wp_posts` VALUES (68,1,'2023-04-25 07:18:27','0000-00-00 00:00:00','','','','draft','closed','closed','','','','','2023-04-25 07:18:27','2023-04-25 07:18:27','',0,'http://wordpress.website/?post_type=gallery&#038;p=68',0,'gallery','',0);
INSERT INTO `wp_posts` VALUES (77,1,'2023-05-16 07:27:17','2023-05-16 07:27:17','Search engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. It is a way to increase the visibility of a website and make it easier for potential customers to find it.\r\n\r\nSEO is important for any website because it helps to increase the visibility of the website in search engine results. This means that more people will be able to find the website and learn more about the products or services that it offers. SEO also helps to improve the user experience of the website. By optimizing the website for search engines, it can be easier to navigate and find the information that the user is looking for.\r\n\r\nSEO also helps to improve the credibility of a website. Search engines take into account the quality of a website’s content when ranking it in search results. If a website has high-quality content that is optimized for search engines, it will be more likely to rank higher in search results. This will help to increase the credibility of the website and make it more likely that potential customers will trust the website and purchase its products or services.\r\n\r\nSEO is also important for any website because it can help to increase the website’s traffic. By optimizing the website for search engines, it can be easier for potential customers to find the website. This can lead to an increase in website traffic, which can lead to more sales and revenue for the website.\r\n\r\nFinally, SEO is important for any website because it can help to improve the website’s ranking in search engine results. By optimizing the website for search engines, it can be easier for the website to rank higher in search results. This can lead to more visibility for the website and more potential customers.\r\n\r\nIn conclusion, SEO is an important part of any website’s success. It can help to increase the visibility of the website, improve the user experience, increase the credibility of the website, and improve the website’s ranking in search engine results. All of these factors can lead to more website traffic and more sales and revenue for the website.','Why SEO is important for any website','Search engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. It is a way to increase the visibility of a website and make it easier for potential customers to find it.','publish','closed','closed','','why-seo-is-important-for-any-website','','','2023-05-16 07:27:17','2023-05-16 07:27:17','',0,'http://wordpress.website/?post_type=news&#038;p=77',0,'news','',0);
INSERT INTO `wp_posts` VALUES (81,1,'2023-05-12 06:55:43','2023-05-12 06:55:43','test','Home','','publish','closed','closed','','home','','','2023-05-12 07:05:37','2023-05-12 07:05:37','',0,'http://wordpress.website/?page_id=81',0,'page','',0);
INSERT INTO `wp_posts` VALUES (82,1,'2023-05-12 06:55:43','2023-05-12 06:55:43','','Home','','inherit','closed','closed','','81-revision-v1','','','2023-05-12 06:55:43','2023-05-12 06:55:43','',81,'http://wordpress.website/?p=82',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (83,1,'2023-05-12 06:58:16','2023-05-12 06:58:16','','Home','','publish','closed','closed','','home','','','2023-05-12 06:58:16','2023-05-12 06:58:16','',0,'http://wordpress.website/?page_id=83',0,'page','',0);
INSERT INTO `wp_posts` VALUES (84,1,'2023-05-12 06:58:16','2023-05-12 06:58:16','','Home','','inherit','closed','closed','','83-revision-v1','','','2023-05-12 06:58:16','2023-05-12 06:58:16','',83,'http://wordpress.website/?p=84',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (85,1,'2023-05-12 07:05:37','2023-05-12 07:05:37','test','Home','','inherit','closed','closed','','81-revision-v1','','','2023-05-12 07:05:37','2023-05-12 07:05:37','',81,'http://wordpress.website/?p=85',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (86,1,'2023-05-16 07:27:10','2023-05-16 07:27:10','','steel-gray-color-solid-background-1920x1080','','inherit','closed','closed','','steel-gray-color-solid-background-1920x1080','','','2023-05-16 07:27:10','2023-05-16 07:27:10','',77,'http://wordpress.website/wp-content/uploads/2023/04/steel-gray-color-solid-background-1920x1080-1.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (87,1,'2023-05-16 07:27:17','2023-05-16 07:27:17','Search engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. It is a way to increase the visibility of a website and make it easier for potential customers to find it.\r\n\r\nSEO is important for any website because it helps to increase the visibility of the website in search engine results. This means that more people will be able to find the website and learn more about the products or services that it offers. SEO also helps to improve the user experience of the website. By optimizing the website for search engines, it can be easier to navigate and find the information that the user is looking for.\r\n\r\nSEO also helps to improve the credibility of a website. Search engines take into account the quality of a website’s content when ranking it in search results. If a website has high-quality content that is optimized for search engines, it will be more likely to rank higher in search results. This will help to increase the credibility of the website and make it more likely that potential customers will trust the website and purchase its products or services.\r\n\r\nSEO is also important for any website because it can help to increase the website’s traffic. By optimizing the website for search engines, it can be easier for potential customers to find the website. This can lead to an increase in website traffic, which can lead to more sales and revenue for the website.\r\n\r\nFinally, SEO is important for any website because it can help to improve the website’s ranking in search engine results. By optimizing the website for search engines, it can be easier for the website to rank higher in search results. This can lead to more visibility for the website and more potential customers.\r\n\r\nIn conclusion, SEO is an important part of any website’s success. It can help to increase the visibility of the website, improve the user experience, increase the credibility of the website, and improve the website’s ranking in search engine results. All of these factors can lead to more website traffic and more sales and revenue for the website.','Why SEO is important for any website','Search engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. It is a way to increase the visibility of a website and make it easier for potential customers to find it.','inherit','closed','closed','','77-revision-v1','','','2023-05-16 07:27:17','2023-05-16 07:27:17','',77,'http://wordpress.website/?p=87',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (88,1,'2023-05-16 07:27:35','2023-05-16 07:27:35','test','test','test','publish','closed','closed','','test','','','2023-05-16 07:27:35','2023-05-16 07:27:35','',0,'http://wordpress.website/?post_type=news&#038;p=88',0,'news','',0);
INSERT INTO `wp_posts` VALUES (89,1,'2023-05-16 07:27:35','2023-05-16 07:27:35','test','test','test','inherit','closed','closed','','88-revision-v1','','','2023-05-16 07:27:35','2023-05-16 07:27:35','',88,'http://wordpress.website/?p=89',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (90,1,'2023-05-16 07:27:48','2023-05-16 07:27:48','','News','','publish','closed','closed','','news','','','2023-05-16 07:27:48','2023-05-16 07:27:48','',0,'http://wordpress.website/?page_id=90',0,'page','',0);
INSERT INTO `wp_posts` VALUES (91,1,'2023-05-16 07:27:48','2023-05-16 07:27:48','','News','','inherit','closed','closed','','90-revision-v1','','','2023-05-16 07:27:48','2023-05-16 07:27:48','',90,'http://wordpress.website/?p=91',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (92,1,'2023-05-16 07:28:11','2023-05-16 07:28:11','الاخبار','الاخبار','','publish','closed','closed','','%d8%a7%d9%84%d8%a7%d8%ae%d8%a8%d8%a7%d8%b1','','','2023-05-16 07:28:11','2023-05-16 07:28:11','',0,'http://wordpress.website/?page_id=92',0,'page','',0);
INSERT INTO `wp_posts` VALUES (93,1,'2023-05-16 07:28:11','2023-05-16 07:28:11','الاخبار','الاخبار','','inherit','closed','closed','','92-revision-v1','','','2023-05-16 07:28:11','2023-05-16 07:28:11','',92,'http://wordpress.website/?p=93',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (94,1,'2023-05-19 10:53:31','2023-05-19 10:53:31','test','test','','publish','closed','open','','test-2','','','2023-05-19 11:03:31','2023-05-19 11:03:31','',0,'https://wordpress.website/?p=94',0,'post','',0);
INSERT INTO `wp_posts` VALUES (95,1,'2023-05-19 10:52:58','2023-05-19 10:52:58','','photo-1457305237443-44c3d5a30b89-scaled','','inherit','closed','closed','','photo-1457305237443-44c3d5a30b89-scaled','','','2023-05-19 10:52:58','2023-05-19 10:52:58','',94,'http://wordpress.website/wp-content/uploads/2023/05/photo-1457305237443-44c3d5a30b89-scaled-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (96,1,'2023-05-19 10:53:31','2023-05-19 10:53:31','test','test','','inherit','closed','closed','','94-revision-v1','','','2023-05-19 10:53:31','2023-05-19 10:53:31','',94,'https://wordpress.website/?p=96',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (97,1,'2023-05-19 10:57:41','2023-05-19 10:57:41','','photo-1457305237443-44c3d5a30b89-scaled','','inherit','closed','closed','','photo-1457305237443-44c3d5a30b89-scaled-2','','','2023-05-19 10:57:41','2023-05-19 10:57:41','',94,'http://wordpress.website/wp-content/uploads/2023/05/photo-1457305237443-44c3d5a30b89-scaled-2.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (98,1,'2023-05-19 11:00:29','2023-05-19 11:00:29','','photo-1457305237443-44c3d5a30b89-scaled','','inherit','closed','closed','','photo-1457305237443-44c3d5a30b89-scaled-3','','','2023-05-19 11:00:29','2023-05-19 11:00:29','',94,'http://wordpress.website/wp-content/uploads/2023/05/photo-1457305237443-44c3d5a30b89-scaled-3.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (99,1,'2023-05-19 11:00:53','2023-05-19 11:00:53','','photo-1457305237443-44c3d5a30b89-scaled','','inherit','closed','closed','','photo-1457305237443-44c3d5a30b89-scaled-4','','','2023-05-19 11:00:53','2023-05-19 11:00:53','',94,'http://wordpress.website/wp-content/uploads/2023/05/photo-1457305237443-44c3d5a30b89-scaled-4.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (100,1,'2023-05-19 11:03:20','2023-05-19 11:03:20','','photo-1457305237443-44c3d5a30b89-scaled','','inherit','closed','closed','','photo-1457305237443-44c3d5a30b89-scaled-5','','','2023-05-19 11:03:20','2023-05-19 11:03:20','',94,'http://wordpress.website/wp-content/uploads/2023/05/photo-1457305237443-44c3d5a30b89-scaled-5.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (102,1,'2023-05-26 05:53:38','2023-05-26 05:53:38','As a web developer, it is important to create a website that not only looks great but also attracts the right audience. SEO, or search engine optimization, is a crucial aspect of achieving this goal. In this article, we will discuss some SEO secrets for web developers that will help you attract the right audience to your website.\r\n\r\n1. Understand Your Target Audience\r\n\r\nBefore creating a website, it is important to understand your target audience. This will help you create content that is relevant and useful to them. Conduct market research to identify your target audience\'s demographics, interests, and pain points.\r\n\r\n2. Conduct Keyword Research\r\n\r\nKeyword research is the process of identifying the keywords that your target audience is searching for. Use tools like Google Keyword Planner to identify relevant keywords that have high search volume and low competition. Use these keywords in your website\'s content, headings, and meta descriptions.\r\n\r\n3. Optimize Your Website\'s Structure\r\n\r\nYour website\'s structure is an important aspect of SEO. Ensure that your website\'s navigation is easy to use and logical. Use descriptive headings and subheadings to make it easier for both users and search engines to understand your content.\r\n\r\n4. Create High-Quality Content\r\n\r\nCreating high-quality content is crucial to attracting the right audience to your website. Your content should be informative, engaging, and relevant to your target audience. Use your target keywords in your content, but avoid keyword stuffing.\r\n\r\n5. Optimize Your Website\'s Speed\r\n\r\nWebsite speed is an important ranking factor for search engines. Ensure that your website\'s loading time is fast by optimizing images, reducing server response time, and using a content delivery network (CDN).\r\n\r\n6. Use Social Media\r\n\r\nSocial media is a great way to attract the right audience to your website. Share your content on social media platforms like Facebook, Twitter, and LinkedIn. Use hashtags to reach a wider audience.\r\n\r\n7. Monitor Your Website\'s Analytics\r\n\r\nMonitoring your website\'s analytics is important to understand your website\'s performance. Use tools like Google Analytics to track your website\'s traffic, bounce rate, and engagement. Use this data to optimize your website for better performance.\r\n\r\nIn conclusion, SEO is a crucial aspect of web development that can help you attract the right audience to your website. By understanding your target audience, conducting keyword research, optimizing your website\'s structure, creating high-quality content, optimizing your website\'s speed, using social media, and monitoring your website\'s analytics, you can attract the right audience to your website and achieve your business goals.','Mobile responsiveness is becoming increasingly important','','inherit','closed','closed','','28-revision-v1','','','2023-05-26 05:53:38','2023-05-26 05:53:38','',28,'https://wordpress.website/?p=102',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (103,1,'2023-06-02 12:07:03','2023-06-02 12:07:03','In the past, having a website for a business was considered a luxury. However, with the increasing use of the internet and mobile devices, having an online presence has become a necessity. Here are some reasons why having a website is important for businesses:\r\n\r\n1. Increased visibility\r\nHaving a website enables your business to be visible to potential customers who are searching for your products or services online. Without a website, your business is missing out on a significant number of potential customers.\r\n\r\n2. Credibility\r\nA website provides a professional image for your business and enhances its credibility. Customers are more likely to trust a business that has a website than one that doesn\'t.\r\n\r\n3. Cost-effective marketing\r\nA website is a cost-effective way to market your business. Traditional advertising methods such as TV, radio, and print can be expensive. A website allows you to reach a wider audience at a lower cost.\r\n\r\n4. Accessible 24/7\r\nA website is accessible 24/7, which means that customers can access your business information and make purchases at any time of the day or night.\r\n\r\n5. Competitive advantage\r\nIn today\'s digital age, businesses that don\'t have a website are at a disadvantage. Having a website gives your business a competitive advantage over businesses that don\'t have an online presence.\r\n\r\n6. Customer insights\r\nA website allows you to track customer behavior and gain insights into their preferences and needs. This information can be used to improve your products or services and enhance the customer experience.\r\n\r\nIn conclusion, having a website is crucial for businesses in today\'s digital age. It provides increased visibility, credibility, cost-effective marketing, accessibility, a competitive advantage, and customer insights. If you don\'t have a website for your business, it\'s time to consider creating one.','The Importance of a Website for Businesses','In today\'s digital age, having a website for your business is crucial. This article discusses why having a website is important and how it can benefit your business.','publish','closed','open','','the-importance-of-a-website-for-businesses','','','2023-06-01 12:08:22','2023-06-01 12:08:22','',0,'https://wordpress.website/?p=103',0,'post','',0);
INSERT INTO `wp_posts` VALUES (104,1,'2023-06-01 12:07:14','2023-06-01 12:07:14','','photo-1505330622279-bf7d7fc918f4','','inherit','closed','closed','','photo-1505330622279-bf7d7fc918f4','','','2023-06-01 12:07:14','2023-06-01 12:07:14','',103,'http://wordpress.website/wp-content/uploads/2023/06/photo-1505330622279-bf7d7fc918f4.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (105,1,'2023-06-01 12:08:22','2023-06-01 12:08:22','In the past, having a website for a business was considered a luxury. However, with the increasing use of the internet and mobile devices, having an online presence has become a necessity. Here are some reasons why having a website is important for businesses:\r\n\r\n1. Increased visibility\r\nHaving a website enables your business to be visible to potential customers who are searching for your products or services online. Without a website, your business is missing out on a significant number of potential customers.\r\n\r\n2. Credibility\r\nA website provides a professional image for your business and enhances its credibility. Customers are more likely to trust a business that has a website than one that doesn\'t.\r\n\r\n3. Cost-effective marketing\r\nA website is a cost-effective way to market your business. Traditional advertising methods such as TV, radio, and print can be expensive. A website allows you to reach a wider audience at a lower cost.\r\n\r\n4. Accessible 24/7\r\nA website is accessible 24/7, which means that customers can access your business information and make purchases at any time of the day or night.\r\n\r\n5. Competitive advantage\r\nIn today\'s digital age, businesses that don\'t have a website are at a disadvantage. Having a website gives your business a competitive advantage over businesses that don\'t have an online presence.\r\n\r\n6. Customer insights\r\nA website allows you to track customer behavior and gain insights into their preferences and needs. This information can be used to improve your products or services and enhance the customer experience.\r\n\r\nIn conclusion, having a website is crucial for businesses in today\'s digital age. It provides increased visibility, credibility, cost-effective marketing, accessibility, a competitive advantage, and customer insights. If you don\'t have a website for your business, it\'s time to consider creating one.','The Importance of a Website for Businesses','In today\'s digital age, having a website for your business is crucial. This article discusses why having a website is important and how it can benefit your business.','inherit','closed','closed','','103-revision-v1','','','2023-06-01 12:08:22','2023-06-01 12:08:22','',103,'https://wordpress.website/?p=105',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (106,1,'2023-06-02 12:09:23','2023-06-02 12:09:23','\nIn today\'s digital age, having a personal website has become more important than ever before. Whether you are an entrepreneur, freelancer, artist, or simply someone looking to establish an online presence, having your own website can provide numerous benefits. Here are some reasons why having a personal website is important:\n\n1. Establishing your brand: A personal website allows you to showcase your skills, talents, and accomplishments to the world. It can serve as a virtual storefront or portfolio, where you can display your work, share your story, and connect with potential clients or employers.\n\n2. Building credibility: A well-designed and professional-looking website can help you establish credibility and authority in your field. It shows that you are serious about your work and are willing to invest time and resources in building your online presence.\n\n3. Increasing visibility: Having a personal website can make it easier for people to find you online. By optimizing your website for search engines, you can increase your visibility and attract more traffic to your site.\n\n4. Control over your online presence: With a personal website, you have full control over how you present yourself online. You can choose what information to share, how to present your work, and what kind of image you want to convey.\n\n5. Creating a hub for your online activities: Your personal website can serve as a hub for all your online activities, including social media profiles, blog posts, and other online content. This can make it easier for people to find and connect with you across different platforms.\n\nIn conclusion, having a personal website is a valuable investment in today\'s digital world. It can help you establish your brand, build credibility, increase visibility, and maintain control over your online presence. Whether you are an entrepreneur, freelancer, or simply someone looking to establish an online presence, a personal website can provide numerous benefits and help you achieve your goals. So why not create your own website today and start building your online presence?[/details]','Why Having a Personal Website Is Important','','publish','closed','open','','why-having-a-personal-website-is-important','','','2023-06-02 12:09:23','2023-06-02 12:09:23','',0,'https://wordpress.website/?p=106',0,'post','',0);
INSERT INTO `wp_posts` VALUES (107,1,'2023-06-01 12:09:27','2023-06-01 12:09:27','','photo-1517048676732-d65bc937f952','','inherit','closed','closed','','photo-1517048676732-d65bc937f952','','','2023-06-01 12:09:27','2023-06-01 12:09:27','',106,'http://wordpress.website/wp-content/uploads/2023/06/photo-1517048676732-d65bc937f952.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (108,1,'2023-06-01 12:21:23','2023-06-01 12:21:23','','g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640.jpg','','inherit','closed','closed','','g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640-jpg','','','2023-06-01 12:21:23','2023-06-01 12:21:23','',0,'http://wordpress.website/wp-content/uploads/2023/06/g90ac1a74fd67789bd333e2b99377fa4259428cea7ea3ebe112bed0a23a6d83fb624e5ea0c4cf5316e162cb26c10f164b3476ac86f87aaa113b6d9c17406873ac_640.jpg.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (109,1,'2023-06-01 12:22:35','2023-06-01 12:22:35','','gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640.jpg','','inherit','closed','closed','','gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640-jpg','','','2023-06-01 12:22:35','2023-06-01 12:22:35','',0,'http://wordpress.website/wp-content/uploads/2023/06/gf72fe5b1c7e5b3a23c092a8cd4f97f4fb7302f32db363338dd19df04f30d7c7ea8729276d07eb7d05c09c147790d2884f0ce2e6bb2ab685cc48d3fd0f9ef6d71_640.jpg.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (110,1,'2023-06-02 12:31:28','2023-06-02 12:31:28','\n<p>Small businesses have unique challenges when it comes to managing cash flow. While larger companies have more resources to manage their finances, small businesses often lack the necessary resources. This can make it difficult for small business owners to keep track of their cash flow, which can lead to cash flow problems. In this article, we will discuss effective strategies for managing cash flow in small businesses.</p>\n\n<h2>1. Create a Cash Flow Forecast</h2>\n<p>A cash flow forecast is a projection of your future cash inflows and outflows. It helps you to anticipate when you will have cash shortfalls and when you will have excess cash. This will allow you to plan your spending and financing accordingly.</p>\n\n<p>To create a cash flow forecast, start by listing all of your expected cash inflows for the next 12 months. This includes sales revenue, loans, and investments. Then, list all of your expected cash outflows, such as rent, salaries, and inventory purchases. Subtract your cash outflows from your cash inflows to calculate your net cash flow.</p>\n\n<p>Use your net cash flow to track your cash balance over time. This will help you to identify trends and anticipate any cash flow problems before they occur.</p>\n\n<h2>2. Monitor Your Accounts Receivable</h2>\n<p>Accounts receivable is the money that your customers owe you for goods or services that you have provided. It is important to monitor your accounts receivable to ensure that you are getting paid on time.</p>\n\n<p>To manage your accounts receivable, establish clear payment terms with your customers. Make sure that the terms are communicated clearly and that your customers understand them. Consider offering incentives for early payment, such as a discount on their next purchase.</p>\n\n<p>If you have customers who are consistently late with their payments, consider implementing a late fee policy. This will help to encourage prompt payment and discourage late payments.</p>\n\n<h2>3. Control Your Inventory</h2>\n<p>Inventory is one of the biggest expenses for small businesses. It is important to manage your inventory carefully to avoid tying up too much cash in unsold goods.</p>\n\n<p>Start by tracking your inventory levels regularly. Use a system that allows you to monitor your inventory in real-time. This will help you to identify slow-moving items and avoid overstocking.</p>\n\n<p>Consider implementing a just-in-time inventory system. This involves ordering inventory only when it is needed, rather than stockpiling it. This will help to reduce your inventory costs and free up cash for other expenses.</p>\n\n<h2>4. Negotiate Payment Terms with Your Suppliers</h2>\n<p>Just as it is important to manage your accounts receivable, it is important to manage your accounts payable. This includes negotiating payment terms with your suppliers.</p>\n\n<p>If you are a small business, you may not have the bargaining power of a larger company. However, you can still negotiate payment terms that work for you. Consider asking for extended payment terms or discounts for early payment.</p>\n\n<h2>5. Keep Your Personal and Business Finances Separate</h2>\n<p>One of the biggest mistakes that small business owners make is mixing their personal and business finances. This can make it difficult to track your cash flow and can lead to tax problems.</p>\n\n<p>Make sure that you have separate bank accounts and credit cards for your personal and business finances. This will help you to keep your finances organized and make it easier to manage your cash flow.</p>\n\n<h2>Conclusion</h2>\n<p>Effective cash flow management is crucial for the survival of small businesses. By creating a cash flow forecast, monitoring your accounts receivable, controlling your inventory, negotiating payment terms with your suppliers, and keeping your personal and business finances separate, you can improve your cash flow management and increase your chances of success.</p>\n</details>','Effective Strategies for Managing Cash Flow in Small Businesses','Cash flow management is crucial for the survival of small businesses. This article provides tips and strategies for effective cash flow management.','publish','closed','open','','effective-strategies-for-managing-cash-flow-in-small-businesses','','','2023-06-02 12:31:28','2023-06-02 12:31:28','',0,'https://wordpress.website/?p=110',0,'post','',0);
INSERT INTO `wp_posts` VALUES (111,1,'2023-06-01 12:31:29','2023-06-01 12:31:29','','g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640.jpg','','inherit','closed','closed','','g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640-jpg','','','2023-06-01 12:31:29','2023-06-01 12:31:29','',110,'http://wordpress.website/wp-content/uploads/2023/06/g5886ac9719d24401e3be962b9a2ac5477c71a5fe3537baee0939f60f5e2aeab73bed63366e71f520e4c004ccc91c7525d8ae791c651796988f4bac111a803293_640.jpg.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (113,1,'2023-06-02 12:34:23','2023-06-02 12:34:23','\nIn the past, having a website was considered a luxury for businesses, but in today\'s digital age, it is a necessity. Many consumers research businesses online before making a purchase, and without a website, your business may not even be on their radar. In this article, we\'ll discuss why having a website is crucial for your business success and provide tips on how to create an effective website.\n\n1. Your Website is Your Online Presence\nYour website is the face of your business online. It is the first impression that potential customers have of your brand. If your website is outdated, poorly designed, or difficult to navigate, it can turn potential customers away. A well-designed website that is easy to navigate can help you attract and retain customers.\n\n2. Your Website Helps You Reach a Wider Audience\nWith a website, your business can reach a wider audience than ever before. Your website is accessible to anyone with an internet connection, which means that you can reach potential customers who may not have heard of your business otherwise. Additionally, you can use search engine optimization (SEO) and social media marketing to drive traffic to your website, further expanding your reach.\n\n3. Your Website Helps You Build Credibility\nHaving a website can help you establish credibility with potential customers. A professional-looking website that is regularly updated with fresh content can show that your business is legitimate and trustworthy. Consumers are more likely to do business with a company that has a website than one that does not.\n\n4. Your Website Helps You Sell Your Products and Services\nYour website is a powerful tool for selling your products and services. You can create an online store that allows customers to purchase your products directly from your website. You can also use your website to showcase your services and provide detailed information about what you offer.\n\n5. Your Website Helps You Stand Out From the Competition\nIn today\'s crowded marketplace, it\'s essential to stand out from the competition. A well-designed website that is easy to navigate and provides valuable information can help you do just that. Additionally, you can use your website to showcase your unique selling proposition and highlight what sets your business apart from the competition.\n\nTips for Creating an Effective Website\nNow that you understand why having a website is crucial for your business success, it\'s time to create an effective website. Here are some tips to help you get started:\n\n1. Define Your Goals: Before you start building your website, you need to define your goals. What do you want your website to accomplish? Do you want to sell products online? Do you want to generate leads? Once you have defined your goals, you can create a plan to achieve them.\n\n2. Choose the Right Platform: There are many website platforms available, so it\'s important to choose the right one for your business. Consider factors such as ease of use, customization options, and cost when selecting a platform.\n\n3. Design Your Website: Your website design should be consistent with your brand and easy to navigate. Use high-quality images and clear, concise language to convey your message.\n\n4. Optimize Your Website for Search Engines: SEO is critical for driving traffic to your website. Use relevant keywords and phrases throughout your website and optimize your content for search engines.\n\n5. Make Your Website Mobile-Friendly: With more and more people accessing the internet on their mobile devices, it\'s essential to make your website mobile-friendly. A responsive design that adjusts to different screen sizes can ensure that your website looks great on any device.\n\nConclusion\nHaving a website is crucial for your business success in today\'s digital age. Your website is your online presence and can help you reach a wider audience, build credibility, sell your products and services, and stand out from the competition. By following the tips outlined in this article, you can create an effective website that helps you achieve your business goals.','Why Having a Website is Crucial for Your Business Success','In today\'s digital age, having a website is essential for any business. This article discusses why having a website is crucial for your business success and provides tips on how to create an effective website.','publish','closed','open','','why-having-a-website-is-crucial-for-your-business-success','','','2023-06-02 12:34:23','2023-06-02 12:34:23','',0,'https://wordpress.website/?p=113',0,'post','',0);
INSERT INTO `wp_posts` VALUES (114,1,'2023-06-01 12:34:23','2023-06-01 12:34:23','','g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640.jpg','','inherit','closed','closed','','g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640-jpg','','','2023-06-01 12:34:23','2023-06-01 12:34:23','',113,'http://wordpress.website/wp-content/uploads/2023/06/g66950136b5bd594c2d6a26cef85fde1ce3197a9ff848527317057b5a48ab8926054cd9f64b9fd6b0be888a1247bd12790eb516bae8c404bf729bd4f91c73d8d1_640.jpg.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (123,1,'2023-06-09 12:43:57','2023-06-09 12:43:57','','test','','publish','closed','open','','test-3','','','2023-06-09 12:48:54','2023-06-09 12:48:54','',0,'https://wordpress.website/?p=123',0,'post','',0);
INSERT INTO `wp_posts` VALUES (126,1,'2023-06-09 12:43:57','2023-06-09 12:43:57','','test','','inherit','closed','closed','','123-revision-v1','','','2023-06-09 12:43:57','2023-06-09 12:43:57','',123,'https://wordpress.website/?p=126',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (128,1,'2023-06-09 12:56:31','2023-06-09 12:56:31','','test','','inherit','closed','closed','','test-4','','','2023-06-09 12:56:31','2023-06-09 12:56:31','',0,'http://wordpress.website/wp-content/uploads/2023/06/test-2.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (129,1,'2023-07-05 11:01:08','2023-07-05 11:01:08',' ','','','publish','closed','closed','','129','','','2023-07-05 11:01:08','2023-07-05 11:01:08','',0,'https://wordpress.website/?p=129',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (130,1,'2023-07-05 11:01:08','2023-07-05 11:01:08',' ','','','publish','closed','closed','','130','','','2023-07-05 11:01:08','2023-07-05 11:01:08','',0,'https://wordpress.website/?p=130',1,'nav_menu_item','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
INSERT INTO `wp_term_relationships` VALUES (1,3,0);
INSERT INTO `wp_term_relationships` VALUES (1,4,0);
INSERT INTO `wp_term_relationships` VALUES (7,4,0);
INSERT INTO `wp_term_relationships` VALUES (7,6,0);
INSERT INTO `wp_term_relationships` VALUES (13,5,0);
INSERT INTO `wp_term_relationships` VALUES (14,5,0);
INSERT INTO `wp_term_relationships` VALUES (14,6,0);
INSERT INTO `wp_term_relationships` VALUES (14,15,0);
INSERT INTO `wp_term_relationships` VALUES (15,2,0);
INSERT INTO `wp_term_relationships` VALUES (16,5,0);
INSERT INTO `wp_term_relationships` VALUES (16,6,0);
INSERT INTO `wp_term_relationships` VALUES (16,13,0);
INSERT INTO `wp_term_relationships` VALUES (16,17,0);
INSERT INTO `wp_term_relationships` VALUES (18,2,0);
INSERT INTO `wp_term_relationships` VALUES (18,6,0);
INSERT INTO `wp_term_relationships` VALUES (18,13,0);
INSERT INTO `wp_term_relationships` VALUES (18,19,0);
INSERT INTO `wp_term_relationships` VALUES (20,6,0);
INSERT INTO `wp_term_relationships` VALUES (20,21,0);
INSERT INTO `wp_term_relationships` VALUES (26,1,0);
INSERT INTO `wp_term_relationships` VALUES (26,5,0);
INSERT INTO `wp_term_relationships` VALUES (26,14,0);
INSERT INTO `wp_term_relationships` VALUES (26,16,0);
INSERT INTO `wp_term_relationships` VALUES (26,18,0);
INSERT INTO `wp_term_relationships` VALUES (28,5,0);
INSERT INTO `wp_term_relationships` VALUES (28,7,0);
INSERT INTO `wp_term_relationships` VALUES (28,18,0);
INSERT INTO `wp_term_relationships` VALUES (28,20,0);
INSERT INTO `wp_term_relationships` VALUES (45,1,0);
INSERT INTO `wp_term_relationships` VALUES (45,5,0);
INSERT INTO `wp_term_relationships` VALUES (46,1,0);
INSERT INTO `wp_term_relationships` VALUES (46,5,0);
INSERT INTO `wp_term_relationships` VALUES (47,5,0);
INSERT INTO `wp_term_relationships` VALUES (47,7,0);
INSERT INTO `wp_term_relationships` VALUES (56,5,0);
INSERT INTO `wp_term_relationships` VALUES (56,7,0);
INSERT INTO `wp_term_relationships` VALUES (77,5,0);
INSERT INTO `wp_term_relationships` VALUES (77,23,0);
INSERT INTO `wp_term_relationships` VALUES (81,5,0);
INSERT INTO `wp_term_relationships` VALUES (81,22,0);
INSERT INTO `wp_term_relationships` VALUES (83,2,0);
INSERT INTO `wp_term_relationships` VALUES (83,22,0);
INSERT INTO `wp_term_relationships` VALUES (86,5,0);
INSERT INTO `wp_term_relationships` VALUES (88,2,0);
INSERT INTO `wp_term_relationships` VALUES (88,23,0);
INSERT INTO `wp_term_relationships` VALUES (90,5,0);
INSERT INTO `wp_term_relationships` VALUES (90,24,0);
INSERT INTO `wp_term_relationships` VALUES (92,2,0);
INSERT INTO `wp_term_relationships` VALUES (92,24,0);
INSERT INTO `wp_term_relationships` VALUES (94,5,0);
INSERT INTO `wp_term_relationships` VALUES (94,7,0);
INSERT INTO `wp_term_relationships` VALUES (95,5,0);
INSERT INTO `wp_term_relationships` VALUES (97,5,0);
INSERT INTO `wp_term_relationships` VALUES (98,5,0);
INSERT INTO `wp_term_relationships` VALUES (99,5,0);
INSERT INTO `wp_term_relationships` VALUES (100,5,0);
INSERT INTO `wp_term_relationships` VALUES (103,5,0);
INSERT INTO `wp_term_relationships` VALUES (103,7,0);
INSERT INTO `wp_term_relationships` VALUES (106,5,0);
INSERT INTO `wp_term_relationships` VALUES (106,7,0);
INSERT INTO `wp_term_relationships` VALUES (110,5,0);
INSERT INTO `wp_term_relationships` VALUES (110,25,0);
INSERT INTO `wp_term_relationships` VALUES (110,26,0);
INSERT INTO `wp_term_relationships` VALUES (110,27,0);
INSERT INTO `wp_term_relationships` VALUES (110,28,0);
INSERT INTO `wp_term_relationships` VALUES (110,29,0);
INSERT INTO `wp_term_relationships` VALUES (113,5,0);
INSERT INTO `wp_term_relationships` VALUES (113,16,0);
INSERT INTO `wp_term_relationships` VALUES (113,25,0);
INSERT INTO `wp_term_relationships` VALUES (113,30,0);
INSERT INTO `wp_term_relationships` VALUES (113,31,0);
INSERT INTO `wp_term_relationships` VALUES (113,32,0);
INSERT INTO `wp_term_relationships` VALUES (113,33,0);
INSERT INTO `wp_term_relationships` VALUES (123,7,0);
INSERT INTO `wp_term_relationships` VALUES (129,10,0);
INSERT INTO `wp_term_relationships` VALUES (130,10,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,4);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'language','a:3:{s:6:\"locale\";s:2:\"ar\";s:3:\"rtl\";i:1;s:9:\"flag_code\";s:4:\"arab\";}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'term_language','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'term_translations','a:2:{s:2:\"ar\";i:1;s:2:\"en\";i:7;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (5,5,'language','a:3:{s:6:\"locale\";s:2:\"en\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"us\";}',0,18);
INSERT INTO `wp_term_taxonomy` VALUES (6,6,'term_language','',0,5);
INSERT INTO `wp_term_taxonomy` VALUES (7,7,'category','',0,6);
INSERT INTO `wp_term_taxonomy` VALUES (10,10,'nav_menu','',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (11,11,'nav_menu','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (13,13,'post_translations','a:2:{s:2:\"ar\";i:18;s:2:\"en\";i:16;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (14,14,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (15,15,'term_translations','a:1:{s:2:\"en\";i:14;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (16,16,'post_tag','',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (17,17,'term_translations','a:1:{s:2:\"en\";i:16;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (18,18,'post_tag','',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (19,19,'term_translations','a:1:{s:2:\"en\";i:18;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (20,20,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (21,21,'term_translations','a:1:{s:2:\"en\";i:20;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (22,22,'post_translations','a:2:{s:2:\"ar\";i:83;s:2:\"en\";i:81;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (23,23,'post_translations','a:2:{s:2:\"ar\";i:88;s:2:\"en\";i:77;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (24,24,'post_translations','a:2:{s:2:\"ar\";i:92;s:2:\"en\";i:90;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (25,25,'category','',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (26,26,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (27,27,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (28,28,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (29,29,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (30,30,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (31,31,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (32,32,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (33,33,'post_tag','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
INSERT INTO `wp_terms` VALUES (2,'ar','ar',0);
INSERT INTO `wp_terms` VALUES (3,'ar','pll_ar',0);
INSERT INTO `wp_terms` VALUES (4,'pll_6436b5def0319','pll_6436b5def0319',0);
INSERT INTO `wp_terms` VALUES (5,'en','en',0);
INSERT INTO `wp_terms` VALUES (6,'en','pll_en',0);
INSERT INTO `wp_terms` VALUES (7,'Uncategorized','uncategorized-en',0);
INSERT INTO `wp_terms` VALUES (10,'Main Menu En','main-menu-en',0);
INSERT INTO `wp_terms` VALUES (11,'Main Menu Ar','main-menu-ar',0);
INSERT INTO `wp_terms` VALUES (13,'pll_6437bf8a492df','pll_6437bf8a492df',0);
INSERT INTO `wp_terms` VALUES (14,'SEO','seo',0);
INSERT INTO `wp_terms` VALUES (15,'pll_644627db55cb3','pll_644627db55cb3',0);
INSERT INTO `wp_terms` VALUES (16,'website','website',0);
INSERT INTO `wp_terms` VALUES (17,'pll_644627db691dd','pll_644627db691dd',0);
INSERT INTO `wp_terms` VALUES (18,'important','important',0);
INSERT INTO `wp_terms` VALUES (19,'pll_644627db7de69','pll_644627db7de69',0);
INSERT INTO `wp_terms` VALUES (20,'mobile responsive','mobile-responsive',0);
INSERT INTO `wp_terms` VALUES (21,'pll_644640b0425b0','pll_644640b0425b0',0);
INSERT INTO `wp_terms` VALUES (22,'pll_645de388d7026','pll_645de388d7026',0);
INSERT INTO `wp_terms` VALUES (23,'pll_646330673dc01','pll_646330673dc01',0);
INSERT INTO `wp_terms` VALUES (24,'pll_6463308bdea30','pll_6463308bdea30',0);
INSERT INTO `wp_terms` VALUES (25,'Business','business',0);
INSERT INTO `wp_terms` VALUES (26,'Finance','finance',0);
INSERT INTO `wp_terms` VALUES (27,'cash flow','cash-flow',0);
INSERT INTO `wp_terms` VALUES (28,'small business','small-business',0);
INSERT INTO `wp_terms` VALUES (29,'management','management',0);
INSERT INTO `wp_terms` VALUES (30,'Digital Marketing','digital-marketing',0);
INSERT INTO `wp_terms` VALUES (31,'Entrepreneurship','entrepreneurship',0);
INSERT INTO `wp_terms` VALUES (32,'business','business',0);
INSERT INTO `wp_terms` VALUES (33,'success','success',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','test');
INSERT INTO `wp_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `wp_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `wp_usermeta` VALUES (4,1,'description','');
INSERT INTO `wp_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (6,1,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (7,1,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (8,1,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (9,1,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (10,1,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (11,1,'locale','');
INSERT INTO `wp_usermeta` VALUES (12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (13,1,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (14,1,'dismissed_wp_pointers','');
INSERT INTO `wp_usermeta` VALUES (15,1,'show_welcome_panel','1');
INSERT INTO `wp_usermeta` VALUES (16,1,'session_tokens','a:4:{s:64:\"6263dce3c1ae69efff6dfcb53ec3ea061a8069edcbee5ab53181d15b02f7da2d\";a:4:{s:10:\"expiration\";i:1688651179;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\";s:5:\"login\";i:1688478379;}s:64:\"f0e0433628c00e345d28ce3e4329f58bad463eb6052e15fbbcdea90ff41d572f\";a:4:{s:10:\"expiration\";i:1688654357;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\";s:5:\"login\";i:1688481557;}s:64:\"c58ec94f6401809d0978b1c1e9b6fb8bbde2ef80ee260e24d80d4e984d569cbc\";a:4:{s:10:\"expiration\";i:1688707959;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\";s:5:\"login\";i:1688535159;}s:64:\"0874d89c7de799ddae3c3c8d6be2fd94805612a21b68f31aa9041ff93aa1ca77\";a:4:{s:10:\"expiration\";i:1688716445;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\";s:5:\"login\";i:1688543645;}}');
INSERT INTO `wp_usermeta` VALUES (17,1,'wp_dashboard_quick_press_last_post_id','115');
INSERT INTO `wp_usermeta` VALUES (18,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}');
INSERT INTO `wp_usermeta` VALUES (19,1,'metaboxhidden_nav-menus','a:5:{i:0;s:21:\"add-post-type-sliders\";i:1;s:20:\"add-post-type-events\";i:2;s:18:\"add-post-type-news\";i:3;s:26:\"add-post-type-wp_locations\";i:4;s:12:\"add-post_tag\";}');
INSERT INTO `wp_usermeta` VALUES (20,1,'wp_user-settings','libraryContent=browse&editor=tinymce');
INSERT INTO `wp_usermeta` VALUES (21,1,'wp_user-settings-time','1685622891');
INSERT INTO `wp_usermeta` VALUES (22,1,'closedpostboxes_post','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (23,1,'metaboxhidden_post','a:4:{i:0;s:13:\"trackbacksdiv\";i:1;s:16:\"commentstatusdiv\";i:2;s:7:\"slugdiv\";i:3;s:9:\"authordiv\";}');
INSERT INTO `wp_usermeta` VALUES (24,1,'meta-box-order_post','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:58:\"ml_box,submitdiv,categorydiv,tagsdiv-post_tag,postimagediv\";s:6:\"normal\";s:77:\"postexcerpt,trackbacksdiv,commentstatusdiv,slugdiv,authordiv,chatgpt-meta-box\";s:8:\"advanced\";s:0:\"\";}');
INSERT INTO `wp_usermeta` VALUES (25,1,'screen_layout_post','2');
INSERT INTO `wp_usermeta` VALUES (26,1,'meta-box-order_news','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:43:\"ml_box,submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:19:\"slugdiv,postexcerpt\";s:8:\"advanced\";s:0:\"\";}');
INSERT INTO `wp_usermeta` VALUES (27,1,'screen_layout_news','2');
INSERT INTO `wp_usermeta` VALUES (28,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}');
INSERT INTO `wp_usermeta` VALUES (29,1,'pll_filter_content','');
INSERT INTO `wp_usermeta` VALUES (30,1,'nav_menu_recently_edited','10');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'test','$P$B2FtBXM7WI1nYlt9JQY6v/wDym8eW50','test','ahmed@fi.ae','http://wordpress.website','2023-04-07 11:44:58','',0,'test');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-05 18:05:31

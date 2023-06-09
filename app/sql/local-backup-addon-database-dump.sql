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
-- Table structure for table `wp_chat_key`
--

DROP TABLE IF EXISTS `wp_chat_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_chat_key` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `publickey` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
  `api_token` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `temperature` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `max_tokens` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
  `name` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_options` VALUES (33,'active_plugins','a:4:{i:0;s:29:\"localization/localization.php\";i:1;s:17:\"ChatGPT/index.php\";i:2;s:25:\"contact-us/contact-us.php\";i:3;s:21:\"custom-fields/acf.php\";}','yes');
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
INSERT INTO `wp_options` VALUES (51,'show_on_front','posts','yes');
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
INSERT INTO `wp_options` VALUES (82,'page_on_front','0','yes');
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
INSERT INTO `wp_options` VALUES (105,'cron','a:8:{i:1682581499;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1682595182;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1682595899;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1682602962;a:2:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1682602963;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1682619931;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1682768699;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes');
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
INSERT INTO `wp_options` VALUES (123,'recovery_keys','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (124,'theme_mods_twentytwentythree','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1681306972;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','yes');
INSERT INTO `wp_options` VALUES (125,'https_detection_errors','a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}','yes');
INSERT INTO `wp_options` VALUES (126,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.2.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-6.2-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.2-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.2\";s:7:\"version\";s:3:\"6.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1682580842;s:15:\"version_checked\";s:3:\"6.2\";s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (138,'_transient_health-check-site-status-result','{\"good\":13,\"recommended\":4,\"critical\":1}','yes');
INSERT INTO `wp_options` VALUES (141,'auth_key','wCV=R,J`C4cuOP+G2N;8[~xcW*_t)aGE,/k=5?}K5):xr]w!W}QVbM?52E|dH>3{','no');
INSERT INTO `wp_options` VALUES (142,'auth_salt','N,D[Xl2VSD,/iE!Zm2$f^m?A1&#j$-~&:7ipKeef.# N]U~U3!?WFthM?&u9OfY}','no');
INSERT INTO `wp_options` VALUES (143,'logged_in_key','x;tZj!b0<~T#n|!D1+Ve/sB&_0Us86=YVdU:&#jlmjci`gyWEXc-@F_ydN(jbds~','no');
INSERT INTO `wp_options` VALUES (144,'logged_in_salt','3Z3&LSybSB`#dC$QyH9S=v{cZ)`T()y##r^A@ia{29/Eg5V4-zq8-G>4L$eNq8:z','no');
INSERT INTO `wp_options` VALUES (160,'can_compress_scripts','1','no');
INSERT INTO `wp_options` VALUES (161,'current_theme','wordpress theme','yes');
INSERT INTO `wp_options` VALUES (162,'theme_mods_wordpresstheme','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:10;}s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (163,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (164,'recently_activated','a:3:{s:41:\"wp-location-plugin/wp-location-plugin.php\";i:1682424423;s:41:\"chatgpt-wordpress-main/chatgpt-client.php\";i:1682319183;s:38:\"chatgpt-wordpress-api-main/chatgpt.php\";i:1682316490;}','yes');
INSERT INTO `wp_options` VALUES (167,'finished_updating_comment_type','1','yes');
INSERT INTO `wp_options` VALUES (168,'polylang','a:15:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:9:\"uninstall\";i:0;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:4:{i:0;s:7:\"sliders\";i:1;s:6:\"events\";i:2;s:4:\"news\";i:3;s:12:\"wp_locations\";}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"7.7.1\";s:16:\"first_activation\";i:1681307031;s:12:\"default_lang\";s:2:\"en\";s:9:\"nav_menus\";a:1:{s:14:\"wordpresstheme\";a:1:{s:6:\"menu-1\";a:2:{s:2:\"ar\";i:11;s:2:\"en\";i:10;}}}}','yes');
INSERT INTO `wp_options` VALUES (169,'polylang_wpml_strings','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (170,'widget_wp_location_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (171,'widget_polylang','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (172,'acf_version','14.3','yes');
INSERT INTO `wp_options` VALUES (183,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (185,'_transient_pll_translated_slugs','a:8:{s:8:\"category\";a:2:{s:4:\"slug\";s:8:\"category\";s:12:\"translations\";a:2:{s:2:\"ar\";s:8:\"category\";s:2:\"en\";s:8:\"category\";}}s:8:\"post_tag\";a:2:{s:4:\"slug\";s:3:\"tag\";s:12:\"translations\";a:2:{s:2:\"ar\";s:3:\"tag\";s:2:\"en\";s:3:\"tag\";}}s:11:\"post_format\";a:2:{s:4:\"slug\";s:4:\"type\";s:12:\"translations\";a:2:{s:2:\"ar\";s:4:\"type\";s:2:\"en\";s:4:\"type\";}}s:6:\"author\";a:2:{s:4:\"slug\";s:6:\"author\";s:12:\"translations\";a:2:{s:2:\"ar\";s:6:\"author\";s:2:\"en\";s:6:\"author\";}}s:6:\"search\";a:2:{s:4:\"slug\";s:6:\"search\";s:12:\"translations\";a:2:{s:2:\"ar\";s:6:\"search\";s:2:\"en\";s:6:\"search\";}}s:10:\"attachment\";a:2:{s:4:\"slug\";s:10:\"attachment\";s:12:\"translations\";a:2:{s:2:\"ar\";s:10:\"attachment\";s:2:\"en\";s:10:\"attachment\";}}s:5:\"paged\";a:2:{s:4:\"slug\";s:4:\"page\";s:12:\"translations\";a:2:{s:2:\"ar\";s:4:\"page\";s:2:\"en\";s:4:\"page\";}}s:5:\"front\";a:2:{s:4:\"slug\";s:0:\"\";s:12:\"translations\";a:2:{s:2:\"ar\";s:0:\"\";s:2:\"en\";s:0:\"\";}}}','yes');
INSERT INTO `wp_options` VALUES (188,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1682573231;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (189,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1682573233;s:7:\"checked\";a:1:{s:14:\"wordpresstheme\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (199,'rewrite_rules','a:224:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:56:\"^(ar|en)/wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:92:\"index.php?lang=$matches[1]&sitemap=$matches[2]&sitemap-subtype=$matches[3]&paged=$matches[4]\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:42:\"^(ar|en)/wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:64:\"index.php?lang=$matches[1]&sitemap=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:20:\"(ar|en)/locations/?$\";s:49:\"index.php?lang=$matches[1]&post_type=wp_locations\";s:50:\"(ar|en)/locations/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=wp_locations&feed=$matches[2]\";s:45:\"(ar|en)/locations/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=wp_locations&feed=$matches[2]\";s:37:\"(ar|en)/locations/page/([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&post_type=wp_locations&paged=$matches[2]\";s:55:\"(ar|en)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:50:\"(ar|en)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:31:\"(ar|en)/category/(.+?)/embed/?$\";s:63:\"index.php?lang=$matches[1]&category_name=$matches[2]&embed=true\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:43:\"(ar|en)/category/(.+?)/page/?([0-9]{1,})/?$\";s:70:\"index.php?lang=$matches[1]&category_name=$matches[2]&paged=$matches[3]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:25:\"(ar|en)/category/(.+?)/?$\";s:52:\"index.php?lang=$matches[1]&category_name=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:52:\"(ar|en)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:47:\"(ar|en)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:28:\"(ar|en)/tag/([^/]+)/embed/?$\";s:53:\"index.php?lang=$matches[1]&tag=$matches[2]&embed=true\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:40:\"(ar|en)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?lang=$matches[1]&tag=$matches[2]&paged=$matches[3]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:22:\"(ar|en)/tag/([^/]+)/?$\";s:42:\"index.php?lang=$matches[1]&tag=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:53:\"(ar|en)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:48:\"(ar|en)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:29:\"(ar|en)/type/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&post_format=$matches[2]&embed=true\";s:41:\"(ar|en)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:23:\"(ar|en)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:40:\"(ar|en)/events/.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:32:\"events/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"(ar|en)/events/.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:42:\"events/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"(ar|en)/events/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:62:\"events/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"(ar|en)/events/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\"events/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"(ar|en)/events/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:57:\"events/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"(ar|en)/events/.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:38:\"events/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"(ar|en)/events/(.+?)/embed/?$\";s:57:\"index.php?lang=$matches[1]&sliders=$matches[2]&embed=true\";s:21:\"events/(.+?)/embed/?$\";s:40:\"index.php?sliders=$matches[1]&embed=true\";s:33:\"(ar|en)/events/(.+?)/trackback/?$\";s:51:\"index.php?lang=$matches[1]&sliders=$matches[2]&tb=1\";s:25:\"events/(.+?)/trackback/?$\";s:34:\"index.php?sliders=$matches[1]&tb=1\";s:41:\"(ar|en)/events/(.+?)/page/?([0-9]{1,})/?$\";s:64:\"index.php?lang=$matches[1]&sliders=$matches[2]&paged=$matches[3]\";s:33:\"events/(.+?)/page/?([0-9]{1,})/?$\";s:47:\"index.php?sliders=$matches[1]&paged=$matches[2]\";s:48:\"(ar|en)/events/(.+?)/comment-page-([0-9]{1,})/?$\";s:64:\"index.php?lang=$matches[1]&sliders=$matches[2]&cpage=$matches[3]\";s:40:\"events/(.+?)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?sliders=$matches[1]&cpage=$matches[2]\";s:37:\"(ar|en)/events/(.+?)(?:/([0-9]+))?/?$\";s:63:\"index.php?lang=$matches[1]&sliders=$matches[2]&page=$matches[3]\";s:29:\"events/(.+?)(?:/([0-9]+))?/?$\";s:46:\"index.php?sliders=$matches[1]&page=$matches[2]\";s:38:\"(ar|en)/news/.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:30:\"news/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:48:\"(ar|en)/news/.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:40:\"news/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:68:\"(ar|en)/news/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:60:\"news/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"(ar|en)/news/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:55:\"news/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"(ar|en)/news/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:55:\"news/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"(ar|en)/news/.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:36:\"news/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"(ar|en)/news/(.+?)/embed/?$\";s:54:\"index.php?lang=$matches[1]&news=$matches[2]&embed=true\";s:19:\"news/(.+?)/embed/?$\";s:37:\"index.php?news=$matches[1]&embed=true\";s:31:\"(ar|en)/news/(.+?)/trackback/?$\";s:48:\"index.php?lang=$matches[1]&news=$matches[2]&tb=1\";s:23:\"news/(.+?)/trackback/?$\";s:31:\"index.php?news=$matches[1]&tb=1\";s:39:\"(ar|en)/news/(.+?)/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&news=$matches[2]&paged=$matches[3]\";s:31:\"news/(.+?)/page/?([0-9]{1,})/?$\";s:44:\"index.php?news=$matches[1]&paged=$matches[2]\";s:46:\"(ar|en)/news/(.+?)/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&news=$matches[2]&cpage=$matches[3]\";s:38:\"news/(.+?)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?news=$matches[1]&cpage=$matches[2]\";s:35:\"(ar|en)/news/(.+?)(?:/([0-9]+))?/?$\";s:60:\"index.php?lang=$matches[1]&news=$matches[2]&page=$matches[3]\";s:27:\"news/(.+?)(?:/([0-9]+))?/?$\";s:43:\"index.php?news=$matches[1]&page=$matches[2]\";s:45:\"(ar|en)/locations/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:37:\"locations/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:55:\"(ar|en)/locations/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:47:\"locations/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:75:\"(ar|en)/locations/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:67:\"locations/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"(ar|en)/locations/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:62:\"locations/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"(ar|en)/locations/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:62:\"locations/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"(ar|en)/locations/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:43:\"locations/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"(ar|en)/locations/([^/]+)/embed/?$\";s:62:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&embed=true\";s:26:\"locations/([^/]+)/embed/?$\";s:45:\"index.php?wp_locations=$matches[1]&embed=true\";s:38:\"(ar|en)/locations/([^/]+)/trackback/?$\";s:56:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&tb=1\";s:30:\"locations/([^/]+)/trackback/?$\";s:39:\"index.php?wp_locations=$matches[1]&tb=1\";s:58:\"(ar|en)/locations/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:68:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&feed=$matches[3]\";s:50:\"locations/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?wp_locations=$matches[1]&feed=$matches[2]\";s:53:\"(ar|en)/locations/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:68:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&feed=$matches[3]\";s:45:\"locations/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?wp_locations=$matches[1]&feed=$matches[2]\";s:46:\"(ar|en)/locations/([^/]+)/page/?([0-9]{1,})/?$\";s:69:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&paged=$matches[3]\";s:38:\"locations/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?wp_locations=$matches[1]&paged=$matches[2]\";s:53:\"(ar|en)/locations/([^/]+)/comment-page-([0-9]{1,})/?$\";s:69:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&cpage=$matches[3]\";s:45:\"locations/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?wp_locations=$matches[1]&cpage=$matches[2]\";s:42:\"(ar|en)/locations/([^/]+)(?:/([0-9]+))?/?$\";s:68:\"index.php?lang=$matches[1]&wp_locations=$matches[2]&page=$matches[3]\";s:34:\"locations/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?wp_locations=$matches[1]&page=$matches[2]\";s:34:\"(ar|en)/locations/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:26:\"locations/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"(ar|en)/locations/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:36:\"locations/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"(ar|en)/locations/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:56:\"locations/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"(ar|en)/locations/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:51:\"locations/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"(ar|en)/locations/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:51:\"locations/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"(ar|en)/locations/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:32:\"locations/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:40:\"(ar|en)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:35:\"(ar|en)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:16:\"(ar|en)/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:28:\"(ar|en)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:10:\"(ar|en)/?$\";s:26:\"index.php?lang=$matches[1]\";s:49:\"(ar|en)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:44:\"(ar|en)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:25:\"(ar|en)/comments/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:52:\"(ar|en)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:47:\"(ar|en)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:28:\"(ar|en)/search/(.+)/embed/?$\";s:51:\"index.php?lang=$matches[1]&s=$matches[2]&embed=true\";s:40:\"(ar|en)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:22:\"(ar|en)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:55:\"(ar|en)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:50:\"(ar|en)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:31:\"(ar|en)/author/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&author_name=$matches[2]&embed=true\";s:43:\"(ar|en)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:25:\"(ar|en)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:77:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:72:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:53:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:91:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&embed=true\";s:65:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:47:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:64:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:59:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:40:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:75:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&embed=true\";s:52:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:34:\"(ar|en)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:51:\"(ar|en)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:46:\"(ar|en)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:27:\"(ar|en)/([0-9]{4})/embed/?$\";s:54:\"index.php?lang=$matches[1]&year=$matches[2]&embed=true\";s:39:\"(ar|en)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:21:\"(ar|en)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:35:\"(ar|en)/.?.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"(ar|en)/.?.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"(ar|en)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"(ar|en)/.?.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"(ar|en)/(.?.+?)/embed/?$\";s:58:\"index.php?lang=$matches[1]&pagename=$matches[2]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:28:\"(ar|en)/(.?.+?)/trackback/?$\";s:52:\"index.php?lang=$matches[1]&pagename=$matches[2]&tb=1\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:48:\"(ar|en)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:43:\"(ar|en)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:36:\"(ar|en)/(.?.+?)/page/?([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&paged=$matches[3]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:43:\"(ar|en)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&cpage=$matches[3]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:32:\"(ar|en)/(.?.+?)(?:/([0-9]+))?/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&page=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:35:\"(ar|en)/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"(ar|en)/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"(ar|en)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"(ar|en)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"(ar|en)/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"(ar|en)/([^/]+)/embed/?$\";s:54:\"index.php?lang=$matches[1]&name=$matches[2]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:28:\"(ar|en)/([^/]+)/trackback/?$\";s:48:\"index.php?lang=$matches[1]&name=$matches[2]&tb=1\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:48:\"(ar|en)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:43:\"(ar|en)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:36:\"(ar|en)/([^/]+)/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:43:\"(ar|en)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:32:\"(ar|en)/([^/]+)(?:/([0-9]+))?/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&page=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:24:\"(ar|en)/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"(ar|en)/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"(ar|en)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"(ar|en)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"(ar|en)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"(ar|en)/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes');
INSERT INTO `wp_options` VALUES (216,'recovery_mode_email_last_sent','1682404854','yes');
INSERT INTO `wp_options` VALUES (348,'_site_transient_timeout_php_check_9522db31646a2e4672d744b6f556967b','1682917701','no');
INSERT INTO `wp_options` VALUES (349,'_site_transient_php_check_9522db31646a2e4672d744b6f556967b','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no');
INSERT INTO `wp_options` VALUES (354,'_site_transient_timeout_browser_d9c544d0aaddfd20c051a0811f2f382d','1682917725','no');
INSERT INTO `wp_options` VALUES (355,'_site_transient_browser_d9c544d0aaddfd20c051a0811f2f382d','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"112.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no');
INSERT INTO `wp_options` VALUES (360,'chatgpt_client_api_key','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','yes');
INSERT INTO `wp_options` VALUES (370,'wp_calendar_block_has_published_posts','1','yes');
INSERT INTO `wp_options` VALUES (505,'secure_auth_key','N@ ,Rd?+O?`L`&Ts_WK1tgF;[69>K2z*}E!(ZVXi>W?kAAuZw<+C0uZcf [7jllZ','no');
INSERT INTO `wp_options` VALUES (506,'secure_auth_salt','hkq/*T#H]$t9HUDlvX ]?GmGYsu8rTguL6rvB81dzRId*yq@V77ALMr1f.4n|k$A','no');
INSERT INTO `wp_options` VALUES (514,'_site_transient_timeout_available_translations','1682584004','no');
INSERT INTO `wp_options` VALUES (515,'_site_transient_available_translations','a:130:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-05-13 15:59:22\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"am\";a:8:{s:8:\"language\";s:2:\"am\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-09-29 20:43:49\";s:12:\"english_name\";s:7:\"Amharic\";s:11:\"native_name\";s:12:\"አማርኛ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.0.3/am.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"am\";i:2;s:3:\"amh\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"ቀጥል\";}}s:3:\"arg\";a:8:{s:8:\"language\";s:3:\"arg\";s:7:\"version\";s:8:\"6.2-beta\";s:7:\"updated\";s:19:\"2022-09-22 16:46:56\";s:12:\"english_name\";s:9:\"Aragonese\";s:11:\"native_name\";s:9:\"Aragonés\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/6.2-beta/arg.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"an\";i:2;s:3:\"arg\";i:3;s:3:\"arg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continar\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-02 03:21:35\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"متابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.21/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-26 09:32:50\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.22/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-24 17:24:25\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-10-31 08:48:37\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.12/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-10-30 03:24:38\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-02-22 20:45:53\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-30 16:46:59\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-09 07:39:36\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-29 09:00:46\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-25 08:06:58\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-02 19:47:35\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-28 07:33:50\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/6.2/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-29 21:14:35\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-10 00:05:59\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/6.2/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-28 07:37:41\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dsb\";a:8:{s:8:\"language\";s:3:\"dsb\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2022-07-16 12:13:09\";s:12:\"english_name\";s:13:\"Lower Sorbian\";s:11:\"native_name\";s:16:\"Dolnoserbšćina\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/6.2/dsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"dsb\";i:3;s:3:\"dsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Dalej\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-18 09:00:29\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-07 21:00:17\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-19 10:51:23\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2021-12-24 12:36:39\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.0.3/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-04-01 22:35:34\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.0.3/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-18 07:25:08\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-20 04:54:08\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-04 07:22:04\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-15 19:52:49\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-02-22 17:37:32\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-14 22:16:37\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-25 15:10:18\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_EC\";a:8:{s:8:\"language\";s:5:\"es_EC\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-21 13:32:10\";s:12:\"english_name\";s:17:\"Spanish (Ecuador)\";s:11:\"native_name\";s:19:\"Español de Ecuador\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_EC.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-10-04 20:53:18\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.6/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_DO\";a:8:{s:8:\"language\";s:5:\"es_DO\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-10-08 14:32:50\";s:12:\"english_name\";s:28:\"Spanish (Dominican Republic)\";s:11:\"native_name\";s:33:\"Español de República Dominicana\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.6/es_DO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-06-14 16:02:22\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-31 18:33:26\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.12/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-11 17:42:00\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:6:\"5.2.17\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.2.17/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-08-12 08:38:59\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-21 17:46:00\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-05 06:53:02\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"fa_AF\";a:8:{s:8:\"language\";s:5:\"fa_AF\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-13 11:28:33\";s:12:\"english_name\";s:21:\"Persian (Afghanistan)\";s:11:\"native_name\";s:31:\"(فارسی (افغانستان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/fa_AF.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-29 07:54:36\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-19 20:54:32\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-21 13:20:47\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-22 13:54:46\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.21/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"fy\";a:8:{s:8:\"language\";s:2:\"fy\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2022-12-25 12:53:23\";s:12:\"english_name\";s:7:\"Frisian\";s:11:\"native_name\";s:5:\"Frysk\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/fy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fy\";i:2;s:3:\"fry\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Trochgean\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-18 12:45:47\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.22/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:6:\"4.4.29\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.4.29/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-14 21:14:16\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-11-06 12:34:38\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.12/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"जारी रखें\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-17 11:08:02\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-02-22 17:37:32\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/6.2/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-24 19:47:36\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-08 23:10:42\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2018-12-11 10:40:02\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.22/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-24 17:34:58\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-30 13:21:15\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2019-02-16 23:58:56\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.22/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-24 08:01:09\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.0.3/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-01-21 21:13:06\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/6.2/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2018-07-10 11:35:44\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.22/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:6:\"5.2.17\";s:7:\"updated\";s:19:\"2019-06-10 16:18:28\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.17/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:5:\"6.1.1\";s:7:\"updated\";s:19:\"2022-10-20 17:15:28\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.1.1/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-30 09:50:37\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-24 16:15:49\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/6.2/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"6.1.1\";s:7:\"updated\";s:19:\"2022-11-24 03:51:58\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.1.1/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-02 00:14:51\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"6.0.3\";s:7:\"updated\";s:19:\"2022-10-01 09:23:52\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.0.3/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-09 01:41:47\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2019-11-22 15:32:08\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.22/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"5.5.11\";s:7:\"updated\";s:19:\"2022-03-11 13:52:22\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.5.11/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.2.34\";s:7:\"updated\";s:19:\"2017-12-26 11:57:10\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.34/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-28 17:21:06\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-03 04:46:20\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-13 12:17:01\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-30 10:02:03\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-02-22 21:20:14\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/6.2/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-18 10:59:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.21/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:15:\"Panjabi (India)\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-31 08:04:21\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.3.30\";s:7:\"updated\";s:19:\"2015-12-02 21:41:29\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.3.30/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2022-10-01 12:16:29\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-30 23:24:56\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/6.2/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-21 10:51:56\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-29 21:22:43\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-22 15:57:02\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-20 06:23:24\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-07-07 01:53:37\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/5.4.12/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-09 10:02:55\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-03 08:30:58\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/6.2/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2022-11-11 12:48:55\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-19 12:09:33\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2021-08-01 21:21:06\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.6/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-16 21:07:17\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:6:\"5.3.14\";s:7:\"updated\";s:19:\"2019-10-13 15:35:35\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.3.14/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:5:\"ta_LK\";a:8:{s:8:\"language\";s:5:\"ta_LK\";s:7:\"version\";s:6:\"4.2.34\";s:7:\"updated\";s:19:\"2015-12-03 01:07:44\";s:12:\"english_name\";s:17:\"Tamil (Sri Lanka)\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.34/ta_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"தொடர்க\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.8.6\";s:7:\"updated\";s:19:\"2022-06-08 04:30:30\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.6/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:6:\"4.8.21\";s:7:\"updated\";s:19:\"2017-09-30 09:04:29\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.21/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-28 20:25:07\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:6:\"4.9.22\";s:7:\"updated\";s:19:\"2021-07-03 18:41:33\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.22/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"6.1.1\";s:7:\"updated\";s:19:\"2023-03-04 10:46:30\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.1.1/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:6:\"5.4.12\";s:7:\"updated\";s:19:\"2020-04-09 11:17:33\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.12/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-28 12:02:22\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-10 01:15:33\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/6.2/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2022-07-15 15:25:03\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:12:\"香港中文\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-04-23 22:48:55\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:3:\"6.2\";s:7:\"updated\";s:19:\"2023-03-28 17:14:41\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}','no');
INSERT INTO `wp_options` VALUES (516,'_site_transient_timeout_theme_roots','1682575009','no');
INSERT INTO `wp_options` VALUES (517,'_site_transient_theme_roots','a:1:{s:14:\"wordpresstheme\";s:7:\"/themes\";}','no');
INSERT INTO `wp_options` VALUES (518,'_transient_pll_languages_list','a:2:{i:0;a:27:{s:7:\"term_id\";i:2;s:4:\"name\";s:2:\"ar\";s:4:\"slug\";s:2:\"ar\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:2;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:2:\"ar\";s:6:\"parent\";i:0;s:5:\"count\";i:3;s:10:\"tl_term_id\";i:3;s:19:\"tl_term_taxonomy_id\";i:3;s:8:\"tl_count\";i:1;s:6:\"locale\";R:9;s:6:\"is_rtl\";i:1;s:3:\"w3c\";s:2:\"ar\";s:8:\"facebook\";s:5:\"ar_AR\";s:8:\"flag_url\";s:96:\"http://wordpress.website/wp-content/plugins/localization/vendor/wpsyntex/polylang/flags/arab.png\";s:4:\"flag\";s:650:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAYAAAB24g05AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAAPwAAAD8BR5eJ4AAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAEOSURBVCiRpZHNSsNQEEbPTXOtoc1NmyhFK6ioCLXioq4UdOtz+Ia+g+7cFQURhYClikRtqGkTm8SFbkrSWHC23w9nZgTnnZR/jFYkiiRFJMX9+izBSRbZ6ks0BPcrEZ42np+g7SuOqiFi/xUOXji1Qtq+mo/ACSW2GvJsN9DkElEy4UH2qdeGOCOJV/4qJmhqJgsqpLNzzHLFpqEcTlpnKCugqZl/E/SiAU5osWkZGHINfxSwrgS3I4teNAA57ReZN6Zw+GlTW/XY3t0A4PHO5e2pzrX5DmK6IHtEAV3jAzXew70UuFeC6rhFtzLIhHNXAAhLCRfBDaXyjxwHE2I9Jz2rACDWBTHxrys/DPAN4YpPXyWy3BoAAAAASUVORK5CYII=\" title=\"ar\" alt=\"ar\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:8:\"home_url\";s:28:\"http://wordpress.website/ar/\";s:10:\"search_url\";s:28:\"http://wordpress.website/ar/\";s:4:\"host\";N;s:5:\"mo_id\";s:1:\"7\";s:13:\"page_on_front\";N;s:14:\"page_for_posts\";N;s:6:\"filter\";s:3:\"raw\";s:9:\"flag_code\";s:4:\"arab\";s:9:\"fallbacks\";a:0:{}}i:1;a:27:{s:7:\"term_id\";i:5;s:4:\"name\";s:2:\"en\";s:4:\"slug\";s:2:\"en\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:5;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:2:\"en\";s:6:\"parent\";i:0;s:5:\"count\";i:9;s:10:\"tl_term_id\";i:6;s:19:\"tl_term_taxonomy_id\";i:6;s:8:\"tl_count\";i:5;s:6:\"locale\";R:36;s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:2:\"en\";s:8:\"facebook\";N;s:8:\"flag_url\";s:94:\"http://wordpress.website/wp-content/plugins/localization/vendor/wpsyntex/polylang/flags/us.png\";s:4:\"flag\";s:926:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHzSURBVHjaYkxOP8IAB//+Mfz7w8Dwi4HhP5CcJb/n/7evb16/APL/gRFQDiAAw3JuAgAIBEDQ/iswEERjGzBQLEru97ll0g0+3HvqMn1SpqlqGsZMsZsIe0SICA5gt5a/AGIEarCPtFh+6N/ffwxA9OvP/7//QYwff/6fZahmePeB4dNHhi+fGb59Y4zyvHHmCEAAAW3YDzQYaJJ93a+vX79aVf58//69fvEPlpIfnz59+vDhw7t37968efP3b/SXL59OnjwIEEAsDP+YgY53b2b89++/awvLn98MDi2cVxl+/vl6mituCtBghi9f/v/48e/XL86krj9XzwEEEENy8g6gu22rfn78+NGs5Ofr16+ZC58+fvyYwX8rxOxXr169fPny+fPn1//93bJlBUAAsQADZMEBxj9/GBxb2P/9+S/R8u3vzxuyaX8ZHv3j8/YGms3w8ycQARmi2eE37t4ACCDGR4/uSkrKAS35B3TT////wADOgLOBIaXIyjBlwxKAAGKRXjCB0SOEaeu+/y9fMnz4AHQxCP348R/o+l+//sMZQBNLEvif3AcIIMZbty7Ly6t9ZmXl+fXj/38GoHH/UcGfP79//BBiYHjy9+8/oUkNAAHEwt1V/vI/KBY/QSISFqM/GBg+MzB8A6PfYC5EFiDAABqgW776MP0rAAAAAElFTkSuQmCC\" title=\"en\" alt=\"en\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:8:\"home_url\";s:28:\"http://wordpress.website/en/\";s:10:\"search_url\";s:28:\"http://wordpress.website/en/\";s:4:\"host\";N;s:5:\"mo_id\";s:1:\"8\";s:13:\"page_on_front\";N;s:14:\"page_for_posts\";N;s:6:\"filter\";s:3:\"raw\";s:9:\"flag_code\";s:2:\"us\";s:9:\"fallbacks\";a:0:{}}}','yes');
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (2,3,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (3,3,'_wp_trash_meta_status','draft');
INSERT INTO `wp_postmeta` VALUES (4,3,'_wp_trash_meta_time','1681307005');
INSERT INTO `wp_postmeta` VALUES (5,3,'_wp_desired_post_slug','privacy-policy');
INSERT INTO `wp_postmeta` VALUES (6,2,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (7,2,'_wp_trash_meta_time','1681307005');
INSERT INTO `wp_postmeta` VALUES (8,2,'_wp_desired_post_slug','sample-page');
INSERT INTO `wp_postmeta` VALUES (9,7,'_pll_strings_translations','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (10,8,'_pll_strings_translations','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (11,9,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (12,9,'_edit_lock','1681474394:1');
INSERT INTO `wp_postmeta` VALUES (13,9,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (14,11,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (15,11,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (16,11,'_edit_lock','1681307354:1');
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
INSERT INTO `wp_postmeta` VALUES (48,20,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (49,20,'_edit_lock','1681826534:1');
INSERT INTO `wp_postmeta` VALUES (50,20,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (51,22,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (52,22,'_edit_lock','1682325160:1');
INSERT INTO `wp_postmeta` VALUES (53,22,'_wp_page_template','page-gpt.php');
INSERT INTO `wp_postmeta` VALUES (56,26,'_edit_lock','1682321161:1');
INSERT INTO `wp_postmeta` VALUES (59,28,'_edit_lock','1682331443:1');
INSERT INTO `wp_postmeta` VALUES (66,47,'_edit_lock','1682345987:1');
INSERT INTO `wp_postmeta` VALUES (67,47,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (70,50,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (71,50,'_edit_lock','1682341297:1');
INSERT INTO `wp_postmeta` VALUES (72,56,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (73,56,'_edit_lock','1682424759:1');
INSERT INTO `wp_postmeta` VALUES (74,68,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (75,68,'_edit_lock','1682409930:1');
INSERT INTO `wp_postmeta` VALUES (76,77,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (77,77,'_edit_lock','1682411587:1');
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2023-04-07 11:44:58','2023-04-07 11:44:58','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2023-04-07 11:44:58','2023-04-07 11:44:58','',0,'http://wordpress.website/?p=1',0,'post','',1);
INSERT INTO `wp_posts` VALUES (2,1,'2023-04-07 11:44:58','2023-04-07 11:44:58','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://wordpress.website/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','trash','closed','open','','sample-page__trashed','','','2023-04-12 13:43:25','2023-04-12 13:43:25','',0,'http://wordpress.website/?page_id=2',0,'page','',0);
INSERT INTO `wp_posts` VALUES (3,1,'2023-04-07 11:44:58','2023-04-07 11:44:58','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://wordpress.website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','trash','closed','open','','privacy-policy__trashed','','','2023-04-12 13:43:25','2023-04-12 13:43:25','',0,'http://wordpress.website/?page_id=3',0,'page','',0);
INSERT INTO `wp_posts` VALUES (5,1,'2023-04-12 13:43:25','2023-04-12 13:43:25','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://wordpress.website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','inherit','closed','closed','','3-revision-v1','','','2023-04-12 13:43:25','2023-04-12 13:43:25','',3,'http://wordpress.website/?p=5',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (6,1,'2023-04-12 13:43:25','2023-04-12 13:43:25','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://wordpress.website/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','inherit','closed','closed','','2-revision-v1','','','2023-04-12 13:43:25','2023-04-12 13:43:25','',2,'http://wordpress.website/?p=6',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (7,1,'2023-04-12 13:45:03','2023-04-12 13:45:03','','polylang_mo_2','','private','closed','closed','','polylang_mo_2','','','2023-04-12 13:45:03','2023-04-12 13:45:03','',0,'http://wordpress.website/?post_type=polylang_mo&p=7',0,'polylang_mo','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2023-04-12 13:45:23','2023-04-12 13:45:23','','polylang_mo_5','','private','closed','closed','','polylang_mo_5','','','2023-04-12 13:45:23','2023-04-12 13:45:23','',0,'http://wordpress.website/?post_type=polylang_mo&p=8',0,'polylang_mo','',0);
INSERT INTO `wp_posts` VALUES (9,1,'2023-04-12 13:46:06','2023-04-12 13:46:06','[wp_locations]','Offices','','publish','closed','closed','','offices','','','2023-04-12 13:49:12','2023-04-12 13:49:12','',0,'http://wordpress.website/?page_id=9',0,'page','',0);
INSERT INTO `wp_posts` VALUES (10,1,'2023-04-12 13:46:06','2023-04-12 13:46:06','[wp_locations]','Offices','','inherit','closed','closed','','9-revision-v1','','','2023-04-12 13:46:06','2023-04-12 13:46:06','',9,'http://wordpress.website/?p=10',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (11,1,'2023-04-12 13:50:12','2023-04-12 13:50:12','[wp_locations]','المكاتب','','publish','closed','closed','','offices','','','2023-04-12 13:50:24','2023-04-12 13:50:24','',0,'http://wordpress.website/?page_id=11',0,'page','',0);
INSERT INTO `wp_posts` VALUES (12,1,'2023-04-12 13:50:12','2023-04-12 13:50:12','[wp_locations]','المكاتب','','inherit','closed','closed','','11-revision-v1','','','2023-04-12 13:50:12','2023-04-12 13:50:12','',11,'http://wordpress.website/?p=12',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (13,1,'2023-04-12 13:52:55','0000-00-00 00:00:00','location details goes here location details goes here location details goes here location details goes here ','location 1','','draft','closed','closed','','','','','2023-04-12 13:52:55','2023-04-12 13:52:55','',0,'http://wordpress.website/?post_type=wp_locations&#038;p=13',0,'wp_locations','',0);
INSERT INTO `wp_posts` VALUES (14,1,'2023-04-12 13:53:56','2023-04-12 13:53:56','Et modi eaque maxime','Omnis et reprehender','','publish','closed','closed','','omnis-et-reprehender','','','2023-04-14 12:15:50','2023-04-14 12:15:50','',0,'http://wordpress.website/?post_type=wp_locations&#038;p=14',0,'wp_locations','',0);
INSERT INTO `wp_posts` VALUES (15,1,'2023-04-12 13:54:39','2023-04-12 13:54:39','Tempor quae cillum d','Voluptatum sed odit','','publish','closed','closed','','voluptatum-sed-odit','','','2023-04-12 13:54:39','2023-04-12 13:54:39','',0,'http://wordpress.website/?post_type=wp_locations&#038;p=15',0,'wp_locations','',0);
INSERT INTO `wp_posts` VALUES (16,1,'2023-04-13 08:38:10','2023-04-13 08:38:10','test','test','','publish','closed','closed','','test','','','2023-04-13 08:38:10','2023-04-13 08:38:10','',0,'http://wordpress.website/?post_type=sliders&#038;p=16',0,'sliders','',0);
INSERT INTO `wp_posts` VALUES (17,1,'2023-04-13 08:38:10','2023-04-13 08:38:10','test','test','','inherit','closed','closed','','16-revision-v1','','','2023-04-13 08:38:10','2023-04-13 08:38:10','',16,'http://wordpress.website/?p=17',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (18,1,'2023-04-13 08:38:34','2023-04-13 08:38:34','فحص ','فحص','','publish','closed','closed','','%d9%81%d8%ad%d8%b5','','','2023-04-13 08:38:34','2023-04-13 08:38:34','',0,'http://wordpress.website/?post_type=sliders&#038;p=18',0,'sliders','',0);
INSERT INTO `wp_posts` VALUES (19,1,'2023-04-13 08:38:34','2023-04-13 08:38:34','فحص ','فحص','','inherit','closed','closed','','18-revision-v1','','','2023-04-13 08:38:34','2023-04-13 08:38:34','',18,'http://wordpress.website/?p=19',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2023-04-17 08:32:38','2023-04-17 08:32:38','[contact_form]','Contact us','','publish','closed','closed','','contact-us','','','2023-04-17 08:32:38','2023-04-17 08:32:38','',0,'http://wordpress.website/?page_id=20',0,'page','',0);
INSERT INTO `wp_posts` VALUES (21,1,'2023-04-17 08:32:38','2023-04-17 08:32:38','[contact_form]','Contact us','','inherit','closed','closed','','20-revision-v1','','','2023-04-17 08:32:38','2023-04-17 08:32:38','',20,'http://wordpress.website/?p=21',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (22,1,'2023-04-19 10:53:13','2023-04-19 10:53:13','[simple_form_ajax_chatgpt]','GPT','','publish','closed','closed','','gpt','','','2023-04-24 08:24:55','2023-04-24 08:24:55','',0,'http://wordpress.website/?page_id=22',0,'page','',0);
INSERT INTO `wp_posts` VALUES (23,1,'2023-04-19 10:53:13','2023-04-19 10:53:13','','GPT','','inherit','closed','closed','','22-revision-v1','','','2023-04-19 10:53:13','2023-04-19 10:53:13','',22,'http://wordpress.website/?p=23',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (24,1,'2023-04-24 06:00:41','2023-04-24 06:00:41','[simple_form_ajax_chatgpt]','GPT','','inherit','closed','closed','','22-revision-v1','','','2023-04-24 06:00:41','2023-04-24 06:00:41','',22,'http://wordpress.website/?p=24',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (25,1,'2023-04-24 06:11:58','2023-04-24 06:11:58','[chatgpt_client]','GPT','','inherit','closed','closed','','22-revision-v1','','','2023-04-24 06:11:58','2023-04-24 06:11:58','',22,'http://wordpress.website/?p=25',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2023-04-24 06:55:23','2023-04-24 06:55:23','\r\nSearch engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. By optimizing a website, it can rank higher in search engine results, which can lead to more visitors and more conversions.\r\n\r\nSEO is important for a website because it helps to increase visibility and traffic. When a website is optimized for search engines, it can appear higher in search engine results, which can lead to more visitors. This increased visibility can lead to more conversions, as more people are likely to click on the website when it appears higher in search engine results.\r\n\r\nSEO is also important for a website because it helps to improve the user experience. When a website is optimized for search engines, it can be easier to navigate and more user-friendly. This can lead to more visitors staying on the website longer, which can lead to more conversions.\r\n\r\nSEO is also important for a website because it can help to build trust and credibility. When a website is optimized for search engines, it can appear more professional and trustworthy. This can lead to more people trusting the website and being more likely to purchase products or services from it.\r\n\r\nOverall, SEO is an important part of any website’s success. By optimizing a website for search engines, it can appear higher in search engine results, which can lead to more visitors and more conversions. SEO can also help to improve the user experience, build trust and credibility, and increase visibility and traffic.','SEO is important','','publish','closed','open','','seo-is-important','','','2023-04-24 06:55:23','2023-04-24 06:55:23','',0,'http://wordpress.website/seo-is-important/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (27,1,'2023-04-24 08:24:55','2023-04-24 08:24:55','[simple_form_ajax_chatgpt]','GPT','','inherit','closed','closed','','22-revision-v1','','','2023-04-24 08:24:55','2023-04-24 08:24:55','',22,'http://wordpress.website/?p=27',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (28,1,'2023-04-24 08:41:20','2023-04-24 08:41:20','Mobile responsiveness is becoming increasingly important in today\'s digital world. With more and more people using their mobile devices to access the internet, it is essential for businesses to ensure their websites are optimized for mobile devices.\r\n\r\nMobile responsiveness is important for a number of reasons. Firstly, it ensures that your website is accessible to all users, regardless of the device they are using. This is especially important for businesses that rely on their website to generate leads or sales. If a user is unable to access your website on their mobile device, they may be less likely to convert.\r\n\r\nSecondly, mobile responsiveness is important for SEO. Google now takes into account the mobile-friendliness of a website when ranking it in search results. This means that if your website is not optimized for mobile devices, it may be penalized in the search engine rankings.\r\n\r\nFinally, mobile responsiveness is important for user experience. If a website is not optimized for mobile devices, it can be difficult to navigate and use. This can lead to a poor user experience, which can result in users leaving the website and not returning.\r\n\r\nIn conclusion, mobile responsiveness is essential for businesses in today\'s digital world. It ensures that your website is accessible to all users, regardless of the device they are using. It also helps to improve SEO and user experience, both of which are essential for a successful website.','Mobile responsiveness is becoming increasingly important','','publish','closed','open','','mobile-responsiveness-is-becoming-increasingly-important','','','2023-04-24 08:41:20','2023-04-24 08:41:20','',0,'http://wordpress.website/mobile-responsiveness-is-becoming-increasingly-important/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2023-04-24 08:51:13','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 08:51:13','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=29',0,'post','',0);
INSERT INTO `wp_posts` VALUES (30,1,'2023-04-24 09:58:04','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 09:58:04','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=30',0,'post','',0);
INSERT INTO `wp_posts` VALUES (31,1,'2023-04-24 10:02:00','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:02:00','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=31',0,'post','',0);
INSERT INTO `wp_posts` VALUES (32,1,'2023-04-24 10:11:01','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:11:01','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=32',0,'post','',0);
INSERT INTO `wp_posts` VALUES (33,1,'2023-04-24 10:19:48','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:19:48','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=33',0,'post','',0);
INSERT INTO `wp_posts` VALUES (34,1,'2023-04-24 10:22:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:22:25','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=34',0,'post','',0);
INSERT INTO `wp_posts` VALUES (35,1,'2023-04-24 10:26:51','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:26:51','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=35',0,'post','',0);
INSERT INTO `wp_posts` VALUES (36,1,'2023-04-24 10:37:34','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:37:34','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=36',0,'post','',0);
INSERT INTO `wp_posts` VALUES (37,1,'2023-04-24 10:38:19','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:38:19','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=37',0,'post','',0);
INSERT INTO `wp_posts` VALUES (38,1,'2023-04-24 10:39:50','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:39:50','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=38',0,'post','',0);
INSERT INTO `wp_posts` VALUES (39,1,'2023-04-24 10:41:24','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:41:24','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=39',0,'post','',0);
INSERT INTO `wp_posts` VALUES (40,1,'2023-04-24 10:41:54','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:41:54','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=40',0,'post','',0);
INSERT INTO `wp_posts` VALUES (41,1,'2023-04-24 10:42:35','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:42:35','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=41',0,'post','',0);
INSERT INTO `wp_posts` VALUES (42,1,'2023-04-24 10:43:51','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:43:51','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=42',0,'post','',0);
INSERT INTO `wp_posts` VALUES (43,1,'2023-04-24 10:43:51','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:43:51','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=43',0,'post','',0);
INSERT INTO `wp_posts` VALUES (44,1,'2023-04-24 10:45:30','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 10:45:30','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=44',0,'post','',0);
INSERT INTO `wp_posts` VALUES (45,1,'2023-04-24 10:46:06','2023-04-24 10:46:06','Search engine optimization (SEO) is the process of optimizing a website to improve its visibility in search engine results pages (SERPs). SEO is an important part of any digital marketing strategy and can help to increase website traffic, leads, and sales.\r\n\r\nSEO involves optimizing a website’s content, structure, and code to make it more visible to search engines. This includes optimizing titles, descriptions, and keywords, as well as creating content that is relevant to the target audience. Additionally, SEO involves improving the website’s usability and making sure it is mobile-friendly.\r\n\r\nSEO can be a complex and time-consuming process, but it is essential for any website that wants to be successful. By optimizing a website for search engines, businesses can increase their visibility and reach more potential customers. Additionally, SEO can help to improve the user experience of a website, making it easier for visitors to find what they are looking for.\r\n\r\nSEO is an ongoing process and requires regular maintenance and updates. It is important to stay up-to-date with the latest SEO trends and techniques to ensure that a website remains competitive in the SERPs. Additionally, businesses should monitor their website’s performance to identify areas for improvement.\r\n\r\nOverall, SEO is an essential part of any digital marketing strategy and can help to increase website traffic, leads, and sales. By optimizing a website for search engines, businesses can increase their visibility and reach more potential customers. Additionally, SEO can help to improve the user experience of a website, making it easier for visitors to find what they are looking for.','test','','publish','closed','open','','test','','','2023-04-24 10:46:06','2023-04-24 10:46:06','',0,'http://wordpress.website/test/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (46,1,'2023-04-24 11:15:08','2023-04-24 11:15:08','SEO is important because it helps your website rank higher in search engine results, which in turn drives more traffic to your website. This increased traffic can lead to more sales, leads, and brand awareness. SEO also helps to build trust and credibility with your target audience, as well as improve the user experience of your website.','','','publish','closed','open','','46-2','','','2023-04-24 11:15:08','2023-04-24 11:15:08','',0,'http://wordpress.website/46-2/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (47,1,'2023-04-24 11:15:15','2023-04-24 11:15:15','fasdfasf','SEO is important','','publish','closed','open','','seo-is-important-2','','','2023-04-24 12:46:43','2023-04-24 12:46:43','',0,'http://wordpress.website/seo-is-important-2/',0,'post','',0);
INSERT INTO `wp_posts` VALUES (48,1,'2023-04-24 12:38:10','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 12:38:10','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=48',0,'post','',0);
INSERT INTO `wp_posts` VALUES (49,1,'2023-04-24 12:46:43','2023-04-24 12:46:43','fasdfasf','SEO is important','','inherit','closed','closed','','47-revision-v1','','','2023-04-24 12:46:43','2023-04-24 12:46:43','',47,'http://wordpress.website/?p=49',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (50,1,'2023-04-24 12:47:01','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 12:47:01','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=50',0,'post','',0);
INSERT INTO `wp_posts` VALUES (51,1,'2023-04-24 13:04:15','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 13:04:15','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=51',0,'post','',0);
INSERT INTO `wp_posts` VALUES (52,1,'2023-04-24 13:04:52','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 13:04:52','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=52',0,'post','',0);
INSERT INTO `wp_posts` VALUES (53,1,'2023-04-24 13:05:13','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 13:05:13','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=53',0,'post','',0);
INSERT INTO `wp_posts` VALUES (54,1,'2023-04-24 13:06:34','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-24 13:06:34','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=54',0,'post','',0);
INSERT INTO `wp_posts` VALUES (55,1,'2023-04-24 14:00:48','2023-04-24 14:00:48','\n\nSearch engine optimization (SEO) is the process of optimizing a website to improve its visibility in search engine results. SEO involves making changes to the website\'s content, structure, and code to make it more attractive to search engines and improve its ranking in search engine results. SEO can help a website to rank higher in search engine results, resulting in more website visitors and potential customers.','SEO is important','','inherit','closed','closed','','47-autosave-v1','','','2023-04-24 14:00:48','2023-04-24 14:00:48','',47,'http://wordpress.website/?p=55',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (56,1,'2023-04-25 12:12:39','0000-00-00 00:00:00','\n\nWordPress is the most popular content management system (CMS) in the world, powering over 35% of all websites on the internet. It is an open-source platform, meaning it is free to use and modify. It is also highly customizable, allowing users to create a website that is tailored to their specific needs. WordPress is also incredibly user-friendly, making it easy for anyone to create a website without needing to know any coding. Additionally, WordPress is highly secure, making it a great choice for businesses that need to protect sensitive data. Finally, WordPress is well-supported, with a large community of developers and users who are always willing to help.','Why WordPress is the Best Platform for Website Development','','draft','closed','open','','','','','2023-04-25 12:12:39','2023-04-25 12:12:39','',0,'http://wordpress.website/?p=56',0,'post','',0);
INSERT INTO `wp_posts` VALUES (57,1,'2023-04-25 06:15:38','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:15:38','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=57',0,'post','',0);
INSERT INTO `wp_posts` VALUES (58,1,'2023-04-25 06:35:50','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 06:35:50','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=58',0,'news','',0);
INSERT INTO `wp_posts` VALUES (59,1,'2023-04-25 06:35:58','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:35:58','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=59',0,'post','',0);
INSERT INTO `wp_posts` VALUES (60,1,'2023-04-25 06:38:11','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:38:11','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=60',0,'post','',0);
INSERT INTO `wp_posts` VALUES (61,1,'2023-04-25 06:38:31','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:38:31','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=61',0,'post','',0);
INSERT INTO `wp_posts` VALUES (62,1,'2023-04-25 06:39:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:39:25','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=62',0,'post','',0);
INSERT INTO `wp_posts` VALUES (63,1,'2023-04-25 06:44:01','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 06:44:01','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=63',0,'news','',0);
INSERT INTO `wp_posts` VALUES (64,1,'2023-04-25 06:44:18','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 06:44:18','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=64',0,'news','',0);
INSERT INTO `wp_posts` VALUES (65,1,'2023-04-25 06:46:17','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 06:46:17','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=65',0,'news','',0);
INSERT INTO `wp_posts` VALUES (66,1,'2023-04-25 06:46:31','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:46:31','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=66',0,'post','',0);
INSERT INTO `wp_posts` VALUES (67,1,'2023-04-25 06:48:26','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 06:48:26','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=67',0,'post','',0);
INSERT INTO `wp_posts` VALUES (68,1,'2023-04-25 07:18:27','0000-00-00 00:00:00','','','','draft','closed','closed','','','','','2023-04-25 07:18:27','2023-04-25 07:18:27','',0,'http://wordpress.website/?post_type=gallery&#038;p=68',0,'gallery','',0);
INSERT INTO `wp_posts` VALUES (69,1,'2023-04-25 08:07:59','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 08:07:59','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=69',0,'news','',0);
INSERT INTO `wp_posts` VALUES (70,1,'2023-04-25 08:09:28','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 08:09:28','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=70',0,'news','',0);
INSERT INTO `wp_posts` VALUES (71,1,'2023-04-25 08:09:55','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 08:09:55','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=71',0,'news','',0);
INSERT INTO `wp_posts` VALUES (72,1,'2023-04-25 08:10:12','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 08:10:12','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=72',0,'news','',0);
INSERT INTO `wp_posts` VALUES (73,1,'2023-04-25 08:16:30','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 08:16:30','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=73',0,'news','',0);
INSERT INTO `wp_posts` VALUES (74,1,'2023-04-25 08:16:40','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 08:16:40','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=74',0,'post','',0);
INSERT INTO `wp_posts` VALUES (75,1,'2023-04-25 08:17:36','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-25 08:17:36','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=75',0,'post','',0);
INSERT INTO `wp_posts` VALUES (76,1,'2023-04-25 08:20:05','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 08:20:05','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=76',0,'news','',0);
INSERT INTO `wp_posts` VALUES (77,1,'2023-04-25 08:33:07','0000-00-00 00:00:00','Search engine optimization (SEO) is an important part of any website’s success. SEO is the process of optimizing a website to make it more visible in search engine results. It is a way to increase the visibility of a website and make it easier for potential customers to find it.\n\nSEO is important for any website because it helps to increase the visibility of the website in search engine results. This means that more people will be able to find the website and learn more about the products or services that it offers. SEO also helps to improve the user experience of the website. By optimizing the website for search engines, it can be easier to navigate and find the information that the user is looking for.\n\nSEO also helps to improve the credibility of a website. Search engines take into account the quality of a website’s content when ranking it in search results. If a website has high-quality content that is optimized for search engines, it will be more likely to rank higher in search results. This will help to increase the credibility of the website and make it more likely that potential customers will trust the website and purchase its products or services.\n\nSEO is also important for any website because it can help to increase the website’s traffic. By optimizing the website for search engines, it can be easier for potential customers to find the website. This can lead to an increase in website traffic, which can lead to more sales and revenue for the website.\n\nFinally, SEO is important for any website because it can help to improve the website’s ranking in search engine results. By optimizing the website for search engines, it can be easier for the website to rank higher in search results. This can lead to more visibility for the website and more potential customers.\n\nIn conclusion, SEO is an important part of any website’s success. It can help to increase the visibility of the website, improve the user experience, increase the credibility of the website, and improve the website’s ranking in search engine results. All of these factors can lead to more website traffic and more sales and revenue for the website.','Why SEO is important for any website','','draft','closed','closed','','why-seo-is-important-for-any-website','','','2023-04-25 08:33:07','2023-04-25 08:33:07','',0,'http://wordpress.website/?post_type=news&#038;p=77',0,'news','',0);
INSERT INTO `wp_posts` VALUES (78,1,'2023-04-25 11:41:24','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2023-04-25 11:41:24','0000-00-00 00:00:00','',0,'http://wordpress.website/?post_type=news&p=78',0,'news','',0);
INSERT INTO `wp_posts` VALUES (79,1,'2023-04-27 05:27:13','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','open','','','','','2023-04-27 05:27:13','0000-00-00 00:00:00','',0,'http://wordpress.website/?p=79',0,'post','',0);
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
INSERT INTO `wp_term_relationships` VALUES (9,5,0);
INSERT INTO `wp_term_relationships` VALUES (9,12,0);
INSERT INTO `wp_term_relationships` VALUES (11,2,0);
INSERT INTO `wp_term_relationships` VALUES (11,12,0);
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
INSERT INTO `wp_term_relationships` VALUES (20,5,0);
INSERT INTO `wp_term_relationships` VALUES (20,6,0);
INSERT INTO `wp_term_relationships` VALUES (20,21,0);
INSERT INTO `wp_term_relationships` VALUES (22,5,0);
INSERT INTO `wp_term_relationships` VALUES (26,1,0);
INSERT INTO `wp_term_relationships` VALUES (26,5,0);
INSERT INTO `wp_term_relationships` VALUES (26,14,0);
INSERT INTO `wp_term_relationships` VALUES (26,16,0);
INSERT INTO `wp_term_relationships` VALUES (26,18,0);
INSERT INTO `wp_term_relationships` VALUES (28,1,0);
INSERT INTO `wp_term_relationships` VALUES (28,5,0);
INSERT INTO `wp_term_relationships` VALUES (28,18,0);
INSERT INTO `wp_term_relationships` VALUES (28,20,0);
INSERT INTO `wp_term_relationships` VALUES (29,5,0);
INSERT INTO `wp_term_relationships` VALUES (30,5,0);
INSERT INTO `wp_term_relationships` VALUES (31,5,0);
INSERT INTO `wp_term_relationships` VALUES (32,5,0);
INSERT INTO `wp_term_relationships` VALUES (33,5,0);
INSERT INTO `wp_term_relationships` VALUES (34,5,0);
INSERT INTO `wp_term_relationships` VALUES (35,5,0);
INSERT INTO `wp_term_relationships` VALUES (36,5,0);
INSERT INTO `wp_term_relationships` VALUES (37,5,0);
INSERT INTO `wp_term_relationships` VALUES (38,5,0);
INSERT INTO `wp_term_relationships` VALUES (39,5,0);
INSERT INTO `wp_term_relationships` VALUES (40,5,0);
INSERT INTO `wp_term_relationships` VALUES (41,5,0);
INSERT INTO `wp_term_relationships` VALUES (42,5,0);
INSERT INTO `wp_term_relationships` VALUES (43,5,0);
INSERT INTO `wp_term_relationships` VALUES (44,5,0);
INSERT INTO `wp_term_relationships` VALUES (45,1,0);
INSERT INTO `wp_term_relationships` VALUES (45,5,0);
INSERT INTO `wp_term_relationships` VALUES (46,1,0);
INSERT INTO `wp_term_relationships` VALUES (46,5,0);
INSERT INTO `wp_term_relationships` VALUES (47,5,0);
INSERT INTO `wp_term_relationships` VALUES (47,7,0);
INSERT INTO `wp_term_relationships` VALUES (48,5,0);
INSERT INTO `wp_term_relationships` VALUES (50,5,0);
INSERT INTO `wp_term_relationships` VALUES (51,5,0);
INSERT INTO `wp_term_relationships` VALUES (52,5,0);
INSERT INTO `wp_term_relationships` VALUES (53,5,0);
INSERT INTO `wp_term_relationships` VALUES (54,5,0);
INSERT INTO `wp_term_relationships` VALUES (56,5,0);
INSERT INTO `wp_term_relationships` VALUES (56,7,0);
INSERT INTO `wp_term_relationships` VALUES (57,5,0);
INSERT INTO `wp_term_relationships` VALUES (58,5,0);
INSERT INTO `wp_term_relationships` VALUES (59,5,0);
INSERT INTO `wp_term_relationships` VALUES (60,5,0);
INSERT INTO `wp_term_relationships` VALUES (61,5,0);
INSERT INTO `wp_term_relationships` VALUES (62,5,0);
INSERT INTO `wp_term_relationships` VALUES (63,5,0);
INSERT INTO `wp_term_relationships` VALUES (64,5,0);
INSERT INTO `wp_term_relationships` VALUES (65,5,0);
INSERT INTO `wp_term_relationships` VALUES (66,5,0);
INSERT INTO `wp_term_relationships` VALUES (67,5,0);
INSERT INTO `wp_term_relationships` VALUES (69,5,0);
INSERT INTO `wp_term_relationships` VALUES (70,5,0);
INSERT INTO `wp_term_relationships` VALUES (71,5,0);
INSERT INTO `wp_term_relationships` VALUES (72,5,0);
INSERT INTO `wp_term_relationships` VALUES (73,5,0);
INSERT INTO `wp_term_relationships` VALUES (74,5,0);
INSERT INTO `wp_term_relationships` VALUES (75,5,0);
INSERT INTO `wp_term_relationships` VALUES (76,5,0);
INSERT INTO `wp_term_relationships` VALUES (77,5,0);
INSERT INTO `wp_term_relationships` VALUES (78,5,0);
INSERT INTO `wp_term_relationships` VALUES (79,5,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,5);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'language','a:3:{s:6:\"locale\";s:2:\"ar\";s:3:\"rtl\";i:1;s:9:\"flag_code\";s:4:\"arab\";}',0,3);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'term_language','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'term_translations','a:2:{s:2:\"ar\";i:1;s:2:\"en\";i:7;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (5,5,'language','a:3:{s:6:\"locale\";s:2:\"en\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"us\";}',0,9);
INSERT INTO `wp_term_taxonomy` VALUES (6,6,'term_language','',0,5);
INSERT INTO `wp_term_taxonomy` VALUES (7,7,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (10,10,'nav_menu','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (11,11,'nav_menu','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (12,12,'post_translations','a:2:{s:2:\"ar\";i:11;s:2:\"en\";i:9;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (13,13,'post_translations','a:2:{s:2:\"ar\";i:18;s:2:\"en\";i:16;}',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (14,14,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (15,15,'term_translations','a:1:{s:2:\"en\";i:14;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (16,16,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (17,17,'term_translations','a:1:{s:2:\"en\";i:16;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (18,18,'post_tag','',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (19,19,'term_translations','a:1:{s:2:\"en\";i:18;}',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (20,20,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (21,21,'term_translations','a:1:{s:2:\"en\";i:20;}',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_terms` VALUES (12,'pll_6436b714b6a26','pll_6436b714b6a26',0);
INSERT INTO `wp_terms` VALUES (13,'pll_6437bf8a492df','pll_6437bf8a492df',0);
INSERT INTO `wp_terms` VALUES (14,'SEO','seo',0);
INSERT INTO `wp_terms` VALUES (15,'pll_644627db55cb3','pll_644627db55cb3',0);
INSERT INTO `wp_terms` VALUES (16,'website','website',0);
INSERT INTO `wp_terms` VALUES (17,'pll_644627db691dd','pll_644627db691dd',0);
INSERT INTO `wp_terms` VALUES (18,'important','important',0);
INSERT INTO `wp_terms` VALUES (19,'pll_644627db7de69','pll_644627db7de69',0);
INSERT INTO `wp_terms` VALUES (20,'mobile responsive','mobile-responsive',0);
INSERT INTO `wp_terms` VALUES (21,'pll_644640b0425b0','pll_644640b0425b0',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_usermeta` VALUES (16,1,'session_tokens','a:3:{s:64:\"4669b28c81ea96be6ba3b5f240ab9df36b1321fcbb1debe999ce2b4f762f0e9c\";a:4:{s:10:\"expiration\";i:1682575651;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36\";s:5:\"login\";i:1682402851;}s:64:\"3c10e94ee0425d27c6dc86b580881436c0848f9678082b19da4619dcf11653df\";a:4:{s:10:\"expiration\";i:1682597200;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36\";s:5:\"login\";i:1682424400;}s:64:\"598bc7799d4dbc5d1ea71f72325c9920aff8087d17f247afae1d09922f7da062\";a:4:{s:10:\"expiration\";i:1682746009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36\";s:5:\"login\";i:1682573209;}}');
INSERT INTO `wp_usermeta` VALUES (17,1,'wp_dashboard_quick_press_last_post_id','4');
INSERT INTO `wp_usermeta` VALUES (18,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}');
INSERT INTO `wp_usermeta` VALUES (19,1,'metaboxhidden_nav-menus','a:5:{i:0;s:21:\"add-post-type-sliders\";i:1;s:20:\"add-post-type-events\";i:2;s:18:\"add-post-type-news\";i:3;s:26:\"add-post-type-wp_locations\";i:4;s:12:\"add-post_tag\";}');
INSERT INTO `wp_usermeta` VALUES (20,1,'wp_user-settings','libraryContent=browse');
INSERT INTO `wp_usermeta` VALUES (21,1,'wp_user-settings-time','1681373635');
INSERT INTO `wp_usermeta` VALUES (22,1,'closedpostboxes_post','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (23,1,'metaboxhidden_post','a:5:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:16:\"commentstatusdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');
INSERT INTO `wp_usermeta` VALUES (24,1,'meta-box-order_post','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:58:\"ml_box,submitdiv,categorydiv,tagsdiv-post_tag,postimagediv\";s:6:\"normal\";s:77:\"postexcerpt,trackbacksdiv,commentstatusdiv,slugdiv,authordiv,chatgpt-meta-box\";s:8:\"advanced\";s:0:\"\";}');
INSERT INTO `wp_usermeta` VALUES (25,1,'screen_layout_post','2');
INSERT INTO `wp_usermeta` VALUES (26,1,'meta-box-order_news','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:55:\"ml_box,submitdiv,pageparentdiv,postexcerpt,postimagediv\";s:6:\"normal\";s:24:\"slugdiv,chatgpt-meta-box\";s:8:\"advanced\";s:0:\"\";}');
INSERT INTO `wp_usermeta` VALUES (27,1,'screen_layout_news','2');
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

-- Dump completed on 2023-04-27 11:34:14

# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.3.0)
# Database: jsnd-crud
# Generation Time: 2024-07-15 00:13:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activity_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`)
VALUES
	(1,'default','created','App\\Models\\Item','created',5,'App\\Models\\User',1,'{\"attributes\": {\"id\": 5, \"code\": \"MU001\", \"name\": \"Guitar\", \"type\": \"music\", \"image\": null, \"created_at\": \"2024-07-12T18:31:18.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T18:31:18.000000Z\", \"description\": \"Wood Guitar\"}}',NULL,'2024-07-13 01:31:18','2024-07-13 01:31:18'),
	(2,'default','created','App\\Models\\Item','created',6,'App\\Models\\User',1,'{\"attributes\": {\"id\": 6, \"code\": \"mu002\", \"name\": \"drum\", \"type\": \"music\", \"image\": null, \"created_at\": \"2024-07-12T18:34:37.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T18:34:37.000000Z\", \"description\": \"drum\"}}',NULL,'2024-07-13 01:34:37','2024-07-13 01:34:37'),
	(3,'default','created','App\\Models\\Item','created',1,'App\\Models\\User',1,'{\"attributes\": {\"id\": 1, \"code\": \"B001\", \"name\": \"Novel\", \"type\": \"book\", \"image\": \"storage/images/1720809343.png\", \"created_at\": \"2024-07-12T18:35:43.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T18:35:43.000000Z\", \"description\": \"novel\"}}',NULL,'2024-07-13 01:35:43','2024-07-13 01:35:43'),
	(4,'default','created','App\\Models\\Item','created',2,'App\\Models\\User',1,'{\"attributes\": {\"id\": 2, \"code\": \"MU001\", \"name\": \"Guitar\", \"type\": \"music\", \"image\": \"storage/images/1720809794.png\", \"created_at\": \"2024-07-12T18:43:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T18:43:14.000000Z\", \"description\": \"guitar\"}}',NULL,'2024-07-13 01:43:14','2024-07-13 01:43:14'),
	(5,'default','updated','App\\Models\\Item','updated',2,'App\\Models\\User',1,'{\"old\": {\"id\": 2, \"code\": \"MU001\", \"name\": \"Guitar\", \"type\": \"music\", \"image\": \"storage/images/1720809794.png\", \"created_at\": \"2024-07-12T18:43:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T18:43:14.000000Z\", \"description\": \"guitar\"}, \"attributes\": {\"id\": 2, \"code\": \"MU001\", \"name\": \"Guitar\", \"type\": \"music\", \"image\": \"storage/images/1720813120.png\", \"created_at\": \"2024-07-12T18:43:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T19:38:40.000000Z\", \"description\": \"guitar\"}}',NULL,'2024-07-13 02:38:41','2024-07-13 02:38:41'),
	(6,'default','updated','App\\Models\\Item','updated',2,'App\\Models\\User',1,'{\"old\": {\"id\": 2, \"code\": \"MU001\", \"name\": \"Guitar\", \"type\": \"music\", \"image\": null, \"created_at\": \"2024-07-12T18:43:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T19:38:40.000000Z\", \"description\": \"guitar\"}, \"attributes\": {\"id\": 2, \"code\": \"MU001\", \"name\": \"Guitar\", \"type\": \"music\", \"image\": \"storage/images/1720816345.png\", \"created_at\": \"2024-07-12T18:43:14.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T20:32:25.000000Z\", \"description\": \"guitar\"}}',NULL,'2024-07-13 03:32:25','2024-07-13 03:32:25'),
	(7,'default','updated','App\\Models\\Item','updated',1,'App\\Models\\User',1,'{\"old\": {\"id\": 1, \"code\": \"B001\", \"name\": \"Novel\", \"type\": \"book\", \"image\": null, \"created_at\": \"2024-07-12T18:35:43.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T18:35:43.000000Z\", \"description\": \"novel\"}, \"attributes\": {\"id\": 1, \"code\": \"B001\", \"name\": \"Novel\", \"type\": \"book\", \"image\": \"storage/images/1720816352.png\", \"created_at\": \"2024-07-12T18:35:43.000000Z\", \"deleted_at\": null, \"updated_at\": \"2024-07-12T20:32:32.000000Z\", \"description\": \"novel\"}}',NULL,'2024-07-13 03:32:32','2024-07-13 03:32:32');

/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `name`, `description`, `type`, `code`, `created_at`, `updated_at`, `deleted_at`, `image`)
VALUES
	(1,'Novel','novel','book','B001','2024-07-13 01:35:43','2024-07-13 03:32:32',NULL,'storage/images/1720816352.png'),
	(2,'Guitar','guitar','music','MU001','2024-07-13 01:43:14','2024-07-13 03:32:25',NULL,'storage/images/1720816345.png');

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(6,'2024_07_12_163707_create_permission_tables',2),
	(7,'2024_07_12_170729_create_items_table',3),
	(11,'2024_07_12_171512_create_activity_log_table',4),
	(12,'2024_07_12_171513_add_event_column_to_activity_log_table',4),
	(13,'2024_07_12_171514_add_batch_uuid_column_to_activity_log_table',4),
	(15,'2024_07_13_013020_add_image_to_items_table',5),
	(16,'2024_07_13_025450_add_new_column_to_users_table',6);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(2,'App\\Models\\User',1),
	(3,'App\\Models\\User',2);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','web','2024-07-12 18:06:11','2024-07-12 18:06:11'),
	(2,'Super Admin','web','2024-07-12 18:07:58','2024-07-12 18:07:58'),
	(3,'User','web','2024-07-13 02:24:19','2024-07-13 02:24:19'),
	(4,'Guest','web','2024-07-13 02:24:20','2024-07-13 02:24:20');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `profile_picture`)
VALUES
	(1,'Admin','admin@testing.com',NULL,'$2y$12$as4uXuUS6wvzGvJM6wBDX.HjKR3LBaC8h8wiluuAteU986iPfO6zm',NULL,'2024-07-12 18:07:59','2024-07-13 03:22:28','Super Admin','storage/images/1720815748.png'),
	(2,'user2','user2@gmail.com',NULL,'$2y$12$52HKntminozTIWX.eqHegekUIZJ7e6OYS9TlsozmUdJl4LGb/lVm.',NULL,'2024-07-13 03:15:35','2024-07-13 03:15:35','User','storage/images/1720815335.png');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

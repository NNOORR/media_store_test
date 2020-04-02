-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 02, 2020 at 02:27 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `media_viewer_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `errors_logs`
--

DROP TABLE IF EXISTS `errors_logs`;
CREATE TABLE IF NOT EXISTS `errors_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `errors_logs`
--

INSERT INTO `errors_logs` (`id`, `user_id`, `username`, `msg`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nour Eddin Badran', 'Call to undefined method App\\UserMediaFav::innerJon()', '2020-04-01 19:58:25', '2020-04-01 19:58:25'),
(2, 1, 'Nour Eddin Badran', 'Call to undefined method App\\UserMediaFav::innerJon()', '2020-04-01 19:58:45', '2020-04-01 19:58:45'),
(3, 1, 'Nour Eddin Badran', 'Call to undefined method App\\UserMediaFav::innerJon()', '2020-04-01 19:58:50', '2020-04-01 19:58:50'),
(4, 1, 'Nour Eddin Badran', 'Call to undefined method Illuminate\\Database\\Eloquent\\Builder::innerJoin()', '2020-04-01 19:59:46', '2020-04-01 19:59:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `description`, `type_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Image (1)', 'lorem text ifo sdeo jsmk dswo qqsc jdios osidd dd lorem text ifo sdeo jsmk dswo qqsc jdios osidd dd', 1, 'images\\1.gif', '2020-04-01 06:18:17', NULL),
(2, 'Image (2)', 'sdjio sdve lorem ojsdio osid osaoisd', 1, 'images\\2.gif', '2020-04-01 06:18:17', NULL),
(3, 'Image 3', 'osid los sq psod skdk mfdu pfs', 1, 'images\\3.gif', '2020-04-01 06:18:17', NULL),
(4, 'Image (4)', 'odq ijsdcsd isod dfee cdi we', 1, 'images\\4.gif', '2020-04-01 06:18:17', NULL),
(5, 'Image (5)', 'po iur jds jkn as sd df', 1, 'images\\5.gif', '2020-04-01 06:18:17', NULL),
(6, 'Image (6)', 'df wef oijs oesrf rf oioji oj sdvoij', 1, 'images\\6.gif', '2020-04-01 06:18:17', NULL),
(7, 'Image (7)', '', 1, 'images\\7.gif', '2020-04-01 06:18:17', NULL),
(8, 'Image (8)', '', 1, 'images\\8.gif', '2020-04-01 06:18:17', NULL),
(9, 'Image (9)', '', 1, 'images\\9.gif', '2020-04-01 06:18:17', NULL),
(10, 'Image (10)', '', 1, 'images\\10.gif', '2020-04-01 06:18:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
CREATE TABLE IF NOT EXISTS `media_type` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_type`
--

INSERT INTO `media_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'gif', '2020-04-01 09:21:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_31_235237_create_media_table', 2),
(5, '2020_04_01_000030_create_media_type_table', 2),
(7, '2020_04_01_212140_create_user_search_table', 3),
(8, '2020_04_01_213220_create_errors_log_table', 4),
(9, '2020_04_01_214055_create_error_log_table', 5),
(10, '2020_04_01_214347_create_errors_logs_table', 6),
(11, '2020_04_01_214427_create_user_searches_table', 6),
(12, '2020_04_01_224429_create_user_media_favs_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nour Eddin Badran', 'nour@hotmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL),
(2, 'maher', 'maher@hotmail.com', NULL, 'password', NULL, '2020-03-31 19:24:26', '2020-03-31 19:24:26'),
(3, 'Saeed', 'saeed@hotmail.com', NULL, '1234', NULL, '2020-03-31 19:24:55', '2020-03-31 19:24:55'),
(4, 'Saeed2', 'saeed2@hotmail.com', NULL, '1234', NULL, '2020-03-31 19:26:06', '2020-03-31 19:26:06'),
(5, 'Saeed3', 'saeed3@hotmail.com', NULL, '123', NULL, '2020-03-31 19:26:22', '2020-03-31 19:26:22'),
(6, 'Yasine', 'yasine@hotmail.com', NULL, '123', NULL, '2020-03-31 19:27:57', '2020-03-31 19:27:57'),
(7, 'qqqq', 'qq@hotmail.com', NULL, '123', NULL, '2020-03-31 20:13:08', '2020-03-31 20:13:08'),
(8, 'manar', 'manar@hotmail.com', NULL, '$2y$10$Ue35mEEcTObg297Zc191GOnBbr8lYHIO1sLaMrrIWeO36/DGyFpmq', NULL, '2020-03-31 20:14:18', '2020-03-31 20:14:18'),
(9, 'asasdasd', 'sd@sdv.com', NULL, '$2y$10$YIQQk.pg1K0S35lCVM7oA../yeOxCSRcTeJjpkIRWs2RCDXwjU/ke', NULL, '2020-03-31 23:44:57', '2020-03-31 23:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_media_favs`
--

DROP TABLE IF EXISTS `user_media_favs`;
CREATE TABLE IF NOT EXISTS `user_media_favs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_media_favs_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_media_favs`
--

INSERT INTO `user_media_favs` (`id`, `user_id`, `media_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 5, '2020-04-01 20:04:37', '2020-04-01 20:04:37'),
(3, 1, 1, '2020-04-01 20:12:44', '2020-04-01 20:12:44'),
(4, 1, 4, '2020-04-01 20:13:05', '2020-04-01 20:13:05'),
(5, 1, 3, '2020-04-01 20:19:11', '2020-04-01 20:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_searches`
--

DROP TABLE IF EXISTS `user_searches`;
CREATE TABLE IF NOT EXISTS `user_searches` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `search_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_searches_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_searches`
--

INSERT INTO `user_searches` (`id`, `user_id`, `search_key`, `created_at`, `updated_at`) VALUES
(1, 1, '1', '2020-04-01 18:45:06', '2020-04-01 18:45:06'),
(2, 1, '1', '2020-04-01 18:49:12', '2020-04-01 18:49:12'),
(3, 1, '1', '2020-04-01 19:05:29', '2020-04-01 19:05:29'),
(4, 8, '4', '2020-04-01 19:26:43', '2020-04-01 19:26:43'),
(5, 1, '5', '2020-04-01 19:27:44', '2020-04-01 19:27:44'),
(6, 1, '5', '2020-04-01 19:27:49', '2020-04-01 19:27:49'),
(7, 1, '1', '2020-04-01 19:28:38', '2020-04-01 19:28:38'),
(8, 1, '1', '2020-04-01 19:30:18', '2020-04-01 19:30:18'),
(9, 1, '1654654', '2020-04-01 19:30:31', '2020-04-01 19:30:31'),
(10, 1, '1', '2020-04-01 19:31:56', '2020-04-01 19:31:56'),
(11, 1, '1', '2020-04-01 19:32:08', '2020-04-01 19:32:08'),
(12, 1, '1', '2020-04-01 19:34:56', '2020-04-01 19:34:56'),
(13, 1, '1', '2020-04-01 19:35:02', '2020-04-01 19:35:02'),
(14, 1, '2', '2020-04-01 19:35:09', '2020-04-01 19:35:09'),
(15, 1, '2', '2020-04-01 19:36:57', '2020-04-01 19:36:57'),
(16, 1, '1', '2020-04-01 19:36:59', '2020-04-01 19:36:59'),
(17, 1, '2', '2020-04-01 19:37:02', '2020-04-01 19:37:02'),
(18, 1, '5', '2020-04-01 20:13:19', '2020-04-01 20:13:19'),
(19, 1, '1', '2020-04-01 20:53:36', '2020-04-01 20:53:36'),
(20, 1, 'هلا', '2020-04-01 22:36:45', '2020-04-01 22:36:45');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

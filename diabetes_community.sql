-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2025 at 02:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diabetes_community`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_tokens`
--

CREATE TABLE `access_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(40) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `last_ip_address` varchar(45) DEFAULT NULL,
  `last_user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access_tokens`
--

INSERT INTO `access_tokens` (`id`, `token`, `user_id`, `last_activity_at`, `created_at`, `type`, `title`, `last_ip_address`, `last_user_agent`) VALUES
(19, 'TXYbvKzmP1pU8zZucHA1Y4anfqlNfz1qncvw6Jne', 47, '2025-09-30 15:37:02', '2025-09-30 15:16:32', 'session_remember', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(69, '82gWpzSjBUJdfTxbejD9Ggbmb5cATJZT5MfwrpV1', 1, '2025-10-24 11:02:08', '2025-10-24 10:58:33', 'session', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(70, 'FosRgSSCZ3tUxEtWRIo0vB5oqMRB7wdM8YbfeM6j', 1, '2025-10-25 07:37:11', '2025-10-25 06:37:41', 'session', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(83, 'ODeXlRYk15dEmwtSYRJ98v59h9mUbc085EES17H1', 52, '2025-10-25 12:16:58', '2025-10-25 12:16:58', 'session', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(84, 'u1J2I19mKv1jTextKtTIl9XNXlzwLfR1SFtSkXuf', 1, '2025-10-25 12:41:15', '2025-10-25 12:41:15', 'session', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `key` varchar(100) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `allowed_ips` varchar(255) DEFAULT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `total_messages` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `total_messages`, `created_at`, `updated_at`) VALUES
(1, 2, '2025-09-30 18:20:59', '2025-09-30 18:21:41'),
(2, 2, '2025-10-25 08:58:35', '2025-10-25 09:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_user`
--

CREATE TABLE `conversation_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read_message_number` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversation_user`
--

INSERT INTO `conversation_user` (`id`, `conversation_id`, `user_id`, `last_read_message_number`, `last_read_at`) VALUES
(1, 1, 1, 2, '2025-09-30 21:22:06'),
(2, 1, 49, 2, '2025-09-30 21:21:44'),
(3, 2, 52, 1, '2025-10-25 11:58:41'),
(4, 2, 49, 2, '2025-10-25 12:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT 1,
  `participant_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `post_number_index` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_number` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `is_sticky` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `anonymous_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `title`, `comment_count`, `participant_count`, `post_number_index`, `created_at`, `user_id`, `first_post_id`, `last_posted_at`, `last_posted_user_id`, `last_post_id`, `last_post_number`, `hidden_at`, `hidden_user_id`, `slug`, `is_private`, `is_approved`, `is_sticky`, `is_locked`, `anonymous_user_id`) VALUES
(24, 'question', 2, 2, 0, '2025-09-30 15:59:10', 45, 18, '2025-09-30 20:30:46', 49, 19, 2, NULL, NULL, 'question', 0, 1, 0, 0, NULL),
(26, 'hii', 1, 1, 0, '2025-09-30 21:05:54', 49, 21, '2025-09-30 21:05:54', 49, 21, 1, NULL, NULL, 'hii', 1, 1, 0, 0, NULL),
(29, '🍽️ dfffffffffffffffffff', 1, 1, 0, '2025-10-05 22:39:07', 1, 25, '2025-10-05 22:39:07', 1, 25, 1, NULL, NULL, 'dfffffffffffffffffff', 0, 1, 0, 0, NULL),
(30, '🍽️ honey lime chicken bowl', 1, 1, 0, '2025-10-06 10:09:58', 1, 26, '2025-10-06 10:09:58', 1, 26, 1, NULL, NULL, 'honey-lime-chicken-bowl', 0, 1, 0, 0, NULL),
(31, 't1d', 1, 0, 0, '2025-10-21 09:53:55', NULL, 27, '2025-10-21 09:53:55', NULL, 27, 1, NULL, NULL, 't1d', 0, 1, 0, 0, 1),
(32, 'test', 1, 1, 0, '2025-10-22 09:50:11', 48, 28, '2025-10-22 09:50:11', 48, 28, 1, NULL, NULL, 'test', 0, 1, 0, 0, NULL),
(33, 'test2', 1, 1, 0, '2025-10-22 09:55:31', 48, 29, '2025-10-22 09:55:31', 48, 29, 1, NULL, NULL, 'test2', 0, 1, 0, 0, NULL),
(35, 'test4', 1, 1, 0, '2025-10-22 10:03:25', 48, 31, '2025-10-22 10:03:25', 48, 31, 1, NULL, NULL, 'test4', 0, 1, 0, 0, NULL),
(37, 'test6', 1, 1, 0, '2025-10-22 11:11:44', 52, 33, '2025-10-22 11:11:44', 52, 33, 1, NULL, NULL, 'test6', 0, 1, 0, 0, NULL),
(38, 'hello', 1, 1, 0, '2025-10-22 11:48:17', 48, 34, '2025-10-22 11:48:17', 48, 34, 1, NULL, NULL, 'hello', 0, 1, 0, 0, NULL),
(40, 'looking for a recipe', 2, 2, 0, '2025-10-25 09:56:05', 52, 36, '2025-10-25 10:06:00', 48, 39, 2, NULL, NULL, 'looking-for-a-recipe', 0, 1, 0, 0, NULL),
(41, '🍽️ Almond Blueberry Low-Carb Muffins', 1, 1, 0, '2025-10-25 10:01:41', 1, 37, '2025-10-25 10:01:41', 1, 37, 1, '2025-10-25 10:02:07', 1, 'almond-blueberry-low-carb-muffins', 0, 1, 0, 0, NULL),
(42, '🍽️ Almond Blueberry Low-Carb Muffins', 1, 1, 0, '2025-10-25 10:04:09', 48, 38, '2025-10-25 10:04:09', 48, 38, 1, NULL, NULL, 'almond-blueberry-low-carb-muffins', 0, 1, 0, 0, NULL),
(43, 'High Morning Blood Sugar With Moderate Ketones. Should I Go to the ER?', 2, 2, 0, '2025-10-25 10:17:15', 48, 40, '2025-10-25 10:22:09', 49, 41, 2, NULL, NULL, 'high-morning-blood-sugar-with-moderate-ketones-should-i-go-to-the-er', 0, 1, 0, 0, NULL),
(44, 'When I Finally Realized It Wasn’t “Just Stress”', 0, 1, 0, '2025-10-25 11:06:37', 1, 42, '2025-10-25 11:06:37', 1, 42, 1, '2025-10-25 11:11:41', 1, 'when-i-finally-realized-it-wasnt-just-stress', 0, 1, 0, 0, NULL),
(45, 'When I Finally Realized It Wasn’t “Just Stress”', 1, 1, 0, '2025-10-25 11:08:15', 48, 43, '2025-10-25 11:08:15', 48, 43, 1, NULL, NULL, 'when-i-finally-realized-it-wasnt-just-stress', 0, 1, 0, 0, NULL),
(46, '98% Time in Range — My Best Week Yet!', 0, 1, 0, '2025-10-25 11:22:35', 52, 44, '2025-10-25 11:22:35', 52, 44, 1, '2025-10-25 11:23:11', 52, '98-time-in-range-my-best-week-yet', 0, 1, 0, 0, NULL),
(47, '98% Time in Range — My Best Week Yet!', 1, 1, 0, '2025-10-25 11:23:43', 52, 45, '2025-10-25 11:23:43', 52, 45, 1, NULL, NULL, '98-time-in-range-my-best-week-yet', 0, 1, 0, 0, NULL),
(48, '🏃‍♀️ Morning Walks Changed My Numbers More Than I Expected', 1, 1, 0, '2025-10-25 11:38:04', 52, 46, '2025-10-25 11:38:04', 52, 46, 1, NULL, NULL, 'morning-walks-changed-my-numbers-more-than-i-expected', 0, 1, 0, 0, NULL),
(49, 'Why Does My Blood Sugar Rise During Resistance Training?', 2, 1, 0, '2025-10-25 11:39:47', NULL, 47, '2025-10-25 11:50:10', 52, 48, 2, NULL, NULL, 'why-does-my-blood-sugar-rise-during-resistance-training', 0, 1, 0, 0, 48),
(50, 'Flying with Insulin — How Do You Keep It Cool During Long Trips?', 2, 1, 0, '2025-10-25 11:54:00', 48, 49, '2025-10-25 11:55:51', NULL, 50, 2, NULL, NULL, 'flying-with-insulin-how-do-you-keep-it-cool-during-long-trips', 0, 1, 0, 0, NULL),
(51, 'Anyone Else Having Delays Between CGM and Fingerstick Readings?', 1, 0, 0, '2025-10-25 12:13:10', NULL, 51, '2025-10-25 12:13:10', NULL, 51, 1, NULL, NULL, 'anyone-else-having-delays-between-cgm-and-fingerstick-readings', 0, 1, 0, 0, 1),
(52, 'I’m So Tired of Doing Everything Right and Still Seeing Highs', 2, 1, 0, '2025-10-25 12:16:47', NULL, 52, '2025-10-25 12:17:37', 52, 53, 2, NULL, NULL, 'im-so-tired-of-doing-everything-right-and-still-seeing-highs', 0, 1, 0, 0, 48);

-- --------------------------------------------------------

--
-- Table structure for table `discussion_tag`
--

CREATE TABLE `discussion_tag` (
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_tag`
--

INSERT INTO `discussion_tag` (`discussion_id`, `tag_id`, `created_at`) VALUES
(24, 2, '2025-09-30 15:59:10'),
(29, 1, '2025-10-05 22:39:07'),
(30, 1, '2025-10-06 10:09:58'),
(31, 4, '2025-10-21 09:53:55'),
(31, 5, '2025-10-21 09:53:55'),
(32, 4, '2025-10-22 09:50:11'),
(32, 5, '2025-10-22 09:50:11'),
(33, 4, '2025-10-22 09:55:31'),
(33, 5, '2025-10-22 09:55:31'),
(35, 4, '2025-10-22 10:03:25'),
(35, 5, '2025-10-22 10:03:25'),
(37, 4, '2025-10-22 11:11:44'),
(37, 5, '2025-10-22 11:11:44'),
(38, 4, '2025-10-22 11:48:17'),
(38, 5, '2025-10-22 11:48:17'),
(40, 1, '2025-10-25 09:56:05'),
(41, 1, '2025-10-25 10:01:41'),
(42, 1, '2025-10-25 10:04:09'),
(43, 2, '2025-10-25 10:17:15'),
(44, 4, '2025-10-25 11:06:37'),
(44, 5, '2025-10-25 11:06:37'),
(45, 4, '2025-10-25 11:08:15'),
(45, 5, '2025-10-25 11:08:15'),
(46, 4, '2025-10-25 11:22:35'),
(46, 6, '2025-10-25 11:22:35'),
(47, 4, '2025-10-25 11:23:43'),
(47, 6, '2025-10-25 11:23:43'),
(48, 3, '2025-10-25 11:38:04'),
(48, 8, '2025-10-25 11:38:04'),
(49, 3, '2025-10-25 11:39:47'),
(49, 8, '2025-10-25 11:39:47'),
(50, 3, '2025-10-25 11:54:00'),
(50, 10, '2025-10-25 11:54:00'),
(51, 3, '2025-10-25 12:13:10'),
(51, 9, '2025-10-25 12:13:10'),
(52, 4, '2025-10-25 12:16:47'),
(52, 7, '2025-10-25 12:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_user`
--

CREATE TABLE `discussion_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) UNSIGNED DEFAULT NULL,
  `subscription` enum('follow','ignore') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_user`
--

INSERT INTO `discussion_user` (`user_id`, `discussion_id`, `last_read_at`, `last_read_post_number`, `subscription`) VALUES
(1, 24, '2025-09-30 21:01:34', 2, NULL),
(1, 29, '2025-10-05 22:39:07', 1, 'follow'),
(1, 30, '2025-10-06 10:10:07', 1, 'follow'),
(1, 31, '2025-10-21 09:53:58', 1, 'follow'),
(1, 32, '2025-10-22 10:01:55', 1, NULL),
(1, 33, '2025-10-22 10:01:42', 1, NULL),
(1, 35, '2025-10-22 10:15:46', 1, NULL),
(1, 37, '2025-10-22 11:27:40', 1, NULL),
(1, 38, '2025-10-22 12:42:38', 1, NULL),
(1, 40, '2025-10-25 10:01:49', 1, NULL),
(1, 41, '2025-10-25 10:01:41', 1, 'follow'),
(1, 44, '2025-10-25 11:06:37', 1, 'follow'),
(1, 45, '2025-10-25 11:11:54', 1, NULL),
(1, 51, '2025-10-25 12:13:10', 1, 'follow'),
(45, 24, '2025-09-30 15:59:11', 1, NULL),
(46, 24, '2025-09-30 19:27:24', 1, NULL),
(48, 24, '2025-10-22 10:14:36', 2, NULL),
(48, 30, '2025-10-25 09:57:22', 1, NULL),
(48, 32, '2025-10-22 09:50:14', 1, NULL),
(48, 33, '2025-10-22 09:55:31', 1, NULL),
(48, 35, '2025-10-22 10:03:25', 1, NULL),
(48, 37, '2025-10-23 06:45:07', 1, NULL),
(48, 38, '2025-10-22 11:48:17', 1, NULL),
(48, 40, '2025-10-25 10:06:01', 2, 'follow'),
(48, 42, '2025-10-25 10:04:09', 1, NULL),
(48, 43, '2025-10-25 10:17:15', 1, NULL),
(48, 45, '2025-10-25 11:08:15', 1, NULL),
(48, 47, '2025-10-25 11:25:06', 1, NULL),
(48, 49, '2025-10-25 11:39:47', 1, NULL),
(48, 50, '2025-10-25 11:54:00', 1, NULL),
(48, 52, '2025-10-25 12:16:47', 1, NULL),
(49, 24, '2025-09-30 20:30:47', 2, NULL),
(49, 26, '2025-09-30 21:06:00', 2, NULL),
(49, 31, '2025-10-21 09:54:35', 1, NULL),
(49, 35, '2025-10-22 10:49:20', 1, NULL),
(49, 43, '2025-10-25 10:22:17', 2, NULL),
(52, 35, '2025-10-22 11:02:19', 1, NULL),
(52, 37, '2025-10-22 11:11:45', 1, NULL),
(52, 40, '2025-10-25 09:56:08', 1, NULL),
(52, 43, '2025-10-25 10:17:48', 1, 'follow'),
(52, 46, '2025-10-25 11:22:36', 1, NULL),
(52, 47, '2025-10-25 11:23:43', 1, NULL),
(52, 48, '2025-10-25 11:38:04', 1, NULL),
(52, 49, '2025-10-25 11:50:10', 2, NULL),
(52, 50, '2025-10-25 11:55:51', 2, NULL),
(52, 52, '2025-10-25 12:17:37', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_tokens`
--

CREATE TABLE `email_tokens` (
  `token` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `reason_detail` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fof_masquerade_answers`
--

CREATE TABLE `fof_masquerade_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fof_masquerade_fields`
--

CREATE TABLE `fof_masquerade_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `validation` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `on_bio` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fof_upload_downloads`
--

CREATE TABLE `fof_upload_downloads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `actor_id` int(10) UNSIGNED DEFAULT NULL,
  `downloaded_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fof_upload_files`
--

CREATE TABLE `fof_upload_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `actor_id` int(10) UNSIGNED DEFAULT NULL,
  `base_name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `upload_method` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `remote_id` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `shared` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fof_upload_files`
--

INSERT INTO `fof_upload_files` (`id`, `actor_id`, `base_name`, `path`, `url`, `type`, `size`, `upload_method`, `created_at`, `remote_id`, `uuid`, `tag`, `hidden`, `shared`) VALUES
(1, NULL, 'chatgpt-image-jul-6-2025-01-35-32-am.png', '2025-07-06\\1751833483-303407-chatgpt-image-jul-6-2025-01-35-32-am.png', 'http://localhost/diabetes-community/public/assets/files/2025-07-06/1751833483-303407-chatgpt-image-jul-6-2025-01-35-32-am.png', 'image/png', 891528, 'local', '2025-07-06 23:24:43', NULL, 'cd2a7953-cdab-4e97-8e19-8eb352d0d2bc', 'image-preview', 0, 1),
(2, 1, 'chatgpt-image-jul-6-2025-01-35-32-am.png', '2025-07-06\\1751833511-371811-chatgpt-image-jul-6-2025-01-35-32-am.png', 'http://localhost/diabetes-community/public/assets/files/2025-07-06/1751833511-371811-chatgpt-image-jul-6-2025-01-35-32-am.png', 'image/png', 891528, 'local', '2025-07-06 23:25:11', NULL, 'd367b910-ae0e-439c-9091-3f524c5fe4d7', 'image-preview', 0, 0),
(3, 52, 'tir.jpg', '2025-10-25\\1761391322-160668-tir.jpg', 'http://localhost/diabetes-community/public/assets/files/2025-10-25/1761391322-160668-tir.jpg', 'image/jpeg', 43487, 'local', '2025-10-25 14:22:02', NULL, '95b2b1c0-3268-4ade-875b-81f2e840455b', 'image-preview', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fof_upload_file_posts`
--

CREATE TABLE `fof_upload_file_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fof_upload_file_posts`
--

INSERT INTO `fof_upload_file_posts` (`id`, `file_id`, `post_id`) VALUES
(2, 3, 44),
(3, 3, 45);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_singular` varchar(100) NOT NULL,
  `name_plural` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name_singular`, `name_plural`, `color`, `icon`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admins', '#B72A2A', 'fas fa-wrench', 0, NULL, NULL),
(2, 'Guest', 'Guests', NULL, NULL, 0, NULL, NULL),
(3, 'Member', 'Members', NULL, NULL, 0, NULL, NULL),
(4, 'Mod', 'Mods', '#80349E', 'fas fa-bolt', 0, NULL, NULL),
(5, 'Doctor', 'Doctors', '#28a745', 'fas fa-stethoscope', 0, '2025-09-30 15:00:31', '2025-09-30 15:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `group_permission`
--

CREATE TABLE `group_permission` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_permission`
--

INSERT INTO `group_permission` (`group_id`, `permission`, `created_at`) VALUES
(2, 'tag2.viewForum', '2025-09-30 16:05:19'),
(2, 'viewForum', NULL),
(3, 'anonymous-posting.use', '2025-09-30 20:49:39'),
(3, 'discussion.addMoreThanTwoUserRecipients', '2025-09-30 21:02:46'),
(3, 'discussion.flagPosts', '2025-07-05 21:43:56'),
(3, 'discussion.likePosts', '2025-07-06 20:36:03'),
(3, 'discussion.reactPosts', '2025-10-21 16:16:04'),
(3, 'discussion.reply', NULL),
(3, 'discussion.replyWithoutApproval', '2025-07-05 21:43:57'),
(3, 'discussion.startPrivateDiscussionWithGroups', '2025-09-30 21:02:48'),
(3, 'discussion.startPrivateDiscussionWithUsers', '2025-09-30 21:02:41'),
(3, 'discussion.startWithoutApproval', '2025-07-05 21:43:57'),
(3, 'fof-upload.upload', '2025-10-25 11:20:51'),
(3, 'neoncube-private-messages.allowUsersToReceiveEmailNotifications', '2025-10-25 11:21:00'),
(3, 'searchUsers', NULL),
(3, 'startConversation', '2025-09-30 21:19:56'),
(3, 'startDiscussion', NULL),
(3, 'tag2.discussion.flagPosts', '2025-09-30 16:05:34'),
(3, 'tag2.discussion.likePosts', '2025-09-30 16:05:40'),
(3, 'tag2.discussion.startWithoutApproval', '2025-09-30 16:05:23'),
(3, 'tag2.startDiscussion', '2025-09-30 16:05:21'),
(3, 'user.editOwnNickname', '2025-07-05 23:05:19'),
(4, 'discussion.approvePosts', '2025-07-05 21:43:57'),
(4, 'discussion.editPosts', NULL),
(4, 'discussion.hide', NULL),
(4, 'discussion.hidePosts', NULL),
(4, 'discussion.lock', '2025-07-05 21:43:59'),
(4, 'discussion.rename', NULL),
(4, 'discussion.sticky', '2025-07-05 21:43:59'),
(4, 'discussion.tag', '2025-07-05 21:43:57'),
(4, 'discussion.viewFlags', '2025-07-05 21:43:56'),
(4, 'discussion.viewIpsPosts', '2025-07-06 20:35:54'),
(4, 'fof-upload.deleteUserUploads', '2025-07-06 20:23:45'),
(4, 'fof-upload.viewUserUploads', '2025-07-06 20:23:45'),
(4, 'tag2.discussion.approvePosts', '2025-09-30 16:06:41'),
(4, 'tag2.discussion.editPosts', '2025-09-30 16:06:37'),
(4, 'tag2.discussion.hide', '2025-09-30 16:06:34'),
(4, 'tag2.discussion.hidePosts', '2025-09-30 16:06:43'),
(4, 'tag2.discussion.lock', '2025-09-30 16:06:32'),
(4, 'tag2.discussion.rename', '2025-09-30 16:06:27'),
(4, 'tag2.discussion.sticky', '2025-09-30 16:06:31'),
(4, 'tag2.discussion.tag', '2025-09-30 16:06:28'),
(4, 'tag2.discussion.viewFlags', '2025-09-30 16:06:40'),
(4, 'tag2.discussion.viewIpsPosts', '2025-09-30 16:06:26'),
(4, 'user.manageWarnings', '2025-07-06 19:53:32'),
(4, 'user.suspend', '2025-07-05 21:43:58'),
(4, 'user.viewLastSeenAt', NULL),
(4, 'user.viewWarnings', '2025-07-06 19:53:32'),
(5, 'tag2.discussion.reply', '2025-09-30 16:05:28'),
(5, 'tag2.discussion.replyWithoutApproval', '2025-09-30 16:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`user_id`, `group_id`, `created_at`) VALUES
(1, 1, '2025-07-05 21:43:56'),
(46, 5, '2025-09-30 15:17:00'),
(49, 5, '2025-09-30 20:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `login_providers`
--

CREATE TABLE `login_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(100) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `number` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `is_seen`, `is_hidden`, `user_id`, `number`, `conversation_id`, `created_at`, `updated_at`) VALUES
(1, 'hey there joseph', 0, 0, 1, 1, 1, '2025-09-30 18:20:59', '2025-09-30 18:20:59'),
(2, 'hii', 0, 0, 49, 2, 1, '2025-09-30 18:21:41', '2025-09-30 18:21:41'),
(3, 'hey there doctor, is it fine to contact u privately in here in case of some private questions regarding my BG?', 0, 0, 52, 1, 2, '2025-10-25 08:58:35', '2025-10-25 08:58:35'),
(4, 'absolutely! go ahead\n', 0, 0, 49, 2, 2, '2025-10-25 09:00:30', '2025-10-25 09:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `extension`) VALUES
(1, '2015_02_24_000000_create_access_tokens_table', NULL),
(2, '2015_02_24_000000_create_api_keys_table', NULL),
(3, '2015_02_24_000000_create_config_table', NULL),
(4, '2015_02_24_000000_create_discussions_table', NULL),
(5, '2015_02_24_000000_create_email_tokens_table', NULL),
(6, '2015_02_24_000000_create_groups_table', NULL),
(7, '2015_02_24_000000_create_notifications_table', NULL),
(8, '2015_02_24_000000_create_password_tokens_table', NULL),
(9, '2015_02_24_000000_create_permissions_table', NULL),
(10, '2015_02_24_000000_create_posts_table', NULL),
(11, '2015_02_24_000000_create_users_discussions_table', NULL),
(12, '2015_02_24_000000_create_users_groups_table', NULL),
(13, '2015_02_24_000000_create_users_table', NULL),
(14, '2015_09_15_000000_create_auth_tokens_table', NULL),
(15, '2015_09_20_224327_add_hide_to_discussions', NULL),
(16, '2015_09_22_030432_rename_notification_read_time', NULL),
(17, '2015_10_07_130531_rename_config_to_settings', NULL),
(18, '2015_10_24_194000_add_ip_address_to_posts', NULL),
(19, '2015_12_05_042721_change_access_tokens_columns', NULL),
(20, '2015_12_17_194247_change_settings_value_column_to_text', NULL),
(21, '2016_02_04_095452_add_slug_to_discussions', NULL),
(22, '2017_04_07_114138_add_is_private_to_discussions', NULL),
(23, '2017_04_07_114138_add_is_private_to_posts', NULL),
(24, '2018_01_11_093900_change_access_tokens_columns', NULL),
(25, '2018_01_11_094000_change_access_tokens_add_foreign_keys', NULL),
(26, '2018_01_11_095000_change_api_keys_columns', NULL),
(27, '2018_01_11_101800_rename_auth_tokens_to_registration_tokens', NULL),
(28, '2018_01_11_102000_change_registration_tokens_rename_id_to_token', NULL),
(29, '2018_01_11_102100_change_registration_tokens_created_at_to_datetime', NULL),
(30, '2018_01_11_120604_change_posts_table_to_innodb', NULL),
(31, '2018_01_11_155200_change_discussions_rename_columns', NULL),
(32, '2018_01_11_155300_change_discussions_add_foreign_keys', NULL),
(33, '2018_01_15_071700_rename_users_discussions_to_discussion_user', NULL),
(34, '2018_01_15_071800_change_discussion_user_rename_columns', NULL),
(35, '2018_01_15_071900_change_discussion_user_add_foreign_keys', NULL),
(36, '2018_01_15_072600_change_email_tokens_rename_id_to_token', NULL),
(37, '2018_01_15_072700_change_email_tokens_add_foreign_keys', NULL),
(38, '2018_01_15_072800_change_email_tokens_created_at_to_datetime', NULL),
(39, '2018_01_18_130400_rename_permissions_to_group_permission', NULL),
(40, '2018_01_18_130500_change_group_permission_add_foreign_keys', NULL),
(41, '2018_01_18_130600_rename_users_groups_to_group_user', NULL),
(42, '2018_01_18_130700_change_group_user_add_foreign_keys', NULL),
(43, '2018_01_18_133000_change_notifications_columns', NULL),
(44, '2018_01_18_133100_change_notifications_add_foreign_keys', NULL),
(45, '2018_01_18_134400_change_password_tokens_rename_id_to_token', NULL),
(46, '2018_01_18_134500_change_password_tokens_add_foreign_keys', NULL),
(47, '2018_01_18_134600_change_password_tokens_created_at_to_datetime', NULL),
(48, '2018_01_18_135000_change_posts_rename_columns', NULL),
(49, '2018_01_18_135100_change_posts_add_foreign_keys', NULL),
(50, '2018_01_30_112238_add_fulltext_index_to_discussions_title', NULL),
(51, '2018_01_30_220100_create_post_user_table', NULL),
(52, '2018_01_30_222900_change_users_rename_columns', NULL),
(55, '2018_09_15_041340_add_users_indicies', NULL),
(56, '2018_09_15_041828_add_discussions_indicies', NULL),
(57, '2018_09_15_043337_add_notifications_indices', NULL),
(58, '2018_09_15_043621_add_posts_indices', NULL),
(59, '2018_09_22_004100_change_registration_tokens_columns', NULL),
(60, '2018_09_22_004200_create_login_providers_table', NULL),
(61, '2018_10_08_144700_add_shim_prefix_to_group_icons', NULL),
(62, '2019_10_12_195349_change_posts_add_discussion_foreign_key', NULL),
(63, '2020_03_19_134512_change_discussions_default_comment_count', NULL),
(64, '2020_04_21_130500_change_permission_groups_add_is_hidden', NULL),
(65, '2021_03_02_040000_change_access_tokens_add_type', NULL),
(66, '2021_03_02_040500_change_access_tokens_add_id', NULL),
(67, '2021_03_02_041000_change_access_tokens_add_title_ip_agent', NULL),
(68, '2021_04_18_040500_change_migrations_add_id_primary_key', NULL),
(69, '2021_04_18_145100_change_posts_content_column_to_mediumtext', NULL),
(70, '2018_07_21_000000_seed_default_groups', NULL),
(71, '2018_07_21_000100_seed_default_group_permissions', NULL),
(72, '2021_05_10_000000_rename_permissions', NULL),
(73, '2022_05_20_000000_add_timestamps_to_groups_table', NULL),
(74, '2022_05_20_000001_add_created_at_to_group_user_table', NULL),
(75, '2022_05_20_000002_add_created_at_to_group_permission_table', NULL),
(76, '2022_07_14_000000_add_type_index_to_posts', NULL),
(77, '2022_07_14_000001_add_type_created_at_composite_index_to_posts', NULL),
(78, '2022_08_06_000000_change_access_tokens_last_activity_at_to_nullable', NULL),
(79, '2024_11_18_000000_increase_email_field_length', NULL),
(80, '2024_11_22_000000_increase_email_field_length_in_email_tokens', NULL),
(81, '2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags'),
(82, '2015_09_02_000000_create_flags_table', 'flarum-flags'),
(83, '2017_07_22_000000_add_default_permissions', 'flarum-flags'),
(84, '2018_06_27_101500_change_flags_rename_time_to_created_at', 'flarum-flags'),
(85, '2018_06_27_101600_change_flags_add_foreign_keys', 'flarum-flags'),
(86, '2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at', 'flarum-flags'),
(87, '2018_09_15_043621_add_flags_indices', 'flarum-flags'),
(88, '2019_10_22_000000_change_reason_text_col_type', 'flarum-flags'),
(89, '2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval'),
(90, '2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval'),
(91, '2017_07_22_000000_add_default_permissions', 'flarum-approval'),
(92, '2015_02_24_000000_create_discussions_tags_table', 'flarum-tags'),
(93, '2015_02_24_000000_create_tags_table', 'flarum-tags'),
(94, '2015_02_24_000000_create_users_tags_table', 'flarum-tags'),
(95, '2015_02_24_000000_set_default_settings', 'flarum-tags'),
(96, '2015_10_19_061223_make_slug_unique', 'flarum-tags'),
(97, '2017_07_22_000000_add_default_permissions', 'flarum-tags'),
(98, '2018_06_27_085200_change_tags_columns', 'flarum-tags'),
(99, '2018_06_27_085300_change_tags_add_foreign_keys', 'flarum-tags'),
(100, '2018_06_27_090400_rename_users_tags_to_tag_user', 'flarum-tags'),
(101, '2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at', 'flarum-tags'),
(102, '2018_06_27_100200_change_tag_user_add_foreign_keys', 'flarum-tags'),
(103, '2018_06_27_103000_rename_discussions_tags_to_discussion_tag', 'flarum-tags'),
(104, '2018_06_27_103100_add_discussion_tag_foreign_keys', 'flarum-tags'),
(105, '2019_04_21_000000_add_icon_to_tags_table', 'flarum-tags'),
(106, '2022_05_20_000003_add_timestamps_to_tags_table', 'flarum-tags'),
(107, '2022_05_20_000004_add_created_at_to_discussion_tag_table', 'flarum-tags'),
(108, '2023_03_01_000000_create_post_mentions_tag_table', 'flarum-tags'),
(109, '2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend'),
(110, '2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend'),
(111, '2017_07_22_000000_add_default_permissions', 'flarum-suspend'),
(112, '2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until', 'flarum-suspend'),
(113, '2021_10_27_000000_add_suspend_reason_and_message', 'flarum-suspend'),
(114, '2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions'),
(115, '2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky'),
(116, '2017_07_22_000000_add_default_permissions', 'flarum-sticky'),
(117, '2018_09_15_043621_add_discussions_indices', 'flarum-sticky'),
(118, '2021_01_13_000000_add_discussion_last_posted_at_indices', 'flarum-sticky'),
(119, '2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions'),
(120, '2015_05_11_000000_create_mentions_users_table', 'flarum-mentions'),
(121, '2018_06_27_102000_rename_mentions_posts_to_post_mentions_post', 'flarum-mentions'),
(122, '2018_06_27_102100_rename_mentions_users_to_post_mentions_user', 'flarum-mentions'),
(123, '2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id', 'flarum-mentions'),
(124, '2018_06_27_102300_change_post_mentions_post_add_foreign_keys', 'flarum-mentions'),
(125, '2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id', 'flarum-mentions'),
(126, '2018_06_27_102500_change_post_mentions_user_add_foreign_keys', 'flarum-mentions'),
(127, '2021_04_19_000000_set_default_settings', 'flarum-mentions'),
(128, '2022_05_20_000005_add_created_at_to_post_mentions_post_table', 'flarum-mentions'),
(129, '2022_05_20_000006_add_created_at_to_post_mentions_user_table', 'flarum-mentions'),
(130, '2022_10_21_000000_create_post_mentions_group_table', 'flarum-mentions'),
(131, '2021_03_25_000000_default_settings', 'flarum-markdown'),
(132, '2015_02_24_000000_add_locked_to_discussions', 'flarum-lock'),
(133, '2017_07_22_000000_add_default_permissions', 'flarum-lock'),
(134, '2018_09_15_043621_add_discussions_indices', 'flarum-lock'),
(135, '2015_05_11_000000_create_posts_likes_table', 'flarum-likes'),
(136, '2015_09_04_000000_add_default_like_permissions', 'flarum-likes'),
(137, '2018_06_27_100600_rename_posts_likes_to_post_likes', 'flarum-likes'),
(138, '2018_06_27_100700_change_post_likes_add_foreign_keys', 'flarum-likes'),
(139, '2021_05_10_094200_add_created_at_to_post_likes_table', 'flarum-likes'),
(140, '2018_09_29_060444_replace_emoji_shorcuts_with_unicode', 'flarum-emoji'),
(141, '2020_11_23_000000_add_nickname_column', 'flarum-nicknames'),
(142, '2020_12_02_000001_set_default_permissions', 'flarum-nicknames'),
(143, '2021_11_16_000000_nickname_column_nullable', 'flarum-nicknames'),
(144, '2020_03_13_000001_add_warnings_table', 'askvortsov-moderator-warnings'),
(145, '2020_03_13_000002_add_default_permissions', 'askvortsov-moderator-warnings'),
(146, '2020_05_31_000000_format_note_content_for_renderer', 'askvortsov-moderator-warnings'),
(147, '2019_06_10_000000_rename_permissions', 'fof-user-directory'),
(148, '2020_02_06_01_rename_flagrow_permissions', 'fof-upload'),
(149, '2020_02_06_02_rename_flagrow_settings', 'fof-upload'),
(150, '2020_02_06_03_rename_flagrow_tables', 'fof-upload'),
(151, '2020_02_06_04_remove_flagrow_migrations', 'fof-upload'),
(152, '2020_02_06_05_create_files_table', 'fof-upload'),
(153, '2020_02_06_06_create_downloads_table', 'fof-upload'),
(154, '2020_02_06_07_alter_downloads_add_post_constraint', 'fof-upload'),
(155, '2021_02_11_01_add_uploads_view_and_delete_permissions', 'fof-upload'),
(156, '2021_03_13_000000_alter_upload_files_add_hidden_from_media_manager', 'fof-upload'),
(157, '2021_03_13_set_created_at_to_default_as_current_timestamp', 'fof-upload'),
(158, '2021_09_30_000000_add_index_actor_id_and_hide_media', 'fof-upload'),
(159, '2022_06_08_000000_alter_files_remove_post_fields', 'fof-upload'),
(160, '2022_06_08_000000_create_file_posts_table', 'fof-upload'),
(161, '2023_08_20_000000_alter_uploaded_files_s3_adapter', 'fof-upload'),
(162, '2023_08_20_000000_alter_uploads_s3_adapter', 'fof-upload'),
(163, '2023_12_04_000000_modify_fof_upload_files_add_shared_column', 'fof-upload'),
(164, '2023_12_04_000001_drop_old_index_from_fof_upload_files', 'fof-upload'),
(165, '2023_12_04_000002_alter_fof_upload_files_rename_hide_from_media_manager', 'fof-upload'),
(166, '2023_12_04_000003_add_indexes_to_fof_upload_files', 'fof-upload'),
(167, '2024_11_23_000000_alter_fof_upload_files_add_uuid_index', 'fof-upload'),
(168, '2025_02_06_000000_alter_default_image_mime_expression', 'fof-upload'),
(169, '2016_04_11_182821__create_pages_table', 'fof-pages'),
(170, '2016_08_28_180020_add_is_html', 'fof-pages'),
(171, '2020_02_26_010000_add_is_restricted', 'fof-pages'),
(172, '2020_09_09_173600_increase_char_limit', 'fof-pages'),
(173, '2021_04_15_create_post_user_bookmark_table', 'clarkwinkelmann-post-bookmarks'),
(174, '2022_05_09_000000_alter_discussions_add_anonymous_user', 'clarkwinkelmann-anonymous-posting'),
(175, '2022_05_09_000100_alter_posts_add_anonymous_user', 'clarkwinkelmann-anonymous-posting'),
(176, '2019_06_07_000000_add_recipients_table', 'fof-byobu'),
(177, '2019_06_07_000001_remove_flagrow_migrations', 'fof-byobu'),
(178, '2019_07_08_000000_add_blocks_pd_to_users', 'fof-byobu'),
(179, '2019_07_09_000000_blocks_pd_index', 'fof-byobu'),
(180, '2020_02_14_214800_fix_user_id_not_nullable_for_group_pds', 'fof-byobu'),
(181, '2020_02_19_110103_remove_retired_settings_key', 'fof-byobu'),
(182, '2020_10_23_000000_users_unified_index_column', 'fof-byobu'),
(183, '2021_01_13_000000_unified_index_index', 'fof-byobu'),
(184, '2021_01_13_000001_byobu_indicies', 'fof-byobu'),
(185, '2021_01_23_000000_drop_tags_from_old_private_discussions', 'fof-byobu'),
(186, '2021_04_21_000000_drop_users_unified_index_column', 'fof-byobu'),
(187, '2020_03_27_170000_set_initially_installed_version', 'neoncube-private-messages'),
(188, '2020_03_27_170413_create_conversations_table', 'neoncube-private-messages'),
(189, '2020_05_20_152335_add_fields_to_users', 'neoncube-private-messages'),
(190, '2020_05_21_180302_create_messages_table', 'neoncube-private-messages'),
(191, '2020_05_28_164214_create_conversation_user_table', 'neoncube-private-messages'),
(192, '2019_07_08_000000_create_reactions_tables', 'fof-reactions'),
(193, '2019_07_08_000001_create_post_reactions_table', 'fof-reactions'),
(194, '2019_07_08_000002_add_default_reaction_permission', 'fof-reactions'),
(195, '2019_07_08_000003_migrate_extension_settings', 'fof-reactions'),
(196, '2019_12_05_000000_add_timestamps_to_post_reactions_table', 'fof-reactions'),
(197, '2019_12_13_120237_add_enabled_column_to_reactions_table', 'fof-reactions'),
(198, '2020_01_19_000000_add_display_column_to_reactions_table', 'fof-reactions'),
(199, '2023_07_05_000000_create_post_anonymous_reactions_table', 'fof-reactions'),
(200, '2019_06_10_01_rename_permissions', 'fof-masquerade'),
(201, '2019_06_10_02_rename_flagrow_tables', 'fof-masquerade'),
(202, '2019_06_10_03_create_fields_table', 'fof-masquerade'),
(203, '2019_06_10_04_create_answers_table', 'fof-masquerade');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `from_user_id`, `type`, `subject_id`, `data`, `created_at`, `is_deleted`, `read_at`) VALUES
(1, 1, 49, 'byobuPrivateDiscussionCreated', 26, NULL, '2025-09-30 21:05:54', 0, '2025-09-30 21:11:34'),
(2, 27, 49, 'byobuPrivateDiscussionCreated', 26, NULL, '2025-09-30 21:05:54', 0, NULL),
(3, 1, 49, 'newPrivateMessage', 2, 0x7b226d657373616765223a7b226d657373616765223a22686969222c22757365725f6964223a34392c22637265617465645f6174223a22323032352d30392d33305432313a32313a34312e3030303030305a222c22636f6e766572736174696f6e5f6964223a312c226e756d626572223a322c22757064617465645f6174223a22323032352d30392d33305432313a32313a34312e3030303030305a222c226964223a327d2c22636f6e766572736174696f6e223a7b226964223a312c22746f74616c5f6d65737361676573223a322c22637265617465645f6174223a22323032352d30392d33305432313a32303a35392e3030303030305a222c22757064617465645f6174223a22323032352d30392d33305432313a32303a35392e3030303030305a227d2c2266726f6d55736572223a7b226964223a34392c22757365726e616d65223a224a6f736570685368616d6d61222c226e69636b6e616d65223a6e756c6c2c22656d61696c223a224a6f736570685368616d6d613040676d61696c2e636f6d222c2269735f656d61696c5f636f6e6669726d6564223a312c2270617373776f7264223a222432792431302461586f647863484536504676344f4561704e6a4c7175744e7561384c71646335645966765a4457422e6148334b37626d7665634c43222c226176617461725f75726c223a6e756c6c2c22707265666572656e636573223a7b22666f6c6c6f7741667465725265706c79223a66616c73652c22666c6172756d2d737562736372697074696f6e732e6e6f746966795f666f725f616c6c5f706f737473223a66616c73652c227573655269636854657874456469746f72223a747275652c227269636854657874436f6d7061637450617261677261706873223a66616c73652c226e6f746966795f64697363757373696f6e52656e616d65645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f656d61696c223a747275652c226e6f746966795f75736572556e73757370656e6465645f616c657274223a747275652c226e6f746966795f75736572556e73757370656e6465645f656d61696c223a747275652c226e6f746966795f706f73744d656e74696f6e65645f616c657274223a747275652c226e6f746966795f706f73744d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f757365724d656e74696f6e65645f616c657274223a747275652c226e6f746966795f757365724d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f67726f75704d656e74696f6e65645f616c657274223a747275652c226e6f746966795f67726f75704d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f616c657274223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f656d61696c223a747275652c226e6f746966795f6e6577506f73745f616c657274223a747275652c226e6f746966795f6e6577506f73745f656d61696c223a747275652c226e6f746966795f64697363757373696f6e4c6f636b65645f616c657274223a747275652c226e6f746966795f706f73744c696b65645f616c657274223a747275652c226e6f746966795f7761726e696e675f616c657274223a747275652c226e6f746966795f7761726e696e675f656d61696c223a747275652c22646973636c6f73654f6e6c696e65223a747275652c22696e64657850726f66696c65223a747275652c226c6f63616c65223a6e756c6c7d2c226a6f696e65645f6174223a22323032352d30392d33305432303a31353a34322e3030303030305a222c226c6173745f7365656e5f6174223a22323032352d30392d33305432313a32313a31322e3030303030305a222c226d61726b65645f616c6c5f61735f726561645f6174223a6e756c6c2c22726561645f6e6f74696669636174696f6e735f6174223a6e756c6c2c2264697363757373696f6e5f636f756e74223a302c22636f6d6d656e745f636f756e74223a322c22726561645f666c6167735f6174223a6e756c6c2c2273757370656e6465645f756e74696c223a6e756c6c2c2273757370656e645f726561736f6e223a6e756c6c2c2273757370656e645f6d657373616765223a6e756c6c2c2264696162657465735f74797065223a224f74686572222c22626c6f636b735f62796f62755f7064223a302c22756e726561645f6d65737361676573223a307d7d, '2025-09-30 21:21:41', 0, NULL),
(5, 52, 48, 'postReacted', 36, 0x227b5c2269645c223a362c5c226964656e7469666965725c223a5c22746164615c222c5c22747970655c223a5c22656d6f6a695c222c5c22656e61626c65645c223a747275652c5c22646973706c61795c223a6e756c6c7d22, '2025-10-25 09:56:38', 0, NULL),
(6, 52, 49, 'newPost', 43, 0x7b22706f73744e756d626572223a327d, '2025-10-25 10:22:10', 0, NULL),
(7, 48, 1, 'postReacted', 43, 0x227b5c2269645c223a352c5c226964656e7469666965725c223a5c2268656172745c222c5c22747970655c223a5c22656d6f6a695c222c5c22656e61626c65645c223a747275652c5c22646973706c61795c223a6e756c6c7d22, '2025-10-25 11:11:59', 0, NULL),
(8, 49, 52, 'newPrivateMessage', 3, 0x7b226d657373616765223a7b226d657373616765223a2268657920746865726520646f63746f722c2069732069742066696e6520746f20636f6e74616374207520707269766174656c7920696e206865726520696e2063617365206f6620736f6d652070726976617465207175657374696f6e7320726567617264696e67206d792042473f222c22757365725f6964223a35322c22637265617465645f6174223a22323032352d31302d32355431313a35383a33352e3030303030305a222c22636f6e766572736174696f6e5f6964223a322c226e756d626572223a312c22757064617465645f6174223a22323032352d31302d32355431313a35383a33352e3030303030305a222c226964223a337d2c22636f6e766572736174696f6e223a7b226964223a322c22746f74616c5f6d65737361676573223a312c22637265617465645f6174223a22323032352d31302d32355431313a35383a33352e3030303030305a222c22757064617465645f6174223a22323032352d31302d32355431313a35383a33352e3030303030305a227d2c2266726f6d55736572223a7b226964223a35322c22757365726e616d65223a227761726461616177313233222c226e69636b6e616d65223a6e756c6c2c22656d61696c223a22776172646161617731323340676d61696c2e636f6d222c2269735f656d61696c5f636f6e6669726d6564223a312c2270617373776f7264223a2224327924313024514e594f6d68477a534861667250306f545951645575683730513274414775756430747530395946307477706b6d556c495c2f38372e222c226176617461725f75726c223a6e756c6c2c22707265666572656e636573223a7b22666f6c6c6f7741667465725265706c79223a66616c73652c22666c6172756d2d737562736372697074696f6e732e6e6f746966795f666f725f616c6c5f706f737473223a66616c73652c227573655269636854657874456469746f72223a747275652c227269636854657874436f6d7061637450617261677261706873223a66616c73652c226e6f746966795f64697363757373696f6e52656e616d65645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f656d61696c223a747275652c226e6f746966795f75736572556e73757370656e6465645f616c657274223a747275652c226e6f746966795f75736572556e73757370656e6465645f656d61696c223a747275652c226e6f746966795f6e6577507269766174654d6573736167655f616c657274223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f656d61696c223a747275652c226e6f746966795f706f7374526561637465645f616c657274223a747275652c226e6f746966795f6e6577506f73745f616c657274223a747275652c226e6f746966795f6e6577506f73745f656d61696c223a747275652c226e6f746966795f64697363757373696f6e4c6f636b65645f616c657274223a747275652c226e6f746966795f706f73744c696b65645f616c657274223a747275652c226e6f746966795f7761726e696e675f616c657274223a747275652c226e6f746966795f7761726e696e675f656d61696c223a747275652c22646973636c6f73654f6e6c696e65223a747275652c22696e64657850726f66696c65223a747275652c226c6f63616c65223a6e756c6c7d2c226a6f696e65645f6174223a22323032352d31302d32325431313a30323a30372e3030303030305a222c226c6173745f7365656e5f6174223a22323032352d31302d32355431313a35373a30322e3030303030305a222c226d61726b65645f616c6c5f61735f726561645f6174223a6e756c6c2c22726561645f6e6f74696669636174696f6e735f6174223a22323032352d31302d32355431303a31373a35312e3030303030305a222c2264697363757373696f6e5f636f756e74223a352c22636f6d6d656e745f636f756e74223a362c22726561645f666c6167735f6174223a6e756c6c2c2273757370656e6465645f756e74696c223a6e756c6c2c2273757370656e645f726561736f6e223a6e756c6c2c2273757370656e645f6d657373616765223a6e756c6c2c2264696162657465735f74797065223a224d4f4459222c22626c6f636b735f62796f62755f7064223a302c22756e726561645f6d65737361676573223a302c2267726f757073223a5b5d7d7d, '2025-10-25 11:58:35', 0, NULL),
(9, 52, 49, 'newPrivateMessage', 4, 0x7b226d657373616765223a7b226d657373616765223a226162736f6c7574656c792120676f2061686561645c6e222c22757365725f6964223a34392c22637265617465645f6174223a22323032352d31302d32355431323a30303a33302e3030303030305a222c22636f6e766572736174696f6e5f6964223a322c226e756d626572223a322c22757064617465645f6174223a22323032352d31302d32355431323a30303a33302e3030303030305a222c226964223a347d2c22636f6e766572736174696f6e223a7b226964223a322c22746f74616c5f6d65737361676573223a322c22637265617465645f6174223a22323032352d31302d32355431313a35383a33352e3030303030305a222c22757064617465645f6174223a22323032352d31302d32355431313a35383a33352e3030303030305a227d2c2266726f6d55736572223a7b226964223a34392c22757365726e616d65223a224a6f736570685368616d6d61222c226e69636b6e616d65223a6e756c6c2c22656d61696c223a224a6f736570685368616d6d613040676d61696c2e636f6d222c2269735f656d61696c5f636f6e6669726d6564223a312c2270617373776f7264223a222432792431302461586f647863484536504676344f4561704e6a4c7175744e7561384c71646335645966765a4457422e6148334b37626d7665634c43222c226176617461725f75726c223a6e756c6c2c22707265666572656e636573223a7b22666f6c6c6f7741667465725265706c79223a66616c73652c22666c6172756d2d737562736372697074696f6e732e6e6f746966795f666f725f616c6c5f706f737473223a66616c73652c227573655269636854657874456469746f72223a747275652c227269636854657874436f6d7061637450617261677261706873223a66616c73652c226e6f746966795f64697363757373696f6e52656e616d65645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f656d61696c223a747275652c226e6f746966795f75736572556e73757370656e6465645f616c657274223a747275652c226e6f746966795f75736572556e73757370656e6465645f656d61696c223a747275652c226e6f746966795f6e6577507269766174654d6573736167655f616c657274223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f656d61696c223a747275652c226e6f746966795f706f7374526561637465645f616c657274223a747275652c226e6f746966795f6e6577506f73745f616c657274223a747275652c226e6f746966795f6e6577506f73745f656d61696c223a747275652c226e6f746966795f64697363757373696f6e4c6f636b65645f616c657274223a747275652c226e6f746966795f706f73744c696b65645f616c657274223a747275652c226e6f746966795f7761726e696e675f616c657274223a747275652c226e6f746966795f7761726e696e675f656d61696c223a747275652c22646973636c6f73654f6e6c696e65223a747275652c22696e64657850726f66696c65223a747275652c226c6f63616c65223a6e756c6c7d2c226a6f696e65645f6174223a22323032352d30392d33305432303a31353a34322e3030303030305a222c226c6173745f7365656e5f6174223a22323032352d31302d32355431323a30303a30322e3030303030305a222c226d61726b65645f616c6c5f61735f726561645f6174223a6e756c6c2c22726561645f6e6f74696669636174696f6e735f6174223a22323032352d31302d32355431303a32303a30392e3030303030305a222c2264697363757373696f6e5f636f756e74223a302c22636f6d6d656e745f636f756e74223a332c22726561645f666c6167735f6174223a6e756c6c2c2273757370656e6465645f756e74696c223a6e756c6c2c2273757370656e645f726561736f6e223a6e756c6c2c2273757370656e645f6d657373616765223a6e756c6c2c2264696162657465735f74797065223a224f74686572222c22626c6f636b735f62796f62755f7064223a302c22756e726561645f6d65737361676573223a307d7d, '2025-10-25 12:00:30', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `time` datetime NOT NULL,
  `edit_time` datetime DEFAULT NULL,
  `content` mediumtext DEFAULT NULL COMMENT ' ',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `is_html` tinyint(1) NOT NULL DEFAULT 0,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_tokens`
--

CREATE TABLE `password_tokens` (
  `token` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `anonymous_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `discussion_id`, `number`, `created_at`, `user_id`, `type`, `content`, `edited_at`, `edited_user_id`, `hidden_at`, `hidden_user_id`, `ip_address`, `is_private`, `is_approved`, `anonymous_user_id`) VALUES
(18, 24, 1, '2025-09-30 15:59:10', 45, 'comment', '<t><p>question</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(19, 24, 2, '2025-09-30 20:30:46', 49, 'comment', '<t><p>here\'s an answer to ur question</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(21, 26, 1, '2025-09-30 21:05:54', 49, 'comment', '<t><p>hello there</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(22, 26, 2, '2025-09-30 21:05:54', 49, 'recipientsModified', '{\"new\":{\"users\":[1,27,49],\"groups\":[]},\"old\":{\"users\":[],\"groups\":[]}}', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL),
(25, 29, 1, '2025-10-05 22:39:07', 1, 'comment', '<t><p>&#127869;️ dfffffffffffffffffffff</p>\n\n<p>&#128202; NUTRITIONAL INFO (Per Serving):</p>\n\n<p>• Carbohydrates: 0.2g</p>\n\n<p>• Protein: 4g</p>\n\n<p>• Calories: 4</p>\n\n<p>• Serves: 6 people</p>\n\n<p>• Prep Time: 6 minutes</p>\n\n<p>• Difficulty: Medium</p>\n\n<p>&#128722; INGREDIENTS:</p>\n\n<p>hg</p>\n\n<p>&#128104;‍&#127859; INSTRUCTIONS:</p>\n\n<p>btr</p>\n\n<p>&#128161; DIABETES TIPS:</p>\n\n<p>None provided</p>\n\n<p>────────────────────────────</p>\n\n<p>✅ All nutritional information verified and complete</p></t>', '2025-10-06 11:46:58', 1, NULL, NULL, '::1', 0, 1, NULL),
(26, 30, 1, '2025-10-06 10:09:58', 1, 'comment', '<t><p>&#127869;️ honey lime chicken bowl</p>\n\n<p>&#128202; NUTRITIONAL INFO (Per Serving):</p>\n\n<p>• Carbohydrates: 6g</p>\n\n<p>• Protein: 60g</p>\n\n<p>• Calories: 350</p>\n\n<p>• Serves: 1 people</p>\n\n<p>• Prep Time: 10 minutes</p>\n\n<p>• Difficulty: Easy</p>\n\n<p>&#128722; INGREDIENTS:</p>\n\n<p>chicken- 200 g</p>\n\n<p>honey- 1tsp</p>\n\n<p>paprika</p>\n\n<p>garlic powder</p>\n\n<p>onion powder</p>\n\n<p>olive oil</p>\n\n<p>salt</p>\n\n<p>pepper</p>\n\n<p>lime</p>\n\n<p>&#128104;‍&#127859; INSTRUCTIONS:</p>\n\n<p>Season your chicken with all the spices mentioned above, as much as you like! Add the olive oil and honey at the end.</p>\n\n<p>Heat a pan ahead of time, then place your chicken on it. When the color starts to change (after about 3 minutes), squeeze in half a lime. Cook for 7 more minutes.</p>\n\n<p>Bon appétit! &#128515;</p>\n\n<p>&#128161; DIABETES TIPS:</p>\n\n<p>Just be careful with the honey, use as much as you want, but it might spike your sugar. 1 teaspoon is more than enough and will keep you in the safe zone!</p>\n\n<p>────────────────────────────</p>\n\n<p>✅ All nutritional information verified and complete</p></t>', '2025-10-06 11:47:19', 1, NULL, NULL, '::1', 0, 1, NULL),
(27, 31, 1, '2025-10-21 09:53:55', NULL, 'comment', '<t><p>im sick of my t1d</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, 1),
(28, 32, 1, '2025-10-22 09:50:11', 48, 'comment', '<t><p>im testing if diabetes type will show</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(29, 33, 1, '2025-10-22 09:55:31', 48, 'comment', '<t><p>im testing diabetes type</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(31, 35, 1, '2025-10-22 10:03:25', 48, 'comment', '<t><p>im testing diabetes type</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(33, 37, 1, '2025-10-22 11:11:44', 52, 'comment', '<t><p>testing Mody type</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(34, 38, 1, '2025-10-22 11:48:17', 48, 'comment', '<t><p>test no1000</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(36, 40, 1, '2025-10-25 09:56:05', 52, 'comment', '<t><p>hello there!</p>\n\n<p>I would love to hear some suggestion for a low-carb, diabetic friendly recipe for muffins. I have been craving some lately, but I don\'t wanna mess my sugar levels up.</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(37, 41, 1, '2025-10-25 10:01:41', 1, 'comment', '<t><p>&#127869;️ Almond Blueberry Low-Carb Muffins</p>\n\n<p>&#128202; NUTRITIONAL INFO (Per Serving):</p>\n\n<p>• Carbohydrates: 8g</p>\n\n<p>• Protein: 7g</p>\n\n<p>• Calories: 145</p>\n\n<p>• Serves: 6 people</p>\n\n<p>• Prep Time: 25 minutes</p>\n\n<p>• Difficulty: Easy</p>\n\n<p>&#128722; INGREDIENTS:</p>\n\n<p>1 cup almond flour</p>\n\n<p>2 large eggs</p>\n\n<p>2 tbsp olive oil (or melted butter)</p>\n\n<p>2 tbsp unsweetened almond milk</p>\n\n<p>1/4 cup erythritol or stevia</p>\n\n<p>1 tsp baking powder</p>\n\n<p>1/2 tsp vanilla extract</p>\n\n<p>1/3 cup fresh or frozen blueberries</p>\n\n<p>&#128104;‍&#127859; INSTRUCTIONS:</p>\n\n<p>Preheat oven to 180°C (350°F) and line a muffin tin.</p>\n\n<p>In a bowl, whisk eggs, oil, almond milk, vanilla, and sweetener.</p>\n\n<p>Add almond flour and baking powder; stir until smooth.</p>\n\n<p>Gently fold in blueberries.</p>\n\n<p>Spoon batter evenly into 6 muffin cups.</p>\n\n<p>Bake for 18–20 minutes or until golden brown.</p>\n\n<p>Let cool before serving.</p>\n\n<p>&#128161; DIABETES TIPS:</p>\n\n<p>These muffins are low in carbs and high in healthy fats, so they may not cause a fast glucose spike. If using rapid-acting insulin, consider dosing 10–15 minutes after eating to avoid early drops. Best paired with a source of protein or eaten as a snack when blood sugar is stable (90–120 mg/dL).</p>\n\n<p>────────────────────────────</p>\n\n<p>✅ All nutritional information verified and complete</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(38, 42, 1, '2025-10-25 10:04:09', 48, 'comment', '<t><p>&#127869;️ Almond Blueberry Low-Carb Muffins</p>\n\n<p>&#128202; NUTRITIONAL INFO (Per Serving):</p>\n\n<p>• Carbohydrates: 8g</p>\n\n<p>• Protein: 7g</p>\n\n<p>• Calories: 145</p>\n\n<p>• Serves: 6 people</p>\n\n<p>• Prep Time: 25 minutes</p>\n\n<p>• Difficulty: Easy</p>\n\n<p>&#128722; INGREDIENTS:</p>\n\n<p>1 cup almond flour</p>\n\n<p>2 large eggs</p>\n\n<p>2 tbsp olive oil (or melted butter)</p>\n\n<p>2 tbsp unsweetened almond milk</p>\n\n<p>1/4 cup erythritol or stevia</p>\n\n<p>1 tsp baking powder</p>\n\n<p>1/2 tsp vanilla extract</p>\n\n<p>1/3 cup fresh or frozen blueberries</p>\n\n<p>&#128104;‍&#127859; INSTRUCTIONS:</p>\n\n<p>Preheat oven to 180°C (350°F) and line a muffin tin.</p>\n\n<p>In a bowl, whisk eggs, oil, almond milk, vanilla, and sweetener.</p>\n\n<p>Add almond flour and baking powder; stir until smooth.</p>\n\n<p>Gently fold in blueberries.</p>\n\n<p>Spoon batter evenly into 6 muffin cups.</p>\n\n<p>Bake for 18–20 minutes or until golden brown.</p>\n\n<p>Let cool before serving.</p>\n\n<p>&#128161; DIABETES TIPS:</p>\n\n<p>These muffins are low in carbs and high in healthy fats, so they may not cause a fast glucose spike. If using rapid-acting insulin, consider dosing 10–15 minutes after eating to avoid early drops. Best paired with a source of protein or eaten as a snack when blood sugar is stable (90–120 mg/dL).</p>\n\n<p>────────────────────────────</p>\n\n<p>✅ All nutritional information verified and complete</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(39, 40, 2, '2025-10-25 10:06:00', 48, 'comment', '<t><p>Hey there Ward!</p> \n\n<p>I just posted an almond blueberry muffins recipe that I tried a couple of days ago on the wall, so everyone can see. hope u like it!</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(40, 43, 1, '2025-10-25 10:17:15', 48, 'comment', '<t><p>Hi Doctor, I woke up this morning with my blood sugar at 270 mg/dL and moderate ketones on my urine strip. I took a correction dose two hours ago, but my glucose is still around 240 mg/dL. I’ve been drinking water, but I’m starting to feel a bit nauseous. Should I go to the ER or wait a bit longer to see if the insulin starts working?</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(41, 43, 2, '2025-10-25 10:22:09', 49, 'comment', '<r><p>You did the right thing by checking ketones and correcting with insulin. Persistent high blood sugar with moderate ketones and nausea can be an early sign of <STRONG><s>**</s>diabetic ketoacidosis (DKA)<e>**</e></STRONG>.</p>\n\n<p>If you still feel unwell or your glucose doesn’t drop below 200 mg/dL within the next hour, <STRONG><s>**</s>go to the nearest emergency department immediately<e>**</e></STRONG> — especially if you start vomiting or breathing rapidly.</p>\n\n<p>Meanwhile:<br/>\n• Keep hydrating with <STRONG><s>**</s>sugar-free fluids<e>**</e></STRONG> (water or electrolyte solution).<br/>\n• Avoid eating until your glucose starts to improve.<br/>\n• If you use an insulin pump, <STRONG><s>**</s>check that it’s delivering properly<e>**</e></STRONG> (no occlusion or site failure).</p>\n\n<p>Always err on the side of caution;  high ketones plus nausea can escalate quickly. Seek in-person care if symptoms persist or worsen.</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(42, 44, 1, '2025-10-25 11:06:37', 1, 'comment', '<t><p>I was diagnosed with Type 2 diabetes three years ago, but for months before that, I kept brushing off the symptoms: constant thirst, fatigue, blurry vision. I told myself it was just stress from work. One morning, I nearly fainted in the shower, and that’s when I decided to check my blood sugar. It was over 350 mg/dL.</p>\n\n<p>The first few weeks after diagnosis were chaotic .. I didn’t know what to eat, when to check, or how to manage my emotions. I felt guilty, scared, and angry all at once. But slowly, I learned to take control instead of blaming myself. I started walking every day, reduced carbs gradually, and focused on consistency rather than perfection.</p>\n\n<p>Today, my A1C is 6.1, and while it’s still a daily effort, I feel stronger and more aware than ever. If you’re newly diagnosed, please know this: it’s okay to feel overwhelmed. Small, steady changes really do add up.</p></t>', NULL, NULL, '2025-10-25 11:06:45', 1, '::1', 0, 1, NULL),
(43, 45, 1, '2025-10-25 11:08:15', 48, 'comment', '<t><p>I was diagnosed with Type 2 diabetes three years ago, but for months before that, I kept brushing off the symptoms: constant thirst, fatigue, blurry vision. I told myself it was just stress from work. One morning, I nearly fainted in the shower, and that’s when I decided to check my blood sugar. It was over 350 mg/dL.</p>\n\n<p>The first few weeks after diagnosis were chaotic.. I didn’t know what to eat, when to check, or how to manage my emotions. I felt guilty, scared, and angry all at once. But slowly, I learned to take control instead of blaming myself. I started walking every day, reduced carbs gradually, and focused on consistency rather than perfection.</p>\n\n<p>Today, my A1C is 6.1, and while it’s still a daily effort, I feel stronger and more aware than ever. If you’re newly diagnosed, please know this: it’s okay to feel overwhelmed. Small, steady changes really do add up.</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(44, 46, 1, '2025-10-25 11:22:35', 52, 'comment', '<r><p><UPL-IMAGE-PREVIEW alt=\"{TEXT?}\" url=\"http://localhost/diabetes-community/public/assets/files/2025-10-25/1761391322-160668-tir.jpg\" uuid=\"95b2b1c0-3268-4ade-875b-81f2e840455b\">[upl-image-preview uuid=95b2b1c0-3268-4ade-875b-81f2e840455b url=http://localhost/diabetes-community/public/assets/files/2025-10-25/1761391322-160668-tir.jpg alt={TEXT?}]</UPL-IMAGE-PREVIEW></p>\n\n<p>I just had to share this one — 98% Time in Range for the whole week (18–24 July)! &#127881;<br/>\nAs someone with MODY, my numbers can be unpredictable at times, especially when stress or skipped meals get in the mix. But this week felt different — consistent meals, short walks after dinner, and staying mindful of timing made all the difference.</p>\n\n<p>Seeing <EM><s>*</s>0% below 70<e>*</e></EM> and <EM><s>*</s>only 2% above 180<e>*</e></EM> honestly feels like such a win. It’s not about perfection, but this shows that balance <EM><s>*</s>is<e>*</e></EM> possible.</p>\n\n<p>If anyone’s struggling to stay steady — keep tweaking, stay patient, and celebrate the small victories. They really add up &#128154;</p></r>', NULL, NULL, '2025-10-25 11:23:01', 52, '::1', 0, 1, NULL),
(45, 47, 1, '2025-10-25 11:23:43', 52, 'comment', '<r><p>I just had to share this one — 98% Time in Range for the whole week (18–24 July)! &#127881;<br/>\nAs someone with MODY, my numbers can be unpredictable at times, especially when stress or skipped meals get in the mix. But this week felt different — consistent meals, short walks after dinner, and staying mindful of timing made all the difference.</p>\n\n<p>Seeing <EM><s>*</s>0% below 70<e>*</e></EM> and <EM><s>*</s>only 2% above 180<e>*</e></EM> honestly feels like such a win. It’s not about perfection, but this shows that balance <EM><s>*</s>is<e>*</e></EM> possible.</p>\n\n<p>If anyone’s struggling to stay steady — keep tweaking, stay patient, and celebrate the small victories. They really add up &#128154;</p>\n\n\n<p><UPL-IMAGE-PREVIEW alt=\"{TEXT?}\" url=\"http://localhost/diabetes-community/public/assets/files/2025-10-25/1761391322-160668-tir.jpg\" uuid=\"95b2b1c0-3268-4ade-875b-81f2e840455b\">[upl-image-preview uuid=95b2b1c0-3268-4ade-875b-81f2e840455b url=http://localhost/diabetes-community/public/assets/files/2025-10-25/1761391322-160668-tir.jpg alt={TEXT?}]</UPL-IMAGE-PREVIEW></p>\n\n\n</r>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(46, 48, 1, '2025-10-25 11:38:04', 52, 'comment', '<t><p>I started doing a 25-minute brisk walk every morning before breakfast for the past two weeks — and wow, the difference in my glucose patterns is insane. My post-meal spikes are much gentler, and my average readings dropped by about 20 mg/dL without changing my meals or insulin!</p>\n\n<p>At first, I was nervous about going low mid-walk, so I tested before heading out (around 110 mg/dL) and carried a small juice box just in case. Haven’t needed it yet, but it gives peace of mind.</p>\n\n<p>If anyone’s struggling with stubborn highs or just feeling sluggish, I highly recommend adding even short walks — it’s amazing how movement stabilizes both body and mind &#128170;</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(47, 49, 1, '2025-10-25 11:39:47', NULL, 'comment', '<r><p>Hey everyone,<br/>\nI’ve noticed something strange lately — every time I do resistance training (mostly weights and short sets), my blood sugar <EM><s>*</s>rises<e>*</e></EM> instead of dropping. I start around 110–120 mg/dL, and by the end of the workout, I’m sometimes up to 180–200 mg/dL.</p>\n\n<p>I don’t eat before training, and I’m not under stress or sick. Cardio usually lowers my glucose, but strength training does the opposite.</p>\n\n<p>Is this normal? Do I need a small correction dose before lifting, or should I just let it come down naturally afterward? Would love to hear how others manage post-lifting spikes without crashing later.</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1, 48),
(48, 49, 2, '2025-10-25 11:50:10', 52, 'comment', '<r><p>Totally normal,  you’re not doing anything wrong! &#128170;<br/>\nResistance training can actually <EM><s>*</s>raise<e>*</e></EM> blood sugar temporarily because your body releases stress hormones (like adrenaline and cortisol) during intense effort. Those hormones tell your liver to dump extra glucose into your bloodstream for energy.</p>\n\n<p>For most people, it drops back down within 1–2 hours after finishing, especially if you eat a balanced post-workout meal or do some light walking after lifting.</p>\n\n<p>I personally don’t correct right away unless it stays high for a while, because it usually comes down on its own, otherwise you risk going low later. Try tracking your patterns for a week or two and see how long it takes for your glucose to settle.</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(49, 50, 1, '2025-10-25 11:54:00', 48, 'comment', '<t><p>Hey everyone,<br/>\nI’m flying overseas next week for the first time since my diagnosis, and I’m a bit nervous about how to handle my insulin and CGM supplies during travel. The flight is 11 hours long, and I’m not sure the best way to keep my insulin at a safe temperature without freezing it or letting it get too warm.</p>\n\n<p>I’ve seen people mention cooling cases and Frio packs — are they actually reliable on long flights? Also, how do you handle airport security? Do you keep your insulin in your carry-on the whole time, or do you pack extras in checked luggage too?</p>\n\n<p>Any travel hacks, packing tips, or personal experiences would be super helpful. I just want to make sure I don’t mess up my dosing or storage midair!</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL),
(50, 50, 2, '2025-10-25 11:55:51', NULL, 'comment', '<r><p>Hey! MODY here — I’ve done a few long flights recently, so totally get the stress &#128517;</p>\n\n<p>I usually keep all my meds and glucose stuff <STRONG><s>**</s>in my carry-on<e>**</e></STRONG>, never checked baggage (luggage areas can get too hot or cold). For insulin, I use a <STRONG><s>**</s>Frio cooling pouch<e>**</e></STRONG>, and it works amazingly — no ice, just water activation. It keeps everything around room temperature even on 10+ hour flights.</p>\n\n<p>Security-wise, I just tell them I have diabetes supplies before screening. They usually wave me through or do a quick visual check — no big deal. I also bring a <STRONG><s>**</s>doctor’s note<e>**</e></STRONG> just in case.</p>\n\n<p>Since MODY can act a bit unpredictable with long sitting times and weird meal schedules, I try to <STRONG><s>**</s>check my glucose once or twice more than usual<e>**</e></STRONG> during travel days. The combo of stress + altitude can push numbers higher temporarily, so I don’t overcorrect; it balances out after landing.</p>\n\n<p>You’ll be fine — just stay hydrated, move around a bit mid-flight, and pack extra test strips and snacks. Safe travels ✈️&#128153;</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1, 52),
(51, 51, 1, '2025-10-25 12:13:10', NULL, 'comment', '<r><p>Hey everyone,<br/>\nI’ve been noticing lately that my CGM readings (Libre 3) are sometimes <STRONG><s>**</s>20–30 mg/dL lower<e>**</e></STRONG> than my fingerstick values, especially after meals or workouts. It catches up eventually, but there’s always that annoying lag that makes it hard to trust the number in real time.</p>\n\n<p>I know sensors measure interstitial fluid, not blood, but sometimes the delay feels longer than it used to be. I’ve tried calibrating, restarting, and even switching arms — same issue.</p>\n\n<p>Is anyone else seeing this? Wondering if it’s just me, a sensor batch issue, or something that happens when glucose levels are changing fast. Would love to hear what tricks others use to keep their CGM as accurate as possible.</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1, 1),
(52, 52, 1, '2025-10-25 12:16:47', NULL, 'comment', '<r><p>Needed to get this off my chest.<br/>\nI’ve been eating clean, walking daily, pre-bolusing, drinking enough water. <EM><s>*</s>everything.<e>*</e></EM> And yet, my blood sugar decides to spike out of nowhere at 3 a.m. or after the exact same lunch that was fine yesterday. It’s exhausting.</p>\n\n<p>It’s not even the numbers themselves that get to me.. it’s that feeling of doing all the “right” things and still getting blindsided. The mental load never stops. Sometimes I just want to eat a meal without calculating, guessing, or checking every 20 minutes.</p>\n\n<p>I know it’ll pass and tomorrow might be better, but tonight I just feel completely worn out. Thanks for letting me vent. I know you all get it &#128153;</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1, 48),
(53, 52, 2, '2025-10-25 12:17:37', 52, 'comment', '<t><p>You’re definitely not alone, we all end up in that boat sometimes. &#128542; It’s crazy how much effort this takes day after day. But yeah, it’s okay to let it all out. We keep going, even on the hard days… that’s what makes us strong. &#128153;</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_anonymous_reactions`
--

CREATE TABLE `post_anonymous_reactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `guest_id` varchar(64) NOT NULL,
  `reaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_mentions_group`
--
-- Error reading structure for table diabetes_community.post_mentions_group: #1932 - Table &#039;diabetes_community.post_mentions_group&#039; doesn&#039;t exist in engine
-- Error reading data for table diabetes_community.post_mentions_group: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `diabetes_community`.`post_mentions_group`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `post_mentions_post`
--

CREATE TABLE `post_mentions_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_mentions_tag`
--

CREATE TABLE `post_mentions_tag` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_mentions_user`
--

CREATE TABLE `post_mentions_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_reactions`
--

CREATE TABLE `post_reactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_reactions`
--

INSERT INTO `post_reactions` (`id`, `post_id`, `user_id`, `reaction_id`, `created_at`, `updated_at`) VALUES
(2, 36, 48, 6, '2025-10-25 06:56:38', '2025-10-25 06:56:38'),
(3, 43, 1, 5, '2025-10-25 08:11:59', '2025-10-25 08:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_user_bookmark`
--

CREATE TABLE `post_user_bookmark` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `display` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`id`, `identifier`, `type`, `enabled`, `display`) VALUES
(1, 'thumbsup', 'emoji', 1, NULL),
(2, 'thumbsdown', 'emoji', 1, NULL),
(3, 'laughing', 'emoji', 1, NULL),
(4, 'confused', 'emoji', 1, NULL),
(5, 'heart', 'emoji', 1, NULL),
(6, 'tada', 'emoji', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE `recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `removed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`id`, `discussion_id`, `user_id`, `group_id`, `created_at`, `updated_at`, `removed_at`) VALUES
(1, 26, 1, NULL, NULL, NULL, NULL),
(2, 26, 27, NULL, NULL, NULL, NULL),
(3, 26, 49, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registration_tokens`
--

CREATE TABLE `registration_tokens` (
  `token` varchar(100) NOT NULL,
  `payload` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_attributes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`) VALUES
('allow_hide_own_posts', 'reply'),
('allow_post_editing', 'reply'),
('allow_renaming', '10'),
('allow_sign_up', '1'),
('custom_footer', '<script>\ndocument.addEventListener(\'DOMContentLoaded\', function() {\n    console.log(\'Recipe form script loaded and watching for Composer state changes. (Final Robust Fix Applied)\');\n\n    // --- UTILITY FUNCTIONS ---\n    // The functions for showing, closing, and creating the post remain the same as you provided.\n    \n    // Simple function to create and show the recipe form (No changes needed)\n    window.showRecipeForm = function() {\n        const existingOverlay = document.querySelector(\'.recipe-form-overlay\');\n        if (existingOverlay) {\n            existingOverlay.remove();\n        }\n\n        // Create the overlay\n        const overlay = document.createElement(\'div\');\n        overlay.className = \'recipe-form-overlay\';\n        overlay.style.cssText = `\n            position: fixed;\n            top: 0;\n            left: 0;\n            width: 100%;\n            height: 100%;\n            background: rgba(0,0,0,0.8);\n            z-index: 10000;\n            display: block;\n        `;\n\n        overlay.innerHTML = `\n            <div class=\"recipe-form\" style=\"\n                position: absolute;\n                top: 50%;\n                left: 50%;\n                transform: translate(-50%, -50%);\n                background: white;\n                padding: 30px;\n                border-radius: 10px;\n                width: 500px;\n                max-height: 80vh;\n                overflow-y: auto;\n            \">\n                <div class=\"form-header\" style=\"display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;\">\n                    <h2>🍽️ Post a Recipe</h2>\n                    <button onclick=\"closeRecipeForm()\" style=\"\n                        background: #dc3545;\n                        color: white;\n                        border: none;\n                        border-radius: 50%;\n                        width: 30px;\n                        height: 30px;\n                        cursor: pointer;\n                        font-size: 16px;\n                        font-weight: bold;\n                    \">✕</button>\n                </div>\n                \n                <form id=\"recipeForm\">\n                    <div style=\"margin-bottom: 15px;\">\n                        <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Recipe Name *</label>\n                        <input type=\"text\" id=\"recipeName\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                        <div class=\"error\" id=\"recipeNameError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                    </div>\n                    \n                    <div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-bottom: 15px;\">\n                        <div>\n                            <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Carbs (g) *</label>\n                            <input type=\"number\" id=\"carbs\" min=\"0\" step=\"0.1\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                            <div class=\"error\" id=\"carbsError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                        </div>\n                        <div>\n                            <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Protein (g) *</label>\n                            <input type=\"number\" id=\"protein\" min=\"0\" step=\"0.1\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                            <div class=\"error\" id=\"proteinError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                        </div>\n                        <div>\n                            <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Calories *</label>\n                            <input type=\"number\" id=\"calories\" min=\"0\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                            <div class=\"error\" id=\"caloriesError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                        </div>\n                        <div>\n                            <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Servings *</label>\n                            <input type=\"number\" id=\"servings\" min=\"1\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                            <div class=\"error\" id=\"servingsError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                        </div>\n                    </div>\n                    \n                    <div style=\"margin-bottom: 15px;\">\n                        <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Prep Time (minutes) *</label>\n                        <input type=\"number\" id=\"prepTime\" min=\"1\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                        <div class=\"error\" id=\"prepTimeError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                    </div>\n                    \n                    <div style=\"margin-bottom: 15px;\">\n                        <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Difficulty *</label>\n                        <select id=\"difficulty\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\">\n                            <option value=\"\">Select difficulty</option>\n                            <option value=\"Easy\">Easy</option>\n                            <option value=\"Medium\">Medium</option>\n                            <option value=\"Hard\">Hard</option>\n                        </select>\n                        <div class=\"error\" id=\"difficultyError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                    </div>\n                    \n                    <div style=\"margin-bottom: 15px;\">\n                        <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Ingredients *</label>\n                        <textarea id=\"ingredients\" rows=\"4\" placeholder=\"List each ingredient with amounts...\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\"></textarea>\n                        <div class=\"error\" id=\"ingredientsError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                    </div>\n                    \n                    <div style=\"margin-bottom: 15px;\">\n                        <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Instructions *</label>\n                        <textarea id=\"instructions\" rows=\"4\" placeholder=\"Step by step instructions...\" required style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\"></textarea>\n                        <div class=\"error\" id=\"instructionsError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                    </div>\n                    \n                    <div style=\"margin-bottom: 15px;\">\n                        <label style=\"display: block; font-weight: bold; margin-bottom: 5px;\">Diabetes Tips (Optional)</label>\n                        <textarea id=\"diabetesTips\" rows=\"2\" placeholder=\"Blood sugar management notes, insulin timing, etc.\" style=\"width: 100%; padding: 8px; border: 2px solid #ddd; border-radius: 5px;\"></textarea>\n                        <div class=\"error\" id=\"diabetesTipsError\" style=\"color: red; font-size: 12px; margin-top: 5px;\"></div>\n                    </div>\n                    \n                    <div style=\"display: flex; gap: 10px; margin-top: 20px;\">\n                        <button type=\"button\" onclick=\"createRecipePost()\" style=\"\n                            padding: 10px 20px;\n                            border: none;\n                            border-radius: 5px;\n                            cursor: pointer;\n                            font-weight: bold;\n                            background: #007bff;\n                            color: white;\n                        \">Create Recipe Post</button>\n                        <button type=\"button\" onclick=\"closeRecipeForm()\" style=\"\n                            padding: 10px 20px;\n                            border: none;\n                            border-radius: 5px;\n                            cursor: pointer;\n                            font-weight: bold;\n                            background: #6c757d;\n                            color: white;\n                        \">Cancel</button>\n                    </div>\n                </form>\n            </div>\n        `;\n        \n        document.body.appendChild(overlay);\n    };\n    \n    // Function to show content in a copyable popup (No changes needed)\n    window.showContentPopup = function(content, recipeName) {\n        // Remove existing popup if any\n        const existingPopup = document.querySelector(\'.content-popup-overlay\');\n        if (existingPopup) {\n            existingPopup.remove();\n        }\n        \n        const popup = document.createElement(\'div\');\n        popup.className = \'content-popup-overlay\';\n        popup.style.cssText = `\n            position: fixed;\n            top: 0;\n            left: 0;\n            width: 100%;\n            height: 100%;\n            background: rgba(0,0,0,0.8);\n            z-index: 10001;\n            display: block;\n        `;\n        \n        popup.innerHTML = `\n            <div style=\"\n                position: absolute;\n                top: 50%;\n                left: 50%;\n                transform: translate(-50%, -50%);\n                background: white;\n                padding: 30px;\n                border-radius: 10px;\n                width: 600px;\n                max-height: 80vh;\n                overflow-y: auto;\n            \">\n                <div style=\"display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;\">\n                    <h2>🍽️ Recipe Content Ready!</h2>\n                    <button onclick=\"document.querySelector(\'.content-popup-overlay\').remove()\" style=\"\n                        background: #dc3545;\n                        color: white;\n                        border: none;\n                        border-radius: 50%;\n                        width: 30px;\n                        height: 30px;\n                        cursor: pointer;\n                        font-size: 16px;\n                        font-weight: bold;\n                    \">✕</button>\n                </div>\n                \n                <p><strong>Copy this content and paste it into the Flarum editor:</strong></p>\n                \n                <textarea readonly style=\"\n                    width: 100%;\n                    height: 300px;\n                    padding: 10px;\n                    border: 2px solid #28a745;\n                    border-radius: 5px;\n                    font-family: monospace;\n                    font-size: 14px;\n                    background: #f8f9fa;\n                \" onclick=\"this.select(); document.execCommand(\'copy\'); alert(\'Content copied to clipboard!\');\">${content}</textarea>\n                \n                <div style=\"margin-top: 15px; text-align: center;\">\n                    <button onclick=\"\n                        const textarea = this.parentElement.parentElement.querySelector(\'textarea\');\n                        textarea.select();\n                        document.execCommand(\'copy\');\n                        alert(\'✅ Copied to clipboard! Now paste it in the editor.\');\n                    \" style=\"\n                        padding: 10px 20px;\n                        border: none;\n                        border-radius: 5px;\n                        cursor: pointer;\n                        font-weight: bold;\n                        background: #28a745;\n                        color: white;\n                        margin-right: 10px;\n                    \">📋 Copy Content</button>\n                    \n                    <button onclick=\"document.querySelector(\'.content-popup-overlay\').remove()\" style=\"\n                        padding: 10px 20px;\n                        border: none;\n                        border-radius: 5px;\n                        cursor: pointer;\n                        font-weight: bold;\n                        background: #6c757d;\n                        color: white;\n                    \">Close</button>\n                </div>\n                \n                <p style=\"margin-top: 15px; font-size: 12px; color: #666;\">\n                    <strong>Instructions:</strong><br>\n                    1. Click \"📋 Copy Content\" above<br>\n                    2. Click in the \"Write a Post...\" area in Flarum<br>\n                    3. Press Ctrl+V (or Cmd+V on Mac) to paste<br>\n                    4. Add the title: \"🍽️ ${recipeName}\"\n                </p>\n            </div>\n        `;\n        \n        document.body.appendChild(popup);\n    };\n    \n    // Function to close the form \n    window.closeRecipeForm = function() {\n        const overlay = document.querySelector(\'.recipe-form-overlay\');\n        if (overlay) {\n            overlay.remove();\n        }\n    };\n    \n    // Function to create the recipe post (No changes needed)\n    window.createRecipePost = function() {\n        // Get form values\n        const recipeName = document.getElementById(\'recipeName\').value.trim();\n        const carbs = document.getElementById(\'carbs\').value.trim();\n        const protein = document.getElementById(\'protein\').value.trim();\n        const calories = document.getElementById(\'calories\').value.trim();\n        const servings = document.getElementById(\'servings\').value.trim();\n        const prepTime = document.getElementById(\'prepTime\').value.trim();\n        const difficulty = document.getElementById(\'difficulty\').value.trim();\n        const ingredients = document.getElementById(\'ingredients\').value.trim();\n        const instructions = document.getElementById(\'instructions\').value.trim();\n        const diabetesTips = document.getElementById(\'diabetesTips\').value.trim();\n        \n        // Basic validation (All your validation code here is correct)\n        const requiredFields = [\'recipeName\', \'carbs\', \'protein\', \'calories\', \'servings\', \'prepTime\', \'difficulty\', \'ingredients\', \'instructions\'];\n        let isValid = true;\n        \n        // Clear previous errors\n        requiredFields.forEach(field => {\n            const errorEl = document.getElementById(field + \'Error\');\n            if (errorEl) errorEl.textContent = \'\';\n        });\n        \n        // Validate each required field\n        requiredFields.forEach(field => {\n            const input = document.getElementById(field);\n            const errorEl = document.getElementById(field + \'Error\');\n            if (!input.value.trim()) {\n                if (errorEl) errorEl.textContent = \'This field is required\';\n                isValid = false;\n            }\n        });\n        \n        // Additional validation for numbers\n        const carbsNum = parseFloat(carbs);\n        const proteinNum = parseFloat(protein);\n        const caloriesNum = parseInt(calories);\n        const servingsNum = parseInt(servings);\n        const prepTimeNum = parseInt(prepTime);\n        \n        if (carbs && (carbsNum < 0 || carbsNum > 200)) {\n            const errorEl = document.getElementById(\'carbsError\');\n            if (errorEl) errorEl.textContent = \'Carbs must be between 0-200g\';\n            isValid = false;\n        }\n        \n        if (protein && (proteinNum < 0 || proteinNum > 200)) {\n            const errorEl = document.getElementById(\'proteinError\');\n            if (errorEl) errorEl.textContent = \'Protein must be between 0-200g\';\n            isValid = false;\n        }\n        \n        if (calories && (caloriesNum < 0 || caloriesNum > 2000)) {\n            const errorEl = document.getElementById(\'caloriesError\');\n            if (errorEl) errorEl.textContent = \'Calories must be between 0-2000\';\n            isValid = false;\n        }\n        \n        if (servings && (servingsNum < 1 || servingsNum > 20)) {\n            const errorEl = document.getElementById(\'servingsError\');\n            if (errorEl) errorEl.textContent = \'Servings must be between 1-20\';\n            isValid = false;\n        }\n        \n        if (prepTime && (prepTimeNum < 1 || prepTimeNum > 480)) {\n            const errorEl = document.getElementById(\'prepTimeError\');\n            if (errorEl) errorEl.textContent = \'Prep time must be between 1-480 minutes\';\n            isValid = false;\n        }\n        \n        if (!isValid) {\n            return;\n        }\n        \n        // Create the formatted post content\n        const postContent = `🍽️ ${recipeName}\n\n📊 NUTRITIONAL INFO (Per Serving):\n• Carbohydrates: ${carbs}g\n• Protein: ${protein}g\n• Calories: ${calories}\n• Serves: ${servings} people\n• Prep Time: ${prepTime} minutes\n• Difficulty: ${difficulty}\n\n🛒 INGREDIENTS:\n\n${ingredients}\n\n👨‍🍳 INSTRUCTIONS:\n\n${instructions}\n\n💡 DIABETES TIPS:\n${diabetesTips || \'None provided\'}\n\n────────────────────────────\n✅ All nutritional information verified and complete`;\n\n\n        // Proper ProseMirror integration with simpler formatting\n        function fillFlarumEditor() {\n            const proseMirrorEditor = document.querySelector(\'.ProseMirror.TextEditor-editor\');\n            \n            if (proseMirrorEditor) {\n                proseMirrorEditor.focus();\n                \n                // Clear any existing content first\n                document.execCommand(\'selectAll\', false, null);\n                document.execCommand(\'delete\', false, null);\n                \n                // Use insertText for better compatibility\n                if (document.execCommand) {\n                    document.execCommand(\'insertText\', false, postContent);\n                } else {\n                    // Fallback method\n                    proseMirrorEditor.textContent = postContent;\n                    proseMirrorEditor.dispatchEvent(new Event(\'input\', { bubbles: true }));\n                }\n                \n                fillTitle(recipeName);\n                return true;\n            } else {\n                return false;\n            }\n        }\n        \n        // Method 2: Faster approach using paste simulation\n        function fillFlarumEditorFast() {\n            const proseMirrorEditor = document.querySelector(\'.ProseMirror.TextEditor-editor\');\n            \n            if (proseMirrorEditor) {\n                proseMirrorEditor.focus();\n                \n                // Clear existing content\n                document.execCommand(\'selectAll\', false, null);\n                document.execCommand(\'delete\', false, null);\n                \n                // Create a paste event with our content\n                const clipboardData = new DataTransfer();\n                clipboardData.setData(\'text/plain\', postContent);\n                \n                const pasteEvent = new ClipboardEvent(\'paste\', {\n                    bubbles: true,\n                    cancelable: true,\n                    clipboardData: clipboardData\n                });\n                \n                proseMirrorEditor.dispatchEvent(pasteEvent);\n                \n                // Also try the insertText command as a fallback in a timeout\n                setTimeout(() => {\n                    if (!proseMirrorEditor.textContent.includes(recipeName)) {\n                        document.execCommand(\'insertText\', false, postContent);\n                    }\n                    fillTitle(recipeName);\n                }, 100);\n                \n                return true;\n            }\n            \n            return false;\n        }\n        \n        // Function to fill the title field\n        function fillTitle(recipeName) {\n            const titleInput = document.querySelector(\'input[placeholder=\"Discussion Title\"]\') ||\n                                     document.querySelector(\'.ComposerBody-header input\') ||\n                                     document.querySelector(\'.Composer input[type=\"text\"]\');\n            \n            if (titleInput) {\n                const titleText = `🍽️ ${recipeName}`;\n                titleInput.focus();\n                \n                // Clear and fill title\n                titleInput.value = \'\';\n                titleInput.value = titleText;\n                \n                // Trigger events\n                titleInput.dispatchEvent(new Event(\'input\', { bubbles: true }));\n                titleInput.dispatchEvent(new Event(\'change\', { bubbles: true }));\n            }\n        }        \n      \n        const success = fillFlarumEditorFast();\n        \n        if (!success) {\n            showContentPopup(postContent, recipeName);\n        }\n        \n        closeRecipeForm();\n    };\n\n\n    //CHECKING TAG SELECTION COMPONENT\n    const targetRecipeTag = \'Food & Recipes\';\n    const targetRecipeSlug = \'food-recipes\'; \n\n    /**\n     * Checks if the Composer is in the correct context for posting a recipe.\n     * It looks for the Recipe tag, the correct URL, AND the presence of the tag selector\n     * (to ensure the composer isn\'t locked to a fixed tag like \"Ask a Doctor\").\n     */\n    function isRecipeContext() {\n        const composer = document.querySelector(\'.Composer\');\n        if (!composer) return false;\n\n        let hasRecipeTagSelected = false;\n\n        // 1. Check if the \'Food & Recipes\' tag is actively selected in the Composer header\n        const selectedTagLabels = composer.querySelectorAll(\'.TagLabel-text\');\n        for (let label of selectedTagLabels) {\n            if (label.textContent.trim() === targetRecipeTag) {\n                hasRecipeTagSelected = true;\n                break;\n            }\n        }\n        \n        // 2. Check for the Tag Selector Button (often hidden when a tag is locked, e.g., \'Ask a Doctor\')\n        const tagSelectorButton = composer.querySelector(\'.TagSelectionComponent .Dropdown-toggle\');\n        \n        // Scenario A: If the recipe tag is selected, we\'re definitely good\n        if (hasRecipeTagSelected) {\n            return true;\n        }\n\n        // Scenario B: If the URL is the recipe page AND the tag selector is visible, \n        // it means the composer is open in a normal, changeable context on the right page.\n        const isRecipeURL = window.location.pathname.includes(\'/t/\' + targetRecipeSlug) ||\n                            window.location.hash.includes(\'/t/\' + targetRecipeSlug);\n        \n        return isRecipeURL && tagSelectorButton !== null;\n    }\n\n\n    // Function to add/remove the button based on the selected tag\n    function manageRecipeButton() {\n        const composer = document.querySelector(\'.Composer\');\n        const buttonExists = document.querySelector(\'.recipe-form-btn\');\n\n        if (!composer) {\n            // Composer is closed, ensure button is gone\n            if (buttonExists) {\n                buttonExists.remove();\n            }\n            return;\n        }\n\n        if (isRecipeContext()) {\n            // We are in the correct recipe context\n            if (!buttonExists) {\n                const controls = composer.querySelector(\'.ComposerBody-footer\') || composer.querySelector(\'.Composer-controls\') || composer;\n                \n                if (controls) {\n                    const btn = document.createElement(\'button\');\n                    btn.className = \'Button recipe-form-btn Button--primary\';\n                    btn.innerHTML = \'🍽️ Recipe Form\';\n                    btn.style.cssText = `\n                        background-color: #28a745 !important;\n                        color: white !important;\n                        border: none !important;\n                        padding: 8px 12px !important;\n                        border-radius: 4px !important;\n                        margin-left: 5px !important;\n                        cursor: pointer !important;\n                        font-weight: bold !important;\n                        font-size: 13px !important;\n                    `;\n                    \n                    btn.addEventListener(\'click\', function(e) {\n                        e.preventDefault();\n                        e.stopPropagation();\n                        showRecipeForm();\n                    });\n                    \n                    // Append the button to a logical place (usually where other buttons are)\n                    const buttonContainer = composer.querySelector(\'.ComposerBody-footer .ButtonContainer\') || controls;\n                    // Find the last button or just append to controls if buttonContainer doesn\'t exist\n                    buttonContainer.appendChild(btn); \n                }\n            }\n        } else {\n            // The conditions for a recipe post are not met.\n            if (buttonExists) {\n                // Button MUST NOT exist, remove it\n                buttonExists.remove();\n            }\n        }\n    }\n    \n    \n    const observer = new MutationObserver(manageRecipeButton);\n    observer.observe(document.body, { childList: true, subtree: true });\n    \n    // Run once on initial load\n    manageRecipeButton();\n});\n</script>\n\n---\n<script>\n/**\n * Minimal diabetes-type integration for Flarum signup.\n * 1) Adds a \"Diabetes Type\" select to the Sign Up modal (if missing).\n * 2) Injects diabetes_type into the POST /register request body.\n */\n(function () {\n  // 1) Add the field to the modal when it appears\n  function addDiabetesFieldIfMissing() {\n    const modal = document.querySelector(\'.Modal--signup, .SignUpModal\');\n    if (!modal) return;\n\n    if (modal.querySelector(\'select[name=\"diabetes_type\"]\')) return;\n\n    const emailField = modal.querySelector(\'input[name=\"email\"]\');\n    if (!emailField) return;\n\n    const wrap = document.createElement(\'div\');\n    wrap.className = \'Form-group\';\n    wrap.innerHTML = `\n      <label>Diabetes Type *</label>\n      <select name=\"diabetes_type\" class=\"FormControl\" required>\n        <option value=\"\">Select your diabetes type</option>\n        <option value=\"Type 1 Diabetes\">Type 1 Diabetes</option>\n        <option value=\"Type 2 Diabetes\">Type 2 Diabetes</option>\n        <option value=\"Pre-diabetes\">Pre-diabetes</option>\n        <option value=\"Gestational Diabetes\">Gestational Diabetes</option>\n        <option value=\"LADA\">LADA</option>\n        <option value=\"MODY\">MODY</option>\n        <option value=\"Neonatal diabetes\">Neonatal diabetes</option>\n        <option value=\"Type 3c Diabetes\">Type 3c Diabetes</option>\n        <option value=\"Other\">Other / Prefer not to say</option>\n      </select>\n    `;\n    emailField.parentNode.insertAdjacentElement(\'afterend\', wrap);\n  }\n\n  // Observe DOM so when the SignUp modal opens we add the field\n  const mo = new MutationObserver(() => addDiabetesFieldIfMissing());\n  mo.observe(document.body, { childList: true, subtree: true });\n  addDiabetesFieldIfMissing();\n\n  // 2) Hook Flarum\'s app.request to inject diabetes_type on POST /register\n  const wait = setInterval(() => {\n    if (!window.app || typeof app.request !== \'function\') return;\n    clearInterval(wait);\n\n    const original = app.request.bind(app);\n\n    app.request = function (opts) {\n      try {\n        if (\n          opts &&\n          opts.method === \'POST\' &&\n          /\\/register$/.test(String(opts.url || \'\'))\n        ) {\n          const modal = document.querySelector(\'.Modal--signup, .SignUpModal\');\n          const select = modal && modal.querySelector(\'select[name=\"diabetes_type\"]\');\n\n          // Ensure body is an object\n          const body = Object.assign({}, opts.body || {});\n          if (select && !(\'diabetes_type\' in body)) {\n            body.diabetes_type = select.value || \'\';\n            // Optional: simple front-end required check\n            if (!body.diabetes_type) {\n              // Stop submit if not chosen\n              const btn = modal && modal.querySelector(\'button[type=\"submit\"], .Button--primary\');\n              if (btn) btn.disabled = false;\n              alert(\'Please select your diabetes type.\');\n              return Promise.reject(new Error(\'diabetes_type required\'));\n            }\n          }\n          opts = Object.assign({}, opts, { body });\n        }\n      } catch (e) {\n        console.warn(\'[diabetes-type] injection failed:\', e);\n      }\n      return original(opts);\n    };\n  }, 100);\n})();\n</script>\n\n\n\n\n\n\n\n\n<script>\ndocument.addEventListener(\'DOMContentLoaded\', function () {\n  console.log(\'Recipe Difficulty Filter Script Loaded. Index-route (?q=) version.\');\n  const BASE_PATH = \'/diabetes-community/public\';\n  const targetRecipeSlug = \'food-recipes\';\n\n  // Are we on the recipes tag page OR an index search limited to that tag?\n  function isRecipePage() {\n    const p = window.location.pathname;\n    const s = window.location.search;\n    if (p.startsWith(BASE_PATH + \'/t/\' + targetRecipeSlug)) return true;\n    if (p === BASE_PATH + \'/\' || p === BASE_PATH) {\n      const q = new URLSearchParams(s).get(\'q\') || \'\';\n      return q.includes(\'tag:\' + targetRecipeSlug);\n    }\n    return false;\n  }\n\n  // Build the index-url with ?q= (Flarum shows filtered list on the main route)\n  function indexSearchUrl(q) {\n    // ensure single trailing slash form works\n    const root = BASE_PATH.endsWith(\'/\') ? BASE_PATH : BASE_PATH + \'/\';\n    return root + \'?q=\' + encodeURIComponent(q);\n  }\n  function tagUrl() {\n    return BASE_PATH + \'/t/\' + targetRecipeSlug;\n  }\n\n  // Apply the filter\n  function applyFilter(value) {\n    if (!value) {\n      // Back to the tag listing only\n      window.location.assign(tagUrl());\n      return;\n    }\n    // Filter within recipes using index route (?q=)\n    const q = `tag:${targetRecipeSlug} ${value}`;\n    window.location.assign(indexSearchUrl(q));\n  }\n\n  // Keep dropdown in sync if user lands on a search URL\n  function syncSelect(selectEl) {\n    let q = \'\';\n    if (window.location.pathname === BASE_PATH + \'/\' || window.location.pathname === BASE_PATH) {\n      q = new URLSearchParams(window.location.search).get(\'q\') || \'\';\n    }\n    const m = q.match(/\\b(Easy|Medium|Hard)\\b/);\n    if (selectEl) selectEl.value = m ? m[1] : \'\';\n  }\n\n  // Insert the UI\n  function mountUI() {\n    if (!isRecipePage()) {\n      const x = document.getElementById(\'recipe-filter-container\');\n      if (x) x.remove();\n      return;\n    }\n\n    const toolbar = document.querySelector(\'.IndexPage-toolbar, .DiscussionList-toolbar\');\n    const list = document.querySelector(\'.DiscussionList\');\n    const anchor = toolbar || list;\n    if (!anchor) return;\n\n    if (document.getElementById(\'recipe-filter-container\')) {\n      const sel = document.getElementById(\'difficulty-filter\');\n      if (sel && sel.getAttribute(\'data-listener\') !== \'true\') {\n        sel.addEventListener(\'change\', (e) => applyFilter(e.target.value));\n        sel.setAttribute(\'data-listener\', \'true\');\n      }\n      syncSelect(sel);\n      return;\n    }\n\n    const box = document.createElement(\'div\');\n    box.id = \'recipe-filter-container\';\n    box.style.cssText = `\n      display:flex;flex-direction:column;gap:10px;\n      padding:12px;margin:10px 0;\n      background:#f8f9fa;border-radius:6px;border:1px solid #e9ecef;\n    `;\n    box.innerHTML = `\n      <label for=\"difficulty-filter\" style=\"font-weight:bold;color:#343a40;font-size:14px;\">\n        Filter Recipe Difficulty:\n      </label>\n      <select id=\"difficulty-filter\" class=\"FormControl\" data-listener=\"true\" style=\"\n        padding:8px 12px;border-radius:4px;border:1px solid #ced4da;cursor:pointer;font-size:14px;max-width:280px;\n      \">\n        <option value=\"\">— All Difficulties —</option>\n        <option value=\"Easy\">Easy</option>\n        <option value=\"Medium\">Medium</option>\n        <option value=\"Hard\">Hard</option>\n      </select>\n    `;\n    if (toolbar) toolbar.prepend(box); else list.prepend(box);\n\n    const sel = document.getElementById(\'difficulty-filter\');\n    if (sel) {\n      sel.addEventListener(\'change\', (e) => applyFilter(e.target.value));\n      syncSelect(sel);\n    }\n  }\n\n  // React to DOM changes (SPA) and initial load\n  const mo = new MutationObserver(mountUI);\n  mo.observe(document.body, { childList: true, subtree: true });\n  mountUI();\n});\n</script>\n\n\n\n\n\n\n<script>\n(function () {\n  if (window.__a1WatermarkSet) return;\n  window.__a1WatermarkSet = true;\n\n  function insertWatermark() {\n    let img = document.getElementById(\'a1-watermark\');\n    if (!img) {\n      img = document.createElement(\'img\');\n      img.id = \'a1-watermark\';\n      img.src = \'assets/logo-dpdarrf5.png\';\n      Object.assign(img.style, {\n        position: \'fixed\',\n        left: \'50%\',\n        top: \'55%\',\n        transform: \'translate(-50%, -50%)\',\n        width: \'520px\',\n        opacity: \'0.08\',\n        pointerEvents: \'none\',\n        zIndex: \'-1\',\n        mixBlendMode: \'multiply\',\n        filter: \'drop-shadow(0 0 8px rgba(0,0,0,.1))\'\n      });\n      document.body.appendChild(img);\n    }\n  }\n\n  insertWatermark();\n  setInterval(insertWatermark, 2000);\n})();\n</script>\n\n\n\n\n\n<script>\n/* Diabetes Type chips: profile, posts, discussion list */\n(function () {\n  if (window.__dcTypeTagLoaded) return;\n  window.__dcTypeTagLoaded = true;\n\n  //API base detection (works on /diabetes-community/public/)\n  function getApiBase(){\n    try { const a = app?.forum?.attribute?.(\'apiUrl\'); if (a) return a.replace(/\\/$/, \'\'); } catch {}\n    const p = location.pathname, i = p.indexOf(\'/public/\');\n    if (i !== -1) return (p.slice(0, i + \'/public/\'.length).replace(/\\/$/, \'\')) + \'/api\';\n    const base = document.querySelector(\'base\')?.getAttribute(\'href\') || \'/\';\n    return new URL(base, location.origin).pathname.replace(/\\/$/, \'\') + \'/api\';\n  }\n  const apiBase = getApiBase();\n  console.log(\'[DiabetesType] apiBase =\', apiBase);\n\n  //helpers\n  const cache = new Map();\n\n  async function fetchTypeById(id){\n    if (cache.has(id)) return cache.get(id);\n    try {\n      const r = await fetch(`${apiBase}/users/${id}`);\n      if (!r.ok) return null;\n      const j = await r.json();\n      const t = j?.data?.attributes?.diabetes_type || null;\n      cache.set(id, t);\n      return t;\n    } catch { return null; }\n  }\n\n  async function fetchTypeByUsername(u){\n    try {\n      const r = await fetch(`${apiBase}/users?filter[q]=${encodeURIComponent(u)}`);\n      if (!r.ok) return null;\n      const j = await r.json();\n      return j?.data?.[0]?.attributes?.diabetes_type || null;\n    } catch { return null; }\n  }\n\n  function chip(txt){\n    const el = document.createElement(\'span\');\n    el.className = \'DiabetesTypeTag\';\n    el.textContent = txt;\n    el.dataset.type = (txt || \'\').toLowerCase().replace(/\\s+/g, \'-\'); // set dataset safely\n    return el;\n  }\n\n  async function addToProfile() {\n  // 0) Find the card and a stable heading to attach to\n  const card =\n    document.querySelector(\'.UserCard\') ||\n    document.querySelector(\'.Hero.UserHero\') ||\n    document.querySelector(\'.Hero\');\n\n  if (!card) return;\n\n  // 1) Get username from URL (works even if no data-id)\n  const m = location.pathname.match(/\\/u\\/([^\\/?#]+)/);\n  const usernameFromUrl = m ? decodeURIComponent(m[1]) : null;\n\n  // 2) Resolve diabetes type (prefer username, fallback to id)\n  let type = null;\n  if (usernameFromUrl) type = await fetchTypeByUsername(usernameFromUrl);\n\n  if (!type) {\n    const id =\n      document.querySelector(\'.UserPage\')?.getAttribute(\'data-id\') ||\n      document.querySelector(\'.UserCard\')?.getAttribute(\'data-id\');\n    if (id) type = await fetchTypeById(id);\n  }\n\n  // 3) If no value, just clean up any old chips and exit\n  card.querySelectorAll(\'.DiabetesTypeTag\').forEach((el) => el.remove());\n  if (!type) return;\n\n  // 4) Choose insertion target (next to the big username)\n  const heading =\n    card.querySelector(\'.UserCard-identity h2\') ||\n    card.querySelector(\'h2\') ||\n    card; // last resort: append into card\n\n  // 5) Append a single chip\n  const tag = chip(type);\n  tag.style.marginLeft = \'8px\';\n  heading.appendChild(tag);\n}\n\n  function addToPosts(){\n    document.querySelectorAll(\'.Post\').forEach(async (p)=>{\n      if (p.dataset.dcTagged) return;\n      const header = p.querySelector(\'.Post-header\');\n      const uid = p.querySelector(\'.Avatar\')?.getAttribute(\'data-user-id\') || p.getAttribute(\'data-user-id\');\n      if (!header || !uid) return;\n      p.dataset.dcTagged = \'1\';\n      const t = await fetchTypeById(uid);\n      if (t) header.appendChild(chip(t));\n    });\n  }\n\n\nfunction addToDiscussionList(){\n    document.querySelectorAll(\'.DiscussionListItem\').forEach(async (item)=>{\n      if (item.dataset.dcTagged) return;\n      const author = item.querySelector(\'.DiscussionListItem-author, .item-user, .item-started-by\');\n      const link   = item.querySelector(\'a[href*=\"/u/\"]\');\n      if (!author || !link) return;\n      item.dataset.dcTagged = \'1\';\n      const username = (link.getAttribute(\'href\')||\'\').split(\'/u/\')[1]?.split(\'/\')[0];\n      if (!username) return;\n      const t = await fetchTypeByUsername(username);\n      if (t) author.appendChild(chip(t));\n    });\n  }\n\n\n\nfunction normalizeDiscussionListPlacement() {\n  document.querySelectorAll(\'.DiscussionListItem\').forEach((item) => {\n    // find the title element (try common variants)\n    const title =\n      item.querySelector(\'.DiscussionListItem-title\') ||\n      item.querySelector(\'.DiscussionListItem-main .DiscussionListItem-title\') ||\n      item.querySelector(\'h3.DiscussionListItem-title\') ||\n      item.querySelector(\'h3\') ||\n      item.querySelector(\'h2\');\n\n    if (!title) return;\n\n    // find any chips already in this item\n    const chips = item.querySelectorAll(\'.DiabetesTypeTag\');\n    if (!chips.length) return;\n\n    // keep first chip; move it to AFTER the title so CSS rule applies\n    const first = chips[0];\n    if (first !== title.nextElementSibling) {\n      title.insertAdjacentElement(\'afterend\', first);\n    }\n\n    // remove any extras to prevent duplicates\n    for (let i = 1; i < chips.length; i++) chips[i].remove();\n\n    // minimal spacing safety\n    first.style.marginTop = \'6px\';\n    first.style.marginLeft = \'0\';\n  });\n}\n\n\n\n  function run(){ addToProfile(); addToPosts(); addToDiscussionList(); normalizeDiscussionListPlacement(); }\n  run();\n  new MutationObserver(run).observe(document.body, { childList: true, subtree: true });\n})();\n</script>\n\n\n\n\n\n\n\n\n\n<style>\n  .dc-emergency-fab {\n    position: fixed; right: 18px; bottom: 18px; z-index: 9999;\n    padding: 12px 16px; border-radius: 999px; background: #e11d48;\n    color: #fff; font-weight: 600; box-shadow: 0 8px 20px rgba(0,0,0,.25);\n    cursor: pointer; user-select: none;\n  }\n  .dc-modal-backdrop {\n    position: fixed; inset: 0; background: rgba(0,0,0,.5); z-index: 9998; display: none;\n  }\n  .dc-modal {\n    position: fixed; inset: 0; display: none; z-index: 10000;\n    align-items: center; justify-content: center; padding: 24px;\n  }\n  .dc-card {\n    width: min(720px, 95vw); background: #fff; border-radius: 16px; padding: 20px;\n    box-shadow: 0 12px 30px rgba(0,0,0,.25); max-height: 85vh; overflow: auto;\n  }\n  .dc-card h2 { margin: 0 0 8px; font-size: 22px; }\n  .dc-grid { display: grid; grid-template-columns: repeat(auto-fit,minmax(220px,1fr)); gap: 12px; margin-top: 12px; }\n  .dc-item { border: 1px solid #eee; border-radius: 12px; padding: 12px; }\n  .dc-item strong { display:block; margin-bottom: 4px; }\n  .dc-chip { display:inline-block; padding:2px 8px; border-radius:999px; background:#f3f4f6; font-size:12px; margin-left:8px; }\n  .dc-close { float: right; border: none; background: transparent; font-size: 22px; cursor: pointer; }\n  .dc-topbar-link { cursor:pointer; }\n</style>\n\n<script>\n(function() {\n  if (window.__dcResourcesInstalled) return; window.__dcResourcesInstalled = true;\n\nconst RESOURCES = {\n  title: \"Emergency & Support\",\n  subtitle: \"Urgent numbers first. Non-urgent contacts and helpful links below.\",\n  groups: [\n    {\n      name: \"Emergency\",\n      items: [\n        { label: \"General Emergency\", value: \"100\", tel: \"100\" },\n        { label: \"Medical Emergency (MDA)\", value: \"101\", tel: \"101\" },\n        // If you want to remove Poison Control, just delete this line:\n        { label: \"Poison Control\", value: \"04-777-1900\", tel: \"+97247771900\" }\n      ]\n    },\n    {\n      name: \"Hotlines & Support\",\n      items: [\n        { label: \"Israel Diabetes Association (אגודה ישראלית לסוכרת)\", value: \"+972-3-9508222\", tel: \"+97239508222\" },\n        { label: \"ERAN – Emotional First Aid (24/7 Mental Health)\", value: \"1201 (within Israel)\", tel: \"1201\" },\n        { label: \"MOH General Health Hotline (Kol HaBriut)\", value: \"*5400 or 08-6241010\", tel: \"+97286241010\" }\n      ]\n    },\n    {\n      name: \"Contact & Support\",\n      items: [\n        { label: \"Email\", value: \"a1circle.connect@gmail.com\" }\n        // You can add a non-urgent WhatsApp or Telegram here later if you have one\n      ]\n    },\n    {\n      name: \"Our Doctors\",\n      items: [\n        { label: \"@JosephShamma\" }\n        // Add more usernames here as plain labels, e.g. { label: \"@DrNour\" }\n      ]\n    },\n    {\n\n      name: \"Trusted Links\",\n      items: [\n        { label: \"Hypo Treatment Guide\", url: \"https://www.diabetes.org.uk/sites/default/files/2022-03/JBDS_Hypo_Algorithm%20March%202022.pdf\" },\n        { label: \"Sick Day Rules\", url: \"https://www.gov.il/en/pages/paid-sick-leave\" },\n        { label: \"DKA Checklist\", url: \"https://www.diabetes.org.uk/about-diabetes/looking-after-diabetes/complications/diabetic-ketoacidosis#DKA%20signs%20and%20symptoms\" }\n      ]\n    }\n  ]\n};\n\n\n  function el(tag, attrs = {}, children = []) {\n    const n = document.createElement(tag);\n    Object.entries(attrs).forEach(([k,v]) => {\n      if (k === \"class\") n.className = v;\n      else if (k === \"text\") n.textContent = v;\n      else if (k.startsWith(\"on\") && typeof v === \"function\") n.addEventListener(k.slice(2), v);\n      else n.setAttribute(k, v);\n    });\n    (Array.isArray(children) ? children : [children]).filter(Boolean).forEach(c => n.append(c));\n    return n;\n  }\n\n  function openModal() {\n    backdrop.style.display = \"block\";\n    modal.style.display = \"flex\";\n  }\n  function closeModal() {\n    backdrop.style.display = \"none\";\n    modal.style.display = \"none\";\n  }\n\n  const backdrop = el(\"div\", { class: \"dc-modal-backdrop\" , onclick: closeModal });\n  const modal = el(\"div\", { class: \"dc-modal\" });\n  const card = el(\"div\", { class: \"dc-card\" });\n\n  const closeBtn = el(\"button\", { class: \"dc-close\", ariaLabel: \"Close\", onclick: closeModal }, \"×\");\n  const h2 = el(\"h2\", {}, [\n    document.createTextNode(RESOURCES.title),\n    el(\"span\", { class: \"dc-chip\" , text: \"Always verify locally\" })\n  ]);\n  const sub = el(\"div\", { style: \"margin-top:6px;color:#6b7280;\" , text: RESOURCES.subtitle });\n\n  const grid = el(\"div\", { class: \"dc-grid\" });\n  RESOURCES.groups.forEach(g => {\n    const box = el(\"div\", { class: \"dc-item\" });\n    box.append(el(\"strong\", { text: g.name }));\n\ng.items.forEach(it => {\n  let node;\n\n  if (it.tel) {\n    node = el(\"a\", { href: `tel:${it.tel}` }, `${it.label}${it.value ? `: ${it.value}` : \"\"}`);\n  } else if (it.url) {\n    node = el(\"a\", { href: it.url, target: \"_blank\", rel: \"noopener\" }, it.label);\n  } else if (it.value && /@/.test(it.value) && !/\\s/.test(it.value)) {\n    // looks like an email -> make it clickable\n    node = el(\"a\", { href: `mailto:${it.value}` }, `${it.label}: ${it.value}`);\n  } else if (it.value) {\n    node = document.createTextNode(`${it.label}: ${it.value}`);\n  } else {\n    // label-only (e.g., @JosephShamma)\n    node = document.createTextNode(it.label);\n  }\n\n  box.append(el(\"div\", {}, node));\n});\n\n\n    grid.append(box);\n  });\n\n  card.append(closeBtn, h2, sub, grid);\n  modal.append(card);\n  document.body.append(backdrop, modal);\n\n  function addEmergencyFab() {\n    if (document.querySelector(\".dc-emergency-fab\")) return;\n    const fab = el(\"div\", { class: \"dc-emergency-fab\", onclick: openModal }, \"Emergency\");\n    document.body.append(fab);\n  }\n\n  function init() { addEmergencyFab(); }\n  document.addEventListener(\"DOMContentLoaded\", init);\n  // Flarum fires redraws; hook into minimal interval to restore if DOM changes\n  let last = 0;\n  setInterval(() => {\n    const now = Date.now();\n    if (now - last > 1200) { init(); last = now; }\n  }, 1500);\n})();\n</script>\n\n\n\n');
INSERT INTO `settings` (`key`, `value`) VALUES
('custom_less', '.IndexPage-nav .item-allDiscussions a,\n.IndexPage-nav .item-following a,\n.IndexPage-nav .item-tags a {\n    color: #568bd7!important; /* Replace with your preferred color */\n    font-weight: bold;\n}\n\n.IndexPage-nav .item-allDiscussions a:hover,\n.IndexPage-nav .item-following a:hover,\n.IndexPage-nav .item-tags a:hover {\n    color: #076DF2!important;\n}\n\n/* Change the refresh icon color */\n.icon.fa-sync.Button-icon {\n    color: #506E43!important;  /* Replace with your desired color */\n}\n\n/* Change check icon (mark all as read) */\n.icon.fa-check.Button-icon {\n    color: #FF9800 !important;\n}\n\n/* Refresh button */\n.IndexPage-toolbar-action .item-refresh > button {\n    background-color: #A6B1A1!important; /* Light teal */\n    border-radius: 8px;\n}\n\n/* Mark All As Read (check icon) */\n.IndexPage-toolbar-action .item-markAllAsRead > button {\n    background-color: #FFF3E0 !important; /* Light peach */\n    border-radius: 8px;\n}\n\n/*flag symbol*/\n.icon.fa-flag.Button-icon {\n    color: #417DD2!important;  /* Example: deep orange */\n}\n\n/*notification symbol*/\n.icon.fa-bell.Button-icon {\n    color: #417DD2!important;  /* Example: light blue */\n}\n\n\n\n\n\n/* Set the entire page background to light blue */\nbody {\n    /* 1. Set the light blue background color (your existing style) */\n    background-color: #E3F2FD !important; \n}\n\n\n\n\n/* Remove white background from main app containers */\n.App,\n.App-content,\n.IndexPage,\n.DiscussionList,\n.PostStream,\n.DiscussionPage {\n    background-color: transparent !important;\n    box-shadow: none !important;\n}\n\n\n/* 🧾 Style each post inside a white box */\n.Post {\n    background-color: #ffffff !important;\n    padding: 20px;\n    border-radius: 10px;\n    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);\n    margin-bottom: 20px;\n}\n\n/* ✏️ Style the reply box to match */\n.Composer {\n    background-color: #ffffff !important;\n    border-radius: 10px;\n    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);\n}\n\n\n/* 🏠 Style discussion cards on the main page */\n.DiscussionListItem {\n    background-color: #ffffff !important;\n    padding: 16px;\n    border-radius: 10px;\n    margin-bottom: 16px;\n    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);\n}\n\n.DiscussionListItem:hover {\n    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);\n    transform: translateY(-2px);\n    transition: all 0.2s ease-in-out;\n}\n\n/* Style the active sort option (like \"Latest\") */\n.Dropdown-menu li.active {\n    color: #FF9800 !important;          /* Orange text */\n}\n\n\n\n/* Optional: style the orange chat icon in discussions*/\n.Dropdown-menu li.active .icon {\n    color: #FF9800 !important;          /* Match icon color to text */\n}\n\n/* 🎯 Change the color of the sort button label (e.g. \"Latest\") */\n.item-sort .Button-label {\n    color: #568BD7!important;  /* Orange */\n    font-weight: bold;\n}\n\n/* 💬 All Discussions icon */\n.IndexPage-nav .item-allDiscussions .icon {\n    color: #FF9800 !important; /* Orange */\n}\n\n/* ⭐ Following icon */\n.IndexPage-nav .item-following .icon {\n    color: #2196F3 !important; /* Blue */\n}\n\n/* ⬛ Tags icon */\n.IndexPage-nav .item-tags .icon {\n    color: #4CAF50 !important; /* Green */\n}\n\n\n\n.IndexPage--tag1 .Hero {\n  background: linear-gradient(to bottom, #f3e5f5, #e3f2fd); /* Food & Recipes */\n}\n\n.IndexPage--tag2 .Hero {\n  background: linear-gradient(to bottom, #64B5F6, #e3f2fd);\n}\n\n.IndexPage--tag3 .Hero {\n  background: linear-gradient(to bottom, #fff3e0, #e3f2fd); /* Newly Diagnosed */\n}\n\n.IndexPage--tag4 .Hero {\n  background: linear-gradient(to bottom, #eceff1, #e3f2fd); /* Talk It Out */\n}\n\n/* Move the entire top bar content (including logo & search) to the left */\n.Header .container {\n  padding-left: 10px !important;\n}\n\n/* Fine-tune just the search bar */\n.Search-input {\n  margin-left: -40px !important;\n}\n\n\n/*putting tags in white frames*/\nli[class^=\"item-tag\"]:not(.item-tags) {\n  background-color: white;\n  padding: 5px 10px;\n  margin: 15px 0;\n  border-radius: 6px;\n  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\n  display: flex;\n  align-items: center;\n}\n\n\n\n\n\n\n/* Keep all forum content above the watermark */\n.App { position: relative; z-index: 2; }\n\n/* Make post cards fully opaque (if you want the default solid look) */\n.Post,\n.DiscussionListItem,\n.Composer {\n  background: #ffffff !important;\n  box-shadow: 0 2px 8px rgba(0,0,0,0.05);\n  border-radius: 10px;\n}\n\n\n\n\n\n\n/* Compact chip, tightly wrapped around text */\n.DiabetesTypeTag {\n  display: inline-flex;     /* <--- CHANGE THIS */\n  align-items: center;\n  font-size: 11px;\n  line-height: 1;\n  padding: 3px 7px;\n  border-radius: 10px;\n  background: #f9fbf9;               /* soft neutral background */\n  color: #2f7d57;\n  border: 1px solid rgba(47,125,87,0.15);\n  margin-top: 4px;\n  margin-left: 0;\n  font-weight: 400;\n  box-shadow: 0 1px 2px rgba(0,0,0,0.02);\n  width: auto;                       /* key fix — auto width */\n  max-width: fit-content;            /* ensure wraps around text */\n}\n\n/* ensure it sits under the title cleanly */\n.DiscussionListItem-title + .DiabetesTypeTag,\nh3 + .DiabetesTypeTag {\n  display: block;\n  margin-top: 3px;\n  margin-left: 0;\n}\n\n\n/* Type-specific gentle pastel variants */\n\n/* Type 1 */\n.DiabetesTypeTag[data-type=\'type-1-diabetes\'],\n.DiabetesTypeTag[data-type=\'type-1\']{\n  background:#f0f6ff;\n  color:#4a70b5;\n  border-color:#d8e4ff;\n}\n\n/* Type 2 */\n.DiabetesTypeTag[data-type=\'type-2-diabetes\'],\n.DiabetesTypeTag[data-type=\'type-2\']{\n  background:#ecfaef;\n  color:#2f7d57;\n  border-color:#d4f1da;\n}\n\n/* Pre-diabetes */\n.DiabetesTypeTag[data-type=\'pre-diabetes\']{\n  background:#fffbed;\n  color:#8f7b00;\n  border-color:#f3e9b3;\n}\n\n/* Gestational */\n.DiabetesTypeTag[data-type=\'gestational-diabetes\'],\n.DiabetesTypeTag[data-type=\'gestational\']{\n  background:#fff5ee;\n  color:#a65b2a;\n  border-color:#f3dccf;\n}\n\n/* LADA */\n.DiabetesTypeTag[data-type=\'lada\']{\n  background:#f5f0ff;\n  color:#6c4db3;\n  border-color:#e6ddff;\n}\n\n/* MODY */\n.DiabetesTypeTag[data-type=\'mody\']{\n  background:#f0f9ff;\n  color:#3b6fa7;\n  border-color:#d5ebff;\n}\n\n/* Neonatal diabetes */\n.DiabetesTypeTag[data-type=\'neonatal-diabetes\']{\n  background:#fff5f8;\n  color:#b63e66;\n  border-color:#f2c8d5;\n}\n\n/* Type 3c */\n.DiabetesTypeTag[data-type=\'type-3c-diabetes\'],\n.DiabetesTypeTag[data-type=\'type-3c\']{\n  background:#f2fbf5;\n  color:#2f7d57;\n  border-color:#d4f1da;\n}\n\n/* Other */\n.DiabetesTypeTag[data-type=\'other\'],\n.DiabetesTypeTag[data-type=\'other-/-prefer-not-to-say\']{\n  background:#f8f8f8;\n  color:#666;\n  border-color:#e0e0e0;\n}\n\n\n\n\n\n\n/* If a chip is placed right after the title, put it on the next line */\n.DiscussionListItem-title + .DiabetesTypeTag,\nh3.DiscussionListItem-title + .DiabetesTypeTag,\nh3 + .DiabetesTypeTag {\n  display: block;\n  margin-top: 6px;\n  margin-left: 0;\n}\n\n\n\n\n\n/*\n *This rule centers the tag on the profile page\n *and controls the height of the bar.\n */\n.UserHero > .DiabetesTypeTag {\n  display: block !important;\n  width: fit-content !important;\n  margin-left: auto !important;\n  margin-right: auto !important;\n \n  /* These two lines control the bar\'s height */\n  margin-top: 0 !important;\n  margin-bottom: 8px !important;\n}'),
('default_locale', 'en'),
('default_route', '/all'),
('display_name_driver', 'username'),
('extensions_enabled', '[\"flarum-flags\",\"flarum-suspend\",\"flarum-approval\",\"flarum-markdown\",\"neoncube-private-messages\",\"local-diabetes-type\",\"fof-user-directory\",\"fof-upload\",\"fof-reactions\",\"fof-pages\",\"fof-masquerade\",\"fof-custom-footer\",\"flarum-tags\",\"flarum-subscriptions\",\"flarum-sticky\",\"flarum-statistics\",\"flarum-nicknames\",\"flarum-lock\",\"flarum-likes\",\"flarum-lang-english\",\"flarum-emoji\",\"flarum-bbcode\",\"clarkwinkelmann-post-bookmarks\",\"clarkwinkelmann-anonymous-posting\",\"askvortsov-rich-text\",\"askvortsov-moderator-warnings\"]'),
('flarum-markdown.mdarea', '1'),
('flarum-mentions.allow_username_format', '1'),
('flarum-nicknames.max', '25'),
('flarum-nicknames.min', '3'),
('flarum-nicknames.random_username', ''),
('flarum-nicknames.regex', ''),
('flarum-nicknames.unique', '1'),
('flarum-tags.max_primary_tags', '1'),
('flarum-tags.max_secondary_tags', '3'),
('flarum-tags.min_primary_tags', '1'),
('flarum-tags.min_secondary_tags', '0'),
('forum_description', ''),
('forum_title', 'A1Circle'),
('logo_path', 'logo-dpdarrf5.png'),
('mail_driver', 'smtp'),
('mail_encryption', 'ssl'),
('mail_from', 'noreply@localhost'),
('mail_host', 'smtp.gmail.com'),
('mail_password', 'qoigdsujkneupcgm'),
('mail_port', '465'),
('mail_username', 'a1circle.connect@gmail.com'),
('neoncube-private-messages.initial_installed_version', '1.5.3'),
('show_language_selector', ''),
('slug_driver_Flarum\\Discussion\\Discussion', ''),
('slug_driver_Flarum\\User\\User', 'default'),
('theme_colored_header', '0'),
('theme_dark_mode', '0'),
('theme_primary_color', '#568bd7'),
('theme_secondary_color', '#d1e9f0'),
('version', '1.8.10'),
('welcome_message', 'Your space to connect, share, ask doctors, and figure things out together. \nHere we talk diabetes, life hacks, recipes, and real experiences, all in one supportive place.\n'),
('welcome_title', 'Welcome to A1Circle!');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `background_path` varchar(100) DEFAULT NULL,
  `background_mode` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `default_sort` varchar(50) DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `description`, `color`, `background_path`, `background_mode`, `position`, `parent_id`, `default_sort`, `is_restricted`, `is_hidden`, `discussion_count`, `last_posted_at`, `last_posted_discussion_id`, `last_posted_user_id`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Food & Recipes', 'food-recipes', 'Share your favorite low-carb meals, snacks, and cooking tips. Or ask for some :)', '#e7ccef', NULL, NULL, 0, NULL, NULL, 0, 0, 4, '2025-10-25 10:06:00', 40, 48, 'fas fa-utensils', NULL, '2025-10-25 10:06:00'),
(2, 'Ask a Doctor', 'ask-a-doctor', 'Ask medical questions related to diabetes. Our community doctor will respond when possible. (Not a substitute for emergency care.)', '#076df2', NULL, NULL, 3, NULL, NULL, 1, 0, 2, '2025-10-25 10:22:09', 43, 49, 'fas fa-user-md', '2025-07-05 22:39:24', '2025-10-25 10:22:10'),
(3, 'Life Hacks & Routines', 'life-hacks-routines', 'Your daily go-to for tips, tricks, and ingenious solutions to make life with diabetes easier.', '#ffdab9', NULL, NULL, 2, NULL, NULL, 0, 0, 4, '2025-10-25 12:13:10', 51, NULL, 'fas fa-heartbeat', '2025-07-05 22:41:09', '2025-10-25 12:13:10'),
(4, 'The Headspace', 'the-headspace', 'Need to clear your mind? Share whatever’s on your heart, diabetes-related or not. \nThis is your space to talk it out :)', '#d3c192', NULL, NULL, 1, NULL, NULL, 0, 0, 9, '2025-10-25 12:17:37', 52, 52, 'fas fa-comments', '2025-07-05 22:54:09', '2025-10-25 12:17:37'),
(5, 'My Story', 'my-story', 'When did it get real? \nShare the moment you were diagnosed, the early chaos, and the story of how your journey began.', '#C8C8C8', NULL, NULL, 0, 4, NULL, 0, 0, 7, '2025-10-25 11:08:15', 45, 48, 'fas fa-book', '2025-10-05 09:25:03', '2025-10-25 11:11:41'),
(6, 'Victories & Goals', 'victories-goals', 'BRB, celebrating a new A1C! \nPost your wins here when you hit a new goal, ace a tricky bolus, or just survive a holiday dinner.', '#C8C8C8', NULL, NULL, 2, 4, NULL, 0, 0, 1, '2025-10-25 11:23:43', 47, 52, 'fas fa-star', '2025-10-05 09:44:15', '2025-10-25 11:23:43'),
(7, 'When It Gets Tough', 'when-it-gets-tough', 'Feeling burnt out? You\'re not alone.\nA safe space to vent, rage against the machine, or just find a shoulder when the numbers won\'t cooperate.', '#C8C8C8', NULL, NULL, 1, 4, NULL, 0, 0, 1, '2025-10-25 12:17:37', 52, 52, 'fas fa-cloud-sun-rain', '2025-10-05 09:45:01', '2025-10-25 12:17:37'),
(8, 'Active Life', 'active-life', 'Discuss exercise, sports, managing pre- and post-activity numbers, and staying physically healthy.', '#C8C8C8', NULL, NULL, 0, 3, NULL, 0, 0, 2, '2025-10-25 11:50:10', 49, 52, 'fas fa-dumbbell', '2025-10-05 09:46:02', '2025-10-25 11:50:10'),
(9, 'Tech Talk', 'tech-talk', 'Reviews, tips, and troubleshooting for pumps, CGMs, meters, and diabetes-related apps.', '#C8C8C8', NULL, NULL, 1, 3, NULL, 0, 0, 1, '2025-10-25 12:13:10', 51, NULL, 'fas fa-syringe', '2025-10-05 09:46:13', '2025-10-25 12:13:10'),
(10, 'On the Go', 'on-the-go', 'Tips and questions for flying, driving, managing jet lag, handling sick days, and navigating the unpredictable.', '#C8C8C8', NULL, NULL, 2, 3, NULL, 0, 0, 1, '2025-10-25 11:55:51', 50, NULL, 'fas fa-suitcase', '2025-10-05 09:46:28', '2025-10-25 11:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `tag_user`
--

CREATE TABLE `tag_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) NOT NULL,
  `avatar_url` varchar(100) DEFAULT NULL,
  `preferences` blob DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text DEFAULT NULL,
  `suspend_message` text DEFAULT NULL,
  `diabetes_type` varchar(50) NOT NULL,
  `blocks_byobu_pd` tinyint(1) NOT NULL DEFAULT 0,
  `unread_messages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nickname`, `email`, `is_email_confirmed`, `password`, `avatar_url`, `preferences`, `joined_at`, `last_seen_at`, `marked_all_as_read_at`, `read_notifications_at`, `discussion_count`, `comment_count`, `read_flags_at`, `suspended_until`, `suspend_reason`, `suspend_message`, `diabetes_type`, `blocks_byobu_pd`, `unread_messages`) VALUES
(1, 'Shatha', NULL, 'shatha.a.maree@gmail.com', 1, '$2y$10$NCpQRHPj4X33m4pVY9eGC.zvWKMfT4x60R78CEGQWYea7BZzXHCm.', NULL, 0x7b22666f6c6c6f7741667465725265706c79223a747275652c22666c6172756d2d737562736372697074696f6e732e6e6f746966795f666f725f616c6c5f706f737473223a747275652c227573655269636854657874456469746f72223a747275652c227269636854657874436f6d7061637450617261677261706873223a66616c73652c226e6f746966795f64697363757373696f6e52656e616d65645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f656d61696c223a747275652c226e6f746966795f75736572556e73757370656e6465645f616c657274223a747275652c226e6f746966795f75736572556e73757370656e6465645f656d61696c223a747275652c226e6f746966795f706f73744d656e74696f6e65645f616c657274223a747275652c226e6f746966795f706f73744d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f757365724d656e74696f6e65645f616c657274223a747275652c226e6f746966795f757365724d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f67726f75704d656e74696f6e65645f616c657274223a747275652c226e6f746966795f67726f75704d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f616c657274223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f656d61696c223a747275652c226e6f746966795f6e6577506f73745f616c657274223a747275652c226e6f746966795f6e6577506f73745f656d61696c223a747275652c226e6f746966795f64697363757373696f6e4c6f636b65645f616c657274223a747275652c226e6f746966795f706f73744c696b65645f616c657274223a747275652c226e6f746966795f7761726e696e675f616c657274223a747275652c226e6f746966795f7761726e696e675f656d61696c223a747275652c22646973636c6f73654f6e6c696e65223a747275652c22696e64657850726f66696c65223a747275652c226c6f63616c65223a22656e227d, '2025-07-05 21:43:56', '2025-10-25 12:40:01', NULL, '2025-10-06 09:49:00', 4, 4, '2025-10-05 21:58:08', NULL, NULL, NULL, '', 0, 0),
(3, 'elham', NULL, 'elhamaree@gmail.com', 0, '$2y$10$6VF4GlHi82/zNTU9bXTWh.xlG1RMafZAZLJ0H3w5ItHxJ00AeOUui', NULL, NULL, '2025-07-06 20:16:13', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(4, 'diabetesTypeTest', NULL, 'diabetesTypeTest@gmail.com', 0, '$2y$10$9nY1gGX0ywnsNH409rD8B.5BmDSBtNY1d424OToqHJuw3/eGmCfAS', NULL, NULL, '2025-07-08 13:48:31', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(5, 'testfordiabetestype', NULL, 'testfordiabetestype@gmail.com', 0, '$2y$10$Ye09ccq8nNe9JGWo6Berz.iQng.2Tl8GTQjDx8FHBeZMx7LneinDe', NULL, NULL, '2025-07-08 13:49:03', '2025-07-08 13:49:24', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(6, 'secondtestdiabetestype', NULL, 'secondtestdiabetestype@gmail.com', 0, '$2y$10$3nR/F3kCp1Z4zMnQqOzcU.lPJwE32tJzCQk9rqTfw10JlvRCM6dDy', NULL, NULL, '2025-07-08 14:28:15', '2025-07-08 14:28:28', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(7, 'thirdtest', NULL, 'thirdtest@gmail.com', 0, '$2y$10$yBLrSU5IXGBMJ4gBASjUXuXP.tFLfuYeCyuqquxqvRZfJexWaZItO', NULL, NULL, '2025-07-08 14:30:06', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(8, 'fourthtest', NULL, 'fourthtest@gmail.com', 0, '$2y$10$aVOsP/ACY2BNi3Sn/fq1LechHgDNfNogGqKYMDrM/Xtls2aU1I1kK', NULL, NULL, '2025-07-08 14:30:53', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(11, 'seventhtest', NULL, 'seventhtest@gmail.com', 0, '$2y$10$qQTZ6wo.k8yjPgJ6PZ2hpeSCSVTIjIsvsCIRGBqohp6fbyJAL1gtm', NULL, NULL, '2025-07-08 14:48:42', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(13, 'eighthtest', NULL, 'eighthtest@gmail.com', 0, '$2y$10$OM6K/WDSNoHdnmnXZgw.Y.j/Lcj//iT4GJ7UIkyeleehlD/4kocpW', NULL, NULL, '2025-07-08 14:55:51', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(15, 'fuckinghell', NULL, 'fuckinghell@gmail.com', 0, '$2y$10$1U5DxrAYVpgDQqaVxIcTGO/LvFf2l55onFU3ZwQXyYRS87nNiW2ye', NULL, NULL, '2025-07-08 14:58:23', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(17, 'waba3deen', NULL, 'waba3deen@gmail.com', 0, '$2y$10$4K8gunBlKE.y3qRUjmAdOOmJi5dAZTE72VNcyes9SJrhvObPuUM.u', NULL, NULL, '2025-07-08 15:05:25', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(18, 'lalalala', NULL, 'lalalala@gmail.com', 0, '$2y$10$xzk3rwjG4X5XqlePdp.TkerujG3AfSfY0lJFuYgesvf2t/y9ZhVYy', NULL, NULL, '2025-07-08 15:09:13', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Type 1', 0, 0),
(19, 'yarabyezbot', NULL, 'yarabyezbot@gmail.com', 0, '$2y$10$xQKOw6hCNUaFhtGBCsHg7uy/M8XntsLhE917R6e5FdkB3LQMnWsJm', NULL, NULL, '2025-07-08 15:19:32', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(20, 'exitmylifeplz', NULL, 'exitmylifeplz@gmail.com', 0, '$2y$10$1c3RQM4X611A1i8wCcTCVOpuX3tjXeZtziVrphxJMZDAXYAjWSrDe', NULL, NULL, '2025-07-08 15:24:35', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Type 2', 0, 0),
(21, 'yarabyarab', NULL, 'yarabyarab@gmail.com', 0, '$2y$10$Qt.n3so7mnKO9imj/y6irOkYPFhm2fb5fhKAg5FJ7LH2kFg2owstm', NULL, NULL, '2025-07-08 15:33:42', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(22, 'yalayateezi', NULL, 'yalayateezi@gmail.com', 0, '$2y$10$IW7DPpbqMnlGx3ywimptZ.y5gew216EyEgGjDyr6VA7u4RO9LIho2', NULL, NULL, '2025-07-08 15:41:53', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(23, 'hayamaree', NULL, 'hayamaree@hotmail.com', 0, '$2y$10$z2kdfWUABXiBbSLHerUe7.6O3/Zt7vnlj8QfBVAYcdvVdHNjetRqC', NULL, NULL, '2025-07-08 15:43:07', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(24, 'mylifesucks', NULL, 'mylifesucks@gmail.com', 0, '$2y$10$LzQnn9z0x1dGi1D1jj1sXuOpx7Jl2HEMjtPgyI0WVcoiPU15u5LQO', NULL, NULL, '2025-07-08 15:49:26', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(25, 'ummkalthoum', NULL, 'ummkalthoum@gmail.com', 0, '$2y$10$7jYtnwkbUnC2XdTu1ti/AeehPLTy./pjJTscYktzfoM.gL610ph7S', NULL, NULL, '2025-07-08 15:53:09', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(26, 'georgewassouf', NULL, 'georgewassouf@gmail.com', 0, '$2y$10$fAmFspcclPOdxPTPttFC1.jzx9mXHgbRfFa1SM83ocHozmmneTVaW', NULL, NULL, '2025-07-08 15:57:27', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(27, 'layla', NULL, 'layla@gmail.com', 0, '$2y$10$REV.9Ze48xI4/fwFcTii/eYZiRSX5SzFztwp.ivGpaNGaLX3HBqdG', NULL, NULL, '2025-09-28 12:22:37', '2025-10-22 09:49:04', NULL, '2025-09-28 14:04:20', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(28, 'layla_jubran', NULL, 'laylajubran@gmail.com', 0, '$2y$10$/AO1TV4evG40HnMJ2qNEEecLTiyod5K0FX67A42PZgxAkG607SHzO', NULL, NULL, '2025-09-28 12:23:45', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(29, 'laylajubran', NULL, 'layla123jubran@gmail.com', 0, '$2y$10$MHap/5VDrviPj7/58ndiSe2KZ96kAHfs1A5rfx73pxuth2BIvIU2a', NULL, NULL, '2025-09-28 12:23:59', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(30, 'wowowow123', NULL, 'wowowow123@gmail.com', 0, '$2y$10$wZOgV8KuSPfhaGB.ciO1ne3HlVQjOSwSePqjHF27fhZgHYqVXHpnm', NULL, NULL, '2025-09-28 12:25:30', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(31, 'koss7ayati5', NULL, 'koss7ayati5@gmail.com', 0, '$2y$10$es.RgDeSgCp/Vm5L3.mPjeUxTVgq8jeF97O0Z3eCWDGl.CZ49RIpG', NULL, NULL, '2025-09-28 15:53:49', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(32, 'koss7ayati10', NULL, 'koss7ayati10@gmail.com', 0, '$2y$10$9Y8H9osGtD0nnZOnB8ICTuXKG3Xx/64YCv8R.QHVltQkiicfNDM4m', NULL, NULL, '2025-09-28 15:55:21', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(33, 'layla123', NULL, 'layla.jubran@campus.technion.ac.il', 1, '$2y$10$qeHsmTQpvkXqoZ4ERvYVauP7CWMmyMWfSAKvYzKpnQ9LjtdWkqw9W', NULL, NULL, '2025-09-28 16:38:18', '2025-09-28 17:07:55', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(34, 'suhailjubran', NULL, 'suhailjubran@gmail.com', 0, '$2y$10$Nrhe/P5aWqzzu0eNdaixHucPdpG3g9zzwJfXn7AeSiSeQhe6Xnh5i', NULL, NULL, '2025-09-28 17:10:20', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(35, 'koss7ayati11', NULL, 'koss7ayati11@gmail.com', 0, '$2y$10$8C9PWUzW7h2XEiN6XTFyBua61z4PT07OLFwBdbXqzMot.lHjibxAe', NULL, NULL, '2025-09-28 17:11:30', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(36, 'koss7ayati15', NULL, 'koss7ayati1@gmail.com', 0, '$2y$10$770DBpDwdRysYFTsmlQVJuTfiBDgICBwq5fytMQY60ttJMHElWuKC', NULL, NULL, '2025-09-28 17:12:09', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(37, 'suhail12', NULL, 'suhail12@gmail.com', 0, '$2y$10$kjgaHXVxu1PtAahAL4pXdu.CSRBRkNhTvbdWyR3FrSLkdoDnWXpXG', NULL, NULL, '2025-09-28 17:12:31', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(38, 'suhail123', NULL, 'suhail123@gmail.com', 0, '$2y$10$CCuyUQknibFu.hX7YktZJObXNK.iJu3zs5bitRl7.hgwL4B7DkSs.', NULL, NULL, '2025-09-28 17:13:41', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 0, 0),
(39, 'ahmad123', NULL, 'ahmad123@gmail.com', 0, '$2y$10$H.aZZ8yFywLgMDhr7mptCeh0UPYEf9A6Wl.WyWQOjO.rUGnE/DLV.', NULL, NULL, '2025-09-28 17:32:37', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Type 1 Diabetes', 0, 0),
(40, 'ahmed123', NULL, 'ahmed123@gmail.com', 0, '$2y$10$o56AjQJJh3b8DjM5/6WxaeOgsucJNp/FpgkhjZbYiGJxa24mKyl.i', NULL, NULL, '2025-09-28 17:33:27', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Type 1 Diabetes', 0, 0),
(41, 'ahmed1234', NULL, 'ahmed1234@gmail.com', 0, '$2y$10$/M013DaAhOvzW7uGR9mK/uO984lA72XyFBRYuz08d2J45O5sw2pXi', NULL, NULL, '2025-09-28 17:36:29', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Gestational Diabetes', 0, 0),
(42, 'mohammed', NULL, 'mohammed@gmail.com', 0, '$2y$10$xBhrFD/aIo5.3cpeH3IjE.zI.Vdpd2szs6oRBoWX4E3flHF1PSU0C', NULL, NULL, '2025-09-28 17:40:39', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Gestational Diabetes', 0, 0),
(43, 'mohammed1', NULL, 'mohammed1@gmail.com', 0, '$2y$10$kWKxmds4T/zeud2BzdjK4Od0C.if8vouyuWBK8.EaQuqoa3nPOgnO', NULL, NULL, '2025-09-28 17:48:51', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Gestational Diabetes', 0, 0),
(44, 'farah_jubran', NULL, 'farah.jubran@gmail.com', 0, '$2y$10$wyZUUBSq7aJYvltmUgt1.e060fHZ2pOlIZEIDZgCC4JU/WP5m87Rq', NULL, NULL, '2025-09-28 17:52:37', '2025-09-30 14:23:22', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Pre-diabetes', 0, 0),
(45, 'baraakha', NULL, 'baraaekhalifa@gmail.com', 1, '$2y$10$N/86kKJRi87ZgVLbPqES0ezY5JwxiDPFM6FiB4geoRCrccxlCoice', NULL, NULL, '2025-09-30 14:26:48', '2025-09-30 16:01:32', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 'Pre-diabetes', 0, 0),
(46, 'AhmedSaadi', NULL, 'ahmad_sa94@hotmail.com', 0, '$2y$10$1rnDuR3hnUxVjvcMD.7Ahuq1KsMQ2EJt.Trdr1x2JP4/Sv5wfTqKq', NULL, NULL, '2025-09-30 15:15:16', '2025-09-30 20:15:04', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Other', 0, 0),
(47, 'yahabibi', NULL, 'yahabibi@gmail.com', 0, '$2y$10$Sqvv1ITwSya7U6770QLZVOP2lFgS8FJvF8.UBcIL7ifY.eWpHbrje', NULL, NULL, '2025-09-30 15:16:29', '2025-09-30 15:37:48', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Type 2 Diabetes', 0, 0),
(48, 'smaree08', NULL, 'smaree08@campus.haifa.ac.il', 1, '$2y$10$YT4UVLDmtrEUJDKVx00is.fMn2wMAiKobUg0pDC8kKYvQbniAFcoO', NULL, NULL, '2025-09-30 16:08:17', '2025-10-25 12:14:58', NULL, '2025-10-25 11:25:16', 8, 9, NULL, NULL, NULL, NULL, 'Type 2 Diabetes', 0, 0),
(49, 'JosephShamma', NULL, 'JosephShamma0@gmail.com', 1, '$2y$10$aXodxcHE6PFv4OEapNjLqutNua8Lqdc5dYfvZDWB.aH3K7bmvecLC', NULL, NULL, '2025-09-30 20:15:42', '2025-10-25 12:14:44', NULL, '2025-10-25 10:20:09', 0, 3, NULL, NULL, NULL, NULL, 'Other', 0, 0),
(50, 'AboElWadee3', NULL, 'AboElWadee3@gmail.com', 0, '$2y$10$mLqifC0xQcvlRp3CCAcHeuMlY9OQpkEaN4yib060XCteFregKmdPW', NULL, NULL, '2025-09-30 20:20:54', '2025-09-30 20:20:58', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Type 2 Diabetes', 0, 0),
(51, 'imsotired', NULL, 'imsotired@gmail.com', 0, '$2y$10$wnSt8IB8d346n4HmCWUOdOreie.7jrBCSlZ.8cXucqtPXsZtsn4bK', NULL, 0x7b22666f6c6c6f7741667465725265706c79223a66616c73652c22666c6172756d2d737562736372697074696f6e732e6e6f746966795f666f725f616c6c5f706f737473223a66616c73652c227573655269636854657874456469746f72223a747275652c227269636854657874436f6d7061637450617261677261706873223a66616c73652c226e6f746966795f64697363757373696f6e52656e616d65645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f616c657274223a747275652c226e6f746966795f7573657253757370656e6465645f656d61696c223a747275652c226e6f746966795f75736572556e73757370656e6465645f616c657274223a747275652c226e6f746966795f75736572556e73757370656e6465645f656d61696c223a747275652c226e6f746966795f706f73744d656e74696f6e65645f616c657274223a747275652c226e6f746966795f706f73744d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f757365724d656e74696f6e65645f616c657274223a747275652c226e6f746966795f757365724d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f67726f75704d656e74696f6e65645f616c657274223a747275652c226e6f746966795f67726f75704d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f616c657274223a66616c73652c226e6f746966795f6e6577507269766174654d6573736167655f656d61696c223a747275652c226e6f746966795f6e6577506f73745f616c657274223a747275652c226e6f746966795f6e6577506f73745f656d61696c223a747275652c226e6f746966795f64697363757373696f6e4c6f636b65645f616c657274223a747275652c226e6f746966795f706f73744c696b65645f616c657274223a747275652c226e6f746966795f7761726e696e675f616c657274223a747275652c226e6f746966795f7761726e696e675f656d61696c223a747275652c22646973636c6f73654f6e6c696e65223a747275652c22696e64657850726f66696c65223a747275652c226c6f63616c65223a226172227d, '2025-10-12 15:18:48', '2025-10-12 15:18:53', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 'Pre-diabetes', 0, 0),
(52, 'wardaaaw123', NULL, 'wardaaaw123@gmail.com', 1, '$2y$10$QNYOmhGzSHafrP0oTYQdUuh70Q2tAGuud0tu09YF0twpkmUlI/87.', NULL, NULL, '2025-10-22 11:02:07', '2025-10-25 12:16:59', NULL, '2025-10-25 10:17:51', 5, 7, NULL, NULL, NULL, NULL, 'MODY', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE `warnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `strikes` int(11) NOT NULL,
  `public_comment` mediumtext NOT NULL,
  `private_comment` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_tokens_token_unique` (`token`),
  ADD KEY `access_tokens_user_id_foreign` (`user_id`),
  ADD KEY `access_tokens_type_index` (`type`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_keys_key_unique` (`key`),
  ADD KEY `api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversation_user`
--
ALTER TABLE `conversation_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_user_conversation_id_foreign` (`conversation_id`),
  ADD KEY `conversation_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `discussions_first_post_id_foreign` (`first_post_id`),
  ADD KEY `discussions_last_post_id_foreign` (`last_post_id`),
  ADD KEY `discussions_last_posted_at_index` (`last_posted_at`),
  ADD KEY `discussions_last_posted_user_id_index` (`last_posted_user_id`),
  ADD KEY `discussions_created_at_index` (`created_at`),
  ADD KEY `discussions_user_id_index` (`user_id`),
  ADD KEY `discussions_comment_count_index` (`comment_count`),
  ADD KEY `discussions_participant_count_index` (`participant_count`),
  ADD KEY `discussions_hidden_at_index` (`hidden_at`),
  ADD KEY `discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  ADD KEY `discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  ADD KEY `discussions_is_locked_index` (`is_locked`),
  ADD KEY `discussions_anonymous_user_id_index` (`anonymous_user_id`);
ALTER TABLE `discussions` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `discussion_tag`
--
ALTER TABLE `discussion_tag`
  ADD PRIMARY KEY (`discussion_id`,`tag_id`),
  ADD KEY `discussion_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `discussion_user`
--
ALTER TABLE `discussion_user`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `discussion_user_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `email_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flags_post_id_foreign` (`post_id`),
  ADD KEY `flags_user_id_foreign` (`user_id`),
  ADD KEY `flags_created_at_index` (`created_at`);

--
-- Indexes for table `fof_masquerade_answers`
--
ALTER TABLE `fof_masquerade_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fof_masquerade_answers_field_id_user_id_unique` (`field_id`,`user_id`),
  ADD KEY `fof_masquerade_answers_user_id_foreign` (`user_id`);

--
-- Indexes for table `fof_masquerade_fields`
--
ALTER TABLE `fof_masquerade_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fof_masquerade_fields_required_index` (`required`),
  ADD KEY `fof_masquerade_fields_sort_index` (`sort`),
  ADD KEY `fof_masquerade_fields_type_index` (`type`);

--
-- Indexes for table `fof_upload_downloads`
--
ALTER TABLE `fof_upload_downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fof_upload_downloads_file_id_foreign` (`file_id`),
  ADD KEY `fof_upload_downloads_discussion_id_foreign` (`discussion_id`),
  ADD KEY `fof_upload_downloads_actor_id_foreign` (`actor_id`),
  ADD KEY `fof_upload_downloads_post_id_foreign` (`post_id`);

--
-- Indexes for table `fof_upload_files`
--
ALTER TABLE `fof_upload_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fof_upload_files_actor_id_hidden_shared_index` (`actor_id`,`hidden`,`shared`),
  ADD KEY `fof_upload_files_shared_index` (`shared`),
  ADD KEY `fof_upload_files_uuid_index` (`uuid`);

--
-- Indexes for table `fof_upload_file_posts`
--
ALTER TABLE `fof_upload_file_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fof_upload_file_posts_post_id_foreign` (`post_id`),
  ADD KEY `fof_upload_file_posts_file_id_foreign` (`file_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permission`
--
ALTER TABLE `group_permission`
  ADD PRIMARY KEY (`group_id`,`permission`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `group_user_group_id_foreign` (`group_id`);

--
-- Indexes for table `login_providers`
--
ALTER TABLE `login_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_providers_provider_identifier_unique` (`provider`,`identifier`),
  ADD KEY `login_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_from_user_id_foreign` (`from_user_id`),
  ADD KEY `notifications_user_id_index` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `password_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  ADD KEY `posts_edited_user_id_foreign` (`edited_user_id`),
  ADD KEY `posts_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `posts_discussion_id_number_index` (`discussion_id`,`number`),
  ADD KEY `posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  ADD KEY `posts_user_id_created_at_index` (`user_id`,`created_at`),
  ADD KEY `posts_type_index` (`type`),
  ADD KEY `posts_type_created_at_index` (`type`,`created_at`),
  ADD KEY `posts_anonymous_user_id_index` (`anonymous_user_id`);
ALTER TABLE `posts` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `post_anonymous_reactions`
--
ALTER TABLE `post_anonymous_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_anonymous_reactions_post_id_foreign` (`post_id`),
  ADD KEY `post_anonymous_reactions_reaction_id_foreign` (`reaction_id`),
  ADD KEY `post_anonymous_reactions_guest_id_index` (`guest_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_mentions_post`
--
ALTER TABLE `post_mentions_post`
  ADD PRIMARY KEY (`post_id`,`mentions_post_id`),
  ADD KEY `post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`);

--
-- Indexes for table `post_mentions_tag`
--
ALTER TABLE `post_mentions_tag`
  ADD PRIMARY KEY (`post_id`,`mentions_tag_id`),
  ADD KEY `post_mentions_tag_mentions_tag_id_foreign` (`mentions_tag_id`);

--
-- Indexes for table `post_mentions_user`
--
ALTER TABLE `post_mentions_user`
  ADD PRIMARY KEY (`post_id`,`mentions_user_id`),
  ADD KEY `post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`);

--
-- Indexes for table `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_reactions_post_id_foreign` (`post_id`),
  ADD KEY `post_reactions_user_id_foreign` (`user_id`),
  ADD KEY `post_reactions_reaction_id_foreign` (`reaction_id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_user_bookmark`
--
ALTER TABLE `post_user_bookmark`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `post_user_bookmark_user_id_foreign` (`user_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipients_user_id_foreign` (`user_id`),
  ADD KEY `recipients_group_id_foreign` (`group_id`),
  ADD KEY `recipients_removed_at_index` (`removed_at`),
  ADD KEY `recipients_discussion_id_user_id_index` (`discussion_id`,`user_id`),
  ADD KEY `recipients_discussion_id_group_id_index` (`discussion_id`,`group_id`);

--
-- Indexes for table `registration_tokens`
--
ALTER TABLE `registration_tokens`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`),
  ADD KEY `tags_parent_id_foreign` (`parent_id`),
  ADD KEY `tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  ADD KEY `tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`);

--
-- Indexes for table `tag_user`
--
ALTER TABLE `tag_user`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `tag_user_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_joined_at_index` (`joined_at`),
  ADD KEY `users_last_seen_at_index` (`last_seen_at`),
  ADD KEY `users_discussion_count_index` (`discussion_count`),
  ADD KEY `users_comment_count_index` (`comment_count`),
  ADD KEY `users_nickname_index` (`nickname`),
  ADD KEY `users_blocks_byobu_pd_index` (`blocks_byobu_pd`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `warnings_created_user_id_foreign` (`created_user_id`),
  ADD KEY `warnings_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `warnings_post_id_foreign` (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_tokens`
--
ALTER TABLE `access_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conversation_user`
--
ALTER TABLE `conversation_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fof_masquerade_answers`
--
ALTER TABLE `fof_masquerade_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fof_masquerade_fields`
--
ALTER TABLE `fof_masquerade_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fof_upload_downloads`
--
ALTER TABLE `fof_upload_downloads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fof_upload_files`
--
ALTER TABLE `fof_upload_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fof_upload_file_posts`
--
ALTER TABLE `fof_upload_file_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_providers`
--
ALTER TABLE `login_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `post_anonymous_reactions`
--
ALTER TABLE `post_anonymous_reactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_reactions`
--
ALTER TABLE `post_reactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversation_user`
--
ALTER TABLE `conversation_user`
  ADD CONSTRAINT `conversation_user_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `discussion_tag`
--
ALTER TABLE `discussion_tag`
  ADD CONSTRAINT `discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discussion_user`
--
ALTER TABLE `discussion_user`
  ADD CONSTRAINT `discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD CONSTRAINT `email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flags`
--
ALTER TABLE `flags`
  ADD CONSTRAINT `flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fof_masquerade_answers`
--
ALTER TABLE `fof_masquerade_answers`
  ADD CONSTRAINT `fof_masquerade_answers_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fof_masquerade_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fof_masquerade_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fof_upload_downloads`
--
ALTER TABLE `fof_upload_downloads`
  ADD CONSTRAINT `fof_upload_downloads_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fof_upload_downloads_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fof_upload_downloads_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `fof_upload_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fof_upload_downloads_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fof_upload_file_posts`
--
ALTER TABLE `fof_upload_file_posts`
  ADD CONSTRAINT `fof_upload_file_posts_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `fof_upload_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fof_upload_file_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_permission`
--
ALTER TABLE `group_permission`
  ADD CONSTRAINT `group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_providers`
--
ALTER TABLE `login_providers`
  ADD CONSTRAINT `login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD CONSTRAINT `password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_anonymous_reactions`
--
ALTER TABLE `post_anonymous_reactions`
  ADD CONSTRAINT `post_anonymous_reactions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_anonymous_reactions_reaction_id_foreign` FOREIGN KEY (`reaction_id`) REFERENCES `reactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_mentions_post`
--
ALTER TABLE `post_mentions_post`
  ADD CONSTRAINT `post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_mentions_tag`
--
ALTER TABLE `post_mentions_tag`
  ADD CONSTRAINT `post_mentions_tag_mentions_tag_id_foreign` FOREIGN KEY (`mentions_tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_mentions_user`
--
ALTER TABLE `post_mentions_user`
  ADD CONSTRAINT `post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD CONSTRAINT `post_reactions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_reactions_reaction_id_foreign` FOREIGN KEY (`reaction_id`) REFERENCES `reactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_reactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user_bookmark`
--
ALTER TABLE `post_user_bookmark`
  ADD CONSTRAINT `post_user_bookmark_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_user_bookmark_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipients`
--
ALTER TABLE `recipients`
  ADD CONSTRAINT `recipients_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipients_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tag_user`
--
ALTER TABLE `tag_user`
  ADD CONSTRAINT `tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warnings`
--
ALTER TABLE `warnings`
  ADD CONSTRAINT `warnings_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `warnings_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `warnings_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `warnings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

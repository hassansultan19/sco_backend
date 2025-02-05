-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 08:55 PM
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
-- Database: `newescort`
--

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `rating`, `status`, `is_deleted`, `name`, `message`, `created_at`, `updated_at`) VALUES
(1, 43, 5, 1, 0, 'User New', 'AAAAAA', '2024-12-12 22:59:14', '2024-12-12 23:02:02'),
(2, 40, 3, 0, 1, 'tester', 'test', '2024-12-13 08:13:02', '2024-12-13 09:07:27'),
(3, 40, 3, 0, 0, 'Wendy Nielsen', 'Rerum sed vero quide', '2024-12-13 09:07:44', '2024-12-13 09:07:44'),
(4, 40, 4, 0, 1, 'Emmanuel Drake', 'Quaerat inventore si', '2024-12-13 09:29:15', '2024-12-13 09:33:25'),
(5, 40, 4, 0, 0, 'Declan Salazar', 'Est sint aliqua Mol', '2024-12-13 09:34:15', '2024-12-13 09:34:15'),
(6, 38, 5, 0, 1, 'Saad', 'Awesome work.', '2024-12-13 14:55:02', '2024-12-16 12:56:17'),
(7, 41, 5, 0, 0, 'hi', 'jhjhjh', '2024-12-13 15:23:34', '2024-12-13 15:23:34'),
(8, 41, 2, 0, 0, 'hihi', 'jhjhjhjhjh', '2024-12-13 15:23:42', '2024-12-13 15:23:42'),
(9, 45, 5, 0, 1, 'Jhon Doe', 'She gives me real pleasure. 10/10', '2024-12-13 18:30:59', '2024-12-13 18:37:57'),
(10, 45, 4, 0, 1, 'Jhon Dick', 'She gives me real pleasure. 10/10', '2024-12-13 18:31:44', '2024-12-13 18:37:59'),
(11, 45, 5, 0, 1, 'Saad Sirhandi', 'She is a ggg', '2024-12-16 18:04:57', '2024-12-16 18:05:40'),
(12, 45, 3, 0, 1, 'Test', 'She is a ggg test', '2024-12-16 18:05:10', '2024-12-16 18:05:39'),
(13, 46, 5, 0, 0, 'jil', 'Kurwa du elsker at arbejde jabana jililililililililil', '2024-12-17 10:31:44', '2024-12-17 10:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sex', 1, NULL, NULL),
(2, 'Massage', 1, NULL, NULL),
(3, 'In-Call', 1, NULL, NULL),
(4, 'Out-Call', 1, NULL, NULL),
(5, 'Party Girl', 1, NULL, NULL),
(6, 'Presenter/MC', 0, NULL, NULL),
(7, 'Movie/Theater Acting', 0, NULL, NULL),
(8, 'Dancing', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'ec78fc06-c57d-41a9-a1ec-8ec4411a44ea', 'images', '10', '10.png', 'image/png', 'public', 'public', 5625, '[]', '[]', '[]', '[]', 1, '2024-10-15 11:01:36', '2024-10-15 11:01:36'),
(2, 'App\\Models\\User', 2, '1dcdde3a-3d92-41be-8455-2f71e8c9242f', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:17:11', '2024-10-24 06:17:11'),
(3, 'App\\Models\\User', 3, 'ac62cbe2-08e4-4d2d-8055-fc6bb14ab2d6', 'images', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:32:12', '2024-10-24 06:32:12'),
(4, 'App\\Models\\User', 3, '082ffcbc-c072-4ebd-9e8a-86314c02121a', 'images', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 2, '2024-10-24 06:32:12', '2024-10-24 06:32:12'),
(5, 'App\\Models\\User', 3, '56c01746-5032-4714-9cc5-35d69b21a564', 'main_image', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 3, '2024-10-24 06:32:12', '2024-10-24 06:32:12'),
(6, 'App\\Models\\User', 4, 'db5d1587-bcbd-46c9-943a-85e346b7ee81', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:32:39', '2024-10-24 06:32:39'),
(7, 'App\\Models\\User', 5, 'fe34561c-9386-4a13-8e1f-7320a6972880', 'images', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:34:23', '2024-10-24 06:34:23'),
(8, 'App\\Models\\User', 5, 'bafe093b-dd4a-4016-9886-a7502a54f1e1', 'images', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 2, '2024-10-24 06:34:23', '2024-10-24 06:34:23'),
(9, 'App\\Models\\User', 5, '19c967a3-90db-4854-ae8f-a62ef33e7db8', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 3, '2024-10-24 06:34:23', '2024-10-24 06:34:23'),
(10, 'App\\Models\\User', 6, '957e85d6-b304-4b6b-a323-b7dc6f33ab09', 'images', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:39:43', '2024-10-24 06:39:43'),
(11, 'App\\Models\\User', 6, '91ed3c8b-2950-40a3-8781-e76fa883c84f', 'images', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 2, '2024-10-24 06:39:43', '2024-10-24 06:39:43'),
(12, 'App\\Models\\User', 6, 'f040e3ec-ec2c-4428-b435-49f9027495db', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 3, '2024-10-24 06:39:43', '2024-10-24 06:39:43'),
(13, 'App\\Models\\User', 7, 'f7a19a96-d74c-4a7f-813b-7de5dd73364f', 'images', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:39:52', '2024-10-24 06:39:52'),
(14, 'App\\Models\\User', 7, '78bbe135-0f8e-419f-b912-149a2922b7b2', 'images', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 2, '2024-10-24 06:39:52', '2024-10-24 06:39:52'),
(15, 'App\\Models\\User', 7, '2c30bb01-451f-4d29-a7ce-1f0cf812cc8a', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 3, '2024-10-24 06:39:52', '2024-10-24 06:39:52'),
(16, 'App\\Models\\User', 8, '42b0afbc-b921-4200-9d80-47543c6db973', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 06:40:56', '2024-10-24 06:40:56'),
(17, 'App\\Models\\User', 9, 'f1fb2dae-2e4e-4e60-8139-ddcc131a7376', 'images', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:11:33', '2024-10-24 07:11:33'),
(18, 'App\\Models\\User', 9, '1754f47e-6466-45ac-9d25-1fe5a330544a', 'images', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 2, '2024-10-24 07:11:33', '2024-10-24 07:11:33'),
(19, 'App\\Models\\User', 9, '169a995a-92c1-4940-b6ce-3b16af7615f4', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 3, '2024-10-24 07:11:33', '2024-10-24 07:11:33'),
(20, 'App\\Models\\User', 10, 'b914a923-f864-41dd-894f-48897071070f', 'images', 'FAV Icon', 'FAV-Icon.png', 'image/png', 'public', 'public', 19942, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:48:02', '2024-10-24 08:48:02'),
(21, 'App\\Models\\User', 10, 'b7d46c7c-b2b9-4daf-a30f-2ca5235a5db6', 'images', 'LOGO (1)', 'LOGO-(1).png', 'image/png', 'public', 'public', 74511, '[]', '[]', '[]', '[]', 2, '2024-10-24 08:48:02', '2024-10-24 08:48:02'),
(22, 'App\\Models\\User', 10, 'c807b1aa-eb9c-4329-a09e-ce603337788c', 'images', 'logo-white', 'logo-white.png', 'image/png', 'public', 'public', 70763, '[]', '[]', '[]', '[]', 3, '2024-10-24 08:48:02', '2024-10-24 08:48:02'),
(23, 'App\\Models\\User', 10, 'eafd1739-03ed-4ee5-bacd-f9ef6faa578f', 'main_image', 'bannerimage', 'bannerimage.jpg', 'image/jpeg', 'public', 'public', 3602141, '[]', '[]', '[]', '[]', 4, '2024-10-24 08:48:02', '2024-10-24 08:48:02'),
(24, 'App\\Models\\User', 11, 'b78852f7-11bb-4ffa-bec1-316faeddbd2c', 'images', 'qrcode', 'qrcode.png', 'image/png', 'public', 'public', 4027, '[]', '[]', '[]', '[]', 1, '2024-10-24 09:44:57', '2024-10-24 09:44:57'),
(25, 'App\\Models\\User', 11, '8623321f-a1ad-41b7-ae00-9d9d3040ef01', 'images', 'WhatsApp Image 2024-10-15 at 5.50.58 PM', 'WhatsApp-Image-2024-10-15-at-5.50.58-PM.jpeg', 'image/jpeg', 'public', 'public', 204359, '[]', '[]', '[]', '[]', 2, '2024-10-24 09:44:57', '2024-10-24 09:44:57'),
(26, 'App\\Models\\User', 11, 'a2d4f495-fcd1-45d3-bdeb-15ded559fe24', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM (1)', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM-(1).jpeg', 'image/jpeg', 'public', 'public', 24794, '[]', '[]', '[]', '[]', 3, '2024-10-24 09:44:57', '2024-10-24 09:44:57'),
(27, 'App\\Models\\User', 11, '3920bc39-ed9f-4f04-983c-8e2da31fc41e', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM.jpeg', 'image/jpeg', 'public', 'public', 37365, '[]', '[]', '[]', '[]', 4, '2024-10-24 09:44:57', '2024-10-24 09:44:57'),
(28, 'App\\Models\\User', 11, 'dd78a115-e77d-42e5-a6aa-010ad8bd7923', 'main_image', 'logo-white', 'logo-white.png', 'image/png', 'public', 'public', 70763, '[]', '[]', '[]', '[]', 5, '2024-10-24 09:44:57', '2024-10-24 09:44:57'),
(29, 'App\\Models\\User', 12, 'd2baedf8-4dfb-4fce-982d-1b9401256a74', 'images', 'qrcode', 'qrcode.png', 'image/png', 'public', 'public', 4027, '[]', '[]', '[]', '[]', 1, '2024-10-24 09:45:30', '2024-10-24 09:45:30'),
(30, 'App\\Models\\User', 12, '0281d4ff-15a9-4fd7-98bd-a3980055962d', 'images', 'WhatsApp Image 2024-10-15 at 5.50.58 PM', 'WhatsApp-Image-2024-10-15-at-5.50.58-PM.jpeg', 'image/jpeg', 'public', 'public', 204359, '[]', '[]', '[]', '[]', 2, '2024-10-24 09:45:30', '2024-10-24 09:45:30'),
(31, 'App\\Models\\User', 12, 'b1afd529-29ba-45e4-87b0-c33bcb60ad88', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM (1)', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM-(1).jpeg', 'image/jpeg', 'public', 'public', 24794, '[]', '[]', '[]', '[]', 3, '2024-10-24 09:45:30', '2024-10-24 09:45:30'),
(32, 'App\\Models\\User', 12, '0e95a98f-a2af-4f80-887b-951ecade1c57', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM.jpeg', 'image/jpeg', 'public', 'public', 37365, '[]', '[]', '[]', '[]', 4, '2024-10-24 09:45:30', '2024-10-24 09:45:30'),
(33, 'App\\Models\\User', 12, 'dbfaeb16-4060-40ff-88ae-528fe782e0c5', 'main_image', 'logo-white', 'logo-white.png', 'image/png', 'public', 'public', 70763, '[]', '[]', '[]', '[]', 5, '2024-10-24 09:45:30', '2024-10-24 09:45:30'),
(34, 'App\\Models\\User', 13, '04743ff0-c801-4b41-99ce-eb5adf93e70f', 'images', 'qrcode (1)', 'qrcode-(1).png', 'image/png', 'public', 'public', 4027, '[]', '[]', '[]', '[]', 1, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(35, 'App\\Models\\User', 13, '3051792e-014f-497f-9481-09d06adcf507', 'images', 'qrcode', 'qrcode.png', 'image/png', 'public', 'public', 4027, '[]', '[]', '[]', '[]', 2, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(36, 'App\\Models\\User', 13, 'fb9ff9d7-51b6-4d13-b48c-fc7d377c787e', 'images', 'WhatsApp Image 2024-10-15 at 5.50.58 PM', 'WhatsApp-Image-2024-10-15-at-5.50.58-PM.jpeg', 'image/jpeg', 'public', 'public', 204359, '[]', '[]', '[]', '[]', 3, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(37, 'App\\Models\\User', 13, 'ef3909df-bf2b-4098-8db8-e3e3bef9dd98', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM (1)', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM-(1).jpeg', 'image/jpeg', 'public', 'public', 24794, '[]', '[]', '[]', '[]', 4, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(38, 'App\\Models\\User', 13, 'f30959a6-2606-4394-b896-7f7105d204a2', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM.jpeg', 'image/jpeg', 'public', 'public', 37365, '[]', '[]', '[]', '[]', 5, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(39, 'App\\Models\\User', 13, 'f0cf5479-cab2-4373-8ef8-cecc2ef398d0', 'images', 'uk-flag', 'uk-flag.png', 'image/png', 'public', 'public', 1175, '[]', '[]', '[]', '[]', 6, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(40, 'App\\Models\\User', 13, '16439864-dc56-4e40-aedc-8736ebb804c4', 'images', 'Presentation_03-2', 'Presentation_03-2.png', 'image/png', 'public', 'public', 34398, '[]', '[]', '[]', '[]', 7, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(41, 'App\\Models\\User', 13, '79b70b2b-8383-41c7-9b8f-47ca1e94eb10', 'images', 'Presentation_03-1-3', 'Presentation_03-1-3.png', 'image/png', 'public', 'public', 30048, '[]', '[]', '[]', '[]', 8, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(42, 'App\\Models\\User', 13, 'c3982d3f-9cd5-4953-a040-a5377dd28889', 'main_image', 'bannerimage', 'bannerimage.jpg', 'image/jpeg', 'public', 'public', 3602141, '[]', '[]', '[]', '[]', 9, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(43, 'App\\Models\\User', 14, '093d54c5-6771-4833-b3f4-4111e8a032a5', 'images', 'aboutSecimg2.7a2942ed08dc8ea7596e', 'aboutSecimg2.7a2942ed08dc8ea7596e.png', 'image/png', 'public', 'public', 21834, '[]', '[]', '[]', '[]', 1, '2024-10-24 19:29:22', '2024-10-24 19:29:22'),
(44, 'App\\Models\\User', 14, 'de02c805-05a4-43d4-a126-02ab81b05efe', 'images', 'aboutSecimg3.d1f08a3a3f36cc95260f', 'aboutSecimg3.d1f08a3a3f36cc95260f.png', 'image/png', 'public', 'public', 16960, '[]', '[]', '[]', '[]', 2, '2024-10-24 19:29:22', '2024-10-24 19:29:22'),
(45, 'App\\Models\\User', 14, '8be31825-d843-4c69-9c20-3f570b230966', 'images', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 3, '2024-10-24 19:29:22', '2024-10-24 19:29:22'),
(46, 'App\\Models\\User', 14, 'ade6f94d-62d1-4a82-bdb9-ea10cdc50e97', 'images', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 4, '2024-10-24 19:29:22', '2024-10-24 19:29:22'),
(47, 'App\\Models\\User', 14, 'eade4a22-3083-4198-b96b-510194a88ab5', 'main_image', 'aboutSecimg3.d1f08a3a3f36cc95260f', 'aboutSecimg3.d1f08a3a3f36cc95260f.png', 'image/png', 'public', 'public', 16960, '[]', '[]', '[]', '[]', 5, '2024-10-24 19:29:22', '2024-10-24 19:29:22'),
(48, 'App\\Models\\User', 15, '8061062b-31f8-4035-b8f8-d4a9c3d38c4d', 'images', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 1, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(49, 'App\\Models\\User', 15, '7b872705-228f-4f86-8500-535b76e8df2f', 'images', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 2, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(50, 'App\\Models\\User', 15, '52baee08-dbfe-4e1d-8979-417ee09daf94', 'images', 'apex', 'apex.png', 'image/png', 'public', 'public', 8128, '[]', '[]', '[]', '[]', 3, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(51, 'App\\Models\\User', 15, '3b0f56fd-08fd-46ee-bdbb-b773c5ecea17', 'images', 'Artificial-Intelligence', 'Artificial-Intelligence.png', 'image/png', 'public', 'public', 117743, '[]', '[]', '[]', '[]', 4, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(52, 'App\\Models\\User', 15, '398004fb-039e-4961-9a9d-06eb79bd889a', 'images', 'Asset_1_2x_1_8cdaaf62-afed-4e68-8eee-c1aeb19c51a7', 'Asset_1_2x_1_8cdaaf62-afed-4e68-8eee-c1aeb19c51a7.webp', 'image/webp', 'public', 'public', 42586, '[]', '[]', '[]', '[]', 5, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(53, 'App\\Models\\User', 15, '15437114-97a6-4145-937f-273ca0f20089', 'images', 'bannerimage', 'bannerimage.png', 'image/png', 'public', 'public', 266881, '[]', '[]', '[]', '[]', 6, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(54, 'App\\Models\\User', 15, '9321caed-a5cc-4f6f-bba9-ff145df70293', 'main_image', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 7, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(55, 'App\\Models\\User', 16, '12110cd3-5dd6-4c9e-a3a5-f2003480bb20', 'images', 'aboutSecimg2.7a2942ed08dc8ea7596e', 'aboutSecimg2.7a2942ed08dc8ea7596e.png', 'image/png', 'public', 'public', 21834, '[]', '[]', '[]', '[]', 1, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(56, 'App\\Models\\User', 16, 'ae4c64c3-b417-4eba-ba53-1c3b2166b8e4', 'images', 'aboutSecimg3.d1f08a3a3f36cc95260f', 'aboutSecimg3.d1f08a3a3f36cc95260f.png', 'image/png', 'public', 'public', 16960, '[]', '[]', '[]', '[]', 2, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(57, 'App\\Models\\User', 16, 'bf2ab012-8d32-444b-b3ee-6771b8cd01e0', 'images', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 3, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(58, 'App\\Models\\User', 16, 'cccf5193-8c2c-4f89-9ce4-1a8d6ab4010e', 'images', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 4, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(59, 'App\\Models\\User', 16, '29018bab-ffbf-4e6b-9917-219a63b3df28', 'images', 'apex', 'apex.png', 'image/png', 'public', 'public', 8128, '[]', '[]', '[]', '[]', 5, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(60, 'App\\Models\\User', 16, 'e42e115d-d1e1-4d3b-8ef6-ab08bcf3c9d8', 'main_image', 'Caregiver-of-Philadelphia-Home-Care-Agency', 'Caregiver-of-Philadelphia-Home-Care-Agency.jpg', 'image/jpeg', 'public', 'public', 32482, '[]', '[]', '[]', '[]', 6, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(61, 'App\\Models\\User', 17, '33a1ad93-07cf-4a13-a485-6294dbecd35e', 'images', 'aboutSecimg2.7a2942ed08dc8ea7596e', 'aboutSecimg2.7a2942ed08dc8ea7596e.png', 'image/png', 'public', 'public', 21834, '[]', '[]', '[]', '[]', 1, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(62, 'App\\Models\\User', 17, '2af40d57-1341-4590-b1fc-424746be88c9', 'images', 'aboutSecimg3.d1f08a3a3f36cc95260f', 'aboutSecimg3.d1f08a3a3f36cc95260f.png', 'image/png', 'public', 'public', 16960, '[]', '[]', '[]', '[]', 2, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(63, 'App\\Models\\User', 17, 'e95c94f1-bb0c-4dd9-8e51-7ed2b68b9365', 'images', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 3, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(64, 'App\\Models\\User', 17, '7c2fcd67-5372-4272-99f2-6f3d7e0a6c59', 'images', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 4, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(65, 'App\\Models\\User', 17, '86e3afb2-3a57-4cc4-87d4-9b8caa5d07cb', 'images', 'apex', 'apex.png', 'image/png', 'public', 'public', 8128, '[]', '[]', '[]', '[]', 5, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(66, 'App\\Models\\User', 17, '916455be-9acb-44ea-9e3f-7441d402a016', 'main_image', 'Caregiver-of-Philadelphia-Home-Care-Agency', 'Caregiver-of-Philadelphia-Home-Care-Agency.jpg', 'image/jpeg', 'public', 'public', 32482, '[]', '[]', '[]', '[]', 6, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(67, 'App\\Models\\User', 18, '75d8b45d-4fe0-4097-bf66-851befdee279', 'images', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 1, '2024-10-25 02:58:40', '2024-10-25 02:58:40'),
(68, 'App\\Models\\User', 18, '7fd541bb-60bd-4152-bb78-dda1f434f7c7', 'images', 'insta-post2', 'insta-post2.jpg', 'image/jpeg', 'public', 'public', 3174706, '[]', '[]', '[]', '[]', 2, '2024-10-25 02:58:40', '2024-10-25 02:58:40'),
(69, 'App\\Models\\User', 18, '1ef645a9-c522-4191-8466-2c518dbbeaa1', 'main_image', 'insta-post1', 'insta-post1.jpg', 'image/jpeg', 'public', 'public', 1640652, '[]', '[]', '[]', '[]', 3, '2024-10-25 02:58:40', '2024-10-25 02:58:40'),
(70, 'App\\Models\\User', 19, 'e2594438-00da-4648-8f9c-324b3570d3dc', 'images', 'qrcode (1)', 'qrcode-(1).png', 'image/png', 'public', 'public', 4027, '[]', '[]', '[]', '[]', 1, '2024-10-25 09:17:13', '2024-10-25 09:17:13'),
(71, 'App\\Models\\User', 19, '6471ea37-e716-4e39-9c1e-db6cb4f99084', 'images', 'qrcode', 'qrcode.png', 'image/png', 'public', 'public', 4027, '[]', '[]', '[]', '[]', 2, '2024-10-25 09:17:13', '2024-10-25 09:17:13'),
(72, 'App\\Models\\User', 19, '1421ae58-f9fc-4408-bf23-e93a3e05c32b', 'images', 'WhatsApp Image 2024-10-15 at 5.50.58 PM', 'WhatsApp-Image-2024-10-15-at-5.50.58-PM.jpeg', 'image/jpeg', 'public', 'public', 204359, '[]', '[]', '[]', '[]', 3, '2024-10-25 09:17:13', '2024-10-25 09:17:13'),
(73, 'App\\Models\\User', 19, '0a9b1d0e-4930-4d24-a543-2fd347bb9fcf', 'images', 'WhatsApp Image 2024-10-15 at 5.46.55 PM (1)', 'WhatsApp-Image-2024-10-15-at-5.46.55-PM-(1).jpeg', 'image/jpeg', 'public', 'public', 24794, '[]', '[]', '[]', '[]', 4, '2024-10-25 09:17:13', '2024-10-25 09:17:13'),
(74, 'App\\Models\\User', 19, '53ad61d9-372f-441a-896c-a2b3cdc7c2d9', 'main_image', 'bannerimage', 'bannerimage.jpg', 'image/jpeg', 'public', 'public', 3602141, '[]', '[]', '[]', '[]', 5, '2024-10-25 09:17:13', '2024-10-25 09:17:13'),
(79, 'App\\Models\\User', 21, '0b8a0673-5c69-462e-8d41-0afefce72760', 'images', '1722015801_blackdaimond', '1722015801_blackdaimond.png', 'image/png', 'public', 'public', 33343, '[]', '[]', '[]', '[]', 1, '2024-10-25 12:34:47', '2024-10-25 12:34:47'),
(80, 'App\\Models\\User', 21, 'f9a27e74-0753-4abf-bd33-3440f2c25e98', 'images', 'About-min', 'About-min.png', 'image/png', 'public', 'public', 4857539, '[]', '[]', '[]', '[]', 2, '2024-10-25 12:34:47', '2024-10-25 12:34:47'),
(81, 'App\\Models\\User', 21, '293c1be6-ca91-4e52-9848-163bff8c4f66', 'images', 'aboutsec', 'aboutsec.png', 'image/png', 'public', 'public', 2088068, '[]', '[]', '[]', '[]', 3, '2024-10-25 12:34:47', '2024-10-25 12:34:47'),
(82, 'App\\Models\\User', 21, '0fb9e3c6-6d4a-46e0-a233-477d163c9b9a', 'main_image', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 4, '2024-10-25 12:34:47', '2024-10-25 12:34:47'),
(83, 'App\\Models\\User', 22, '47b9eab1-7c37-4503-bf2d-6a2c98b65a9a', 'main_image', '7', '7.png', 'image/png', 'public', 'public', 5070, '[]', '[]', '[]', '[]', 1, '2024-10-28 12:47:52', '2024-10-28 12:47:52'),
(84, 'App\\Models\\User', 23, 'dc58bf1a-22d0-4d9a-8248-3d7d93bdd6fb', 'images', '35540866', '35540866.jpg', 'image/jpeg', 'public', 'public', 104059, '[]', '[]', '[]', '[]', 1, '2024-10-28 14:48:52', '2024-10-28 14:48:52'),
(85, 'App\\Models\\User', 23, '4236478a-cd79-450f-b3c0-622047aa8b26', 'main_image', '35540866', '35540866.jpg', 'image/jpeg', 'public', 'public', 104059, '[]', '[]', '[]', '[]', 2, '2024-10-28 14:48:52', '2024-10-28 14:48:52'),
(86, 'App\\Models\\User', 24, '729ab5f7-5cc5-429b-be6c-c8d56ca78b07', 'images', '35540866', '35540866.jpg', 'image/jpeg', 'public', 'public', 104059, '[]', '[]', '[]', '[]', 1, '2024-10-28 14:55:39', '2024-10-28 14:55:39'),
(87, 'App\\Models\\User', 24, 'b3b91d5b-4095-4516-b58b-f93c6dfdc31c', 'main_image', '35540866', '35540866.jpg', 'image/jpeg', 'public', 'public', 104059, '[]', '[]', '[]', '[]', 2, '2024-10-28 14:55:39', '2024-10-28 14:55:39'),
(88, 'App\\Models\\User', 25, '062cc8be-44dc-4d75-adc4-22429bd88487', 'images', '35540866', '35540866.jpg', 'image/jpeg', 'public', 'public', 104059, '[]', '[]', '[]', '[]', 1, '2024-10-28 15:00:56', '2024-10-28 15:00:56'),
(89, 'App\\Models\\User', 25, '018e1f6c-91e9-45f2-8f9b-2578e6ac61bb', 'main_image', '35540866', '35540866.jpg', 'image/jpeg', 'public', 'public', 104059, '[]', '[]', '[]', '[]', 2, '2024-10-28 15:00:56', '2024-10-28 15:00:56'),
(134, 'App\\Models\\User', 26, '0734e185-5880-480a-9f17-e58487f288ca', 'images', 'Fit Muslimah Logo 3.0-08', 'Fit-Muslimah-Logo-3.0-08.png', 'image/png', 'public', 'public', 369403, '[]', '[]', '[]', '[]', 1, '2024-10-29 19:37:16', '2024-10-29 19:37:16'),
(135, 'App\\Models\\User', 26, '57bb893b-328c-4b23-a95a-99e6060c1557', 'images', 'Fit Muslimah Logo 3.0-07', 'Fit-Muslimah-Logo-3.0-07.png', 'image/png', 'public', 'public', 370512, '[]', '[]', '[]', '[]', 2, '2024-10-29 19:37:16', '2024-10-29 19:37:16'),
(136, 'App\\Models\\User', 26, '54aa1a06-db4a-4ecf-af84-cbe0b740c68f', 'images', 'Fit Muslimah Logo 3.0-06', 'Fit-Muslimah-Logo-3.0-06.png', 'image/png', 'public', 'public', 375793, '[]', '[]', '[]', '[]', 3, '2024-10-29 19:37:16', '2024-10-29 19:37:16'),
(137, 'App\\Models\\User', 26, 'b16a0a5c-c650-4b5e-ad00-4588bdc8b45c', 'images', 'Fit Muslimah Logo 3.0-05', 'Fit-Muslimah-Logo-3.0-05.png', 'image/png', 'public', 'public', 379402, '[]', '[]', '[]', '[]', 4, '2024-10-29 19:37:16', '2024-10-29 19:37:16'),
(138, 'App\\Models\\User', 27, 'aca52a71-81e1-49b4-94eb-f2860ebcb22e', 'images', 'Fit Muslimah Logo 3.0-08', 'Fit-Muslimah-Logo-3.0-08.png', 'image/png', 'public', 'public', 369403, '[]', '[]', '[]', '[]', 1, '2024-10-29 19:38:51', '2024-10-29 19:38:51'),
(139, 'App\\Models\\User', 27, '4553850f-a694-4e68-94c6-d685089d6595', 'images', 'Fit Muslimah Logo 3.0-07', 'Fit-Muslimah-Logo-3.0-07.png', 'image/png', 'public', 'public', 370512, '[]', '[]', '[]', '[]', 2, '2024-10-29 19:38:51', '2024-10-29 19:38:51'),
(140, 'App\\Models\\User', 27, 'e1c7efe9-c3ae-4bfc-880a-d6e81043bf8e', 'images', 'Fit Muslimah Logo 3.0-06', 'Fit-Muslimah-Logo-3.0-06.png', 'image/png', 'public', 'public', 375793, '[]', '[]', '[]', '[]', 3, '2024-10-29 19:38:51', '2024-10-29 19:38:51'),
(141, 'App\\Models\\User', 27, '2496ba5b-53c0-4b99-ad8b-52c3e7d4d96d', 'images', 'Fit Muslimah Logo 3.0-05', 'Fit-Muslimah-Logo-3.0-05.png', 'image/png', 'public', 'public', 379402, '[]', '[]', '[]', '[]', 4, '2024-10-29 19:38:51', '2024-10-29 19:38:51'),
(142, 'App\\Models\\User', 28, '76363473-40d2-4533-9702-2cae6a06504b', 'images', 'aboutSecimg3.d1f08a3a3f36cc95260f', 'aboutSecimg3.d1f08a3a3f36cc95260f.png', 'image/png', 'public', 'public', 16960, '[]', '[]', '[]', '[]', 1, '2024-10-30 12:23:42', '2024-10-30 12:23:42'),
(143, 'App\\Models\\User', 28, '0800cf58-0c3e-45e9-9ceb-e3bdf10726d8', 'images', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 2, '2024-10-30 12:23:42', '2024-10-30 12:23:42'),
(144, 'App\\Models\\User', 28, '686036ae-8e16-4f7b-999b-a902b4232bb7', 'images', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 3, '2024-10-30 12:23:42', '2024-10-30 12:23:42'),
(145, 'App\\Models\\User', 28, '84dab8ce-a7d0-4108-a718-f90a37c3fb72', 'main_image', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 4, '2024-10-30 12:23:42', '2024-10-30 12:23:42'),
(146, 'App\\Models\\User', 29, 'd758b521-8763-486b-bd8e-f7a06100e440', 'images', 'Fit Muslimah Logo 3.0-05', 'Fit-Muslimah-Logo-3.0-05.png', 'image/png', 'public', 'public', 379402, '[]', '[]', '[]', '[]', 1, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(147, 'App\\Models\\User', 29, '5fa7afba-8c28-4320-86d9-511b6c25bfb4', 'images', 'Fit Muslimah Logo 3.0-04', 'Fit-Muslimah-Logo-3.0-04.png', 'image/png', 'public', 'public', 287573, '[]', '[]', '[]', '[]', 2, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(148, 'App\\Models\\User', 29, 'b7032872-df1b-4cd9-ae96-3f81c3a66989', 'images', 'Fit Muslimah Logo 3.0-03', 'Fit-Muslimah-Logo-3.0-03.png', 'image/png', 'public', 'public', 291922, '[]', '[]', '[]', '[]', 3, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(149, 'App\\Models\\User', 29, '44534c65-c608-40a5-bff1-23c26e489dce', 'images', 'Fit Muslimah Logo 3.0-02', 'Fit-Muslimah-Logo-3.0-02.png', 'image/png', 'public', 'public', 321525, '[]', '[]', '[]', '[]', 4, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(150, 'App\\Models\\User', 29, '790235af-45ca-4d93-b237-0460538d1422', 'images', 'Fit Muslimah Logo 3.0-01', 'Fit-Muslimah-Logo-3.0-01.png', 'image/png', 'public', 'public', 322103, '[]', '[]', '[]', '[]', 5, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(151, 'App\\Models\\User', 29, '0512f885-d5f7-4e42-9a74-1b3bd149a47d', 'images', 'Ear Candy logo 5', 'Ear-Candy-logo-5.png', 'image/png', 'public', 'public', 34880, '[]', '[]', '[]', '[]', 6, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(152, 'App\\Models\\User', 29, '27121d75-9645-49fa-8e9f-4e5b73bf78b8', 'images', 'Ear Candy Logo 4', 'Ear-Candy-Logo-4.png', 'image/png', 'public', 'public', 34685, '[]', '[]', '[]', '[]', 7, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(153, 'App\\Models\\User', 29, 'e89ac277-3d53-4cf2-87c0-7209202fe5a3', 'images', 'Ear Candy Logo 3', 'Ear-Candy-Logo-3.png', 'image/png', 'public', 'public', 35118, '[]', '[]', '[]', '[]', 8, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(154, 'App\\Models\\User', 29, 'dd5f9dd5-2497-48bb-a2da-8a59acf449df', 'images', 'Ear Candy Logo 2', 'Ear-Candy-Logo-2.png', 'image/png', 'public', 'public', 34926, '[]', '[]', '[]', '[]', 9, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(155, 'App\\Models\\User', 29, 'acfc6855-7e38-495c-a43f-99ed78c92a7c', 'images', 'Ear Candy Logo 1', 'Ear-Candy-Logo-1.png', 'image/png', 'public', 'public', 34990, '[]', '[]', '[]', '[]', 10, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(156, 'App\\Models\\User', 29, '825aac64-3df4-4ae3-89ee-0035bf9926de', 'main_image', 'Fit Muslimah Logo 3.0-06', 'Fit-Muslimah-Logo-3.0-06.png', 'image/png', 'public', 'public', 375793, '[]', '[]', '[]', '[]', 11, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(157, 'App\\Models\\User', 30, '2cc2b745-5c3b-432a-82d3-d26c792ed5bc', 'images', 'Ear Candy Logo 4', 'Ear-Candy-Logo-4.png', 'image/png', 'public', 'public', 34685, '[]', '[]', '[]', '[]', 1, '2024-10-30 13:23:02', '2024-10-30 13:23:02'),
(158, 'App\\Models\\User', 30, 'fac51fa5-9c45-46ce-9054-bbdc260b6660', 'images', 'Ear Candy Logo 3', 'Ear-Candy-Logo-3.png', 'image/png', 'public', 'public', 35118, '[]', '[]', '[]', '[]', 2, '2024-10-30 13:23:02', '2024-10-30 13:23:02'),
(159, 'App\\Models\\User', 30, '62739e56-23fb-410d-9c97-9e6c7fbd3900', 'images', 'Ear Candy Logo 2', 'Ear-Candy-Logo-2.png', 'image/png', 'public', 'public', 34926, '[]', '[]', '[]', '[]', 3, '2024-10-30 13:23:02', '2024-10-30 13:23:02'),
(160, 'App\\Models\\User', 30, '286ac29c-ea60-4a06-b705-8964b28f34e8', 'images', 'Ear Candy Logo 1', 'Ear-Candy-Logo-1.png', 'image/png', 'public', 'public', 34990, '[]', '[]', '[]', '[]', 4, '2024-10-30 13:23:02', '2024-10-30 13:23:02'),
(161, 'App\\Models\\User', 30, 'e70ba927-1f22-418a-8d2f-51f8351714a9', 'main_image', 'man-png-30101', 'man-png-30101.png', 'image/png', 'public', 'public', 208686, '[]', '[]', '[]', '[]', 5, '2024-10-30 13:23:02', '2024-10-30 13:23:02'),
(162, 'App\\Models\\User', 31, '44cc4d04-0815-4d23-8c1f-1a8f50397cff', 'images', 'Ear Candy logo 5', 'Ear-Candy-logo-5.png', 'image/png', 'public', 'public', 34880, '[]', '[]', '[]', '[]', 1, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(163, 'App\\Models\\User', 31, 'a011956e-370c-4881-8d44-d2ce83803bbe', 'images', 'Ear Candy Logo 4', 'Ear-Candy-Logo-4.png', 'image/png', 'public', 'public', 34685, '[]', '[]', '[]', '[]', 2, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(164, 'App\\Models\\User', 31, 'b8b1602f-0ea9-4764-bca8-5dbecfe41410', 'images', 'Ear Candy Logo 3', 'Ear-Candy-Logo-3.png', 'image/png', 'public', 'public', 35118, '[]', '[]', '[]', '[]', 3, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(165, 'App\\Models\\User', 31, 'd4c78e50-2b63-4fa8-8b9b-503728027c57', 'images', 'Ear Candy Logo 2', 'Ear-Candy-Logo-2.png', 'image/png', 'public', 'public', 34926, '[]', '[]', '[]', '[]', 4, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(166, 'App\\Models\\User', 31, '2f0c7997-f680-4b31-a097-1e0a12519746', 'images', 'Ear Candy Logo 1', 'Ear-Candy-Logo-1.png', 'image/png', 'public', 'public', 34990, '[]', '[]', '[]', '[]', 5, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(167, 'App\\Models\\User', 31, '0d44da6b-c8b3-4bc5-872a-659115002c8e', 'main_image', 'man-png-30101', 'man-png-30101.png', 'image/png', 'public', 'public', 208686, '[]', '[]', '[]', '[]', 6, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(168, 'App\\Models\\User', 20, '61a3a74e-695d-4b83-94ab-95e1e19c5a72', 'main_image', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 11, '2024-10-31 15:24:57', '2024-10-31 15:24:57'),
(169, 'App\\Models\\User', 20, '8fecd3ee-73a9-44e7-9659-0da993470a39', 'images', 'aboutSecimg3.d1f08a3a3f36cc95260f', 'aboutSecimg3.d1f08a3a3f36cc95260f.png', 'image/png', 'public', 'public', 16960, '[]', '[]', '[]', '[]', 12, '2024-10-31 15:24:57', '2024-10-31 15:24:57'),
(170, 'App\\Models\\User', 20, 'a2a26849-375e-4cb4-b6c8-30f11356abe5', 'images', 'aboutusvect-removebg-preview', 'aboutusvect-removebg-preview.png', 'image/png', 'public', 'public', 214851, '[]', '[]', '[]', '[]', 13, '2024-10-31 15:24:57', '2024-10-31 15:24:57'),
(171, 'App\\Models\\User', 20, '7a7368e1-0104-4f1c-aef4-5ccb6d626d55', 'images', 'agriculture', 'agriculture.png', 'image/png', 'public', 'public', 7092, '[]', '[]', '[]', '[]', 14, '2024-10-31 15:24:57', '2024-10-31 15:24:57'),
(172, 'App\\Models\\User', 32, '3a165aac-569d-48ff-bde2-5e3385dd0857', 'images', 'logo 8', 'logo-8.jpg', 'image/jpeg', 'public', 'public', 1647018, '[]', '[]', '[]', '[]', 1, '2024-11-19 14:01:17', '2024-11-19 14:01:17'),
(173, 'App\\Models\\User', 32, '69727993-b2fd-4546-b060-3f9259a94c84', 'main_image', 'logo 1', 'logo-1.jpg', 'image/jpeg', 'public', 'public', 782121, '[]', '[]', '[]', '[]', 2, '2024-11-19 14:01:17', '2024-11-19 14:01:17'),
(174, 'App\\Models\\User', 33, 'b4d8b13b-6901-4c35-861d-7168fbad3e26', 'images', 'logo 8', 'logo-8.jpg', 'image/jpeg', 'public', 'public', 1647018, '[]', '[]', '[]', '[]', 1, '2024-11-19 14:02:48', '2024-11-19 14:02:48'),
(175, 'App\\Models\\User', 33, '4b7d2dfc-90fc-4938-9f08-ab8257b1c0d9', 'main_image', 'logo 1', 'logo-1.jpg', 'image/jpeg', 'public', 'public', 782121, '[]', '[]', '[]', '[]', 2, '2024-11-19 14:02:48', '2024-11-19 14:02:48'),
(209, 'App\\Models\\User', 37, 'f7acc652-325f-4e46-889a-bad2534790f9', 'images', '17192566409121', '17192566409121.webp', 'image/webp', 'public', 'public', 63852, '[]', '[]', '[]', '[]', 1, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(210, 'App\\Models\\User', 37, '6eb727c8-9ca9-4a68-ab2b-9979a58f5dc2', 'images', '17192566403293', '17192566403293.webp', 'image/webp', 'public', 'public', 96868, '[]', '[]', '[]', '[]', 2, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(211, 'App\\Models\\User', 37, '19e3b4c6-74af-4243-ae6d-b1974c51171a', 'images', '17192566408166', '17192566408166.webp', 'image/webp', 'public', 'public', 69286, '[]', '[]', '[]', '[]', 3, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(212, 'App\\Models\\User', 37, 'e3595a31-5e0d-4176-bd5e-392a0f620b5f', 'images', '17192566409631', '17192566409631.webp', 'image/webp', 'public', 'public', 59736, '[]', '[]', '[]', '[]', 4, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(213, 'App\\Models\\User', 37, 'cd947daa-b566-4701-80fa-c032909ded9c', 'images', '17192566409991', '17192566409991.webp', 'image/webp', 'public', 'public', 101334, '[]', '[]', '[]', '[]', 5, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(214, 'App\\Models\\User', 37, '52484ef9-a326-4fa5-a98b-c48bbaf3ecc6', 'images', '17192566407938', '17192566407938.webp', 'image/webp', 'public', 'public', 122668, '[]', '[]', '[]', '[]', 6, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(215, 'App\\Models\\User', 37, '524d8ea1-82b1-41f2-bdb0-c12bc793150a', 'images', '17192566408267', '17192566408267.webp', 'image/webp', 'public', 'public', 58176, '[]', '[]', '[]', '[]', 7, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(216, 'App\\Models\\User', 37, '53a58507-58a6-4460-91ab-78d9166d23e4', 'main_image', 'start', 'start.webp', 'image/webp', 'public', 'public', 80890, '[]', '[]', '[]', '[]', 8, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(217, 'App\\Models\\User', 38, 'ecc039b3-3828-49ef-90bc-14e7d6a4f8b9', 'images', 'Escort__bctkc_big', 'Escort__bctkc_big.jpg', 'image/jpeg', 'public', 'public', 206786, '[]', '[]', '[]', '[]', 1, '2024-11-22 18:06:32', '2024-11-22 18:06:32'),
(218, 'App\\Models\\User', 38, 'eee17849-f8c2-49df-a89e-dc8217954231', 'images', 'Escort__fouok_big', 'Escort__fouok_big.jpg', 'image/jpeg', 'public', 'public', 63684, '[]', '[]', '[]', '[]', 2, '2024-11-22 18:06:32', '2024-11-22 18:06:32'),
(219, 'App\\Models\\User', 38, 'e0d6f71c-d9ec-4d1c-b3fc-f03861b7d7bd', 'main_image', 'Start', 'Start.jpg', 'image/jpeg', 'public', 'public', 47495, '[]', '[]', '[]', '[]', 3, '2024-11-22 18:06:32', '2024-11-22 18:06:32'),
(220, 'App\\Models\\User', 39, '830fd30e-6de7-4076-b4b7-8edd96b23bd2', 'main_image', '8', '8.png', 'image/png', 'public', 'public', 2305296, '[]', '[]', '[]', '[]', 1, '2024-11-22 23:12:21', '2024-11-22 23:12:21'),
(228, 'App\\Models\\User', 35, '33678f34-32ec-4563-8052-c19b43dbc95a', 'main_image', 'wp7346279', 'wp7346279.webp', 'image/webp', 'public', 'public', 462230, '[]', '[]', '[]', '[]', 3, '2024-11-24 19:11:07', '2024-11-24 19:11:07'),
(229, 'App\\Models\\User', 35, '620a6072-656d-42f3-bc83-06a77e3f1e39', 'images', 'icon', 'icon.ico', 'image/vnd.microsoft.icon', 'public', 'public', 255614, '[]', '[]', '[]', '[]', 4, '2024-11-24 19:12:23', '2024-11-24 19:12:23'),
(230, 'App\\Models\\User', 35, 'c2510c7d-bdc5-4046-81bb-ef4d88949d65', 'images', 'icon', 'icon.png', 'image/png', 'public', 'public', 50460, '[]', '[]', '[]', '[]', 5, '2024-11-24 19:12:23', '2024-11-24 19:12:23'),
(233, 'App\\Models\\Testimonial', 2, '5d92b1ff-9254-4747-9baf-01f07619ecfb', 'image', 'wp7346279', 'wp7346279.webp', 'image/webp', 'public', 'public', 462230, '[]', '[]', '[]', '[]', 1, '2024-11-24 20:27:42', '2024-11-24 20:27:42'),
(235, 'App\\Models\\Testimonial', 1, '89511297-8da6-44dc-ac40-be2634e11c21', 'image', 'wp', 'wp.webp', 'image/webp', 'public', 'public', 462230, '[]', '[]', '[]', '[]', 1, '2024-11-25 08:19:57', '2024-11-25 08:19:57'),
(236, 'App\\Models\\Testimonial', 3, '90b352b0-2508-4b88-9beb-eb9d8a522f0a', 'image', 'wp', 'wp.webp', 'image/webp', 'public', 'public', 462230, '[]', '[]', '[]', '[]', 1, '2024-11-25 08:20:05', '2024-11-25 08:20:05'),
(237, 'App\\Models\\User', 40, '0ff16af9-9792-4853-a158-762a231903c1', 'main_image', 'logo', 'logo.png', 'image/png', 'public', 'public', 215351, '[]', '[]', '[]', '[]', 1, '2024-12-11 20:17:32', '2024-12-11 20:17:32'),
(238, 'App\\Models\\User', 41, 'da4353ab-99da-43d3-bcd2-3553077a3513', 'images', 'Rectangle 14', 'Rectangle-14.png', 'image/png', 'public', 'public', 77712, '[]', '[]', '[]', '[]', 1, '2024-12-11 21:09:58', '2024-12-11 21:09:58'),
(239, 'App\\Models\\User', 41, '92b17ba4-70b8-418a-9e93-6de145f1420c', 'images', 'Rectangle 518', 'Rectangle-518.png', 'image/png', 'public', 'public', 126374, '[]', '[]', '[]', '[]', 2, '2024-12-11 21:09:58', '2024-12-11 21:09:58'),
(240, 'App\\Models\\User', 41, '206b2196-f99b-4459-952d-7a99ff3a53da', 'images', 'Rectangle 520', 'Rectangle-520.png', 'image/png', 'public', 'public', 432870, '[]', '[]', '[]', '[]', 3, '2024-12-11 21:09:58', '2024-12-11 21:09:58'),
(241, 'App\\Models\\User', 41, '0b459279-16db-41b4-93ae-c17c3d8021e5', 'main_image', 'Rectangle 15', 'Rectangle-15.png', 'image/png', 'public', 'public', 318031, '[]', '[]', '[]', '[]', 4, '2024-12-11 21:09:58', '2024-12-11 21:09:58'),
(242, 'App\\Models\\User', 42, '8acf8fe1-264a-42d3-88e1-578917b41945', 'images', '2', '2.png', 'image/png', 'public', 'public', 1265047, '[]', '[]', '[]', '[]', 1, '2024-12-12 09:57:41', '2024-12-12 09:57:41'),
(243, 'App\\Models\\User', 42, '4413a8c7-fa89-4fdf-a776-2337ec897fae', 'main_image', '2', '2.png', 'image/png', 'public', 'public', 1265047, '[]', '[]', '[]', '[]', 2, '2024-12-12 09:57:41', '2024-12-12 09:57:41'),
(244, 'App\\Models\\User', 43, '46f7621d-9751-4ecc-b87c-ced1d26f641c', 'images', 'about', 'about.png', 'image/png', 'public', 'public', 947984, '[]', '[]', '[]', '[]', 1, '2024-12-12 20:27:36', '2024-12-12 20:27:36'),
(245, 'App\\Models\\User', 43, '17057142-f782-488a-83e0-b392a0983b90', 'images', 'about_bg_2 1', 'about_bg_2-1.png', 'image/png', 'public', 'public', 797055, '[]', '[]', '[]', '[]', 2, '2024-12-12 20:27:36', '2024-12-12 20:27:36'),
(246, 'App\\Models\\User', 43, '41e8a01a-7167-4d9e-b0de-cc93adc186a5', 'images', 'blockquote-bg 1', 'blockquote-bg-1.png', 'image/png', 'public', 'public', 738636, '[]', '[]', '[]', '[]', 3, '2024-12-12 20:27:36', '2024-12-12 20:27:36'),
(248, 'App\\Models\\User', 43, '493de373-1115-456e-b6cf-2b4017e91cfd', 'main_image', 'card2', 'card2.png', 'image/png', 'public', 'public', 133995, '[]', '[]', '[]', '[]', 4, '2024-12-12 20:54:27', '2024-12-12 20:54:27'),
(249, 'App\\Models\\User', 43, 'b52539a7-1902-4cba-928d-94f35e487d6f', 'images', 'booking', 'booking.webp', 'image/webp', 'public', 'public', 264392, '[]', '[]', '[]', '[]', 5, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(250, 'App\\Models\\User', 43, 'effc1f9d-307c-422e-90f0-1d5f68f5eb60', 'images', 'card1', 'card1.png', 'image/png', 'public', 'public', 100322, '[]', '[]', '[]', '[]', 6, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(251, 'App\\Models\\User', 43, '97d0209c-0c84-4425-ad39-4918355870c5', 'images', 'card2', 'card2.png', 'image/png', 'public', 'public', 133995, '[]', '[]', '[]', '[]', 7, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(252, 'App\\Models\\User', 43, 'db85c19b-4882-4c8e-8f91-5dd52116431d', 'images', 'card3', 'card3.png', 'image/png', 'public', 'public', 69038, '[]', '[]', '[]', '[]', 8, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(253, 'App\\Models\\User', 43, 'd24f482b-dc38-401d-bbda-e63cc41db4fa', 'images', 'card4', 'card4.png', 'image/png', 'public', 'public', 142894, '[]', '[]', '[]', '[]', 9, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(254, 'App\\Models\\User', 43, '75ffd391-b910-43d0-86d0-eb0ead5b738a', 'images', 'card5', 'card5.png', 'image/png', 'public', 'public', 105492, '[]', '[]', '[]', '[]', 10, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(255, 'App\\Models\\User', 43, '7a6e0c0f-559e-443f-bdb1-0ca70df48be4', 'images', 'Rectangle 14', 'Rectangle-14.png', 'image/png', 'public', 'public', 77712, '[]', '[]', '[]', '[]', 11, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(256, 'App\\Models\\User', 43, 'a5f07da1-a521-44a2-bfcd-9a8b9fef5588', 'images', 'Rectangle 15', 'Rectangle-15.png', 'image/png', 'public', 'public', 318031, '[]', '[]', '[]', '[]', 12, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(257, 'App\\Models\\User', 43, '66057064-51d2-492d-a7bd-24fe8c687167', 'images', 'Rectangle 518', 'Rectangle-518.png', 'image/png', 'public', 'public', 126374, '[]', '[]', '[]', '[]', 13, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(258, 'App\\Models\\User', 43, '59ef2697-0d6f-4168-9a14-061e6dfe4c6d', 'images', 'Rectangle 520', 'Rectangle-520.png', 'image/png', 'public', 'public', 432870, '[]', '[]', '[]', '[]', 14, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(263, 'App\\Models\\User', 44, '0b4422da-8f51-49c3-895e-5072e6f43ce5', 'main_image', '2', '2.png', 'image/png', 'public', 'public', 1265047, '[]', '[]', '[]', '[]', 5, '2024-12-13 06:48:41', '2024-12-13 06:48:41'),
(268, 'App\\Models\\User', 44, '17ef5bd8-476d-4c58-b1c3-29dfa391ab59', 'videos', '531369_Dawn_Harbour_1280x720 (1)', '531369_Dawn_Harbour_1280x720-(1).mp4', 'video/mp4', 'public', 'public', 5164638, '[]', '[]', '[]', '[]', 6, '2024-12-13 07:48:42', '2024-12-13 07:48:42'),
(270, 'App\\Models\\User', 45, 'c5f35a63-6223-4a8c-876e-64e500bbe721', 'images', '1', '1.jpeg', 'image/webp', 'public', 'public', 20930, '[]', '[]', '[]', '[]', 1, '2024-12-13 15:52:36', '2024-12-13 15:52:36'),
(271, 'App\\Models\\User', 45, 'd29d500a-0407-462e-9509-0266f400bd71', 'main_image', '2', '2.jpeg', 'image/webp', 'public', 'public', 117436, '[]', '[]', '[]', '[]', 2, '2024-12-13 15:52:37', '2024-12-13 15:52:37'),
(272, 'App\\Models\\User', 45, '44d4b5b4-4873-4df5-b0ad-8fa7d766e883', 'videos', 'big_buck_bunny_720p_5mb', 'big_buck_bunny_720p_5mb.mp4', 'video/mp4', 'public', 'public', 5253880, '[]', '[]', '[]', '[]', 3, '2024-12-13 15:52:37', '2024-12-13 15:52:37'),
(273, 'App\\Models\\User', 45, '59c4fce9-99eb-46d9-83be-5dc89f4ee0c7', 'images', '2', '2.jpeg', 'image/webp', 'public', 'public', 117436, '[]', '[]', '[]', '[]', 4, '2024-12-13 16:02:08', '2024-12-13 16:02:08'),
(274, 'App\\Models\\User', 45, 'fa95dc17-7745-4d0c-93a4-5e90319b26a8', 'images', '3', '3.jpeg', 'image/webp', 'public', 'public', 134166, '[]', '[]', '[]', '[]', 5, '2024-12-13 16:02:08', '2024-12-13 16:02:08'),
(275, 'App\\Models\\User', 45, '48eae51b-e686-47d5-bc91-8a1c02c4b4df', 'images', '4', '4.jpeg', 'image/webp', 'public', 'public', 151174, '[]', '[]', '[]', '[]', 6, '2024-12-13 16:02:08', '2024-12-13 16:02:08'),
(280, 'App\\Models\\User', 47, '2c17afdb-70ae-433a-8469-fd9b8f40bf73', 'images', 'Mary1', 'Mary1.jpg', 'image/jpeg', 'public', 'public', 144093, '[]', '[]', '[]', '[]', 1, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(281, 'App\\Models\\User', 47, 'cddfc2eb-a935-445c-96ee-c41e27c5b2dc', 'main_image', 'Mary2', 'Mary2.jpg', 'image/jpeg', 'public', 'public', 221966, '[]', '[]', '[]', '[]', 2, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(286, 'App\\Models\\User', 49, 'a88c8796-5d66-4198-813a-851a0e526a5c', 'images', 'Katy2', 'Katy2.jpg', 'image/jpeg', 'public', 'public', 136601, '[]', '[]', '[]', '[]', 1, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(287, 'App\\Models\\User', 49, 'ba98b7cb-94a8-4778-adad-ac26cd0fb7d4', 'main_image', 'Katy1', 'Katy1.jpg', 'image/jpeg', 'public', 'public', 130497, '[]', '[]', '[]', '[]', 2, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(288, 'App\\Models\\User', 44, 'c8f2c852-f4d4-422c-9e7d-b5077233c741', 'images', 'Rectangle 14', 'Rectangle-14.png', 'image/png', 'public', 'public', 77712, '[]', '[]', '[]', '[]', 8, '2024-12-18 10:09:58', '2024-12-18 10:09:58'),
(289, 'App\\Models\\User', 44, '614fcb9e-3904-4d8b-95f5-f5010e08811f', 'images', 'Rectangle 15', 'Rectangle-15.png', 'image/png', 'public', 'public', 318031, '[]', '[]', '[]', '[]', 9, '2024-12-18 10:09:58', '2024-12-18 10:09:58'),
(290, 'App\\Models\\User', 44, '3a731cd7-1b7d-47d0-ba68-fc91f5dab46f', 'images', 'Rectangle 518', 'Rectangle-518.png', 'image/png', 'public', 'public', 126374, '[]', '[]', '[]', '[]', 10, '2024-12-18 10:09:58', '2024-12-18 10:09:58'),
(291, 'App\\Models\\User', 44, '2adc4158-8f1d-46eb-be54-4bf6886fb578', 'images', 'Rectangle 520', 'Rectangle-520.png', 'image/png', 'public', 'public', 432870, '[]', '[]', '[]', '[]', 11, '2024-12-18 10:09:58', '2024-12-18 10:09:58'),
(292, 'App\\Models\\User', 44, '11f1bb94-8424-43ed-9845-e8b30288559f', 'images', 'Rectangle 1687', 'Rectangle-1687.png', 'image/png', 'public', 'public', 206504, '[]', '[]', '[]', '[]', 12, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(293, 'App\\Models\\User', 44, '80b80a62-8839-4417-9fd3-9f3ece4a6dee', 'images', 'Rectangle 1688', 'Rectangle-1688.png', 'image/png', 'public', 'public', 153056, '[]', '[]', '[]', '[]', 13, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(294, 'App\\Models\\User', 44, '16b4c599-feeb-4307-afa0-07c561609ae9', 'images', 'Rectangle 1689', 'Rectangle-1689.png', 'image/png', 'public', 'public', 142147, '[]', '[]', '[]', '[]', 14, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(295, 'App\\Models\\User', 44, 'fe63a10e-2e83-444f-9341-770cf572119c', 'images', 'Rectangle 1690', 'Rectangle-1690.png', 'image/png', 'public', 'public', 104620, '[]', '[]', '[]', '[]', 15, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(296, 'App\\Models\\User', 44, '7b95b96b-9b44-4a77-bc41-5c665a3cf813', 'images', 'Rectangle 1691', 'Rectangle-1691.png', 'image/png', 'public', 'public', 153165, '[]', '[]', '[]', '[]', 16, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(325, 'App\\Models\\User', 46, 'bbac87e3-aba3-4ab5-a440-d28f27bc2194', 'main_image', 'Lindsay', 'Lindsay.jpg', 'image/jpeg', 'public', 'public', 160918, '[]', '[]', '[]', '[]', 5, '2024-12-20 14:12:27', '2024-12-20 14:12:27'),
(326, 'App\\Models\\User', 46, '79b377fc-9457-4e3d-9094-a0b703d8b82f', 'images', 'Lindsay1', 'Lindsay1.jpg', 'image/jpeg', 'public', 'public', 134735, '[]', '[]', '[]', '[]', 6, '2024-12-20 14:12:27', '2024-12-20 14:12:27'),
(327, 'App\\Models\\User', 46, '487a959c-149b-4b26-b103-aaac8f52757f', 'images', 'Lindsay2', 'Lindsay2.jpg', 'image/jpeg', 'public', 'public', 167597, '[]', '[]', '[]', '[]', 7, '2024-12-20 14:12:27', '2024-12-20 14:12:27'),
(328, 'App\\Models\\User', 46, 'f4a70645-ae51-407b-b716-eec0629a7a0e', 'images', 'Lindsay3', 'Lindsay3.jpg', 'image/jpeg', 'public', 'public', 146175, '[]', '[]', '[]', '[]', 8, '2024-12-20 14:12:27', '2024-12-20 14:12:27'),
(330, 'App\\Models\\User', 48, 'f91a2259-72d8-44b1-a73b-bc3e6d3f8188', 'images', 'Vanessa1', 'Vanessa1.jpg', 'image/jpeg', 'public', 'public', 182877, '[]', '[]', '[]', '[]', 6, '2024-12-20 14:19:03', '2024-12-20 14:19:03'),
(331, 'App\\Models\\User', 48, '3414fa68-49ea-4389-ae9b-c26ba60edd47', 'images', 'Vanessa2', 'Vanessa2.jpg', 'image/jpeg', 'public', 'public', 238563, '[]', '[]', '[]', '[]', 7, '2024-12-20 14:19:03', '2024-12-20 14:19:03'),
(332, 'App\\Models\\User', 48, '586eee36-761a-4fc3-acb4-6ca4195674ce', 'images', 'Vanessa3', 'Vanessa3.jpg', 'image/jpeg', 'public', 'public', 216732, '[]', '[]', '[]', '[]', 8, '2024-12-20 14:19:03', '2024-12-20 14:19:03'),
(340, 'App\\Models\\User', 48, '76e1337b-a528-42c3-ad6d-6b0e56df32f7', 'main_image', 'Vanessa', 'Vanessa.jpg', 'image/jpeg', 'public', 'public', 215936, '[]', '[]', '[]', '[]', 9, '2024-12-20 14:23:37', '2024-12-20 14:23:37'),
(341, 'App\\Models\\User', 48, '1374caa7-334a-42ce-8b90-5e7ae16ede1d', 'main_image', 'Vanessa', 'Vanessa.jpg', 'image/jpeg', 'public', 'public', 215936, '[]', '[]', '[]', '[]', 10, '2024-12-20 14:23:37', '2024-12-20 14:23:37'),
(342, 'App\\Models\\User', 50, '804fa8a1-198e-4f2c-9aca-c0e2874116a7', 'main_image', 'Liza6', 'Liza6.jpg', 'image/jpeg', 'public', 'public', 22607, '[]', '[]', '[]', '[]', 8, '2024-12-20 14:33:24', '2024-12-20 14:33:24'),
(343, 'App\\Models\\User', 50, 'f8dbb49c-8070-440b-9cc6-65c9670c82a0', 'images', 'Liza4', 'Liza4.jpg', 'image/jpeg', 'public', 'public', 41500, '[]', '[]', '[]', '[]', 9, '2024-12-20 14:33:24', '2024-12-20 14:33:24'),
(348, 'App\\Models\\User', 50, '817b9581-06be-474c-95ae-11918c9a32f0', 'images', 'Liza2', 'Liza2.jpg', 'image/jpeg', 'public', 'public', 84089, '[]', '[]', '[]', '[]', 14, '2024-12-20 14:44:39', '2024-12-20 14:44:39'),
(349, 'App\\Models\\User', 50, '17d001f7-7465-45cb-8b2b-e1061fb2322f', 'images', 'Liza5', 'Liza5.jpg', 'image/jpeg', 'public', 'public', 46719, '[]', '[]', '[]', '[]', 15, '2024-12-20 14:44:39', '2024-12-20 14:44:39'),
(350, 'App\\Models\\User', 51, '5c7f3f80-61a0-48e5-be63-725a5b315d8f', 'main_image', 'Tina', 'Tina.jpg', 'image/jpeg', 'public', 'public', 35223, '[]', '[]', '[]', '[]', 6, '2024-12-20 14:50:13', '2024-12-20 14:50:13'),
(351, 'App\\Models\\User', 51, '5b9cee8d-a078-45f5-9290-b3c1858817db', 'images', 'Tina2', 'Tina2.jpg', 'image/jpeg', 'public', 'public', 129748, '[]', '[]', '[]', '[]', 7, '2024-12-20 14:50:13', '2024-12-20 14:50:13'),
(352, 'App\\Models\\User', 51, '61307972-8451-4d76-8cd3-b51b47bfe697', 'images', 'Tina3', 'Tina3.jpg', 'image/jpeg', 'public', 'public', 160705, '[]', '[]', '[]', '[]', 8, '2024-12-20 14:50:13', '2024-12-20 14:50:13'),
(353, 'App\\Models\\User', 51, '62d27bc0-dd9b-426f-a5de-951331488e5b', 'images', 'Tina4', 'Tina4.jpg', 'image/jpeg', 'public', 'public', 50710, '[]', '[]', '[]', '[]', 9, '2024-12-20 14:50:13', '2024-12-20 14:50:13'),
(354, 'App\\Models\\User', 52, 'aec63e69-0868-4529-8540-bcb6b024b6e7', 'main_image', 'Kitty', 'Kitty.jpg', 'image/jpeg', 'public', 'public', 41581, '[]', '[]', '[]', '[]', 9, '2024-12-20 14:59:47', '2024-12-20 14:59:47'),
(355, 'App\\Models\\User', 52, 'd7946749-1e7a-4b18-9e5b-d48b84877aa9', 'images', 'Kitty1', 'Kitty1.jpg', 'image/jpeg', 'public', 'public', 31363, '[]', '[]', '[]', '[]', 10, '2024-12-20 14:59:47', '2024-12-20 14:59:47'),
(356, 'App\\Models\\User', 52, '7c370797-fb3e-424a-813f-9c356f3a3a58', 'images', 'Kitty2', 'Kitty2.jpg', 'image/jpeg', 'public', 'public', 46525, '[]', '[]', '[]', '[]', 11, '2024-12-20 14:59:47', '2024-12-20 14:59:47'),
(358, 'App\\Models\\User', 53, '4c5714b1-b1ac-47f5-b9bd-f1c13fb7c2b3', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 10, '2024-12-20 15:27:16', '2024-12-20 15:27:16'),
(359, 'App\\Models\\User', 53, 'c131f31e-7b5e-4cc1-92e2-b52e3a571b98', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 11, '2024-12-20 15:27:16', '2024-12-20 15:27:16'),
(361, 'App\\Models\\User', 53, '5251e974-30d3-4fd0-95dc-d9dafbde522e', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 13, '2024-12-20 15:27:47', '2024-12-20 15:27:47');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(363, 'App\\Models\\User', 53, '9b885409-d8ed-416f-9358-32b8615373c2', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 15, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(364, 'App\\Models\\User', 53, 'c7949878-803c-4826-bf8c-d6c33e4ea1c6', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 16, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(365, 'App\\Models\\User', 53, 'f0a5462a-46c1-45c0-9171-19cc66119f12', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 17, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(367, 'App\\Models\\User', 53, 'e9340e74-0a86-4bd1-80af-16f73e5c63f9', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 19, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(368, 'App\\Models\\User', 53, '3676e471-21e8-4252-a788-c19264886518', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 20, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(369, 'App\\Models\\User', 53, '1f6b8fbd-3a10-4bcc-a369-8dc784e65491', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 21, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(371, 'App\\Models\\User', 53, '95441e94-44aa-45cc-ad7b-ac280efad456', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 23, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(372, 'App\\Models\\User', 53, '090f28a1-1f8a-4a9f-91e7-f15784a2dc02', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 24, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(373, 'App\\Models\\User', 53, '7be9af7e-5a3c-4d2b-a84f-3f0edfe80c50', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 25, '2024-12-20 15:29:15', '2024-12-20 15:29:15'),
(375, 'App\\Models\\User', 53, '66e760f0-7a77-48ea-92be-0b0c3e3e9120', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 27, '2024-12-20 15:29:38', '2024-12-20 15:29:38'),
(376, 'App\\Models\\User', 53, '06b957a8-94bc-4284-8832-c5753fdf1af8', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 28, '2024-12-20 15:29:38', '2024-12-20 15:29:38'),
(377, 'App\\Models\\User', 53, '20e42892-00cc-4f99-9b44-96624a14407a', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 29, '2024-12-20 15:29:38', '2024-12-20 15:29:38'),
(379, 'App\\Models\\User', 53, '790127b6-49b4-4b9e-a0f7-27546b2f1d79', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 31, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(380, 'App\\Models\\User', 53, '0fb7b25c-2107-41ee-8870-e83b45a937c4', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 32, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(381, 'App\\Models\\User', 53, 'a067e164-7542-4b8a-a320-938f094adda3', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 33, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(383, 'App\\Models\\User', 53, '8a41223d-cf53-4c29-baf7-e6bc6bdb0f08', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 35, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(384, 'App\\Models\\User', 53, '9cf77e7e-d45d-4af8-a3b6-b0c8c52e5dc8', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 36, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(385, 'App\\Models\\User', 53, 'baaef7c8-6f54-489b-abf2-2808a12c3f3c', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 37, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(387, 'App\\Models\\User', 53, '7514931b-709e-4675-8a70-3db1364b7edc', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 39, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(388, 'App\\Models\\User', 53, 'f240410c-47de-4471-aaae-6401a641d31c', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 40, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(389, 'App\\Models\\User', 53, '5ad21a91-1296-40c5-8d23-c641f2f2d475', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 41, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(391, 'App\\Models\\User', 53, 'ad85f032-256d-4a64-93c2-796f2f098411', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 43, '2024-12-20 15:29:40', '2024-12-20 15:29:40'),
(392, 'App\\Models\\User', 53, '97c07247-f9b7-4abf-b4e2-a1653a4592ce', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 44, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(393, 'App\\Models\\User', 53, '988fe389-b2ff-4755-8d63-5c0fed5c35f9', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 45, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(395, 'App\\Models\\User', 53, '3e4925dd-f207-4759-b87d-f2731c46539f', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 47, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(396, 'App\\Models\\User', 53, '95c952d9-b58e-4dc0-bea3-9b49ebba4d43', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 48, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(397, 'App\\Models\\User', 53, '3933f865-dc8e-4c0a-bbd4-8d8510105462', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 49, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(399, 'App\\Models\\User', 53, 'dde1848c-d569-4c88-9866-bd8af25ba22f', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 51, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(400, 'App\\Models\\User', 53, 'e7f4fbfb-8b13-45fe-acca-cb062994eb1f', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 52, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(401, 'App\\Models\\User', 53, '0ee08f08-126a-44de-ba6f-17e7b8060c1a', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 53, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(403, 'App\\Models\\User', 53, 'd2adad96-aa12-463a-bbd6-b6d774f7c00c', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 55, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(404, 'App\\Models\\User', 53, '7a22a71a-1412-47c8-b895-d3ceecc9dd03', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 56, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(405, 'App\\Models\\User', 53, 'e70c61f1-f960-476d-8e19-f5de6c0fcd09', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 57, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(407, 'App\\Models\\User', 53, 'eeed1f52-9205-41ac-b56b-daecb4ba6f0c', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 59, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(408, 'App\\Models\\User', 53, '8303a888-a2ad-4c5d-8e1e-849ae967b451', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 60, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(409, 'App\\Models\\User', 53, '5b02ba85-11d5-46b4-88ff-50482c47720f', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 61, '2024-12-20 15:29:41', '2024-12-20 15:29:41'),
(411, 'App\\Models\\User', 53, '855947b6-9671-402c-b714-352b1edf115f', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 63, '2024-12-20 15:29:43', '2024-12-20 15:29:43'),
(412, 'App\\Models\\User', 53, 'f2fd437c-53e5-4bb5-be30-941d62ec4ce7', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 64, '2024-12-20 15:29:43', '2024-12-20 15:29:43'),
(413, 'App\\Models\\User', 53, '8fb80192-ddbd-4803-9160-ee8335dc30e0', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 65, '2024-12-20 15:29:43', '2024-12-20 15:29:43'),
(414, 'App\\Models\\User', 53, 'd26ab54a-87e0-4784-a1ca-68b5193e26d4', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 66, '2024-12-20 15:29:43', '2024-12-20 15:29:43'),
(415, 'App\\Models\\User', 53, '4e24a618-ed5d-49e5-bf8a-3731305346bd', 'main_image', 'Mia4', 'Mia4.jpg', 'image/jpeg', 'public', 'public', 193509, '[]', '[]', '[]', '[]', 67, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(416, 'App\\Models\\User', 53, 'c79c3431-e5d4-415c-b0ff-51f37b4ce57c', 'images', 'Mia6', 'Mia6.jpg', 'image/jpeg', 'public', 'public', 104659, '[]', '[]', '[]', '[]', 68, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(417, 'App\\Models\\User', 53, '15017df3-366a-4fc4-8c2f-710e72ccce2a', 'images', 'Mia3', 'Mia3.jpg', 'image/jpeg', 'public', 'public', 44856, '[]', '[]', '[]', '[]', 69, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(418, 'App\\Models\\User', 53, '02601b02-d3f0-4f36-8980-60aa2b27aaf3', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 70, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(419, 'App\\Models\\User', 53, '8622af08-3225-412d-8666-c5120a4272d9', 'images', 'Mia2', 'Mia2.jpg', 'image/jpeg', 'public', 'public', 61355, '[]', '[]', '[]', '[]', 71, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(420, 'App\\Models\\User', 54, '7510c9d3-4e27-45ae-9e0b-5b2fdc7f17b2', 'images', 'Anna1', 'Anna1.jpg', 'image/jpeg', 'public', 'public', 76202, '[]', '[]', '[]', '[]', 1, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(421, 'App\\Models\\User', 54, 'b77c625b-7e0b-4d7a-a247-003a386e2441', 'main_image', 'Anna2', 'Anna2.jpg', 'image/jpeg', 'public', 'public', 110527, '[]', '[]', '[]', '[]', 2, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(422, 'App\\Models\\User', 55, 'f359a84c-aeb4-452d-aa13-66a0914e12bb', 'images', 'Luna2', 'Luna2.jpg', 'image/jpeg', 'public', 'public', 92396, '[]', '[]', '[]', '[]', 1, '2024-12-20 16:44:19', '2024-12-20 16:44:19'),
(423, 'App\\Models\\User', 55, '8a5431ac-00b9-4ff2-993d-c501b202fe12', 'main_image', 'Luna', 'Luna.jpg', 'image/jpeg', 'public', 'public', 117964, '[]', '[]', '[]', '[]', 2, '2024-12-20 16:44:19', '2024-12-20 16:44:19'),
(424, 'App\\Models\\User', 55, 'ce3178d0-a360-40f9-a670-bd4726defe89', 'images', 'Luna2', 'Luna2.jpg', 'image/jpeg', 'public', 'public', 92396, '[]', '[]', '[]', '[]', 3, '2024-12-20 16:45:53', '2024-12-20 16:45:53'),
(425, 'App\\Models\\Testimonial', 4, '5c14804d-bb00-4bbf-835b-f5b5ad1ffecb', 'image', '1', '1.png', 'image/png', 'public', 'public', 5266, '[]', '[]', '[]', '[]', 1, '2024-12-22 06:08:49', '2024-12-22 06:08:49'),
(426, 'App\\Models\\Testimonial', 5, '88985c75-a24c-4118-beab-ca96189ab519', 'image', 'wp7346279', 'wp7346279.webp', 'image/webp', 'public', 'public', 462230, '[]', '[]', '[]', '[]', 1, '2024-12-22 16:55:39', '2024-12-22 16:55:39'),
(427, 'App\\Models\\Testimonial', 6, '475fd423-1b0b-4590-b8e1-1ef1b8013e22', 'image', 'wp7346279', 'wp7346279.webp', 'image/webp', 'public', 'public', 462230, '[]', '[]', '[]', '[]', 1, '2024-12-22 16:56:04', '2024-12-22 16:56:04'),
(428, 'App\\Models\\User', 56, '5476cc15-8ed5-461b-8a54-fc6683863521', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 08:04:55', '2025-01-15 08:04:55'),
(429, 'App\\Models\\User', 56, '6960ee6c-626b-402a-ba59-0e303c677d79', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 08:04:56', '2025-01-15 08:04:56'),
(430, 'App\\Models\\User', 56, '6a66a146-2fe5-4d10-ad6f-1ec625edcb2a', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 08:04:56', '2025-01-15 08:04:56'),
(431, 'App\\Models\\User', 57, 'faeb40c3-1193-4af9-8b7f-d2ab012becd2', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(432, 'App\\Models\\User', 57, '567b8d3e-2a03-4aba-9bc1-413815a28c6b', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(433, 'App\\Models\\User', 57, 'e743896f-04b6-46b6-8c86-fb58cb98cfc2', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(434, 'App\\Models\\User', 58, '742862df-9b40-4509-8f09-95368effeb59', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(435, 'App\\Models\\User', 58, '74612090-b9f4-4e8e-815a-68870977f25c', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(436, 'App\\Models\\User', 58, '84bd55bd-15cf-4206-a449-9120356ba23c', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(437, 'App\\Models\\User', 59, 'd355d0c9-9e61-4297-8fc0-1718b9766725', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 08:10:40', '2025-01-15 08:10:40'),
(438, 'App\\Models\\User', 59, 'd216aea5-3b68-4cff-821a-7cb8450578ef', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 08:10:40', '2025-01-15 08:10:40'),
(439, 'App\\Models\\User', 59, '8b8fb2cc-89bf-4748-b7fc-8034dd5f1f51', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 08:10:40', '2025-01-15 08:10:40'),
(440, 'App\\Models\\User', 60, '7733a130-cbd9-43e5-a7d9-cf337973583d', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(441, 'App\\Models\\User', 60, '8d781a22-5838-41a5-be7b-7ab0f2aef50e', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(442, 'App\\Models\\User', 60, '37552b5f-ff30-4ac9-851b-73dc1eef84f9', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(443, 'App\\Models\\User', 62, '0f2cbed3-bd18-4bda-8661-d4888423d967', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(444, 'App\\Models\\User', 62, '6ee15259-343f-4638-97b2-2746c1a059d2', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(445, 'App\\Models\\User', 62, 'edc28d6c-18ec-4f7a-af53-0f61fed84420', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(446, 'App\\Models\\User', 64, '3fe5f6a6-e170-4f97-bdce-b2f03b099dde', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 09:03:05', '2025-01-15 09:03:05'),
(447, 'App\\Models\\User', 64, 'c8a29013-23cc-4cd7-9bcc-303ac96358d6', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 09:03:06', '2025-01-15 09:03:06'),
(448, 'App\\Models\\User', 64, '13e976b6-b83f-4ecc-996c-a625119ce5a7', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 09:03:06', '2025-01-15 09:03:06'),
(449, 'App\\Models\\User', 65, 'd71c4191-17e3-4313-af87-783937949b20', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-15 09:05:26', '2025-01-15 09:05:26'),
(450, 'App\\Models\\User', 65, 'e88f5dae-2d21-476c-afb4-a3eda9842e56', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-15 09:05:26', '2025-01-15 09:05:26'),
(451, 'App\\Models\\User', 65, 'e2691001-44d2-4039-9c73-61849a3b1a74', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-15 09:05:26', '2025-01-15 09:05:26'),
(452, 'App\\Models\\User', 67, '59eb4c7c-07fc-40aa-a5dc-b468591a7e0c', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(453, 'App\\Models\\User', 67, '09672c49-4b19-4ee9-ac1c-8d2a816244d5', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(454, 'App\\Models\\User', 67, 'dc09d45d-a15a-40d5-8993-b17de6d68880', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(455, 'App\\Models\\User', 68, '58fc2c42-e913-43ec-ad6c-32b42d36af2f', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-16 08:46:51', '2025-01-16 08:46:51'),
(456, 'App\\Models\\User', 68, 'e0cdf1de-3449-448c-9237-e8bb6a947051', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-16 08:46:51', '2025-01-16 08:46:51'),
(457, 'App\\Models\\User', 68, '0cdd504d-4aa3-4d98-a865-7ce19faaf560', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-16 08:46:51', '2025-01-16 08:46:51'),
(458, 'App\\Models\\User', 69, '6a0986ec-c1a8-4465-bde7-47daa310e08e', 'images', 'Screenshot 2024-12-12 11.06.16 PM', 'Screenshot-2024-12-12-11.06.16-PM.png', 'image/png', 'public', 'public', 136020, '[]', '[]', '[]', '[]', 1, '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(459, 'App\\Models\\User', 69, 'e4b2ef03-d214-4c63-ba9f-2691863975ce', 'main_image', 'image (7) (1)', 'image-(7)-(1).png', 'image/png', 'public', 'public', 1259516, '[]', '[]', '[]', '[]', 2, '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(460, 'App\\Models\\User', 69, '18b86fe6-0994-4f3a-8af7-2a3be3d48368', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(461, 'App\\Models\\User', 69, '97425440-8feb-4882-adeb-c69af1b7ed4a', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 4, '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(462, 'App\\Models\\User', 70, 'c18a72f5-7cfe-4a71-add1-374212270258', 'images', 'Screenshot 2024-12-10 3.06.38 PM', 'Screenshot-2024-12-10-3.06.38-PM.png', 'image/png', 'public', 'public', 323116, '[]', '[]', '[]', '[]', 1, '2025-01-20 10:06:25', '2025-01-20 10:06:25'),
(463, 'App\\Models\\User', 70, '95466fe2-bffe-4028-b4a6-8337f1b6b44b', 'main_image', '8d4482c73c6a659adcf07581a0d461b1', '8d4482c73c6a659adcf07581a0d461b1.jpg', 'image/jpeg', 'public', 'public', 34172, '[]', '[]', '[]', '[]', 2, '2025-01-20 10:06:25', '2025-01-20 10:06:25'),
(464, 'App\\Models\\User', 70, 'f8c91f3c-08eb-4d96-82b7-3197ecf7f164', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-20 10:06:25', '2025-01-20 10:06:25'),
(465, 'App\\Models\\User', 71, '09160137-a10b-4f13-9aa8-6b4c2778f44b', 'images', 'image (7)', 'image-(7).png', 'image/png', 'public', 'public', 2288872, '[]', '[]', '[]', '[]', 1, '2025-01-20 10:37:19', '2025-01-20 10:37:19'),
(466, 'App\\Models\\User', 71, '3cf56c8f-a352-4330-bdbf-886b440b5b07', 'main_image', 'image (7)', 'image-(7).png', 'image/png', 'public', 'public', 2288872, '[]', '[]', '[]', '[]', 2, '2025-01-20 10:37:19', '2025-01-20 10:37:19'),
(467, 'App\\Models\\User', 71, '2a3b7aa8-7990-41e1-b65c-3675317b5dd8', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-20 10:37:19', '2025-01-20 10:37:19'),
(468, 'App\\Models\\User', 72, '5a8db3f8-d9c1-4a90-9931-0e5010b7ab23', 'images', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 1, '2025-01-20 11:27:36', '2025-01-20 11:27:36'),
(469, 'App\\Models\\User', 72, 'c961422d-f6ee-45d0-acd8-87e779b3109e', 'main_image', 'Union', 'Union.png', 'image/png', 'public', 'public', 2447, '[]', '[]', '[]', '[]', 2, '2025-01-20 11:27:36', '2025-01-20 11:27:36'),
(470, 'App\\Models\\User', 72, '601b0b53-a384-46c5-b72b-ef122ed40928', 'videos', '6646588-hd_1080_1920_30fps', '6646588-hd_1080_1920_30fps.mp4', 'video/mp4', 'public', 'public', 2372976, '[]', '[]', '[]', '[]', 3, '2025-01-20 11:27:36', '2025-01-20 11:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_15_200608_create_otp_verifications_table', 1),
(6, '2024_10_15_201112_create_interests_table', 1),
(7, '2024_10_15_201213_create_user_interests_table', 1),
(8, '2024_10_15_203931_create_media_table', 1),
(9, '2024_10_19_120357_create_user_bookings_table', 1),
(10, '2025_01_22_193958_create_packages', 1),
(11, '2025_01_22_193958_create_user_Packages_table', 1),
(12, '2025_01_23_000001_create_enquiries_table', 1),
(13, '2025_01_23_000002_create_feedback_table', 1),
(14, '2025_01_23_000003_create_testimonials_table', 1),
(15, '2025_01_23_235036_create_payments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `otp_verifications`
--

CREATE TABLE `otp_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `expired_at` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp_verifications`
--

INSERT INTO `otp_verifications` (`id`, `user_id`, `code`, `expired_at`, `status`, `type`, `created_at`, `updated_at`) VALUES
(30, 35, '27252', '2024-11-21 23:44:05', 1, 0, '2024-11-20 18:44:05', '2024-11-20 18:45:08'),
(31, 35, '13680', '2024-11-23 13:08:04', 1, 1, '2024-11-22 08:08:04', '2024-11-22 08:08:57'),
(32, 36, '63337', '2024-11-23 22:20:44', 1, 0, '2024-11-22 17:20:44', '2024-11-22 17:21:51'),
(33, 37, '61528', '2024-11-23 22:44:08', 1, 0, '2024-11-22 17:43:18', '2024-11-22 17:44:34'),
(34, 38, '13949', '2024-11-23 23:06:32', 1, 0, '2024-11-22 18:06:32', '2024-11-22 18:06:57'),
(35, 39, '83784', '2024-11-24 04:12:21', 1, 0, '2024-11-22 23:12:21', '2024-11-22 23:12:21'),
(36, 40, '17093', '2024-12-13 01:17:48', 1, 0, '2024-12-11 20:17:32', '2024-12-11 20:18:38'),
(37, 41, '78331', '2024-12-13 02:16:36', 1, 0, '2024-12-11 21:09:58', '2024-12-11 21:16:55'),
(38, 42, '65592', '2024-12-13 14:57:41', 1, 0, '2024-12-12 09:57:41', '2024-12-12 09:58:25'),
(39, 43, '96368', '2024-12-14 01:27:36', 1, 0, '2024-12-12 20:27:36', '2024-12-12 20:28:05'),
(40, 44, '73246', '2024-12-14 11:48:41', 1, 0, '2024-12-13 06:48:41', '2024-12-13 06:49:25'),
(41, 45, '22341', '2024-12-14 20:52:37', 1, 0, '2024-12-13 15:52:37', '2024-12-13 15:53:12'),
(42, 46, '81081', '2024-12-18 11:23:04', 1, 0, '2024-12-17 06:23:04', '2024-12-17 06:24:35'),
(43, 47, '66576', '2024-12-21 19:14:32', 0, 0, '2024-12-17 07:24:04', '2024-12-20 14:14:32'),
(44, 48, '63036', '2024-12-18 16:08:28', 1, 0, '2024-12-17 11:03:52', '2024-12-17 11:08:46'),
(45, 49, '96365', '2024-12-18 21:34:55', 0, 0, '2024-12-17 16:28:18', '2024-12-17 16:34:55'),
(46, 46, '11340', '2024-12-18 21:38:15', 0, 1, '2024-12-17 16:38:15', '2024-12-17 16:38:15'),
(47, 50, '37933', '2024-12-21 16:49:05', 1, 0, '2024-12-20 11:49:05', '2024-12-20 11:49:44'),
(48, 51, '15086', '2024-12-21 17:13:01', 1, 0, '2024-12-20 12:13:01', '2024-12-20 12:13:39'),
(49, 52, '37058', '2024-12-21 17:33:26', 1, 0, '2024-12-20 12:33:26', '2024-12-20 12:34:40'),
(50, 53, '65417', '2024-12-21 18:45:27', 1, 0, '2024-12-20 13:45:27', '2024-12-20 13:45:49'),
(51, 54, '95982', '2024-12-21 20:44:42', 0, 0, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(52, 55, '92750', '2024-12-21 21:44:19', 1, 0, '2024-12-20 16:44:19', '2024-12-20 16:45:03'),
(53, 56, '95165', '2025-01-16 18:04:56', 0, 0, '2025-01-15 08:04:56', '2025-01-15 08:04:56'),
(54, 57, '17249', '2025-01-16 18:06:35', 0, 0, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(55, 58, '81114', '2025-01-16 18:08:11', 0, 0, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(56, 59, '57170', '2025-01-16 18:10:41', 0, 0, '2025-01-15 08:10:41', '2025-01-15 08:10:41'),
(57, 60, '46240', '2025-01-16 18:17:49', 0, 0, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(58, 61, '57604', '2025-01-16 18:19:15', 0, 0, '2025-01-15 08:19:15', '2025-01-15 08:19:15'),
(59, 62, '89356', '2025-01-16 18:20:23', 0, 0, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(60, 63, '89234', '2025-01-16 22:28:53', 0, 0, '2025-01-15 08:29:25', '2025-01-15 12:28:53'),
(61, 64, '35518', '2025-01-16 19:03:06', 0, 0, '2025-01-15 09:03:06', '2025-01-15 09:03:06'),
(62, 65, '16939', '2025-01-16 19:05:26', 0, 0, '2025-01-15 09:05:26', '2025-01-15 09:05:26'),
(63, 66, '32441', '2025-01-16 22:46:13', 1, 0, '2025-01-15 12:46:13', '2025-01-15 12:47:20'),
(64, 67, '32986', '2025-01-17 18:28:57', 0, 0, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(65, 68, '35331', '2025-01-17 18:46:51', 1, 0, '2025-01-16 08:46:51', '2025-01-16 08:47:40'),
(66, 69, '57548', '2025-01-21 20:03:10', 0, 0, '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(67, 70, '59601', '2025-01-21 20:06:25', 1, 0, '2025-01-20 10:06:25', '2025-01-20 10:07:44'),
(68, 71, '12568', '2025-01-21 20:37:19', 0, 0, '2025-01-20 10:37:19', '2025-01-20 10:37:19'),
(69, 72, '63449', '2025-01-21 21:27:36', 0, 0, '2025-01-20 11:27:36', '2025-01-20 11:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `description`, `price`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New', 'new Package', 20.00, 2, 1, '2024-10-28 09:01:57', '2024-11-24 20:31:35'),
(2, 'Premium', 'new Package', 20.00, 2, 1, '2024-11-24 20:31:15', '2024-11-24 20:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_package_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '6b0845cc10a38cc0c95ef675dc641ec21b744482eea983fb015684b48fd7848d', '[\"*\"]', NULL, NULL, '2024-10-15 11:01:36', '2024-10-15 11:01:36'),
(2, 'App\\Models\\User', 1, 'token', '3c0138298bae279065b55871b71105e7a75db4da9575c18d0c539681da7eb6c7', '[\"*\"]', '2024-10-19 02:52:08', NULL, '2024-10-19 02:22:16', '2024-10-19 02:52:08'),
(3, 'App\\Models\\User', 2, 'token', '75947ed45e2cabc019418d5308f539c33b15c0d62020160f0eee7326172c66d6', '[\"*\"]', NULL, NULL, '2024-10-24 06:17:11', '2024-10-24 06:17:11'),
(4, 'App\\Models\\User', 4, 'token', 'b1aa680114621e450168c26083a30da4c12adb88afa8036699f483c0df81a184', '[\"*\"]', NULL, NULL, '2024-10-24 06:32:39', '2024-10-24 06:32:39'),
(5, 'App\\Models\\User', 8, 'token', '9b1631ce2b3c4c633042bdb79acaac9010d78137fe2e4d213f28029cc15caed4', '[\"*\"]', NULL, NULL, '2024-10-24 06:40:56', '2024-10-24 06:40:56'),
(6, 'App\\Models\\User', 10, 'token', 'ec8ee30a170cc35be6ba0a88f2fb7bdb22d0fe4fdae36aad7c43b2d711848f98', '[\"*\"]', NULL, NULL, '2024-10-24 08:48:02', '2024-10-24 08:48:02'),
(7, 'App\\Models\\User', 11, 'token', '41a5181b7a8ab80c03d4ab431f80b19a558ea4075fb6343f5bdf22e9275c0a27', '[\"*\"]', NULL, NULL, '2024-10-24 09:44:57', '2024-10-24 09:44:57'),
(8, 'App\\Models\\User', 12, 'token', 'c89572bc67df28f6025cc42cb6119f33f95bba4c81b722fe3c15b128fae7f0c3', '[\"*\"]', NULL, NULL, '2024-10-24 09:45:30', '2024-10-24 09:45:30'),
(9, 'App\\Models\\User', 13, 'token', 'd3871f89b44a94c9cb588c755da6ad3db9352981881e0cca873386a8753bc0e2', '[\"*\"]', NULL, NULL, '2024-10-24 10:14:43', '2024-10-24 10:14:43'),
(10, 'App\\Models\\User', 14, 'token', '01bde0c6f8892e68e93c953ea70b74f0437373b15b5d07c9c64c83807521a560', '[\"*\"]', NULL, NULL, '2024-10-24 19:29:22', '2024-10-24 19:29:22'),
(11, 'App\\Models\\User', 15, 'token', 'ffcb69ff85355840eeea3fe7034a9ae3a35f7b9be9cf777629c391f73e4a89ef', '[\"*\"]', NULL, NULL, '2024-10-24 19:53:28', '2024-10-24 19:53:28'),
(12, 'App\\Models\\User', 16, 'token', '03ead69d0497d41ed161b943309f870e5a549998150bd641f37039714db59bb2', '[\"*\"]', NULL, NULL, '2024-10-24 20:21:32', '2024-10-24 20:21:32'),
(13, 'App\\Models\\User', 17, 'token', '8bcf1206d80acc7d4807f5cbee305a1b88567f4f3d6ab736393621af7eeb56ab', '[\"*\"]', NULL, NULL, '2024-10-24 20:29:45', '2024-10-24 20:29:45'),
(14, 'App\\Models\\User', 17, 'token', 'f64a790bc137d615b1d72847da7bfbebb2f3fe5dcff719d54652e19f985f5a27', '[\"*\"]', NULL, NULL, '2024-10-24 20:33:54', '2024-10-24 20:33:54'),
(15, 'App\\Models\\User', 17, 'token', 'c7f50454c49593abf49c5520f27fcf5b9c335e6276ad352a78bf23aa8ea86709', '[\"*\"]', NULL, NULL, '2024-10-24 20:36:30', '2024-10-24 20:36:30'),
(16, 'App\\Models\\User', 17, 'token', 'd9fb6e4b0880fe76205638220bb18af1be2d315ff2fb38bc5511b99093caa64a', '[\"*\"]', NULL, NULL, '2024-10-24 20:40:42', '2024-10-24 20:40:42'),
(17, 'App\\Models\\User', 17, 'token', '40c13147f26991f58351107bbb5a78e73f3afabd52b199dcddf1b6c42477c808', '[\"*\"]', NULL, NULL, '2024-10-24 20:55:56', '2024-10-24 20:55:56'),
(18, 'App\\Models\\User', 18, 'token', '83268a98cfd3639cfbce9a1719d7fd744a40c530ef1a3bc5547d0168bc8c57b1', '[\"*\"]', NULL, NULL, '2024-10-25 02:58:40', '2024-10-25 02:58:40'),
(19, 'App\\Models\\User', 18, 'token', '3b62c11f32a7d9764e731b6a3e3b7f6f4b96e1a94d46d98ff31010bf2a68b044', '[\"*\"]', NULL, NULL, '2024-10-25 03:00:09', '2024-10-25 03:00:09'),
(20, 'App\\Models\\User', 18, 'token', 'd9fc9f8e5147fc7174e47976952f398f93da81112ac78ba8266699187a19b23d', '[\"*\"]', '2024-10-25 06:32:23', NULL, '2024-10-25 03:09:11', '2024-10-25 06:32:23'),
(21, 'App\\Models\\User', 19, 'token', 'b269f4a1b8e53c68ec5664d62442659a2cdaa91f523362b9eb2d2bc9109dc14b', '[\"*\"]', NULL, NULL, '2024-10-25 09:17:13', '2024-10-25 09:17:13'),
(22, 'App\\Models\\User', 20, 'token', 'b3f65b2bf0ea06d4c4716f1209ae9f0c7f669d4478ff5e77f639b051b8921446', '[\"*\"]', NULL, NULL, '2024-10-25 09:41:35', '2024-10-25 09:41:35'),
(23, 'App\\Models\\User', 21, 'token', '25a3ded169e2ac2a0bce97182bf61192e6f909458d751eccb7a9a70574c44a78', '[\"*\"]', NULL, NULL, '2024-10-25 12:34:47', '2024-10-25 12:34:47'),
(24, 'App\\Models\\User', 21, 'token', '18d133e0845421b70e17e4cabc27813305a8017e02ecd14473fe7325b7c8a814', '[\"*\"]', NULL, NULL, '2024-10-25 12:39:48', '2024-10-25 12:39:48'),
(25, 'App\\Models\\User', 22, 'token', 'bb9371f6779c0bb49535f7f62f9319d77f2f26000b0391ab2c94d3fbc0658541', '[\"*\"]', NULL, NULL, '2024-10-28 12:47:52', '2024-10-28 12:47:52'),
(26, 'App\\Models\\User', 22, 'token', 'a3fa33899124f8151e1d9a2f9dd533b9b4229ef38ec0194d38897785ee3b45fe', '[\"*\"]', NULL, NULL, '2024-10-28 12:59:45', '2024-10-28 12:59:45'),
(27, 'App\\Models\\User', 23, 'token', '58cc441186696657239668d52e66e9ff66418ab03f25875144c87473c1045d38', '[\"*\"]', NULL, NULL, '2024-10-28 14:48:52', '2024-10-28 14:48:52'),
(28, 'App\\Models\\User', 24, 'token', '87de5467b437caaf57dcf8e8ff3a4ff060fa4857cb04fe23f894c606f63a26fa', '[\"*\"]', NULL, NULL, '2024-10-28 14:55:39', '2024-10-28 14:55:39'),
(29, 'App\\Models\\User', 25, 'token', '9dbf35483d0ae1119a37c26c717abae02feca6f7c3eeacacfff9387261b03346', '[\"*\"]', NULL, NULL, '2024-10-28 15:00:56', '2024-10-28 15:00:56'),
(30, 'App\\Models\\User', 25, 'token', 'de281ceace339dff7a14e7e3535b1de90aec6a152dba9deb65fd6a801fd8f89c', '[\"*\"]', NULL, NULL, '2024-10-28 15:02:15', '2024-10-28 15:02:15'),
(31, 'App\\Models\\User', 25, 'token', '2b6a1862798494ac9d8250d2a6777dfa3f95621b035891d9b1fdddf446b42fc0', '[\"*\"]', NULL, NULL, '2024-10-28 15:08:22', '2024-10-28 15:08:22'),
(32, 'App\\Models\\User', 20, 'token', 'c07487e0af803bea66d42c926210f8d36b551dba2bd7877a9658dc61f70c31b9', '[\"*\"]', NULL, NULL, '2024-10-28 15:42:14', '2024-10-28 15:42:14'),
(33, 'App\\Models\\User', 20, 'token', '8b47ed87d683677a2d8baca18374356df4516ecc14372b454b3833bd0aa4b642', '[\"*\"]', NULL, NULL, '2024-10-28 16:03:22', '2024-10-28 16:03:22'),
(34, 'App\\Models\\User', 22, 'token', 'b5f3b28019858449c78623f904fbb2b99799d38e17dbe3860a542fe3e1a9afcd', '[\"*\"]', '2024-10-28 17:24:44', NULL, '2024-10-28 17:23:45', '2024-10-28 17:24:44'),
(35, 'App\\Models\\User', 20, 'token', '2f4e38855d23385084e1d0a0fe57bc375da27f554ec0033d8faf291c5b5be6bc', '[\"*\"]', NULL, NULL, '2024-10-28 20:25:06', '2024-10-28 20:25:06'),
(36, 'App\\Models\\User', 20, 'token', 'c4ed74154858a1d5701379d14ad928714317537d9283040d8a7a3f56d22bc3c1', '[\"*\"]', NULL, NULL, '2024-10-28 20:37:49', '2024-10-28 20:37:49'),
(37, 'App\\Models\\User', 20, 'token', '53664477fec1deaea32ea512b40a2c28f2da841eccddb0025e180f560f8cac4d', '[\"*\"]', NULL, NULL, '2024-10-28 20:38:13', '2024-10-28 20:38:13'),
(38, 'App\\Models\\User', 20, 'token', '490c1df910dec6149c32bc56a205b1ef0fe636062c2001b8dd9dcf05bc580cda', '[\"*\"]', NULL, NULL, '2024-10-28 22:14:46', '2024-10-28 22:14:46'),
(39, 'App\\Models\\User', 20, 'token', '173055ec3fb9f3ab6f352972f9928a9eb9ed4f832501f16ba7f8a0856b4e4987', '[\"*\"]', NULL, NULL, '2024-10-28 22:30:14', '2024-10-28 22:30:14'),
(40, 'App\\Models\\User', 20, 'token', '5c14cebd26176e505206d1f0f1cbccfb293078c784304c26446d4aadb7586032', '[\"*\"]', '2024-10-29 08:37:04', NULL, '2024-10-29 05:59:18', '2024-10-29 08:37:04'),
(41, 'App\\Models\\User', 20, 'token', 'fc7d40e30ba84147a698d6800c5b9b9b1052cfcae3a4928e34ebe0e82d23d0b2', '[\"*\"]', '2024-10-29 11:21:09', NULL, '2024-10-29 10:36:53', '2024-10-29 11:21:09'),
(42, 'App\\Models\\User', 28, 'token', '8d63fdb29b6c4f68b5bda796613639554a527e086b4ff93df588c59ae9abf024', '[\"*\"]', NULL, NULL, '2024-10-30 12:23:42', '2024-10-30 12:23:42'),
(43, 'App\\Models\\User', 29, 'token', 'f9bc13e67bf0548f1bb4c4ba68570c5300fcc6c49525a0c163ffb2a89edc0c29', '[\"*\"]', NULL, NULL, '2024-10-30 13:13:43', '2024-10-30 13:13:43'),
(44, 'App\\Models\\User', 30, 'token', '8845f7d84ea80e8c971f7ec619abb9a52d9595615b271735ecaeb91f852b13c8', '[\"*\"]', NULL, NULL, '2024-10-30 13:23:02', '2024-10-30 13:23:02'),
(45, 'App\\Models\\User', 31, 'token', '6670af4abc93cb5a38170accf6fe8a9d08d4b1cf49b24c0890f50328673a5c72', '[\"*\"]', NULL, NULL, '2024-10-30 13:24:31', '2024-10-30 13:24:31'),
(46, 'App\\Models\\User', 31, 'token', 'e265b6820b2e00930a18743827bf6227aa355176e1907af166a30bfc66122867', '[\"*\"]', NULL, NULL, '2024-10-30 13:24:57', '2024-10-30 13:24:57'),
(47, 'App\\Models\\User', 31, 'token', '25739ddff0a09d11b84d0583d0a521e62d3f9f89e5c1a45b685f2d34b19b6e09', '[\"*\"]', NULL, NULL, '2024-10-30 13:26:48', '2024-10-30 13:26:48'),
(48, 'App\\Models\\User', 20, 'token', 'db5516bb01fcd05f5e6cd21ae73abae97d94212127bbc303e5f79d5733b5b1be', '[\"*\"]', '2024-10-31 15:24:57', NULL, '2024-10-31 15:24:38', '2024-10-31 15:24:57'),
(49, 'App\\Models\\User', 20, 'token', 'c9981314e8c694f8577e2cc610b81b27f483f73fa657587e3ad43f9369f14e67', '[\"*\"]', NULL, NULL, '2024-11-01 08:05:51', '2024-11-01 08:05:51'),
(50, 'App\\Models\\User', 32, 'token', '2f1e05a653e2ed21eb91938c2fd7405173254f4c4ac0a33c3e9796655553a065', '[\"*\"]', NULL, NULL, '2024-11-19 14:01:17', '2024-11-19 14:01:17'),
(51, 'App\\Models\\User', 33, 'token', '98060d7a1dcd9d71b75132b43da59564ad42fdff6574e2894b6e064928e7a8a1', '[\"*\"]', NULL, NULL, '2024-11-19 14:02:48', '2024-11-19 14:02:48'),
(52, 'App\\Models\\User', 33, 'token', 'a4772802d5e0d27ca3b3c50613872c71e6ee7a2390cd7da866c16030c7d36153', '[\"*\"]', NULL, NULL, '2024-11-19 14:03:38', '2024-11-19 14:03:38'),
(53, 'App\\Models\\User', 34, 'token', '0686f5a7c6d0a2e2e01970d5a530355026f828159420ad9e9d7f8702d9a440dc', '[\"*\"]', NULL, NULL, '2024-11-19 14:25:02', '2024-11-19 14:25:02'),
(54, 'App\\Models\\User', 34, 'token', '8d195464f2e1797226d1c52f04e46b00adc2c08437ce32c8ce4d40a161f67501', '[\"*\"]', NULL, NULL, '2024-11-19 14:25:46', '2024-11-19 14:25:46'),
(55, 'App\\Models\\User', 34, 'token', 'cef65bf365aaeb0e53d3e22986d4e1c9aeb8886557972aa99164b1fae673ca85', '[\"*\"]', '2024-11-19 14:36:23', NULL, '2024-11-19 14:35:53', '2024-11-19 14:36:23'),
(56, 'App\\Models\\User', 35, 'token', 'bc1591200717cd0260b2615d66c9519b7b05124a1dab57853235a00c78cd69f9', '[\"*\"]', NULL, NULL, '2024-11-20 18:44:05', '2024-11-20 18:44:05'),
(57, 'App\\Models\\User', 35, 'token', '4d36e4a2dd2568f20a8df6d040aed59aeaa129422d02c8b57a747556abad5216', '[\"*\"]', '2024-11-21 06:08:23', NULL, '2024-11-20 18:45:27', '2024-11-21 06:08:23'),
(58, 'App\\Models\\User', 35, 'token', '3a0de7f06f3db1cdfd1fc389540510a0eff1af80036aefe683bcf7398ba5c6ce', '[\"*\"]', '2024-11-20 21:08:58', NULL, '2024-11-20 21:07:04', '2024-11-20 21:08:58'),
(59, 'App\\Models\\User', 35, 'token', 'e7034f73dfaac2070bf5925425565ffdde9af630d2e01992ce25b58c74831c92', '[\"*\"]', '2024-11-21 22:50:11', NULL, '2024-11-21 22:46:59', '2024-11-21 22:50:11'),
(60, 'App\\Models\\User', 35, 'token', '50f1d9faafbbbf34532f20021bb46837a94db7ff86bb551ae81e39aa1b1204cf', '[\"*\"]', '2024-11-22 08:11:32', NULL, '2024-11-22 08:09:10', '2024-11-22 08:11:32'),
(61, 'App\\Models\\User', 36, 'token', '9f1352438ca26db617b7cb49c9792d8e512720a1fa14f8b822cf86a12e69cb32', '[\"*\"]', NULL, NULL, '2024-11-22 17:20:44', '2024-11-22 17:20:44'),
(62, 'App\\Models\\User', 36, 'token', '3284ead8ee23b357ccdf8063e47ad9e2986371662efc097cce8de1700e80613a', '[\"*\"]', '2024-11-22 17:25:29', NULL, '2024-11-22 17:21:54', '2024-11-22 17:25:29'),
(63, 'App\\Models\\User', 37, 'token', 'eb8d1fcbe95c89b5dfbbfe3f8ca1c255ec491981c78293c5ee4f0949ba505283', '[\"*\"]', NULL, NULL, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(64, 'App\\Models\\User', 37, 'token', '4f8ac286bc8014d108347bd1a273008c4fa93b226e2d3351982f0459f0827473', '[\"*\"]', NULL, NULL, '2024-11-22 17:44:36', '2024-11-22 17:44:36'),
(65, 'App\\Models\\User', 38, 'token', '2d559034d137c77019ca7f749a477e95576075d1113f196e68f32735a693bfd8', '[\"*\"]', NULL, NULL, '2024-11-22 18:06:32', '2024-11-22 18:06:32'),
(66, 'App\\Models\\User', 38, 'token', '9934c7847e373cd00f09d93dd738c3bb1d9f2fc43aac5d35671a4c90e54d7ada', '[\"*\"]', NULL, NULL, '2024-11-22 18:06:59', '2024-11-22 18:06:59'),
(67, 'App\\Models\\User', 39, 'token', 'c39d2d1e42a0cb5021c9ce0d9aee04ee106bae797800327000990f252b9de01f', '[\"*\"]', NULL, NULL, '2024-11-22 23:12:21', '2024-11-22 23:12:21'),
(68, 'App\\Models\\User', 39, 'token', '19010fa248ad0ee9d9ddc653a91425920dbeaae1e80dfa51ffaf0eaabfdda0de', '[\"*\"]', '2024-12-22 06:09:26', NULL, '2024-11-22 23:13:39', '2024-12-22 06:09:26'),
(69, 'App\\Models\\User', 39, 'token', '4757f46a6e2ee083cfeea84afa4c14ac651006a05b0eaf58db17acc864a25275', '[\"*\"]', NULL, NULL, '2024-11-22 23:17:38', '2024-11-22 23:17:38'),
(70, 'App\\Models\\User', 39, 'token', '18ac5c6dbc51c9d69379cb8d2695b69c10ac9afb2f0818865d069ef987e56657', '[\"*\"]', NULL, NULL, '2024-11-22 23:18:20', '2024-11-22 23:18:20'),
(71, 'App\\Models\\User', 39, 'token', '0828f08645cb2033a7f251a8c9e8030686ee399dfc4c31efff5829e8b6fc9b56', '[\"*\"]', NULL, NULL, '2024-11-22 23:18:28', '2024-11-22 23:18:28'),
(72, 'App\\Models\\User', 39, 'token', 'cdea9d5c5c6381e592ec03668e9dab50a99f728e4df7732ef527791d694dbaa4', '[\"*\"]', NULL, NULL, '2024-11-22 23:19:44', '2024-11-22 23:19:44'),
(73, 'App\\Models\\User', 39, 'token', '77f30fff92e894d4274c450bf7a95fde1a490b8708e16ecccd1bb1e6058674cd', '[\"*\"]', NULL, NULL, '2024-11-22 23:33:59', '2024-11-22 23:33:59'),
(74, 'App\\Models\\User', 39, 'token', 'db785237a1a7357746ff5253118f10fdf00c5780df7f288044fefbaeb9ec67e1', '[\"*\"]', NULL, NULL, '2024-11-22 23:36:54', '2024-11-22 23:36:54'),
(75, 'App\\Models\\User', 36, 'token', 'ccac514419da945660bc2ea1200ecbd2fb915c60f5f75d6725f8e232638bd592', '[\"*\"]', '2024-11-23 09:38:53', NULL, '2024-11-23 09:38:03', '2024-11-23 09:38:53'),
(76, 'App\\Models\\User', 39, 'token', '2b063d98433b5a8801ca390484dab343c8b7ddcc5fb42ddb155da32f60afaef8', '[\"*\"]', NULL, NULL, '2024-11-23 14:38:21', '2024-11-23 14:38:21'),
(77, 'App\\Models\\User', 39, 'token', '9bc63589350267a1cba0b4b3e6beea226743012ae26e43d8c5f67c33ec30759c', '[\"*\"]', NULL, NULL, '2024-11-23 14:38:33', '2024-11-23 14:38:33'),
(78, 'App\\Models\\User', 39, 'token', '3835807617ca5385ceb7e790ae166f3525ab88be418967e62c7b5ffe00ad2a81', '[\"*\"]', NULL, NULL, '2024-11-23 14:39:54', '2024-11-23 14:39:54'),
(79, 'App\\Models\\User', 39, 'token', '8a53d11da7657cf31ae3922ae524f43673d71fc9fab08000d13ae370892ddf2f', '[\"*\"]', NULL, NULL, '2024-11-23 14:41:26', '2024-11-23 14:41:26'),
(80, 'App\\Models\\User', 39, 'token', '8e65ed0a12897ed4570aca7dac207e735f2af357f7f320795338ab87bbbc418c', '[\"*\"]', '2024-11-24 19:47:28', NULL, '2024-11-23 14:42:43', '2024-11-24 19:47:28'),
(81, 'App\\Models\\User', 39, 'token', 'c72584a302e863770d97f0d18f44ebad7fb6fe3163c92dd930429a445fbb8669', '[\"*\"]', NULL, NULL, '2024-11-23 15:09:10', '2024-11-23 15:09:10'),
(82, 'App\\Models\\User', 39, 'token', '089cb82de706ca685707ff7df9c1d2b6907e0e1022c0cbfe00a5708aa6cd6595', '[\"*\"]', NULL, NULL, '2024-11-23 15:58:30', '2024-11-23 15:58:30'),
(83, 'App\\Models\\User', 39, 'token', 'b1b1e0cf04356496267706c6e0aa3e79d2ac1d41b0e90116f3c1248c99f84e17', '[\"*\"]', NULL, NULL, '2024-11-23 15:58:59', '2024-11-23 15:58:59'),
(84, 'App\\Models\\User', 36, 'token', 'e43996e8bf766974e6bc1181eff973cb294eeb30a2f63523d6ee3764f33613f5', '[\"*\"]', NULL, NULL, '2024-11-23 16:08:26', '2024-11-23 16:08:26'),
(85, 'App\\Models\\User', 39, 'token', '14386477517dbe03e56821355a53eff92ecbff3276f8e2724a52776327089719', '[\"*\"]', NULL, NULL, '2024-11-23 17:33:31', '2024-11-23 17:33:31'),
(86, 'App\\Models\\User', 39, 'token', '9eb4ac1586aef17631797ad8281e8d435c960422d7c07aac40f4730484cd5409', '[\"*\"]', NULL, NULL, '2024-11-23 18:29:42', '2024-11-23 18:29:42'),
(87, 'App\\Models\\User', 35, 'token', '11b3ce82b86ba66dd4d505fb68d7276c4ff6df7418be08f30755b87fd93bf924', '[\"*\"]', '2024-11-23 19:27:54', NULL, '2024-11-23 19:14:01', '2024-11-23 19:27:54'),
(88, 'App\\Models\\User', 35, 'token', 'c75d6d06b6ab03c0748753b970481e504cb455f6d6b0f50bafb9c5b43e620b4a', '[\"*\"]', '2024-11-23 19:33:26', NULL, '2024-11-23 19:28:19', '2024-11-23 19:33:26'),
(89, 'App\\Models\\User', 35, 'token', 'a4db23cf9aede6771d734b4199b865c8a5562666fe19e00f48ccac8d44ca722e', '[\"*\"]', '2024-11-24 19:22:50', NULL, '2024-11-24 18:01:33', '2024-11-24 19:22:50'),
(90, 'App\\Models\\User', 35, 'token', '67611f9ba2c224937782977dc10f4f13a9a9e0a6c7b9ce2b272a6e6373a5912d', '[\"*\"]', '2024-11-24 19:12:23', NULL, '2024-11-24 19:07:17', '2024-11-24 19:12:23'),
(91, 'App\\Models\\User', 39, 'token', '8e06bc11d1ff45438c1d25a3a9f202f5f674e8d6ceb382265ba65ad758b21a4e', '[\"*\"]', '2024-11-24 20:31:35', NULL, '2024-11-24 19:42:26', '2024-11-24 20:31:35'),
(92, 'App\\Models\\User', 39, 'token', '504e49e9da09607de3f96e6495b0311ffdeec260935b4fd70c8d2e85d8e05e45', '[\"*\"]', NULL, NULL, '2024-11-25 07:50:46', '2024-11-25 07:50:46'),
(93, 'App\\Models\\User', 39, 'token', '880c210dd1fc394e9c0eb7b6fdd514ceb380bc648f51ad194303136aa6e86cc4', '[\"*\"]', '2024-11-25 08:20:05', NULL, '2024-11-25 08:15:33', '2024-11-25 08:20:05'),
(94, 'App\\Models\\User', 35, 'token', '4633359035909ed1d24ece6818e8a3dbceee3118114dba682d61629f01b06e05', '[\"*\"]', '2024-11-25 08:30:10', NULL, '2024-11-25 08:21:43', '2024-11-25 08:30:10'),
(95, 'App\\Models\\User', 39, 'token', '86aca2613c81a0adace9597b4396131185ee97c5a46d8dc868d0f9c8c0a86c2c', '[\"*\"]', NULL, NULL, '2024-11-25 09:05:16', '2024-11-25 09:05:16'),
(96, 'App\\Models\\User', 39, 'token', '1bac25557cfe37dbd0cc950d1db99fe0a8bd74f0b3a490d97a18aa7169062c6c', '[\"*\"]', NULL, NULL, '2024-11-26 20:54:31', '2024-11-26 20:54:31'),
(97, 'App\\Models\\User', 39, 'token', '6c312f1ab25b551b31c56f0fe017e7d5b521dff0358c5c8b1a14e61f669e262a', '[\"*\"]', NULL, NULL, '2024-11-26 20:56:12', '2024-11-26 20:56:12'),
(98, 'App\\Models\\User', 40, 'token', '6dd41cf7e93f00d086c0f61863791cdbd992f34af0d8e1551c210510c7bfeb46', '[\"*\"]', NULL, NULL, '2024-12-11 20:17:32', '2024-12-11 20:17:32'),
(99, 'App\\Models\\User', 40, 'token', 'f24eab9b075de946ce5d5dbd189802b1bfd30cd20d34e9240b4e52594406cdec', '[\"*\"]', NULL, NULL, '2024-12-11 20:18:42', '2024-12-11 20:18:42'),
(100, 'App\\Models\\User', 41, 'token', '926504c8e2f5c276f78f4f3ce37637c833259f685115ba05474fb11c01c6ecab', '[\"*\"]', NULL, NULL, '2024-12-11 21:09:58', '2024-12-11 21:09:58'),
(101, 'App\\Models\\User', 42, 'token', '509d38c4fbdb76ee24d8ba62a48e7a4005939bbe6d3c63f90bb7594546fc554f', '[\"*\"]', NULL, NULL, '2024-12-12 09:57:41', '2024-12-12 09:57:41'),
(102, 'App\\Models\\User', 42, 'token', '80764ffb29d9f1d81be33568f86ec587c114e79d777ea0b646d73f5333226766', '[\"*\"]', NULL, NULL, '2024-12-12 09:58:34', '2024-12-12 09:58:34'),
(103, 'App\\Models\\User', 43, 'token', '48be6dddc016530ab7943c31d406c318c3c0f728ed4d0d5283a90db71f50436d', '[\"*\"]', NULL, NULL, '2024-12-12 20:27:36', '2024-12-12 20:27:36'),
(104, 'App\\Models\\User', 43, 'token', 'f53f7a88fd920a7646fc2c8b047351f55b96e9b1cbae2b6d1da33565b409e3cc', '[\"*\"]', '2024-12-12 21:10:10', NULL, '2024-12-12 20:28:14', '2024-12-12 21:10:10'),
(105, 'App\\Models\\User', 44, 'token', '351dfeb64de207ff9d5fc90a01eba3dc016afcc52c4abede4304049bc9bae549', '[\"*\"]', NULL, NULL, '2024-12-13 06:48:41', '2024-12-13 06:48:41'),
(106, 'App\\Models\\User', 44, 'token', '737958c3b05c7340aa08165d70647cd6f53d542329298879feee02321a21fd94', '[\"*\"]', '2024-12-13 07:32:11', NULL, '2024-12-13 06:49:41', '2024-12-13 07:32:11'),
(107, 'App\\Models\\User', 44, 'token', 'fe13d7097b6e584c58cc9db333bef11913d4ce9093bd8968dce2f6ce7ae0b2f3', '[\"*\"]', NULL, NULL, '2024-12-13 07:33:44', '2024-12-13 07:33:44'),
(108, 'App\\Models\\User', 44, 'token', 'f9eea413efd9c4c382d27940cad35878d6869f455c2a747cedf4a116dfa8edf0', '[\"*\"]', '2024-12-13 07:53:09', NULL, '2024-12-13 07:37:26', '2024-12-13 07:53:09'),
(109, 'App\\Models\\User', 44, 'token', '5dc6141e71abe627d3ab7e23171a3665b192ab37facc3df78d4211e26996641b', '[\"*\"]', NULL, NULL, '2024-12-13 07:55:50', '2024-12-13 07:55:50'),
(110, 'App\\Models\\User', 40, 'token', 'e81ca5a3d4a603c591dc36dbb824bc2026d0b6f253ae26966324c119bd17c7d2', '[\"*\"]', '2024-12-13 08:21:38', NULL, '2024-12-13 08:15:40', '2024-12-13 08:21:38'),
(111, 'App\\Models\\User', 40, 'token', '0fb2842934ce6c3670b687420c1b315c12d802ed0b31fdc13cbf2f079b30e728', '[\"*\"]', '2024-12-13 09:33:25', NULL, '2024-12-13 08:19:41', '2024-12-13 09:33:25'),
(112, 'App\\Models\\User', 40, 'token', '1f0a8d2a6decd0ba9c7c3a08c7e08baba35ebf35de934c1840a263d75b837d35', '[\"*\"]', NULL, NULL, '2024-12-13 14:59:34', '2024-12-13 14:59:34'),
(113, 'App\\Models\\User', 45, 'token', '16277538bbe30f6b411b85a7bb7a1da9ae33fc833b84dc49bb04699ff7920017', '[\"*\"]', NULL, NULL, '2024-12-13 15:52:37', '2024-12-13 15:52:37'),
(114, 'App\\Models\\User', 45, 'token', '8869ec26ba6434f0a6e1de447bb8318896fe2a6991da8a39ec2ce3bde24e1f56', '[\"*\"]', '2024-12-13 16:03:24', NULL, '2024-12-13 15:53:15', '2024-12-13 16:03:24'),
(115, 'App\\Models\\User', 40, 'token', '06e322588b87f1c5d5bc7ee823cacb155929c0dd8f11598979400dbd788c9a05', '[\"*\"]', NULL, NULL, '2024-12-13 16:28:39', '2024-12-13 16:28:39'),
(116, 'App\\Models\\User', 40, 'token', 'b418d6d0a3556a7910612ff1310780d18296dc6f6a401eb6ca445f578329e673', '[\"*\"]', '2024-12-16 12:56:17', NULL, '2024-12-13 18:36:40', '2024-12-16 12:56:17'),
(117, 'App\\Models\\User', 40, 'token', '301c49638d62ea5e6b16db373cfe2a063ea62e378fed37e35e9c1b370d83b60d', '[\"*\"]', '2024-12-16 18:10:50', NULL, '2024-12-16 14:03:34', '2024-12-16 18:10:50'),
(118, 'App\\Models\\User', 46, 'token', '6a4255c91e99c338979b345c1b3e19156c5f3dd655939df778f4e3c1cbccd1a0', '[\"*\"]', NULL, NULL, '2024-12-17 06:23:04', '2024-12-17 06:23:04'),
(119, 'App\\Models\\User', 46, 'token', '6257ed586b56c287f10936bad0dca78327b36e992eb1ab29b970153626a9822f', '[\"*\"]', '2024-12-17 06:31:38', NULL, '2024-12-17 06:24:48', '2024-12-17 06:31:38'),
(120, 'App\\Models\\User', 47, 'token', '8e634b77d735c05a4eb7e09f7a47b1aba4df81e294ad88e581e418b652c92a0b', '[\"*\"]', NULL, NULL, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(121, 'App\\Models\\User', 46, 'token', '91a7edd6553b510613c94b9a63353aea1be283cc5a1ef64ee1be7a7a8300e5fc', '[\"*\"]', '2024-12-17 10:28:44', NULL, '2024-12-17 10:21:32', '2024-12-17 10:28:44'),
(122, 'App\\Models\\User', 48, 'token', 'c3f8638d23392479dbb9c5638d7859b2e320a53ed0eeec94e0f19bffa9088413', '[\"*\"]', NULL, NULL, '2024-12-17 11:03:52', '2024-12-17 11:03:52'),
(123, 'App\\Models\\User', 48, 'token', '71feabaa78496fc5af543cc45b7e2c09a31a2cdfe69c21f280dc0e21089d8d0d', '[\"*\"]', '2024-12-17 11:17:27', NULL, '2024-12-17 11:09:02', '2024-12-17 11:17:27'),
(124, 'App\\Models\\User', 49, 'token', '2c3fa13fb31563274bd50499b6c272b986a7590ed5868c4c20a65f15511a90af', '[\"*\"]', NULL, NULL, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(125, 'App\\Models\\User', 44, 'token', '61ed489f3ae8850bf597f72bec983624f5cf3178377b716d12f8037640fefcc2', '[\"*\"]', '2024-12-18 10:09:58', NULL, '2024-12-18 10:08:16', '2024-12-18 10:09:58'),
(126, 'App\\Models\\User', 50, 'token', '7fbd74d1f59fc003db345ed279892805ae984b52db479d2452c4410a8cab3a5f', '[\"*\"]', NULL, NULL, '2024-12-20 11:49:05', '2024-12-20 11:49:05'),
(127, 'App\\Models\\User', 50, 'token', '643736a216133b9cf19cc205f644c4d46a73228fd0db302edc53c399669e7122', '[\"*\"]', '2024-12-20 11:53:00', NULL, '2024-12-20 11:49:58', '2024-12-20 11:53:00'),
(128, 'App\\Models\\User', 51, 'token', 'b2174a06639d453a94e2f4845c38a6a67baa420bad5520f59b443cde5797f33b', '[\"*\"]', NULL, NULL, '2024-12-20 12:13:01', '2024-12-20 12:13:01'),
(129, 'App\\Models\\User', 51, 'token', 'c5a1d0e6dd9b197710563e99e3acf2517eea8250f97d3d332be4ecd27c4b668e', '[\"*\"]', '2024-12-20 12:17:56', NULL, '2024-12-20 12:13:53', '2024-12-20 12:17:56'),
(130, 'App\\Models\\User', 52, 'token', 'b157756bd0e9c56a32e74d60f6f2ae030cb670f1344549b10dc754d383cde6be', '[\"*\"]', NULL, NULL, '2024-12-20 12:33:26', '2024-12-20 12:33:26'),
(131, 'App\\Models\\User', 52, 'token', '06e6699d924eb1ae52d95118acca3e80c1c6e50f3b3b988b34f571ac2d585fad', '[\"*\"]', '2024-12-20 13:27:08', NULL, '2024-12-20 12:34:54', '2024-12-20 13:27:08'),
(132, 'App\\Models\\User', 53, 'token', '4c5fcd5101c4713212ea8d1d4319609575d52dccff60f5c676963c9ab6ce20c6', '[\"*\"]', NULL, NULL, '2024-12-20 13:45:27', '2024-12-20 13:45:27'),
(133, 'App\\Models\\User', 53, 'token', '679cd9f2f28f8846f5543071c21757d325711f4d0c12abee547b71ad3878700e', '[\"*\"]', '2024-12-20 13:46:49', NULL, '2024-12-20 13:46:01', '2024-12-20 13:46:49'),
(134, 'App\\Models\\User', 46, 'token', 'ed1834b17d824384ebc9891be0f324fe006ee571d49e53dc6e3160c1de120f83', '[\"*\"]', '2024-12-20 14:12:27', NULL, '2024-12-20 14:08:27', '2024-12-20 14:12:27'),
(135, 'App\\Models\\User', 48, 'token', '4d55d06c680b63c29a532a048367253c353c44dd882e7d11f883ebd1949527c8', '[\"*\"]', '2024-12-20 14:19:03', NULL, '2024-12-20 14:15:14', '2024-12-20 14:19:03'),
(136, 'App\\Models\\User', 50, 'token', 'c1d6b5d8ae4b0b1cd6c7a928e0bfae56244b4345eaf4ede961a95c4ba3b91288', '[\"*\"]', NULL, NULL, '2024-12-20 14:21:07', '2024-12-20 14:21:07'),
(137, 'App\\Models\\User', 48, 'token', '89458c669f8396faf887b61d36240d0671f17912c1674c668961029b0966fb5e', '[\"*\"]', '2024-12-20 14:23:37', NULL, '2024-12-20 14:22:08', '2024-12-20 14:23:37'),
(138, 'App\\Models\\User', 50, 'token', 'b7573d3782c77ef4ab021dd762424ec9f3a487def028554283b7f729be0dc236', '[\"*\"]', '2024-12-20 14:44:39', NULL, '2024-12-20 14:24:08', '2024-12-20 14:44:39'),
(139, 'App\\Models\\User', 51, 'token', '16beaae06d95f2b3d97510e0aaaa08d8ee813b603fbe29862c97d2696d4f0e9b', '[\"*\"]', '2024-12-20 14:50:13', NULL, '2024-12-20 14:45:17', '2024-12-20 14:50:13'),
(140, 'App\\Models\\User', 52, 'token', '45ddcee8009dd402699efe427bdbf42550a6cd83f7821547c0fc7fcad39eada9', '[\"*\"]', '2024-12-20 14:59:47', NULL, '2024-12-20 14:53:31', '2024-12-20 14:59:47'),
(141, 'App\\Models\\User', 46, 'token', '62eb5631bd323975d0f3fa89dd12aa04e39825d8ef9886fda2acca34ec095a73', '[\"*\"]', '2024-12-20 15:05:43', NULL, '2024-12-20 15:03:39', '2024-12-20 15:05:43'),
(142, 'App\\Models\\User', 48, 'token', '0ffbe26839c213321b400d99fd8a3a409d8d4e0b3479d66cf16485b089702a83', '[\"*\"]', '2024-12-20 15:10:19', NULL, '2024-12-20 15:07:02', '2024-12-20 15:10:19'),
(143, 'App\\Models\\User', 50, 'token', 'c8b2b38ea0aa5bf8b432e9cc3acebf39c951f98ac848d65db2d00e9b1ffa45c2', '[\"*\"]', '2024-12-20 15:11:57', NULL, '2024-12-20 15:10:49', '2024-12-20 15:11:57'),
(144, 'App\\Models\\User', 52, 'token', '25a2f739baf52e0620e6518641e328a1da245cf8459965ff050da00d2fe8cce7', '[\"*\"]', '2024-12-20 15:16:57', NULL, '2024-12-20 15:16:35', '2024-12-20 15:16:57'),
(145, 'App\\Models\\User', 53, 'token', '4e54bd244d71ef40b5a18fd858720efa3e277d8787f657bfd11496c8f6d88172', '[\"*\"]', NULL, NULL, '2024-12-20 15:17:58', '2024-12-20 15:17:58'),
(146, 'App\\Models\\User', 53, 'token', 'cb87f5f2a5d58547acb2bb6b1a3995e5ca8f12dc3bd295622bf4bc340d97db30', '[\"*\"]', '2024-12-20 15:29:44', NULL, '2024-12-20 15:25:27', '2024-12-20 15:29:44'),
(147, 'App\\Models\\User', 54, 'token', '0842ae96fc746b891653d2b28434452fe847e878e4b09ec135c54c1fb08adf4f', '[\"*\"]', NULL, NULL, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(148, 'App\\Models\\User', 55, 'token', '551cd2045fac164258c9ca71ecb0f137004b0c4dddab198bec2a01d05043663f', '[\"*\"]', NULL, NULL, '2024-12-20 16:44:19', '2024-12-20 16:44:19'),
(149, 'App\\Models\\User', 55, 'token', '1de0274965381d40b4e9bec059597185c4bb2fcf7f87d9022aca483cad56c453', '[\"*\"]', '2024-12-20 16:45:53', NULL, '2024-12-20 16:45:30', '2024-12-20 16:45:53'),
(150, 'App\\Models\\User', 39, 'token', '37b6c315abb59518ecddbab8f50e5b030cbb860673c651e229213b2abeff36e7', '[\"*\"]', '2024-12-21 16:04:35', NULL, '2024-12-20 16:57:09', '2024-12-21 16:04:35'),
(151, 'App\\Models\\User', 39, 'token', '726d5b29935b7880bf9ebe786856cec72ba41edcdb250e23a000791ffaaad7ab', '[\"*\"]', NULL, NULL, '2024-12-21 16:06:58', '2024-12-21 16:06:58'),
(152, 'App\\Models\\User', 39, 'token', 'ad9efb3b442c6d45b68288bcfcc3d0bb3d470a79fe5e4b55725efdeab6046367', '[\"*\"]', '2024-12-22 16:56:07', NULL, '2024-12-22 16:55:10', '2024-12-22 16:56:07'),
(153, 'App\\Models\\User', 56, 'token', 'f8363a3a67d44e787e8dcf36fb6490046ee81603b6ee17a45d02a68cfe0f1ec1', '[\"*\"]', NULL, NULL, '2025-01-15 08:04:56', '2025-01-15 08:04:56'),
(154, 'App\\Models\\User', 57, 'token', '569ebff34238f3e23ca3ffac1b3d505c9ce6451fa139c21b8a7cda407ec66a1c', '[\"*\"]', NULL, NULL, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(155, 'App\\Models\\User', 58, 'token', '344ad765778091ffd72263f4c141f75886db9d7d6487337d7b530bdd588246fe', '[\"*\"]', NULL, NULL, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(156, 'App\\Models\\User', 59, 'token', 'b5983e4dda9680194cf46818fd1205195e69dc878b8fb30567f8e1c4ef1e3d56', '[\"*\"]', NULL, NULL, '2025-01-15 08:10:41', '2025-01-15 08:10:41'),
(157, 'App\\Models\\User', 60, 'token', '21fc88251ddcc98742188571201d06284410996485bbcd326f1b209379b1087f', '[\"*\"]', NULL, NULL, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(158, 'App\\Models\\User', 61, 'token', 'd88c89e6f00c212dc129cbae23d872c91ea84467457072eb6a4a592a38f90879', '[\"*\"]', NULL, NULL, '2025-01-15 08:19:15', '2025-01-15 08:19:15'),
(159, 'App\\Models\\User', 62, 'token', '69882a1a846a1219c3823e81da849f1b34157252bbd57fea1b5f726a29416d52', '[\"*\"]', NULL, NULL, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(160, 'App\\Models\\User', 63, 'token', 'd4ebc2f80a1a5b0ebec42856b871f9bc614abc5742ed4f48fe0712abf50ca6b0', '[\"*\"]', NULL, NULL, '2025-01-15 08:29:25', '2025-01-15 08:29:25'),
(161, 'App\\Models\\User', 64, 'token', '5f1a7dc6722c2fd583b59fdc8bec316e9f4950be5714a989a164b3af5859b078', '[\"*\"]', NULL, NULL, '2025-01-15 09:03:06', '2025-01-15 09:03:06'),
(162, 'App\\Models\\User', 65, 'token', '2daec0d01cec91e907475e1cf62396ce41269a86cd6a49d37f9bb46ab7063026', '[\"*\"]', NULL, NULL, '2025-01-15 09:05:26', '2025-01-15 09:05:26'),
(163, 'App\\Models\\User', 66, 'token', 'c452a0ce2befae499a29f19459a25c7ef9164a1a32163dd4bcceb5963969d64d', '[\"*\"]', NULL, NULL, '2025-01-15 12:46:13', '2025-01-15 12:46:13'),
(164, 'App\\Models\\User', 66, 'token', '6357a9c61190e0ecb1c25b56f44179125e6dcbf770afec3710932b8be92ab62c', '[\"*\"]', NULL, NULL, '2025-01-15 12:48:00', '2025-01-15 12:48:00'),
(165, 'App\\Models\\User', 67, 'token', '6f5b43dc432a0aaaee529b26e6c49b1f972f388c503183f9921dfc8bf401b4a3', '[\"*\"]', NULL, NULL, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(166, 'App\\Models\\User', 68, 'token', 'db5b05cc5e8973d800c9c10f7f8917fdcf5611eea8bfd69068e14fd79b3077cf', '[\"*\"]', NULL, NULL, '2025-01-16 08:46:51', '2025-01-16 08:46:51'),
(167, 'App\\Models\\User', 68, 'token', '2c2c1860aa2440b5583ae613d1bd963d8cab5c388903d9453968bd822f72f1e1', '[\"*\"]', NULL, NULL, '2025-01-16 08:47:51', '2025-01-16 08:47:51'),
(168, 'App\\Models\\User', 69, 'token', 'b7f071910ea20c1b29e9cf9dc5bc06a11c104868f0540b29f043fed8d48978e3', '[\"*\"]', NULL, NULL, '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(169, 'App\\Models\\User', 70, 'token', '630f995b61eb6c4dbc84c7ddfdebc7663a183851cadf2ef8c2b78992790ba1e8', '[\"*\"]', NULL, NULL, '2025-01-20 10:06:25', '2025-01-20 10:06:25'),
(170, 'App\\Models\\User', 70, 'token', '4e53f9c2661e1b3d47efa153ced7fa153e6c02b751812f66a697932809a0b751', '[\"*\"]', NULL, NULL, '2025-01-20 10:07:58', '2025-01-20 10:07:58'),
(171, 'App\\Models\\User', 71, 'token', 'ff785fb614ea835efdc2b2d992f399aa6d4ae8a342ee632a86d5943c6e82c927', '[\"*\"]', NULL, NULL, '2025-01-20 10:37:19', '2025-01-20 10:37:19'),
(172, 'App\\Models\\User', 72, 'token', 'a78f70c24beb518305b2a16293a438df81ae1d7934a6af225ba2b426bee57379', '[\"*\"]', NULL, NULL, '2025-01-20 11:27:36', '2025-01-20 11:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `rating` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `message`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New', 'blah blah', 1, 0, '2024-10-28 08:15:40', '2024-12-16 18:10:49'),
(2, 'vb', 'hji', 2, 0, '2024-11-24 20:27:42', '2024-12-16 18:10:51'),
(3, 'test`New', 'hjihj', 2, 0, '2024-11-24 20:29:00', '2024-12-21 16:04:35'),
(4, 'New', 'blah blah', 1, 0, '2024-12-22 06:08:12', '2024-12-22 06:09:26'),
(5, 'new', 'fg', 2, 1, '2024-12-22 16:55:39', '2024-12-22 16:55:39'),
(6, 'test', 'test', 3, 0, '2024-12-22 16:55:55', '2024-12-22 16:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone_country_code` varchar(255) DEFAULT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `age` varchar(255) NOT NULL,
  `eye_color` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `burst` varchar(255) NOT NULL,
  `about` longtext DEFAULT NULL,
  `is_user` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `provider` enum('Default','Google','Facebook','Apple') NOT NULL DEFAULT 'Default',
  `fcm_token` text DEFAULT NULL,
  `access_token` longtext DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `featured_until` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `hair_color` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `guid`, `name`, `email`, `email_verified_at`, `password`, `phone_country_code`, `phone_code`, `phone_number`, `address`, `city`, `state`, `country`, `zip_code`, `latitude`, `longitude`, `age`, `eye_color`, `height`, `weight`, `burst`, `about`, `is_user`, `status`, `provider`, `fcm_token`, `access_token`, `remember_token`, `featured`, `featured_until`, `sex`, `hair_color`, `created_at`, `updated_at`) VALUES
(35, 'e8e4f502-f321-442f-9e03-4b9591b6548c', 'test', 'test@yopmail.com', '2024-11-20 18:45:08', '$2y$12$WTHCNpsgbaVMl4jXruPEbOCn15Qm3rcTZsVFw/DEJCTeYNO.cOYMK', 'us', '+92', '1663666377777', 'Denmark Hill, London, UK', 'denmark', 'England', 'United Kingdom', 'SE5 8RZ', '51.4672017', '-0.0908305', '22', 'brown', '5\'5', '54', '36', 'test', 0, 1, 'Default', NULL, NULL, NULL, 1, '2024-11-27 12:00:00', 'woman', NULL, '2024-11-20 18:44:05', '2024-11-25 08:30:10'),
(36, 'f3723eb3-8787-43c2-9743-c6095c0ff591', 'Lara', 'babyboo3590@hotmail.com', '2024-11-22 17:21:51', '$2y$12$shnCKG9sFAqPlPZwI65qV.HNRL3djqzKuguBXgjCykHZ5PcrbT/z.', 'us', '+92', '12345678', 'Rødovre, Rødovre, Danmark', 'Rødovre', 'København', 'Danmark', '2610', '55.68770079999999', '12.4641146', '28', 'Green', '170cm', '53kg', 'Large(C)', 'Please read this carefully \r\n\r\nI prefer text or WhatsApp. Include your name, age, origin, the time you\'d like to meet, and the duration. Messages like \"hi\" or \"address\" without details will not be answered. Be polite and respectful 🤩💕\r\n\r\nAbout Me\r\nHi, I’m Lara, 28 years old, with a natural, curvy body and a warm smile. I’m friendly, classy, and passionate, ready to give you an unforgettable experience. No rush, just pure enjoyment and relaxation.\r\n\r\nBooking & Payment\r\nContact me with a brief introduction and your preferred time. Payment in euros or DKK is fine, and Revolut is accepted.\r\n\r\nRates\r\nGFE\r\n\r\n1 hour: 1600 DKK / 200€\r\n45 minutes: 1400 DKK / 180€\r\n30 minutes: 1000 DKK / 130€\r\nNaughty GFE\r\n\r\n1 hour: 2400 DKK / 320€\r\n90 minutes: 3400 DKK / 450€\r\nB2B Massage\r\n\r\n45 minutes: 1500 DKK / 200€\r\n1 hour: 1800 DKK / 240€\r\nReach out, and let’s create something special together 😉', 0, 1, 'Default', NULL, NULL, NULL, 1, NULL, 'woman', NULL, '2024-11-22 17:20:44', '2024-11-23 09:38:53'),
(37, 'a5dc6d9a-da72-4dba-a2d5-09961a332a0c', 'Else', 'kissmy7890@hotmail.com', '2024-11-22 17:44:34', '$2y$12$cPhDQlJmUvciERhUO02aFuY870y5ORyd2ZyEnTI0xLmu/QQggEp6i', 'us', '+92', '12345679', 'Nørrebrogade, 2200 København, Danmark', 'København', 'København', 'Danmark', '2200', '55.6938283', '12.5496162', '25', 'brown', '164cm', '60kg', 'Medium(B)', 'I’m Else, a warm and welcoming 25-year-old with a natural, feminine figure. I love creating relaxing, enjoyable moments without stress or rush.\r\n\r\nPrice.\r\n\r\n30 min: 700 DKK / 100€\r\n45 min: 1000 DKK / 140€\r\n1 hour: 1400 DKK / 190€\r\n\r\nContact me via SMS or WhatsApp with your name, age, and preferred time. I look forward to hearing from you!', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', NULL, '2024-11-22 17:43:18', '2024-11-22 17:44:34'),
(38, 'fbfcd810-255b-4c4d-a5ef-08e913a9f02a', 'Alexia', 'Alexiakiss12@hotmail.com', '2024-11-22 18:06:57', '$2y$12$j87bNIAxuUBJphWw5CsjxuyiGnroXICxIAnOmJSjIiwKZYppqW0sy', 'us', '+92', '12345687', 'Valby 2500 København, Danmark', 'København', 'København', 'Danmark', '2500', '55.6590619', '12.5235172', '21', 'Brown', '161', '65kg', 'B', 'I’m Alexia, a 21-year-old with a natural, captivating charm. I specialize in creating unforgettable experiences where you can relax and enjoy every moment without any rush.\r\n\r\nRates:\r\n\r\n30 min: 600 DKK / 85€\r\n45 min: 900 DKK / 125€\r\n1 hour: 1300 DKK / 180€\r\nExtras:\r\n\r\nWithout condom: +500 DKK / 70€\r\nTo arrange a meeting, send me a message via SMS or WhatsApp with your name, age, and the time you’d like to meet. I’m excited to create an amazing experience just for you!', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', NULL, '2024-11-22 18:06:32', '2024-11-22 18:06:57'),
(39, '4f1c7f1d-9f5e-41f7-b8e2-d18e9af34afe', 'Admin', 'escort-admin@yopmail.com', '2024-11-23 04:12:45', '$2y$12$0gznXZzGxSOFkVw7GSlXpebAyrYxT15dAF0qhND.zkTwxk0hgtDZa', 'USA', '+1', '1', 'USA', 'USA', 'USA', 'USA', '123', '24.832889', '67.0734776', '18', 'Green', '10', '10', '10', 'lorem lorem', 2, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'Man', NULL, '2024-11-22 23:12:21', '2024-11-24 19:46:07'),
(40, 'adbc0656-45f9-4b79-8dcd-9982e3ad7cf6', 'Escort 1', 'admin-escort1@yopmail.com', '2024-12-11 20:18:38', '$2y$12$hJxKs6v37EL4L8CrRwZo1eqJ2FgK7diP9OVLGCRok.ENX1uKwF88a', 'USA', '+1', '1', 'USA', 'USA', 'USA', 'USA', '123', '24.8430158', '67.0606197', '18', 'Green', '10', '10', '10', 'lorem lorem', 2, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'Woman', NULL, '2024-12-11 20:17:32', '2024-12-16 14:04:14'),
(41, '67a1c3c8-ca1c-4f9b-ba91-0cc127640ba5', 'tester', 'testtyikm@yopmail.com', '2024-12-11 21:16:55', '$2y$12$ooL2jOqjwkL.nuB8ktqkxOAMO5kyTBRscsYGhOOwgxIDz88FO9nAi', 'us', '+92', '0987676543', 'Gower, MO 64454, USA', 'Gower', 'MO', 'United States', '64454', NULL, NULL, '22', 'blue', '100', '100', '100', '1222', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'man', NULL, '2024-12-11 21:09:58', '2024-12-11 21:16:55'),
(42, '9bef8460-ab7b-45db-a9c6-14829cc737c5', 'tester', 'admin-escort1222@yopmail.com', '2024-12-12 09:58:25', '$2y$12$N6HPi3dRtNea20Lrv1gWye/htdXVJ2is8HadUuwsZU9TfR0ICkeIa', 'us', '+92', '0987676543', 'Springfield, MO 65897, USA', 'Springfield', 'MO', 'United States', '65897', NULL, NULL, '22', 'brown', '5.5', '54', '36', 'dddddddddd', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', NULL, '2024-12-12 09:57:41', '2024-12-12 09:58:25'),
(43, '730cb5db-6333-4698-ae1c-3197f948715a', 'tester', 'tester@yopmail.com', '2024-12-12 20:28:05', '$2y$12$7bLQuoInw.uz.K5QB.tboutcpZxER06vAe/ZV7OYuHfE1NqDb5vly', 'us', '+92', '0987676543', 'Springfield, MO 65897, USA', 'Springfield', 'MO', 'United States', '65897', NULL, NULL, '22', 'blue', '1', '100', '100', 'fffffff', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'man', NULL, '2024-12-12 20:27:36', '2024-12-12 20:28:05'),
(44, 'c13106fc-7fd7-4f9f-ab51-c324880fa362', 'tester', 'tester1@yopmail.com', '2024-12-13 06:49:25', '$2y$12$zfygVI9r9wuqvpBdKFGIBuyRq6xyymp6tKVT8iH.jkyYp8o/bWMkS', 'us', '+92', '0987676543', 'Springfield, MO 65897, USA', 'Springfield', 'MO', 'United States', '65897', NULL, NULL, '22', 'blue', '5.5', '54', '36', 'hgfd', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'blue', '2024-12-13 06:48:41', '2024-12-13 06:49:25'),
(45, '7fbdec32-c522-4369-a70a-76072da9a7e1', 'Alexa', 'saadsirhandi@yopmail.com', '2024-12-13 15:53:12', '$2y$12$xuYMlJhtIIQEmMa2HK.y6uleEhoO7gJX9x9LQk02NfB/HL509o5Qa', 'us', '+92', '2555522222', '9000 Aalborg, Denmark', 'Aalborg', NULL, 'Denmark', 'DK-9000', '24.833206492828648', '67.0738328601359', '32', 'Red', '534', '34', '32', 'This is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a testThis is a test. This is a test This is a test This is a test This is a test This is a testThis is a testv This is a testThis is a testThis is a test', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Red', '2024-12-13 15:52:36', '2024-12-13 16:02:08'),
(46, '74380d8d-1bb7-4037-9e57-a8ad2423b37b', 'Line', 'Lindsay564@hotmail.com', '2024-12-17 06:24:35', '$2y$12$647Q6rxjE6pNIaQS5Lviye/B4IxrUJ3ArZOKcSqX51YkwHVVbtHiW', 'us', '+92', '12121212', 'Moskva, Rusland, 121059', 'Moskva', 'Moskva', 'Rusland', '121059', NULL, NULL, '25', 'Green', '174 cm', '53 kg', 'D', 'Hi, dear gentlemen. I\'m new here, I really adore meeting gorgeous people. Moscow escort girl who knows how to satisfy a man and please him. I\'m an outstanding person, because I really care about people who are around me and who are intending to meet me up. I\'m extremely delicious, romantic and a fantastic, caring and sexy partner for an overnight or short date. You will immediately notice that I\'m a right person for you, and if you select me then you have a great taste) Hoping to meet you soon to have a real and sweet date. Send me whatsapp message or call in case you\'re interested', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Blonde', '2024-12-17 06:23:04', '2024-12-20 15:05:43'),
(47, '65296d06-2594-4824-915e-4e00566bba13', 'Mary', 'Marryme1654@hotmail.com', NULL, '$2y$12$ODQHG0wpLrEbUemGSSIy.OllkAEZLOog1FF8Y9NcVhhZTZyNsjgru', 'us', '+92', '24864585', '8000 Aarhus Centrum, Danmark', 'Aarhus', NULL, 'Danmark', '8000', '24.83353205186297', '67.07418961231062', '23', 'Blue', '175 cm', '55 kg', 'D', 'Welcome here! I speak good english, so we can understand each other.\r\nMoscow escort girl with wonderful erotic and sexual skills, I know how to please a man, I will bring you a 100% satisfaction, my caress will be endless! I\'m able to bring you only joy and a complete happiness and satisfaction, if you\'re curious about that - just book me and arrange a meeting, I\'m sure that we will have a great time together! I can surprise you with my sexy lingerie or with some erotic games, discovered by me.\r\nI guarantee it will be a fantastic evening, that you will keep in your mind long time. If you love exciting erotic adventures, call or whatsapp me now! Hoping to see you soon!', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Blonde', '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(48, '30489bea-e0d1-4e90-bf02-299596b74d84', 'Jasmin', 'vanessadisken@gmail.com', '2024-12-17 11:08:46', '$2y$12$IXDQXyf5m41BIbttSZCZM.d4pAILrGTWRO0IJEOpDtr0r.JOjfXrS', 'us', '+92', '13456844', '2500 Valby, Danmark', 'valby', NULL, 'Danmark', '2500', NULL, NULL, '21', 'Blue', '175 cm', '55 kg', 'DD', 'I am Vanessa, very elegant and beautiful escort girl in Moscow, offering a genuine, warm and very friendly girfriend experience. I am looking forward meeting gentlemen wanting to spend quality time and have a wonderful time with a high class lady and Elite companion. Once you meet me you will see how intelligent, well groomed and sophisticated I\'m, i will caress your body, and you will no more be stressed after hard working day, i\'m a girl with real pictures and you will find out that i do exist for sure! I\'m quite tall, normally i always wear nice lingerie and stockings, my eyes shine bright and I\'m open to exlore new intimate boundaries and i will give and bring you pleasure, which you probably never felf before. I have slender legs and skinny figure, I am a charming blonde, I love to travel, but i do only local outcall, hoping, you understand. I\'m a well-groomed lady with charming voice, velvet skin, sugar and sweet lips and you will desire to spend a night with me. I\'m a unique escort girl in Moscow, because i love my work and I\'m decent and fascinating.', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Blonde', '2024-12-17 11:03:52', '2024-12-20 15:10:19'),
(49, 'cb3a50a8-b531-48c8-be09-f31f19b5fc89', 'Katy', 'Berrykaty@outlook.com', NULL, '$2y$12$Iuyg86vsPdbljBXbB5NJ8OgVfCBX4cDlczoiKji/a1Ebg/4D9iQFu', 'us', '+92', '54614568', '2500 Valby, Danmark', 'valby', NULL, 'Danmark', '2500', NULL, NULL, '21', 'Blue', '174 cm', '55 kg', 'C', 'Hello, I\'m real and I\'m independent Moscow escort. If you\'re looking for some real and nice companion, then pay attention on me, I will please you. If you adore tall and sophisticated girls, who will give you much pleasure - call me. Please contact me if you\'re in Moscow right now, I don\'t believe in advanced bookings, thanks. Don\'t be shy to call me by phone, also let me know if you want to use some messenger. Sometimes in some cases I can use them, although i like voice calls much more. Also if you\'re a fan of a slow body massage - here I will help you to get relaxed too, because I also like to give it with my strong hands and with my favourite massage oil and I will excite you more, showing my sexy body, legs and very beautiful hair, and if you\'re ready - we will start immediately our extremely sweet adventure, and, hoping, you will select me among other Moscow escorts.', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Brunette', '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(50, '7170351c-018c-48c7-bc60-42f464d1229f', 'Ida', 'Lizamiza123@hotmail.com', '2024-12-20 11:49:44', '$2y$12$rRo0dySissKe//zk3KyKt.nWllMzdFfnUdCbFcwRwA4knCvToePMu', 'us', '+92', '12345645', '2500 Valby, Danmark', 'valby', NULL, 'Danmark', '2500', NULL, NULL, '22', 'Brown', '175 cm', '53 kg', 'D', 'Hello, dear gentlemen, if you need an excellent rest and joy - then call me. An escort in Moscow like me is always ready to provide you the best services. I won\'t mention what services exactly do I provide - you can find this info in my profile. I\'m sexy and I know some erotic games that we can play together. My body is fresh, juicy and I will allow you to caress it and also I\'m very good in caressing someone. Let it be you, and I will share my tenderness with you. I\'m extremely passionate and tender, my sweet sugar lips will drive you crazy and will force you to continue our time together and prolong it. I\'m not interested in leaving you as soon as spossible and I can stay with you full paid time and I will really appreciate and you extend our time together, so we can share our experiences to each other, and I hope that an escort in Moscow like me will make you smile', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Light brown', '2024-12-20 11:49:05', '2024-12-20 15:11:55'),
(51, '1ec8e192-8cae-41ac-8138-a327692ab5a0', 'Tina', 'Tinatwo22@hotmail.com', '2024-12-20 12:13:39', '$2y$12$QBU2kgXcrkUVhPz6vr9SduOMJmZXsGfGUWmViqwx8RCnIfBYQJpje', 'us', '+92', '15457898', '2500 Valby, Danmark', 'valby', NULL, 'Danmark', '2500', NULL, NULL, '20', 'Blue', '172 cm', '54', 'D', 'Real slim blonde lady, I will make your free time more sexual and erotic. Escort in Moscow who will satisfy all your desires, without any restrictions, if we both like this. I am very tall, but very skinny, what makes me look special. If you need a great relaxation then call me, and I will make everything that is possible for satisfying you', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Blonde', '2024-12-20 12:13:01', '2024-12-20 12:13:39'),
(52, '054cd212-8965-4502-99fe-45375b3bb7f3', 'Katie', 'Kitty654123@hotmail.com', '2024-12-20 12:34:40', '$2y$12$5WwRX7DGsewqc7bCnfDDwO85vPIvVy9Z3Pio2VZTc7dEwjdSL4aeG', 'us', '+92', '12121212', '2200 København, Danmark', 'København', NULL, 'Danmark', '2600', NULL, NULL, '26', 'Brown', '174 cm', '54', 'D', 'Hello, boys! I\'m happy you visit my page. This means that you\'re lonely in my city and need an escort in Moscow. I\'m the perfect and excellent choice, and I will explain you why so. I have all in me that you like and want to see in coming girl. I\'m young and my skin is very soft, but same time I\'m experienced and things we can do together are limited only in your imagination! We can do absolutely all that we both want, and we will be excited about that and it will make us both happy! I will be concentrated on you only and your satisfaction and the best time are the main thing for me. I will bring you much joy and real pleasure is guaranteed! I\'m wise and I know what does a man need. Our mutual time will be great and I will be loyal to everything, including your unusual wishes. Call me now! I do incall and outcall to your place, outcall sounds much better for me. I\'m 100% real and if you doubt - feel free to call me, and I will confirm my identity with pics.', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Brunette', '2024-12-20 12:33:26', '2024-12-20 15:16:57'),
(53, '6aae0f44-b40c-4d97-b6f5-6d2658e923c6', 'Mia', 'Miamia654@hotmail.com', '2024-12-20 13:45:49', '$2y$12$pIluSuK//T4bzVRRywCPWenZhurIlCIK/PycYLuHTKBurD82Vpk0O', 'us', '+92', '55664422', '2500 Valby, Danmark', 'Valby', NULL, 'Danmark', '2500', NULL, NULL, '20', 'Green', '173 cm', '53 kg', 'D', 'Hello, my honey. If you\'re into booking Moscow escorts, please pay attention on me. I\'m nice and caring, sweet, real and loyal to your wishes. I will make your desires come true. Here I\'m your best lady for tonight. I\'m ready to go everytime, I\'m also able to reach hotel and meet you daytime, not only evening and night. My beautiful and feminine figure and body curves will drive you crazy. I\'m a real person and you can make sure during the phone call. I promise to make your evening special. that you won\'t regret and will not be able to forget.', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Blonde', '2024-12-20 13:45:27', '2024-12-20 15:27:16'),
(54, 'ddf330eb-e37a-4043-a41f-b83aa39a8e69', 'Anna', 'profile6@gmail.com', NULL, '$2y$12$qpCMqAUivZaQnoExkqfZ0uhrQIH59/GqW4uULTTd5Sq0W2IgTJ/ey', 'us', '+92', '62354585', '2500 Valby, Danmark', 'valby', NULL, 'Danmark', '2500', NULL, NULL, '25', 'Brown', '170', '55', 'C', 'Hello! If you\'re in the capital of Russia and seeking a companion, then it can be an escort in Moscow like me. Doesn\'t matter, do you want a girl for an hour only or you prefer an overnight date - my attitude will be same, I will be trying to give my best, providing all necessary services, My nice lace lingerie is always on me, and you can enjoy unlimited. So if you need vip services - please, call me or send text message, I\'m almost always ready for a pleasant sexual and erotic journey. My images are real 100%, you can ask me and I can prove my photos, also can show my other girls if you stay maybe with a friend and need more girls. I\'m flexible to everything, and you can be sure that it will be a fantastic time, full of sweet intimate moments.', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Black', '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(55, '65c30530-280d-4d36-8d35-5247aa365922', 'Luna', 'Anna68135@hotmail.com', '2024-12-20 16:45:03', '$2y$12$sUGnvSqCuZAeHYNesfnw7.Gx2E/cMjoXXV09zhqYDHZOySNU6vwze', 'us', '+92', '26645131', '2100 København Ø, Danmark', 'østerbro', NULL, 'Danmark', '2100', NULL, NULL, '20', 'brown', '162', '50', 'D', 'Hello, gorgeous man. I\'m a delicate and discreet companion, our pleasure will be bright and I know how to relax your body completely. I\'m also able to do slow body massage, let me know if you need! All services mentioned are included in the price and will be providedHello, gorgeous man. I\'m a delicate and discreet companion, our pleasure will be bright and I know how to relax your body completely. I\'m also able to do slow body massage, let me know if you need! All services mentioned are included in the price and will be provided', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'black', '2024-12-20 16:44:19', '2024-12-20 16:45:03'),
(56, '16a070dd-193a-4416-ae6a-408596955db4', 'Sopoline Payne', 'suzuwo@mailinator.com', NULL, '$2y$12$FQYvrCotJpbHoEmCXpy9Te6kWMw6r1qyxtlwD.1zY77t4/qb4va5q', 'us', '+92', '215', 'Nulla lorem error al', 'Pariatur Aut eaque', NULL, 'Veniam aperiam volu', '21361', NULL, NULL, 'Non proident doloru', 'Molestiae sapiente c', 'Aut inventore impedi', 'Irure sit nostrud lo', 'Sit voluptas labori', 'Ducimus qui numquam', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Reprehenderit eaque', '2025-01-15 08:04:54', '2025-01-15 08:04:54'),
(57, 'a20a350c-1db8-482d-9b75-1981e92724c7', 'Sopoline Payne', 'kaka@mailinator.com', NULL, '$2y$12$kN91X19scrkebpPZ6TyTnelvu73GGSfXFdRtYVQD7McuMMQFAausi', 'us', '+92', '215', 'Nulla lorem error al', 'Pariatur Aut eaque', NULL, 'Veniam aperiam volu', '21361', NULL, NULL, 'Non proident doloru', 'Molestiae sapiente c', 'Aut inventore impedi', 'Irure sit nostrud lo', 'Sit voluptas labori', 'Ducimus qui numquam', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Reprehenderit eaque', '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(58, 'bdbdcd87-bc42-49b1-8ac1-fcae212bc9e5', 'Sopoline Payne', 'ka@mailinator.com', NULL, '$2y$12$fPXAWza7O5akA2c7EwM3uu2DgraDFmVla5L1oEOMUZkcPh3kjunr.', 'us', '+92', '215', 'Nulla lorem error al', 'Pariatur Aut eaque', NULL, 'Veniam aperiam volu', '21361', NULL, NULL, 'Non proident doloru', 'Molestiae sapiente c', 'Aut inventore impedi', 'Irure sit nostrud lo', 'Sit voluptas labori', 'Ducimus qui numquam', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Reprehenderit eaque', '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(59, 'c7c885d3-7e1a-443b-ba46-7b0ce0088435', 'Sopoline Payne', 'kasf@mailinator.com', NULL, '$2y$12$rDeJzBIAcbzd2qZAQVFxM.Sr8byjZnWjzizx9WaCcrN8r1wZNGUoi', 'us', '+92', '215', 'Nulla lorem error al', 'Pariatur Aut eaque', NULL, 'Veniam aperiam volu', '21361', NULL, NULL, 'Non proident doloru', 'Molestiae sapiente c', 'Aut inventore impedi', 'Irure sit nostrud lo', 'Sit voluptas labori', 'Ducimus qui numquam', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Reprehenderit eaque', '2025-01-15 08:10:40', '2025-01-28 08:10:40'),
(60, 'c23ff41a-b04d-4a4e-85c6-d8bace0b63df', 'Rhoda Beck', 'muxiqeh@mailinator.com', NULL, '$2y$12$I1EXIQVaCTdvxqERTpm4hO72Bp9fgXa3TMhFIdfeYeksHgCGf51rq', 'us', '+92', '967', 'Dolorem occaecat off', 'Quas beatae molestia', NULL, 'Enim in odit nulla p', '66919', NULL, NULL, 'Sequi exercitation q', 'Qui porro velit illo', 'Corrupti aut simili', 'Et doloribus cupidat', 'Et veritatis laborio', 'Magnam ratione harum', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Sed sequi quibusdam', '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(61, 'a772c36c-3d14-4019-ad8b-6f9f7d320175', 'vecagaf', 'vecagaf399@suggets.com', NULL, '$2y$12$I8zNHuqsJ91EVc5OBbx10OcSi3SZzOfGLajQPz1bqSJXkG47BxSVC', NULL, '55678', '89944457890', 'california', NULL, NULL, NULL, NULL, '24.8328937', '67.0734901', '27', 'brown', '5.8', '60', '45', NULL, 2, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'female', NULL, '2025-01-15 08:19:15', '2025-01-15 08:19:15'),
(62, '7115eb6a-09e8-4df5-ad7d-8b363fbe06a1', 'Rhoda Beck', 'auxiqeh@mailinator.com', NULL, '$2y$12$WgLGUbS7467kHGhJWcLkc.0K5gCxFDESgDkW3CgkmU/qDO2cXc9L2', 'us', '+92', '967', 'Dolorem occaecat off', 'Quas beatae molestia', NULL, 'Enim in odit nulla p', '66919', NULL, NULL, 'Sequi exercitation q', 'Qui porro velit illo', 'Corrupti aut simili', 'Et doloribus cupidat', 'Et veritatis laborio', 'Magnam ratione harum', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'woman', 'Sed sequi quibusdam', '2025-01-15 08:20:22', '2025-01-15 08:20:22'),
(63, '30f084d6-4a03-48f6-905a-5afd50b0a7a4', 'Escort 1', 'leveqogo@thetechnext.net', '2025-01-15 10:09:30', '$2y$12$oYyUu3JPCapL9/2SQNaLm.qUea4plnbkx9j7Y1CervbTueF.qchL.', 'USA', '+1', '1', 'USA', 'USA', 'USA', 'USA', '123', '1', '1', '18', 'Green', '10', '10', '10', 'lorem lorem', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'Man', 'black', '2025-01-15 08:29:24', '2025-01-15 10:09:30'),
(64, '144851a3-1dfb-4806-9ef4-03a77ec87948', 'Felicia Murphy', 'jadax72339@wirelay.com', NULL, '$2y$12$n1As9PNcj.wiay4Vs0bhLukbUHuRshKu766KOQhRIQpR.d6UYk2Yi', 'us', '+92', '961', 'Cheyenne, WY 82003, USA', 'Cheyenne', 'WY', 'United States', '82003', NULL, NULL, 'Sunt voluptas eligen', 'Ut explicabo Ex eni', 'Culpa ullam ut repud', 'Ratione aut nihil no', 'Atque temporibus cum', 'Lorem et tenetur qui', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'man', 'Et dolore consequatu', '2025-01-15 09:03:05', '2025-01-15 09:03:05'),
(65, 'f210a58c-0ce4-4aae-a7cd-5dbee99f57cc', 'Felicia Murphy', 'calok41452@suggets.com', NULL, '$2y$12$BvvJPv6xnqzTEeDcbLZLqO9f2mwHSxQuUOeYO2n/9wN1RNoHGSzV2', 'us', '+92', '961', 'Cheyenne, WY 82003, USA', 'Cheyenne', 'WY', 'United States', '82003', '24.8328937', NULL, 'Sunt voluptas eligen', 'Ut explicabo Ex eni', 'Culpa ullam ut repud', 'Ratione aut nihil no', 'Atque temporibus cum', 'Lorem et tenetur qui', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'man', 'Et dolore consequatu', '2025-01-15 09:05:26', '2025-01-15 09:05:26'),
(66, '2cfbee80-c339-4d51-8f83-bd7a9860dc63', 'levo', 'limuhy@dreamclarify.org', '2025-01-15 12:47:20', '$2y$12$TiJWfCfWqm/6q5gFEHbv8OEDlfcNuS34r04aCd499ti4X01cGdW9y', 'USA', '+1', '1', 'USA', 'USA', 'USA', 'USA', '123', '1', '1', '18', 'Green', '10', '10', '10', 'lorem lorem', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, 'Man', 'black', '2025-01-15 12:46:13', '2025-01-15 12:47:20'),
(67, 'fec123bf-3d3d-4781-a13e-0ed3d3b2d4d5', 'Heidi Mcfadden', 'navejiv@mailinator.com', NULL, '$2y$12$g/F4ieJcDrwomyyOlDwzmOku.fxXuZ8QhbezH.eGZtOdWSX4d2WR.', 'us', '+92', '461', 'Ex similique iusto o', 'Illo omnis sunt exer', NULL, 'Dolor voluptas minim', '24081', NULL, NULL, 'Aute omnis incididun', 'Minus temporibus qui', 'Velit voluptatem Lo', 'Quos corporis minima', 'Ab tenetur Nam offic', 'Ex iste fugiat ut et', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, NULL, 'Molestiae illum cup', '2025-01-16 08:28:56', '2025-01-16 08:28:56'),
(68, 'a6ed93fb-77a7-47ad-9ea7-95e507185db1', 'Tamekah Whitehead', 'hefoyo7454@downlor.com', '2025-01-16 08:47:40', '$2y$12$0gK1gkEw7KZEZ3wg1oAAXebxzedBkMiYO7IuaOxxtyfGjFu94s9lq', 'us', '+92', '804', 'Sint tempora ut labo', 'Animi eaque sed ut', NULL, 'Rerum nihil dolor di', '40327', NULL, NULL, 'Voluptas quae dolori', 'Vero eos sed dolor a', 'Voluptate iste ea vo', 'Veniam atque nihil', 'Nulla totam occaecat', 'Nisi dolore quo ipsu', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, NULL, 'Qui doloremque offic', '2025-01-16 08:46:51', '2025-01-16 08:47:40'),
(69, '27d06d10-f1e5-4629-b80d-4b1d21a981b0', 'Eric Rush', 'vewey91872@maonyn.com', NULL, '$2y$12$9E.Dek7.AsbFIY4Pn1Z40eKaSfNbouB1AqPFoUAUmLPEstGU5lgP6', 'us', '+92', '538', 'Illum quo asperiore', 'Laborum Consectetur', NULL, 'Sit similique cumqu', '78077', 'undefined', 'undefined', 'Omnis possimus aute', 'Delectus praesentiu', 'Laboriosam ab itaqu', 'Sed esse eaque disti', 'Id asperiores odio a', 'Voluptatem Nesciunt', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, NULL, 'Aut velit aut aliqu', '2025-01-20 10:03:10', '2025-01-20 10:03:10'),
(70, '5566e545-1385-468b-beda-20c942e59005', 'Tatiana Horton', 'sidogi2097@halbov.com', '2025-01-20 10:07:44', '$2y$12$IFOvTGGtKt6UddhyVe6t3ugveypGFSlkCKyqs9j8UYPKjeeorAFRa', 'us', '+92', '344', 'Pollock, LA 71467, USA', 'Pollock', 'LA', 'United States', '71467', '24.8329767', '67.0736076', 'Quia aliquam sed sun', 'Quam totam et et qui', 'Tempore veniam eaq', 'Deserunt sunt conseq', 'Nihil exercitationem', 'Quis consequatur To', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, NULL, 'Nesciunt nihil aliq', '2025-01-20 10:06:25', '2025-01-20 10:07:44'),
(71, 'afdcbb7b-043e-47de-b170-b6138530bb82', 'Emerald Park', 'wilozymo@mailinator.com', NULL, '$2y$12$VhteTxcnjJWGWbANXNlKU.Kp3xH.dK2Bk29WclHVvXyf2TJySvYve', 'us', '+92', '970', 'Voluptatem Maxime s', 'Dolore rerum perspic', NULL, 'Minim officia quisqu', '29856', '24.832951', '67.0735729', 'Dolore distinctio A', 'Quis ea quis est pos', 'Exercitationem non c', 'Nihil reprehenderit', 'Autem cum voluptatem', 'Non et sint impedit', 0, 1, 'Default', NULL, NULL, NULL, 0, NULL, NULL, 'Tempora maxime expli', '2025-01-20 10:37:19', '2025-01-20 10:37:19'),
(72, '0ec80955-f9fc-4074-a95a-24458b2ba5f6', 'Donovan Oneil', 'qemyvem@mailinator.com', NULL, '$2y$12$Ul/MVtUxJ2M5/E6LGVi9y.nUB197H5lIUnHIxGBmyqhXy.lnnt9ei', 'us', '+92', '186', '2300 Copenhagen, Denmark', 'Copenhagen', NULL, 'Denmark', '2300', '55.6752358', '12.636145', 'Architecto et nostru', 'Ipsa minus sed qui', 'Obcaecati temporibus', 'Dolorum asperiores c', 'Velit eos fuga Om', 'Quae et quasi non se', 0, 1, 'Default', NULL, NULL, NULL, 1, '2025-01-25 21:27:36', NULL, 'Eum labore architect', '2025-01-20 11:27:36', '2025-01-20 11:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_bookings`
--

CREATE TABLE `user_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`id`, `user_id`, `interest_id`, `status`, `created_at`, `updated_at`) VALUES
(236, 37, 1, 1, '2024-11-22 17:43:18', '2024-11-22 17:43:18'),
(237, 38, 1, 1, '2024-11-22 18:06:32', '2024-11-22 18:06:32'),
(238, 36, 1, 1, '2024-11-23 09:38:53', '2024-11-23 09:38:53'),
(271, 35, 1, 1, '2024-11-25 08:30:09', '2024-11-25 08:30:09'),
(272, 35, 2, 1, '2024-11-25 08:30:09', '2024-11-25 08:30:09'),
(273, 40, 1, 1, '2024-12-11 20:17:32', '2024-12-11 20:17:32'),
(274, 40, 2, 1, '2024-12-11 20:17:32', '2024-12-11 20:17:32'),
(275, 40, 3, 1, '2024-12-11 20:17:32', '2024-12-11 20:17:32'),
(276, 41, 1, 1, '2024-12-11 21:09:58', '2024-12-11 21:09:58'),
(277, 42, 1, 1, '2024-12-12 09:57:41', '2024-12-12 09:57:41'),
(284, 43, 1, 1, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(285, 43, 2, 1, '2024-12-12 21:10:10', '2024-12-12 21:10:10'),
(325, 45, 1, 1, '2024-12-13 16:03:24', '2024-12-13 16:03:24'),
(326, 45, 3, 1, '2024-12-13 16:03:24', '2024-12-13 16:03:24'),
(327, 45, 4, 1, '2024-12-13 16:03:24', '2024-12-13 16:03:24'),
(328, 45, 5, 1, '2024-12-13 16:03:24', '2024-12-13 16:03:24'),
(329, 45, 2, 1, '2024-12-13 16:03:24', '2024-12-13 16:03:24'),
(350, 47, 5, 1, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(351, 47, 4, 1, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(352, 47, 3, 1, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(353, 47, 2, 1, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(354, 47, 1, 1, '2024-12-17 07:24:04', '2024-12-17 07:24:04'),
(374, 49, 1, 1, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(375, 49, 2, 1, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(376, 49, 3, 1, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(377, 49, 4, 1, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(378, 49, 5, 1, '2024-12-17 16:28:18', '2024-12-17 16:28:18'),
(382, 44, 2, 1, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(383, 44, 3, 1, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(384, 44, 4, 1, '2024-12-18 10:09:59', '2024-12-18 10:09:59'),
(454, 51, 1, 1, '2024-12-20 14:50:13', '2024-12-20 14:50:13'),
(457, 46, 3, 1, '2024-12-20 15:05:43', '2024-12-20 15:05:43'),
(458, 46, 4, 1, '2024-12-20 15:05:43', '2024-12-20 15:05:43'),
(459, 46, 5, 1, '2024-12-20 15:05:43', '2024-12-20 15:05:43'),
(460, 46, 2, 1, '2024-12-20 15:05:43', '2024-12-20 15:05:43'),
(461, 46, 1, 1, '2024-12-20 15:05:43', '2024-12-20 15:05:43'),
(462, 48, 1, 1, '2024-12-20 15:10:19', '2024-12-20 15:10:19'),
(463, 48, 5, 1, '2024-12-20 15:10:19', '2024-12-20 15:10:19'),
(469, 50, 5, 1, '2024-12-20 15:11:57', '2024-12-20 15:11:57'),
(470, 50, 4, 1, '2024-12-20 15:11:57', '2024-12-20 15:11:57'),
(471, 50, 2, 1, '2024-12-20 15:11:57', '2024-12-20 15:11:57'),
(472, 50, 1, 1, '2024-12-20 15:11:57', '2024-12-20 15:11:57'),
(473, 50, 3, 1, '2024-12-20 15:11:57', '2024-12-20 15:11:57'),
(474, 52, 2, 1, '2024-12-20 15:16:57', '2024-12-20 15:16:57'),
(475, 52, 5, 1, '2024-12-20 15:16:57', '2024-12-20 15:16:57'),
(518, 53, 5, 1, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(519, 53, 4, 1, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(520, 53, 3, 1, '2024-12-20 15:29:44', '2024-12-20 15:29:44'),
(521, 54, 2, 1, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(522, 54, 3, 1, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(523, 54, 1, 1, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(524, 54, 4, 1, '2024-12-20 15:44:42', '2024-12-20 15:44:42'),
(528, 55, 4, 1, '2024-12-20 16:45:53', '2024-12-20 16:45:53'),
(529, 55, 3, 1, '2024-12-20 16:45:53', '2024-12-20 16:45:53'),
(530, 55, 1, 1, '2024-12-20 16:45:53', '2024-12-20 16:45:53'),
(531, 56, 2, 1, '2025-01-15 08:04:56', '2025-01-15 08:04:56'),
(532, 56, 3, 1, '2025-01-15 08:04:56', '2025-01-15 08:04:56'),
(533, 57, 2, 1, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(534, 57, 3, 1, '2025-01-15 08:06:35', '2025-01-15 08:06:35'),
(535, 58, 2, 1, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(536, 58, 3, 1, '2025-01-15 08:08:11', '2025-01-15 08:08:11'),
(537, 59, 2, 1, '2025-01-15 08:10:41', '2025-01-15 08:10:41'),
(538, 59, 3, 1, '2025-01-15 08:10:41', '2025-01-15 08:10:41'),
(539, 60, 3, 1, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(540, 60, 4, 1, '2025-01-15 08:17:49', '2025-01-15 08:17:49'),
(541, 62, 3, 1, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(542, 62, 4, 1, '2025-01-15 08:20:23', '2025-01-15 08:20:23'),
(543, 67, 1, 1, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(544, 67, 2, 1, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(545, 67, 3, 1, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(546, 67, 4, 1, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(547, 67, 5, 1, '2025-01-16 08:28:57', '2025-01-16 08:28:57'),
(548, 68, 1, 1, '2025-01-16 08:46:51', '2025-01-16 08:46:51'),
(549, 68, 5, 1, '2025-01-16 08:46:51', '2025-01-16 08:46:51'),
(550, 70, 3, 1, '2025-01-20 10:06:25', '2025-01-20 10:06:25'),
(551, 71, 1, 1, '2025-01-20 10:37:19', '2025-01-20 10:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_packages`
--

CREATE TABLE `user_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `status` enum('active','expired') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_packages`
--

INSERT INTO `user_packages` (`id`, `user_id`, `package_id`, `start_date`, `status`, `created_at`, `updated_at`) VALUES
(4, 35, 1, '2024-12-23', 'expired', '2025-01-22 17:30:12', '2025-01-22 17:30:12'),
(5, 36, 2, '2025-01-21', 'expired', '2025-01-22 17:30:12', '2025-01-23 15:03:12'),
(6, 37, 2, '2025-01-07', 'expired', '2025-01-22 17:30:12', '2025-01-22 17:56:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_package_id_foreign` (`user_package_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_bookings`
--
ALTER TABLE `user_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_packages_user_id_foreign` (`user_id`),
  ADD KEY `user_packages_package_id_foreign` (`package_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `user_bookings`
--
ALTER TABLE `user_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=552;

--
-- AUTO_INCREMENT for table `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_package_id_foreign` FOREIGN KEY (`user_package_id`) REFERENCES `user_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD CONSTRAINT `user_packages_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_packages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

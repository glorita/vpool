-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2018 at 05:54 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vpooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2018_02_12_173142_create_recipients_table', 1),
(3, '2018_02_12_181751_create_offers_table', 1),
(4, '2018_02_12_181825_create_vouchers_table', 1),
(5, '2018_02_12_214623_add_foreing_key', 2);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `percent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name`, `percent`, `created_at`, `updated_at`) VALUES
(1, 'Beach Time Ofer', 50, NULL, NULL),
(2, 'Christmas', 7, NULL, NULL),
(3, 'SALE', 7, NULL, NULL),
(4, '4 x 80$', 10, NULL, NULL),
(5, 'Special 30 ', 25, NULL, NULL),
(6, ' Season', 5, NULL, NULL),
(7, 'Special Offer', 3, NULL, NULL),
(8, ' All 60% OFF', 60, NULL, NULL),
(9, 'Up to 75%', 75, NULL, NULL),
(10, 'Shopify 25%', 25, NULL, NULL),
(11, '2x1', 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE `recipients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Maria', 'gloto@gmail.com', NULL, NULL),
(2, 'Fernanda', 'Sh0UpG96iW@gmail.com', NULL, NULL),
(3, 'Mollie Auer', 'ally94@gmail.com', NULL, NULL),
(4, 'Miss Dena Hauck', 'morar.kailee@deckow.biz', NULL, NULL),
(5, 'Newell Wolf', 'bins.kara@kuhlman.com', NULL, NULL),
(6, 'Abby Daniel', 'isaac.jerde@hilll.com', NULL, NULL),
(7, 'Jackeline Blanda Sr.', 'erin36@hotmail.com', NULL, NULL),
(8, 'Luella Bechtelar', 'douglas09@hotmail.com', NULL, NULL),
(9, 'Dr. Kory Wehner', 'xabernathy@gmail.com', NULL, NULL),
(10, 'Lenora Ledner', 'urban.bogisich@hotmail.com', NULL, NULL),
(11, 'Jefferey Moen MD', 'nolan.cummerata@vandervort.com', NULL, NULL),
(12, 'Prof. Gabriella Welch PhD', 'arutherford@huels.org', NULL, NULL),
(13, 'Ms. Annie Barrows', 'wellington.bode@hotmail.com', NULL, NULL),
(14, 'Alejandra Nicolas', 'brad80@langworth.net', NULL, NULL),
(15, 'Chaz D\'Amore', 'addie.mraz@beer.com', NULL, NULL),
(16, 'Dr. Jermaine Nolan Sr.', 'will.hildegard@gmail.com', NULL, NULL),
(17, 'Dr. Colin Robel II', 'tbednar@yahoo.com', NULL, NULL),
(18, 'Maud Jones', 'nlubowitz@hotmail.com', NULL, NULL),
(19, 'Orval Rohan', 'cwaters@gmail.com', NULL, NULL),
(20, 'Hyman Graham', 'hansen.diego@gislason.org', NULL, NULL),
(21, 'Maiya Kirlin III', 'sokon@yahoo.com', NULL, NULL),
(22, 'Ivory Predovic', 'velda.klein@yahoo.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_recip` int(10) UNSIGNED NOT NULL,
  `id_offer` int(10) UNSIGNED NOT NULL,
  `code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `expires` date NOT NULL,
  `used` tinyint(1) NOT NULL,
  `used_on` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `id_recip`, `id_offer`, `code`, `expires`, `used`, `used_on`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'PeO7Qfrz', '0000-00-00', 1, '0000-00-00 00:00:00', '2018-02-14 01:22:14', '2018-02-14 01:22:14'),
(2, 2, 1, 'M8I6eJij', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(3, 3, 1, 'AKzFduk3', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(4, 4, 1, 'YBY3F5EZ', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(5, 5, 1, 'bLxBHGjg', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(6, 6, 1, 'fzdQ6yfI', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(7, 7, 1, 'F13mQbyF', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(8, 8, 1, 'GgGpSCE3', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(9, 9, 1, 'ACnWa42X', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:49', '2018-02-13 03:55:49'),
(10, 10, 1, 'ZotD0Giw', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(11, 11, 1, 'Fvk8dxHl', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(12, 12, 1, 'KfAPYWOr', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(13, 13, 1, 'eH76QIl7', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(14, 14, 1, 'GiK2kaCf', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(15, 15, 1, 'v5MSERSq', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(16, 16, 1, 'QFvEiQ9r', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(17, 17, 1, 'HNUyFUWF', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(18, 18, 1, 'mwk0MXGj', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(19, 19, 1, 'oHkRhcX4', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(20, 20, 1, 'QIm4t4h3', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(21, 21, 1, 'PdKwOING', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(22, 22, 1, '9iXJgTjv', '0000-00-00', 0, '0000-00-00 00:00:00', '2018-02-13 03:55:50', '2018-02-13 03:55:50'),
(23, 1, 1, 'VXf2UffI', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(24, 2, 1, 'hmmH6NvF', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(25, 3, 1, 'hT2xLbkn', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(26, 4, 1, 'RvWsgagc', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(27, 5, 1, 'Dxvcsyct', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(28, 6, 1, 'dQLe2MfO', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(29, 7, 1, 'Scul4vf7', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(30, 8, 1, '9V0LG1IM', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(31, 9, 1, 'iRMNiJHH', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(32, 10, 1, '6pNgGa4r', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(33, 11, 1, 'A2TRQlsI', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:27', '2018-02-13 03:57:27'),
(34, 12, 1, 'mEJQaChU', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(35, 13, 1, 'XfvKqLkh', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(36, 14, 1, 'maYgPwlh', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(37, 15, 1, 'Ko7CQpv5', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(38, 16, 1, 'GGwI7hmh', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(39, 17, 1, 'ZJBbw6aO', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(40, 18, 1, 'g6WXLUlz', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(41, 19, 1, '48FFHita', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(42, 20, 1, 'g1uy7KX1', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(43, 21, 1, 'FXFzGp2V', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(44, 22, 1, 'cpsqzKCS', '2018-12-19', 0, '0000-00-00 00:00:00', '2018-02-13 03:57:28', '2018-02-13 03:57:28'),
(45, 1, 4, 'v8p7Cqun', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:08', '2018-02-13 04:02:08'),
(46, 2, 4, 'XHQ32sA0', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:08', '2018-02-13 04:02:08'),
(47, 3, 4, 'vF7F1z0M', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:08', '2018-02-13 04:02:08'),
(48, 4, 4, 'n8ZQREMC', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:08', '2018-02-13 04:02:08'),
(49, 5, 4, 'SxKA9sWJ', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:08', '2018-02-13 04:02:08'),
(50, 6, 4, 'ygV5IUbj', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:08', '2018-02-13 04:02:08'),
(51, 7, 4, 'qqfL404m', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(52, 8, 4, 'ZY8Zdl0O', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(53, 9, 4, 'ja77Mhys', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(54, 10, 4, 'kTUXWFCd', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(55, 11, 4, 'DU0QsqtI', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(56, 12, 4, 'KcEWDlI3', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(57, 13, 4, 'BedB5U51', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(58, 14, 4, '5UuuFn3u', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(59, 15, 4, 'mpYxThFM', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(60, 16, 4, 'I9sQ2K8g', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(61, 17, 4, 'C0RIOq5C', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(62, 18, 4, 'lajwMghn', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(63, 19, 4, 'PvraHwue', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(64, 20, 4, 'hoXQu8MD', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(65, 21, 4, 'tL7Etosp', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(66, 22, 4, '4rGKfV7Q', '2019-12-30', 0, '0000-00-00 00:00:00', '2018-02-13 04:02:09', '2018-02-13 04:02:09'),
(67, 1, 5, '7BySc1tg', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:40', '2018-02-13 05:10:40'),
(68, 2, 5, '3W8Kgors', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:40', '2018-02-13 05:10:40'),
(69, 3, 5, '9iGgNyXi', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:40', '2018-02-13 05:10:40'),
(70, 4, 5, 'aAP6N7X4', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:41', '2018-02-13 05:10:41'),
(71, 5, 5, 'E8P4hcNE', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:41', '2018-02-13 05:10:41'),
(72, 6, 5, '0r5zPOTB', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:41', '2018-02-13 05:10:41'),
(73, 7, 5, '6eLongCP', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:41', '2018-02-13 05:10:41'),
(74, 8, 5, 'gCoeYnyt', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:41', '2018-02-13 05:10:41'),
(75, 9, 5, 'ou93gvZE', '2017-08-01', 0, '0000-00-00 00:00:00', '2018-02-13 05:10:41', '2018-02-13 05:10:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recipients_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vouchers_id_offer_foreign` (`id_offer`),
  ADD KEY `vouchers_id_recip_foreign` (`id_recip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_id_offer_foreign` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id`),
  ADD CONSTRAINT `vouchers_id_recip_foreign` FOREIGN KEY (`id_recip`) REFERENCES `recipients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

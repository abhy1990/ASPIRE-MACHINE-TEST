-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 11:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aspire`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `amount` double(8,5) NOT NULL,
  `term` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=>pending,1=>approved,2=>rejected,3 = completed',
  `loanpaymentstatus` int(11) NOT NULL COMMENT '0=not paid 1 = partially paid 2 = fully paid',
  `approvedDate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `uid`, `amount`, `term`, `status`, `loanpaymentstatus`, `approvedDate`, `created_at`, `updated_at`) VALUES
(1, 2, 11.00000, 3, 3, 2, NULL, '2022-10-14 12:53:40', '2022-10-14 14:22:13'),
(2, 2, 225.35000, 3, 1, 2, NULL, '2022-10-14 12:54:12', '2022-10-14 15:16:24'),
(3, 2, 225.35000, 3, 0, 0, NULL, '2022-10-14 13:01:43', '2022-10-14 13:01:43'),
(4, 2, 225.35000, 3, 0, 0, NULL, '2022-10-14 13:01:56', '2022-10-14 13:01:56'),
(5, 2, 225.35000, 3, 3, 2, NULL, '2022-10-14 13:03:15', '2022-10-14 15:36:12'),
(6, 2, 225.35000, 3, 0, 0, NULL, '2022-10-14 13:03:16', '2022-10-14 13:03:16'),
(7, 2, 225.35000, 15, 0, 0, NULL, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(8, 2, 225.35000, 15, 0, 0, NULL, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(9, 2, 225.35100, 15, 0, 0, NULL, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(13, 2, 225.35100, 15, 0, 0, NULL, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(14, 2, 225.35100, 15, 0, 0, NULL, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(15, 2, 225.35100, 15, 0, 0, NULL, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(16, 2, 225.35100, 15, 0, 0, NULL, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(17, 2, 225.35100, 15, 0, 0, NULL, '2022-10-14 14:59:34', '2022-10-14 14:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_10_14_161408_create_loans_table', 2),
(11, '2022_10_14_162148_create_recurring_payments_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('19e601a03d1556d5dc1f3677f886c5cd009f28601e5d862aebe109e0a468a63d6a678363667fd9bc', 1, 1, 'Token', '[]', 0, '2022-10-14 10:31:40', '2022-10-14 10:31:40', '2023-10-14 16:01:40'),
('342b41e48e58a51b9035ce573454f7678d5e3b8d1fa1799625d1aa28db9589f47f67e159fa9817fe', 2, 1, 'Token', '[]', 0, '2022-10-14 12:27:28', '2022-10-14 12:27:28', '2023-10-14 17:57:28'),
('405d80984c69ebc3a59a27c29771f56c7f6eaa01d63ee8db150a219d314353b89979ce8b27027bf9', 1, 1, 'Token', '[]', 0, '2022-10-14 10:28:30', '2022-10-14 10:28:30', '2023-10-14 15:58:30'),
('4b8c97393e10d0bd026d6ee72fb4b749e94ce34a1ca97f3491109db50b96ef20ee4d2a5bc17188d6', 1, 1, 'Token', '[]', 0, '2022-10-14 10:23:26', '2022-10-14 10:23:26', '2023-10-14 15:53:26'),
('8eb373a3eeff43f1712013b7c93d041b7f59442eaefda909829072094611aaa5f172563ba289eb90', 2, 1, 'Token', '[]', 0, '2022-10-14 11:05:10', '2022-10-14 11:05:10', '2023-10-14 16:35:10'),
('8f272c6675689af30675ddda34f0f19038edd2ed6a7920f6dc7d4e0c55dde0f5cd493a28bb42c22a', 2, 1, 'Token', '[]', 0, '2022-10-14 16:05:54', '2022-10-14 16:05:54', '2023-10-14 21:35:54'),
('9662c76e5d9c22261c0f81a7e46df78b7033dafac52ceb847efbfa2b793c0f38941f88343810c74d', 1, 1, 'Token', '[]', 0, '2022-10-14 15:40:58', '2022-10-14 15:40:58', '2023-10-14 21:10:58'),
('caae05081cd86afeff8de0a1eab849b0ef8e35fc322b23bb30715acf3ad62f528621df050489a84b', 1, 1, 'Token', '[]', 0, '2022-10-14 11:04:43', '2022-10-14 11:04:43', '2023-10-14 16:34:43'),
('d6d4503c6fb128eef636d7a79ecfe6f399243d8fcb7a3677cf017e789fedae9cadd46d564b22df46', 2, 1, 'Token', '[]', 0, '2022-10-14 10:36:57', '2022-10-14 10:36:57', '2023-10-14 16:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'r7i8lsMsL1a96jGIRhFZz4Qarutb7OAdGzKAEGIK', NULL, 'http://localhost', 1, 0, 0, '2022-10-14 09:35:16', '2022-10-14 09:35:16'),
(2, NULL, 'Laravel Password Grant Client', 'EtULniu3zQnnaSfir2UXbk4dByQ1vTTEoPvsqNjd', 'users', 'http://localhost', 0, 1, 0, '2022-10-14 09:35:16', '2022-10-14 09:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-14 09:35:16', '2022-10-14 09:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_payments`
--

CREATE TABLE `recurring_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loanID` int(11) NOT NULL,
  `payableamount` double(8,5) NOT NULL,
  `paidamount` double(8,5) DEFAULT NULL,
  `paiddate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `paymentstatus` int(11) NOT NULL COMMENT '0=>need to be paid,1=>paid,2=>overdue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recurring_payments`
--

INSERT INTO `recurring_payments` (`id`, `loanID`, `payableamount`, `paidamount`, `paiddate`, `duedate`, `paymentstatus`, `created_at`, `updated_at`) VALUES
(1, 1, 3.67000, 3.67000, '2022-10-14', '2022-10-21', 2, '2022-10-14 12:53:40', '2022-10-14 14:22:13'),
(2, 1, 3.67000, 3.67000, '2022-10-14', '2022-10-28', 2, '2022-10-14 12:53:40', '2022-10-14 14:22:13'),
(3, 1, 3.67000, 3.67000, '2022-10-14', '2022-11-04', 1, '2022-10-14 12:53:40', '2022-10-14 15:16:24'),
(4, 2, 75.12000, NULL, NULL, '2022-10-21', 0, '2022-10-14 12:54:12', '2022-10-14 12:54:12'),
(5, 2, 75.12000, NULL, NULL, '2022-10-28', 0, '2022-10-14 12:54:12', '2022-10-14 12:54:12'),
(6, 2, 75.12000, NULL, NULL, '2022-11-04', 0, '2022-10-14 12:54:12', '2022-10-14 12:54:12'),
(7, 3, 75.12000, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:01:43', '2022-10-14 13:01:43'),
(8, 3, 75.12000, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:01:43', '2022-10-14 13:01:43'),
(9, 3, 75.12000, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:01:43', '2022-10-14 13:01:43'),
(10, 4, 75.12000, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:01:56', '2022-10-14 13:01:56'),
(11, 4, 75.12000, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:01:56', '2022-10-14 13:01:56'),
(12, 4, 75.12000, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:01:56', '2022-10-14 13:01:56'),
(13, 5, 75.12000, 75.12000, '2022-10-14', '2022-10-21', 1, '2022-10-14 13:03:15', '2022-10-14 15:36:12'),
(14, 5, 75.12000, 75.12000, '2022-10-14', '2022-10-28', 1, '2022-10-14 13:03:15', '2022-10-14 15:36:12'),
(15, 5, 75.12000, 75.12000, '2022-10-14', '2022-11-04', 1, '2022-10-14 13:03:15', '2022-10-14 15:36:12'),
(16, 6, 75.12000, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:03:16', '2022-10-14 13:03:16'),
(17, 6, 75.12000, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:03:16', '2022-10-14 13:03:16'),
(18, 6, 75.12000, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:03:16', '2022-10-14 13:03:16'),
(19, 7, 15.02000, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(20, 7, 15.02000, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(21, 7, 15.02000, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(22, 7, 15.02000, NULL, NULL, '2022-11-11', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(23, 7, 15.02000, NULL, NULL, '2022-11-18', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(24, 7, 15.02000, NULL, NULL, '2022-11-25', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(25, 7, 15.02000, NULL, NULL, '2022-12-02', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(26, 7, 15.02000, NULL, NULL, '2022-12-09', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(27, 7, 15.02000, NULL, NULL, '2022-12-16', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(28, 7, 15.02000, NULL, NULL, '2022-12-23', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(29, 7, 15.02000, NULL, NULL, '2022-12-30', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(30, 7, 15.02000, NULL, NULL, '2023-01-06', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(31, 7, 15.02000, NULL, NULL, '2023-01-13', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(32, 7, 15.02000, NULL, NULL, '2023-01-20', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(33, 7, 15.02000, NULL, NULL, '2023-01-27', 0, '2022-10-14 13:03:36', '2022-10-14 13:03:36'),
(34, 8, 15.02000, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(35, 8, 15.02000, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(36, 8, 15.02000, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(37, 8, 15.02000, NULL, NULL, '2022-11-11', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(38, 8, 15.02000, NULL, NULL, '2022-11-18', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(39, 8, 15.02000, NULL, NULL, '2022-11-25', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(40, 8, 15.02000, NULL, NULL, '2022-12-02', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(41, 8, 15.02000, NULL, NULL, '2022-12-09', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(42, 8, 15.02000, NULL, NULL, '2022-12-16', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(43, 8, 15.02000, NULL, NULL, '2022-12-23', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(44, 8, 15.02000, NULL, NULL, '2022-12-30', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(45, 8, 15.02000, NULL, NULL, '2023-01-06', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(46, 8, 15.02000, NULL, NULL, '2023-01-13', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(47, 8, 15.02000, NULL, NULL, '2023-01-20', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(48, 8, 15.02000, NULL, NULL, '2023-01-27', 0, '2022-10-14 13:08:43', '2022-10-14 13:08:43'),
(49, 9, 15.02340, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(50, 9, 15.02340, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(51, 9, 15.02340, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(52, 9, 15.02340, NULL, NULL, '2022-11-11', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(53, 9, 15.02340, NULL, NULL, '2022-11-18', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(54, 9, 15.02340, NULL, NULL, '2022-11-25', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(55, 9, 15.02340, NULL, NULL, '2022-12-02', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(56, 9, 15.02340, NULL, NULL, '2022-12-09', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(57, 9, 15.02340, NULL, NULL, '2022-12-16', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(58, 9, 15.02340, NULL, NULL, '2022-12-23', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(59, 9, 15.02340, NULL, NULL, '2022-12-30', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(60, 9, 15.02340, NULL, NULL, '2023-01-06', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(61, 9, 15.02340, NULL, NULL, '2023-01-13', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(62, 9, 15.02340, NULL, NULL, '2023-01-20', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(63, 9, 15.02340, NULL, NULL, '2023-01-27', 0, '2022-10-14 13:09:20', '2022-10-14 13:09:20'),
(64, 13, 15.02340, NULL, NULL, '2022-10-21', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(65, 13, 15.02340, NULL, NULL, '2022-10-28', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(66, 13, 15.02340, NULL, NULL, '2022-11-04', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(67, 13, 15.02340, NULL, NULL, '2022-11-11', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(68, 13, 15.02340, NULL, NULL, '2022-11-18', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(69, 13, 15.02340, NULL, NULL, '2022-11-25', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(70, 13, 15.02340, NULL, NULL, '2022-12-02', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(71, 13, 15.02340, NULL, NULL, '2022-12-09', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(72, 13, 15.02340, NULL, NULL, '2022-12-16', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(73, 13, 15.02340, NULL, NULL, '2022-12-23', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(74, 13, 15.02340, NULL, NULL, '2022-12-30', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(75, 13, 15.02340, NULL, NULL, '2023-01-06', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(76, 13, 15.02340, NULL, NULL, '2023-01-13', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(77, 13, 15.02340, NULL, NULL, '2023-01-20', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(78, 13, 15.02340, NULL, NULL, '2023-01-27', 0, '2022-10-14 13:32:32', '2022-10-14 13:32:32'),
(79, 14, 15.02340, NULL, NULL, '2022-10-22', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(80, 14, 15.02340, NULL, NULL, '2022-10-30', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(81, 14, 15.02340, NULL, NULL, '2022-11-07', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(82, 14, 15.02340, NULL, NULL, '2022-11-15', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(83, 14, 15.02340, NULL, NULL, '2022-11-23', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(84, 14, 15.02340, NULL, NULL, '2022-12-01', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(85, 14, 15.02340, NULL, NULL, '2022-12-09', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(86, 14, 15.02340, NULL, NULL, '2022-12-17', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(87, 14, 15.02340, NULL, NULL, '2022-12-25', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(88, 14, 15.02340, NULL, NULL, '2023-01-02', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(89, 14, 15.02340, NULL, NULL, '2023-01-10', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(90, 14, 15.02340, NULL, NULL, '2023-01-18', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(91, 14, 15.02340, NULL, NULL, '2023-01-26', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(92, 14, 15.02340, NULL, NULL, '2023-02-03', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(93, 14, 15.02340, NULL, NULL, '2023-02-11', 0, '2022-10-14 13:34:39', '2022-10-14 13:34:39'),
(94, 15, 15.02340, NULL, NULL, '2022-10-22', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(95, 15, 15.02340, NULL, NULL, '2022-10-29', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(96, 15, 15.02340, NULL, NULL, '2022-11-05', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(97, 15, 15.02340, NULL, NULL, '2022-11-12', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(98, 15, 15.02340, NULL, NULL, '2022-11-19', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(99, 15, 15.02340, NULL, NULL, '2022-11-26', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(100, 15, 15.02340, NULL, NULL, '2022-12-03', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(101, 15, 15.02340, NULL, NULL, '2022-12-10', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(102, 15, 15.02340, NULL, NULL, '2022-12-17', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(103, 15, 15.02340, NULL, NULL, '2022-12-24', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(104, 15, 15.02340, NULL, NULL, '2022-12-31', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(105, 15, 15.02340, NULL, NULL, '2023-01-07', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(106, 15, 15.02340, NULL, NULL, '2023-01-14', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(107, 15, 15.02340, NULL, NULL, '2023-01-21', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(108, 15, 15.02340, NULL, NULL, '2023-01-28', 0, '2022-10-14 13:36:28', '2022-10-14 13:36:28'),
(109, 16, 15.02340, NULL, NULL, '2022-10-22', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(110, 16, 15.02340, NULL, NULL, '2022-10-29', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(111, 16, 15.02340, NULL, NULL, '2022-11-05', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(112, 16, 15.02340, NULL, NULL, '2022-11-12', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(113, 16, 15.02340, NULL, NULL, '2022-11-19', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(114, 16, 15.02340, NULL, NULL, '2022-11-26', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(115, 16, 15.02340, NULL, NULL, '2022-12-03', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(116, 16, 15.02340, NULL, NULL, '2022-12-10', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(117, 16, 15.02340, NULL, NULL, '2022-12-17', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(118, 16, 15.02340, NULL, NULL, '2022-12-24', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(119, 16, 15.02340, NULL, NULL, '2022-12-31', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(120, 16, 15.02340, NULL, NULL, '2023-01-07', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(121, 16, 15.02340, NULL, NULL, '2023-01-14', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(122, 16, 15.02340, NULL, NULL, '2023-01-21', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(123, 16, 15.02340, NULL, NULL, '2023-01-28', 0, '2022-10-14 14:59:28', '2022-10-14 14:59:28'),
(124, 17, 15.02340, NULL, NULL, '2022-10-22', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(125, 17, 15.02340, NULL, NULL, '2022-10-29', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(126, 17, 15.02340, NULL, NULL, '2022-11-05', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(127, 17, 15.02340, NULL, NULL, '2022-11-12', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(128, 17, 15.02340, NULL, NULL, '2022-11-19', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(129, 17, 15.02340, NULL, NULL, '2022-11-26', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(130, 17, 15.02340, NULL, NULL, '2022-12-03', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(131, 17, 15.02340, NULL, NULL, '2022-12-10', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(132, 17, 15.02340, NULL, NULL, '2022-12-17', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(133, 17, 15.02340, NULL, NULL, '2022-12-24', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(134, 17, 15.02340, NULL, NULL, '2022-12-31', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(135, 17, 15.02340, NULL, NULL, '2023-01-07', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(136, 17, 15.02340, NULL, NULL, '2023-01-14', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(137, 17, 15.02340, NULL, NULL, '2023-01-21', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34'),
(138, 17, 15.02340, NULL, NULL, '2023-01-28', 0, '2022-10-14 14:59:34', '2022-10-14 14:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userrole` int(11) NOT NULL COMMENT '1=user,0=admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `userrole`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abhishek', 'abhishek@mailinator.com', NULL, '$2y$10$lyRV/88/Xv4mI.aUljJwKeKvYQomc6zNI/wP6vUiCBlxXOJ.gcH6G', 0, NULL, '2022-10-14 10:23:25', '2022-10-14 10:23:25'),
(2, 'Abhishek', 'abhishek1@mailinator.com', NULL, '$2y$10$JFt7QC6IpO1BkHWl/SSxte9LeJssW/x5jUFxEvxeymrHQ6j39VQWO', 1, NULL, '2022-10-14 10:36:57', '2022-10-14 10:36:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `recurring_payments`
--
ALTER TABLE `recurring_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recurring_payments`
--
ALTER TABLE `recurring_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

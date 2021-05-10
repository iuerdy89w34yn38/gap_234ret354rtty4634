-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 03:35 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cc_olobank`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@thesoftking.com', NULL, '$2y$10$O1DQUSRMwtbd99aDDefUfu1GenvRWHCJT3RuYseMo.PloarQfexyu', 'nrHLY6YqBlLC6VUs1kZoaGzTBIxeYDAV4pORQn8cmuzbhARW7wNX0qlWWaqh', '2018-11-12 18:00:00', '2019-05-12 10:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `p_time` varchar(191) DEFAULT NULL,
  `min_amount` float(8,2) NOT NULL DEFAULT 0.00,
  `max_amount` float(8,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` float(8,2) NOT NULL DEFAULT 0.00,
  `percent_charge` float(8,2) NOT NULL DEFAULT 0.00,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `p_time`, `min_amount`, `max_amount`, `fixed_charge`, `percent_charge`, `updated_at`, `created_at`, `status`) VALUES
(1, 'Soft Bank', '1-3 day', 10.00, 100.00, 0.00, 0.00, '2019-11-04 12:05:56', '2019-11-04 12:05:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(191) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(191) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gateway_id` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=auto, 0=manual',
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `try` int(11) NOT NULL DEFAULT 0,
  `account` blob DEFAULT NULL,
  `verify_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fix_deposits`
--

CREATE TABLE `fix_deposits` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `fix_deposit_paks_id` int(191) DEFAULT NULL,
  `amount` float(8,2) NOT NULL DEFAULT 0.00,
  `percent_return` varchar(191) NOT NULL DEFAULT '0',
  `return_total` float(8,2) NOT NULL DEFAULT 0.00,
  `return_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fix_deposit_paks`
--

CREATE TABLE `fix_deposit_paks` (
  `id` int(11) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `min_amount` float(8,2) NOT NULL DEFAULT 0.00,
  `max_amount` float(8,2) NOT NULL DEFAULT 0.00,
  `days` varchar(191) NOT NULL DEFAULT '0',
  `percent_return` varchar(191) NOT NULL DEFAULT '0',
  `status` varchar(191) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minamo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxamo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent_charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paytm Website',
  `val4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paytm Industry Type',
  `val5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paytm Channel ID',
  `val6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paytm Transaction URL',
  `val7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paytm Transaction Status URL',
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `main_name`, `name`, `minamo`, `maxamo`, `fixed_charge`, `percent_charge`, `rate`, `val1`, `val2`, `val3`, `val4`, `val5`, `val6`, `val7`, `status`, `created_at`, `updated_at`) VALUES
(101, 'PayPal', 'PayPal', '5', '1000', '.10', '0', '82', 'rexrifat636@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-04-22 04:53:27'),
(102, 'PerfectMoney', 'Perfect Money', '20', '20000', '2', '1', '80', 'U5376900', 'G079qn4Q7XATZBqyoCkBteGRg', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-04-21 09:42:15'),
(103, 'Stripe', 'Credit Card', '10', '50000', '3', '3', '80', 'sk_test_aat3tzBCCXXBkS4sxY3M8A1B', 'pk_test_AU3G7doZ1sbdpJLj0NaozPBu', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-04-25 10:59:41'),
(104, 'Skrill', 'Skrill', '10', '50000', '3', '3', '90', 'merchant@skrill', 'TheSoftKing', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-04-21 09:42:01'),
(105, 'PayTM', 'PayTM', '1', '100', '1', '1', '1', 'PoojaE46324372286132', 'JAKMX9PVoj208dMq', 'WEB_STAGINGb', 'Retail', 'WEB', 'https://pguat.paytm.com/oltp-web/processTransaction', 'https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp', 1, NULL, '2019-03-07 21:38:53'),
(106, 'Payeer', 'Payeer', '1', '100', '1', '1', '1', '627881897', 'Admin727096', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-03-16 22:38:42'),
(107, 'PayStack', 'PayStack', '1', '100', '1', '1', '1', 'pk_test_c1775454cc81a5ad2d6a31d0b0471585d44c4dcb', 'sk_test_22327c329aa7ea76448cfe279aa1e5d583d306fa', NULL, NULL, NULL, NULL, '0.0028', 1, NULL, '2018-08-18 01:31:07'),
(108, 'VoguePay', 'VoguePay', '1', '100', '1', '1', '1', 'demo', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-29 02:09:58'),
(501, 'Blockchain.info', 'BitCoin', '1', '20000', '1', '0.5', '80', '3965f52f-ec19-43af-90ed-d613dc60657eSSS', 'xpub6DREmHywjNizvs9b4hhNekcjFjvL4rshJjnrHHgtLNCSbhhx5jKFRgqdmXAecLAddEPudDZY4xoDbV1NVHSCeDp1S7NumPCNNjbxB7sGasY0000', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-21 01:20:29'),
(502, 'block.io - BTC', 'BitCoin', '1', '99999', '1', '0.5', '80', '1658-8015-2e5e-9afb', '09876softk', NULL, NULL, NULL, NULL, NULL, 1, '2018-01-27 18:00:00', '2018-05-31 09:12:55'),
(503, 'block.io - LTC', 'LiteCoin', '100', '10000', '0.4', '1', '80', 'cb91-a5bc-69d7-1c27', '09876softk', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:27:34'),
(504, 'block.io - DOGE', 'DogeCoin', '1', '50000', '0.51', '2.52', '80', '2daf-d165-2135-5951', '09876softk', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:28:54'),
(505, 'CoinPayment - BTC', 'BitCoin', '1', '50000', '0.51', '2.52', '80', '596f0097ed9d1ab8cfed05eb59c70e9f066513dfe4df64a8fc3917d309328315', '7472928395208f70E3cE30B9e10dc882cBDD3e9967b7942AaE492106d9C7bE44', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:38:33'),
(506, 'CoinPayment - ETH', 'Etherium', '1', '50000', '0.51', '2.52', '79', '596f0097ed9d1ab8cfed05eb59c70e9f066513dfe4df64a8fc3917d309328315', '7472928395208f70E3cE30B9e10dc882cBDD3e9967b7942AaE492106d9C7bE44', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-16 03:42:22'),
(507, 'CoinPayment - BCH', 'Bitcoin Cash', '1', '50000', '0.51', '2.52', '80', '596f0097ed9d1ab8cfed05eb59c70e9f066513dfe4df64a8fc3917d309328315', '7472928395208f70E3cE30B9e10dc882cBDD3e9967b7942AaE492106d9C7bE44', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:39:04'),
(508, 'CoinPayment - DASH', 'DASH', '1', '50000', '0.51', '2.52', '80', '596f0097ed9d1ab8cfed05eb59c70e9f066513dfe4df64a8fc3917d309328315', '7472928395208f70E3cE30B9e10dc882cBDD3e9967b7942AaE492106d9C7bE44', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:39:04'),
(509, 'CoinPayment - DOGE', 'DOGE', '1', '50000', '0.51', '2.52', '80', '596f0097ed9d1ab8cfed05eb59c70e9f066513dfe4df64a8fc3917d309328315', '7472928395208f70E3cE30B9e10dc882cBDD3e9967b7942AaE492106d9C7bE44', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:39:04'),
(510, 'CoinPayment - LTC', 'LTC', '1', '50000', '0.51', '2.52', '80', '596f0097ed9d1ab8cfed05eb59c70e9f066513dfe4df64a8fc3917d309328315', '7472928395208f70E3cE30B9e10dc882cBDD3e9967b7942AaE492106d9C7bE44', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-31 09:39:04'),
(512, 'CoinGate', 'CoinGate', '10', '1000', '05', '5', '80', 'Ba1VgPx6d437xLXGKCBkmwVCEw5kHzRJ6thbGo-N', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-07-08 18:00:00', '2019-02-24 12:26:00'),
(513, 'CoinPayment-ALL', 'Coin Payment', '10', '1000', '05', '5', '80', 'db1d9f12444e65c921604e289a281c56', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-05-21 01:20:54');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_manuals`
--

CREATE TABLE `gateway_manuals` (
  `id` int(10) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `rate` varchar(191) DEFAULT NULL,
  `minamo` varchar(191) DEFAULT NULL,
  `maxamo` varchar(191) DEFAULT NULL,
  `fixed_charge` varchar(191) DEFAULT NULL,
  `percent_charge` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `dec` longtext DEFAULT NULL,
  `method_cur` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `id` int(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `tw_link` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `pint_link` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(191) NOT NULL,
  `user_id` varchar(191) DEFAULT NULL,
  `loan_packages_id` varchar(191) DEFAULT NULL,
  `days` varchar(191) DEFAULT '0',
  `charge` float(8,2) NOT NULL DEFAULT 0.00,
  `amount` float(8,2) NOT NULL DEFAULT 0.00,
  `return_date` date DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_packages`
--

CREATE TABLE `loan_packages` (
  `id` int(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `min_amount` varchar(191) DEFAULT '0',
  `max_amount` varchar(191) DEFAULT '0',
  `days` varchar(191) DEFAULT '0',
  `fixed_charge` varchar(191) DEFAULT '0',
  `percent_charge` varchar(191) DEFAULT '0',
  `status` varchar(191) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_packages`
--

INSERT INTO `loan_packages` (`id`, `name`, `min_amount`, `max_amount`, `days`, `fixed_charge`, `percent_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test pack', '210', '10', '10', '10', '10', '1', '2020-02-04 13:21:14', '2020-02-04 13:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branding` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colortwo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_api` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `registration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `script` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_api` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fag` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bal_trans_fixed_charge` float(8,2) NOT NULL DEFAULT 0.00,
  `bal_trans_per_charge` float(8,2) NOT NULL DEFAULT 0.00,
  `video_section_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_section_dec` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_section_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_subtitle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_subtitle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latest_tran_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latest_tran_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `branding`, `color1`, `colortwo`, `email_from`, `email_body`, `email_notification`, `sms_api`, `sms_notification`, `email_verification`, `sms_verification`, `registration`, `script`, `created_at`, `updated_at`, `service_subtitle`, `contact_thumbnail`, `cur`, `cur_symbol`, `facebook_api`, `fag`, `footer_image`, `bal_trans_fixed_charge`, `bal_trans_per_charge`, `video_section_title`, `video_section_dec`, `video_link`, `about_title`, `about_subtitle`, `video_section_banner`, `service_title`, `faq_title`, `faq_subtitle`, `blog_title`, `blog_subtitle`, `investor_title`, `investor_des`, `latest_tran_title`, `latest_tran_des`) VALUES
(1, 'OLOBank', '© 2019 OLOBank. All rights reserved', '052157', '91039F', 'do-not-reply@thesoftking.com', '<br><br>\r\n	<div class=\"contents\" style=\"max-width: 600px; margin: 0 auto; border: 2px solid #000036;\">\r\n\r\n<div class=\"header\" style=\"background-color: #000036; padding: 15px; text-align: center;\">\r\n	<div class=\"logo\" style=\"width: 260px;text-align: center; margin: 0 auto;\">\r\n		<img src=\"https://i.imgur.com/4NN55uD.png\" alt=\"THESOFTKING\" style=\"width: 100%;\">\r\n	</div>\r\n</div>\r\n\r\n<div class=\"mailtext\" style=\"padding: 30px 15px; background-color: #f0f8ff; font-family: \'Open Sans\', sans-serif; font-size: 16px; line-height: 26px;\">\r\n\r\nHi {{name}},\r\n<br><br>\r\n{{message}}\r\n<br><br>\r\n<br><br>\r\n</div>\r\n\r\n<div class=\"footer\" style=\"background-color: #000036; padding: 15px; text-align: center;\">\r\n<a href=\"https://thesoftking.com/\" style=\"	background-color: #2ecc71;\r\n	padding: 10px 0;\r\n	margin: 10px;\r\n	display: inline-block;\r\n	width: 100px;\r\n	text-transform: uppercase;\r\n	text-decoration: none;\r\n	color: #ffff;\r\n	font-weight: 600;\r\n	border-radius: 4px;\">Website</a>\r\n<a href=\"https://thesoftking.com/products\" style=\"	background-color: #2ecc71;\r\n	padding: 10px 0;\r\n	margin: 10px;\r\n	display: inline-block;\r\n	width: 100px;\r\n	text-transform: uppercase;\r\n	text-decoration: none;\r\n	color: #ffff;\r\n	font-weight: 600;\r\n	border-radius: 4px;\">Products</a>\r\n<a href=\"https://thesoftking.com/contact\" style=\"	background-color: #2ecc71;\r\n	padding: 10px 0;\r\n	margin: 10px;\r\n	display: inline-block;\r\n	width: 100px;\r\n	text-transform: uppercase;\r\n	text-decoration: none;\r\n	color: #ffff;\r\n	font-weight: 600;\r\n	border-radius: 4px;\">Contact</a>\r\n</div>\r\n\r\n\r\n<div class=\"footer\" style=\"background-color: #000036; padding: 15px; text-align: center; border-top: 1px solid rgba(255, 255, 255, 0.2);\">\r\n\r\n<strong style=\"color: #fff;\">© 2011 - 2019 THESOFTKING. All Rights Reserved.</strong>\r\n<p style=\"color: #ddd;\">TheSoftKing is not partnered with any other \r\ncompany or person. We work as a team and do not have any reseller, \r\ndistributor or partner!</p>\r\n\r\n\r\n</div>\r\n\r\n	</div>\r\n<br><br>', 1, 'https://api.infobip.com/api/v3/sendsms/plain?user=****&password=*****&sender=OLOBank&SMSText={{message}}&GSM={{number}}&type=longSMS', 0, 0, 0, '1', 'wvvwvwvw', '2018-11-13 18:00:00', '2019-11-04 11:52:43', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit adipisci incidunt est, harum eaque laborum omnis, ea odio.', '5gvRFEgyWL1vpFTmHg7hz8k0ia9k8pc09Qp5j0N3.jpeg', 'USD', '$', '205856110142667', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px; color: rgb(0, 0, 0);\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><br></div>', 'lyW5tX3sqvcUjMg7B5DH1ECYbIxxIc7v6xpV4bt4.jpeg', 2.00, 3.00, 'Banking for Easy Life', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'https://www.youtube.com/watch?v=GT6-H4BRyqQ', 'About Us', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit adipisci incidunt est, harum eaque laborum omnis, ea odio.', 'video-banner.jpg', 'Our Services', 'Frequently Asked Questions', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit adipisci incidunt est, harum eaque laborum omnis, ea odio.', 'Latest News', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit adipisci incidunt est, harum eaque laborum omnis, ea odio.', 'Our Top Investors', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit adipisci incidunt est, harum eaque laborum omnis, ea odio.', 'Latest Transaction', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit adipisci incidunt est, harum eaque laborum omnis, ea odio.');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` longtext DEFAULT NULL,
  `banner` varchar(191) DEFAULT NULL,
  `btn_name` varchar(191) DEFAULT NULL,
  `btn_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `subtitle`, `banner`, `btn_name`, `btn_link`, `created_at`, `updated_at`) VALUES
(1, 'Easiest way to Get loan', 'Apply for Loan Today from olobank', 'qjTb3AQpGz0i4QURtSZe8eFsD5pAOZe2EBzRyFIn.jpeg', 'Apply now', 'register', '2019-04-10 05:47:44', '2019-07-23 09:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `social_icons`
--

CREATE TABLE `social_icons` (
  `id` int(191) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` varchar(111) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `trxid` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT '0',
  `balance` varchar(191) DEFAULT '0',
  `fee` varchar(191) DEFAULT '0',
  `p_time` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `details` longtext DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` float(8,2) DEFAULT 0.00,
  `amount` float(8,2) DEFAULT 0.00,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_verified` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_time` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_time` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_send` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_banned` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(191) NOT NULL,
  `wmethod_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `account` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wmethods`
--

CREATE TABLE `wmethods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minamo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `maxamo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fixed_charge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `percent_charge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `val1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fix_deposits`
--
ALTER TABLE `fix_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fix_deposit_paks`
--
ALTER TABLE `fix_deposit_paks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_manuals`
--
ALTER TABLE `gateway_manuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_packages`
--
ALTER TABLE `loan_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_icons`
--
ALTER TABLE `social_icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wmethods`
--
ALTER TABLE `wmethods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fix_deposits`
--
ALTER TABLE `fix_deposits`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fix_deposit_paks`
--
ALTER TABLE `fix_deposit_paks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;

--
-- AUTO_INCREMENT for table `gateway_manuals`
--
ALTER TABLE `gateway_manuals`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_packages`
--
ALTER TABLE `loan_packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_icons`
--
ALTER TABLE `social_icons`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wmethods`
--
ALTER TABLE `wmethods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

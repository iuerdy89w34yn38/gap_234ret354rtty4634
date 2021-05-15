-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2021 at 04:23 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gap`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@thesoftking.com', NULL, '$2y$10$O1DQUSRMwtbd99aDDefUfu1GenvRWHCJT3RuYseMo.PloarQfexyu', 'nrHLY6YqBlLC6VUs1kZoaGzTBIxeYDAV4pORQn8cmuzbhARW7wNX0qlWWaqh', '2018-11-12 18:00:00', '2019-05-12 10:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `p_time` varchar(191) DEFAULT NULL,
  `min_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `max_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` float(8,2) NOT NULL DEFAULT '0.00',
  `percent_charge` float(8,2) NOT NULL DEFAULT '0.00',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `p_time`, `min_amount`, `max_amount`, `fixed_charge`, `percent_charge`, `updated_at`, `created_at`, `status`) VALUES
(1, 'Soft Bank', '1-3 day', 10.00, 100.00, 0.00, 0.00, '2019-11-04 12:05:56', '2019-11-04 12:05:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` longtext,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `description` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
CREATE TABLE IF NOT EXISTS `cards` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) DEFAULT NULL,
  `card_packages_id` varchar(191) DEFAULT NULL,
  `days` varchar(191) DEFAULT '0',
  `charge` float(8,2) NOT NULL DEFAULT '0.00',
  `amount` text,
  `card` text,
  `exp` text,
  `cvv` int(11) DEFAULT NULL,
  `remlimit` float DEFAULT '0',
  `return_date` date DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `user_id`, `card_packages_id`, `days`, `charge`, `amount`, `card`, `exp`, `cvv`, `remlimit`, `return_date`, `status`, `updated_at`, `created_at`) VALUES
(2, '1', '6', '2', 248.46, '12398', '7349847589345601', '10/33', 453, 0.132123, '2021-05-11', '1', '2021-05-10 10:17:29', '2021-05-10 08:02:59'),
(4, '1', '5', '1', 248.26, '12398hui98urecxdfr43932u8eei21', '3847589384756234', '03/23', 889, 0.2477, '2021-05-11', '1', '2021-05-10 10:17:00', '2021-05-10 08:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `card_packages`
--

DROP TABLE IF EXISTS `card_packages`;
CREATE TABLE IF NOT EXISTS `card_packages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `min_amount` varchar(191) DEFAULT '0',
  `max_amount` varchar(191) DEFAULT '0',
  `days` varchar(191) DEFAULT '0',
  `fixed_charge` varchar(191) DEFAULT '0',
  `percent_charge` varchar(191) DEFAULT '0',
  `status` varchar(191) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card_packages`
--

INSERT INTO `card_packages` (`id`, `name`, `min_amount`, `max_amount`, `days`, `fixed_charge`, `percent_charge`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Premium VISA Card', '0', '10000', '1', '0.3', '2', '1', '2021-05-08 18:12:26', '2021-05-08 18:20:19'),
(6, 'Business MasterCard', '0', '10000', '2', '0.5', '2', '1', '2021-05-08 18:20:57', '2021-05-08 18:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `try` int(11) NOT NULL DEFAULT '0',
  `account` blob,
  `verify_image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `gateway_id`, `type`, `amount`, `charge`, `usd_amo`, `btc_amo`, `btc_wallet`, `trx`, `status`, `try`, `account`, `verify_image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0', '1.58', '0.01158', '1.59158', '0', '', 'BtvJ5VnBwhWGGaGf', '0', 0, NULL, NULL, '2021-05-11 04:01:12', '2021-05-11 04:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fix_deposits`
--

DROP TABLE IF EXISTS `fix_deposits`;
CREATE TABLE IF NOT EXISTS `fix_deposits` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) DEFAULT NULL,
  `fix_deposit_paks_id` int(191) DEFAULT NULL,
  `amount` float(8,2) NOT NULL DEFAULT '0.00',
  `percent_return` varchar(191) NOT NULL DEFAULT '0',
  `return_total` float(8,2) NOT NULL DEFAULT '0.00',
  `return_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fix_deposit_paks`
--

DROP TABLE IF EXISTS `fix_deposit_paks`;
CREATE TABLE IF NOT EXISTS `fix_deposit_paks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `min_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `max_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `days` varchar(191) NOT NULL DEFAULT '0',
  `percent_return` varchar(191) NOT NULL DEFAULT '0',
  `status` varchar(191) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
CREATE TABLE IF NOT EXISTS `gateways` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `main_name`, `name`, `minamo`, `maxamo`, `fixed_charge`, `percent_charge`, `rate`, `val1`, `val2`, `val3`, `val4`, `val5`, `val6`, `val7`, `status`, `created_at`, `updated_at`) VALUES
(101, 'PayPal', 'PayPal', '5', '1000', '.10', '0', '82', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-04-22 04:53:27'),
(102, 'PerfectMoney', 'Perfect Money', '20', '20000', '2', '1', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-04-21 09:42:15'),
(103, 'Stripe', 'Credit Card', '10', '50000', '3', '3', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-04-25 10:59:41'),
(104, 'Skrill', 'Skrill', '10', '50000', '3', '3', '90', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-04-21 09:42:01'),
(105, 'PayTM', 'PayTM', '1', '100', '1', '1', '1', '0', '0', 'WEB_STAGINGb', 'Retail', 'WEB', 'https://pguat.paytm.com/oltp-web/processTransaction', 'https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp', 0, NULL, '2019-03-07 21:38:53'),
(106, 'Payeer', 'Payeer', '1', '100', '1', '1', '1', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-03-16 22:38:42'),
(107, 'PayStack', 'PayStack', '1', '100', '1', '1', '1', '0', '0', NULL, NULL, NULL, NULL, '0.0028', 0, NULL, '2018-08-18 01:31:07'),
(108, 'VoguePay', 'VoguePay', '1', '100', '1', '1', '1', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-08-29 02:09:58'),
(501, 'Blockchain.info', 'BitCoin', '1', '20000', '1', '0.5', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-21 01:20:29'),
(502, 'block.io - BTC', 'BitCoin', '1', '99999', '1', '0.5', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, '2018-01-27 18:00:00', '2018-05-31 09:12:55'),
(503, 'block.io - LTC', 'LiteCoin', '100', '10000', '0.4', '1', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:27:34'),
(504, 'block.io - DOGE', 'DogeCoin', '1', '50000', '0.51', '2.52', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:28:54'),
(505, 'CoinPayment - BTC', 'BitCoin', '1', '50000', '0.51', '2.52', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:38:33'),
(506, 'CoinPayment - ETH', 'Etherium', '1', '50000', '0.51', '2.52', '79', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-07-16 03:42:22'),
(507, 'CoinPayment - BCH', 'Bitcoin Cash', '1', '50000', '0.51', '2.52', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:39:04'),
(508, 'CoinPayment - DASH', 'DASH', '1', '50000', '0.51', '2.52', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:39:04'),
(509, 'CoinPayment - DOGE', 'DOGE', '1', '50000', '0.51', '2.52', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:39:04'),
(510, 'CoinPayment - LTC', 'LTC', '1', '50000', '0.51', '2.52', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-31 09:39:04'),
(512, 'CoinGate', 'CoinGate', '10', '1000', '05', '5', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, '2018-07-08 18:00:00', '2019-02-24 12:26:00'),
(513, 'CoinPayment-ALL', 'Coin Payment', '10', '1000', '05', '5', '80', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2018-05-21 01:20:54');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_manuals`
--

DROP TABLE IF EXISTS `gateway_manuals`;
CREATE TABLE IF NOT EXISTS `gateway_manuals` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `rate` varchar(191) DEFAULT NULL,
  `minamo` varchar(191) DEFAULT NULL,
  `maxamo` varchar(191) DEFAULT NULL,
  `fixed_charge` varchar(191) DEFAULT NULL,
  `percent_charge` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `dec` longtext,
  `method_cur` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gateway_manuals`
--

INSERT INTO `gateway_manuals` (`id`, `name`, `rate`, `minamo`, `maxamo`, `fixed_charge`, `percent_charge`, `status`, `dec`, `method_cur`, `image`, `updated_at`, `created_at`) VALUES
(1, 'BitCoin', '1', '1', '10000000', '0.01', '0.1', 1, '978ytguhjiuy765e657yuhkgjft89ry654', 'BTC', 'WZYm4mvG8qiv2JWGtvGc84TUSSjoeLJeuc3FP46c.jpeg', '2021-05-11 04:00:16', '2021-05-09 06:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

DROP TABLE IF EXISTS `investors`;
CREATE TABLE IF NOT EXISTS `investors` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `tw_link` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `pint_link` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) DEFAULT NULL,
  `loan_packages_id` varchar(191) DEFAULT NULL,
  `days` varchar(191) DEFAULT '0',
  `charge` float(8,2) NOT NULL DEFAULT '0.00',
  `amount` float(8,2) NOT NULL DEFAULT '0.00',
  `return_date` date DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_packages`
--

DROP TABLE IF EXISTS `loan_packages`;
CREATE TABLE IF NOT EXISTS `loan_packages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `min_amount` varchar(191) DEFAULT '0',
  `max_amount` varchar(191) DEFAULT '0',
  `days` varchar(191) DEFAULT '0',
  `fixed_charge` varchar(191) DEFAULT '0',
  `percent_charge` varchar(191) DEFAULT '0',
  `status` varchar(191) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_packages`
--

INSERT INTO `loan_packages` (`id`, `name`, `min_amount`, `max_amount`, `days`, `fixed_charge`, `percent_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test pack', '210', '10', '10', '10', '10', '1', '2020-02-04 13:21:14', '2020-02-04 13:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `description` longtext,
  `icon` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branding` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colortwo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` longtext COLLATE utf8mb4_unicode_ci,
  `email_notification` tinyint(1) NOT NULL DEFAULT '0',
  `sms_api` longtext COLLATE utf8mb4_unicode_ci,
  `sms_notification` tinyint(1) NOT NULL DEFAULT '0',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `sms_verification` tinyint(1) NOT NULL DEFAULT '0',
  `registration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `script` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_api` longtext COLLATE utf8mb4_unicode_ci,
  `fag` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bal_trans_fixed_charge` float(8,6) DEFAULT NULL,
  `bal_trans_per_charge` float(8,6) DEFAULT NULL,
  `video_section_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_section_dec` longtext COLLATE utf8mb4_unicode_ci,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_section_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_subtitle` longtext COLLATE utf8mb4_unicode_ci,
  `blog_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_subtitle` longtext COLLATE utf8mb4_unicode_ci,
  `investor_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_des` longtext COLLATE utf8mb4_unicode_ci,
  `latest_tran_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latest_tran_des` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `branding`, `color1`, `colortwo`, `email_from`, `email_body`, `email_notification`, `sms_api`, `sms_notification`, `email_verification`, `sms_verification`, `registration`, `script`, `created_at`, `updated_at`, `service_subtitle`, `contact_thumbnail`, `cur`, `cur_symbol`, `facebook_api`, `fag`, `footer_image`, `bal_trans_fixed_charge`, `bal_trans_per_charge`, `video_section_title`, `video_section_dec`, `video_link`, `about_title`, `about_subtitle`, `video_section_banner`, `service_title`, `faq_title`, `faq_subtitle`, `blog_title`, `blog_subtitle`, `investor_title`, `investor_des`, `latest_tran_title`, `latest_tran_des`) VALUES
(1, 'Global Assets', '© 2021 Global Assets Pay. All rights reserved', '52DAFF', '191A75', 'do-not-reply@thesoftking.com', '<br><br>\r\n	<div class=\"contents\" style=\"max-width: 600px; margin: 0 auto; border: 2px solid #000036;\">\r\n\r\n<div class=\"header\" style=\"background-color: #000036; padding: 15px; text-align: center;\">\r\n	<div class=\"logo\" style=\"width: 260px;text-align: center; margin: 0 auto;\">\r\n		<img src=\"https://i.imgur.com/4NN55uD.png\" alt=\"THESOFTKING\" style=\"width: 100%;\">\r\n	</div>\r\n</div>\r\n\r\n<div class=\"mailtext\" style=\"padding: 30px 15px; background-color: #f0f8ff; font-family: \'Open Sans\', sans-serif; font-size: 16px; line-height: 26px;\">\r\n\r\nHi {{name}},\r\n<br><br>\r\n{{message}}\r\n<br><br>\r\n<br><br>\r\n</div>\r\n\r\n<div class=\"footer\" style=\"background-color: #000036; padding: 15px; text-align: center;\">\r\n<a href=\"https://thesoftking.com/\" style=\"	background-color: #2ecc71;\r\n	padding: 10px 0;\r\n	margin: 10px;\r\n	display: inline-block;\r\n	width: 100px;\r\n	text-transform: uppercase;\r\n	text-decoration: none;\r\n	color: #ffff;\r\n	font-weight: 600;\r\n	border-radius: 4px;\">Website</a>\r\n<a href=\"https://thesoftking.com/products\" style=\"	background-color: #2ecc71;\r\n	padding: 10px 0;\r\n	margin: 10px;\r\n	display: inline-block;\r\n	width: 100px;\r\n	text-transform: uppercase;\r\n	text-decoration: none;\r\n	color: #ffff;\r\n	font-weight: 600;\r\n	border-radius: 4px;\">Products</a>\r\n<a href=\"https://thesoftking.com/contact\" style=\"	background-color: #2ecc71;\r\n	padding: 10px 0;\r\n	margin: 10px;\r\n	display: inline-block;\r\n	width: 100px;\r\n	text-transform: uppercase;\r\n	text-decoration: none;\r\n	color: #ffff;\r\n	font-weight: 600;\r\n	border-radius: 4px;\">Contact</a>\r\n</div>\r\n\r\n\r\n<div class=\"footer\" style=\"background-color: #000036; padding: 15px; text-align: center; border-top: 1px solid rgba(255, 255, 255, 0.2);\">\r\n\r\n<strong style=\"color: #fff;\">© 2011 - 2019 THESOFTKING. All Rights Reserved.</strong>\r\n<p style=\"color: #ddd;\">TheSoftKing is not partnered with any other \r\ncompany or person. We work as a team and do not have any reseller, \r\ndistributor or partner!</p>\r\n\r\n\r\n</div>\r\n\r\n	</div>\r\n<br><br>', 1, 'https://api.infobip.com/api/v3/sendsms/plain?user=****&password=*****&sender=OLOBank&SMSText={{message}}&GSM={{number}}&type=longSMS', 0, 0, 0, '1', 'wvvwvwvw', '2018-11-13 18:00:00', '2021-05-15 05:21:43', 'We’re making banking smarter and simpler while serving our communities. We value and encourage the mantra of working better together. Our commitment to our customers has been at the core of w', '5gvRFEgyWL1vpFTmHg7hz8k0ia9k8pc09Qp5j0N3.jpeg', 'BTC', '₿', '205856110142667', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px; color: rgb(0, 0, 0);\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><br></div>', 'lyW5tX3sqvcUjMg7B5DH1ECYbIxxIc7v6xpV4bt4.jpeg', 0.002000, 3.000000, 'Banking for Easy Life', 'Ever find yourself wishing for a bank that thinks, behaves and acts exactly like you would want it to – a partner so seamless and intuitive that is unlike any other. Banking and technology rolled into one that it almost magically produces more time for you each day – to do more of things you love. Global Assets Pay is an entire bank squeezed to fit into your smartphone. Our objective? Changing banking the way you know it. Not only does it let you deposit, withdraw and transfer money with lightning speed, it also lets you set goals and draw out a plan to achieve them. It’s a bank with your interest in mind.\r\nGlobal Assets Pay is uniquely positioned in digital financial services, and committed to driving shareholder value over time by further improving profitability, diversifying our customer product suite and optimizing capital deployment.', 'https://www.youtube.com/watch?v=GT6-H4BRyqQ', 'About Us', 'Global Assets Pay is leading the way in mobile-first banking. We make banking more accessible and affordable—empowering people to take charge of their financial future. As a division of Custo', 'video-banner.jpg', 'Our Services', 'Frequently Asked Questions', 'Our representatives are committed to developing award-winning technology services and products that make your life easier. They are diverse thinkers that create new ideas and encourage innovation.', 'You can Trust Us', 'Global Assets Pay and their respective logos, as well as other trademarks and service marks (collectively, the \"marks\") appearing on this website are marks of © 2021 Global Assets Pay Inc., its subsidiaries, affiliates or licensors.', 'Our Top Investors', 'We firmly believe it’s our responsibility as corporate citizens to make a positive social impact on the world around us. This belief is embedded in the very fabric of our business and culture. We’re focused on environmental, social, and governance (ESG) issues that differentiate us from our peers, provide a positive social impact and help our stakeholders understand what’s important to us.', 'Latest Transaction', 'We support economic mobility for all. It’s about connecting, collaborating, and working within the community. Providing greater access to financial education and resources not only enriches people’s lives, it helps empower them to improve their economic circumstances.');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` longtext,
  `banner` varchar(191) DEFAULT NULL,
  `btn_name` varchar(191) DEFAULT NULL,
  `btn_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `subtitle`, `banner`, `btn_name`, `btn_link`, `created_at`, `updated_at`) VALUES
(1, 'Easiest way to do Banking', 'Apply for Credit Card Today.', 'qjTb3AQpGz0i4QURtSZe8eFsD5pAOZe2EBzRyFIn.jpeg', 'Apply now', 'register', '2019-04-10 05:47:44', '2021-05-10 10:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `social_icons`
--

DROP TABLE IF EXISTS `social_icons`;
CREATE TABLE IF NOT EXISTS `social_icons` (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

DROP TABLE IF EXISTS `subscribes`;
CREATE TABLE IF NOT EXISTS `subscribes` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
CREATE TABLE IF NOT EXISTS `support_tickets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

DROP TABLE IF EXISTS `ticket_comments`;
CREATE TABLE IF NOT EXISTS `ticket_comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(111) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) DEFAULT NULL,
  `trxid` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT '0',
  `balance` varchar(191) DEFAULT '0',
  `fee` varchar(191) DEFAULT '0',
  `p_time` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `details` longtext,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `trxid`, `amount`, `balance`, `fee`, `p_time`, `type`, `status`, `details`, `updated_at`, `created_at`) VALUES
(1, 1, '8JJT7Kd035EiUs2Y', '12398', '12398', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:21:40', '2021-05-10 08:21:40'),
(2, 1, 'ddbU3YYTpXgpxS05', '12398', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:26:14', '2021-05-10 08:26:14'),
(3, 1, 'fNYsFWX7fJQpKQ1o', '12398hui98ure932u8eei21', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:36:57', '2021-05-10 08:36:57'),
(4, 1, 'GI5Qafox9eY98qK1', '12398', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:38:42', '2021-05-10 08:38:42'),
(5, 1, '6rTygcYJXbqzf5W2', '12398', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:39:35', '2021-05-10 08:39:35'),
(6, 1, 'HkwpUSpVGF8AsuAb', '12398', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:41:36', '2021-05-10 08:41:36'),
(7, 1, 'viL6cLkroUnbJ1Hf', '12398', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:46:22', '2021-05-10 08:46:22'),
(8, 1, 'P5pMQEUAzL5a5ay9', '12398', '24796', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 08:48:22', '2021-05-10 08:48:22'),
(9, 1, 'wSJCQyXYfEOMCYx1', '12398hui98urecxdfr43932u8eei21', '0.44', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 10:12:29', '2021-05-10 10:12:29'),
(10, 1, 'f4BVJ08pGF2m6guy', '12398hui98urecxdfr43932u8eei21', '0.44', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 10:17:00', '2021-05-10 10:17:00'),
(11, 1, 'TAmzvOmsG3Xza4iY', '12398', '0.44', '0', NULL, '1', 0, 'Receive balance from card request', '2021-05-10 10:17:29', '2021-05-10 10:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `idt` text COLLATE utf8mb4_unicode_ci,
  `idn` text COLLATE utf8mb4_unicode_ci,
  `idimgf` text COLLATE utf8mb4_unicode_ci,
  `idimgb` text COLLATE utf8mb4_unicode_ci,
  `ubt` text COLLATE utf8mb4_unicode_ci,
  `ubimg` text COLLATE utf8mb4_unicode_ci,
  `balance` float(8,6) DEFAULT '0.000000',
  `amount` float(8,6) DEFAULT '0.000000',
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `account_number`, `phone`, `avatar`, `country`, `city`, `dob`, `address`, `idt`, `idn`, `idimgf`, `idimgb`, `ubt`, `ubimg`, `balance`, `amount`, `password`, `email_verified`, `sms_verified`, `email_code`, `sms_code`, `email_time`, `sms_time`, `verified_send`, `user_banned`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'HAMZA', 'PERVAIZ', 'hamzademp5@gmail.com', 'hamzademp5', '6844436697769001', '+923204157040', NULL, 'Pakistan', 'Lahore', '2021-05-02', 'Al Rehman Garden P II', 'Passport Identity', '234523452345', 'xK2WCMCtKtOTWlW888omrmpA4XpYnSsXptbDGnxc.jpeg', 'edtjo02ti5i1peOhimQaFcwafDYyRdUIkx4Pfy8c.jpeg', 'Internet Connection', 'yqKTRJlv3zHFslSkpKKtafGg0XpnRya27en5Lhvi.jpeg', 0.440000, 0.000000, '$2y$10$S43NvkKJFbmASmeaOPdcc.knphaMuB9JURditVBkRFBxA.437PBTy', '1', '1', '608e96', 'E9644A', '2021-05-02 18:11:36', '2021-05-02 18:11:36', NULL, '0', NULL, '2021-05-02 13:08:36', '2021-05-11 06:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;
CREATE TABLE IF NOT EXISTS `withdraws` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `wmethod_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `account` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wmethods`
--

DROP TABLE IF EXISTS `wmethods`;
CREATE TABLE IF NOT EXISTS `wmethods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minamo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `maxamo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fixed_charge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `percent_charge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `val1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

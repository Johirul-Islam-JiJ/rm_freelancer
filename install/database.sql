-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2024 at 08:46 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viserlance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `access_permissions`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '6598fa36c985b1704524342.png', '$2y$10$DPcZdU5ncDNJqfcQyNRYuuvyj4QKYq1QLVcxJ/TNqELQN/JkyxAvO', '5SVk69LF1ubp5JXsiH3XepgkOznbeN0etOMvFvIGmNNi1MQ0n6P2PkHjiT0X', '[\"manage_advertisement\",\"manage_category\",\"manage_coupon\",\"manage_dashboard\",\"manage_deposit\",\"manage_extension\",\"manage_feature\",\"manage_frontend_section\",\"manage_gateway\",\"manage_gdpr_cookie\",\"manage_general_setting\",\"manage_job\",\"manage_job_bidding\",\"manage_kyc_setting\",\"manage_language\",\"manage_level\",\"manage_logo_and_favicon\",\"manage_maintenance_mode\",\"manage_notification_setting\",\"manage_payment\",\"manage_report\",\"manage_seo_manager\",\"manage_service\",\"manage_service_booking\",\"manage_software\",\"manage_software_sales\",\"manage_staff\",\"manage_subcategory\",\"manage_subscriber\",\"manage_support_ticket\",\"manage_system_configuration\",\"manage_template\",\"manage_users\",\"manage_withdraw\",\"others\",\"manage_cron_job\"]', NULL, '2024-01-06 00:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `size` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` text COLLATE utf8mb4_unicode_ci,
  `impression` int UNSIGNED NOT NULL DEFAULT '0',
  `click` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` int UNSIGNED NOT NULL DEFAULT '0',
  `buyer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `disputer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `service_id` int UNSIGNED NOT NULL DEFAULT '0',
  `software_id` int UNSIGNED NOT NULL DEFAULT '0',
  `quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `service_price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `extra_price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `discount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `extra_services` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pending : 0, Approved : 1, Canceled : 2, Paid : 3, Refunded : 4, Expired : 6',
  `working_status` tinyint UNSIGNED DEFAULT '0' COMMENT 'Completed : 1, Delivered : 2, In-progress : 3, Expired : 4, Disputed : 5	',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Paid,0=Unpaid',
  `dispute_report` text COLLATE utf8mb4_unicode_ci,
  `review_status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `expired_date` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` int UNSIGNED NOT NULL DEFAULT '0',
  `job_bid_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `service_id` int UNSIGNED NOT NULL DEFAULT '0',
  `software_id` int UNSIGNED NOT NULL DEFAULT '0',
  `job_id` int UNSIGNED NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Fixed : 1, Percentage : 2	',
  `value` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_schedule_id` int NOT NULL DEFAULT '0',
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Service Expired Cron', 'service', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"service\"]', NULL, 1, '2024-01-06 05:49:54', '2024-01-06 05:49:49', 1, 1, '2023-12-22 23:31:43', '2024-01-05 23:49:49'),
(2, 'Job Expired Cron', 'job', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"job\"]', NULL, 1, '2024-01-06 05:49:57', '2024-01-06 05:49:52', 1, 1, '2023-12-22 23:31:43', '2024-01-05 23:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `cron_job_id` int NOT NULL DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedules`
--

CREATE TABLE `cron_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_schedules`
--

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 Minutes', 5, 1, '2023-12-23 23:25:36', '2023-12-23 23:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `order_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_id` int UNSIGNED NOT NULL DEFAULT '0',
  `method_code` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci,
  `shortcode` text COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"-----\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"-----\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2024-01-06 02:43:54'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2023-05-03 06:28:20'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `extra_services`
--

CREATE TABLE `extra_services` (
  `id` bigint UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `service_id` int UNSIGNED NOT NULL DEFAULT '0',
  `software_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `tempname`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"freelance\",\"freelancer\",\"marketplace\",\"hiring\",\"job\",\"software\"],\"description\":\"Viserlance, a professional Freelancing Marketplace Platform that\\u2019s comes with Premium features to take your business to a higher level. It is a complete premium item that comes with all features with a combination of all types of the digital marketplace\",\"social_title\":\"ViserLance - Freelancing Marketplace Platform\",\"social_description\":\"Viserlance, a professional Freelancing Marketplace Platform that\\u2019s comes with Premium features to take your business on a higher level. It is a complete premium item that comes with all features with a combination of all types of the digital marketplac\",\"image\":\"6599120373dee1704530435.png\"}', NULL, '2020-07-04 23:42:52', '2024-01-06 02:40:35'),
(27, 'contact.content', '{\"heading\":\"Get In Touch\",\"sub_heading\":\"Your form submission confirmation message may seem a tiny detail to you, yet it has a big potential for your support from us.\",\"form_heading\":\"Drop Us A Line\",\"form_sub_heading\":\"Your form submission confirmation message may seem a tiny detail to you, yet it has a big potential for your support from us.\"}', NULL, '2020-10-28 00:59:19', '2022-11-05 08:54:52'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, '2020-11-12 04:07:30', '2022-11-05 08:34:25'),
(39, 'banner.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse voluptatum eaque earum quos quia? Id aspernatur ratione, voluptas nulla rerum laudantium neque ipsam eaque\"}', NULL, '2021-05-02 06:09:30', '2021-05-02 06:09:30'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', NULL, '2020-07-04 23:42:52', '2022-09-22 07:29:55'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', 'basic', '2021-06-09 08:50:42', '2024-01-06 01:27:35'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div class=\\\"mb-5\\\"><p class=\\\"font-18\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\"><ul class=\\\"font-18\\\"><li>Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li>Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li>Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li>Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li>Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li>We Don\'t support any child porn or such material.<\\/li><li>No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li>No harassing material that may cause people to retaliate against you.<\\/li><li>No phishing pages.<\\/li><li>You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li>If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li>Malicious Botnets are strictly forbidden.<\\/li><li>Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li>Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.<\\/li><li>Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li>Php\\/CGI proxies are strictly forbidden.<\\/li><li>CGI-IRC is strictly forbidden.<\\/li><li>No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li>NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Terms & Conditions for Users<\\/h3><p class=\\\"font-18\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Support<\\/h3><p class=\\\"font-18\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\"><li>Hang tight for additional update discharge.<\\/li><li>Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Ownership<\\/h3><p class=\\\"font-18\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Warranty<\\/h3><p class=\\\"font-18\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3 class=\\\"mb-3\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', 'basic', '2021-06-09 08:51:18', '2024-01-06 01:29:31'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h2 style=\\\"text-align:center;\\\"><font size=\\\"6\\\">We\'re just tuning up a few things.<\\/font><\\/h2><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\"><p><font size=\\\"4\\\">We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<\\/font><br><\\/p><\\/h3><\\/div>\"}', NULL, '2020-07-04 23:42:52', '2023-05-03 16:05:52'),
(48, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker-alt\\\"><\\/i>\",\"title\":\"Address\",\"details\":\"6803 Dickens Islands Apt. 567\"}', NULL, '2022-11-05 08:44:56', '2022-11-05 08:44:56'),
(49, 'contact.element', '{\"icon\":\"<i class=\\\"las la-envelope\\\"><\\/i>\",\"title\":\"Email Address\",\"details\":\"demo@gmail.com\"}', NULL, '2022-11-05 08:45:29', '2022-11-05 08:45:29'),
(50, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Contact Number\",\"details\":\"+123-5555232452345\"}', NULL, '2022-11-05 08:46:14', '2022-11-05 08:46:14'),
(51, 'contact.element', '{\"icon\":\"<i class=\\\"las la-fax\\\"><\\/i>\",\"title\":\"Fax Number\",\"details\":\"+1-212-9876543\"}', NULL, '2022-11-05 09:20:06', '2022-11-05 09:20:06'),
(52, 'bg_image.content', '{\"has_image\":\"1\",\"image\":\"6366607b749ba1667653755.jpg\"}', 'basic', '2022-11-05 10:39:15', '2024-01-06 00:11:40'),
(53, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Integer posuere erat a ante venenatis dapibus\",\"description\":\"<p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p><span>- Danial Pink<\\/span><\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677b584f8421667726168.jpg\"}', 'basic', '2022-11-06 06:46:08', '2024-01-06 00:11:55'),
(54, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"quaerat odit ex exercitationem pariatur quibus\",\"description\":\"<p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p><span>- Danial Pink<\\/span><\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677b7e1f0bb1667726206.jpg\"}', NULL, '2022-11-06 06:46:46', '2022-11-06 06:46:46'),
(55, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Asperiores suscipit iure id labore fuga.\",\"description\":\"<p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p><span>- Danial Pink<\\/span><\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677b995e67a1667726233.jpg\"}', NULL, '2022-11-06 06:47:13', '2022-11-06 06:47:13'),
(56, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Curabitur blandit tempus porttitor. Integer posuere erat a ante\",\"description\":\"<h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:24px;clear:both;color:rgb(47,47,53);font-family:\'Maven Pro\', sans-serif;\\\">Integer posuere erat a ante venenatis dapibus<\\/h3><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p>- Danial Pink<\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677bbe010701667726270.jpg\"}', NULL, '2022-11-06 06:47:49', '2022-11-06 06:47:50'),
(57, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Ndrerit posuere penatibus elit placerat, ut ut turpis aenean class\",\"description\":\"<h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:24px;clear:both;color:rgb(47,47,53);font-family:\'Maven Pro\', sans-serif;\\\">Integer posuere erat a ante venenatis dapibus<\\/h3><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p>- Danial Pink<\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677bda38dca1667726298.jpg\"}', NULL, '2022-11-06 06:48:18', '2022-11-06 06:48:18');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `tempname`, `created_at`, `updated_at`) VALUES
(58, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Donec consequat laoreet sagittis. Suspendisse ultricies\",\"description\":\"<h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:24px;clear:both;color:rgb(47,47,53);font-family:\'Maven Pro\', sans-serif;\\\">Integer posuere erat a ante venenatis dapibus<\\/h3><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p>- Danial Pink<\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677bf81f18c1667726328.jpg\"}', NULL, '2022-11-06 06:48:48', '2022-11-06 06:48:48'),
(59, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Erat nonuy neque scelerisque, amet rutrum magnanullam. Vra eos elit\",\"description\":\"<h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:24px;clear:both;color:rgb(47,47,53);font-family:\'Maven Pro\', sans-serif;\\\">Integer posuere erat a ante venenatis dapibus<\\/h3><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p>- Danial Pink<\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677c133b69a1667726355.jpg\"}', NULL, '2022-11-06 06:49:15', '2022-11-06 07:37:10'),
(60, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Nullam id dolor id nibh ultricies vehicula ut id elit.\",\"description\":\"<p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod semper.<\\/p><blockquote style=\\\"margin-bottom:1.3em;background-color:rgb(249,249,249);padding:20px;color:rgb(47,47,53);font-style:italic;font-family:\'Maven Pro\', sans-serif;\\\"><div class=\\\"quote-area d-flex flex-wrap\\\"><div class=\\\"quote-icon\\\" style=\\\"font-size:120px;\\\"><span class=\\\"las la-quote-left\\\"><\\/span><\\/div><div class=\\\"quote-content-area\\\"><p class=\\\"quote-content\\\" style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;\\\">Aliquet ac fringilla luctus tellus.ndrerit posuere penatibus elit placerat, ut ut turpis aenean class, labore elementum at diam libero ipsum, aenean sed dapibus, in sed fusce. Alicitudin tincidunt in, erat nonummy neque scelerisque, amet rutrum magnanullam. Vra eos elit<\\/p><span>- Danial Pink<\\/span><\\/div><\\/div><\\/blockquote><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt soluta iste repellendus officia in neque veniam debitis Consectetur, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium vitae, consequuntur minima tempora cupiditate ratione est, ad molestias deserunt in ipsam ea quasi cum culpa adipisci dolores voluptatum fuga at! assumenda provident lorem ipsum dolor sit amet, consectetur.<\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus. Vestibulum id ligula porta felis euismod\\u00a0<span style=\\\"color:rgb(96,105,117);\\\">\\u00a0dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.<\\/span><\\/p><p style=\\\"margin-bottom:15px;line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet enim in accumsan.<\\/p><p style=\\\"line-height:1.8em;font-size:15px;color:rgb(96,105,117);font-family:\'Maven Pro\', sans-serif;\\\">Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.<\\/p>\",\"image\":\"63677c4d0d50e1667726413.jpg\"}', NULL, '2022-11-06 06:50:12', '2022-11-06 06:50:13'),
(61, 'footer.content', '{\"heading\":\"About Us\",\"description\":\"ViserLance is categorized as subcategories that contain many awesome services! Here are all the categories include: graphics, link building, social networks, article writing and so much more which can give you a better SEO marketplace experience.\",\"subscribe_heading\":\"Subscribe News\",\"subscribe_description\":\"Subscribe to our site and get the latest update and notifications. It will also help you to get offers provided by us. So do not for get to subscribe us.\",\"copyright_text\":\"Copyright \\u00a9 2022 all rights reserved\"}', NULL, '2022-11-09 10:46:19', '2022-11-09 10:46:19'),
(62, 'footer.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, '2022-11-09 10:47:13', '2022-11-09 10:47:13'),
(63, 'footer.element', '{\"title\":\"Instaram\",\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, '2022-11-09 10:47:35', '2022-11-09 10:47:35'),
(64, 'footer.element', '{\"title\":\"Twitter\",\"social_icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, '2022-11-09 10:47:59', '2022-11-09 10:47:59'),
(65, 'footer.element', '{\"title\":\"Linkedin\",\"social_icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, '2022-11-09 10:48:31', '2022-11-09 10:48:31'),
(66, 'kyc_instructions.content', '{\"for_verification\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi distinctio illum vel enim iste, qui incidunt expedita nobis cum quis, ab laudantium ipsum, alias unde! Corporis, itaque omnis nisi, necessitatibus excepturi aliquid eum sequi vel enim eveniet et. Quasi repellat cupiditate asperiores explicabo quo, sed magni consequatur est quam quibusdam!\",\"for_pending\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi distinctio illum vel enim iste, qui incidunt expedita nobis cum quis, ab laudantium ipsum, alias unde! Corporis, itaque omnis nisi, necessitatibus excepturi aliquid eum sequi vel enim eveniet et. Quasi repellat cupiditate asperiores explicabo quo, sed magni consequatur est quam quibusdam!\"}', NULL, '2023-01-12 04:51:51', '2023-01-12 04:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2022-08-28 10:11:14'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-14 07:41:14'),
(37, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-08-28 09:33:06'),
(46, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:32:31'),
(48, 0, 122, 'Two Checkout', 'TwoCheckout', 1, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"253248016872\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"eQM)ID@&vG84u!O*g[p+\"}}', '{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GBP\":\"GBP\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MMK\":\"MMK\",\"MOP\":\"MOP\",\"MRU\":\"MRU\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"UAH\":\"UAH\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XCD\":\"XCD\",\"XOF\":\"XOF\",\"YER\":\"YER\",\"ZAR\":\"ZAR\"}', 0, '{\"ipn\":{\"title\": \"Approve URL\",\"value\":\"ipn.TwoCheckout\"}}', NULL, NULL, '2022-08-31 06:21:15'),
(49, 0, 123, 'Advance Cash', 'AdvCash', 1, '{\"account_email\":{\"title\":\"Account Email\",\"global\":true,\"value\":\"viserlabteam@gmail.com\"},\"api_name\":{\"title\":\"API Name\",\"global\":true,\"value\":\"MYAPP\"},\"api_password\":{\"title\":\"API Password\",\"global\":true,\"value\":\"2B8iTL_0ee\"}}', '{\"USD\":\"USD\", \"EUR\":\"EUR\", \"GBP\":\"GBP\", \"RUB\":\"RUB\", \"BRL\":\"BRL\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"KZT\":\"KZT\", \"VND\":\"VND\"}', 0, '', NULL, NULL, '2022-10-13 05:09:31'),
(51, 0, 122, 'BTCPay', 'BTCPay', 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL),
(52, 0, 123, 'Now payments hosted', 'NowPaymentsHosted', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 04:42:09'),
(53, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 04:42:09'),
(54, 0, 122, '2Checkout', 'TwoCheckout', 1, '{\"merchant_code\": {\"title\": \"Merchant Code\",\"global\": true,\"value\": \"---------\"},\"secret_key\": {\"title\": \"Secret Key\",\"global\": true,\"value\": \"--------\"}}', '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}', 1, '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}', NULL, NULL, '2023-02-14 15:42:09'),
(55, 0, 127, 'Checkout', 'Checkout', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_f7f9a069-dcc5-45d8-aa72-e60f605c9514\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"pk_66e19b3f-a431-44ff-823f-d773d960f6b9\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"---\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci,
  `sms_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `post_approval` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_info` text COLLATE utf8mb4_unicode_ci,
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `last_cron` datetime DEFAULT NULL,
  `referral_commission` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `post_approval`, `active_template`, `system_info`, `system_customized`, `last_cron`, `referral_commission`, `created_at`, `updated_at`) VALUES
(1, 'ViserLance', 'USD', '$', 'no-reply@viserlab.com', '<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>\n</title>\n<style type=\"text/css\">\n	.ReadMsgBody {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass,\n	.ExternalClass p,\n	.ExternalClass span,\n	.ExternalClass font,\n	.ExternalClass td,\n	.ExternalClass div {\n		line-height: 100%;\n	}\n	html {\n		width: 100%;\n	}\n	body {\n		-webkit-text-size-adjust: none;\n		-ms-text-size-adjust: none;\n		margin: 0;\n		padding: 0;\n	}\n	table {\n		border-spacing: 0;\n		table-layout: fixed;\n		margin: 0 auto;\n		border-collapse: collapse;\n	}\n	table table table {\n		table-layout: auto;\n	}\n	.yshortcuts a {\n		border-bottom: none !important;\n	}\n	img:hover {\n		opacity: 0.9 !important;\n	}\n	a {\n		color: #0087ff;\n		text-decoration: none;\n	}\n	.textbutton a {\n		font-family: \"open sans\", arial, sans-serif !important;\n	}\n	.btn-link a {\n		color: #ffffff !important;\n	}\n	@media only screen and (max-width: 480px) {\n		body {\n			width: auto !important;\n		}\n		*[class=\"table-inner\"] {\n			width: 90% !important;\n			text-align: center !important;\n		}\n		*[class=\"table-full\"] {\n			width: 100% !important;\n			text-align: center !important;\n		} /* image */\n		img[class=\"img1\"] {\n			width: 100% !important;\n			height: auto !important;\n		}\n	}\n\n</style>\n<table bgcolor=\"#030442\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td height=\"50\">\n			</td>\n		</tr>\n		<tr>\n			<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n					<tbody>\n						<tr>\n							<td align=\"center\" width=\"600\">\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\n												<table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">\n															This is a System Generated Email</td>\n														</tr>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"35\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"vertical-align:top;font-size:0;\">\n																<a href=\"#\">\n																	<img style=\"display:block; line-height:0px; font-size:0px; border:0px; width: 240px;\" width=\"240px\" src=\"https://viserlab.com/assets/images/logoIcon/logo-dark.png\" alt=\"img\">\n																</a>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"40\"></td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open Sans, Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">\n															Hello {{fullname}} ({{username}}) </td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n																<table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n																	<tbody>\n																		<tr>\n																			<td height=\"20\" style=\" border-bottom:3px solid #0087ff;\">\n																			</td>\n																		</tr>\n																	</tbody>\n																</table>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"30\"></td>\n														</tr>\n														<tr>\n															<td align=\"left\" style=\"font-family: Open sans, Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">\n															{{message}}</td>\n														</tr>\n														<tr>\n															<td height=\"60\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n										<tr>\n											<td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n														<tr>\n															<td class=\"preference-link\" align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#95a5a6; font-size:14px;\">\n																© 2023 <a href=\"#\">{{site_name}}</a> &nbsp;. All Rights Reserved. </td>\n														</tr>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n		<tr>\n			<td height=\"60\"></td>\n		</tr>\n	</tbody>\n</table>\n</html>\n', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', '2cdd9b', '1dc8cc', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 'basic', '[]', 0, '2024-01-06 05:49:52', 2.30, NULL, '2024-01-06 02:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` bigint UNSIGNED NOT NULL,
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `receiver_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT '0',
  `category_id` int UNSIGNED DEFAULT '0',
  `sub_category_id` int UNSIGNED DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `delivery_time` int UNSIGNED DEFAULT NULL,
  `skill` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `requirements` text COLLATE utf8mb4_unicode_ci,
  `total_bid` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pending : 0, Approved : 1, Canceled : 2, Closed : 3',
  `featured` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_bids`
--

CREATE TABLE `job_bids` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `buyer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `job_id` int UNSIGNED NOT NULL DEFAULT '0',
  `disputer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pending : 0, Approved : 1, Canceled : 2, Expired : 6',
  `working_status` tinyint UNSIGNED DEFAULT '0' COMMENT 'Completed : 1, Delivered : 2, In-progress : 3, Expired : 4, Disputed : 5	',
  `expired_date` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2024-01-06 01:19:44', '2024-01-06 01:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `inbox_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `receiver_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `shortcodes` text COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', 'We are pleased to inform you that your KYC verification process has been\r\n completed and your account is now KYC-approved. Thank you for \r\nproviding all the necessary documents and information for the process.<br>', 'We are pleased to inform you that your KYC verification process has been completed and your account is now KYC-approved. Thank you for providing all the necessary documents and information for the process.', '[]', 1, 1, NULL, '2023-04-12 10:06:56'),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', '<p><br></p><p>We regret to inform you that your KYC verification process has been rejected due to incomplete or inaccurate information provided. We apologize for any inconvenience this may cause.</p><p>Please note that you will not be able to access certain features of our platform until your KYC verification process is successfully completed. To initiate the process again, please log in to your account and upload the required documents and information.</p><p><br></p><p>If you have any questions or need any assistance, please contact our customer support team. We are always here to help you.</p><p><br></p><p>Thank you for your understanding and cooperation.</p>', 'We regret to inform you that your KYC verification process has been rejected due to incomplete or inaccurate information provided.', '[]', 1, 1, NULL, '2023-04-12 10:15:21'),
(18, 'EMPLOYEE_HIRED', 'Employee Hired', 'Employee hired for a job', '<div style=\"font-family: Montserrat, sans-serif;\">Your bid is approved by the buyer and you are hired for the job.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your job:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Buyer : {{buyer_username}}</div><div style=\"font-family: Montserrat, sans-serif;\">Job : {{job_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Budget : {{budget}}</span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-size: x-large; color: var(--bs-body-color); text-align: var(--bs-body-text-align);\">Job delivery deadline is&nbsp;</span><span style=\"font-size: x-large; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{delivery_time}}</span><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', 'Your bid is approved by the buyer and you are hired for the job.\r\n\r\nDetails of your job:\r\n\r\nBuyer : {{buyer_username}}\r\nJob : {{job_name}}\r\nBudget : {{budget}}\r\n\r\nJob delivery deadline is {{delivery_time}}', '{\"buyer_username\":\"Buyer Username\",\"job_name\":\"Job name\",\"budget\":\"Bidder budget\",\"delivery_time\":\"Deadline of job delivery\"}', 1, 1, NULL, '2023-01-15 06:33:38'),
(19, 'BID_CANCELED', 'Bid canceled', 'Job bid canceled', '<div style=\"font-family: Montserrat, sans-serif;\">Your bid is canceled by the buyer.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your job:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Buyer : {{buyer_username}}</div><div style=\"font-family: Montserrat, sans-serif;\">Job : {{job_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Budget : {{budget}}</span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', 'Your bid is canceled by the buyer.\r\n\r\nDetails of your job:\r\n\r\nBuyer : {{buyer_username}}\r\nJob : {{job_name}}\r\nBudget : {{budget}}', '{\"buyer_username\":\"Buyer Username\",\"job_name\":\"Job name\",\"budget\":\"Bidder budget\"}', 1, 1, NULL, '2023-01-15 06:18:03'),
(20, 'SERVICE_BOOKING_CONFIRMED', 'Service booking confirmed', 'Seller confirmed buyer service booking.', '<div style=\"font-family: Montserrat, sans-serif;\"><div>Your service booking is approved by the seller.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your service booking:<br></span></div><div><br></div><div>Seller : {{seller_username}}</div><div>Order Number : {{order_number}}</div><div><span style=\"color: rgb(33, 37, 41);\">Service Name : {{service_name}}</span></div><div><span style=\"color: rgb(33, 37, 41);\">Price : {{price}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><br></div><div><span style=\"color: var(--bs-body-color); font-size: x-large; text-align: var(--bs-body-text-align);\">Service delivery deadline is&nbsp;</span><span style=\"font-size: x-large; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{delivery_time}}</span></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', 'Your service booking is approved by the seller.\r\n\r\nDetails of your service booking:\r\n\r\nSeller : {{seller_username}}\r\nOrder Number : {{order_number}}\r\nService Name : {{service_name}}\r\nPrice : {{price}}\r\n\r\nService delivery deadline is {{delivery_time}}', '{\"seller_username\":\"Service seller username\",\"order_number\":\"Booking order number\",\"service_name\":\"Service name\",\"price\":\"Service price\",\"delivery_time\":\"Delivery deadline\"}', 1, 1, NULL, '2023-01-15 06:38:10'),
(21, 'SERVICE_BOOKING_CANCELED', 'Service booking canceled', 'Seller canceled buyer service booking and booking amount refunded.', '<div style=\"font-family: Montserrat, sans-serif;\"><div>Your service booking is canceled by the seller.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your service booking:<br></span></div><div><br></div><div>Seller : {{seller_username}}</div><div>Order Number : {{order_number}}</div><div><span style=\"color: rgb(33, 37, 41);\">Service Name : {{service_name}}</span></div><div><span style=\"color: rgb(33, 37, 41);\">Refund Amount : {{refund_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><br></div><div><span style=\"color: var(--bs-body-color); font-size: x-large; text-align: var(--bs-body-text-align);\">Current balance&nbsp;</span><span style=\"font-size: x-large; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{post_balance}}</span></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', 'Your service booking is canceled by the seller.\r\n\r\nDetails of your service booking:\r\n\r\nSeller : {{seller_username}}\r\nOrder Number : {{order_number}}\r\nService Name : {{service_name}}\r\nRefund Amount : {{refund_amount}}\r\n\r\nCurrent balance {{post_balance}}', '{\"seller_username\":\"Service seller username\",\"order_number\":\"Booking order number\",\"service_name\":\"Service name\",\"refund_amount\":\"Service price to refund\",\"post_balance\":\"Buyer current balance after this refund operation\"}', 1, 1, NULL, '2023-01-15 06:44:42'),
(22, 'SOFTWARE_SOLD', 'A software sold', 'Software sold', '<div style=\"font-family: Montserrat, sans-serif;\"><div>Your software sold.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your software :<br></span></div><div><br></div><div>Buyer : {{buyer_username}}</div><div>Order Number : {{order_number}}</div><div><span style=\"color: rgb(33, 37, 41);\">Software Name : {{software_name}}</span></div><div><span style=\"color: rgb(33, 37, 41);\">Price : {{price}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><br></div><div><span style=\"color: var(--bs-body-color); font-size: x-large; text-align: var(--bs-body-text-align);\">Current balance&nbsp;</span><span style=\"font-size: x-large; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{post_balance}}</span></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', 'Your software sold.\r\n\r\nDetails of your software :\r\n\r\nBuyer : {{buyer_username}}\r\nOrder Number : {{order_number}}\r\nSoftware Name : {{software_name}}\r\nPrice : {{price}}\r\n\r\nCurrent balance {{post_balance}}', '{\"buyer_username\":\"Software buyer username\",\"order_number\":\"Booking order number\",\"software_name\":\"Software name\",\"price\":\"Software price\",\"post_balance\":\"Seller current balance after this operation\"}', 1, 1, NULL, '2023-01-15 06:57:28'),
(23, 'PAYMENT_REQUEST', 'Payment - Requested', 'Payment Request Submitted Successfully', '<div>Your payment request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Payment :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div><span style=\"color: rgb(33, 37, 41);\">Transaction Number : {{trx}}</span><br></div><div>Product Type : {{product_type}}</div><div><span style=\"color: rgb(33, 37, 41);\">Product Name : {{product_name}}</span><br></div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Payment requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}} Product Type : {{product_type}} . Product Name : {{product_name}}.', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"product_type\":\"Product type\",\"product_name\":\"Product Name\"}', 1, 1, '2021-11-03 12:00:00', '2023-01-15 07:18:46'),
(24, 'DISPUTED', 'Disputed', 'Reported', '<div>Your product is reported by&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{disputer_username}}</span><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details :<br></span></div><div><br></div><div>Product Type : {{product_type}}</div><div><span style=\"color: rgb(33, 37, 41);\">Product Name : {{product_name}}</span><br></div><div><span style=\"color: rgb(33, 37, 41);\">Reason : {{reason}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><br></div><div>Please wait for the system\'s response.</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your product is reported by  {{disputer_username}}\r\n\r\nDetails :\r\n\r\nProduct Type : {{product_type}}\r\nProduct Name : {{product_name}}\r\nReason : {{reason}}\r\n\r\nPlease wait for the system\'s response.', '{\"disputer_username\":\"Disputer username\",\"product_type\":\"Service or job\",\"product_name\":\"Disputed product name\",\"reason\":\"Reason for dispute\"}', 1, 1, '2021-11-03 12:00:00', '2023-01-16 07:18:16'),
(25, 'DISPUTED_PRODUCT_SETTLED', 'Disputed product settled by system', 'Reported service or job is settled', '<div>Reported product is settled by system.</div><div><br></div><div><span style=\"font-weight: bolder;\">Details :<br></span></div><div><br></div><div>Winner&nbsp; : {{winner_username}}</div><div><span style=\"color: rgb(33, 37, 41);\">Product Type : {{product_type}}</span><br></div><div><span style=\"color: rgb(33, 37, 41);\">Product Name : {{product_name}}</span><br></div><div><span style=\"color: rgb(33, 37, 41);\">Message : {{message}}</span></div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Reported product is settled by system.\r\n\r\nDetails :\r\n\r\nWinner  : {{winner_username}}\r\nProduct Type : {{product_type}}\r\nProduct Name : {{product_name}}\r\nMessage : {{message}}', '{\"winner_username\":\"Winner username\",\"product_type\":\"Service or job\",\"product_name\":\"Disputed product name\",\"message\":\"Relevant message for seller and buyer and bidder\"}', 1, 1, '2021-11-03 12:00:00', '2023-01-15 08:05:22'),
(26, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 06:00:00', '2022-04-04 21:45:27'),
(27, 'USER_LEVEL_UPGRADE', 'User Level Upgradation', 'Your level is update now', '<div style=\"\"><div style=\"\"><font color=\"#212529\" face=\"Montserrat, sans-serif\">Congratulations</font></div><div style=\"\"><font color=\"#212529\" face=\"Montserrat, sans-serif\">You are off to a great programme and we want to welcome you to our&nbsp; New Level(</font><span style=\"text-align: var(--bs-body-text-align);\"><font color=\"#212529\" face=\"Montserrat, sans-serif\">{{name}}</font></span><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif; font-size: 1rem; text-align: var(--bs-body-text-align);\">).</span></div><div style=\"\"><font face=\"Montserrat, sans-serif\"><br></font></div><div style=\"\"><font color=\"#212529\" face=\"Montserrat, sans-serif\">Explore more benefits &amp; features under this level.</font></div><div style=\"\"><font face=\"Montserrat, sans-serif\"><br></font></div><div style=\"\"><font color=\"#212529\" face=\"Montserrat, sans-serif\">GOOD LUCK</font></div></div>', 'Congratulations\r\nYou are off to a great programme and we want to welcome you to our  New Level({{name}}).', '{\"name\":\"Name of user\",\"level_amount\":\"Amount of level\",\"name\":\"name of level\",\"username\" :\"Name of user\"}', 1, 1, '2021-11-03 06:00:00', '2023-05-02 12:13:35'),
(28, 'REFERRAL_COMMISSION', 'Referral Commission', 'User Referral Commission', 'Bonus: {{amount}}&nbsp;<span style=\"color: rgb(33, 37, 41);\">{{currency}}</span>,&nbsp;<div>Current Balance: {{post_balance}},</div><div><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">{{level}}</span><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">,</span></div><div>Transaction: {{trx}},</div>', 'Bonus: {{amount}} {{currency}}, \r\nTransaction: {{trx}},', '{\"amount\":\"Amount\", \"post_balance\":\"Post Balance\", \"trx\":\"Transaction\",\"currency\":\"currency\" }', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `comment_id` int UNSIGNED NOT NULL DEFAULT '0',
  `reply` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `to_id` int UNSIGNED NOT NULL DEFAULT '0',
  `service_id` int UNSIGNED NOT NULL DEFAULT '0',
  `software_id` int UNSIGNED NOT NULL DEFAULT '0',
  `rating` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `like_dislike` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `featured` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_image` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_order_qty` int UNSIGNED NOT NULL,
  `delivery_time` int UNSIGNED DEFAULT NULL,
  `features` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `favorite` int UNSIGNED DEFAULT '0',
  `likes` int UNSIGNED DEFAULT '0',
  `dislike` int UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pending : 0, Approved : 1, Canceled : 2, Closed : 3',
  `total_review` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rating` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `id` bigint UNSIGNED NOT NULL,
  `featured` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_image` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `features` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `software_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `demo_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_include` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `favorite` int UNSIGNED NOT NULL DEFAULT '0',
  `likes` int UNSIGNED DEFAULT '0',
  `dislike` int UNSIGNED DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pending : 0, Approved : 1, Canceled : 2, Closed : 3',
  `total_sale` int UNSIGNED NOT NULL DEFAULT '0',
  `total_review` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rating` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `level_id` int UNSIGNED NOT NULL DEFAULT '1',
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int UNSIGNED NOT NULL DEFAULT '0',
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `earning` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `about_me` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_review` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rating` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `method_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT '0.00000000',
  `max_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(28,8) DEFAULT '0.00000000',
  `rate` decimal(28,8) DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_files`
--

CREATE TABLE `work_files` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` int NOT NULL DEFAULT '0',
  `job_bid_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int NOT NULL DEFAULT '0',
  `receiver_id` int NOT NULL DEFAULT '0',
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
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
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_services`
--
ALTER TABLE `extra_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_bids`
--
ALTER TABLE `job_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_files`
--
ALTER TABLE `work_files`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `extra_services`
--
ALTER TABLE `extra_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_bids`
--
ALTER TABLE `job_bids`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `software`
--
ALTER TABLE `software`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_files`
--
ALTER TABLE `work_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

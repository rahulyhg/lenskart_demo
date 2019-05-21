-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2019 at 12:17 PM
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
-- Database: `lenskart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepts_marketing` tinyint(1) DEFAULT '0',
  `created_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders_count` int(11) DEFAULT '0',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_spent` double DEFAULT '0',
  `last_order_id` bigint(20) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) NOT NULL,
  `multipass_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_exempt` tinyint(1) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_order_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'INR',
  `addresses` text COLLATE utf8mb4_unicode_ci,
  `accepts_marketing_updated_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_opt_in_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_graphql_api_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `email`, `accepts_marketing`, `created_at`, `updated_at`, `first_name`, `last_name`, `orders_count`, `state`, `total_spent`, `last_order_id`, `note`, `verified_email`, `multipass_identifier`, `tax_exempt`, `phone`, `tags`, `last_order_name`, `currency`, `addresses`, `accepts_marketing_updated_at`, `marketing_opt_in_level`, `admin_graphql_api_id`, `default_address`) VALUES
(1227653480508, 'sdfgsfgdfg@gmail.com', 0, '2019-02-26T19:15:20+05:30', '2019-03-02T17:17:13+05:30', 'sfds', 'sddsf', 11, 'disabled', 0, 943831679036, NULL, 1, NULL, 0, NULL, 'retail-customer', '#1806', 'INR', '[{\"id\":1302628532284,\"customer_id\":1227653480508,\"first_name\":\"sfds\",\"last_name\":\"sddsf\",\"company\":\"\",\"address1\":\"dffdf\",\"address2\":\"\",\"city\":\"dfdf\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"454551\",\"phone\":\"3456 879 80\",\"name\":\"sfds sddsf\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}]', '2019-02-26T19:15:20+05:30', NULL, 'gid://shopify/Customer/1227653480508', '{\"id\":1302628532284,\"customer_id\":1227653480508,\"first_name\":\"sfds\",\"last_name\":\"sddsf\",\"company\":\"\",\"address1\":\"dffdf\",\"address2\":\"\",\"city\":\"dfdf\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"454551\",\"phone\":\"3456 879 80\",\"name\":\"sfds sddsf\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}'),
(1301116518460, 'goldenjordy14@gmail.com', 0, '2019-04-17T11:49:21+05:30', '2019-04-17T11:49:21+05:30', 'Golden', 'Jordy', 0, 'disabled', 0, NULL, NULL, 1, NULL, 0, NULL, '', NULL, 'INR', '[{\"id\":1411958931516,\"customer_id\":1323698913340,\"first_name\":\"sanjeev\",\"last_name\":\"test\",\"company\":\"Testrr\",\"address1\":\"test\",\"address2\":\"test\",\"city\":\"test\",\"province\":\"Assam\",\"country\":\"India\",\"zip\":\"110024\",\"phone\":\"01234567890\",\"name\":\"sanjeev test\",\"province_code\":\"AS\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}]', '2019-04-17T11:49:21+05:30', NULL, 'gid://shopify/Customer/1301116518460', '{\"id\":1302628532284,\"customer_id\":1227653480508,\"first_name\":\"sfds\",\"last_name\":\"sddsf\",\"company\":\"\",\"address1\":\"dffdf\",\"address2\":\"\",\"city\":\"dfdf\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"454551\",\"phone\":\"3456 879 80\",\"name\":\"sfds sddsf\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}'),
(1310133747772, 'abhishek123@gmail.com', 0, '2019-04-22T12:15:19+05:30', '2019-04-22T12:15:19+05:30', 'Abhishek', 'Singh', 0, 'disabled', 0, NULL, NULL, 1, NULL, 0, NULL, '', NULL, 'INR', '[{\"id\":1411958931516,\"customer_id\":1323698913340,\"first_name\":\"sanjeev\",\"last_name\":\"test\",\"company\":\"Testrr\",\"address1\":\"test\",\"address2\":\"test\",\"city\":\"test\",\"province\":\"Assam\",\"country\":\"India\",\"zip\":\"110024\",\"phone\":\"01234567890\",\"name\":\"sanjeev test\",\"province_code\":\"AS\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}]', '2019-04-22T12:15:19+05:30', NULL, 'gid://shopify/Customer/1310133747772', '[{\"id\":1411958931516,\"customer_id\":1323698913340,\"first_name\":\"sanjeev\",\"last_name\":\"test\",\"company\":\"Testrr\",\"address1\":\"test\",\"address2\":\"test\",\"city\":\"test\",\"province\":\"Assam\",\"country\":\"India\",\"zip\":\"110024\",\"phone\":\"01234567890\",\"name\":\"sanjeev test\",\"province_code\":\"AS\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}]'),
(1323698913340, 'sanjeev+1@marmeto.com', 0, '2019-04-30T12:17:45+05:30', '2019-05-03T16:23:51+05:30', 'sanjeev', 'test', 4, 'disabled', 60, 1025746796604, NULL, 1, NULL, 0, NULL, '', '#2046', 'INR', '[{\"id\":1411958931516,\"customer_id\":1323698913340,\"first_name\":\"sanjeev\",\"last_name\":\"test\",\"company\":\"Testrr\",\"address1\":\"test\",\"address2\":\"test\",\"city\":\"test\",\"province\":\"Assam\",\"country\":\"India\",\"zip\":\"110024\",\"phone\":\"01234567890\",\"name\":\"sanjeev test\",\"province_code\":\"AS\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}]', '2019-04-30T12:17:45+05:30', NULL, 'gid://shopify/Customer/1323698913340', '{\"id\":1411958931516,\"customer_id\":1323698913340,\"first_name\":\"sanjeev\",\"last_name\":\"test\",\"company\":\"Testrr\",\"address1\":\"test\",\"address2\":\"test\",\"city\":\"test\",\"province\":\"Assam\",\"country\":\"India\",\"zip\":\"110024\",\"phone\":\"01234567890\",\"name\":\"sanjeev test\",\"province_code\":\"AS\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}');

-- --------------------------------------------------------

--
-- Table structure for table `freedays`
--

CREATE TABLE `freedays` (
  `id` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `plan_id` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `freedays`
--

INSERT INTO `freedays` (`id`, `days`, `plan_id`) VALUES
(1, 10, 'plan_CVKxrA1xXVEubO');

-- --------------------------------------------------------

--
-- Table structure for table `lens_powers`
--

CREATE TABLE `lens_powers` (
  `customer_id` varchar(191) NOT NULL,
  `power_right` double NOT NULL,
  `power_left` double NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lens_powers`
--

INSERT INTO `lens_powers` (`customer_id`, `power_right`, `power_left`, `created_at`, `updated_at`) VALUES
('2147483647', -4.25, -4.25, '2019-05-15 08:22:32', '2019-05-16 05:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_13_104439_create_subscriptions_table', 1),
(4, '2019_05_13_111236_create_customers_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(191) NOT NULL,
  `billing_address` text NOT NULL,
  `browser_ip` varchar(191) NOT NULL,
  `buyer_accepts_marketing` tinyint(4) NOT NULL,
  `cancel_reason` varchar(191) NOT NULL,
  `cancelled_at` varchar(191) NOT NULL,
  `cart_token` varchar(191) NOT NULL,
  `client_details` text NOT NULL,
  `closed_at` varchar(191) NOT NULL,
  `created_at` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `customer` text NOT NULL,
  `customer_locale` varchar(191) NOT NULL,
  `discount_applications` text NOT NULL,
  `discount_codes` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `financial_status` varchar(191) NOT NULL,
  `fulfillments` text NOT NULL,
  `fulfillment_status` varchar(191) NOT NULL,
  `gateway` varchar(191) NOT NULL,
  `app_id` varchar(191) NOT NULL,
  `landing_site` varchar(191) NOT NULL,
  `line_items` text NOT NULL,
  `location_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `note` text NOT NULL,
  `note_attributes` text NOT NULL,
  `number` varchar(191) NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `payment_details` text NOT NULL,
  `payment_gateway_names` text NOT NULL,
  `phone` varchar(191) NOT NULL,
  `presentment_currency` varchar(191) NOT NULL,
  `processed_at` varchar(191) NOT NULL,
  `processing_method` varchar(191) NOT NULL,
  `referring_site` varchar(191) NOT NULL,
  `refunds` text NOT NULL,
  `shipping_address` text NOT NULL,
  `shipping_lines` text NOT NULL,
  `source_name` text NOT NULL,
  `subtotal_price` double NOT NULL,
  `subtotal_price_set` text NOT NULL,
  `tags` text NOT NULL,
  `tax_lines` text NOT NULL,
  `taxes_included` tinyint(4) NOT NULL,
  `test` tinyint(4) NOT NULL,
  `token` varchar(191) NOT NULL,
  `total_discounts` double NOT NULL,
  `total_discounts_set` text NOT NULL,
  `total_line_items_price` double NOT NULL,
  `total_line_items_price_set` text NOT NULL,
  `total_price` double NOT NULL,
  `total_price_set` text NOT NULL,
  `total_tax` double NOT NULL,
  `total_tax_set` text NOT NULL,
  `total_tip_received` double NOT NULL,
  `total_weight` double NOT NULL,
  `updated_at` varchar(191) NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `order_status_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` varchar(191) NOT NULL,
  `item_name` varchar(191) DEFAULT NULL,
  `item_description` text,
  `item_amount` int(11) NOT NULL,
  `item_currency` varchar(10) NOT NULL,
  `period` varchar(191) NOT NULL,
  `interval` int(11) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `item_name`, `item_description`, `item_amount`, `item_currency`, `period`, `interval`, `notes`) VALUES
('plan_CVKxrA1xXVEubO', '1 Month Plan', NULL, 300, 'INR', 'monthly', 1, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `path` text NOT NULL,
  `created_at` varchar(191) NOT NULL,
  `updated_at` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `customer_id`, `name`, `path`, `created_at`, `updated_at`) VALUES
(1, '2147483647', 'Capture_1557923399', 'prescriptions/Lt2h37ZszvSvWESphHHnbL38oihmCj3k1Mx1kPWW.png', '2019-05-15 12:29:59', '2019-05-15 12:29:59'),
(2, '2147483647', 'Capture_1557981635', 'public/prescriptions/zI3WPJLXIp8f1kTU5Iacf5MXP1Xm0rycXAcZq8ws.png', '2019-05-16 04:40:35', '2019-05-16 04:40:35'),
(3, '2147483647', 'Capture_1557985244', 'public/prescriptions/Capture_1557985244', '2019-05-16 05:40:44', '2019-05-16 05:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(191) NOT NULL,
  `body_html` text,
  `created_at` varchar(191) DEFAULT NULL,
  `handle` varchar(191) DEFAULT NULL,
  `images` text,
  `options` text,
  `product_type` varchar(191) DEFAULT NULL,
  `published_at` varchar(191) DEFAULT NULL,
  `published_scope` varchar(191) DEFAULT NULL,
  `tags` text,
  `template_suffix` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `updated_at` varchar(191) NOT NULL,
  `variants` text NOT NULL,
  `vendor` varchar(191) NOT NULL,
  `admin_graphql_api_id` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `body_html`, `created_at`, `handle`, `images`, `options`, `product_type`, `published_at`, `published_scope`, `tags`, `template_suffix`, `title`, `updated_at`, `variants`, `vendor`, `admin_graphql_api_id`, `image`) VALUES
('2386022367292', 'qqwerty. faruq', '2019-01-17T20:20:03+05:30', 'bold-test-product-without-variants', '[{\"id\":7034355810364,\"product_id\":2386022367292,\"position\":1,\"created_at\":\"2019-01-17T20:20:03+05:30\",\"updated_at\":\"2019-04-27T16:05:07+05:30\",\"alt\":null,\"width\":1000,\"height\":1000,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0012\\/0658\\/3356\\/products\\/bold-red.jpg?v=1556361307\",\"variant_ids\":[22358899097660],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/7034355810364\"},{\"id\":7608243224636,\"product_id\":2386022367292,\"position\":2,\"created_at\":\"2019-04-02T17:12:33+05:30\",\"updated_at\":\"2019-04-27T20:22:55+05:30\",\"alt\":null,\"width\":934,\"height\":1064,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0012\\/0658\\/3356\\/products\\/output-onlinejpgtools.jpg?v=1556376775\",\"variant_ids\":[22358903881788],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/7608243224636\"},{\"id\":7608250564668,\"product_id\":2386022367292,\"position\":3,\"created_at\":\"2019-04-02T17:13:41+05:30\",\"updated_at\":\"2019-04-27T21:03:09+05:30\",\"alt\":null,\"width\":800,\"height\":800,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0012\\/0658\\/3356\\/products\\/nSSKgPzx.jpg?v=1556379189\",\"variant_ids\":[],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/7608250564668\"}]', '[{\"id\":3299156197436,\"product_id\":2386022367292,\"name\":\"Size\",\"position\":1,\"values\":[\"xx\",\"xxx\"]}]', 'Bold Test Product', '2019-01-17T20:20:02+05:30', 'global', 'Celllimit, Test1, Testnew', '', '#Bold Test Product without variants', '2019-05-08T11:42:04+05:30', '[{\"id\":22358899097660,\"product_id\":2386022367292,\"title\":\"xx\",\"price\":\"15.00\",\"sku\":\"21412\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":null,\"option1\":\"xx\",\"option2\":null,\"option3\":null,\"created_at\":\"2019-04-02T15:54:18+05:30\",\"updated_at\":\"2019-05-10T14:12:45+05:30\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":7034355810364,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":23095304454204,\"inventory_quantity\":-52,\"old_inventory_quantity\":-52,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/22358899097660\"},{\"id\":22358903881788,\"product_id\":2386022367292,\"title\":\"xxx\",\"price\":\"15.00\",\"sku\":\"21413\",\"position\":2,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":null,\"option1\":\"xxx\",\"option2\":null,\"option3\":null,\"created_at\":\"2019-04-02T15:55:44+05:30\",\"updated_at\":\"2019-05-10T14:12:45+05:30\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":7608243224636,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":23095311237180,\"inventory_quantity\":-12,\"old_inventory_quantity\":-12,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/22358903881788\"}]', 'Bold Commerce', 'gid://shopify/Product/2386022367292', '{\"id\":7034355810364,\"product_id\":2386022367292,\"position\":1,\"created_at\":\"2019-01-17T20:20:03+05:30\",\"updated_at\":\"2019-04-27T16:05:07+05:30\",\"alt\":null,\"width\":1000,\"height\":1000,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0012\\/0658\\/3356\\/products\\/bold-red.jpg?v=1556361307\",\"variant_ids\":[22358899097660],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/7034355810364\"}');

-- --------------------------------------------------------

--
-- Table structure for table `products_variants`
--

CREATE TABLE `products_variants` (
  `id` varchar(191) NOT NULL,
  `barcode` varchar(191) NOT NULL,
  `compare_at_price` double DEFAULT NULL,
  `created_at` varchar(191) NOT NULL,
  `fulfillment_service` varchar(50) NOT NULL,
  `grams` int(11) NOT NULL,
  `image_id` varchar(191) NOT NULL,
  `inventory_item_id` varchar(191) NOT NULL,
  `inventory_management` varchar(50) DEFAULT NULL,
  `inventory_policy` varchar(50) NOT NULL,
  `inventory_quantity` int(11) NOT NULL,
  `old_inventory_quantity` int(11) NOT NULL,
  `inventory_quantity_adjustment` int(11) DEFAULT NULL,
  `option1` varchar(191) DEFAULT NULL,
  `option2` varchar(191) DEFAULT NULL,
  `option3` varchar(191) DEFAULT NULL,
  `presentment_prices` text,
  `position` int(11) NOT NULL,
  `price` double NOT NULL,
  `product_id` varchar(191) NOT NULL,
  `requires_shipping` tinyint(4) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `taxable` tinyint(4) NOT NULL,
  `tax_code` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `updated_at` varchar(191) NOT NULL,
  `weight` double NOT NULL,
  `weight_unit` char(5) NOT NULL,
  `admin_graphql_api_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_variants`
--

INSERT INTO `products_variants` (`id`, `barcode`, `compare_at_price`, `created_at`, `fulfillment_service`, `grams`, `image_id`, `inventory_item_id`, `inventory_management`, `inventory_policy`, `inventory_quantity`, `old_inventory_quantity`, `inventory_quantity_adjustment`, `option1`, `option2`, `option3`, `presentment_prices`, `position`, `price`, `product_id`, `requires_shipping`, `sku`, `taxable`, `tax_code`, `title`, `updated_at`, `weight`, `weight_unit`, `admin_graphql_api_id`) VALUES
('22358899097660', '', NULL, '2019-04-02T15:54:18+05:30', 'manual', 0, '7034355810364', '23095304454204', NULL, 'deny', -52, -52, NULL, 'xx', NULL, NULL, NULL, 1, 15, '2386022367292', 1, '21412', 1, NULL, 'xx', '2019-05-10T14:12:45+05:30', 0, 'kg', 'gid://shopify/ProductVariant/22358899097660'),
('22358903881788', '', NULL, '2019-04-02T15:55:44+05:30', 'manual', 0, '7608243224636', '23095311237180', NULL, 'deny', -12, -12, NULL, 'xxx', NULL, NULL, NULL, 2, 15, '2386022367292', 1, '21413', 1, NULL, 'xxx', '2019-05-10T14:12:45+05:30', 0, 'kg', 'gid://shopify/ProductVariant/22358903881788');

-- --------------------------------------------------------

--
-- Table structure for table `razor_addons`
--

CREATE TABLE `razor_addons` (
  `id` varchar(191) NOT NULL,
  `item.name` varchar(191) NOT NULL,
  `item.description` text NOT NULL,
  `item.amount` int(11) NOT NULL,
  `item.currency` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subscription_id` varchar(191) NOT NULL,
  `invoice_id` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `razor_customers`
--

CREATE TABLE `razor_customers` (
  `id` varchar(191) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` varchar(191) NOT NULL,
  `entity` varchar(191) NOT NULL,
  `plan_id` varchar(191) NOT NULL,
  `customer_id` varchar(191) NOT NULL,
  `total_count` int(11) NOT NULL,
  `customer_notify` int(11) NOT NULL,
  `start_at` varchar(191) DEFAULT NULL,
  `end_at` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `notes` text,
  `addons` text,
  `status` varchar(191) NOT NULL,
  `paid_count` int(11) NOT NULL,
  `current_start` varchar(191) DEFAULT NULL,
  `current_end` varchar(191) DEFAULT NULL,
  `ended_at` varchar(191) DEFAULT NULL,
  `charge_at` varchar(191) DEFAULT NULL,
  `auth_attempts` int(11) NOT NULL,
  `payment_id` varchar(191) NOT NULL,
  `short_url` text NOT NULL,
  `created_at` varchar(191) DEFAULT NULL,
  `updated_at` varchar(191) DEFAULT NULL,
  `expire_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `entity`, `plan_id`, `customer_id`, `total_count`, `customer_notify`, `start_at`, `end_at`, `quantity`, `notes`, `addons`, `status`, `paid_count`, `current_start`, `current_end`, `ended_at`, `charge_at`, `auth_attempts`, `payment_id`, `short_url`, `created_at`, `updated_at`, `expire_by`) VALUES
('sub_CWBgXO6CtJK16y', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1559260800', '1572460200', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1559260800', 0, 'pay_CWBgy32XKKGIle', 'https://rzp.io/i/SgEhoIz', '1558007475', NULL, NULL),
('sub_CWbJf00w8KuYh5', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CXgBInPrVVCslW', 6, 1, '1559154600', '1572373800', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1559154600', 0, 'pay_CXgCc0o1Y3aGqj', 'https://rzp.io/i/ryBh1OK', '1558333212', NULL, NULL),
('sub_CWY350pnJzgqkB', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1558895400', '1572114600', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1558895400', 0, 'pay_CWY3IG6EcvhJ4l', 'https://rzp.io/i/XITceAo', '1558086232', NULL, NULL),
('sub_CWYFtbYE41rnC6', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1558895400', '1572114600', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1558895400', 0, 'pay_CWYGF8W32cDVvy', 'https://rzp.io/i/qrflwXU', '1558086959', NULL, NULL),
('sub_CWZFr6JUkMBkQP', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1558895400', '1572114600', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1558895400', 0, 'pay_CWZGWNYKTVHZAi', 'https://rzp.io/i/KQLm91W', '1558090479', NULL, NULL),
('sub_CWZq12O3ZRF1i1', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1558895400', '1572114600', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1558895400', 0, 'pay_CWZsn17ruiKe7k', 'https://rzp.io/i/D26yXVz', '1558092533', NULL, NULL),
('sub_CXi93ECrM0lXCs', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1572460200', '1585593000', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1572460200', 0, 'pay_CXiA5nuJJ5ofWK', 'https://rzp.io/i/u7dRwIZ', '1558340127', NULL, NULL),
('sub_CXiC7dTggx3XMm', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CWACgImcwU9cWq', 6, 1, '1572460200', '1585593000', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1572460200', 0, 'pay_CXiCLXrMFqf1SL', 'https://rzp.io/i/IKSe1rb', '1558340301', NULL, NULL),
('sub_CXin32Q4ipMUuV', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CXin2domIEAruQ', 6, 1, '1559154600', '1572373800', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1559154600', 0, 'pay_CXiqUsZQBxGkLF', 'https://rzp.io/i/GbeKZYE', '1558342399', NULL, NULL),
('sub_CXivNLp3ZWlIFs', 'subscription', 'plan_CVKxrA1xXVEubO', 'cust_CXin2domIEAruQ', 6, 1, '1572460200', '1585593000', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1572460200', 0, 'pay_CXiz1SEO4o3iAd', 'https://rzp.io/i/ai7hlvw', '1558342872', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_links`
--

CREATE TABLE `subscription_links` (
  `subscription_id` varchar(191) NOT NULL,
  `shopify_customer_id` varchar(191) NOT NULL,
  `razor_customer_id` varchar(191) NOT NULL,
  `product_id` varchar(191) NOT NULL,
  `plan_id` varchar(191) NOT NULL,
  `payment_id` varchar(191) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_links`
--

INSERT INTO `subscription_links` (`subscription_id`, `shopify_customer_id`, `razor_customer_id`, `product_id`, `plan_id`, `payment_id`, `created_at`, `updated_at`) VALUES
('sub_CWbJf00w8KuYh5', '1323698913340', 'cust_CWACgImcwU9cWq', '', 'plan_CVKxrA1xXVEubO', 'pay_CWZsn17ruiKe7k', '', ''),
('sub_CXin32Q4ipMUuV', '1301116518460', 'cust_CXin2domIEAruQ', '2386022367292', 'plan_CVKxrA1xXVEubO', 'pay_CXiqUsZQBxGkLF', '2019-05-20 09:00:37', '2019-05-20 09:00:37'),
('sub_CXivNLp3ZWlIFs', '1301116518460', 'cust_CXin2domIEAruQ', '2386022367292', 'plan_CVKxrA1xXVEubO', 'pay_CXiz1SEO4o3iAd', '2019-05-20 09:06:02', '2019-05-20 09:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `freedays`
--
ALTER TABLE `freedays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_id` (`plan_id`);

--
-- Indexes for table `lens_powers`
--
ALTER TABLE `lens_powers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_variants`
--
ALTER TABLE `products_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razor_customers`
--
ALTER TABLE `razor_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
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
-- AUTO_INCREMENT for table `freedays`
--
ALTER TABLE `freedays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

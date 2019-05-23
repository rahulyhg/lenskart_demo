-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2019 at 01:52 PM
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
  `created_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1096248983618, '7406366665@guest.com', 0, '2019-05-23T02:16:49+05:30', '2019-05-23T15:00:57+05:30', 'Marmeto', 'Test', 4, 'enabled', 0, 1001684533314, NULL, 0, NULL, 0, 917406366665, 'allowfree', '#1039', 'INR', '[{\"id\":1240152473666,\"customer_id\":1096248983618,\"first_name\":\"Marmeto\",\"last_name\":\"Test\",\"company\":\"marmeto.com\",\"address1\":\"Bellandur\",\"address2\":\"\",\"city\":\"Bangalore\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"560103\",\"phone\":\"7406366665\",\"name\":\"Marmeto Test\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":false},{\"id\":1240242487362,\"customer_id\":1096248983618,\"first_name\":\"Marmeto\",\"last_name\":\"Test\",\"company\":null,\"address1\":\"Marmeto Bellandur\",\"address2\":null,\"city\":\"Bengaluru\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"560076\",\"phone\":\"7406366665\",\"name\":\"Marmeto Test\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}]', '2019-05-23T02:16:49+05:30', NULL, 'gid://shopify/Customer/1096248983618', '{\"id\":1240242487362,\"customer_id\":1096248983618,\"first_name\":\"Marmeto\",\"last_name\":\"Test\",\"company\":null,\"address1\":\"Marmeto Bellandur\",\"address2\":null,\"city\":\"Bengaluru\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"560076\",\"phone\":\"7406366665\",\"name\":\"Marmeto Test\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}');

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
(1, 10, 'plan_CYdUixhQWdC8O7');

-- --------------------------------------------------------

--
-- Table structure for table `lens_powers`
--

CREATE TABLE `lens_powers` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(191) NOT NULL,
  `power_right` varchar(5) NOT NULL,
  `power_left` varchar(5) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lens_powers`
--

INSERT INTO `lens_powers` (`id`, `customer_id`, `power_right`, `power_left`, `created_at`, `updated_at`) VALUES
(1, '1310133747772', '+1', '+2.5', '2019-05-22 10:32:45', '2019-05-22 10:33:26');

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
  `billing_address` text,
  `browser_ip` varchar(191) DEFAULT NULL,
  `buyer_accepts_marketing` tinyint(4) DEFAULT NULL,
  `cancel_reason` varchar(191) DEFAULT NULL,
  `cancelled_at` varchar(191) DEFAULT NULL,
  `cart_token` varchar(191) DEFAULT NULL,
  `confirmed` varchar(10) DEFAULT NULL,
  `client_details` text,
  `closed_at` varchar(191) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `currency` varchar(5) DEFAULT NULL,
  `customer` text,
  `customer_locale` varchar(191) DEFAULT NULL,
  `checkout_token` varchar(191) DEFAULT NULL,
  `discount_applications` text,
  `discount_codes` text,
  `device_id` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `financial_status` varchar(191) DEFAULT NULL,
  `fulfillments` text,
  `fulfillment_status` varchar(191) DEFAULT NULL,
  `gateway` varchar(191) DEFAULT NULL,
  `app_id` varchar(191) DEFAULT NULL,
  `landing_site` varchar(191) DEFAULT NULL,
  `line_items` text,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `note` text,
  `note_attributes` text,
  `number` varchar(191) DEFAULT NULL,
  `order_number` varchar(191) DEFAULT NULL,
  `payment_details` text,
  `payment_gateway_names` text,
  `phone` varchar(191) DEFAULT NULL,
  `presentment_currency` varchar(191) DEFAULT NULL,
  `processed_at` varchar(191) DEFAULT NULL,
  `processing_method` varchar(191) DEFAULT NULL,
  `referring_site` varchar(191) DEFAULT NULL,
  `refunds` text,
  `reference` varchar(191) DEFAULT NULL,
  `shipping_address` text,
  `shipping_lines` text,
  `source_name` text,
  `subtotal_price` double DEFAULT NULL,
  `subtotal_price_set` text,
  `source_identifier` varchar(191) DEFAULT NULL,
  `source_url` text,
  `tags` text,
  `tax_lines` text,
  `taxes_included` tinyint(4) DEFAULT NULL,
  `test` tinyint(4) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `total_discounts` double DEFAULT NULL,
  `total_discounts_set` text,
  `total_line_items_price` varchar(100) DEFAULT NULL,
  `total_line_items_price_set` text,
  `total_price` double DEFAULT NULL,
  `total_price_set` text,
  `total_price_usd` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_tax_set` text,
  `total_tip_received` double DEFAULT NULL,
  `total_weight` double DEFAULT NULL,
  `updated_at` varchar(191) DEFAULT NULL,
  `user_id` varchar(191) DEFAULT NULL,
  `order_status_url` text,
  `landing_site_ref` varchar(191) DEFAULT NULL,
  `checkout_id` varchar(191) DEFAULT NULL,
  `contact_email` varchar(191) DEFAULT NULL,
  `total_shipping_price_set` varchar(191) DEFAULT NULL,
  `admin_graphql_api_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `billing_address`, `browser_ip`, `buyer_accepts_marketing`, `cancel_reason`, `cancelled_at`, `cart_token`, `confirmed`, `client_details`, `closed_at`, `created_at`, `currency`, `customer`, `customer_locale`, `checkout_token`, `discount_applications`, `discount_codes`, `device_id`, `email`, `financial_status`, `fulfillments`, `fulfillment_status`, `gateway`, `app_id`, `landing_site`, `line_items`, `location_id`, `name`, `note`, `note_attributes`, `number`, `order_number`, `payment_details`, `payment_gateway_names`, `phone`, `presentment_currency`, `processed_at`, `processing_method`, `referring_site`, `refunds`, `reference`, `shipping_address`, `shipping_lines`, `source_name`, `subtotal_price`, `subtotal_price_set`, `source_identifier`, `source_url`, `tags`, `tax_lines`, `taxes_included`, `test`, `token`, `total_discounts`, `total_discounts_set`, `total_line_items_price`, `total_line_items_price_set`, `total_price`, `total_price_set`, `total_price_usd`, `total_tax`, `total_tax_set`, `total_tip_received`, `total_weight`, `updated_at`, `user_id`, `order_status_url`, `landing_site_ref`, `checkout_id`, `contact_email`, `total_shipping_price_set`, `admin_graphql_api_id`) VALUES
('1001684533314', NULL, NULL, 0, NULL, NULL, NULL, '1', NULL, NULL, '2019-05-23T15:00:57+05:30', 'INR', '{\"id\":1096248983618,\"email\":\"7406366665@guest.com\",\"accepts_marketing\":false,\"created_at\":\"2019-05-23T02:16:49+05:30\",\"updated_at\":\"2019-05-23T15:00:57+05:30\",\"first_name\":\"Marmeto\",\"last_name\":\"Test\",\"orders_count\":4,\"state\":\"enabled\",\"total_spent\":\"0.00\",\"last_order_id\":1001684533314,\"note\":null,\"verified_email\":false,\"multipass_identifier\":null,\"tax_exempt\":false,\"phone\":\"+917406366665\",\"tags\":\"allowfree\",\"last_order_name\":\"#1039\",\"currency\":\"INR\",\"accepts_marketing_updated_at\":\"2019-05-23T02:16:49+05:30\",\"marketing_opt_in_level\":null,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/Customer\\/1096248983618\",\"default_address\":{\"id\":1240242487362,\"customer_id\":1096248983618,\"first_name\":\"Marmeto\",\"last_name\":\"Test\",\"company\":null,\"address1\":\"Marmeto Bellandur\",\"address2\":null,\"city\":\"Bengaluru\",\"province\":\"Karnataka\",\"country\":\"India\",\"zip\":\"560076\",\"phone\":\"7406366665\",\"name\":\"Marmeto Test\",\"province_code\":\"KA\",\"country_code\":\"IN\",\"country_name\":\"India\",\"default\":true}}', NULL, NULL, '[]', '[]', NULL, '7406366665@guest.com', 'paid', '[]', NULL, '', '2923367', NULL, '[{\"id\":2148365402178,\"variant_id\":15240701345858,\"title\":\"Aqualens Daily Contact Lenses\",\"quantity\":1,\"sku\":\"134722\",\"variant_title\":\"10 Pairs \\/ 1 Month\",\"vendor\":\"Aqualens\",\"fulfillment_service\":\"manual\",\"product_id\":1796282515522,\"requires_shipping\":true,\"taxable\":true,\"gift_card\":false,\"name\":\"Aqualens Daily Contact Lenses - 10 Pairs \\/ 1 Month\",\"variant_inventory_management\":\"shopify\",\"properties\":[],\"product_exists\":true,\"fulfillable_quantity\":1,\"grams\":0,\"price\":\"0.00\",\"total_discount\":\"0.00\",\"fulfillment_status\":null,\"price_set\":{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}},\"total_discount_set\":{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}},\"discount_allocations\":[],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/LineItem\\/2148365402178\",\"tax_lines\":[]}]', NULL, '#1039', NULL, '[]', '39', '1039', NULL, '[]', NULL, 'INR', '2019-05-23T15:00:57+05:30', '', NULL, '[]', NULL, '{\"first_name\":\"Marmeto\",\"address1\":\"Marmeto Bellandur\",\"phone\":\"7406366665\",\"city\":\"Bengaluru\",\"zip\":\"560076\",\"province\":\"Karnataka\",\"country\":\"India\",\"last_name\":\"Test\",\"address2\":null,\"company\":null,\"latitude\":null,\"longitude\":null,\"name\":\"Marmeto Test\",\"country_code\":\"IN\",\"province_code\":\"KA\"}', '[]', '2923367', 0, '{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}}', NULL, NULL, '', '[]', 0, 0, '6ad39c14dadeba57ac8efb1fa7b435c7', 0, '{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}}', '\"0.00\"', '{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}}', 0, '{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}}', 0, 0, '{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}}', 0, 0, '2019-05-23T15:00:57+05:30', NULL, 'https://checkout.shopify.com/8469577794/orders/6ad39c14dadeba57ac8efb1fa7b435c7/authenticate?key=3af52e85ba778896b8069b7e04ee9d05', NULL, NULL, '7406366665@guest.com', '{\"shop_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"},\"presentment_money\":{\"amount\":\"0.00\",\"currency_code\":\"INR\"}}', 'gid://shopify/Order/1001684533314');

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
  `product_id` varchar(191) NOT NULL,
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

INSERT INTO `plans` (`id`, `item_name`, `product_id`, `item_description`, `item_amount`, `item_currency`, `period`, `interval`, `notes`) VALUES
('plan_CYdUixhQWdC8O7', '1 Month', '1796282515522', 'Great Budget Plan', 30000, 'INR', 'monthly', 1, '[]'),
('plan_CYdVM1aernWGJ4', '2 Month', '1796282515522', 'Great Budget Plan', 30000, 'INR', 'monthly', 1, '[]');

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
('1796282515522', '<div style=\"text-align: center;\"><span>Overview</span></div>\n<h2 style=\"text-align: center;\"><span>What is it?</span></h2>\n<div style=\"text-align: center;\"><span>Somofilcon A material in Aqualens 1D Daily Disposable (30 lens/box) makes these one of the healthiest contact lenses which allow 4 times more oxygen for all-day comfort. With 56% of water content, these lenses offer continuous wettability for 24 hours.</span></div>\n<hr>\n<div class=\"grid\">\n<div class=\"grid__item one-whole technical-heading\">\n<h2>Technical Information</h2>\n</div>\n<div class=\"grid__item large--one-half medium-down--one-whole table-one\">\n<table cellpadding=\"0\" cellspacing=\"0\">\n<tbody>\n<tr>\n<td>Base Curve</td>\n<td>8.6 mm</td>\n</tr>\n<tr>\n<td>Diameter</td>\n<td>14.1 mm</td>\n</tr>\n<tr>\n<td>Lens Material</td>\n<td>Somofilcon A</td>\n</tr>\n<tr>\n<td>Usage Duration</td>\n<td>Dailies</td>\n</tr>\n</tbody>\n</table>\n</div>\n<div class=\"grid__item large--one-half medium-down--one-whole table-two\">\n<table cellpadding=\"0\" cellspacing=\"0\">\n<tbody>\n<tr>\n<td>Gender</td>\n<td>Unisex</td>\n</tr>\n<tr>\n<td>Water Content</td>\n<td>56%</td>\n</tr>\n<tr>\n<td>Weight</td>\n<td>0.6000</td>\n</tr>\n<tr>\n<td>Packaging</td>\n<td>30 Lens per Box</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>', '2019-03-26T18:33:34+05:30', 'aqualens-24h-daily-contact-lenses-30-lens-box', '[{\"id\":4944145842242,\"product_id\":1796282515522,\"position\":1,\"created_at\":\"2019-03-26T18:33:35+05:30\",\"updated_at\":\"2019-03-26T18:33:35+05:30\",\"alt\":\"Aqualens\",\"width\":1325,\"height\":636,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0084\\/6957\\/7794\\/products\\/aqualens-24-h-contact-lens-30-lens-box-contact-lens_aqualens-24-h-dailies_-_1st_image.jpg?v=1553605415\",\"variant_ids\":[],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/4944145842242\"},{\"id\":4999921827906,\"product_id\":1796282515522,\"position\":2,\"created_at\":\"2019-04-02T16:09:07+05:30\",\"updated_at\":\"2019-04-02T16:09:07+05:30\",\"alt\":null,\"width\":1325,\"height\":636,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0084\\/6957\\/7794\\/products\\/aqualens-24-h-monthly-disposable-with-lens-case-1-lens_118561-2nd-image_3.jpg?v=1554201547\",\"variant_ids\":[],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/4999921827906\"}]', '[{\"id\":2406664732738,\"product_id\":1796282515522,\"name\":\"Default\",\"position\":1,\"values\":[\"10 Pairs\",\"30 Pairs\"]},{\"id\":2496862421058,\"product_id\":1796282515522,\"name\":\"Period\",\"position\":2,\"values\":[\"1 Month\",\"2 Month\"]}]', 'Medical', '2019-03-26T18:33:32+05:30', 'web', 'plans_plan_CYdPGM3Ivz5Bp9__300___1 Month, plans_plan_CYdPrcyFdHuzIj__300___2 Month+plans_plan_CYdSvHUcY1tIM9__300___1 Month+plans_plan_CYdTCsxfIFq6pR__300___2 Month', 'subscription', 'Aqualens Daily Contact Lenses', '2019-05-22T21:50:06+05:30', '[{\"id\":15240701345858,\"product_id\":1796282515522,\"title\":\"10 Pairs \\/ 1 Month\",\"price\":\"0.00\",\"sku\":\"134722\",\"position\":1,\"inventory_policy\":\"continue\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"10 Pairs\",\"option2\":\"1 Month\",\"option3\":null,\"created_at\":\"2019-04-21T09:53:09+05:30\",\"updated_at\":\"2019-05-22T17:00:31+05:30\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":null,\"weight\":0,\"weight_unit\":\"g\",\"inventory_item_id\":15848406646850,\"inventory_quantity\":-11,\"old_inventory_quantity\":-11,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/15240701345858\"},{\"id\":15302776750146,\"product_id\":1796282515522,\"title\":\"30 Pairs \\/ 1 Month\",\"price\":\"1200.00\",\"sku\":\"134723\",\"position\":2,\"inventory_policy\":\"continue\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"30 Pairs\",\"option2\":\"1 Month\",\"option3\":null,\"created_at\":\"2019-04-24T18:55:16+05:30\",\"updated_at\":\"2019-05-06T12:52:31+05:30\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":null,\"weight\":0,\"weight_unit\":\"g\",\"inventory_item_id\":15914678714434,\"inventory_quantity\":-2,\"old_inventory_quantity\":-2,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/15302776750146\"},{\"id\":15437613760578,\"product_id\":1796282515522,\"title\":\"10 Pairs \\/ 2 Month\",\"price\":\"0.00\",\"sku\":\"\",\"position\":3,\"inventory_policy\":\"continue\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"10 Pairs\",\"option2\":\"2 Month\",\"option3\":null,\"created_at\":\"2019-05-06T12:53:49+05:30\",\"updated_at\":\"2019-05-06T12:53:49+05:30\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":null,\"weight\":0,\"weight_unit\":\"g\",\"inventory_item_id\":16064168230978,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/15437613760578\"},{\"id\":15437618479170,\"product_id\":1796282515522,\"title\":\"30 Pairs \\/ 2 Month\",\"price\":\"1200.00\",\"sku\":\"\",\"position\":4,\"inventory_policy\":\"continue\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"30 Pairs\",\"option2\":\"2 Month\",\"option3\":null,\"created_at\":\"2019-05-06T12:54:21+05:30\",\"updated_at\":\"2019-05-21T17:01:46+05:30\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":null,\"weight\":0,\"weight_unit\":\"g\",\"inventory_item_id\":16064173146178,\"inventory_quantity\":-1,\"old_inventory_quantity\":-1,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/15437618479170\"}]', 'Aqualens', 'gid://shopify/Product/1796282515522', '{\"id\":4944145842242,\"product_id\":1796282515522,\"position\":1,\"created_at\":\"2019-03-26T18:33:35+05:30\",\"updated_at\":\"2019-03-26T18:33:35+05:30\",\"alt\":\"Aqualens\",\"width\":1325,\"height\":636,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0084\\/6957\\/7794\\/products\\/aqualens-24-h-contact-lens-30-lens-box-contact-lens_aqualens-24-h-dailies_-_1st_image.jpg?v=1553605415\",\"variant_ids\":[],\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/4944145842242\"}');

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
  `shopify_customer_id` varchar(191) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `razor_customers`
--

INSERT INTO `razor_customers` (`id`, `shopify_customer_id`, `name`, `contact`, `email`, `notes`, `created_at`, `updated_at`) VALUES
('cust_CYvJtGwlheiS67', '1096248983618', 'Marmeto Test', '917406366665', '7406366665@guest.com', NULL, '2019-05-23 04:19:04', '2019-05-23 09:49:04');

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
('sub_CYvMV664osICWE', 'subscription', 'plan_CYdUixhQWdC8O7', 'cust_CYvJtGwlheiS67', 6, 1, '1559413800', '1572633000', 1, '{}', NULL, 'authenticated', 0, NULL, NULL, NULL, '1559413800', 0, 'pay_CYvNUP9yzXs7B0', 'https://rzp.io/i/Fhc0zfc', '1558605012', NULL, NULL);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shopify_id` (`shopify_customer_id`);

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
-- AUTO_INCREMENT for table `lens_powers`
--
ALTER TABLE `lens_powers`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

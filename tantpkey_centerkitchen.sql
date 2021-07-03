-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2021 at 08:56 AM
-- Server version: 10.3.27-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tantpkey_centerkitchen`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `store_id`, `name`, `description`, `cost`, `created_at`, `updated_at`) VALUES
(1, 1, 'mostafa tantawy', 'شوايه فراخ وحمام وبط و جريل', 100, '2021-01-03 04:47:43', '2021-01-03 04:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `assign_stocks`
--

CREATE TABLE `assign_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `sourceable_id` bigint(20) UNSIGNED NOT NULL,
  `sourceable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignable_id` bigint(20) UNSIGNED NOT NULL,
  `assignable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_stocks`
--

INSERT INTO `assign_stocks` (`id`, `store_id`, `sourceable_id`, `sourceable_type`, `assignable_id`, `assignable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'App\\Store', 1, 'App\\Department', '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(2, 1, 1, 'App\\Store', 2, 'App\\Department', '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(3, 1, 1, 'App\\Store', 1, 'App\\Department', '2020-09-21 13:03:34', '2020-09-21 13:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `assign_stock_details`
--

CREATE TABLE `assign_stock_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_stock_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_stock_details`
--

INSERT INTO `assign_stock_details` (`id`, `assign_stock_id`, `product_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(2, 1, 2, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(3, 1, 5, 10, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(4, 1, 6, 10, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(5, 1, 7, 10, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(6, 1, 8, 10, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(7, 1, 17, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(8, 1, 16, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(9, 1, 15, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(10, 1, 14, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(11, 1, 11, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(12, 1, 10, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(13, 1, 9, 7, NULL, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(14, 2, 3, 7, NULL, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(15, 2, 4, 7, NULL, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(16, 2, 12, 7, NULL, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(17, 2, 13, 7, NULL, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(18, 3, 18, 15, NULL, '2020-09-21 13:03:34', '2020-09-21 13:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`id`, `store_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'سموحة', NULL, '2020-08-15 14:57:54', '2020-08-15 14:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `store_id`, `name`, `email`, `phone1`, `phone2`, `national_id`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'عميل', 'cli1@gmil.com', '+201221617009', '+201221617009', '8888888', 'عنوان عميل 1سسسسسسسسس', '2020-08-18 13:52:33', '2020-08-18 13:56:21'),
(2, 3, 'clientt', 'client@gmail.com', '11111111', '111111', '8888888', 'عنوان', '2020-08-26 17:53:47', '2020-08-26 18:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `client_accounts`
--

CREATE TABLE `client_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` double NOT NULL,
  `amount` double NOT NULL,
  `method` enum('check','cash','creditcard') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_accounts`
--

INSERT INTO `client_accounts` (`id`, `client_id`, `amount`, `method`, `note`, `employee_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 20, 'cash', '20', 1, NULL, '2020-10-25 07:47:24', '2020-10-25 07:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `cooked_products`
--

CREATE TABLE `cooked_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prepare_header_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cookable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cookable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `unit_cost` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cooked_products`
--

INSERT INTO `cooked_products` (`id`, `store_id`, `order_id`, `order_details_id`, `department_id`, `prepare_header_id`, `cookable_id`, `cookable_type`, `product_id`, `quantity`, `unit_cost`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, 30, 'App\\DishSize', 2, 0.2, NULL, '2020-09-23 01:32:14', '2020-09-23 01:32:14'),
(2, 1, 1, 1, 1, NULL, 30, 'App\\DishSize', 11, 0.2, NULL, '2020-09-23 01:32:14', '2020-09-23 01:32:14'),
(10, 1, 2, 2, 1, NULL, 32, 'App\\DishSize', 11, 0.4, NULL, '2020-10-17 18:10:33', '2020-10-17 18:10:33'),
(9, 1, 2, 2, 1, NULL, 32, 'App\\DishSize', 2, 0.4, NULL, '2020-10-17 18:10:33', '2020-10-17 18:10:33'),
(12, 1, 2, 3, 1, NULL, 29, 'App\\DishSize', 11, 0.2, NULL, '2020-10-17 18:10:33', '2020-10-17 18:10:33'),
(11, 1, 2, 3, 1, NULL, 29, 'App\\DishSize', 2, 0.2, NULL, '2020-10-17 18:10:33', '2020-10-17 18:10:33'),
(7, 1, 3, 4, 1, NULL, 57, 'App\\DishSize', 1, 0.4, NULL, '2020-10-04 02:13:16', '2020-10-04 02:13:16'),
(8, 1, 3, 4, 1, NULL, 57, 'App\\DishSize', 10, 0.4, NULL, '2020-10-04 02:13:16', '2020-10-04 02:13:16'),
(13, 1, NULL, NULL, NULL, 2, 18, 'App\\Product', 16, 0.01, NULL, '2020-10-19 23:13:34', '2020-10-19 23:13:34'),
(14, 1, NULL, NULL, NULL, 2, 18, 'App\\Product', 1, 0.83333333333333, NULL, '2020-10-19 23:13:34', '2020-10-19 23:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `capital`, `currency`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '93', 'Kabul', 'AFN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(2, 'Aland Islands', 'ALA', 'AX', '+358-18', 'Mariehamn', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(3, 'Albania', 'ALB', 'AL', '355', 'Tirana', 'ALL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(4, 'Algeria', 'DZA', 'DZ', '213', 'Algiers', 'DZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(5, 'American Samoa', 'ASM', 'AS', '+1-684', 'Pago Pago', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(6, 'Andorra', 'AND', 'AD', '376', 'Andorra la Vella', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(7, 'Angola', 'AGO', 'AO', '244', 'Luanda', 'AOA', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(8, 'Anguilla', 'AIA', 'AI', '+1-264', 'The Valley', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(9, 'Antarctica', 'ATA', 'AQ', '', '', '', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '+1-268', 'St. John\'s', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(11, 'Argentina', 'ARG', 'AR', '54', 'Buenos Aires', 'ARS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(12, 'Armenia', 'ARM', 'AM', '374', 'Yerevan', 'AMD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(13, 'Aruba', 'ABW', 'AW', '297', 'Oranjestad', 'AWG', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(14, 'Australia', 'AUS', 'AU', '61', 'Canberra', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(15, 'Austria', 'AUT', 'AT', '43', 'Vienna', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(16, 'Azerbaijan', 'AZE', 'AZ', '994', 'Baku', 'AZN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(17, 'Bahamas The', 'BHS', 'BS', '+1-242', 'Nassau', 'BSD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(18, 'Bahrain', 'BHR', 'BH', '973', 'Manama', 'BHD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(19, 'Bangladesh', 'BGD', 'BD', '880', 'Dhaka', 'BDT', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(20, 'Barbados', 'BRB', 'BB', '+1-246', 'Bridgetown', 'BBD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(21, 'Belarus', 'BLR', 'BY', '375', 'Minsk', 'BYR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(22, 'Belgium', 'BEL', 'BE', '32', 'Brussels', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(23, 'Belize', 'BLZ', 'BZ', '501', 'Belmopan', 'BZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(24, 'Benin', 'BEN', 'BJ', '229', 'Porto-Novo', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(25, 'Bermuda', 'BMU', 'BM', '+1-441', 'Hamilton', 'BMD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(26, 'Bhutan', 'BTN', 'BT', '975', 'Thimphu', 'BTN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(27, 'Bolivia', 'BOL', 'BO', '591', 'Sucre', 'BOB', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(28, 'Bosnia and Herzegovina', 'BIH', 'BA', '387', 'Sarajevo', 'BAM', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(29, 'Botswana', 'BWA', 'BW', '267', 'Gaborone', 'BWP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(30, 'Bouvet Island', 'BVT', 'BV', '', '', 'NOK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(31, 'Brazil', 'BRA', 'BR', '55', 'Brasilia', 'BRL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(32, 'British Indian Ocean Territory', 'IOT', 'IO', '246', 'Diego Garcia', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(33, 'Brunei', 'BRN', 'BN', '673', 'Bandar Seri Begawan', 'BND', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(34, 'Bulgaria', 'BGR', 'BG', '359', 'Sofia', 'BGN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(35, 'Burkina Faso', 'BFA', 'BF', '226', 'Ouagadougou', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(36, 'Burundi', 'BDI', 'BI', '257', 'Bujumbura', 'BIF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(37, 'Cambodia', 'KHM', 'KH', '855', 'Phnom Penh', 'KHR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(38, 'Cameroon', 'CMR', 'CM', '237', 'Yaounde', 'XAF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(39, 'Canada', 'CAN', 'CA', '1', 'Ottawa', 'CAD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(40, 'Cape Verde', 'CPV', 'CV', '238', 'Praia', 'CVE', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(41, 'Cayman Islands', 'CYM', 'KY', '+1-345', 'George Town', 'KYD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(42, 'Central African Republic', 'CAF', 'CF', '236', 'Bangui', 'XAF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(43, 'Chad', 'TCD', 'TD', '235', 'N\'Djamena', 'XAF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(44, 'Chile', 'CHL', 'CL', '56', 'Santiago', 'CLP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(45, 'China', 'CHN', 'CN', '86', 'Beijing', 'CNY', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(46, 'Christmas Island', 'CXR', 'CX', '61', 'Flying Fish Cove', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(47, 'Cocos (Keeling) Islands', 'CCK', 'CC', '61', 'West Island', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(48, 'Colombia', 'COL', 'CO', '57', 'Bogota', 'COP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(49, 'Comoros', 'COM', 'KM', '269', 'Moroni', 'KMF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(50, 'Congo', 'COG', 'CG', '242', 'Brazzaville', 'XAF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(51, 'Congo The Democratic Republic Of The', 'COD', 'CD', '243', 'Kinshasa', 'CDF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(52, 'Cook Islands', 'COK', 'CK', '682', 'Avarua', 'NZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(53, 'Costa Rica', 'CRI', 'CR', '506', 'San Jose', 'CRC', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', 'CI', '225', 'Yamoussoukro', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(55, 'Croatia (Hrvatska)', 'HRV', 'HR', '385', 'Zagreb', 'HRK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(56, 'Cuba', 'CUB', 'CU', '53', 'Havana', 'CUP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(57, 'Cyprus', 'CYP', 'CY', '357', 'Nicosia', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(58, 'Czech Republic', 'CZE', 'CZ', '420', 'Prague', 'CZK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(59, 'Denmark', 'DNK', 'DK', '45', 'Copenhagen', 'DKK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(60, 'Djibouti', 'DJI', 'DJ', '253', 'Djibouti', 'DJF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(61, 'Dominica', 'DMA', 'DM', '+1-767', 'Roseau', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(62, 'Dominican Republic', 'DOM', 'DO', '+1-809 and 1-829', 'Santo Domingo', 'DOP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(63, 'East Timor', 'TLS', 'TL', '670', 'Dili', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(64, 'Ecuador', 'ECU', 'EC', '593', 'Quito', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(65, 'Egypt', 'EGY', 'EG', '20', 'Cairo', 'EGP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(66, 'El Salvador', 'SLV', 'SV', '503', 'San Salvador', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(67, 'Equatorial Guinea', 'GNQ', 'GQ', '240', 'Malabo', 'XAF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(68, 'Eritrea', 'ERI', 'ER', '291', 'Asmara', 'ERN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(69, 'Estonia', 'EST', 'EE', '372', 'Tallinn', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(70, 'Ethiopia', 'ETH', 'ET', '251', 'Addis Ababa', 'ETB', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(71, 'Falkland Islands', 'FLK', 'FK', '500', 'Stanley', 'FKP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(72, 'Faroe Islands', 'FRO', 'FO', '298', 'Torshavn', 'DKK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(73, 'Fiji Islands', 'FJI', 'FJ', '679', 'Suva', 'FJD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(74, 'Finland', 'FIN', 'FI', '358', 'Helsinki', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(75, 'France', 'FRA', 'FR', '33', 'Paris', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(76, 'French Guiana', 'GUF', 'GF', '594', 'Cayenne', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(77, 'French Polynesia', 'PYF', 'PF', '689', 'Papeete', 'XPF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(78, 'French Southern Territories', 'ATF', 'TF', '', 'Port-aux-Francais', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(79, 'Gabon', 'GAB', 'GA', '241', 'Libreville', 'XAF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(80, 'Gambia The', 'GMB', 'GM', '220', 'Banjul', 'GMD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(81, 'Georgia', 'GEO', 'GE', '995', 'Tbilisi', 'GEL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(82, 'Germany', 'DEU', 'DE', '49', 'Berlin', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(83, 'Ghana', 'GHA', 'GH', '233', 'Accra', 'GHS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(84, 'Gibraltar', 'GIB', 'GI', '350', 'Gibraltar', 'GIP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(85, 'Greece', 'GRC', 'GR', '30', 'Athens', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(86, 'Greenland', 'GRL', 'GL', '299', 'Nuuk', 'DKK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(87, 'Grenada', 'GRD', 'GD', '+1-473', 'St. George\'s', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(88, 'Guadeloupe', 'GLP', 'GP', '590', 'Basse-Terre', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(89, 'Guam', 'GUM', 'GU', '+1-671', 'Hagatna', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(90, 'Guatemala', 'GTM', 'GT', '502', 'Guatemala City', 'GTQ', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(91, 'Guernsey and Alderney', 'GGY', 'GG', '+44-1481', 'St Peter Port', 'GBP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(92, 'Guinea', 'GIN', 'GN', '224', 'Conakry', 'GNF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(93, 'Guinea-Bissau', 'GNB', 'GW', '245', 'Bissau', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(94, 'Guyana', 'GUY', 'GY', '592', 'Georgetown', 'GYD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(95, 'Haiti', 'HTI', 'HT', '509', 'Port-au-Prince', 'HTG', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(96, 'Heard and McDonald Islands', 'HMD', 'HM', ' ', '', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(97, 'Honduras', 'HND', 'HN', '504', 'Tegucigalpa', 'HNL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(98, 'Hong Kong S.A.R.', 'HKG', 'HK', '852', 'Hong Kong', 'HKD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(99, 'Hungary', 'HUN', 'HU', '36', 'Budapest', 'HUF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(100, 'Iceland', 'ISL', 'IS', '354', 'Reykjavik', 'ISK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(101, 'India', 'IND', 'IN', '91', 'New Delhi', 'INR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(102, 'Indonesia', 'IDN', 'ID', '62', 'Jakarta', 'IDR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(103, 'Iran', 'IRN', 'IR', '98', 'Tehran', 'IRR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(104, 'Iraq', 'IRQ', 'IQ', '964', 'Baghdad', 'IQD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(105, 'Ireland', 'IRL', 'IE', '353', 'Dublin', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(106, 'Israel', 'ISR', 'IL', '972', 'Jerusalem', 'ILS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(107, 'Italy', 'ITA', 'IT', '39', 'Rome', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(108, 'Jamaica', 'JAM', 'JM', '+1-876', 'Kingston', 'JMD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(109, 'Japan', 'JPN', 'JP', '81', 'Tokyo', 'JPY', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(110, 'Jersey', 'JEY', 'JE', '+44-1534', 'Saint Helier', 'GBP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(111, 'Jordan', 'JOR', 'JO', '962', 'Amman', 'JOD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(112, 'Kazakhstan', 'KAZ', 'KZ', '7', 'Astana', 'KZT', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(113, 'Kenya', 'KEN', 'KE', '254', 'Nairobi', 'KES', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(114, 'Kiribati', 'KIR', 'KI', '686', 'Tarawa', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(115, 'Korea North\n', 'PRK', 'KP', '850', 'Pyongyang', 'KPW', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(116, 'Korea South', 'KOR', 'KR', '82', 'Seoul', 'KRW', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(117, 'Kuwait', 'KWT', 'KW', '965', 'Kuwait City', 'KWD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(118, 'Kyrgyzstan', 'KGZ', 'KG', '996', 'Bishkek', 'KGS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(119, 'Laos', 'LAO', 'LA', '856', 'Vientiane', 'LAK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(120, 'Latvia', 'LVA', 'LV', '371', 'Riga', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(121, 'Lebanon', 'LBN', 'LB', '961', 'Beirut', 'LBP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(122, 'Lesotho', 'LSO', 'LS', '266', 'Maseru', 'LSL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(123, 'Liberia', 'LBR', 'LR', '231', 'Monrovia', 'LRD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(124, 'Libya', 'LBY', 'LY', '218', 'Tripolis', 'LYD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(125, 'Liechtenstein', 'LIE', 'LI', '423', 'Vaduz', 'CHF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(126, 'Lithuania', 'LTU', 'LT', '370', 'Vilnius', 'LTL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(127, 'Luxembourg', 'LUX', 'LU', '352', 'Luxembourg', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(128, 'Macau S.A.R.', 'MAC', 'MO', '853', 'Macao', 'MOP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(129, 'Macedonia', 'MKD', 'MK', '389', 'Skopje', 'MKD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(130, 'Madagascar', 'MDG', 'MG', '261', 'Antananarivo', 'MGA', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(131, 'Malawi', 'MWI', 'MW', '265', 'Lilongwe', 'MWK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(132, 'Malaysia', 'MYS', 'MY', '60', 'Kuala Lumpur', 'MYR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(133, 'Maldives', 'MDV', 'MV', '960', 'Male', 'MVR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(134, 'Mali', 'MLI', 'ML', '223', 'Bamako', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(135, 'Malta', 'MLT', 'MT', '356', 'Valletta', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(136, 'Man (Isle of)', 'IMN', 'IM', '+44-1624', 'Douglas, Isle of Man', 'GBP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(137, 'Marshall Islands', 'MHL', 'MH', '692', 'Majuro', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(138, 'Martinique', 'MTQ', 'MQ', '596', 'Fort-de-France', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(139, 'Mauritania', 'MRT', 'MR', '222', 'Nouakchott', 'MRO', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(140, 'Mauritius', 'MUS', 'MU', '230', 'Port Louis', 'MUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(141, 'Mayotte', 'MYT', 'YT', '262', 'Mamoudzou', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(142, 'Mexico', 'MEX', 'MX', '52', 'Mexico City', 'MXN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(143, 'Micronesia', 'FSM', 'FM', '691', 'Palikir', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(144, 'Moldova', 'MDA', 'MD', '373', 'Chisinau', 'MDL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(145, 'Monaco', 'MCO', 'MC', '377', 'Monaco', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(146, 'Mongolia', 'MNG', 'MN', '976', 'Ulan Bator', 'MNT', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(147, 'Montenegro', 'MNE', 'ME', '382', 'Podgorica', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(148, 'Montserrat', 'MSR', 'MS', '+1-664', 'Plymouth', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(149, 'Morocco', 'MAR', 'MA', '212', 'Rabat', 'MAD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(150, 'Mozambique', 'MOZ', 'MZ', '258', 'Maputo', 'MZN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(151, 'Myanmar', 'MMR', 'MM', '95', 'Nay Pyi Taw', 'MMK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(152, 'Namibia', 'NAM', 'NA', '264', 'Windhoek', 'NAD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(153, 'Nauru', 'NRU', 'NR', '674', 'Yaren', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(154, 'Nepal', 'NPL', 'NP', '977', 'Kathmandu', 'NPR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(155, 'Netherlands Antilles', 'ANT', 'AN', '', '', '', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(156, 'Netherlands The', 'NLD', 'NL', '31', 'Amsterdam', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(157, 'New Caledonia', 'NCL', 'NC', '687', 'Noumea', 'XPF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(158, 'New Zealand', 'NZL', 'NZ', '64', 'Wellington', 'NZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(159, 'Nicaragua', 'NIC', 'NI', '505', 'Managua', 'NIO', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(160, 'Niger', 'NER', 'NE', '227', 'Niamey', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(161, 'Nigeria', 'NGA', 'NG', '234', 'Abuja', 'NGN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(162, 'Niue', 'NIU', 'NU', '683', 'Alofi', 'NZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(163, 'Norfolk Island', 'NFK', 'NF', '672', 'Kingston', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(164, 'Northern Mariana Islands', 'MNP', 'MP', '+1-670', 'Saipan', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(165, 'Norway', 'NOR', 'NO', '47', 'Oslo', 'NOK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(166, 'Oman', 'OMN', 'OM', '968', 'Muscat', 'OMR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(167, 'Pakistan', 'PAK', 'PK', '92', 'Islamabad', 'PKR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(168, 'Palau', 'PLW', 'PW', '680', 'Melekeok', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(169, 'Palestinian Territory Occupied', 'PSE', 'PS', '970', 'East Jerusalem', 'ILS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(170, 'Panama', 'PAN', 'PA', '507', 'Panama City', 'PAB', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(171, 'Papua new Guinea', 'PNG', 'PG', '675', 'Port Moresby', 'PGK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(172, 'Paraguay', 'PRY', 'PY', '595', 'Asuncion', 'PYG', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(173, 'Peru', 'PER', 'PE', '51', 'Lima', 'PEN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(174, 'Philippines', 'PHL', 'PH', '63', 'Manila', 'PHP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(175, 'Pitcairn Island', 'PCN', 'PN', '870', 'Adamstown', 'NZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(176, 'Poland', 'POL', 'PL', '48', 'Warsaw', 'PLN', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(177, 'Portugal', 'PRT', 'PT', '351', 'Lisbon', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(178, 'Puerto Rico', 'PRI', 'PR', '+1-787 and 1-939', 'San Juan', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(179, 'Qatar', 'QAT', 'QA', '974', 'Doha', 'QAR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(180, 'Reunion', 'REU', 'RE', '262', 'Saint-Denis', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(181, 'Romania', 'ROU', 'RO', '40', 'Bucharest', 'RON', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(182, 'Russia', 'RUS', 'RU', '7', 'Moscow', 'RUB', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(183, 'Rwanda', 'RWA', 'RW', '250', 'Kigali', 'RWF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(184, 'Saint Helena', 'SHN', 'SH', '290', 'Jamestown', 'SHP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '+1-869', 'Basseterre', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(186, 'Saint Lucia', 'LCA', 'LC', '+1-758', 'Castries', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '508', 'Saint-Pierre', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '+1-784', 'Kingstown', 'XCD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '590', 'Gustavia', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '590', 'Marigot', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(191, 'Samoa', 'WSM', 'WS', '685', 'Apia', 'WST', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(192, 'San Marino', 'SMR', 'SM', '378', 'San Marino', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(193, 'Sao Tome and Principe', 'STP', 'ST', '239', 'Sao Tome', 'STD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(194, 'Saudi Arabia', 'SAU', 'SA', '966', 'Riyadh', 'SAR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(195, 'Senegal', 'SEN', 'SN', '221', 'Dakar', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(196, 'Serbia', 'SRB', 'RS', '381', 'Belgrade', 'RSD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(197, 'Seychelles', 'SYC', 'SC', '248', 'Victoria', 'SCR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(198, 'Sierra Leone', 'SLE', 'SL', '232', 'Freetown', 'SLL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(199, 'Singapore', 'SGP', 'SG', '65', 'Singapur', 'SGD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(200, 'Slovakia', 'SVK', 'SK', '421', 'Bratislava', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(201, 'Slovenia', 'SVN', 'SI', '386', 'Ljubljana', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(202, 'Solomon Islands', 'SLB', 'SB', '677', 'Honiara', 'SBD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(203, 'Somalia', 'SOM', 'SO', '252', 'Mogadishu', 'SOS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(204, 'South Africa', 'ZAF', 'ZA', '27', 'Pretoria', 'ZAR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(205, 'South Georgia', 'SGS', 'GS', '', 'Grytviken', 'GBP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(206, 'South Sudan', 'SSD', 'SS', '211', 'Juba', 'SSP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(207, 'Spain', 'ESP', 'ES', '34', 'Madrid', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(208, 'Sri Lanka', 'LKA', 'LK', '94', 'Colombo', 'LKR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(209, 'Sudan', 'SDN', 'SD', '249', 'Khartoum', 'SDG', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(210, 'Suriname', 'SUR', 'SR', '597', 'Paramaribo', 'SRD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 'SJ', '47', 'Longyearbyen', 'NOK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(212, 'Swaziland', 'SWZ', 'SZ', '268', 'Mbabane', 'SZL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(213, 'Sweden', 'SWE', 'SE', '46', 'Stockholm', 'SEK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(214, 'Switzerland', 'CHE', 'CH', '41', 'Berne', 'CHF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(215, 'Syria', 'SYR', 'SY', '963', 'Damascus', 'SYP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(216, 'Taiwan', 'TWN', 'TW', '886', 'Taipei', 'TWD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(217, 'Tajikistan', 'TJK', 'TJ', '992', 'Dushanbe', 'TJS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(218, 'Tanzania', 'TZA', 'TZ', '255', 'Dodoma', 'TZS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(219, 'Thailand', 'THA', 'TH', '66', 'Bangkok', 'THB', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(220, 'Togo', 'TGO', 'TG', '228', 'Lome', 'XOF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(221, 'Tokelau', 'TKL', 'TK', '690', '', 'NZD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(222, 'Tonga', 'TON', 'TO', '676', 'Nuku\'alofa', 'TOP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '+1-868', 'Port of Spain', 'TTD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(224, 'Tunisia', 'TUN', 'TN', '216', 'Tunis', 'TND', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(225, 'Turkey', 'TUR', 'TR', '90', 'Ankara', 'TRY', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(226, 'Turkmenistan', 'TKM', 'TM', '993', 'Ashgabat', 'TMT', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '+1-649', 'Cockburn Town', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(228, 'Tuvalu', 'TUV', 'TV', '688', 'Funafuti', 'AUD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(229, 'Uganda', 'UGA', 'UG', '256', 'Kampala', 'UGX', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(230, 'Ukraine', 'UKR', 'UA', '380', 'Kiev', 'UAH', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(231, 'United Arab Emirates', 'ARE', 'AE', '971', 'Abu Dhabi', 'AED', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(232, 'United Kingdom', 'GBR', 'GB', '44', 'London', 'GBP', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(233, 'United States', 'USA', 'US', '1', 'Washington', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '1', '', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(235, 'Uruguay', 'URY', 'UY', '598', 'Montevideo', 'UYU', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(236, 'Uzbekistan', 'UZB', 'UZ', '998', 'Tashkent', 'UZS', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(237, 'Vanuatu', 'VUT', 'VU', '678', 'Port Vila', 'VUV', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(238, 'Vatican City State (Holy See)', 'VAT', 'VA', '379', 'Vatican City', 'EUR', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(239, 'Venezuela', 'VEN', 'VE', '58', 'Caracas', 'VEF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(240, 'Vietnam', 'VNM', 'VN', '84', 'Hanoi', 'VND', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '+1-284', 'Road Town', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '+1-340', 'Charlotte Amalie', 'USD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(243, 'Wallis And Futuna Islands', 'WLF', 'WF', '681', 'Mata Utu', 'XPF', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(244, 'Western Sahara', 'ESH', 'EH', '212', 'El-Aaiun', 'MAD', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(245, 'Yemen', 'YEM', 'YE', '967', 'Sanaa', 'YER', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(246, 'Zambia', 'ZMB', 'ZM', '260', 'Lusaka', 'ZMK', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03'),
(247, 'Zimbabwe', 'ZWE', 'ZW', '263', 'Harare', 'ZWL', 1, '2018-07-20 12:41:03', '2018-07-20 12:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `percentage` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `store_id`, `name`, `description`, `from`, `to`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 'كوبون', '10%', '2020-08-17', '2021-08-31', 10, '2020-08-17 13:50:10', '2020-08-24 07:59:52');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `store_id`, `center_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'مطبخ', NULL, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(2, 1, 1, 'باريستا', NULL, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(3, 3, 1, 'باريستا', 'dddddddd', '2020-08-26 13:53:28', '2020-08-26 14:08:31'),
(4, 3, 1, 'مطبخ', 'مطبخبببببب', '2020-08-26 14:09:09', '2020-08-26 14:09:20'),
(5, 15, 1, 'مطبخ', 'مطبخ', '2020-09-09 13:17:13', '2020-09-09 13:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'images/no_image.png',
  `type` enum('dish','side','extra') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dish_category_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sides_limit` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `store_id`, `name`, `name_ar`, `description`, `image`, `type`, `dish_category_id`, `department_id`, `sides_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Alfredoo ', 'الفريدو', 'Alfredoo ', 'dishes/22092020-013713alfredoo_pasta.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(2, 1, 'Bashamel', 'باشامل', 'Bashamel', 'dishes/22092020-013713bashamel.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(3, 1, 'Fotchini', 'فوتشيني', 'Fotchini', 'dishes/22092020-013713fotchini.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(4, 1, 'Negresco Pasta', 'نجرسكو', 'Negresco Pasta', 'dishes/22092020-013713negresco_pasta_2.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(5, 1, 'Pasta white-sauch', 'مكرونة بالصوص الابيض', 'Pasta white-sauch', 'dishes/22092020-013713pasta_white_sauch_2.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(6, 1, 'Pasta shrimps', 'مكرونة بالجمبري', 'Pasta shrimps', 'dishes/22092020-013713shrimps_pasta_cream.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(7, 1, 'Spaghetti-with-bolognese-sauce', 'سباجتي بالبولونيز', 'Spaghetti-with-bolognese-sauce', 'dishes/22092020-013713spaghetti_with_bolog_8ZT4C.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(8, 1, 'Tagen Penna ', 'تاجن مكرونة', 'Tagen Penna ', 'dishes/22092020-013713tagen_penna_.jpg', 'dish', 4, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(9, 1, 'Hot Dog', 'بيتزا الهوت دوج', 'Hot Dog', 'dishes/22092020-013713hot_dog.jpg', 'dish', 3, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(10, 1, 'Margrita', 'بيتزا مارجريتا', 'Margrita', 'dishes/22092020-013713margrita.jpg', 'dish', 3, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(11, 1, 'Mashrom', 'بيتزا الماشروم ', 'Mashrom', 'dishes/22092020-013713mashrom.jpg', 'dish', 3, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(12, 1, 'Pastarma', 'بيتزا بسطرمه', 'Pastarma', 'dishes/22092020-013713pastarma.jpg', 'dish', 3, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(13, 1, 'Peproni', 'بيتزا الببروني', 'Peproni', 'dishes/22092020-013713peproni.jpg', 'dish', 3, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(14, 1, 'White Chicken Pizza', 'بيتزا دجاج صوص ابيض', 'White Chicken Pizza', 'dishes/22092020-013713white_chicken_pizza.jpg', 'dish', 3, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(15, 1, 'baked-chicken-wings', 'اجنحة دجاج مقلية', 'baked-chicken-wings', 'dishes/22092020-013713baked_chicken_wings.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(16, 1, 'Sambosk', 'سمبوسك', 'Sambosk', 'dishes/22092020-013713sambosk.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(17, 1, 'Cheader Sous', 'صوص التشيدر', 'Cheader Sous', 'dishes/22092020-013713cheader_sous.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(18, 1, 'chicken caesar-salad', 'سلطة دجاج سيزر', 'chicken caesar-salad', 'dishes/22092020-013713chicken_caesar_salad.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(19, 1, 'Chopped-Green -Salad', 'سلطة خضراء', 'Chopped-Green -Salad', 'dishes/22092020-013713chopped_green__salad.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(20, 1, 'fryer-onion-rings', 'حلقات البصل الذهبية', 'fryer-onion-rings', 'dishes/22092020-013713fryer_onion_rings.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(21, 1, 'Greek Salad', 'سلطة يوناني', 'Greek Salad', 'dishes/22092020-013713greek_salad.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(22, 1, 'lettuce-avocado-and-mango-salad', 'افوكادو ومانجو ', 'lettuce-avocado-and-mango-salad', 'dishes/22092020-013713lettuce_avocado_and__LGojO.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(23, 1, 'pesto-pasta-salad', 'لسطة بيستو باستا', 'pesto-pasta-salad', 'dishes/22092020-013713pesto_pasta_salad.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(24, 1, 'Thenaa salad ', 'طحينة', 'Thenaa salad ', 'dishes/22092020-013713thenaa_salad_.jpg', 'dish', 5, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(25, 1, 'checken  Burger', 'برجر فراخ', 'checken  Burger', 'dishes/22092020-013713checken.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(26, 1, 'double chese Burger', 'برجر لحم طبقتين', 'double chese Burger', 'dishes/22092020-013713double.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(27, 1, 'Single chese Burger', 'برجر لحم طبقة', 'Single chese Burger', 'dishes/22092020-013713single.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(28, 1, 'hasawshy', 'حواوشي لحم ', 'hasawshy', 'dishes/22092020-013713hasawshy.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(29, 1, 'Mashroom chese Burger', 'برجر ماشروم', 'Mashroom chese Burger', 'dishes/22092020-013713mashrom.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(30, 1, 'Liver', 'كبدة', 'Liver', 'dishes/22092020-013713kebda.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(31, 1, 'shawerma checken', 'شاورما دجاج', 'shawerma checken', 'dishes/22092020-013713shawerma_checken.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(32, 1, 'shawerma meat', 'شاورما لحم ', 'shawerma meat', 'dishes/22092020-013713shawerma_meat.jpg', 'dish', 2, 1, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(33, 1, 'borio', 'بوريو', 'borio', 'dishes/22092020-013713borio.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(34, 1, 'Ice-Cream', 'ايس كريم', 'Chocolate-Crunch-Ice-Cream', 'dishes/22092020-013713chocolate_crunch_ice_YkcVy.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(35, 1, 'lemon-juice', 'عصير لمون فريش', 'lemon-juice', 'dishes/22092020-013713lemon_juice.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(36, 1, 'mango-juice', 'عصير مانجو فريش', 'mango-juice', 'dishes/22092020-013713mango_juice.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(37, 1, 'pepsi', 'بيبسي', 'pepsi', 'dishes/22092020-013713pepsi.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(38, 1, 'pineapple-juice', 'عصير اناناس', 'pineapple-juice', 'dishes/22092020-013713pineapple_juice_.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(39, 1, 'Strawberry-Juice', 'عصير فرولة', 'Strawberry-Juice', 'dishes/22092020-013713strawberry_juice.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(40, 1, 'Water', 'مياه', 'Water', 'dishes/22092020-013713water.jpg', 'dish', 7, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(41, 1, 'Cabitshino', 'كابتشينو', 'Cabitshino', 'dishes/22092020-013713cabitshino.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(42, 1, 'Coffee', 'قهوة', 'Coffee', 'dishes/22092020-013713coffee.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(43, 1, 'Helba', 'حلبة', 'Helba', 'dishes/22092020-013713helba.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(44, 1, 'Hot choclet', 'شيكولا ساخنة', 'Hot choclet', 'dishes/22092020-013713hot_choclet.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(45, 1, 'Mint', 'النعناع', 'Mint', 'dishes/22092020-013713ne3na3.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(46, 1, 'Tea', 'شاي', 'Tea', 'dishes/22092020-013713tea.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(47, 1, 'Anise', 'ينسون', 'Anise', 'dishes/22092020-013713yanson.jpg', 'dish', 6, 2, 0, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(48, 1, 'pepsi', '[يبسي', 'pepsi', 'dishes/22092020-013713pepsi.jpg', 'side', 8, 2, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(49, 1, 'PASTA', 'مكرونة ', 'PASTA', 'dishes/22092020-013713pinna.jpg', 'side', 8, 1, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(50, 1, 'pom fries', 'بطاطس محمره', 'pom fries', 'dishes/22092020-013713pom_fries.jpg', 'side', 8, 1, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(51, 1, 'ris', 'أرز', 'ris', 'dishes/22092020-013713ris.jpg', 'side', 8, 1, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(52, 1, 'water', 'مياه600 مم', 'water', 'dishes/22092020-013713water.jpg', 'side', 8, 2, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(53, 1, 'Cheader Sous', 'صوص التشيدر', 'Cheader Sous', 'dishes/22092020-013713cheader_sous.jpg', 'extra', 9, 1, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(54, 1, 'pom fries', 'بطاطس محمره', 'pom fries', 'dishes/22092020-013713pom_fries.jpg', 'extra', 9, 1, 0, 0, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(55, 1, 'Langoustines with Tomato and Lemon', 'كابوريا بالطماطم واليمون', 'Langoustines with Tomato and Lemon', 'dishes/22092020-013713langoustines_with_to_qPasG.jpg', 'dish', 1, 1, 2, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(56, 1, 'One-Pan BBQ Baby Back Ribs', 'اضلع مقطعه ', 'One-Pan BBQ Baby Back Ribs', 'dishes/22092020-013713one_pan_bbq_baby_bac_g3JBf.jpg', 'dish', 1, 1, 2, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(57, 1, 'Pan-Seared Salmon with Kale and Apple Salad', 'شريحةسالامون وسلطة التفاح', 'Pan-Seared Salmon with Kale and Apple Salad', 'dishes/22092020-013713pan_seared_salmon_wi_Nf5oD.jpg', 'dish', 1, 1, 2, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(58, 1, 'Roast Chicken', 'دجاج روستد ', 'Roast Chicken', 'dishes/22092020-013713roast_chicken.jpg', 'dish', 1, 1, 2, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(59, 1, 'Roasted Beef Tenderloin', 'لحم  بروستد', 'Roasted Beef Tenderloin', 'dishes/22092020-013713roasted_beef_tenderl_h35L8.jpg', 'dish', 1, 1, 2, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13'),
(60, 1, 'Roasted Duck Legs in a Red Wine Sauce', 'اوراك البط روستد', 'Roasted Duck Legs in a Red Wine Sauce', 'dishes/22092020-013713roasted_duck_legs_in_wkGwb.jpg', 'dish', 1, 1, 2, 1, '2020-09-22 17:37:13', '2020-09-22 17:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `dish_categories`
--

CREATE TABLE `dish_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_categories`
--

INSERT INTO `dish_categories` (`id`, `store_id`, `name`, `name_ar`, `description`, `show`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main Course', 'الطبق الرئيسي', 'Main Course', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(2, 1, 'Sandwiches', 'الساندوتشات', 'Sandwiches', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(3, 1, 'Pizza', 'البيتزا', 'Pizza', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(4, 1, 'Pasta', 'الباستا', 'Pasta', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(5, 1, 'Salads ', 'السلطات', 'Salads', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(6, 1, 'Hot Drinks', 'المشروبات الساخنة', 'Hot Drinks', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(7, 1, 'Cold Drinks', 'المشروبات المثلجة', 'Cold', 1, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(8, 1, 'Side for Dishes', 'الاطباق الجانبية', 'Side for Dishes', 0, '2020-09-13 16:10:41', '2020-09-13 16:10:41'),
(9, 1, 'Extra for Dishes', 'الاطباق الايضافية', 'Extra for Dishes', 0, '2020-09-13 16:10:41', '2020-09-13 16:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `dish_sizes`
--

CREATE TABLE `dish_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dish_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_sizes`
--

INSERT INTO `dish_sizes` (`id`, `dish_id`, `name`, `name_ar`, `price`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Alfredoo ', 'الفريدو', 1, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(3, 2, 'Bashamel', 'باشامل', 2, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(4, 3, 'Fotchini', 'فوتشيني', 3, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(5, 4, 'Negresco Pasta', 'نجرسكو', 4, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(6, 5, 'Pasta white-sauch', 'مكرونة بالصوص الابيض', 5, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(7, 6, 'Pasta shrimps', 'مكرونة بالجمبري', 6, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(8, 7, 'Spaghetti-with-bolognese-sauce', 'سباجتي بالبولونيز', 7, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(9, 8, 'Tagen Penna ', 'تاجن مكرونة', 8, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(10, 9, 'Hot Dog', 'بيتزا الهوت دوج', 9, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(11, 10, 'Margrita', 'بيتزا مارجريتا', 10, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(12, 11, 'Mashrom', 'بيتزا الماشروم ', 11, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(13, 12, 'Pastarma', 'بيتزا بسطرمه', 12, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(14, 13, 'Peproni', 'بيتزا الببروني', 13, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(15, 14, 'White Chicken Pizza', 'بيتزا دجاج صوص ابيض', 14, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(16, 15, 'baked-chicken-wings', 'اجنحة دجاج مقلية', 15, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(17, 16, 'Sambosk', 'سمبوسك', 16, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(18, 17, 'Cheader Sous', 'صوص التشيدر', 17, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(19, 18, 'chicken caesar-salad', 'سلطة دجاج سيزر', 18, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(20, 19, 'Chopped-Green -Salad', 'سلطة خضراء', 19, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(21, 20, 'fryer-onion-rings', 'حلقات البصل الذهبية', 20, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(22, 21, 'Greek Salad', 'سلطة يوناني', 21, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(23, 22, 'lettuce-avocado-and-mango-salad', 'افوكادو ومانجو ', 22, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(24, 23, 'pesto-pasta-salad', 'لسطة بيستو باستا', 23, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(25, 24, 'Thenaa salad ', 'طحينة', 24, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(26, 25, 'checken  Burger', 'برجر فراخ', 25, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(27, 26, 'double chese Burger', 'برجر لحم طبقتين', 26, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(28, 27, 'Single chese Burger', 'برجر لحم طبقة', 27, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(29, 28, 'hasawshy', 'حواوشي لحم ', 28, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(30, 29, 'Mashroom chese Burger', 'برجر ماشروم', 29, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(31, 30, 'Liver', 'كبدة', 30, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(32, 31, 'shawerma checken', 'شاورما دجاج', 31, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(33, 32, 'shawerma meat', 'شاورما لحم ', 32, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(34, 33, 'borio', 'بوريو', 33, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(35, 34, 'Ice-Cream', 'ايس كريم', 34, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(36, 35, 'lemon-juice', 'عصير لمون فريش', 35, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(37, 36, 'mango-juice', 'عصير مانجو فريش', 36, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(38, 37, 'pepsi', 'بيبسي', 37, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(39, 38, 'pineapple-juice', 'عصير اناناس', 38, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(40, 39, 'Strawberry-Juice', 'عصير فرولة', 39, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(41, 40, 'Water', 'مياه', 40, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(42, 41, 'Cabitshino', 'كابتشينو', 41, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(43, 42, 'Coffee', 'قهوة', 42, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(44, 43, 'Helba', 'حلبة', 43, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(45, 44, 'Hot choclet', 'شيكولا ساخنة', 44, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(46, 45, 'Mint', 'النعناع', 45, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(47, 46, 'Tea', 'شاي', 46, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(48, 47, 'Anise', 'ينسون', 47, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(49, 48, 'pepsi', '[يبسي', 48, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(50, 49, 'PASTA', 'مكرونة ', 49, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(51, 50, 'pom fries', 'بطاطس محمره', 50, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(52, 51, 'ris', 'أرز', 51, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(53, 52, 'water', 'مياه600 مم', 52, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(54, 53, 'Cheader Sous', 'صوص التشيدر', 53, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(55, 54, 'pom fries', 'بطاطس محمره', 54, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(56, 55, 'Langoustines with Tomato and Lemon', 'كابوريا بالطماطم واليمون', 55, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(57, 56, 'One-Pan BBQ Baby Back Ribs', 'اضلع مقطعه ', 56, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(58, 57, 'Pan-Seared Salmon with Kale and Apple Salad', 'شريحةسالامون وسلطة التفاح', 57, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(59, 58, 'Roast Chicken', 'دجاج روستد ', 58, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(60, 59, 'Roasted Beef Tenderloin', 'لحم  بروستد', 59, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27'),
(61, 60, 'Roasted Duck Legs in a Red Wine Sauce', 'اوراك البط روستد', 60, 1, '2020-09-19 17:25:27', '2020-09-19 17:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `dish_size_extras`
--

CREATE TABLE `dish_size_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dish_size_id` bigint(20) UNSIGNED NOT NULL,
  `extra_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dish_size_recipes`
--

CREATE TABLE `dish_size_recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dish_size_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_quantity` double NOT NULL,
  `child_unit_quantity` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_size_recipes`
--

INSERT INTO `dish_size_recipes` (`id`, `dish_size_id`, `product_id`, `unit_quantity`, `child_unit_quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 16, 0.2, 200, '2020-09-21 09:50:41', '2020-09-21 09:50:41'),
(2, 2, 7, 0.1, 100, '2020-09-21 09:50:55', '2020-09-21 09:50:55'),
(3, 3, 7, 0.2, 200, '2020-09-21 09:51:19', '2020-09-21 09:51:19'),
(4, 3, 16, 0.1, 100, '2020-09-21 09:51:43', '2020-09-21 09:51:43'),
(5, 4, 7, 0.2, 200, '2020-09-21 09:58:51', '2020-09-21 09:58:51'),
(6, 4, 16, 0.1, 100, '2020-09-21 09:58:59', '2020-09-21 09:58:59'),
(7, 5, 7, 0.2, 200, '2020-09-21 10:01:49', '2020-09-21 10:01:49'),
(8, 5, 16, 0.2, 200, '2020-09-21 10:01:57', '2020-09-21 10:01:57'),
(9, 6, 7, 0.2, 200, '2020-09-21 10:02:28', '2020-09-21 10:02:28'),
(10, 6, 16, 0.2, 200, '2020-09-21 10:02:39', '2020-09-21 10:02:39'),
(11, 7, 7, 0.2, 200, '2020-09-21 10:03:08', '2020-09-21 10:03:08'),
(12, 7, 16, 0.2, 200, '2020-09-21 10:03:16', '2020-09-21 10:03:16'),
(13, 8, 7, 0.2, 200, '2020-09-21 10:03:37', '2020-09-21 10:03:37'),
(14, 8, 16, 0.2, 200, '2020-09-21 10:03:46', '2020-09-21 10:03:46'),
(15, 9, 7, 0.2, 200, '2020-09-21 10:04:14', '2020-09-21 10:04:14'),
(16, 9, 16, 0.2, 200, '2020-09-21 10:04:22', '2020-09-21 10:04:22'),
(17, 10, 9, 0.2, 200, '2020-09-21 10:04:43', '2020-09-21 10:04:43'),
(18, 10, 18, 0.2, 200, '2020-09-21 10:04:52', '2020-09-21 10:04:52'),
(19, 11, 9, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(20, 11, 18, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(21, 12, 9, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(22, 12, 18, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(23, 13, 9, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(24, 13, 18, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(25, 14, 9, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(26, 14, 18, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(27, 15, 9, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(28, 15, 18, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(29, 16, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(30, 16, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(31, 17, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(32, 17, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(33, 18, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(34, 18, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(35, 19, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(36, 19, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(37, 20, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(38, 20, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(39, 21, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(40, 21, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(41, 22, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(42, 22, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(43, 23, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(44, 24, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(45, 25, 8, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(46, 25, 17, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(47, 26, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(48, 26, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(49, 27, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(50, 27, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(51, 28, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(52, 28, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(53, 29, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(54, 29, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(55, 30, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(56, 30, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(57, 31, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(58, 31, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(59, 32, 2, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(60, 32, 11, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(63, 34, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(64, 34, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(65, 35, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(66, 35, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(67, 36, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(68, 36, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(69, 37, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(70, 37, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(71, 38, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(72, 38, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(73, 39, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(74, 39, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(75, 40, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(76, 40, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(77, 41, 3, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(78, 41, 12, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(79, 41, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(80, 41, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(81, 42, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(82, 42, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(83, 43, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(84, 43, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(85, 44, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(86, 44, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(87, 45, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(88, 45, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(89, 46, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(90, 46, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(91, 47, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(92, 47, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(93, 48, 4, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(94, 48, 13, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(97, 50, 5, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(98, 50, 14, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(99, 51, 5, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(100, 51, 14, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(101, 52, 5, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(102, 52, 14, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(105, 54, 6, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(106, 54, 15, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(107, 55, 6, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(108, 55, 15, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(109, 56, 1, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(110, 56, 10, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(111, 57, 1, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(112, 57, 10, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(113, 58, 1, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(114, 58, 10, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(115, 59, 1, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(116, 59, 10, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(117, 60, 1, 0.2, 200, '2020-09-21 08:04:43', '2020-09-21 08:04:43'),
(118, 60, 10, 0.2, 200, '2020-09-21 08:04:52', '2020-09-21 08:04:52'),
(119, 33, 2, 16.666666666666668, 200, '2020-09-21 13:14:15', '2020-09-21 13:14:15'),
(120, 33, 11, 16.666666666666668, 200, '2020-09-21 13:14:29', '2020-09-21 13:14:29'),
(121, 49, 3, 0.2, 200, '2020-09-21 13:15:31', '2020-09-21 13:15:31'),
(122, 49, 12, 0.2, 200, '2020-09-21 13:20:47', '2020-09-21 13:20:47'),
(123, 53, 3, 0.2, 200, '2020-09-21 13:21:49', '2020-09-21 13:21:49'),
(124, 53, 12, 0.2, 200, '2020-09-21 13:22:13', '2020-09-21 13:22:13'),
(125, 61, 1, 16.666666666666668, 200, '2020-09-21 13:33:38', '2020-09-21 13:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `dish_size_sides`
--

CREATE TABLE `dish_size_sides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dish_size_id` bigint(20) UNSIGNED NOT NULL,
  `side_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_shift`
--

CREATE TABLE `employee_shift` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `hr_shift_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_shift`
--

INSERT INTO `employee_shift` (`id`, `hr_employee_id`, `hr_shift_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `payment_amount` double NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

CREATE TABLE `halls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`id`, `store_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, ' صالة واحد', 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(2, 1, 'صالة اتنين', 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(3, 1, 'خارجي', 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(4, 1, 'صالة 4', 0, '2020-08-24 07:53:31', '2020-08-24 07:53:38'),
(5, 3, 'صالة 1', 1, '2020-08-26 13:38:07', '2020-08-26 13:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `hr_approval_requests`
--

CREATE TABLE `hr_approval_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hr_approval_type_id` bigint(20) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('accepted','rejected','pending','modified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approvable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approvable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_approval_types`
--

CREATE TABLE `hr_approval_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` enum('override','aggregate','chain') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'override',
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_approval_types`
--

INSERT INTO `hr_approval_types` (`id`, `store_id`, `name`, `style`, `model`, `created_at`, `updated_at`) VALUES
(1, 1, 'موافقة المستوي الاعلي', 'override', 'App\\HrLeave', '2021-01-04 01:27:01', '2021-01-04 01:27:01'),
(2, 1, 'اعتماد المرتبات', 'aggregate', 'App\\HrPayslip', '2021-01-04 01:33:06', '2021-01-04 01:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `hr_approvers`
--

CREATE TABLE `hr_approvers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL,
  `hr_approval_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_approvers`
--

INSERT INTO `hr_approvers` (`id`, `store_id`, `hr_employee_id`, `level`, `hr_approval_type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '2021-01-04 01:27:16', '2021-01-04 01:27:16'),
(2, 1, 1, 1, 2, '2021-01-04 01:33:19', '2021-01-04 01:33:19'),
(3, 1, 2, 2, 2, '2021-01-04 01:33:30', '2021-01-04 01:33:30');

-- --------------------------------------------------------

--
-- Table structure for table `hr_approves`
--

CREATE TABLE `hr_approves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hr_approver_id` bigint(20) UNSIGNED NOT NULL,
  `hr_approval_request_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('accepted','rejected','modified') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_asset_employee`
--

CREATE TABLE `hr_asset_employee` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `asset_id` bigint(20) UNSIGNED NOT NULL,
  `date_of_assignment` date DEFAULT NULL,
  `date_of_release` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_asset_employee`
--

INSERT INTO `hr_asset_employee` (`id`, `hr_employee_id`, `asset_id`, `date_of_assignment`, `date_of_release`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-01-01', '2021-01-30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hr_attendances`
--

CREATE TABLE `hr_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `hr_shift_hour_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `check_in` time NOT NULL,
  `check_out` time DEFAULT NULL,
  `overtime` time DEFAULT NULL,
  `late` time DEFAULT NULL,
  `early` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_attendances`
--

INSERT INTO `hr_attendances` (`id`, `store_id`, `file_id`, `hr_employee_id`, `hr_shift_hour_id`, `attendance_date`, `check_in`, `check_out`, `overtime`, `late`, `early`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, '2021-01-02', '09:00:00', '18:00:00', '01:00:00', '00:00:00', '00:00:00', '2021-01-03 04:42:36', '2021-01-04 00:54:45'),
(2, 1, NULL, 1, 1, '2021-01-03', '09:15:00', '17:00:00', '00:00:00', '00:00:00', '02:00:00', '2021-01-04 00:51:15', '2021-01-04 00:53:59'),
(3, 1, NULL, 1, 1, '2021-01-04', '09:00:00', '17:00:00', '00:00:00', '00:00:00', '00:00:00', '2021-01-04 00:51:22', '2021-01-04 00:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `hr_attendance_files`
--

CREATE TABLE `hr_attendance_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_earning_deductions`
--

CREATE TABLE `hr_earning_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('earning','deduction') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'earning',
  `insurance` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_earning_deductions`
--

INSERT INTO `hr_earning_deductions` (`id`, `store_id`, `name`, `type`, `insurance`, `created_at`, `updated_at`) VALUES
(1, 1, 'Direct Cremation', 'earning', 0, '2021-01-03 04:48:13', '2021-01-03 04:48:13'),
(2, 1, 'mostafa tantawy', 'deduction', 1, '2021-01-03 04:48:22', '2021-01-03 04:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `hr_emergency_contacts`
--

CREATE TABLE `hr_emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employees`
--

CREATE TABLE `hr_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civil_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `salary` double DEFAULT 0,
  `bank_account` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `last_balance_update` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_employees`
--

INSERT INTO `hr_employees` (`id`, `user_id`, `department_id`, `store_id`, `photo`, `name`, `gender`, `civil_status`, `date_of_birth`, `date_of_joining`, `salary`, `bank_account`, `bank_name`, `balance`, `last_balance_update`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, NULL, 'Super Admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-08-15 14:57:55', '2020-08-15 14:57:55'),
(2, 3, 1, 1, NULL, 'مصطفي كاشير', 'male', NULL, '1992-06-09', '2020-08-24', 1000, '----', 'الاهلي', NULL, NULL, NULL, '2020-08-24 07:47:34', '2020-08-24 07:47:34'),
(3, 4, NULL, 2, NULL, 'مطعمي الخاص (Super Admin)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(4, 5, NULL, 3, NULL, 'tatata (Super Admin)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-08-25 20:48:23', '2020-08-25 20:48:23'),
(5, 7, NULL, 4, NULL, 'Rest (Super Admin)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-09-05 14:22:27', '2020-09-05 14:22:27'),
(6, 20, NULL, 15, NULL, 'rrrr (Super Admin)', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-09-06 10:56:10', '2020-09-06 10:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `hr_emp_payroll_types`
--

CREATE TABLE `hr_emp_payroll_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hr_payroll_type_id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_e_d_details`
--

CREATE TABLE `hr_e_d_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hr_payslip_id` bigint(20) UNSIGNED NOT NULL,
  `hr_earning_deduction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT 0,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_holidays`
--

CREATE TABLE `hr_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_leaves`
--

CREATE TABLE `hr_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `hr_leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_leave_types`
--

CREATE TABLE `hr_leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('sick','earning','deduction','neutral') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payrolls`
--

CREATE TABLE `hr_payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `hr_payroll_type_id` bigint(20) UNSIGNED NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_types`
--

CREATE TABLE `hr_payroll_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payslips`
--

CREATE TABLE `hr_payslips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `hr_payroll_id` bigint(20) UNSIGNED NOT NULL,
  `hr_employee_id` bigint(20) UNSIGNED NOT NULL,
  `basic_salary` decimal(8,2) DEFAULT 0.00,
  `total_earning` decimal(8,2) DEFAULT 0.00,
  `total_deduction` decimal(8,2) DEFAULT 0.00,
  `net_salary` decimal(8,2) DEFAULT 0.00,
  `leave` int(11) DEFAULT 0,
  `holiday` int(11) DEFAULT 0,
  `insurance` double DEFAULT 0,
  `taxes` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_shifts`
--

CREATE TABLE `hr_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','flexible') COLLATE utf8mb4_unicode_ci NOT NULL,
  `threshold` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_shifts`
--

INSERT INTO `hr_shifts` (`id`, `store_id`, `name`, `type`, `threshold`, `created_at`, `updated_at`) VALUES
(1, 1, 'شفت صباحي', 'fixed', 15, '2021-01-03 04:28:34', '2021-01-03 04:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `hr_shift_hours`
--

CREATE TABLE `hr_shift_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `hr_shift_id` bigint(20) UNSIGNED NOT NULL,
  `start_day` enum('sat','sun','mon','tues','wend','thurs','fri') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_day` enum('sat','sun','mon','tues','wend','thurs','fri') COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_shift_hours`
--

INSERT INTO `hr_shift_hours` (`id`, `store_id`, `hr_shift_id`, `start_day`, `start_time`, `end_day`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'sat', '09:00:00', 'thurs', '17:00:00', '2021-01-03 04:29:48', '2021-01-03 04:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `hr_taxes`
--

CREATE TABLE `hr_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `start` double DEFAULT NULL,
  `end` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_counts`
--

CREATE TABLE `inventory_counts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `inventoryable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventoryable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_count_details`
--

CREATE TABLE `inventory_count_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventory_count_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `vat` double DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `packages_number` int(11) DEFAULT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `store_id`, `price`, `packages_number`, `period`, `start`, `end`, `created_at`, `updated_at`) VALUES
(3, 15, 700, 2, 'month3', '2020-09-06', '2020-12-06', '2020-09-06 10:56:09', '2020-09-06 10:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(330, '2014_10_12_000000_create_users_table', 3),
(331, '2014_10_12_100000_create_password_resets_table', 3),
(332, '2017_08_16_151020_create_products_table', 3),
(333, '2017_08_17_130127_create_units_table', 3),
(334, '2017_08_25_185544_create_purses_table', 3),
(335, '2017_08_25_193023_create_suppliers_table', 3),
(336, '2017_08_27_200002_create_purses_products_table', 3),
(337, '2019_09_20_144518_create_product_returned_table', 3),
(338, '2019_09_20_144848_create_product_ruined_table', 3),
(339, '2019_09_20_202300_create_returants_table', 3),
(340, '2019_09_21_100609_create_table_phones', 3),
(341, '2019_09_21_100634_create_table_addresses', 3),
(342, '2019_09_21_124014_create_table_uploadfiles', 3),
(343, '2019_09_27_221818_create_payments_table', 3),
(344, '2019_09_27_231908_create_countries_table', 3),
(345, '2019_09_27_233409_create_states_table', 3),
(346, '2019_09_28_000240_create_permission_tables', 3),
(347, '2019_10_03_193309_create_assign_stocks_table', 3),
(348, '2019_10_03_193537_create_assign_stock_details_table', 3),
(349, '2019_10_05_212848_create_departments_table', 3),
(350, '2019_10_07_170942_create_ruined_headers_table', 3),
(351, '2019_10_11_094020_create_expenses_table', 3),
(352, '2019_10_14_193206_create_dishes_table', 3),
(353, '2019_10_14_193437_create_dish_size_recipes_table', 3),
(354, '2019_10_14_193500_create_dish_sizes_table', 3),
(355, '2019_10_14_193631_create_dish_size_sides_table', 3),
(356, '2019_10_14_193815_create_dish_size_extras_table', 3),
(357, '2019_10_14_194400_create_dish_categories_table', 3),
(358, '2019_10_16_211550_create_product_categories_table', 3),
(359, '2019_10_16_212133_product_supplier_create_table', 3),
(360, '2019_10_20_173938_create_orders_table', 3),
(361, '2019_10_20_174000_create_order_details_table', 3),
(362, '2019_10_20_174126_create_ruined_dishes_table', 3),
(363, '2019_10_20_174226_create_ruined_dish_details_table', 3),
(364, '2019_10_20_185800_create_cooked_products_table', 3),
(365, '2019_10_22_155600_create_pending_recipes_table', 3),
(366, '2019_10_23_175012_create_system_confs_table', 3),
(367, '2019_11_11_004016_create_attendance_files_table', 3),
(368, '2019_11_11_004028_create_attendances_table', 3),
(369, '2019_11_11_004040_create_holidays_table', 3),
(370, '2019_11_11_004927_create_assets_table', 3),
(371, '2019_11_11_005109_create_asset_employee_table', 3),
(372, '2019_11_11_005920_create_payslips_table', 3),
(373, '2019_11_11_0102251_create_employees_table', 3),
(374, '2019_11_11_011806_create_approval_types_table', 3),
(375, '2019_11_11_011814_create_approval_requests_table', 3),
(376, '2019_11_11_011826_create_approvers_table', 3),
(377, '2019_11_11_011827_create_approves_table', 3),
(378, '2019_11_11_214826_create_emergency_contacts_table', 3),
(379, '2019_11_11_215220_create_shifts_table', 3),
(380, '2019_11_11_215226_create_shift_hours_table', 3),
(381, '2019_11_11_232030_create_payroll_types_table', 3),
(382, '2019_11_11_232248_create_payrolls_table', 3),
(383, '2019_11_11_232304_create_emp_payroll_types_table', 3),
(384, '2019_11_11_233202_create_leave_types_table', 3),
(385, '2019_11_11_233210_create_leaves_table', 3),
(386, '2019_11_12_025058_create_hr_taxes_table', 3),
(387, '2019_11_25_163416_create_pivot_table', 3),
(388, '2019_11_30_125822_create_hr_earning_deductions_table', 3),
(389, '2019_11_30_130442_create_hr_e_d_details_table', 3),
(390, '2019_12_11_233021_create_tables_table', 3),
(391, '2019_12_11_233135_create_halls_table', 3),
(392, '2019_12_13_054432_create_order_payments_table', 3),
(393, '2019_12_15_094817_create_clients_table', 3),
(394, '2019_12_15_094855_create_client_accounts_table', 3),
(395, '2019_12_17_080217_create_coupons_table', 3),
(396, '2019_12_20_134822_create_order_table_table', 3),
(397, '2019_12_23_102755_create_money_transfers_table', 3),
(398, '2020_03_03_151718_create_opening_stocks_table', 3),
(399, '2020_03_03_151806_create_inventory_counts_table', 3),
(400, '2020_03_03_153035_create_stocks_table', 3),
(401, '2020_03_03_160807_create_opening_stock_details_table', 3),
(402, '2020_03_03_160824_create_inventory_count_details_table', 3),
(403, '2020_04_24_105538_create_centers_table', 3),
(404, '2020_04_25_160317_create_product_recipes_table', 3),
(405, '2020_04_26_004224_create_prepare_headers_table', 3),
(406, '2020_06_29_205312_create_reservations_table', 3),
(407, '2020_07_11_004254_create_safes_table', 3),
(408, '2020_07_17_213715_create_safe_logs_table', 3),
(409, '2020_07_17_214342_create_order_logs_table', 3),
(244, '2020_07_25_192408_alter_report_cols_table_attendence', 1),
(245, '2020_08_03_192408_alter_department_id_col_table_order_details', 2),
(410, '2020_07_17_221516_create_safe_payments_table', 3),
(411, '2020_08_27_152134_create_packages_table', 3),
(412, '2020_08_27_152813_create_package_restaurant_table', 3),
(413, '2020_09_05_175202_create_invoices_table', 3),
(82, '2014_10_12_000000_create_users_table', 1),
(83, '2014_10_12_100000_create_password_resets_table', 1),
(84, '2017_08_16_151020_create_products_table', 1),
(85, '2017_08_17_130127_create_units_table', 1),
(87, '2017_08_25_193023_create_suppliers_table', 1),
(88, '2017_08_27_200002_create_purses_products_table', 1),
(89, '2019_09_20_144518_create_product_returned_table', 1),
(90, '2019_09_20_144848_create_product_ruined_table', 1),
(91, '2019_09_20_202300_create_returants_table', 1),
(92, '2019_09_21_100609_create_table_phones', 1),
(93, '2019_09_21_100634_create_table_addresses', 1),
(94, '2019_09_21_124014_create_table_uploadfiles', 1),
(95, '2019_09_27_221818_create_payments_table', 1),
(96, '2019_09_27_231908_create_countries_table', 1),
(97, '2019_09_27_233409_create_states_table', 1),
(98, '2019_09_28_000240_create_permission_tables', 1),
(99, '2019_10_03_193309_create_assign_stocks_table', 1),
(100, '2019_10_03_193537_create_assign_stock_details_table', 1),
(101, '2019_10_05_212848_create_departments_table', 1),
(102, '2019_10_07_170942_create_ruined_headers_table', 1),
(103, '2019_10_11_094020_create_expenses_table', 1),
(104, '2019_10_14_193206_create_dishes_table', 1),
(105, '2019_10_14_193437_create_dish_size_recipes_table', 1),
(106, '2019_10_14_193500_create_dish_sizes_table', 1),
(107, '2019_10_14_193631_create_dish_size_sides_table', 1),
(108, '2019_10_14_193815_create_dish_size_extras_table', 1),
(109, '2019_10_14_194400_create_dish_categories_table', 1),
(110, '2019_10_16_211550_create_product_categories_table', 1),
(111, '2019_10_16_212133_product_supplier_create_table', 1),
(112, '2019_10_20_173938_create_orders_table', 1),
(113, '2019_10_20_174000_create_order_details_table', 1),
(114, '2019_10_20_174126_create_ruined_dishes_table', 1),
(115, '2019_10_20_174226_create_ruined_dish_details_table', 1),
(116, '2019_10_20_185800_create_cooked_products_table', 1),
(117, '2019_10_22_155600_create_pending_recipes_table', 1),
(118, '2019_10_23_175012_create_system_confs_table', 1),
(119, '2019_11_11_004016_create_attendance_files_table', 1),
(120, '2019_11_11_004028_create_attendances_table', 1),
(121, '2019_11_11_004040_create_holidays_table', 1),
(122, '2019_11_11_004927_create_assets_table', 1),
(123, '2019_11_11_005109_create_asset_employee_table', 1),
(124, '2019_11_11_005920_create_payslips_table', 1),
(125, '2019_11_11_0102251_create_employees_table', 1),
(126, '2019_11_11_011806_create_approval_types_table', 1),
(127, '2019_11_11_011814_create_approval_requests_table', 1),
(128, '2019_11_11_011826_create_approvers_table', 1),
(129, '2019_11_11_011827_create_approves_table', 1),
(130, '2019_11_11_214826_create_emergency_contacts_table', 1),
(131, '2019_11_11_215220_create_shifts_table', 1),
(132, '2019_11_11_215226_create_shift_hours_table', 1),
(133, '2019_11_11_232030_create_payroll_types_table', 1),
(134, '2019_11_11_232248_create_payrolls_table', 1),
(135, '2019_11_11_232304_create_emp_payroll_types_table', 1),
(136, '2019_11_11_233202_create_leave_types_table', 1),
(137, '2019_11_11_233210_create_leaves_table', 1),
(138, '2019_11_12_025058_create_hr_taxes_table', 1),
(139, '2019_11_25_163416_create_pivot_table', 1),
(140, '2019_11_30_125822_create_hr_earning_deductions_table', 1),
(141, '2019_11_30_130442_create_hr_e_d_details_table', 1),
(142, '2019_12_11_233021_create_tables_table', 1),
(143, '2019_12_11_233135_create_halls_table', 1),
(144, '2019_12_13_054432_create_order_payments_table', 1),
(145, '2019_12_15_094817_create_clients_table', 1),
(146, '2019_12_15_094855_create_client_accounts_table', 1),
(147, '2019_12_17_080217_create_coupons_table', 1),
(148, '2019_12_20_134822_create_order_table_table', 1),
(149, '2019_12_23_102755_create_money_transfers_table', 1),
(150, '2020_03_03_151718_create_opening_stocks_table', 1),
(151, '2020_03_03_151806_create_inventory_counts_table', 1),
(152, '2020_03_03_153035_create_stocks_table', 1),
(153, '2020_03_03_160807_create_opening_stock_details_table', 1),
(154, '2020_03_03_160824_create_inventory_count_details_table', 1),
(155, '2020_04_24_105538_create_centers_table', 1),
(156, '2020_04_25_160317_create_product_recipes_table', 1),
(157, '2020_04_26_004224_create_prepare_headers_table', 1),
(158, '2020_06_29_205312_create_reservations_table', 1),
(159, '2020_07_11_004254_create_safes_table', 1),
(160, '2020_07_17_213715_create_safe_logs_table', 1),
(161, '2020_07_17_214342_create_order_logs_table', 1),
(162, '2020_07_17_221516_create_safe_payments_table', 1),
(163, '2020_08_27_152134_create_packages_table', 2),
(164, '2020_08_27_152813_create_package_restaurant_table', 2),
(165, '2020_09_05_175202_create_invoices_table', 2),
(166, '2017_08_25_185544_create_purses_table', 3),
(414, '2019_12_14_000001_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 4),
(6, 'App\\User', 20);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opening_stocks`
--

CREATE TABLE `opening_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opening_stock_details`
--

CREATE TABLE `opening_stock_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_stock_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `vat` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` smallint(5) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` double DEFAULT 0,
  `service` double DEFAULT 0,
  `vat` double DEFAULT 0,
  `delivery` double DEFAULT 0,
  `is_staff` tinyint(1) DEFAULT 0,
  `coupon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `type` enum('restaurant','delivery','takeaway') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','cooking','completed','closed','reopen') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `is_reopen` tinyint(1) DEFAULT 0,
  `reopen_employee_id` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `store_id`, `employee_id`, `client_id`, `discount`, `service`, `vat`, `delivery`, `is_staff`, `coupon`, `type`, `status`, `is_reopen`, `reopen_employee_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 0, 0, 0.14, 0, 0, '0', 'takeaway', 'pending', 0, 0, NULL, '2020-09-23 01:32:14', '2020-09-23 01:32:14'),
(2, 1, 1, NULL, 0, 0.12, 0.14, 0, 0, '0', 'restaurant', 'pending', 0, 0, NULL, '2020-09-23 01:41:05', '2020-09-23 01:41:05'),
(3, 1, 1, NULL, 0, 0, 0.14, 10, 0, '0', 'delivery', 'closed', 0, 0, NULL, '2020-10-04 02:13:16', '2020-10-04 02:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `dish_id` bigint(20) UNSIGNED NOT NULL,
  `dish_category_id` bigint(20) UNSIGNED NOT NULL,
  `dish_size_id` bigint(20) UNSIGNED NOT NULL,
  `unit_cost` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `store_id`, `order_id`, `dish_id`, `dish_category_id`, `dish_size_id`, `unit_cost`, `unit_price`, `quantity`, `parent_id`, `type`, `note`, `status`, `department_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 29, 2, 30, 32, 29, 1, NULL, NULL, '', 'pending', 1, NULL, '2020-09-23 01:32:14', '2020-09-23 01:32:14'),
(2, 1, 2, 31, 2, 32, 32, 31, 2, NULL, NULL, '', 'pending', 1, NULL, '2020-09-23 01:41:05', '2020-10-17 18:10:33'),
(3, 1, 2, 28, 2, 29, 32, 28, 1, NULL, NULL, '', 'pending', 1, NULL, '2020-09-23 01:41:05', '2020-09-23 01:41:05'),
(4, 1, 3, 56, 1, 57, 22, 56, 2, NULL, NULL, 'kdjg;oud tfhtfhfthf hf ', 'pending', 1, NULL, '2020-10-04 02:13:16', '2020-10-04 02:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_logs`
--

CREATE TABLE `order_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_logs`
--

INSERT INTO `order_logs` (`id`, `store_id`, `order_id`, `employee_id`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'new order', '2020-09-23 01:32:14', '2020-09-23 01:32:14'),
(2, 1, 2, 1, 'new order', '2020-09-23 01:41:05', '2020-09-23 01:41:05'),
(3, 1, 3, 1, 'new order', '2020-10-04 02:13:16', '2020-10-04 02:13:16'),
(4, 1, 3, 1, 'close order', '2020-10-04 02:14:17', '2020-10-04 02:14:17'),
(5, 1, 2, 1, 'edit order', '2020-10-17 18:10:33', '2020-10-17 18:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `remaining` double DEFAULT 0,
  `paid` double DEFAULT 0,
  `method` enum('account','check','cash','creditcard') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_payments`
--

INSERT INTO `order_payments` (`id`, `store_id`, `order_id`, `client_id`, `amount`, `remaining`, `paid`, `method`, `note`, `due_date`, `employee_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, 137.68, 12.32, 150, 'cash', NULL, NULL, 1, NULL, '2020-10-04 02:14:07', '2020-10-04 02:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`id`, `order_id`, `table_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'inventory', 200.00, '2020-09-05 17:20:45', '2020-09-05 17:20:45'),
(2, 'purchase', 0.00, '2020-09-05 17:20:45', '2020-09-05 17:20:45'),
(3, 'cost', 0.00, '2020-09-05 17:20:45', '2020-09-05 17:20:45'),
(4, 'sales', 200.00, '2020-09-05 17:20:45', '2020-09-05 17:20:45'),
(5, 'crm', 0.00, '2020-09-05 17:20:45', '2020-09-05 17:20:45'),
(6, 'human resource', 200.00, '2020-09-05 17:20:45', '2020-09-05 17:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `package_restaurant`
--

CREATE TABLE `package_restaurant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_restaurant`
--

INSERT INTO `package_restaurant` (`id`, `package_id`, `store_id`, `invoice_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 3, '2020-09-06 10:56:09', '2020-09-06 10:56:09'),
(3, 2, 1, 3, '2020-09-06 10:56:09', '2020-09-06 10:56:09'),
(4, 6, 1, 3, '2020-09-06 10:56:09', '2020-09-06 10:56:09'),
(5, 4, 1, 3, '2020-09-06 10:56:09', '2020-09-06 10:56:09'),
(6, 5, 1, 3, '2020-09-06 10:56:09', '2020-09-06 10:56:09'),
(7, 3, 1, 3, '2020-09-06 10:56:09', '2020-09-06 10:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `payment_amount` double NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `store_id`, `payment_amount`, `payment_method`, `sender_id`, `receiver_id`, `note`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, 'cash', 1, 1, NULL, NULL, '2020-10-19 23:15:44', '2020-10-19 23:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `pending_recipes`
--

CREATE TABLE `pending_recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `dish_size_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `group`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'unit', 'create unit', 'web', '2020-08-15 14:57:37', '2020-08-15 14:57:37'),
(2, 'unit', 'update unit', 'web', '2020-08-15 14:57:37', '2020-08-15 14:57:37'),
(3, 'unit', 'delete unit', 'web', '2020-08-15 14:57:37', '2020-08-15 14:57:37'),
(4, 'product category', 'index product category', 'web', '2020-08-15 14:57:37', '2020-08-15 14:57:37'),
(5, 'product category', 'create product category', 'web', '2020-08-15 14:57:37', '2020-08-15 14:57:37'),
(6, 'product category', 'update product category', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(7, 'product category', 'delete product category', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(8, 'product', 'index product', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(9, 'product', 'create product', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(10, 'product', 'show product', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(11, 'product', 'update product', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(12, 'product', 'delete product', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(13, 'supplier', 'index supplier', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(14, 'supplier', 'create supplier', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(15, 'supplier', 'update supplier', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(16, 'supplier', 'show supplier', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(17, 'supplier', 'delete supplier', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(18, 'supplier', 'attach product to supplier', 'web', '2020-08-15 14:57:38', '2020-08-15 14:57:38'),
(19, 'supplier', 'detach product to supplier', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(20, 'stock payment', 'create stock payment', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(21, 'stock payment', 'delete stock payment', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(22, 'purchase', 'create purchase', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(23, 'purchase', 'update purchase', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(24, 'purchase', 'summery purchase', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(25, 'purchase', 'details purchase', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(26, 'refund', 'index refund', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(27, 'refund', 'create refund', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(28, 'refund', 'delete refund', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(29, 'department', 'index department', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(30, 'department', 'create department', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(31, 'department', 'show department', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(32, 'department', 'update department', 'web', '2020-08-15 14:57:39', '2020-08-15 14:57:39'),
(33, 'department', 'stock department', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(34, 'department', 'delete department', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(35, 'assign stock', 'index assign stock', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(36, 'assign stock', 'create assign stock', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(37, 'ruined product', 'index ruined product', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(38, 'ruined product', 'create ruined product', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(39, 'ruined product', 'delete ruined product', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(40, 'dish category', 'index dish category', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(41, 'dish category', 'create dish category', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(42, 'dish category', 'update dish category', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(43, 'dish', 'index dish', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(44, 'dish', 'create dish', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(45, 'dish', 'update dish', 'web', '2020-08-15 14:57:40', '2020-08-15 14:57:40'),
(46, 'dish size', 'index dish size', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(47, 'dish size', 'create dish size', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(48, 'dish size', 'update dish size', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(49, 'extra dish', 'index extra dish', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(50, 'extra dish', 'create extra dish', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(51, 'extra dish', 'delete extra dish', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(52, 'dish recipe', 'index dish recipe', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(53, 'dish recipe', 'create dish recipe', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(54, 'dish recipe', 'delete dish recipe', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(55, 'side dish', 'index side dish', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(56, 'side dish', 'create side dish', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(57, 'side dish', 'delete side dish', 'web', '2020-08-15 14:57:41', '2020-08-15 14:57:41'),
(58, 'ruined dish', 'index ruined dish', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(59, 'ruined dish', 'create ruined dish', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(60, 'ruined dish', 'delete ruined dish', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(61, 'configuration', 'system configuration', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(62, 'table', 'index table', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(63, 'table', 'create table', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(64, 'table', 'update table', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(65, 'hall', 'index hall', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(66, 'hall', 'create hall', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(67, 'hall', 'update hall', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(68, 'safe', 'index safe', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(69, 'safe', 'create safe', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(70, 'safe', 'update safe', 'web', '2020-08-15 14:57:42', '2020-08-15 14:57:42'),
(71, 'coupon', 'index coupon', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(72, 'coupon', 'create coupon', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(73, 'coupon', 'update coupon', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(74, 'coupon', 'delete coupon', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(75, 'employee', 'index employee', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(76, 'employee', 'create employee', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(77, 'employee', 'show employee', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(78, 'employee', 'update employee', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(79, 'employee', 'associate role employee', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(80, 'employee', 'dissociate role employee', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(81, 'employee', 'create employee emergency', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(82, 'employee', 'update employee emergency', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(83, 'employee', 'delete employee emergency', 'web', '2020-08-15 14:57:43', '2020-08-15 14:57:43'),
(84, 'asset', 'index asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(85, 'asset', 'create asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(86, 'asset', 'show asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(87, 'asset', 'update asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(88, 'asset', 'delete asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(89, 'asset', 'attach employee asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(90, 'asset', 'detach employee asset', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(91, 'leave', 'index leave', 'web', '2020-08-15 14:57:44', '2020-08-15 14:57:44'),
(92, 'leave', 'create leave', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(93, 'leave', 'delete leave', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(94, 'leave type', 'index leave type', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(95, 'leave type', 'create leave type', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(96, 'leave type', 'update leave type', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(97, 'payroll', 'index payroll', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(98, 'payroll', 'create payroll', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(99, 'payroll', 'delete payroll', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(100, 'payroll type', 'index payroll type', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(101, 'payroll type', 'create payroll type', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(102, 'payroll type', 'delete payroll type', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(103, 'pay slip', 'index pay slip', 'web', '2020-08-15 14:57:45', '2020-08-15 14:57:45'),
(104, 'pay slip', 'create pay slip', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(105, 'pay slip', 'show pay slip', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(106, 'pay slip', 'update pay slip', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(107, 'pay slip', 'delete pay slip', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(108, 'shift', 'index shift', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(109, 'shift', 'create shift', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(110, 'shift', 'update shift', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(111, 'shift', 'attach shift employee', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(112, 'shift', 'detach shift employee', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(113, 'shift', 'index shift employee', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(114, 'shift hour', 'index shift hour', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(115, 'shift hour', 'create shift hour', 'web', '2020-08-15 14:57:46', '2020-08-15 14:57:46'),
(116, 'shift hour', 'update shift hour', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(117, 'earning type', 'index earning type', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(118, 'earning type', 'create earning type', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(119, 'earning type', 'update earning type', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(120, 'earning', 'index earning', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(121, 'earning', 'create earning', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(122, 'earning', 'update earning', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(123, 'attendance', 'index attendance', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(124, 'attendance', 'update attendance', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(125, 'attendance', 'history attendance', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(126, 'attendance', 'check in attendance', 'web', '2020-08-15 14:57:47', '2020-08-15 14:57:47'),
(127, 'attendance', 'check out attendance', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(128, 'approve type', 'index approve type', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(129, 'approve type', 'create approve type', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(130, 'approve type', 'update approve type', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(131, 'approver', 'index approver', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(132, 'approver', 'create approver', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(133, 'approver', 'update approver', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(134, 'approver', 'destroy approver', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(135, 'holiday', 'index holiday', 'web', '2020-08-15 14:57:48', '2020-08-15 14:57:48'),
(136, 'holiday', 'create holiday', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(137, 'holiday', 'update holiday', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(138, 'holiday', 'destroy holiday', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(139, 'pos', 'pos hall index', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(140, 'pos', 'pos hall transfer', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(141, 'pos', 'pos hall merge', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(142, 'pos', 'pos discount', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(143, 'pos', 'pos coupon', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(144, 'pos', 'pos split order', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(145, 'pos', 'pos assign client', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(146, 'pos', 'create order', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(147, 'pos', 'update order', 'web', '2020-08-15 14:57:49', '2020-08-15 14:57:49'),
(148, 'pos', 'delete order', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(149, 'pos', 'close order', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(150, 'kitchen', 'life kitchen', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(151, 'order payment', 'create order payment', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(152, 'order payment', 'delete order payment', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(153, 'reservation', 'reservation calender', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(154, 'reservation', 'index reservation', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(155, 'reservation', 'create reservation', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(156, 'reservation', 'update reservation', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(157, 'reservation', 'delete reservation', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(158, 'print', 'print client', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(159, 'print', 'print department', 'web', '2020-08-15 14:57:50', '2020-08-15 14:57:50'),
(160, 'client', 'index client', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(161, 'client', 'create client', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(162, 'client', 'update client', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(163, 'client', 'create client payment', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(164, 'client', 'delete client payment', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(165, 'role', 'index role', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(166, 'role', 'create role', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(167, 'role', 'update role', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(168, 'role', 'delete role', 'web', '2020-08-15 14:57:51', '2020-08-15 14:57:51'),
(169, 'role', 'associate Permission role', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(170, 'role', 'dissociate Permission role', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(171, 'expense', 'index expense', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(172, 'expense', 'create expense', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(173, 'expense', 'delete expense', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(174, 'profile', 'index transfer money', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(175, 'profile', 'index received money', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(176, 'profile', 'request transfer money', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(177, 'profile', 'response received money', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(178, 'profile', 'my requests', 'web', '2020-08-15 14:57:52', '2020-08-15 14:57:52'),
(179, 'profile', 'my approves', 'web', '2020-08-15 14:57:53', '2020-08-15 14:57:53'),
(180, 'profile', 'response approve', 'web', '2020-08-15 14:57:53', '2020-08-15 14:57:53'),
(181, 'dashboard', 'pos dashboard', 'web', '2020-08-15 14:57:53', '2020-08-15 14:57:53'),
(182, 'dashboard', 'stock dashboard', 'web', '2020-08-15 14:57:53', '2020-08-15 14:57:53'),
(183, 'dashboard', 'cost dashboard', 'web', '2020-08-15 14:57:53', '2020-08-15 14:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'super.admin@recipe.com', 'ed5f62ea62e3eb291b5767ab8880898c7929c2e9fb9a190b0aedf5a638d36b6f', '[\"*\"]', NULL, '2020-10-11 17:07:54', '2020-10-11 17:07:54'),
(2, 'App\\User', 1, 'super.admin@recipe.com', '4d8a18f4ae0e0b458a75ca8ebee1732a98108072db53d138da6316a2cb38c75b', '[\"*\"]', NULL, '2020-10-11 19:38:46', '2020-10-11 19:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prepare_headers`
--

CREATE TABLE `prepare_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prepare_headers`
--

INSERT INTO `prepare_headers` (`id`, `store_id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 18, 20, '2020-09-21 13:03:13', '2020-09-21 13:03:13'),
(2, 1, 1, 18, 1, '2020-10-19 23:13:34', '2020-10-19 23:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reorder_point` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stockable` tinyint(1) DEFAULT NULL,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `is_prepared` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `name`, `name_ar`, `barcode`, `reorder_point`, `is_stockable`, `product_category_id`, `unit_id`, `is_prepared`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main Dish product', 'منتج الطبق الرئيسي', '1', '10', NULL, 1, 1, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(2, 1, 'Sandwich product', 'منتج سندوتشات', '2', '10', NULL, 1, 1, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(3, 1, 'cold drinks product', 'منتج مرشوبات بارده', '3', '10', NULL, 1, 3, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(4, 1, 'hot drinks product', 'منتج مرشوبات ساخنة', '4', '10', NULL, 1, 3, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(5, 1, 'Side  Product', 'منتج الطبق الجانبي', '5', '10', NULL, 2, 1, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(6, 1, 'extra  Product', 'منتج الطبق الايضافي', '6', '10', NULL, 2, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(7, 1, 'pasta Product', 'منتج مكرونة', '7', '10', NULL, 2, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(8, 1, 'salad product', 'منتج سلطة', '8', '10', NULL, 2, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(9, 1, 'Pizza Product', 'منتج بيتزا', '9', '10', NULL, 2, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(10, 1, 'Main Dish product2', 'منتج الطبق الرئيسي2', '10', '10', NULL, 3, 1, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(11, 1, 'Sandwich product2', 'منتج سندوتشات2', '11', '10', NULL, 3, 1, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(12, 1, 'cold drinks product2', 'منتج مرشوبات بارده2', '12', '10', NULL, 3, 3, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(13, 1, 'hot drinks product2', 'منتج مرشوبات ساخنة2', '13', '10', NULL, 3, 3, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(14, 1, 'Side  Product2', 'منتج الطبق الجانبي2', '14', '10', NULL, 4, 1, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(15, 1, 'extra  Product2', 'منتج الطبق الايضافي2', '15', '10', NULL, 4, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(16, 1, 'pasta Product2', 'منتج مكرونة2', '16', '10', NULL, 4, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(17, 1, 'salad product2', 'منتج سلطة2', '17', '10', NULL, 4, 2, 0, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(18, 1, 'Pizza Product2', 'منتج بيتزا2', '18', '10', NULL, 4, 2, 1, '2020-09-19 21:33:08', '2020-09-19 21:33:08'),
(19, 1, 'Kadeem Savage', 'Kevyn Schneider', 'Eos quae elit et mo', '97', 0, 5, 2, 0, '2020-11-02 20:23:02', '2020-11-02 20:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'images/no_image.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `store_id`, `name`, `name_ar`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Spices', 'بهارات', NULL, 'images/no_image.png', '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(2, 1, 'Bread', 'عيش', NULL, 'images/no_image.png', '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(3, 1, 'Drinks', 'مشروبات', NULL, 'images/no_image.png', '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(4, 1, 'Canned', 'معلبات', NULL, 'images/no_image.png', '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(5, 1, 'Milks', 'البان', NULL, 'images/no_image.png', '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(6, 1, 'Meats', 'لحوم', NULL, 'images/no_image.png', '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(7, 3, 'drinks', 'مشروبات', NULL, 'images/no_image.png', '2020-08-26 14:47:57', '2020-08-26 14:47:57'),
(8, 3, 'canned', 'معلبات', NULL, 'images/no_image.png', '2020-08-26 14:51:12', '2020-08-26 14:51:12'),
(10, 15, 'Meat', 'لحوم', 'لحوم', 'images/no_image.png', '2020-09-09 13:13:08', '2020-09-09 13:13:53'),
(11, 15, 'Drinks', 'مشروبات', NULL, 'images/no_image.png', '2020-09-09 13:14:14', '2020-09-09 13:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_recipes`
--

CREATE TABLE `product_recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prepared_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_quantity` double NOT NULL,
  `child_unit_quantity` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_recipes`
--

INSERT INTO `product_recipes` (`id`, `prepared_product_id`, `product_id`, `unit_quantity`, `child_unit_quantity`, `created_at`, `updated_at`) VALUES
(1, 18, 16, 0.01, 10, '2020-09-21 13:02:50', '2020-09-21 13:02:50'),
(2, 18, 1, 0.8333333333333334, 10, '2020-10-19 23:13:12', '2020-10-19 23:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `vat` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_supplier`
--

INSERT INTO `product_supplier` (`id`, `product_id`, `supplier_id`, `vat`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, NULL),
(3, 4, 1, NULL, NULL, NULL),
(4, 5, 1, NULL, NULL, NULL),
(5, 7, 1, NULL, NULL, NULL),
(6, 6, 1, NULL, NULL, NULL),
(7, 8, 1, NULL, NULL, NULL),
(8, 9, 1, NULL, NULL, NULL),
(9, 17, 1, NULL, NULL, NULL),
(10, 16, 1, NULL, NULL, NULL),
(11, 15, 1, NULL, NULL, NULL),
(12, 14, 1, NULL, NULL, NULL),
(13, 13, 1, NULL, NULL, NULL),
(14, 12, 1, NULL, NULL, NULL),
(15, 11, 1, NULL, NULL, NULL),
(16, 10, 1, NULL, NULL, NULL),
(17, 3, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purses`
--

CREATE TABLE `purses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `discount` double DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purses`
--

INSERT INTO `purses` (`id`, `supplier_id`, `store_id`, `discount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 1, '2020-09-21 09:35:55', '2020-09-21 09:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `purses_products`
--

CREATE TABLE `purses_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount_percentage` double DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `vat` double DEFAULT 0,
  `expired_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purses_products`
--

INSERT INTO `purses_products` (`id`, `purse_id`, `product_id`, `discount_percentage`, `quantity`, `unit_price`, `vat`, `expired_date`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 0, 10, 10, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(2, 1, 12, 0, 10, 20, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(3, 1, 6, 0, 10, 30, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(4, 1, 15, 0, 10, 40, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(5, 1, 4, 0, 12, 50, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(6, 1, 14, 0, 10, 60, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(7, 1, 5, 0, 10, 70, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(8, 1, 11, 0, 10, 80, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(9, 1, 17, 0, 10, 90, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(10, 1, 8, 0, 10, 100, 0, NULL, '2020-09-21 09:35:55', '2020-09-21 09:35:55'),
(11, 1, 7, NULL, 10, 10, NULL, NULL, '2020-09-21 09:36:25', '2020-09-21 09:36:25'),
(12, 1, 16, NULL, 10, 20, NULL, NULL, '2020-09-21 09:36:40', '2020-09-21 09:36:40'),
(13, 1, 9, NULL, 10, 30, NULL, NULL, '2020-09-21 09:36:51', '2020-09-21 09:36:51'),
(14, 1, 13, NULL, 10, 40, NULL, NULL, '2020-09-21 09:37:11', '2020-09-21 09:37:11'),
(15, 1, 1, NULL, 10, 50, NULL, NULL, '2020-09-21 09:37:20', '2020-09-21 09:37:20'),
(16, 1, 10, NULL, 10, 60, NULL, NULL, '2020-09-21 09:37:30', '2020-09-21 09:37:30'),
(17, 1, 2, NULL, 10, 80, NULL, NULL, '2020-09-21 09:38:20', '2020-09-21 09:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `refund_products`
--

CREATE TABLE `refund_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `clients_number` int(11) DEFAULT NULL,
  `updated_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `user_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2020-08-15 14:57:55', '2020-08-15 14:57:55'),
(3, 5, NULL, '2020-08-25 20:48:23', '2020-08-25 20:48:23'),
(15, 20, NULL, '2020-09-06 10:56:09', '2020-09-06 10:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `store_id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'web', '2020-08-15 14:57:37', '2020-08-15 14:57:37'),
(2, 1, 'كاشير', 'web', '2020-08-24 07:52:15', '2020-08-24 07:52:15'),
(3, 2, 'Super Admin', 'web', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(6, 15, 'Super Admin', 'web', '2020-09-06 10:56:09', '2020-09-06 10:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ruined_dishes`
--

CREATE TABLE `ruined_dishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `service` double DEFAULT 0,
  `vat` double DEFAULT 0,
  `is_staff` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruined_dish_details`
--

CREATE TABLE `ruined_dish_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `ruined_dish_id` bigint(20) UNSIGNED NOT NULL,
  `dish_size_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruined_headers`
--

CREATE TABLE `ruined_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `ruinedable_id` bigint(20) UNSIGNED NOT NULL,
  `ruinedable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_math_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `math_start_date` date DEFAULT NULL,
  `math_end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruined_headers`
--

INSERT INTO `ruined_headers` (`id`, `store_id`, `ruinedable_id`, `ruinedable_type`, `price_math_method`, `math_start_date`, `math_end_date`, `created_at`, `updated_at`) VALUES
(1, 15, 15, 'App\\Store', NULL, NULL, NULL, '2020-09-09 13:26:51', '2020-09-09 13:26:51'),
(2, 15, 5, 'App\\Department', NULL, NULL, NULL, '2020-09-09 16:51:10', '2020-09-09 16:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `ruined_products`
--

CREATE TABLE `ruined_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `ruined_header_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `price_unit` double DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruined_products`
--

INSERT INTO `ruined_products` (`id`, `store_id`, `ruined_header_id`, `product_id`, `quantity`, `price_unit`, `note`, `vat`, `created_at`, `updated_at`) VALUES
(1, 15, 1, 7, 1, 75, '', 0, '2020-09-09 13:26:51', '2020-09-09 13:26:51'),
(2, 15, 2, 7, 1, 75, '', 0, '2020-09-09 16:51:10', '2020-09-09 16:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

CREATE TABLE `safes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` smallint(5) UNSIGNED DEFAULT NULL,
  `employee_id` smallint(5) UNSIGNED DEFAULT NULL,
  `balance` decimal(8,2) DEFAULT 0.00,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`id`, `name`, `store_id`, `employee_id`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'الخزنه الرئيسية', 1, 1, 0.00, 1, '2020-08-18 11:13:47', '2020-08-18 11:13:47'),
(2, 'الخزينة 2', 1, 2, 0.00, 1, '2020-08-24 07:47:50', '2020-08-24 07:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `safe_logs`
--

CREATE TABLE `safe_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `safe_id` bigint(20) UNSIGNED NOT NULL,
  `requested_balance` double NOT NULL DEFAULT 0,
  `received_balance` double NOT NULL DEFAULT 0,
  `balance_difference` double NOT NULL DEFAULT 0,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `requester_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `safe_payments`
--

CREATE TABLE `safe_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `paymentable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paymentable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `remaining` double DEFAULT 0,
  `paid` double DEFAULT 0,
  `method` enum('account','check','cash','creditcard') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `safe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 : not transfer 1 : transfered',
  `safe_log_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safe_payments`
--

INSERT INTO `safe_payments` (`id`, `store_id`, `paymentable_id`, `paymentable_type`, `amount`, `remaining`, `paid`, `method`, `client_id`, `employee_id`, `safe_id`, `status`, `safe_log_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'App\\Order', 137.68, 12.32, 150, 'cash', NULL, 1, 1, 0, NULL, NULL, '2020-10-04 02:14:07', '2020-10-04 02:14:07'),
(2, 1, 1, 'App\\ClientAccount', 20, 0, 0, 'cash', NULL, 1, 1, 0, NULL, NULL, '2020-10-25 07:47:24', '2020-10-25 07:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'Badakhshan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(2, 'Badgis', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(3, 'Baglan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(4, 'Balkh', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(5, 'Bamiyan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(6, 'Farah', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(7, 'Faryab', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(8, 'Gawr', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(9, 'Gazni', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(10, 'Herat', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(11, 'Hilmand', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(12, 'Jawzjan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(13, 'Kabul', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(14, 'Kapisa', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(15, 'Khawst', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(16, 'Kunar', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(17, 'Lagman', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(18, 'Lawghar', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(19, 'Nangarhar', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(20, 'Nimruz', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(21, 'Nuristan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(22, 'Paktika', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(23, 'Paktiya', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(24, 'Parwan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(25, 'Qandahar', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(26, 'Qunduz', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(27, 'Samangan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(28, 'Sar-e Pul', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(29, 'Takhar', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(30, 'Uruzgan', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(31, 'Wardag', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(32, 'Zabul', 1, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(33, 'Berat', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(34, 'Bulqize', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(35, 'Delvine', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(36, 'Devoll', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(37, 'Dibre', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(38, 'Durres', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(39, 'Elbasan', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(40, 'Fier', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(41, 'Gjirokaster', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(42, 'Gramsh', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(43, 'Has', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(44, 'Kavaje', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(45, 'Kolonje', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(46, 'Korce', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(47, 'Kruje', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(48, 'Kucove', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(49, 'Kukes', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(50, 'Kurbin', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(51, 'Lezhe', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(52, 'Librazhd', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(53, 'Lushnje', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(54, 'Mallakaster', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(55, 'Malsi e Madhe', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(56, 'Mat', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(57, 'Mirdite', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(58, 'Peqin', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(59, 'Permet', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(60, 'Pogradec', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(61, 'Puke', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(62, 'Sarande', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(63, 'Shkoder', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(64, 'Skrapar', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(65, 'Tepelene', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(66, 'Tirane', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(67, 'Tropoje', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(68, 'Vlore', 3, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(69, 'Ayn Daflah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(70, 'Ayn Tamushanat', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(71, 'Adrar', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(72, 'Algiers', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(73, 'Annabah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(74, 'Bashshar', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(75, 'Batnah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(76, 'Bijayah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(77, 'Biskrah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(78, 'Blidah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(79, 'Buirah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(80, 'Bumardas', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(81, 'Burj Bu Arririj', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(82, 'Ghalizan', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(83, 'Ghardayah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(84, 'Ilizi', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(85, 'Jijili', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(86, 'Jilfah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(87, 'Khanshalah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(88, 'Masilah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(89, 'Midyah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(90, 'Milah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(91, 'Muaskar', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(92, 'Mustaghanam', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(93, 'Naama', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(94, 'Oran', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(95, 'Ouargla', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(96, 'Qalmah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(97, 'Qustantinah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(98, 'Sakikdah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(99, 'Satif', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(100, 'Sayda', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(101, 'Sidi ban-al-Abbas', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(102, 'Suq Ahras', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(103, 'Tamanghasat', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(104, 'Tibazah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(105, 'Tibissah', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(106, 'Tilimsan', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(107, 'Tinduf', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(108, 'Tisamsilt', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(109, 'Tiyarat', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(110, 'Tizi Wazu', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(111, 'Umm-al-Bawaghi', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(112, 'Wahran', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(113, 'Warqla', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(114, 'Wilaya d Alger', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(115, 'Wilaya de Bejaia', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(116, 'Wilaya de Constantine', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(117, 'al-Aghwat', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(118, 'al-Bayadh', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(119, 'al-Jazair', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(120, 'al-Wad', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(121, 'ash-Shalif', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(122, 'at-Tarif', 4, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(123, 'Eastern', 5, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(124, 'Manua', 5, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(125, 'Swains Island', 5, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(126, 'Western', 5, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(127, 'Andorra la Vella', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(128, 'Canillo', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(129, 'Encamp', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(130, 'La Massana', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(131, 'Les Escaldes', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(132, 'Ordino', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(133, 'Sant Julia de Loria', 6, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(134, 'Bengo', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(135, 'Benguela', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(136, 'Bie', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(137, 'Cabinda', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(138, 'Cunene', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(139, 'Huambo', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(140, 'Huila', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(141, 'Kuando-Kubango', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(142, 'Kwanza Norte', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(143, 'Kwanza Sul', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(144, 'Luanda', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(145, 'Lunda Norte', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(146, 'Lunda Sul', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(147, 'Malanje', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(148, 'Moxico', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(149, 'Namibe', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(150, 'Uige', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(151, 'Zaire', 7, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(152, 'Other Provinces', 8, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(153, 'Sector claimed by Argentina/Ch', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(154, 'Sector claimed by Argentina/UK', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(155, 'Sector claimed by Australia', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(156, 'Sector claimed by France', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(157, 'Sector claimed by New Zealand', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(158, 'Sector claimed by Norway', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(159, 'Unclaimed Sector', 9, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(160, 'Barbuda', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(161, 'Saint George', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(162, 'Saint John', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(163, 'Saint Mary', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(164, 'Saint Paul', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(165, 'Saint Peter', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(166, 'Saint Philip', 10, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(167, 'Buenos Aires', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(168, 'Catamarca', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(169, 'Chaco', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(170, 'Chubut', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(171, 'Cordoba', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(172, 'Corrientes', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(173, 'Distrito Federal', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(174, 'Entre Rios', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(175, 'Formosa', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(176, 'Jujuy', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(177, 'La Pampa', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(178, 'La Rioja', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(179, 'Mendoza', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(180, 'Misiones', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(181, 'Neuquen', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(182, 'Rio Negro', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(183, 'Salta', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(184, 'San Juan', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(185, 'San Luis', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(186, 'Santa Cruz', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(187, 'Santa Fe', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(188, 'Santiago del Estero', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(189, 'Tierra del Fuego', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(190, 'Tucuman', 11, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(191, 'Aragatsotn', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(192, 'Ararat', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(193, 'Armavir', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(194, 'Gegharkunik', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(195, 'Kotaik', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(196, 'Lori', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(197, 'Shirak', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(198, 'Stepanakert', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(199, 'Syunik', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(200, 'Tavush', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(201, 'Vayots Dzor', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(202, 'Yerevan', 12, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(203, 'Aruba', 13, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(204, 'Auckland', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(205, 'Australian Capital Territory', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(206, 'Balgowlah', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(207, 'Balmain', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(208, 'Bankstown', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(209, 'Baulkham Hills', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(210, 'Bonnet Bay', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(211, 'Camberwell', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(212, 'Carole Park', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(213, 'Castle Hill', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(214, 'Caulfield', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(215, 'Chatswood', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(216, 'Cheltenham', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(217, 'Cherrybrook', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(218, 'Clayton', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(219, 'Collingwood', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(220, 'Frenchs Forest', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(221, 'Hawthorn', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(222, 'Jannnali', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(223, 'Knoxfield', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(224, 'Melbourne', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(225, 'New South Wales', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(226, 'Northern Territory', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(227, 'Perth', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(228, 'Queensland', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(229, 'South Australia', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(230, 'Tasmania', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(231, 'Templestowe', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(232, 'Victoria', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(233, 'Werribee south', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(234, 'Western Australia', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(235, 'Wheeler', 14, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(236, 'Bundesland Salzburg', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(237, 'Bundesland Steiermark', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(238, 'Bundesland Tirol', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(239, 'Burgenland', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(240, 'Carinthia', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(241, 'Karnten', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(242, 'Liezen', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(243, 'Lower Austria', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(244, 'Niederosterreich', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(245, 'Oberosterreich', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(246, 'Salzburg', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(247, 'Schleswig-Holstein', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(248, 'Steiermark', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(249, 'Styria', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(250, 'Tirol', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(251, 'Upper Austria', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(252, 'Vorarlberg', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(253, 'Wien', 15, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(254, 'Abseron', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(255, 'Baki Sahari', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(256, 'Ganca', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(257, 'Ganja', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(258, 'Kalbacar', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(259, 'Lankaran', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(260, 'Mil-Qarabax', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(261, 'Mugan-Salyan', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(262, 'Nagorni-Qarabax', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(263, 'Naxcivan', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(264, 'Priaraks', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(265, 'Qazax', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(266, 'Saki', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(267, 'Sirvan', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(268, 'Xacmaz', 16, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(269, 'Isa', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(270, 'Badiyah', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(271, 'Hidd', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(272, 'Jidd Hafs', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(273, 'Mahama', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(274, 'Manama', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(275, 'Sitrah', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(276, 'al-Manamah', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(277, 'al-Muharraq', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(278, 'ar-Rifaa', 18, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(279, 'Bagar Hat', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(280, 'Bandarban', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(281, 'Barguna', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(282, 'Barisal', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(283, 'Bhola', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(284, 'Bogora', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(285, 'Brahman Bariya', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(286, 'Chandpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(287, 'Chattagam', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(288, 'Chittagong Division', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(289, 'Chuadanga', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(290, 'Dhaka', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(291, 'Dinajpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(292, 'Faridpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(293, 'Feni', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(294, 'Gaybanda', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(295, 'Gazipur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(296, 'Gopalganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(297, 'Habiganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(298, 'Jaipur Hat', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(299, 'Jamalpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(300, 'Jessor', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(301, 'Jhalakati', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(302, 'Jhanaydah', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(303, 'Khagrachhari', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(304, 'Khulna', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(305, 'Kishorganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(306, 'Koks Bazar', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(307, 'Komilla', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(308, 'Kurigram', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(309, 'Kushtiya', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(310, 'Lakshmipur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(311, 'Lalmanir Hat', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(312, 'Madaripur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(313, 'Magura', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(314, 'Maimansingh', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(315, 'Manikganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(316, 'Maulvi Bazar', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(317, 'Meherpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(318, 'Munshiganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(319, 'Naral', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(320, 'Narayanganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(321, 'Narsingdi', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(322, 'Nator', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(323, 'Naugaon', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(324, 'Nawabganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(325, 'Netrakona', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(326, 'Nilphamari', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(327, 'Noakhali', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(328, 'Pabna', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(329, 'Panchagarh', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(330, 'Patuakhali', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(331, 'Pirojpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(332, 'Rajbari', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(333, 'Rajshahi', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(334, 'Rangamati', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(335, 'Rangpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(336, 'Satkhira', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(337, 'Shariatpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(338, 'Sherpur', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(339, 'Silhat', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(340, 'Sirajganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(341, 'Sunamganj', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(342, 'Tangayal', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(343, 'Thakurgaon', 19, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(344, 'Christ Church', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(345, 'Saint Andrew', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(346, 'Saint George', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(347, 'Saint James', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(348, 'Saint John', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(349, 'Saint Joseph', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(350, 'Saint Lucy', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(351, 'Saint Michael', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(352, 'Saint Peter', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(353, 'Saint Philip', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(354, 'Saint Thomas', 20, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(355, 'Brest', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(356, 'Homjel', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(357, 'Hrodna', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(358, 'Mahiljow', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(359, 'Mahilyowskaya Voblasts', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(360, 'Minsk', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(361, 'Minskaja Voblasts', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(362, 'Petrik', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(363, 'Vicebsk', 21, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(364, 'Antwerpen', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(365, 'Berchem', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(366, 'Brabant', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(367, 'Brabant Wallon', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(368, 'Brussel', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(369, 'East Flanders', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(370, 'Hainaut', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(371, 'Liege', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(372, 'Limburg', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(373, 'Luxembourg', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(374, 'Namur', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(375, 'Ontario', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(376, 'Oost-Vlaanderen', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(377, 'Provincie Brabant', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(378, 'Vlaams-Brabant', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(379, 'Wallonne', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(380, 'West-Vlaanderen', 22, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(381, 'Belize', 23, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(382, 'Cayo', 23, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(383, 'Corozal', 23, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(384, 'Orange Walk', 23, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(385, 'Stann Creek', 23, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(386, 'Toledo', 23, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(387, 'Alibori', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(388, 'Atacora', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(389, 'Atlantique', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(390, 'Borgou', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(391, 'Collines', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(392, 'Couffo', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(393, 'Donga', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(394, 'Littoral', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(395, 'Mono', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(396, 'Oueme', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(397, 'Plateau', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(398, 'Zou', 24, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(399, 'Hamilton', 25, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(400, 'Saint George', 25, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(401, 'Bumthang', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(402, 'Chhukha', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(403, 'Chirang', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(404, 'Daga', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(405, 'Geylegphug', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(406, 'Ha', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(407, 'Lhuntshi', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(408, 'Mongar', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(409, 'Pemagatsel', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(410, 'Punakha', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(411, 'Rinpung', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(412, 'Samchi', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(413, 'Samdrup Jongkhar', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(414, 'Shemgang', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(415, 'Tashigang', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(416, 'Timphu', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(417, 'Tongsa', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(418, 'Wangdiphodrang', 26, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(419, 'Beni', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(420, 'Chuquisaca', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(421, 'Cochabamba', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(422, 'La Paz', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(423, 'Oruro', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(424, 'Pando', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(425, 'Potosi', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(426, 'Santa Cruz', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(427, 'Tarija', 27, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(428, 'Federacija Bosna i Hercegovina', 28, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(429, 'Republika Srpska', 28, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(430, 'Central Bobonong', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(431, 'Central Boteti', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(432, 'Central Mahalapye', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(433, 'Central Serowe-Palapye', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(434, 'Central Tutume', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(435, 'Chobe', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(436, 'Francistown', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(437, 'Gaborone', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(438, 'Ghanzi', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(439, 'Jwaneng', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(440, 'Kgalagadi North', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(441, 'Kgalagadi South', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(442, 'Kgatleng', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(443, 'Kweneng', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(444, 'Lobatse', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(445, 'Ngamiland', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(446, 'Ngwaketse', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(447, 'North East', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(448, 'Okavango', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(449, 'Orapa', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(450, 'Selibe Phikwe', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(451, 'South East', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(452, 'Sowa', 29, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(453, 'Bouvet Island', 30, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(454, 'Acre', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(455, 'Alagoas', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(456, 'Amapa', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(457, 'Amazonas', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(458, 'Bahia', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(459, 'Ceara', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(460, 'Distrito Federal', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(461, 'Espirito Santo', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(462, 'Estado de Sao Paulo', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(463, 'Goias', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(464, 'Maranhao', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(465, 'Mato Grosso', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(466, 'Mato Grosso do Sul', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(467, 'Minas Gerais', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(468, 'Para', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(469, 'Paraiba', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(470, 'Parana', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(471, 'Pernambuco', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(472, 'Piaui', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(473, 'Rio Grande do Norte', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(474, 'Rio Grande do Sul', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(475, 'Rio de Janeiro', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(476, 'Rondonia', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(477, 'Roraima', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(478, 'Santa Catarina', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(479, 'Sao Paulo', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(480, 'Sergipe', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(481, 'Tocantins', 31, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(482, 'British Indian Ocean Territory', 32, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(483, 'Blagoevgrad', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(484, 'Burgas', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(485, 'Dobrich', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(486, 'Gabrovo', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(487, 'Haskovo', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(488, 'Jambol', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(489, 'Kardzhali', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(490, 'Kjustendil', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(491, 'Lovech', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(492, 'Montana', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(493, 'Oblast Sofiya-Grad', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(494, 'Pazardzhik', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(495, 'Pernik', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(496, 'Pleven', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(497, 'Plovdiv', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(498, 'Razgrad', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(499, 'Ruse', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(500, 'Shumen', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(501, 'Silistra', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(502, 'Sliven', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(503, 'Smoljan', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(504, 'Sofija grad', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(505, 'Sofijska oblast', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(506, 'Stara Zagora', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(507, 'Targovishte', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(508, 'Varna', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(509, 'Veliko Tarnovo', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(510, 'Vidin', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(511, 'Vraca', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(512, 'Yablaniza', 34, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(513, 'Bale', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(514, 'Bam', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(515, 'Bazega', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(516, 'Bougouriba', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(517, 'Boulgou', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(518, 'Boulkiemde', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(519, 'Comoe', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(520, 'Ganzourgou', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(521, 'Gnagna', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(522, 'Gourma', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(523, 'Houet', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(524, 'Ioba', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(525, 'Kadiogo', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(526, 'Kenedougou', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(527, 'Komandjari', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(528, 'Kompienga', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(529, 'Kossi', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(530, 'Kouritenga', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(531, 'Kourweogo', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(532, 'Leraba', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(533, 'Mouhoun', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(534, 'Nahouri', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(535, 'Namentenga', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(536, 'Noumbiel', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(537, 'Oubritenga', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(538, 'Oudalan', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(539, 'Passore', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(540, 'Poni', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(541, 'Sanguie', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(542, 'Sanmatenga', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(543, 'Seno', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(544, 'Sissili', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(545, 'Soum', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(546, 'Sourou', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(547, 'Tapoa', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(548, 'Tuy', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(549, 'Yatenga', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(550, 'Zondoma', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(551, 'Zoundweogo', 35, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(552, 'Bubanza', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(553, 'Bujumbura', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(554, 'Bururi', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(555, 'Cankuzo', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(556, 'Cibitoke', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(557, 'Gitega', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(558, 'Karuzi', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(559, 'Kayanza', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(560, 'Kirundo', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(561, 'Makamba', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(562, 'Muramvya', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(563, 'Muyinga', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(564, 'Ngozi', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(565, 'Rutana', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(566, 'Ruyigi', 36, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(567, 'Banteay Mean Chey', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(568, 'Bat Dambang', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(569, 'Kampong Cham', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(570, 'Kampong Chhnang', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(571, 'Kampong Spoeu', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(572, 'Kampong Thum', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(573, 'Kampot', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(574, 'Kandal', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(575, 'Kaoh Kong', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(576, 'Kracheh', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(577, 'Krong Kaeb', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(578, 'Krong Pailin', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(579, 'Krong Preah Sihanouk', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(580, 'Mondol Kiri', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(581, 'Otdar Mean Chey', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(582, 'Phnum Penh', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(583, 'Pousat', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(584, 'Preah Vihear', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(585, 'Prey Veaeng', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(586, 'Rotanak Kiri', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(587, 'Siem Reab', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(588, 'Stueng Traeng', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(589, 'Svay Rieng', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(590, 'Takaev', 37, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(591, 'Adamaoua', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(592, 'Centre', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(593, 'Est', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(594, 'Littoral', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(595, 'Nord', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(596, 'Nord Extreme', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(597, 'Nordouest', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(598, 'Ouest', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(599, 'Sud', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(600, 'Sudouest', 38, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(601, 'Alberta', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(602, 'British Columbia', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(603, 'Manitoba', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(604, 'New Brunswick', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(605, 'Newfoundland and Labrador', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(606, 'Northwest Territories', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(607, 'Nova Scotia', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(608, 'Nunavut', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(609, 'Ontario', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(610, 'Prince Edward Island', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(611, 'Quebec', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(612, 'Saskatchewan', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(613, 'Yukon', 39, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(614, 'Boavista', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(615, 'Brava', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(616, 'Fogo', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(617, 'Maio', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(618, 'Sal', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(619, 'Santo Antao', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(620, 'Sao Nicolau', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(621, 'Sao Tiago', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(622, 'Sao Vicente', 40, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(623, 'Grand Cayman', 41, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(624, 'Bamingui-Bangoran', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(625, 'Bangui', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(626, 'Basse-Kotto', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(627, 'Haut-Mbomou', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(628, 'Haute-Kotto', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(629, 'Kemo', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(630, 'Lobaye', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(631, 'Mambere-Kadei', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(632, 'Mbomou', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(633, 'Nana-Gribizi', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(634, 'Nana-Mambere', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(635, 'Ombella Mpoko', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(636, 'Ouaka', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(637, 'Ouham', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(638, 'Ouham-Pende', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(639, 'Sangha-Mbaere', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(640, 'Vakaga', 42, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(641, 'Batha', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(642, 'Biltine', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(643, 'Bourkou-Ennedi-Tibesti', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(644, 'Chari-Baguirmi', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(645, 'Guera', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(646, 'Kanem', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(647, 'Lac', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(648, 'Logone Occidental', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(649, 'Logone Oriental', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(650, 'Mayo-Kebbi', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(651, 'Moyen-Chari', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(652, 'Ouaddai', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(653, 'Salamat', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(654, 'Tandjile', 43, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(655, 'Aisen', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(656, 'Antofagasta', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(657, 'Araucania', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(658, 'Atacama', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(659, 'Bio Bio', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(660, 'Coquimbo', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(661, 'Libertador General Bernardo O', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(662, 'Los Lagos', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(663, 'Magellanes', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(664, 'Maule', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(665, 'Metropolitana', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(666, 'Metropolitana de Santiago', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(667, 'Tarapaca', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(668, 'Valparaiso', 44, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(669, 'Anhui', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(670, 'Anhui Province', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(671, 'Anhui Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(672, 'Aomen', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(673, 'Beijing', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(674, 'Beijing Shi', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(675, 'Chongqing', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(676, 'Fujian', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(677, 'Fujian Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(678, 'Gansu', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(679, 'Guangdong', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(680, 'Guangdong Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(681, 'Guangxi', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(682, 'Guizhou', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(683, 'Hainan', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(684, 'Hebei', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(685, 'Heilongjiang', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(686, 'Henan', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(687, 'Hubei', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(688, 'Hunan', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(689, 'Jiangsu', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(690, 'Jiangsu Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(691, 'Jiangxi', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(692, 'Jilin', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(693, 'Liaoning', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(694, 'Liaoning Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(695, 'Nei Monggol', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(696, 'Ningxia Hui', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(697, 'Qinghai', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(698, 'Shaanxi', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(699, 'Shandong', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(700, 'Shandong Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(701, 'Shanghai', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(702, 'Shanxi', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(703, 'Sichuan', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(704, 'Tianjin', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(705, 'Xianggang', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(706, 'Xinjiang', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(707, 'Xizang', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15');
INSERT INTO `states` (`id`, `name`, `country_id`, `flag`, `created_at`, `updated_at`) VALUES
(708, 'Yunnan', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(709, 'Zhejiang', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(710, 'Zhejiang Sheng', 45, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(711, 'Christmas Island', 46, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(712, 'Cocos (Keeling) Islands', 47, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(713, 'Amazonas', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(714, 'Antioquia', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(715, 'Arauca', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(716, 'Atlantico', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(717, 'Bogota', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(718, 'Bolivar', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(719, 'Boyaca', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(720, 'Caldas', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(721, 'Caqueta', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(722, 'Casanare', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(723, 'Cauca', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(724, 'Cesar', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(725, 'Choco', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(726, 'Cordoba', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(727, 'Cundinamarca', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(728, 'Guainia', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(729, 'Guaviare', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(730, 'Huila', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(731, 'La Guajira', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(732, 'Magdalena', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(733, 'Meta', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(734, 'Narino', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(735, 'Norte de Santander', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(736, 'Putumayo', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(737, 'Quindio', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(738, 'Risaralda', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(739, 'San Andres y Providencia', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(740, 'Santander', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(741, 'Sucre', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(742, 'Tolima', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(743, 'Valle del Cauca', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(744, 'Vaupes', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(745, 'Vichada', 48, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(746, 'Mwali', 49, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(747, 'Njazidja', 49, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(748, 'Nzwani', 49, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(749, 'Bouenza', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(750, 'Brazzaville', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(751, 'Cuvette', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(752, 'Kouilou', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(753, 'Lekoumou', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(754, 'Likouala', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(755, 'Niari', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(756, 'Plateaux', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(757, 'Pool', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(758, 'Sangha', 50, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(759, 'Aitutaki', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(760, 'Atiu', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(761, 'Mangaia', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(762, 'Manihiki', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(763, 'Mauke', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(764, 'Mitiaro', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(765, 'Nassau', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(766, 'Pukapuka', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(767, 'Rakahanga', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(768, 'Rarotonga', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(769, 'Tongareva', 52, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(770, 'Alajuela', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(771, 'Cartago', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(772, 'Guanacaste', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(773, 'Heredia', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(774, 'Limon', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(775, 'Puntarenas', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(776, 'San Jose', 53, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(777, 'Camaguey', 56, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(778, 'Ciego de Avila', 56, 1, '2018-07-20 12:53:15', '2018-07-20 12:53:15'),
(779, 'Cienfuegos', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(780, 'Ciudad de la Habana', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(781, 'Granma', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(782, 'Guantanamo', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(783, 'Habana', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(784, 'Holguin', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(785, 'Isla de la Juventud', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(786, 'La Habana', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(787, 'Las Tunas', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(788, 'Matanzas', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(789, 'Pinar del Rio', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(790, 'Sancti Spiritus', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(791, 'Santiago de Cuba', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(792, 'Villa Clara', 56, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(793, 'Government controlled area', 57, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(794, 'Limassol', 57, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(795, 'Nicosia District', 57, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(796, 'Paphos', 57, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(797, 'Turkish controlled area', 57, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(798, 'Central Bohemian', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(799, 'Frycovice', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(800, 'Jihocesky Kraj', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(801, 'Jihochesky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(802, 'Jihomoravsky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(803, 'Karlovarsky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(804, 'Klecany', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(805, 'Kralovehradecky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(806, 'Liberecky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(807, 'Lipov', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(808, 'Moravskoslezsky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(809, 'Olomoucky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(810, 'Olomoucky Kraj', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(811, 'Pardubicky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(812, 'Plzensky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(813, 'Praha', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(814, 'Rajhrad', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(815, 'Smirice', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(816, 'South Moravian', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(817, 'Straz nad Nisou', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(818, 'Stredochesky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(819, 'Unicov', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(820, 'Ustecky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(821, 'Valletta', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(822, 'Velesin', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(823, 'Vysochina', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(824, 'Zlinsky', 58, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(825, 'Arhus', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(826, 'Bornholm', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(827, 'Frederiksborg', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(828, 'Fyn', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(829, 'Hovedstaden', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(830, 'Kobenhavn', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(831, 'Kobenhavns Amt', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(832, 'Kobenhavns Kommune', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(833, 'Nordjylland', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(834, 'Ribe', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(835, 'Ringkobing', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(836, 'Roervig', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(837, 'Roskilde', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(838, 'Roslev', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(839, 'Sjaelland', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(840, 'Soeborg', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(841, 'Sonderjylland', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(842, 'Storstrom', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(843, 'Syddanmark', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(844, 'Toelloese', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(845, 'Vejle', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(846, 'Vestsjalland', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(847, 'Viborg', 59, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(848, 'Ali Sabih', 60, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(849, 'Dikhil', 60, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(850, 'Jibuti', 60, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(851, 'Tajurah', 60, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(852, 'Ubuk', 60, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(853, 'Saint Andrew', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(854, 'Saint David', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(855, 'Saint George', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(856, 'Saint John', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(857, 'Saint Joseph', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(858, 'Saint Luke', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(859, 'Saint Mark', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(860, 'Saint Patrick', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(861, 'Saint Paul', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(862, 'Saint Peter', 61, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(863, 'Azua', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(864, 'Bahoruco', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(865, 'Barahona', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(866, 'Dajabon', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(867, 'Distrito Nacional', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(868, 'Duarte', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(869, 'El Seybo', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(870, 'Elias Pina', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(871, 'Espaillat', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(872, 'Hato Mayor', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(873, 'Independencia', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(874, 'La Altagracia', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(875, 'La Romana', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(876, 'La Vega', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(877, 'Maria Trinidad Sanchez', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(878, 'Monsenor Nouel', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(879, 'Monte Cristi', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(880, 'Monte Plata', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(881, 'Pedernales', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(882, 'Peravia', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(883, 'Puerto Plata', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(884, 'Salcedo', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(885, 'Samana', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(886, 'San Cristobal', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(887, 'San Juan', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(888, 'San Pedro de Macoris', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(889, 'Sanchez Ramirez', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(890, 'Santiago', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(891, 'Santiago Rodriguez', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(892, 'Valverde', 62, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(893, 'Aileu', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(894, 'Ainaro', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(895, 'Ambeno', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(896, 'Baucau', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(897, 'Bobonaro', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(898, 'Cova Lima', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(899, 'Dili', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(900, 'Ermera', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(901, 'Lautem', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(902, 'Liquica', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(903, 'Manatuto', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(904, 'Manufahi', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(905, 'Viqueque', 63, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(906, 'Azuay', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(907, 'Bolivar', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(908, 'Canar', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(909, 'Carchi', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(910, 'Chimborazo', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(911, 'Cotopaxi', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(912, 'El Oro', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(913, 'Esmeraldas', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(914, 'Galapagos', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(915, 'Guayas', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(916, 'Imbabura', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(917, 'Loja', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(918, 'Los Rios', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(919, 'Manabi', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(920, 'Morona Santiago', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(921, 'Napo', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(922, 'Orellana', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(923, 'Pastaza', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(924, 'Pichincha', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(925, 'Sucumbios', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(926, 'Tungurahua', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(927, 'Zamora Chinchipe', 64, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(928, 'Aswan', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(929, 'Asyut', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(930, 'Bani Suwayf', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(931, 'Bur Said', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(932, 'Cairo', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(933, 'Dumyat', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(934, 'Kafr-ash-Shaykh', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(935, 'Matruh', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(936, 'Muhafazat ad Daqahliyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(937, 'Muhafazat al Fayyum', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(938, 'Muhafazat al Gharbiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(939, 'Muhafazat al Iskandariyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(940, 'Muhafazat al Qahirah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(941, 'Qina', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(942, 'Sawhaj', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(943, 'Sina al-Janubiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(944, 'Sina ash-Shamaliyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(945, 'ad-Daqahliyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(946, 'al-Bahr-al-Ahmar', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(947, 'al-Buhayrah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(948, 'al-Fayyum', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(949, 'al-Gharbiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(950, 'al-Iskandariyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(951, 'al-Ismailiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(952, 'al-Jizah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(953, 'al-Minufiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(954, 'al-Minya', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(955, 'al-Qahira', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(956, 'al-Qalyubiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(957, 'al-Uqsur', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(958, 'al-Wadi al-Jadid', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(959, 'as-Suways', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(960, 'ash-Sharqiyah', 65, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(961, 'Ahuachapan', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(962, 'Cabanas', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(963, 'Chalatenango', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(964, 'Cuscatlan', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(965, 'La Libertad', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(966, 'La Paz', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(967, 'La Union', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(968, 'Morazan', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(969, 'San Miguel', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(970, 'San Salvador', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(971, 'San Vicente', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(972, 'Santa Ana', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(973, 'Sonsonate', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(974, 'Usulutan', 66, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(975, 'Annobon', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(976, 'Bioko Norte', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(977, 'Bioko Sur', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(978, 'Centro Sur', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(979, 'Kie-Ntem', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(980, 'Litoral', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(981, 'Wele-Nzas', 67, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(982, 'Anseba', 68, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(983, 'Debub', 68, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(984, 'Debub-Keih-Bahri', 68, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(985, 'Gash-Barka', 68, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(986, 'Maekel', 68, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(987, 'Semien-Keih-Bahri', 68, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(988, 'Harju', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(989, 'Hiiu', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(990, 'Ida-Viru', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(991, 'Jarva', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(992, 'Jogeva', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(993, 'Laane', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(994, 'Laane-Viru', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(995, 'Parnu', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(996, 'Polva', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(997, 'Rapla', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(998, 'Saare', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(999, 'Tartu', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1000, 'Valga', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1001, 'Viljandi', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1002, 'Voru', 69, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1003, 'Addis Abeba', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1004, 'Afar', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1005, 'Amhara', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1006, 'Benishangul', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1007, 'Diredawa', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1008, 'Gambella', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1009, 'Harar', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1010, 'Jigjiga', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1011, 'Mekele', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1012, 'Oromia', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1013, 'Somali', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1014, 'Southern', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1015, 'Tigray', 70, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1016, 'Falkland Islands', 71, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1017, 'South Georgia', 71, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1018, 'Klaksvik', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1019, 'Nor ara Eysturoy', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1020, 'Nor oy', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1021, 'Sandoy', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1022, 'Streymoy', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1023, 'Su uroy', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1024, 'Sy ra Eysturoy', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1025, 'Torshavn', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1026, 'Vaga', 72, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1027, 'Central', 73, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1028, 'Eastern', 73, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1029, 'Northern', 73, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1030, 'South Pacific', 73, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1031, 'Western', 73, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1032, 'Ahvenanmaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1033, 'Etela-Karjala', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1034, 'Etela-Pohjanmaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1035, 'Etela-Savo', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1036, 'Etela-Suomen Laani', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1037, 'Ita-Suomen Laani', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1038, 'Ita-Uusimaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1039, 'Kainuu', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1040, 'Kanta-Hame', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1041, 'Keski-Pohjanmaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1042, 'Keski-Suomi', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1043, 'Kymenlaakso', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1044, 'Lansi-Suomen Laani', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1045, 'Lappi', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1046, 'Northern Savonia', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1047, 'Ostrobothnia', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1048, 'Oulun Laani', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1049, 'Paijat-Hame', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1050, 'Pirkanmaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1051, 'Pohjanmaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1052, 'Pohjois-Karjala', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1053, 'Pohjois-Pohjanmaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1054, 'Pohjois-Savo', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1055, 'Saarijarvi', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1056, 'Satakunta', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1057, 'Southern Savonia', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1058, 'Tavastia Proper', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1059, 'Uleaborgs Lan', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1060, 'Uusimaa', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1061, 'Varsinais-Suomi', 74, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1062, 'Ain', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1063, 'Aisne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1064, 'Albi Le Sequestre', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1065, 'Allier', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1066, 'Alpes-Cote dAzur', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1067, 'Alpes-Maritimes', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1068, 'Alpes-de-Haute-Provence', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1069, 'Alsace', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1070, 'Aquitaine', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1071, 'Ardeche', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1072, 'Ardennes', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1073, 'Ariege', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1074, 'Aube', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1075, 'Aude', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1076, 'Auvergne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1077, 'Aveyron', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1078, 'Bas-Rhin', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1079, 'Basse-Normandie', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1080, 'Bouches-du-Rhone', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1081, 'Bourgogne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1082, 'Bretagne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1083, 'Brittany', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1084, 'Burgundy', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1085, 'Calvados', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1086, 'Cantal', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1087, 'Cedex', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1088, 'Centre', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1089, 'Charente', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1090, 'Charente-Maritime', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1091, 'Cher', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1092, 'Correze', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1093, 'Corse-du-Sud', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1094, 'Cote-dOr', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1095, 'Cotes-dArmor', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1096, 'Creuse', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1097, 'Crolles', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1098, 'Deux-Sevres', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1099, 'Dordogne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1100, 'Doubs', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1101, 'Drome', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1102, 'Essonne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1103, 'Eure', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1104, 'Eure-et-Loir', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1105, 'Feucherolles', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1106, 'Finistere', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1107, 'Franche-Comte', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1108, 'Gard', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1109, 'Gers', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1110, 'Gironde', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1111, 'Haut-Rhin', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1112, 'Haute-Corse', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1113, 'Haute-Garonne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1114, 'Haute-Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1115, 'Haute-Marne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1116, 'Haute-Saone', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1117, 'Haute-Savoie', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1118, 'Haute-Vienne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1119, 'Hautes-Alpes', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1120, 'Hautes-Pyrenees', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1121, 'Hauts-de-Seine', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1122, 'Herault', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1123, 'Ile-de-France', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1124, 'Ille-et-Vilaine', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1125, 'Indre', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1126, 'Indre-et-Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1127, 'Isere', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1128, 'Jura', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1129, 'Klagenfurt', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1130, 'Landes', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1131, 'Languedoc-Roussillon', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1132, 'Larcay', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1133, 'Le Castellet', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1134, 'Le Creusot', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1135, 'Limousin', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1136, 'Loir-et-Cher', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1137, 'Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1138, 'Loire-Atlantique', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1139, 'Loiret', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1140, 'Lorraine', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1141, 'Lot', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1142, 'Lot-et-Garonne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1143, 'Lower Normandy', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1144, 'Lozere', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1145, 'Maine-et-Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1146, 'Manche', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1147, 'Marne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1148, 'Mayenne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1149, 'Meurthe-et-Moselle', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1150, 'Meuse', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1151, 'Midi-Pyrenees', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1152, 'Morbihan', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1153, 'Moselle', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1154, 'Nievre', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1155, 'Nord', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1156, 'Nord-Pas-de-Calais', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1157, 'Oise', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1158, 'Orne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1159, 'Paris', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1160, 'Pas-de-Calais', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1161, 'Pays de la Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1162, 'Pays-de-la-Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1163, 'Picardy', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1164, 'Puy-de-Dome', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1165, 'Pyrenees-Atlantiques', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1166, 'Pyrenees-Orientales', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1167, 'Quelmes', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1168, 'Rhone', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1169, 'Rhone-Alpes', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1170, 'Saint Ouen', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1171, 'Saint Viatre', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1172, 'Saone-et-Loire', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1173, 'Sarthe', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1174, 'Savoie', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1175, 'Seine-Maritime', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1176, 'Seine-Saint-Denis', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1177, 'Seine-et-Marne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1178, 'Somme', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1179, 'Sophia Antipolis', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1180, 'Souvans', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1181, 'Tarn', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1182, 'Tarn-et-Garonne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1183, 'Territoire de Belfort', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1184, 'Treignac', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1185, 'Upper Normandy', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1186, 'Val-dOise', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1187, 'Val-de-Marne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1188, 'Var', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1189, 'Vaucluse', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1190, 'Vellise', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1191, 'Vendee', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1192, 'Vienne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1193, 'Vosges', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1194, 'Yonne', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1195, 'Yvelines', 75, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1196, 'Cayenne', 76, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1197, 'Saint-Laurent-du-Maroni', 76, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1198, 'Iles du Vent', 77, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1199, 'Iles sous le Vent', 77, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1200, 'Marquesas', 77, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1201, 'Tuamotu', 77, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1202, 'Tubuai', 77, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1203, 'Amsterdam', 78, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1204, 'Crozet Islands', 78, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1205, 'Kerguelen', 78, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1206, 'Estuaire', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1207, 'Haut-Ogooue', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1208, 'Moyen-Ogooue', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1209, 'Ngounie', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1210, 'Nyanga', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1211, 'Ogooue-Ivindo', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1212, 'Ogooue-Lolo', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1213, 'Ogooue-Maritime', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1214, 'Woleu-Ntem', 79, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1215, 'Banjul', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1216, 'Basse', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1217, 'Brikama', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1218, 'Janjanbureh', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1219, 'Kanifing', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1220, 'Kerewan', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1221, 'Kuntaur', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1222, 'Mansakonko', 80, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1223, 'Abhasia', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1224, 'Ajaria', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1225, 'Guria', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1226, 'Imereti', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1227, 'Kaheti', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1228, 'Kvemo Kartli', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1229, 'Mcheta-Mtianeti', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1230, 'Racha', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1231, 'Samagrelo-Zemo Svaneti', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1232, 'Samche-Zhavaheti', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1233, 'Shida Kartli', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1234, 'Tbilisi', 81, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1235, 'Auvergne', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1236, 'Baden-Wurttemberg', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1237, 'Bavaria', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1238, 'Bayern', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1239, 'Beilstein Wurtt', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1240, 'Berlin', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1241, 'Brandenburg', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1242, 'Bremen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1243, 'Dreisbach', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1244, 'Freistaat Bayern', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1245, 'Hamburg', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1246, 'Hannover', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1247, 'Heroldstatt', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1248, 'Hessen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1249, 'Kortenberg', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1250, 'Laasdorf', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1251, 'Land Baden-Wurttemberg', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1252, 'Land Bayern', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1253, 'Land Brandenburg', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1254, 'Land Hessen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1255, 'Land Mecklenburg-Vorpommern', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1256, 'Land Nordrhein-Westfalen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1257, 'Land Rheinland-Pfalz', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1258, 'Land Sachsen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1259, 'Land Sachsen-Anhalt', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1260, 'Land Thuringen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1261, 'Lower Saxony', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1262, 'Mecklenburg-Vorpommern', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1263, 'Mulfingen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1264, 'Munich', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1265, 'Neubeuern', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1266, 'Niedersachsen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1267, 'Noord-Holland', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1268, 'Nordrhein-Westfalen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1269, 'North Rhine-Westphalia', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1270, 'Osterode', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1271, 'Rheinland-Pfalz', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1272, 'Rhineland-Palatinate', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1273, 'Saarland', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1274, 'Sachsen', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1275, 'Sachsen-Anhalt', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1276, 'Saxony', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1277, 'Schleswig-Holstein', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1278, 'Thuringia', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1279, 'Webling', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1280, 'Weinstrabe', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1281, 'schlobborn', 82, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1282, 'Ashanti', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1283, 'Brong-Ahafo', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1284, 'Central', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1285, 'Eastern', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1286, 'Greater Accra', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1287, 'Northern', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1288, 'Upper East', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1289, 'Upper West', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1290, 'Volta', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1291, 'Western', 83, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1292, 'Gibraltar', 84, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1293, 'Acharnes', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1294, 'Ahaia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1295, 'Aitolia kai Akarnania', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1296, 'Argolis', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1297, 'Arkadia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1298, 'Arta', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1299, 'Attica', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1300, 'Attiki', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1301, 'Ayion Oros', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1302, 'Crete', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1303, 'Dodekanisos', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1304, 'Drama', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1305, 'Evia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1306, 'Evritania', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1307, 'Evros', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1308, 'Evvoia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1309, 'Florina', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1310, 'Fokis', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1311, 'Fthiotis', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1312, 'Grevena', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1313, 'Halandri', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1314, 'Halkidiki', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1315, 'Hania', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1316, 'Heraklion', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1317, 'Hios', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1318, 'Ilia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1319, 'Imathia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1320, 'Ioannina', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1321, 'Iraklion', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1322, 'Karditsa', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1323, 'Kastoria', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1324, 'Kavala', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1325, 'Kefallinia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1326, 'Kerkira', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1327, 'Kiklades', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1328, 'Kilkis', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1329, 'Korinthia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1330, 'Kozani', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1331, 'Lakonia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1332, 'Larisa', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1333, 'Lasithi', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1334, 'Lesvos', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1335, 'Levkas', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1336, 'Magnisia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1337, 'Messinia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1338, 'Nomos Attikis', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1339, 'Nomos Zakynthou', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1340, 'Pella', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1341, 'Pieria', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1342, 'Piraios', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1343, 'Preveza', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1344, 'Rethimni', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1345, 'Rodopi', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1346, 'Samos', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1347, 'Serrai', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1348, 'Thesprotia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1349, 'Thessaloniki', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1350, 'Trikala', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1351, 'Voiotia', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1352, 'West Greece', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1353, 'Xanthi', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1354, 'Zakinthos', 85, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1355, 'Aasiaat', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1356, 'Ammassalik', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1357, 'Illoqqortoormiut', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1358, 'Ilulissat', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1359, 'Ivittuut', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1360, 'Kangaatsiaq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1361, 'Maniitsoq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1362, 'Nanortalik', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1363, 'Narsaq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1364, 'Nuuk', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1365, 'Paamiut', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1366, 'Qaanaaq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1367, 'Qaqortoq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1368, 'Qasigiannguit', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1369, 'Qeqertarsuaq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1370, 'Sisimiut', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1371, 'Udenfor kommunal inddeling', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1372, 'Upernavik', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1373, 'Uummannaq', 86, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1374, 'Carriacou-Petite Martinique', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1375, 'Saint Andrew', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1376, 'Saint Davids', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1377, 'Saint Georges', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1378, 'Saint John', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1379, 'Saint Mark', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1380, 'Saint Patrick', 87, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1381, 'Basse-Terre', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1382, 'Grande-Terre', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1383, 'Iles des Saintes', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1384, 'La Desirade', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1385, 'Marie-Galante', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1386, 'Saint Barthelemy', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1387, 'Saint Martin', 88, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1388, 'Agana Heights', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1389, 'Agat', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1390, 'Barrigada', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1391, 'Chalan-Pago-Ordot', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1392, 'Dededo', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1393, 'Hagatna', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1394, 'Inarajan', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1395, 'Mangilao', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1396, 'Merizo', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1397, 'Mongmong-Toto-Maite', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1398, 'Santa Rita', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16');
INSERT INTO `states` (`id`, `name`, `country_id`, `flag`, `created_at`, `updated_at`) VALUES
(1399, 'Sinajana', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1400, 'Talofofo', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1401, 'Tamuning', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1402, 'Yigo', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1403, 'Yona', 89, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1404, 'Alta Verapaz', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1405, 'Baja Verapaz', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1406, 'Chimaltenango', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1407, 'Chiquimula', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1408, 'El Progreso', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1409, 'Escuintla', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1410, 'Guatemala', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1411, 'Huehuetenango', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1412, 'Izabal', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1413, 'Jalapa', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1414, 'Jutiapa', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1415, 'Peten', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1416, 'Quezaltenango', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1417, 'Quiche', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1418, 'Retalhuleu', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1419, 'Sacatepequez', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1420, 'San Marcos', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1421, 'Santa Rosa', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1422, 'Solola', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1423, 'Suchitepequez', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1424, 'Totonicapan', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1425, 'Zacapa', 90, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1426, 'Alderney', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1427, 'Castel', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1428, 'Forest', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1429, 'Saint Andrew', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1430, 'Saint Martin', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1431, 'Saint Peter Port', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1432, 'Saint Pierre du Bois', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1433, 'Saint Sampson', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1434, 'Saint Saviour', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1435, 'Sark', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1436, 'Torteval', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1437, 'Vale', 91, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1438, 'Beyla', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1439, 'Boffa', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1440, 'Boke', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1441, 'Conakry', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1442, 'Coyah', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1443, 'Dabola', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1444, 'Dalaba', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1445, 'Dinguiraye', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1446, 'Faranah', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1447, 'Forecariah', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1448, 'Fria', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1449, 'Gaoual', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1450, 'Gueckedou', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1451, 'Kankan', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1452, 'Kerouane', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1453, 'Kindia', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1454, 'Kissidougou', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1455, 'Koubia', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1456, 'Koundara', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1457, 'Kouroussa', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1458, 'Labe', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1459, 'Lola', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1460, 'Macenta', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1461, 'Mali', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1462, 'Mamou', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1463, 'Mandiana', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1464, 'Nzerekore', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1465, 'Pita', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1466, 'Siguiri', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1467, 'Telimele', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1468, 'Tougue', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1469, 'Yomou', 92, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1470, 'Bafata', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1471, 'Bissau', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1472, 'Bolama', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1473, 'Cacheu', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1474, 'Gabu', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1475, 'Oio', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1476, 'Quinara', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1477, 'Tombali', 93, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1478, 'Barima-Waini', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1479, 'Cuyuni-Mazaruni', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1480, 'Demerara-Mahaica', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1481, 'East Berbice-Corentyne', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1482, 'Essequibo Islands-West Demerar', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1483, 'Mahaica-Berbice', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1484, 'Pomeroon-Supenaam', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1485, 'Potaro-Siparuni', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1486, 'Upper Demerara-Berbice', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1487, 'Upper Takutu-Upper Essequibo', 94, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1488, 'Artibonite', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1489, 'Centre', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1490, 'GrandAnse', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1491, 'Nord', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1492, 'Nord-Est', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1493, 'Nord-Ouest', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1494, 'Ouest', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1495, 'Sud', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1496, 'Sud-Est', 95, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1497, 'Heard and McDonald Islands', 96, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1498, 'Atlantida', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1499, 'Choluteca', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1500, 'Colon', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1501, 'Comayagua', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1502, 'Copan', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1503, 'Cortes', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1504, 'Distrito Central', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1505, 'El Paraiso', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1506, 'Francisco Morazan', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1507, 'Gracias a Dios', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1508, 'Intibuca', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1509, 'Islas de la Bahia', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1510, 'La Paz', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1511, 'Lempira', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1512, 'Ocotepeque', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1513, 'Olancho', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1514, 'Santa Barbara', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1515, 'Valle', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1516, 'Yoro', 97, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1517, 'Hong Kong', 98, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1518, 'Bacs-Kiskun', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1519, 'Baranya', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1520, 'Bekes', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1521, 'Borsod-Abauj-Zemplen', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1522, 'Budapest', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1523, 'Csongrad', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1524, 'Fejer', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1525, 'Gyor-Moson-Sopron', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1526, 'Hajdu-Bihar', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1527, 'Heves', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1528, 'Jasz-Nagykun-Szolnok', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1529, 'Komarom-Esztergom', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1530, 'Nograd', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1531, 'Pest', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1532, 'Somogy', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1533, 'Szabolcs-Szatmar-Bereg', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1534, 'Tolna', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1535, 'Vas', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1536, 'Veszprem', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1537, 'Zala', 99, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1538, 'Austurland', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1539, 'Gullbringusysla', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1540, 'Hofu borgarsva i', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1541, 'Nor urland eystra', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1542, 'Nor urland vestra', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1543, 'Su urland', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1544, 'Su urnes', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1545, 'Vestfir ir', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1546, 'Vesturland', 100, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1547, 'Andaman and Nicobar Islands', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1548, 'Andhra Pradesh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1549, 'Arunachal Pradesh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1550, 'Assam', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1551, 'Bihar', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1552, 'Chandigarh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1553, 'Chhattisgarh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1554, 'Dadra and Nagar Haveli', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1555, 'Daman and Diu', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1556, 'Delhi', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1557, 'Goa', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1558, 'Gujarat', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1559, 'Haryana', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1560, 'Himachal Pradesh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1561, 'Jammu and Kashmir', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1562, 'Jharkhand', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1563, 'Karnataka', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1564, 'Kenmore', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1565, 'Kerala', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1566, 'Lakshadweep', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1567, 'Madhya Pradesh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1568, 'Maharashtra', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1569, 'Manipur', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1570, 'Meghalaya', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1571, 'Mizoram', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1572, 'Nagaland', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1573, 'Narora', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1574, 'Natwar', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1575, 'Odisha', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1576, 'Paschim Medinipur', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1577, 'Pondicherry', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1578, 'Punjab', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1579, 'Rajasthan', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1580, 'Sikkim', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1581, 'Tamil Nadu', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1582, 'Telangana', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1583, 'Tripura', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1584, 'Uttar Pradesh', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1585, 'Uttarakhand', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1586, 'Vaishali', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1587, 'West Bengal', 101, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1588, 'Aceh', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1589, 'Bali', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1590, 'Bangka-Belitung', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1591, 'Banten', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1592, 'Bengkulu', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1593, 'Gandaria', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1594, 'Gorontalo', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1595, 'Jakarta', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1596, 'Jambi', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1597, 'Jawa Barat', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1598, 'Jawa Tengah', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1599, 'Jawa Timur', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1600, 'Kalimantan Barat', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1601, 'Kalimantan Selatan', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1602, 'Kalimantan Tengah', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1603, 'Kalimantan Timur', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1604, 'Kendal', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1605, 'Lampung', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1606, 'Maluku', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1607, 'Maluku Utara', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1608, 'Nusa Tenggara Barat', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1609, 'Nusa Tenggara Timur', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1610, 'Papua', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1611, 'Riau', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1612, 'Riau Kepulauan', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1613, 'Solo', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1614, 'Sulawesi Selatan', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1615, 'Sulawesi Tengah', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1616, 'Sulawesi Tenggara', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1617, 'Sulawesi Utara', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1618, 'Sumatera Barat', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1619, 'Sumatera Selatan', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1620, 'Sumatera Utara', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1621, 'Yogyakarta', 102, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1622, 'Ardabil', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1623, 'Azarbayjan-e Bakhtari', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1624, 'Azarbayjan-e Khavari', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1625, 'Bushehr', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1626, 'Chahar Mahal-e Bakhtiari', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1627, 'Esfahan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1628, 'Fars', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1629, 'Gilan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1630, 'Golestan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1631, 'Hamadan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1632, 'Hormozgan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1633, 'Ilam', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1634, 'Kerman', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1635, 'Kermanshah', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1636, 'Khorasan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1637, 'Khuzestan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1638, 'Kohgiluyeh-e Boyerahmad', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1639, 'Kordestan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1640, 'Lorestan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1641, 'Markazi', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1642, 'Mazandaran', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1643, 'Ostan-e Esfahan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1644, 'Qazvin', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1645, 'Qom', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1646, 'Semnan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1647, 'Sistan-e Baluchestan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1648, 'Tehran', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1649, 'Yazd', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1650, 'Zanjan', 103, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1651, 'Babil', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1652, 'Baghdad', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1653, 'Dahuk', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1654, 'Dhi Qar', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1655, 'Diyala', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1656, 'Erbil', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1657, 'Irbil', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1658, 'Karbala', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1659, 'Kurdistan', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1660, 'Maysan', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1661, 'Ninawa', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1662, 'Salah-ad-Din', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1663, 'Wasit', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1664, 'al-Anbar', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1665, 'al-Basrah', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1666, 'al-Muthanna', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1667, 'al-Qadisiyah', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1668, 'an-Najaf', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1669, 'as-Sulaymaniyah', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1670, 'at-Tamim', 104, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1671, 'Armagh', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1672, 'Carlow', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1673, 'Cavan', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1674, 'Clare', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1675, 'Cork', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1676, 'Donegal', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1677, 'Dublin', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1678, 'Galway', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1679, 'Kerry', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1680, 'Kildare', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1681, 'Kilkenny', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1682, 'Laois', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1683, 'Leinster', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1684, 'Leitrim', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1685, 'Limerick', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1686, 'Loch Garman', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1687, 'Longford', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1688, 'Louth', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1689, 'Mayo', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1690, 'Meath', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1691, 'Monaghan', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1692, 'Offaly', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1693, 'Roscommon', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1694, 'Sligo', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1695, 'Tipperary North Riding', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1696, 'Tipperary South Riding', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1697, 'Ulster', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1698, 'Waterford', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1699, 'Westmeath', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1700, 'Wexford', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1701, 'Wicklow', 105, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1702, 'Beit Hanania', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1703, 'Ben Gurion Airport', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1704, 'Bethlehem', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1705, 'Caesarea', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1706, 'Centre', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1707, 'Gaza', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1708, 'Hadaron', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1709, 'Haifa District', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1710, 'Hamerkaz', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1711, 'Hazafon', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1712, 'Hebron', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1713, 'Jaffa', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1714, 'Jerusalem', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1715, 'Khefa', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1716, 'Kiryat Yam', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1717, 'Lower Galilee', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1718, 'Qalqilya', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1719, 'Talme Elazar', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1720, 'Tel Aviv', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1721, 'Tsafon', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1722, 'Umm El Fahem', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1723, 'Yerushalayim', 106, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1724, 'Abruzzi', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1725, 'Abruzzo', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1726, 'Agrigento', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1727, 'Alessandria', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1728, 'Ancona', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1729, 'Arezzo', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1730, 'Ascoli Piceno', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1731, 'Asti', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1732, 'Avellino', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1733, 'Bari', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1734, 'Basilicata', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1735, 'Belluno', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1736, 'Benevento', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1737, 'Bergamo', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1738, 'Biella', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1739, 'Bologna', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1740, 'Bolzano', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1741, 'Brescia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1742, 'Brindisi', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1743, 'Calabria', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1744, 'Campania', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1745, 'Cartoceto', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1746, 'Caserta', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1747, 'Catania', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1748, 'Chieti', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1749, 'Como', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1750, 'Cosenza', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1751, 'Cremona', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1752, 'Cuneo', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1753, 'Emilia-Romagna', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1754, 'Ferrara', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1755, 'Firenze', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1756, 'Florence', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1757, 'Forli-Cesena ', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1758, 'Friuli-Venezia Giulia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1759, 'Frosinone', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1760, 'Genoa', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1761, 'Gorizia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1762, 'LAquila', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1763, 'Lazio', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1764, 'Lecce', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1765, 'Lecco', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1766, 'Lecco Province', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1767, 'Liguria', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1768, 'Lodi', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1769, 'Lombardia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1770, 'Lombardy', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1771, 'Macerata', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1772, 'Mantova', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1773, 'Marche', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1774, 'Messina', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1775, 'Milan', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1776, 'Modena', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1777, 'Molise', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1778, 'Molteno', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1779, 'Montenegro', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1780, 'Monza and Brianza', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1781, 'Naples', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1782, 'Novara', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1783, 'Padova', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1784, 'Parma', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1785, 'Pavia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1786, 'Perugia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1787, 'Pesaro-Urbino', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1788, 'Piacenza', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1789, 'Piedmont', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1790, 'Piemonte', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1791, 'Pisa', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1792, 'Pordenone', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1793, 'Potenza', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1794, 'Puglia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1795, 'Reggio Emilia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1796, 'Rimini', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1797, 'Roma', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1798, 'Salerno', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1799, 'Sardegna', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1800, 'Sassari', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1801, 'Savona', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1802, 'Sicilia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1803, 'Siena', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1804, 'Sondrio', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1805, 'South Tyrol', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1806, 'Taranto', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1807, 'Teramo', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1808, 'Torino', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1809, 'Toscana', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1810, 'Trapani', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1811, 'Trentino-Alto Adige', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1812, 'Trento', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1813, 'Treviso', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1814, 'Udine', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1815, 'Umbria', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1816, 'Valle dAosta', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1817, 'Varese', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1818, 'Veneto', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1819, 'Venezia', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1820, 'Verbano-Cusio-Ossola', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1821, 'Vercelli', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1822, 'Verona', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1823, 'Vicenza', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1824, 'Viterbo', 107, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1825, 'Buxoro Viloyati', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1826, 'Clarendon', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1827, 'Hanover', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1828, 'Kingston', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1829, 'Manchester', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1830, 'Portland', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1831, 'Saint Andrews', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1832, 'Saint Ann', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1833, 'Saint Catherine', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1834, 'Saint Elizabeth', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1835, 'Saint James', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1836, 'Saint Mary', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1837, 'Saint Thomas', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1838, 'Trelawney', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1839, 'Westmoreland', 108, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1840, 'Aichi', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1841, 'Akita', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1842, 'Aomori', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1843, 'Chiba', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1844, 'Ehime', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1845, 'Fukui', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1846, 'Fukuoka', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1847, 'Fukushima', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1848, 'Gifu', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1849, 'Gumma', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1850, 'Hiroshima', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1851, 'Hokkaido', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1852, 'Hyogo', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1853, 'Ibaraki', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1854, 'Ishikawa', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1855, 'Iwate', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1856, 'Kagawa', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1857, 'Kagoshima', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1858, 'Kanagawa', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1859, 'Kanto', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1860, 'Kochi', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1861, 'Kumamoto', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1862, 'Kyoto', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1863, 'Mie', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1864, 'Miyagi', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1865, 'Miyazaki', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1866, 'Nagano', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1867, 'Nagasaki', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1868, 'Nara', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1869, 'Niigata', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1870, 'Oita', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1871, 'Okayama', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1872, 'Okinawa', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1873, 'Osaka', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1874, 'Saga', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1875, 'Saitama', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1876, 'Shiga', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1877, 'Shimane', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1878, 'Shizuoka', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1879, 'Tochigi', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1880, 'Tokushima', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1881, 'Tokyo', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1882, 'Tottori', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1883, 'Toyama', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1884, 'Wakayama', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1885, 'Yamagata', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1886, 'Yamaguchi', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1887, 'Yamanashi', 109, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1888, 'Grouville', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1889, 'Saint Brelade', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1890, 'Saint Clement', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1891, 'Saint Helier', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1892, 'Saint John', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1893, 'Saint Lawrence', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1894, 'Saint Martin', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1895, 'Saint Mary', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1896, 'Saint Peter', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1897, 'Saint Saviour', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1898, 'Trinity', 110, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1899, 'Ajlun', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1900, 'Amman', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1901, 'Irbid', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1902, 'Jarash', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1903, 'Maan', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1904, 'Madaba', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1905, 'al-Aqabah', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1906, 'al-Balqa', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1907, 'al-Karak', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1908, 'al-Mafraq', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1909, 'at-Tafilah', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1910, 'az-Zarqa', 111, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1911, 'Akmecet', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1912, 'Akmola', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1913, 'Aktobe', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1914, 'Almati', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1915, 'Atirau', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1916, 'Batis Kazakstan', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1917, 'Burlinsky Region', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1918, 'Karagandi', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1919, 'Kostanay', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1920, 'Mankistau', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1921, 'Ontustik Kazakstan', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1922, 'Pavlodar', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1923, 'Sigis Kazakstan', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1924, 'Soltustik Kazakstan', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1925, 'Taraz', 112, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1926, 'Central', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1927, 'Coast', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1928, 'Eastern', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1929, 'Nairobi', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1930, 'North Eastern', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1931, 'Nyanza', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1932, 'Rift Valley', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1933, 'Western', 113, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1934, 'Abaiang', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1935, 'Abemana', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1936, 'Aranuka', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1937, 'Arorae', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1938, 'Banaba', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1939, 'Beru', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1940, 'Butaritari', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1941, 'Kiritimati', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1942, 'Kuria', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1943, 'Maiana', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1944, 'Makin', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1945, 'Marakei', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1946, 'Nikunau', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1947, 'Nonouti', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1948, 'Onotoa', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1949, 'Phoenix Islands', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1950, 'Tabiteuea North', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1951, 'Tabiteuea South', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1952, 'Tabuaeran', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1953, 'Tamana', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1954, 'Tarawa North', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1955, 'Tarawa South', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1956, 'Teraina', 114, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1957, 'Busan', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1958, 'Cheju', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1959, 'Chollabuk', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1960, 'Chollanam', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1961, 'Chungbuk', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1962, 'Chungcheongbuk', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1963, 'Chungcheongnam', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1964, 'Chungnam', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1965, 'Daegu', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1966, 'Gangwon-do', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1967, 'Goyang-si', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1968, 'Gyeonggi-do', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1969, 'Gyeongsang ', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1970, 'Gyeongsangnam-do', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1971, 'Incheon', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1972, 'Jeju-Si', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1973, 'Jeonbuk', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1974, 'Kangweon', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1975, 'Kwangju', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1976, 'Kyeonggi', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1977, 'Kyeongsangbuk', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1978, 'Kyeongsangnam', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1979, 'Kyonggi-do', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1980, 'Kyungbuk-Do', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1981, 'Kyunggi-Do', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1982, 'Pusan', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1983, 'Seoul', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1984, 'Sudogwon', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1985, 'Taegu', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1986, 'Taejeon', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1987, 'Taejon-gwangyoksi', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1988, 'Ulsan', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1989, 'Wonju', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1990, 'gwangyoksi', 116, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1991, 'Al Asimah', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1992, 'Hawalli', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1993, 'Mishref', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1994, 'Qadesiya', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1995, 'Safat', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1996, 'Salmiya', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1997, 'al-Ahmadi', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1998, 'al-Farwaniyah', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(1999, 'al-Jahra', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2000, 'al-Kuwayt', 117, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2001, 'Batken', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2002, 'Bishkek', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2003, 'Chui', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2004, 'Issyk-Kul', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2005, 'Jalal-Abad', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2006, 'Naryn', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2007, 'Osh', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2008, 'Talas', 118, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2009, 'Attopu', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2010, 'Bokeo', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2011, 'Bolikhamsay', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2012, 'Champasak', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2013, 'Houaphanh', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2014, 'Khammouane', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2015, 'Luang Nam Tha', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2016, 'Luang Prabang', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2017, 'Oudomxay', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2018, 'Phongsaly', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2019, 'Saravan', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2020, 'Savannakhet', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2021, 'Sekong', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2022, 'Viangchan Prefecture', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2023, 'Viangchan Province', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2024, 'Xaignabury', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2025, 'Xiang Khuang', 119, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2026, 'Aizkraukles', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2027, 'Aluksnes', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2028, 'Balvu', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2029, 'Bauskas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2030, 'Cesu', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2031, 'Daugavpils', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2032, 'Daugavpils City', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2033, 'Dobeles', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2034, 'Gulbenes', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2035, 'Jekabspils', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2036, 'Jelgava', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2037, 'Jelgavas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2038, 'Jurmala City', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2039, 'Kraslavas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2040, 'Kuldigas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2041, 'Liepaja', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2042, 'Liepajas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2043, 'Limbazhu', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2044, 'Ludzas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2045, 'Madonas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2046, 'Ogres', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2047, 'Preilu', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2048, 'Rezekne', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2049, 'Rezeknes', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2050, 'Riga', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2051, 'Rigas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2052, 'Saldus', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2053, 'Talsu', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2054, 'Tukuma', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2055, 'Valkas', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2056, 'Valmieras', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2057, 'Ventspils', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2058, 'Ventspils City', 120, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2059, 'Beirut', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2060, 'Jabal Lubnan', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2061, 'Mohafazat Liban-Nord', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2062, 'Mohafazat Mont-Liban', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2063, 'Sidon', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2064, 'al-Biqa', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2065, 'al-Janub', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2066, 'an-Nabatiyah', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2067, 'ash-Shamal', 121, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2068, 'Berea', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2069, 'Butha-Buthe', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2070, 'Leribe', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2071, 'Mafeteng', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2072, 'Maseru', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2073, 'Mohales Hoek', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2074, 'Mokhotlong', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2075, 'Qachas Nek', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2076, 'Quthing', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2077, 'Thaba-Tseka', 122, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2078, 'Bomi', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2079, 'Bong', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2080, 'Grand Bassa', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2081, 'Grand Cape Mount', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2082, 'Grand Gedeh', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2083, 'Loffa', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2084, 'Margibi', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2085, 'Maryland and Grand Kru', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16');
INSERT INTO `states` (`id`, `name`, `country_id`, `flag`, `created_at`, `updated_at`) VALUES
(2086, 'Montserrado', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2087, 'Nimba', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2088, 'Rivercess', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2089, 'Sinoe', 123, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2090, 'Ajdabiya', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2091, 'Banghazi', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2092, 'Darnah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2093, 'Ghadamis', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2094, 'Gharyan', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2095, 'Misratah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2096, 'Murzuq', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2097, 'Sabha', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2098, 'Sawfajjin', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2099, 'Surt', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2100, 'Tarabulus', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2101, 'Tarhunah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2102, 'Tripolitania', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2103, 'Tubruq', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2104, 'Yafran', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2105, 'Zlitan', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2106, 'al-Aziziyah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2107, 'al-Fatih', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2108, 'al-Jabal al Akhdar', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2109, 'al-Jufrah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2110, 'al-Khums', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2111, 'al-Kufrah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2112, 'an-Nuqat al-Khams', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2113, 'ash-Shati', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2114, 'az-Zawiyah', 124, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2115, 'Balzers', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2116, 'Eschen', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2117, 'Gamprin', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2118, 'Mauren', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2119, 'Planken', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2120, 'Ruggell', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2121, 'Schaan', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2122, 'Schellenberg', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2123, 'Triesen', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2124, 'Triesenberg', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2125, 'Vaduz', 125, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2126, 'Alytaus', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2127, 'Anyksciai', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2128, 'Kauno', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2129, 'Klaipedos', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2130, 'Marijampoles', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2131, 'Panevezhio', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2132, 'Panevezys', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2133, 'Shiauliu', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2134, 'Taurages', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2135, 'Telshiu', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2136, 'Telsiai', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2137, 'Utenos', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2138, 'Vilniaus', 126, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2139, 'Capellen', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2140, 'Clervaux', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2141, 'Diekirch', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2142, 'Echternach', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2143, 'Esch-sur-Alzette', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2144, 'Grevenmacher', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2145, 'Luxembourg', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2146, 'Mersch', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2147, 'Redange', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2148, 'Remich', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2149, 'Vianden', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2150, 'Wiltz', 127, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2151, 'Macau', 128, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2152, 'Berovo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2153, 'Bitola', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2154, 'Brod', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2155, 'Debar', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2156, 'Delchevo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2157, 'Demir Hisar', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2158, 'Gevgelija', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2159, 'Gostivar', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2160, 'Kavadarci', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2161, 'Kichevo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2162, 'Kochani', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2163, 'Kratovo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2164, 'Kriva Palanka', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2165, 'Krushevo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2166, 'Kumanovo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2167, 'Negotino', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2168, 'Ohrid', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2169, 'Prilep', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2170, 'Probishtip', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2171, 'Radovish', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2172, 'Resen', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2173, 'Shtip', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2174, 'Skopje', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2175, 'Struga', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2176, 'Strumica', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2177, 'Sveti Nikole', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2178, 'Tetovo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2179, 'Valandovo', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2180, 'Veles', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2181, 'Vinica', 129, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2182, 'Antananarivo', 130, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2183, 'Antsiranana', 130, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2184, 'Fianarantsoa', 130, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2185, 'Mahajanga', 130, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2186, 'Toamasina', 130, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2187, 'Toliary', 130, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2188, 'Balaka', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2189, 'Blantyre City', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2190, 'Chikwawa', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2191, 'Chiradzulu', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2192, 'Chitipa', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2193, 'Dedza', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2194, 'Dowa', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2195, 'Karonga', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2196, 'Kasungu', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2197, 'Lilongwe City', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2198, 'Machinga', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2199, 'Mangochi', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2200, 'Mchinji', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2201, 'Mulanje', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2202, 'Mwanza', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2203, 'Mzimba', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2204, 'Mzuzu City', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2205, 'Nkhata Bay', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2206, 'Nkhotakota', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2207, 'Nsanje', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2208, 'Ntcheu', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2209, 'Ntchisi', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2210, 'Phalombe', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2211, 'Rumphi', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2212, 'Salima', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2213, 'Thyolo', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2214, 'Zomba Municipality', 131, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2215, 'Johor', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2216, 'Kedah', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2217, 'Kelantan', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2218, 'Kuala Lumpur', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2219, 'Labuan', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2220, 'Melaka', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2221, 'Negeri Johor', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2222, 'Negeri Sembilan', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2223, 'Pahang', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2224, 'Penang', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2225, 'Perak', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2226, 'Perlis', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2227, 'Pulau Pinang', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2228, 'Sabah', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2229, 'Sarawak', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2230, 'Selangor', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2231, 'Sembilan', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2232, 'Terengganu', 132, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2233, 'Alif Alif', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2234, 'Alif Dhaal', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2235, 'Baa', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2236, 'Dhaal', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2237, 'Faaf', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2238, 'Gaaf Alif', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2239, 'Gaaf Dhaal', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2240, 'Ghaviyani', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2241, 'Haa Alif', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2242, 'Haa Dhaal', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2243, 'Kaaf', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2244, 'Laam', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2245, 'Lhaviyani', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2246, 'Male', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2247, 'Miim', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2248, 'Nuun', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2249, 'Raa', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2250, 'Shaviyani', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2251, 'Siin', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2252, 'Thaa', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2253, 'Vaav', 133, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2254, 'Bamako', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2255, 'Gao', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2256, 'Kayes', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2257, 'Kidal', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2258, 'Koulikoro', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2259, 'Mopti', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2260, 'Segou', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2261, 'Sikasso', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2262, 'Tombouctou', 134, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2263, 'Gozo and Comino', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2264, 'Inner Harbour', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2265, 'Northern', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2266, 'Outer Harbour', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2267, 'South Eastern', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2268, 'Valletta', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2269, 'Western', 135, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2270, 'Castletown', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2271, 'Douglas', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2272, 'Laxey', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2273, 'Onchan', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2274, 'Peel', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2275, 'Port Erin', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2276, 'Port Saint Mary', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2277, 'Ramsey', 136, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2278, 'Ailinlaplap', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2279, 'Ailuk', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2280, 'Arno', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2281, 'Aur', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2282, 'Bikini', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2283, 'Ebon', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2284, 'Enewetak', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2285, 'Jabat', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2286, 'Jaluit', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2287, 'Kili', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2288, 'Kwajalein', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2289, 'Lae', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2290, 'Lib', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2291, 'Likiep', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2292, 'Majuro', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2293, 'Maloelap', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2294, 'Mejit', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2295, 'Mili', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2296, 'Namorik', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2297, 'Namu', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2298, 'Rongelap', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2299, 'Ujae', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2300, 'Utrik', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2301, 'Wotho', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2302, 'Wotje', 137, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2303, 'Fort-de-France', 138, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2304, 'La Trinite', 138, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2305, 'Le Marin', 138, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2306, 'Saint-Pierre', 138, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2307, 'Adrar', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2308, 'Assaba', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2309, 'Brakna', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2310, 'Dhakhlat Nawadibu', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2311, 'Hudh-al-Gharbi', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2312, 'Hudh-ash-Sharqi', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2313, 'Inshiri', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2314, 'Nawakshut', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2315, 'Qidimagha', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2316, 'Qurqul', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2317, 'Taqant', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2318, 'Tiris Zammur', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2319, 'Trarza', 139, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2320, 'Black River', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2321, 'Eau Coulee', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2322, 'Flacq', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2323, 'Floreal', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2324, 'Grand Port', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2325, 'Moka', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2326, 'Pamplempousses', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2327, 'Plaines Wilhelm', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2328, 'Port Louis', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2329, 'Riviere du Rempart', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2330, 'Rodrigues', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2331, 'Rose Hill', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2332, 'Savanne', 140, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2333, 'Mayotte', 141, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2334, 'Pamanzi', 141, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2335, 'Aguascalientes', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2336, 'Baja California', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2337, 'Baja California Sur', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2338, 'Campeche', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2339, 'Chiapas', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2340, 'Chihuahua', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2341, 'Coahuila', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2342, 'Colima', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2343, 'Distrito Federal', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2344, 'Durango', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2345, 'Estado de Mexico', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2346, 'Guanajuato', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2347, 'Guerrero', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2348, 'Hidalgo', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2349, 'Jalisco', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2350, 'Mexico', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2351, 'Michoacan', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2352, 'Morelos', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2353, 'Nayarit', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2354, 'Nuevo Leon', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2355, 'Oaxaca', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2356, 'Puebla', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2357, 'Queretaro', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2358, 'Quintana Roo', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2359, 'San Luis Potosi', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2360, 'Sinaloa', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2361, 'Sonora', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2362, 'Tabasco', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2363, 'Tamaulipas', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2364, 'Tlaxcala', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2365, 'Veracruz', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2366, 'Yucatan', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2367, 'Zacatecas', 142, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2368, 'Chuuk', 143, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2369, 'Kusaie', 143, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2370, 'Pohnpei', 143, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2371, 'Yap', 143, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2372, 'Balti', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2373, 'Cahul', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2374, 'Chisinau', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2375, 'Chisinau Oras', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2376, 'Edinet', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2377, 'Gagauzia', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2378, 'Lapusna', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2379, 'Orhei', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2380, 'Soroca', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2381, 'Taraclia', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2382, 'Tighina', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2383, 'Transnistria', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2384, 'Ungheni', 144, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2385, 'Fontvieille', 145, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2386, 'La Condamine', 145, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2387, 'Monaco-Ville', 145, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2388, 'Monte Carlo', 145, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2389, 'Arhangaj', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2390, 'Bajan-Olgij', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2391, 'Bajanhongor', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2392, 'Bulgan', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2393, 'Darhan-Uul', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2394, 'Dornod', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2395, 'Dornogovi', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2396, 'Dundgovi', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2397, 'Govi-Altaj', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2398, 'Govisumber', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2399, 'Hentij', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2400, 'Hovd', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2401, 'Hovsgol', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2402, 'Omnogovi', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2403, 'Orhon', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2404, 'Ovorhangaj', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2405, 'Selenge', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2406, 'Suhbaatar', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2407, 'Tov', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2408, 'Ulaanbaatar', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2409, 'Uvs', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2410, 'Zavhan', 146, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2411, 'Montserrat', 148, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2412, 'Agadir', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2413, 'Casablanca', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2414, 'Chaouia-Ouardigha', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2415, 'Doukkala-Abda', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2416, 'Fes-Boulemane', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2417, 'Gharb-Chrarda-Beni Hssen', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2418, 'Guelmim', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2419, 'Kenitra', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2420, 'Marrakech-Tensift-Al Haouz', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2421, 'Meknes-Tafilalet', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2422, 'Oriental', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2423, 'Oujda', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2424, 'Province de Tanger', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2425, 'Rabat-Sale-Zammour-Zaer', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2426, 'Sala Al Jadida', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2427, 'Settat', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2428, 'Souss Massa-Draa', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2429, 'Tadla-Azilal', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2430, 'Tangier-Tetouan', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2431, 'Taza-Al Hoceima-Taounate', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2432, 'Wilaya de Casablanca', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2433, 'Wilaya de Rabat-Sale', 149, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2434, 'Cabo Delgado', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2435, 'Gaza', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2436, 'Inhambane', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2437, 'Manica', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2438, 'Maputo', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2439, 'Maputo Provincia', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2440, 'Nampula', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2441, 'Niassa', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2442, 'Sofala', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2443, 'Tete', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2444, 'Zambezia', 150, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2445, 'Ayeyarwady', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2446, 'Bago', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2447, 'Chin', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2448, 'Kachin', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2449, 'Kayah', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2450, 'Kayin', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2451, 'Magway', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2452, 'Mandalay', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2453, 'Mon', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2454, 'Nay Pyi Taw', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2455, 'Rakhine', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2456, 'Sagaing', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2457, 'Shan', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2458, 'Tanintharyi', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2459, 'Yangon', 151, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2460, 'Caprivi', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2461, 'Erongo', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2462, 'Hardap', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2463, 'Karas', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2464, 'Kavango', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2465, 'Khomas', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2466, 'Kunene', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2467, 'Ohangwena', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2468, 'Omaheke', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2469, 'Omusati', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2470, 'Oshana', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2471, 'Oshikoto', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2472, 'Otjozondjupa', 152, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2473, 'Yaren', 153, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2474, 'Bagmati', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2475, 'Bheri', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2476, 'Dhawalagiri', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2477, 'Gandaki', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2478, 'Janakpur', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2479, 'Karnali', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2480, 'Koshi', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2481, 'Lumbini', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2482, 'Mahakali', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2483, 'Mechi', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2484, 'Narayani', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2485, 'Rapti', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2486, 'Sagarmatha', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2487, 'Seti', 154, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2488, 'Bonaire', 155, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2489, 'Curacao', 155, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2490, 'Saba', 155, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2491, 'Sint Eustatius', 155, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2492, 'Sint Maarten', 155, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2493, 'Amsterdam', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2494, 'Benelux', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2495, 'Drenthe', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2496, 'Flevoland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2497, 'Friesland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2498, 'Gelderland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2499, 'Groningen', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2500, 'Limburg', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2501, 'Noord-Brabant', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2502, 'Noord-Holland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2503, 'Overijssel', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2504, 'South Holland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2505, 'Utrecht', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2506, 'Zeeland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2507, 'Zuid-Holland', 156, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2508, 'Iles', 157, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2509, 'Nord', 157, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2510, 'Sud', 157, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2511, 'Area Outside Region', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2512, 'Auckland', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2513, 'Bay of Plenty', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2514, 'Canterbury', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2515, 'Christchurch', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2516, 'Gisborne', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2517, 'Hawkes Bay', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2518, 'Manawatu-Wanganui', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2519, 'Marlborough', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2520, 'Nelson', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2521, 'Northland', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2522, 'Otago', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2523, 'Rodney', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2524, 'Southland', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2525, 'Taranaki', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2526, 'Tasman', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2527, 'Waikato', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2528, 'Wellington', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2529, 'West Coast', 158, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2530, 'Atlantico Norte', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2531, 'Atlantico Sur', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2532, 'Boaco', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2533, 'Carazo', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2534, 'Chinandega', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2535, 'Chontales', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2536, 'Esteli', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2537, 'Granada', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2538, 'Jinotega', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2539, 'Leon', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2540, 'Madriz', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2541, 'Managua', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2542, 'Masaya', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2543, 'Matagalpa', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2544, 'Nueva Segovia', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2545, 'Rio San Juan', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2546, 'Rivas', 159, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2547, 'Agadez', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2548, 'Diffa', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2549, 'Dosso', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2550, 'Maradi', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2551, 'Niamey', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2552, 'Tahoua', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2553, 'Tillabery', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2554, 'Zinder', 160, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2555, 'Abia', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2556, 'Abuja Federal Capital Territor', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2557, 'Adamawa', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2558, 'Akwa Ibom', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2559, 'Anambra', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2560, 'Bauchi', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2561, 'Bayelsa', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2562, 'Benue', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2563, 'Borno', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2564, 'Cross River', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2565, 'Delta', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2566, 'Ebonyi', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2567, 'Edo', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2568, 'Ekiti', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2569, 'Enugu', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2570, 'Gombe', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2571, 'Imo', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2572, 'Jigawa', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2573, 'Kaduna', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2574, 'Kano', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2575, 'Katsina', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2576, 'Kebbi', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2577, 'Kogi', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2578, 'Kwara', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2579, 'Lagos', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2580, 'Nassarawa', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2581, 'Niger', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2582, 'Ogun', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2583, 'Ondo', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2584, 'Osun', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2585, 'Oyo', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2586, 'Plateau', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2587, 'Rivers', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2588, 'Sokoto', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2589, 'Taraba', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2590, 'Yobe', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2591, 'Zamfara', 161, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2592, 'Niue', 162, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2593, 'Norfolk Island', 163, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2594, 'Northern Islands', 164, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2595, 'Rota', 164, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2596, 'Saipan', 164, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2597, 'Tinian', 164, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2598, 'Akershus', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2599, 'Aust Agder', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2600, 'Bergen', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2601, 'Buskerud', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2602, 'Finnmark', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2603, 'Hedmark', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2604, 'Hordaland', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2605, 'Moere og Romsdal', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2606, 'Nord Trondelag', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2607, 'Nordland', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2608, 'Oestfold', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2609, 'Oppland', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2610, 'Oslo', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2611, 'Rogaland', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2612, 'Soer Troendelag', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2613, 'Sogn og Fjordane', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2614, 'Stavern', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2615, 'Sykkylven', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2616, 'Telemark', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2617, 'Troms', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2618, 'Vest Agder', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2619, 'Vestfold', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2620, 'ÃƒÂƒÃ†Â’ÃƒÂ‚Ã‹Âœstfold', 165, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2621, 'Al Buraimi', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2622, 'Dhufar', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2623, 'Masqat', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2624, 'Musandam', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2625, 'Rusayl', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2626, 'Wadi Kabir', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2627, 'ad-Dakhiliyah', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2628, 'adh-Dhahirah', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2629, 'al-Batinah', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2630, 'ash-Sharqiyah', 166, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2631, 'Baluchistan', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2632, 'Federal Capital Area', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2633, 'Federally administered Tribal ', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2634, 'North-West Frontier', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2635, 'Northern Areas', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2636, 'Punjab', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2637, 'Sind', 167, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2638, 'Aimeliik', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2639, 'Airai', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2640, 'Angaur', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2641, 'Hatobohei', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2642, 'Kayangel', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2643, 'Koror', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2644, 'Melekeok', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2645, 'Ngaraard', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2646, 'Ngardmau', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2647, 'Ngaremlengui', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2648, 'Ngatpang', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2649, 'Ngchesar', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2650, 'Ngerchelong', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2651, 'Ngiwal', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2652, 'Peleliu', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2653, 'Sonsorol', 168, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2654, 'Ariha', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2655, 'Bayt Lahm', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2656, 'Bethlehem', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2657, 'Dayr-al-Balah', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2658, 'Ghazzah', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2659, 'Ghazzah ash-Shamaliyah', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2660, 'Janin', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2661, 'Khan Yunis', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2662, 'Nabulus', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2663, 'Qalqilyah', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2664, 'Rafah', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2665, 'Ram Allah wal-Birah', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2666, 'Salfit', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2667, 'Tubas', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2668, 'Tulkarm', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2669, 'al-Khalil', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2670, 'al-Quds', 169, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2671, 'Bocas del Toro', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2672, 'Chiriqui', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2673, 'Cocle', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2674, 'Colon', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2675, 'Darien', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2676, 'Embera', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2677, 'Herrera', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2678, 'Kuna Yala', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2679, 'Los Santos', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2680, 'Ngobe Bugle', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2681, 'Panama', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2682, 'Veraguas', 170, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2683, 'East New Britain', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2684, 'East Sepik', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2685, 'Eastern Highlands', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2686, 'Enga', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2687, 'Fly River', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2688, 'Gulf', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2689, 'Madang', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2690, 'Manus', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2691, 'Milne Bay', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2692, 'Morobe', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2693, 'National Capital District', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2694, 'New Ireland', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2695, 'North Solomons', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2696, 'Oro', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2697, 'Sandaun', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2698, 'Simbu', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2699, 'Southern Highlands', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2700, 'West New Britain', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2701, 'Western Highlands', 171, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2702, 'Alto Paraguay', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2703, 'Alto Parana', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2704, 'Amambay', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2705, 'Asuncion', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2706, 'Boqueron', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2707, 'Caaguazu', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2708, 'Caazapa', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2709, 'Canendiyu', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2710, 'Central', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2711, 'Concepcion', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2712, 'Cordillera', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2713, 'Guaira', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2714, 'Itapua', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2715, 'Misiones', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2716, 'Neembucu', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2717, 'Paraguari', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2718, 'Presidente Hayes', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2719, 'San Pedro', 172, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2720, 'Amazonas', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2721, 'Ancash', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2722, 'Apurimac', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2723, 'Arequipa', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2724, 'Ayacucho', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2725, 'Cajamarca', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2726, 'Cusco', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2727, 'Huancavelica', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2728, 'Huanuco', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2729, 'Ica', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2730, 'Junin', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2731, 'La Libertad', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2732, 'Lambayeque', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2733, 'Lima y Callao', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2734, 'Loreto', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2735, 'Madre de Dios', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2736, 'Moquegua', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2737, 'Pasco', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2738, 'Piura', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2739, 'Puno', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2740, 'San Martin', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2741, 'Tacna', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2742, 'Tumbes', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2743, 'Ucayali', 173, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2744, 'Batangas', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2745, 'Bicol', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2746, 'Bulacan', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2747, 'Cagayan', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2748, 'Caraga', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2749, 'Central Luzon', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2750, 'Central Mindanao', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2751, 'Central Visayas', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2752, 'Cordillera', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2753, 'Davao', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2754, 'Eastern Visayas', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2755, 'Greater Metropolitan Area', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2756, 'Ilocos', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2757, 'Laguna', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2758, 'Luzon', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2759, 'Mactan', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2760, 'Metropolitan Manila Area', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2761, 'Muslim Mindanao', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2762, 'Northern Mindanao', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2763, 'Southern Mindanao', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2764, 'Southern Tagalog', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2765, 'Western Mindanao', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2766, 'Western Visayas', 174, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2767, 'Pitcairn Island', 175, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2768, 'Biale Blota', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2769, 'Dobroszyce', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2770, 'Dolnoslaskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2771, 'Dziekanow Lesny', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2772, 'Hopowo', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2773, 'Kartuzy', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16');
INSERT INTO `states` (`id`, `name`, `country_id`, `flag`, `created_at`, `updated_at`) VALUES
(2774, 'Koscian', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2775, 'Krakow', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2776, 'Kujawsko-Pomorskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2777, 'Lodzkie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2778, 'Lubelskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2779, 'Lubuskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2780, 'Malomice', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2781, 'Malopolskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2782, 'Mazowieckie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2783, 'Mirkow', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2784, 'Opolskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2785, 'Ostrowiec', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2786, 'Podkarpackie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2787, 'Podlaskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2788, 'Polska', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2789, 'Pomorskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2790, 'Poznan', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2791, 'Pruszkow', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2792, 'Rymanowska', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2793, 'Rzeszow', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2794, 'Slaskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2795, 'Stare Pole', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2796, 'Swietokrzyskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2797, 'Warminsko-Mazurskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2798, 'Warsaw', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2799, 'Wejherowo', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2800, 'Wielkopolskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2801, 'Wroclaw', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2802, 'Zachodnio-Pomorskie', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2803, 'Zukowo', 176, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2804, 'Abrantes', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2805, 'Acores', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2806, 'Alentejo', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2807, 'Algarve', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2808, 'Braga', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2809, 'Centro', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2810, 'Distrito de Leiria', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2811, 'Distrito de Viana do Castelo', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2812, 'Distrito de Vila Real', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2813, 'Distrito do Porto', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2814, 'Lisboa e Vale do Tejo', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2815, 'Madeira', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2816, 'Norte', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2817, 'Paivas', 177, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2818, 'Arecibo', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2819, 'Bayamon', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2820, 'Carolina', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2821, 'Florida', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2822, 'Guayama', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2823, 'Humacao', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2824, 'Mayaguez-Aguadilla', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2825, 'Ponce', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2826, 'Salinas', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2827, 'San Juan', 178, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2828, 'Doha', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2829, 'Jarian-al-Batnah', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2830, 'Umm Salal', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2831, 'ad-Dawhah', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2832, 'al-Ghuwayriyah', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2833, 'al-Jumayliyah', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2834, 'al-Khawr', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2835, 'al-Wakrah', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2836, 'ar-Rayyan', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2837, 'ash-Shamal', 179, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2838, 'Saint-Benoit', 180, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2839, 'Saint-Denis', 180, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2840, 'Saint-Paul', 180, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2841, 'Saint-Pierre', 180, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2842, 'Alba', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2843, 'Arad', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2844, 'Arges', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2845, 'Bacau', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2846, 'Bihor', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2847, 'Bistrita-Nasaud', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2848, 'Botosani', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2849, 'Braila', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2850, 'Brasov', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2851, 'Bucuresti', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2852, 'Buzau', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2853, 'Calarasi', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2854, 'Caras-Severin', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2855, 'Cluj', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2856, 'Constanta', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2857, 'Covasna', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2858, 'Dambovita', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2859, 'Dolj', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2860, 'Galati', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2861, 'Giurgiu', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2862, 'Gorj', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2863, 'Harghita', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2864, 'Hunedoara', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2865, 'Ialomita', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2866, 'Iasi', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2867, 'Ilfov', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2868, 'Maramures', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2869, 'Mehedinti', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2870, 'Mures', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2871, 'Neamt', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2872, 'Olt', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2873, 'Prahova', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2874, 'Salaj', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2875, 'Satu Mare', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2876, 'Sibiu', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2877, 'Sondelor', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2878, 'Suceava', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2879, 'Teleorman', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2880, 'Timis', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2881, 'Tulcea', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2882, 'Valcea', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2883, 'Vaslui', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2884, 'Vrancea', 181, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2885, 'Adygeja', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2886, 'Aga', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2887, 'Alanija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2888, 'Altaj', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2889, 'Amur', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2890, 'Arhangelsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2891, 'Astrahan', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2892, 'Bashkortostan', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2893, 'Belgorod', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2894, 'Brjansk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2895, 'Burjatija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2896, 'Chechenija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2897, 'Cheljabinsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2898, 'Chita', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2899, 'Chukotka', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2900, 'Chuvashija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2901, 'Dagestan', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2902, 'Evenkija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2903, 'Gorno-Altaj', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2904, 'Habarovsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2905, 'Hakasija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2906, 'Hanty-Mansija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2907, 'Ingusetija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2908, 'Irkutsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2909, 'Ivanovo', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2910, 'Jamalo-Nenets', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2911, 'Jaroslavl', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2912, 'Jevrej', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2913, 'Kabardino-Balkarija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2914, 'Kaliningrad', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2915, 'Kalmykija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2916, 'Kaluga', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2917, 'Kamchatka', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2918, 'Karachaj-Cherkessija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2919, 'Karelija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2920, 'Kemerovo', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2921, 'Khabarovskiy Kray', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2922, 'Kirov', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2923, 'Komi', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2924, 'Komi-Permjakija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2925, 'Korjakija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2926, 'Kostroma', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2927, 'Krasnodar', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2928, 'Krasnojarsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2929, 'Krasnoyarskiy Kray', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2930, 'Kurgan', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2931, 'Kursk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2932, 'Leningrad', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2933, 'Lipeck', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2934, 'Magadan', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2935, 'Marij El', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2936, 'Mordovija', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2937, 'Moscow', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2938, 'Moskovskaja Oblast', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2939, 'Moskovskaya Oblast', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2940, 'Moskva', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2941, 'Murmansk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2942, 'Nenets', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2943, 'Nizhnij Novgorod', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2944, 'Novgorod', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2945, 'Novokusnezk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2946, 'Novosibirsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2947, 'Omsk', 182, 1, '2018-07-20 12:53:16', '2018-07-20 12:53:16'),
(2948, 'Orenburg', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2949, 'Orjol', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2950, 'Penza', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2951, 'Perm', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2952, 'Primorje', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2953, 'Pskov', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2954, 'Pskovskaya Oblast', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2955, 'Rjazan', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2956, 'Rostov', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2957, 'Saha', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2958, 'Sahalin', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2959, 'Samara', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2960, 'Samarskaya', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2961, 'Sankt-Peterburg', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2962, 'Saratov', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2963, 'Smolensk', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2964, 'Stavropol', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2965, 'Sverdlovsk', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2966, 'Tajmyrija', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2967, 'Tambov', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2968, 'Tatarstan', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2969, 'Tjumen', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2970, 'Tomsk', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2971, 'Tula', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2972, 'Tver', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2973, 'Tyva', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2974, 'Udmurtija', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2975, 'Uljanovsk', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2976, 'Ulyanovskaya Oblast', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2977, 'Ust-Orda', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2978, 'Vladimir', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2979, 'Volgograd', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2980, 'Vologda', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2981, 'Voronezh', 182, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2982, 'Butare', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2983, 'Byumba', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2984, 'Cyangugu', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2985, 'Gikongoro', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2986, 'Gisenyi', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2987, 'Gitarama', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2988, 'Kibungo', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2989, 'Kibuye', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2990, 'Kigali-ngali', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2991, 'Ruhengeri', 183, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2992, 'Ascension', 184, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2993, 'Gough Island', 184, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2994, 'Saint Helena', 184, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2995, 'Tristan da Cunha', 184, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2996, 'Christ Church Nichola Town', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2997, 'Saint Anne Sandy Point', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2998, 'Saint George Basseterre', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(2999, 'Saint George Gingerland', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3000, 'Saint James Windward', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3001, 'Saint John Capesterre', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3002, 'Saint John Figtree', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3003, 'Saint Mary Cayon', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3004, 'Saint Paul Capesterre', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3005, 'Saint Paul Charlestown', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3006, 'Saint Peter Basseterre', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3007, 'Saint Thomas Lowland', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3008, 'Saint Thomas Middle Island', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3009, 'Trinity Palmetto Point', 185, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3010, 'Anse-la-Raye', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3011, 'Canaries', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3012, 'Castries', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3013, 'Choiseul', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3014, 'Dennery', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3015, 'Gros Inlet', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3016, 'Laborie', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3017, 'Micoud', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3018, 'Soufriere', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3019, 'Vieux Fort', 186, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3020, 'Miquelon-Langlade', 187, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3021, 'Saint-Pierre', 187, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3022, 'Charlotte', 188, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3023, 'Grenadines', 188, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3024, 'Saint Andrew', 188, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3025, 'Saint David', 188, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3026, 'Saint George', 188, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3027, 'Saint Patrick', 188, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3028, 'Aana', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3029, 'Aiga-i-le-Tai', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3030, 'Atua', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3031, 'Faasaleleaga', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3032, 'Gagaemauga', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3033, 'Gagaifomauga', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3034, 'Palauli', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3035, 'Satupaitea', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3036, 'Tuamasaga', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3037, 'Vaa-o-Fonoti', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3038, 'Vaisigano', 191, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3039, 'Acquaviva', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3040, 'Borgo Maggiore', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3041, 'Chiesanuova', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3042, 'Domagnano', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3043, 'Faetano', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3044, 'Fiorentino', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3045, 'Montegiardino', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3046, 'San Marino', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3047, 'Serravalle', 192, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3048, 'Agua Grande', 193, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3049, 'Cantagalo', 193, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3050, 'Lemba', 193, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3051, 'Lobata', 193, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3052, 'Me-Zochi', 193, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3053, 'Pague', 193, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3054, 'Al Khobar', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3055, 'Aseer', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3056, 'Ash Sharqiyah', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3057, 'Asir', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3058, 'Central Province', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3059, 'Eastern Province', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3060, 'Hail', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3061, 'Jawf', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3062, 'Jizan', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3063, 'Makkah', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3064, 'Najran', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3065, 'Qasim', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3066, 'Tabuk', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3067, 'Western Province', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3068, 'al-Bahah', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3069, 'al-Hudud-ash-Shamaliyah', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3070, 'al-Madinah', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3071, 'ar-Riyad', 194, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3072, 'Dakar', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3073, 'Diourbel', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3074, 'Fatick', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3075, 'Kaolack', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3076, 'Kolda', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3077, 'Louga', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3078, 'Saint-Louis', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3079, 'Tambacounda', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3080, 'Thies', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3081, 'Ziguinchor', 195, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3082, 'Central Serbia', 196, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3083, 'Kosovo and Metohija', 196, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3084, 'Vojvodina', 196, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3085, 'Anse Boileau', 197, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3086, 'Anse Royale', 197, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3087, 'Cascade', 197, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3088, 'Takamaka', 197, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3089, 'Victoria', 197, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3090, 'Eastern', 198, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3091, 'Northern', 198, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3092, 'Southern', 198, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3093, 'Western', 198, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3094, 'Singapore', 199, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3095, 'Banskobystricky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3096, 'Bratislavsky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3097, 'Kosicky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3098, 'Nitriansky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3099, 'Presovsky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3100, 'Trenciansky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3101, 'Trnavsky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3102, 'Zilinsky', 200, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3103, 'Benedikt', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3104, 'Gorenjska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3105, 'Gorishka', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3106, 'Jugovzhodna Slovenija', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3107, 'Koroshka', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3108, 'Notranjsko-krashka', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3109, 'Obalno-krashka', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3110, 'Obcina Domzale', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3111, 'Obcina Vitanje', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3112, 'Osrednjeslovenska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3113, 'Podravska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3114, 'Pomurska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3115, 'Savinjska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3116, 'Slovenian Littoral', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3117, 'Spodnjeposavska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3118, 'Zasavska', 201, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3119, 'Central', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3120, 'Choiseul', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3121, 'Guadalcanal', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3122, 'Isabel', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3123, 'Makira and Ulawa', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3124, 'Malaita', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3125, 'Rennell and Bellona', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3126, 'Temotu', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3127, 'Western', 202, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3128, 'Awdal', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3129, 'Bakol', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3130, 'Banadir', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3131, 'Bari', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3132, 'Bay', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3133, 'Galgudug', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3134, 'Gedo', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3135, 'Hiran', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3136, 'Jubbada Hose', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3137, 'Jubbadha Dexe', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3138, 'Mudug', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3139, 'Nugal', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3140, 'Sanag', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3141, 'Shabellaha Dhexe', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3142, 'Shabellaha Hose', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3143, 'Togdher', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3144, 'Woqoyi Galbed', 203, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3145, 'Eastern Cape', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3146, 'Free State', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3147, 'Gauteng', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3148, 'Kempton Park', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3149, 'Kramerville', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3150, 'KwaZulu Natal', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3151, 'Limpopo', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3152, 'Mpumalanga', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3153, 'North West', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3154, 'Northern Cape', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3155, 'Parow', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3156, 'Table View', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3157, 'Umtentweni', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3158, 'Western Cape', 204, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3159, 'South Georgia', 205, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3160, 'Central Equatoria', 206, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3161, 'A Coruna', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3162, 'Alacant', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3163, 'Alava', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3164, 'Albacete', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3165, 'Almeria', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3166, 'Andalucia', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3167, 'Asturias', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3168, 'Avila', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3169, 'Badajoz', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3170, 'Balears', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3171, 'Barcelona', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3172, 'Bertamirans', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3173, 'Biscay', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3174, 'Burgos', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3175, 'Caceres', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3176, 'Cadiz', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3177, 'Cantabria', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3178, 'Castello', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3179, 'Catalunya', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3180, 'Ceuta', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3181, 'Ciudad Real', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3182, 'Comunidad Autonoma de Canarias', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3183, 'Comunidad Autonoma de Cataluna', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3184, 'Comunidad Autonoma de Galicia', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3185, 'Comunidad Autonoma de las Isla', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3186, 'Comunidad Autonoma del Princip', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3187, 'Comunidad Valenciana', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3188, 'Cordoba', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3189, 'Cuenca', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3190, 'Gipuzkoa', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3191, 'Girona', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3192, 'Granada', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3193, 'Guadalajara', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3194, 'Guipuzcoa', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3195, 'Huelva', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3196, 'Huesca', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3197, 'Jaen', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3198, 'La Rioja', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3199, 'Las Palmas', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3200, 'Leon', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3201, 'Lerida', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3202, 'Lleida', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3203, 'Lugo', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3204, 'Madrid', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3205, 'Malaga', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3206, 'Melilla', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3207, 'Murcia', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3208, 'Navarra', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3209, 'Ourense', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3210, 'Pais Vasco', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3211, 'Palencia', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3212, 'Pontevedra', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3213, 'Salamanca', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3214, 'Santa Cruz de Tenerife', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3215, 'Segovia', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3216, 'Sevilla', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3217, 'Soria', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3218, 'Tarragona', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3219, 'Tenerife', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3220, 'Teruel', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3221, 'Toledo', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3222, 'Valencia', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3223, 'Valladolid', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3224, 'Vizcaya', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3225, 'Zamora', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3226, 'Zaragoza', 207, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3227, 'Amparai', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3228, 'Anuradhapuraya', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3229, 'Badulla', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3230, 'Boralesgamuwa', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3231, 'Colombo', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3232, 'Galla', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3233, 'Gampaha', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3234, 'Hambantota', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3235, 'Kalatura', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3236, 'Kegalla', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3237, 'Kilinochchi', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3238, 'Kurunegala', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3239, 'Madakalpuwa', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3240, 'Maha Nuwara', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3241, 'Malwana', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3242, 'Mannarama', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3243, 'Matale', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3244, 'Matara', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3245, 'Monaragala', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3246, 'Mullaitivu', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3247, 'North Eastern Province', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3248, 'North Western Province', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3249, 'Nuwara Eliya', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3250, 'Polonnaruwa', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3251, 'Puttalama', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3252, 'Ratnapuraya', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3253, 'Southern Province', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3254, 'Tirikunamalaya', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3255, 'Tuscany', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3256, 'Vavuniyawa', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3257, 'Western Province', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3258, 'Yapanaya', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3259, 'kadawatha', 208, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3260, 'Aali-an-Nil', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3261, 'Bahr-al-Jabal', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3262, 'Central Equatoria', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3263, 'Gharb Bahr-al-Ghazal', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3264, 'Gharb Darfur', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3265, 'Gharb Kurdufan', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3266, 'Gharb-al-Istiwaiyah', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3267, 'Janub Darfur', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3268, 'Janub Kurdufan', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3269, 'Junqali', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3270, 'Kassala', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3271, 'Nahr-an-Nil', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3272, 'Shamal Bahr-al-Ghazal', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3273, 'Shamal Darfur', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3274, 'Shamal Kurdufan', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3275, 'Sharq-al-Istiwaiyah', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3276, 'Sinnar', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3277, 'Warab', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3278, 'Wilayat al Khartum', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3279, 'al-Bahr-al-Ahmar', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3280, 'al-Buhayrat', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3281, 'al-Jazirah', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3282, 'al-Khartum', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3283, 'al-Qadarif', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3284, 'al-Wahdah', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3285, 'an-Nil-al-Abyad', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3286, 'an-Nil-al-Azraq', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3287, 'ash-Shamaliyah', 209, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3288, 'Brokopondo', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3289, 'Commewijne', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3290, 'Coronie', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3291, 'Marowijne', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3292, 'Nickerie', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3293, 'Para', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3294, 'Paramaribo', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3295, 'Saramacca', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3296, 'Wanica', 210, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3297, 'Svalbard', 211, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3298, 'Hhohho', 212, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3299, 'Lubombo', 212, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3300, 'Manzini', 212, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3301, 'Shiselweni', 212, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3302, 'Alvsborgs Lan', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3303, 'Angermanland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3304, 'Blekinge', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3305, 'Bohuslan', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3306, 'Dalarna', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3307, 'Gavleborg', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3308, 'Gaza', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3309, 'Gotland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3310, 'Halland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3311, 'Jamtland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3312, 'Jonkoping', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3313, 'Kalmar', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3314, 'Kristianstads', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3315, 'Kronoberg', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3316, 'Norrbotten', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3317, 'Orebro', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3318, 'Ostergotland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3319, 'Saltsjo-Boo', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3320, 'Skane', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3321, 'Smaland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3322, 'Sodermanland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3323, 'Stockholm', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3324, 'Uppsala', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3325, 'Varmland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3326, 'Vasterbotten', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3327, 'Vastergotland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3328, 'Vasternorrland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3329, 'Vastmanland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3330, 'Vastra Gotaland', 213, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3331, 'Aargau', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3332, 'Appenzell Inner-Rhoden', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3333, 'Appenzell-Ausser Rhoden', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3334, 'Basel-Landschaft', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3335, 'Basel-Stadt', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3336, 'Bern', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3337, 'Canton Ticino', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3338, 'Fribourg', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3339, 'Geneve', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3340, 'Glarus', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3341, 'Graubunden', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3342, 'Heerbrugg', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3343, 'Jura', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3344, 'Kanton Aargau', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3345, 'Luzern', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3346, 'Morbio Inferiore', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3347, 'Muhen', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3348, 'Neuchatel', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3349, 'Nidwalden', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3350, 'Obwalden', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3351, 'Sankt Gallen', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3352, 'Schaffhausen', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3353, 'Schwyz', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3354, 'Solothurn', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3355, 'Thurgau', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3356, 'Ticino', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3357, 'Uri', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3358, 'Valais', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3359, 'Vaud', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3360, 'Vauffelin', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3361, 'Zug', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3362, 'Zurich', 214, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3363, 'Aleppo', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3364, 'Dara', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3365, 'Dayr-az-Zawr', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3366, 'Dimashq', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3367, 'Halab', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3368, 'Hamah', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3369, 'Hims', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3370, 'Idlib', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3371, 'Madinat Dimashq', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3372, 'Tartus', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3373, 'al-Hasakah', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3374, 'al-Ladhiqiyah', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3375, 'al-Qunaytirah', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3376, 'ar-Raqqah', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3377, 'as-Suwayda', 215, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3378, 'Changhwa', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3379, 'Chiayi Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3380, 'Chiayi Shih', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3381, 'Eastern Taipei', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3382, 'Hsinchu Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3383, 'Hsinchu Shih', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3384, 'Hualien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3385, 'Ilan', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3386, 'Kaohsiung Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3387, 'Kaohsiung Shih', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3388, 'Keelung Shih', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3389, 'Kinmen', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3390, 'Miaoli', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3391, 'Nantou', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3392, 'Northern Taiwan', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3393, 'Penghu', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3394, 'Pingtung', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3395, 'Taichung', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3396, 'Taichung Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3397, 'Taichung Shih', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3398, 'Tainan Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3399, 'Tainan Shih', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3400, 'Taipei Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3401, 'Taipei Shih / Taipei Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3402, 'Taitung', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3403, 'Taoyuan', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3404, 'Yilan', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3405, 'Yun-Lin Hsien', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3406, 'Yunlin', 216, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3407, 'Dushanbe', 217, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3408, 'Gorno-Badakhshan', 217, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3409, 'Karotegin', 217, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3410, 'Khatlon', 217, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3411, 'Sughd', 217, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3412, 'Arusha', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3413, 'Dar es Salaam', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3414, 'Dodoma', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3415, 'Iringa', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3416, 'Kagera', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3417, 'Kigoma', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3418, 'Kilimanjaro', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3419, 'Lindi', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3420, 'Mara', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3421, 'Mbeya', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3422, 'Morogoro', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3423, 'Mtwara', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3424, 'Mwanza', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3425, 'Pwani', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3426, 'Rukwa', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3427, 'Ruvuma', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3428, 'Shinyanga', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3429, 'Singida', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3430, 'Tabora', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3431, 'Tanga', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3432, 'Zanzibar and Pemba', 218, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3433, 'Amnat Charoen', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3434, 'Ang Thong', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3435, 'Bangkok', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3436, 'Buri Ram', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3437, 'Chachoengsao', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3438, 'Chai Nat', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3439, 'Chaiyaphum', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3440, 'Changwat Chaiyaphum', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3441, 'Chanthaburi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3442, 'Chiang Mai', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3443, 'Chiang Rai', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3444, 'Chon Buri', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3445, 'Chumphon', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3446, 'Kalasin', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3447, 'Kamphaeng Phet', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3448, 'Kanchanaburi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3449, 'Khon Kaen', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3450, 'Krabi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3451, 'Krung Thep', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17');
INSERT INTO `states` (`id`, `name`, `country_id`, `flag`, `created_at`, `updated_at`) VALUES
(3452, 'Lampang', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3453, 'Lamphun', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3454, 'Loei', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3455, 'Lop Buri', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3456, 'Mae Hong Son', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3457, 'Maha Sarakham', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3458, 'Mukdahan', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3459, 'Nakhon Nayok', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3460, 'Nakhon Pathom', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3461, 'Nakhon Phanom', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3462, 'Nakhon Ratchasima', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3463, 'Nakhon Sawan', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3464, 'Nakhon Si Thammarat', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3465, 'Nan', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3466, 'Narathiwat', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3467, 'Nong Bua Lam Phu', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3468, 'Nong Khai', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3469, 'Nonthaburi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3470, 'Pathum Thani', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3471, 'Pattani', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3472, 'Phangnga', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3473, 'Phatthalung', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3474, 'Phayao', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3475, 'Phetchabun', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3476, 'Phetchaburi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3477, 'Phichit', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3478, 'Phitsanulok', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3479, 'Phra Nakhon Si Ayutthaya', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3480, 'Phrae', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3481, 'Phuket', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3482, 'Prachin Buri', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3483, 'Prachuap Khiri Khan', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3484, 'Ranong', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3485, 'Ratchaburi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3486, 'Rayong', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3487, 'Roi Et', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3488, 'Sa Kaeo', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3489, 'Sakon Nakhon', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3490, 'Samut Prakan', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3491, 'Samut Sakhon', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3492, 'Samut Songkhran', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3493, 'Saraburi', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3494, 'Satun', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3495, 'Si Sa Ket', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3496, 'Sing Buri', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3497, 'Songkhla', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3498, 'Sukhothai', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3499, 'Suphan Buri', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3500, 'Surat Thani', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3501, 'Surin', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3502, 'Tak', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3503, 'Trang', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3504, 'Trat', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3505, 'Ubon Ratchathani', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3506, 'Udon Thani', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3507, 'Uthai Thani', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3508, 'Uttaradit', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3509, 'Yala', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3510, 'Yasothon', 219, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3511, 'Centre', 220, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3512, 'Kara', 220, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3513, 'Maritime', 220, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3514, 'Plateaux', 220, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3515, 'Savanes', 220, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3516, 'Atafu', 221, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3517, 'Fakaofo', 221, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3518, 'Nukunonu', 221, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3519, 'Eua', 222, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3520, 'Haapai', 222, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3521, 'Niuas', 222, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3522, 'Tongatapu', 222, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3523, 'Vavau', 222, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3524, 'Arima-Tunapuna-Piarco', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3525, 'Caroni', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3526, 'Chaguanas', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3527, 'Couva-Tabaquite-Talparo', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3528, 'Diego Martin', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3529, 'Glencoe', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3530, 'Penal Debe', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3531, 'Point Fortin', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3532, 'Port of Spain', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3533, 'Princes Town', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3534, 'Saint George', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3535, 'San Fernando', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3536, 'San Juan', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3537, 'Sangre Grande', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3538, 'Siparia', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3539, 'Tobago', 223, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3540, 'Aryanah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3541, 'Bajah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3542, 'Bin Arus', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3543, 'Binzart', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3544, 'Gouvernorat de Ariana', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3545, 'Gouvernorat de Nabeul', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3546, 'Gouvernorat de Sousse', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3547, 'Hammamet Yasmine', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3548, 'Jundubah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3549, 'Madaniyin', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3550, 'Manubah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3551, 'Monastir', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3552, 'Nabul', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3553, 'Qabis', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3554, 'Qafsah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3555, 'Qibili', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3556, 'Safaqis', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3557, 'Sfax', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3558, 'Sidi Bu Zayd', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3559, 'Silyanah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3560, 'Susah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3561, 'Tatawin', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3562, 'Tawzar', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3563, 'Tunis', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3564, 'Zaghwan', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3565, 'al-Kaf', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3566, 'al-Mahdiyah', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3567, 'al-Munastir', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3568, 'al-Qasrayn', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3569, 'al-Qayrawan', 224, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3570, 'Adana', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3571, 'Adiyaman', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3572, 'Afyon', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3573, 'Agri', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3574, 'Aksaray', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3575, 'Amasya', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3576, 'Ankara', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3577, 'Antalya', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3578, 'Ardahan', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3579, 'Artvin', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3580, 'Aydin', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3581, 'Balikesir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3582, 'Bartin', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3583, 'Batman', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3584, 'Bayburt', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3585, 'Bilecik', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3586, 'Bingol', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3587, 'Bitlis', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3588, 'Bolu', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3589, 'Burdur', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3590, 'Bursa', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3591, 'Canakkale', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3592, 'Cankiri', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3593, 'Corum', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3594, 'Denizli', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3595, 'Diyarbakir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3596, 'Duzce', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3597, 'Edirne', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3598, 'Elazig', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3599, 'Erzincan', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3600, 'Erzurum', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3601, 'Eskisehir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3602, 'Gaziantep', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3603, 'Giresun', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3604, 'Gumushane', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3605, 'Hakkari', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3606, 'Hatay', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3607, 'Icel', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3608, 'Igdir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3609, 'Isparta', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3610, 'Istanbul', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3611, 'Izmir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3612, 'Kahramanmaras', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3613, 'Karabuk', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3614, 'Karaman', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3615, 'Kars', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3616, 'Karsiyaka', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3617, 'Kastamonu', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3618, 'Kayseri', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3619, 'Kilis', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3620, 'Kirikkale', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3621, 'Kirklareli', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3622, 'Kirsehir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3623, 'Kocaeli', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3624, 'Konya', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3625, 'Kutahya', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3626, 'Lefkosa', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3627, 'Malatya', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3628, 'Manisa', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3629, 'Mardin', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3630, 'Mugla', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3631, 'Mus', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3632, 'Nevsehir', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3633, 'Nigde', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3634, 'Ordu', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3635, 'Osmaniye', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3636, 'Rize', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3637, 'Sakarya', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3638, 'Samsun', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3639, 'Sanliurfa', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3640, 'Siirt', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3641, 'Sinop', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3642, 'Sirnak', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3643, 'Sivas', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3644, 'Tekirdag', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3645, 'Tokat', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3646, 'Trabzon', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3647, 'Tunceli', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3648, 'Usak', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3649, 'Van', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3650, 'Yalova', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3651, 'Yozgat', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3652, 'Zonguldak', 225, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3653, 'Ahal', 226, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3654, 'Asgabat', 226, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3655, 'Balkan', 226, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3656, 'Dasoguz', 226, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3657, 'Lebap', 226, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3658, 'Mari', 226, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3659, 'Grand Turk', 227, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3660, 'South Caicos and East Caicos', 227, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3661, 'Funafuti', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3662, 'Nanumanga', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3663, 'Nanumea', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3664, 'Niutao', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3665, 'Nui', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3666, 'Nukufetau', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3667, 'Nukulaelae', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3668, 'Vaitupu', 228, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3669, 'Central', 229, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3670, 'Eastern', 229, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3671, 'Northern', 229, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3672, 'Western', 229, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3673, 'Cherkaska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3674, 'Chernihivska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3675, 'Chernivetska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3676, 'Crimea', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3677, 'Dnipropetrovska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3678, 'Donetska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3679, 'Ivano-Frankivska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3680, 'Kharkiv', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3681, 'Kharkov', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3682, 'Khersonska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3683, 'Khmelnytska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3684, 'Kirovohrad', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3685, 'Krym', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3686, 'Kyyiv', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3687, 'Kyyivska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3688, 'Lvivska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3689, 'Luhanska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3690, 'Mykolayivska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3691, 'Odeska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3692, 'Odessa', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3693, 'Poltavska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3694, 'Rivnenska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3695, 'Sevastopol', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3696, 'Sumska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3697, 'Ternopilska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3698, 'Volynska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3699, 'Vynnytska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3700, 'Zakarpatska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3701, 'Zaporizhia', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3702, 'Zhytomyrska', 230, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3703, 'Abu Zabi', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3704, 'Ajman', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3705, 'Dubai', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3706, 'Ras al-Khaymah', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3707, 'Sharjah', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3708, 'Sharjha', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3709, 'Umm al Qaywayn', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3710, 'al-Fujayrah', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3711, 'ash-Shariqah', 231, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3712, 'Aberdeen', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3713, 'Aberdeenshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3714, 'Argyll', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3715, 'Armagh', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3716, 'Bedfordshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3717, 'Belfast', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3718, 'Berkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3719, 'Birmingham', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3720, 'Brechin', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3721, 'Bridgnorth', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3722, 'Bristol', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3723, 'Buckinghamshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3724, 'Cambridge', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3725, 'Cambridgeshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3726, 'Channel Islands', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3727, 'Cheshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3728, 'Cleveland', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3729, 'Co Fermanagh', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3730, 'Conwy', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3731, 'Cornwall', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3732, 'Coventry', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3733, 'Craven Arms', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3734, 'Cumbria', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3735, 'Denbighshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3736, 'Derby', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3737, 'Derbyshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3738, 'Devon', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3739, 'Dial Code Dungannon', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3740, 'Didcot', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3741, 'Dorset', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3742, 'Dunbartonshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3743, 'Durham', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3744, 'East Dunbartonshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3745, 'East Lothian', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3746, 'East Midlands', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3747, 'East Sussex', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3748, 'East Yorkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3749, 'England', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3750, 'Essex', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3751, 'Fermanagh', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3752, 'Fife', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3753, 'Flintshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3754, 'Fulham', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3755, 'Gainsborough', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3756, 'Glocestershire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3757, 'Gwent', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3758, 'Hampshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3759, 'Hants', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3760, 'Herefordshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3761, 'Hertfordshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3762, 'Ireland', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3763, 'Isle Of Man', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3764, 'Isle of Wight', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3765, 'Kenford', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3766, 'Kent', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3767, 'Kilmarnock', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3768, 'Lanarkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3769, 'Lancashire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3770, 'Leicestershire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3771, 'Lincolnshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3772, 'Llanymynech', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3773, 'London', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3774, 'Ludlow', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3775, 'Manchester', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3776, 'Mayfair', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3777, 'Merseyside', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3778, 'Mid Glamorgan', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3779, 'Middlesex', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3780, 'Mildenhall', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3781, 'Monmouthshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3782, 'Newton Stewart', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3783, 'Norfolk', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3784, 'North Humberside', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3785, 'North Yorkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3786, 'Northamptonshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3787, 'Northants', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3788, 'Northern Ireland', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3789, 'Northumberland', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3790, 'Nottinghamshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3791, 'Oxford', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3792, 'Powys', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3793, 'Roos-shire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3794, 'SUSSEX', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3795, 'Sark', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3796, 'Scotland', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3797, 'Scottish Borders', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3798, 'Shropshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3799, 'Somerset', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3800, 'South Glamorgan', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3801, 'South Wales', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3802, 'South Yorkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3803, 'Southwell', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3804, 'Staffordshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3805, 'Strabane', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3806, 'Suffolk', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3807, 'Surrey', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3808, 'Twickenham', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3809, 'Tyne and Wear', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3810, 'Tyrone', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3811, 'Utah', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3812, 'Wales', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3813, 'Warwickshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3814, 'West Lothian', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3815, 'West Midlands', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3816, 'West Sussex', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3817, 'West Yorkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3818, 'Whissendine', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3819, 'Wiltshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3820, 'Wokingham', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3821, 'Worcestershire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3822, 'Wrexham', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3823, 'Wurttemberg', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3824, 'Yorkshire', 232, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3825, 'Alabama', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3826, 'Alaska', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3827, 'Arizona', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3828, 'Arkansas', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3829, 'Byram', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3830, 'California', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3831, 'Cokato', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3832, 'Colorado', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3833, 'Connecticut', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3834, 'Delaware', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3835, 'District of Columbia', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3836, 'Florida', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3837, 'Georgia', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3838, 'Hawaii', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3839, 'Idaho', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3840, 'Illinois', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3841, 'Indiana', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3842, 'Iowa', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3843, 'Kansas', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3844, 'Kentucky', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3845, 'Louisiana', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3846, 'Lowa', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3847, 'Maine', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3848, 'Maryland', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3849, 'Massachusetts', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3850, 'Medfield', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3851, 'Michigan', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3852, 'Minnesota', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3853, 'Mississippi', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3854, 'Missouri', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3855, 'Montana', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3856, 'Nebraska', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3857, 'Nevada', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3858, 'New Hampshire', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3859, 'New Jersey', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3860, 'New Jersy', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3861, 'New Mexico', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3862, 'New York', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3863, 'North Carolina', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3864, 'North Dakota', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3865, 'Ohio', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3866, 'Oklahoma', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3867, 'Ontario', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3868, 'Oregon', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3869, 'Pennsylvania', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3870, 'Ramey', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3871, 'Rhode Island', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3872, 'South Carolina', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3873, 'South Dakota', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3874, 'Sublimity', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3875, 'Tennessee', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3876, 'Texas', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3877, 'Trimble', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3878, 'Utah', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3879, 'Vermont', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3880, 'Virginia', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3881, 'Washington', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3882, 'West Virginia', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3883, 'Wisconsin', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3884, 'Wyoming', 233, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3885, 'United States Minor Outlying I', 234, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3886, 'Artigas', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3887, 'Canelones', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3888, 'Cerro Largo', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3889, 'Colonia', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3890, 'Durazno', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3891, 'FLorida', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3892, 'Flores', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3893, 'Lavalleja', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3894, 'Maldonado', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3895, 'Montevideo', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3896, 'Paysandu', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3897, 'Rio Negro', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3898, 'Rivera', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3899, 'Rocha', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3900, 'Salto', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3901, 'San Jose', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3902, 'Soriano', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3903, 'Tacuarembo', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3904, 'Treinta y Tres', 235, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3905, 'Andijon', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3906, 'Buhoro', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3907, 'Buxoro Viloyati', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3908, 'Cizah', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3909, 'Fargona', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3910, 'Horazm', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3911, 'Kaskadar', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3912, 'Korakalpogiston', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3913, 'Namangan', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3914, 'Navoi', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3915, 'Samarkand', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3916, 'Sirdare', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3917, 'Surhondar', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3918, 'Toskent', 236, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3919, 'Malampa', 237, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3920, 'Penama', 237, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3921, 'Sanma', 237, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3922, 'Shefa', 237, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3923, 'Tafea', 237, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3924, 'Torba', 237, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3925, 'Vatican City State (Holy See)', 238, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3926, 'Amazonas', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3927, 'Anzoategui', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3928, 'Apure', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3929, 'Aragua', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3930, 'Barinas', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3931, 'Bolivar', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3932, 'Carabobo', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3933, 'Cojedes', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3934, 'Delta Amacuro', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3935, 'Distrito Federal', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3936, 'Falcon', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3937, 'Guarico', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3938, 'Lara', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3939, 'Merida', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3940, 'Miranda', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3941, 'Monagas', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3942, 'Nueva Esparta', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3943, 'Portuguesa', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3944, 'Sucre', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3945, 'Tachira', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3946, 'Trujillo', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3947, 'Vargas', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3948, 'Yaracuy', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3949, 'Zulia', 239, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3950, 'Bac Giang', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3951, 'Binh Dinh', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3952, 'Binh Duong', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3953, 'Da Nang', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3954, 'Dong Bang Song Cuu Long', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3955, 'Dong Bang Song Hong', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3956, 'Dong Nai', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3957, 'Dong Nam Bo', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3958, 'Duyen Hai Mien Trung', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3959, 'Hanoi', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3960, 'Hung Yen', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3961, 'Khu Bon Cu', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3962, 'Long An', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3963, 'Mien Nui Va Trung Du', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3964, 'Thai Nguyen', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3965, 'Thanh Pho Ho Chi Minh', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3966, 'Thu Do Ha Noi', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3967, 'Tinh Can Tho', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3968, 'Tinh Da Nang', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3969, 'Tinh Gia Lai', 240, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3970, 'Anegada', 241, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3971, 'Jost van Dyke', 241, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3972, 'Tortola', 241, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3973, 'Saint Croix', 242, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3974, 'Saint John', 242, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3975, 'Saint Thomas', 242, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3976, 'Alo', 243, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3977, 'Singave', 243, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3978, 'Wallis', 243, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3979, 'Bu Jaydur', 244, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3980, 'Wad-adh-Dhahab', 244, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3981, 'al-Ayun', 244, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3982, 'as-Samarah', 244, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3983, 'Adan', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3984, 'Abyan', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3985, 'Dhamar', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3986, 'Hadramaut', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3987, 'Hajjah', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3988, 'Hudaydah', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3989, 'Ibb', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3990, 'Lahij', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3991, 'Marib', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3992, 'Madinat Sana', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3993, 'Sadah', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3994, 'Sana', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3995, 'Shabwah', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3996, 'Taizz', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3997, 'al-Bayda', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3998, 'al-Hudaydah', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(3999, 'al-Jawf', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4000, 'al-Mahrah', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4001, 'al-Mahwit', 245, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4002, 'Central', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4003, 'Copperbelt', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4004, 'Eastern', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4005, 'Luapala', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4006, 'Lusaka', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4007, 'North-Western', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4008, 'Northern', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4009, 'Southern', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4010, 'Western', 246, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4011, 'Bulawayo', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4012, 'Harare', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4013, 'Manicaland', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4014, 'Mashonaland Central', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4015, 'Mashonaland East', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4016, 'Mashonaland West', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4017, 'Masvingo', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4018, 'Matabeleland North', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4019, 'Matabeleland South', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4020, 'Midlands', 247, 1, '2018-07-20 12:53:17', '2018-07-20 12:53:17'),
(4021, 'American Samoa', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4022, 'Federated States Of Micronesia', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4023, 'Guam', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4024, 'Marshall Islands', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4025, 'Northern Mariana Islands', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4026, 'Palau', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4027, 'Puerto Rico', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37'),
(4028, 'Virgin Islands', 233, 1, '2019-01-25 00:44:37', '2019-01-25 00:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double DEFAULT 0,
  `cost` double DEFAULT 0,
  `stockable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockable_id` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `store_id`, `product_id`, `quantity`, `cost`, `stockable_type`, `stockable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 55, 50, 'App\\Store', 1, '2020-08-16 17:35:35', '2020-09-21 09:45:34'),
(3, 1, 2, 13, 80, 'App\\Store', 1, '2020-08-25 17:55:57', '2020-09-21 09:44:52'),
(4, 1, 1, 5, 50, 'App\\Store', 1, '2020-08-25 17:56:50', '2020-09-21 09:44:52'),
(9, 1, 3, 3, 10, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:45:34'),
(10, 1, 12, 3, 20, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:45:34'),
(11, 1, 6, 0, 30, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(12, 1, 15, 3, 40, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(13, 1, 14, 3, 60, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(14, 1, 5, 0, 70, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(15, 1, 11, 3, 80, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(16, 1, 17, 3, 90, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(17, 1, 8, 0, 100, 'App\\Store', 1, '2020-09-21 09:35:55', '2020-09-21 09:44:52'),
(18, 1, 7, 0, 10, 'App\\Store', 1, '2020-09-21 09:36:25', '2020-09-21 09:44:52'),
(19, 1, 16, 3, 20, 'App\\Store', 1, '2020-09-21 09:36:40', '2020-09-21 09:44:52'),
(20, 1, 9, 3, 30, 'App\\Store', 1, '2020-09-21 09:36:51', '2020-09-21 09:44:52'),
(21, 1, 13, 3, 40, 'App\\Store', 1, '2020-09-21 09:37:11', '2020-09-21 09:45:34'),
(22, 1, 10, 3, 60, 'App\\Store', 1, '2020-09-21 09:37:30', '2020-09-21 09:44:52'),
(23, 1, 1, 7, 50, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(24, 1, 2, 7, 80, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(25, 1, 5, 10, 70, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(26, 1, 6, 10, 30, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(27, 1, 7, 10, 10, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(28, 1, 8, 10, 100, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(29, 1, 17, 7, 90, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(30, 1, 16, 7, 20, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(31, 1, 15, 7, 40, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(32, 1, 14, 7, 60, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(33, 1, 11, 7, 80, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(34, 1, 10, 7, 60, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(35, 1, 9, 7, 30, 'App\\Department', 1, '2020-09-21 09:44:52', '2020-09-21 09:44:52'),
(36, 1, 3, 7, 10, 'App\\Department', 2, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(37, 1, 4, 7, 50, 'App\\Department', 2, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(38, 1, 12, 7, 20, 'App\\Department', 2, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(39, 1, 13, 7, 40, 'App\\Department', 2, '2020-09-21 09:45:34', '2020-09-21 09:45:34'),
(40, 1, 18, 6, 41.866666666667, 'App\\Store', 1, '2020-09-21 13:03:13', '2020-10-19 23:13:35'),
(41, 1, 18, 15, 0.2, 'App\\Department', 1, '2020-09-21 13:03:34', '2020-09-21 13:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `start_balance` double DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `store_id`, `start_balance`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, 2, NULL, '2020-08-16 17:34:53', '2020-08-16 17:34:53'),
(2, 3, 1000, 6, NULL, '2020-08-26 15:09:22', '2020-08-26 15:09:22'),
(3, 15, 3000, 21, NULL, '2020-09-09 12:57:59', '2020-09-09 12:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `system_confs`
--

CREATE TABLE `system_confs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_confs`
--

INSERT INTO `system_confs` (`id`, `store_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'service', '12', '2020-08-15 14:57:55', '2020-09-22 23:50:41'),
(2, 1, 'vat', '14', '2020-08-15 14:57:55', '2020-09-22 23:50:41'),
(3, 1, 'method', 'avg_cost', '2020-08-15 14:57:55', '2020-09-22 23:50:41'),
(4, 1, 'months', '6', '2020-08-15 14:57:55', '2020-09-22 23:50:41'),
(5, 1, 'delivery', '0', '2020-08-15 14:57:55', '2020-08-15 14:57:55'),
(6, 1, 'POS check Dish Quantity', '1', '2020-08-15 14:57:55', '2020-08-15 14:57:55'),
(7, 1, 'name', 'Demooooo', '2020-08-22 22:00:00', '2020-09-22 23:50:41'),
(8, 1, 'logo', 'media/configration/1//22092020-075041peproni.jpg', '2020-08-22 22:00:00', '2020-09-22 23:50:41'),
(9, 1, 'phone', '+201221617009', NULL, '2020-09-22 23:50:41'),
(10, 1, 'mobile', '+201221617009', NULL, '2020-09-22 23:50:41'),
(11, 2, 'service', '12', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(12, 2, 'vat', '14', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(13, 2, 'method', 'avg_cost', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(14, 2, 'months', '6', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(15, 2, 'delivery', '0', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(16, 2, 'name', 'مطعمي الخاص', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(17, 2, 'logo', 'images/no_image.png', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(18, 2, 'phone', '', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(19, 2, 'mobile', '', '2020-08-25 20:26:49', '2020-08-25 20:26:49'),
(20, 3, 'service', '12', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(21, 3, 'vat', '14', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(22, 3, 'method', 'avg_cost', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(23, 3, 'months', '6', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(24, 3, 'delivery', '0', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(25, 3, 'name', 'tatata', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(26, 3, 'logo', 'images/no_image.png', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(27, 3, 'phone', '', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(28, 3, 'mobile', '', '2020-08-25 20:48:24', '2020-08-25 20:48:24'),
(38, 15, 'service', '12', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(39, 15, 'vat', '14', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(40, 15, 'method', 'avg_cost', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(41, 15, 'months', '6', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(42, 15, 'delivery', '0', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(43, 15, 'name', 'rrrr', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(44, 15, 'logo', 'images/no_image.png', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(45, 15, 'phone', '', '2020-09-06 10:56:10', '2020-09-06 10:56:10'),
(46, 15, 'mobile', '', '2020-09-06 10:56:10', '2020-09-06 10:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hall_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `store_id`, `name`, `hall_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'S1 - T1', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(2, 1, 'S1 - T2', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(3, 1, 'S1 - T3', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(4, 1, 'S1 - T4', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(5, 1, 'S1 - T5', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(6, 1, 'S1 - T6', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(7, 1, 'S1 - T7', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(8, 1, 'S1 - T8', 1, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(9, 1, 'S2 - T1', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(10, 1, 'S2 - T2', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(11, 1, 'S2 - T3', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(12, 1, 'S2 - T4', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(13, 1, 'S2 - T5', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(14, 1, 'S2 - T6', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(15, 1, 'S2 - T7', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(16, 1, 'S2 - T8', 2, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(17, 1, 'S3 - T1', 3, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(18, 1, 'S3 - T2', 3, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(19, 1, 'S3 - T3', 3, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(20, 1, 'S3 - T4', 3, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(21, 1, 'table - 1', 4, 1, '2020-08-24 07:53:59', '2020-08-24 07:53:59'),
(22, 3, 'طاولة 1', 5, 1, '2020-08-26 13:38:35', '2020-08-26 13:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `convert_rate` double DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit`, `child_unit`, `convert_rate`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 'دسته', 'باكو', 12, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(2, 'كيلو', 'جرام', 1000, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(3, 'لتر', 'ملي لتر ', 1000, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(4, 'طن', 'كيلو', 1000, 1, '2020-08-15 14:57:54', '2020-08-15 14:57:54'),
(5, 'كيلو', 'جرام', 1000, 3, '2020-08-26 14:48:18', '2020-08-26 14:49:00'),
(6, 'بالتة', 'عبوة', 20, 3, '2020-08-26 14:48:35', '2020-08-26 14:48:35'),
(7, 'دستة', 'عبوة', 12, 3, '2020-08-26 14:51:36', '2020-08-26 14:51:36'),
(8, 'كيلو', 'جرام', 1000, 15, '2020-09-09 13:00:09', '2020-09-09 13:00:23'),
(9, 'بالته', 'العلبة', 20, 15, '2020-09-09 13:00:47', '2020-09-09 13:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `upload_files`
--

CREATE TABLE `upload_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `filable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filable_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `store_id`, `name`, `email`, `address`, `city_id`, `phone1`, `phone2`, `phone3`, `email_verified_at`, `password`, `is_active`, `api_token`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Demo', 'super.admin@recipe.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pCONXInKgpSZoNnt7mCY8ud0eVNlJiRKxFQ3ryamCjUPWhZJDVZNG', 1, NULL, 'pLCloUUrJocqy64YRc4ONd6YT7HExh7FZciHEFopPYoDTeA0d27iz59xTiLh', '2020-08-15 14:57:55', '2020-08-15 14:57:55', NULL),
(2, 1, 'typa', 'teba@gmail.com', 'Mandra', NULL, '+201221617009', NULL, NULL, NULL, '$2y$10$CVqG5ARZXpT1WM4z5/6FtOP5p2tJy14hBMtC9EvNpEBYd2/aN3Dr6', 0, NULL, NULL, '2020-08-16 17:34:53', '2020-08-16 17:34:53', NULL),
(3, 1, 'مصطفي كاشير', 'mostafa@recipe.com', 'Mandra', NULL, '+201221617009', NULL, NULL, NULL, '$2y$10$v06DvPkRq42VMw6GVKtdleUZMHk8wd/gv3nrGZx2IEmW/TRZU4Uxi', 1, NULL, NULL, '2020-08-24 07:47:34', '2020-08-24 07:47:34', NULL),
(5, 3, 'tatata', 'tatata@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pZbpdQQhbgSz1xaLIKrIfOgbw0HuPFJddScVWXeCYjrWpGiF/UnV.', 1, NULL, 'j3xBp07y3BUekVxvbtvxS9XWhAJgVPdBhfIfpEfeukONQ3qIdqjBrIZTKBrn', '2020-08-25 20:48:23', '2020-08-25 20:48:23', NULL),
(6, 3, 'typaaaa', 'typa@gmail.com', 'Mandra', NULL, '+201221617009', NULL, NULL, NULL, '$2y$10$OvefFYnN5ERpEHryvBqrmu6SUHJ3Wj68rDLpEuISgDgY0nSST4juW', 0, NULL, NULL, '2020-08-26 15:09:22', '2020-08-26 15:19:16', NULL),
(20, 15, 'rrrr', 'rrrr@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$PXi9KDSEdTA0DICdU55UfOjr0I7UBHCfLUt7/P8ECHHa6PDE8wn0y', 1, NULL, 'suISLMiR0Iy9UD3NmYVvmlk2IB5LL8edzSpSA54RY3i6PX68mnEOBIvrKPkS', '2020-09-06 10:56:09', '2020-09-06 10:56:09', NULL),
(21, 15, 'مورد', 'mord@gmail.com', 'Mandra', NULL, '+201221617009', NULL, NULL, NULL, '$2y$10$fcR0EAa0Je9LGlWDyoI2keDKRte5iedAwgPXFyH7g/Btqv.WvHo.u', 0, NULL, NULL, '2020-09-09 12:57:59', '2020-09-09 12:57:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_stocks`
--
ALTER TABLE `assign_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_stock_details`
--
ALTER TABLE `assign_stock_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_accounts`
--
ALTER TABLE `client_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cooked_products`
--
ALTER TABLE `cooked_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cooked_products_order_details_id_foreign` (`order_details_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_categories`
--
ALTER TABLE `dish_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_sizes`
--
ALTER TABLE `dish_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_size_extras`
--
ALTER TABLE `dish_size_extras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_size_recipes`
--
ALTER TABLE `dish_size_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_size_sides`
--
ALTER TABLE `dish_size_sides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_shift`
--
ALTER TABLE `employee_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `halls_name_unique` (`name`);

--
-- Indexes for table `hr_approval_requests`
--
ALTER TABLE `hr_approval_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_approval_requests_approvable_type_approvable_id_index` (`approvable_type`,`approvable_id`);

--
-- Indexes for table `hr_approval_types`
--
ALTER TABLE `hr_approval_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_approval_types_name_unique` (`name`),
  ADD UNIQUE KEY `hr_approval_types_model_unique` (`model`);

--
-- Indexes for table `hr_approvers`
--
ALTER TABLE `hr_approvers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_approvers_hr_employee_id_hr_approval_type_id_unique` (`hr_employee_id`,`hr_approval_type_id`);

--
-- Indexes for table `hr_approves`
--
ALTER TABLE `hr_approves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_approves_hr_approver_id_hr_approval_request_id_unique` (`hr_approver_id`,`hr_approval_request_id`);

--
-- Indexes for table `hr_asset_employee`
--
ALTER TABLE `hr_asset_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_attendances`
--
ALTER TABLE `hr_attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_attendances_hr_employee_id_attendance_date_check_in_unique` (`hr_employee_id`,`attendance_date`,`check_in`);

--
-- Indexes for table `hr_attendance_files`
--
ALTER TABLE `hr_attendance_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_earning_deductions`
--
ALTER TABLE `hr_earning_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_emergency_contacts`
--
ALTER TABLE `hr_emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_employees`
--
ALTER TABLE `hr_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_emp_payroll_types`
--
ALTER TABLE `hr_emp_payroll_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_e_d_details`
--
ALTER TABLE `hr_e_d_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_holidays`
--
ALTER TABLE `hr_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_leaves`
--
ALTER TABLE `hr_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_leave_types`
--
ALTER TABLE `hr_leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_payrolls`
--
ALTER TABLE `hr_payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_payroll_types`
--
ALTER TABLE `hr_payroll_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_payslips`
--
ALTER TABLE `hr_payslips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_payslips_hr_payroll_id_hr_employee_id_unique` (`hr_payroll_id`,`hr_employee_id`);

--
-- Indexes for table `hr_shifts`
--
ALTER TABLE `hr_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_shift_hours`
--
ALTER TABLE `hr_shift_hours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_shift_hours_hr_shift_id_start_day_unique` (`hr_shift_id`,`start_day`);

--
-- Indexes for table `hr_taxes`
--
ALTER TABLE `hr_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_counts`
--
ALTER TABLE `inventory_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_count_details`
--
ALTER TABLE `inventory_count_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opening_stocks`
--
ALTER TABLE `opening_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opening_stock_details`
--
ALTER TABLE `opening_stock_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_logs`
--
ALTER TABLE `order_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_restaurant`
--
ALTER TABLE `package_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_recipes`
--
ALTER TABLE `pending_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prepare_headers`
--
ALTER TABLE `prepare_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_recipes`
--
ALTER TABLE `product_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purses`
--
ALTER TABLE `purses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purses_products`
--
ALTER TABLE `purses_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_products`
--
ALTER TABLE `refund_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `ruined_dishes`
--
ALTER TABLE `ruined_dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruined_dish_details`
--
ALTER TABLE `ruined_dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruined_headers`
--
ALTER TABLE `ruined_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruined_products`
--
ALTER TABLE `ruined_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safes`
--
ALTER TABLE `safes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safe_logs`
--
ALTER TABLE `safe_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safe_payments`
--
ALTER TABLE `safe_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_confs`
--
ALTER TABLE `system_confs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_files`
--
ALTER TABLE `upload_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assign_stocks`
--
ALTER TABLE `assign_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assign_stock_details`
--
ALTER TABLE `assign_stock_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_accounts`
--
ALTER TABLE `client_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cooked_products`
--
ALTER TABLE `cooked_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `dish_categories`
--
ALTER TABLE `dish_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dish_sizes`
--
ALTER TABLE `dish_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `dish_size_extras`
--
ALTER TABLE `dish_size_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dish_size_recipes`
--
ALTER TABLE `dish_size_recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `dish_size_sides`
--
ALTER TABLE `dish_size_sides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_shift`
--
ALTER TABLE `employee_shift`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `halls`
--
ALTER TABLE `halls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hr_approval_requests`
--
ALTER TABLE `hr_approval_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_approval_types`
--
ALTER TABLE `hr_approval_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hr_approvers`
--
ALTER TABLE `hr_approvers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hr_approves`
--
ALTER TABLE `hr_approves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_asset_employee`
--
ALTER TABLE `hr_asset_employee`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hr_attendances`
--
ALTER TABLE `hr_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hr_attendance_files`
--
ALTER TABLE `hr_attendance_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_earning_deductions`
--
ALTER TABLE `hr_earning_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hr_emergency_contacts`
--
ALTER TABLE `hr_emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employees`
--
ALTER TABLE `hr_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hr_emp_payroll_types`
--
ALTER TABLE `hr_emp_payroll_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_e_d_details`
--
ALTER TABLE `hr_e_d_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_holidays`
--
ALTER TABLE `hr_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_leaves`
--
ALTER TABLE `hr_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_leave_types`
--
ALTER TABLE `hr_leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_payrolls`
--
ALTER TABLE `hr_payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_payroll_types`
--
ALTER TABLE `hr_payroll_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_payslips`
--
ALTER TABLE `hr_payslips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_shifts`
--
ALTER TABLE `hr_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hr_shift_hours`
--
ALTER TABLE `hr_shift_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hr_taxes`
--
ALTER TABLE `hr_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_counts`
--
ALTER TABLE `inventory_counts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_count_details`
--
ALTER TABLE `inventory_count_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opening_stocks`
--
ALTER TABLE `opening_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opening_stock_details`
--
ALTER TABLE `opening_stock_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_logs`
--
ALTER TABLE `order_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_restaurant`
--
ALTER TABLE `package_restaurant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pending_recipes`
--
ALTER TABLE `pending_recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prepare_headers`
--
ALTER TABLE `prepare_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_recipes`
--
ALTER TABLE `product_recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_supplier`
--
ALTER TABLE `product_supplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `purses`
--
ALTER TABLE `purses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purses_products`
--
ALTER TABLE `purses_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `refund_products`
--
ALTER TABLE `refund_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ruined_dishes`
--
ALTER TABLE `ruined_dishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruined_dish_details`
--
ALTER TABLE `ruined_dish_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruined_headers`
--
ALTER TABLE `ruined_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ruined_products`
--
ALTER TABLE `ruined_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `safes`
--
ALTER TABLE `safes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `safe_logs`
--
ALTER TABLE `safe_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `safe_payments`
--
ALTER TABLE `safe_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4029;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_confs`
--
ALTER TABLE `system_confs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

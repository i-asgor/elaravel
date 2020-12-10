-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 10:56 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '06d1108043ad13aebdca098c7e6bfe64', '1', '2020-11-30 17:06:46', '2020-11-30 17:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `text_style`, `sort_order`, `content`, `link`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Welcome To <br> The Online shop', 'text-left', 1, 'See how your users experience your website in realtime or view\r\n<br>trends to see any changes in performance over time.', 'http://eshop.me/admin/edit-banner/1', 1, '22439.jpg', '2020-11-15 10:40:56', '2020-11-22 05:52:55'),
(3, 'Welcome To <br> The PMUK shop', 'text-center', 2, 'See how your users experience your website in realtime or view\r\n<br>trends to see any changes in performance over time.', 'http://eshop.me/admin/add-banner', 1, '39912.jpg', '2020-11-16 01:07:48', '2020-11-16 01:46:14'),
(4, 'Welcome To <br> The Online shop', 'text-right', 3, 'See how your users experience your website in realtime or view\r\n<br>trends to see any changes in performance over time.', 'http://eshop.me/admin/add-banner', 1, '62540.jpg', '2020-11-16 01:23:55', '2020-11-16 01:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `url`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Mens Wear', '#', 'Mens Wear', '1', '2020-11-11 01:48:13', '2020-12-01 03:03:21'),
(2, 1, 'Men\'s Shirt', '#', 'Men\'s Shirt', '1', '2020-12-01 01:11:27', '2020-12-01 03:03:20'),
(3, 1, 'Men\'s T-Shirt', '#', 'Men\'s T-Shirt', '1', '2020-12-01 02:31:29', '2020-12-01 03:03:19'),
(4, 0, 'Womens Wear', '#', 'Womens Wear', '1', '2020-11-11 02:34:53', '2020-12-01 03:03:18'),
(5, 4, 'Women T-Shirt', '#', 'Women T-Shirt', '1', '2020-12-01 02:35:38', '2020-12-01 03:03:18'),
(6, 0, 'ELECTRONICS & APPLIANCES', '#', 'ELECTRONICS & APPLIANCES', '1', '2020-11-18 04:01:05', '2020-11-18 04:01:05'),
(7, 6, 'Television', '#', 'Television', '1', '2020-11-19 08:46:52', '2020-12-01 02:39:26'),
(8, 6, 'AC', '#', 'AC', '1', '2020-11-18 04:01:56', '2020-12-01 02:39:10'),
(11, 0, 'Electrical Appliances', '#', 'Electrical Appliances', '1', '2020-12-01 03:13:09', '2020-12-01 03:13:09'),
(12, 11, 'Led Light', '#', 'Led Light', '1', '2020-12-01 03:13:35', '2020-12-01 03:13:35');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `created_at`, `updated_at`) VALUES
(2, 'AL', 'Albania', NULL, NULL),
(3, 'DZ', 'Algeria', NULL, NULL),
(4, 'DS', 'American Samoa', NULL, NULL),
(5, 'AD', 'Andorra', NULL, NULL),
(6, 'AO', 'Angola', NULL, NULL),
(7, 'AI', 'Anguilla', NULL, NULL),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', NULL, NULL),
(10, 'AR', 'Argentina', NULL, NULL),
(11, 'AM', 'Armenia', NULL, NULL),
(12, 'AW', 'Aruba', NULL, NULL),
(13, 'AU', 'Australia', NULL, NULL),
(14, 'AT', 'Austria', NULL, NULL),
(15, 'AZ', 'Azerbaijan', NULL, NULL),
(16, 'BS', 'Bahamas', NULL, NULL),
(17, 'BH', 'Bahrain', NULL, NULL),
(18, 'BD', 'Bangladesh', NULL, NULL),
(19, 'BB', 'Barbados', NULL, NULL),
(20, 'BY', 'Belarus', NULL, NULL),
(21, 'BE', 'Belgium', NULL, NULL),
(22, 'BZ', 'Belize', NULL, NULL),
(23, 'BJ', 'Benin', NULL, NULL),
(24, 'BM', 'Bermuda', NULL, NULL),
(25, 'BT', 'Bhutan', NULL, NULL),
(26, 'BO', 'Bolivia', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(28, 'BW', 'Botswana', NULL, NULL),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', NULL, NULL),
(33, 'BG', 'Bulgaria', NULL, NULL),
(34, 'BF', 'Burkina Faso', NULL, NULL),
(35, 'BI', 'Burundi', NULL, NULL),
(36, 'KH', 'Cambodia', NULL, NULL),
(37, 'CM', 'Cameroon', NULL, NULL),
(38, 'CA', 'Canada', NULL, NULL),
(39, 'CV', 'Cape Verde', NULL, NULL),
(40, 'KY', 'Cayman Islands', NULL, NULL),
(41, 'CF', 'Central African Republic', NULL, NULL),
(42, 'TD', 'Chad', NULL, NULL),
(43, 'CL', 'Chile', NULL, NULL),
(44, 'CN', 'China', NULL, NULL),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', NULL, NULL),
(48, 'KM', 'Comoros', NULL, NULL),
(49, 'CD', 'Democratic Republic of the Congo', NULL, NULL),
(50, 'CG', 'Republic of Congo', NULL, NULL),
(51, 'CK', 'Cook Islands', NULL, NULL),
(52, 'AL', 'Albania', NULL, NULL),
(53, 'DZ', 'Algeria', NULL, NULL),
(54, 'DS', 'American Samoa', NULL, NULL),
(55, 'AD', 'Andorra', NULL, NULL),
(56, 'AO', 'Angola', NULL, NULL),
(57, 'AI', 'Anguilla', NULL, NULL),
(58, 'AQ', 'Antarctica', NULL, NULL),
(59, 'AG', 'Antigua and Barbuda', NULL, NULL),
(60, 'AR', 'Argentina', NULL, NULL),
(61, 'AM', 'Armenia', NULL, NULL),
(62, 'AW', 'Aruba', NULL, NULL),
(63, 'AU', 'Australia', NULL, NULL),
(64, 'AT', 'Austria', NULL, NULL),
(65, 'AZ', 'Azerbaijan', NULL, NULL),
(66, 'BS', 'Bahamas', NULL, NULL),
(67, 'BH', 'Bahrain', NULL, NULL),
(68, 'BD', 'Bangladesh', NULL, NULL),
(69, 'BB', 'Barbados', NULL, NULL),
(70, 'BY', 'Belarus', NULL, NULL),
(71, 'BE', 'Belgium', NULL, NULL),
(72, 'BZ', 'Belize', NULL, NULL),
(73, 'BJ', 'Benin', NULL, NULL),
(74, 'BM', 'Bermuda', NULL, NULL),
(75, 'BT', 'Bhutan', NULL, NULL),
(76, 'BO', 'Bolivia', NULL, NULL),
(77, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(78, 'BW', 'Botswana', NULL, NULL),
(79, 'BV', 'Bouvet Island', NULL, NULL),
(80, 'BR', 'Brazil', NULL, NULL),
(81, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(82, 'BN', 'Brunei Darussalam', NULL, NULL),
(83, 'BG', 'Bulgaria', NULL, NULL),
(84, 'BF', 'Burkina Faso', NULL, NULL),
(85, 'BI', 'Burundi', NULL, NULL),
(86, 'KH', 'Cambodia', NULL, NULL),
(87, 'CM', 'Cameroon', NULL, NULL),
(88, 'CA', 'Canada', NULL, NULL),
(89, 'CV', 'Cape Verde', NULL, NULL),
(90, 'KY', 'Cayman Islands', NULL, NULL),
(91, 'CF', 'Central African Republic', NULL, NULL),
(92, 'TD', 'Chad', NULL, NULL),
(93, 'CL', 'Chile', NULL, NULL),
(94, 'CN', 'China', NULL, NULL),
(95, 'CX', 'Christmas Island', NULL, NULL),
(96, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(97, 'CO', 'Colombia', NULL, NULL),
(98, 'KM', 'Comoros', NULL, NULL),
(99, 'CD', 'Democratic Republic of the Congo', NULL, NULL),
(100, 'CG', 'Republic of Congo', NULL, NULL),
(101, 'CK', 'Cook Islands', NULL, NULL),
(102, 'AL', 'Albania', NULL, NULL),
(103, 'DZ', 'Algeria', NULL, NULL),
(104, 'DS', 'American Samoa', NULL, NULL),
(105, 'AD', 'Andorra', NULL, NULL),
(106, 'AO', 'Angola', NULL, NULL),
(107, 'AI', 'Anguilla', NULL, NULL),
(108, 'AQ', 'Antarctica', NULL, NULL),
(109, 'AG', 'Antigua and Barbuda', NULL, NULL),
(110, 'AR', 'Argentina', NULL, NULL),
(111, 'AM', 'Armenia', NULL, NULL),
(112, 'AW', 'Aruba', NULL, NULL),
(113, 'AU', 'Australia', NULL, NULL),
(114, 'AT', 'Austria', NULL, NULL),
(115, 'AZ', 'Azerbaijan', NULL, NULL),
(116, 'BS', 'Bahamas', NULL, NULL),
(117, 'BH', 'Bahrain', NULL, NULL),
(118, 'BD', 'Bangladesh', NULL, NULL),
(119, 'BB', 'Barbados', NULL, NULL),
(120, 'BY', 'Belarus', NULL, NULL),
(121, 'BE', 'Belgium', NULL, NULL),
(122, 'BZ', 'Belize', NULL, NULL),
(123, 'BJ', 'Benin', NULL, NULL),
(124, 'BM', 'Bermuda', NULL, NULL),
(125, 'BT', 'Bhutan', NULL, NULL),
(126, 'BO', 'Bolivia', NULL, NULL),
(127, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(128, 'BW', 'Botswana', NULL, NULL),
(129, 'BV', 'Bouvet Island', NULL, NULL),
(130, 'BR', 'Brazil', NULL, NULL),
(131, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(132, 'BN', 'Brunei Darussalam', NULL, NULL),
(133, 'BG', 'Bulgaria', NULL, NULL),
(134, 'BF', 'Burkina Faso', NULL, NULL),
(135, 'BI', 'Burundi', NULL, NULL),
(136, 'KH', 'Cambodia', NULL, NULL),
(137, 'CM', 'Cameroon', NULL, NULL),
(138, 'CA', 'Canada', NULL, NULL),
(139, 'CV', 'Cape Verde', NULL, NULL),
(140, 'KY', 'Cayman Islands', NULL, NULL),
(141, 'CF', 'Central African Republic', NULL, NULL),
(142, 'TD', 'Chad', NULL, NULL),
(143, 'CL', 'Chile', NULL, NULL),
(144, 'CN', 'China', NULL, NULL),
(145, 'CX', 'Christmas Island', NULL, NULL),
(146, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(147, 'CO', 'Colombia', NULL, NULL),
(148, 'KM', 'Comoros', NULL, NULL),
(149, 'CD', 'Democratic Republic of the Congo', NULL, NULL),
(150, 'CG', 'Republic of Congo', NULL, NULL),
(151, 'CK', 'Cook Islands', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AIMR001', 100, 'Fixed', '2020-12-02', 1, '2020-11-29 04:03:18', '2020-11-29 04:03:18'),
(2, 'AIMR002', 25, 'Percentage', '2020-12-10', 1, '2020-11-29 04:03:47', '2020-11-29 04:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_adresses`
--

CREATE TABLE `delivery_adresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_adresses`
--

INSERT INTO `delivery_adresses` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', '2020-11-26 08:29:52', '2020-11-30 22:20:51'),
(2, 5, 'i.joni40@gmail.com', 'Joni', 'H#548, R#10, Adabar', 'Adabar', 'Adabar', 'Bangladesh', '1209', '01713092999', '2020-11-28 03:44:11', '2020-11-28 10:22:32'),
(3, 6, 'mamun@padakhep.org', 'F M Mamun', 'Shekhetek', 'Mohammadpur', 'Dhaka', 'Bangladesh', '1207', '01777777777', '2020-11-30 22:58:05', '2020-12-01 03:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2020_11_10_060203_create_products_table', 2),
(6, '2014_10_12_000000_create_users_table', 3),
(7, '2014_10_12_100000_create_password_resets_table', 3),
(8, '2019_08_19_000000_create_failed_jobs_table', 3),
(9, '2020_11_10_064137_create_products_table', 3),
(10, '2020_11_11_041545_create_categories_table', 4),
(11, '2020_11_15_090711_create_banners_table', 5),
(12, '2020_11_17_060650_create_products_attributes_table', 6),
(13, '2020_11_17_145948_create_product_images_table', 7),
(14, '2020_11_19_091038_create_carts_table', 8),
(15, '2020_11_22_084938_create_coupons_table', 9),
(16, '2020_11_24_172229_create_countries_table', 10),
(17, '2020_11_25_111019_create_delivery_adresses_table', 10),
(18, '2020_11_29_042013_create_orders_table', 11),
(19, '2020_11_29_042104_create_orders_products_table', 11),
(20, '2020_11_30_114335_create_admins_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charges` double(8,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` double(8,2) NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `shipping_charges`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'AIMR002', 35812.50, 'Paid', 'cod', 107437.50, '2020-11-29 04:10:32', '2020-11-30 05:01:25'),
(2, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'Not Used', 0.00, 'Cancelled', 'cod', 850.00, '2020-11-29 05:13:49', '2020-12-02 05:30:17'),
(3, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'Not Used', 0.00, 'Delivered', 'dbt', 34000.00, '2020-11-30 00:18:04', '2020-12-02 05:24:41'),
(4, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'AIMR002', 52500.00, 'Shipped', 'cod', 157500.00, '2020-11-30 02:34:36', '2020-12-02 05:24:54'),
(5, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'Not Used', 0.00, 'New', 'cod', 34000.00, '2020-11-30 02:35:49', '2020-11-30 02:35:49'),
(6, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'Not Used', 0.00, 'Delivered', 'dbt', 1460.00, '2020-11-30 04:02:07', '2020-12-02 05:30:02'),
(7, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'Not Used', 0.00, 'New', 'dbt', 34000.00, '2020-11-30 04:07:08', '2020-11-30 04:07:08'),
(8, 4, 'asgor@padakhep.org', 'Asgor', 'H#548,R#10', 'Adabar', 'Mohammadpur', 'Bangladesh', '1209', '01751669661', 0.00, 'Not Used', 0.00, 'New', 'cod', 1700.00, '2020-11-30 22:21:00', '2020-11-30 22:21:00'),
(9, 6, 'mamun@padakhep.org', 'F M Mamun', 'Shekhetek', 'Mohammadpur', 'Dhaka', 'Bangladesh', '1207', '01777777777', 0.00, 'Not Used', 0.00, 'Shipped', 'dbt', 34000.00, '2020-11-30 22:58:17', '2020-11-30 23:38:38'),
(10, 6, 'mamun@padakhep.org', 'F M Mamun', 'Shekhetek', 'Mohammadpur', 'Dhaka', 'Bangladesh', '1207', '01777777777', 0.00, 'Not Used', 0.00, 'Paid', 'cod', 44900.00, '2020-12-01 03:35:56', '2020-12-01 03:37:08'),
(11, 6, 'mamun@padakhep.org', 'F M Mamun', 'Shekhetek', 'Mohammadpur', 'Dhaka', 'Bangladesh', '1207', '01777777777', 0.00, 'Not Used', 0.00, 'Pending', 'dbt', 44900.00, '2020-12-01 03:48:53', '2020-12-02 05:23:31'),
(12, 6, 'mamun@padakhep.org', 'F M Mamun', 'Shekhetek', 'Mohammadpur', 'Dhaka', 'Bangladesh', '1207', '01777777777', 0.00, 'Not Used', 0.00, 'Delivered', 'dbt', 105000.00, '2020-12-01 03:57:43', '2020-12-02 23:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `user_id`, `product_id`, `product_code`, `product_name`, `product_color`, `product_size`, `product_price`, `product_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '3', '0304', 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner', 'White', '1 ton', '34000', '1', '2020-11-29 04:10:32', '2020-11-29 04:10:32'),
(2, 1, 4, '1', '0101', 'Black T-Shirt', 'Black', 'Medium', '850', '5', '2020-11-29 04:10:32', '2020-11-29 04:10:32'),
(3, 1, 4, '4', '0401', 'Samsung RU7100 65\" Flat 4K UHD Smart TV', 'White', '40 inch', '105000', '1', '2020-11-29 04:10:32', '2020-11-29 04:10:32'),
(4, 2, 4, '1', '0101', 'Black T-Shirt', 'Black', 'Medium', '850', '1', '2020-11-29 05:13:49', '2020-11-29 05:13:49'),
(5, 3, 4, '3', '0304', 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner', 'White', '1 ton', '34000', '1', '2020-11-30 00:18:04', '2020-11-30 00:18:04'),
(6, 4, 4, '4', '0401', 'Samsung RU7100 65\" Flat 4K UHD Smart TV', 'White', '40 inch', '105000', '2', '2020-11-30 02:34:36', '2020-11-30 02:34:36'),
(7, 5, 4, '3', '0304', 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner', 'White', '1 ton', '34000', '1', '2020-11-30 02:35:49', '2020-11-30 02:35:49'),
(8, 6, 4, '2', '0102', 'Pink T-Shirt', 'Pink', 'Medium', '730', '2', '2020-11-30 04:02:07', '2020-11-30 04:02:07'),
(9, 7, 4, '3', '0304', 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner', 'White', '1 ton', '34000', '1', '2020-11-30 04:07:08', '2020-11-30 04:07:08'),
(10, 8, 4, '1', '0101', 'Black T-Shirt', 'Black', 'Medium', '850', '2', '2020-11-30 22:21:00', '2020-11-30 22:21:00'),
(11, 9, 6, '3', '0304', 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner', 'White', '1 ton', '34000', '1', '2020-11-30 22:58:17', '2020-11-30 22:58:17'),
(12, 10, 6, '6', '38KHA012N', 'Carrier Air Conditioner 38KHA012N', 'White', '1 Ton', '44900', '1', '2020-12-01 03:35:56', '2020-12-01 03:35:56'),
(13, 11, 6, '6', '38KHA012N', 'Carrier Air Conditioner 38KHA012N', 'White', '1 Ton', '44900', '1', '2020-12-01 03:48:53', '2020-12-01 03:48:53'),
(14, 12, 6, '4', '0401', 'Samsung RU7100 65\" Flat 4K UHD Smart TV', 'White', '40 inch', '105000', '1', '2020-12-01 03:57:43', '2020-12-01 03:57:43');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `featured_products` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `code`, `color`, `description`, `price`, `image`, `status`, `featured_products`, `created_at`, `updated_at`) VALUES
(1, 3, 'Black T-Shirt', '0101', 'Black', 'Black T-Shirt', 575, '773.jpg', 1, 1, '2020-11-11 04:22:05', '2020-12-08 01:30:28'),
(2, 5, 'Pink T-Shirt', '0102', 'Pink', 'Pink T-Shirt', 220, '65257.png', 1, 1, '2020-11-11 05:53:36', '2020-12-01 03:03:29'),
(3, 8, 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner', '0304', 'White', 'Midea MSM12HRI 1 Ton Inverter Split Type Air Conditioner\r\nAC Type: Split AC\r\nCooling Capacity: 12000 btu\r\nHeating Capacity: 13000 btu\r\nCoverage:120 Square Feet\r\nFilter Type: Washable Air Filter\r\nFan Speed: Low / Medium / High\r\nCooling Speed: High Speed\r\nAir Control: Air Flow Direction Adjustable\r\nMax Input consumption: 2050w\r\nPower Supply: 220-240V~ 50Hz, 1Ph', 33600, '68543.jpg', 1, 1, '2020-11-18 04:41:33', '2020-12-01 02:40:22'),
(4, 7, 'Samsung RU7100 65\" Flat 4K UHD Smart TV', '0401', 'White', 'Screen Size: 65 Inch\r\nPanel: Flat\r\nResolution: 4K, 3840 x 2160 Resolution\r\nTechnology: LED\r\n3D Technology: 2D\r\nRefresh Rate: 100 Motion Rate\r\nContrast: Mega Contrast, HDR 10+\r\nBrightness: Live Color Technology, HDR\r\nTV Tuner: Analog and Digital\r\nSound: Dolby Digital, Dolby Digital Plus, DTS Digital Surround 20 Watt\r\nConnectivity: LAN, RF, USB, HDMI, Wi-Fi, Bluetooth\r\nRemote: Yes', 104500, '65522.jpg', 1, 1, '2020-11-18 09:48:03', '2020-12-01 02:40:39'),
(5, 12, 'WLED-T5BAT-10W', '0601', 'White', 'Power:	10W\r\nInput Voltage :	85-265V\r\nLuminous Flux:	1000LM\r\nPower factor:	≥ 0.90\r\nRendering Index: 	 ≥ 80\r\nBody Material: 	Diffusion PC\r\nDiffuser Material: 	Natural PC\r\nEfficacy	≥ 100     \r\nColor temperature:             	6500k       \r\nViewing angle:	240˚\r\nSize:	575mm', 320, '56729.jpg', 1, 1, '2020-12-01 03:17:30', '2020-12-01 03:22:02'),
(6, 8, 'Carrier Air Conditioner 38KHA012N', '38KHA012N', 'White', 'Carrier Air Conditioner 38KHA012N is designed to create a cool and comfortable living environment. It can be used in residential as well as commercial properties. It has been integrated with an ionizer to ensure refreshing, natural and healthy air. The ionizer generates a high voltage ionization zone through which the air is converted into plasma. Inside the air most of the dust, smoke and pollen particles are captured by the electrostatic filter. With the new technology of Refrigerant Leak Detector (RLD) the air conditioner gives an indication when the outdoor unit detects refrigerant leakage.', 44900, '50976.jpg', 1, 1, '2020-12-01 03:30:55', '2020-12-01 03:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, '0101-S', 'Small', 800, 5, '2020-11-17 02:50:20', '2020-11-17 02:50:20'),
(2, 1, '0101-M', 'Medium', 850, 5, '2020-11-17 02:52:41', '2020-11-17 02:52:41'),
(3, 1, '0101-L', 'Large', 900, 5, '2020-11-17 02:54:17', '2020-11-17 02:54:17'),
(5, 1, '0101-XS', 'Extra Small', 860, 5, '2020-11-17 03:02:56', '2020-11-17 03:02:56'),
(6, 1, '0101-XL', 'Extra Large', 900, 5, '2020-11-17 03:02:57', '2020-11-17 03:02:57'),
(8, 2, '0102-S', 'Small', 720, 51, '2020-11-17 03:05:53', '2020-11-17 07:18:28'),
(9, 2, '0102-M', 'Medium', 730, 5, '2020-11-17 03:05:53', '2020-11-17 07:18:28'),
(10, 2, '0102-L', 'Large', 740, 5, '2020-11-17 03:05:53', '2020-11-17 07:18:28'),
(12, 2, '0102-XS', 'Extra Small', 730, 5, '2020-11-17 07:18:18', '2020-11-17 07:18:28'),
(13, 2, '0102-XL', 'Extra Large', 740, 5, '2020-11-18 02:40:04', '2020-11-18 02:40:04'),
(14, 3, '0304-L', '1 ton', 34000, 5, '2020-11-21 22:16:21', '2020-11-21 22:18:17'),
(15, 4, '0401-L', '40 inch', 105000, 5, '2020-11-21 22:17:23', '2020-11-21 22:19:08'),
(16, 6, '38KHA012N-S', '1 Ton', 44900, 5, '2020-12-01 03:32:37', '2020-12-01 03:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(2, '1', '22979.jpg', '2020-11-17 23:13:08', '2020-11-17 23:13:08'),
(3, '1', '62246.jpg', '2020-11-17 23:15:17', '2020-11-17 23:15:17'),
(4, '2', '91696.png', '2020-11-18 02:30:19', '2020-11-18 02:30:19'),
(5, '2', '97020.png', '2020-11-18 02:31:13', '2020-11-18 02:31:13'),
(6, '1', '24459.jpg', '2020-11-18 02:37:50', '2020-11-18 02:37:50'),
(7, '2', '57166.jpg', '2020-11-18 02:38:04', '2020-11-18 02:38:04'),
(8, '4', '44922.jpg', '2020-11-18 09:50:28', '2020-11-18 09:50:28'),
(9, '4', '84241.jpg', '2020-11-18 09:50:37', '2020-11-18 09:50:37'),
(10, '3', '95863.jpg', '2020-11-21 22:14:02', '2020-11-21 22:14:02'),
(11, '3', '97899.jpg', '2020-11-21 22:14:21', '2020-11-21 22:14:21'),
(12, '6', '1506.jpg', '2020-12-01 03:31:39', '2020-12-01 03:31:39'),
(13, '6', '98441.jpg', '2020-12-01 03:31:44', '2020-12-01 03:31:44'),
(14, '6', '45455.jpg', '2020-12-01 03:31:50', '2020-12-01 03:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `state`, `city`, `country`, `pincode`, `mobile`, `email_verified_at`, `admin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '', '', '', '', '', '', NULL, 1, '$2y$10$zMFyiuoBLe/n5ymhF8g7RupCO8c74M1QQBXrBYZIpi3Y4eaNFHx7y', NULL, '2020-11-10 00:55:55', '2020-11-10 00:55:55'),
(2, 'Asgor', 'asgor2@padakhep.org', 'H#23,R#01, Shekertek, Adabar', 'Mohammadpur', 'Mohammadpur', 'Bangladesh', '1209', '01751', '2020-11-26 05:55:04', 0, '$2y$10$QWKS3HT7y9wcmem//JgcYOyNf5LzSdhg5g2/EWn74EbnJ6oy9mMeS', NULL, '2020-11-24 03:55:39', '2020-11-26 05:55:04'),
(3, 'Asgor1', 'asgor1@padakhep.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$10$uQp8sfRU0mshmkXFy.PXNuj4D6BgFXPyMkzz/GEoR4rIxLixZ.msa', NULL, '2020-11-26 03:51:07', '2020-11-26 03:51:07'),
(4, 'Asgor', 'asgor@padakhep.org', 'H#548,R#10', 'Mohammadpur', 'Adabar', 'Bangladesh', '1209', '01751669661', '2020-11-26 04:17:23', 0, '$2y$10$g2qRQvBUrTgGKMJGgAfO1eCPtcxhFxsNoGIUfI/mB/HTgd.jKfW/e', NULL, '2020-11-26 04:14:25', '2020-11-30 22:20:51'),
(5, 'Joni', 'i.joni40@gmail.com', 'H#548, R#10, Adabar', 'Adabar', 'Adabar', 'Bangladesh', '1209', '01713092999', '2020-11-26 04:29:12', 0, '$2y$10$SmD7jK1lK2/fmaS6bTEhuuBhF7taQi/OXU49c0aGJ4ZCQK/k6z0uq', NULL, '2020-11-26 04:24:47', '2020-11-28 10:22:32'),
(6, 'F M Mamun', 'mamun@padakhep.org', 'Shekhetek', 'Dhaka', 'Mohammadpur', 'Bangladesh', '1207', '01777777777', '2020-11-30 22:55:03', 0, '$2y$10$OicLpcCfVG4AwX8pULFOtOTPFtJnx3iRFTi7J.UguYKfxSi/jqX66', NULL, '2020-11-30 22:51:56', '2020-12-01 03:57:37'),
(7, 'saiful', 'saiful@padakhep.org', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-02 23:06:28', 0, '$2y$10$nJyH4gXDO3w2w1diGcQQSue2nX5STrcsyhmfgZQ9MiR8ZEEJ0eZlK', NULL, '2020-12-02 23:04:31', '2020-12-02 23:06:28'),
(8, 'Razwanul', 'razwanul@padakhep.org', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-02 23:16:26', 0, '$2y$10$V/4WtwkA.SbkLa3cKyUkPOJEnTmTkVvROQZnLxUOr/Zneo27.N3Ke', NULL, '2020-12-02 23:16:11', '2020-12-02 23:16:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `delivery_adresses`
--
ALTER TABLE `delivery_adresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_adresses`
--
ALTER TABLE `delivery_adresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

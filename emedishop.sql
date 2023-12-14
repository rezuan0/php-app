-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 13, 2023 at 06:41 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emedishop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `email`, `whatsapp`, `mobile`, `state`, `city`, `zip_code`, `address`, `created_at`, `updated_at`) VALUES
(65, '8', 'asfas', 'ppp@gmail.com', '2342342', '2342342', 'Chattogram', '234 234', '2423', 'aszfdasfa', '2022-06-14 06:44:32', '2022-06-14 06:44:32'),
(114, '6', 'rezuan', 'rezuan@gmail.com', '12312312', '12312312', 'Barishal', 'DHAKA', '123123', 'asdf', '2022-06-15 06:14:43', '2022-06-15 06:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'rezuan', '01700000000', 'rezuan@gmail.com', NULL, '$2y$10$.luPm51Lqz4ue9KFlHctt.yjtb.D6tZA/txuQS.krxMhQlDbnyMqW', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(94, '6', '21', '8', '4000', '2022-06-17 12:45:44', '2022-06-19 11:50:49'),
(95, '7', '24', '6', '2418', '2022-06-19 11:47:17', '2022-06-19 11:51:01'),
(96, '9', '22', '1', '200', '2022-06-19 13:56:20', '2022-06-19 13:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'COVID 19', NULL, '2022-04-11 03:13:05', '2022-04-11 03:13:05'),
(3, 'MEDICINE STORE', NULL, '2022-04-11 03:27:25', '2022-04-11 03:27:25'),
(4, 'BABY & MOM', NULL, '2022-04-11 13:19:34', '2022-04-11 13:19:34'),
(5, 'FEMALE HYGIENE', NULL, '2022-04-11 13:20:46', '2022-04-11 13:20:46'),
(6, 'BEAUTY CARE', NULL, '2022-04-11 13:21:09', '2022-04-11 13:21:09'),
(7, 'DIABETIC', NULL, '2022-04-11 13:21:23', '2022-04-11 13:21:23'),
(9, 'PERSONAL CARE', NULL, '2022-04-11 13:22:54', '2022-04-11 13:22:54'),
(11, 'SEXUAL WELLBEING', NULL, '2022-04-15 00:11:01', '2022-04-15 00:11:01');

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_04_08_054125_create_admins_table', 2),
(5, '2022_04_09_060128_create_vendors_table', 3),
(6, '2022_04_10_113242_create_customers_table', 4),
(7, '2022_04_11_061547_create_categories_table', 5),
(8, '2022_04_11_090342_create_categories_table', 6),
(9, '2022_04_13_173026_create_cart_controllers_table', 7),
(10, '2022_04_13_173359_create_carts_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` int(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('quaziakash@gmail.com', '$2y$10$z4Tp1iYUkRSIc1r/Donc/us.yGIlCDLmvos.QhqcV59M9ns5Csszi', '2022-04-07 04:21:16'),
('quaziakash@gmail.com', '$2y$10$z4Tp1iYUkRSIc1r/Donc/us.yGIlCDLmvos.QhqcV59M9ns5Csszi', '2022-04-07 04:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pieces` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_des` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `product_name`, `category`, `brand_name`, `pieces`, `price`, `stock`, `image`, `product_des`, `created_at`, `updated_at`) VALUES
(21, '1', 'Flexi® 100 mg', 'MEDICINE STORE', 'Square Pharmaceuticals Ltd.', '100', '500', '10', '202204160928Flexi.jpg', 'Aceclofenac is indicated for the relief of pain and inflammation in osteoarthritis, rheumatoid arthritis, ankylosing spondylitis, toothache, trauma and lumbago.\r\nAceclofenac is a non-steroidal drug with anti-inflammatory and analgesic properties. It is a potent inhibitor of the enzyme cyclooxygenase, which is involved in the production of prostaglandin. After oral administration, it is rapidly and completely absorbed an unchanged drug.\r\nExtended release tablet: The recommended dose in adults is one 200 mg Aceclofenac tablet daily or as prescribed by the physician.\r\nFilm coated tablet: The recommended dose in adults is 100 mg, twice daily.', '2022-04-16 03:28:07', '2022-04-16 03:28:07'),
(22, '1', 'Tylace™ 600mg', 'MEDICINE STORE', 'Square Pharmaceuticals Ltd.', '10', '200', '5', '202204160935tylace_l.jpg', 'Acetylcysteine is indicated as an adjuvant treatment in certain clinical condition characterized by the presence of thick and viscous mucoid or mucopurulent secretions such as: Chronic bronchopulmonary diseases (chronic obstructive pulmonary disease, emphysema with bronchitis, chronic asthmatic bronchitis, bronchiectasis); Acute bronchopulmonary diseases (asthma with bronchial mucus plugging, bronchitis, bronchopneumonia, tracheobronchitis, bronchiolitis, pulmonary complications of cystic fibrosis, pulmonary complications associated with surgery).', '2022-04-16 03:35:42', '2022-04-16 03:39:32'),
(23, '1', 'Virux® 400 mg', 'MEDICINE STORE', 'Square Pharmaceuticals Ltd.', '20', '420', '25', '202204160938VIRUX.jpg', 'For the treatment of viral infections due to herpes simplex virus (type I & II) and varicella zoster virus (herpes zoster & chickenpox).\r\nFor the treatment of herpes simplex virus infections of the skin and mucous membranes including initial and recurrent genital herpes.\r\nFor the prophylaxis of herpes simplex infections in immunocompromised patients.', '2022-04-16 03:38:56', '2022-04-16 03:38:56'),
(24, '1', 'Esloric® 100mg', 'MEDICINE STORE', 'Square Pharmaceuticals Ltd.', '100', '403', '12', '202204160941Esloric 100 IC 01.jpg', 'Allopurinol is indicated for reducing urate/uric acid formation in conditions where urate/uric acid deposition has already occurred (e.g. gouty arthritis, skin tophi, nephrolithiasis). Allopurinol is indicated for management of 2,8-dihydroxyadenine (2,8-DHA) renal stones related to deficient activity of adenine phospho ribosyltransferase. Allopurinol is indicated for the management of recurrent mixed calcium oxalate renal stones in the presence of hyperuricosuria, when fluid, dietary and similar measures have failed.', '2022-04-16 03:41:41', '2022-04-16 03:41:41'),
(25, '9', 'napa', 'MEDICINE STORE', 'Pera', '150', '10', '150', '202312130535pexels-pixabay-162389.jpg', 'sedsd', '2023-12-12 23:35:37', '2023-12-12 23:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user1_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user1_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user2_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user2_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user1_id`, `user1_name`, `user2_id`, `user2_name`, `status`, `created_at`, `updated_at`) VALUES
(117, '9', 'puma', '2', 'rezuan', 'open', '2022-06-19 14:47:42', '2022-06-19 14:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `acc_status`, `phone`, `address`, `password`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'rezuan', 'rezuan@gmail.com', 'active', '01703048018', 'Uttora', '$2y$10$9NMKTEXre4gRI.VD73xac.2X7zizFd2yxdIAQXyDxVQ8zCdXcubWy', NULL, NULL, '2022-04-13 13:05:04', '2022-04-16 02:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shopname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `shopname`, `acc_status`, `phone`, `address`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'rezuan', 'active', '01703048909', 'Mirpur 1, Dhaka', 'rezuan@gmail.com', NULL, '$2y$10$.luPm51Lqz4ue9KFlHctt.yjtb.D6tZA/txuQS.krxMhQlDbnyMqW', NULL, NULL, '2022-04-12 11:23:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

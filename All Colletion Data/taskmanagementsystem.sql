-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2024 at 12:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('2408d2bb6406347d857939a530633f51', 'i:1;', 1726651119),
('2408d2bb6406347d857939a530633f51:timer', 'i:1726651119;', 1726651119),
('57dbb44f60f1dca65eac0a342f360326', 'i:1;', 1726651458),
('57dbb44f60f1dca65eac0a342f360326:timer', 'i:1726651458;', 1726651458),
('a@a.com|127.0.0.1', 'i:1;', 1726651119),
('a@a.com|127.0.0.1:timer', 'i:1726651119;', 1726651119);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '0001_01_01_000000_create_users_table', 1),
(8, '0001_01_01_000001_create_cache_table', 1),
(9, '0001_01_01_000002_create_jobs_table', 1),
(10, '2024_09_16_064537_add_two_factor_columns_to_users_table', 1),
(11, '2024_09_16_064635_create_personal_access_tokens_table', 1),
(12, '2024_09_17_124843_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Micah Holman', 'ab57cf68729ab389d54939e36923b1d4b578e48868e8fbf7f1526114eda31049', '[\"read\",\"create\",\"delete\",\"update\"]', NULL, NULL, '2024-09-18 00:44:25', '2024-09-18 00:44:25'),
(2, 'App\\Models\\User', 1, 'Colette Morton', 'e79b87af6d36de333ef160be58ebfc92797f0cc7a9b6a81cae7fccc65db26f79', '[\"read\",\"update\",\"create\",\"delete\"]', '2024-09-18 02:29:13', NULL, '2024-09-18 01:19:49', '2024-09-18 02:29:13'),
(3, 'App\\Models\\User', 2, 'MyApp', 'c85578ba7ad7ea02f83b027c36c04d80192447691f35b9db4d9f0621ba60c103', '[\"*\"]', NULL, NULL, '2024-09-18 02:49:07', '2024-09-18 02:49:07'),
(4, 'App\\Models\\User', 4, 'MyApp', 'eb9bfba6a2f55b63e595d9c1cc7fe93b2be66223702e9ce718014e4e8d7be0b5', '[\"*\"]', NULL, NULL, '2024-09-18 02:50:07', '2024-09-18 02:50:07'),
(5, 'App\\Models\\User', 5, 'LaravelNewApp', 'bf168b67fbdb87c6925bc217c414c65e03a6150a734c2a100febac938530e1e0', '[\"*\"]', NULL, NULL, '2024-09-18 02:51:23', '2024-09-18 02:51:23'),
(6, 'App\\Models\\User', 6, 'LaravelNewApp', 'ad1d9e3fcbef698a12cf04c8ac102f5df17271093279c1caf84ea7f7b3b2510d', '[\"*\"]', NULL, NULL, '2024-09-18 02:53:45', '2024-09-18 02:53:45'),
(7, 'App\\Models\\User', 5, 'MyApp', '50d90bca31324be78c01cdb70ed6a48e46e674bade4108718a9a444a30767f15', '[\"*\"]', NULL, NULL, '2024-09-18 02:54:52', '2024-09-18 02:54:52'),
(8, 'App\\Models\\User', 5, 'MyApp', 'c47d132b132c7a25a5ec46f3265a492c42138be17d6b3e554ccb940ef91c2d89', '[\"*\"]', '2024-09-18 03:31:28', '2024-09-18 09:30:02', '2024-09-18 02:55:03', '2024-09-18 03:31:28'),
(9, 'App\\Models\\User', 5, 'MyApp', '8511e0b602691c2aba35c39e8c40b64d3339f1fd37bd2b749d1d2d3aa683ce66', '[\"*\"]', '2024-09-18 04:12:16', NULL, '2024-09-18 03:47:30', '2024-09-18 04:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OkEFAkfmFhtNN8euXsMDVHqJB2Q7valMPTgC0SYQ', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWxwRzFQNnA5eFlPeG5ZaFBkb1hFZ3l3Vk9MbGI3RVdpSjA2NUlxeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1726652181),
('w3zgJ13CDmrHRyPUTec5O0YNhseZawA1ObmfrDrI', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidWVpaUtDVzgyRUZlMU9DRlFmbExzbkxRcFZhR2cwbFJ4S2ZqeVNnRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkRUgwdk9iWVcwTGFzeVpvdjhRMVNvdVo5dG93aUNzL3R0bmR1YmZjYUM3b2xzc1dSeDFlZm0iO30=', 1726651583);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'PENDING' COMMENT 'PENDING',
  `assigned_to` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `due_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `status`, `assigned_to`, `created_by`, `due_date`, `created_at`, `updated_at`) VALUES
(2, 'obert', NULL, 'PENDING', 5, 1, '2024-12-31 00:00:00', '2024-09-18 00:52:27', '2024-09-18 04:12:16'),
(3, 'B. Pobert', NULL, 'PENDING', 1, 1, '2024-12-31 00:00:00', '2024-09-18 00:52:30', '2024-09-18 04:09:24'),
(4, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-04-25 00:00:00', '2024-09-18 00:52:31', '2024-09-18 00:52:31'),
(5, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-05-25 00:00:00', '2024-09-18 00:52:34', '2024-09-18 00:52:34'),
(6, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-05-10 00:00:00', '2024-09-18 00:52:38', '2024-09-18 00:52:38'),
(7, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-05-01 00:00:00', '2024-09-18 00:52:44', '2024-09-18 00:52:44'),
(8, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-05-30 00:00:00', '2024-09-18 00:52:56', '2024-09-18 00:52:56'),
(9, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-06-30 00:00:00', '2024-09-18 00:53:02', '2024-09-18 00:53:02'),
(10, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-06-17 00:00:00', '2024-09-18 00:53:04', '2024-09-18 00:53:04'),
(11, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-06-18 00:00:00', '2024-09-18 00:53:08', '2024-09-18 00:53:08'),
(12, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-06-28 00:00:00', '2024-09-18 00:53:11', '2024-09-18 00:53:11'),
(13, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-06-29 00:00:00', '2024-09-18 00:53:13', '2024-09-18 00:53:13'),
(14, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-07-29 00:00:00', '2024-09-18 00:53:16', '2024-09-18 00:53:16'),
(15, 'Robert', NULL, 'COMPLETED', 1, 1, '2024-07-27 00:00:00', '2024-09-18 00:53:19', '2024-09-18 00:53:19'),
(16, 'Robert', NULL, 'PENDING', 1, 1, '2024-07-27 00:00:00', '2024-09-18 00:53:42', '2024-09-18 00:53:42'),
(17, 'Robert', NULL, 'PENDING', 1, 1, '2024-07-29 00:00:00', '2024-09-18 00:53:44', '2024-09-18 00:53:44'),
(18, 'Robert', NULL, 'PENDING', 1, 1, '2024-08-29 00:00:00', '2024-09-18 00:53:48', '2024-09-18 00:53:48'),
(19, 'Robert', NULL, 'PENDING', 1, 1, '2024-10-29 00:00:00', '2024-09-18 00:53:50', '2024-09-18 00:53:50'),
(21, 'Robert', NULL, 'PENDING', 1, 1, '2024-11-29 00:00:00', '2024-09-18 00:53:54', '2024-09-18 00:53:54'),
(22, 'B. Pobert', NULL, 'PENDING', 1, 1, '2024-12-31 00:00:00', '2024-09-18 00:53:59', '2024-09-18 02:26:54'),
(23, 'Robert', NULL, 'PENDING', 1, 1, '2024-12-31 00:00:00', '2024-09-18 01:23:16', '2024-09-18 01:23:16'),
(24, 'Robert', NULL, 'IN_PROGRESS', 1, 1, '2024-12-31 00:00:00', '2024-09-18 01:53:36', '2024-09-18 01:53:36'),
(25, 'xse', NULL, 'IN_PROGRESS', 1, 1, '2024-12-31 00:00:00', '2024-09-18 02:21:30', '2024-09-18 02:21:30'),
(26, 'abc', NULL, 'IN_PROGRESS', 5, 5, '2024-12-31 00:00:00', '2024-09-18 04:08:02', '2024-09-18 04:08:02'),
(27, 'abc', NULL, 'PENDING', 5, 5, '2024-12-31 00:00:00', '2024-09-18 04:08:05', '2024-09-18 04:08:05'),
(28, 'abc R', NULL, 'COMPLETED', 5, 5, '2024-12-31 00:00:00', '2024-09-18 04:08:16', '2024-09-18 04:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Lucas Gillespie', 'hovawuciwa@mailinator.com', NULL, '$2y$12$CqOuy013nO8s5F40uutZEOtWqLN3VamFXhY/BBK4OsS3C82jGuRQW', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-18 00:44:13', '2024-09-18 00:44:13'),
(5, 'Ahsan', 'a@a.a', NULL, '$2y$12$EH0vObYW0LasyZov8Q1SouZ9towiCs/ttndubfcaC7olssWRx1efm', NULL, NULL, NULL, '2p5xZ0YY87uUjz7bbSSHiwZSUwQ7twmA4NhFPDic1Cim5QxQwP0Njy1XxJug', NULL, NULL, '2024-09-18 02:51:23', '2024-09-18 02:51:23'),
(6, 'Ahsan', 'aw@a.a', NULL, '$2y$12$TXrEqm9t19LHKfg2s3ayb.H4qYcAUqV2h8oKGYuec7VekO7hafu1a', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-18 02:53:45', '2024-09-18 02:53:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_assigned_to_foreign` (`assigned_to`),
  ADD KEY `tasks_created_by_foreign` (`created_by`);

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

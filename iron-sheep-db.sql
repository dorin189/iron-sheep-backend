-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2018 at 01:49 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iron-sheep-db`
--
CREATE DATABASE IF NOT EXISTS `iron-sheep-db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `iron-sheep-db`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_disabled` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `email`, `is_disabled`, `created_at`, `updated_at`) VALUES
(1, 'Dorin', 'Iosifescu', 'dorin189', '$2b$10$CwTyjyTKN77U6NM4B1DS5eZFzlPY.bXgBQNtb/msTP9zuG.2CjLji', 'dorin@abc.ro', 0, NULL, NULL),
(2, 'Georgi', 'Gina', 'gina11112222', '$2b$10$rckCaBRK0oTpFMGSkScTaexghJ3K1y2L7BWWT7AluMK.bKivWYbGG', 'gina@abc.ro', 1, '2018-09-22 21:00:00', NULL),
(3, 'Gigi', 'Becali', '', '$2b$10$CwTyjyTKN77U6NM4B1DS5eZFzlPY.bXgBQNtb/msTP9zuG.2CjLji', '', 1, NULL, NULL),
(4, 'Vasile', 'Ion', 'vasi123', '$2b$10$CwTyjyTKN77U6NM4B1DS5eZFzlPY.bXgBQNtb/msTP9zuG.2CjLji', 'vasi@abc.ro', 1, '0000-00-00 00:00:00', NULL),
(5, 'Dorel', 'Ion', 'vasi123', '$2b$10$5AEJDsKFTWWnxMqNaQb8q.c5KaardcwRm2rj8.9VvkQ3u0Y2juTkW', 'vasi@abc.ro', 1, '0000-00-00 00:00:00', NULL),
(6, 'Andrei', 'Bogdan', 'bogd11', '$2b$10$UP1dy6shuhT/hg0RMPoVyuiH1pxyt3v3UtvGCUfd6yvk6UxYRF8.C', 'bog@abc.ro', 1, '0000-00-00 00:00:00', NULL),
(7, 'Ginel', 'Staicu', 'ginel123', '$2b$10$REGKKOXsNTbxZEahbfsvcuO0seT0U1rVnGpU/RtE.ttkRfajzpVEW', 'ginel@abc.rom', 0, '0000-00-00 00:00:00', NULL),
(9, 'Goran', 'Gicu', 'goran12', '$2b$10$HzsYOhI8pDR7kf9ELiN/AeTZkkB2SrClNlcIaTN6lLtDUdhn9mkGS', 'goran@abc.rom', 0, '0000-00-00 00:00:00', NULL),
(10, 'Bancu', 'Oana', 'baoana', '$2b$10$mAIL5a7YPMY.65eggrG3wORicUgYBH3VrBjMV7eQFZ1hgidwCzh9a', 'baoana@abc.ro', 0, '0000-00-00 00:00:00', NULL),
(11, 'Iuliu', 'Marius', 'uimar', '$2b$10$dSAWmIIdA/d7zf/SsQo6pOyvRRqjApFcu1T9aK9MYxrksuXLQPStu', 'marius@abc.rom', 0, '0000-00-00 00:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

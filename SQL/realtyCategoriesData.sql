-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2021 at 09:11 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `immocam`
--

-- --------------------------------------------------------

--
-- Table structure for table `realty_categories`
--

CREATE TABLE `realty_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(160) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `realty_categories`
--

INSERT INTO `realty_categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Appartement', 'Habitation minimum 5 pièces', '2021-05-23 18:56:59'),
(2, 'Maison', 'Habitation minimum 6 pièces avec court et véranda', '2021-05-23 18:57:56'),
(3, 'Chambre Moderne', 'Habitation d\'une pièce et douche', '2021-05-23 18:58:53'),
(4, 'Studio Moderne', 'Habitation de 4 pièces', '2021-05-23 18:59:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `realty_categories`
--
ALTER TABLE `realty_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `realty_categories`
--
ALTER TABLE `realty_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

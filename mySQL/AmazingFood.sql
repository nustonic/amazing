-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 11, 2023 at 08:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AmazingFood`
--

-- --------------------------------------------------------

--
-- Table structure for table `usertb`
--

CREATE TABLE `usertb` (
  `id` int(11) NOT NULL,
  `ChooseType` text NOT NULL,
  `Name` text NOT NULL,
  `User` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usertb`
--

INSERT INTO `usertb` (`id`, `ChooseType`, `Name`, `User`, `Password`) VALUES
(1, 'User', 'test22', 'nust2', '1234'),
(2, 'Shop', 'name', 'user', 'password'),
(3, 'Merchant', 'azaza', 'wreeuthue', '9999'),
(4, 'Rider', 'sout', 'qwer', '88888'),
(5, 'User', 'niioo', 'knkl', '7787'),
(6, 'User', 'phan', 'phan', '1234'),
(7, 'Shop', 'sout', 'Anon', '1122'),
(8, '$chooseType', '$name', '$user', '$password'),
(9, 'Shop', 'helloshop', 'hello', '2211');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usertb`
--
ALTER TABLE `usertb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usertb`
--
ALTER TABLE `usertb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

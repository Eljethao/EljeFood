-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2021 at 03:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eljefood`
--

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `ChooseType` text NOT NULL,
  `Name` text NOT NULL,
  `User` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `ChooseType`, `Name`, `User`, `Password`) VALUES
(1, 'User', 'ສົມສັກ', 'user1', '1234'),
(2, 'User', 'TestName2', 'user2', '1234'),
(3, 'Shop', 'TestName3', 'user3', '1234'),
(4, 'User', 'TestName4', 'user4', '1234'),
(5, 'User', 'flutter1', 'f1', '1234'),
(6, 'Shop', 'flutter2', 'f2', '1234'),
(7, 'Shop', 'flutter3', 'f3', '1234'),
(8, 'chooseType', 'name', 'user', 'password'),
(9, 'Shop', 'TestName5', 'user5', '2233'),
(10, 'Shop', 'Test123', 'user6', '1235'),
(11, 'Rider', 'Test7', 'user7', '1234'),
(12, 'Shop', 'Elje', 'LJ', '1122'),
(13, 'Rider', 'Leekong', 'Kong', '1122');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

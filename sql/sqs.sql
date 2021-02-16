-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 13, 2020 at 12:22 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqs`
--
CREATE DATABASE IF NOT EXISTS `sqs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sqs`;

GRANT ALL PRIVILEGES ON sqs.* TO foo@localhost IDENTIFIED BY 'bar';

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(92) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `queue_ID` int(11) NOT NULL,
  `student_NO` bigint(20) NOT NULL,
  `queue_DESC` varchar(2048) NOT NULL,
  `queue_DATE` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_NO` bigint(20) NOT NULL,
  `nick` varchar(64) DEFAULT NULL,
  `pass` varchar(256) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `icon` varchar(18) DEFAULT NULL,
  `theme` varchar(9) DEFAULT NULL,
  `privilege` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_NO`, `nick`, `pass`, `color`, `icon`, `theme`, `privilege`) VALUES
(450338884, NULL, NULL, NULL, NULL, NULL, 0),
(454920851, NULL, NULL, NULL, NULL, NULL, 0),
(455846105, NULL, NULL, NULL, NULL, NULL, 0),
(456787423, NULL, NULL, NULL, NULL, NULL, 0),
(457120517, NULL, NULL, NULL, NULL, NULL, 0),
(459118568, NULL, NULL, NULL, NULL, NULL, 0),
(459193975, NULL, NULL, NULL, NULL, NULL, 0),
(460796279, NULL, NULL, NULL, NULL, NULL, 0),
(460931363, NULL, NULL, NULL, NULL, NULL, 0),
(460950504, NULL, NULL, NULL, NULL, NULL, 0),
(461417065, NULL, NULL, NULL, NULL, NULL, 0),
(463563304, NULL, NULL, NULL, NULL, NULL, 0),
(464874510, NULL, NULL, NULL, NULL, NULL, 0),
(466974839, NULL, NULL, NULL, NULL, NULL, 0),
(467551883, NULL, NULL, NULL, NULL, NULL, 0),
(467621504, NULL, NULL, NULL, NULL, NULL, 0),
(468299219, NULL, NULL, NULL, NULL, NULL, 2),
(468398359, NULL, NULL, NULL, NULL, NULL, 0),
(469825145, NULL, NULL, NULL, NULL, NULL, 0),
(470842368, NULL, NULL, NULL, NULL, NULL, 0),
(470892907, NULL, NULL, NULL, NULL, NULL, 0),
(470913303, NULL, NULL, NULL, NULL, NULL, 0),
(470963201, NULL, NULL, NULL, NULL, NULL, 0),
(470986402, NULL, NULL, NULL, NULL, NULL, 0),
(471011185, NULL, NULL, NULL, NULL, NULL, 0),
(471012861, NULL, NULL, NULL, NULL, NULL, 0),
(471130213, NULL, NULL, NULL, NULL, NULL, 0),
(471211710, NULL, NULL, NULL, NULL, NULL, 0),
(471452001, NULL, NULL, NULL, NULL, NULL, 0),
(471454793, NULL, NULL, NULL, NULL, NULL, 0),
(471457815, NULL, NULL, NULL, NULL, NULL, 0),
(471523347, NULL, NULL, NULL, NULL, NULL, 0),
(471528041, NULL, NULL, NULL, NULL, NULL, 0),
(471533155, NULL, NULL, NULL, NULL, NULL, 0),
(471539043, NULL, NULL, NULL, NULL, NULL, 0),
(471609755, NULL, NULL, NULL, NULL, NULL, 0),
(471614351, NULL, NULL, NULL, NULL, NULL, 0),
(471623027, NULL, NULL, NULL, NULL, NULL, 0),
(471628640, NULL, NULL, NULL, NULL, NULL, 0),
(471936466, NULL, NULL, NULL, NULL, NULL, 0),
(471952608, NULL, NULL, NULL, NULL, NULL, 0),
(471952718, NULL, NULL, NULL, NULL, NULL, 0),
(471967204, NULL, NULL, NULL, NULL, NULL, 0),
(471985206, NULL, NULL, NULL, NULL, NULL, 0),
(471989981, NULL, NULL, NULL, NULL, NULL, 0),
(472003837, NULL, NULL, NULL, NULL, NULL, 0),
(472022858, NULL, NULL, NULL, NULL, NULL, 0),
(472055029, NULL, NULL, NULL, NULL, NULL, 0),
(472059610, NULL, NULL, NULL, NULL, NULL, 0),
(472062799, NULL, NULL, NULL, NULL, NULL, 0),
(472062922, NULL, NULL, NULL, NULL, NULL, 0),
(472077188, NULL, NULL, NULL, NULL, NULL, 0),
(472084492, NULL, NULL, NULL, NULL, NULL, 0),
(472086760, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL,
  `sggestion` varchar(1024) NOT NULL,
  `queue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`queue_ID`),
  ADD KEY `student_NO` (`student_NO`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_NO`);

--
-- Indexes for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `queue_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`student_NO`) REFERENCES `student` (`student_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD CONSTRAINT `suggestion_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`queue_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 01, 2021 at 10:30 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqs`
--

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
-- Table structure for table `logtable`
--

CREATE TABLE `logtable` (
  `id` int(11) NOT NULL,
  `datestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(256) NOT NULL,
  `uid` int(12) NOT NULL,
  `response_code` int(11) NOT NULL,
  `ip_addr` varchar(39) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logtable`
--

INSERT INTO `logtable` (`id`, `datestamp`, `url`, `uid`, `response_code`, `ip_addr`) VALUES
(1, '2021-03-01 03:34:47', '/api?action=showqueue', 1234123499, 200, '');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `queue_ID` int(11) NOT NULL,
  `student_NO` bigint(20) NOT NULL,
  `queue_DESC` varchar(2048) NOT NULL,
  `queue_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_NO` bigint(20) NOT NULL,
  `class_id` int(11) NOT NULL,
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

INSERT INTO `student` (`student_NO`, `class_id`, `nick`, `pass`, `color`, `icon`, `theme`, `privilege`) VALUES
(450338884, 0, NULL, NULL, NULL, NULL, NULL, 0),
(454920851, 0, NULL, NULL, NULL, NULL, NULL, 0),
(455846105, 0, 'nickname', 'password', '000000', 'icon-text', NULL, 1),
(456787423, 0, 'nickname', 'password', '000000', 'icon-text', NULL, 1),
(457120517, 0, NULL, NULL, NULL, NULL, NULL, 0),
(459118568, 0, NULL, NULL, NULL, NULL, NULL, 0),
(459193975, 0, NULL, NULL, NULL, NULL, NULL, 0),
(460796279, 0, NULL, NULL, NULL, NULL, NULL, 0),
(460931363, 0, NULL, NULL, NULL, NULL, NULL, 0),
(460950504, 0, NULL, NULL, NULL, NULL, NULL, 0),
(461417065, 0, NULL, NULL, NULL, NULL, NULL, 0),
(463563304, 0, NULL, NULL, NULL, NULL, NULL, 0),
(464874510, 0, NULL, NULL, NULL, NULL, NULL, 0),
(466974839, 0, NULL, NULL, NULL, NULL, NULL, 0),
(467551883, 0, NULL, NULL, NULL, NULL, NULL, 0),
(467621504, 0, NULL, NULL, NULL, NULL, NULL, 0),
(468299219, 0, NULL, NULL, NULL, NULL, NULL, 2),
(468398359, 0, NULL, NULL, NULL, NULL, NULL, 0),
(469825145, 0, NULL, NULL, NULL, NULL, NULL, 0),
(470842368, 0, NULL, NULL, NULL, NULL, NULL, 0),
(470892907, 0, NULL, NULL, NULL, NULL, NULL, 0),
(470913303, 0, NULL, NULL, NULL, NULL, NULL, 0),
(470963201, 0, NULL, NULL, NULL, NULL, NULL, 0),
(470986402, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471011185, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471012861, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471130213, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471211710, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471452001, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471454793, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471457815, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471523347, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471528041, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471533155, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471539043, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471609755, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471614351, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471623027, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471628640, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471936466, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471952608, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471952718, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471967204, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471985206, 0, NULL, NULL, NULL, NULL, NULL, 0),
(471989981, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472003837, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472022858, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472055029, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472059610, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472062799, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472062922, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472077188, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472084492, 0, NULL, NULL, NULL, NULL, NULL, 0),
(472086760, 0, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
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
-- Indexes for table `logtable`
--
ALTER TABLE `logtable`
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
  ADD PRIMARY KEY (`student_NO`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`),
  ADD KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logtable`
--
ALTER TABLE `logtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `queue_ID` int(11) NOT NULL AUTO_INCREMENT;

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

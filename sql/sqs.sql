-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 02, 2021 at 07:59 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.15

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

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'webdev stage 1'),
(2, 'web dev stage 2'),
(3, 'webtech ');

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
(460931363, 2, NULL, NULL, NULL, NULL, NULL, 0),
(461417065, 2, NULL, NULL, NULL, NULL, NULL, 0),
(465063493, 2, NULL, NULL, NULL, NULL, NULL, 0),
(467551883, 2, NULL, NULL, NULL, NULL, NULL, 0),
(468299219, 2, 'fragspawn', 'asdfasdf', NULL, NULL, NULL, 2),
(470842368, 2, NULL, NULL, NULL, NULL, NULL, 0),
(470892907, 2, NULL, NULL, NULL, NULL, NULL, 0),
(470957194, 2, NULL, NULL, NULL, NULL, NULL, 0),
(470963201, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471011185, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471012861, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471243153, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471457815, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471523347, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471528041, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471533155, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471614351, 2, NULL, NULL, NULL, NULL, NULL, 0),
(471952718, 2, NULL, NULL, NULL, NULL, NULL, 0),
(472059610, 2, NULL, NULL, NULL, NULL, NULL, 0),
(472062799, 2, NULL, NULL, NULL, NULL, NULL, 0),
(472077188, 2, NULL, NULL, NULL, NULL, NULL, 0),
(472084492, 2, NULL, NULL, NULL, NULL, NULL, 0),
(472086760, 2, NULL, NULL, NULL, NULL, NULL, 0),
(472487169, 2, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL,
  `student_id` bigint(11) NOT NULL,
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
  ADD KEY `student_id` (`student_id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`student_NO`) REFERENCES `student` (`student_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD CONSTRAINT `suggestion_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `suggestion_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`queue_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

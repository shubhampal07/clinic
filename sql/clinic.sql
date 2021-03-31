-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2020 at 05:44 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL,
  `patient_doctor_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_type` smallint(6) NOT NULL DEFAULT '1' COMMENT 'for future use, 1 is default',
  `create_date` int(11) NOT NULL,
  `last_edit_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE IF NOT EXISTS `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name_en` varchar(50) DEFAULT NULL,
  `drug_name_fa` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `memo` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`drug_id`, `drug_name_en`, `drug_name_fa`, `category`, `price`, `num`, `memo`) VALUES
(1, 'painkiller', 'crocin', 'headach', '20', 0, 'headach pain killer');

-- --------------------------------------------------------

--
-- Table structure for table `drug_patient`
--

CREATE TABLE IF NOT EXISTS `drug_patient` (
  `drug_patient_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id_assign` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT '1',
  `total_cost` decimal(10,0) NOT NULL,
  `user_id_discharge` int(11) DEFAULT NULL,
  `discharge_date` int(11) DEFAULT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(10) unsigned NOT NULL,
  `name` varchar(48) NOT NULL,
  `description` text NOT NULL,
  `roles` bigint(20) unsigned NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `description`, `roles`) VALUES
(1, 'Administrator', '', 1),
(2, 'Guest', '', 2),
(3, 'Doctor', '', 4),
(4, 'X-Ray Agent', '', 8),
(5, 'Laboratory Agent', '', 16),
(6, 'Pharmacy Agent', '', 32),
(7, 'Receptionist', '', 64),
(8, 'Patient', '', 128);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE IF NOT EXISTS `lab` (
  `test_id` int(11) NOT NULL,
  `test_name_en` varchar(50) DEFAULT NULL,
  `test_name_fa` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `memo` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`test_id`, `test_name_en`, `test_name_fa`, `category`, `price`, `memo`) VALUES
(1, 'blood', 'wbc', 'maleria', '500', 'wbc check up');

-- --------------------------------------------------------

--
-- Table structure for table `lab_files`
--

CREATE TABLE IF NOT EXISTS `lab_files` (
  `lab_file_id` int(11) NOT NULL,
  `lab_patient_id` int(11) NOT NULL,
  `upload_date` int(11) NOT NULL,
  `path` text NOT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_patient`
--

CREATE TABLE IF NOT EXISTS `lab_patient` (
  `lab_patient_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id_assign` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT '1',
  `total_cost` decimal(10,0) NOT NULL,
  `user_id_discharge` int(11) DEFAULT NULL,
  `discharge_date` int(11) DEFAULT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `login_id` int(10) unsigned NOT NULL,
  `ip_address` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `success` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`login_id`, `ip_address`, `user_id`, `time`, `success`) VALUES
(1, 0, 1, '2020-02-18 11:06:49', 1),
(2, 0, 2, '2020-02-18 12:41:27', 1),
(3, 0, 3, '2020-02-18 12:42:32', 1),
(4, 0, 4, '2020-02-18 12:44:06', 1),
(5, 0, 5, '2020-02-18 12:45:03', 1),
(6, 0, 0, '2020-02-20 10:12:39', 0),
(7, 0, 1, '2020-02-20 10:13:08', 1),
(8, 0, 2, '2020-02-20 10:13:46', 1),
(9, 0, 4, '2020-02-20 10:14:47', 0),
(10, 0, 4, '2020-02-20 10:14:57', 1),
(11, 0, 2, '2020-02-20 10:15:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `social_id` varchar(12) DEFAULT NULL,
  `id_type` enum('','Aadhar','Passport','Driver License','Bank ID Card') DEFAULT NULL,
  `birth_date` int(11) DEFAULT NULL,
  `create_date` int(11) NOT NULL,
  `picture` text,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient_doctor`
--

CREATE TABLE IF NOT EXISTS `patient_doctor` (
  `patient_doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `visit_date` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_drugs`
--

CREATE TABLE IF NOT EXISTS `purchased_drugs` (
  `purchased_drug_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_date` int(11) NOT NULL,
  `purchase_price` decimal(10,0) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT '1',
  `total_cost` decimal(10,0) NOT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` text,
  `url` text,
  `description` text,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `returned_drugs`
--

CREATE TABLE IF NOT EXISTS `returned_drugs` (
  `returned_drug_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `return_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT '1',
  `total_cost` decimal(10,0) NOT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE IF NOT EXISTS `userdata` (
  `userdata_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `position` varchar(40) NOT NULL,
  `social_id` varchar(12) NOT NULL,
  `id_type` enum('','Aadhar','Passport','Driver License','Bank ID Card') DEFAULT 'Aadhar',
  `birth_date` int(11) DEFAULT NULL,
  `create_date` int(11) NOT NULL,
  `picture` text,
  `memo` text
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`userdata_id`, `user_id`, `first_name`, `last_name`, `fname`, `gender`, `email`, `phone`, `address`, `position`, `social_id`, `id_type`, `birth_date`, `create_date`, `picture`, `memo`) VALUES
(1, 1, 'shruti', 'si', 'snu', 0, 'shrutik@gmail.com', '1324567489', 'assssssss', 'admin', '', 'Passport', 1037314800, 1582040199, NULL, ''),
(2, 2, 'shruti', 'k', 'dad', 0, 'shruti@gmail.com', '1472583695', 'safv  ffv', 'doctor', '', 'Aadhar', 957564000, 1582044891, NULL, ''),
(3, 3, 'pooja', 'm', 'father', 1, 'pooja@gmail.com', '1236547895', 'fghv', 'xray', '', 'Aadhar', 960242400, 1582045419, NULL, ''),
(4, 4, 'bhumika', 't', 'papa', 0, 'd@gmail.com', '7894561234', 'fghv', 'lab', '', 'Aadhar', 936828000, 1582045517, NULL, ''),
(5, 5, 'neha', 'k', 'dad', 0, 'miranda@repeatxdu.com', '4561237894', 'vndhm mdkkj', 'pharmacy', '', 'Driver License', 830988000, 1582045603, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  `password_last_set` datetime NOT NULL,
  `password_never_expires` tinyint(1) NOT NULL DEFAULT '0',
  `remember_me` varchar(40) NOT NULL,
  `activation_code` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `forgot_code` varchar(40) NOT NULL,
  `forgot_generated` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL,
  `last_login_ip` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `password_last_set`, `password_never_expires`, `remember_me`, `activation_code`, `active`, `forgot_code`, `forgot_generated`, `enabled`, `last_login`, `last_login_ip`) VALUES
(1, 'sam123', '$2a$08$/K8ceznCKFRqJhj9SAggfuIpsGW99FAt2yd1KbhhvRHQq3jIqOADa', '2020-02-18 18:08:27', 0, '', '', 1, '', '0000-00-00 00:00:00', 1, '2020-02-20 15:43:07', 0),
(2, 'shruti', '$2a$08$tDKhLDVv.TZLRwrvitgWzuEcDZPJk.JIoIc6v0n2qRJx69XFRWPC6', '2020-02-18 17:54:51', 0, '', '', 1, '', '0000-00-00 00:00:00', 1, '2020-02-20 15:45:47', 0),
(3, 'pooja', '$2a$08$KTjPXKwg/qJfuG8LjeHEM.76wqMkPwloCzfe5goImIeV.Olfi52yC', '2020-02-18 18:03:39', 0, '', '', 1, '', '0000-00-00 00:00:00', 1, '2020-02-18 18:12:31', 0),
(4, 'bhumika', '$2a$08$9rghv.6f/j0aaG2cNSjFGeBPYYzIvfC.SU2.j2PH.QraMxd2sP/gm', '2020-02-18 18:05:17', 0, '', '', 1, '', '0000-00-00 00:00:00', 1, '2020-02-20 15:44:57', 0),
(5, 'neha', '$2a$08$uO.ssk5YtRH0Af7K/lvunuMB6866noNhjt04WZrmAh9H9wR3yn24u', '2020-02-18 18:06:43', 0, '', '', 1, '', '0000-00-00 00:00:00', 1, '2020-02-18 18:15:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `assoc_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`assoc_id`, `user_id`, `group_id`) VALUES
(6, 1, 1),
(2, 2, 3),
(3, 3, 4),
(4, 4, 5),
(5, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `xrays`
--

CREATE TABLE IF NOT EXISTS `xrays` (
  `xray_id` int(11) NOT NULL,
  `xray_name_en` varchar(50) DEFAULT NULL,
  `xray_name_fa` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `memo` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xrays`
--

INSERT INTO `xrays` (`xray_id`, `xray_name_en`, `xray_name_fa`, `category`, `price`, `memo`) VALUES
(1, 'elbow', 'left', 'hand', '200', 'broken');

-- --------------------------------------------------------

--
-- Table structure for table `xray_files`
--

CREATE TABLE IF NOT EXISTS `xray_files` (
  `xray_file_id` int(11) NOT NULL,
  `xray_patient_id` int(11) NOT NULL,
  `upload_date` int(11) NOT NULL,
  `path` text NOT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xray_patient`
--

CREATE TABLE IF NOT EXISTS `xray_patient` (
  `xray_patient_id` int(11) NOT NULL,
  `xray_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id_assign` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT '1',
  `total_cost` decimal(10,0) NOT NULL,
  `user_id_discharge` int(11) DEFAULT NULL,
  `discharge_date` int(11) DEFAULT NULL,
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `patient_doctor_id` (`patient_doctor_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `drug_patient`
--
ALTER TABLE `drug_patient`
  ADD PRIMARY KEY (`drug_patient_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id_assign` (`user_id_assign`),
  ADD KEY `user_id_discharge` (`user_id_discharge`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `lab_files`
--
ALTER TABLE `lab_files`
  ADD PRIMARY KEY (`lab_file_id`),
  ADD KEY `lab_patient_id` (`lab_patient_id`);

--
-- Indexes for table `lab_patient`
--
ALTER TABLE `lab_patient`
  ADD PRIMARY KEY (`lab_patient_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id_assign` (`user_id_assign`),
  ADD KEY `user_id_discharge` (`user_id_discharge`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  ADD PRIMARY KEY (`patient_doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `purchased_drugs`
--
ALTER TABLE `purchased_drugs`
  ADD PRIMARY KEY (`purchased_drug_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `returned_drugs`
--
ALTER TABLE `returned_drugs`
  ADD PRIMARY KEY (`returned_drug_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`userdata_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`assoc_id`),
  ADD KEY `user_id` (`user_id`,`group_id`);

--
-- Indexes for table `xrays`
--
ALTER TABLE `xrays`
  ADD PRIMARY KEY (`xray_id`);

--
-- Indexes for table `xray_files`
--
ALTER TABLE `xray_files`
  ADD PRIMARY KEY (`xray_file_id`),
  ADD KEY `xray_patient_id` (`xray_patient_id`);

--
-- Indexes for table `xray_patient`
--
ALTER TABLE `xray_patient`
  ADD PRIMARY KEY (`xray_patient_id`),
  ADD KEY `xray_id` (`xray_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id_assign` (`user_id_assign`),
  ADD KEY `user_id_discharge` (`user_id_discharge`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `drug_patient`
--
ALTER TABLE `drug_patient`
  MODIFY `drug_patient_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lab_files`
--
ALTER TABLE `lab_files`
  MODIFY `lab_file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lab_patient`
--
ALTER TABLE `lab_patient`
  MODIFY `lab_patient_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  MODIFY `patient_doctor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchased_drugs`
--
ALTER TABLE `purchased_drugs`
  MODIFY `purchased_drug_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `returned_drugs`
--
ALTER TABLE `returned_drugs`
  MODIFY `returned_drug_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `userdata_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `assoc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `xrays`
--
ALTER TABLE `xrays`
  MODIFY `xray_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `xray_files`
--
ALTER TABLE `xray_files`
  MODIFY `xray_file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_patient`
--
ALTER TABLE `xray_patient`
  MODIFY `xray_patient_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

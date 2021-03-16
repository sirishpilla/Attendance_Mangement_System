-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2018 at 03:21 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `attendance_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `student` varchar(40) DEFAULT NULL,
  `regno` varchar(40) DEFAULT NULL,
  `week` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unit` int(10) unsigned DEFAULT NULL,
  `attended` varchar(40) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  KEY `unit` (`unit`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`student`, `regno`, `week`, `date`, `unit`, `attended`, `id`) VALUES
('TED/118/16', 'TED/118/16', '1', '2018-01-30', 2, '1', 1),
('COM/016/16', 'COM/016/16', '1', '2018-01-30', 1, '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`) VALUES
(1, 'Technology Education'),
(2, 'Computer Science'),
(3, 'Bussiness Administration');

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE IF NOT EXISTS `membership_grouppermissions` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'students', 1, 3, 3, 3),
(2, 2, 'units', 1, 3, 3, 3),
(3, 2, 'courses', 1, 3, 3, 3),
(4, 2, 'attendance', 1, 3, 3, 3),
(5, 3, 'students', 1, 1, 1, 1),
(6, 3, 'units', 1, 1, 1, 1),
(7, 3, 'courses', 1, 1, 1, 1),
(8, 3, 'attendance', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE IF NOT EXISTS `membership_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-01-30', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-01-30', 0, 1),
(3, 'Lecturer', 'lecturers can join group and add their courses and units and their students', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE IF NOT EXISTS `membership_userpermissions` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `membership_userpermissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE IF NOT EXISTS `membership_userrecords` (
  `recID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) unsigned DEFAULT NULL,
  `dateUpdated` bigint(20) unsigned DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`recID`),
  KEY `pkValue` (`pkValue`),
  KEY `tableName` (`tableName`),
  KEY `memberID` (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'courses', '1', 'admin', 1517324670, 1517324670, 2),
(2, 'courses', '2', 'admin', 1517324701, 1517324701, 2),
(3, 'courses', '3', 'admin', 1517324738, 1517324738, 2),
(4, 'units', '1', 'admin', 1517324782, 1517324782, 2),
(5, 'units', '2', 'admin', 1517324809, 1517324809, 2),
(6, 'students', 'TED/118/16', 'admin', 1517324964, 1517324964, 2),
(7, 'students', 'COM/016/16', 'admin', 1517325016, 1517325016, 2),
(8, 'students', 'BBA/09/16', 'admin', 1517325066, 1517325066, 2),
(9, 'attendance', '1', 'admin', 1517325147, 1517325147, 2),
(10, 'attendance', '2', 'admin', 1517325189, 1517325189, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE IF NOT EXISTS `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) unsigned DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('guest', NULL, NULL, '2018-01-30', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-01-30', NULL, NULL),
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2018-01-30', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-01-30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `regno` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `course` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`regno`),
  KEY `course` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`regno`, `name`, `course`) VALUES
('TED/118/16', 'John Doe', '1'),
('COM/016/16', 'Mark Zuckerburg', '2'),
('BBA/09/16', 'Bill Gates', '3');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'IRD 200'),
(2, 'EDF 211');

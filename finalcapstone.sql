-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2023 at 05:21 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalcapstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `admindetails`
--

CREATE TABLE `admindetails` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admindetails`
--

INSERT INTO `admindetails` (`id`, `firstname`, `middlename`, `lastname`, `department`, `role`) VALUES
(1, 'Christian Emmanuel', 'Avecilla', 'Pastrana', 'IT', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `userlogin` varchar(25) DEFAULT NULL,
  `userpassword` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `userlogin`, `userpassword`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `lessonID` int(11) DEFAULT NULL,
  `subjectname` varchar(20) DEFAULT NULL,
  `quarterID` int(11) DEFAULT NULL,
  `sectionname` varchar(50) DEFAULT NULL,
  `section1` longtext DEFAULT NULL,
  `section2` longtext DEFAULT NULL,
  `section3` longtext DEFAULT NULL,
  `section4` longtext DEFAULT NULL,
  `section5` longtext DEFAULT NULL,
  `section6` longtext DEFAULT NULL,
  `section7` longtext DEFAULT NULL,
  `section8` longtext DEFAULT NULL,
  `section9` longtext DEFAULT NULL,
  `section10` longtext DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateAvailableUntil` date DEFAULT NULL,
  `lessonvisibility` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quarters`
--

CREATE TABLE `quarters` (
  `id` int(11) NOT NULL,
  `quarterperiod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `sectionname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionname`) VALUES
('testsection1'),
('testsection2'),
('testsection3'),
('testsection4');

-- --------------------------------------------------------

--
-- Table structure for table `studentlogins`
--

CREATE TABLE `studentlogins` (
  `id` int(11) NOT NULL,
  `studentID` varchar(25) DEFAULT NULL,
  `studentpassword` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentlogins`
--

INSERT INTO `studentlogins` (`id`, `studentID`, `studentpassword`) VALUES
(1, '2020-20001', 'janraymarc'),
(2, '2020-20002', 'christian'),
(3, '2020-20003', 'justroilon'),
(4, '2020-20004', 'marcramos');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentID` varchar(25) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `suffix` varchar(15) DEFAULT NULL,
  `yearlevel` varchar(15) DEFAULT NULL,
  `sectionname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentID`, `firstname`, `middlename`, `lastname`, `suffix`, `yearlevel`, `sectionname`) VALUES
('2020-20001', 'Jan Raymarc', 'D', 'Mercado', 'JR.', 'test1', 'testsection1'),
('2020-20002', 'Christian Emmanuel', 'Avecilla', 'Pastrana', 'Sr.', 'test2', 'testsection2'),
('2020-20003', 'Justroilon', 'C', 'Rico', 'VIII', 'test3', 'testsection3'),
('2020-20004', 'Marc', 'Casupang', 'Ramos', 'IV', 'test4', 'testsection4');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subjectid` varchar(15) DEFAULT NULL,
  `subjectname` varchar(20) NOT NULL,
  `sectionname` varchar(50) DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `visibility` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subjectid`, `subjectname`, `sectionname`, `teacherid`, `visibility`) VALUES
(1, 'test-for-deleti', 'delete this', 'testsection4', 2, 'Invisible'),
(2, 'Math-001', 'Mathematics', 'testsection1', 1, 'Visible'),
(3, 'Math-002', 'Mathematics 2', 'testsection2', 2, 'Visible'),
(4, 'test', 'test', 'testsection3', 2, 'Invisible');

-- --------------------------------------------------------

--
-- Table structure for table `teacherdetails`
--

CREATE TABLE `teacherdetails` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacherdetails`
--

INSERT INTO `teacherdetails` (`id`, `firstname`, `middlename`, `lastname`, `department`) VALUES
(1, 'Christian Emmanuel', 'Avecilla', 'Pastrana', 'Information Technology'),
(2, 'Justroilon', 'C', 'Rico', 'MAPEH');

-- --------------------------------------------------------

--
-- Table structure for table `teacherlogin`
--

CREATE TABLE `teacherlogin` (
  `id` int(11) NOT NULL,
  `userlogin` varchar(25) DEFAULT NULL,
  `userpassword` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacherlogin`
--

INSERT INTO `teacherlogin` (`id`, `userlogin`, `userpassword`) VALUES
(1, 'mceapastrana', 'mceapastrana'),
(2, 'mjcrico', 'mjcrico');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admindetails`
--
ALTER TABLE `admindetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectname` (`subjectname`),
  ADD KEY `quarterID` (`quarterID`),
  ADD KEY `sectionname` (`sectionname`);

--
-- Indexes for table `quarters`
--
ALTER TABLE `quarters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sectionname`);

--
-- Indexes for table `studentlogins`
--
ALTER TABLE `studentlogins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_studentlogins_students` (`studentID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `sectionname` (`sectionname`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sectionname` (`sectionname`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `subjectname` (`subjectname`);

--
-- Indexes for table `teacherdetails`
--
ALTER TABLE `teacherdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacherlogin`
--
ALTER TABLE `teacherlogin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quarters`
--
ALTER TABLE `quarters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studentlogins`
--
ALTER TABLE `studentlogins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacherlogin`
--
ALTER TABLE `teacherlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admindetails`
--
ALTER TABLE `admindetails`
  ADD CONSTRAINT `admindetails_ibfk_1` FOREIGN KEY (`id`) REFERENCES `adminlogin` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`subjectname`) REFERENCES `subjects` (`subjectname`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`quarterID`) REFERENCES `quarters` (`id`),
  ADD CONSTRAINT `lessons_ibfk_3` FOREIGN KEY (`sectionname`) REFERENCES `sections` (`sectionname`) ON DELETE CASCADE;

--
-- Constraints for table `studentlogins`
--
ALTER TABLE `studentlogins`
  ADD CONSTRAINT `fk_studentlogins_students` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `studentlogins_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`sectionname`) REFERENCES `sections` (`sectionname`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`sectionname`) REFERENCES `sections` (`sectionname`),
  ADD CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacherdetails` (`id`);

--
-- Constraints for table `teacherdetails`
--
ALTER TABLE `teacherdetails`
  ADD CONSTRAINT `teacherdetails_ibfk_1` FOREIGN KEY (`id`) REFERENCES `teacherlogin` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

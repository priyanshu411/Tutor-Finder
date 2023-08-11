-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 10:51 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutor_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `cId` tinyint(4) NOT NULL,
  `cName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`cId`, `cName`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, 'B.Com'),
(14, 'M.com'),
(15, 'BBA'),
(16, 'MBA'),
(17, 'BCA'),
(18, 'MCA'),
(19, 'BSc'),
(20, 'MSc'),
(21, 'B Tech'),
(22, 'M Tech'),
(23, 'B Pharma'),
(24, 'M Pharma');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Temail` varchar(50) NOT NULL,
  `Semail` varchar(50) NOT NULL,
  `contact_date` timestamp NULL DEFAULT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Temail`, `Semail`, `contact_date`, `contact_info`, `status`) VALUES
('priyanshug19@gmail.com', 'ram50@gmail.com', '2021-09-01 14:00:00', 'meet code :scm-qbei-koh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Semail` varchar(50) NOT NULL,
  `pmobile` varchar(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `board` varchar(20) DEFAULT '----',
  `medium` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Semail`, `pmobile`, `class`, `board`, `medium`) VALUES
('priyanshug@gmail.com', '5664589562', 'BCA', 'Select Board', 'English'),
('ram50@gmail.com', '4556231456', 'BCA', 'Select Board', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sub_id` tinyint(4) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_id`, `subject`) VALUES
(1, 'Mathematics'),
(2, 'Hindi'),
(3, 'english'),
(4, 'Sanskrit'),
(5, 'Evs'),
(6, 'Social Science'),
(7, 'Physics'),
(8, 'Chemistry'),
(9, 'Biology'),
(10, 'Computer Science'),
(11, 'Business Studies'),
(12, 'Accountancy'),
(13, 'Economics'),
(14, 'Electronics'),
(15, 'Operating System'),
(16, 'C Language'),
(17, 'C++  Language'),
(18, 'JAVA Language'),
(19, 'Microprocessor and Assembly Language Programming'),
(20, 'Cloud Computing'),
(21, 'DBMS');

-- --------------------------------------------------------

--
-- Table structure for table `teach`
--

CREATE TABLE `teach` (
  `class_id` tinyint(4) NOT NULL,
  `Temail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teach`
--

INSERT INTO `teach` (`class_id`, `Temail`) VALUES
(1, 'priyanshug19@gmail.com'),
(2, 'priyanshug19@gmail.com'),
(3, 'priyanshug19@gmail.com'),
(4, 'priyanshug19@gmail.com'),
(5, 'priyanshug19@gmail.com'),
(11, 'priyanshug19@gmail.com'),
(12, 'priyanshug19@gmail.com'),
(17, 'priyanshug19@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `Temail` varchar(50) NOT NULL,
  `qualification` varchar(20) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `coaching` varchar(50) DEFAULT '----',
  `rating` tinyint(1) DEFAULT 0,
  `subject` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`Temail`, `qualification`, `degree`, `coaching`, `rating`, `subject`) VALUES
('priyanshug19@gmail.com', 'Undergraduate', 'BCA', 'gupta coaching', 0, '(2)(3)(10)(12)(16)(18)(21)');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `userType` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `landmark` varchar(20) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `name`, `userType`, `gender`, `address`, `city`, `landmark`, `pincode`, `password`) VALUES
('priyanshug19@gmail.com', 'priyanshu gupta', 'teacher', 'male', 'indore', 'indore', 'bada ganpati mandir', '452002', '12345'),
('priyanshug@gmail.com', 'priyanshu gupta', 'student', 'male', 'indore', 'indore', 'bada ganpati mandir', '452002', '12345'),
('ram50@gmail.com', 'Ram gupta', 'student', 'male', 'indore', 'indore', 'bada ganpati mandir', '452002', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD KEY `Semail` (`Semail`),
  ADD KEY `Temail` (`Temail`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD KEY `Semail` (`Semail`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `teach`
--
ALTER TABLE `teach`
  ADD KEY `class_id` (`class_id`),
  ADD KEY `Temail` (`Temail`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD KEY `teacher_ibfk_1` (`Temail`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `cId` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `sub_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`Semail`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`Temail`) REFERENCES `users` (`email`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Semail`) REFERENCES `users` (`email`);

--
-- Constraints for table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`cId`),
  ADD CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`Temail`) REFERENCES `users` (`email`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`Temail`) REFERENCES `users` (`email`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

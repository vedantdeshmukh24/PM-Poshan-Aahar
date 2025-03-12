-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Jul 21, 2023 at 12:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pm_poshan_aahar_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attend_id` int(11) NOT NULL,
  `stud_id` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `month` varchar(10) NOT NULL,
  `present_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attend_id`, `stud_id`, `school_id`, `month`, `present_days`) VALUES
(1, 1, 1, '2023-07', 20),
(2, 2, 1, '2023-07', 25),
(3, 3, 1, '2023-07', 25),
(5, 9, 1, '2023-07', 24),
(6, 10, 9, '2023-07', 15),
(7, 11, 9, '2023-07', 20),
(11, 13, 8, '2023-07', 25),
(12, 14, 8, '2023-07', 28),
(13, 15, 7, '2023-07', 25),
(14, 16, 7, '2023-07', 25),
(15, 17, 10, '2023-07', 20),
(16, 18, 11, '2023-07', 25),
(17, 19, 11, '2023-07', 20);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `comp_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`comp_id`, `school_id`, `description`, `timestamp`) VALUES
(1, 1, 'Food quality issue', '2023-07-05 10:15:00'),
(3, 1, 'Insufficient quantity', '2023-07-07 09:45:00'),
(4, 8, 'Delayed delivery of supplies', '2023-07-19 12:27:01'),
(11, 9, 'Bad quality', '2023-07-21 02:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `growth`
--

CREATE TABLE `growth` (
  `id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `growth`
--

INSERT INTO `growth` (`id`, `school_id`, `student_id`, `height`, `weight`, `date`) VALUES
(1, 1, 1, 150.5, 50.2, '2023-07-01'),
(2, 1, 2, 155.2, 52.8, '2023-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `mealitem`
--

CREATE TABLE `mealitem` (
  `item_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `units` enum('piece','gram','kilogram','packet','dozen','litre') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mealitem`
--

INSERT INTO `mealitem` (`item_id`, `name`, `quantity`, `units`) VALUES
(1, 'Rice', 200, 'gram'),
(2, 'Banana', 1, 'dozen'),
(3, 'Biscuit', 2, 'packet'),
(5, 'Bournvita', 1, 'packet');

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `req_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `month` varchar(10) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`req_id`, `school_id`, `item_id`, `sup_id`, `quantity`, `month`, `status`) VALUES
(1, 1, 1, 1, 24000, '2023-07', 'Delivered'),
(2, 1, 2, 8, 120, '2023-07', 'Delivered'),
(4, 8, 2, 8, 100, '2023-07', 'Delivered'),
(5, 8, 1, 8, 100, '2023-07', 'Delivered'),
(29, 1, 1, 2, 5200, '2023-08', 'Delivered'),
(30, 1, 2, NULL, 26, '2023-08', 'Pending'),
(31, 1, 3, NULL, 52, '2023-08', 'Pending'),
(35, 9, 1, 1, 5000, '2023-08', 'Delivered'),
(36, 9, 2, NULL, 25, '2023-08', 'Pending'),
(37, 9, 3, 1, 50, '2023-08', 'Approved'),
(44, 10, 1, 1, 4000, '2023-08', 'Delivered'),
(45, 10, 2, NULL, 20, '2023-08', 'Pending'),
(46, 10, 3, NULL, 40, '2023-08', 'Pending'),
(47, 9, 5, 1, 35, '2023-08', 'Delivered'),
(48, 10, 5, 8, 20, '2023-08', 'Delivered'),
(49, 11, 1, 1, 9000, '2023-08', 'Delivered'),
(50, 11, 2, NULL, 45, '2023-08', 'Pending'),
(51, 11, 3, NULL, 90, '2023-08', 'Pending'),
(52, 11, 5, 1, 45, '2023-08', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `school_username` varchar(50) DEFAULT NULL,
  `school_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`school_id`, `name`, `address`, `contact`, `school_username`, `school_password`) VALUES
(1, 'R. C. Patel Institute of Technology, Shirpur', 'Nimzari Naka, Shirpur', '123-456-7890', 'rcpit', '1234'),
(7, 'Jayhind High School, Dhule', 'Deopur, Dhule', '444-333-5555', 'jaihind', '1234'),
(8, 'Podar International School', 'Nandurbar', '444-555-6666', 'podar', '1234'),
(9, 'College of Engineering, Pune', 'Shivaji Nagar, Pune', '666-111-4444', 'coep', '1234'),
(10, 'Nemsushil Vidyamandir, Taloda', 'Taloda, Nandurbar', '555-444-2222', 'Nemsushil', '1234'),
(11, 'Chavara English School, Shahada', 'Shahada, Nandurbar', '111-555-8888', 'chavara', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `school_id`, `name`, `height`, `weight`) VALUES
(1, 1, 'Pruthviraj Chaudhari', 140, 45),
(2, 1, 'Sandip Kankhare', 150, 50),
(3, 1, 'Gopal Patil', 145, 40),
(9, 1, 'Bhumika Mahale', 130, 40),
(10, 9, 'Lakshit Tawale', 160, 65),
(11, 9, 'Bhushan Sawai', 165, 60),
(13, 8, 'Falguni Bharati', 140, 45),
(14, 8, 'Bhavika Parekh', 145, 40),
(15, 7, 'Mahesh Chaudhari', 170, 65),
(16, 7, 'Vishwajeet Patil', 160, 60),
(17, 10, 'Mayur Hire', 160, 70),
(18, 11, 'Dipak Bhachhav', 160, 50),
(19, 11, 'Yash Deokar', 150, 60);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `sup_username` varchar(50) DEFAULT NULL,
  `sup_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`sup_id`, `name`, `contact`, `sup_username`, `sup_password`) VALUES
(1, 'Sanjay Traders', '111-222-3333', 'sanjay', '1234'),
(2, 'Vikram Fruits', '444-555-6666', 'vikram', '1234'),
(8, 'Prakash Fruits', '555-444-1212', 'prakash', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attend_id`),
  ADD KEY `attendance_ibfk_1` (`stud_id`),
  ADD KEY `test` (`school_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`comp_id`),
  ADD KEY `complaint_ibfk_1` (`school_id`);

--
-- Indexes for table `growth`
--
ALTER TABLE `growth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `growth_ibfk_1` (`school_id`),
  ADD KEY `growth_ibfk_2` (`student_id`);

--
-- Indexes for table `mealitem`
--
ALTER TABLE `mealitem`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `requirement_ibfk_1` (`school_id`),
  ADD KEY `requirement_ibfk_2` (`item_id`),
  ADD KEY `requirement_ibfk_3` (`sup_id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`school_id`),
  ADD UNIQUE KEY `school_username` (`school_username`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`),
  ADD KEY `student_ibfk_1` (`school_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`sup_id`),
  ADD UNIQUE KEY `sup_username` (`sup_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `comp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `growth`
--
ALTER TABLE `growth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mealitem`
--
ALTER TABLE `mealitem`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `test` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `growth`
--
ALTER TABLE `growth`
  ADD CONSTRAINT `growth_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `growth_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`stud_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `requirement_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `mealitem` (`item_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `requirement_ibfk_3` FOREIGN KEY (`sup_id`) REFERENCES `supplier` (`sup_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2021 at 10:39 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_books`
--

CREATE TABLE `a_books` (
  `ID` int(32) NOT NULL,
  `Title` varchar(32) NOT NULL,
  `Author` varchar(32) NOT NULL,
  `Genre_ID` int(32) NOT NULL,
  `Publish_YR` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_books`
--

INSERT INTO `a_books` (`ID`, `Title`, `Author`, `Genre_ID`, `Publish_YR`) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 2, 2000),
(2, '1984', 'George Orwell', 2, 1925);

-- --------------------------------------------------------

--
-- Table structure for table `a_genre`
--

CREATE TABLE `a_genre` (
  `Genre_ID` int(32) NOT NULL,
  `Genre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_genre`
--

INSERT INTO `a_genre` (`Genre_ID`, `Genre`) VALUES
(1, 'Suspense'),
(2, 'Novel'),
(3, 'Horro');

-- --------------------------------------------------------

--
-- Table structure for table `b_departments`
--

CREATE TABLE `b_departments` (
  `Department_ID` int(32) NOT NULL,
  `Department` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_departments`
--

INSERT INTO `b_departments` (`Department_ID`, `Department`) VALUES
(1, 'BSIT'),
(2, 'BSHM'),
(3, 'BSN');

-- --------------------------------------------------------

--
-- Table structure for table `b_students`
--

CREATE TABLE `b_students` (
  `Student_ID` int(32) NOT NULL,
  `Department_ID` int(32) NOT NULL,
  `Year_ID` int(11) NOT NULL,
  `First_Name` varchar(32) NOT NULL,
  `Last_Name` varchar(32) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Contact` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_students`
--

INSERT INTO `b_students` (`Student_ID`, `Department_ID`, `Year_ID`, `First_Name`, `Last_Name`, `Email`, `Contact`) VALUES
(1, 1, 15, 'Garred', 'Paguio', 'garredaldane@gnc.edu.ph', '09997966997'),
(2, 1, 15, 'Kimberly', 'Manalang', 'kimberlymanalng@gnc.edu.ph', '09997911227'),
(3, 1, 15, 'Kurt', 'Cruz', 'kurtcruz@gnc.edu.ph', '09678652892'),
(4, 1, 15, 'Joshy', 'Bueneventura', 'joshybueneventura@gnc.edu.ph', '09864673829'),
(5, 2, 13, 'Gia', 'Lopez', 'gialopez@gnc.edu.ph', '09765765927');

-- --------------------------------------------------------

--
-- Table structure for table `b_year_level`
--

CREATE TABLE `b_year_level` (
  `Year_ID` int(32) NOT NULL,
  `Level` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_year_level`
--

INSERT INTO `b_year_level` (`Year_ID`, `Level`) VALUES
(1, 'Grade 1'),
(2, 'Grade 2'),
(3, 'Garde 3'),
(4, 'Grade 4'),
(5, 'Grade 5'),
(6, 'Grade 6'),
(7, 'Grade 7'),
(8, 'Grade 8'),
(9, 'Grade 9'),
(10, 'Grade 10'),
(11, 'Grade 11'),
(12, 'Grade 12'),
(13, '1st year college'),
(14, '2nd year college'),
(15, '3rd year college'),
(16, '4th yr college');

-- --------------------------------------------------------

--
-- Table structure for table `c_borrowers`
--

CREATE TABLE `c_borrowers` (
  `Borrower_ID` int(32) NOT NULL,
  `Student_ID` varchar(32) NOT NULL,
  `Book_ID` varchar(32) NOT NULL,
  `First_name` varchar(32) NOT NULL,
  `Last_name` varchar(32) NOT NULL,
  `Department` int(32) NOT NULL,
  `Year_Level` int(32) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Borrowed_Date` date NOT NULL DEFAULT current_timestamp(),
  `Return_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_borrowers`
--

INSERT INTO `c_borrowers` (`Borrower_ID`, `Student_ID`, `Book_ID`, `First_name`, `Last_name`, `Department`, `Year_Level`, `Email`, `Borrowed_Date`, `Return_Date`) VALUES
(1, 'asdad', '1', 'Hello', 'asdasd', 2, 4, '', '2021-11-10', '2021-11-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_books`
--
ALTER TABLE `a_books`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Genre_ID` (`Genre_ID`) USING BTREE;

--
-- Indexes for table `a_genre`
--
ALTER TABLE `a_genre`
  ADD PRIMARY KEY (`Genre_ID`);

--
-- Indexes for table `b_departments`
--
ALTER TABLE `b_departments`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `b_students`
--
ALTER TABLE `b_students`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `Department_ID` (`Department_ID`) USING BTREE,
  ADD KEY `Year_ID` (`Year_ID`) USING BTREE;

--
-- Indexes for table `b_year_level`
--
ALTER TABLE `b_year_level`
  ADD PRIMARY KEY (`Year_ID`);

--
-- Indexes for table `c_borrowers`
--
ALTER TABLE `c_borrowers`
  ADD PRIMARY KEY (`Borrower_ID`),
  ADD KEY `Year_Level` (`Year_Level`),
  ADD KEY `Department_2` (`Department`,`Year_Level`),
  ADD KEY `Department` (`Department`,`Year_Level`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_books`
--
ALTER TABLE `a_books`
  MODIFY `ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `a_genre`
--
ALTER TABLE `a_genre`
  MODIFY `Genre_ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `b_departments`
--
ALTER TABLE `b_departments`
  MODIFY `Department_ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `b_students`
--
ALTER TABLE `b_students`
  MODIFY `Student_ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b_year_level`
--
ALTER TABLE `b_year_level`
  MODIFY `Year_ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `c_borrowers`
--
ALTER TABLE `c_borrowers`
  MODIFY `Borrower_ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_books`
--
ALTER TABLE `a_books`
  ADD CONSTRAINT `a_books_ibfk_1` FOREIGN KEY (`Genre_ID`) REFERENCES `a_genre` (`Genre_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `b_students`
--
ALTER TABLE `b_students`
  ADD CONSTRAINT `b_students_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `b_departments` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `b_students_ibfk_2` FOREIGN KEY (`Year_ID`) REFERENCES `b_year_level` (`Year_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `c_borrowers`
--
ALTER TABLE `c_borrowers`
  ADD CONSTRAINT `c_borrowers_ibfk_1` FOREIGN KEY (`Year_Level`) REFERENCES `b_year_level` (`Year_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_borrowers_ibfk_2` FOREIGN KEY (`Department`) REFERENCES `b_departments` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

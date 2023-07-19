-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2022 at 07:41 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mulcahydentist_g00275740`
--

CREATE DATABASE mulcahydentist_g00275740;

USE mulcahydentist_g00275740;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppID` int(6) NOT NULL,
  `AppDate` date DEFAULT NULL,
  `AppTime` time DEFAULT NULL,
  `AppCancel` tinyint(1) DEFAULT NULL,
  `AppFirst` tinyint(1) DEFAULT NULL,
  `PatientFK` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`AppID`, `AppDate`, `AppTime`, `AppCancel`, `AppFirst`, `PatientFK`) VALUES
(1, '2022-03-01', '09:30:00', 0, 0, 9),
(2, '2022-03-01', '10:30:00', 0, 0, 3),
(3, '2022-03-01', '11:00:00', 0, 0, 1),
(4, '2022-03-01', '13:00:00', 0, 0, 6),
(5, '2022-03-01', '14:30:00', 0, 0, 8),
(6, '2022-03-02', '09:30:00', 1, 0, 9),
(7, '2022-03-02', '11:00:00', 0, 0, 4),
(8, '2022-03-02', '14:00:00', 0, 0, 6),
(9, '2022-03-03', '09:30:00', 0, 1, 1),
(10, '2022-03-03', '13:30:00', 0, 0, 2),
(11, '2022-03-04', '09:30:00', 0, 0, 8),
(12, '2022-03-04', '10:30:00', 0, 0, 10),
(13, '2022-03-04', '11:00:00', 0, 0, 5),
(14, '2022-03-04', '13:00:00', 1, 0, 3),
(15, '2022-03-04', '14:30:00', 0, 0, 7),
(16, '2022-03-05', '09:30:00', 0, 0, 10),
(17, '2022-03-05', '11:00:00', 0, 0, 3),
(18, '2022-03-05', '14:00:00', 0, 0, 2),
(19, '2022-03-06', '09:30:00', 0, 0, 7),
(20, '2022-03-06', '13:30:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `BillRef` int(6) NOT NULL,
  `BillTotal` int(8) DEFAULT NULL,
  `BillDueDate` date DEFAULT NULL,
  `BillPaymentPlan` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`BillRef`, `BillTotal`, `BillDueDate`, `BillPaymentPlan`) VALUES
(1, 3000, '2022-03-08', 1),
(2, 800, '2022-03-08', 0),
(3, 600, '2022-03-08', 0),
(4, 1200, '2022-03-08', 0),
(5, 2000, '2022-03-08', 1),
(6, 1600, '2022-03-09', 1),
(7, 1300, '2022-03-09', 0),
(8, 1000, '2022-03-09', 0),
(9, 400, '2022-03-10', 0),
(10, 1200, '2022-03-10', 0),
(11, 6150, '2022-03-11', 1),
(12, 800, '2022-03-11', 0),
(13, 1200, '2022-03-11', 0),
(14, 500, '2022-03-11', 0),
(15, 800, '2022-03-11', 0),
(16, 8000, '2022-03-12', 1),
(17, 400, '2022-03-12', 0),
(18, 600, '2022-03-12', 0),
(19, 500, '2022-03-13', 0),
(20, 2150, '2022-03-13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatID` int(6) NOT NULL,
  `PatFirstName` varchar(50) DEFAULT NULL,
  `PatLastName` varchar(50) DEFAULT NULL,
  `PatFullName` varchar(100) GENERATED ALWAYS AS (concat(`PatFirstName`,' ',`PatLastName`)) VIRTUAL,
  `PatAddress` varchar(50) DEFAULT NULL,
  `PatContact` varchar(50) NOT NULL,
  `PatDOB` date DEFAULT NULL,
  `PatGender` varchar(6) DEFAULT NULL CHECK (`PatGender` in ('Male','Female','Other'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatID`, `PatFirstName`, `PatLastName`, `PatAddress`, `PatContact`, `PatDOB`, `PatGender`) VALUES
(1, 'Brian', 'Nelson', '42 The Crescent', 'bnelson@mymail.com', '1961-05-18', 'Male'),
(2, 'Oliver', 'Dalton', '5 Hawthorn Drive', 'odalton@mymail.com', '1963-05-15', 'Male'),
(3, 'Declan', 'Connery', '8 Heatherfield Lawn', 'dconnery@mymail.com', '1964-09-01', 'Male'),
(4, 'Michael', 'Niven', '12 Orchard Court', 'mniven@mymail.com', '1978-10-12', 'Male'),
(5, 'Gerald', 'Moore', '7 Robin Vale', 'gmoore@mymail.com', '1983-06-23', 'Other'),
(6, 'Mary', 'Brown', '20 Cedarwood Close', 'mbrown@mymail.com', '1974-03-12', 'Female'),
(7, 'Niamh', 'Chisholm', '16 Castle Hill', 'nchisholm@mymail.com', '1971-08-17', 'Female'),
(8, 'Rebecca', 'Bunton', '36 Church Road', 'rbunton@mymail.com', '2007-10-30', 'Female'),
(9, 'Orla', 'Halliwell', '10 Abbey View', 'ohalliwell@mymail.com', '1999-11-25', 'Female'),
(10, 'Sinead', 'Adams', '19 The Briary', 'sadams@mymail.com', '1989-06-01', 'Female');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patientscharts`
-- (See below for the actual view)
--
CREATE TABLE `patientscharts` (
`PatID` int(6)
,`PatAddress` varchar(50)
,`PatFullName` varchar(100)
,`AppID` int(6)
,`AppDate` date
,`AppTime` time
,`AppCancel` tinyint(1)
,`AppFirst` tinyint(1)
,`TreatFK` int(8)
,`BillRef` int(6)
,`Paid` tinyint(1)
,`SpecReportSubmitted` tinyint(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PayRef` int(6) NOT NULL,
  `Paid` tinyint(1) NOT NULL,
  `PayDate` date DEFAULT NULL,
  `PayMethod` varchar(20) DEFAULT NULL,
  `SpecReportSubmitted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PayRef`, `Paid`, `PayDate`, `PayMethod`, `SpecReportSubmitted`) VALUES
(1, 1, '2022-03-08', 'Cash', 0),
(2, 1, '2022-03-08', 'Card', 1),
(3, 1, '2022-03-08', 'Card', 0),
(4, 0, NULL, NULL, 0),
(5, 1, '2022-03-09', 'Cash', 0),
(6, 1, '2022-03-12', 'Cheque', 0),
(7, 1, '2022-03-09', 'Card', 0),
(8, 1, '2022-03-10', 'Card', 0),
(9, 1, '2022-03-12', 'Cash', 0),
(10, 1, '2022-03-10', 'Cheque', 0),
(11, 1, '2022-03-11', 'Card', 0),
(12, 1, '2022-03-12', 'Card', 1),
(13, 1, '2022-03-11', 'Card', 0),
(14, 1, '2022-03-11', 'Card', 0),
(15, 1, '2022-03-12', 'Cash', 0),
(16, 1, '2022-03-13', 'Cheque', 1),
(17, 1, '2022-03-13', 'Card', 0),
(18, 0, NULL, NULL, 0),
(19, 0, NULL, NULL, 0),
(20, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `performed`
--

CREATE TABLE `performed` (
  `PerfID` int(6) NOT NULL,
  `AppFK` int(8) NOT NULL,
  `TreatFK` int(8) NOT NULL,
  `NumPerformed` int(2) NOT NULL,
  `SubTotal` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `performed`
--

INSERT INTO `performed` (`PerfID`, `AppFK`, `TreatFK`, `NumPerformed`, `SubTotal`) VALUES
(1, 1, 8, 2, 800),
(2, 2, 1, 1, 3000),
(3, 3, 20, 1, 600),
(4, 4, 8, 3, 1200),
(5, 5, 19, 1, 2000),
(6, 6, 14, 2, 1600),
(7, 7, 6, 4, 800),
(8, 7, 9, 1, 500),
(9, 8, 3, 2, 1000),
(10, 9, 8, 1, 400),
(11, 10, 8, 3, 1200),
(12, 11, 12, 1, 6000),
(13, 11, 5, 1, 150),
(14, 12, 8, 2, 800),
(15, 13, 13, 4, 1200),
(16, 14, 17, 1, 200),
(17, 14, 4, 1, 300),
(18, 15, 8, 1, 400),
(19, 15, 6, 2, 400),
(20, 16, 15, 1, 8000),
(21, 17, 16, 8, 400),
(22, 18, 20, 1, 600),
(23, 19, 18, 1, 500),
(24, 20, 11, 1, 1750),
(25, 20, 7, 2, 600);

-- --------------------------------------------------------

--
-- Table structure for table `specialists`
--

CREATE TABLE `specialists` (
  `SpecID` int(6) NOT NULL,
  `SpecName` varchar(50) DEFAULT NULL,
  `SpecContact` varchar(50) DEFAULT NULL,
  `TreatFK` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialists`
--

INSERT INTO `specialists` (`SpecID`, `SpecName`, `SpecContact`, `TreatFK`) VALUES
(1, 'McKenzie-Gutkowski', 'referrals@mckenziegutkowski.org', 11),
(2, 'Williamson & Swift', 'bolachlan@wsdental.ie', 1),
(3, 'Smiles Clinic', 'referrals@smilesclinic.ie', 12),
(4, 'Quigley-Schultz', 'admin@quigleyschultz.com', 19),
(5, 'Mahony & Sons', 'dmahony@mahonydental.ie', 15);

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `TreatID` int(6) NOT NULL,
  `TreatType` varchar(50) NOT NULL,
  `TreatCost` int(6) NOT NULL,
  `TreatSpecRequired` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`TreatID`, `TreatType`, `TreatCost`, `TreatSpecRequired`) VALUES
(1, 'Dental Implants', 3000, 1),
(2, 'Dental Veneers (per tooth)', 1000, 0),
(3, 'Dental Crown', 500, 0),
(4, 'Tooth Extraction', 300, 0),
(5, 'Teeth Cleaning', 150, 0),
(6, 'Scaling and Root Planing (per quadrant)', 200, 0),
(7, 'Silver Amalgam Dental Fillings (per tooth)', 300, 0),
(8, 'Composite Resin Dental Fillings (per tooth)', 400, 0),
(9, 'Teeth Bonding (dental bonding)', 500, 0),
(10, 'Root Canal', 1500, 0),
(11, 'Dentures (basic to mid-range)', 1750, 1),
(12, 'Dentures (premium)', 6000, 1),
(13, 'Gum Contouring (per tooth)', 300, 0),
(14, 'Gum Tissue Graft (per procedure)', 800, 0),
(15, 'Full Mouth Periodontal Surgery treatments', 8000, 1),
(16, 'Dental Sealant (per tooth)', 50, 0),
(17, 'Wisdom Teeth Removal (simple extraction)', 200, 0),
(18, 'Wisdom Teeth Removal (impacted tooth)', 500, 0),
(19, 'Wisdom Teeth Removal (four impacted)', 2000, 1),
(20, 'Professional Teeth Whitening', 600, 0);

-- --------------------------------------------------------

--
-- Structure for view `patientscharts`
--
DROP TABLE IF EXISTS `patientscharts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patientscharts`  AS SELECT `patients`.`PatID` AS `PatID`, `patients`.`PatAddress` AS `PatAddress`, `patients`.`PatFullName` AS `PatFullName`, `appointments`.`AppID` AS `AppID`, `appointments`.`AppDate` AS `AppDate`, `appointments`.`AppTime` AS `AppTime`, `appointments`.`AppCancel` AS `AppCancel`, `appointments`.`AppFirst` AS `AppFirst`, `performed`.`TreatFK` AS `TreatFK`, `bills`.`BillRef` AS `BillRef`, `payments`.`Paid` AS `Paid`, `payments`.`SpecReportSubmitted` AS `SpecReportSubmitted` FROM ((((`patients` join `appointments` on(`patients`.`PatID` = `appointments`.`PatientFK`)) join `performed` on(`appointments`.`AppID` = `performed`.`TreatFK`)) join `bills` on(`appointments`.`AppID` = `bills`.`BillRef`)) join `payments` on(`bills`.`BillRef` = `payments`.`PayRef`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppID`),
  ADD KEY `PatientFK` (`PatientFK`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`BillRef`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`PatID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PayRef`);

--
-- Indexes for table `performed`
--
ALTER TABLE `performed`
  ADD PRIMARY KEY (`PerfID`),
  ADD KEY `AppFK` (`AppFK`),
  ADD KEY `TreatFK` (`TreatFK`);

--
-- Indexes for table `specialists`
--
ALTER TABLE `specialists`
  ADD PRIMARY KEY (`SpecID`),
  ADD KEY `TreatFK` (`TreatFK`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`TreatID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `AppID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `BillRef` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `PatID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PayRef` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `performed`
--
ALTER TABLE `performed`
  MODIFY `PerfID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `specialists`
--
ALTER TABLE `specialists`
  MODIFY `SpecID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `TreatID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientFK`) REFERENCES `patients` (`PatID`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`BillRef`) REFERENCES `appointments` (`AppID`);

--
-- Constraints for table `performed`
--
ALTER TABLE `performed`
  ADD CONSTRAINT `performed_ibfk_1` FOREIGN KEY (`AppFK`) REFERENCES `appointments` (`AppID`),
  ADD CONSTRAINT `performed_ibfk_2` FOREIGN KEY (`TreatFK`) REFERENCES `treatments` (`TreatID`);

--
-- Constraints for table `specialists`
--
ALTER TABLE `specialists`
  ADD CONSTRAINT `specialists_ibfk_1` FOREIGN KEY (`TreatFK`) REFERENCES `treatments` (`TreatID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

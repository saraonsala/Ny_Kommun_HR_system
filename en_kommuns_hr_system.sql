-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 09:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `en_kommuns_hr_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorizations_in_the_payroll_system`
--

CREATE TABLE `authorizations_in_the_payroll_system` (
  `Degree_of_eligibility_ID` int(11) NOT NULL,
  `Parts_of_the_payroll_system_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authorizations_in_the_payroll_system`
--

INSERT INTO `authorizations_in_the_payroll_system` (`Degree_of_eligibility_ID`, `Parts_of_the_payroll_system_ID`) VALUES
(0, 1),
(0, 2),
(0, 3),
(0, 4),
(0, 5),
(0, 6),
(0, 1),
(0, 2),
(0, 3),
(0, 5),
(0, 6),
(0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `degree_of_eligibility`
--

CREATE TABLE `degree_of_eligibility` (
  `ID` char(11) NOT NULL,
  `Parts_of_the_payroll_system_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `Department_name` varchar(50) NOT NULL,
  `Cost_Center` int(10) NOT NULL,
  `Employees_ID` int(11) NOT NULL,
  `municipal_administation_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ID`, `Department_name`, `Cost_Center`, `Employees_ID`, `municipal_administation_ID`) VALUES
(1, 'Lonecenter', 516969, 1, 1),
(2, 'Fordon adminstration', 514478, 3, 4),
(3, 'Kollaskolan', 519933, 2, 2),
(4, 'Maltid centrum', 546664, 20, 7),
(5, 'HR funktonen', 665511, 20, 1),
(6, 'Signeshus ', 559912, 13, 5),
(7, 'Ekhada Aldreboende', 444551, 19, 5),
(8, 'Aranas gymnasium', 449999, 24, 6),
(9, 'Miljoskydd', 777174, 26, 3);

-- --------------------------------------------------------

--
-- Table structure for table `document_storage_plan`
--

CREATE TABLE `document_storage_plan` (
  `Document_storage_time_ID` int(11) NOT NULL,
  `Storage_reason_ID` int(11) NOT NULL,
  `Parts_of_the_payroll_system_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_storage_plan`
--

INSERT INTO `document_storage_plan` (`Document_storage_time_ID`, `Storage_reason_ID`, `Parts_of_the_payroll_system_ID`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 3),
(2, 1, 4),
(1, 2, 5),
(1, 1, 6),
(3, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `document_storage_time`
--

CREATE TABLE `document_storage_time` (
  `ID` int(11) NOT NULL,
  `Year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_storage_time`
--

INSERT INTO `document_storage_time` (`ID`, `Year`) VALUES
(1, 5),
(2, 10),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Salary` decimal(10,0) NOT NULL,
  `Holiday_entitlement` int(50) NOT NULL,
  `SSYcode_ID` int(50) NOT NULL,
  `Department_ID` int(50) NOT NULL,
  `Schema_employees_ID` int(50) NOT NULL,
  `Pension_agreements_ID` int(50) NOT NULL,
  `Trade_union_Membership_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `Name`, `Salary`, `Holiday_entitlement`, `SSYcode_ID`, `Department_ID`, `Schema_employees_ID`, `Pension_agreements_ID`, `Trade_union_Membership_ID`) VALUES
(1, 'Josef Olsson', 33500, 30, 2, 1, 1, 1, 1),
(2, 'Kalle Kula', 21000, 30, 2, 3, 1, 1, 1),
(3, 'Johan Jonasson', 45000, 25, 2, 2, 1, 1, 1),
(4, 'Jenny Olsson', 66000, 30, 7, 1, 1, 3, 1),
(5, 'Anna Andersson', 50000, 25, 4, 6, 12, 3, 2),
(6, 'Erik Ek', 28000, 25, 5, 1, 1, 1, 1),
(7, 'Maria Månsdotter', 42000, 30, 1, 1, 1, 1, 1),
(8, 'Anders Almgren', 55000, 25, 8, 1, 1, 1, 1),
(9, 'Sara	Sjöström', 60000, 30, 8, 5, 1, 2, 1),
(10, 'Per Persson', 32000, 30, 8, 8, 1, 1, 1),
(11, 'Linda Larsson', 48000, 25, 2, 5, 1, 1, 1),
(12, 'Oscar Olofsson', 70000, 30, 4, 7, 12, 1, 2),
(31, 'Bella Karlsson', 21000, 25, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `municipal_administation`
--

CREATE TABLE `municipal_administation` (
  `ID` int(11) NOT NULL,
  `Org_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `municipal_administation`
--

INSERT INTO `municipal_administation` (`ID`, `Org_name`) VALUES
(1, 'Service'),
(2, 'For och grundskola'),
(3, 'Bygg och miljo'),
(4, 'Teknik'),
(5, 'Vard och omsorg'),
(6, 'Gymnasium och arbetsmarknad '),
(7, 'Maltid');

-- --------------------------------------------------------

--
-- Table structure for table `parts_of_the_payroll_system`
--

CREATE TABLE `parts_of_the_payroll_system` (
  `ID` int(11) NOT NULL,
  `SSYcode_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Municipal_administration_ID` int(11) NOT NULL,
  `Trade_union_membership_ID` int(11) NOT NULL,
  `Schema_employees_ID` int(11) NOT NULL,
  `Pension_agreements_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pension_agreements`
--

CREATE TABLE `pension_agreements` (
  `ID` int(11) NOT NULL,
  `Pension_org_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pension_agreements`
--

INSERT INTO `pension_agreements` (`ID`, `Pension_org_name`) VALUES
(1, 'AKAP_KR,'),
(2, ' SAP-R'),
(3, 'LO');

-- --------------------------------------------------------

--
-- Table structure for table `schema_employees`
--

CREATE TABLE `schema_employees` (
  `ID` int(11) NOT NULL,
  `Schema_nr` int(30) NOT NULL,
  `Times` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schema_employees`
--

INSERT INTO `schema_employees` (`ID`, `Schema_nr`, `Times`) VALUES
(1, 1122, '08:00-16:30'),
(3, 3333, '07:00-14:30'),
(4, 5566, '07:40-15:40'),
(5, 3388, '08:00-14:00'),
(6, 3526, '09:00-15:00'),
(11, 5657, '18:00-03:00'),
(12, 4578, '21:00-09:00');

-- --------------------------------------------------------

--
-- Table structure for table `ssycode`
--

CREATE TABLE `ssycode` (
  `ID` int(11) NOT NULL,
  `SSYcode_nr` int(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Credential_requirement` varchar(50) NOT NULL,
  `Degree_of_eligibility_ID` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ssycode`
--

INSERT INTO `ssycode` (`ID`, `SSYcode_nr`, `Position`, `Credential_requirement`, `Degree_of_eligibility_ID`) VALUES
(1, 4112, 'Payroll Consultant', 'FALSE', 'B'),
(2, 2341, 'Manager', 'FALSE', 'B'),
(3, 2320, 'Teacher Vocational Subjects', 'TRUE', 'D'),
(4, 2221, 'Nurse', 'TRUE', 'D'),
(5, 2241, 'Psychologist', 'TRUE', 'D'),
(6, 2342, 'Leisure pedagogues', 'TRUE', 'D'),
(7, 2515, 'Systemforvaltare', 'FALSE', 'A'),
(8, 6511, 'HR Consultan', 'FALSE', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `storage_reason`
--

CREATE TABLE `storage_reason` (
  `ID` int(11) NOT NULL,
  `Reason` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storage_reason`
--

INSERT INTO `storage_reason` (`ID`, `Reason`) VALUES
(1, 'Company_policy'),
(2, 'Law_requirements'),
(3, 'GDPR');

-- --------------------------------------------------------

--
-- Table structure for table `trade_union_membership`
--

CREATE TABLE `trade_union_membership` (
  `ID` int(11) NOT NULL,
  `Union_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trade_union_membership`
--

INSERT INTO `trade_union_membership` (`ID`, `Union_name`) VALUES
(1, 'Vison'),
(2, 'Kommunal'),
(3, 'Lararforbundet'),
(4, 'IF Metall');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `degree_of_eligibility`
--
ALTER TABLE `degree_of_eligibility`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `municipal_administation_ID` (`municipal_administation_ID`);

--
-- Indexes for table `document_storage_time`
--
ALTER TABLE `document_storage_time`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `employees_ibfk_1` (`Department_ID`),
  ADD KEY `employees_ibfk_3` (`Pension_agreements_ID`),
  ADD KEY `employees_ibfk_4` (`Schema_employees_ID`),
  ADD KEY `employees_ibfk_5` (`SSYcode_ID`),
  ADD KEY `employees_ibfk_6` (`Trade_union_Membership_ID`);

--
-- Indexes for table `municipal_administation`
--
ALTER TABLE `municipal_administation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `parts_of_the_payroll_system`
--
ALTER TABLE `parts_of_the_payroll_system`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pension_agreements`
--
ALTER TABLE `pension_agreements`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `schema_employees`
--
ALTER TABLE `schema_employees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ssycode`
--
ALTER TABLE `ssycode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `storage_reason`
--
ALTER TABLE `storage_reason`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trade_union_membership`
--
ALTER TABLE `trade_union_membership`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `document_storage_time`
--
ALTER TABLE `document_storage_time`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `municipal_administation`
--
ALTER TABLE `municipal_administation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parts_of_the_payroll_system`
--
ALTER TABLE `parts_of_the_payroll_system`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pension_agreements`
--
ALTER TABLE `pension_agreements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schema_employees`
--
ALTER TABLE `schema_employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ssycode`
--
ALTER TABLE `ssycode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `storage_reason`
--
ALTER TABLE `storage_reason`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trade_union_membership`
--
ALTER TABLE `trade_union_membership`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`municipal_administation_ID`) REFERENCES `municipal_administation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`Pension_agreements_ID`) REFERENCES `pension_agreements` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`Schema_employees_ID`) REFERENCES `schema_employees` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_5` FOREIGN KEY (`SSYcode_ID`) REFERENCES `ssycode` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_6` FOREIGN KEY (`Trade_union_Membership_ID`) REFERENCES `trade_union_membership` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

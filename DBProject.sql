-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2019 at 03:43 AM
-- Server version: 5.6.43
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sruthigu_DBProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `CARDS`
--

CREATE TABLE `CARDS` (
  `GId` int(15) NOT NULL,
  `Colour` varchar(15) NOT NULL,
  `PNo` int(15) NOT NULL,
  `CId` int(15) NOT NULL,
  `Minutes` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COUNTRY`
--

CREATE TABLE `COUNTRY` (
  `CName` varchar(15) NOT NULL,
  `Confederation` varchar(15) NOT NULL,
  `Continent` varchar(15) NOT NULL,
  `CId` int(15) NOT NULL,
  `Population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GAME`
--

CREATE TABLE `GAME` (
  `GId` int(15) NOT NULL,
  `GType` varchar(15) NOT NULL,
  `GDate` date NOT NULL,
  `CId1` int(15) NOT NULL,
  `CId2` int(15) NOT NULL,
  `Score1` int(15) NOT NULL,
  `Score2` int(15) NOT NULL,
  `SId` int(15) NOT NULL,
  `Score` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GOALS`
--

CREATE TABLE `GOALS` (
  `GId` int(15) NOT NULL,
  `GoalType` varchar(15) NOT NULL,
  `PNo` int(15) NOT NULL,
  `CId` int(15) NOT NULL,
  `Minutes` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PLAYERS`
--

CREATE TABLE `PLAYERS` (
  `PNo` int(15) NOT NULL,
  `CId` int(15) NOT NULL,
  `DOB` date NOT NULL,
  `PJName` varchar(15) NOT NULL,
  `POS` varchar(15) NOT NULL,
  `PName` varchar(15) NOT NULL,
  `Club` varchar(15) NOT NULL,
  `Height` double NOT NULL,
  `Weight` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STADIUM`
--

CREATE TABLE `STADIUM` (
  `SId` int(15) NOT NULL,
  `SName` varchar(15) NOT NULL,
  `City` varchar(15) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STARTING_LINE_UP`
--

CREATE TABLE `STARTING_LINE_UP` (
  `CId` int(15) NOT NULL,
  `GId` int(15) NOT NULL,
  `PNo` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SUBSTITUTION`
--

CREATE TABLE `SUBSTITUTION` (
  `PNo1` int(15) NOT NULL,
  `PNo2` int(15) NOT NULL,
  `GId` int(15) NOT NULL,
  `CId` int(15) NOT NULL,
  `Minutes` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CARDS`
--
ALTER TABLE `CARDS`
  ADD KEY `GId` (`GId`,`CId`);

--
-- Indexes for table `COUNTRY`
--
ALTER TABLE `COUNTRY`
  ADD PRIMARY KEY (`CId`);

--
-- Indexes for table `GAME`
--
ALTER TABLE `GAME`
  ADD PRIMARY KEY (`GId`),
  ADD KEY `CId1` (`CId1`,`CId2`,`SId`,`Score`);

--
-- Indexes for table `GOALS`
--
ALTER TABLE `GOALS`
  ADD KEY `GId` (`GId`,`PNo`,`CId`);

--
-- Indexes for table `PLAYERS`
--
ALTER TABLE `PLAYERS`
  ADD PRIMARY KEY (`PNo`),
  ADD KEY `CId` (`CId`);

--
-- Indexes for table `STADIUM`
--
ALTER TABLE `STADIUM`
  ADD PRIMARY KEY (`SId`,`SName`);

--
-- Indexes for table `STARTING_LINE_UP`
--
ALTER TABLE `STARTING_LINE_UP`
  ADD KEY `CId` (`CId`,`GId`,`PNo`);

--
-- Indexes for table `SUBSTITUTION`
--
ALTER TABLE `SUBSTITUTION`
  ADD KEY `PNo1` (`PNo1`,`PNo2`,`GId`,`CId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

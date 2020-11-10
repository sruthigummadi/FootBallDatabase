--
-- Database: `wc_football`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `GAMEID` varchar(15) NOT NULL,
  `TEAMID` varchar(15) NOT NULL,
  `PNO` int(15) NOT NULL,
  `COLOR` varchar(10) NOT NULL,
  `TIME1` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `GAMEID` varchar(15) NOT NULL,
  `MATCHTYPE` varchar(20) NOT NULL,
  `MATCHDATE` varchar(20) NOT NULL,
  `SID` varchar(15) NOT NULL,
  `TEAMID1` varchar(15) NOT NULL,
  `TEAMID2` varchar(15) NOT NULL,
  `TEAM1_SCORE` int(10) NOT NULL,
  `TEAM2_SCORE` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `game_info`
-- (See below for the actual view)
--
CREATE TABLE `game_info` (
`Team_1` varchar(20)
,`Matchtype` varchar(20)
,`MatchDate` varchar(20)
,`stadium_name` varchar(35)
,`City` varchar(20)
,`Team1_score` int(10)
,`Team_2` varchar(20)
,`Team2_score` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `GAMEID` varchar(15) NOT NULL,
  `TEAMID` varchar(15) NOT NULL,
  `PNO` int(15) NOT NULL,
  `TIME1` int(15) NOT NULL,
  `PENALTY` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goals`
--

-- --------------------------------------------------------

--
-- Table structure for table `own_goals`
--

CREATE TABLE `own_goals` (
  `GAMEID` varchar(15) NOT NULL,
  `TEAMID` varchar(15) NOT NULL,
  `PNO` int(15) NOT NULL,
  `TIME1` int(15) NOT NULL,
  `FOR_TEAMID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `TEAM` varchar(40) NOT NULL,
  `TEAMID` varchar(15) NOT NULL,
  `PNO` int(15) NOT NULL,
  `POSITION` varchar(25) NOT NULL,
  `PNAME` varchar(50) NOT NULL,
  `BIRTH_DATE` varchar(20) NOT NULL,
  `SHIRT_NAME` varchar(50) NOT NULL,
  `CLUB` varchar(50) NOT NULL,
  `HEIGHT` int(10) NOT NULL,
  `WEIGHT` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `Sid` varchar(15) NOT NULL,
  `SNAME` varchar(35) NOT NULL,
  `SCITY` varchar(20) NOT NULL,
  `SCAPACITY` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `starting_lineup`
--

CREATE TABLE `starting_lineup` (
  `GAMEID` varchar(15) NOT NULL,
  `TEAMID` varchar(15) NOT NULL,
  `PNO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `substitutions`
--

CREATE TABLE `substitutions` (
  `GAMEID` varchar(15) NOT NULL,
  `TEAMID` varchar(15) NOT NULL,
  `PNOIN` int(15) NOT NULL,
  `POSITION` varchar(15) NOT NULL,
  `PNOOUT` int(15) NOT NULL,
  `TIME1` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `TeamID` varchar(15) NOT NULL,
  `Teamname` varchar(20) NOT NULL,
  `Continent` varchar(20) NOT NULL,
  `League` varchar(20) NOT NULL,
  `Population` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-cards-text.txt' 
INTO TABLE cards
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-goals-text.txt' 
INTO TABLE goals
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-matches-text.txt' 
INTO TABLE game
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-own-goals-text.txt' 
INTO TABLE own_goals
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-rosters-text.txt' 
INTO TABLE player
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-stadiums-text.txt' 
INTO TABLE stadium
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-starting-lineups-text.txt' 
INTO TABLE starting_lineup
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-substitutes-text.txt' 
INTO TABLE substitutions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/mysql/data/worldcup/world-cup-teams-text.txt' 
INTO TABLE team
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
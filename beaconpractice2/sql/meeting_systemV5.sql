-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2016 年 08 月 25 日 17:27
-- 伺服器版本: 5.5.39
-- PHP 版本： 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫： `meeting_system`
--
CREATE DATABASE IF NOT EXISTS `meeting_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `meeting_system`;

-- --------------------------------------------------------

--
-- 資料表結構 `depart`
--

DROP TABLE IF EXISTS `depart`;
CREATE TABLE IF NOT EXISTS `depart` (
  `depID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `depname` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表新增前先清除舊資料 `depart`
--

TRUNCATE TABLE `depart`;
--
-- 資料表的匯出資料 `depart`
--

INSERT INTO `depart` (`depID`, `depname`) VALUES
('dep01', '董事會'),
('dep02', '人事部'),
('dep03', '營業部'),
('dep04', '財務部'),
('dep05', '技術部'),
('dep06', '科技部'),
('dep07', '生產部'),
('dep08', '行銷部'),
('dep09', '研發部'),
('dep10', '會計部');

-- --------------------------------------------------------

--
-- 資料表結構 `meeting`
--

DROP TABLE IF EXISTS `meeting`;
CREATE TABLE IF NOT EXISTS `meeting` (
  `meetingID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `meetingname` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `loca` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `word` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `fettle` varchar(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表新增前先清除舊資料 `meeting`
--

TRUNCATE TABLE `meeting`;
--
-- 資料表的匯出資料 `meeting`
--

INSERT INTO `meeting` (`meetingID`, `meetingname`, `content`, `date`, `loca`, `word`, `fettle`) VALUES
('mt0001', '年初會議', '討論年度計畫', '2017-01-03', '視聽室', 'CV33會議室', '0'),
('mt0002', '1月例行會議', '1月營運狀況', '2017-01-23', 'CV33會議室', ' ', '0'),
('mt0003', '新年會議', '新年計畫', '2017-02-03', '視聽室', ' ', '0'),
('mt0004', '2月例行會議', '2月營運狀況', '2017-02-24', 'CV33會議室', ' ', '0'),
('mt0005', '第一季財務會報', '第一季營運狀況', '2017-03-03', '視聽室', ' ', '0'),
('mt0006', '3月例行會議', '4月營運狀況', '2017-03-31', '視聽室', '無', '0'),
('mt0007', '清明會議', '討論年度計畫', '2017-04-06', '視聽室', '無', '0'),
('mt0008', '4月例行會議', '4月營運狀況', '2017-04-28', 'CV33會議室', '無', '0'),
('mt0009', '端午會議', '新年計畫', '2017-05-26', '視聽室', '無', '0'),
('mt0010', '5月例行會議', '5月營運狀況', '2017-05-31', 'CV33會議室', '無', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `sign`
--

DROP TABLE IF EXISTS `sign`;
CREATE TABLE IF NOT EXISTS `sign` (
  `meetingID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `userID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `check1` varchar(10) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表新增前先清除舊資料 `sign`
--

TRUNCATE TABLE `sign`;
--
-- 資料表的匯出資料 `sign`
--

INSERT INTO `sign` (`meetingID`, `userID`, `check1`) VALUES
('mt0001', 'us0001', '0'),
('mt0001', 'us0002', '0'),
('mt0001', 'us0003', '0'),
('mt0001', 'us0004', '0'),
('mt0001', 'us0005', '0'),
('mt0002', 'us0006', '0'),
('mt0002', 'us0007', '0'),
('mt0002', 'us0008', '0'),
('mt0002', 'us0009', '0'),
('mt0002', 'us0010', '0'),
('mt0002', 'us0011', '0'),
('mt0002', 'us0012', '0'),
('mt0002', 'us0013', '0'),
('mt0002', 'us0014', '0'),
('mt0002', 'us0015', '0'),
('mt0002', 'us0016', '0'),
('mt0002', 'us0017', '0'),
('mt0002', 'us0018', '0'),
('mt0002', 'us0019', '0'),
('mt0002', 'us0020', '0'),
('mt0003', 'us0001', '0'),
('mt0003', 'us0002', '0'),
('mt0003', 'us0003', '0'),
('mt0003', 'us0004', '0'),
('mt0003', 'us0005', '0'),
('mt0004', 'us0006', '0'),
('mt0004', 'us0007', '0'),
('mt0004', 'us0008', '0'),
('mt0004', 'us0009', '0'),
('mt0004', 'us0010', '0'),
('mt0004', 'us0011', '0'),
('mt0004', 'us0012', '0'),
('mt0004', 'us0013', '0'),
('mt0004', 'us0014', '0'),
('mt0004', 'us0015', '0'),
('mt0004', 'us0016', '0'),
('mt0004', 'us0017', '0'),
('mt0004', 'us0018', '0'),
('mt0004', 'us0019', '0'),
('mt0004', 'us0020', '0'),
('mt0005', 'us0001', '0'),
('mt0005', 'us0002', '0'),
('mt0005', 'us0003', '0'),
('mt0005', 'us0004', '0'),
('mt0005', 'us0005', '0'),
('mt0006', 'us0006', '0'),
('mt0006', 'us0007', '0'),
('mt0006', 'us0008', '0'),
('mt0006', 'us0011', '0'),
('mt0006', 'us0012', '0'),
('mt0006', 'us0013', '0'),
('mt0006', 'us0014', '0'),
('mt0006', 'us0015', '0'),
('mt0006', 'us0016', '0'),
('mt0006', 'us0017', '0'),
('mt0006', 'us0018', '0'),
('mt0006', 'us0019', '0'),
('mt0006', 'us0020', '0'),
('mt0007', 'us0001', '0'),
('mt0007', 'us0002', '0'),
('mt0007', 'us0003', '0'),
('mt0007', 'us0004', '0'),
('mt0007', 'us0005', '0'),
('mt0008', 'us0006', '0'),
('mt0008', 'us0007', '0'),
('mt0008', 'us0008', '0'),
('mt0008', 'us0009', '0'),
('mt0008', 'us0010', '0'),
('mt0008', 'us0011', '0'),
('mt0008', 'us0012', '0'),
('mt0008', 'us0013', '0'),
('mt0008', 'us0014', '0'),
('mt0008', 'us0015', '0'),
('mt0008', 'us0016', '0'),
('mt0008', 'us0017', '0'),
('mt0008', 'us0018', '0'),
('mt0008', 'us0019', '0'),
('mt0008', 'us0020', '0'),
('mt0009', 'us0001', '0'),
('mt0009', 'us0002', '0'),
('mt0009', 'us0003', '0'),
('mt0009', 'us0004', '0'),
('mt0009', 'us0005', '0'),
('mt0010', 'us0006', '0'),
('mt0010', 'us0007', '0'),
('mt0010', 'us0008', '0'),
('mt0010', 'us0009', '0'),
('mt0010', 'us0010', '0'),
('mt0010', 'us0011', '0'),
('mt0010', 'us0012', '0'),
('mt0010', 'us0013', '0'),
('mt0010', 'us0014', '0'),
('mt0010', 'us0015', '0'),
('mt0010', 'us0016', '0'),
('mt0010', 'us0017', '0'),
('mt0010', 'us0018', '0'),
('mt0010', 'us0019', '0'),
('mt0010', 'us0020', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usersex` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usertitile` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usercompetence` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `depID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usermail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usermobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表新增前先清除舊資料 `users`
--

TRUNCATE TABLE `users`;
--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `usersex`, `usertitile`, `usercompetence`, `depID`, `usermail`, `usermobile`) VALUES
('us0001', 'ben', '1', '女', '執行長', '1', 'dep01', '', ''),
('us0002', '吳翰陞', 'zxc123456', '男', '主管', '1', 'dep02', '', ''),
('us0003', '王澤宇', 'aaa999', '男', '營業總監', '1', 'dep03', '', ''),
('us0004', '張哲賢', 'qweqwe9876', '男', '總務', '1', 'dep04', '', ''),
('us0005', '陳思帆', 'qweasd999', '女', '首席工程師', '1', 'dep05', '', ''),
('us0006', '簡伶容', 'aaaaaaaa', '女', '秘書', '0', 'dep01', '', ''),
('us0007', '蕭明駿', 'aaaaaaaa', '男', '職員', '0', 'dep02', '', ''),
('us0008', '程雅鈴', 'aaaaaaaa', '女', '業務', '0', 'dep03', '', ''),
('us0009', '王義宇', 'aaaaaaaa', '男', '會計', '0', 'dep04', '', ''),
('us0010', '楊偲妘', 'aaaaaaaa', '女', '維修員', '0', 'dep05', '', ''),
('us0011', '吳鴻智', 'qwe123', '男', '執行長', '1', 'dep01', '', ''),
('us0012', '洪卉文', 'qwe123', '女', '主任', '1', 'dep07', '', ''),
('us0013', '廖珮珊', 'qwe123', '女', '主任', '1', 'dep08', '', ''),
('us0014', '于志壯', 'qwe123', '男', '主任', '1', 'dep09', '', ''),
('us0015', '陳明玉', 'qwe123', '女', '主任', '1', 'dep10', '', ''),
('us0016', '鄭宗旻', 'qwe123', '男', '職員', '1', 'dep06', '', ''),
('us0017', '陳美文', 'qwe123', '女', '職員', '1', 'dep07', '', ''),
('us0018', '林佳儀', 'qwe123', '女', '職員', '1', 'dep08', '', ''),
('us0019', '許耀中', 'qwe123', '男', '職員', '1', 'dep09', '', ''),
('us0020', '羅佩怡', 'qwe123', '女', '職員', '1', 'dep10', '', '');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `depart`
--
ALTER TABLE `depart`
 ADD PRIMARY KEY (`depID`), ADD KEY `depID` (`depID`);

--
-- 資料表索引 `meeting`
--
ALTER TABLE `meeting`
 ADD PRIMARY KEY (`meetingID`), ADD KEY `meetingID` (`meetingID`);

--
-- 資料表索引 `sign`
--
ALTER TABLE `sign`
 ADD PRIMARY KEY (`meetingID`,`userID`), ADD KEY `meetingID` (`meetingID`), ADD KEY `userID` (`userID`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userID`), ADD KEY `userID` (`userID`), ADD KEY `depID` (`depID`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `sign`
--
ALTER TABLE `sign`
ADD CONSTRAINT `sign_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
ADD CONSTRAINT `sign_ibfk_2` FOREIGN KEY (`meetingID`) REFERENCES `meeting` (`meetingID`);

--
-- 資料表的 Constraints `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`depID`) REFERENCES `depart` (`depID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

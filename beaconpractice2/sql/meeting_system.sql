-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2016-07-27 03:36:09
-- 伺服器版本: 10.1.13-MariaDB
-- PHP 版本： 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
CREATE TABLE `depart` (
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
('dep05', '技術部');

-- --------------------------------------------------------

--
-- 資料表結構 `meeting`
--

DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
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
('mt0005', '第一季財務會報', '第一季營運狀況', '2017-03-03', '視聽室', ' ', '0')

;

-- --------------------------------------------------------

--
-- 資料表結構 `sign`
--

DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
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
('mt0003', 'us0001', '0'),
('mt0003', 'us0002', '0'),
('mt0003', 'us0003', '0'),
('mt0003', 'us0004', '0'),
('mt0003', 'us0005', '0')

;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usersex` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usertitile` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usercompetence` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `depID` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表新增前先清除舊資料 `users`
--

TRUNCATE TABLE `users`;
--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `usersex`, `usertitile`, `usercompetence`, `depID`) VALUES
('us0001', 'ben', '1', '男', '執行長', '1', 'dep01'),
('us0002', '吳翰陞', 'zxc123456', '男', '主管', '1', 'dep02'),
('us0003', '王澤宇', 'aaa999', '男', '營業總監', '1', 'dep03'),
('us0004', '張哲賢', 'qweqwe9876', '男', '總務', '1', 'dep04'),
('us0005', '陳思帆', 'qweasd999', '女', '首席工程師', '1', 'dep05'),
('us0006', '簡伶容', 'aaaaaaaa', '女', '秘書', '0', 'dep01'),
('us0007', '蕭明駿', 'aaaaaaaa', '男', '職員', '0', 'dep02'),
('us0008', '程雅鈴', 'aaaaaaaa', '女', '業務', '0', 'dep03'),
('us0009', '王義宇', 'aaaaaaaa', '男', '會計', '0', 'dep04'),
('us0010', '楊偲妘', 'aaaaaaaa', '女', '維修員', '0', 'dep05'),
('us0011', '吳鴻智', 'qwe123', '男', '執行長', '1', 'dep01');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `depart`
--
ALTER TABLE `depart`
  ADD PRIMARY KEY (`depID`),
  ADD KEY `depID` (`depID`);

--
-- 資料表索引 `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`meetingID`),
  ADD KEY `meetingID` (`meetingID`);

--
-- 資料表索引 `sign`
--
ALTER TABLE `sign`
  ADD PRIMARY KEY (`meetingID`,`userID`),
  ADD KEY `meetingID` (`meetingID`),
  ADD KEY `userID` (`userID`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `depID` (`depID`);

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

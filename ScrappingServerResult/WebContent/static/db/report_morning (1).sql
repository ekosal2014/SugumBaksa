-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2017 at 06:33 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `report_morning`
--

-- --------------------------------------------------------

--
-- Table structure for table `report_morning`
--

CREATE TABLE `report_morning` (
  `id` int(10) NOT NULL,
  `date_report` varchar(10) NOT NULL,
  `acct_in_cnt` int(10) NOT NULL,
  `acct_out_cnt` int(10) NOT NULL,
  `card_appr_cnt` int(10) NOT NULL,
  `card_bill_cnt` int(10) NOT NULL,
  `card_limit_cnt` int(10) NOT NULL,
  `sale_hst_rece_cnt` int(10) NOT NULL,
  `sale_hst_purc_cnt` int(10) NOT NULL,
  `sale_hst_appr_cnt` int(10) NOT NULL,
  `search_gubun_a` int(10) NOT NULL,
  `search_gubun_b` int(10) NOT NULL,
  `search_gubun_c` int(10) NOT NULL,
  `search_gubun_d` int(10) NOT NULL,
  `cash_rcp_purc_cnt` int(10) NOT NULL,
  `cash_rcp_sales_cnt` int(10) NOT NULL,
  `psn_card_appr_cnt` int(10) NOT NULL,
  `psn_card_bill_cnt` int(10) NOT NULL,
  `psn_card_limit_cnt` int(10) NOT NULL,
  `psn_card_payment_date_cnt` int(10) NOT NULL,
  `psn_card_list_cnt` int(10) NOT NULL,
  `tt_bank_cnt` int(10) NOT NULL,
  `tt_card_cnt` int(10) NOT NULL,
  `tt_cardsales_cnt` int(10) NOT NULL,
  `tt_etax_cnt` int(10) NOT NULL,
  `tt_cash_cnt` int(10) NOT NULL,
  `tt_psn_card_cnt` int(10) NOT NULL,
  `sts` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_morning`
--

INSERT INTO `report_morning` (`id`, `date_report`, `acct_in_cnt`, `acct_out_cnt`, `card_appr_cnt`, `card_bill_cnt`, `card_limit_cnt`, `sale_hst_rece_cnt`, `sale_hst_purc_cnt`, `sale_hst_appr_cnt`, `search_gubun_a`, `search_gubun_b`, `search_gubun_c`, `search_gubun_d`, `cash_rcp_purc_cnt`, `cash_rcp_sales_cnt`, `psn_card_appr_cnt`, `psn_card_bill_cnt`, `psn_card_limit_cnt`, `psn_card_payment_date_cnt`, `psn_card_list_cnt`, `tt_bank_cnt`, `tt_card_cnt`, `tt_cardsales_cnt`, `tt_etax_cnt`, `tt_cash_cnt`, `tt_psn_card_cnt`, `sts`) VALUES
(1, '20170809', 1619, 1261, 145, 4168, 227, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8383, 261, 78, 0, 0, 0, '0'),
(2, '20170809', 676, 381, 29, 546, 31, 958, 0, 0, 82, 111, 0, 0, 1, 52, 241, 6646, 265, 0, 0, 1285, 31, 258, 38, 38, 286, '1'),
(3, '20170809', 71637, 6512, 23, 859, 34, 157, 0, 0, 188, 164, 0, 4, 5, 14, 55, 2126, 61, 0, 0, 20495, 35, 40, 82, 77, 69, '2'),
(1, '20170807', 1, 17, 78, 4168, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8365, 260, 78, 0, 0, 0, '0'),
(2, '20170807', 7, 21, 8, 546, 31, 0, 0, 0, 0, 0, 0, 2, 1, 20, 184, 6646, 256, 0, 0, 1307, 31, 257, 35, 35, 275, '1'),
(3, '20170807', 23, 118, 20, 859, 32, 0, 0, 0, 3, 6, 0, 0, 9, 11, 61, 2126, 61, 0, 0, 20445, 33, 38, 81, 76, 69, '2'),
(1, '20170808', 1691, 2707, 67, 4168, 224, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8381, 260, 78, 0, 0, 0, '0'),
(2, '20170808', 653, 673, 9, 546, 31, 892, 0, 0, 67, 90, 0, 2, 4, 20, 179, 6646, 262, 0, 0, 1307, 31, 258, 36, 36, 277, '1'),
(3, '20170808', 7912, 14116, 17, 859, 33, 160, 0, 0, 322, 134, 0, 6, 5, 28, 50, 2126, 60, 0, 0, 20481, 34, 38, 81, 76, 69, '2'),
(1, '20170810', 1584, 1463, 157, 4168, 226, 257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8376, 261, 78, 0, 0, 0, '0'),
(2, '20170810', 677, 429, 8, 546, 31, 1061, 0, 0, 98, 40, 0, 4, 4, 40, 219, 6646, 275, 0, 0, 1309, 31, 259, 39, 39, 297, '1'),
(3, '20170810', 7073, 6264, 47, 859, 34, 183, 0, 0, 3230, 143, 0, 4, 7, 17, 75, 2126, 61, 0, 0, 20537, 35, 40, 82, 77, 69, '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `report_morning`
--
ALTER TABLE `report_morning`
  ADD PRIMARY KEY (`id`,`date_report`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

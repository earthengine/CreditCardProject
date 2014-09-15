-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 15, 2014 at 03:48 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `credit_card_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `qid`, `description`, `order`) VALUES
(1, 1, 'Air Travel', 1),
(2, 1, 'Hotels', 2),
(3, 1, 'Travel Rewards', 3),
(4, 1, 'Merchandise/Gift Cards', 4),
(5, 1, 'Cash Back', 5),
(6, 2, 'Two or fewer trips', 1),
(7, 2, 'Between three and five trips', 2),
(8, 2, 'More than five trips', 3),
(9, 3, 'Yes', 1),
(10, 3, 'No', 2),
(11, 4, 'Online', 1),
(12, 4, 'Major Stores (e.g. Myer, David Jones)', 2),
(13, 4, 'Independent Retailers', 3),
(14, 5, 'Less than 25%', 1),
(15, 5, 'Between 25 and 50%', 2),
(16, 5, 'Between 50 and 75%', 3),
(17, 5, 'More than 75%', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE IF NOT EXISTS `bank_info` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` (`id`, `name`) VALUES
(1, 'ANZ'),
(2, 'CBA'),
(3, 'Westpac'),
(4, 'NAB'),
(5, 'Coles'),
(6, 'American Express');

-- --------------------------------------------------------

--
-- Table structure for table `card_info`
--

CREATE TABLE IF NOT EXISTS `card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `purchase_interest_rate` decimal(4,2) DEFAULT NULL,
  `cash_interest_rate` decimal(4,2) DEFAULT NULL,
  `bt_interest_rate` decimal(4,2) DEFAULT NULL,
  `interest_free_period` int(11) DEFAULT NULL COMMENT 'days',
  `annual_fee` decimal(6,2) DEFAULT NULL,
  `rewards_fee` decimal(6,2) DEFAULT NULL,
  `additional_cardholder_fee` decimal(6,2) DEFAULT NULL,
  `late_payment_fee` decimal(6,2) DEFAULT NULL,
  `over_limit_fee` decimal(6,2) DEFAULT NULL,
  `annual_spend_bonus` int(11) DEFAULT NULL,
  `min_credit_limit` int(11) DEFAULT NULL,
  `min_income` int(11) DEFAULT NULL,
  `minimum_monthly_repayment` decimal(5,2) DEFAULT NULL,
  `type_of_program` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `travel_insurance` bit(1) DEFAULT NULL,
  `purchase_insurance` bit(1) DEFAULT NULL,
  `concierge` bit(1) DEFAULT NULL,
  `amex_card` bit(1) DEFAULT NULL,
  `BT_rate` decimal(5,2) DEFAULT NULL COMMENT 'Introductory offer',
  `BT_load_fee` decimal(6,2) DEFAULT NULL COMMENT 'Introductory offer',
  `BT_period` int(11) DEFAULT NULL COMMENT 'Introductory offer',
  `IO_bonus_points` int(11) DEFAULT NULL COMMENT 'Introductory offer',
  `IO_first_year_fee` decimal(6,2) DEFAULT NULL COMMENT 'Introductory offer',
  `IO_offer_enddate` date DEFAULT NULL COMMENT 'Introductory offer',
  `Qantas_conversion_rate` decimal(5,2) DEFAULT NULL,
  `Velocity_conversion_rate` decimal(5,2) DEFAULT NULL,
  `points_to_redeem_1` int(11) DEFAULT NULL,
  `points_MEL_SYD_one_way` int(11) DEFAULT NULL,
  `points_myer100` int(11) DEFAULT NULL,
  `info_url` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `image_url` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `referral_url` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `card_info`
--

INSERT INTO `card_info` (`id`, `card_name`, `bank_id`, `purchase_interest_rate`, `cash_interest_rate`, `bt_interest_rate`, `interest_free_period`, `annual_fee`, `rewards_fee`, `additional_cardholder_fee`, `late_payment_fee`, `over_limit_fee`, `annual_spend_bonus`, `min_credit_limit`, `min_income`, `minimum_monthly_repayment`, `type_of_program`, `travel_insurance`, `purchase_insurance`, `concierge`, `amex_card`, `BT_rate`, `BT_load_fee`, `BT_period`, `IO_bonus_points`, `IO_first_year_fee`, `IO_offer_enddate`, `Qantas_conversion_rate`, `Velocity_conversion_rate`, `points_to_redeem_1`, `points_MEL_SYD_one_way`, `points_myer100`, `info_url`, `image_url`, `referral_url`) VALUES
(1, 'AFF Classic', 1, '19.99', '21.49', '19.99', 44, '40.00', '55.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'AFF Platinum', 1, '19.99', '21.49', '19.99', 55, '240.00', '55.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'AFF Black', 1, '19.99', '21.49', '19.99', 55, '370.00', '55.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'ARW Classic', 1, '18.79', '20.99', '18.79', 44, '34.00', '55.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ARW Platinum', 1, '18.79', '20.99', '18.79', 55, '94.00', '55.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ARW Black', 1, '18.79', '20.99', '18.79', 55, '320.00', '55.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Balance Visa', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Diamond Awards', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Diamond Awards QFF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Platinum Awards', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Platinum Awards QFF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Gold Awards', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Gold Awards QFF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Awards', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Awards QFF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Altitude Black', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Earth Black', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Altitude Platinum', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Altitude', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Singapore Airlines Westpac Platinum', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Qantas Rewards Premium', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Qantas Rewards', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Velocity Rewards Premium', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Velocity Rewards', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'flyBuys Rewards', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'No Annual Fee Mastercard', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Rewards Mastercard', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Platinum Reserve Credit Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Platinum Edge Credit Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'American Express', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'American Express (with Rewards)', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Platinum', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Platinum Rewards', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Qantas American Express Discovery Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Qantas American Express Ultimate Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Qantas American Express Premium Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Velocity Escape Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Velocity Platinum', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Velocity Gold', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'David Jones Membership Rewards', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'David Jones Platinum Card', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Low Rate', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `card_tier_info`
--

CREATE TABLE IF NOT EXISTS `card_tier_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `visa_points_per_dollar` decimal(5,3) DEFAULT NULL,
  `amex_points_per_dollar` decimal(5,3) DEFAULT NULL,
  `points_cap` int(11) DEFAULT NULL,
  `tier` char(2) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `card_tier_info`
--

INSERT INTO `card_tier_info` (`id`, `card_id`, `visa_points_per_dollar`, `amex_points_per_dollar`, `points_cap`, `tier`) VALUES
(1, 1, '0.400', '1.000', NULL, '1'),
(2, 2, '0.500', '1.000', NULL, '1'),
(3, 3, '0.750', '1.500', NULL, '1'),
(4, 4, '1.000', '1.500', NULL, '1'),
(5, 5, '1.500', '2.000', NULL, '1'),
(6, 6, '2.000', '3.000', NULL, '1'),
(7, 8, '1.250', '3.000', 1000000, '1'),
(8, 9, '0.625', '1.500', 500000, '1'),
(9, 10, '1.000', '2.500', 150000, '1'),
(10, 10, NULL, '1.000', 100000, '2'),
(11, 11, '0.500', '1.250', 60000, '1'),
(12, 11, NULL, '0.500', 40000, '2'),
(13, 12, '1.000', '2.000', 75000, '1'),
(14, 12, NULL, '1.000', 50000, '2'),
(15, 13, '0.400', '0.800', 24000, '1'),
(16, 13, NULL, '0.400', 16000, '2'),
(17, 14, '1.000', '1.500', 50000, '1'),
(18, 15, '0.400', '0.600', 12000, '1'),
(19, 15, NULL, '0.400', 8000, '2'),
(20, 16, '1.250', '3.000', NULL, '1'),
(21, 17, '0.625', '1.500', NULL, '1'),
(22, 18, '1.000', '2.000', 7500, '1'),
(23, 19, '1.000', '2.000', 5000, '1'),
(24, 20, '0.500', '1.500', NULL, '1'),
(25, 21, '0.500', '1.500', 100000, '1'),
(26, 22, '0.500', '1.000', 100000, '1'),
(27, 23, '0.500', '1.500', 100000, '1'),
(28, 24, '0.500', '1.000', 100000, '1'),
(29, 25, '1.000', NULL, NULL, '1'),
(30, 26, '0.500', NULL, NULL, '1'),
(31, 27, '2.000', NULL, NULL, '1'),
(32, 28, NULL, NULL, 150000, '1'),
(33, 28, NULL, '0.500', NULL, '2'),
(34, 32, NULL, NULL, 300000, '1'),
(35, 32, NULL, '1.000', NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `points_per_dollar_spent`
--

CREATE TABLE IF NOT EXISTS `points_per_dollar_spent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `supermarket` decimal(3,1) DEFAULT NULL,
  `petrol` decimal(3,1) DEFAULT NULL,
  `david_jones` decimal(3,1) DEFAULT NULL,
  `entertainment` decimal(3,1) DEFAULT NULL,
  `utilities` decimal(3,1) DEFAULT NULL,
  `restaurant` decimal(3,1) DEFAULT NULL,
  `airlines` decimal(3,1) DEFAULT NULL,
  `accomodation` decimal(3,1) DEFAULT NULL,
  `cruises` decimal(3,1) DEFAULT NULL,
  `travel_agent` decimal(3,1) DEFAULT NULL,
  `online` decimal(3,1) DEFAULT NULL,
  `foreign_txns` decimal(3,1) DEFAULT NULL,
  `insurance` decimal(3,1) DEFAULT NULL,
  `government` decimal(3,1) DEFAULT NULL,
  `telcos` decimal(3,1) DEFAULT NULL,
  `other` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `points_per_dollar_spent`
--

INSERT INTO `points_per_dollar_spent` (`id`, `card_id`, `supermarket`, `petrol`, `david_jones`, `entertainment`, `utilities`, `restaurant`, `airlines`, `accomodation`, `cruises`, `travel_agent`, `online`, `foreign_txns`, `insurance`, `government`, `telcos`, `other`) VALUES
(1, 16, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3.0', NULL, NULL, NULL, NULL),
(2, 17, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.5', NULL, NULL, NULL, NULL),
(3, 20, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.5', NULL, NULL, NULL, NULL),
(4, 28, '1.0', '1.0', '1.0', '1.0', '0.5', '3.0', '2.0', '2.0', '2.0', '2.0', '2.0', '2.0', '0.5', '0.5', '0.5', '1.0'),
(5, 29, '3.0', '2.0', '1.0', '1.0', '0.5', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '0.5', '0.5', '0.5', '1.0'),
(6, 32, '1.0', '1.0', '1.0', '1.0', '0.5', '3.0', '2.0', '2.0', '2.0', '2.0', '2.0', '2.0', '0.5', '0.5', '0.5', '1.0'),
(7, 33, '2.0', '2.0', '1.0', '1.0', '0.5', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '0.5', '0.5', '0.5', '1.0'),
(8, 34, '1.0', '1.0', '1.0', '1.0', '0.5', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '0.5', '0.5', '0.5', '1.0'),
(9, 35, '1.0', '1.0', '1.0', '1.0', '0.5', '3.0', '2.0', '2.0', '2.0', '2.0', '2.0', '2.0', '0.5', '0.5', '0.5', '1.0'),
(10, 36, '2.0', '2.0', '1.0', '1.0', '0.5', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '0.5', '0.5', '0.5', '1.0'),
(11, 37, '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0'),
(12, 38, '1.0', '1.0', '1.0', '1.0', '0.5', '3.0', '2.0', '2.0', '2.0', '2.0', '2.0', '2.0', '0.5', '0.5', '0.5', '1.0'),
(13, 39, '2.0', '2.0', '1.0', '1.0', '0.5', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '0.5', '0.5', '0.5', '1.0'),
(14, 40, '3.0', '3.0', '2.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0'),
(15, 41, '3.0', '3.0', '4.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `description`, `type`) VALUES
(1, 'What would you like to redeem your rewards for? (type of rewards program)', NULL),
(2, 'How much do you plan to travel in the coming year?', NULL),
(3, 'Do you use your debit card frequently?', NULL),
(4, 'What is your favorite way to shop?', NULL),
(5, 'How much of your shopping is online?', NULL),
(6, 'What''s your annual household income?', NULL),
(7, 'How many in your household', NULL),
(8, 'Estimate what you spend each month on your credit cards', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE IF NOT EXISTS `user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codes` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'a unique encoded url parameter',
  `answers` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'list of a user''s answers to all questions',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `email_send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE IF NOT EXISTS `user_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL COMMENT 'refers to the id in table `card_info`',
  `average_monthly_spend` decimal(8,2) DEFAULT NULL,
  `balance_paid_off` int(1) DEFAULT NULL COMMENT 'stores the option id of drop-down list',
  `companion_card_paid_off` int(1) DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

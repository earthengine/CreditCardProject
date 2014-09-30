-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-09-26 03:37:23
-- 服务器版本： 5.6.16
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
-- 表的结构 `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `answers`
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
-- 表的结构 `bank_info`
--

CREATE TABLE IF NOT EXISTS `bank_info` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `bank_info`
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
-- 表的结构 `card_info`
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
-- 转存表中的数据 `card_info`
--

INSERT INTO `card_info` VALUES 
(1,'ARW Black',2,18.79,20.99,18.79,55,320.00,55.00,10.00,NULL,NULL,10000,15000,75000,NULL,'proprietary',(1),(1),(1),(1),NULL,0.00,16,50000,NULL,NULL,NULL,NULL,NULL,NULL,19980,'http://www.anz.com.au/personal/credit-cards/black/anz-rewards/','ARW Black.jpg',NULL),
(2,'Altitude Black',6,19.99,21.49,NULL,45,395.00,NULL,NULL,NULL,NULL,NULL,15000,NULL,NULL,'proprietary',(1),(1),(1),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18200,'http://www.westpac.com.au/personal-banking/credit-cards/reward/altitude-black/','Altitude Black.png',NULL),
(3,'ARW Platinum',2,18.79,20.99,18.79,55,94.00,55.00,10.00,NULL,NULL,NULL,6000,50000,NULL,'proprietary',(1),(1),(1),(1),NULL,0.00,16,50000,NULL,NULL,NULL,NULL,NULL,NULL,19980,'http://www.anz.com.au/personal/credit-cards/platinum/anz-rewards/','ARW Platinum.jpg',NULL),
(4,'Diamond Awards',3,20.24,21.24,NULL,55,425.00,NULL,15.00,NULL,NULL,NULL,18000,NULL,NULL,'proprietary',(1),(1),(1),(1),NULL,0.00,10,NULL,NULL,NULL,NULL,2.00,NULL,NULL,18600,'https://www.commbank.com.au/personal/credit-cards/awards/diamond.html','Diamond Awards.png',NULL),
(5,'ARW Classic',2,18.79,20.99,18.79,44,34.00,55.00,10.00,NULL,NULL,NULL,1000,15000,NULL,'proprietary',(0),(0),(0),(1),NULL,0.00,16,50000,NULL,NULL,NULL,NULL,NULL,NULL,19980,'http://www.anz.com.au/personal/credit-cards/rewards-frequent-flyer/anz-rewards/','ARW Classic.jpg',NULL),
(6,'Platinum Awards',3,20.24,21.24,NULL,55,280.00,NULL,15.00,NULL,NULL,NULL,6000,NULL,NULL,'proprietary',(1),(1),(1),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,2.00,NULL,NULL,18600,'https://www.commbank.com.au/personal/credit-cards/awards/platinum.html','Platinum Awards.png',NULL),
(7,'Platinum Rewards',1,20.74,NULL,NULL,55,80.00,NULL,NULL,NULL,NULL,NULL,NULL,40000,0.03,'Proprietary',(1),(1),(1),(0),0.99,1.00,6,NULL,NULL,NULL,1.00,1.00,NULL,6900,13500,'https://www.americanexpress.com/australia/platinum-rewards-credit-card/','Platinum Rewards.jpg',NULL),
(8,'Qantas Rewards Premium',5,19.99,21.74,NULL,44,250.00,NULL,NULL,NULL,NULL,NULL,5000,NULL,NULL,NULL,(1),(1),(1),(1),NULL,0.00,NULL,40000,NULL,'2019-10-14',NULL,NULL,NULL,8000,15100,'http://www.nab.com.au/personal/credit-cards/qantas-credit-cards/nab-qantas-rewards-premium-card','Qantas Rewards Premium.jpg',NULL),
(9,'AFF Black',2,19.99,21.49,19.99,55,370.00,55.00,10.00,NULL,NULL,NULL,15000,75000,NULL,'QFF',(1),(1),(1),(1),NULL,0.00,16,50000,NULL,NULL,NULL,NULL,NULL,8000,15100,'http://www.anz.com.au/personal/credit-cards/black/anz-frequentflyer/','AFF Black.jpg',NULL),
(10,'AFF Classic',2,19.99,21.49,19.99,44,40.00,55.00,10.00,NULL,NULL,NULL,1000,15000,NULL,'QFF',(0),(0),(0),(1),NULL,0.00,16,50000,NULL,NULL,NULL,NULL,NULL,8000,15100,'http://www.anz.com.au/personal/credit-cards/rewards-frequent-flyer/frequent-flyer/','AFF Classic.jpg',NULL),
(11,'Singapore Airlines Westpac Platinum',6,19.74,20.49,NULL,45,250.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'other',(0),(0),(0),(1),0.01,0.00,6,10000,NULL,NULL,NULL,NULL,NULL,8000,15100,'http://www.westpac.com.au/personal-banking/credit-cards/reward/singapore-airlines-platinum/','Singapore Airlines Westpac Platinum.png',NULL),
(12,'Qantas Rewards',5,19.99,21.74,NULL,44,65.00,NULL,NULL,NULL,NULL,NULL,500,NULL,NULL,NULL,(0),(0),(0),(1),NULL,0.00,NULL,20000,NULL,'2019-10-14',NULL,NULL,NULL,8000,15100,'http://www.nab.com.au/personal/credit-cards/qantas-credit-cards/nab-qantas-rewards-card','Qantas Rewards.jpg',NULL),
(13,'Earth Black',6,19.99,21.49,NULL,45,395.00,NULL,NULL,NULL,NULL,NULL,15000,NULL,NULL,'QFF',(1),(1),(1),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8000,15100,'http://www.westpac.com.au/personal-banking/credit-cards/reward/earth-black/?from=leftnav','Earth Black.jpg',NULL),
(14,'Altitude Platinum',6,19.99,21.49,NULL,45,150.00,NULL,NULL,NULL,NULL,NULL,6000,NULL,NULL,'proprietary',(1),(1),(1),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18200,'http://www.westpac.com.au/personal-banking/credit-cards/reward/altitude-platinum/?from=leftnav','Altitude Platinum.png',NULL),
(15,'AFF Platinum',2,19.99,21.49,19.99,55,240.00,55.00,10.00,NULL,NULL,NULL,6000,50000,NULL,'QFF',(1),(1),(1),(1),NULL,0.00,16,50000,NULL,NULL,NULL,NULL,NULL,8000,15100,'http://www.anz.com.au/personal/credit-cards/platinum/anz-frequent-flyer/','AFF Platinum.jpg',NULL),
(16,'Diamond Awards QFF',3,20.24,21.24,NULL,55,425.00,10.00,15.00,NULL,NULL,NULL,18000,NULL,NULL,'QFF',(1),(1),(1),(1),NULL,0.00,10,NULL,NULL,NULL,2.00,NULL,NULL,8000,15100,'https://www.commbank.com.au/personal/credit-cards/awards/diamond.html','Diamond Awards QFF.png',NULL),
(17,'American Express (with Rewards)',1,NULL,NULL,NULL,NULL,80.00,80.00,-1.00,NULL,NULL,NULL,NULL,35000,1.00,'Proprietary',(1),(1),(1),(0),NULL,0.00,NULL,NULL,NULL,NULL,1.00,1.00,NULL,6900,13500,'https://www.americanexpress.com/au/content/the-american-express-card','American Express (with Rewards).jpg',NULL),
(18,'Gold Awards',3,20.24,21.24,NULL,55,144.00,NULL,15.00,NULL,NULL,NULL,4000,NULL,NULL,'proprietary',(0),(0),(0),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,2.50,NULL,NULL,18600,'https://www.commbank.com.au/personal/credit-cards/awards/gold.html','Gold Awards.png',NULL),
(19,'Altitude',6,19.99,21.49,NULL,45,100.00,NULL,NULL,NULL,NULL,NULL,1000,NULL,NULL,'proprietary',(0),(0),(0),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18200,'http://www.westpac.com.au/personal-banking/credit-cards/reward/altitude/?from=leftnav','Altitude.png',NULL),
(20,'Awards',3,20.24,21.24,NULL,55,89.00,NULL,15.00,NULL,NULL,NULL,500,NULL,NULL,'proprietary',(0),(0),(0),(1),NULL,0.00,NULL,NULL,NULL,NULL,NULL,2.50,NULL,NULL,18600,'https://www.commbank.com.au/personal/credit-cards/awards/awards.html','Awards.jpg',NULL),
(21,'Platinum Edge Credit Card',1,20.74,NULL,NULL,55,195.00,NULL,NULL,30.00,15.00,NULL,3000,50000,2.50,'Proprietary',(1),(1),(1),(0),0.99,1.00,6,10000,195.00,NULL,1.00,1.00,NULL,6900,13500,'http://www.americanexpress.com/australia/campaigns/platinumedge/index.shtml','Platinum Edge Credit Card.jpg',NULL),
(22,'Platinum Awards QFF',3,20.24,21.24,NULL,55,280.00,10.00,15.00,NULL,NULL,NULL,6000,NULL,NULL,'QFF',(1),(1),(1),(1),NULL,0.00,NULL,NULL,NULL,NULL,2.00,NULL,NULL,8000,15100,'https://www.commbank.com.au/personal/credit-cards/awards/platinum.html','Platinum Awards QFF.jpg',NULL),
(23,'Velocity Escape Card',1,20.74,NULL,NULL,44,NULL,NULL,NULL,30.00,NULL,NULL,2000,40000,0.03,'Velocity',(1),(1),(1),(0),0.99,1.00,6,7500,NULL,NULL,NULL,1.00,NULL,6900,13500,'http://www.americanexpress.com/australia/velocity-rewards-escapecard','Velocity Escape Card.jpg',NULL),
(24,'Qantas American Express Discovery Card',1,20.74,NULL,NULL,44,NULL,NULL,NULL,30.00,30.00,NULL,1000,35000,0.03,'QFF',(1),(1),(1),(0),0.99,1.00,6,7500,NULL,NULL,1.00,1.00,NULL,8000,15100,'http://www.americanexpress.com/australia/campaigns/discoverypalms/index.html','Qantas American Express Discovery Card.jpg',NULL),
(25,'Velocity Gold',1,20.74,NULL,NULL,44,199.00,NULL,NULL,6.00,15.00,NULL,3000,40000,0.03,'Velocity',(1),(1),(1),(0),0.99,1.00,6,15000,99.00,NULL,NULL,1.00,NULL,6900,13500,'http://www.americanexpress.com/australia/velocity-rewards-goldcard','Velocity Gold.jpg',NULL),
(26,'Qantas American Express Premium Card',1,20.74,NULL,NULL,44,249.00,NULL,NULL,30.00,30.00,NULL,1000,40000,3.00,'QFF',(1),(1),(1),(0),0.99,1.00,6,30000,149.00,NULL,1.00,1.00,NULL,8000,15100,'http://www.americanexpress.com/australia/campaigns/qantaspremiumrtp/index.html','Qantas American Express Premium Card.jpg',NULL),
(27,'Gold Awards QFF',3,20.24,21.24,NULL,55,144.00,10.00,15.00,NULL,NULL,NULL,4000,NULL,NULL,'QFF',(0),(0),(0),(1),NULL,0.00,NULL,NULL,NULL,NULL,2.50,NULL,NULL,8000,15100,'https://www.commbank.com.au/personal/credit-cards/awards/gold.html','Gold Awards QFF.png',NULL),
(28,'Awards QFF',3,20.24,21.24,NULL,55,89.00,10.00,15.00,NULL,NULL,NULL,500,NULL,NULL,'QFF',(0),(0),(0),(1),NULL,0.00,NULL,NULL,NULL,NULL,2.50,NULL,NULL,8000,15100,'https://www.commbank.com.au/personal/credit-cards/awards/awards.html','Awards QFF.png',NULL),
(29,'flyBuys Rewards',5,19.99,21.74,NULL,44,65.00,NULL,NULL,NULL,NULL,NULL,6000,NULL,NULL,NULL,(0),(0),(0),(0),NULL,0.00,NULL,10000,NULL,'2019-10-14',NULL,NULL,NULL,NULL,20000,'http://www.nab.com.au/personal/credit-cards/nab-flybuys-rewards-card','flyBuys Rewards.jpg',NULL),
(30,'Velocity Platinum',1,20.74,NULL,NULL,44,349.00,NULL,NULL,30.00,15.00,NULL,3000,65000,2.50,'Velocity',(1),(1),(1),(0),0.99,1.00,6,50000,349.00,NULL,NULL,1.00,NULL,6900,13500,'http://www.americanexpress.com/australia/velocity-rewards-platinumcard','Velocity Platinum.jpg',NULL),
(31,'Qantas American Express Ultimate Card',1,20.74,NULL,NULL,44,450.00,NULL,NULL,30.00,30.00,NULL,3000,65000,2.50,'QFF',(1),(1),(1),(0),0.99,1.00,6,50000,250.00,NULL,1.00,1.00,NULL,8000,15100,'http://www.americanexpress.com/australia/campaigns/qantasultimatertp/index.html','Qantas American Express Ultimate Card.jpg',NULL),
(32,'Platinum Reserve Credit Card',1,20.74,NULL,NULL,55,395.00,NULL,NULL,30.00,15.00,NULL,3000,65000,2.50,'Proprietary',(1),(1),(1),(0),99.00,1.00,6,30000,395.00,NULL,1.00,1.00,NULL,6900,13500,'https://www.americanexpress.com/au/content/platinum-reserve-credit-card','Platinum Reserve Credit Card.jpg',NULL),
(33,'Platinum',1,NULL,NULL,NULL,NULL,1200.00,NULL,NULL,6.00,15.00,NULL,NULL,100000,1.00,'Proprietary',(1),(1),(1),(0),NULL,0.00,NULL,80000,1200.00,NULL,1.00,1.00,NULL,6900,13500,'https://www.americanexpress.com/au/content/the-platinum-card/','Platinum.jpg',NULL),
(34,'Balance Visa',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,(0),(0),(0),(0),NULL,0.00,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.anz.com.au/personal/credit-cards/rewards-frequent-flyer/balance-visa/','Balance Visa.png',NULL),
(35,'Velocity Rewards Premium',5,19.99,21.74,NULL,44,250.00,NULL,NULL,NULL,NULL,NULL,6000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Velocity Rewards Premium.jpg',NULL),
(36,'Velocity Rewards',5,19.99,21.74,NULL,44,65.00,NULL,NULL,NULL,NULL,NULL,500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Velocity Rewards.jpg',NULL),
(37,'No Annual Fee Mastercard',4,17.99,17.99,NULL,62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,(0),(0),(0),(0),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No Annual Fee Mastercard.jpg',NULL),
(38,'Rewards Mastercard',4,19.99,19.99,NULL,62,49.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,(0),(0),(0),(0),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rewards Mastercard.png',NULL),
(39,'American Express',1,NULL,NULL,NULL,NULL,80.00,NULL,-1.00,NULL,NULL,NULL,NULL,35000,1.00,NULL,(1),(1),(1),(0),NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://www.americanexpress.com/au/content/the-american-express-card','American Express.jpg',NULL),
(40,'David Jones Membership Rewards',1,20.74,NULL,NULL,44,99.00,NULL,29.00,30.00,15.00,NULL,2000,40000,NULL,'Proprietary - QFF',(1),(1),(1),(0),NULL,0.00,NULL,30000,99.00,NULL,0.75,NULL,NULL,NULL,NULL,'https://www.americanexpress.com/australia/campaigns/david-jones/gold-30k','David Jones Membership Rewards.jpg',NULL),
(41,'David Jones Platinum Card',1,20.74,NULL,NULL,44,295.00,NULL,NULL,30.00,NULL,NULL,2000,65000,NULL,'Proprietary - QFF',(1),(1),(1),(0),NULL,0.00,NULL,40000,295.00,NULL,0.75,NULL,NULL,NULL,NULL,'https://www.americanexpress.com/australia/campaigns/david-jones/platinum-40k','David Jones Platinum Card.jpg',NULL),
(42,'Low Rate',1,11.99,NULL,NULL,55,65.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,(0),(0),(0),(0),0.99,1.00,6,NULL,65.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Low Rate.jpg',NULL);
-- --------------------------------------------------------

--
-- 表的结构 `card_tier_info`
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
-- 转存表中的数据 `card_tier_info`
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
-- 表的结构 `cc_admin`
--

CREATE TABLE IF NOT EXISTS `cc_admin` (
  `cca_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cca_pwd` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cca_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cc_admin`
--

INSERT INTO `cc_admin` (`cca_username`, `cca_pwd`) VALUES
('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- 表的结构 `cc_admin_action_logs`
--

CREATE TABLE IF NOT EXISTS `cc_admin_action_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_event` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `action_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `cc_admin_action_logs`
--

INSERT INTO `cc_admin_action_logs` (`id`, `admin_event`, `action_by`, `action_time`) VALUES
(1, 'update bank info for bank: 1', 'admin', '2014-09-19 03:46:53'),
(2, 'update bank info for bank: 2', 'admin', '2014-09-19 11:47:58'),
(3, 'update bank info for bank: 2', 'admin', '2014-09-19 11:48:02'),
(4, 'update bank info for bank: 3', 'admin', '2014-09-19 11:49:38'),
(5, 'update bank info for bank: 1', 'admin', '2014-09-20 21:57:45'),
(6, 'update bank info for bank: 1', 'admin', '2014-09-20 21:58:33'),
(7, 'update bank info for bank: 1', 'admin', '2014-09-20 21:58:57'),
(8, 'update bank info for bank: 3', 'admin', '2014-09-20 22:02:11'),
(9, 'update bank info for bank: 2', 'admin', '2014-09-20 22:06:22'),
(13, 'add a new bank info for bank: Hey', 'admin', '2014-09-20 22:16:16'),
(14, 'update bank info for bank: 1', 'admin', '2014-09-25 11:55:37'),
(15, 'update bank info for bank: 1', 'admin', '2014-09-25 11:55:42'),
(16, 'update question: 1', 'admin', '2014-09-26 11:10:30'),
(17, 'update question: 1', 'admin', '2014-09-26 11:12:17');

-- --------------------------------------------------------

--
-- 表的结构 `cc_admin_login_logs`
--

CREATE TABLE IF NOT EXISTS `cc_admin_login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cca_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `cc_admin_login_logs`
--

INSERT INTO `cc_admin_login_logs` (`id`, `cca_username`, `login_time`) VALUES
(1, 'admin', '2014-09-19 09:19:26'),
(2, 'admin', '2014-09-19 09:19:46'),
(3, 'admin', '2014-09-19 09:29:28'),
(4, 'admin', '2014-09-19 09:34:56'),
(5, 'admin', '2014-09-19 09:44:47'),
(6, 'admin', '2014-09-19 11:27:55'),
(7, 'admin', '2014-09-20 21:30:43'),
(8, 'admin', '2014-09-20 21:56:58'),
(9, 'admin', '2014-09-25 11:47:19'),
(10, 'admin', '2014-09-25 13:57:50'),
(11, 'admin', '2014-09-26 09:32:44');

-- --------------------------------------------------------

--
-- 表的结构 `points_per_dollar_spent`
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
-- 转存表中的数据 `points_per_dollar_spent`
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
-- 表的结构 `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `questions`
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
-- 表的结构 `user_answers`
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
-- 表的结构 `user_cards`
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

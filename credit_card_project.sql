
-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2014 at 08:26 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a2485276_cards`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` VALUES(1, 1, 'Air Travel', 1);
INSERT INTO `answers` VALUES(2, 1, 'Hotels', 2);
INSERT INTO `answers` VALUES(3, 1, 'Travel Rewards', 3);
INSERT INTO `answers` VALUES(4, 1, 'Merchandise/Gift Cards', 4);
INSERT INTO `answers` VALUES(5, 1, 'Cash Back', 5);
INSERT INTO `answers` VALUES(6, 2, 'Two or fewer trips', 1);
INSERT INTO `answers` VALUES(7, 2, 'Between three and five trips', 2);
INSERT INTO `answers` VALUES(8, 2, 'More than five trips', 3);
INSERT INTO `answers` VALUES(9, 3, 'Yes', 1);
INSERT INTO `answers` VALUES(10, 3, 'No', 2);
INSERT INTO `answers` VALUES(11, 4, 'Online', 1);
INSERT INTO `answers` VALUES(12, 4, 'Major Stores (e.g. Myer, David Jones)', 2);
INSERT INTO `answers` VALUES(13, 4, 'Independent Retailers', 3);
INSERT INTO `answers` VALUES(14, 5, 'Less than 25%', 1);
INSERT INTO `answers` VALUES(15, 5, 'Between 25 and 50%', 2);
INSERT INTO `answers` VALUES(16, 5, 'Between 50 and 75%', 3);
INSERT INTO `answers` VALUES(17, 5, 'More than 75%', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE `bank_info` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` VALUES(1, 'ANZ');
INSERT INTO `bank_info` VALUES(2, 'CBA');
INSERT INTO `bank_info` VALUES(3, 'Westpac');
INSERT INTO `bank_info` VALUES(4, 'NAB');
INSERT INTO `bank_info` VALUES(5, 'Coles');
INSERT INTO `bank_info` VALUES(6, 'American Express');

-- --------------------------------------------------------

--
-- Table structure for table `card_info`
--

CREATE TABLE `card_info` (
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
  `earning_algo` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info_url` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `image_url` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `referral_url` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `card_info`
--

INSERT INTO `card_info` VALUES(1, 'ARW Black', 2, 18.79, 20.99, 18.79, 55, 320.00, 55.00, 10.00, NULL, NULL, 10000, 15000, 75000, NULL, 'proprietary', '', '', '', '', NULL, 0.00, 16, 50000, NULL, NULL, NULL, NULL, NULL, NULL, 19980, '', 'http://www.anz.com.au/personal/credit-cards/black/anz-rewards/', 'ARW Black.jpg', NULL);
INSERT INTO `card_info` VALUES(2, 'Altitude Black', 6, 19.99, 21.49, NULL, 45, 395.00, NULL, NULL, NULL, NULL, NULL, 15000, NULL, NULL, 'proprietary', '', '', '', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18200, '', 'http://www.westpac.com.au/personal-banking/credit-cards/reward/altitude-black/', 'Altitude Black.png', NULL);
INSERT INTO `card_info` VALUES(3, 'ARW Platinum', 2, 18.79, 20.99, 18.79, 55, 94.00, 55.00, 10.00, NULL, NULL, NULL, 6000, 50000, NULL, 'proprietary', '', '', '', '', NULL, 0.00, 16, 50000, NULL, NULL, NULL, NULL, NULL, NULL, 19980, '', 'http://www.anz.com.au/personal/credit-cards/platinum/anz-rewards/', 'ARW Platinum.jpg', NULL);
INSERT INTO `card_info` VALUES(4, 'Diamond Awards', 3, 20.24, 21.24, NULL, 55, 425.00, NULL, 15.00, NULL, NULL, NULL, 18000, NULL, NULL, 'proprietary', '', '', '', '', NULL, 0.00, 10, NULL, NULL, NULL, NULL, 2.00, NULL, NULL, 18600, '', 'https://www.commbank.com.au/personal/credit-cards/awards/diamond.html', 'Diamond Awards.png', NULL);
INSERT INTO `card_info` VALUES(5, 'ARW Classic', 2, 18.79, 20.99, 18.79, 44, 34.00, 55.00, 10.00, NULL, NULL, NULL, 1000, 15000, NULL, 'proprietary', '\0', '\0', '\0', '', NULL, 0.00, 16, 50000, NULL, NULL, NULL, NULL, NULL, NULL, 19980, '', 'http://www.anz.com.au/personal/credit-cards/rewards-frequent-flyer/anz-rewards/', 'ARW Classic.jpg', NULL);
INSERT INTO `card_info` VALUES(6, 'Platinum Awards', 3, 20.24, 21.24, NULL, 55, 280.00, NULL, 15.00, NULL, NULL, NULL, 6000, NULL, NULL, 'proprietary', '', '', '', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 2.00, NULL, NULL, 18600, '', 'https://www.commbank.com.au/personal/credit-cards/awards/platinum.html', 'Platinum Awards.png', NULL);
INSERT INTO `card_info` VALUES(7, 'Platinum Rewards', 1, 20.74, NULL, NULL, 55, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, 40000, 0.03, 'Proprietary', '', '', '', '\0', 0.99, 1.00, 6, NULL, NULL, NULL, 1.00, 1.00, NULL, 6900, 13500, '', 'https://www.americanexpress.com/australia/platinum-rewards-credit-card/', 'Platinum Rewards.jpg', NULL);
INSERT INTO `card_info` VALUES(8, 'Qantas Rewards Premium', 5, 19.99, 21.74, NULL, 44, 250.00, NULL, NULL, NULL, NULL, NULL, 5000, NULL, NULL, NULL, '', '', '', '', NULL, 0.00, NULL, 40000, NULL, '2019-10-14', NULL, NULL, NULL, 8000, 15100, '', 'http://www.nab.com.au/personal/credit-cards/qantas-credit-cards/nab-qantas-rewards-premium-card', 'Qantas Rewards Premium.jpg', NULL);
INSERT INTO `card_info` VALUES(9, 'AFF Black', 2, 19.99, 21.49, 19.99, 55, 370.00, 55.00, 10.00, NULL, NULL, NULL, 15000, 75000, NULL, 'QFF', '', '', '', '', NULL, 0.00, 16, 50000, NULL, NULL, NULL, NULL, NULL, 8000, 15100, '', 'http://www.anz.com.au/personal/credit-cards/black/anz-frequentflyer/', 'AFF Black.jpg', NULL);
INSERT INTO `card_info` VALUES(10, 'AFF Classic', 2, 19.99, 21.49, 19.99, 44, 40.00, 55.00, 10.00, NULL, NULL, NULL, 1000, 15000, NULL, 'QFF', '\0', '\0', '\0', '', NULL, 0.00, 16, 50000, NULL, NULL, NULL, NULL, NULL, 8000, 15100, '', 'http://www.anz.com.au/personal/credit-cards/rewards-frequent-flyer/frequent-flyer/', 'AFF Classic.jpg', NULL);
INSERT INTO `card_info` VALUES(11, 'Singapore Airlines Westpac Platinum', 6, 19.74, 20.49, NULL, 45, 250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'other', '\0', '\0', '\0', '', 0.01, 0.00, 6, 10000, NULL, NULL, NULL, NULL, NULL, 8000, 15100, '', 'http://www.westpac.com.au/personal-banking/credit-cards/reward/singapore-airlines-platinum/', 'Singapore Airlines Westpac Platinum.png', NULL);
INSERT INTO `card_info` VALUES(12, 'Qantas Rewards', 5, 19.99, 21.74, NULL, 44, 65.00, NULL, NULL, NULL, NULL, NULL, 500, NULL, NULL, NULL, '\0', '\0', '\0', '', NULL, 0.00, NULL, 20000, NULL, '2019-10-14', NULL, NULL, NULL, 8000, 15100, '', 'http://www.nab.com.au/personal/credit-cards/qantas-credit-cards/nab-qantas-rewards-card', 'Qantas Rewards.jpg', NULL);
INSERT INTO `card_info` VALUES(13, 'Earth Black', 6, 19.99, 21.49, NULL, 45, 395.00, NULL, NULL, NULL, NULL, NULL, 15000, NULL, NULL, 'QFF', '', '', '', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8000, 15100, '', 'http://www.westpac.com.au/personal-banking/credit-cards/reward/earth-black/?from=leftnav', 'Earth Black.jpg', NULL);
INSERT INTO `card_info` VALUES(14, 'Altitude Platinum', 6, 19.99, 21.49, NULL, 45, 150.00, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, 'proprietary', '', '', '', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18200, '', 'http://www.westpac.com.au/personal-banking/credit-cards/reward/altitude-platinum/?from=leftnav', 'Altitude Platinum.png', NULL);
INSERT INTO `card_info` VALUES(15, 'AFF Platinum', 2, 19.99, 21.49, 19.99, 55, 240.00, 55.00, 10.00, NULL, NULL, NULL, 6000, 50000, NULL, 'QFF', '', '', '', '', NULL, 0.00, 16, 50000, NULL, NULL, NULL, NULL, NULL, 8000, 15100, '', 'http://www.anz.com.au/personal/credit-cards/platinum/anz-frequent-flyer/', 'AFF Platinum.jpg', NULL);
INSERT INTO `card_info` VALUES(16, 'Diamond Awards QFF', 3, 20.24, 21.24, NULL, 55, 425.00, 10.00, 15.00, NULL, NULL, NULL, 18000, NULL, NULL, 'QFF', '', '', '', '', NULL, 0.00, 10, NULL, NULL, NULL, 2.00, NULL, NULL, 8000, 15100, '', 'https://www.commbank.com.au/personal/credit-cards/awards/diamond.html', 'Diamond Awards QFF.png', NULL);
INSERT INTO `card_info` VALUES(17, 'American Express (with Rewards)', 1, NULL, NULL, NULL, NULL, 80.00, 80.00, -1.00, NULL, NULL, NULL, NULL, 35000, 1.00, 'Proprietary', '', '', '', '\0', NULL, 0.00, NULL, NULL, NULL, NULL, 1.00, 1.00, NULL, 6900, 13500, '', 'https://www.americanexpress.com/au/content/the-american-express-card', 'American Express (with Rewards).jpg', NULL);
INSERT INTO `card_info` VALUES(18, 'Gold Awards', 3, 20.24, 21.24, NULL, 55, 144.00, NULL, 15.00, NULL, NULL, NULL, 4000, NULL, NULL, 'proprietary', '\0', '\0', '\0', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 2.50, NULL, NULL, 18600, '', 'https://www.commbank.com.au/personal/credit-cards/awards/gold.html', 'Gold Awards.png', NULL);
INSERT INTO `card_info` VALUES(19, 'Altitude', 6, 19.99, 21.49, NULL, 45, 100.00, NULL, NULL, NULL, NULL, NULL, 1000, NULL, NULL, 'proprietary', '\0', '\0', '\0', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18200, '', 'http://www.westpac.com.au/personal-banking/credit-cards/reward/altitude/?from=leftnav', 'Altitude.png', NULL);
INSERT INTO `card_info` VALUES(20, 'Awards', 3, 20.24, 21.24, NULL, 55, 89.00, NULL, 15.00, NULL, NULL, NULL, 500, NULL, NULL, 'proprietary', '\0', '\0', '\0', '', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 2.50, NULL, NULL, 18600, '', 'https://www.commbank.com.au/personal/credit-cards/awards/awards.html', 'Awards.jpg', NULL);
INSERT INTO `card_info` VALUES(21, 'Platinum Edge Credit Card', 1, 20.74, NULL, NULL, 55, 195.00, NULL, NULL, 30.00, 15.00, NULL, 3000, 50000, 2.50, 'Proprietary', '', '', '', '\0', 0.99, 1.00, 6, 10000, 195.00, NULL, 1.00, 1.00, NULL, 6900, 13500, '', 'http://www.americanexpress.com/australia/campaigns/platinumedge/index.shtml', 'Platinum Edge Credit Card.jpg', NULL);
INSERT INTO `card_info` VALUES(22, 'Platinum Awards QFF', 3, 20.24, 21.24, NULL, 55, 280.00, 10.00, 15.00, NULL, NULL, NULL, 6000, NULL, NULL, 'QFF', '', '', '', '', NULL, 0.00, NULL, NULL, NULL, NULL, 2.00, NULL, NULL, 8000, 15100, '', 'https://www.commbank.com.au/personal/credit-cards/awards/platinum.html', 'Platinum Awards QFF.jpg', NULL);
INSERT INTO `card_info` VALUES(23, 'Velocity Escape Card', 1, 20.74, NULL, NULL, 44, NULL, NULL, NULL, 30.00, NULL, NULL, 2000, 40000, 0.03, 'Velocity', '', '', '', '\0', 0.99, 1.00, 6, 7500, NULL, NULL, NULL, 1.00, NULL, 6900, 13500, '', 'http://www.americanexpress.com/australia/velocity-rewards-escapecard', 'Velocity Escape Card.jpg', NULL);
INSERT INTO `card_info` VALUES(24, 'Qantas American Express Discovery Card', 1, 20.74, NULL, NULL, 44, NULL, NULL, NULL, 30.00, 30.00, NULL, 1000, 35000, 0.03, 'QFF', '', '', '', '\0', 0.99, 1.00, 6, 7500, NULL, NULL, 1.00, 1.00, NULL, 8000, 15100, '', 'http://www.americanexpress.com/australia/campaigns/discoverypalms/index.html', 'Qantas American Express Discovery Card.jpg', NULL);
INSERT INTO `card_info` VALUES(25, 'Velocity Gold', 1, 20.74, NULL, NULL, 44, 199.00, NULL, NULL, 6.00, 15.00, NULL, 3000, 40000, 0.03, 'Velocity', '', '', '', '\0', 0.99, 1.00, 6, 15000, 99.00, NULL, NULL, 1.00, NULL, 6900, 13500, '', 'http://www.americanexpress.com/australia/velocity-rewards-goldcard', 'Velocity Gold.jpg', NULL);
INSERT INTO `card_info` VALUES(26, 'Qantas American Express Premium Card', 1, 20.74, NULL, NULL, 44, 249.00, NULL, NULL, 30.00, 30.00, NULL, 1000, 40000, 3.00, 'QFF', '', '', '', '\0', 0.99, 1.00, 6, 30000, 149.00, NULL, 1.00, 1.00, NULL, 8000, 15100, '', 'http://www.americanexpress.com/australia/campaigns/qantaspremiumrtp/index.html', 'Qantas American Express Premium Card.jpg', NULL);
INSERT INTO `card_info` VALUES(27, 'Gold Awards QFF', 3, 20.24, 21.24, NULL, 55, 144.00, 10.00, 15.00, NULL, NULL, NULL, 4000, NULL, NULL, 'QFF', '\0', '\0', '\0', '', NULL, 0.00, NULL, NULL, NULL, NULL, 2.50, NULL, NULL, 8000, 15100, '', 'https://www.commbank.com.au/personal/credit-cards/awards/gold.html', 'Gold Awards QFF.png', NULL);
INSERT INTO `card_info` VALUES(28, 'Awards QFF', 3, 20.24, 21.24, NULL, 55, 89.00, 10.00, 15.00, NULL, NULL, NULL, 500, NULL, NULL, 'QFF', '\0', '\0', '\0', '', NULL, 0.00, NULL, NULL, NULL, NULL, 2.50, NULL, NULL, 8000, 15100, '', 'https://www.commbank.com.au/personal/credit-cards/awards/awards.html', 'Awards QFF.png', NULL);
INSERT INTO `card_info` VALUES(29, 'flyBuys Rewards', 5, 19.99, 21.74, NULL, 44, 65.00, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL, '\0', '\0', '\0', '\0', NULL, 0.00, NULL, 10000, NULL, '2019-10-14', NULL, NULL, NULL, NULL, 20000, '', 'http://www.nab.com.au/personal/credit-cards/nab-flybuys-rewards-card', 'flyBuys Rewards.jpg', NULL);
INSERT INTO `card_info` VALUES(30, 'Velocity Platinum', 1, 20.74, NULL, NULL, 44, 349.00, NULL, NULL, 30.00, 15.00, NULL, 3000, 65000, 2.50, 'Velocity', '', '', '', '\0', 0.99, 1.00, 6, 50000, 349.00, NULL, NULL, 1.00, NULL, 6900, 13500, '', 'http://www.americanexpress.com/australia/velocity-rewards-platinumcard', 'Velocity Platinum.jpg', NULL);
INSERT INTO `card_info` VALUES(31, 'Qantas American Express Ultimate Card', 1, 20.74, NULL, NULL, 44, 450.00, NULL, NULL, 30.00, 30.00, NULL, 3000, 65000, 2.50, 'QFF', '', '', '', '\0', 0.99, 1.00, 6, 50000, 250.00, NULL, 1.00, 1.00, NULL, 8000, 15100, '', 'http://www.americanexpress.com/australia/campaigns/qantasultimatertp/index.html', 'Qantas American Express Ultimate Card.jpg', NULL);
INSERT INTO `card_info` VALUES(32, 'Platinum Reserve Credit Card', 1, 20.74, NULL, NULL, 55, 395.00, NULL, NULL, 30.00, 15.00, NULL, 3000, 65000, 2.50, 'Proprietary', '', '', '', '\0', 99.00, 1.00, 6, 30000, 395.00, NULL, 1.00, 1.00, NULL, 6900, 13500, '', 'https://www.americanexpress.com/au/content/platinum-reserve-credit-card', 'Platinum Reserve Credit Card.jpg', NULL);
INSERT INTO `card_info` VALUES(33, 'Platinum', 1, NULL, NULL, NULL, NULL, 1200.00, NULL, NULL, 6.00, 15.00, NULL, NULL, 100000, 1.00, 'Proprietary', '', '', '', '\0', NULL, 0.00, NULL, 80000, 1200.00, NULL, 1.00, 1.00, NULL, 6900, 13500, '', 'https://www.americanexpress.com/au/content/the-platinum-card/', 'Platinum.jpg', NULL);
INSERT INTO `card_info` VALUES(34, 'Balance Visa', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\0', '\0', '\0', '\0', NULL, 0.00, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'http://www.anz.com.au/personal/credit-cards/rewards-frequent-flyer/balance-visa/', 'Balance Visa.png', NULL);
INSERT INTO `card_info` VALUES(35, 'Velocity Rewards Premium', 5, 19.99, 21.74, NULL, 44, 250.00, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Velocity Rewards Premium.jpg', NULL);
INSERT INTO `card_info` VALUES(36, 'Velocity Rewards', 5, 19.99, 21.74, NULL, 44, 65.00, NULL, NULL, NULL, NULL, NULL, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Velocity Rewards.jpg', NULL);
INSERT INTO `card_info` VALUES(37, 'No Annual Fee Mastercard', 4, 17.99, 17.99, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\0', '\0', '\0', '\0', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'No Annual Fee Mastercard.jpg', NULL);
INSERT INTO `card_info` VALUES(38, 'Rewards Mastercard', 4, 19.99, 19.99, NULL, 62, 49.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\0', '\0', '\0', '\0', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Rewards Mastercard.png', NULL);
INSERT INTO `card_info` VALUES(39, 'American Express', 1, NULL, NULL, NULL, NULL, 80.00, NULL, -1.00, NULL, NULL, NULL, NULL, 35000, 1.00, NULL, '', '', '', '\0', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'https://www.americanexpress.com/au/content/the-american-express-card', 'American Express.jpg', NULL);
INSERT INTO `card_info` VALUES(40, 'David Jones Membership Rewards', 1, 20.74, NULL, NULL, 44, 99.00, NULL, 29.00, 30.00, 15.00, NULL, 2000, 40000, NULL, 'Proprietary - QFF', '', '', '', '\0', NULL, 0.00, NULL, 30000, 99.00, NULL, 0.75, NULL, NULL, NULL, NULL, '', 'https://www.americanexpress.com/australia/campaigns/david-jones/gold-30k', 'David Jones Membership Rewards.jpg', NULL);
INSERT INTO `card_info` VALUES(41, 'David Jones Platinum Card', 1, 20.74, NULL, NULL, 44, 295.00, NULL, NULL, 30.00, NULL, NULL, 2000, 65000, NULL, 'Proprietary - QFF', '', '', '', '\0', NULL, 0.00, NULL, 40000, 295.00, NULL, 0.75, NULL, NULL, NULL, NULL, '', 'https://www.americanexpress.com/australia/campaigns/david-jones/platinum-40k', 'David Jones Platinum Card.jpg', NULL);
INSERT INTO `card_info` VALUES(42, 'Low Rate', 1, 11.99, NULL, NULL, 55, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\0', '\0', '\0', '\0', 0.99, 1.00, 6, NULL, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Low Rate.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `card_tier_info`
--

CREATE TABLE `card_tier_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `visa_points_per_dollar` decimal(5,3) DEFAULT NULL,
  `amex_points_per_dollar` decimal(5,3) DEFAULT NULL,
  `points_cap` int(11) DEFAULT NULL,
  `tier` char(2) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `card_tier_info`
--

INSERT INTO `card_tier_info` VALUES(1, 1, 0.400, 1.000, NULL, '1');
INSERT INTO `card_tier_info` VALUES(2, 2, 0.500, 1.000, NULL, '1');
INSERT INTO `card_tier_info` VALUES(3, 3, 0.750, 1.500, NULL, '1');
INSERT INTO `card_tier_info` VALUES(4, 4, 1.000, 1.500, NULL, '1');
INSERT INTO `card_tier_info` VALUES(5, 5, 1.500, 2.000, NULL, '1');
INSERT INTO `card_tier_info` VALUES(6, 6, 2.000, 3.000, NULL, '1');
INSERT INTO `card_tier_info` VALUES(7, 8, 1.250, 3.000, 1000000, '1');
INSERT INTO `card_tier_info` VALUES(8, 9, 0.625, 1.500, 500000, '1');
INSERT INTO `card_tier_info` VALUES(9, 10, 1.000, 2.500, 150000, '1');
INSERT INTO `card_tier_info` VALUES(10, 10, NULL, 1.000, 100000, '2');
INSERT INTO `card_tier_info` VALUES(11, 11, 0.500, 1.250, 60000, '1');
INSERT INTO `card_tier_info` VALUES(12, 11, NULL, 0.500, 40000, '2');
INSERT INTO `card_tier_info` VALUES(13, 12, 1.000, 2.000, 75000, '1');
INSERT INTO `card_tier_info` VALUES(14, 12, NULL, 1.000, 50000, '2');
INSERT INTO `card_tier_info` VALUES(15, 13, 0.400, 0.800, 24000, '1');
INSERT INTO `card_tier_info` VALUES(16, 13, NULL, 0.400, 16000, '2');
INSERT INTO `card_tier_info` VALUES(17, 14, 1.000, 1.500, 50000, '1');
INSERT INTO `card_tier_info` VALUES(18, 15, 0.400, 0.600, 12000, '1');
INSERT INTO `card_tier_info` VALUES(19, 15, NULL, 0.400, 8000, '2');
INSERT INTO `card_tier_info` VALUES(20, 16, 1.250, 3.000, NULL, '1');
INSERT INTO `card_tier_info` VALUES(21, 17, 0.625, 1.500, NULL, '1');
INSERT INTO `card_tier_info` VALUES(22, 18, 1.000, 2.000, 7500, '1');
INSERT INTO `card_tier_info` VALUES(23, 19, 1.000, 2.000, 5000, '1');
INSERT INTO `card_tier_info` VALUES(24, 20, 0.500, 1.500, NULL, '1');
INSERT INTO `card_tier_info` VALUES(25, 21, 0.500, 1.500, 100000, '1');
INSERT INTO `card_tier_info` VALUES(26, 22, 0.500, 1.000, 100000, '1');
INSERT INTO `card_tier_info` VALUES(27, 23, 0.500, 1.500, 100000, '1');
INSERT INTO `card_tier_info` VALUES(28, 24, 0.500, 1.000, 100000, '1');
INSERT INTO `card_tier_info` VALUES(29, 25, 1.000, NULL, NULL, '1');
INSERT INTO `card_tier_info` VALUES(30, 26, 0.500, NULL, NULL, '1');
INSERT INTO `card_tier_info` VALUES(31, 27, 2.000, NULL, NULL, '1');
INSERT INTO `card_tier_info` VALUES(32, 28, NULL, NULL, 150000, '1');
INSERT INTO `card_tier_info` VALUES(33, 28, NULL, 0.500, NULL, '2');
INSERT INTO `card_tier_info` VALUES(34, 32, NULL, NULL, 300000, '1');
INSERT INTO `card_tier_info` VALUES(35, 32, NULL, 1.000, NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `cc_admin`
--

CREATE TABLE `cc_admin` (
  `cca_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cca_pwd` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cca_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cc_admin`
--

INSERT INTO `cc_admin` VALUES('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Table structure for table `cc_admin_action_logs`
--

CREATE TABLE `cc_admin_action_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_event` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `action_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `cc_admin_action_logs`
--

INSERT INTO `cc_admin_action_logs` VALUES(1, 'update bank info for bank: 1', 'admin', '2014-09-19 03:46:53');
INSERT INTO `cc_admin_action_logs` VALUES(2, 'update bank info for bank: 2', 'admin', '2014-09-19 11:47:58');
INSERT INTO `cc_admin_action_logs` VALUES(3, 'update bank info for bank: 2', 'admin', '2014-09-19 11:48:02');
INSERT INTO `cc_admin_action_logs` VALUES(4, 'update bank info for bank: 3', 'admin', '2014-09-19 11:49:38');
INSERT INTO `cc_admin_action_logs` VALUES(5, 'update bank info for bank: 1', 'admin', '2014-09-20 21:57:45');
INSERT INTO `cc_admin_action_logs` VALUES(6, 'update bank info for bank: 1', 'admin', '2014-09-20 21:58:33');
INSERT INTO `cc_admin_action_logs` VALUES(7, 'update bank info for bank: 1', 'admin', '2014-09-20 21:58:57');
INSERT INTO `cc_admin_action_logs` VALUES(8, 'update bank info for bank: 3', 'admin', '2014-09-20 22:02:11');
INSERT INTO `cc_admin_action_logs` VALUES(9, 'update bank info for bank: 2', 'admin', '2014-09-20 22:06:22');
INSERT INTO `cc_admin_action_logs` VALUES(13, 'add a new bank info for bank: Hey', 'admin', '2014-09-20 22:16:16');
INSERT INTO `cc_admin_action_logs` VALUES(14, 'update bank info for bank: 1', 'admin', '2014-09-25 11:55:37');
INSERT INTO `cc_admin_action_logs` VALUES(15, 'update bank info for bank: 1', 'admin', '2014-09-25 11:55:42');
INSERT INTO `cc_admin_action_logs` VALUES(16, 'update question: 1', 'admin', '2014-09-26 11:10:30');
INSERT INTO `cc_admin_action_logs` VALUES(17, 'update question: 1', 'admin', '2014-09-26 11:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `cc_admin_login_logs`
--

CREATE TABLE `cc_admin_login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cca_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cc_admin_login_logs`
--

INSERT INTO `cc_admin_login_logs` VALUES(1, 'admin', '2014-09-19 09:19:26');
INSERT INTO `cc_admin_login_logs` VALUES(2, 'admin', '2014-09-19 09:19:46');
INSERT INTO `cc_admin_login_logs` VALUES(3, 'admin', '2014-09-19 09:29:28');
INSERT INTO `cc_admin_login_logs` VALUES(4, 'admin', '2014-09-19 09:34:56');
INSERT INTO `cc_admin_login_logs` VALUES(5, 'admin', '2014-09-19 09:44:47');
INSERT INTO `cc_admin_login_logs` VALUES(6, 'admin', '2014-09-19 11:27:55');
INSERT INTO `cc_admin_login_logs` VALUES(7, 'admin', '2014-09-20 21:30:43');
INSERT INTO `cc_admin_login_logs` VALUES(8, 'admin', '2014-09-20 21:56:58');
INSERT INTO `cc_admin_login_logs` VALUES(9, 'admin', '2014-09-25 11:47:19');
INSERT INTO `cc_admin_login_logs` VALUES(10, 'admin', '2014-09-25 13:57:50');
INSERT INTO `cc_admin_login_logs` VALUES(11, 'admin', '2014-09-26 09:32:44');
INSERT INTO `cc_admin_login_logs` VALUES(12, 'admin', '2014-10-07 23:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `points_per_dollar_spent`
--

CREATE TABLE `points_per_dollar_spent` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `points_per_dollar_spent`
--

INSERT INTO `points_per_dollar_spent` VALUES(1, 16, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.0, NULL, NULL, NULL, NULL);
INSERT INTO `points_per_dollar_spent` VALUES(2, 17, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.5, NULL, NULL, NULL, NULL);
INSERT INTO `points_per_dollar_spent` VALUES(3, 20, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.5, NULL, NULL, NULL, NULL);
INSERT INTO `points_per_dollar_spent` VALUES(4, 28, 1.0, 1.0, 1.0, 1.0, 0.5, 3.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(5, 29, 3.0, 2.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(6, 32, 1.0, 1.0, 1.0, 1.0, 0.5, 3.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(7, 33, 2.0, 2.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(8, 34, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(9, 35, 1.0, 1.0, 1.0, 1.0, 0.5, 3.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(10, 36, 2.0, 2.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(11, 37, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(12, 38, 1.0, 1.0, 1.0, 1.0, 0.5, 3.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(13, 39, 2.0, 2.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(14, 40, 3.0, 3.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0);
INSERT INTO `points_per_dollar_spent` VALUES(15, 41, 3.0, 3.0, 4.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` VALUES(1, 'What would you like to redeem your rewards for? (type of rewards program)', NULL);
INSERT INTO `questions` VALUES(2, 'How much do you plan to travel in the coming year?', NULL);
INSERT INTO `questions` VALUES(3, 'Do you use your debit card frequently?', NULL);
INSERT INTO `questions` VALUES(4, 'What is your favorite way to shop?', NULL);
INSERT INTO `questions` VALUES(5, 'How much of your shopping is online?', NULL);
INSERT INTO `questions` VALUES(6, 'What''s your annual household income?', NULL);
INSERT INTO `questions` VALUES(7, 'How many in your household', NULL);
INSERT INTO `questions` VALUES(8, 'Estimate what you spend each month on your credit cards', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codes` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'a unique encoded url parameter',
  `answers` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'list of a user''s answers to all questions',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `email_send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_answers`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL COMMENT 'refers to the id in table `card_info`',
  `average_monthly_spend` decimal(8,2) DEFAULT NULL,
  `balance_paid_off` int(1) DEFAULT NULL COMMENT 'stores the option id of drop-down list',
  `companion_card_paid_off` int(1) DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_cards`
--


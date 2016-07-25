/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : companies

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2016-07-25 05:33:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(255) DEFAULT NULL,
  `coins` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq` (`companyname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companies
-- ----------------------------

-- ----------------------------
-- Table structure for company_price
-- ----------------------------
DROP TABLE IF EXISTS `company_price`;
CREATE TABLE `company_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `companyitemcode` varchar(255) DEFAULT NULL,
  `companyitemname` varchar(255) DEFAULT NULL,
  `companyitemgroup` varchar(255) DEFAULT NULL,
  `companyitembrand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq` (`companyitemcode`) USING BTREE,
  KEY `fk_companies_price_companies_1` (`companyid`),
  CONSTRAINT `fk_companies_price_companies_1` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_price
-- ----------------------------

-- ----------------------------
-- Table structure for compares
-- ----------------------------
DROP TABLE IF EXISTS `compares`;
CREATE TABLE `compares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorpricename` varchar(255) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `finishtime` int(255) DEFAULT NULL,
  `foundqty` int(11) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compares_companies_1` (`companyid`),
  CONSTRAINT `fk_compares_companies_1` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of compares
-- ----------------------------

-- ----------------------------
-- Table structure for compare_results
-- ----------------------------
DROP TABLE IF EXISTS `compare_results`;
CREATE TABLE `compare_results` (
  `id` int(11) NOT NULL,
  `companyid` int(11) DEFAULT NULL,
  `vendorid` int(11) DEFAULT NULL,
  `companycode` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `vendorcode` varchar(255) DEFAULT NULL,
  `vendorname` varchar(255) DEFAULT NULL,
  `percent` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compare_results_companies_1` (`companyid`),
  KEY `fk_compare_results_vendors_1` (`vendorid`),
  CONSTRAINT `fk_compare_results_vendors_1` FOREIGN KEY (`vendorid`) REFERENCES `vendors` (`id`),
  CONSTRAINT `fk_compare_results_companies_1` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of compare_results
-- ----------------------------

-- ----------------------------
-- Table structure for currecies
-- ----------------------------
DROP TABLE IF EXISTS `currecies`;
CREATE TABLE `currecies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorid` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `value` float(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_currecies_vendors_1` (`vendorid`),
  CONSTRAINT `fk_currecies_vendors_1` FOREIGN KEY (`vendorid`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currecies
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for userdata
-- ----------------------------
DROP TABLE IF EXISTS `userdata`;
CREATE TABLE `userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `companyid` int(255) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userdata_users_1` (`userid`),
  KEY `fk_userdata_companies_1` (`companyid`),
  KEY `fk_userdata_roles_1` (`roleid`),
  CONSTRAINT `fk_userdata_roles_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_userdata_companies_1` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_userdata_users_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdata
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq` (`username`,`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'user', '098f6bcd4621d373cade4e832627b4f6', 'test@test.ru');

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendors_companies_1` (`companyid`),
  CONSTRAINT `fk_vendors_companies_1` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vendors
-- ----------------------------

-- ----------------------------
-- Table structure for vendor_prices
-- ----------------------------
DROP TABLE IF EXISTS `vendor_prices`;
CREATE TABLE `vendor_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `vendorid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `vendorcode` varchar(255) DEFAULT NULL,
  `vendoritemname` varchar(255) DEFAULT NULL,
  `vendorbrand` varchar(255) DEFAULT NULL,
  `vendorgroup` varchar(255) DEFAULT NULL,
  `vendorprice` float(10,2) DEFAULT NULL,
  `vendorrrp` varchar(255) DEFAULT NULL,
  `vendorcurrencyid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendor_prices_companies_1` (`companyid`),
  KEY `fk_vendor_prices_users_1` (`userid`),
  KEY `fk_vendor_prices_vendors_1` (`vendorid`),
  KEY `fk_vendor_prices_currecies_1` (`vendorcurrencyid`),
  CONSTRAINT `fk_vendor_prices_currecies_1` FOREIGN KEY (`vendorcurrencyid`) REFERENCES `currecies` (`id`),
  CONSTRAINT `fk_vendor_prices_companies_1` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_vendor_prices_users_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_vendor_prices_vendors_1` FOREIGN KEY (`vendorid`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vendor_prices
-- ----------------------------

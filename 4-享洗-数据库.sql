# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 180.76.141.171 (MySQL 5.5.54-0ubuntu0.14.04.1)
# Database: aabb
# Generation Time: 2017-05-26 13:00:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址名',
  `lat` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `lng` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '详情',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `nick` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账户名',
  `password_digest` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `region_id` int(11) DEFAULT NULL COMMENT '地区id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table advertisements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `advertisements`;

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `ad_logo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ar_internal_metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ar_internal_metadata`;

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品类id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '品类名',
  `logo` varchar(255) DEFAULT NULL COMMENT '品类图案',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table cityprices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cityprices`;

CREATE TABLE `cityprices` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '城市价格关联id',
  `city` varchar(255) DEFAULT NULL COMMENT '城市名',
  `product_id` varchar(255) DEFAULT NULL COMMENT '商品id',
  `price` varchar(255) DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '优惠券详情',
  `from` datetime DEFAULT NULL COMMENT '优惠开始时间',
  `to` datetime DEFAULT NULL COMMENT '优惠结束时间',
  `price` decimal(10,0) DEFAULT NULL COMMENT '优惠起始价格',
  `discount` decimal(10,0) DEFAULT NULL COMMENT '可优惠价格',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `price` decimal(10,0) DEFAULT NULL COMMENT '购物价格',
  `amount` int(11) DEFAULT NULL COMMENT '购物数量',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `user_card_id` int(11) DEFAULT NULL COMMENT '用户卡号id',
  `real_money` decimal(10,0) DEFAULT NULL COMMENT '真钱数额',
  `fake_money` decimal(10,0) DEFAULT NULL COMMENT '假钱数额',
  `method` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '方式',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '-1' COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table merchant_incomes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchant_incomes`;

CREATE TABLE `merchant_incomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户收入id',
  `merchant_id` int(11) DEFAULT NULL COMMENT '商户id',
  `price` decimal(10,0) DEFAULT NULL COMMENT '实际收入',
  `discount` decimal(10,0) DEFAULT NULL COMMENT '折扣消费',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_settlement` int(11) NOT NULL DEFAULT '1' COMMENT '是否结算',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table merchant_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchant_logs`;

CREATE TABLE `merchant_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户收入流水id',
  `money` decimal(10,6) DEFAULT NULL COMMENT '收入金额',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `merchant_id` int(11) DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table merchant_orderships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchant_orderships`;

CREATE TABLE `merchant_orderships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户订单id',
  `merchant_id` int(11) DEFAULT NULL COMMENT '商户id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '使用情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table merchant_productships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchant_productships`;

CREATE TABLE `merchant_productships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户商品id',
  `merchant_id` int(11) DEFAULT NULL COMMENT '商户id',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` decimal(10,6) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table merchant_stationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchant_stationships`;

CREATE TABLE `merchant_stationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 商户站点id',
  `merchant_id` int(11) DEFAULT NULL COMMENT '商户id',
  `station_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table merchants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchants`;

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户id',
  `nick` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户名',
  `password_digest` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户密码',
  `mobile` varchar(255) DEFAULT NULL COMMENT '商户手机',
  `mail` varchar(255) DEFAULT NULL COMMENT '商户邮箱',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '可用状态',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '使用状态',
  `license` varchar(255) DEFAULT NULL COMMENT '身份证件',
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '详情',
  `logo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '照片路径',
  `card` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '营业执照',
  `rename` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户id',
  `address_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '地址id',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_id` varchar(255) NOT NULL COMMENT '商品id',
  `product_nums` int(11) DEFAULT NULL COMMENT '商品数量',
  `discount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '折扣',
  `merchant_price` decimal(10,6) DEFAULT '0.000000' COMMENT '商户获利',
  `withdraw` int(11) NOT NULL DEFAULT '1' COMMENT '是否结算',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table orderstations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderstations`;

CREATE TABLE `orderstations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单站点id',
  `station_id` varchar(255) DEFAULT NULL COMMENT '站点id',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '使用情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名',
  `logo` varchar(255) DEFAULT NULL COMMENT '商品图案',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `category_id` int(11) DEFAULT NULL COMMENT '品类id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price1` decimal(10,6) DEFAULT NULL,
  `price2` decimal(10,6) DEFAULT NULL,
  `price3` decimal(10,6) DEFAULT NULL,
  `price4` decimal(10,6) DEFAULT NULL,
  `price5` decimal(10,6) DEFAULT NULL,
  `price6` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regions`;

CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地区名',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `level` int(11) DEFAULT NULL COMMENT '级别',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table rider_stationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rider_stationships`;

CREATE TABLE `rider_stationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '骑手站点id',
  `rider_id` int(11) DEFAULT NULL COMMENT '骑手id',
  `station_id` int(11) DEFAULT NULL COMMENT '站点id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table riderorders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `riderorders`;

CREATE TABLE `riderorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '骑手订单id',
  `rider_id` varchar(255) DEFAULT NULL COMMENT '骑手id',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '可用情况',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table riders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `riders`;

CREATE TABLE `riders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '骑手id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '骑手名',
  `password_digest` varchar(255) NOT NULL COMMENT '骑手密码',
  `mobile` varchar(255) NOT NULL COMMENT '骑手电话',
  `sex` varchar(255) DEFAULT NULL COMMENT '骑手性别',
  `license_num` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '可用状态',
  `id_front` varchar(255) DEFAULT NULL,
  `id_back` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL COMMENT '地区id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table role_serviceships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_serviceships`;

CREATE TABLE `role_serviceships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色服务id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `service_id` int(11) DEFAULT NULL COMMENT '服务id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `nick` varchar(255) DEFAULT NULL COMMENT '角色昵称',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '删除情况',
  `comment` text NOT NULL COMMENT '详情',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `function` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能情况',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `url` varchar(255) DEFAULT NULL COMMENT '连接',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table stations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stations`;

CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `name` varchar(255) DEFAULT NULL COMMENT '站点名',
  `address_id` int(11) DEFAULT NULL COMMENT '地址id',
  `region_id` int(11) DEFAULT NULL COMMENT '地区id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '使用状况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_adddressships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_adddressships`;

CREATE TABLE `user_adddressships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `address_id` int(11) DEFAULT NULL COMMENT '地址id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_cards`;

CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户卡号id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `real_money` decimal(10,2) DEFAULT '0.00' COMMENT '真钱',
  `fake_money` decimal(10,2) DEFAULT '100.00' COMMENT '假钱',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table user_couponships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_couponships`;

CREATE TABLE `user_couponships` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户优惠券id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '删除情况',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table useraddresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `useraddresses`;

CREATE TABLE `useraddresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `user_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户id',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址详情',
  `latitude` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '经度',
  `longitude` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '纬度',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '删除情况',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password_digest` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户密码',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sex` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '性别',
  `mobile` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '电话',
  `is_del` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '0' COMMENT '可用情况',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

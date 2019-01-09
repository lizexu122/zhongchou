/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : financing

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-01-08 14:26:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '收获地址id',
  `user_id` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_33hg5keygw64femiy5lgd4y9t` (`user_id`) USING BTREE,
  CONSTRAINT `FK_33hg5keygw64femiy5lgd4y9t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` varchar(255) DEFAULT NULL,
  `to_user_id` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comment_from_user_id_fk` (`from_user_id`) USING BTREE,
  KEY `comment_to_user_id_fk` (`to_user_id`) USING BTREE,
  KEY `comment_project_id_fk` (`project_id`) USING BTREE,
  CONSTRAINT `comment_from_user_id_fk` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `comment_to_user_id_fk` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(255) NOT NULL COMMENT '订单id OD+8位数字',
  `address_id` varchar(255) DEFAULT NULL COMMENT '收货地址id',
  `create_time` datetime DEFAULT NULL COMMENT '创建订单时间',
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `project_back_id` varchar(255) DEFAULT NULL COMMENT '项目回报id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：0 ',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '投资金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_h30i806gbs4nk7d49y38evma` (`project_id`) USING BTREE,
  KEY `FK_l7nrivpde1aaeemelv5fjhadg` (`user_id`) USING BTREE,
  CONSTRAINT `FK_h30i806gbs4nk7d49y38evma` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_l7nrivpde1aaeemelv5fjhadg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(255) NOT NULL COMMENT '主键，PJ+8位数字',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `user_id` varchar(255) NOT NULL COMMENT '用户id，9位数字',
  `category_id` int(255) NOT NULL COMMENT '项目种类id',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面，存储路径',
  `goal_amount` decimal(10,0) DEFAULT NULL COMMENT '目标金额',
  `actual_amount` decimal(10,0) DEFAULT NULL COMMENT '实际融资金额',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `support_count` int(255) DEFAULT '0' COMMENT '支持数',
  `team` text COMMENT '项目团队',
  `purpose` text COMMENT '融资目的',
  `detail` longtext COMMENT '项目详情',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `hotline` varchar(255) DEFAULT NULL COMMENT '咨询电话',
  `contact_phone` varchar(11) DEFAULT NULL COMMENT '联系人手机',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态： 0 未完成未到期 1 已完成 未到期 2 未完成 已到期 3 已完成 已到期',
  `praise` int(255) DEFAULT NULL COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3like0l3x1tm6ihavq2ud562f` (`category_id`) USING BTREE,
  KEY `FK_d289eyi88w83rbeyhkhrvpldc` (`user_id`) USING BTREE,
  CONSTRAINT `FK_3like0l3x1tm6ihavq2ud562f` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_d289eyi88w83rbeyhkhrvpldc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for project_back
-- ----------------------------
DROP TABLE IF EXISTS `project_back`;
CREATE TABLE `project_back` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) NOT NULL COMMENT '项目id',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '支持金额',
  `content` text COMMENT '回报内容',
  `post` int(4) DEFAULT NULL COMMENT '是否邮寄 0 虚拟回报 不需邮寄 1 实物回报 邮寄',
  `allow` int(255) DEFAULT NULL COMMENT '允许人数',
  `back_date` date DEFAULT NULL COMMENT '回报时间',
  `compensation` int(4) DEFAULT NULL COMMENT '回报类型：1 无私 0 有偿',
  `actual` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_ksg0xwkgoouitd4vlhelbcvjj` (`project_id`) USING BTREE,
  CONSTRAINT `FK_ksg0xwkgoouitd4vlhelbcvjj` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for project_update
-- ----------------------------
DROP TABLE IF EXISTS `project_update`;
CREATE TABLE `project_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) NOT NULL,
  `update_time` datetime NOT NULL,
  `update_content` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_9k4k1lwwnfy4q1sogum61qgdo` (`project_id`) USING BTREE,
  CONSTRAINT `FK_9k4k1lwwnfy4q1sogum61qgdo` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL COMMENT '主键 用户ID 9位数字',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名(不可重复)',
  `mobile` varchar(11) NOT NULL COMMENT '手机号(不可重复)',
  `password` varchar(255) NOT NULL COMMENT '密码 md5加密',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `avatar` varchar(255) NOT NULL DEFAULT '/financing/image/defaulthead.png' COMMENT '头像地址',
  `gender` varchar(255) NOT NULL DEFAULT 'secrecy' COMMENT '性别',
  `zone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '城市地区',
  `balance` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '账户余额',
  `intro` text NOT NULL COMMENT '简介',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：-1 - 黑名单 0 -未完善身份信息 1 - 已完善身份信息',
  `IC` varchar(18) NOT NULL DEFAULT 'unknown' COMMENT '居民身份证号',
  `realname` varchar(255) NOT NULL DEFAULT 'unknown' COMMENT '用户真实姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

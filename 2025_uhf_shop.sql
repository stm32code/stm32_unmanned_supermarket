/*
Navicat MySQL Data Transfer

Source Server         : db.stm32.site
Source Server Version : 50744
Source Host           : db.stm32.site:10010
Source Database       : 2025_uhf_shop

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2025-04-20 01:22:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bs_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bs_goods`;
CREATE TABLE `bs_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) DEFAULT NULL,
  `gsort` varchar(255) DEFAULT NULL,
  `gbalance` varchar(255) DEFAULT NULL,
  `grfid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_goods
-- ----------------------------
INSERT INTO `bs_goods` VALUES ('1', '冷冻水饺', '冷冻食品类', '23.5', 'ldsj');
INSERT INTO `bs_goods` VALUES ('5', '王老吉', '饮料食品类', '5', '50 1C 1A 44 5C DE');
INSERT INTO `bs_goods` VALUES ('6', '阿尔卑斯', '糖果糕点类', '2', 'arbs');
INSERT INTO `bs_goods` VALUES ('7', '中华', '烟酒茶类', '55', 'zh');
INSERT INTO `bs_goods` VALUES ('8', '黄桃罐头', '酱菜罐头类', '15', 'htgt');
INSERT INTO `bs_goods` VALUES ('9', '冷冻馄饨', '冷冻食品类', '28', 'ldht');
INSERT INTO `bs_goods` VALUES ('10', '盐', '调味品类', '1', '50 1C 1A 44 5C DD');
INSERT INTO `bs_goods` VALUES ('11', '红茶', '烟酒茶类', '2', '50 1C 1A 44 5C F6');
INSERT INTO `bs_goods` VALUES ('12', '瓜子', '炒货蜜饯类', '5', 'gz');
INSERT INTO `bs_goods` VALUES ('13', '糖', '调味品类', '2.99', 't');
INSERT INTO `bs_goods` VALUES ('14', '大米', '粮食制品', '40', 'B76DD904');

-- ----------------------------
-- Table structure for `bs_history`
-- ----------------------------
DROP TABLE IF EXISTS `bs_history`;
CREATE TABLE `bs_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `udate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `gbalance` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `gname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_history
-- ----------------------------
INSERT INTO `bs_history` VALUES ('1', '2', '1', '2022-12-12 19:34:14', null, '23.5', '用户1', '冷冻水饺');
INSERT INTO `bs_history` VALUES ('2', '4', '5', '2022-12-13 19:34:42', null, '5', '用户2', '王老吉');
INSERT INTO `bs_history` VALUES ('3', '5', '7', '2022-12-13 19:34:51', null, '55', '用户3', '中华');
INSERT INTO `bs_history` VALUES ('4', '2', '5', '2022-12-16 21:55:34', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('5', '2', '5', '2022-12-16 21:58:01', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('6', '2', '11', '2022-12-17 19:13:50', null, '2', '用户1', '红茶');
INSERT INTO `bs_history` VALUES ('7', '2', '5', '2022-12-17 19:45:37', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('8', '2', '5', '2022-12-17 19:45:58', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('9', '2', '14', '2023-02-22 21:20:26', null, '50', '用户1', '大米');
INSERT INTO `bs_history` VALUES ('10', '2', '11', '2023-02-22 21:25:53', null, '2', '用户1', '红茶');
INSERT INTO `bs_history` VALUES ('11', '2', '5', '2023-02-22 21:31:30', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('12', '2', '11', '2023-03-30 17:59:55', null, '2', '用户1', '红茶');
INSERT INTO `bs_history` VALUES ('13', '2', '11', '2023-03-30 18:40:14', null, '2', '用户1', '红茶');
INSERT INTO `bs_history` VALUES ('14', '2', '11', '2023-03-30 18:40:17', null, '2', '用户1', '红茶');
INSERT INTO `bs_history` VALUES ('15', '2', '5', '2023-04-05 14:40:23', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('16', '2', '5', '2023-04-05 14:41:00', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('17', '2', '5', '2023-04-05 15:39:27', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('18', '2', '5', '2023-05-09 17:39:49', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('19', '2', '5', '2023-05-26 20:55:51', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('20', '2', '5', '2023-05-26 20:57:43', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('21', '2', '5', '2023-05-26 21:03:29', null, '5', '用户1', '王老吉');
INSERT INTO `bs_history` VALUES ('22', '4', '11', '2023-05-26 21:31:29', null, '2', '用户2', '红茶');
INSERT INTO `bs_history` VALUES ('23', '4', '11', '2023-05-26 21:37:47', null, '2', '用户2', '红茶');
INSERT INTO `bs_history` VALUES ('24', '4', '11', '2023-05-26 22:12:36', null, '2', '用户2', '红茶');
INSERT INTO `bs_history` VALUES ('25', '13', '14', '2025-04-19 19:38:46', null, '40', '用户11', '大米');
INSERT INTO `bs_history` VALUES ('26', '13', '14', '2025-04-19 19:39:29', null, '40', '用户11', '大米');
INSERT INTO `bs_history` VALUES ('27', '13', '14', '2025-04-19 19:44:19', null, '40', '用户11', '大米');

-- ----------------------------
-- Table structure for `bs_return_data`
-- ----------------------------
DROP TABLE IF EXISTS `bs_return_data`;
CREATE TABLE `bs_return_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_data` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_return_data
-- ----------------------------
INSERT INTO `bs_return_data` VALUES ('1', '8', '1');

-- ----------------------------
-- Table structure for `bs_rfid`
-- ----------------------------
DROP TABLE IF EXISTS `bs_rfid`;
CREATE TABLE `bs_rfid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid_id` varchar(20000) DEFAULT NULL,
  `rfid_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_rfid
-- ----------------------------
INSERT INTO `bs_rfid` VALUES ('1', 'B76DD904;;', '1');

-- ----------------------------
-- Table structure for `bs_st_data`
-- ----------------------------
DROP TABLE IF EXISTS `bs_st_data`;
CREATE TABLE `bs_st_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `st_data` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_st_data
-- ----------------------------
INSERT INTO `bs_st_data` VALUES ('1', '3', '1');

-- ----------------------------
-- Table structure for `bs_token`
-- ----------------------------
DROP TABLE IF EXISTS `bs_token`;
CREATE TABLE `bs_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_token
-- ----------------------------
INSERT INTO `bs_token` VALUES ('1', '1', '32c74581-f177-45ed-98c7-b7d33739a95e');
INSERT INTO `bs_token` VALUES ('2', '2', '4c5b7b8b-5a3d-49ff-ae7e-8202fe075728');
INSERT INTO `bs_token` VALUES ('3', '3', 'cd3648df-30be-4f1d-ad63-10d44de27e9d');
INSERT INTO `bs_token` VALUES ('4', '4', '6afe031d-0082-4529-936d-2e4f394fa521');
INSERT INTO `bs_token` VALUES ('5', '5', 'bb3baf71-c1d6-48e9-a8b5-e3e7d4e2fecb');
INSERT INTO `bs_token` VALUES ('6', '6', 'fd1d780b-bb37-4de4-b7f0-9238b1b2a388');
INSERT INTO `bs_token` VALUES ('7', '7', '132dad49-a2d9-496a-bb24-84f13a6e1dbf');
INSERT INTO `bs_token` VALUES ('8', '8', 'a31241ad-0d14-445a-9319-7fc9de02836b');
INSERT INTO `bs_token` VALUES ('9', '9', 'a6a86667-df36-4f8d-9099-b38ff09f3762');
INSERT INTO `bs_token` VALUES ('10', '10', 'd789577a-8c1a-467b-9fc1-6c81431f1640');
INSERT INTO `bs_token` VALUES ('11', '11', '84e80bf0-0474-40ae-8e02-686490b9df39');
INSERT INTO `bs_token` VALUES ('12', '12', 'ffaa0149-88fc-49b6-92c3-5a85c717bdde');
INSERT INTO `bs_token` VALUES ('13', '13', 'e72e7769-d478-4a3d-bec1-ef6d42727589');
INSERT INTO `bs_token` VALUES ('14', '14', '747cc2af-2b0e-4825-824b-fcb6156e0bd8');
INSERT INTO `bs_token` VALUES ('15', '14', 'af10605d-b3d1-4de8-ada8-42082d1f03c2');
INSERT INTO `bs_token` VALUES ('16', '15', '01ce2fdc-11f1-4785-87a1-43ffa22975e3');
INSERT INTO `bs_token` VALUES ('17', '16', '4cc7d0a4-23ab-4b4d-afd6-bb199d661d26');
INSERT INTO `bs_token` VALUES ('18', '17', 'e2c578c9-c579-42cc-992f-57a5f1aff808');
INSERT INTO `bs_token` VALUES ('19', '18', 'e7bc3fbb-02df-45fd-b9cc-4c6202a187b8');
INSERT INTO `bs_token` VALUES ('20', '19', '7d23de2d-e0d6-4025-8ed5-0ec74aa534ae');
INSERT INTO `bs_token` VALUES ('21', '20', '882c5e71-3060-465d-a66d-86c84116692d');
INSERT INTO `bs_token` VALUES ('22', '21', '351b71bb-0749-4a38-a895-1320fd60364a');
INSERT INTO `bs_token` VALUES ('23', '22', '1c3f62bd-4569-47cf-a50a-98d3709de55e');
INSERT INTO `bs_token` VALUES ('24', '23', '5111e07d-4beb-40a1-9048-ca6aca33c628');
INSERT INTO `bs_token` VALUES ('25', '24', '8cf7ddc3-ce88-49a0-be59-88170936b8df');
INSERT INTO `bs_token` VALUES ('26', '25', '819a0938-f0ca-4770-84eb-bc88c39d9ba6');
INSERT INTO `bs_token` VALUES ('27', '26', 'ece8dc05-2f1a-4005-b463-e95bbc56842c');
INSERT INTO `bs_token` VALUES ('28', '27', 'a8b2b405-df09-48ab-913a-dc3224ad92a4');

-- ----------------------------
-- Table structure for `bs_user`
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `uphone` varchar(255) DEFAULT NULL,
  `uage` varchar(255) DEFAULT NULL,
  `rfid` varchar(255) DEFAULT NULL,
  `ubalance` double DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', 'admin', 'admin', '18888888888', '20', '0', '0', '0');
INSERT INTO `bs_user` VALUES ('2', '用户1', '0', '13175842568', '18', '40 0F 0B 82 01 EC', '255', '1');
INSERT INTO `bs_user` VALUES ('4', '用户2', '0', '13173381155', '28', '40 0F 0B 87 CD EC', '494', '1');
INSERT INTO `bs_user` VALUES ('5', '用户3', '0', '13175555555', '24', 'yh2', '0', '1');
INSERT INTO `bs_user` VALUES ('6', '用户4', '0', '17214587415', '18', 'yh4', '0', '1');
INSERT INTO `bs_user` VALUES ('7', '用户5', '0', '13514751256', '21', 'yh5', '0', '1');
INSERT INTO `bs_user` VALUES ('8', '用户6', '0', '13147521254', '18', 'yh6', '0', '1');
INSERT INTO `bs_user` VALUES ('9', '用户7', '0', '13145526475', '14', 'yh7', '0', '1');
INSERT INTO `bs_user` VALUES ('10', '用户8', '0', '17145698745', '21', 'yh8', '0', '1');
INSERT INTO `bs_user` VALUES ('11', '用户9', '0', '13147512647', '25', 'yh9', '0', '1');
INSERT INTO `bs_user` VALUES ('12', '用户10', '0', '13174587452', '32', 'yh10', '0', '1');
INSERT INTO `bs_user` VALUES ('13', '用户11', '0', '13171125486', '22', '8BCEF503', '80', '1');

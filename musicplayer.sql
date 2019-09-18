/*
Navicat MySQL Data Transfer

Source Server         : wfsql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : musicplayer

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-05-09 12:31:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `username` int(11) NOT NULL,
  `music_url` varchar(255) NOT NULL,
  `singer_img` varchar(255) NOT NULL,
  `time` varchar(10) NOT NULL,
  `singer_name` varchar(255) NOT NULL,
  `music_name` varchar(255) NOT NULL,
  `zhuanji_name` varchar(255) NOT NULL,
  PRIMARY KEY (`music_url`),
  KEY `username` (`username`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('10000018', 'music.yy?method=hotPlay&id=190352', 'https://p1.music.126.net/5HgfyC4-6rfZZyN7Z8RMqQ==/109951163449879350.jpg', '303334', '郑智化', '星星点灯', '星星点灯');

-- ----------------------------
-- Table structure for comment_music
-- ----------------------------
DROP TABLE IF EXISTS `comment_music`;
CREATE TABLE `comment_music` (
  `comment_date` datetime NOT NULL,
  `comment_data` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `music_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_data`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_music
-- ----------------------------

-- ----------------------------
-- Table structure for comment_singer
-- ----------------------------
DROP TABLE IF EXISTS `comment_singer`;
CREATE TABLE `comment_singer` (
  `comment_date` datetime NOT NULL,
  `comment_data` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `singer_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_data`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_singer
-- ----------------------------

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info` (
  `username` int(20) NOT NULL,
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) NOT NULL DEFAULT '默认',
  PRIMARY KEY (`group_id`,`username`),
  KEY `username` (`username`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_info_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_info
-- ----------------------------

-- ----------------------------
-- Table structure for group_music
-- ----------------------------
DROP TABLE IF EXISTS `group_music`;
CREATE TABLE `group_music` (
  `group_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`music_id`),
  KEY `group_id` (`group_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `group_music_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`),
  CONSTRAINT `group_music_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `music_info` (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_music
-- ----------------------------

-- ----------------------------
-- Table structure for lunbo
-- ----------------------------
DROP TABLE IF EXISTS `lunbo`;
CREATE TABLE `lunbo` (
  `pic` varchar(255) NOT NULL,
  `isworking` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbo
-- ----------------------------
INSERT INTO `lunbo` VALUES ('1543220245098.jpg', 'yes');
INSERT INTO `lunbo` VALUES ('1543393992863.jpg', 'yes');
INSERT INTO `lunbo` VALUES ('1543399668284.jpg', 'yes');

-- ----------------------------
-- Table structure for music_info
-- ----------------------------
DROP TABLE IF EXISTS `music_info`;
CREATE TABLE `music_info` (
  `singer_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_name` varchar(50) NOT NULL,
  `music_visits` int(11) NOT NULL DEFAULT '0',
  `music_lrc` varchar(255) NOT NULL,
  `music_isworking` enum('yes','no') NOT NULL DEFAULT 'yes',
  `music_usevip` enum('yes','no') NOT NULL DEFAULT 'no',
  `zhuanji_id` int(11) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `pinyin_head` varchar(255) NOT NULL,
  `pinyin_all` varchar(255) NOT NULL,
  PRIMARY KEY (`music_id`),
  KEY `singer_id` (`singer_id`),
  CONSTRAINT `music_info_ibfk_1` FOREIGN KEY (`singer_id`) REFERENCES `singer_info` (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_info
-- ----------------------------
INSERT INTO `music_info` VALUES ('1', '1', '赵雷--成都', '0', 'http://www.yymp3.com/Songword/26/267065.htm', 'yes', 'no', '232', '124', 'CD', 'CHENGDU');
INSERT INTO `music_info` VALUES ('3', '3', '成都小春--温暖四川', '0', 'http://www.yymp3.com/Songword/16/163166.htm', 'yes', 'no', '234', '251', 'WNSC', 'WENNUANSICHUAN');
INSERT INTO `music_info` VALUES ('3', '4', '成都小春--汶川，别哭', '0', 'http://www.yymp3.com/Songword/16/163165.htm', 'yes', 'no', '234', '188', 'WC，BK', 'WENCHUAN，BIEKU');
INSERT INTO `music_info` VALUES ('3', '5', '成都小春--撕毁承诺', '0', 'http://www.yymp3.com/Songword/16/163164.htm', 'yes', 'no', '234', '300', 'SHCN', 'SIHUICHENGNUO');
INSERT INTO `music_info` VALUES ('3', '6', '成都小春--我的眼泪骗了我自己', '0', 'http://www.yymp3.com/Songword/16/163163.htm', 'yes', 'no', '234', '205', 'WDYLPLWZJ', 'WODIYANLEIPIANLIAOWOZIJI');
INSERT INTO `music_info` VALUES ('3', '7', '成都小春--你嫁人了吗', '0', 'http://www.yymp3.com/Songword/16/163162.htm', 'yes', 'no', '234', '224', 'NJRLM', 'NIJIARENLIAOMA');
INSERT INTO `music_info` VALUES ('4', '14', '朱刚--北京', '0', 'http://www.yymp3.com/Songword/26/265560.htm', 'yes', 'no', '235', '266', 'BJ', 'BEIJING');
INSERT INTO `music_info` VALUES ('5', '15', '阿吉太--北京欢迎你', '0', 'http://www.yymp3.com/Songword/26/266575.htm', 'yes', 'no', '236', '235', 'BJHYN', 'BEIJINGHUANYINGNI');
INSERT INTO `music_info` VALUES ('6', '16', '邓紫棋--北京北京', '0', 'http://www.yymp3.com/Songword/26/266495.htm', 'yes', 'no', '237', '282', 'BJBJ', 'BEIJINGBEIJING');
INSERT INTO `music_info` VALUES ('7', '17', '廖芊芊--北京梦', '0', 'http://www.yymp3.com/Songword/26/265656.htm', 'yes', 'no', '238', '222', 'BJM', 'BEIJINGMENG');
INSERT INTO `music_info` VALUES ('8', '18', '汤潮--漂在北京', '0', 'http://www.yymp3.com/Songword/25/258845.htm', 'yes', 'no', '239', '271', 'PZBJ', 'PIAOZAIBEIJING');
INSERT INTO `music_info` VALUES ('1', '21', '赵雷--北京的冬天', '0', 'http://www.yymp3.com/Songword/26/263917.htm', 'yes', 'no', '232', '288', 'BJDDT', 'BEIJINGDIDONGTIAN');
INSERT INTO `music_info` VALUES ('12', '23', '孙梦楠--北京热', '0', 'http://www.yymp3.com/Songword/26/262254.htm', 'yes', 'no', '241', '221', 'BJR', 'BEIJINGRE');
INSERT INTO `music_info` VALUES ('13', '24', '乌兰图雅--站在草原望北京', '0', 'http://www.yymp3.com/Songword/26/261273.htm', 'yes', 'no', '242', '250', 'ZZCYWBJ', 'ZHANZAICAOYUANWANGBEIJING');
INSERT INTO `music_info` VALUES ('14', '25', '丁紫--在北京', '0', 'http://www.yymp3.com/Songword/26/261226.htm', 'yes', 'no', '243', '249', 'ZBJ', 'ZAIBEIJING');
INSERT INTO `music_info` VALUES ('15', '26', '海鸣威--一个人的北京', '0', 'http://www.yymp3.com/Songword/25/258099.htm', 'yes', 'no', '244', '206', 'YGRDBJ', 'YIGERENDIBEIJING');
INSERT INTO `music_info` VALUES ('16', '27', '张华--奥运CHINA北京', '0', 'http://www.yymp3.com/Songword/25/257847.htm', 'yes', 'no', '245', '270', 'AYCHINABJ', 'AOYUNCHINABEIJING');
INSERT INTO `music_info` VALUES ('17', '28', '王昱翔--重庆到北京的路有多远', '0', 'http://www.yymp3.com/Songword/25/256831.htm', 'yes', 'no', '246', '298', 'ZQDBJDLYDY', 'CHONGQINGDAOBEIJINGDILUYOUDUOYUAN');
INSERT INTO `music_info` VALUES ('18', '29', '我是歌手--北京北京 - 韩磊', '0', 'http://www.yymp3.com/Songword/25/256803.htm', 'yes', 'no', '0', '324', 'BJBJ ', 'BEIJINGBEIJING ');
INSERT INTO `music_info` VALUES ('19', '30', '曹轩宾--你不在北京（Piano Instrumental）', '0', 'http://www.yymp3.com/Songword/25/255919.htm', 'yes', 'no', '247', '290', 'NBZBJ（Piano Instrumental）', 'NIBUZAIBEIJING（Piano Instrumental）');
INSERT INTO `music_info` VALUES ('19', '31', '曹轩宾--你不在北京（钢琴版）', '0', 'http://www.yymp3.com/Songword/25/255918.htm', 'yes', 'no', '247', '299', 'NBZBJ（GQB）', 'NIBUZAIBEIJING（GANGQINBAN）');
INSERT INTO `music_info` VALUES ('20', '32', '辽东笑笑生--北京冷雨夜', '0', 'http://www.yymp3.com/Songword/25/253994.htm', 'yes', 'no', '0', '311', 'BJLYY', 'BEIJINGLENGYUYE');
INSERT INTO `music_info` VALUES ('21', '33', '张睿--北京以北', '0', 'http://www.yymp3.com/Songword/25/253753.htm', 'yes', 'no', '248', '273', 'BJYB', 'BEIJINGYIBEI');
INSERT INTO `music_info` VALUES ('19', '34', '曹轩宾--你不在北京', '0', 'http://www.yymp3.com/Songword/25/252510.htm', 'yes', 'no', '247', '283', 'NBZBJ', 'NIBUZAIBEIJING');
INSERT INTO `music_info` VALUES ('23', '35', '子枫--北京难混', '0', 'http://www.yymp3.com/Songword/25/252118.htm', 'yes', 'no', '249', '275', 'BJNH', 'BEIJINGNANHUN');
INSERT INTO `music_info` VALUES ('23', '36', '子枫--北京不好混', '0', 'http://www.yymp3.com/Songword/25/252099.htm', 'yes', 'no', '249', '275', 'BJBHH', 'BEIJINGBUHAOHUN');
INSERT INTO `music_info` VALUES ('25', '38', '唐涛--我爱北京天安门', '0', 'http://www.yymp3.com/Songword/24/248604.htm', 'yes', 'no', '250', '207', 'WABJTAM', 'WOAIBEIJINGTIANANMEN');
INSERT INTO `music_info` VALUES ('26', '39', '祁家琛--北京！ (feat. 斌爸爸)', '0', 'http://www.yymp3.com/Songword/24/246107.htm', 'yes', 'no', '251', '231', 'BJ！ (feat. BBB)', 'BEIJING！ (feat. BINBABA)');
INSERT INTO `music_info` VALUES ('28', '41', '范宏伟--老男人的爱', '0', 'http://www.yymp3.com/Songword/25/257164.htm', 'yes', 'no', '252', '238', 'LNRDA', 'LAONANRENDIAI');
INSERT INTO `music_info` VALUES ('31', '44', '筷子兄弟--老男孩', '0', 'http://www.yymp3.com/Songword/21/214578.htm', 'yes', 'no', '253', '300', 'LNH', 'LAONANHAI');
INSERT INTO `music_info` VALUES ('32', '45', '明圣凯--老男孩', '0', 'http://www.yymp3.com/Songword/21/213059.htm', 'yes', 'no', '255', '304', 'LNH', 'LAONANHAI');
INSERT INTO `music_info` VALUES ('33', '46', '郑钧--Old Boy 老男孩', '0', 'http://www.yymp3.com/Songword/11/117173.htm', 'yes', 'no', '256', '299', 'Old Boy LNH', 'Old Boy LAONANHAI');
INSERT INTO `music_info` VALUES ('34', '47', '许嵩--今年勇', '0', 'http://www.yymp3.com/Songword/26/268242.htm', 'yes', 'no', '257', '204', 'JNY', 'JINNIANYONG');
INSERT INTO `music_info` VALUES ('34', '48', '许嵩--早睡身体好', '0', 'http://www.yymp3.com/Songword/26/266963.htm', 'yes', 'no', '257', '291', 'ZSSTH', 'ZAOSHUIJUANBENHAO');
INSERT INTO `music_info` VALUES ('34', '49', '许嵩--摆脱', '0', 'http://www.yymp3.com/Songword/26/266962.htm', 'yes', 'no', '257', '231', 'BT', 'BAITUO');
INSERT INTO `music_info` VALUES ('34', '50', '许嵩--燕归巢', '0', 'http://www.yymp3.com/Songword/26/266779.htm', 'yes', 'no', '257', '295', 'YGC', 'YANGUICHAO');
INSERT INTO `music_info` VALUES ('34', '51', '许嵩--平行宇宙', '0', 'http://www.yymp3.com/Songword/26/266960.htm', 'yes', 'no', '257', '221', 'PXYZ', 'PINGHANGYUZHOU');
INSERT INTO `music_info` VALUES ('34', '52', '许嵩--摄影艺术', '0', 'http://www.yymp3.com/Songword/26/266830.htm', 'yes', 'no', '257', '268', 'SYYS', 'SHEYINGYIZHU');
INSERT INTO `music_info` VALUES ('34', '53', '许嵩--幻胖', '0', 'http://www.yymp3.com/Songword/26/266958.htm', 'yes', 'no', '257', '242', 'HP', 'HUANPAN');
INSERT INTO `music_info` VALUES ('34', '55', '许嵩--雅俗共赏', '0', 'http://www.yymp3.com/Songword/26/266473.htm', 'yes', 'no', '257', '250', 'YSGS', 'YASUGONGSHANG');
INSERT INTO `music_info` VALUES ('34', '56', '许嵩--奇谈', '0', 'http://www.yymp3.com/Songword/26/266955.htm', 'yes', 'no', '257', '233', 'QT', 'JITAN');
INSERT INTO `music_info` VALUES ('34', '57', '许嵩--不语', '0', 'http://www.yymp3.com/Songword/26/266780.htm', 'yes', 'no', '257', '255', 'BY', 'BUYU');
INSERT INTO `music_info` VALUES ('34', '58', '许嵩--书香年华', '0', 'http://www.yymp3.com/Songword/26/266778.htm', 'yes', 'no', '258', '189', 'SXNH', 'SHUXIANGNIANHUA');
INSERT INTO `music_info` VALUES ('34', '59', '许嵩--有桃花', '0', 'http://www.yymp3.com/Songword/26/261630.htm', 'yes', 'no', '258', '243', 'YTH', 'YOUTAOHUA');
INSERT INTO `music_info` VALUES ('34', '60', '许嵩--梧桐灯', '0', 'http://www.yymp3.com/Songword/26/261629.htm', 'yes', 'no', '258', '278', 'WTD', 'WUTONGDENG');
INSERT INTO `music_info` VALUES ('34', '61', '许嵩--等到烟火清凉', '0', 'http://www.yymp3.com/Songword/26/261628.htm', 'yes', 'no', '258', '182', 'DDYHQL', 'DENGDAOYINHUOQINGLIANG');
INSERT INTO `music_info` VALUES ('34', '62', '许嵩--七夕', '0', 'http://www.yymp3.com/Songword/26/260915.htm', 'yes', 'no', '258', '235', 'QX', 'QIXI');
INSERT INTO `music_info` VALUES ('34', '63', '许嵩--弹指一挥间', '0', 'http://www.yymp3.com/Songword/26/261626.htm', 'yes', 'no', '258', '289', 'DZYHJ', 'TANZHIYIHUIJIAN');
INSERT INTO `music_info` VALUES ('34', '64', '许嵩--惊鸿一面', '0', 'http://www.yymp3.com/Songword/26/260743.htm', 'yes', 'no', '258', '259', 'JHYM', 'JINGHONGYIMIAN');
INSERT INTO `music_info` VALUES ('34', '65', '许嵩--隐隐约约', '0', 'http://www.yymp3.com/Songword/26/261624.htm', 'yes', 'no', '258', '204', 'YYYY', 'YINYINYAOYAO');
INSERT INTO `music_info` VALUES ('34', '66', '许嵩--宇宙之大', '0', 'http://www.yymp3.com/Songword/26/261623.htm', 'yes', 'no', '258', '274', 'YZZD', 'YUZHOUZHIDAI');
INSERT INTO `music_info` VALUES ('34', '67', '许嵩--山水之间', '0', 'http://www.yymp3.com/Songword/26/260239.htm', 'yes', 'no', '258', '278', 'SSZJ', 'SHANSHUIZHIJIAN');
INSERT INTO `music_info` VALUES ('34', '68', '许嵩--违章动物', '0', 'http://www.yymp3.com/Songword/25/250024.htm', 'yes', 'no', '259', '252', 'WZDW', 'WEIZHANGDONGWU');
INSERT INTO `music_info` VALUES ('34', '69', '许嵩--小烦恼没什么大不了', '0', 'http://www.yymp3.com/Songword/24/246394.htm', 'yes', 'no', '259', '214', 'XFNMSMDBL', 'XIAOFANNAOMOSHIMADAIBULIAO');
INSERT INTO `music_info` VALUES ('2', '70', '内地群星--认真的雪 - 薛之谦', '0', 'http://www.yymp3.com/Songword/11/117918.htm', 'yes', 'no', '233', '259', 'RZDX ', 'RENZHENDIXUE ');
INSERT INTO `music_info` VALUES ('35', '71', '薛之谦--高尚', '0', 'http://www.yymp3.com/Songword/26/268441.htm', 'yes', 'no', '260', '319', 'GS', 'GAOSHANG');
INSERT INTO `music_info` VALUES ('35', '72', '薛之谦--动物世界', '0', 'http://www.yymp3.com/Songword/26/268440.htm', 'yes', 'no', '260', '231', 'DWSJ', 'DONGWUSHIJIE');
INSERT INTO `music_info` VALUES ('35', '73', '薛之谦--暧昧', '0', 'http://www.yymp3.com/Songword/26/268439.htm', 'yes', 'no', '260', '312', 'AM', 'AIMEI');
INSERT INTO `music_info` VALUES ('35', '74', '薛之谦--我害怕', '0', 'http://www.yymp3.com/Songword/26/268438.htm', 'yes', 'no', '260', '249', 'WHP', 'WOHAIPA');
INSERT INTO `music_info` VALUES ('35', '75', '薛之谦--别', '0', 'http://www.yymp3.com/Songword/26/268437.htm', 'yes', 'no', '260', '216', 'B', 'BIE');
INSERT INTO `music_info` VALUES ('35', '76', '薛之谦--像风一样', '0', 'http://www.yymp3.com/Songword/26/268436.htm', 'yes', 'no', '260', '255', 'XFYY', 'XIANGFENGYIYANG');
INSERT INTO `music_info` VALUES ('35', '77', '薛之谦--渡', '0', 'http://www.yymp3.com/Songword/26/268435.htm', 'yes', 'no', '260', '213', 'D', 'DU');
INSERT INTO `music_info` VALUES ('35', '78', '薛之谦--骆驼', '0', 'http://www.yymp3.com/Songword/26/268434.htm', 'yes', 'no', '260', '277', 'LT', 'LUOTUO');
INSERT INTO `music_info` VALUES ('35', '79', '薛之谦--背过手', '0', 'http://www.yymp3.com/Songword/26/268433.htm', 'yes', 'no', '260', '266', 'BGS', 'BEIGUOSHOU');
INSERT INTO `music_info` VALUES ('35', '80', '薛之谦--狐狸', '0', 'http://www.yymp3.com/Songword/26/268432.htm', 'yes', 'no', '260', '235', 'HL', 'HULI');
INSERT INTO `music_info` VALUES ('35', '81', '薛之谦--下雨了', '0', 'http://www.yymp3.com/Songword/26/267100.htm', 'yes', 'no', '260', '305', 'XYL', 'XIAYULIAO');
INSERT INTO `music_info` VALUES ('35', '82', '薛之谦--花儿和少年', '0', 'http://www.yymp3.com/Songword/26/267099.htm', 'yes', 'no', '260', '263', 'HEHSN', 'HUARHESHAONIAN');
INSERT INTO `music_info` VALUES ('35', '83', '薛之谦--Stay Here', '0', 'http://www.yymp3.com/Songword/26/267098.htm', 'yes', 'no', '260', '302', 'Stay Here', 'Stay Here');
INSERT INTO `music_info` VALUES ('35', '84', '薛之谦--小孩', '0', 'http://www.yymp3.com/Songword/26/267097.htm', 'yes', 'no', '260', '322', 'XH', 'XIAOHAI');
INSERT INTO `music_info` VALUES ('35', '85', '薛之谦--一半', '0', 'http://www.yymp3.com/Songword/26/267096.htm', 'yes', 'no', '260', '286', 'YB', 'YIBAN');
INSERT INTO `music_info` VALUES ('35', '86', '薛之谦--绅士', '0', 'http://www.yymp3.com/Songword/26/267095.htm', 'yes', 'no', '260', '291', 'SS', 'SHENSHI');
INSERT INTO `music_info` VALUES ('35', '87', '薛之谦--演员', '0', 'http://www.yymp3.com/Songword/26/267094.htm', 'yes', 'no', '260', '283', 'YY', 'YANYUN');
INSERT INTO `music_info` VALUES ('35', '88', '薛之谦--我好像在哪见过你', '0', 'http://www.yymp3.com/Songword/26/267093.htm', 'yes', 'no', '260', '279', 'WHXZNJGN', 'WOHAOXIANGZAINEIXIANGUONI');
INSERT INTO `music_info` VALUES ('35', '89', '薛之谦--刚刚好', '0', 'http://www.yymp3.com/Songword/26/267092.htm', 'yes', 'no', '260', '251', 'GGH', 'GANGGANGHAO');
INSERT INTO `music_info` VALUES ('35', '90', '薛之谦--初学者', '0', 'http://www.yymp3.com/Songword/26/267091.htm', 'yes', 'no', '260', '280', 'CXZ', 'CHUXUEZHE');
INSERT INTO `music_info` VALUES ('35', '91', '薛之谦--方圆几里', '0', 'http://www.yymp3.com/Songword/25/252674.htm', 'yes', 'no', '260', '264', 'FYJL', 'FANGYUANJILI');
INSERT INTO `music_info` VALUES ('35', '92', '薛之谦--其实', '0', 'http://www.yymp3.com/Songword/25/252673.htm', 'yes', 'no', '260', '243', 'QS', 'JISHI');
INSERT INTO `music_info` VALUES ('35', '93', '薛之谦--我想起了你', '0', 'http://www.yymp3.com/Songword/25/252672.htm', 'yes', 'no', '260', '231', 'WXQLN', 'WOXIANGQILIAONI');
INSERT INTO `music_info` VALUES ('35', '94', '薛之谦--等我回家', '0', 'http://www.yymp3.com/Songword/25/252671.htm', 'yes', 'no', '260', '299', 'DWHJ', 'DENGWOHUIGU');
INSERT INTO `music_info` VALUES ('35', '95', '薛之谦--潮流季', '0', 'http://www.yymp3.com/Songword/25/252670.htm', 'yes', 'no', '260', '241', 'CLJ', 'CHAOLIUJI');
INSERT INTO `music_info` VALUES ('35', '96', '薛之谦--有没有', '0', 'http://www.yymp3.com/Songword/25/252669.htm', 'yes', 'no', '260', '252', 'YMY', 'YOUMOYOU');
INSERT INTO `music_info` VALUES ('35', '97', '薛之谦--你还要我怎样', '0', 'http://www.yymp3.com/Songword/25/252668.htm', 'yes', 'no', '260', '311', 'NHYWZY', 'NIHUANYAOWOZEYANG');
INSERT INTO `music_info` VALUES ('36', '98', '音乐专题--车票（旭日阳刚）', '0', 'http://www.yymp3.com/Songword/24/242723.htm', 'yes', 'no', '261', '222', 'CP（XRYG）', 'JUPIAO（XURIYANGGANG）');
INSERT INTO `music_info` VALUES ('38', '100', '旭日阳刚刘刚--祝她幸福', '0', 'http://www.yymp3.com/Songword/25/258144.htm', 'yes', 'no', '262', '258', 'ZTXF', 'ZHUTAXINGFU');
INSERT INTO `music_info` VALUES ('38', '101', '旭日阳刚刘刚--怀念青春', '0', 'http://www.yymp3.com/Songword/25/258143.htm', 'yes', 'no', '262', '269', 'HNQC', 'HUAINIANQINGCHUN');
INSERT INTO `music_info` VALUES ('38', '102', '旭日阳刚刘刚--21楼', '0', 'http://www.yymp3.com/Songword/25/258142.htm', 'yes', 'no', '262', '274', '21L', '21LOU');
INSERT INTO `music_info` VALUES ('38', '103', '旭日阳刚刘刚--珍惜吧', '0', 'http://www.yymp3.com/Songword/25/251449.htm', 'yes', 'no', '262', '279', 'ZXB', 'ZHENXIBA');
INSERT INTO `music_info` VALUES ('38', '104', '旭日阳刚刘刚--这城市', '0', 'http://www.yymp3.com/Songword/25/251448.htm', 'yes', 'no', '262', '257', 'ZCS', 'ZHECHENGSHI');
INSERT INTO `music_info` VALUES ('38', '105', '旭日阳刚刘刚--还记得吗', '0', 'http://www.yymp3.com/Songword/25/251447.htm', 'yes', 'no', '262', '221', 'HJDM', 'HUANJIDEMA');
INSERT INTO `music_info` VALUES ('39', '106', '旭日阳刚--冬季', '0', 'http://www.yymp3.com/Songword/24/241496.htm', 'yes', 'no', '263', '312', 'DJ', 'DONGJI');
INSERT INTO `music_info` VALUES ('39', '107', '旭日阳刚--麻雀', '0', 'http://www.yymp3.com/Songword/24/241495.htm', 'yes', 'no', '263', '289', 'MQ', 'MAQIAO');
INSERT INTO `music_info` VALUES ('39', '108', '旭日阳刚--那么光荣', '0', 'http://www.yymp3.com/Songword/24/241494.htm', 'yes', 'no', '263', '248', 'NMGR', 'NAMAGUANGRONG');
INSERT INTO `music_info` VALUES ('39', '109', '旭日阳刚--等待春天', '0', 'http://www.yymp3.com/Songword/24/241493.htm', 'yes', 'no', '263', '265', 'DDCT', 'DENGDAICHUNTIAN');
INSERT INTO `music_info` VALUES ('39', '110', '旭日阳刚--兄弟', '0', 'http://www.yymp3.com/Songword/24/241492.htm', 'yes', 'no', '263', '260', 'XD', 'XIONGDI');
INSERT INTO `music_info` VALUES ('39', '111', '旭日阳刚--车票', '0', 'http://www.yymp3.com/Songword/24/241491.htm', 'yes', 'no', '263', '222', 'CP', 'JUPIAO');
INSERT INTO `music_info` VALUES ('39', '112', '旭日阳刚--无法忘记的', '0', 'http://www.yymp3.com/Songword/24/241490.htm', 'yes', 'no', '263', '236', 'WFWJD', 'MOFAWANGJIDI');
INSERT INTO `music_info` VALUES ('39', '113', '旭日阳刚--高飞', '0', 'http://www.yymp3.com/Songword/24/241489.htm', 'yes', 'no', '263', '318', 'GF', 'GAOFEI');
INSERT INTO `music_info` VALUES ('39', '114', '旭日阳刚--飘叶', '0', 'http://www.yymp3.com/Songword/24/241488.htm', 'yes', 'no', '263', '306', 'PY', 'PIAOXIE');
INSERT INTO `music_info` VALUES ('39', '116', '旭日阳刚--路', '0', 'http://www.yymp3.com/Songword/24/241486.htm', 'yes', 'no', '263', '306', 'L', 'LU');
INSERT INTO `music_info` VALUES ('39', '117', '旭日阳刚--坚强的信仰', '0', 'http://www.yymp3.com/Songword/24/241485.htm', 'yes', 'no', '264', '247', 'JQDXY', 'JIANQIANGDISHENYANG');
INSERT INTO `music_info` VALUES ('39', '125', '旭日阳刚--春天里', '0', 'http://www.yymp3.com/Songword/21/213537.htm', 'yes', 'no', '264', null, 'CTL', 'CHUNTIANLI');
INSERT INTO `music_info` VALUES ('40', '126', '张杰--龙鳞', '0', 'http://www.yymp3.com/Songword/18/184350.htm', 'yes', 'no', '265', '342', 'LL', 'LONGLIN');
INSERT INTO `music_info` VALUES ('40', '127', '张杰--量身订做', '0', 'http://www.yymp3.com/Songword/18/184348.htm', 'yes', 'no', '265', '251', 'LSDZ', 'LIANGJUANDINGZUO');
INSERT INTO `music_info` VALUES ('40', '128', '张杰--一念之间', '0', 'http://www.yymp3.com/Songword/26/267905.htm', 'yes', 'no', '265', '299', 'YNZJ', 'YINIANZHIJIAN');
INSERT INTO `music_info` VALUES ('40', '129', '张杰--娑婆世界', '0', 'http://www.yymp3.com/Songword/26/267904.htm', 'yes', 'no', '265', '292', 'SPSJ', 'SUOPOSHIJIE');
INSERT INTO `music_info` VALUES ('40', '130', '张杰--Lost in the Stars', '0', 'http://www.yymp3.com/Songword/26/267903.htm', 'yes', 'no', '265', '229', 'Lost in the Stars', 'Lost in the Stars');
INSERT INTO `music_info` VALUES ('40', '131', '张杰--Give You My World', '0', 'http://www.yymp3.com/Songword/26/267902.htm', 'yes', 'no', '265', '211', 'Give You My World', 'Give You My World');
INSERT INTO `music_info` VALUES ('40', '132', '张杰--她不爱我', '0', 'http://www.yymp3.com/Songword/23/239074.htm', 'yes', 'no', '265', '212', 'TBAW', 'TABUAIWO');
INSERT INTO `music_info` VALUES ('40', '133', '张杰--就算全世界与我为敌', '0', 'http://www.yymp3.com/Songword/23/239073.htm', 'yes', 'no', '265', '265', 'JSQSJYWWD', 'JIUSUANQUANSHIJIEYUWOWEIDI');
INSERT INTO `music_info` VALUES ('40', '135', '张杰--街角的祝福', '0', 'http://www.yymp3.com/Songword/23/239071.htm', 'yes', 'no', '265', '230', 'JJDZF', 'JIEJUEDIZHUFU');
INSERT INTO `music_info` VALUES ('40', '136', '张杰--伤痕', '0', 'http://www.yymp3.com/Songword/23/239070.htm', 'yes', 'no', '265', '297', 'SH', 'SHANGHEN');
INSERT INTO `music_info` VALUES ('40', '137', '张杰--夜盲症', '0', 'http://www.yymp3.com/Songword/23/239069.htm', 'yes', 'no', '266', '273', 'YMZ', 'YEMANGZHENG');
INSERT INTO `music_info` VALUES ('40', '138', '张杰--突然想爱你', '0', 'http://www.yymp3.com/Songword/23/239068.htm', 'yes', 'no', '266', '238', 'TRXAN', 'TURANXIANGAINI');
INSERT INTO `music_info` VALUES ('40', '139', '张杰--领悟', '0', 'http://www.yymp3.com/Songword/23/239067.htm', 'yes', 'no', '266', '318', 'LW', 'LINGWU');
INSERT INTO `music_info` VALUES ('40', '140', '张杰--天空', '0', 'http://www.yymp3.com/Songword/23/239066.htm', 'yes', 'no', '266', '293', 'TK', 'TIANKONG');
INSERT INTO `music_info` VALUES ('40', '141', '张杰--原来你什么都不要', '0', 'http://www.yymp3.com/Songword/23/238336.htm', 'yes', 'no', '266', '262', 'YLNSMDBY', 'YUANLAINISHIMADUBUYAO');
INSERT INTO `music_info` VALUES ('40', '142', '张杰--北斗星的爱', '0', 'http://www.yymp3.com/Songword/23/237095.htm', 'yes', 'no', '266', '289', 'BDXDA', 'BEIDOUXINGDIAI');
INSERT INTO `music_info` VALUES ('40', '143', '张杰--我们的歌', '0', 'http://www.yymp3.com/Songword/23/237094.htm', 'yes', 'no', '266', '254', 'WMDG', 'WOMENDIGE');
INSERT INTO `music_info` VALUES ('40', '144', '张杰--一切都值得', '0', 'http://www.yymp3.com/Songword/23/237093.htm', 'yes', 'no', '266', '277', 'YQDZD', 'YIQIEDUZHIDE');
INSERT INTO `music_info` VALUES ('40', '145', '张杰--最美的太阳', '0', 'http://www.yymp3.com/Songword/23/237092.htm', 'yes', 'no', '266', '256', 'ZMDTY', 'ZUIMEIDITAIYANG');
INSERT INTO `music_info` VALUES ('40', '146', '张杰--你和我', '0', 'http://www.yymp3.com/Songword/23/237091.htm', 'yes', 'no', '266', '237', 'NHW', 'NIHEWO');
INSERT INTO `music_info` VALUES ('40', '147', '张杰--流言有一千分贝', '0', 'http://www.yymp3.com/Songword/23/237090.htm', 'yes', 'no', '267', '240', 'LYYYQFB', 'LIUYANYOUYIQIANFENBEI');
INSERT INTO `music_info` VALUES ('40', '148', '张杰--天下', '0', 'http://www.yymp3.com/Songword/23/237089.htm', 'yes', 'no', '267', '219', 'TX', 'TIANXIA');
INSERT INTO `music_info` VALUES ('40', '149', '张杰--再爱我一回', '0', 'http://www.yymp3.com/Songword/23/237088.htm', 'yes', 'no', '267', '280', 'ZAWYH', 'ZAIAIWOYIHUI');
INSERT INTO `music_info` VALUES ('40', '150', '张杰--何必在一起', '0', 'http://www.yymp3.com/Songword/23/237087.htm', 'yes', 'no', '267', '275', 'HBZYQ', 'HEBIZAIYIQI');
INSERT INTO `music_info` VALUES ('40', '151', '张杰--风', '0', 'http://www.yymp3.com/Songword/23/237086.htm', 'yes', 'no', '267', '354', 'F', 'FENG');
INSERT INTO `music_info` VALUES ('40', '152', '张杰--我们都一样', '0', 'http://www.yymp3.com/Songword/23/237085.htm', 'yes', 'no', '267', '303', 'WMDYY', 'WOMENDUYIYANG');
INSERT INTO `music_info` VALUES ('40', '153', '张杰--逆战', '0', 'http://www.yymp3.com/Songword/23/237084.htm', 'yes', 'no', '267', '231', 'NZ', 'NIZHAN');
INSERT INTO `music_info` VALUES ('40', '154', '张杰--这，就是爱', '0', 'http://www.yymp3.com/Songword/23/237083.htm', 'yes', 'no', '267', '293', 'Z，JSA', 'ZHE，JIUSHIAI');
INSERT INTO `music_info` VALUES ('41', '156', '金志文--远走高飞 - 金志文 徐佳莹', '0', 'http://www.yymp3.com/Songword/26/268384.htm', 'yes', 'no', '268', '235', 'YZGF ', 'YUANZOUGAOFEI ');
INSERT INTO `music_info` VALUES ('42', '157', '李玉刚--李', '0', 'http://www.yymp3.com/Songword/26/266980.htm', 'yes', 'no', '269', '215', 'L', 'LI');
INSERT INTO `music_info` VALUES ('43', '158', '谎言留声机--分手夜 (Feat.徐佳莹)', '0', 'http://www.yymp3.com/Songword/24/240731.htm', 'yes', 'no', '272', '278', 'FSY (Feat.XJY)', 'FENSHOUYE (Feat.XUJIAYING)');
INSERT INTO `music_info` VALUES ('44', '159', '逆光飞翔--调色盘 - 徐佳莹', '0', 'http://www.yymp3.com/Songword/23/239025.htm', 'yes', 'no', '273', '239', 'DSP ', 'TIAOSHAIPAN ');
INSERT INTO `music_info` VALUES ('42', '160', '李玉刚--国色天香 - 李玉刚 孔东东', '0', 'http://www.yymp3.com/Songword/26/266982.htm', 'yes', 'no', '269', '189', 'GSTX ', 'GUOSHAITIANXIANG ');
INSERT INTO `music_info` VALUES ('46', '162', '超级星光--徐佳莹 - 出口', '0', 'http://www.yymp3.com/Songword/14/141541.htm', 'yes', 'no', '274', '91', 'XJY ', 'XUJIAYING ');
INSERT INTO `music_info` VALUES ('47', '163', '徐佳莹--是日救星', '0', 'http://www.yymp3.com/Songword/26/268426.htm', 'yes', 'no', '275', '247', 'SRJX', 'SHIRIJIUXING');
INSERT INTO `music_info` VALUES ('10', '167', '群星合辑--新贵妃醉酒 - 李玉刚', '0', 'http://www.yymp3.com/Songword/16/162921.htm', 'yes', 'no', '240', '296', 'XGFZJ ', 'XINGUIFEIZUIJIU ');
INSERT INTO `music_info` VALUES ('47', '168', '徐佳莹--心里学', '0', 'http://www.yymp3.com/Songword/26/268425.htm', 'yes', 'no', '275', '302', 'XLX', 'XINLIXUE');
INSERT INTO `music_info` VALUES ('42', '169', '李玉刚--梨花颂', '0', 'http://www.yymp3.com/Songword/26/268457.htm', 'yes', 'no', '269', '226', 'LHS', 'LIHUASONG');
INSERT INTO `music_info` VALUES ('47', '170', '徐佳莹--人啊', '0', 'http://www.yymp3.com/Songword/26/268424.htm', 'yes', 'no', '275', '219', 'RA', 'RENA');
INSERT INTO `music_info` VALUES ('42', '171', '李玉刚--逐梦令', '0', 'http://www.yymp3.com/Songword/26/268456.htm', 'yes', 'no', '269', '246', 'ZML', 'ZHUMENGLING');
INSERT INTO `music_info` VALUES ('47', '172', '徐佳莹--儿歌', '0', 'http://www.yymp3.com/Songword/26/268423.htm', 'yes', 'no', '275', '211', 'EG', 'RGE');
INSERT INTO `music_info` VALUES ('47', '173', '徐佳莹--大头仔', '0', 'http://www.yymp3.com/Songword/26/268422.htm', 'yes', 'no', '275', '224', 'DTZ', 'DAITOUZAI');
INSERT INTO `music_info` VALUES ('42', '174', '李玉刚--雨花石', '0', 'http://www.yymp3.com/Songword/26/268455.htm', 'yes', 'no', '269', '342', 'YHS', 'YUHUADAN');
INSERT INTO `music_info` VALUES ('42', '175', '李玉刚--清明上河图', '0', 'http://www.yymp3.com/Songword/26/268454.htm', 'yes', 'no', '269', '308', 'QMSHT', 'QINGMINGSHANGHETU');
INSERT INTO `music_info` VALUES ('47', '176', '徐佳莹--现在不跳舞要干嘛', '0', 'http://www.yymp3.com/Songword/26/268421.htm', 'yes', 'no', '275', '217', 'XZBTWYGM', 'XIANZAIBUTIAOWUYAOGANMA');
INSERT INTO `music_info` VALUES ('47', '177', '徐佳莹--病人', '0', 'http://www.yymp3.com/Songword/26/268420.htm', 'yes', 'no', '275', '224', 'BR', 'BINGREN');
INSERT INTO `music_info` VALUES ('42', '178', '李玉刚--刚好遇见你', '0', 'http://www.yymp3.com/Songword/26/268453.htm', 'yes', 'no', '269', '200', 'GHYJN', 'GANGHAOYUXIANNI');
INSERT INTO `music_info` VALUES ('42', '179', '李玉刚--新贵妃醉酒', '0', 'http://www.yymp3.com/Songword/26/268452.htm', 'yes', 'no', '269', '272', 'XGFZJ', 'XINGUIFEIZUIJIU');
INSERT INTO `music_info` VALUES ('47', '180', '徐佳莹--记得带走', '0', 'http://www.yymp3.com/Songword/26/268419.htm', 'yes', 'no', '275', '266', 'JDDZ', 'JIDEDAIZOU');
INSERT INTO `music_info` VALUES ('42', '181', '李玉刚--送别', '0', 'http://www.yymp3.com/Songword/26/268451.htm', 'yes', 'no', '269', '220', 'SB', 'SONGBIE');
INSERT INTO `music_info` VALUES ('42', '182', '李玉刚--长安故事', '0', 'http://www.yymp3.com/Songword/26/268450.htm', 'yes', 'no', '269', '270', 'ZAGS', 'CHANGANGUSHI');
INSERT INTO `music_info` VALUES ('47', '183', '徐佳莹--到此为止', '0', 'http://www.yymp3.com/Songword/26/268418.htm', 'yes', 'no', '275', '220', 'DCWZ', 'DAOCIWEIZHI');
INSERT INTO `music_info` VALUES ('47', '184', '徐佳莹--灰色', '0', 'http://www.yymp3.com/Songword/26/268417.htm', 'yes', 'no', '275', '323', 'HS', 'HUISHAI');
INSERT INTO `music_info` VALUES ('42', '185', '李玉刚--公主岭', '0', 'http://www.yymp3.com/Songword/26/268448.htm', 'yes', 'no', '270', '273', 'GZL', 'GONGZHULING');
INSERT INTO `music_info` VALUES ('47', '186', '徐佳莹--言不由衷', '0', 'http://www.yymp3.com/Songword/26/268416.htm', 'yes', 'no', '276', '259', 'YBYZ', 'YANBUYOUZHONG');
INSERT INTO `music_info` VALUES ('47', '187', '徐佳莹--格斗场', '0', 'http://www.yymp3.com/Songword/26/267727.htm', 'yes', 'no', '276', '299', 'GDC', 'GEDOUCHANG');
INSERT INTO `music_info` VALUES ('48', '188', '大壮--差一步', '0', 'http://www.yymp3.com/Songword/26/268412.htm', 'yes', 'no', '278', '246', 'CYB', 'CHAYIBU');
INSERT INTO `music_info` VALUES ('42', '189', '李玉刚--菊花台', '0', 'http://www.yymp3.com/Songword/26/266996.htm', 'yes', 'no', '270', '314', 'JHT', 'JUHUATAI');
INSERT INTO `music_info` VALUES ('47', '190', '徐佳莹--湫兮如风', '0', 'http://www.yymp3.com/Songword/26/267726.htm', 'yes', 'no', '276', '292', 'QXRF', 'JIAXIRUFENG');
INSERT INTO `music_info` VALUES ('48', '191', '大壮--我们不一样', '0', 'http://www.yymp3.com/Songword/26/268411.htm', 'yes', 'no', '278', '271', 'WMBYY', 'WOMENBUYIYANG');
INSERT INTO `music_info` VALUES ('42', '192', '李玉刚--好人好梦', '0', 'http://www.yymp3.com/Songword/26/266995.htm', 'yes', 'no', '270', '231', 'HRHM', 'HAORENHAOMENG');
INSERT INTO `music_info` VALUES ('47', '193', '徐佳莹--不要再孤单', '0', 'http://www.yymp3.com/Songword/26/267725.htm', 'yes', 'no', '276', '223', 'BYZGD', 'BUYAOZAIGUCHAN');
INSERT INTO `music_info` VALUES ('42', '194', '李玉刚--最重是情义', '0', 'http://www.yymp3.com/Songword/26/266994.htm', 'yes', 'no', '270', '162', 'ZZSQY', 'ZUICHONGSHIQINGYI');
INSERT INTO `music_info` VALUES ('42', '195', '李玉刚--昭君出塞', '0', 'http://www.yymp3.com/Songword/26/266993.htm', 'yes', 'no', '270', '292', 'ZJCS', 'ZHAOJUNCHUSE');
INSERT INTO `music_info` VALUES ('47', '196', '徐佳莹--当我找到了你', '0', 'http://www.yymp3.com/Songword/26/267724.htm', 'yes', 'no', '276', '235', 'DWZDLN', 'DANGWOZHAODAOLIAONI');
INSERT INTO `music_info` VALUES ('42', '197', '李玉刚--葬心', '0', 'http://www.yymp3.com/Songword/26/266992.htm', 'yes', 'no', '270', '336', 'ZX', 'ZANGXIN');
INSERT INTO `music_info` VALUES ('47', '198', '徐佳莹--心动', '0', 'http://www.yymp3.com/Songword/26/266776.htm', 'yes', 'no', '276', '213', 'XD', 'XINDONG');
INSERT INTO `music_info` VALUES ('47', '199', '徐佳莹--小公主', '0', 'http://www.yymp3.com/Songword/26/266775.htm', 'yes', 'no', '276', '220', 'XGZ', 'XIAOGONGZHU');
INSERT INTO `music_info` VALUES ('42', '200', '李玉刚--葬花吟咏', '0', 'http://www.yymp3.com/Songword/26/266991.htm', 'yes', 'no', '270', '247', 'ZHYY', 'ZANGHUAYINYONG');
INSERT INTO `music_info` VALUES ('47', '201', '徐佳莹--大雨将至', '0', 'http://www.yymp3.com/Songword/26/266774.htm', 'yes', 'no', '276', '232', 'DYJZ', 'DAIYUJIANGZHI');
INSERT INTO `music_info` VALUES ('42', '202', '李玉刚--游园惊梦', '0', 'http://www.yymp3.com/Songword/26/266990.htm', 'yes', 'no', '270', '295', 'YYJM', 'YOUYUANJINGMENG');
INSERT INTO `music_info` VALUES ('47', '203', '徐佳莹--女人花', '0', 'http://www.yymp3.com/Songword/26/266773.htm', 'yes', 'no', '276', '268', 'NRH', 'RURENHUA');
INSERT INTO `music_info` VALUES ('42', '204', '李玉刚--斯卡布罗集市', '0', 'http://www.yymp3.com/Songword/26/266989.htm', 'yes', 'no', '270', '238', 'SKBLJS', 'SIQIABULUOJISHI');
INSERT INTO `music_info` VALUES ('47', '205', '徐佳莹--潇洒走一回', '0', 'http://www.yymp3.com/Songword/26/266772.htm', 'yes', 'no', '276', '261', 'XSZYH', 'XIAOSAZOUYIHUI');
INSERT INTO `music_info` VALUES ('47', '206', '徐佳莹--我所需要的', '0', 'http://www.yymp3.com/Songword/26/266771.htm', 'yes', 'no', '277', '251', 'WSXYD', 'WOSUOXUYAODI');
INSERT INTO `music_info` VALUES ('42', '207', '李玉刚--盛世霓裳', '0', 'http://www.yymp3.com/Songword/26/266988.htm', 'yes', 'no', '270', '297', 'SSNS', 'CHENGSHINICHANG');
INSERT INTO `music_info` VALUES ('47', '208', '徐佳莹--遗忘之前', '0', 'http://www.yymp3.com/Songword/26/266216.htm', 'yes', 'no', '277', '243', 'YWZQ', 'WEIWANGZHIQIAN');
INSERT INTO `music_info` VALUES ('47', '209', '徐佳莹--只剩一分钟', '0', 'http://www.yymp3.com/Songword/25/259511.htm', 'yes', 'no', '277', '300', 'ZSYFZ', 'ZHISHENGYIFENZHONG');
INSERT INTO `music_info` VALUES ('42', '210', '李玉刚--绒花', '0', 'http://www.yymp3.com/Songword/26/266987.htm', 'yes', 'no', '271', '223', 'RH', 'RONGHUA');
INSERT INTO `music_info` VALUES ('42', '211', '李玉刚--女儿情', '0', 'http://www.yymp3.com/Songword/26/266986.htm', 'yes', 'no', '271', '276', 'NEQ', 'RURQING');
INSERT INTO `music_info` VALUES ('47', '212', '徐佳莹--别怕', '0', 'http://www.yymp3.com/Songword/25/259510.htm', 'yes', 'no', '277', '208', 'BP', 'BIEPA');
INSERT INTO `music_info` VALUES ('42', '213', '李玉刚--你怎么说', '0', 'http://www.yymp3.com/Songword/26/266985.htm', 'yes', 'no', '271', '202', 'NZMS', 'NIZEMASHUI');
INSERT INTO `music_info` VALUES ('47', '214', '徐佳莹--耳边风', '0', 'http://www.yymp3.com/Songword/25/259509.htm', 'yes', 'no', '277', '222', 'EBF', 'ERBIANFENG');
INSERT INTO `music_info` VALUES ('42', '215', '李玉刚--霓裳衣舞', '0', 'http://www.yymp3.com/Songword/26/266984.htm', 'yes', 'no', '271', '351', 'NSYW', 'NICHANGYIWU');
INSERT INTO `music_info` VALUES ('50', '216', '小黑--痴情', '0', 'http://www.yymp3.com/Songword/11/117798.htm', 'yes', 'no', '279', '234', 'CQ', 'CHIQING');
INSERT INTO `music_info` VALUES ('51', '217', '后会无期--追梦（电影《后会无期》插曲）- 朱茵', '0', 'http://www.yymp3.com/Songword/26/260796.htm', 'yes', 'no', '280', '183', 'ZM（DY《HHWQ》CQ）', 'ZHUIMENG（DIANYING《HOUKUAIMOJI》CHAQU）');
INSERT INTO `music_info` VALUES ('52', '218', '吴宗宪--痴情', '0', 'http://www.yymp3.com/Songword/7/71831.htm', 'yes', 'no', '281', '258', 'CQ', 'CHIQING');
INSERT INTO `music_info` VALUES ('51', '219', '后会无期--旅行（电影《后会无期》插曲）- 许巍', '0', 'http://www.yymp3.com/Songword/26/260795.htm', 'yes', 'no', '280', '267', 'LX（DY《HHWQ》CQ）', 'LU:HANG（DIANYING《HOUKUAIMOJI》CHAQU）');
INSERT INTO `music_info` VALUES ('55', '221', '方怡萍--风中的痴情花', '0', 'http://www.yymp3.com/Songword/16/161622.htm', 'yes', 'no', '282', '228', 'FZDCQH', 'FENGZHONGDICHIQINGHUA');
INSERT INTO `music_info` VALUES ('56', '222', '叶诺帆--痴情拿铁', '0', 'http://www.yymp3.com/Songword/26/266500.htm', 'yes', 'no', '283', '227', 'CQNT', 'CHIQINGNATIE');
INSERT INTO `music_info` VALUES ('51', '223', '后会无期--女儿情（电影《后会无期》插曲）- 万晓利', '0', 'http://www.yymp3.com/Songword/26/260794.htm', 'yes', 'no', '280', '245', 'NEQ（DY《HHWQ》CQ）', 'RURQING（DIANYING《HOUKUAIMOJI》CHAQU）');
INSERT INTO `music_info` VALUES ('51', '224', '后会无期--平凡之路（电影《后会无期》主题曲）- 朴树', '0', 'http://www.yymp3.com/Songword/26/260793.htm', 'yes', 'no', '280', '302', 'PFZL（DY《HHWQ》ZTQ）', 'PINGFANZHILU（DIANYING《HOUKUAIMOJI》ZHUTIQU）');
INSERT INTO `music_info` VALUES ('57', '225', '龙梅子--红尘自有痴情人', '0', 'http://www.yymp3.com/Songword/26/266443.htm', 'yes', 'no', '284', '283', 'HCZYCQR', 'GONGCHENZIYOUCHIQINGREN');
INSERT INTO `music_info` VALUES ('51', '226', '后会无期--后会无期（电影《后会无期》同名主题歌） - G.E.M. 邓紫棋', '0', 'http://www.yymp3.com/Songword/26/260792.htm', 'yes', 'no', '280', '223', 'HHWQ（DY《HHWQ》TMZTG） ', 'HOUKUAIMOJI（DIANYING《HOUKUAIMOJI》TONGMINGZHUTIGE） ');
INSERT INTO `music_info` VALUES ('51', '227', '后会无期--东极岛岛歌（电影《后会无期》主题曲） - 上海音乐学院学生', '0', 'http://www.yymp3.com/Songword/26/260791.htm', 'yes', 'no', '280', '120', 'DJDDG（DY《HHWQ》ZTQ） ', 'DONGJIDAODAOGE（DIANYING《HOUKUAIMOJI》ZHUTIQU） ');
INSERT INTO `music_info` VALUES ('58', '228', '鸿飞--爱的痴情人', '0', 'http://www.yymp3.com/Songword/26/263032.htm', 'yes', 'no', '285', '237', 'ADCQR', 'AIDICHIQINGREN');
INSERT INTO `music_info` VALUES ('59', '229', '张碧晨--后会无期(Live)', '0', 'http://www.yymp3.com/Songword/26/267034.htm', 'yes', 'no', '286', '206', 'HHWQ(Live)', 'HOUKUAIMOJI(Live)');
INSERT INTO `music_info` VALUES ('60', '230', '云朵--梨山痴情花', '0', 'http://www.yymp3.com/Songword/25/257431.htm', 'yes', 'no', '287', '224', 'LSCQH', 'LISHANCHIQINGHUA');
INSERT INTO `music_info` VALUES ('6', '231', '邓紫棋--后会无期', '0', 'http://www.yymp3.com/Songword/26/260241.htm', 'yes', 'no', '237', '224', 'HHWQ', 'HOUKUAIMOJI');
INSERT INTO `music_info` VALUES ('61', '232', '崔恕--后会有期', '0', 'http://www.yymp3.com/Songword/25/252795.htm', 'yes', 'no', '288', '223', 'HHYQ', 'HOUKUAIYOUJI');
INSERT INTO `music_info` VALUES ('62', '233', '暴林--为你痴情', '0', 'http://www.yymp3.com/Songword/24/242121.htm', 'yes', 'no', '289', '280', 'WNCQ', 'WEINICHIQING');
INSERT INTO `music_info` VALUES ('63', '234', '萧磊--千年后会更美', '0', 'http://www.yymp3.com/Songword/24/242012.htm', 'yes', 'no', '290', '272', 'QNHHGM', 'QIANNIANHOUKUAIGENGMEI');
INSERT INTO `music_info` VALUES ('10', '235', '群星合辑--用尽一生痴情 - 黑龙', '0', 'http://www.yymp3.com/Songword/25/252938.htm', 'yes', 'no', '240', '299', 'YJYSCQ ', 'YONGJINYISHENGCHIQING ');
INSERT INTO `music_info` VALUES ('65', '237', '徐良--后会无期', '0', 'http://www.yymp3.com/Songword/22/224800.htm', 'yes', 'no', '291', '211', 'HHWQ', 'HOUKUAIMOJI');
INSERT INTO `music_info` VALUES ('67', '239', '张宪哲--痴情人总是伤的深', '0', 'http://www.yymp3.com/Songword/24/246271.htm', 'yes', 'no', '292', '263', 'CQRZSSDS', 'CHIQINGRENZONGSHISHANGDISHEN');
INSERT INTO `music_info` VALUES ('68', '240', '余天龙--痴情行船人', '0', 'http://www.yymp3.com/Songword/24/243297.htm', 'yes', 'no', '293', '315', 'CQXCR', 'CHIQINGHANGCHUANREN');
INSERT INTO `music_info` VALUES ('69', '241', '伊琳--后会有期', '0', 'http://www.yymp3.com/Songword/6/62322.htm', 'yes', 'no', '294', '257', 'HHYQ', 'HOUKUAIYOUJI');
INSERT INTO `music_info` VALUES ('70', '242', '成诗京--不久以后会对我...', '0', 'http://www.yymp3.com/Songword/14/149298.htm', 'yes', 'no', '295', '144', 'BJYHHDW...', 'BUJIUYIHOUKUAIDUIWO...');
INSERT INTO `music_info` VALUES ('71', '243', '王起宏--天涯痴情客', '0', 'http://www.yymp3.com/Songword/23/237984.htm', 'yes', 'no', '296', '268', 'TYCQK', 'TIANYACHIQINGKE');
INSERT INTO `music_info` VALUES ('69', '244', '伊琳--后会有期(慢摇版)', '0', 'http://www.yymp3.com/Songword/12/123190.htm', 'yes', 'no', '294', '423', 'HHYQ(MYB)', 'HOUKUAIYOUJI(MANYAOBAN)');
INSERT INTO `music_info` VALUES ('69', '245', '伊琳--后会有期(伴奏)', '0', 'http://www.yymp3.com/Songword/6/62323.htm', 'yes', 'no', '294', '261', 'HHYQ(BZ)', 'HOUKUAIYOUJI(BANZOU)');
INSERT INTO `music_info` VALUES ('76', '250', '路童--男人最痴情', '0', 'http://www.yymp3.com/Songword/22/226640.htm', 'yes', 'no', '297', '252', 'NRZCQ', 'NANRENZUICHIQING');
INSERT INTO `music_info` VALUES ('77', '251', '吴淑敏--后会有期', '0', 'http://www.yymp3.com/Songword/4/49609.htm', 'yes', 'no', '298', '296', 'HHYQ', 'HOUKUAIYOUJI');
INSERT INTO `music_info` VALUES ('82', '256', '郑君威--痴情巷', '0', 'http://www.yymp3.com/Songword/21/218182.htm', 'yes', 'no', '299', null, 'CQX', 'CHIQINGHANG');
INSERT INTO `music_info` VALUES ('83', '257', '苏勒亚其其格--五星红旗飘起来', '0', 'http://www.yymp3.com/Songword/21/218384.htm', 'yes', 'no', '300', '256', 'WXHQPQL', 'WUXINGGONGQIPIAOQILAI');
INSERT INTO `music_info` VALUES ('84', '258', '夏梵--远走', '0', 'http://www.yymp3.com/Songword/25/256428.htm', 'yes', 'no', '301', '260', 'YZ', 'YUANZOU');
INSERT INTO `music_info` VALUES ('85', '259', '小沈阳--大海', '0', 'http://www.yymp3.com/Songword/26/266470.htm', 'yes', 'no', '302', '151', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('86', '260', '带我去远方--大海', '0', 'http://www.yymp3.com/Songword/18/181776.htm', 'yes', 'no', '303', '37', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('41', '261', '金志文--远走高飞', '0', 'http://www.yymp3.com/Songword/26/268385.htm', 'yes', 'no', '268', '241', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('87', '262', '陈伟联--大海', '0', 'http://www.yymp3.com/Songword/18/180793.htm', 'yes', 'no', '304', '286', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('88', '263', '丁汀--让五星把世界照亮', '0', 'http://www.yymp3.com/Songword/7/70155.htm', 'yes', 'no', '305', '246', 'RWXBSJZL', 'RANGWUXINGBASHIJIEZHAOLIANG');
INSERT INTO `music_info` VALUES ('89', '264', '杨培安--大海', '0', 'http://www.yymp3.com/Songword/13/136023.htm', 'yes', 'no', '306', '282', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('90', '265', '李晓杰--远走高飞', '0', 'http://www.yymp3.com/Songword/26/268175.htm', 'yes', 'no', '307', '229', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('91', '266', '七公主--大海', '0', 'http://www.yymp3.com/Songword/7/72349.htm', 'yes', 'no', '308', '124', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('92', '267', '徐一鸣--我要带你远走高飞', '0', 'http://www.yymp3.com/Songword/26/262182.htm', 'yes', 'no', '309', '226', 'WYDNYZGF', 'WOYAODAINIYUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('93', '268', 'Bonny J--大海', '0', 'http://www.yymp3.com/Songword/11/113575.htm', 'yes', 'no', '310', '243', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('94', '269', '夏天播放--远走（电影《艳遇丽江》主题曲）', '0', 'http://www.yymp3.com/Songword/25/251388.htm', 'yes', 'no', '311', '283', 'YZ（DY《YYLJ》ZTQ）', 'YUANZOU（DIANYING《YANYULIJIANG》ZHUTIQU）');
INSERT INTO `music_info` VALUES ('95', '270', '孙豆尔--远走的梦', '0', 'http://www.yymp3.com/Songword/24/246154.htm', 'yes', 'no', '312', '230', 'YZDM', 'YUANZOUDIMENG');
INSERT INTO `music_info` VALUES ('96', '271', '江蕙--远走高飞', '0', 'http://www.yymp3.com/Songword/24/246357.htm', 'yes', 'no', '313', '252', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('97', '272', '郭燕--大海', '0', 'http://www.yymp3.com/Songword/6/69891.htm', 'yes', 'no', '314', '351', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('101', '276', '大勇--远走高飞', '0', 'http://www.yymp3.com/Songword/20/204846.htm', 'yes', 'no', '315', '254', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('102', '277', '苏云--大海', '0', 'http://www.yymp3.com/Songword/3/39235.htm', 'yes', 'no', '316', '271', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('103', '278', '自由派对--远走高飞', '0', 'http://www.yymp3.com/Songword/18/189883.htm', 'yes', 'no', '317', '278', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('104', '279', '张志政--眼睁睁的看着你远走', '0', 'http://www.yymp3.com/Songword/18/181729.htm', 'yes', 'no', '318', '213', 'YZZDKZNYZ', 'YANZHENGZHENGDIKANZHUONIYUANZOU');
INSERT INTO `music_info` VALUES ('105', '280', '唯嘉--大海', '0', 'http://www.yymp3.com/Songword/6/60015.htm', 'yes', 'no', '319', '330', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('106', '281', '高菲--远走高飞', '0', 'http://www.yymp3.com/Songword/17/178981.htm', 'yes', 'no', '320', '255', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('107', '282', 'KingStar--远走高飞', '0', 'http://www.yymp3.com/Songword/17/176893.htm', 'yes', 'no', '321', '233', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('108', '283', '阿宝--大海', '0', 'http://www.yymp3.com/Songword/4/49456.htm', 'yes', 'no', '322', '293', 'DH', 'DAIHAI');
INSERT INTO `music_info` VALUES ('109', '284', '李圣杰--远走高飞', '0', 'http://www.yymp3.com/Songword/3/36382.htm', 'yes', 'no', '323', '269', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('40', '285', '张杰--远走高飞', '0', 'http://www.yymp3.com/Songword/15/156781.htm', 'yes', 'no', '267', '269', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('110', '286', '亚洲天使童声合唱团--大海啊，故乡', '0', 'http://www.yymp3.com/Songword/26/265876.htm', 'yes', 'no', '324', '233', 'DHA，GX', 'DAIHAIA，GUXIANG');
INSERT INTO `music_info` VALUES ('111', '287', '卢庚戌--面朝大海 - 卢庚戌', '0', 'http://www.yymp3.com/Songword/26/263486.htm', 'yes', 'no', '325', '291', 'MCDH ', 'MIANZHAODAIHAI ');
INSERT INTO `music_info` VALUES ('112', '288', '港台群星--林忆莲 - 远走高飞', '0', 'http://www.yymp3.com/Songword/11/115393.htm', 'yes', 'no', '326', '225', 'LYL ', 'LINYILIAN ');
INSERT INTO `music_info` VALUES ('113', '289', '吴天雄--说给大海', '0', 'http://www.yymp3.com/Songword/26/261699.htm', 'yes', 'no', '327', '349', 'SJDH', 'SHUIGEIDAIHAI');
INSERT INTO `music_info` VALUES ('114', '290', '佟宇--心的大海', '0', 'http://www.yymp3.com/Songword/25/256537.htm', 'yes', 'no', '328', '218', 'XDDH', 'XINDIDAIHAI');
INSERT INTO `music_info` VALUES ('115', '291', '王媛媛--大海故乡', '0', 'http://www.yymp3.com/Songword/25/254043.htm', 'yes', 'no', '329', '268', 'DHGX', 'DAIHAIGUXIANG');
INSERT INTO `music_info` VALUES ('116', '292', 'Bandari--风车远走高飞', '0', 'http://www.yymp3.com/Songword/10/101665.htm', 'yes', 'no', '330', '253', 'FCYZGF', 'FENGJUYUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('117', '293', '陈赛金--放一片大海在我们心中', '0', 'http://www.yymp3.com/Songword/25/253404.htm', 'yes', 'no', '331', '234', 'FYPDHZWMXZ', 'FANGYIPIANDAIHAIZAIWOMENXINZHONG');
INSERT INTO `music_info` VALUES ('118', '294', '刘嘉亮--爱远走', '0', 'http://www.yymp3.com/Songword/3/36145.htm', 'yes', 'no', '332', '254', 'AYZ', 'AIYUANZOU');
INSERT INTO `music_info` VALUES ('119', '295', '刘孟哲--大海啊故乡', '0', 'http://www.yymp3.com/Songword/24/249921.htm', 'yes', 'no', '333', '210', 'DHAGX', 'DAIHAIAGUXIANG');
INSERT INTO `music_info` VALUES ('120', '296', '姜木--远走高飞', '0', 'http://www.yymp3.com/Songword/5/51509.htm', 'yes', 'no', '334', '273', 'YZGF', 'YUANZOUGAOFEI');
INSERT INTO `music_info` VALUES ('121', '297', '郭玲--花开大海', '0', 'http://www.yymp3.com/Songword/24/246469.htm', 'yes', 'no', '335', '280', 'HKDH', 'HUAKAIDAIHAI');
INSERT INTO `music_info` VALUES ('122', '298', '李娜--爱远走', '0', 'http://www.yymp3.com/Songword/4/41958.htm', 'yes', 'no', '336', '244', 'AYZ', 'AIYUANZOU');
INSERT INTO `music_info` VALUES ('123', '299', '醉歌--大海摇篮曲', '0', 'http://www.yymp3.com/Songword/24/241625.htm', 'yes', 'no', '337', '247', 'DHYLQ', 'DAIHAIYAOLANQU');
INSERT INTO `music_info` VALUES ('127', '303', '黑钻石--面向大海', '0', 'http://www.yymp3.com/Songword/21/217341.htm', 'yes', 'no', '338', null, 'MXDH', 'MIANXIANGDAIHAI');
INSERT INTO `music_info` VALUES ('128', '304', '陈学冬--碎碎恋', '0', 'http://www.yymp3.com/Songword/26/267182.htm', 'yes', 'no', '339', '208', 'SSL', 'SUISUILIAN');
INSERT INTO `music_info` VALUES ('129', '305', '六哲--让全世界知道我爱你', '0', 'http://www.yymp3.com/Songword/26/268284.htm', 'yes', 'no', '0', '261', 'RQSJZDWAN', 'RANGQUANSHIJIEZHIDAOWOAINI');
INSERT INTO `music_info` VALUES ('130', '307', '老猫--因为铂乐 - 王蓉 老猫', '0', 'http://www.yymp3.com/Songword/26/268256.htm', 'yes', 'no', '340', '193', 'YWBL ', 'YINWEIBOYUE ');
INSERT INTO `music_info` VALUES ('128', '308', '陈学冬--人间沙', '0', 'http://www.yymp3.com/Songword/26/267181.htm', 'yes', 'no', '339', '294', 'RJS', 'RENJIANSHA');
INSERT INTO `music_info` VALUES ('130', '309', '老猫--噢啦 - 老猫 项一芯', '0', 'http://www.yymp3.com/Songword/26/268255.htm', 'yes', 'no', '340', '207', 'OL ', 'OLA ');
INSERT INTO `music_info` VALUES ('129', '310', '六哲--放下那个我不爱的人', '0', 'http://www.yymp3.com/Songword/26/268283.htm', 'yes', 'no', '0', '282', 'FXNGWBADR', 'FANGXIANAGEWOBUAIDIREN');
INSERT INTO `music_info` VALUES ('130', '311', '老猫--新成吉思汗 - 老猫 李凯年', '0', 'http://www.yymp3.com/Songword/26/268254.htm', 'yes', 'no', '340', '206', 'XCJSH ', 'XINCHENGJISAIHAN ');
INSERT INTO `music_info` VALUES ('129', '313', '六哲--算了吧', '0', 'http://www.yymp3.com/Songword/26/268282.htm', 'yes', 'no', '0', '329', 'SLB', 'SUANLIAOBA');
INSERT INTO `music_info` VALUES ('128', '314', '陈学冬--岁月缝花', '0', 'http://www.yymp3.com/Songword/26/264758.htm', 'yes', 'no', '339', '245', 'SYFH', 'SUIYUEFENGHUA');
INSERT INTO `music_info` VALUES ('130', '315', '老猫--姑娘我铁了心跟着你啦 - 老猫 龙梅子', '0', 'http://www.yymp3.com/Songword/26/268253.htm', 'yes', 'no', '340', '209', 'GNWTLXGZNL ', 'GUNIANGWOTIELIAOXINGENZHUONILA ');
INSERT INTO `music_info` VALUES ('130', '316', '老猫--走天涯 - 老猫 杨望', '0', 'http://www.yymp3.com/Songword/26/268252.htm', 'yes', 'no', '340', '268', 'ZTY ', 'ZOUTIANYA ');
INSERT INTO `music_info` VALUES ('128', '317', '陈学冬--不再见', '0', 'http://www.yymp3.com/Songword/26/260326.htm', 'yes', 'no', '339', '245', 'BZJ', 'BUZAIXIAN');
INSERT INTO `music_info` VALUES ('129', '318', '六哲--新单身情歌', '0', 'http://www.yymp3.com/Songword/26/264845.htm', 'yes', 'no', '0', '220', 'XDSQG', 'XINCHANJUANQINGGE');
INSERT INTO `music_info` VALUES ('129', '319', '六哲--错过的幸福', '0', 'http://www.yymp3.com/Songword/26/264844.htm', 'yes', 'no', '0', '277', 'CGDXF', 'CUOGUODIXINGFU');
INSERT INTO `music_info` VALUES ('130', '320', '老猫--女朋友 - 老猫 王蓉', '0', 'http://www.yymp3.com/Songword/26/268251.htm', 'yes', 'no', '340', '273', 'NPY ', 'RUPENGYOU ');
INSERT INTO `music_info` VALUES ('129', '321', '六哲--爱过的每一天', '0', 'http://www.yymp3.com/Songword/26/264843.htm', 'yes', 'no', '0', '256', 'AGDMYT', 'AIGUODIMEIYITIAN');
INSERT INTO `music_info` VALUES ('130', '323', '老猫--好妈妈 - 俪媛 老猫', '0', 'http://www.yymp3.com/Songword/26/268249.htm', 'yes', 'no', '340', '296', 'HMM ', 'HAOMAMA ');
INSERT INTO `music_info` VALUES ('130', '326', '老猫--八块腹肌 - 老猫 杨望', '0', 'http://www.yymp3.com/Songword/26/268247.htm', 'yes', 'no', '340', '212', 'BKFJ ', 'BAKUAIFUJI ');
INSERT INTO `music_info` VALUES ('130', '327', '老猫--大叔不卖我香蕉 - 龙梅子 老猫', '0', 'http://www.yymp3.com/Songword/26/268245.htm', 'yes', 'no', '340', '216', 'DSBMWXJ ', 'DAISHUBUMAIWOXIANGQIAO ');
INSERT INTO `music_info` VALUES ('131', '328', '路飞--我不是周杰伦', '0', 'http://www.yymp3.com/Songword/25/259593.htm', 'yes', 'no', '342', '246', 'WBSZJL', 'WOBUSHIZHOUJIELUN');
INSERT INTO `music_info` VALUES ('31', '331', '筷子兄弟--奔跑吧兄弟', '0', 'http://www.yymp3.com/Songword/26/264707.htm', 'yes', 'no', '253', '197', 'BPBXD', 'BENPAOBAXIONGDI');
INSERT INTO `music_info` VALUES ('130', '332', '老猫--牛叉本命年 - 龙梅子 老猫', '0', 'http://www.yymp3.com/Songword/26/268257.htm', 'yes', 'no', '340', '201', 'NCBMN ', 'NIUCHABENMINGNIAN ');
INSERT INTO `music_info` VALUES ('31', '334', '筷子兄弟--最炫小苹果', '0', 'http://www.yymp3.com/Songword/26/264706.htm', 'yes', 'no', '253', '176', 'ZXXPG', 'ZUIXUANXIAOPINGUO');
INSERT INTO `music_info` VALUES ('130', '338', '老猫--许Sir思密达 - 王麟 老猫', '0', 'http://www.yymp3.com/Songword/26/268250.htm', 'yes', 'no', '341', '225', 'XSirSMD ', 'XUSirSAIMIDA ');
INSERT INTO `music_info` VALUES ('130', '342', '老猫--小姐小姐 你真美 - 老猫 龙者组合', '0', 'http://www.yymp3.com/Songword/26/268248.htm', 'yes', 'no', '341', '311', 'XJXJ NZM ', 'XIAOJIEXIAOJIE NIZHENMEI ');
INSERT INTO `music_info` VALUES ('31', '344', '筷子兄弟--小水果', '0', 'http://www.yymp3.com/Songword/26/264705.htm', 'yes', 'no', '253', '197', 'XSG', 'XIAOSHUIGUO');
INSERT INTO `music_info` VALUES ('130', '347', '老猫--燃烧吧蔬菜', '0', 'http://www.yymp3.com/Songword/26/268258.htm', 'yes', 'no', '341', '197', 'RSBSC', 'RANSHAOBASHUCAI');
INSERT INTO `music_info` VALUES ('130', '351', '老猫--超能太监', '0', 'http://www.yymp3.com/Songword/26/268246.htm', 'yes', 'no', '341', '160', 'CNTJ', 'CHAONENGTAIJIAN');
INSERT INTO `music_info` VALUES ('130', '353', '老猫--就要你红', '0', 'http://www.yymp3.com/Songword/26/268244.htm', 'yes', 'no', '341', '186', 'JYNH', 'JIUYAONIGONG');
INSERT INTO `music_info` VALUES ('31', '355', '筷子兄弟--每个人都看到了希望', '0', 'http://www.yymp3.com/Songword/26/260464.htm', 'yes', 'no', '253', '197', 'MGRDKDLXW', 'MEIGERENDUKANDAOLIAOXIWANG');
INSERT INTO `music_info` VALUES ('31', '357', '筷子兄弟--小苹果', '0', 'http://www.yymp3.com/Songword/26/260351.htm', 'yes', 'no', '253', '212', 'XPG', 'XIAOPINGUO');
INSERT INTO `music_info` VALUES ('130', '359', '老猫--你是我的妞', '0', 'http://www.yymp3.com/Songword/26/261111.htm', 'yes', 'no', '341', '223', 'NSWDN', 'NISHIWODINIU');
INSERT INTO `music_info` VALUES ('31', '360', '筷子兄弟--猛龙过江', '0', 'http://www.yymp3.com/Songword/26/260272.htm', 'yes', 'no', '253', '188', 'MLGJ', 'MENGLONGGUOJIANG');
INSERT INTO `music_info` VALUES ('6', '362', '邓紫棋--有心人', '0', 'http://www.yymp3.com/Songword/26/266494.htm', 'yes', 'no', '237', '240', 'YXR', 'YOUXINREN');
INSERT INTO `music_info` VALUES ('31', '364', '筷子兄弟--你一定会成功', '0', 'http://www.yymp3.com/Songword/25/259997.htm', 'yes', 'no', '253', '215', 'NYDHCG', 'NIYIDINGKUAICHENGGONG');
INSERT INTO `music_info` VALUES ('31', '365', '筷子兄弟--我从来没去过纽约', '0', 'http://www.yymp3.com/Songword/25/259164.htm', 'yes', 'no', '253', '298', 'WCLMQGNY', 'WOCONGLAIMOQUGUONIUYAO');
INSERT INTO `music_info` VALUES ('130', '366', '老猫--你就是我最想要的人', '0', 'http://www.yymp3.com/Songword/24/244834.htm', 'yes', 'no', '341', '221', 'NJSWZXYDR', 'NIJIUSHIWOZUIXIANGYAODIREN');
INSERT INTO `music_info` VALUES ('6', '367', '邓紫棋--给你的歌', '0', 'http://www.yymp3.com/Songword/26/266493.htm', 'yes', 'no', '237', '293', 'JNDG', 'GEINIDIGE');
INSERT INTO `music_info` VALUES ('31', '369', '筷子兄弟--我一定要得到你', '0', 'http://www.yymp3.com/Songword/24/242939.htm', 'yes', 'no', '253', '205', 'WYDYDDN', 'WOYIDINGYAODEDAONI');
INSERT INTO `music_info` VALUES ('130', '370', '老猫--哥已经爱上你啦', '0', 'http://www.yymp3.com/Songword/24/244833.htm', 'yes', 'no', '341', '200', 'GYJASNL', 'GEYIJINGAISHANGNILA');
INSERT INTO `music_info` VALUES ('31', '372', '筷子兄弟--父亲', '0', 'http://www.yymp3.com/Songword/22/225449.htm', 'yes', 'no', '254', '339', 'FQ', 'FUQIN');
INSERT INTO `music_info` VALUES ('6', '373', '邓紫棋--再见', '0', 'http://www.yymp3.com/Songword/26/265097.htm', 'yes', 'no', '237', '208', 'ZJ', 'ZAIXIAN');
INSERT INTO `music_info` VALUES ('57', '374', '龙梅子--厉害厉害了 - 老猫 龙梅子', '0', 'http://www.yymp3.com/Songword/26/268367.htm', 'yes', 'no', '284', '213', 'LHLHL ', 'LIHAILIHAILIAO ');
INSERT INTO `music_info` VALUES ('6', '375', '邓紫棋--一路逆风', '0', 'http://www.yymp3.com/Songword/26/265096.htm', 'yes', 'no', '237', '227', 'YLNF', 'YILUNIFENG');
INSERT INTO `music_info` VALUES ('57', '376', '龙梅子--你的哈 - 老猫 龙梅子', '0', 'http://www.yymp3.com/Songword/26/268364.htm', 'yes', 'no', '284', '181', 'NDH ', 'NIDIHA ');
INSERT INTO `music_info` VALUES ('31', '378', '筷子兄弟--我们的路', '0', 'http://www.yymp3.com/Songword/22/222016.htm', 'yes', 'no', '254', '296', 'WMDL', 'WOMENDILU');
INSERT INTO `music_info` VALUES ('133', '379', '王蓉--叶问 - 王蓉 老猫 杨望', '0', 'http://www.yymp3.com/Songword/26/267812.htm', 'yes', 'no', '343', '242', 'YW ', 'XIEWEN ');
INSERT INTO `music_info` VALUES ('6', '380', '邓紫棋--多远都要在一起', '0', 'http://www.yymp3.com/Songword/26/264911.htm', 'yes', 'no', '237', '219', 'DYDYZYQ', 'DUOYUANDUYAOZAIYIQI');
INSERT INTO `music_info` VALUES ('134', '382', '广场舞--全世界最伤心的人-老猫', '0', 'http://www.yymp3.com/Songword/23/233898.htm', 'yes', 'no', '344', '458', 'QSJZSXDR', 'QUANSHIJIEZUISHANGXINDIREN');
INSERT INTO `music_info` VALUES ('31', '383', '筷子兄弟--火柴', '0', 'http://www.yymp3.com/Songword/21/214577.htm', 'yes', 'no', '254', '360', 'HC', 'HUOCHAI');
INSERT INTO `music_info` VALUES ('6', '384', '邓紫棋--新的心跳', '0', 'http://www.yymp3.com/Songword/26/264910.htm', 'yes', 'no', '237', '218', 'XDXT', 'XINDIXINTIAO');

-- ----------------------------
-- Table structure for music_type
-- ----------------------------
DROP TABLE IF EXISTS `music_type`;
CREATE TABLE `music_type` (
  `music_typeid` int(11) NOT NULL,
  `music_typename` varchar(10) NOT NULL,
  PRIMARY KEY (`music_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_type
-- ----------------------------

-- ----------------------------
-- Table structure for music_visites
-- ----------------------------
DROP TABLE IF EXISTS `music_visites`;
CREATE TABLE `music_visites` (
  `music_date` datetime NOT NULL,
  `music_id` int(11) NOT NULL,
  `music_visites` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`music_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_visites
-- ----------------------------

-- ----------------------------
-- Table structure for pachong
-- ----------------------------
DROP TABLE IF EXISTS `pachong`;
CREATE TABLE `pachong` (
  `url_key` varchar(255) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `singer` varchar(20) NOT NULL,
  `music` varchar(50) NOT NULL,
  `lrc_url` varchar(255) NOT NULL,
  PRIMARY KEY (`url_key`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pachong
-- ----------------------------
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new/jiangmu1/9.mp3', '远走高飞', '姜木', '远走高飞', 'http://www.yymp3.com/Songword/5/51509.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new1/suyun2/12.mp3', '大海', '苏云', '大海', 'http://www.yymp3.com/Songword/6/61249.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new1/weijia/2.mp3', '大海', '唯嘉', '大海', 'http://www.yymp3.com/Songword/6/60015.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new1/yilin/1.mp3', '后会无期', '伊琳', '后会有期', 'http://www.yymp3.com/Songword/6/62322.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new1/yilin/2.mp3', '后会无期', '伊琳', '后会有期(伴奏)', 'http://www.yymp3.com/Songword/6/62323.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new11/hwxszgs/31.mp3', '徐佳莹', '超级星光', '徐佳莹 - 出口', 'http://www.yymp3.com/Songword/14/141541.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new11/yangpeian2/11.mp3', '大海', '杨培安', '大海', 'http://www.yymp3.com/Songword/13/136023.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new12/chengsijing3/5.mp3', '后会无期', '成诗京', '不久以后会对我...', 'http://www.yymp3.com/Songword/14/149298.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new12/yangpeian3/9.mp3', '大海', '杨培安', '大海', 'http://www.yymp3.com/Songword/15/150499.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new12/zhangjie5/6.mp3', '远走高飞', '张杰', '远走高飞', 'http://www.yymp3.com/Songword/15/156781.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/chengduxiaochuen/1.mp3', '成都', '成都小春', '你嫁人了吗', 'http://www.yymp3.com/Songword/16/163162.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/chengduxiaochuen/2.mp3', '成都', '成都小春', '我的眼泪骗了我自己', 'http://www.yymp3.com/Songword/16/163163.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/chengduxiaochuen/3.mp3', '成都', '成都小春', '撕毁承诺', 'http://www.yymp3.com/Songword/16/163164.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/chengduxiaochuen/4.mp3', '成都', '成都小春', '汶川，别哭', 'http://www.yymp3.com/Songword/16/163165.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/chengduxiaochuen/5.mp3', '成都', '成都小春', '温暖四川', 'http://www.yymp3.com/Songword/16/163166.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/fangyiping3/1.mp3', '痴情玫瑰花', '方怡萍', '风中的痴情花', 'http://www.yymp3.com/Songword/16/161622.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/lishengjie6/4.mp3', '远走高飞', '李圣杰', '远走高飞', 'http://www.yymp3.com/Songword/16/168678.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/wxskxstj/6.mp3', '老猫', '内地群星', '女朋友 - 老猫/王蓉', 'http://www.yymp3.com/Songword/16/164014.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new13/yyhlsnmzjx/11.mp3', '李玉刚', '群星合辑', '新贵妃醉酒 - 李玉刚', 'http://www.yymp3.com/Songword/16/162921.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new14/zhangxiulu3/1.mp3', '痴情玫瑰花', '张秀卿', '痴情胆 - 张秀卿/蔡小虎', 'http://www.yymp3.com/Songword/17/171441.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/chenweilian2/11.mp3', '大海', '陈伟联', '大海', 'http://www.yymp3.com/Songword/18/180793.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/dwqyf/17.mp3', '大海', '带我去远方', '大海', 'http://www.yymp3.com/Songword/18/181789.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/dwqyf/4.mp3', '大海', '带我去远方', '大海', 'http://www.yymp3.com/Songword/18/181776.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/gaofei/3.mp3', '远走高飞', '高菲', '远走高飞', 'http://www.yymp3.com/Songword/17/178981.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/guoyujd101/44.mp3', '我是歌手', '群星合辑', '别问我是谁 - 王馨平', 'http://www.yymp3.com/Songword/17/176048.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/KingStar3/5.mp3', '远走高飞', 'KingStar', '远走高飞', 'http://www.yymp3.com/Songword/17/176893.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/shangwenjie5/4.mp3', '我是歌手', '尚雯婕', '我想我是你的女人', 'http://www.yymp3.com/Songword/18/183404.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/shuohbhh/30.mp3', '李玉刚', '群星合辑', '新贵妃醉酒 - 李玉刚', 'http://www.yymp3.com/Songword/17/178413.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/yilin3/9.mp3', '后会无期', '伊琳', '后会有期', 'http://www.yymp3.com/Songword/18/182099.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new15/zhangzhizheng3/4.mp3', '远走高飞', '张志政', '眼睁睁的看着你远走', 'http://www.yymp3.com/Songword/18/181729.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new16/zhangjie6/5.mp3', '张杰', '张杰', '量身订做', 'http://www.yymp3.com/Songword/18/184348.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new16/zhangjie6/7.mp3', '张杰', '张杰', '龙鳞', 'http://www.yymp3.com/Songword/18/184350.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new16/ziyoupaidui/9.mp3', '远走高飞', '自由派对', '远走高飞', 'http://www.yymp3.com/Songword/18/189883.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new17/sunshumei9/1.mp3', '痴情玫瑰花', '孙淑媚', '痴情歌', 'http://www.yymp3.com/Songword/19/196794.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new17/wxxklyztgq/16.mp3', '李玉刚', '内地群星', '最重是情意 - 李玉刚', 'http://www.yymp3.com/Songword/19/198541.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new17/xiaoshenyang/19.mp3', '大海', '小沈阳', '大海', 'http://www.yymp3.com/Songword/26/266470.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new18/dayong/1.mp3', '远走高飞', '大勇', '远走高飞', 'http://www.yymp3.com/Songword/20/204846.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new18/gaoxszxj/3.mp3', '成都', '内地群星', '成都 Raggae Bar  - 杨丹涛', 'http://www.yymp3.com/Songword/20/206029.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new18/mingshengkai2/4.mp3', '老男孩', '明圣凯', '老男孩', 'http://www.yymp3.com/Songword/21/213059.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new18/wxxkqiyuetj/12.mp3', '李玉刚', '内地群星', '最重是情义 - 李玉刚', 'http://www.yymp3.com/Songword/20/200311.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new19/hsmy/3.mp3', '周杰伦', '黑色牡羊', '梦见周杰伦', 'http://www.yymp3.com/Songword/20/207990.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new19/LOVE10qgj/13.mp3', '邓紫棋', '群星合辑', '想讲你知 - 邓紫棋', 'http://www.yymp3.com/Songword/21/211484.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new19/qadqmjhb/4.mp3', '老猫', '群星合辑', '你就是我最想要的人 - 老猫', 'http://www.yymp3.com/Songword/20/208361.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new19/sczd/6.mp3', '老男孩', '群星合辑', '老男孩 - MC和尚/Sideno/kkk/白冰', 'http://www.yymp3.com/Songword/21/212286.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new1_hy/01_ng/abao2/9.mp3', '大海', '阿宝', '大海', 'http://www.yymp3.com/Songword/4/49456.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new1_hy/02_vg/wushuming4/3.mp3', '后会无期', '吴淑敏', '后会有期', 'http://www.yymp3.com/Songword/4/49609.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new2/dindin/12.mp3', '五星红旗', '丁汀', '让五星把世界照亮', 'http://www.yymp3.com/Songword/7/70155.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new2/guoyan/6.mp3', '大海', '郭燕', '大海', 'http://www.yymp3.com/Songword/6/69891.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new2/qigongzhu/8.mp3', '大海', '七公主', '大海', 'http://www.yymp3.com/Songword/7/72349.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new2/wuzongxian8/7.mp3', '痴情玫瑰花', '吴宗宪', '痴情', 'http://www.yymp3.com/Songword/7/71831.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/2011ndxgst12/93.mp3', '旭日阳刚', '音乐专题', '等待春天（旭日阳刚）', 'http://www.yymp3.com/Songword/22/226408.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/2011xgst12/16.mp3', '筷子兄弟', '音乐专题', '父亲（筷子兄弟）', 'http://www.yymp3.com/Songword/22/226411.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/BlackDiamond2/3.mp3', '大海', '黑钻石', '面向大海', 'http://www.yymp3.com/Songword/21/217341.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/caiyide2/5.mp3', '痴情玫瑰花', '蔡义德', '痴情误一生', 'http://www.yymp3.com/Songword/22/221501.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/Chuanzi2/8.mp3', '旭日阳刚', '川子', '今生缘 - 川子/旭日阳刚', 'http://www.yymp3.com/Songword/21/217629.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/danbao3/4.mp3', '徐佳莹', '蛋堡', '〞嘘...〞 ft. 徐佳莹', 'http://www.yymp3.com/Songword/22/222475.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/dazhe3/8.mp3', '痴情玫瑰花', '大哲', '痴情人总是伤的深', 'http://www.yymp3.com/Songword/22/222907.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/hmw3/15.mp3', '北京欢迎你', '海鸣威', '一个人的北京', 'http://www.yymp3.com/Songword/25/258099.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/junyijie/3.mp3', '远走高飞', '峻一杰', '我要带你远走高飞', 'http://www.yymp3.com/Songword/21/217267.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/1.mp3', '筷子兄弟', '筷子兄弟', '冬天', 'http://www.yymp3.com/Songword/21/214574.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/2.mp3', '筷子兄弟', '筷子兄弟', '微幸福', 'http://www.yymp3.com/Songword/21/214575.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/3.mp3', '筷子兄弟', '筷子兄弟', '暴雨将至', 'http://www.yymp3.com/Songword/21/214576.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/4.mp3', '筷子兄弟', '筷子兄弟', '火柴', 'http://www.yymp3.com/Songword/21/214577.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/5.mp3', '筷子兄弟', '筷子兄弟', '老男孩', 'http://www.yymp3.com/Songword/21/214578.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/5.mp3', '老男孩', '筷子兄弟', '老男孩', 'http://www.yymp3.com/Songword/21/214578.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/6.mp3', '筷子兄弟', '筷子兄弟', '我们的路', 'http://www.yymp3.com/Songword/22/222016.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/7.mp3', '筷子兄弟', '筷子兄弟', '父亲', 'http://www.yymp3.com/Songword/22/225449.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/kuaizixd/8.mp3', '筷子兄弟', '筷子兄弟', '我一定要得到你', 'http://www.yymp3.com/Songword/24/242939.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/lijunji3/6.mp3', '痴情玫瑰花', '林俊吉', '痴情无效', 'http://www.yymp3.com/Songword/22/222813.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuminghui2/3.mp3', '老男孩', '刘明辉', '黄昏里的老男孩', 'http://www.yymp3.com/Songword/22/224602.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuzhe2/4.mp3', '六哲', '六哲', '你的心是否也有我的名', 'http://www.yymp3.com/Songword/21/216751.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuzhe2/5.mp3', '六哲', '六哲', '他真的比我好吗', 'http://www.yymp3.com/Songword/21/216752.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuzhe2/6.mp3', '六哲', '六哲', '爱曾经是我犯下的错', 'http://www.yymp3.com/Songword/21/216753.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuzhe2/7.mp3', '六哲', '六哲', '我的烦恼', 'http://www.yymp3.com/Songword/21/216754.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuzhe2/8.mp3', '六哲', '六哲', '踏台舞', 'http://www.yymp3.com/Songword/21/216755.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/liuzhe2/9.mp3', '六哲', '六哲', '舍不得也要说再见', 'http://www.yymp3.com/Songword/21/216756.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/lujiahong/1.mp3', '大海', '卢家宏', '大海啸', 'http://www.yymp3.com/Songword/22/224791.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/qiancheng/9.mp3', '痴情玫瑰花', '钱澄', '痴情憨子', 'http://www.yymp3.com/Songword/22/221055.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/slyqqg2/2.mp3', '五星红旗', '苏勒亚其其格', '五星红旗飘起来', 'http://www.yymp3.com/Songword/21/218384.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/weiminghua/4.mp3', '大海', '韦明华', '大海的女友是天空', 'http://www.yymp3.com/Songword/22/224465.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xryglg/1.mp3', '旭日阳刚', '旭日阳刚刘刚', '和原来一样', 'http://www.yymp3.com/Songword/21/219035.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xryglg/2.mp3', '旭日阳刚', '旭日阳刚刘刚', '飘雪牡丹江', 'http://www.yymp3.com/Songword/21/219036.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xryglg/3.mp3', '旭日阳刚', '旭日阳刚刘刚', '冬季', 'http://www.yymp3.com/Songword/21/219037.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xryglg/4.mp3', '旭日阳刚', '旭日阳刚刘刚', '路', 'http://www.yymp3.com/Songword/21/219038.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xtAlex/10.mp3', '远走高飞', '夏天Alex', '远走高飞', 'http://www.yymp3.com/Songword/21/214854.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xuliang2/2.mp3', '后会无期', '徐良', '后会无期', 'http://www.yymp3.com/Songword/22/224800.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xuriyanggang/1.mp3', '旭日阳刚', '旭日阳刚', '春天里', 'http://www.yymp3.com/Songword/21/213537.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xuriyanggang/2.mp3', '旭日阳刚', '旭日阳刚', '光芒永恒', 'http://www.yymp3.com/Songword/21/213538.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xuriyanggang/3.mp3', '旭日阳刚', '旭日阳刚', '回家', 'http://www.yymp3.com/Songword/21/213539.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/xuriyanggang/4.mp3', '旭日阳刚', '旭日阳刚', '今生缘', 'http://www.yymp3.com/Songword/21/213540.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/zhangrongrong13/16.mp3', '痴情玫瑰花', '张蓉蓉', '痴情赚醉', 'http://www.yymp3.com/Songword/22/224599.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/zhenjunwei/6.mp3', '痴情玫瑰花', '郑君威', '痴情巷', 'http://www.yymp3.com/Songword/21/218182.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new20/zhwh9yxg/7.mp3', '李玉刚', '内地群星', '思念如海 - 李玉和', 'http://www.yymp3.com/Songword/22/221280.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/chenwenxiong/2.mp3', '痴情玫瑰花', '陈文雄', '痴情者', 'http://www.yymp3.com/Songword/23/230211.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/dyLove/14.mp3', '老男孩', 'Love', '老男孩的反击(演奏曲)', 'http://www.yymp3.com/Songword/22/227092.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/guangchangwu/10.mp3', '老猫', '广场舞', '全世界最伤心的人-老猫', 'http://www.yymp3.com/Songword/23/233898.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/guangchangwu/20.mp3', '老猫', '广场舞', '我的雷帝女孩-老猫赖伟锋', 'http://www.yymp3.com/Songword/23/233908.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/guangchangwu/34.mp3', '老猫', '广场舞', '吉特巴-我的雷帝女孩-老猫/赖伟锋', 'http://www.yymp3.com/Songword/23/233922.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/guangchangwu/36.mp3', '老猫', '广场舞', '拉并-我的雷帝女孩-老猫/赖伟锋', 'http://www.yymp3.com/Songword/23/233924.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/guangchangwu/4.mp3', '老猫', '广场舞', '你就是我最想要的人-老猫', 'http://www.yymp3.com/Songword/23/233892.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/guangchangwu/5.mp3', '老猫', '广场舞', '我的雷帝女孩-老猫赖伟锋', 'http://www.yymp3.com/Songword/23/233893.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/junyijie2/8.mp3', '远走高飞', '峻一杰', '我要带你远走高飞', 'http://www.yymp3.com/Songword/23/233755.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/linshan9/1.mp3', '痴情玫瑰花', '林姗', '痴情恋梦', 'http://www.yymp3.com/Songword/22/228092.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/lutong/4.mp3', '痴情玫瑰花', '路童', '男人最痴情', 'http://www.yymp3.com/Songword/22/226640.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/Vae7/11.mp3', '许嵩', '许嵩', '小烦恼没什么大不了', 'http://www.yymp3.com/Songword/24/246394.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/Vae7/12.mp3', '许嵩', '许嵩', '违章动物', 'http://www.yymp3.com/Songword/25/250024.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/Vae7/13.mp3', '许嵩', '许嵩', '山水之间', 'http://www.yymp3.com/Songword/26/260239.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/Vae7/14.mp3', '许嵩', '许嵩', '惊鸿一面', 'http://www.yymp3.com/Songword/26/260743.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new21/yefutai2/9.mp3', '痴情玫瑰花', '叶复台', '痴情的爱', 'http://www.yymp3.com/Songword/22/226778.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/gebenjun/8.mp3', '大海', '葛本军', '太阳住在大海里', 'http://www.yymp3.com/Songword/23/238059.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/hexi/8.mp3', '远走高飞', '何西', '远走高飞', 'http://www.yymp3.com/Songword/23/236480.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/jincheng2/6.mp3', '痴情玫瑰花', '金城', '痴情男孩', 'http://www.yymp3.com/Songword/23/236335.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/wangqihong3/4.mp3', '痴情玫瑰花', '王起宏', '天涯痴情客', 'http://www.yymp3.com/Songword/23/237984.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/xiaopi/10.mp3', '大壮', '小皮', '世界也是我们的家 - 小皮/朱七/赵翔/鸽大壮/张小胖/张振/庐山/程程/邹昆/范蓁蓁/力轩', 'http://www.yymp3.com/Songword/23/237446.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/11.mp3', '张杰', '张杰', '这，就是爱', 'http://www.yymp3.com/Songword/23/237083.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/12.mp3', '张杰', '张杰', '逆战', 'http://www.yymp3.com/Songword/23/237084.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/13.mp3', '张杰', '张杰', '我们都一样', 'http://www.yymp3.com/Songword/23/237085.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/14.mp3', '张杰', '张杰', '风', 'http://www.yymp3.com/Songword/23/237086.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/15.mp3', '张杰', '张杰', '何必在一起', 'http://www.yymp3.com/Songword/23/237087.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/16.mp3', '张杰', '张杰', '再爱我一回', 'http://www.yymp3.com/Songword/23/237088.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/17.mp3', '张杰', '张杰', '天下', 'http://www.yymp3.com/Songword/23/237089.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/18.mp3', '张杰', '张杰', '流言有一千分贝', 'http://www.yymp3.com/Songword/23/237090.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/19.mp3', '张杰', '张杰', '你和我', 'http://www.yymp3.com/Songword/23/237091.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/20.mp3', '张杰', '张杰', '最美的太阳', 'http://www.yymp3.com/Songword/23/237092.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/21.mp3', '张杰', '张杰', '一切都值得', 'http://www.yymp3.com/Songword/23/237093.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/22.mp3', '张杰', '张杰', '我们的歌', 'http://www.yymp3.com/Songword/23/237094.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new22/zhangjie9/23.mp3', '张杰', '张杰', '北斗星的爱', 'http://www.yymp3.com/Songword/23/237095.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/baolin3/4.mp3', '痴情玫瑰花', '暴林', '为你痴情', 'http://www.yymp3.com/Songword/24/242121.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/hylsj/5.mp3', '徐佳莹', '谎言留声机', '分手夜 (Feat.徐佳莹)', 'http://www.yymp3.com/Songword/24/240731.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/niguangfx/11.mp3', '徐佳莹', '逆光飞翔', '调色盘 - 徐佳莹', 'http://www.yymp3.com/Songword/23/239025.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xiaolei/2.mp3', '后会无期', '萧磊', '千年后会更美', 'http://www.yymp3.com/Songword/24/242012.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/1.mp3', '旭日阳刚', '旭日阳刚', '坚强的信仰', 'http://www.yymp3.com/Songword/24/241485.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/10.mp3', '旭日阳刚', '旭日阳刚', '那么光荣', 'http://www.yymp3.com/Songword/24/241494.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/11.mp3', '旭日阳刚', '旭日阳刚', '麻雀', 'http://www.yymp3.com/Songword/24/241495.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/12.mp3', '旭日阳刚', '旭日阳刚', '冬季', 'http://www.yymp3.com/Songword/24/241496.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/2.mp3', '旭日阳刚', '旭日阳刚', '路', 'http://www.yymp3.com/Songword/24/241486.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/3.mp3', '旭日阳刚', '旭日阳刚', '希望总在下一站', 'http://www.yymp3.com/Songword/24/241487.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/4.mp3', '旭日阳刚', '旭日阳刚', '飘叶', 'http://www.yymp3.com/Songword/24/241488.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/5.mp3', '旭日阳刚', '旭日阳刚', '高飞', 'http://www.yymp3.com/Songword/24/241489.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/6.mp3', '旭日阳刚', '旭日阳刚', '无法忘记的', 'http://www.yymp3.com/Songword/24/241490.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/7.mp3', '旭日阳刚', '音乐专题', '车票（旭日阳刚）', 'http://www.yymp3.com/Songword/24/242723.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/8.mp3', '旭日阳刚', '旭日阳刚', '兄弟', 'http://www.yymp3.com/Songword/24/241492.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/xuriyanggang2/9.mp3', '旭日阳刚', '旭日阳刚', '等待春天', 'http://www.yymp3.com/Songword/24/241493.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/1.mp3', '张杰', '张杰', '原来你什么都不要', 'http://www.yymp3.com/Songword/23/238336.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/10.mp3', '张杰', '张杰', '她不爱我', 'http://www.yymp3.com/Songword/23/239074.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/2.mp3', '张杰', '张杰', '天空', 'http://www.yymp3.com/Songword/23/239066.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/3.mp3', '张杰', '张杰', '领悟', 'http://www.yymp3.com/Songword/23/239067.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/4.mp3', '张杰', '张杰', '突然想爱你', 'http://www.yymp3.com/Songword/23/239068.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/5.mp3', '张杰', '张杰', '夜盲症', 'http://www.yymp3.com/Songword/23/239069.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/6.mp3', '张杰', '张杰', '伤痕', 'http://www.yymp3.com/Songword/23/239070.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/7.mp3', '张杰', '张杰', '街角的祝福', 'http://www.yymp3.com/Songword/23/239071.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/8.mp3', '张杰', '张杰', '走路去纽约', 'http://www.yymp3.com/Songword/23/239072.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zhangjie10/9.mp3', '张杰', '张杰', '就算全世界与我为敌', 'http://www.yymp3.com/Songword/23/239073.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new23/zuige/6.mp3', '大海', '醉歌', '大海摇篮曲', 'http://www.yymp3.com/Songword/24/241625.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/2013xgst6/12.mp3', '邓紫棋', '邓紫棋', '你把我灌醉', 'http://www.yymp3.com/Songword/24/247599.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/baolin4/6.mp3', '痴情玫瑰花', '暴林', '为你痴情', 'http://www.yymp3.com/Songword/24/244579.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/dazhe12/5.mp3', '痴情玫瑰花', '大哲', '痴情人总是伤的深', 'http://www.yymp3.com/Songword/24/247944.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/guoling3/3.mp3', '大海', '郭玲', '花开大海', 'http://www.yymp3.com/Songword/24/246469.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/haomeimeiyd2/13.mp3', '北京欢迎你', '好妹妹乐队', '一个人的北京（钢琴版）', 'http://www.yymp3.com/Songword/24/245760.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/jianghui14/1.mp3', '远走高飞', '江蕙', '远走高飞', 'http://www.yymp3.com/Songword/24/246357.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/laomao/1.mp3', '老猫', '老猫', '哥已经爱上你啦', 'http://www.yymp3.com/Songword/24/244833.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/laomao/2.mp3', '老猫', '老猫', '你就是我最想要的人', 'http://www.yymp3.com/Songword/24/244834.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/laomao/3.mp3', '老猫', '老猫', '你是我的妞', 'http://www.yymp3.com/Songword/26/261111.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/luowencong3/5.mp3', '痴情玫瑰花', '罗文聪', '痴情汉', 'http://www.yymp3.com/Songword/24/246862.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/qijiashen/11.mp3', '北京欢迎你', '祁家琛', '北京！ (feat. 斌爸爸)', 'http://www.yymp3.com/Songword/24/246107.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/sundonger/6.mp3', '远走高飞', '孙豆尔', '远走的梦', 'http://www.yymp3.com/Songword/24/246154.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/tangtao/6.mp3', '北京欢迎你', '唐涛', '我爱北京天安门', 'http://www.yymp3.com/Songword/24/248604.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/yutianlong/2.mp3', '痴情玫瑰花', '余天龙', '痴情行船人', 'http://www.yymp3.com/Songword/24/243297.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new24/zhangxianzhe/5.mp3', '痴情玫瑰花', '张宪哲', '痴情人总是伤的深', 'http://www.yymp3.com/Songword/24/246271.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/2013ndxgst10/22.mp3', '邓紫棋', '邓紫棋', '偶尔', 'http://www.yymp3.com/Songword/25/251481.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/2013ndxgst11/132.mp3', '邓紫棋', '邓紫棋', '我的秘密', 'http://www.yymp3.com/Songword/25/252981.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/2013ndxgst11/143.mp3', '老男孩', '范宏伟', '老男人的爱', 'http://www.yymp3.com/Songword/25/257164.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/baolin5/4.mp3', '痴情玫瑰花', '暴林', '为你痴情', 'http://www.yymp3.com/Songword/25/254991.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/caoxuanbin2/1.mp3', '北京欢迎你', '曹轩宾', '你不在北京', 'http://www.yymp3.com/Songword/25/252510.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/caoxuanbin3/4.mp3', '北京欢迎你', '曹轩宾', '你不在北京 (东森--童颜美女片尾曲/纬来--火之女神片头曲)', 'http://www.yymp3.com/Songword/25/253026.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/caoxuanbin4/1.mp3', '北京欢迎你', '曹轩宾', '你不在北京（钢琴版）', 'http://www.yymp3.com/Songword/25/255918.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/caoxuanbin4/2.mp3', '北京欢迎你', '曹轩宾', '你不在北京（Piano Instrumental）', 'http://www.yymp3.com/Songword/25/255919.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/chensaijin/8.mp3', '大海', '陈赛金', '放一片大海在我们心中', 'http://www.yymp3.com/Songword/25/253404.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/cuishu2/7.mp3', '后会无期', '崔恕', '后会有期', 'http://www.yymp3.com/Songword/25/252795.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/hlhjdej/1.mp3', '痴情玫瑰花', '群星合辑', '用尽一生痴情 - 黑龙', 'http://www.yymp3.com/Songword/25/252938.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/jiaoyuyu/4.mp3', '北京欢迎你', '焦禹禹', '北京的天空重庆的雨', 'http://www.yymp3.com/Songword/25/251708.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/liaodongxxs2/2.mp3', '北京欢迎你', '辽东笑笑生', '北京冷雨夜', 'http://www.yymp3.com/Songword/25/253994.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/liumengzhe2/7.mp3', '大海', '刘孟哲', '大海啊故乡', 'http://www.yymp3.com/Songword/24/249921.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/sundonger2/5.mp3', '远走高飞', '孙豆尔', '远走的梦', 'http://www.yymp3.com/Songword/25/250098.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/tongyu/2.mp3', '大海', '佟宇', '心的大海', 'http://www.yymp3.com/Songword/25/256537.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wanglixiangn/3.mp3', '北京欢迎你', '王昱翔', '重庆到北京的路有多远', 'http://www.yymp3.com/Songword/25/256831.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wangyuanyuan/9.mp3', '大海', '王媛媛', '大海故乡', 'http://www.yymp3.com/Songword/25/254043.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse/2.mp3', '邓紫棋', '我是歌手', '泡沫 - G.E.M.邓紫棋', 'http://www.yymp3.com/Songword/25/254746.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse10/1.mp3', '邓紫棋', '我是歌手', 'Fallin - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/256802.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse10/2.mp3', '北京欢迎你', '我是歌手', '北京北京 - 韩磊', 'http://www.yymp3.com/Songword/25/256803.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse12/2.mp3', '邓紫棋', '我是歌手', '你不是真正的快乐 - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/257190.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse2/4.mp3', '我是歌手', '我是歌手', '我是真的爱你 -  张宇', 'http://www.yymp3.com/Songword/25/255024.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse2/6.mp3', '邓紫棋', '我是歌手', '存在 - 邓紫棋', 'http://www.yymp3.com/Songword/25/255026.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse3/5.mp3', '邓紫棋', '我是歌手', '你把我灌醉 - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/255282.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse4/1.mp3', '邓紫棋', '我是歌手', '我要我们在一起 - 邓紫棋', 'http://www.yymp3.com/Songword/25/255565.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse5/1.mp3', '邓紫棋', '我是歌手', 'If i were a boy - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/255639.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse5/3.mp3', '我是歌手', '我是歌手', '我是一只小小鸟 - 罗琦', 'http://www.yymp3.com/Songword/25/255641.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse6/5.mp3', '邓紫棋', '我是歌手', '喜欢你 - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/255651.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse7/6.mp3', '邓紫棋', '我是歌手', '如果没有你 - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/256016.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse8/1.mp3', '邓紫棋', '我是歌手', 'Lady Marmalade - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/25/256209.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/wsgse9/5.mp3', '邓紫棋', '我是歌手', '龙卷风 - G.E.M.邓紫棋', 'http://www.yymp3.com/Songword/25/256583.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xiafan/11.mp3', '远走高飞', '夏梵', '远走', 'http://www.yymp3.com/Songword/25/256428.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xiatianbofang/1.mp3', '远走高飞', '夏天播放', '远走（电影《艳遇丽江》主题曲）', 'http://www.yymp3.com/Songword/25/251388.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xryglg2/1.mp3', '旭日阳刚', '旭日阳刚刘刚', '还记得吗', 'http://www.yymp3.com/Songword/25/251447.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xryglg2/2.mp3', '旭日阳刚', '旭日阳刚刘刚', '这城市', 'http://www.yymp3.com/Songword/25/251448.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xryglg2/3.mp3', '旭日阳刚', '旭日阳刚刘刚', '珍惜吧', 'http://www.yymp3.com/Songword/25/251449.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xryglg3/1.mp3', '旭日阳刚', '旭日阳刚刘刚', '21楼', 'http://www.yymp3.com/Songword/25/258142.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xryglg3/2.mp3', '旭日阳刚', '旭日阳刚刘刚', '怀念青春', 'http://www.yymp3.com/Songword/25/258143.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xryglg3/3.mp3', '旭日阳刚', '旭日阳刚刘刚', '祝她幸福', 'http://www.yymp3.com/Songword/25/258144.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/10.mp3', '薛之谦', '薛之谦', '方圆几里', 'http://www.yymp3.com/Songword/25/252674.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/4.mp3', '薛之谦', '薛之谦', '你还要我怎样', 'http://www.yymp3.com/Songword/25/252668.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/5.mp3', '薛之谦', '薛之谦', '有没有', 'http://www.yymp3.com/Songword/25/252669.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/6.mp3', '薛之谦', '薛之谦', '潮流季', 'http://www.yymp3.com/Songword/25/252670.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/7.mp3', '薛之谦', '薛之谦', '等我回家', 'http://www.yymp3.com/Songword/25/252671.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/8.mp3', '薛之谦', '薛之谦', '我想起了你', 'http://www.yymp3.com/Songword/25/252672.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/xuezhiqian6/9.mp3', '薛之谦', '薛之谦', '其实', 'http://www.yymp3.com/Songword/25/252673.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/yunduo3/2.mp3', '痴情玫瑰花', '云朵', '梨山痴情花', 'http://www.yymp3.com/Songword/25/257431.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/zghsy11/6.mp3', '北京欢迎你', '中国好声音', '北京 北京 - 粱博/黄勇', 'http://www.yymp3.com/Songword/25/252381.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/zhanghua/9.mp3', '北京欢迎你', '张华', '奥运CHINA北京', 'http://www.yymp3.com/Songword/25/257847.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/zhangrui2/8.mp3', '北京欢迎你', '张睿', '北京以北', 'http://www.yymp3.com/Songword/25/253753.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/zifeng2/2.mp3', '北京欢迎你', '子枫', '北京不好混', 'http://www.yymp3.com/Songword/25/252099.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new25/zifeng2/21.mp3', '北京欢迎你', '子枫', '北京难混', 'http://www.yymp3.com/Songword/25/252118.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/2014ndxgst7/149.mp3', '筷子兄弟', '筷子兄弟', '每个人都看到了希望', 'http://www.yymp3.com/Songword/26/260464.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/2014ndxgst7/84.mp3', '后会无期', '邓紫棋', '后会无期', 'http://www.yymp3.com/Songword/26/260241.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/2014ndxgst7/84.mp3', '邓紫棋', '邓紫棋', '后会无期', 'http://www.yymp3.com/Songword/26/260241.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/2014ndxgst8/71.mp3', '邓紫棋', '邓紫棋', '心的节奏', 'http://www.yymp3.com/Songword/26/261065.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/chenxuedong/1.mp3', '陈学冬', '陈学冬', '不再见', 'http://www.yymp3.com/Songword/26/260326.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/chenxuedong/2.mp3', '陈学冬', '陈学冬', '岁月缝花', 'http://www.yymp3.com/Songword/26/264758.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/chenxuedong/3.mp3', '陈学冬', '陈学冬', '我们都一样', 'http://www.yymp3.com/Songword/26/264759.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/1.mp3', '邓紫棋', '邓紫棋', '喜欢你', 'http://www.yymp3.com/Songword/26/261491.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/2.mp3', '邓紫棋', '邓紫棋', '龙卷风', 'http://www.yymp3.com/Songword/26/263021.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/3.mp3', '邓紫棋', '邓紫棋', '单行的轨道', 'http://www.yymp3.com/Songword/26/264602.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/4.mp3', '邓紫棋', '邓紫棋', '瞬间', 'http://www.yymp3.com/Songword/26/264909.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/5.mp3', '邓紫棋', '邓紫棋', '新的心跳', 'http://www.yymp3.com/Songword/26/264910.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/6.mp3', '邓紫棋', '邓紫棋', '多远都要在一起', 'http://www.yymp3.com/Songword/26/264911.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/7.mp3', '邓紫棋', '邓紫棋', '一路逆风', 'http://www.yymp3.com/Songword/26/265096.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dengziqi6/8.mp3', '邓紫棋', '邓紫棋', '再见', 'http://www.yymp3.com/Songword/26/265097.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/dingzi2/1.mp3', '北京欢迎你', '丁紫', '在北京', 'http://www.yymp3.com/Songword/26/261226.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/1.mp3', '后会无期', '后会无期', '东极岛岛歌（电影《后会无期》主题曲） - 上海音乐学院学生', 'http://www.yymp3.com/Songword/26/260791.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/2.mp3', '后会无期', '后会无期', '后会无期（电影《后会无期》同名主题歌） - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/26/260792.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/2.mp3', '邓紫棋', '后会无期', '后会无期（电影《后会无期》同名主题歌） - G.E.M. 邓紫棋', 'http://www.yymp3.com/Songword/26/260792.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/3.mp3', '后会无期', '后会无期', '平凡之路（电影《后会无期》主题曲）- 朴树', 'http://www.yymp3.com/Songword/26/260793.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/4.mp3', '后会无期', '后会无期', '女儿情（电影《后会无期》插曲）- 万晓利', 'http://www.yymp3.com/Songword/26/260794.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/5.mp3', '后会无期', '后会无期', '旅行（电影《后会无期》插曲）- 许巍', 'http://www.yymp3.com/Songword/26/260795.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/hhwq/6.mp3', '后会无期', '后会无期', '追梦（电影《后会无期》插曲）- 朱茵', 'http://www.yymp3.com/Songword/26/260796.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/kuaizixd2/1.mp3', '筷子兄弟', '筷子兄弟', '我从来没去过纽约', 'http://www.yymp3.com/Songword/25/259164.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/kuaizixd2/2.mp3', '筷子兄弟', '筷子兄弟', '你一定会成功', 'http://www.yymp3.com/Songword/25/259997.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/kuaizixd2/3.mp3', '筷子兄弟', '筷子兄弟', '猛龙过江', 'http://www.yymp3.com/Songword/26/260272.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/kuaizixd2/4.mp3', '筷子兄弟', '筷子兄弟', '小苹果', 'http://www.yymp3.com/Songword/26/260351.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/lufei/1.mp3', '周杰伦', '路飞', '我不是周杰伦', 'http://www.yymp3.com/Songword/25/259593.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/sunmengnan/1.mp3', '北京欢迎你', '孙梦楠', '北京热', 'http://www.yymp3.com/Songword/26/262254.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/tony6/1.mp3', '北京欢迎你', '汤潮', '漂在北京', 'http://www.yymp3.com/Songword/25/258845.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae8/1.mp3', '许嵩', '许嵩', '七夕', 'http://www.yymp3.com/Songword/26/260915.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/1.mp3', '许嵩', '许嵩', '山水之间', 'http://www.yymp3.com/Songword/26/261622.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/2.mp3', '许嵩', '许嵩', '宇宙之大', 'http://www.yymp3.com/Songword/26/261623.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/3.mp3', '许嵩', '许嵩', '隐隐约约', 'http://www.yymp3.com/Songword/26/261624.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/4.mp3', '许嵩', '许嵩', '惊鸿一面', 'http://www.yymp3.com/Songword/26/261625.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/5.mp3', '许嵩', '许嵩', '弹指一挥间', 'http://www.yymp3.com/Songword/26/261626.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/6.mp3', '许嵩', '许嵩', '七夕', 'http://www.yymp3.com/Songword/26/261627.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/7.mp3', '许嵩', '许嵩', '等到烟火清凉', 'http://www.yymp3.com/Songword/26/261628.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/8.mp3', '许嵩', '许嵩', '梧桐灯', 'http://www.yymp3.com/Songword/26/261629.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/Vae9/9.mp3', '许嵩', '许嵩', '有桃花', 'http://www.yymp3.com/Songword/26/261630.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/wulantuya15/11.mp3', '北京欢迎你', '乌兰图雅', '站在草原望北京', 'http://www.yymp3.com/Songword/26/261273.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/wutianxiong/2.mp3', '大海', '吴天雄', '说给大海', 'http://www.yymp3.com/Songword/26/261699.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/xujiaying4/10.mp3', '徐佳莹', '徐佳莹', '别怕', 'http://www.yymp3.com/Songword/25/259510.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/xujiaying4/11.mp3', '徐佳莹', '徐佳莹', '只剩一分钟', 'http://www.yymp3.com/Songword/25/259511.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/xujiaying4/9.mp3', '徐佳莹', '徐佳莹', '耳边风', 'http://www.yymp3.com/Songword/25/259509.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new26/xuyiming3/11.mp3', '远走高飞', '徐一鸣', '我要带你远走高飞', 'http://www.yymp3.com/Songword/26/262182.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/atj/6.mp3', '北京欢迎你', '阿吉太', '北京欢迎你', 'http://www.yymp3.com/Songword/26/266575.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/chenxuedong2/1.mp3', '陈学冬', '陈学冬', '人间沙', 'http://www.yymp3.com/Songword/26/267181.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/chenxuedong2/2.mp3', '陈学冬', '陈学冬', '碎碎恋', 'http://www.yymp3.com/Songword/26/267182.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/dazhuan/1.mp3', '大壮', '大壮', '我们不一样', 'http://www.yymp3.com/Songword/26/268411.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/dazhuan/2.mp3', '大壮', '大壮', '差一步', 'http://www.yymp3.com/Songword/26/268412.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/dengziqi7/1.mp3', '邓紫棋', '邓紫棋', '给你的歌', 'http://www.yymp3.com/Songword/26/266493.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/dengziqi7/2.mp3', '邓紫棋', '邓紫棋', '有心人', 'http://www.yymp3.com/Songword/26/266494.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/dengziqi7/3.mp3', '北京欢迎你', '邓紫棋', '北京北京', 'http://www.yymp3.com/Songword/26/266495.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/dengziqi7/3.mp3', '邓紫棋', '邓紫棋', '北京北京', 'http://www.yymp3.com/Songword/26/266495.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/hongfei/1.mp3', '痴情玫瑰花', '鸿飞', '爱的痴情人', 'http://www.yymp3.com/Songword/26/263032.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/jinzhiwen3/1.mp3', '徐佳莹', '金志文', '远走高飞 - 金志文 徐佳莹', 'http://www.yymp3.com/Songword/26/268384.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/jinzhiwen3/1.mp3', '远走高飞', '金志文', '远走高飞 - 金志文 徐佳莹', 'http://www.yymp3.com/Songword/26/268384.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/jinzhiwen3/2.mp3', '远走高飞', '金志文', '远走高飞', 'http://www.yymp3.com/Songword/26/268385.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/kuaizixd3//1.mp3', '筷子兄弟', '筷子兄弟', '小水果', 'http://www.yymp3.com/Songword/26/264705.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/kuaizixd3//2.mp3', '筷子兄弟', '筷子兄弟', '最炫小苹果', 'http://www.yymp3.com/Songword/26/264706.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/kuaizixd3//3.mp3', '筷子兄弟', '筷子兄弟', '奔跑吧兄弟', 'http://www.yymp3.com/Songword/26/264707.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/1.mp3', '老猫', '老猫', '就要你红', 'http://www.yymp3.com/Songword/26/268244.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/10.mp3', '老猫', '老猫', '姑娘我铁了心跟着你啦 - 老猫 龙梅子', 'http://www.yymp3.com/Songword/26/268253.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/11.mp3', '老猫', '老猫', '新成吉思汗 - 老猫 李凯年', 'http://www.yymp3.com/Songword/26/268254.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/12.mp3', '老猫', '老猫', '噢啦 - 老猫 项一芯', 'http://www.yymp3.com/Songword/26/268255.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/13.mp3', '老猫', '老猫', '因为铂乐 - 王蓉 老猫', 'http://www.yymp3.com/Songword/26/268256.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/14.mp3', '老猫', '老猫', '牛叉本命年 - 龙梅子 老猫', 'http://www.yymp3.com/Songword/26/268257.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/15.mp3', '老猫', '老猫', '燃烧吧蔬菜', 'http://www.yymp3.com/Songword/26/268258.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/2.mp3', '老猫', '老猫', '大叔不卖我香蕉 - 龙梅子 老猫', 'http://www.yymp3.com/Songword/26/268245.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/3.mp3', '老猫', '老猫', '超能太监', 'http://www.yymp3.com/Songword/26/268246.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/4.mp3', '老猫', '老猫', '八块腹肌 - 老猫 杨望', 'http://www.yymp3.com/Songword/26/268247.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/5.mp3', '老猫', '老猫', '小姐小姐 你真美 - 老猫 龙者组合', 'http://www.yymp3.com/Songword/26/268248.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/6.mp3', '老猫', '老猫', '好妈妈 - 俪媛 老猫', 'http://www.yymp3.com/Songword/26/268249.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/7.mp3', '老猫', '老猫', '许Sir思密达 - 王麟 老猫', 'http://www.yymp3.com/Songword/26/268250.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/8.mp3', '老猫', '老猫', '女朋友 - 老猫 王蓉', 'http://www.yymp3.com/Songword/26/268251.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/laomao2/9.mp3', '老猫', '老猫', '走天涯 - 老猫 杨望', 'http://www.yymp3.com/Songword/26/268252.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liaoqianqian2/6.mp3', '北京欢迎你', '廖芊芊', '北京梦', 'http://www.yymp3.com/Songword/26/265656.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/1.mp3', '六哲', '六哲', '不知道为什么', 'http://www.yymp3.com/Songword/26/264825.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/10.mp3', '六哲', '六哲', '一个承诺', 'http://www.yymp3.com/Songword/26/264834.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/2.mp3', '六哲', '六哲', '孤独', 'http://www.yymp3.com/Songword/26/264826.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/3.mp3', '六哲', '六哲', '叫我怎么忘了过去', 'http://www.yymp3.com/Songword/26/264827.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/4.mp3', '六哲', '六哲', '今生欠你的一切', 'http://www.yymp3.com/Songword/26/264828.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/5.mp3', '六哲', '六哲', '苦苦挽留', 'http://www.yymp3.com/Songword/26/264829.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/6.mp3', '六哲', '六哲', '如果彼此都狠不下心', 'http://www.yymp3.com/Songword/26/264830.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/7.mp3', '六哲', '六哲', '甜言蜜语', 'http://www.yymp3.com/Songword/26/264831.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/8.mp3', '六哲', '六哲', '眼泪最懂', 'http://www.yymp3.com/Songword/26/264832.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe3/9.mp3', '六哲', '六哲', '一段回忆', 'http://www.yymp3.com/Songword/26/264833.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/1.mp3', '六哲', '六哲', '不苦的爱情', 'http://www.yymp3.com/Songword/26/264835.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/10.mp3', '六哲', '六哲', '错过的幸福', 'http://www.yymp3.com/Songword/26/264844.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/11.mp3', '六哲', '六哲', '新单身情歌', 'http://www.yymp3.com/Songword/26/264845.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/12.mp3', '六哲', '六哲', '算了吧', 'http://www.yymp3.com/Songword/26/268282.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/13.mp3', '六哲', '六哲', '放下那个我不爱的人', 'http://www.yymp3.com/Songword/26/268283.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/14.mp3', '六哲', '六哲', '让全世界知道我爱你', 'http://www.yymp3.com/Songword/26/268284.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/2.mp3', '六哲', '六哲', '朋友名义', 'http://www.yymp3.com/Songword/26/264836.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/3.mp3', '六哲', '六哲', '谁会记得', 'http://www.yymp3.com/Songword/26/264837.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/4.mp3', '六哲', '六哲', '最美的回忆', 'http://www.yymp3.com/Songword/26/264838.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/5.mp3', '六哲', '六哲', '一生逍遥', 'http://www.yymp3.com/Songword/26/264839.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/6.mp3', '六哲', '六哲', '什么都不想说', 'http://www.yymp3.com/Songword/26/264840.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/7.mp3', '六哲', '六哲', '爱情迷宫 - 袁惜君', 'http://www.yymp3.com/Songword/26/264841.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/8.mp3', '六哲', '六哲', '悲伤失落感 - 钟明艺', 'http://www.yymp3.com/Songword/26/264842.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liuzhe4/9.mp3', '六哲', '六哲', '爱过的每一天', 'http://www.yymp3.com/Songword/26/264843.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/lixiaojie3/12.mp3', '远走高飞', '李晓杰', '远走高飞', 'http://www.yymp3.com/Songword/26/268175.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Liyugang4/1.mp3', '李玉刚', '李玉刚', '李', 'http://www.yymp3.com/Songword/26/266980.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Liyugang4/3.mp3', '李玉刚', '李玉刚', '国色天香 - 李玉刚 孔东东', 'http://www.yymp3.com/Songword/26/266982.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/10.mp3', '李玉刚', '李玉刚', '葬心', 'http://www.yymp3.com/Songword/26/266992.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/11.mp3', '李玉刚', '李玉刚', '昭君出塞', 'http://www.yymp3.com/Songword/26/266993.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/12.mp3', '李玉刚', '李玉刚', '最重是情义', 'http://www.yymp3.com/Songword/26/266994.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/13.mp3', '李玉刚', '李玉刚', '好人好梦', 'http://www.yymp3.com/Songword/26/266995.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/14.mp3', '李玉刚', '李玉刚', '菊花台', 'http://www.yymp3.com/Songword/26/266996.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/2.mp3', '李玉刚', '李玉刚', '霓裳衣舞', 'http://www.yymp3.com/Songword/26/266984.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/3.mp3', '李玉刚', '李玉刚', '你怎么说', 'http://www.yymp3.com/Songword/26/266985.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/4.mp3', '李玉刚', '李玉刚', '女儿情', 'http://www.yymp3.com/Songword/26/266986.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/5.mp3', '李玉刚', '李玉刚', '绒花', 'http://www.yymp3.com/Songword/26/266987.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/6.mp3', '李玉刚', '李玉刚', '盛世霓裳', 'http://www.yymp3.com/Songword/26/266988.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/7.mp3', '李玉刚', '李玉刚', '斯卡布罗集市', 'http://www.yymp3.com/Songword/26/266989.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/8.mp3', '李玉刚', '李玉刚', '游园惊梦', 'http://www.yymp3.com/Songword/26/266990.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang5/9.mp3', '李玉刚', '李玉刚', '葬花吟咏', 'http://www.yymp3.com/Songword/26/266991.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/1.mp3', '李玉刚', '李玉刚', '公主岭', 'http://www.yymp3.com/Songword/26/268448.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/10.mp3', '李玉刚', '李玉刚', '梨花颂', 'http://www.yymp3.com/Songword/26/268457.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/2.mp3', '李玉刚', '李玉刚', '李', 'http://www.yymp3.com/Songword/26/268449.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/3.mp3', '李玉刚', '李玉刚', '长安故事', 'http://www.yymp3.com/Songword/26/268450.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/4.mp3', '李玉刚', '李玉刚', '送别', 'http://www.yymp3.com/Songword/26/268451.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/5.mp3', '李玉刚', '李玉刚', '新贵妃醉酒', 'http://www.yymp3.com/Songword/26/268452.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/6.mp3', '李玉刚', '李玉刚', '刚好遇见你', 'http://www.yymp3.com/Songword/26/268453.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/7.mp3', '李玉刚', '李玉刚', '清明上河图', 'http://www.yymp3.com/Songword/26/268454.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/8.mp3', '李玉刚', '李玉刚', '雨花石', 'http://www.yymp3.com/Songword/26/268455.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/liyugang6/9.mp3', '李玉刚', '李玉刚', '逐梦令', 'http://www.yymp3.com/Songword/26/268456.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/longmeizi6/18.mp3', '老猫', '龙梅子/老猫', '漂亮的姑娘就要嫁人啦', 'http://www.yymp3.com/Songword/26/262765.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/longmeizi8/10.mp3', '痴情玫瑰花', '龙梅子', '红尘自有痴情人', 'http://www.yymp3.com/Songword/26/266443.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/longmeizi9/2.mp3', '老猫', '龙梅子', '你的哈 - 老猫 龙梅子', 'http://www.yymp3.com/Songword/26/268364.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/longmeizi9/5.mp3', '老猫', '龙梅子', '厉害厉害了 - 老猫 龙梅子', 'http://www.yymp3.com/Songword/26/268367.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/lugengxudy/4.mp3', '大海', '卢庚戌', '面朝大海 - 卢庚戌', 'http://www.yymp3.com/Songword/26/263486.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/qilong5/12.mp3', '北京欢迎你', '祁隆', '跳到北京', 'http://www.yymp3.com/Songword/26/265062.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/tony7/5.mp3', '北京欢迎你', '汤潮', '漂在北京', 'http://www.yymp3.com/Songword/26/265590.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/UnderLover/3.mp3', '痴情玫瑰花', 'Under Lover', '痴情玫瑰花', 'http://www.yymp3.com/Songword/26/268488.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae10/1.mp3', '许嵩', '许嵩', '雅俗共赏', 'http://www.yymp3.com/Songword/26/266473.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae11/1.mp3', '许嵩', '许嵩', '最佳歌手', 'http://www.yymp3.com/Songword/26/266777.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae11/2.mp3', '许嵩', '许嵩', '书香年华', 'http://www.yymp3.com/Songword/26/266778.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae11/3.mp3', '许嵩', '许嵩', '燕归巢', 'http://www.yymp3.com/Songword/26/266779.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae11/4.mp3', '许嵩', '许嵩', '不语', 'http://www.yymp3.com/Songword/26/266780.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae11/5.mp3', '许嵩', '许嵩', '摄影艺术', 'http://www.yymp3.com/Songword/26/266830.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/1.mp3', '许嵩', '许嵩', '奇谈', 'http://www.yymp3.com/Songword/26/266955.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/2.mp3', '许嵩', '许嵩', '雅俗共赏', 'http://www.yymp3.com/Songword/26/266956.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/3.mp3', '许嵩', '许嵩', '最佳歌手', 'http://www.yymp3.com/Songword/26/266957.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/4.mp3', '许嵩', '许嵩', '幻胖', 'http://www.yymp3.com/Songword/26/266958.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/5.mp3', '许嵩', '许嵩', '摄影艺术', 'http://www.yymp3.com/Songword/26/266959.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/6.mp3', '许嵩', '许嵩', '平行宇宙', 'http://www.yymp3.com/Songword/26/266960.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/7.mp3', '许嵩', '许嵩', '燕归巢', 'http://www.yymp3.com/Songword/26/266961.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/8.mp3', '许嵩', '许嵩', '摆脱', 'http://www.yymp3.com/Songword/26/266962.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae12/9.mp3', '许嵩', '许嵩', '早睡身体好', 'http://www.yymp3.com/Songword/26/266963.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/Vae13/1.mp3', '许嵩', '许嵩', '今年勇', 'http://www.yymp3.com/Songword/26/268242.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/wangrong8/4.mp3', '老猫', '王蓉', '叶问 - 王蓉 老猫 杨望', 'http://www.yymp3.com/Songword/26/267812.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/wmdg/1.mp3', '北京欢迎你', '群星合辑', '流浪在北京', 'http://www.yymp3.com/Songword/26/263944.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/1.mp3', '薛之谦', '薛之谦', '初学者', 'http://www.yymp3.com/Songword/26/267091.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/10.mp3', '薛之谦', '薛之谦', '下雨了', 'http://www.yymp3.com/Songword/26/267100.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/2.mp3', '薛之谦', '薛之谦', '刚刚好', 'http://www.yymp3.com/Songword/26/267092.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/3.mp3', '薛之谦', '薛之谦', '我好像在哪见过你', 'http://www.yymp3.com/Songword/26/267093.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/4.mp3', '薛之谦', '薛之谦', '演员', 'http://www.yymp3.com/Songword/26/267094.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/5.mp3', '薛之谦', '薛之谦', '绅士', 'http://www.yymp3.com/Songword/26/267095.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/6.mp3', '薛之谦', '薛之谦', '一半', 'http://www.yymp3.com/Songword/26/267096.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/7.mp3', '薛之谦', '薛之谦', '小孩', 'http://www.yymp3.com/Songword/26/267097.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/8.mp3', '薛之谦', '薛之谦', 'Stay Here', 'http://www.yymp3.com/Songword/26/267098.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian7/9.mp3', '薛之谦', '薛之谦', '花儿和少年', 'http://www.yymp3.com/Songword/26/267099.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/1.mp3', '薛之谦', '薛之谦', '狐狸', 'http://www.yymp3.com/Songword/26/268432.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/10.mp3', '薛之谦', '薛之谦', '高尚', 'http://www.yymp3.com/Songword/26/268441.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/2.mp3', '薛之谦', '薛之谦', '背过手', 'http://www.yymp3.com/Songword/26/268433.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/3.mp3', '薛之谦', '薛之谦', '骆驼', 'http://www.yymp3.com/Songword/26/268434.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/4.mp3', '薛之谦', '薛之谦', '渡', 'http://www.yymp3.com/Songword/26/268435.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/5.mp3', '薛之谦', '薛之谦', '像风一样', 'http://www.yymp3.com/Songword/26/268436.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/6.mp3', '薛之谦', '薛之谦', '别', 'http://www.yymp3.com/Songword/26/268437.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/7.mp3', '薛之谦', '薛之谦', '我害怕', 'http://www.yymp3.com/Songword/26/268438.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/8.mp3', '薛之谦', '薛之谦', '暧昧', 'http://www.yymp3.com/Songword/26/268439.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xuezhiqian8/9.mp3', '薛之谦', '薛之谦', '动物世界', 'http://www.yymp3.com/Songword/26/268440.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying5/1.mp3', '徐佳莹', '徐佳莹', '遗忘之前', 'http://www.yymp3.com/Songword/26/266216.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying7/1.mp3', '徐佳莹', '徐佳莹', '我所需要的', 'http://www.yymp3.com/Songword/26/266771.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying7/2.mp3', '徐佳莹', '徐佳莹', '潇洒走一回', 'http://www.yymp3.com/Songword/26/266772.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying7/3.mp3', '徐佳莹', '徐佳莹', '女人花', 'http://www.yymp3.com/Songword/26/266773.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying7/4.mp3', '徐佳莹', '徐佳莹', '大雨将至', 'http://www.yymp3.com/Songword/26/266774.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying7/5.mp3', '徐佳莹', '徐佳莹', '小公主', 'http://www.yymp3.com/Songword/26/266775.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying7/6.mp3', '徐佳莹', '徐佳莹', '心动', 'http://www.yymp3.com/Songword/26/266776.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying8/1.mp3', '徐佳莹', '徐佳莹', '当我找到了你', 'http://www.yymp3.com/Songword/26/267724.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying8/2.mp3', '徐佳莹', '徐佳莹', '不要再孤单', 'http://www.yymp3.com/Songword/26/267725.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying8/3.mp3', '徐佳莹', '徐佳莹', '湫兮如风', 'http://www.yymp3.com/Songword/26/267726.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying8/4.mp3', '徐佳莹', '徐佳莹', '格斗场', 'http://www.yymp3.com/Songword/26/267727.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/1.mp3', '徐佳莹', '徐佳莹', '言不由衷', 'http://www.yymp3.com/Songword/26/268416.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/10.mp3', '徐佳莹', '徐佳莹', '心里学', 'http://www.yymp3.com/Songword/26/268425.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/11.mp3', '徐佳莹', '徐佳莹', '是日救星', 'http://www.yymp3.com/Songword/26/268426.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/2.mp3', '徐佳莹', '徐佳莹', '灰色', 'http://www.yymp3.com/Songword/26/268417.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/3.mp3', '徐佳莹', '徐佳莹', '到此为止', 'http://www.yymp3.com/Songword/26/268418.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/4.mp3', '徐佳莹', '徐佳莹', '记得带走', 'http://www.yymp3.com/Songword/26/268419.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/5.mp3', '徐佳莹', '徐佳莹', '病人', 'http://www.yymp3.com/Songword/26/268420.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/6.mp3', '徐佳莹', '徐佳莹', '现在不跳舞要干嘛', 'http://www.yymp3.com/Songword/26/268421.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/7.mp3', '徐佳莹', '徐佳莹', '大头仔', 'http://www.yymp3.com/Songword/26/268422.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/8.mp3', '徐佳莹', '徐佳莹', '儿歌', 'http://www.yymp3.com/Songword/26/268423.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/xujiaying9/9.mp3', '徐佳莹', '徐佳莹', '人啊', 'http://www.yymp3.com/Songword/26/268424.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/yanni/7.mp3', '北京欢迎你', '燕妮', '故乡是北京', 'http://www.yymp3.com/Songword/26/263451.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/yeruofan/3.mp3', '痴情玫瑰花', '叶诺帆', '痴情拿铁', 'http://www.yymp3.com/Songword/26/266500.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/yztstshct2/10.mp3', '大海', '亚洲天使童声合唱团', '大海啊，故乡', 'http://www.yymp3.com/Songword/26/265876.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhangbichen2/8.mp3', '后会无期', '张碧晨', '后会无期(Live)', 'http://www.yymp3.com/Songword/26/267034.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhangjie12/1.mp3', '张杰', '张杰', 'Give You My World', 'http://www.yymp3.com/Songword/26/267902.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhangjie12/2.mp3', '张杰', '张杰', 'Lost in the Stars', 'http://www.yymp3.com/Songword/26/267903.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhangjie12/3.mp3', '张杰', '张杰', '娑婆世界', 'http://www.yymp3.com/Songword/26/267904.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhangjie12/4.mp3', '张杰', '张杰', '一念之间', 'http://www.yymp3.com/Songword/26/267905.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhaolei2/10.mp3', '北京欢迎你', '赵雷', '北京的冬天', 'http://www.yymp3.com/Songword/26/263917.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhaolei2/11.mp3', '成都', '赵雷', '成都', 'http://www.yymp3.com/Songword/26/267065.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new27/zhugang/5.mp3', '北京欢迎你', '朱刚', '北京', 'http://www.yymp3.com/Songword/26/265560.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new3/liujialiang5/8.mp3', '远走高飞', '刘嘉亮', '爱远走', 'http://www.yymp3.com/Songword/9/93568.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new7/bandari5/7.mp3', '远走高飞', 'Bandari', '风车远走高飞', 'http://www.yymp3.com/Songword/10/101665.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new8/BonnyJ/12.mp3', '大海', 'Bonny J', '大海', 'http://www.yymp3.com/Songword/11/113584.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new8/BonnyJ/3.mp3', '大海', 'Bonny J', '大海', 'http://www.yymp3.com/Songword/11/113575.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new8/qigongzhu4/9.mp3', '大海', '七公主', '大海', 'http://www.yymp3.com/Songword/11/114712.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/szqtjdwdx/16.mp3', '远走高飞', '港台群星', '林忆莲 - 远走高飞', 'http://www.yymp3.com/Songword/11/115393.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/wxwstxh/10.mp3', '薛之谦', '内地群星', '认真的雪 - 薛之谦', 'http://www.yymp3.com/Songword/11/117918.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/wxwstxh/13.mp3', '薛之谦', '内地群星', '我的Show - 薛之谦/君君', 'http://www.yymp3.com/Songword/11/117921.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/wxwstxh/6.mp3', '薛之谦', '内地群星', '人人都想要 - 薛之谦/君君', 'http://www.yymp3.com/Songword/11/117914.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/xiaohei/4.mp3', '痴情玫瑰花', '小黑', '痴情', 'http://www.yymp3.com/Songword/11/117798.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/yanfei/1.mp3', '后会无期', '伊琳', '后会有期', 'http://www.yymp3.com/Songword/12/123187.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/yanfei/4.mp3', '后会无期', '伊琳', '后会有期(慢摇版)', 'http://www.yymp3.com/Songword/12/123190.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/new9/zhengjun7/10.mp3', '老男孩', '郑钧', 'Old Boy 老男孩', 'http://www.yymp3.com/Songword/11/117173.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/yymp3/01cn/03new/lianlian/008.mp3', '远走高飞', '刘嘉亮', '爱远走', 'http://www.yymp3.com/Songword/3/36145.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/yymp3/01cn/03new/lishengjie1/004.mp3', '远走高飞', '李圣杰', '远走高飞', 'http://www.yymp3.com/Songword/3/36382.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/yymp3/01cn/04new/lina/015.mp3', '远走高飞', '李娜', '爱远走', 'http://www.yymp3.com/Songword/4/41958.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/yymp3/01cn/04new/suyun/005.mp3', '大海', '苏云', '大海', 'http://www.yymp3.com/Songword/3/39235.htm');
INSERT INTO `pachong` VALUES ('http://ting666.yymp3.com:86/yymp3/01cn/04new/zhangjie/002.mp3', '张杰', '张杰', '爱的奇迹 - 张杰/许慧欣', 'http://www.yymp3.com/Songword/4/40152.htm');

-- ----------------------------
-- Table structure for pachongflag
-- ----------------------------
DROP TABLE IF EXISTS `pachongflag`;
CREATE TABLE `pachongflag` (
  `keyword` varchar(20) NOT NULL,
  `flag` enum('yes','no') NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pachongflag
-- ----------------------------
INSERT INTO `pachongflag` VALUES ('五星红旗', 'yes');
INSERT INTO `pachongflag` VALUES ('六哲', 'yes');
INSERT INTO `pachongflag` VALUES ('北京欢迎你', 'yes');
INSERT INTO `pachongflag` VALUES ('后会无期', 'yes');
INSERT INTO `pachongflag` VALUES ('周杰伦', 'yes');
INSERT INTO `pachongflag` VALUES ('大壮', 'yes');
INSERT INTO `pachongflag` VALUES ('大海', 'yes');
INSERT INTO `pachongflag` VALUES ('张杰', 'yes');
INSERT INTO `pachongflag` VALUES ('徐佳莹', 'yes');
INSERT INTO `pachongflag` VALUES ('成都', 'yes');
INSERT INTO `pachongflag` VALUES ('旭日阳刚', 'yes');
INSERT INTO `pachongflag` VALUES ('李玉刚', 'yes');
INSERT INTO `pachongflag` VALUES ('痴情玫瑰花', 'yes');
INSERT INTO `pachongflag` VALUES ('筷子兄弟', 'yes');
INSERT INTO `pachongflag` VALUES ('老猫', 'yes');
INSERT INTO `pachongflag` VALUES ('老男孩', 'yes');
INSERT INTO `pachongflag` VALUES ('薛之谦', 'yes');
INSERT INTO `pachongflag` VALUES ('许嵩', 'yes');
INSERT INTO `pachongflag` VALUES ('远走高飞', 'yes');
INSERT INTO `pachongflag` VALUES ('邓紫棋', 'yes');
INSERT INTO `pachongflag` VALUES ('陈学冬', 'yes');

-- ----------------------------
-- Table structure for recorder_info
-- ----------------------------
DROP TABLE IF EXISTS `recorder_info`;
CREATE TABLE `recorder_info` (
  `recorder_id` int(11) NOT NULL AUTO_INCREMENT,
  `recorder_name` varchar(255) NOT NULL,
  `singer_id` int(11) NOT NULL,
  `recorder_time` int(11) DEFAULT NULL,
  `recorder_desc` text NOT NULL,
  `recorder_img` varchar(255) NOT NULL,
  `wav_url` varchar(255) NOT NULL,
  PRIMARY KEY (`recorder_id`),
  KEY `singer_id` (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recorder_info
-- ----------------------------
INSERT INTO `recorder_info` VALUES ('8', '2008vs2018：这十年，你的音乐品味变了吗？', '10000018', '731', '今天是2018年12月28日，距离新年，只剩下3天。前些天潇洒在办公室里，听到了身边一群年老色衰的80后、90后们一边感慨他们逝去的时光和青春容颜，一边唱了唱当年风靡全中国的那些经典华语流行乐。随便一开口，都是满满的青春。\r\n\r\n不知道你们有没有发现，就算是在2018年的今天，你们去KTV的时候，最经常点的，还是十年前的那些经典的歌？\r\n\r\n那时候飞轮海还没解散，五月天阿信还没变胖，张韶涵还没隐退，潘玮柏还是潘帅，选秀比赛正在经历最黄金的年代，华语乐团也正在经历着最巅峰的鼎盛时代。\r\n与此同时，时光倒流到十年前，2008的中国，也经历了很多：北京奥运，汶川地震，无一不让经历过的我们，深深铭记。\r\n\r\n都说音乐是对时光最好的记录。今天潇洒带大家，从2018走回2008，看看这十年，我们的音乐品味，都有什么变化。', '109951163754360444.jpg', 'recorder/wav/8.mp3');
INSERT INTO `recorder_info` VALUES ('9', '第4期 | 跨年特别节目：新世界', '10000018', '1719', '介绍： 2018年的结尾和2019年的开头\r\n并不一定都要轰轰烈烈\r\n但务必像华晨宇一样 从从容容\r\n转身矗立山峰\r\n愿新年的第一轮日出可以照亮你\r\n照亮一个新世界\r\n\r\n【本期节目制作】\r\n文案：四岁\r\n主播：爷爷\r\n片头：火星兔子\r\n剪辑：\r\n美工：婴宁宁\r\n微信公众号「FM08042 同步更新电台内容', '109951163752905752.jpg', 'recorder/wav/9.mp3');
INSERT INTO `recorder_info` VALUES ('10', '90后创作精灵－白安', '10000018', '3298', '介绍： 白安是近来台湾女声里声线最独特的一位，全创作的歌手，记录着这位90后女生对生活的感悟。她的真实和从容，让我们两位大叔在聊天中有不断的冲撞和思考，邀请大家来感受下这位魅力女声。。', '109951163754420348.jpg', 'recorder/wav/10.mp3');
INSERT INTO `recorder_info` VALUES ('11', '曹操（Cover:林俊杰）', '10000018', '235', '介绍： 曹操', '109951163753401004.jpg', 'recorder/wav/11.mp3');
INSERT INTO `recorder_info` VALUES ('12', '第203期：幸福ing', '10000018', '1339', '介绍： 这是一个幸福周\r\n有林陪伴的第n个快乐圣诞节\r\n回忆和自己对话的故事\r\n在千千万万的期待中新作如约而至\r\n时隔四年，故地重游走进新地球\r\n新的一年，圣所2.0的呼唤\r\n二巡启航，幸福依然在继续', '109951163752968193.jpg', 'recorder/wav/12.mp3');
INSERT INTO `recorder_info` VALUES ('13', '不染（cover毛不易）', '10000018', '32', '介绍： 不愿染是与非\r\n怎料事与愿违\r\n心中的花枯萎时光他去不回\r\n回忆辗转来回\r\n痛不过这心扉\r\n愿只愿余生无悔随花香远飞', '109951163733801995.jpg', 'recorder/wav/13.mp3');
INSERT INTO `recorder_info` VALUES ('14', '《来电狂响》：要相信你自己，也相信你爱的那个人。', '10000018', '666', '介绍： 听她的声音，会上瘾。', '109951163753379901.jpg', 'recorder/wav/14.mp3');
INSERT INTO `recorder_info` VALUES ('15', '\r\nLI - 抖音小助手 mix&sky\r\n\r\nLI - 抖音小助手 mix&sky\r\nLI - 抖音小助手 mix&sky', '10000018', '44', '介绍： 依旧是抖音出炉音乐，喜欢就点个赞加个关注哦~有需要上传音乐均可私信我 有空都会上传电台哦~ 在我电台下载然后直接放在自己电台的丝格玛哦', '109951163757072718.jpg', 'recorder/wav/15.mp3');
INSERT INTO `recorder_info` VALUES ('99', 'sdxafcdxzcfdsa', '10000018', '0', 'ddcfbfgsd', '1557374626723.png', 'recorder/wav/99.wav');

-- ----------------------------
-- Table structure for recorder_playing
-- ----------------------------
DROP TABLE IF EXISTS `recorder_playing`;
CREATE TABLE `recorder_playing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_name` varchar(255) NOT NULL,
  `_desc` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `username` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recorder_playing
-- ----------------------------
INSERT INTO `recorder_playing` VALUES ('5', 'dsaadasd', 'dsaxszdsaf', '1557374433352.png', '10000018', '100000181557374433356');

-- ----------------------------
-- Table structure for singer_info
-- ----------------------------
DROP TABLE IF EXISTS `singer_info`;
CREATE TABLE `singer_info` (
  `singer_id` int(20) NOT NULL AUTO_INCREMENT,
  `singer_name` varchar(10) NOT NULL,
  `singer_borndate` datetime NOT NULL DEFAULT '1998-04-02 00:00:00',
  `singer_location` varchar(40) NOT NULL DEFAULT '暂无',
  `singer_desc` varchar(255) NOT NULL DEFAULT '暂无',
  `singer_img` varchar(80) NOT NULL,
  `singer_visits` int(11) NOT NULL DEFAULT '0',
  `pinyin_head` varchar(255) DEFAULT NULL,
  `pinyin_all` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of singer_info
-- ----------------------------
INSERT INTO `singer_info` VALUES ('1', '赵雷', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141201233849.jpg', '0', 'ZL', 'ZHAOLEI');
INSERT INTO `singer_info` VALUES ('2', '内地群星', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141018164720.jpg', '0', 'NDQX', 'NEIDEQUNXING');
INSERT INTO `singer_info` VALUES ('3', '成都小春', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new11/20081231638338520_0.jpg', '0', 'CDXC', 'CHENGDUXIAOCHUN');
INSERT INTO `singer_info` VALUES ('4', '朱刚', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160112105456.jpg', '0', 'ZG', 'ZHUGANG');
INSERT INTO `singer_info` VALUES ('5', '阿吉太', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160520022204.jpg', '0', 'AJT', 'EJITAI');
INSERT INTO `singer_info` VALUES ('6', '邓紫棋', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160511173156.jpg', '0', 'DZQ', 'DENGZIQI');
INSERT INTO `singer_info` VALUES ('7', '廖芊芊', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160113205611.jpg', '0', 'LQQ', 'LIAOQIANQIAN');
INSERT INTO `singer_info` VALUES ('8', '汤潮', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160112115257.jpg', '0', 'TC', 'SHANGCHAO');
INSERT INTO `singer_info` VALUES ('10', '群星合辑', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141202235133.jpg', '0', 'QXHJ', 'QUNXINGGEJI');
INSERT INTO `singer_info` VALUES ('12', '孙梦楠', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140915173134.jpg', '0', 'SMN', 'SUNMENGNAN');
INSERT INTO `singer_info` VALUES ('13', '乌兰图雅', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161107041813.jpg', '0', 'WLTY', 'WULANTUYA');
INSERT INTO `singer_info` VALUES ('14', '丁紫', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141122091034.jpg', '0', 'DZ', 'ZHENGZI');
INSERT INTO `singer_info` VALUES ('15', '海鸣威', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160112115257.jpg', '0', 'HMW', 'HAIMINGWEI');
INSERT INTO `singer_info` VALUES ('16', '张华', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141122155253.jpg', '0', 'ZH', 'ZHANGHUA');
INSERT INTO `singer_info` VALUES ('17', '王昱翔', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140418161803.jpg', '0', 'WYX', 'WANGYUXIANG');
INSERT INTO `singer_info` VALUES ('18', '我是歌手', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140318153711.jpg', '0', 'WSGS', 'WOSHIGESHOU');
INSERT INTO `singer_info` VALUES ('19', '曹轩宾', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20150411195419.jpg', '0', 'CXB', 'CAOXUANBIN');
INSERT INTO `singer_info` VALUES ('20', '辽东笑笑生', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160424154514.jpg', '0', 'LDXXS', 'LIAODONGXIAOXIAOSHENG');
INSERT INTO `singer_info` VALUES ('21', '张睿', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20131218165926.jpg', '0', 'ZR', 'ZHANGRUI');
INSERT INTO `singer_info` VALUES ('23', '子枫', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20131031214726.jpg', '0', 'ZF', 'ZIFENG');
INSERT INTO `singer_info` VALUES ('25', '唐涛', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new24/20131018191222.jpg', '0', 'TT', 'TANGTAO');
INSERT INTO `singer_info` VALUES ('26', '祁家琛', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new24/20130718182619.jpg', '0', 'QJC', 'QIGUCHEN');
INSERT INTO `singer_info` VALUES ('28', '范宏伟', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new24/20130913181530.jpg', '0', 'FHW', 'FANHONGWEI');
INSERT INTO `singer_info` VALUES ('31', '筷子兄弟', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20150817203954.jpg', '0', 'KZXD', 'KUAIZIXIONGDI');
INSERT INTO `singer_info` VALUES ('32', '明圣凯', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140902163032.jpg', '0', 'MSK', 'MINGSHENGKAI');
INSERT INTO `singer_info` VALUES ('33', '郑钧', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new10/20079299453588282_0.jpg', '0', 'ZJ', 'ZHENGJUN');
INSERT INTO `singer_info` VALUES ('34', '许嵩', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161222070535.jpg', '0', 'XS', 'XUSONG');
INSERT INTO `singer_info` VALUES ('35', '薛之谦', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20171231130500.jpg', '0', 'XZQ', 'XUEZHIQIAN');
INSERT INTO `singer_info` VALUES ('36', '音乐专题', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new23/20130206093322.jpg', '0', 'YLZT', 'YINYUEZHUANTI');
INSERT INTO `singer_info` VALUES ('38', '旭日阳刚刘刚', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140428160623.jpg', '0', 'XRYGLG', 'XURIYANGGANGLIUGANG');
INSERT INTO `singer_info` VALUES ('39', '旭日阳刚', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new23/20130111014858.jpg', '0', 'XRYG', 'XURIYANGGANG');
INSERT INTO `singer_info` VALUES ('40', '张杰', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161125200337.jpg', '0', 'ZJ', 'ZHANGJIE');
INSERT INTO `singer_info` VALUES ('41', '金志文', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161111065118.jpg', '0', 'JZW', 'JINZHIWEN');
INSERT INTO `singer_info` VALUES ('42', '李玉刚', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20171231134226.jpg', '0', 'LYG', 'LIYUGANG');
INSERT INTO `singer_info` VALUES ('43', '谎言留声机', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new23/20121228005351.jpg', '0', 'HYLSJ', 'HUANGYANLIUSHENGJI');
INSERT INTO `singer_info` VALUES ('44', '逆光飞翔', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new23/20121126002459.jpg', '0', 'NGFX', 'NIGUANGFEIXIANG');
INSERT INTO `singer_info` VALUES ('46', '超级星光', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new11/20083311125813008_0.gif', '0', 'CJXG', 'CHAOJIXINGGUANG');
INSERT INTO `singer_info` VALUES ('47', '徐佳莹', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20171231124039.jpg', '0', 'XJY', 'XUJIAYING');
INSERT INTO `singer_info` VALUES ('48', '大壮', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20171209075720.jpg', '0', 'DZ', 'DAIZHUANG');
INSERT INTO `singer_info` VALUES ('50', '小黑', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new10/200710611505067618_0.jpg', '0', 'XH', 'XIAOHEI');
INSERT INTO `singer_info` VALUES ('51', '后会无期', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140728221535.jpg', '0', 'HHWQ', 'HOUKUAIMOJI');
INSERT INTO `singer_info` VALUES ('52', '吴宗宪', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new1/2006327214616309.jpg', '0', 'WZX', 'WUZONGXIAN');
INSERT INTO `singer_info` VALUES ('55', '方怡萍', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new11/200811169302545392_0.jpg', '0', 'FYP', 'FANGYIPING');
INSERT INTO `singer_info` VALUES ('56', '叶诺帆', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20180604061155.jpg', '0', 'YNF', 'XIENUOFAN');
INSERT INTO `singer_info` VALUES ('57', '龙梅子', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160512150119.jpg', '0', 'LMZ', 'LONGMEIZI');
INSERT INTO `singer_info` VALUES ('58', '鸿飞', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20170927093057.jpg', '0', 'HF', 'HONGFEI');
INSERT INTO `singer_info` VALUES ('59', '张碧晨', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160903211507.jpg', '0', 'ZBC', 'ZHANGBICHEN');
INSERT INTO `singer_info` VALUES ('60', '云朵', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141022234209.jpg', '0', 'YD', 'YUNDUO');
INSERT INTO `singer_info` VALUES ('61', '崔恕', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160205211128.jpg', '0', 'CS', 'CUISHU');
INSERT INTO `singer_info` VALUES ('62', '暴林', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140409170407.jpg', '0', 'BL', 'PULIN');
INSERT INTO `singer_info` VALUES ('63', '萧磊', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141115230310.jpg', '0', 'XL', 'XIAOLEI');
INSERT INTO `singer_info` VALUES ('65', '徐良', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160621215914.jpg', '0', 'XL', 'XULIANG');
INSERT INTO `singer_info` VALUES ('67', '张宪哲', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new24/20130530193605.jpg', '0', 'ZXZ', 'ZHANGXIANZHE');
INSERT INTO `singer_info` VALUES ('68', '余天龙', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new24/20130517181648.jpg', '0', 'YTL', 'TUTIANLONG');
INSERT INTO `singer_info` VALUES ('69', '伊琳', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new17/20091228141048.jpg', '0', 'YL', 'YILIN');
INSERT INTO `singer_info` VALUES ('70', '成诗京', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new11/20081171094117411_0.jpg', '0', 'CSJ', 'CHENGSHIJING');
INSERT INTO `singer_info` VALUES ('71', '王起宏', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140113170919.jpg', '0', 'WQH', 'WANGQIHONG');
INSERT INTO `singer_info` VALUES ('76', '路童', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new22/20120502164002.jpg', '0', 'LT', 'LUTONG');
INSERT INTO `singer_info` VALUES ('77', '吴淑敏', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new17/20091228141048.jpg', '0', 'WSM', 'WUSHUMIN');
INSERT INTO `singer_info` VALUES ('82', '郑君威', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140820213345.jpg', '0', 'ZJW', 'ZHENGJUNWEI');
INSERT INTO `singer_info` VALUES ('83', '苏勒亚其其格', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161110090212.jpg', '0', 'SLYQQG', 'SULEIYAJIJIGE');
INSERT INTO `singer_info` VALUES ('84', '夏梵', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140308142455.jpg', '0', 'XF', 'JIAFAN');
INSERT INTO `singer_info` VALUES ('85', '小沈阳', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new18/20100223155616.jpg', '0', 'XSY', 'XIAOCHENYANG');
INSERT INTO `singer_info` VALUES ('86', '带我去远方', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new16/20090911154648.jpg', '0', 'DWQYF', 'DAIWOQUYUANFANG');
INSERT INTO `singer_info` VALUES ('87', '陈伟联', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new16/20090911154648.jpg', '0', 'CWL', 'CHENWEILIAN');
INSERT INTO `singer_info` VALUES ('88', '丁汀', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new22/20120820170708.jpg', '0', 'DT', 'ZHENGTING');
INSERT INTO `singer_info` VALUES ('89', '杨培安', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new16/20090827114010.jpg', '0', 'YPA', 'YANGPEIAN');
INSERT INTO `singer_info` VALUES ('90', '李晓杰', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161111065118.jpg', '0', 'LXJ', 'LIXIAOJIE');
INSERT INTO `singer_info` VALUES ('91', '七公主', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140107214420.jpg', '0', 'QGZ', 'QIGONGZHU');
INSERT INTO `singer_info` VALUES ('92', '徐一鸣', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161221072336.jpg', '0', 'XYM', 'XUYIMING');
INSERT INTO `singer_info` VALUES ('93', 'Bonny J', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140107214420.jpg', '0', 'Bonny J', 'Bonny J');
INSERT INTO `singer_info` VALUES ('94', '夏天播放', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140912175338.jpg', '0', 'XTBF', 'JIATIANBOFANG');
INSERT INTO `singer_info` VALUES ('95', '孙豆尔', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141022230231.jpg', '0', 'SDE', 'SUNDOUER');
INSERT INTO `singer_info` VALUES ('96', '江蕙', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140106200931.jpg', '0', 'JH', 'JIANGHUI');
INSERT INTO `singer_info` VALUES ('97', '郭燕', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new3/20071301544358842_0.jpg', '0', 'GY', 'GUOYAN');
INSERT INTO `singer_info` VALUES ('101', '大勇', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new22/20120724155602.jpg', '0', 'DY', 'DAIYONG');
INSERT INTO `singer_info` VALUES ('102', '苏云', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new10/20078251492456276_0.jpg', '0', 'SY', 'SUYUN');
INSERT INTO `singer_info` VALUES ('103', '自由派对', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new22/20120724155602.jpg', '0', 'ZYPD', 'ZIYOUPADUI');
INSERT INTO `singer_info` VALUES ('104', '张志政', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141023003411.jpg', '0', 'ZZZ', 'ZHANGZHIZHENG');
INSERT INTO `singer_info` VALUES ('105', '唯嘉', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new10/20078251492456276_0.jpg', '0', 'WJ', 'WEIJIA');
INSERT INTO `singer_info` VALUES ('106', '高菲', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new19/20101008210637.jpg', '0', 'GF', 'GAOFEI');
INSERT INTO `singer_info` VALUES ('107', 'KingStar', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new21/20110926163215.jpg', '0', 'KingStar', 'KingStar');
INSERT INTO `singer_info` VALUES ('108', '阿宝', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new3/20071301544358842_0.jpg', '0', 'AB', 'EBAO');
INSERT INTO `singer_info` VALUES ('109', '李圣杰', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new17/20100120104445.jpg', '0', 'LSJ', 'LISHENGJIE');
INSERT INTO `singer_info` VALUES ('110', '亚洲天使童声合唱团', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140722222224.jpg', '0', 'YZTSTSHCT', 'YAZHOUTIANSHITONGSHENGGECHANGTUAN');
INSERT INTO `singer_info` VALUES ('111', '卢庚戌', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new3/20071201245895620_0.jpg', '0', 'LGX', 'LUGENGQU');
INSERT INTO `singer_info` VALUES ('112', '港台群星', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20151120214130.jpg', '0', 'GTQX', 'GANGTAIQUNXING');
INSERT INTO `singer_info` VALUES ('113', '吴天雄', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new3/200610923412717826.jpg', '0', 'WTX', 'WUTIANXIONG');
INSERT INTO `singer_info` VALUES ('114', '佟宇', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new1/2006219135543510.jpg', '0', 'TY', 'TONGYU');
INSERT INTO `singer_info` VALUES ('115', '王媛媛', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new3/20071201245895620_0.jpg', '0', 'WYY', 'WANGYUANYUAN');
INSERT INTO `singer_info` VALUES ('116', 'Bandari', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141018174023.jpg', '0', 'Bandari', 'Bandari');
INSERT INTO `singer_info` VALUES ('117', '陈赛金', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new11/200822814435777150_0.jpg', '0', 'CSJ', 'CHENSAIJIN');
INSERT INTO `singer_info` VALUES ('118', '刘嘉亮', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161125200337.jpg', '0', 'LJL', 'LIUJIALIANG');
INSERT INTO `singer_info` VALUES ('119', '刘孟哲', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20160118235143.jpg', '0', 'LMZ', 'LIUMENGZHE');
INSERT INTO `singer_info` VALUES ('120', '姜木', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new23/20121231020500.jpg', '0', 'JM', 'JIANGMU');
INSERT INTO `singer_info` VALUES ('121', '郭玲', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20141107012555.jpg', '0', 'GL', 'GUOLING');
INSERT INTO `singer_info` VALUES ('122', '李娜', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new8/20075611171321333_0.jpg', '0', 'LN', 'LINUO');
INSERT INTO `singer_info` VALUES ('123', '醉歌', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140826210124.jpg', '0', 'ZG', 'ZUIGE');
INSERT INTO `singer_info` VALUES ('127', '黑钻石', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new24/20130820182824.jpg', '0', 'HZS', 'HEIZUANDAN');
INSERT INTO `singer_info` VALUES ('128', '陈学冬', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161011211712.jpg', '0', 'CXD', 'CHENXUEDONG');
INSERT INTO `singer_info` VALUES ('129', '六哲', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20150910184133.jpg', '0', 'LZ', 'LUZHE');
INSERT INTO `singer_info` VALUES ('130', '老猫', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161222071543.jpg', '0', 'LM', 'LAOMAO');
INSERT INTO `singer_info` VALUES ('131', '路飞', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new25/20140618214858.jpg', '0', 'LF', 'LUFEI');
INSERT INTO `singer_info` VALUES ('132', '黑色牡羊', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new20/20101028223704.jpg', '0', 'HSMY', 'HEISHAIMUYANG');
INSERT INTO `singer_info` VALUES ('133', '王蓉', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161222071543.jpg', '0', 'WR', 'WANGRONG');
INSERT INTO `singer_info` VALUES ('134', '广场舞', '1998-04-02 00:00:00', '暂无', '暂无', 'http://img.yymp3.com/cdpic/new27/20161222071543.jpg', '0', 'GCW', 'ANCHANGWU');

-- ----------------------------
-- Table structure for uer_singer
-- ----------------------------
DROP TABLE IF EXISTS `uer_singer`;
CREATE TABLE `uer_singer` (
  `username` int(11) NOT NULL,
  `singer_id` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uer_singer
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `username` int(11) NOT NULL DEFAULT '0',
  `user_realname` varchar(20) NOT NULL,
  `user_born_date` datetime NOT NULL,
  `user_location` varchar(50) NOT NULL,
  `user_qianming` varchar(255) DEFAULT NULL,
  `user_level` int(11) NOT NULL,
  `user_date` datetime NOT NULL,
  `user_img` varchar(255) NOT NULL DEFAULT 'logo.png',
  KEY `username` (`username`),
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('10000018', '王飞', '1998-04-02 00:00:00', '湖南-衡阳', '', '0', '2018-11-28 00:00:00', 'logo.png');
INSERT INTO `userinfo` VALUES ('10000019', '大佬', '1998-04-02 00:00:00', '湖南-衡阳', '世界很精彩', '1', '2019-01-05 00:00:00', 'logo.png');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` int(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `issinger` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10000020 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('10000018', '9264334', 'no');
INSERT INTO `users` VALUES ('10000019', '9264334', 'no');

-- ----------------------------
-- Table structure for zhuanji_info
-- ----------------------------
DROP TABLE IF EXISTS `zhuanji_info`;
CREATE TABLE `zhuanji_info` (
  `zhuanji_id` int(11) NOT NULL AUTO_INCREMENT,
  `singer_id` int(11) NOT NULL,
  `zhuanji_name` varchar(10) NOT NULL,
  `zhuanji_date` datetime NOT NULL,
  `zhuanji_img` varchar(255) NOT NULL,
  `visitis` int(255) NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL DEFAULT '华语',
  PRIMARY KEY (`zhuanji_id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhuanji_info
-- ----------------------------
INSERT INTO `zhuanji_info` VALUES ('232', '1', '待定', '2005-01-01 00:00:00', '99dba642f2cb11e8bde3e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('233', '2', '待定', '2006-01-01 00:00:00', '9d74f9a4f2cb11e88fbbe82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('234', '3', '待定', '2000-01-01 00:00:00', '9debd752f2cb11e88535e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('235', '4', '待定', '2008-01-01 00:00:00', '9e807634f2cb11e8bf92e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('236', '5', '待定', '1998-01-01 00:00:00', '9f0b9f34f2cb11e89c25e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('237', '6', '待定', '1997-01-01 00:00:00', '9f940912f2cb11e8a5cce82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('238', '7', '待定', '2005-02-01 00:00:00', 'a0374df4f2cb11e883bae82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('239', '8', '待定', '2007-01-01 00:00:00', 'a0b2bf82f2cb11e8a35de82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('240', '10', '待定', '1997-01-01 00:00:00', 'a1253064f2cb11e8a25fe82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('241', '12', '待定', '2006-01-01 00:00:00', 'a24ebc42f2cb11e88149e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('242', '13', '待定', '2005-01-01 00:00:00', 'a2d3a3b4f2cb11e89b40e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('243', '14', '待定', '2004-10-01 00:00:00', 'a359eab4f2cb11e8899ce82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('244', '15', '待定', '1999-01-01 00:00:00', 'a3e317e4f2cb11e8ba89e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('245', '16', '待定', '2009-01-01 00:00:00', 'a46d0864f2cb11e887dfe82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('246', '17', '待定', '2006-01-01 00:00:00', 'a4ebd552f2cb11e8bae1e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('247', '19', '待定', '2000-01-01 00:00:00', 'a5794842f2cb11e8b25be82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('248', '21', '待定', '2004-01-01 00:00:00', 'a671d912f2cb11e88884e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('249', '23', '待定', '2005-01-01 00:00:00', 'a720ddc2f2cb11e8a530e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('250', '25', '待定', '2005-01-01 00:00:00', 'a79b16d2f2cb11e89089e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('251', '26', '待定', '2005-01-01 00:00:00', 'a8110a24f2cb11e8a64de82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('252', '28', '待定', '2005-01-01 00:00:00', 'a89afaa4f2cb11e887eee82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('253', '31', '待定', '2005-01-01 00:00:00', 'a91d4a02f2cb11e8849be82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('254', '31', '待定', '2005-01-01 00:00:00', 'a9f337a4f2cb11e8abcee82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('255', '32', '待定', '2005-01-01 00:00:00', 'aa7c64d2f2cb11e8afb3e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('256', '33', '待定', '2005-01-01 00:00:00', 'aaf98412f2cb11e8a7b9e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('257', '34', '待定', '2005-01-01 00:00:00', 'ab6cb842f2cb11e88c73e82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('258', '34', '待定', '2005-01-01 00:00:00', 'ac3fbfb4f2cb11e89a7ae82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('259', '34', '待定', '2005-01-01 00:00:00', 'ace50064f2cb11e885dde82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('260', '35', '待定', '2005-01-01 00:00:00', 'ad646992f2cb11e8a4bce82a44f43180', '0', '华语');
INSERT INTO `zhuanji_info` VALUES ('261', '36', '待定', '2005-01-01 00:00:00', 'ae8e6aa4f2cb11e89161e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('262', '38', '待定', '2005-01-01 00:00:00', 'af18d052f2cb11e89484e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('263', '39', '待定', '2005-01-01 00:00:00', 'afba6782f2cb11e899c1e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('264', '39', '待定', '2005-01-01 00:00:00', 'b05f8124f2cb11e88b83e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('265', '40', '待定', '2005-01-01 00:00:00', 'b11e6452f2cb11e8a42be82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('266', '40', '待定', '2005-01-01 00:00:00', 'b1c94a52f2cb11e89375e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('267', '40', '待定', '2005-01-01 00:00:00', 'b2ab45e4f2cb11e889f2e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('268', '41', '待定', '2005-01-01 00:00:00', 'b352f792f2cb11e883cee82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('269', '42', '待定', '2005-01-01 00:00:00', 'b3d546f4f2cb11e88eb1e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('270', '42', '待定', '2005-01-01 00:00:00', 'b479eb64f2cb11e8b1e6e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('271', '42', '待定', '2005-01-01 00:00:00', 'b5214ef4f2cb11e89d35e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('272', '43', '待定', '2005-01-01 00:00:00', 'b5aaa334f2cb11e8ba84e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('273', '44', '待定', '2005-01-01 00:00:00', 'b641b312f2cb11e8b17ae82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('274', '46', '待定', '2005-01-01 00:00:00', 'b6bc3a42f2cb11e8950de82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('275', '47', '待定', '2005-01-01 00:00:00', 'b7393274f2cb11e88cb9e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('276', '47', '待定', '2005-01-01 00:00:00', 'b7e047e4f2cb11e8a7afe82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('277', '47', '待定', '2005-01-01 00:00:00', 'b8b412a4f2cb11e8a6fee82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('278', '48', '待定', '2005-01-01 00:00:00', 'b93d8df4f2cb11e8a4fae82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('279', '50', '待定', '2005-01-01 00:00:00', 'b9b4e0d2f2cb11e894f6e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('280', '51', '待定', '2005-01-01 00:00:00', 'ba2d4524f2cb11e88ca2e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('281', '52', '待定', '2005-01-01 00:00:00', 'bac0ab82f2cb11e8b05ee82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('282', '55', '待定', '2005-01-01 00:00:00', 'bb423792f2cb11e88b4be82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('283', '56', '待定', '2005-01-01 00:00:00', 'bba89a82f2cb11e8b472e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('284', '57', '待定', '2005-01-01 00:00:00', 'bc1b0b64f2cb11e882c4e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('285', '58', '待定', '2005-01-01 00:00:00', 'bc901452f2cb11e8a93fe82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('286', '59', '待定', '2005-01-01 00:00:00', 'bcf9ab92f2cb11e89828e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('287', '60', '待定', '2005-01-01 00:00:00', 'c2e6da02f2cb11e8971fe82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('288', '61', '待定', '2005-01-01 00:00:00', 'c367c9d2f2cb11e8a57fe82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('289', '62', '待定', '2005-01-01 00:00:00', 'c3ede9c2f2cb11e88fe6e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('290', '63', '待定', '2005-01-01 00:00:00', 'c4667524f2cb11e88b79e82a44f43180', '0', '欧美');
INSERT INTO `zhuanji_info` VALUES ('291', '65', '待定', '2005-01-01 00:00:00', 'c4d22f42f2cb11e893b0e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('292', '67', '待定', '2005-01-01 00:00:00', 'c5438eb4f2cb11e88d77e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('293', '68', '待定', '2005-01-01 00:00:00', 'c5d82d92f2cb11e8aeaee82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('294', '69', '待定', '2005-01-01 00:00:00', 'c6528db4f2cb11e8b65ce82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('295', '70', '待定', '2005-01-01 00:00:00', 'c6dc0902f2cb11e8b31fe82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('296', '71', '待定', '2005-01-01 00:00:00', 'c741cfb4f2cb11e88c89e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('297', '76', '待定', '2005-01-01 00:00:00', 'c8c9cf42f2cb11e8b236e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('298', '77', '待定', '2005-01-01 00:00:00', 'c93ae092f2cb11e88114e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('299', '82', '待定', '2005-01-01 00:00:00', 'c9bb0d12f2cb11e8977fe82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('300', '83', '待定', '2005-01-01 00:00:00', 'ca276374f2cb11e8845de82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('301', '84', '待定', '2005-01-01 00:00:00', 'ca9d7dd2f2cb11e8942ce82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('302', '85', '待定', '2005-01-01 00:00:00', 'cb306f02f2cb11e8967ae82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('303', '86', '待定', '2005-01-01 00:00:00', 'cba68964f2cb11e8ae14e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('304', '87', '待定', '2005-01-01 00:00:00', 'cc230c64f2cb11e8bb73e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('305', '88', '待定', '2005-01-01 00:00:00', 'ccae5c74f2cb11e8a8e5e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('306', '89', '待定', '2005-01-01 00:00:00', 'cd2b0682f2cb11e8af6fe82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('307', '90', '待定', '2005-01-01 00:00:00', 'cdaeb574f2cb11e8ad52e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('308', '91', '待定', '2005-01-01 00:00:00', 'ce3c9d92f2cb11e88179e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('309', '92', '待定', '2005-01-01 00:00:00', 'ceb9bcd2f2cb11e8a005e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('310', '93', '待定', '2005-01-01 00:00:00', 'cf296e92f2cb11e898b2e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('311', '94', '待定', '2005-01-01 00:00:00', 'cfa5ca82f2cb11e8ae91e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('312', '95', '待定', '2005-01-01 00:00:00', 'd01bbdd2f2cb11e89be0e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('313', '96', '待定', '2005-01-01 00:00:00', 'd1362e82f2cb11e89171e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('314', '97', '待定', '2005-01-01 00:00:00', 'd1b8a4f4f2cb11e8a546e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('315', '101', '待定', '2005-01-01 00:00:00', 'd22856b4f2cb11e8a33ae82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('316', '102', '待定', '2005-01-01 00:00:00', 'd2a91f74f2cb11e88c53e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('317', '103', '待定', '2005-01-01 00:00:00', 'd3215cb4f2cb11e8b89ee82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('318', '104', '待定', '2005-01-01 00:00:00', 'd39999f4f2cb11e8af74e82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('319', '105', '待定', '2005-01-01 00:00:00', 'd405f052f2cb11e8955de82a44f43180', '0', '韩国');
INSERT INTO `zhuanji_info` VALUES ('320', '106', '待定', '2005-01-01 00:00:00', 'd4938a52f2cb11e8baefe82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('321', '107', '待定', '2005-01-01 00:00:00', 'd5145312f2cb11e89e45e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('322', '108', '待定', '2005-01-01 00:00:00', 'd59ae834f2cb11e89062e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('323', '109', '待定', '2005-01-01 00:00:00', 'd6206be4f2cb11e880ece82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('324', '110', '待定', '2005-01-01 00:00:00', 'd6c0f1a4f2cb11e8aac2e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('325', '111', '待定', '2005-01-01 00:00:00', 'd7349b02f2cb11e8bf59e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('326', '112', '待定', '2005-01-01 00:00:00', 'd7ad7482f2cb11e88dc7e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('327', '113', '待定', '2005-01-01 00:00:00', 'd81e10a4f2cb11e8bab8e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('328', '114', '待定', '2005-01-01 00:00:00', 'd89def02f2cb11e8b4c6e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('329', '115', '待定', '2005-01-01 00:00:00', 'd911bf74f2cb11e89c4ee82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('330', '116', '待定', '2005-01-01 00:00:00', 'd979d012f2cb11e8a0bee82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('331', '117', '待定', '2005-01-01 00:00:00', 'd9f9d582f2cb11e88001e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('332', '118', '待定', '2005-01-01 00:00:00', 'da71c4a4f2cb11e8938ee82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('333', '119', '待定', '2005-01-01 00:00:00', 'daf12dd2f2cb11e8a875e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('334', '120', '待定', '2005-01-01 00:00:00', 'dbd8a7a4f2cb11e882efe82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('335', '121', '待定', '2005-01-01 00:00:00', 'dc3e9564f2cb11e88344e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('336', '122', '待定', '2005-01-01 00:00:00', 'dcabd624f2cb11e8b2f7e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('337', '123', '待定', '2005-01-01 00:00:00', 'dd2524d2f2cb11e89be4e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('338', '127', '待定', '2005-01-01 00:00:00', 'ddd2f102f2cb11e8a6d2e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('339', '128', '待定', '2005-01-01 00:00:00', 'de4d7834f2cb11e8b415e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('340', '130', '待定', '2005-01-01 00:00:00', 'ded1c364f2cb11e8b5efe82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('341', '130', '待定', '2005-01-01 00:00:00', 'df8cfd12f2cb11e88ddfe82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('342', '131', '待定', '2005-01-01 00:00:00', 'e02ac3b4f2cb11e89d96e82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('343', '133', '待定', '2005-01-01 00:00:00', 'e10f5752f2cb11e884aee82a44f43180', '0', '音乐人');
INSERT INTO `zhuanji_info` VALUES ('344', '134', '待定', '2005-01-01 00:00:00', 'e1abe574f2cb11e8b4bbe82a44f43180', '0', '音乐人');

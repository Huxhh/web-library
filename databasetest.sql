

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrator`
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `AdmID` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdmID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('1', 'ad1', 'ad123');
INSERT INTO `administrator` VALUES ('2', 'ad2', 'ad123');
INSERT INTO `administrator` VALUES ('3', 'ad3', 'ad123');

-- ----------------------------
-- Table structure for `borrowrecord`
-- ----------------------------
DROP TABLE IF EXISTS `borrowrecord`;
CREATE TABLE `borrowrecord` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `BookID` int(10) NOT NULL,
  `StuID` int(10) NOT NULL,
  `BorrowTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `b_fk` (`BookID`),
  KEY `s_fk` (`StuID`),
  CONSTRAINT `b_fk` FOREIGN KEY (`BookID`) REFERENCES `library` (`BookID`),
  CONSTRAINT `s_fk` FOREIGN KEY (`StuID`) REFERENCES `student` (`StuID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowrecord
-- ----------------------------
INSERT INTO `borrowrecord` VALUES ('11', '13', '1', '2015-09-19 20:56:27');
INSERT INTO `borrowrecord` VALUES ('13', '11', '4', '2015-09-27 15:36:15');
INSERT INTO `borrowrecord` VALUES ('14', '13', '4', '2015-09-27 15:36:31');
INSERT INTO `borrowrecord` VALUES ('15', '15', '4', '2015-09-27 15:36:44');
INSERT INTO `borrowrecord` VALUES ('16', '10', '7', '2015-09-28 20:35:19');


-- ----------------------------
-- Table structure for `library`
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library` (
  `BookID` int(10) NOT NULL AUTO_INCREMENT,
  `BookName` varchar(20) NOT NULL,
  `BookDescribe` varchar(51) NOT NULL,
  `BookNum` int(10) NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES ('1', '追风筝的人', '一本小说', '3');
INSERT INTO `library` VALUES ('10', '1984', '一本具有讽刺意味的小说，值得一读。', '4');
INSERT INTO `library` VALUES ('11', '明朝那些事', '有趣的历史类书籍', '2');
INSERT INTO `library` VALUES ('13', '大学物理', '是教科书', '4');
INSERT INTO `library` VALUES ('14', '微积分', '教科书', '3');
INSERT INTO `library` VALUES ('15', '数学之美', '必读的书', '8');
INSERT INTO `library` VALUES ('17', '线性代数', '教科书', '2');


-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StuID` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StuID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'stu1', 'stu123');
INSERT INTO `student` VALUES ('2', 'stu2', 'stu123');
INSERT INTO `student` VALUES ('3', 'stu3', 'stu123');
INSERT INTO `student` VALUES ('4', 'stu4', 'stu123');
INSERT INTO `student` VALUES ('5', 'stu5', 'stu123');
INSERT INTO `student` VALUES ('6', 'stu6', 'stu123');
INSERT INTO `student` VALUES ('7', 'abc', '123456');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `last_visit` datetime NOT NULL,
  `last_ip` varchar(23) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '2015-10-16 19:23:11', '1');

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : hkxj

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-20 22:53:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cetstudent
-- ----------------------------
DROP TABLE IF EXISTS `cetstudent`;
CREATE TABLE `cetstudent` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `level` varchar(8) NOT NULL,
  `account` int(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `classRoom` varchar(32) NOT NULL,
  `examinee` varchar(32) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `academy` int(2) DEFAULT NULL,
  `subject` int(2) DEFAULT NULL,
  `year` int(2) DEFAULT NULL,
  `num` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class_course
-- ----------------------------
DROP TABLE IF EXISTS `class_course`;
CREATE TABLE `class_course` (
  `class_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year` int(2) NOT NULL DEFAULT '2018',
  `term` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `test` (`class_id`,`course_id`,`year`,`term`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class_exam_timetable
-- ----------------------------
DROP TABLE IF EXISTS `class_exam_timetable`;
CREATE TABLE `class_exam_timetable` (
  `class_id` int(11) NOT NULL,
  `exam_timetable_id` int(11) NOT NULL,
  UNIQUE KEY `unique` (`class_id`,`exam_timetable_id`) USING BTREE COMMENT '防止出现脏数据  '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for class_timetable
-- ----------------------------
DROP TABLE IF EXISTS `class_timetable`;
CREATE TABLE `class_timetable` (
  `class_id` int(11) NOT NULL,
  `time_table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `academy` int(11) NOT NULL,
  `credit` int(3) NOT NULL,
  `type` int(1) DEFAULT NULL,
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_time_table
-- ----------------------------
DROP TABLE IF EXISTS `course_time_table`;
CREATE TABLE `course_time_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(5) DEFAULT NULL,
  `year_` int(4) DEFAULT NULL,
  `term_` int(1) DEFAULT NULL,
  `start_` int(1) DEFAULT NULL,
  `end_` int(1) DEFAULT NULL,
  `week_` int(1) DEFAULT NULL,
  `order_` int(1) DEFAULT NULL,
  `distinct_` int(1) DEFAULT NULL COMMENT '单双周：0为不分单双周，1单周，2双周',
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7669 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exam_timetable
-- ----------------------------
DROP TABLE IF EXISTS `exam_timetable`;
CREATE TABLE `exam_timetable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year_` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  `school_week` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `start` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5) ON UPDATE CURRENT_TIMESTAMP(5),
  `end` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5) ON UPDATE CURRENT_TIMESTAMP(5),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for forum_follow
-- ----------------------------
DROP TABLE IF EXISTS `forum_follow`;
CREATE TABLE `forum_follow` (
  `follow_id` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NOT NULL,
  `post_id` int(16) NOT NULL,
  PRIMARY KEY (`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forum_post
-- ----------------------------
DROP TABLE IF EXISTS `forum_post`;
CREATE TABLE `forum_post` (
  `post_id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NOT NULL,
  `topic` varchar(31) NOT NULL,
  `content` varchar(1001) NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `follow_num` int(16) unsigned NOT NULL DEFAULT '0',
  `browsetimes` int(16) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forum_reply
-- ----------------------------
DROP TABLE IF EXISTS `forum_reply`;
CREATE TABLE `forum_reply` (
  `reply_id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL,
  `author` varchar(255) NOT NULL,
  `reply_content` varchar(255) NOT NULL,
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forum_user
-- ----------------------------
DROP TABLE IF EXISTS `forum_user`;
CREATE TABLE `forum_user` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `ifsuper` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `year` int(4) NOT NULL,
  `term` tinyint(1) NOT NULL,
  `score` int(5) NOT NULL,
  `point` int(5) NOT NULL,
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test` (`account`,`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16212 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for openid
-- ----------------------------
DROP TABLE IF EXISTS `openid`;
CREATE TABLE `openid` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) NOT NULL,
  `account` int(32) NOT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_bind` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_openid` (`openid`) USING BTREE,
  KEY `idx_account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3623 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(10) NOT NULL,
  `direction` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `is_allow` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for room_course_timetable
-- ----------------------------
DROP TABLE IF EXISTS `room_course_timetable`;
CREATE TABLE `room_course_timetable` (
  `room_id` int(11) NOT NULL,
  `course_timetable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `account` int(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `ethnic` varchar(32) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '1',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8412 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `academy` int(2) NOT NULL,
  `code` varchar(10) NOT NULL COMMENT '专业代码',
  `approve_time` int(4) NOT NULL,
  `property_first` varchar(5) NOT NULL,
  `property_second` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subscribe_grade_update
-- ----------------------------
DROP TABLE IF EXISTS `subscribe_grade_update`;
CREATE TABLE `subscribe_grade_update` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL,
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1370 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for subscribe_openid
-- ----------------------------
DROP TABLE IF EXISTS `subscribe_openid`;
CREATE TABLE `subscribe_openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) NOT NULL,
  `sub_type` int(11) NOT NULL COMMENT '场景值',
  `is_send` tinyint(4) NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=797 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_count
-- ----------------------------
DROP TABLE IF EXISTS `task_count`;
CREATE TABLE `task_count` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL,
  `update_type` int(4) NOT NULL,
  `count` int(11) unsigned zerofill NOT NULL,
  `gmt_modified` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1370 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for time_table
-- ----------------------------
DROP TABLE IF EXISTS `time_table`;
CREATE TABLE `time_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(5) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `term` int(1) DEFAULT NULL,
  `start` int(1) DEFAULT NULL,
  `end` int(1) DEFAULT NULL,
  `week` int(1) DEFAULT NULL,
  `order` int(1) DEFAULT NULL,
  `distinct` int(1) DEFAULT NULL COMMENT '单双周：0为不分单双周，1单周，2双周',
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23018 DEFAULT CHARSET=utf8;

/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3307
 Source Schema         : graduation-design-management

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 16/12/2021 19:45:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `admin_pwd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '123');

-- ----------------------------
-- Table structure for base_dept
-- ----------------------------
DROP TABLE IF EXISTS `base_dept`;
CREATE TABLE `base_dept`  (
  `dept_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系id',
  `dept_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系名',
  `dept_state` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `dept_name`(`dept_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_dept
-- ----------------------------
INSERT INTO `base_dept` VALUES ('0001', '计算机与信息科学系', 1);
INSERT INTO `base_dept` VALUES ('0002', '外语系', 1);
INSERT INTO `base_dept` VALUES ('0003', '城管系', 1);
INSERT INTO `base_dept` VALUES ('0004', '经管系', 1);
INSERT INTO `base_dept` VALUES ('0005', '文学院', 1);

-- ----------------------------
-- Table structure for base_major
-- ----------------------------
DROP TABLE IF EXISTS `base_major`;
CREATE TABLE `base_major`  (
  `major_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业id',
  `major_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名称',
  `dept_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业所属的系id',
  `major_state` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`major_id`) USING BTREE,
  UNIQUE INDEX `major_name`(`major_name`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `base_major_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `base_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_major
-- ----------------------------
INSERT INTO `base_major` VALUES ('0001', '软件工程', '0001', 1);
INSERT INTO `base_major` VALUES ('0002', '计算机科学与技术', '0001', 1);
INSERT INTO `base_major` VALUES ('0003', '电子信息', '0001', 1);
INSERT INTO `base_major` VALUES ('0004', '英语', '0002', 1);
INSERT INTO `base_major` VALUES ('0005', '社会管理', '0003', 1);
INSERT INTO `base_major` VALUES ('0006', '财管', '0004', 1);
INSERT INTO `base_major` VALUES ('0007', '汉语言', '0005', 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `c_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '建议编号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `t_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f_id` bigint(20) NULL DEFAULT NULL COMMENT '文件编号',
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`f_id`) REFERENCES `myfile` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (2, '写的不错', '2000', 3, '178325121', '2021-02-27 22:21:17');
INSERT INTO `comments` VALUES (3, '写的不错', '2000', 2, '178325122', '2021-03-01 22:21:24');
INSERT INTO `comments` VALUES (4, '很好', '2000', 4, '178325124', '2021-03-09 23:18:41');
INSERT INTO `comments` VALUES (5, '好', '2000', 5, '178325124', '2021-03-12 23:19:51');
INSERT INTO `comments` VALUES (6, '可以', '2000', 6, '178325124', '2021-03-25 23:53:23');
INSERT INTO `comments` VALUES (7, '', '2000', 7, '178325124', '2021-04-09 23:54:16');
INSERT INTO `comments` VALUES (8, '', '2000', 8, '178325124', '2021-04-09 23:55:01');
INSERT INTO `comments` VALUES (9, '我看到了你的报告。', '2020001', 10, '178325126', '2021-04-12 13:50:49');
INSERT INTO `comments` VALUES (10, '审核开题报告', '2020001', 11, '178325126', '2021-04-12 13:59:46');
INSERT INTO `comments` VALUES (11, '审核中期检查', '2020001', 12, '178325126', '2021-04-12 14:00:47');
INSERT INTO `comments` VALUES (12, '审核论文', '2020001', 13, '178325126', '2021-04-12 14:01:37');
INSERT INTO `comments` VALUES (13, '通过', '2001', 18, '178325125', '2021-05-24 14:17:00');
INSERT INTO `comments` VALUES (14, '通过', '2001', 19, '178325125', '2021-05-24 14:17:59');
INSERT INTO `comments` VALUES (15, '通过', '2001', 20, '178325125', '2021-05-24 14:19:03');
INSERT INTO `comments` VALUES (16, '通过', '2001', 21, '178325125', '2021-05-24 14:19:55');

-- ----------------------------
-- Table structure for mid_check
-- ----------------------------
DROP TABLE IF EXISTS `mid_check`;
CREATE TABLE `mid_check`  (
  `m_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '中期检查编号',
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f_id` bigint(20) NULL DEFAULT NULL,
  `agree` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `mid_check_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mid_check_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `myfile` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mid_check
-- ----------------------------
INSERT INTO `mid_check` VALUES (1, '178325124', 6, '通过');
INSERT INTO `mid_check` VALUES (2, '178325126', 12, '通过');
INSERT INTO `mid_check` VALUES (3, '178325125', 20, '通过');

-- ----------------------------
-- Table structure for myfile
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile`  (
  `f_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `f_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `f_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `upload_datetime` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `f_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES (2, '178325122NT需求分析.doc', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325122NT需求分析.doc', '2021-04-04 15:34:32', '需求分析');
INSERT INTO `myfile` VALUES (3, '178325121MH需求分析.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325121MH需求分析.docx', '2021-04-09 22:20:27', '需求分析');
INSERT INTO `myfile` VALUES (4, '178325124小花需求分析.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325124小花需求分析.docx', '2021-04-09 23:18:01', '需求分析');
INSERT INTO `myfile` VALUES (5, '178325124小花开题报告.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325124小花开题报告.docx', '2021-04-09 23:19:26', '开题报告');
INSERT INTO `myfile` VALUES (6, '178325124小花中期检查.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325124小花中期检查.docx', '2021-04-09 23:53:00', '中期检查');
INSERT INTO `myfile` VALUES (7, '178325124小花论文.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325124小花论文.docx', '2021-04-09 23:53:53', '论文');
INSERT INTO `myfile` VALUES (8, '178325124小花论文(1).docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325124小花论文(1).docx', '2021-04-09 23:54:40', '论文');
INSERT INTO `myfile` VALUES (9, '178325124小花附件.zip', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325124小花附件.zip', '2021-04-09 23:56:49', '附件');
INSERT INTO `myfile` VALUES (10, '178325126小刚需求分析.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2020001\\178325126小刚需求分析.docx', '2021-04-12 13:49:53', '需求分析');
INSERT INTO `myfile` VALUES (11, '178325126小刚开题报告.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2020001\\178325126小刚开题报告.docx', '2021-04-12 13:51:30', '开题报告');
INSERT INTO `myfile` VALUES (12, '178325126小刚中期检查.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2020001\\178325126小刚中期检查.docx', '2021-04-12 14:00:07', '中期检查');
INSERT INTO `myfile` VALUES (13, '178325126小刚论文.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2020001\\178325126小刚论文.docx', '2021-04-12 14:01:09', '论文');
INSERT INTO `myfile` VALUES (14, '178325126小刚附件.zip', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2020001\\178325126小刚附件.zip', '2021-04-12 14:02:05', '附件');
INSERT INTO `myfile` VALUES (16, '178325129大明需求分析.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2020001\\178325129大明需求分析.docx', '2021-04-19 15:23:36', '需求分析');
INSERT INTO `myfile` VALUES (17, '178325121MH开题报告.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2000\\178325121MH开题报告.docx', '2021-04-21 17:49:23', '开题报告');
INSERT INTO `myfile` VALUES (18, '178325125小强需求分析.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2001\\178325125小强需求分析.docx', '2021-05-24 14:16:31', '需求分析');
INSERT INTO `myfile` VALUES (19, '178325125小强开题报告.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2001\\178325125小强开题报告.docx', '2021-05-24 14:17:32', '开题报告');
INSERT INTO `myfile` VALUES (20, '178325125小强中期检查.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2001\\178325125小强中期检查.docx', '2021-05-24 14:18:30', '中期检查');
INSERT INTO `myfile` VALUES (21, '178325125小强论文.docx', 'D:\\tool\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Graduation-Design-Management-System\\upload\\2001\\178325125小强论文.docx', '2021-05-24 14:19:34', '论文');

-- ----------------------------
-- Table structure for open_report
-- ----------------------------
DROP TABLE IF EXISTS `open_report`;
CREATE TABLE `open_report`  (
  `r_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '开题报告编号',
  `f_id` bigint(20) NULL DEFAULT NULL COMMENT '文件编号',
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `agree` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否同意开题',
  PRIMARY KEY (`r_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  CONSTRAINT `open_report_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `myfile` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `open_report_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of open_report
-- ----------------------------
INSERT INTO `open_report` VALUES (1, 5, '178325124', '通过');
INSERT INTO `open_report` VALUES (2, 11, '178325126', '通过');
INSERT INTO `open_report` VALUES (3, 17, '178325121', '待通过');
INSERT INTO `open_report` VALUES (4, 19, '178325125', '通过');

-- ----------------------------
-- Table structure for proj_book
-- ----------------------------
DROP TABLE IF EXISTS `proj_book`;
CREATE TABLE `proj_book`  (
  `p_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务书编号',
  `f_id` bigint(20) NOT NULL COMMENT '文件编号',
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生编号',
  `agree` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过(待通过，不通过，通过)',
  PRIMARY KEY (`p_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `proj_book_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proj_book_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `myfile` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proj_book
-- ----------------------------
INSERT INTO `proj_book` VALUES (2, 2, '178325122', '通过');
INSERT INTO `proj_book` VALUES (3, 3, '178325121', '通过');
INSERT INTO `proj_book` VALUES (4, 4, '178325124', '通过');
INSERT INTO `proj_book` VALUES (5, 10, '178325126', '通过');
INSERT INTO `proj_book` VALUES (6, 16, '178325129', '待通过');
INSERT INTO `proj_book` VALUES (7, 18, '178325125', '通过');

-- ----------------------------
-- Table structure for reply_group
-- ----------------------------
DROP TABLE IF EXISTS `reply_group`;
CREATE TABLE `reply_group`  (
  `reply_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `reply_leader` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_member` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_place` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_datetime` datetime NULL DEFAULT NULL,
  `batch` smallint(6) NULL DEFAULT NULL,
  `reply_student` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `creator`(`creator`) USING BTREE,
  CONSTRAINT `reply_group_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply_group
-- ----------------------------
INSERT INTO `reply_group` VALUES ('1', '2000 评阅教师0', '2000 评阅教师0', '3B310', '2021-03-21 20:57:21', 1, '2000 评阅教师0', '2020666');
INSERT INTO `reply_group` VALUES ('2', '2000 评阅教师0', '2001 评阅教师1', '3B311', '2021-04-11 00:00:00', 1, '2000 评阅教师0', '2020888');
INSERT INTO `reply_group` VALUES ('3', '2020001 张三', '2001 评阅教师1', '3B312', '2021-04-12 14:05:21', 1, '2020001 张三', '2020888');
INSERT INTO `reply_group` VALUES ('4', '2020003 王五', '2000 评阅教师0', '3B313', '2021-05-23 00:00:00', 1, '2001 评阅教师1', '2020666');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `member_t_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_score` int(11) NULL DEFAULT NULL,
  `review_comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `review_type` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`, `member_t_id`) USING BTREE,
  INDEX `review_ibfk_3`(`reply_id`) USING BTREE,
  INDEX `member_t_id`(`member_t_id`) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`reply_id`) REFERENCES `reply_group` (`reply_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_4` FOREIGN KEY (`member_t_id`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('178325124', '2000', 86, '挺好的', '2', '答辩组长评分');
INSERT INTO `review` VALUES ('178325124', '2001', 90, '很好', '2', '评阅教师评分');
INSERT INTO `review` VALUES ('178325125', '2000', 0, NULL, '4', '评阅教师评分');
INSERT INTO `review` VALUES ('178325125', '2020003', 0, NULL, '4', '答辩组长评分');
INSERT INTO `review` VALUES ('178325126', '2001', 85, '评分', '3', '评阅教师评分');
INSERT INTO `review` VALUES ('178325126', '2020001', 80, '看到了你的论文', '3', '答辩组长评分');

-- ----------------------------
-- Table structure for score_proportion
-- ----------------------------
DROP TABLE IF EXISTS `score_proportion`;
CREATE TABLE `score_proportion`  (
  `proportion_id` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_score_proportion` double NULL DEFAULT NULL COMMENT '指导老师分数比例',
  `leader_score_proportion` double NULL DEFAULT NULL COMMENT '答辩组长分数比例',
  `review_score_proportion` double NULL DEFAULT NULL COMMENT '评阅老师分数比例',
  PRIMARY KEY (`proportion_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score_proportion
-- ----------------------------
INSERT INTO `score_proportion` VALUES ('1', 0.5, 0.3, 0.2);

-- ----------------------------
-- Table structure for select_title
-- ----------------------------
DROP TABLE IF EXISTS `select_title`;
CREATE TABLE `select_title`  (
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生编号',
  `titl_id` bigint(20) NOT NULL,
  `t_score` int(11) NULL DEFAULT NULL COMMENT '指导教师评分',
  `t_comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指导教师评语',
  `reply_score` double NULL DEFAULT NULL COMMENT '答辩评分',
  `reply_comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答辩评语',
  `seltitl_state` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选题状态(待同意，同意，拒绝，无效)',
  PRIMARY KEY (`s_id`, `titl_id`) USING BTREE,
  INDEX `titl_id`(`titl_id`) USING BTREE,
  CONSTRAINT `select_title_ibfk_1` FOREIGN KEY (`titl_id`) REFERENCES `title` (`titl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `select_title_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of select_title
-- ----------------------------
INSERT INTO `select_title` VALUES ('178325121', 38, 0, NULL, NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325122', 1, 90, '挺好', NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325124', 40, 80, '可以', 43.8, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325125', 39, 0, NULL, NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325126', 42, 80, '看到了你的成品。', 41, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325127', 39, 0, NULL, NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325128', 43, 0, NULL, NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325129', 44, 0, NULL, NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325130', 37, 0, NULL, NULL, NULL, '同意');
INSERT INTO `select_title` VALUES ('178325132', 45, 0, NULL, NULL, NULL, '待同意');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_pwd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_class` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `dept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch` smallint(6) NULL DEFAULT NULL,
  `s_state` int(11) NULL DEFAULT NULL,
  `major_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE,
  INDEX `dept_id`(`dept`) USING BTREE,
  INDEX `major_id`(`major`) USING BTREE,
  INDEX `major_id_2`(`major_id`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `base_major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('178325121', 'MH', '123', '17计科', '男', 22, '计算机与信息科学系', '计算机科学与技术', '18852175980', '972942040@qq.com', 1, 1, '0002');
INSERT INTO `student` VALUES ('178325122', 'NT', '123', '17软件', '男', 22, '计算机与信息科学系', '软件工程', '18852175981', '', 2, 1, '0001');
INSERT INTO `student` VALUES ('178325123', '小红', '123', '17英语', '女', 22, '外语系', '英语', '18852175980', '972942040@qq.com', 1, 1, '0004');
INSERT INTO `student` VALUES ('178325124', '小花', '123', '17计科', '女', 22, '计算机与信息科学系', '计算机科学与技术', '18852175980', '972942040@qq.com', 1, 1, '0002');
INSERT INTO `student` VALUES ('178325125', '小强', '123', '17计科', '男', 22, '计算机与信息科学系', '计算机科学与技术', '18852175980', NULL, 1, 1, '0002');
INSERT INTO `student` VALUES ('178325126', '小刚', '123', '17计科', '男', 22, '计算机与信息科学系', '计算机科学与技术', '18852175982', '972942040@qq.com', 1, 1, '0002');
INSERT INTO `student` VALUES ('178325127', '小明', '123', '17计科', '男', 22, '计算机与信息科学系', '计算机科学与技术', '18852175980', '972942040@qq.com', 1, 1, '0002');
INSERT INTO `student` VALUES ('178325128', '小黄', '123', '17计科', '男', 22, '计算机与信息科学系', '计算机科学与技术', '18852175980', NULL, 1, 1, '0002');
INSERT INTO `student` VALUES ('178325129', '大明', '123', '17计科', '男', 22, '计算机与信息科学系', '计算机科学与技术', '18852175980', NULL, 1, 1, '0002');
INSERT INTO `student` VALUES ('178325130', '小帅', '123', '17软件', '男', 22, '计算机与信息科学系', '软件工程', '18852175981', NULL, 1, 1, '0001');
INSERT INTO `student` VALUES ('178325131', '小秦', '123', '17计科', NULL, NULL, '计算机与信息科学系', '计算机科学与技术', '18852175980', '972942040@qq.com', 1, 1, '0002');
INSERT INTO `student` VALUES ('178325132', '小软', '123', '17软件', NULL, NULL, '计算机与信息科学系', '软件工程', '18852175980', '972942040@qq.com', 1, 1, '0001');

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, 'LX', '123456', 2);
INSERT INTO `tb_admin` VALUES (2, 'yihao', '123456', 1);
INSERT INTO `tb_admin` VALUES (3, 'LH', '123456', 0);
INSERT INTO `tb_admin` VALUES (4, 'abc', '123456', 1);

-- ----------------------------
-- Table structure for tb_cancel
-- ----------------------------
DROP TABLE IF EXISTS `tb_cancel`;
CREATE TABLE `tb_cancel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_cancel
-- ----------------------------
INSERT INTO `tb_cancel` VALUES (1, '曹禺', '19100924', '去世', '2021-04-19 15:05:30');

-- ----------------------------
-- Table structure for tb_household
-- ----------------------------
DROP TABLE IF EXISTS `tb_household`;
CREATE TABLE `tb_household`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `relation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT 1,
  `birthday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthplace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `education` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `move_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `move_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `move_status` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_household
-- ----------------------------
INSERT INTO `tb_household` VALUES (1, '19900420', '鹿晗', '户主', 1, '1990-04-20', '北京', '汉族', '本科', NULL, NULL, 0, 1);
INSERT INTO `tb_household` VALUES (10, '19880615', '于朦胧', '户主', 1, '1988-06-15', '新疆', '汉族', '本科', NULL, NULL, 0, 1);
INSERT INTO `tb_household` VALUES (12, '20000824', '刘宇', '户主', 1, '2000-08-24', '安徽', '汉族', '本科', NULL, NULL, 0, 1);
INSERT INTO `tb_household` VALUES (13, '19730225', '李强', '户主', 1, '1973-02-25', '江苏', '汉族', '高中', NULL, NULL, 0, 1);
INSERT INTO `tb_household` VALUES (14, '19730816', '刘倩', '配偶', 2, '1975-08-16', '江苏', '汉族', '高中', NULL, NULL, 0, 1);
INSERT INTO `tb_household` VALUES (15, '19951225', '林煐岷', '户主', 1, '1995-12-25', '釜山', '朝鲜族', '本科', '北京', '釜山', 2, 1);
INSERT INTO `tb_household` VALUES (16, '19970917', '关晓彤', '配偶', 2, '1997-09-17', '北京', '满族', '本科', NULL, NULL, 0, 0);
INSERT INTO `tb_household` VALUES (17, '19970917', '关晓彤', '配偶', 2, '1997-09-17', '北京', '满族', '本科', NULL, NULL, 0, 0);
INSERT INTO `tb_household` VALUES (18, '19100924', '曹禺', '户主', 1, '1910-09-24', '湖北', '汉族', '高中', NULL, NULL, 0, -1);
INSERT INTO `tb_household` VALUES (19, '19941121', '张欣尧', '户主', 1, '1994-11-21', '内蒙古', '汉族', '本科', '北京', '内蒙古', 1, 1);

-- ----------------------------
-- Table structure for tb_move_in
-- ----------------------------
DROP TABLE IF EXISTS `tb_move_in`;
CREATE TABLE `tb_move_in`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `move_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `move_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_move_in
-- ----------------------------
INSERT INTO `tb_move_in` VALUES (7, '林煐岷', '19951225', '釜山', '北京', '2021-04-17 23:19:56', 1);
INSERT INTO `tb_move_in` VALUES (8, '张欣尧', '19941121', '内蒙古', '北京', '2021-04-25 17:19:45', 0);

-- ----------------------------
-- Table structure for tb_move_out
-- ----------------------------
DROP TABLE IF EXISTS `tb_move_out`;
CREATE TABLE `tb_move_out`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `move_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `move_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_move_out
-- ----------------------------
INSERT INTO `tb_move_out` VALUES (9, '林煐岷', '19951225', '釜山', '北京', '2021-04-17 23:02:06', '工作', 1);
INSERT INTO `tb_move_out` VALUES (10, '张欣尧', '19941121', '内蒙古', '北京', '2021-04-25 17:18:07', '工作', 1);

-- ----------------------------
-- Table structure for tb_tmp
-- ----------------------------
DROP TABLE IF EXISTS `tb_tmp`;
CREATE TABLE `tb_tmp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT 1,
  `nation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `education` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tmp_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tmp_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_tmp
-- ----------------------------
INSERT INTO `tb_tmp` VALUES (4, '肖战', '19911005', 1, '汉族', '1991-10-05', '重庆', '本科', '北京', '工作', '2015-08-05', '2021-03-23', 1);
INSERT INTO `tb_tmp` VALUES (5, '张元英', '20040831', 2, '朝鲜族', '2004-08-31', '首尔', '高中', '釜山', '工作', '2021-04-07', '2024-04-07', 1);
INSERT INTO `tb_tmp` VALUES (6, '魏晨', '19860222', 1, '汉族', '1986-02-22', '兰州', '本科', '北京', '工作', '2007-06-15', '2022-04-20', 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `t_pwd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duties` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_state` int(1) NULL DEFAULT NULL COMMENT '1:正常 0:暂停',
  `dept_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  INDEX `major_id`(`major_id`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `base_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `base_major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2000', '评阅教师0', '男', 33, '123', '计算机与信息科学系', '无', '讲师', '教师', '18852175980', '972942040@qq.com', '否', 1, '0001', NULL);
INSERT INTO `teacher` VALUES ('2001', '评阅教师1', '男', 33, '123', '计算机与信息科学系', '无', '讲师', '教师', '', '911@qq.com', '否', 1, '0001', NULL);
INSERT INTO `teacher` VALUES ('2020001', '张三', '男', 33, '123', '计算机与信息科学系', '无', '讲师', '教师', '', '110@qq.com', '否', 1, '0001', NULL);
INSERT INTO `teacher` VALUES ('2020002', '李四', '男', 40, '123', '外语系', '无', '讲师', '教师', '120', '120@qq.com', '否', 1, '0002', NULL);
INSERT INTO `teacher` VALUES ('2020003', '王五', '男', 28, '123', '计算机与信息科学系', '无', '讲师', '教师', '', '119@qq.com', '否', 1, '0001', NULL);
INSERT INTO `teacher` VALUES ('2020666', '软工主任', '男', 29, '123', '计算机与信息科学系', '软件工程', '教授', '教导主任', '122', '122@qq.com', '是', 1, '0001', '0001');
INSERT INTO `teacher` VALUES ('2020888', '计科主任', '男', 30, '123', '计算机与信息科学系', '计算机科学与技术', '教授', '教导主任', '122', '122@qq.com', '是', 1, '0001', '0002');

-- ----------------------------
-- Table structure for thesis
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis`  (
  `thesis_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '论文编号',
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生编号',
  `titl_id` bigint(20) NULL DEFAULT NULL COMMENT '课题编号',
  `f_id` bigint(20) NULL DEFAULT NULL COMMENT '文件编号',
  `agree` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`thesis_id`) USING BTREE,
  INDEX `titl_id`(`titl_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `thesis_ibfk_1` FOREIGN KEY (`titl_id`) REFERENCES `title` (`titl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thesis_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thesis_ibfk_3` FOREIGN KEY (`f_id`) REFERENCES `myfile` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis
-- ----------------------------
INSERT INTO `thesis` VALUES (1, '178325124', 40, 7, '不通过');
INSERT INTO `thesis` VALUES (2, '178325124', 40, 8, '通过');
INSERT INTO `thesis` VALUES (3, '178325126', 42, 13, '通过');
INSERT INTO `thesis` VALUES (4, '178325125', 39, 21, '通过');

-- ----------------------------
-- Table structure for thesis_attachment
-- ----------------------------
DROP TABLE IF EXISTS `thesis_attachment`;
CREATE TABLE `thesis_attachment`  (
  `a_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_id` bigint(20) NULL DEFAULT NULL,
  `s_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  CONSTRAINT `thesis_attachment_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `myfile` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thesis_attachment_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis_attachment
-- ----------------------------
INSERT INTO `thesis_attachment` VALUES (1, 9, '178325124');
INSERT INTO `thesis_attachment` VALUES (2, 14, '178325126');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `titl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titl_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `titl_source` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `titl_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `titl_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `titl_state` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sel_state` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`titl_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE,
  CONSTRAINT `title_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (1, '第一个课题', '2000', '社会生产实践', '理论研究类', '第一个课题测试描述', '已审批', '已被选择', '软件工程');
INSERT INTO `title` VALUES (37, '第二个课题', '2000', '社会生产实践', '理论研究类', '第二个课题测试描述', '已审批', '已被选择', '软件工程');
INSERT INTO `title` VALUES (38, '基于JSP的毕业设计', '2000', '教学', '软件设计类', '这个课题希望学生踊跃报名', '已审批', '已被选择', '计算机科学与技术');
INSERT INTO `title` VALUES (39, '毕业设计', '2001', '教学', '软件设计类', '计算机类设计', '已审批', '已被选择', '计算机科学与技术');
INSERT INTO `title` VALUES (40, '第三个课题', '2000', '教师科研', '软件设计类', '第三个课题', '已审批', '已被选择', '计算机科学与技术');
INSERT INTO `title` VALUES (42, '张三老师的新课题', '2020001', '教师科研', '应用(试验)研究类', '这是张三老师的新课题。', '已审批', '已被选择', '计算机科学与技术');
INSERT INTO `title` VALUES (43, '张三老师的第二个课题', '2020001', '教师科研', '工程设计类', '计算机科学技术课题', '已审批', '已被选择', '计算机科学与技术');
INSERT INTO `title` VALUES (44, '新课题', '2020001', '教师科研', '工程设计类', '新课题', '已审批', '已被选择', '计算机科学与技术');
INSERT INTO `title` VALUES (45, '软工新课题', '2020001', '社会生产实践', '软件设计类', '这是给软件工程的新课题。', '已审批', '未被选择', '软件工程');
INSERT INTO `title` VALUES (46, '答辩的课题', '2020001', '社会生产实践', '软件设计类', '这是答辩的课题', '待审批', '未被选择', '计算机科学与技术');

-- ----------------------------
-- View structure for midcheckinfo
-- ----------------------------
DROP VIEW IF EXISTS `midcheckinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `midcheckinfo` AS select `mid_check`.`m_id` AS `m_id`,`mid_check`.`f_id` AS `f_id`,`mid_check`.`s_id` AS `s_id`,`mid_check`.`agree` AS `agree`,`myfile`.`f_name` AS `f_name`,`myfile`.`f_path` AS `f_path`,`myfile`.`upload_datetime` AS `upload_datetime`,`myfile`.`f_type` AS `f_type`,`teacher`.`t_id` AS `t_id`,`teacher`.`t_name` AS `t_name`,`student`.`s_name` AS `s_name`,`select_title`.`seltitl_state` AS `seltitl_state`,`title`.`titl_name` AS `titl_name`,`student`.`major` AS `major`,`student`.`batch` AS `batch` from (((((`mid_check` join `myfile` on((`mid_check`.`f_id` = `myfile`.`f_id`))) join `teacher`) join `student` on((`mid_check`.`s_id` = `student`.`s_id`))) join `select_title` on((`select_title`.`s_id` = `mid_check`.`s_id`))) join `title` on(((`select_title`.`titl_id` = `title`.`titl_id`) and (`title`.`t_id` = `teacher`.`t_id`))));

-- ----------------------------
-- View structure for openreportinfo
-- ----------------------------
DROP VIEW IF EXISTS `openreportinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `openreportinfo` AS select `open_report`.`r_id` AS `r_id`,`open_report`.`f_id` AS `f_id`,`open_report`.`s_id` AS `s_id`,`open_report`.`agree` AS `agree`,`myfile`.`f_name` AS `f_name`,`myfile`.`f_path` AS `f_path`,`myfile`.`upload_datetime` AS `upload_datetime`,`myfile`.`f_type` AS `f_type`,`teacher`.`t_id` AS `t_id`,`teacher`.`t_name` AS `t_name`,`student`.`s_name` AS `s_name`,`select_title`.`seltitl_state` AS `seltitl_state`,`title`.`titl_name` AS `titl_name`,`student`.`major` AS `major`,`student`.`batch` AS `batch` from (((((`open_report` join `myfile` on((`open_report`.`f_id` = `myfile`.`f_id`))) join `teacher`) join `student` on((`open_report`.`s_id` = `student`.`s_id`))) join `select_title` on((`select_title`.`s_id` = `open_report`.`s_id`))) join `title` on(((`select_title`.`titl_id` = `title`.`titl_id`) and (`title`.`t_id` = `teacher`.`t_id`))));

-- ----------------------------
-- View structure for projbookinfo
-- ----------------------------
DROP VIEW IF EXISTS `projbookinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `projbookinfo` AS select `proj_book`.`p_id` AS `p_id`,`proj_book`.`f_id` AS `f_id`,`proj_book`.`s_id` AS `s_id`,`proj_book`.`agree` AS `agree`,`myfile`.`f_name` AS `f_name`,`myfile`.`f_path` AS `f_path`,`myfile`.`upload_datetime` AS `upload_datetime`,`myfile`.`f_type` AS `f_type`,`teacher`.`t_id` AS `t_id`,`teacher`.`t_name` AS `t_name`,`student`.`s_name` AS `s_name`,`select_title`.`seltitl_state` AS `seltitl_state`,`title`.`titl_name` AS `titl_name`,`student`.`major` AS `major`,`student`.`batch` AS `batch` from (((((`proj_book` join `myfile` on((`proj_book`.`f_id` = `myfile`.`f_id`))) join `teacher`) join `student` on((`proj_book`.`s_id` = `student`.`s_id`))) join `select_title` on((`select_title`.`s_id` = `proj_book`.`s_id`))) join `title` on(((`select_title`.`titl_id` = `title`.`titl_id`) and (`title`.`t_id` = `teacher`.`t_id`))));

-- ----------------------------
-- View structure for reviewscore
-- ----------------------------
DROP VIEW IF EXISTS `reviewscore`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reviewscore` AS select `thesisinfo`.`f_id` AS `f_id`,`review`.`review_score` AS `review_score`,`review`.`review_comments` AS `review_comments`,`review`.`reply_id` AS `reply_id`,`thesisinfo`.`agree` AS `agree`,`review`.`member_t_id` AS `member_t_id`,`thesisinfo`.`t_id` AS `t_id`,`thesisinfo`.`titl_name` AS `titl_name`,`thesisinfo`.`major` AS `major`,`thesisinfo`.`batch` AS `batch`,`thesisinfo`.`titl_id` AS `titl_id`,`thesisinfo`.`s_name` AS `s_name`,`thesisinfo`.`t_name` AS `t_name`,`thesisinfo`.`f_name` AS `f_name`,`teacher`.`t_name` AS `member_t_name`,`review`.`review_type` AS `review_type`,`reply_group`.`reply_leader` AS `reply_leader`,`thesisinfo`.`s_id` AS `s_id`,`select_title`.`reply_score` AS `reply_score` from ((((`thesisinfo` join `review` on((`review`.`s_id` = `thesisinfo`.`s_id`))) join `teacher` on((`review`.`member_t_id` = `teacher`.`t_id`))) join `reply_group` on((`review`.`reply_id` = `reply_group`.`reply_id`))) join `select_title` on(((`select_title`.`s_id` = `thesisinfo`.`s_id`) and (`select_title`.`titl_id` = `thesisinfo`.`titl_id`))));

-- ----------------------------
-- View structure for seltitleinfo
-- ----------------------------
DROP VIEW IF EXISTS `seltitleinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `seltitleinfo` AS select `title`.`titl_id` AS `titl_id`,`title`.`titl_name` AS `titl_name`,`title`.`t_id` AS `t_id`,`title`.`titl_source` AS `titl_source`,`title`.`titl_type` AS `titl_type`,`title`.`titl_describe` AS `titl_describe`,`title`.`titl_state` AS `titl_state`,`title`.`sel_state` AS `sel_state`,`select_title`.`seltitl_state` AS `seltitl_state`,`teacher`.`t_name` AS `t_name`,`select_title`.`s_id` AS `s_id`,`title`.`major` AS `major`,`student`.`s_name` AS `s_name` from (((`title` join `select_title` on((`select_title`.`titl_id` = `title`.`titl_id`))) join `teacher` on((`title`.`t_id` = `teacher`.`t_id`))) join `student` on((`select_title`.`s_id` = `student`.`s_id`)));

-- ----------------------------
-- View structure for ss
-- ----------------------------
DROP VIEW IF EXISTS `ss`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `ss` AS select `select_title`.`s_id` AS `s_id`,`select_title`.`titl_id` AS `titl_id`,`select_title`.`t_score` AS `t_score`,`select_title`.`t_comments` AS `t_comments`,`select_title`.`reply_score` AS `reply_score`,`select_title`.`reply_comments` AS `reply_comments`,`select_title`.`seltitl_state` AS `seltitl_state`,`student`.`s_name` AS `s_name`,`student`.`s_pwd` AS `s_pwd`,`student`.`s_class` AS `s_class`,`student`.`sex` AS `sex`,`student`.`age` AS `age`,`student`.`dept` AS `dept`,`student`.`major` AS `major`,`student`.`phone` AS `phone`,`student`.`email` AS `email`,`student`.`batch` AS `batch` from (`select_title` join `student` on((`student`.`s_id` = `select_title`.`s_id`)));

-- ----------------------------
-- View structure for sss
-- ----------------------------
DROP VIEW IF EXISTS `sss`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sss` AS select `teacher`.`t_name` AS `t_name`,`title`.`titl_id` AS `titl_id`,`title`.`titl_name` AS `titl_name`,`title`.`t_id` AS `t_id`,`title`.`titl_source` AS `titl_source`,`title`.`titl_type` AS `titl_type`,`title`.`titl_describe` AS `titl_describe`,`title`.`titl_state` AS `titl_state`,`title`.`sel_state` AS `sel_state`,`title`.`major` AS `major` from (`title` join `teacher` on((`title`.`t_id` = `teacher`.`t_id`)));

-- ----------------------------
-- View structure for studentscore
-- ----------------------------
DROP VIEW IF EXISTS `studentscore`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `studentscore` AS select `title`.`titl_name` AS `titl_name`,`select_title`.`reply_comments` AS `reply_comments`,`select_title`.`reply_score` AS `reply_score`,`select_title`.`t_comments` AS `t_comments`,`select_title`.`t_score` AS `t_score`,`select_title`.`seltitl_state` AS `seltitl_state`,`select_title`.`titl_id` AS `titl_id`,`select_title`.`s_id` AS `s_id`,`teacher`.`t_id` AS `t_id`,`teacher`.`t_name` AS `t_name`,`student`.`s_name` AS `s_name`,`student`.`batch` AS `batch`,`student`.`major` AS `major` from (((`select_title` join `title` on((`title`.`titl_id` = `select_title`.`titl_id`))) join `teacher` on((`teacher`.`t_id` = `title`.`t_id`))) join `student` on((`select_title`.`s_id` = `student`.`s_id`)));

-- ----------------------------
-- View structure for thesisattachmentinfo
-- ----------------------------
DROP VIEW IF EXISTS `thesisattachmentinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `thesisattachmentinfo` AS select `teacher`.`t_id` AS `t_id`,`teacher`.`t_name` AS `t_name`,`title`.`titl_name` AS `titl_name`,`select_title`.`seltitl_state` AS `seltitl_state`,`thesis_attachment`.`a_id` AS `a_id`,`thesis_attachment`.`f_id` AS `f_id`,`thesis_attachment`.`s_id` AS `s_id`,`student`.`s_name` AS `s_name`,`student`.`s_class` AS `s_class`,`student`.`major` AS `major`,`myfile`.`f_name` AS `f_name`,`myfile`.`f_path` AS `f_path`,`myfile`.`upload_datetime` AS `upload_datetime`,`myfile`.`f_type` AS `f_type`,`student`.`batch` AS `batch` from (((((`thesis_attachment` join `student` on((`student`.`s_id` = `thesis_attachment`.`s_id`))) join `myfile` on((`myfile`.`f_id` = `thesis_attachment`.`f_id`))) join `select_title` on((`thesis_attachment`.`s_id` = `select_title`.`s_id`))) join `title` on((`select_title`.`titl_id` = `title`.`titl_id`))) join `teacher` on((`title`.`t_id` = `teacher`.`t_id`)));

-- ----------------------------
-- View structure for thesisinfo
-- ----------------------------
DROP VIEW IF EXISTS `thesisinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `thesisinfo` AS select `thesis`.`thesis_id` AS `thesis_id`,`thesis`.`f_id` AS `f_id`,`thesis`.`s_id` AS `s_id`,`thesis`.`agree` AS `agree`,`thesis`.`titl_id` AS `titl_id`,`myfile`.`f_name` AS `f_name`,`myfile`.`f_path` AS `f_path`,`myfile`.`upload_datetime` AS `upload_datetime`,`myfile`.`f_type` AS `f_type`,`teacher`.`t_id` AS `t_id`,`teacher`.`t_name` AS `t_name`,`student`.`s_name` AS `s_name`,`select_title`.`seltitl_state` AS `seltitl_state`,`title`.`titl_name` AS `titl_name`,`student`.`major` AS `major`,`student`.`batch` AS `batch` from (((((`thesis` join `myfile` on((`thesis`.`f_id` = `myfile`.`f_id`))) join `teacher`) join `student` on((`thesis`.`s_id` = `student`.`s_id`))) join `select_title` on((`select_title`.`s_id` = `thesis`.`s_id`))) join `title` on(((`select_title`.`titl_id` = `title`.`titl_id`) and (`title`.`t_id` = `teacher`.`t_id`))));

-- ----------------------------
-- View structure for titleinfo
-- ----------------------------
DROP VIEW IF EXISTS `titleinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `titleinfo` AS select `teacher`.`t_name` AS `t_name`,`title`.`titl_id` AS `titl_id`,`title`.`titl_name` AS `titl_name`,`title`.`t_id` AS `t_id`,`title`.`titl_source` AS `titl_source`,`title`.`titl_type` AS `titl_type`,`title`.`titl_describe` AS `titl_describe`,`title`.`titl_state` AS `titl_state`,`title`.`sel_state` AS `sel_state`,`title`.`major` AS `major` from (`title` join `teacher` on((`teacher`.`t_id` = `title`.`t_id`)));

SET FOREIGN_KEY_CHECKS = 1;

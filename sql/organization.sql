/*
 Navicat Premium Data Transfer

 Source Server         : centos7
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : 192.168.88.130:3306
 Source Schema         : knowledgegraph

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 12/03/2024 12:45:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
-- DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ORG_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ORG_DEC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  `UPDATE_TIME` datetime NULL DEFAULT NULL,
  `DISABLED` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, '斯坦福大学', '该学校很厉害', '2024-03-06 20:03:42', '2024-03-06 20:03:47', 0);
INSERT INTO `organization` VALUES (2, '西安电子科技大学', '西军电', '2024-03-12 09:22:54', '2024-03-12 09:22:57', 0);
INSERT INTO `organization` VALUES (3, '清华大学', '中国top2', '2024-03-12 09:23:22', '2024-03-12 09:23:25', 0);

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : xdu
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : knowledgegraph

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2024-03-06 16:06:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `expert`
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `ID` bigint(20) NOT NULL,
  `EXPERT_NAME` varchar(255) NOT NULL COMMENT '专家名称',
  `EXPERT_DEPTMENT` varchar(255) DEFAULT NULL COMMENT '专家所属单位',
  `EXPERT_DEC` varchar(255) DEFAULT NULL COMMENT '个人简介',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES ('1', '牛顿', 'A研究所', '万有引力是我发现的');
INSERT INTO `expert` VALUES ('2', '亚里士多德', 'B研究所', '多看看太空');
INSERT INTO `expert` VALUES ('3', '雷诺', 'C研究所', '明天多云转晴');

-- ----------------------------
-- Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'neo4j_test', '测试图谱', null, null, 'Neo4jTest', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'test', '测试图谱', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2022-03-24 15:46:10', '', '2022-03-24 15:48:23', null);
INSERT INTO `gen_table` VALUES ('3', 'graph', '图谱表', null, null, 'Graph', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'graph', '图谱维护', 'liaoquefei', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56', null);
INSERT INTO `gen_table` VALUES ('4', 'graph_member', '图谱成员表', null, null, 'GraphMember', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'member', '图谱成员维护', 'ruoyi', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2022-04-10 17:46:52', '', '2022-04-10 17:54:33', null);
INSERT INTO `gen_table` VALUES ('5', 'graph_node', '图节点表', null, null, 'GraphNode', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'node', '节点维护', 'liaoquefei', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51', null);
INSERT INTO `gen_table` VALUES ('6', 'graph_relationship', '图谱关系表', null, null, 'GraphRelationship', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'relationship', '关系维护', 'liaoquefei', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04', null);
INSERT INTO `gen_table` VALUES ('7', 'graph_apply', '申请表', null, null, 'GraphApply', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'apply', '申请审核', 'liaoquefei', '0', '/', '{\"parentMenuId\":\"2026\"}', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31', null);
INSERT INTO `gen_table` VALUES ('8', 'graph_node_video', '节点视频资源表', null, null, 'GraphNodeVideo', 'crud', 'com.knowledgegraph.neo4j', 'neo4j', 'video', '节点视频资源', 'liaoquefei', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12', null);

-- ----------------------------
-- Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'neo4j_test_key', '测试图谱主键', 'varchar(36)', 'String', 'neo4jTestKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '1', 'admin', '2022-03-24 15:46:10', '', '2022-03-24 15:48:23');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'neo4j_test_name', '测试图谱名称', 'varchar(200)', 'String', 'neo4jTestName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-03-24 15:46:10', '', '2022-03-24 15:48:23');
INSERT INTO `gen_table_column` VALUES ('15', '3', 'graph_key', '图主键', 'varchar(36)', 'String', 'graphKey', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('16', '3', 'graph_name', '图谱名称', 'varchar(50)', 'String', 'graphName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('17', '3', 'graph_type', '图谱类型', 'varchar(2)', 'String', 'graphType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'graph_type', '3', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('18', '3', 'graph_remark', '图谱简介', 'varchar(100)', 'String', 'graphRemark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '4', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('19', '3', 'graph_img_url', '图谱封面', 'varchar(200)', 'String', 'graphImgUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '5', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('20', '3', 'graph_views', '图浏览量', 'int(11)', 'Long', 'graphViews', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '6', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('21', '3', 'graph_time', '创建时间', 'datetime', 'Date', 'graphTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', '', '7', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('22', '3', 'graph_update_number', '图维护量', 'int(11)', 'Long', 'graphUpdateNumber', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '8', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('23', '3', 'create_by', null, 'varchar(36)', 'String', 'createBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '9', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('24', '3', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '10', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('25', '3', 'update_by', null, 'varchar(36)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '11', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '12', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'delete_flag', '删除 0-未删 1-已删', 'varchar(2)', 'String', 'deleteFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '13', 'admin', '2022-04-10 17:16:08', '', '2022-04-10 17:25:56');
INSERT INTO `gen_table_column` VALUES ('28', '4', 'graph_member_key', '主键', 'varchar(36)', 'String', 'graphMemberKey', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-10 17:46:52', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('29', '4', 'user_key', '用户主键', 'varchar(36)', 'String', 'userKey', '0', '0', null, null, null, '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-04-10 17:46:52', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('30', '4', 'graph_key', '图主键', 'varchar(36)', 'String', 'graphKey', '0', '0', null, null, null, '1', '1', 'EQ', 'select', '', '3', 'admin', '2022-04-10 17:46:52', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('31', '4', 'contribution_value', '贡献值', 'int(11)', 'Long', 'contributionValue', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '4', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('32', '4', 'join_time', '加入时间', 'datetime', 'Date', 'joinTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', '', '5', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('33', '4', 'graph_member_type', '成员类型', 'varchar(2)', 'String', 'graphMemberType', '0', '0', null, null, null, '1', '1', 'EQ', 'select', 'graph_member_type', '6', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('34', '4', 'create_by', null, 'varchar(36)', 'String', 'createBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '7', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '8', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'update_by', null, 'varchar(36)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '9', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '10', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'delete_flag', null, 'varchar(50)', 'String', 'deleteFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '11', 'admin', '2022-04-10 17:46:53', '', '2022-04-10 17:54:33');
INSERT INTO `gen_table_column` VALUES ('39', '5', 'graph_node_key', '图节点主键', 'varchar(36)', 'String', 'graphNodeKey', '1', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51');
INSERT INTO `gen_table_column` VALUES ('40', '5', 'graph_key', '图谱主键', 'varchar(36)', 'String', 'graphKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '2', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51');
INSERT INTO `gen_table_column` VALUES ('41', '5', 'graph_node_id', '节点ID', 'int(11)', 'Long', 'graphNodeId', '0', '0', null, null, '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51');
INSERT INTO `gen_table_column` VALUES ('42', '5', 'graph_node_name', '节点名称', 'varchar(36)', 'String', 'graphNodeName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51');
INSERT INTO `gen_table_column` VALUES ('43', '5', 'graph_node_myicon', '节点图标', 'varchar(50)', 'String', 'graphNodeMyicon', '0', '0', null, '1', '1', '1', null, 'EQ', 'select', '', '5', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51');
INSERT INTO `gen_table_column` VALUES ('44', '5', 'graph_node_remark', '节点简介', 'varchar(200)', 'String', 'graphNodeRemark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '6', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:51');
INSERT INTO `gen_table_column` VALUES ('45', '5', 'graph_node_update', '维护数', 'int(11)', 'Long', 'graphNodeUpdate', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '7', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('46', '5', 'graph_node_url', '节点文档', 'varchar(200)', 'String', 'graphNodeUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'editor', '', '8', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('47', '5', 'graph_node_time', '创建时间', 'datetime', 'Date', 'graphNodeTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', '', '9', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('48', '5', 'create_by', null, 'varchar(36)', 'String', 'createBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '10', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('49', '5', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '11', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('50', '5', 'update_by', null, 'varchar(36)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '12', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('51', '5', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '13', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('52', '5', 'delete_flag', null, 'varchar(2)', 'String', 'deleteFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '14', 'admin', '2022-04-10 19:55:20', '', '2022-04-10 20:06:52');
INSERT INTO `gen_table_column` VALUES ('53', '6', 'graph_relationship_id', '关系ID', 'int(11)', 'Long', 'graphRelationshipId', '1', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('54', '6', 'graph_key', '图主键', 'varchar(36)', 'String', 'graphKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('55', '6', 'graph_relationship_name', '关系名称', 'varchar(50)', 'String', 'graphRelationshipName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('56', '6', 'graph_relationship_from', '始节点ID', 'int(11)', 'Long', 'graphRelationshipFrom', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('57', '6', 'graph_relationship_from_name', '始节点名称', 'varchar(50)', 'String', 'graphRelationshipFromName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('58', '6', 'graph_relationship_to', '终节点ID', 'int(11)', 'Long', 'graphRelationshipTo', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('59', '6', 'graph_relationship_to_name', '终节点名称', 'varchar(50)', 'String', 'graphRelationshipToName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '7', 'admin', '2022-04-11 17:57:58', '', '2022-04-11 18:06:04');
INSERT INTO `gen_table_column` VALUES ('60', '7', 'apply_key', '申请主键', 'varchar(36)', 'String', 'applyKey', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('61', '7', 'apply_user', '申请人', 'varchar(36)', 'String', 'applyUser', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '2', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('62', '7', 'graph_key', '申请图', 'varchar(36)', 'String', 'graphKey', '0', '0', null, null, null, '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('63', '7', 'apply_time', '申请时间', 'datetime', 'Date', 'applyTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', '', '4', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('64', '7', 'apply_remark', '申请备注', 'varchar(200)', 'String', 'applyRemark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '5', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('65', '7', 'apply_sign', '审核状态', 'varchar(2)', 'String', 'applySign', '0', '0', null, null, null, '1', '1', 'EQ', 'select', 'apply_sign', '6', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('66', '7', 'apply_flag', '审核结果', 'varchar(2)', 'String', 'applyFlag', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'apply_flag', '7', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('67', '7', 'examine_time', '审核时间', 'datetime', 'Date', 'examineTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', '', '8', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('68', '7', 'examine_remark', '审核意见', 'varchar(200)', 'String', 'examineRemark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('69', '7', 'create_by', null, 'varchar(36)', 'String', 'createBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '10', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('70', '7', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '11', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('71', '7', 'update_by', null, 'varchar(36)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '12', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('72', '7', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '13', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('73', '7', 'delete_flag', null, 'varchar(2)', 'String', 'deleteFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '14', 'admin', '2022-04-11 21:28:19', '', '2022-04-11 21:49:31');
INSERT INTO `gen_table_column` VALUES ('74', '8', 'graph_node_video_key', '节点视频资源主键', 'varchar(36)', 'String', 'graphNodeVideoKey', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('75', '8', 'graph_node_key', '节点主键', 'varchar(36)', 'String', 'graphNodeKey', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '2', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('76', '8', 'graph_node_video_remark', '视频简介', 'varchar(200)', 'String', 'graphNodeVideoRemark', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('77', '8', 'graph_node_video_url', '资源链接', 'varchar(300)', 'String', 'graphNodeVideoUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '4', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('78', '8', 'create_by', '创建者', 'varchar(36)', 'String', 'createBy', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '5', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('79', '8', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('80', '8', 'update_by', null, 'varchar(36)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '7', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');
INSERT INTO `gen_table_column` VALUES ('81', '8', 'upadte_time', null, 'datetime', 'Date', 'upadteTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '8', 'admin', '2022-04-16 13:41:00', '', '2022-04-16 13:50:12');

-- ----------------------------
-- Table structure for `graph`
-- ----------------------------
DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph` (
  `graph_key` varchar(36) NOT NULL COMMENT '图主键',
  `graph_name` varchar(50) DEFAULT NULL COMMENT '图谱名称',
  `graph_type` varchar(2) DEFAULT NULL COMMENT '图谱类型 0-私有 1-公有',
  `graph_remark` varchar(100) DEFAULT NULL COMMENT '图谱简介',
  `graph_img_url` varchar(200) DEFAULT NULL COMMENT '图谱封面',
  `graph_views` int(11) DEFAULT '0' COMMENT '图浏览量',
  `graph_time` datetime DEFAULT NULL COMMENT '创建时间',
  `graph_update_number` int(11) DEFAULT '1' COMMENT '图维护量',
  `create_by` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` varchar(2) DEFAULT NULL COMMENT '删除 0-未删 1-已删',
  PRIMARY KEY (`graph_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='图谱表';

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES ('1', '图谱1', '1', 'aaa', 'https://t10.baidu.com/it/u=3766755745,337519599&fm=58', '0', null, '1', '1', '2024-03-05 15:53:40', null, null, null);
INSERT INTO `graph` VALUES ('2', '图谱2', '2', 'aaa', 'https://t10.baidu.com/it/u=3766755745,337519599&fm=58', '0', null, '1', null, '2024-03-05 15:54:18', null, null, null);

-- ----------------------------
-- Table structure for `graph_apply`
-- ----------------------------
DROP TABLE IF EXISTS `graph_apply`;
CREATE TABLE `graph_apply` (
  `apply_key` varchar(36) DEFAULT NULL COMMENT '申请主键',
  `apply_user` varchar(36) DEFAULT NULL COMMENT '申请人',
  `graph_key` varchar(36) DEFAULT NULL COMMENT '申请图',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `apply_remark` varchar(200) DEFAULT NULL COMMENT '申请备注',
  `apply_sign` varchar(2) DEFAULT '0' COMMENT '审核状态 0-未审核 1-已审核',
  `apply_flag` varchar(2) DEFAULT '0' COMMENT '审核结果 0-未通过 1-已通过',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  `examine_remark` varchar(200) DEFAULT NULL COMMENT '审核意见',
  `create_by` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='申请表';

-- ----------------------------
-- Records of graph_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `graph_member`
-- ----------------------------
DROP TABLE IF EXISTS `graph_member`;
CREATE TABLE `graph_member` (
  `graph_member_key` varchar(36) NOT NULL COMMENT '主键',
  `user_key` varchar(36) DEFAULT NULL COMMENT '用户主键',
  `graph_key` varchar(36) DEFAULT NULL COMMENT '图主键',
  `contribution_value` int(11) DEFAULT '0' COMMENT '贡献值',
  `join_time` datetime DEFAULT NULL COMMENT '加入时间',
  `graph_member_type` varchar(2) DEFAULT NULL COMMENT '成员类型 0-创建者 1-成员',
  `create_by` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`graph_member_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='图谱成员表';

-- ----------------------------
-- Records of graph_member
-- ----------------------------

-- ----------------------------
-- Table structure for `graph_node`
-- ----------------------------
DROP TABLE IF EXISTS `graph_node`;
CREATE TABLE `graph_node` (
  `graph_node_key` varchar(36) NOT NULL COMMENT '图节点主键',
  `graph_key` varchar(36) DEFAULT NULL COMMENT '图谱主键',
  `graph_node_id` int(11) DEFAULT NULL COMMENT '节点ID',
  `graph_node_name` varchar(36) DEFAULT NULL COMMENT '节点名称',
  `graph_node_myicon` varchar(50) DEFAULT NULL COMMENT '节点图标',
  `graph_node_remark` varchar(200) DEFAULT NULL COMMENT '节点简介',
  `graph_node_update` int(11) DEFAULT '1' COMMENT '维护数',
  `graph_node_url` longtext COMMENT '节点文档',
  `graph_node_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`graph_node_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='图节点表';

-- ----------------------------
-- Records of graph_node
-- ----------------------------

-- ----------------------------
-- Table structure for `graph_node_video`
-- ----------------------------
DROP TABLE IF EXISTS `graph_node_video`;
CREATE TABLE `graph_node_video` (
  `graph_node_video_key` varchar(36) DEFAULT NULL COMMENT '节点视频资源主键',
  `graph_node_key` varchar(36) DEFAULT NULL COMMENT '节点主键',
  `graph_node_video_remark` varchar(200) DEFAULT NULL COMMENT '视频简介',
  `graph_node_video_url` varchar(300) DEFAULT NULL COMMENT '资源链接',
  `create_by` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `upadte_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点视频资源表';

-- ----------------------------
-- Records of graph_node_video
-- ----------------------------
INSERT INTO `graph_node_video` VALUES ('91001e0f-aa95-4391-a9ce-2a7976b908dc', '0ed724da-89e1-42e6-9f03-47b1ca2fe778', '狂神说Java视频链接', 'https://www.bilibili.com/video/BV1MJ411v7tJ?spm_id_from=333.999.0.0', '1', '2022-04-16 14:45:07', null, null);

-- ----------------------------
-- Table structure for `graph_relationship`
-- ----------------------------
DROP TABLE IF EXISTS `graph_relationship`;
CREATE TABLE `graph_relationship` (
  `graph_relationship_id` int(11) NOT NULL COMMENT '关系ID',
  `graph_key` varchar(36) DEFAULT NULL COMMENT '图主键',
  `graph_relationship_name` varchar(50) DEFAULT NULL COMMENT '关系名称',
  `graph_relationship_from` int(11) DEFAULT NULL COMMENT '关系开始节点',
  `graph_relationship_from_name` varchar(50) DEFAULT NULL COMMENT '始节点名称',
  `graph_relationship_to` int(11) DEFAULT NULL COMMENT '关系',
  `graph_relationship_to_name` varchar(50) DEFAULT NULL COMMENT '终节点名称',
  PRIMARY KEY (`graph_relationship_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='图谱关系表';

-- ----------------------------
-- Records of graph_relationship
-- ----------------------------
INSERT INTO `graph_relationship` VALUES ('124', 'id5511081d8ea94206960035182c2fbe26', '1111', '1', '222', '2', '2222');

-- ----------------------------
-- Table structure for `neo4j_test`
-- ----------------------------
DROP TABLE IF EXISTS `neo4j_test`;
CREATE TABLE `neo4j_test` (
  `neo4j_test_key` varchar(36) DEFAULT NULL COMMENT '测试图谱主键',
  `neo4j_test_name` varchar(200) DEFAULT NULL COMMENT '测试图谱名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试图谱';

-- ----------------------------
-- Records of neo4j_test
-- ----------------------------

-- ----------------------------
-- Table structure for `orgnization`
-- ----------------------------
DROP TABLE IF EXISTS `orgnization`;
CREATE TABLE `orgnization` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `ORG_NAME` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DISABLED` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orgnization
-- ----------------------------
INSERT INTO `orgnization` VALUES ('1', '斯坦福大学', '2024-03-06 15:07:36', '2024-03-06 15:07:39', '0');
INSERT INTO `orgnization` VALUES ('2', '北京大学', '2024-03-06 15:07:52', '2024-03-06 15:07:55', '0');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `relationship`
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY` int(10) DEFAULT NULL COMMENT '0：属于；1：合作；2：到访',
  `ORG_ID` bigint(20) NOT NULL COMMENT '组织ID',
  `EXPERT_ID` bigint(20) NOT NULL COMMENT '专家ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of relationship
-- ----------------------------
INSERT INTO `relationship` VALUES ('1', '1', '1', '1');
INSERT INTO `relationship` VALUES ('2', '1', '1', '2');
INSERT INTO `relationship` VALUES ('3', '1', '1', '3');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-24 14:38:28', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-24 14:38:28', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-24 14:38:28', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-24 14:38:28', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-03-24 14:38:28', 'admin', '2022-04-18 22:05:55', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('6', '引导图谱', 'graphIndex', '萌新引导图谱', 'N', 'admin', '2022-04-13 15:21:08', 'admin', '2022-04-17 15:41:04', null);
INSERT INTO `sys_config` VALUES ('7', '注册初始角色编码', 'user_role_default', '2', 'N', 'admin', '2022-04-18 15:21:18', 'admin', '2022-04-18 15:22:02', null);
INSERT INTO `sys_config` VALUES ('8', '注册初始账号状态', 'user_status', '0', 'Y', 'admin', '2022-04-18 15:23:16', '', null, null);

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '吉林农业科技学院', '0', '了却非', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-24 14:38:13', 'admin', '2022-04-11 17:15:34');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '18级', '1', '了却非', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-24 14:38:13', 'admin', '2022-04-11 17:15:57');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '19级', '2', '了却非', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-24 14:38:13', 'admin', '2022-04-11 17:17:47');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '软件工程', '1', '了却非', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-24 14:38:13', 'admin', '2022-04-11 17:17:07');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-24 14:38:13', '', null);
INSERT INTO `sys_dept` VALUES ('105', '102', '0,100,102', '网络工程', '3', '了却非', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-24 14:38:13', 'admin', '2022-04-11 17:20:05');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-24 14:38:13', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-24 14:38:13', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '网络工程0', '1', '了却非', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-24 14:38:13', 'admin', '2022-04-11 17:18:06');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-24 14:38:13', '', null);

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-24 14:38:26', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-24 14:38:26', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-24 14:38:27', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('29', '0', '私有', '0', 'graph_type', 'primary', 'default', 'N', '0', 'admin', '2022-04-10 17:17:37', 'admin', '2022-04-11 21:45:16', null);
INSERT INTO `sys_dict_data` VALUES ('30', '1', '公有', '1', 'graph_type', 'success', 'default', 'N', '0', 'admin', '2022-04-10 17:17:51', 'admin', '2022-04-11 21:45:27', null);
INSERT INTO `sys_dict_data` VALUES ('31', '0', '创建者', '0', 'graph_member_type', 'primary', 'default', 'N', '0', 'admin', '2022-04-10 17:50:00', 'admin', '2022-04-11 21:46:13', null);
INSERT INTO `sys_dict_data` VALUES ('32', '1', '成员', '1', 'graph_member_type', 'success', 'default', 'N', '0', 'admin', '2022-04-10 17:50:15', 'admin', '2022-04-11 21:46:00', null);
INSERT INTO `sys_dict_data` VALUES ('33', '0', '未审核', '0', 'apply_sign', 'warning', 'default', 'N', '0', 'admin', '2022-04-11 21:35:02', 'admin', '2022-04-11 21:44:37', null);
INSERT INTO `sys_dict_data` VALUES ('34', '1', '已审核', '1', 'apply_sign', 'success', 'default', 'N', '0', 'admin', '2022-04-11 21:35:12', 'admin', '2022-04-11 21:44:46', null);
INSERT INTO `sys_dict_data` VALUES ('35', '0', '未通过', '0', 'apply_flag', 'warning', 'default', 'N', '0', 'admin', '2022-04-11 21:36:46', 'admin', '2022-04-11 21:44:08', null);
INSERT INTO `sys_dict_data` VALUES ('36', '1', '已通过', '1', 'apply_flag', 'success', 'default', 'N', '0', 'admin', '2022-04-11 21:36:59', 'admin', '2022-04-11 21:44:18', null);

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-24 14:38:25', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-24 14:38:25', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-24 14:38:25', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-03-24 14:38:25', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-03-24 14:38:25', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-24 14:38:25', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-24 14:38:25', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-24 14:38:25', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-24 14:38:25', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-03-24 14:38:26', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '图谱类型', 'graph_type', '0', 'admin', '2022-04-10 17:16:57', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('12', '成员类型', 'graph_member_type', '0', 'admin', '2022-04-10 17:48:50', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('13', '审核状态', 'apply_sign', '0', 'admin', '2022-04-11 21:34:46', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('14', '审核结果', 'apply_flag', '0', 'admin', '2022-04-11 21:35:42', '', null, null);

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-24 14:38:29', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-24 14:38:29', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-24 14:38:29', '', null, '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 15:34:50');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-24 17:10:19');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 17:10:23');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-24 19:15:03');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 19:15:06');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-24 20:52:48');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 20:52:57');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 11:31:25');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-25 11:31:33');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-25 11:45:58');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-25 11:46:01');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 11:46:04');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 13:31:43');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 15:17:36');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 16:19:48');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-04-04 14:57:41');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-04 14:57:47');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-04 14:57:50');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-05 13:58:23');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-05 17:41:26');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-06 19:56:19');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 11:48:26');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 14:03:05');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 14:36:05');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:07:04');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:40:48');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-04-08 19:39:45');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 19:39:50');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-09 14:21:35');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-10 17:07:42');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-10 17:07:45');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-10 18:50:50');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-10 19:26:05');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-10 19:26:11');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 11:07:25');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-11 12:19:02');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 12:19:08');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 14:52:34');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 16:47:23');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 17:29:15');
INSERT INTO `sys_logininfor` VALUES ('140', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 17:29:28');
INSERT INTO `sys_logininfor` VALUES ('141', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 17:34:34');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 17:34:39');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 19:00:26');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 19:46:21');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 22:15:04');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 23:04:47');
INSERT INTO `sys_logininfor` VALUES ('147', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 23:04:57');
INSERT INTO `sys_logininfor` VALUES ('148', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 23:05:04');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 23:05:11');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-11 23:05:36');
INSERT INTO `sys_logininfor` VALUES ('151', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 23:05:44');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 11:15:46');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 12:30:57');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 13:33:09');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 15:32:55');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-12 16:55:35');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 16:55:40');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 15:08:52');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-13 20:25:07');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 20:25:10');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-13 20:38:32');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 20:38:41');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 21:22:43');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-14 19:45:44');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 14:04:24');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 15:19:22');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 19:29:12');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 20:37:21');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 22:07:21');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-16 13:18:38');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-16 18:10:06');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-16 18:10:09');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-17 13:09:03');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-17 13:13:29');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-17 13:13:34');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '192.168.1.4', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2022-04-17 13:15:57');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '192.168.1.4', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-04-17 13:16:04');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-17 14:00:29');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-17 14:40:10');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 10:16:46');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 10:17:57');
INSERT INTO `sys_logininfor` VALUES ('182', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 10:18:05');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 10:19:00');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 10:19:04');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 10:19:08');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 10:19:11');
INSERT INTO `sys_logininfor` VALUES ('187', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 10:39:49');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 10:39:57');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 10:57:34');
INSERT INTO `sys_logininfor` VALUES ('190', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 10:57:43');
INSERT INTO `sys_logininfor` VALUES ('191', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 10:57:48');
INSERT INTO `sys_logininfor` VALUES ('192', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 11:02:11');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 11:02:17');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 11:02:21');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 11:05:10');
INSERT INTO `sys_logininfor` VALUES ('196', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 11:05:21');
INSERT INTO `sys_logininfor` VALUES ('197', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 11:07:47');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 11:07:56');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 14:08:29');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 15:15:22');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 16:10:18');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 16:10:21');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 17:08:40');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 20:06:27');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 20:06:31');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 21:29:27');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 21:50:06');
INSERT INTO `sys_logininfor` VALUES ('208', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 21:50:19');
INSERT INTO `sys_logininfor` VALUES ('209', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 21:51:03');
INSERT INTO `sys_logininfor` VALUES ('210', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 21:51:45');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 21:51:57');
INSERT INTO `sys_logininfor` VALUES ('212', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 21:58:46');
INSERT INTO `sys_logininfor` VALUES ('213', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-18 22:06:09');
INSERT INTO `sys_logininfor` VALUES ('214', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-18 22:06:31');
INSERT INTO `sys_logininfor` VALUES ('215', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 22:06:50');
INSERT INTO `sys_logininfor` VALUES ('216', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 22:07:24');
INSERT INTO `sys_logininfor` VALUES ('217', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 22:07:44');
INSERT INTO `sys_logininfor` VALUES ('218', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 22:07:47');
INSERT INTO `sys_logininfor` VALUES ('219', 'liaoquefei', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 22:25:55');
INSERT INTO `sys_logininfor` VALUES ('220', 'arrival', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-18 22:26:21');
INSERT INTO `sys_logininfor` VALUES ('221', 'arrival', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 22:26:29');
INSERT INTO `sys_logininfor` VALUES ('222', 'arrival', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 22:29:15');
INSERT INTO `sys_logininfor` VALUES ('223', 'arrival', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 22:29:19');
INSERT INTO `sys_logininfor` VALUES ('224', 'arrival', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-18 22:33:55');
INSERT INTO `sys_logininfor` VALUES ('225', 'lqf', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-18 22:34:45');
INSERT INTO `sys_logininfor` VALUES ('226', 'lqf', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-18 22:34:52');
INSERT INTO `sys_logininfor` VALUES ('227', 'lqf', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 22:34:58');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-19 10:55:00');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-19 11:19:13');
INSERT INTO `sys_logininfor` VALUES ('230', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-19 11:19:27');
INSERT INTO `sys_logininfor` VALUES ('231', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-19 11:19:29');
INSERT INTO `sys_logininfor` VALUES ('232', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-19 11:19:33');
INSERT INTO `sys_logininfor` VALUES ('233', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-19 11:20:22');
INSERT INTO `sys_logininfor` VALUES ('234', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-19 11:20:25');
INSERT INTO `sys_logininfor` VALUES ('235', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-19 11:21:22');
INSERT INTO `sys_logininfor` VALUES ('236', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-19 11:22:05');
INSERT INTO `sys_logininfor` VALUES ('237', 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-19 11:22:33');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-04-19 11:24:40');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-19 11:24:43');
INSERT INTO `sys_logininfor` VALUES ('240', 'liang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-03-04 18:51:36');
INSERT INTO `sys_logininfor` VALUES ('241', 'liang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-04 18:51:52');
INSERT INTO `sys_logininfor` VALUES ('242', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-03-04 19:36:49');
INSERT INTO `sys_logininfor` VALUES ('243', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-04 19:36:56');
INSERT INTO `sys_logininfor` VALUES ('244', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-04 19:37:01');
INSERT INTO `sys_logininfor` VALUES ('245', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-04 19:37:05');
INSERT INTO `sys_logininfor` VALUES ('246', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 15:06:52');
INSERT INTO `sys_logininfor` VALUES ('247', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 09:14:18');
INSERT INTO `sys_logininfor` VALUES ('248', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 10:44:03');
INSERT INTO `sys_logininfor` VALUES ('249', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-06 12:45:16');
INSERT INTO `sys_logininfor` VALUES ('250', '123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 12:45:21');
INSERT INTO `sys_logininfor` VALUES ('251', 'liang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 12:57:10');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '2', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-11 17:11:06', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '3', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-11 17:11:14', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '4', 'tool', null, '', '1', '0', 'M', '1', '1', '', 'tool', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 10:37:09', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '5', 'http://ruoyi.vip', null, '', '0', '0', 'M', '1', '1', '', 'guide', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-11 17:11:29', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-24 14:38:15', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-24 14:38:15', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-24 14:38:15', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 15:19:44', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '1', '0', 'system:post:list', 'post', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 15:19:49', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-24 14:38:15', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-03-24 14:38:15', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-03-24 14:38:15', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '1', '0', '', 'log', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 10:38:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-03-24 14:38:15', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-03-24 14:38:15', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '1', '0', 'monitor:druid:list', 'druid', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 10:37:35', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '1', '0', 'monitor:server:list', 'server', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 10:37:44', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '1', '0', 'monitor:cache:list', 'redis', 'admin', '2022-03-24 14:38:15', 'admin', '2022-04-18 10:37:49', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-24 14:38:16', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-24 14:38:16', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-24 14:38:16', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-03-24 14:38:16', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-03-24 14:38:16', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-24 14:38:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-03-24 14:38:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-24 14:38:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '测试', '0', '10', 'test', null, null, '1', '0', 'M', '1', '1', '', 'bug', 'admin', '2022-03-24 15:47:54', 'admin', '2022-04-16 15:48:16', '');
INSERT INTO `sys_menu` VALUES ('2001', '测试图谱', '2000', '1', 'test', 'neo4j/test/index', null, '1', '0', 'C', '0', '0', 'neo4j:test:list', '#', 'admin', '2022-03-24 15:52:07', '', null, '测试图谱菜单');
INSERT INTO `sys_menu` VALUES ('2002', '测试图谱查询', '2001', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:test:query', '#', 'admin', '2022-03-24 15:52:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '测试图谱新增', '2001', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:test:add', '#', 'admin', '2022-03-24 15:52:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '测试图谱修改', '2001', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:test:edit', '#', 'admin', '2022-03-24 15:52:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '测试图谱删除', '2001', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:test:remove', '#', 'admin', '2022-03-24 15:52:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '测试图谱导出', '2001', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:test:export', '#', 'admin', '2022-03-24 15:52:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '图谱管理', '0', '0', 'graph', null, null, '1', '0', 'M', '0', '0', '', 'tree', 'admin', '2022-04-10 17:10:09', 'admin', '2022-04-10 17:10:34', '');
INSERT INTO `sys_menu` VALUES ('2008', '图谱维护', '2007', '1', 'graph', 'neo4j/graph/index', null, '1', '0', 'C', '0', '0', 'neo4j:graph:list', 'nested', 'admin', '2022-04-10 17:56:29', 'admin', '2022-04-11 19:01:05', '图谱维护菜单');
INSERT INTO `sys_menu` VALUES ('2009', '图谱维护查询', '2008', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:graph:query', '#', 'admin', '2022-04-10 17:56:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '图谱维护新增', '2008', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:graph:add', '#', 'admin', '2022-04-10 17:56:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '图谱维护修改', '2008', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:graph:edit', '#', 'admin', '2022-04-10 17:56:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '图谱维护删除', '2008', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:graph:remove', '#', 'admin', '2022-04-10 17:56:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '图谱维护导出', '2008', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:graph:export', '#', 'admin', '2022-04-10 17:56:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '成员维护', '2026', '1', 'member', 'neo4j/member/index', null, '1', '0', 'C', '0', '0', 'neo4j:member:list', 'people', 'admin', '2022-04-10 17:56:53', 'admin', '2022-04-11 19:03:31', '图谱成员维护菜单');
INSERT INTO `sys_menu` VALUES ('2015', '图谱成员维护查询', '2014', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:member:query', '#', 'admin', '2022-04-10 17:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '图谱成员维护新增', '2014', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:member:add', '#', 'admin', '2022-04-10 17:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '图谱成员维护修改', '2014', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:member:edit', '#', 'admin', '2022-04-10 17:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '图谱成员维护删除', '2014', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:member:remove', '#', 'admin', '2022-04-10 17:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '图谱成员维护导出', '2014', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:member:export', '#', 'admin', '2022-04-10 17:56:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '节点维护', '2007', '2', 'node', 'neo4j/node/index', null, '1', '0', 'C', '0', '0', 'neo4j:node:list', 'radio', 'admin', '2022-04-10 20:12:52', 'admin', '2022-04-11 19:02:48', '节点维护菜单');
INSERT INTO `sys_menu` VALUES ('2021', '节点维护查询', '2020', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:node:query', '#', 'admin', '2022-04-10 20:12:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '节点维护新增', '2020', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:node:add', '#', 'admin', '2022-04-10 20:12:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '节点维护修改', '2020', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:node:edit', '#', 'admin', '2022-04-10 20:12:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '节点维护删除', '2020', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:node:remove', '#', 'admin', '2022-04-10 20:12:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '节点维护导出', '2020', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:node:export', '#', 'admin', '2022-04-10 20:12:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '成员管理', '0', '1', 'peoples', null, null, '1', '0', 'M', '0', '0', null, 'peoples', 'admin', '2022-04-11 17:12:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '关系维护', '2007', '3', 'relationship', 'neo4j/relationship/index', null, '1', '0', 'C', '0', '0', 'neo4j:relationship:list', 'swagger', 'admin', '2022-04-11 18:54:51', 'admin', '2022-04-11 19:02:35', '关系维护菜单');
INSERT INTO `sys_menu` VALUES ('2028', '关系维护查询', '2027', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:relationship:query', '#', 'admin', '2022-04-11 18:54:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2029', '关系维护新增', '2027', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:relationship:add', '#', 'admin', '2022-04-11 18:54:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2030', '关系维护修改', '2027', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:relationship:edit', '#', 'admin', '2022-04-11 18:54:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2031', '关系维护删除', '2027', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:relationship:remove', '#', 'admin', '2022-04-11 18:54:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2032', '关系维护导出', '2027', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:relationship:export', '#', 'admin', '2022-04-11 18:54:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2033', '申请审核', '2026', '1', 'apply', 'neo4j/apply/index', null, '1', '0', 'C', '0', '0', 'neo4j:apply:list', 'log', 'admin', '2022-04-11 21:57:38', 'admin', '2022-04-11 22:18:16', '申请审核菜单');
INSERT INTO `sys_menu` VALUES ('2034', '申请审核查询', '2033', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:apply:query', '#', 'admin', '2022-04-11 21:57:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2035', '申请审核新增', '2033', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:apply:add', '#', 'admin', '2022-04-11 21:57:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2036', '申请审核修改', '2033', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:apply:edit', '#', 'admin', '2022-04-11 21:57:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2037', '申请审核删除', '2033', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:apply:remove', '#', 'admin', '2022-04-11 21:57:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2038', '申请审核导出', '2033', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:apply:export', '#', 'admin', '2022-04-11 21:57:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2039', '我的申请', '2026', '3', 'myapply', 'neo4j/myapply/index', null, '1', '0', 'C', '0', '0', 'neo4j:apply:list', 'edit', 'admin', '2022-04-11 23:01:30', 'admin', '2022-04-11 23:01:44', '');
INSERT INTO `sys_menu` VALUES ('2040', '我的申请查询', '2039', '1', '', null, null, '1', '0', 'F', '0', '0', 'neo4j:apply:query', '#', 'admin', '2022-04-11 23:02:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2041', '我的申请新增', '2039', '2', '', null, null, '1', '0', 'F', '0', '0', 'neo4j:apply:add', '#', 'admin', '2022-04-11 23:02:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2042', '我的申请修改', '2039', '3', '', null, null, '1', '0', 'F', '0', '0', 'neo4j:apply:edit', '#', 'admin', '2022-04-11 23:03:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('2043', '我的申请删除', '2039', '4', '', null, null, '1', '0', 'F', '0', '0', 'neo4j:apply:remove', '#', 'admin', '2022-04-11 23:03:48', 'admin', '2022-04-11 23:04:07', '');
INSERT INTO `sys_menu` VALUES ('2044', '我的申请导出', '2039', '5', '', null, null, '1', '0', 'F', '0', '0', 'neo4j:apply:export', '#', 'admin', '2022-04-11 23:04:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2045', '节点视频资源', '2020', '1', 'video', 'neo4j/video/index', null, '1', '0', 'C', '1', '0', 'neo4j:video:list', 'server', 'admin', '2022-04-16 13:51:51', 'admin', '2022-04-16 13:59:37', '节点视频资源菜单');
INSERT INTO `sys_menu` VALUES ('2046', '节点视频资源查询', '2045', '1', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:video:query', '#', 'admin', '2022-04-16 13:51:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2047', '节点视频资源新增', '2045', '2', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:video:add', '#', 'admin', '2022-04-16 13:51:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2048', '节点视频资源修改', '2045', '3', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:video:edit', '#', 'admin', '2022-04-16 13:51:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2049', '节点视频资源删除', '2045', '4', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:video:remove', '#', 'admin', '2022-04-16 13:51:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2050', '节点视频资源导出', '2045', '5', '#', '', null, '1', '0', 'F', '0', '0', 'neo4j:video:export', '#', 'admin', '2022-04-16 13:51:51', '', null, '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-24 14:38:30', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-03-24 14:38:30', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('3', '公告测试', '2', 0x3C7020636C6173733D22716C2D696E64656E742D38223EE585ACE5918AE6B58BE8AF953C696D67207372633D222F6465762D6170692F70726F66696C652F75706C6F61642F323032322F30342F31312F39653031373031652D386365632D343566622D623361352D3463316136663139393761632E6A7067223E3C2F703E, '0', 'admin', '2022-04-11 17:29:08', 'admin', '2022-04-15 16:22:22', null);
INSERT INTO `sys_notice` VALUES ('4', '通知测试', '1', 0x3C703EE9809AE79FA5E6B58BE8AF953C2F703E, '0', 'ry', '2022-04-11 17:34:27', '', null, null);

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'neo4j_test', null, '1', 'Could not open a new Neo4j session: Unsupported authentication token, scheme \'none\' is only allowed when auth is disabled.; nested exception is org.neo4j.driver.exceptions.AuthenticationException: Unsupported authentication token, scheme \'none\' is only allowed when auth is disabled.', '2022-03-24 15:35:07');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'neo4j_test', null, '1', 'Could not open a new Neo4j session: Unsupported authentication token, scheme \'none\' is only allowed when auth is disabled.; nested exception is org.neo4j.driver.exceptions.AuthenticationException: Unsupported authentication token, scheme \'none\' is only allowed when auth is disabled.', '2022-03-24 15:35:57');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'neo4j_test', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-24 15:46:10');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Neo4jTestKey\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"neo4jTestKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"测试图谱主键\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648107970000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"neo4j_test_key\"},{\"capJavaField\":\"Neo4jTestName\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"neo4jTestName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"测试图谱名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648107970000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"neo4j_test_name\"}],\"businessName\":\"test\",\"moduleName\":\"neo4j\",\"className\":\"Neo4jTest\",\"tableName\":\"neo4j_test\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":3}\",\"genType\":\"0\",\"packageName\":\"com.knowledgegraph.neo4j\",\"functionName\":\"测试图谱\",\"tree\":false,\"tableComment\":\"测试图谱\",\"params\":{\"parentMenuId\":3},\"tplCategory\":\"crud\",\"parentMenuId\":\"3\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-24 15:47:03');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":10,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/test\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-24 15:47:54');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":10,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"test\",\"children\":[],\"createTime\":1648108074000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-24 15:48:07');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Neo4jTestKey\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"neo4jTestKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"测试图谱主键\",\"isQuery\":\"1\",\"updateTime\":1648108023000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648107970000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"neo4j_test_key\"},{\"capJavaField\":\"Neo4jTestName\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"neo4jTestName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"测试图谱名称\",\"isQuery\":\"1\",\"updateTime\":1648108023000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648107970000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"neo4j_test_name\"}],\"businessName\":\"test\",\"moduleName\":\"neo4j\",\"className\":\"Neo4jTest\",\"tableName\":\"neo4j_test\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2000}\",\"genType\":\"0\",\"packageName\":\"com.knowledgegraph.neo4j\",\"functionName\":\"测试图谱\",\"tree\":false,\"tableComment\":\"测试图谱\",\"params\":{\"parentMenuId\":2000},\"tplCategory\":\"crud\",\"parentMenuId\":\"2000\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-24 15:48:23');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-03-24 15:48:26');
INSERT INTO `sys_oper_log` VALUES ('108', '用户头像', '2', 'com.knowledgegraph.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"code\":200}', '0', null, '2022-03-29 16:35:32');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":4,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-09 14:24:08');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:08:02');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":0,\"menuName\":\"图谱管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"123\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:10:09');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":0,\"menuName\":\"图谱管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"graph\",\"children\":[],\"createTime\":1649581809000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:10:34');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '3', 'com.knowledgegraph.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:16:04');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:16:09');
INSERT INTO `sys_oper_log` VALUES ('115', '字典类型', '1', 'com.knowledgegraph.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"图谱类型\",\"params\":{},\"dictType\":\"graph_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:16:57');
INSERT INTO `sys_oper_log` VALUES ('116', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"graph_type\",\"dictLabel\":\"私有\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:17:38');
INSERT INTO `sys_oper_log` VALUES ('117', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"graph_type\",\"dictLabel\":\"公有\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:17:51');
INSERT INTO `sys_oper_log` VALUES ('118', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"图主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649582168000,\"tableId\":3,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"GraphName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图谱名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649582168000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"graph_name\"},{\"capJavaField\":\"GraphType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"graph_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"图谱类型\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649582168000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"graph_type\"},{\"capJavaField\":\"GraphRemark\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphRemark\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"图谱简介\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"c', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:24:35');
INSERT INTO `sys_oper_log` VALUES ('119', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-10 17:24:39');
INSERT INTO `sys_oper_log` VALUES ('120', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"图主键\",\"updateTime\":1649582675000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649582168000,\"tableId\":3,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"GraphName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图谱名称\",\"isQuery\":\"1\",\"updateTime\":1649582675000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649582168000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"graph_name\"},{\"capJavaField\":\"GraphType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"graph_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"图谱类型\",\"isQuery\":\"1\",\"updateTime\":1649582675000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649582168000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"graph_type\"},{\"capJavaField\":\"GraphRemark\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphRemark\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"图谱简介\",\"updateTime\":164958', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:25:56');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-10 17:26:20');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph_member', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:46:53');
INSERT INTO `sys_oper_log` VALUES ('123', '字典类型', '1', 'com.knowledgegraph.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"成员类型\",\"params\":{},\"dictType\":\"graph_member_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:48:50');
INSERT INTO `sys_oper_log` VALUES ('124', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"graph_member_type\",\"dictLabel\":\"创建者\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:50:00');
INSERT INTO `sys_oper_log` VALUES ('125', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"graph_member_type\",\"dictLabel\":\"成员\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:50:15');
INSERT INTO `sys_oper_log` VALUES ('126', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"GraphMemberKey\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphMemberKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649584012000,\"tableId\":4,\"pk\":false,\"columnName\":\"graph_member_key\"},{\"capJavaField\":\"UserKey\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"userKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"用户主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649584012000,\"tableId\":4,\"pk\":false,\"columnName\":\"user_key\"},{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphKey\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"图主键\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649584012000,\"tableId\":4,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"ContributionValue\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"contributionValue\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"贡献值\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649584013000,\"tableId\":4,\"pk', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 17:54:33');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-10 17:54:37');
INSERT INTO `sys_oper_log` VALUES ('128', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"graphImgUrl\":\"/profile/upload/2022/04/10/5cb2baec-f72b-467f-a2e7-216f76f5b6e8.jpg\",\"params\":{},\"graphRemark\":\"测试图谱\",\"graphTime\":1649587900693,\"graphKey\":\"e353a4bb-b24b-45c6-91f5-002722841f04\",\"graphName\":\"测试图谱\",\"createBy\":\"1\",\"createTime\":1649587900693}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 18:51:40');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph_node', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 19:55:20');
INSERT INTO `sys_oper_log` VALUES ('130', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphNodeKey\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphNodeKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"图节点主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649591720000,\"tableId\":5,\"pk\":true,\"columnName\":\"graph_node_key\"},{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":40,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphKey\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"图谱主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649591720000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"GraphNodeId\",\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphNodeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"节点ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649591720000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"graph_node_id\"},{\"capJavaField\":\"GraphNodeName\",\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"节点名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(36)\",', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 20:02:02');
INSERT INTO `sys_oper_log` VALUES ('131', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphNodeKey\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphNodeKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"图节点主键\",\"updateTime\":1649592121000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649591720000,\"tableId\":5,\"pk\":true,\"columnName\":\"graph_node_key\"},{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":40,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphKey\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"图谱主键\",\"isQuery\":\"1\",\"updateTime\":1649592121000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649591720000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"GraphNodeId\",\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphNodeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"节点ID\",\"isQuery\":\"1\",\"updateTime\":1649592121000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649591720000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"graph_node_id\"},{\"capJavaField\":\"GraphNodeName\",\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"节点名称\",\"isQuery\":\"1\",\"updateTime\":16495', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 20:06:52');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-10 20:09:30');
INSERT INTO `sys_oper_log` VALUES ('133', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-10 20:10:09');
INSERT INTO `sys_oper_log` VALUES ('134', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"test\",\"graphNodeName\":\"test\",\"params\":{},\"graphNodeUrl\":\"<p><strong>test</strong></p><p><strong><span class=\\\"ql-cursor\\\">﻿</span></strong><img src=\\\"/dev-api/profile/upload/2022/04/10/d4d667ef-36db-412e-95b8-4b2d66a64d85.jpg\\\"></p>\",\"graphKey\":\"e353a4bb-b24b-45c6-91f5-002722841f04\",\"createBy\":\"1\",\"createTime\":1649595438457,\"graphNodeMyicon\":\"star\",\"graphNodeKey\":\"a82bf5af-8b78-40af-bd43-bb603acd0a9c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-10 20:57:18');
INSERT INTO `sys_oper_log` VALUES ('135', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"graphKey1\",\"graphNodeName\":\"graphKey1\",\"params\":{},\"graphNodeUrl\":\"<p>graphKey1</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649651016479,\"graphNodeMyicon\":\"404\",\"graphNodeKey\":\"805436f3-0383-4cbf-82b8-530064afbec9\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(\n          n :e353a4bbb24b45c691f5002722841f04\n         {\n          name :\'grap\' at line 1\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\Neo4jNodeMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.insertGraphNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: CREATE (           n :e353a4bbb24b45c691f5002722841f04          {           name :?,           myicon :CONCAT(\'el-icon-\',?,\'-on\')           }         ) RETURN id (n)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(\n          n :e353a4bbb24b45c691f5002722841f04\n         {\n          name :\'grap\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(\n          n :e353a4bbb24b45c691f5002722841f04\n         {\n          name :\'grap\' at line 1', '2022-04-11 12:23:36');
INSERT INTO `sys_oper_log` VALUES ('136', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"graphKey1\",\"graphNodeName\":\"graphKey1\",\"params\":{},\"graphNodeUrl\":\"<p>graphKey1</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649651214217,\"graphNodeMyicon\":\"404\",\"graphNodeKey\":\"5a4e4962-5888-4fbc-8601-6078cb2615b4\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Unknown function \'CONCAT\' (line 5, column 19 (offset: 105))\r\n\"          myicon :CONCAT(\'el-icon-\',{2},\'-on\')\"\r\n                   ^\n\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\Neo4jNodeMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.insertGraphNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: CREATE (           n :e353a4bbb24b45c691f5002722841f04          {           name :?,           myicon :CONCAT(\'el-icon-\',?,\'-on\')           }         ) RETURN id (n)\r\n### Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Unknown function \'CONCAT\' (line 5, column 19 (offset: 105))\r\n\"          myicon :CONCAT(\'el-icon-\',{2},\'-on\')\"\r\n                   ^\n\n; uncategorized SQLException; SQL state [null]; error code [0]; Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Unknown function \'CONCAT\' (line 5, column 19 (offset: 105))\r\n\"          myicon :CONCAT(\'el-icon-\',{2},\'-on\')\"\r\n                   ^\n; nested exception is java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Unknown function \'CONCAT\' (line 5, column 19 (offset: 105))\r\n\"          myicon :CONCAT(\'el-icon-\',{2},\'-on\')\"\r\n                   ^\n', '2022-04-11 12:26:54');
INSERT INTO `sys_oper_log` VALUES ('137', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"graphKey1\",\"graphNodeName\":\"graphKey1\",\"params\":{},\"graphNodeUrl\":\"<p>graphKey1</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649651382394,\"graphNodeId\":-1,\"graphNodeMyicon\":\"el-icon-404-on\",\"graphNodeKey\":\"4ce40dbe-847e-43f0-b153-5646b592925c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:29:43');
INSERT INTO `sys_oper_log` VALUES ('138', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"1\",\"graphNodeName\":\"1\",\"params\":{},\"graphNodeUrl\":\"<p>1</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649651645211,\"graphNodeMyicon\":\"el-icon-404-on\",\"graphNodeKey\":\"d069245c-fe53-4e73-8b67-0abc5b25a17c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:34:05');
INSERT INTO `sys_oper_log` VALUES ('139', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"323\",\"graphNodeName\":\"233\",\"params\":{},\"graphNodeUrl\":\"<p>2323</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649651883019,\"graphNodeMyicon\":\"el-icon-checkbox-on\",\"graphNodeKey\":\"8225ad38-50f8-42d0-af28-8e8fc0f3cf25\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:38:03');
INSERT INTO `sys_oper_log` VALUES ('140', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"12312\",\"graphNodeName\":\"123\",\"params\":{},\"graphNodeUrl\":\"<p>131</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652411007,\"graphNodeMyicon\":\"el-icon-checkbox-on\",\"graphNodeKey\":\"24b004e3-b023-44a4-a89e-6a2b37930bdf\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:46:51');
INSERT INTO `sys_oper_log` VALUES ('141', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"123\",\"graphNodeName\":\"123\",\"params\":{},\"graphNodeUrl\":\"<p>3123</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652483042,\"graphNodeId\":199,\"graphNodeMyicon\":\"el-icon-button-on\",\"graphNodeKey\":\"50feb8ff-e93b-45c0-ae3c-81662667a779\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:48:04');
INSERT INTO `sys_oper_log` VALUES ('142', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/node/4ce40dbe-847e-43f0-b153-5646b592925c', '127.0.0.1', '内网IP', '{graphNodeKeys=4ce40dbe-847e-43f0-b153-5646b592925c}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:48:18');
INSERT INTO `sys_oper_log` VALUES ('143', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/node/a82bf5af-8b78-40af-bd43-bb603acd0a9c', '127.0.0.1', '内网IP', '{graphNodeKeys=a82bf5af-8b78-40af-bd43-bb603acd0a9c}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:48:23');
INSERT INTO `sys_oper_log` VALUES ('144', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"12312\",\"graphNodeName\":\"213\",\"params\":{},\"graphNodeUrl\":\"<p>3123</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652551303,\"graphNodeId\":198,\"graphNodeMyicon\":\"el-icon-date-range-on\",\"graphNodeKey\":\"e93da8a5-981d-4f51-97ea-74d632973069\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:49:11');
INSERT INTO `sys_oper_log` VALUES ('145', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"3123\",\"graphNodeName\":\"123\",\"params\":{},\"graphNodeUrl\":\"<p>313</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652562270,\"graphNodeId\":177,\"graphNodeMyicon\":\"el-icon-button-on\",\"graphNodeKey\":\"7d09b3d1-390f-4a7b-9b86-ed32ee6b17ae\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:49:22');
INSERT INTO `sys_oper_log` VALUES ('146', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"3123\",\"graphNodeName\":\"123\",\"params\":{},\"graphNodeUrl\":\"<p>313</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652580337,\"graphNodeId\":179,\"graphNodeMyicon\":\"el-icon-checkbox-on\",\"graphNodeKey\":\"63712619-06cd-4f13-8c40-d73073c9569f\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:49:40');
INSERT INTO `sys_oper_log` VALUES ('147', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"3123\",\"graphNodeName\":\"1232\",\"params\":{},\"graphNodeUrl\":\"<p>13131</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652592030,\"graphNodeId\":252,\"graphNodeMyicon\":\"el-icon-color-on\",\"graphNodeKey\":\"82732367-836e-47ac-a8df-6e1a2c0dce03\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:49:52');
INSERT INTO `sys_oper_log` VALUES ('148', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"4234\",\"graphNodeName\":\"4234\",\"params\":{},\"graphNodeUrl\":\"<p>4242</p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649652623859,\"graphNodeId\":272,\"graphNodeMyicon\":\"el-icon-checkbox-on\",\"graphNodeKey\":\"363a3d5e-5b6a-479d-9b8d-5a051b3bc1f4\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 12:50:23');
INSERT INTO `sys_oper_log` VALUES ('149', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"12312\",\"graphNodeTime\":1649656853744,\"graphNodeName\":\"12321\",\"params\":{},\"graphNodeUrl\":\"<p><strong>12312</strong></p><p><strong><span class=\\\"ql-cursor\\\">﻿</span></strong><img src=\\\"/dev-api/profile/upload/2022/04/11/3f2439de-9426-41dd-846e-ec8e8223bc36.jpg\\\"></p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"createBy\":\"1\",\"createTime\":1649656853744,\"graphNodeId\":273,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"1f0f4b80-3008-408e-aa7c-25ca1be6a1f6\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 14:00:54');
INSERT INTO `sys_oper_log` VALUES ('150', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"12312\",\"graphNodeTime\":1649606400000,\"graphNodeName\":\"12321\",\"updateTime\":1649656904739,\"params\":{},\"graphNodeUrl\":\"<p><strong>12312</strong></p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"graphName\":\"测试图谱\",\"createBy\":\"1\",\"createTime\":1649656854000,\"graphNodeUpdate\":1,\"graphNodeId\":273,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"1f0f4b80-3008-408e-aa7c-25ca1be6a1f6\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 14:01:44');
INSERT INTO `sys_oper_log` VALUES ('151', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"12312\",\"graphNodeTime\":1649606400000,\"graphNodeName\":\"12321\",\"updateTime\":1649662153779,\"params\":{},\"graphNodeUrl\":\"<p><strong>12312</strong></p><p><strong><span class=\\\"ql-cursor\\\">﻿</span></strong><img src=\\\"/dev-api/profile/upload/2022/04/11/9008ee3a-3441-4339-9cda-d33eae2e3449.jpg\\\"></p>\",\"graphKey\":\"e353a4bbb24b45c691f5002722841f04\",\"graphName\":\"测试图谱\",\"createBy\":\"1\",\"createTime\":1649656854000,\"graphNodeUpdate\":1,\"graphNodeId\":273,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"1f0f4b80-3008-408e-aa7c-25ca1be6a1f6\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 15:29:13');
INSERT INTO `sys_oper_log` VALUES ('152', '图谱维护', '5', 'com.knowledgegraph.web.controller.neo4j.GraphController.export()', 'POST', '1', 'admin', null, '/neo4j/graph/export', '127.0.0.1', '内网IP', '{\"params\":{}}', null, '0', null, '2022-04-11 15:56:23');
INSERT INTO `sys_oper_log` VALUES ('153', '图谱维护', '5', 'com.knowledgegraph.web.controller.neo4j.GraphController.export()', 'POST', '1', 'admin', null, '/neo4j/graph/export', '127.0.0.1', '内网IP', '{\"params\":{}}', null, '0', null, '2022-04-11 15:58:00');
INSERT INTO `sys_oper_log` VALUES ('154', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/e353a4bbb24b45c691f5002722841f04', '127.0.0.1', '内网IP', '{graphKeys=e353a4bbb24b45c691f5002722841f04}', null, '1', 'Mapper method \'com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.deleteGraphAllByGraphKey attempted to return null from a method with a primitive return type (int).', '2022-04-11 16:54:13');
INSERT INTO `sys_oper_log` VALUES ('155', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/e353a4bbb24b45c691f5002722841f04', '127.0.0.1', '内网IP', '{graphKeys=e353a4bbb24b45c691f5002722841f04}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'delete from graph_node where graph_key = \'e353a4bbb24b45c691f5002722841f04\'\' at line 2\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\GraphMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.GraphMapper.deleteGraphAllByGraphKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from graph where graph_key = ? ;         delete from graph_node where graph_key = ? ;\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'delete from graph_node where graph_key = \'e353a4bbb24b45c691f5002722841f04\'\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'delete from graph_node where graph_key = \'e353a4bbb24b45c691f5002722841f04\'\' at line 2', '2022-04-11 16:56:36');
INSERT INTO `sys_oper_log` VALUES ('156', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/e353a4bbb24b45c691f5002722841f04', '127.0.0.1', '内网IP', '{graphKeys=e353a4bbb24b45c691f5002722841f04}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 16:58:54');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":2,\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:11:06');
INSERT INTO `sys_oper_log` VALUES ('158', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":3,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:11:14');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":4,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:11:22');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":5,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:11:29');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":1,\"menuName\":\"成员管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"peoples\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:12:16');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"成员维护\",\"params\":{},\"parentId\":2026,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"neo4j/member/index\",\"children\":[],\"createTime\":1649584613000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"neo4j:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:12:52');
INSERT INTO `sys_oper_log` VALUES ('163', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"吉林农业科技学院\",\"leader\":\"了却非\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:15:35');
INSERT INTO `sys_oper_log` VALUES ('164', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"18级\",\"leader\":\"了却非\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:15:57');
INSERT INTO `sys_oper_log` VALUES ('165', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:16:08');
INSERT INTO `sys_oper_log` VALUES ('166', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2022-04-11 17:16:11');
INSERT INTO `sys_oper_log` VALUES ('167', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:16:17');
INSERT INTO `sys_oper_log` VALUES ('168', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:16:20');
INSERT INTO `sys_oper_log` VALUES ('169', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2022-04-11 17:16:23');
INSERT INTO `sys_oper_log` VALUES ('170', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2022-04-11 17:16:27');
INSERT INTO `sys_oper_log` VALUES ('171', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"软件工程\",\"leader\":\"了却非\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:17:07');
INSERT INTO `sys_oper_log` VALUES ('172', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"19级\",\"leader\":\"了却非\",\"deptId\":102,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:17:47');
INSERT INTO `sys_oper_log` VALUES ('173', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":108,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,102\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:18:06');
INSERT INTO `sys_oper_log` VALUES ('174', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:18:13');
INSERT INTO `sys_oper_log` VALUES ('175', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,102\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:18:21');
INSERT INTO `sys_oper_log` VALUES ('176', '部门管理', '3', 'com.knowledgegraph.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:18:27');
INSERT INTO `sys_oper_log` VALUES ('177', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"ancestors\":\"0,100,102\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'网络工程\'失败，部门名称已存在\",\"code\":500}', '0', null, '2022-04-11 17:18:42');
INSERT INTO `sys_oper_log` VALUES ('178', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"ancestors\":\"0,100,102\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'网络工程\'失败，部门名称已存在\",\"code\":500}', '0', null, '2022-04-11 17:18:47');
INSERT INTO `sys_oper_log` VALUES ('179', '部门管理', '2', 'com.knowledgegraph.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"createTime\":1648103893000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,102\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:20:06');
INSERT INTO `sys_oper_log` VALUES ('180', '用户管理', '2', 'com.knowledgegraph.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1648103894000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"了却非\",\"sex\":\"0\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":102,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1648103894000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:22:00');
INSERT INTO `sys_oper_log` VALUES ('181', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":1,\"menuName\":\"图谱维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"graph\",\"component\":\"neo4j/graph/index\",\"children\":[],\"createTime\":1649584589000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"neo4j:graph:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:25:46');
INSERT INTO `sys_oper_log` VALUES ('182', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"swagger\",\"orderNum\":1,\"menuName\":\"节点维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"node\",\"component\":\"neo4j/node/index\",\"children\":[],\"createTime\":1649592772000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"neo4j:node:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:25:57');
INSERT INTO `sys_oper_log` VALUES ('183', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":1,\"menuName\":\"成员维护\",\"params\":{},\"parentId\":2026,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"neo4j/member/index\",\"children\":[],\"createTime\":1649584613000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"neo4j:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:26:32');
INSERT INTO `sys_oper_log` VALUES ('184', '通知公告', '1', 'com.knowledgegraph.web.controller.system.SysNoticeController.add()', 'POST', '1', 'admin', null, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>公告测试<img src=\\\"/dev-api/profile/upload/2022/04/11/9e01701e-8cec-45fb-b3a5-4c1a6f1997ac.jpg\\\"></p>\",\"createBy\":\"admin\",\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"公告测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:29:08');
INSERT INTO `sys_oper_log` VALUES ('185', '通知公告', '1', 'com.knowledgegraph.web.controller.system.SysNoticeController.add()', 'POST', '1', 'ry', null, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>通知测试</p>\",\"createBy\":\"ry\",\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"通知测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:34:28');
INSERT INTO `sys_oper_log` VALUES ('186', '图谱成员维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphMemberController.add()', 'POST', '1', 'admin', null, '/neo4j/member', '127.0.0.1', '内网IP', '{\"joinTime\":1649670159063,\"graphMemberKey\":\"626399f0-db4a-4429-a04b-29fda8b4e332\",\"params\":{},\"createTime\":1649670159063}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:42:39');
INSERT INTO `sys_oper_log` VALUES ('187', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph_relationship', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 17:57:58');
INSERT INTO `sys_oper_log` VALUES ('188', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphRelationshipId\",\"usableColumn\":false,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphRelationshipId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"关系ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1649671078000,\"tableId\":6,\"pk\":true,\"columnName\":\"graph_relationship_id\"},{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649671078000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"GraphRelationshipName\",\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphRelationshipName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"关系名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649671078000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"graph_relationship_name\"},{\"capJavaField\":\"GraphRelationshipFrom\",\"usableColumn\":false,\"columnId\":56,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphRelationshipFrom\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"始节点ID\",\"isQuery\":\"1\",\"sort\":4,\"list\":tr', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 18:06:04');
INSERT INTO `sys_oper_log` VALUES ('189', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-11 18:06:18');
INSERT INTO `sys_oper_log` VALUES ('190', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":0,\"menuName\":\"图谱维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"graph\",\"component\":\"neo4j/graph/index\",\"children\":[],\"createTime\":1649584589000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"neo4j:graph:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:00:56');
INSERT INTO `sys_oper_log` VALUES ('191', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":0,\"menuName\":\"图谱维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"graph\",\"component\":\"neo4j/graph/index\",\"children\":[],\"createTime\":1649584589000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"neo4j:graph:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:01:05');
INSERT INTO `sys_oper_log` VALUES ('192', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"swagger\",\"orderNum\":2,\"menuName\":\"节点维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"node\",\"component\":\"neo4j/node/index\",\"children\":[],\"createTime\":1649592772000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"neo4j:node:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:01:18');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"关系维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"relationship\",\"component\":\"neo4j/relationship/index\",\"children\":[],\"createTime\":1649674491000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"C\",\"perms\":\"neo4j:relationship:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:01:27');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"slider\",\"orderNum\":3,\"menuName\":\"关系维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"relationship\",\"component\":\"neo4j/relationship/index\",\"children\":[],\"createTime\":1649674491000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"C\",\"perms\":\"neo4j:relationship:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:01:58');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"swagger\",\"orderNum\":3,\"menuName\":\"关系维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"relationship\",\"component\":\"neo4j/relationship/index\",\"children\":[],\"createTime\":1649674491000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"C\",\"perms\":\"neo4j:relationship:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:02:35');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"radio\",\"orderNum\":2,\"menuName\":\"节点维护\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"node\",\"component\":\"neo4j/node/index\",\"children\":[],\"createTime\":1649592772000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"neo4j:node:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:02:49');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":1,\"menuName\":\"成员维护\",\"params\":{},\"parentId\":2026,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"neo4j/member/index\",\"children\":[],\"createTime\":1649584613000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"neo4j:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:03:31');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":10,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"test\",\"children\":[],\"createTime\":1648108074000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:05:21');
INSERT INTO `sys_oper_log` VALUES ('199', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"graphImgUrl\":\"/profile/upload/2022/04/11/6e45a592-f158-40de-9ac8-78e93d4a90ad.jpg\",\"params\":{},\"graphRemark\":\"12312\",\"graphTime\":1649677596450,\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649677596450}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 19:46:36');
INSERT INTO `sys_oper_log` VALUES ('200', '图谱成员维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphMemberController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/member/00b96605-5c02-4e99-b366-daefd8eca50a', '127.0.0.1', '内网IP', '{graphMemberKeys=00b96605-5c02-4e99-b366-daefd8eca50a}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 20:52:18');
INSERT INTO `sys_oper_log` VALUES ('201', '图谱成员维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphMemberController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/member/00b96605-5c02-4e99-b366-daefd8eca50a', '127.0.0.1', '内网IP', '{graphMemberKeys=00b96605-5c02-4e99-b366-daefd8eca50a}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 20:53:14');
INSERT INTO `sys_oper_log` VALUES ('202', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph_apply', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:28:20');
INSERT INTO `sys_oper_log` VALUES ('203', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"ApplyKey\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"applyKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"申请主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"apply_key\"},{\"capJavaField\":\"ApplyUser\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"applyUser\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"申请人\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"apply_user\"},{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":62,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"申请图\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"ApplyTime\",\"usableColumn\":false,\"columnId\":63,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"applyTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"columnComment\":\"申请时间\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"apply_time\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:34:13');
INSERT INTO `sys_oper_log` VALUES ('204', '字典类型', '1', 'com.knowledgegraph.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"审核状态\",\"params\":{},\"dictType\":\"apply_sign\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:34:46');
INSERT INTO `sys_oper_log` VALUES ('205', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"apply_sign\",\"dictLabel\":\"未审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:35:02');
INSERT INTO `sys_oper_log` VALUES ('206', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"apply_sign\",\"dictLabel\":\"已审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:35:12');
INSERT INTO `sys_oper_log` VALUES ('207', '字典类型', '1', 'com.knowledgegraph.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"审核结果\",\"params\":{},\"dictType\":\"apply_flag\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:35:42');
INSERT INTO `sys_oper_log` VALUES ('208', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"apply_flag\",\"dictLabel\":\"未通过\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:36:46');
INSERT INTO `sys_oper_log` VALUES ('209', '字典数据', '1', 'com.knowledgegraph.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"apply_flag\",\"dictLabel\":\"已通过\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:36:59');
INSERT INTO `sys_oper_log` VALUES ('210', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"apply_flag\",\"dictLabel\":\"未通过\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"warning\",\"createTime\":1649684206000,\"dictCode\":35,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:44:08');
INSERT INTO `sys_oper_log` VALUES ('211', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"apply_flag\",\"dictLabel\":\"已通过\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"success\",\"createTime\":1649684219000,\"dictCode\":36,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:44:18');
INSERT INTO `sys_oper_log` VALUES ('212', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"apply_sign\",\"dictLabel\":\"未审核\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"warning\",\"createTime\":1649684102000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:44:37');
INSERT INTO `sys_oper_log` VALUES ('213', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"apply_sign\",\"dictLabel\":\"已审核\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"success\",\"createTime\":1649684112000,\"dictCode\":34,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:44:46');
INSERT INTO `sys_oper_log` VALUES ('214', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"graph_type\",\"dictLabel\":\"私有\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"primary\",\"createTime\":1649582257000,\"dictCode\":29,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:45:16');
INSERT INTO `sys_oper_log` VALUES ('215', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"graph_type\",\"dictLabel\":\"公有\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"success\",\"createTime\":1649582271000,\"dictCode\":30,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:45:27');
INSERT INTO `sys_oper_log` VALUES ('216', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"graph_member_type\",\"dictLabel\":\"创建者\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"success\",\"createTime\":1649584200000,\"dictCode\":31,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:45:56');
INSERT INTO `sys_oper_log` VALUES ('217', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"graph_member_type\",\"dictLabel\":\"成员\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"success\",\"createTime\":1649584215000,\"dictCode\":32,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:46:01');
INSERT INTO `sys_oper_log` VALUES ('218', '字典数据', '2', 'com.knowledgegraph.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"graph_member_type\",\"dictLabel\":\"创建者\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"primary\",\"createTime\":1649584200000,\"dictCode\":31,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:46:14');
INSERT INTO `sys_oper_log` VALUES ('219', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"ApplyKey\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"applyKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"申请主键\",\"updateTime\":1649684052000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"apply_key\"},{\"capJavaField\":\"ApplyUser\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"applyUser\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"申请人\",\"updateTime\":1649684052000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"apply_user\"},{\"capJavaField\":\"GraphKey\",\"usableColumn\":false,\"columnId\":62,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"申请图\",\"isQuery\":\"1\",\"updateTime\":1649684053000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1649683699000,\"tableId\":7,\"pk\":false,\"columnName\":\"graph_key\"},{\"capJavaField\":\"ApplyTime\",\"usableColumn\":false,\"columnId\":63,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"applyTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"columnComment\":\"申请时间\",\"updateTime\":1649684053000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 21:49:32');
INSERT INTO `sys_oper_log` VALUES ('220', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-11 21:49:35');
INSERT INTO `sys_oper_log` VALUES ('221', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"688b9bda-1375-4747-9940-c837af3b926b\",\"params\":{},\"applyUser\":\"1\",\"applyRemark\":\"test\",\"createTime\":1649686580534,\"applyTime\":1649686580534}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 22:16:20');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":1,\"menuName\":\"申请审核\",\"params\":{},\"parentId\":2026,\"isCache\":\"0\",\"path\":\"apply\",\"component\":\"neo4j/apply/index\",\"children\":[],\"createTime\":1649685458000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"C\",\"perms\":\"neo4j:apply:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 22:18:16');
INSERT INTO `sys_oper_log` VALUES ('223', '申请审核', '2', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.edit()', 'PUT', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"688b9bda-1375-4747-9940-c837af3b926b\",\"updateTime\":1649687819067,\"applySign\":\"1\",\"params\":{},\"applyUser\":\"2\",\"applyUserName\":\"了却非ry\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"applyRemark\":\"test\",\"createTime\":1649686581000,\"examineRemark\":\"123\",\"applyFlag\":\"0\",\"applyTime\":1649606400000,\"examineTime\":1649687819067}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 22:36:59');
INSERT INTO `sys_oper_log` VALUES ('224', '申请审核', '2', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.edit()', 'PUT', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"688b9bda-1375-4747-9940-c837af3b926b\",\"updateTime\":1649687894085,\"applySign\":\"1\",\"params\":{},\"applyUser\":\"2\",\"applyUserName\":\"了却非ry\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"applyRemark\":\"test\",\"createTime\":1649686581000,\"examineRemark\":\"123\",\"applyFlag\":\"1\",\"applyTime\":1649606400000,\"examineTime\":1649687894085}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 22:38:14');
INSERT INTO `sys_oper_log` VALUES ('225', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":3,\"menuName\":\"我的申请\",\"params\":{},\"parentId\":2026,\"isCache\":\"0\",\"path\":\"myapply\",\"component\":\"neo4j/myapply/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"myapply\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:01:30');
INSERT INTO `sys_oper_log` VALUES ('226', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":3,\"menuName\":\"我的申请\",\"params\":{},\"parentId\":2026,\"isCache\":\"0\",\"path\":\"myapply\",\"component\":\"neo4j/myapply/index\",\"children\":[],\"createTime\":1649689290000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2039,\"menuType\":\"C\",\"perms\":\"neo4j:apply:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:01:45');
INSERT INTO `sys_oper_log` VALUES ('227', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"我的申请查询\",\"params\":{},\"parentId\":2039,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"neo4j:apply:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:02:23');
INSERT INTO `sys_oper_log` VALUES ('228', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"我的申请新增\",\"params\":{},\"parentId\":2039,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"neo4j:apply:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:02:52');
INSERT INTO `sys_oper_log` VALUES ('229', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"我的申请修改\",\"params\":{},\"parentId\":2039,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"neo4j:apply:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:03:22');
INSERT INTO `sys_oper_log` VALUES ('230', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":4,\"menuName\":\"我的申请删除\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"neo4j:apply:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:03:48');
INSERT INTO `sys_oper_log` VALUES ('231', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"我的申请删除\",\"params\":{},\"parentId\":2039,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1649689428000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2043,\"menuType\":\"F\",\"perms\":\"neo4j:apply:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:04:08');
INSERT INTO `sys_oper_log` VALUES ('232', '菜单管理', '1', 'com.knowledgegraph.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":5,\"menuName\":\"我的申请导出\",\"params\":{},\"parentId\":2039,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"neo4j:apply:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:04:34');
INSERT INTO `sys_oper_log` VALUES ('233', '角色管理', '2', 'com.knowledgegraph.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1648103894000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2007,2008,2009,2010,2011,2012,2013,2020,2021,2022,2023,2024,2025,2027,2028,2029,2030,2031,2032,2026,2014,2015,2016,2017,2018,2019,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-11 23:05:30');
INSERT INTO `sys_oper_log` VALUES ('234', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":10,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"test\",\"children\":[],\"createTime\":1648108074000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 12:52:40');
INSERT INTO `sys_oper_log` VALUES ('235', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"测试节点1\",\"graphNodeTime\":1649749487394,\"graphNodeName\":\"测试节点1\",\"params\":{},\"graphNodeUrl\":\"<p>测试节点1</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649749487394,\"graphNodeId\":177,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"0c4770a2-d823-4827-9576-8181aa0eb186\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 15:44:47');
INSERT INTO `sys_oper_log` VALUES ('236', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"测试节点2\",\"graphNodeTime\":1649749499091,\"graphNodeName\":\"测试节点2\",\"params\":{},\"graphNodeUrl\":\"<p>测试节点2</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649749499091,\"graphNodeId\":316,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"c88aaa20-c0e5-473d-a6d6-78d74f4b8396\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 15:44:59');
INSERT INTO `sys_oper_log` VALUES ('237', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"测试图谱3\",\"graphNodeTime\":1649751227283,\"graphNodeName\":\"测试图谱3\",\"params\":{},\"graphNodeUrl\":\"<p>测试图谱3</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649751227283,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 16:13:47');
INSERT INTO `sys_oper_log` VALUES ('238', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"测试图谱3\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"测试图谱3update\",\"updateTime\":1649751348871,\"params\":{},\"graphNodeUrl\":\"<p>测试图谱3</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649751227000,\"graphNodeUpdate\":1,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 16:15:49');
INSERT INTO `sys_oper_log` VALUES ('239', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"测试图谱3\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"测试图谱3update\",\"updateTime\":1649751418710,\"params\":{},\"graphNodeUrl\":\"<p>测试图谱3</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649751227000,\"graphNodeUpdate\":1,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 16:16:58');
INSERT INTO `sys_oper_log` VALUES ('240', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"测试图谱3\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"测试图谱3\",\"updateTime\":1649751871471,\"params\":{},\"graphNodeUrl\":\"<p>测试图谱3</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649751227000,\"graphNodeUpdate\":1,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 16:24:31');
INSERT INTO `sys_oper_log` VALUES ('241', '关系维护', '1', 'com.knowledgegraph.neo4j.controller.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":177,\"graphRelationshipName\":\"测试关系1-2\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":316}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 16:50:28');
INSERT INTO `sys_oper_log` VALUES ('242', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeKey\":\"f\"},{\"params\":{},\"graphNodeKey\":\"c\"},{\"params\":{},\"graphNodeKey\":\"3\"},{\"params\":{},\"graphNodeKey\":\"f\"},{\"params\":{},\"graphNodeKey\":\"6\"},{\"params\":{},\"graphNodeKey\":\"0\"},{\"params\":{},\"graphNodeKey\":\"9\"},{\"params\":{},\"graphNodeKey\":\"e\"},{\"params\":{},\"graphNodeKey\":\"-\"},{\"params\":{},\"graphNodeKey\":\"6\"},{\"params\":{},\"graphNodeKey\":\"a\"},{\"params\":{},\"graphNodeKey\":\"8\"},{\"params\":{},\"graphNodeKey\":\"7\"},{\"params\":{},\"graphNodeKey\":\"-\"},{\"params\":{},\"graphNodeKey\":\"4\"},{\"params\":{},\"graphNodeKey\":\"3\"},{\"params\":{},\"graphNodeKey\":\"8\"},{\"params\":{},\"graphNodeKey\":\"6\"},{\"params\":{},\"graphNodeKey\":\"-\"},{\"params\":{},\"graphNodeKey\":\"8\"},{\"params\":{},\"graphNodeKey\":\"9\"},{\"params\":{},\"graphNodeKey\":\"2\"},{\"params\":{},\"graphNodeKey\":\"a\"},{\"params\":{},\"graphNodeKey\":\"-\"},{\"params\":{},\"graphNodeKey\":\"e\"},{\"params\":{},\"graphNodeKey\":\"0\"},{\"params\":{},\"graphNodeKey\":\"9\"},{\"params\":{},\"graphNodeKey\":\"7\"},{\"params\":{},\"graphNodeKey\":\"0\"},{\"params\":{},\"graphNodeKey\":\"d\"},{\"params\":{},\"graphNodeKey\":\"3\"},{\"params\":{},\"graphNodeKey\":\"9\"},{\"params\":{},\"graphNodeKey\":\"3\"},{\"params\":{},\"graphNodeKey\":\"7\"},{\"params\":{},\"graphNodeKey\":\"b\"},{\"params\":{},\"graphNodeKey\":\"7\"}]', null, '1', '', '2022-04-12 16:58:17');
INSERT INTO `sys_oper_log` VALUES ('243', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[]', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'n\': expected whitespace, comment, \'{\', node labels, MapLiteral, a parameter, a parameter (old syntax), a relationship pattern, \'(\', \'.\', \'[\', \"=~\", IN, STARTS, ENDS, CONTAINS, IS, \'^\', \'*\', \'/\', \'%\', \'+\', \'-\', \'=\', \'~\', \"<>\", \"!=\", \'<\', \'>\', \"<=\", \">=\", AND, XOR, OR, FROM GRAPH, CONSTRUCT, LOAD CSV, START, MATCH, UNWIND, MERGE, CREATE UNIQUE, CREATE, SET, DELETE, REMOVE, FOREACH, WITH, CALL, RETURN, UNION, \';\' or end of input (line 5, column 16 (offset: 92))\r\n\"        DELETE n,r\"\r\n                ^\n\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\Neo4jNodeMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.deleteGraphNodeByGraphNodeKeys-Inline\r\n### The error occurred while setting parameters\r\n### SQL: MATCH (n)         OPTIONAL MATCH (n)-[r]-()         where id(n) in                   DELETE n,r         return count(*)\r\n### Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'n\': expected whitespace, comment, \'{\', node labels, MapLiteral, a parameter, a parameter (old syntax), a relationship pattern, \'(\', \'.\', \'[\', \"=~\", IN, STARTS, ENDS, CONTAINS, IS, \'^\', \'*\', \'/\', \'%\', \'+\', \'-\', \'=\', \'~\', \"<>\", \"!=\", \'<\', \'>\', \"<=\", \">=\", AND, XOR, OR, FROM GRAPH, CONSTRUCT, LOAD CSV, START, MATCH, UNWIND, MERGE, CREATE UNIQUE, CREATE, SET, DELETE, REMOVE, FOREACH, WITH, CALL, RETURN, UNION, \';\' or end of input (line 5, column 16 (offset: 92))\r\n\"        DELETE n,r\"\r\n                ^\n\n; uncategorized SQLException; SQL state [null]; error code [0]; Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'n\': expected whitespace, comment, \'{\', node labels, MapLiteral, a parameter, a parameter (old syntax), a relationship pattern, \'(\', \'.\', \'[\', \"=~\", IN, STARTS, EN', '2022-04-12 17:08:41');
INSERT INTO `sys_oper_log` VALUES ('244', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeId\":317,\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}]', null, '1', 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'graphNodeId\' not found. Available parameters are [array, arg0]', '2022-04-12 17:09:22');
INSERT INTO `sys_oper_log` VALUES ('245', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeId\":317,\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}]', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Schema.ConstraintValidationFailed]:org.neo4j.kernel.api.exceptions.ConstraintViolationTransactionFailureException: Cannot delete node<0>, because it still has relationships. To delete this node, you must first delete its relationships.\n\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\Neo4jNodeMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.deleteGraphNodeByGraphNodeKeys-Inline\r\n### The error occurred while setting parameters\r\n### SQL: MATCH (n)         OPTIONAL MATCH (n)-[r]-()         where id(n) in          [               317          ]          DELETE n,r         return count(*)\r\n### Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Schema.ConstraintValidationFailed]:org.neo4j.kernel.api.exceptions.ConstraintViolationTransactionFailureException: Cannot delete node<0>, because it still has relationships. To delete this node, you must first delete its relationships.\n\n; uncategorized SQLException; SQL state [null]; error code [0]; Some errors occurred : \n[Neo.ClientError.Schema.ConstraintValidationFailed]:org.neo4j.kernel.api.exceptions.ConstraintViolationTransactionFailureException: Cannot delete node<0>, because it still has relationships. To delete this node, you must first delete its relationships.\n; nested exception is java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Schema.ConstraintValidationFailed]:org.neo4j.kernel.api.exceptions.ConstraintViolationTransactionFailureException: Cannot delete node<0>, because it still has relationships. To delete this node, you must first delete its relationships.\n', '2022-04-12 17:11:35');
INSERT INTO `sys_oper_log` VALUES ('246', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeId\":317,\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}]', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Expected exactly one statement per query but got: 2\n\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\Neo4jNodeMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.deleteGraphNodeByGraphNodeKeys-Inline\r\n### The error occurred while setting parameters\r\n### SQL: MATCH (n)-[r]-()         where id(n) in          [               317          ]          DELETE r;         MATCH (n)         where id(n) in          [               317          ]          DELETE n         return count(*);\r\n### Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Expected exactly one statement per query but got: 2\n\n; uncategorized SQLException; SQL state [null]; error code [0]; Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Expected exactly one statement per query but got: 2\n; nested exception is java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Expected exactly one statement per query but got: 2\n', '2022-04-12 17:15:53');
INSERT INTO `sys_oper_log` VALUES ('247', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeId\":177,\"graphNodeKey\":\"0c4770a2-d823-4827-9576-8181aa0eb186\"}]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:29:00');
INSERT INTO `sys_oper_log` VALUES ('248', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeId\":317,\"graphNodeKey\":\"fc3f609e-6a87-4386-892a-e0970d3937b7\"}]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:29:21');
INSERT INTO `sys_oper_log` VALUES ('249', '节点维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.remove()', 'POST', '1', 'admin', null, '/neo4j/node/delNode', '127.0.0.1', '内网IP', '[{\"params\":{},\"graphNodeId\":316,\"graphNodeKey\":\"c88aaa20-c0e5-473d-a6d6-78d74f4b8396\"}]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:29:26');
INSERT INTO `sys_oper_log` VALUES ('250', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"1\",\"graphNodeTime\":1649756041474,\"graphNodeName\":\"1\",\"params\":{},\"graphNodeUrl\":\"<p>123123</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649756041474,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"0ed724da-89e1-42e6-9f03-47b1ca2fe778\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:34:01');
INSERT INTO `sys_oper_log` VALUES ('251', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"2\",\"graphNodeTime\":1649756049004,\"graphNodeName\":\"2\",\"params\":{},\"graphNodeUrl\":\"<p>2</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649756049004,\"graphNodeId\":177,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"b3688914-4665-4f38-b0ad-4ffbd2ae2e2e\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:34:09');
INSERT INTO `sys_oper_log` VALUES ('252', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"3\",\"graphNodeTime\":1649756056285,\"graphNodeName\":\"3\",\"params\":{},\"graphNodeUrl\":\"<p>3</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649756056285,\"graphNodeId\":316,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"f83daad8-b7e6-46b3-97d2-a74a77c0f0b5\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:34:16');
INSERT INTO `sys_oper_log` VALUES ('253', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"4\",\"graphNodeTime\":1649756063811,\"graphNodeName\":\"4\",\"params\":{},\"graphNodeUrl\":\"<p>4</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649756063811,\"graphNodeId\":336,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"1bffd35c-b0ff-4bfa-a9f3-1cdb61780636\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:34:23');
INSERT INTO `sys_oper_log` VALUES ('254', '关系维护', '1', 'com.knowledgegraph.neo4j.controller.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":317,\"graphRelationshipName\":\"1-1\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":317}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:34:40');
INSERT INTO `sys_oper_log` VALUES ('255', '关系维护', '1', 'com.knowledgegraph.neo4j.controller.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":177,\"graphRelationshipName\":\"2-2\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":177}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:34:52');
INSERT INTO `sys_oper_log` VALUES ('256', '关系维护', '1', 'com.knowledgegraph.neo4j.controller.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":317,\"graphRelationshipName\":\"1-2\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":317}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:35:03');
INSERT INTO `sys_oper_log` VALUES ('257', '关系维护', '1', 'com.knowledgegraph.neo4j.controller.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":317,\"graphRelationshipName\":\"1-2\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":177}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:35:56');
INSERT INTO `sys_oper_log` VALUES ('258', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"4\",\"graphNodeTime\":1649756637318,\"graphNodeName\":\"4\",\"params\":{},\"graphNodeUrl\":\"<p>4</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1649756637318,\"graphNodeId\":253,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"a9c73cf9-830c-46bc-b922-671c104748cd\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:43:57');
INSERT INTO `sys_oper_log` VALUES ('259', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"5\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"5\",\"updateTime\":1649756655798,\"params\":{},\"graphNodeUrl\":\"<p>5</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649756064000,\"graphNodeUpdate\":1,\"graphNodeId\":336,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"1bffd35c-b0ff-4bfa-a9f3-1cdb61780636\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:44:15');
INSERT INTO `sys_oper_log` VALUES ('260', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":336,\"graphRelationshipName\":\"5-4\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":253}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:44:43');
INSERT INTO `sys_oper_log` VALUES ('261', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":336,\"graphRelationshipName\":\"5-5\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":336}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-12 17:45:12');
INSERT INTO `sys_oper_log` VALUES ('262', '参数管理', '1', 'com.knowledgegraph.web.controller.system.SysConfigController.add()', 'POST', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"图谱展示\",\"configKey\":\"graphIndex\",\"createBy\":\"admin\",\"configType\":\"Y\",\"configValue\":\"graphIndex\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-13 15:21:08');
INSERT INTO `sys_oper_log` VALUES ('263', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"1\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"1\",\"updateTime\":1649852815367,\"params\":{},\"graphNodeUrl\":\"<p><img src=\\\"/dev-api/profile/upload/2022/04/13/7e6062a9-9455-4bc9-ab1b-e28cba39ef2d.jpg\\\">123123</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649756041000,\"graphNodeUpdate\":1,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"0ed724da-89e1-42e6-9f03-47b1ca2fe778\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-13 20:26:55');
INSERT INTO `sys_oper_log` VALUES ('264', '通知公告', '2', 'com.knowledgegraph.web.controller.system.SysNoticeController.edit()', 'PUT', '1', 'admin', null, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p class=\\\"ql-indent-8\\\">公告测试<img src=\\\"/dev-api/profile/upload/2022/04/11/9e01701e-8cec-45fb-b3a5-4c1a6f1997ac.jpg\\\"></p>\",\"createBy\":\"admin\",\"createTime\":1649669348000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"params\":{},\"noticeId\":3,\"noticeTitle\":\"公告测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-15 16:22:22');
INSERT INTO `sys_oper_log` VALUES ('265', '代码生成', '6', 'com.knowledgegraph.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'graph_node_video', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 13:41:00');
INSERT INTO `sys_oper_log` VALUES ('266', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphNodeVideoKey\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphNodeVideoKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"节点视频资源主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650087660000,\"tableId\":8,\"pk\":false,\"columnName\":\"graph_node_video_key\"},{\"capJavaField\":\"GraphNodeKey\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"节点主键\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650087660000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"graph_node_key\"},{\"capJavaField\":\"GraphNodeVideoRemark\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeVideoRemark\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"视频简介\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650087660000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"graph_node_video_remark\"},{\"capJavaField\":\"GraphNodeVideoUrl\",\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeVideoUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"资源链接\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"S', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 13:44:09');
INSERT INTO `sys_oper_log` VALUES ('267', '代码生成', '2', 'com.knowledgegraph.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liaoquefei\",\"columns\":[{\"capJavaField\":\"GraphNodeVideoKey\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"graphNodeVideoKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"节点视频资源主键\",\"updateTime\":1650087849000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650087660000,\"tableId\":8,\"pk\":false,\"columnName\":\"graph_node_video_key\"},{\"capJavaField\":\"GraphNodeKey\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"节点主键\",\"updateTime\":1650087849000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650087660000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"graph_node_key\"},{\"capJavaField\":\"GraphNodeVideoRemark\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeVideoRemark\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"视频简介\",\"isQuery\":\"1\",\"updateTime\":1650087849000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650087660000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"graph_node_video_remark\"},{\"capJavaField\":\"GraphNodeVideoUrl\",\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"graphNodeVideoUrl\",\"htmlType\":\"textarea\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 13:50:13');
INSERT INTO `sys_oper_log` VALUES ('268', '代码生成', '8', 'com.knowledgegraph.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-04-16 13:50:25');
INSERT INTO `sys_oper_log` VALUES ('269', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":1,\"menuName\":\"节点视频资源\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"video\",\"component\":\"neo4j/video/index\",\"children\":[],\"createTime\":1650088311000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2045,\"menuType\":\"C\",\"perms\":\"neo4j:video:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 13:58:26');
INSERT INTO `sys_oper_log` VALUES ('270', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"server\",\"orderNum\":1,\"menuName\":\"节点视频资源\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"video\",\"component\":\"neo4j/video/index\",\"children\":[],\"createTime\":1650088311000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2045,\"menuType\":\"C\",\"perms\":\"neo4j:video:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 13:59:38');
INSERT INTO `sys_oper_log` VALUES ('271', '节点视频资源', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeVideoController.add()', 'POST', '1', 'admin', null, '/neo4j/video', '127.0.0.1', '内网IP', '{\"graphNodeVideoRemark\":\"1测试视频\",\"graphNodeVideoUrl\":\"1\",\"params\":{},\"createBy\":\"1\",\"graphNodeVideoKey\":\"91001e0f-aa95-4391-a9ce-2a7976b908dc\",\"createTime\":1650091506553,\"graphNodeKey\":\"0ed724da-89e1-42e6-9f03-47b1ca2fe778\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 14:45:06');
INSERT INTO `sys_oper_log` VALUES ('272', '节点视频资源', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeVideoController.edit()', 'PUT', '1', 'admin', null, '/neo4j/video', '127.0.0.1', '内网IP', '{\"graphNodeVideoRemark\":\"狂神说Java视频链接\",\"graphNodeVideoUrl\":\"https://www.bilibili.com/video/BV1MJ411v7tJ?spm_id_from=333.999.0.0\",\"params\":{},\"createBy\":\"1\",\"graphNodeVideoKey\":\"91001e0f-aa95-4391-a9ce-2a7976b908dc\",\"createTime\":1650091507000,\"createName\":\"了却非\",\"graphNodeKey\":\"0ed724da-89e1-42e6-9f03-47b1ca2fe778\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 14:48:37');
INSERT INTO `sys_oper_log` VALUES ('273', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"bug\",\"orderNum\":10,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"test\",\"children\":[],\"createTime\":1648108074000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 15:48:16');
INSERT INTO `sys_oper_log` VALUES ('274', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"引导图谱\",\"configKey\":\"graphIndex\",\"createBy\":\"admin\",\"createTime\":1649834468000,\"updateBy\":\"admin\",\"configId\":6,\"configType\":\"Y\",\"configValue\":\"萌新引导\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 16:38:51');
INSERT INTO `sys_oper_log` VALUES ('275', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"引导图谱\",\"configKey\":\"graphIndex\",\"createBy\":\"admin\",\"createTime\":1649834468000,\"updateBy\":\"admin\",\"configId\":6,\"updateTime\":1650098331000,\"configType\":\"N\",\"configValue\":\"萌新引导\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 16:46:52');
INSERT INTO `sys_oper_log` VALUES ('276', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"引导图谱\",\"configKey\":\"graphIndex\",\"createBy\":\"admin\",\"createTime\":1649834468000,\"updateBy\":\"admin\",\"configId\":6,\"updateTime\":1650098811000,\"configType\":\"N\",\"configValue\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 17:12:09');
INSERT INTO `sys_oper_log` VALUES ('277', '关系维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/relationship/128,167,206,166', '127.0.0.1', '内网IP', '{graphRelationshipIds=128,167,206,166}', null, '1', 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'graphKey\' not found. Available parameters are [array, arg0]', '2022-04-16 18:24:00');
INSERT INTO `sys_oper_log` VALUES ('278', '关系维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/relationship/128,167,206,166', '127.0.0.1', '内网IP', '{graphRelationshipIds=128,167,206,166}', null, '1', 'nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement \'com.knowledgegraph.neo4j.mapper.GraphRelationshipMapper.deleteGraphRelationshipByGraphRelationshipIds\'.  It\'s likely that neither a Result Type nor a Result Map was specified.', '2022-04-16 18:25:45');
INSERT INTO `sys_oper_log` VALUES ('279', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":317,\"graphRelationshipName\":\"1-5\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":336}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 18:29:39');
INSERT INTO `sys_oper_log` VALUES ('280', '关系维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/relationship/128', '127.0.0.1', '内网IP', '{graphRelationshipIds=128}', null, '1', 'nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement \'com.knowledgegraph.neo4j.mapper.GraphRelationshipMapper.deleteGraphRelationshipByGraphRelationshipIds\'.  It\'s likely that neither a Result Type nor a Result Map was specified.', '2022-04-16 18:29:47');
INSERT INTO `sys_oper_log` VALUES ('281', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":317,\"graphRelationshipName\":\"1-5\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":336}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 18:31:25');
INSERT INTO `sys_oper_log` VALUES ('282', '关系维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/relationship/128', '127.0.0.1', '内网IP', '{graphRelationshipIds=128}', null, '1', 'Mapper method \'com.knowledgegraph.neo4j.mapper.GraphRelationshipMapper.deleteGraphRelationshipByGraphRelationshipIds attempted to return null from a method with a primitive return type (int).', '2022-04-16 18:31:33');
INSERT INTO `sys_oper_log` VALUES ('283', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":336,\"graphRelationshipName\":\"5-1\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":317}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 18:33:09');
INSERT INTO `sys_oper_log` VALUES ('284', '关系维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/relationship/128', '127.0.0.1', '内网IP', '{graphRelationshipIds=128}', null, '1', 'Mapper method \'com.knowledgegraph.neo4j.mapper.GraphRelationshipMapper.deleteGraphRelationshipByGraphRelationshipIds attempted to return null from a method with a primitive return type (int).', '2022-04-16 18:33:14');
INSERT INTO `sys_oper_log` VALUES ('285', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":336,\"graphRelationshipName\":\"5-1\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipTo\":317}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 18:35:00');
INSERT INTO `sys_oper_log` VALUES ('286', '关系维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/relationship/166', '127.0.0.1', '内网IP', '{graphRelationshipIds=166}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-16 18:35:07');
INSERT INTO `sys_oper_log` VALUES ('287', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"1122333\",\"graphNodeTime\":1650173033742,\"graphNodeName\":\"1122333\",\"params\":{},\"graphNodeUrl\":\"<p>1122333</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"createBy\":\"1\",\"createTime\":1650173033742,\"graphNodeId\":337,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"a24de3d4-605f-4268-9cfe-88297284ece6\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 13:23:54');
INSERT INTO `sys_oper_log` VALUES ('288', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"1\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"1222\",\"updateTime\":1650173052961,\"params\":{},\"graphNodeUrl\":\"<p><img src=\\\"/dev-api/profile/upload/2022/04/13/7e6062a9-9455-4bc9-ab1b-e28cba39ef2d.jpg\\\">123123</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649756041000,\"graphNodeUpdate\":2,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"0ed724da-89e1-42e6-9f03-47b1ca2fe778\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 13:24:13');
INSERT INTO `sys_oper_log` VALUES ('289', '图谱维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphController.edit()', 'PUT', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"graphImgUrl\":\"/profile/upload/2022/04/11/6e45a592-f158-40de-9ac8-78e93d4a90ad.jpg\",\"updateTime\":1650175436116,\"avatar\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"params\":{},\"graphRemark\":\"12312\",\"graphTime\":1649606400000,\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649677596000,\"graphUpdateNumber\":12,\"graphViews\":2,\"createName\":\"了却非\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:03:56');
INSERT INTO `sys_oper_log` VALUES ('290', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"1\",\"graphNodeTime\":1649692800000,\"graphNodeName\":\"1222\",\"updateTime\":1650175451110,\"params\":{},\"graphNodeUrl\":\"<p><img src=\\\"/dev-api/profile/upload/2022/04/13/7e6062a9-9455-4bc9-ab1b-e28cba39ef2d.jpg\\\">123123</p>\",\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649756041000,\"graphNodeUpdate\":3,\"graphNodeId\":317,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"0ed724da-89e1-42e6-9f03-47b1ca2fe778\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:04:11');
INSERT INTO `sys_oper_log` VALUES ('291', '关系维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.edit()', 'PUT', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":317,\"graphRelationshipToName\":\"2\",\"graphRelationshipName\":\"1-2\",\"params\":{},\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphRelationshipId\":185,\"graphRelationshipTo\":177,\"graphRelationshipFromName\":\"1222\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:05:31');
INSERT INTO `sys_oper_log` VALUES ('292', '图谱维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphController.edit()', 'PUT', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"1\",\"graphImgUrl\":\"/profile/upload/2022/04/11/6e45a592-f158-40de-9ac8-78e93d4a90ad.jpg\",\"updateTime\":1650177785413,\"avatar\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"params\":{},\"graphRemark\":\"12312\",\"graphTime\":1649606400000,\"graphKey\":\"id5511081d8ea94206960035182c2fbe26\",\"graphName\":\"123\",\"createBy\":\"1\",\"createTime\":1649677596000,\"graphUpdateNumber\":15,\"graphViews\":2,\"createName\":\"了却非\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:43:05');
INSERT INTO `sys_oper_log` VALUES ('293', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"graphImgUrl\":\"/profile/upload/2022/04/17/aa9bf962-6af5-4e0d-8968-0b08303cb486.jpg\",\"params\":{},\"graphRemark\":\"14523\",\"graphTime\":1650177807178,\"graphKey\":\"id158f6c0acb3b4214bfab55e3230fd713\",\"graphName\":\"11223\",\"createBy\":\"1\",\"createTime\":1650177807178}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:43:27');
INSERT INTO `sys_oper_log` VALUES ('294', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"params\":{},\"graphRemark\":\"12544551214\",\"graphTime\":1650177950454,\"graphKey\":\"id3f29de188de744efb0e62806eca53421\",\"graphName\":\"14522\",\"createBy\":\"1\",\"createTime\":1650177950454}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:45:50');
INSERT INTO `sys_oper_log` VALUES ('295', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"params\":{},\"graphRemark\":\"741\",\"graphTime\":1650178339311,\"graphKey\":\"idf1fd823b5974432ebd4ea03751bec6e2\",\"graphName\":\"741\",\"createBy\":\"1\",\"createTime\":1650178339311}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:52:19');
INSERT INTO `sys_oper_log` VALUES ('296', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"params\":{},\"graphRemark\":\"123123\",\"graphTime\":1650178471029,\"graphKey\":\"id5350def70d814d2f84f0a6abe056d49a\",\"graphName\":\"123412\",\"createBy\":\"1\",\"createTime\":1650178471029}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:54:31');
INSERT INTO `sys_oper_log` VALUES ('297', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"1\",\"graphImgUrl\":\"\",\"params\":{},\"graphRemark\":\"1234123\",\"graphTime\":1650178556359,\"graphKey\":\"idb090507aca3b4784a889de9a4ed168a4\",\"graphName\":\"124234\",\"createBy\":\"1\",\"createTime\":1650178556359}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:55:56');
INSERT INTO `sys_oper_log` VALUES ('298', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/id3f29de188de744efb0e62806eca53421', '127.0.0.1', '内网IP', '{graphKeys=id3f29de188de744efb0e62806eca53421}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:57:30');
INSERT INTO `sys_oper_log` VALUES ('299', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/id5350def70d814d2f84f0a6abe056d49a', '127.0.0.1', '内网IP', '{graphKeys=id5350def70d814d2f84f0a6abe056d49a}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:57:33');
INSERT INTO `sys_oper_log` VALUES ('300', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/id5511081d8ea94206960035182c2fbe26', '127.0.0.1', '内网IP', '{graphKeys=id5511081d8ea94206960035182c2fbe26}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:57:37');
INSERT INTO `sys_oper_log` VALUES ('301', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/idf1fd823b5974432ebd4ea03751bec6e2', '127.0.0.1', '内网IP', '{graphKeys=idf1fd823b5974432ebd4ea03751bec6e2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:57:41');
INSERT INTO `sys_oper_log` VALUES ('302', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/idb090507aca3b4784a889de9a4ed168a4', '127.0.0.1', '内网IP', '{graphKeys=idb090507aca3b4784a889de9a4ed168a4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 14:57:44');
INSERT INTO `sys_oper_log` VALUES ('303', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/id158f6c0acb3b4214bfab55e3230fd713', '127.0.0.1', '内网IP', '{graphKeys=id158f6c0acb3b4214bfab55e3230fd713}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:00:29');
INSERT INTO `sys_oper_log` VALUES ('304', '图谱维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphController.add()', 'POST', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"1\",\"graphImgUrl\":\"/profile/upload/2022/04/17/f1ea59d7-eeba-47d3-aa9e-4b93f27de6e6.jpg\",\"params\":{},\"graphRemark\":\"引导萌新对于图谱的使用。\",\"graphTime\":1650179703843,\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"createBy\":\"1\",\"createTime\":1650179703843}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:15:03');
INSERT INTO `sys_oper_log` VALUES ('305', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"图谱的第一个节点。\",\"graphNodeTime\":1650179792397,\"graphNodeName\":\"萌新引导\",\"params\":{},\"graphNodeUrl\":\"<p><strong><em>图谱的第一个节点。</em></strong></p><p><img src=\\\"/dev-api/profile/upload/2022/04/17/90bb856b-2728-41d6-b779-0af860827558.jpg\\\"></p>\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"createBy\":\"1\",\"createTime\":1650179792397,\"graphNodeId\":177,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"d8eb0194-f0c1-4cfd-8bb1-6499aa6c9755\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:16:32');
INSERT INTO `sys_oper_log` VALUES ('306', '图谱维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphController.edit()', 'PUT', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"1\",\"graphImgUrl\":\"/profile/upload/2022/04/17/f1ea59d7-eeba-47d3-aa9e-4b93f27de6e6.jpg\",\"updateTime\":1650179837592,\"avatar\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"params\":{},\"graphRemark\":\"欢迎来到图谱时间，本图引导萌新对于系统的使用。\",\"graphTime\":1650124800000,\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"createBy\":\"1\",\"createTime\":1650179704000,\"graphUpdateNumber\":2,\"graphViews\":0,\"createName\":\"了却非\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:17:18');
INSERT INTO `sys_oper_log` VALUES ('307', '节点维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.edit()', 'PUT', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"图谱的第一个节点。\",\"graphNodeTime\":1650124800000,\"graphNodeName\":\"萌新引导\",\"updateTime\":1650180039133,\"params\":{},\"graphNodeUrl\":\"<p><strong><em>图谱节点对应的文档。详细使用，参考富文本。</em></strong></p><p><img src=\\\"/dev-api/profile/upload/2022/04/17/90bb856b-2728-41d6-b779-0af860827558.jpg\\\"></p>\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"createBy\":\"1\",\"createTime\":1650179792000,\"graphNodeUpdate\":1,\"graphNodeId\":177,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"d8eb0194-f0c1-4cfd-8bb1-6499aa6c9755\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:20:39');
INSERT INTO `sys_oper_log` VALUES ('308', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeTime\":1650180239445,\"params\":{},\"graphNodeUrl\":\"<p><br></p>\",\"createBy\":\"1\",\"createTime\":1650180239445,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"36b03d16-41a7-4dab-ab02-65ad099bbeb4\"}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'{\': expected whitespace, comment or a label name (line 3, column 10 (offset: 32))\r\n\"         {\"\r\n          ^\n\r\n### The error may exist in file [D:\\library\\desktop\\KnowledgeGraph\\knowledgegraph-neo4j\\target\\classes\\mapper\\neo4j\\Neo4jNodeMapper.xml]\r\n### The error may involve com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper.insertGraphNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: CREATE (           n :          {           name :?,           myicon :?           }         ) RETURN id (n)\r\n### Cause: java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'{\': expected whitespace, comment or a label name (line 3, column 10 (offset: 32))\r\n\"         {\"\r\n          ^\n\n; uncategorized SQLException; SQL state [null]; error code [0]; Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'{\': expected whitespace, comment or a label name (line 3, column 10 (offset: 32))\r\n\"         {\"\r\n          ^\n; nested exception is java.sql.SQLException: Some errors occurred : \n[Neo.ClientError.Statement.SyntaxError]:Invalid input \'{\': expected whitespace, comment or a label name (line 3, column 10 (offset: 32))\r\n\"         {\"\r\n          ^\n', '2022-04-17 15:23:59');
INSERT INTO `sys_oper_log` VALUES ('309', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"移动鼠标至节点深绿色区域，长按鼠标左键，移动鼠标。\",\"graphNodeTime\":1650180507420,\"graphNodeName\":\"左击节点拖动\",\"params\":{},\"graphNodeUrl\":\"<p>移动鼠标至节点深绿色区域，长按鼠标左键，移动鼠标。</p><p><img src=\\\"/dev-api/profile/upload/2022/04/17/55e5ca28-cd9c-43b2-bbe1-a14408842ad1.jpg\\\"></p>\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"createBy\":\"1\",\"createTime\":1650180507420,\"graphNodeId\":371,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"406cf9ae-086c-4d9f-8333-5fbef3f862f1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:28:27');
INSERT INTO `sys_oper_log` VALUES ('310', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"鼠标移动至节点星标处，会有小弹窗提示。\",\"graphNodeTime\":1650180631522,\"graphNodeName\":\"鼠标移动至节点星标处\",\"params\":{},\"graphNodeUrl\":\"<p><strong>鼠标移动至节点星标处，会有小弹窗提示。</strong></p><p><img src=\\\"/dev-api/profile/upload/2022/04/17/7015499b-d131-41be-a88f-d4939d43826c.jpg\\\"></p>\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"createBy\":\"1\",\"createTime\":1650180631522,\"graphNodeId\":391,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"f37826c9-2d41-4ccc-8fc8-b1f55f815276\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:30:31');
INSERT INTO `sys_oper_log` VALUES ('311', '节点维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphNodeController.add()', 'POST', '1', 'admin', null, '/neo4j/node', '127.0.0.1', '内网IP', '{\"graphNodeRemark\":\"右击节点，跳转至节点详情\",\"graphNodeTime\":1650180739386,\"graphNodeName\":\"右击节点\",\"params\":{},\"graphNodeUrl\":\"<p><em>右击节点，跳转至节点详情</em></p><p><em><span class=\\\"ql-cursor\\\">﻿</span></em><img src=\\\"/dev-api/profile/upload/2022/04/17/286d2557-1617-4cea-9aba-8058641b97d7.jpg\\\"></p>\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"createBy\":\"1\",\"createTime\":1650180739386,\"graphNodeId\":411,\"graphNodeMyicon\":\"el-icon-star-on\",\"graphNodeKey\":\"6a970a4b-491f-4742-9914-daceacd81fcb\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:32:19');
INSERT INTO `sys_oper_log` VALUES ('312', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":177,\"graphRelationshipName\":\"移动节点\",\"params\":{},\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphRelationshipTo\":371}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:38:30');
INSERT INTO `sys_oper_log` VALUES ('313', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":177,\"graphRelationshipName\":\"查看节点简介\",\"params\":{},\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphRelationshipTo\":391}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:39:03');
INSERT INTO `sys_oper_log` VALUES ('314', '关系维护', '1', 'com.knowledgegraph.web.controller.neo4j.GraphRelationshipController.add()', 'POST', '1', 'admin', null, '/neo4j/relationship', '127.0.0.1', '内网IP', '{\"graphRelationshipFrom\":177,\"graphRelationshipName\":\"查看节点全部信息\",\"params\":{},\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphRelationshipTo\":411}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:40:42');
INSERT INTO `sys_oper_log` VALUES ('315', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"引导图谱\",\"configKey\":\"graphIndex\",\"createBy\":\"admin\",\"createTime\":1649834468000,\"updateBy\":\"admin\",\"configId\":6,\"updateTime\":1650100329000,\"configType\":\"N\",\"configValue\":\"萌新引导图谱\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:41:04');
INSERT INTO `sys_oper_log` VALUES ('316', '图谱维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphController.edit()', 'PUT', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"1\",\"graphImgUrl\":\"/profile/upload/2022/04/17/f1ea59d7-eeba-47d3-aa9e-4b93f27de6e6.jpg\",\"updateTime\":1650181652479,\"avatar\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"params\":{},\"graphRemark\":\"欢迎来到图谱世界，本图引导萌新对于系统的使用。\",\"graphTime\":1650124800000,\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"createBy\":\"1\",\"createTime\":1650179704000,\"graphUpdateNumber\":10,\"graphViews\":1,\"createName\":\"了却非\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 15:47:32');
INSERT INTO `sys_oper_log` VALUES ('317', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"79997401-651c-41a6-9169-fd625c94a6f1\",\"params\":{},\"applyUser\":\"1\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"测试\",\"createTime\":1650183477903,\"applyTime\":1650183477903}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 16:17:58');
INSERT INTO `sys_oper_log` VALUES ('318', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"8db1d9e7-65ba-489f-ba76-d207abb2e5ba\",\"params\":{},\"applyUser\":\"1\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"12434657678\",\"createTime\":1650183797551,\"applyTime\":1650183797551}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-17 16:23:17');
INSERT INTO `sys_oper_log` VALUES ('319', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"applyUser\":\"1\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"741852963\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":2}', '0', null, '2022-04-17 16:42:52');
INSERT INTO `sys_oper_log` VALUES ('320', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"applyUser\":\"1\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"122\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":2}', '0', null, '2022-04-18 10:16:59');
INSERT INTO `sys_oper_log` VALUES ('321', '用户管理', '2', 'com.knowledgegraph.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1649689545000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"了却非test\",\"sex\":\"0\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":102,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1648103894000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:17:36');
INSERT INTO `sys_oper_log` VALUES ('322', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'ry', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"a317be9e-5704-4aa5-9fea-db15a716236d\",\"params\":{},\"applyUser\":\"2\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"1452\",\"createTime\":1650248294565,\"applyTime\":1650248294565}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', '0', null, '2022-04-18 10:18:14');
INSERT INTO `sys_oper_log` VALUES ('323', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'ry', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"applyUser\":\"2\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"7412\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":3}', '0', null, '2022-04-18 10:18:21');
INSERT INTO `sys_oper_log` VALUES ('324', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"applyUser\":\"1\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"741\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":2}', '0', null, '2022-04-18 10:19:26');
INSERT INTO `sys_oper_log` VALUES ('325', '申请审核', '2', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.edit()', 'PUT', '1', 'admin', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"applyKey\":\"a317be9e-5704-4aa5-9fea-db15a716236d\",\"updateTime\":1650248382593,\"applySign\":\"1\",\"params\":{},\"applyUser\":\"2\",\"applyUserName\":\"了却非test\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"applyRemark\":\"1452\",\"createTime\":1650248295000,\"examineRemark\":\"741\",\"applyFlag\":\"1\",\"applyTime\":1650211200000,\"examineTime\":1650248382593}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:19:42');
INSERT INTO `sys_oper_log` VALUES ('326', '申请审核', '1', 'com.knowledgegraph.web.controller.neo4j.GraphApplyController.add()', 'POST', '1', 'ry', null, '/neo4j/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"applyUser\":\"2\",\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"applyRemark\":\"789\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":2}', '0', null, '2022-04-18 10:19:53');
INSERT INTO `sys_oper_log` VALUES ('327', '角色管理', '2', 'com.knowledgegraph.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1648103894000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2007,2008,2009,2010,2011,2012,2013,2020,2021,2045,2046,2047,2048,2049,2050,2022,2023,2024,2025,2027,2028,2029,2030,2031,2032,2026,2014,2015,2016,2017,2018,2019,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:32:55');
INSERT INTO `sys_oper_log` VALUES ('328', '图谱维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphController.edit()', 'PUT', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"0\",\"graphImgUrl\":\"/profile/upload/2022/04/17/f1ea59d7-eeba-47d3-aa9e-4b93f27de6e6.jpg\",\"updateTime\":1650249341270,\"avatar\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"params\":{},\"graphRemark\":\"欢迎来到图谱世界，本图引导萌新对于系统的使用。\",\"graphTime\":1650124800000,\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"createBy\":\"1\",\"createTime\":1650179704000,\"graphUpdateNumber\":11,\"graphViews\":1,\"createName\":\"了却非\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:35:41');
INSERT INTO `sys_oper_log` VALUES ('329', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":4,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:37:10');
INSERT INTO `sys_oper_log` VALUES ('330', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"druid\",\"orderNum\":3,\"menuName\":\"数据监控\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"druid\",\"component\":\"monitor/druid/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":111,\"menuType\":\"C\",\"perms\":\"monitor:druid:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:37:35');
INSERT INTO `sys_oper_log` VALUES ('331', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"server\",\"orderNum\":4,\"menuName\":\"服务监控\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"server\",\"component\":\"monitor/server/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":112,\"menuType\":\"C\",\"perms\":\"monitor:server:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:37:44');
INSERT INTO `sys_oper_log` VALUES ('332', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"redis\",\"orderNum\":5,\"menuName\":\"缓存监控\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"cache\",\"component\":\"monitor/cache/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":113,\"menuType\":\"C\",\"perms\":\"monitor:cache:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:37:49');
INSERT INTO `sys_oper_log` VALUES ('333', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"log\",\"orderNum\":9,\"menuName\":\"日志管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"log\",\"component\":\"\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":108,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:38:00');
INSERT INTO `sys_oper_log` VALUES ('334', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tree\",\"orderNum\":4,\"menuName\":\"部门管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"dept\",\"component\":\"system/dept/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":103,\"menuType\":\"C\",\"perms\":\"system:dept:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:38:16');
INSERT INTO `sys_oper_log` VALUES ('335', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"post\",\"orderNum\":5,\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":104,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 10:38:21');
INSERT INTO `sys_oper_log` VALUES ('336', '角色管理', '2', 'com.knowledgegraph.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1648103894000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,107,2007,2008,2009,2010,2011,2012,2013,2020,2021,2045,2046,2047,2048,2049,2050,2022,2023,2024,2025,2027,2028,2029,2030,2031,2032,2026,2014,2015,2016,2017,2018,2019,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,1036],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 11:04:55');
INSERT INTO `sys_oper_log` VALUES ('337', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tree\",\"orderNum\":4,\"menuName\":\"部门管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"dept\",\"component\":\"system/dept/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":103,\"menuType\":\"C\",\"perms\":\"system:dept:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:17:51');
INSERT INTO `sys_oper_log` VALUES ('338', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"post\",\"orderNum\":5,\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":104,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:17:57');
INSERT INTO `sys_oper_log` VALUES ('339', '用户管理', '2', 'com.knowledgegraph.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1650251122000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"了却非test\",\"sex\":\"0\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"网络工程\",\"leader\":\"了却非\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":102,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1648103894000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:19:17');
INSERT INTO `sys_oper_log` VALUES ('340', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tree\",\"orderNum\":4,\"menuName\":\"部门管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"dept\",\"component\":\"system/dept/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":103,\"menuType\":\"C\",\"perms\":\"system:dept:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:19:44');
INSERT INTO `sys_oper_log` VALUES ('341', '菜单管理', '2', 'com.knowledgegraph.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"post\",\"orderNum\":5,\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1648103895000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":104,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:19:50');
INSERT INTO `sys_oper_log` VALUES ('342', '参数管理', '1', 'com.knowledgegraph.web.controller.system.SysConfigController.add()', 'POST', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"注册初始角色\",\"configKey\":\"user_role_default\",\"createBy\":\"admin\",\"configType\":\"Y\",\"configValue\":\"c\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:21:18');
INSERT INTO `sys_oper_log` VALUES ('343', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"注册初始角色编码\",\"configKey\":\"user_role_default\",\"createBy\":\"admin\",\"createTime\":1650266478000,\"updateBy\":\"admin\",\"configId\":7,\"configType\":\"Y\",\"configValue\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:21:54');
INSERT INTO `sys_oper_log` VALUES ('344', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"注册初始角色编码\",\"configKey\":\"user_role_default\",\"createBy\":\"admin\",\"createTime\":1650266478000,\"updateBy\":\"admin\",\"configId\":7,\"updateTime\":1650266513000,\"configType\":\"N\",\"configValue\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:22:02');
INSERT INTO `sys_oper_log` VALUES ('345', '参数管理', '1', 'com.knowledgegraph.web.controller.system.SysConfigController.add()', 'POST', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"注册初始账号状态\",\"configKey\":\"user_status\",\"createBy\":\"admin\",\"configType\":\"Y\",\"configValue\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 15:23:16');
INSERT INTO `sys_oper_log` VALUES ('346', '图谱维护', '2', 'com.knowledgegraph.web.controller.neo4j.GraphController.edit()', 'PUT', '1', 'admin', null, '/neo4j/graph', '127.0.0.1', '内网IP', '{\"graphType\":\"1\",\"graphImgUrl\":\"/profile/upload/2022/04/17/f1ea59d7-eeba-47d3-aa9e-4b93f27de6e6.jpg\",\"updateTime\":1650274359176,\"avatar\":\"/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg\",\"params\":{},\"graphRemark\":\"欢迎来到图谱世界，本图引导萌新对于系统的使用。\",\"graphTime\":1650124800000,\"graphKey\":\"id7634d71f48d4419b92efc8b50b8b8478\",\"graphName\":\"萌新引导图谱\",\"createBy\":\"1\",\"createTime\":1650179704000,\"graphUpdateNumber\":12,\"graphViews\":1,\"createName\":\"了却非\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 17:32:39');
INSERT INTO `sys_oper_log` VALUES ('347', '参数管理', '2', 'com.knowledgegraph.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"账号自助-是否开启用户注册功能\",\"configKey\":\"sys.account.registerUser\",\"createBy\":\"admin\",\"createTime\":1648103908000,\"updateBy\":\"admin\",\"configId\":5,\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"configType\":\"Y\",\"configValue\":\"true\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 22:05:55');
INSERT INTO `sys_oper_log` VALUES ('348', '用户管理', '2', 'com.knowledgegraph.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1650290811000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"liaoquefei\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"liaoquefei\",\"userId\":3,\"createBy\":\"\",\"roleIds\":[2],\"createTime\":1650290769000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-18 22:07:17');
INSERT INTO `sys_oper_log` VALUES ('349', '图谱维护', '3', 'com.knowledgegraph.web.controller.neo4j.GraphController.remove()', 'DELETE', '1', 'admin', null, '/neo4j/graph/id7634d71f48d4419b92efc8b50b8b8478', '127.0.0.1', '内网IP', '{graphKeys=id7634d71f48d4419b92efc8b50b8b8478}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-19 11:24:53');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-03-24 14:38:14', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-03-24 14:38:14', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-03-24 14:38:14', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-03-24 14:38:14', '', null, '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-03-24 14:38:14', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-03-24 14:38:14', 'admin', '2022-04-18 11:04:54', '普通角色');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2014');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '2016');
INSERT INTO `sys_role_menu` VALUES ('2', '2017');
INSERT INTO `sys_role_menu` VALUES ('2', '2018');
INSERT INTO `sys_role_menu` VALUES ('2', '2019');
INSERT INTO `sys_role_menu` VALUES ('2', '2020');
INSERT INTO `sys_role_menu` VALUES ('2', '2021');
INSERT INTO `sys_role_menu` VALUES ('2', '2022');
INSERT INTO `sys_role_menu` VALUES ('2', '2023');
INSERT INTO `sys_role_menu` VALUES ('2', '2024');
INSERT INTO `sys_role_menu` VALUES ('2', '2025');
INSERT INTO `sys_role_menu` VALUES ('2', '2026');
INSERT INTO `sys_role_menu` VALUES ('2', '2027');
INSERT INTO `sys_role_menu` VALUES ('2', '2028');
INSERT INTO `sys_role_menu` VALUES ('2', '2029');
INSERT INTO `sys_role_menu` VALUES ('2', '2030');
INSERT INTO `sys_role_menu` VALUES ('2', '2031');
INSERT INTO `sys_role_menu` VALUES ('2', '2032');
INSERT INTO `sys_role_menu` VALUES ('2', '2033');
INSERT INTO `sys_role_menu` VALUES ('2', '2034');
INSERT INTO `sys_role_menu` VALUES ('2', '2035');
INSERT INTO `sys_role_menu` VALUES ('2', '2036');
INSERT INTO `sys_role_menu` VALUES ('2', '2037');
INSERT INTO `sys_role_menu` VALUES ('2', '2038');
INSERT INTO `sys_role_menu` VALUES ('2', '2039');
INSERT INTO `sys_role_menu` VALUES ('2', '2040');
INSERT INTO `sys_role_menu` VALUES ('2', '2041');
INSERT INTO `sys_role_menu` VALUES ('2', '2042');
INSERT INTO `sys_role_menu` VALUES ('2', '2043');
INSERT INTO `sys_role_menu` VALUES ('2', '2044');
INSERT INTO `sys_role_menu` VALUES ('2', '2045');
INSERT INTO `sys_role_menu` VALUES ('2', '2046');
INSERT INTO `sys_role_menu` VALUES ('2', '2047');
INSERT INTO `sys_role_menu` VALUES ('2', '2048');
INSERT INTO `sys_role_menu` VALUES ('2', '2049');
INSERT INTO `sys_role_menu` VALUES ('2', '2050');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '了却非', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2022/03/29/ae623102-2324-442f-9efe-96ac7780ad31.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-19 11:24:43', 'admin', '2022-03-24 14:38:13', '', '2022-04-19 11:24:43', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '了却非test', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-19 11:22:05', 'admin', '2022-03-24 14:38:14', 'admin', '2022-04-19 11:22:05', '测试员');
INSERT INTO `sys_user` VALUES ('3', null, 'liaoquefei', 'liaoquefei', '00', '', '', '0', '', '$2a$10$cmKklNJR2dpVqVEzRS1UX.ljSIIAbXQ.7S3gDGxp2xLhW3YfiIXEm', '0', '0', '127.0.0.1', '2022-04-18 22:07:47', '', '2022-04-18 22:06:09', 'admin', '2022-04-18 22:07:47', null);
INSERT INTO `sys_user` VALUES ('4', null, 'arrival', 'arrival', '00', '', '', '0', '', '$2a$10$IKUrmT.cD2ybwo3oMeomguOMkmnzgoPt78HMOVXZvHU9S0uPnHhEO', '0', '0', '127.0.0.1', '2022-04-18 22:29:20', '', '2022-04-18 22:26:21', '', '2022-04-18 22:29:19', null);
INSERT INTO `sys_user` VALUES ('5', null, 'lqf', 'lqf', '00', '', '', '0', '', '$2a$10$zUi5HtudFHWmYnmott8er.4XOOB9x88XLmHSQfdNPcjJ3mP2x.6Zm', '0', '0', '127.0.0.1', '2022-04-18 22:34:58', '', '2022-04-18 22:34:45', '', '2022-04-18 22:34:58', null);
INSERT INTO `sys_user` VALUES ('6', null, 'liang', 'liang', '00', '', '', '0', '', '$2a$10$OHiCk2Plivs2jhW4z026UuSX9f35hE8Ac7A3Cy8zF/XW4WVBMPTFS', '0', '0', '127.0.0.1', '2024-03-06 12:57:11', '', '2024-03-04 18:51:36', '', '2024-03-06 12:57:10', null);
INSERT INTO `sys_user` VALUES ('7', null, '123', '123', '00', '', '', '0', '', '$2a$10$DpclOHpheC.PB5FuPyOQue6SDBCXOiRezH8/Ti7okjBQoF483gnMK', '0', '0', '127.0.0.1', '2024-03-06 12:45:21', '', '2024-03-04 19:36:49', '', '2024-03-06 12:45:21', null);

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '2');
INSERT INTO `sys_user_role` VALUES ('5', '2');
INSERT INTO `sys_user_role` VALUES ('6', '2');
INSERT INTO `sys_user_role` VALUES ('7', '2');

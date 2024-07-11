/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云服务器
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 47.111.1.180:3306
 Source Schema         : gyd

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 11/07/2024 15:02:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_info
-- ----------------------------
DROP TABLE IF EXISTS `api_info`;
CREATE TABLE `api_info`  (
  `api_id` bigint NOT NULL AUTO_INCREMENT COMMENT '接口ID',
  `site_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `site_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '接口状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `api_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `api_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口地址',
  `api_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口参数',
  `api_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口请求方式',
  `api_headers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求头',
  PRIMARY KEY (`api_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站接口信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of api_info
-- ----------------------------
INSERT INTO `api_info` VALUES (1, '稀土掘金社区', 'https://juejin.cn/', '0', '2', '', '2024-06-21 15:58:58', '', '2024-06-24 10:01:19', '', '自动签到', 'https://api.juejin.cn/growth_api/v1/check_in', '{\n    \"aid\": \"2608\"\n}', 'POST', '{\"Cookie\":\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\"}');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'api_info', '网站接口信息表', NULL, NULL, 'ApiInfo', 'crud', 'element-ui', 'com.gyd.script', 'script', 'api', '网站接口信息', 'gyd', '0', '/', '{}', 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (38, 4, 'api_id', '接口ID', 'bigint(20)', 'Long', 'apiId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (39, 4, 'site_name', '网站名称', 'varchar(30)', 'String', 'siteName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (40, 4, 'site_url', '网站地址', 'varchar(50)', 'String', 'siteUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (41, 4, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (42, 4, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (43, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (44, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (45, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (46, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (47, 4, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (48, 4, 'api_name', '接口名称', 'varchar(100)', 'String', 'apiName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (49, 4, 'api_url', '接口地址', 'varchar(2000)', 'String', 'apiUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (50, 4, 'api_params', '接口参数', 'text', 'String', 'apiParams', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (51, 4, 'api_method', '接口请求方式', 'varchar(10)', 'String', 'apiMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');
INSERT INTO `gen_table_column` VALUES (52, 4, 'api_headers', '请求头', 'text', 'String', 'apiHeaders', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2024-06-21 16:06:20', '', '2024-06-21 16:07:13');

-- ----------------------------
-- Table structure for i_appointment_record
-- ----------------------------
DROP TABLE IF EXISTS `i_appointment_record`;
CREATE TABLE `i_appointment_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `mobile` bigint NULL DEFAULT NULL COMMENT '用户手机号',
  `record_type` int NULL DEFAULT NULL COMMENT '预约类型 0-i茅台',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约记录内容',
  `status` int NULL DEFAULT NULL COMMENT '预约结果',
  `record_date` date NOT NULL COMMENT '预约日期',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `record_time` datetime NOT NULL COMMENT '预约时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预约记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of i_appointment_record
-- ----------------------------

-- ----------------------------
-- Table structure for i_item
-- ----------------------------
DROP TABLE IF EXISTS `i_item`;
CREATE TABLE `i_item`  (
  `item_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约商品编码',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容\n',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'I茅台预约商品列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of i_item
-- ----------------------------
INSERT INTO `i_item` VALUES (1, '10941', '贵州茅台酒 (甲辰龙年)', '龍腾九霄，四海安澜。2024年甲辰至，贵州茅台推出甲辰龙年贵州茅台酒，集茅台文化，五行文化，生肖文化，书画艺术之大成、鉴藏皆宜。', 'https://resource.moutai519.com.cn/mt-resource/static-union/164743876053f93c.png', '2024-07-11 14:58:27');
INSERT INTO `i_item` VALUES (2, '10923', '53%vol 500ml茅台1935·中国国家地理文创酒', '', 'https://resource.moutai519.com.cn/mt-resource/static-union/164743876053f93c.png', '2024-07-11 14:58:27');
INSERT INTO `i_item` VALUES (3, '2478', '贵州茅台酒（珍品）', '珍酿之品，百福具臻。沿袭初心至真、酒品至珍、风格至臻的理念，汇聚大师匠心，香气完美融合，酒体平衡协调。', 'https://resource.moutai519.com.cn/mt-resource/static-union/16480897792e8039.png', '2024-07-11 14:58:27');
INSERT INTO `i_item` VALUES (4, '10942', '贵州茅台酒 (甲辰龙年)', '龍腾九霄，四海安澜。2024年甲辰至，贵州茅台推出甲辰龙年贵州茅台酒，集茅台文化，五行文化，生肖文化，书画艺术之大成、鉴藏皆宜。', 'https://resource.moutai519.com.cn/mt-resource/static-union/164743876053f93c.png', '2024-07-11 14:58:27');

-- ----------------------------
-- Table structure for i_log
-- ----------------------------
DROP TABLE IF EXISTS `i_log`;
CREATE TABLE `i_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` bigint NULL DEFAULT NULL COMMENT '操作人员',
  `log_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志记录内容',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of i_log
-- ----------------------------
INSERT INTO `i_log` VALUES (1, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：申购已结束，请明天再来\n\n', 1, '2024-06-11 11:08:26', 'admin');
INSERT INTO `i_log` VALUES (2, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-06-11 11:08:36', 'admin');
INSERT INTO `i_log` VALUES (3, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1718614175286}}', 0, '2024-06-17 16:49:38', 'admin');
INSERT INTO `i_log` VALUES (4, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：申购已结束，请明天再来\n\n', 1, '2024-06-24 13:44:46', 'admin');
INSERT INTO `i_log` VALUES (5, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-06-24 13:44:56', 'admin');
INSERT INTO `i_log` VALUES (6, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于6月26日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20396579677,\"sessionId\":1096,\"shopId\":\"231310117002\",\"reservationTime\":1719365391520,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1719396000000,\"cacheValidTime\":1719396000000}}}\n\n', 0, '2024-06-26 09:29:54', 'admin');
INSERT INTO `i_log` VALUES (7, 16628730228, '[申购耐力值]:{\"code\":200,\"message\":null,\"data\":{\"continueReserveRate\":null,\"awardRule\":[{\"goodId\":20001,\"goodName\":\"耐力\",\"goodCode\":null,\"goodType\":null,\"goodUrl\":null,\"count\":70}]},\"error\":null}', 0, '2024-06-26 09:30:04', 'admin');
INSERT INTO `i_log` VALUES (8, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1719392648657}}', 0, '2024-06-26 17:04:11', 'admin');
INSERT INTO `i_log` VALUES (9, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于6月27日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20400442772,\"sessionId\":1097,\"shopId\":\"231310117002\",\"reservationTime\":1719452575928,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1719482400000,\"cacheValidTime\":1719482400000}}}\n\n', 0, '2024-06-27 09:42:56', 'admin');
INSERT INTO `i_log` VALUES (10, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1719452578926}}', 0, '2024-06-27 09:42:59', 'admin');
INSERT INTO `i_log` VALUES (11, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-06-27 09:43:06', 'admin');
INSERT INTO `i_log` VALUES (12, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于6月28日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20408389354,\"sessionId\":1098,\"shopId\":\"231310117002\",\"reservationTime\":1719537622911,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1719568800000,\"cacheValidTime\":1719568800000}}}\n\n', 0, '2024-06-28 09:20:25', 'admin');
INSERT INTO `i_log` VALUES (13, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-06-28 09:20:25', 'admin');
INSERT INTO `i_log` VALUES (14, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1719537625676}}', 0, '2024-06-28 09:20:28', 'admin');
INSERT INTO `i_log` VALUES (15, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-06-28 09:20:36', 'admin');
INSERT INTO `i_log` VALUES (16, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-06-28 09:20:36', 'admin');
INSERT INTO `i_log` VALUES (17, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月1日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20436024418,\"sessionId\":1103,\"shopId\":\"231310117002\",\"reservationTime\":1719798116039,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1719828000000,\"cacheValidTime\":1719828000000}}}\n\n', 0, '2024-07-01 09:42:04', 'admin');
INSERT INTO `i_log` VALUES (18, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1719798118785}}', 0, '2024-07-01 09:42:06', 'admin');
INSERT INTO `i_log` VALUES (19, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-01 09:42:14', 'admin');
INSERT INTO `i_log` VALUES (20, 15162421714, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1719801302525}}', 0, '2024-07-01 10:35:10', 'admin');
INSERT INTO `i_log` VALUES (21, 15162421714, '执行报错--[预约项目]：10941\n[结果返回]：申购已结束，请明天再来\n\n', 1, '2024-07-01 10:35:12', 'admin');
INSERT INTO `i_log` VALUES (22, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-01 10:35:23', 'admin');
INSERT INTO `i_log` VALUES (23, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月2日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20439662691,\"sessionId\":1104,\"shopId\":\"231310117002\",\"reservationTime\":1719882940891,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1719914400000,\"cacheValidTime\":1719914400000}}}\n\n', 0, '2024-07-02 09:15:50', 'admin');
INSERT INTO `i_log` VALUES (24, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1719882943937}}', 0, '2024-07-02 09:15:53', 'admin');
INSERT INTO `i_log` VALUES (25, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月2日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20443979156,\"sessionId\":1104,\"shopId\":\"132320500001\",\"reservationTime\":1719882947936,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1719914400000,\"cacheValidTime\":1719914400000}}}\n\n', 0, '2024-07-02 09:15:57', 'admin');
INSERT INTO `i_log` VALUES (26, 15162421714, '执行报错--[获得旅行奖励]:开始旅行失败：耐力不足', 1, '2024-07-02 09:16:00', 'admin');
INSERT INTO `i_log` VALUES (27, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-02 09:16:00', 'admin');
INSERT INTO `i_log` VALUES (28, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-02 09:16:07', 'admin');
INSERT INTO `i_log` VALUES (29, 18028616136, '执行报错--[预约项目]：10941\n[结果返回]：申购已结束，请明天再来\n\n', 1, '2024-07-02 10:00:45', 'admin');
INSERT INTO `i_log` VALUES (30, 18028616136, '执行报错--[获得旅行奖励]:耐力不足100, 当前耐力值:50', 1, '2024-07-02 10:00:47', 'admin');
INSERT INTO `i_log` VALUES (31, 18028616136, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-02 10:00:56', 'admin');
INSERT INTO `i_log` VALUES (32, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月3日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20448099111,\"sessionId\":1105,\"shopId\":\"231310117002\",\"reservationTime\":1719969734982,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720000800000,\"cacheValidTime\":1720000800000}}}\n\n', 0, '2024-07-03 09:22:26', 'admin');
INSERT INTO `i_log` VALUES (33, 18028616136, '执行报错--[预约项目]：10941\n[结果返回]：申购失败，您的实名信息未完善或未通过认证\n\n', 1, '2024-07-03 09:22:27', 'admin');
INSERT INTO `i_log` VALUES (34, 18028616136, '执行报错--[预约项目]：10941\n[结果返回]：申购失败，您的实名信息未完善或未通过认证\n\n', 1, '2024-07-03 09:22:27', 'admin');
INSERT INTO `i_log` VALUES (35, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月3日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20448099737,\"sessionId\":1105,\"shopId\":\"132320500001\",\"reservationTime\":1719969736989,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720000800000,\"cacheValidTime\":1720000800000}}}\n\n', 0, '2024-07-03 09:22:28', 'admin');
INSERT INTO `i_log` VALUES (36, 15162421714, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-03 09:22:28', 'admin');
INSERT INTO `i_log` VALUES (37, 16628730228, '[申购耐力值]:{\"code\":200,\"message\":null,\"data\":{\"continueReserveRate\":null,\"awardRule\":[{\"goodId\":20001,\"goodName\":\"耐力\",\"goodCode\":null,\"goodType\":null,\"goodUrl\":null,\"count\":70}]},\"error\":null}', 0, '2024-07-03 09:22:36', 'admin');
INSERT INTO `i_log` VALUES (38, 18028616136, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-03 09:22:37', 'admin');
INSERT INTO `i_log` VALUES (39, 18028616136, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-03 09:22:37', 'admin');
INSERT INTO `i_log` VALUES (40, 15162421714, '[申购耐力值]:{\"code\":200,\"message\":null,\"data\":{\"continueReserveRate\":null,\"awardRule\":[{\"goodId\":20001,\"goodName\":\"耐力\",\"goodCode\":null,\"goodType\":null,\"goodUrl\":null,\"count\":30}]},\"error\":null}', 0, '2024-07-03 09:22:38', 'admin');
INSERT INTO `i_log` VALUES (41, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-03 09:22:38', 'admin');
INSERT INTO `i_log` VALUES (42, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-03 09:23:22', 'admin');
INSERT INTO `i_log` VALUES (43, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-03 09:23:33', 'admin');
INSERT INTO `i_log` VALUES (44, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月4日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20459273633,\"sessionId\":1106,\"shopId\":\"231310117002\",\"reservationTime\":1720056377229,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720087200000,\"cacheValidTime\":1720087200000}}}\n\n', 0, '2024-07-04 09:26:30', 'admin');
INSERT INTO `i_log` VALUES (45, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720056379842}}', 0, '2024-07-04 09:26:33', 'admin');
INSERT INTO `i_log` VALUES (46, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月4日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20459848178,\"sessionId\":1106,\"shopId\":\"132320500001\",\"reservationTime\":1720056380476,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720087200000,\"cacheValidTime\":1720087200000}}}\n\n', 0, '2024-07-04 09:26:33', 'admin');
INSERT INTO `i_log` VALUES (47, 15162421714, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720056382577}}', 0, '2024-07-04 09:26:36', 'admin');
INSERT INTO `i_log` VALUES (48, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-04 09:26:40', 'admin');
INSERT INTO `i_log` VALUES (49, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-04 09:26:44', 'admin');
INSERT INTO `i_log` VALUES (50, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月5日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20463696445,\"sessionId\":1107,\"shopId\":\"231310117002\",\"reservationTime\":1720142531036,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720173600000,\"cacheValidTime\":1720173600000}}}\n\n', 0, '2024-07-05 09:22:25', 'admin');
INSERT INTO `i_log` VALUES (51, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720142533140}}', 0, '2024-07-05 09:22:27', 'admin');
INSERT INTO `i_log` VALUES (52, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月5日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20467349719,\"sessionId\":1107,\"shopId\":\"132320500001\",\"reservationTime\":1720142535678,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720173600000,\"cacheValidTime\":1720173600000}}}\n\n', 0, '2024-07-05 09:22:30', 'admin');
INSERT INTO `i_log` VALUES (53, 15162421714, '执行报错--[获得旅行奖励]:开始旅行失败：耐力不足', 1, '2024-07-05 09:22:32', 'admin');
INSERT INTO `i_log` VALUES (54, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-05 09:22:35', 'admin');
INSERT INTO `i_log` VALUES (55, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-05 09:22:40', 'admin');
INSERT INTO `i_log` VALUES (56, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月8日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20481297013,\"sessionId\":1111,\"shopId\":\"231310117002\",\"reservationTime\":1720401364015,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720432800000,\"cacheValidTime\":1720432800000}}}\n\n', 0, '2024-07-08 09:16:09', 'admin');
INSERT INTO `i_log` VALUES (57, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-08 09:16:10', 'admin');
INSERT INTO `i_log` VALUES (58, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720401367071}}', 0, '2024-07-08 09:16:12', 'admin');
INSERT INTO `i_log` VALUES (59, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720401367616}}', 0, '2024-07-08 09:16:13', 'admin');
INSERT INTO `i_log` VALUES (60, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月8日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20481298686,\"sessionId\":1111,\"shopId\":\"132320500001\",\"reservationTime\":1720401368293,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720432800000,\"cacheValidTime\":1720432800000}}}\n\n', 0, '2024-07-08 09:16:14', 'admin');
INSERT INTO `i_log` VALUES (61, 15162421714, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720401370597}}', 0, '2024-07-08 09:16:16', 'admin');
INSERT INTO `i_log` VALUES (62, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-08 09:16:20', 'admin');
INSERT INTO `i_log` VALUES (63, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-08 09:16:20', 'admin');
INSERT INTO `i_log` VALUES (64, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-08 09:16:24', 'admin');
INSERT INTO `i_log` VALUES (65, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月9日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20494749386,\"sessionId\":1112,\"shopId\":\"231310117002\",\"reservationTime\":1720488443013,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720519200000,\"cacheValidTime\":1720519200000}}}\n\n', 0, '2024-07-09 09:27:24', 'admin');
INSERT INTO `i_log` VALUES (66, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720488446079}}', 0, '2024-07-09 09:27:27', 'admin');
INSERT INTO `i_log` VALUES (67, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月9日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20494187155,\"sessionId\":1112,\"shopId\":\"132320500001\",\"reservationTime\":1720488447897,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720519200000,\"cacheValidTime\":1720519200000}}}\n\n', 0, '2024-07-09 09:27:29', 'admin');
INSERT INTO `i_log` VALUES (68, 15162421714, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720488450677}}', 0, '2024-07-09 09:27:32', 'admin');
INSERT INTO `i_log` VALUES (69, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-09 09:27:35', 'admin');
INSERT INTO `i_log` VALUES (70, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-09 09:27:39', 'admin');
INSERT INTO `i_log` VALUES (71, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月10日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20502550381,\"sessionId\":1113,\"shopId\":\"231310117002\",\"reservationTime\":1720574722470,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720605600000,\"cacheValidTime\":1720605600000}}}\n\n', 0, '2024-07-10 09:25:25', 'admin');
INSERT INTO `i_log` VALUES (72, 16628730228, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720574724511}}', 0, '2024-07-10 09:25:27', 'admin');
INSERT INTO `i_log` VALUES (73, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月10日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20502551067,\"sessionId\":1113,\"shopId\":\"132320500001\",\"reservationTime\":1720574726474,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720605600000,\"cacheValidTime\":1720605600000}}}\n\n', 0, '2024-07-10 09:25:29', 'admin');
INSERT INTO `i_log` VALUES (74, 15162421714, '[获得旅行奖励]:{\"code\":2000,\"data\":{\"startTravelTs\":1720574728792}}', 0, '2024-07-10 09:25:31', 'admin');
INSERT INTO `i_log` VALUES (75, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-10 09:25:35', 'admin');
INSERT INTO `i_log` VALUES (76, 15162421714, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-10 09:25:39', 'admin');
INSERT INTO `i_log` VALUES (77, 15162421714, '[预约项目]：10941\n[shopId]：132320500001\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月11日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20511334290,\"sessionId\":1114,\"shopId\":\"132320500001\",\"reservationTime\":1720662846298,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720692000000,\"cacheValidTime\":1720692000000}}}\n\n', 0, '2024-07-11 09:54:11', 'admin');
INSERT INTO `i_log` VALUES (78, 16628730228, '[预约项目]：10941\n[shopId]：231310117002\n[结果返回]：{\"code\":2000,\"data\":{\"successDesc\":\"申购完成，请于7月11日18:00查看预约申购结果\",\"reservationList\":[{\"reservationId\":20510963172,\"sessionId\":1114,\"shopId\":\"231310117002\",\"reservationTime\":1720662854971,\"itemId\":\"10941\",\"count\":1}],\"reservationDetail\":{\"desc\":\"申购成功后将以短信形式通知您，请您在申购成功次日18:00前选择支付方式，并根据提示完成支付。\",\"lotteryTime\":1720692000000,\"cacheValidTime\":1720692000000}}}\n\n', 0, '2024-07-11 09:54:20', 'admin');
INSERT INTO `i_log` VALUES (79, 15162421714, '[申购耐力值]:{\"code\":200,\"message\":null,\"data\":{\"continueReserveRate\":null,\"awardRule\":[{\"goodId\":20001,\"goodName\":\"耐力\",\"goodCode\":null,\"goodType\":null,\"goodUrl\":null,\"count\":70}]},\"error\":null}', 0, '2024-07-11 09:54:26', 'admin');
INSERT INTO `i_log` VALUES (80, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-11 09:54:26', 'admin');
INSERT INTO `i_log` VALUES (81, 16628730228, '[申购耐力值]:{\"code\":200,\"message\":null,\"data\":{\"continueReserveRate\":null,\"awardRule\":[{\"goodId\":20001,\"goodName\":\"耐力\",\"goodCode\":null,\"goodType\":null,\"goodUrl\":null,\"count\":70}]},\"error\":null}', 0, '2024-07-11 09:54:30', 'admin');
INSERT INTO `i_log` VALUES (82, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-11 09:54:37', 'admin');
INSERT INTO `i_log` VALUES (83, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-11 09:55:09', 'admin');
INSERT INTO `i_log` VALUES (84, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-11 09:55:19', 'admin');
INSERT INTO `i_log` VALUES (85, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)\n\n', 1, '2024-07-11 09:55:39', 'admin');
INSERT INTO `i_log` VALUES (86, 16628730228, '执行报错--[申购耐力值]:Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)', 1, '2024-07-11 09:55:59', 'admin');
INSERT INTO `i_log` VALUES (87, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-11 09:56:29', 'admin');
INSERT INTO `i_log` VALUES (88, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-11 09:56:46', 'admin');
INSERT INTO `i_log` VALUES (89, 16628730228, '执行报错--[预约项目]：10941\n[结果返回]：今天已申购，请明日再来\n\n', 1, '2024-07-11 09:56:46', 'admin');
INSERT INTO `i_log` VALUES (90, 16628730228, '执行报错--[申购耐力值]:任务未完成，无法领取奖励', 1, '2024-07-11 09:56:57', 'admin');

-- ----------------------------
-- Table structure for i_shop
-- ----------------------------
DROP TABLE IF EXISTS `i_shop`;
CREATE TABLE `i_shop`  (
  `shop_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `i_shop_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品ID',
  `province_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `district_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `full_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整地址',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tenant_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3025 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of i_shop
-- ----------------------------
INSERT INTO `i_shop` VALUES (1, '143430124001', '湖南省', '长沙市', '宁乡市', '长沙市宁乡市城郊街道宁乡大道198号优雅翠园148-158号门面', '28.27368', '112.565637', '宁乡市宁乡大道贵州茅台专卖店', '长沙海斌酒业贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2, '2344528100003', '广东省', '揭阳市', '普宁市', '揭阳市普宁市流沙御景一期商铺1107号', '23.311819', '116.159306', '普宁市流沙御景城茅台酱香万家共享主题终端', '普宁市池尾千顺糖烟茶酒商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3, '224501030001', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区凤岭南路16号保利领秀前城禧悦都7号B111-B113号', '22.79487', '108.428032', '南宁市青秀区凤岭南路贵州茅台酱香系列酒体验中心', '南宁市琪联茂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (4, '141410329001', '河南省', '洛阳市', '伊川县', '洛阳市伊川县新城大道东段凯旋华府一楼商铺', '34.424079', '112.447449', '伊川县新城大道贵州茅台专卖店', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (5, 'B61010200101', '陕西省', '西安市', '市辖区', '西安市市辖区陕西省西安市曲江新区慈恩路777号大悦城购物中心L1-75号商铺', '34.216539', '108.962145', '西安市曲江新区慈恩路777号贵州茅台旗舰店', '西安冰之火食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (6, 'B61010200100', '陕西省', '西安市', '未央区', '西安市未央区陕西省西安市未央区草滩六路顺丰丰泰产业园区(草滩六路西门进入可到达）', '34.372576', '108.881799', '西安市草滩六路顺丰丰泰产业园区贵州茅台旗舰店总库', '西安冰之火食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (7, '2344528100001', '广东省', '揭阳市', '普宁市', '揭阳市普宁市普宁大道北侧玉华南路东侧自西向东第1栋东起第3间', '23.2798', '116.164588', '普宁市普宁大道茅台酱香万家共享主题终端', '普宁市吉华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (8, '146460028001', '海南省', '文昌市', '文昌市', '文昌市文昌市文城镇清澜开发区疏港路168号文府海景2号楼一层109-110', '19.53961', '110.802108', '文昌市疏港路贵州茅台专卖店', '琼海华颐贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (9, '211110112001', '北京市', '北京市', '朝阳区', '北京市朝阳区大屯里118号1号楼1层D座D101室', '40.006654', '116.413537', '北京市大屯北路贵州茅台专卖店', '北京锦城盛世文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (10, '143430800001', '湖南省', '张家界市', '永定区', '张家界市永定区西溪坪街道办事处永安西路民安家园一期12栋101-103号', '29.119666', '110.528869', '张家界市永安西路贵州茅台专卖店', '张家界远强糖酒食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (11, '2236012600001', '江西省', '南昌市', '东湖区', '南昌市东湖区三经路113号经纬府邸20号楼108商铺', '28.693395', '115.898536', '南昌市三经路贵州茅台酱香系列酒体验中心', '南昌市飞马实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (12, '110105002-005', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区清林路四号院（林奥购物中心）11号楼1层茅台文化体验馆', '40.03334', '116.409564', '北京市朝阳区清林路贵州茅台文化体验馆', '北京德华永胜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (13, '2133080010001', '浙江省', '衢州市', '柯城区', '衢州市柯城区新河沿28-30号', '28.96986', '118.877799', '衢州市新河沿路衢州市金叶商厦有限责任公司门店', '衢州市金叶商厦有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (14, '2237233100001', '山东省', '滨州市', '沾化区', '滨州市沾化区金海四路交通名苑1号楼113铺', '37.701021', '118.101674', '滨州市金海四路贵州茅台酱香系列酒体验中心', '滨州市沾化区精华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (15, '441600006', '广东省', '河源市', '市辖区', '河源市市辖区新市区红星路北面中山大道东边沁园邨二期1栋109', '23.75391', '114.706027', ' 河源市铭盛商贸有限公司中心库', '河源市铭盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (16, '224104110001', '河南省', '平顶山市', '湛河区', '平顶山市湛河区轻工路街道新华路与湛南路交叉口东南新华苑4#楼幢102铺号一层门面房屋', '33.726192', '113.320978', '平顶山市湛河区轻工路贵州茅台酱香系列酒体验中心', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (17, '133330126001', '浙江省', '杭州市', '建德市', '杭州市建德市新安江街道江滨中路189号', '29.468763', '119.290303', '建德市江滨中路贵州茅台专卖店', '建德市百晟酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (18, '2331011500003', '上海市', '上海市', '浦东新区', '上海市浦东新区新川路859号-861号', '31.196113', '121.696178', '上海市新川路茅台酱香万家共享主题终端', '上海巨信企业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (19, '2331011500002', '上海市', '上海市', '浦东新区', '上海市浦东新区川环南路818号-820号', '31.186688', '121.697305', '上海市川环南路茅台酱香万家共享主题终端', '上海巨信企业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (20, '121210424001', '辽宁省', '抚顺市', '新抚区', '抚顺市新抚区天朗大厦一层西区L1-W-31', '41.859733', '123.892816', '抚顺市西一路贵州茅台专卖店', '抚顺天朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (21, '152522733001', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市云鹤路101号新都汇国际购物广场', '26.25873', '107.511516', '都匀市云鹤路贵州茅台专卖店', '黔南州泽玉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (22, '223710020001', '山东省', '威海市', '环翠区', '威海市环翠区鲸园街道昆明路45-2号', '37.506887', '122.117006', '威海市环翠区昆明路贵州茅台酱香系列酒体验中心', '家家悦集团股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (23, '22331000006001', '浙江省', '台州市', '路桥区', '台州市路桥区路桥街道下里桥西路212-214号', '28.56823', '121.380491', '路桥区路桥街道茅台酱香万家共享主题终端', '温岭市华糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (24, '22410100087001', '河南省', '郑州市', '金水区', '郑州市金水区郑州市郑东新区经学街与崇实里交叉口西北角正商学府广场B座2-105', '34.794332', '113.80139', '郑东新区博学路茅台酱香万家共享主题终端', '河南茅酱酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (25, '522201002', '贵州省', '铜仁市', '市辖区', '铜仁市市辖区铜仁市东太大道福鑫苑门面', '27.737102', '109.189941', ' 贵州省铜仁金鑫酒业有限责任公司', '贵州省铜仁金鑫酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (26, '143430100010', '湖南省', '长沙市', '雨花区', '长沙市雨花区香樟路香樟兰亭6栋门面', '28.137831', '113.027802', '长沙市香樟路贵州茅台自营店', '湖南国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (27, '2344540000002', '广东省', '潮州市', '湘桥区', '潮州市湘桥区南较西路与彩虹东路交界处东南侧金域澜岸花园二期16号铺面', '23.640751', '116.629024', '潮州市南较西路茅台酱香万家共享主题终端', '潮州市腾远贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (28, '161610600001', '陕西省', '延安市', '宝塔区', '延安市宝塔区新区能源小区A区A18-107、108铺', '36.62158', '109.49998', '延安市长征南路贵州茅台专卖店', '延安市糖酒副食公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (29, '151510500002', '四川省', '泸州市', '江阳区', '泸州市江阳区云峰路二段264号、266号、268号', '28.890741', '105.380887', '泸州市云峰路贵州茅台专卖店', '泸州市奎杰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (30, '2236048300001', '江西省', '九江市', '庐山市', '九江市庐山市风景名胜区大林路116号', '29.566633', '115.974138', '九江市大林路贵州茅台酱香系列酒体验中心', '江西新酒商电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (31, '2611010509901', '北京市', '北京市', '丰台区', '北京市丰台区丰管路16号9号楼一层1031房间', '39.855072', '116.309848', '丰台区丰管路茅台酱香万家共享主题终端', '北京鼎仁盛林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (32, '137370185001', '山东省', '济南市', '天桥区', '济南市天桥区历黄路与水屯北路交叉口西行100米路北', '36.696917', '117.032095', '济南市水屯北路贵州茅台专卖店', '济南新星名酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (33, '34110105083003001', '贵州省', '贵阳市', '南明区', '贵阳市南明区贵州省贵阳市经济技术开发区毛寨村龙江巷1号 （贵州省生物研究所办公大楼）二楼1-2号', '26.504725', '106.711906', '贵州特色特产有限公司中心库', '贵州特色特产有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (34, '132321400001', '江苏省', '泰州市', '海陵区', '泰州市海陵区江洲南路明珠花园88-7', '32.466161', '119.903196', '泰州市江洲南路贵州茅台专卖店', '泰州天骄贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (35, '136360121003', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区平安东二街232号凯祥门小区20#商业楼106室-109室', '28.621094', '115.801624', '南昌市平安东二街贵州茅台专卖店', '江西省嘉珍实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (36, '241410383001', '河南省', '洛阳市', '老城区', '洛阳市老城区九都东路古城跟金业广场A140-142号门面房', '34.673111', '112.470647', '洛阳市九都东路贵州茅台专卖店', '洛阳王城糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (37, '136360121002', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区赣江北大道1516号方大中心2#109、110、111', '28.720532', '115.887185', '南昌市赣江北大道贵州茅台专卖店', '南昌酒韵酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (38, '137371581002', '山东省', '聊城市', '临清市', '聊城市临清市新华办事处新华乾城·润府商业二04、05铺', '36.839803', '115.725357', '临清市曙光路贵州茅台专卖店', '临清市明宇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (39, '2342068500002', '湖北省', '襄阳市', '襄州区', '襄阳市襄州区航空路与车城南路交叉口张湾英伦华府晋峰超市外门面房', '32.08443', '112.190275', '襄阳市张湾英伦华府茅台酱香万家共享主题终端', '老河口市浩元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (40, '34110105099004001', '广东省', '佛山市', '南海区', '佛山市南海区1', '23.028875', '113.143246', '佛山市锐茗行贸易有限公司中心库', '佛山市锐茗行贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (41, '22500222002001', '重庆市', '重庆市', '綦江区', '重庆市綦江区通惠街道通惠大道26号2幢附1-2', '29.211', '106.4044', '綦江区通惠街道茅台酱香万家共享主题终端', '重庆市綦江区腾达酒友商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (42, '143430100004', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区望岳街道杜鹃路819号耀凯花园17栋102、103号门面', '28.230014', '112.916274', '长沙市杜鹃路贵州茅台专卖店', '长沙市合美酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (43, '132320831001', '江苏省', '淮安市', '金湖县', '淮安市金湖县金湖西路101号', '33.01388', '119.006602', '金湖县金湖西路贵州茅台专卖店', '金湖县万丰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (44, '112120111002', '天津市', '天津市', '东丽区', '天津市东丽区福山路8号', '39.085841', '117.317796', '天津市福山路贵州茅台专卖店', '天津德飞皓龙商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (45, '2352010000004', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区大十字河西路国贸置业大厦1-7号', '26.578941', '106.710675', '贵阳市大十字河西路茅台酱香万家共享主题终端', '贵州茂毅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (46, '143430100001', '湖南省', '长沙市', '天心区', '长沙市天心区青园街道友谊路青园二期7号栋8、9、10号门面', '28.124994', '112.991874', '长沙市友谊路贵州茅台专卖店', '湖南省德泰酒业食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (47, '143430100002', '湖南省', '长沙市', '开福区', '长沙市开福区新河街道湘江北路1200号（北辰三角洲E5区1041门面）', '28.230984', '112.980343', '长沙市湘江北路贵州茅台专卖店', '湖南久香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (48, '225101070001', '四川省', '成都市', '武侯区', '成都市武侯区高新区二环路南三段18号附4号', '30.62128', '104.05365', '成都市高新区二环路贵州茅台酱香系列酒体验中心', '成都肆联商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (49, '137371500002', '山东省', '聊城市', '东昌府区', '聊城市东昌府区山东省聊城市东昌府区古楼街道湖南路摩天轮北楼一层101室', '36.429958', '115.970398', '聊城市湖南路贵州茅台专卖店', '聊城市东昌府区国润酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (50, '2352250100001', '贵州省', '安顺市', '镇宁布依族苗族自治县', '安顺市镇宁布依族苗族自治县环翠街道水岸鑫城3栋3-7单元吊2-22号', '26.060645', '105.755294', '镇宁县环翠街道茅台酱香万家共享主题终端', '贵州天禄十旬酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (51, '2353018700001', '云南省', '玉溪市', '红塔区', '玉溪市红塔区珊瑚路90号', '24.36459', '102.54528', '玉溪市珊瑚路茅台酱香万家共享主题终端', '云南鑫盛贸商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (52, '162622227001', '甘肃省', '张掖市', '甘州区', '张掖市甘州区人民公园西侧23/25号', '38.942131', '100.41474', '张掖市发展大道贵州茅台专卖店', '张掖市欣大烟草有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (53, '253530187001', '云南省', '昆明市', '官渡区', '昆明市官渡区阿拉街道办昌宏社区经开路3号时代创富中心A幢1层101室', '24.99427', '102.78007', '昆明市经开路贵州茅台专卖店', '昆明鸿酱酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (54, '152522230002', '贵州省', '铜仁市', '碧江区', '铜仁市碧江区环北南岳大道1号南岳清水湾CS3区商业区-负3-16号', '27.74803443583519', '109.20231664550779', '铜仁市南岳大道贵州茅台专卖店', '铜仁长利大同商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (55, '253530187005', '云南省', '昆明市', '官渡区', '昆明市官渡区关上办事处锦西路玫瑰湾一期7-8幢E004号', '24.98355', '102.724728', '昆明市锦西路贵州茅台43度经销店', '昆明佐橙商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (56, '132321400002', '江苏省', '泰州市', '高港区', '泰州市高港区金港南路224-228', '32.301956', '119.879185', '泰州市金港南路贵州茅台专卖店', '江苏唯真中外名烟名酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (57, '152522230003', '贵州省', '铜仁市', '松桃苗族自治县', '铜仁市松桃苗族自治县高新区大兴镇滨江大道铜仁凤凰机场', '27.881085', '109.313607', '铜仁市凤凰机场贵州茅台专卖店', '贵州民航产业集团有限公司酒业分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (58, '152522230001', '贵州省', '铜仁市', '碧江区', '铜仁市碧江区西外环大道188号', '27.727605', '109.178767', '铜仁市西外环大道贵州茅台专卖店', '铜仁市衡达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (59, '22420129002001', '湖北省', '武汉市', '汉阳区', '武汉市汉阳区百灵路七里晴川商业街103栋1-2层23室', '30.554989', '114.223182', '汉阳区百灵路茅台酱香万家共享主题终端', '武汉同兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (60, '141411426001', '河南省', '商丘市', '夏邑县', '商丘市夏邑县曹集乡孔祖大道与华夏大道交叉口东500米路北力达君越湾小区16号', '34.210675', '116.1411', '夏邑县孔祖大道贵州茅台专卖店', '商丘市纳鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (61, '145450422002', '广西壮族自治区', '梧州市', '藤县', '梧州市藤县藤县藤州镇锦绣豪庭二期B区商铺43-46号', '23.374072', '110.920255', '藤县体育西街贵州茅台专卖店', '藤县利海贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (62, '222206000001', '吉林省', '白山市', '浑江区', '白山市浑江区红旗街70号', '41.94296069', '126.42938515', '浑江区红旗街贵州茅台酱香系列酒体验中心', '吉林省白山方大商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (63, '2151018210001', '四川省', '成都市', '彭州市', '成都市彭州市天彭镇牡丹西路南段112号22栋1层', '30.985662', '103.956114', '彭州市牡丹西路四川鹏景商贸有限公司门店', '四川鹏景商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (64, '143430100011', '湖南省', '长沙市', '雨花区', '长沙市雨花区长沙市高铁南站东广场到达层美食街1F11H贵州茅台专卖店', '28.146256', '113.065357', '长沙市花侯路贵州茅台专卖店', '北京歌德盈香贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (65, '2352018200001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区融创九樾府B区9栋107号茅台酱香万家共享店', '26.631251', '106.648885', '贵阳市融创九樾府茅台酱香万家共享主题终端', '贵阳嘉元惠沣贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (66, '22440686003001', '广东省', '佛山市', '南海区', '佛山市南海区佛山市南海区大沥镇黄岐建设大道38号浪险猴国际首层G1005号', '23.141778', '113.203784', '南海区大沥镇黄岐建设大道茅台酱香万家共享主题终端', '佛山市玖之源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (67, 'B11010512101', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝阳北路101号楼1层(01)101内1F-29A', '39.924891', '116.517718', '北京市朝阳区朝阳北路101号楼贵州茅台旗舰店', '北京京承创美食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (68, '133332721001', '浙江省', '丽水市', '莲都区', '丽水市莲都区南明街道遂松路150号', '28.412596', '119.860518', '丽水市遂松路贵州茅台专卖店', '丽水市新名优商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (69, '121210219003', '辽宁省', '大连市', '瓦房店市', '大连市瓦房店市岗店办事处西长春路西段147-27号', '39.627214', '121.973587', '瓦房店市西长春路贵州茅台专卖店', '大连嘉轩酒类商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (70, '134340122001', '安徽省', '合肥市', '肥东县', '合肥市肥东县肥东经济开发区镇西路与包公大道交口瑞跃-智谷科技创新产业园15栋', '31.890173', '117.434594', '肥东县镇西路贵州茅台专卖店', '合肥联家商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (71, '22640100025002', '宁夏回族自治区', '银川市', '贺兰县', '银川市贺兰县银河西路258号', '38.557667', '106.335278', '贺兰县银河西路茅台酱香万家共享主题终端', '宁夏北和酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (72, '2341148200001', '河南省', '商丘市', '睢阳区', '商丘市睢阳区世纪路与开元路交叉口往东200米路南', '34.40924538641025', '115.66271603107454', '商丘市世纪路茅台酱香万家共享主题终端', '商丘裕之铭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (73, '132320282001', '江苏省', '无锡市', '宜兴市', '无锡市宜兴市丁蜀镇公园西路160号', '31.252092', '119.831365', '无锡市丁蜀镇公园西路贵州茅台专卖店', '宜兴市彩陶工贸公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (74, '23441200004005', '广东省', '肇庆市', '端州区', '肇庆市端州区广东省肇庆市端州区端州一路3号之一华润.观山悦园1栋101-105铺', '23.1038', '112.51733', '端州区端州一路贵州茅台酱香系列酒体验中心', '肇庆市荣和酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (75, 'B11010119901', '北京市', '北京市', '大兴区', '北京市大兴区北京市大兴区青云店镇劳保厂北侧5号', '39.697333', '116.507423', '百嘉康酒店团购', '北京百嘉康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (76, '2651070000601', '四川省', '绵阳市', '涪城区', '绵阳市涪城区临园路中段84号佳辉花园', '31.461849', '104.730582', '涪城区临园路茅台酱香万家共享主题终端', '绵阳铭仁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (77, '252522729001', '贵州省', '黔南布依族苗族自治州', '长顺县', '黔南布依族苗族自治州长顺县长顺县城南新区朝顺城市广场三期F区5号楼5.6.7号', '26.004003', '106.441349', '长顺县长兴北路贵州茅台专卖店', '长顺县顺和酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (78, '100522201002', '贵州省', '铜仁市', '碧江区', '铜仁市碧江区百花大道天都锦绣天地2期4栋1楼1-4号门面', '27.703669', '109.182569', '铜仁市百花大道贵州茅台专卖店', '贵州省铜仁金鑫酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (79, '2141042510001', '河南省', '平顶山市', '郏县', '平顶山市郏县龙山大道与广场西路交叉路帝荣豪府北门', '33.974028', '113.242145', '平顶山市简正商贸有限公司郏县帝荣豪府门店', '平顶山市简正商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (80, '23340100030031', '安徽省', '合肥市', '包河区', '合肥市包河区庐州大道1111号联投中心E栋102', '31.708204', '117.301836', '包河庐州大道贵州茅台酱香系列酒体验中心', '安徽吉创名品供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (81, '22110106027001', '北京市', '北京市', '大兴区', '北京市大兴区西红门镇宏旭路179号', '39.79', '116.33', '大兴区西红门宏旭路茅台酱香万家共享主题终端', '北京鑫源锦程商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (82, '23130100020001', '河北省', '石家庄市', '长安区', '石家庄市长安区和平东路189号名门华都二期商业（1）101号商铺', '38.057483', '114.521417', '长安区名门街贵州茅台酱香系列酒体验中心', '河北飞天进出口有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (83, '233330384002', '浙江省', '温州市', '鹿城区', '温州市鹿城区信河街欣翔大厦3栋103-6室', '28.016678', '120.65041', '温州市信河街贵州茅台专卖店', '温州酱香酒文化传播有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (84, '22360400008001', '江西省', '九江市', '濂溪区', '九江市濂溪区站前路远洲九悦廷G3栋108号', '29.697133', '116.01286', '濂溪区站前路茅台酱香万家共享主题终端', '江西如琴酒业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (85, '233330384001', '浙江省', '温州市', '鹿城区', '温州市鹿城区鹿城路267号', '28.011172', '120.642395', '温州市鹿城区鹿城路贵州茅台专卖店', '温州市欧品尚经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (86, '233330384004', '浙江省', '温州市', '鹿城区', '温州市鹿城区黎明西路东方大厦一层35、42、49、50号', '28.012039', '120.670101', '温州市黎明西路贵州茅台专卖店', '普富投资管理股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (87, '233330384003', '浙江省', '温州市', '龙湾区', '温州市龙湾区汤家桥路68号', '27.98831', '120.711681', '温州市汤家桥路贵州茅台专卖店', '浙江久都商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (88, '252522730001', '贵州省', '黔南布依族苗族自治州', '龙里县', '黔南布依族苗族自治州龙里县龙里县谷脚镇中铁大道酒博园8-1-4茅台专卖店', '26.493866', '106.85292', '龙里县中铁大道贵州茅台专卖店', '贵州大祥鸿宇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (89, '221101010001', '北京市', '北京市', '门头沟区', '北京市门头沟区远洋新天地二期2号楼106', '39.905809', '116.124911', '北京市门头沟区贵州茅台酱香系列酒体验中心', '北京醉纯京典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (90, '143430181001', '湖南省', '长沙市', '浏阳市', '长沙市浏阳市关口街道白沙东路创意凯旋城5栋101-103号', '28.157756', '113.650423', '浏阳市白沙东路贵州茅台专卖店', '长沙洛豪商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (91, '2141280110010', '河南省', '驻马店市', '驿城区', '驻马店市驿城区天中山大道与置地大道交叉口往东300米路南豫副酒源', '33.001613', '114.11477', '驻马店天中山大道市河南茅酱酒业销售有限公司驻马店分公司门店', '河南茅酱酒业销售有限公司驻马店分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (92, '162620124001', '甘肃省', '兰州市', '安宁区', '兰州市安宁区北滨河中路1272号（甘肃一建大厦办公楼一层）', '36.085733', '103.772292', '兰州市北滨河中路贵州茅台专卖店', '甘肃敬信商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (93, '2541282800501', '河南省', '南阳市', '卧龙区', '南阳市卧龙区光武街道车站路翰林华府南门C1-2号', '32.993676', '112.536092', '卧龙区光武街道茅台酱香万家共享主题终端', '南阳大成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (94, '225329340001', '云南省', '大理白族自治州', '大理市', '大理白族自治州大理市满江街道建标华城兰峰路24、25号', '25.6049379', '100.2770233', '大理市满江兰峰路贵州茅台酱香系列酒体验中心', '大理市泉源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (95, '231310107004', '上海市', '上海市', '徐汇区', '上海市徐汇区龙文路69号国际传媒港M栋2层', '31.15976', '121.463072', '上海市龙文路贵州茅台专卖店', '上海玉液贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (96, '22430100040002', '湖南省', '长沙市', '开福区', '长沙市开福区芙蓉中路一段88号天健芙蓉盛世花园5-8栋101号门面', '28.226086', '112.987058', '开福区芙蓉中路一段茅台酱香万家共享主题终端', '湖南省宏三泰商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (97, '231310107002', '上海市', '上海市', '闵行区', '上海市闵行区申长路1588弄25号101室', '31.210706', '121.312997', '上海市申长路贵州茅台专卖店', '上海茅五剑贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (98, '233330785001', '浙江省', '金华市', '婺城区', '金华市婺城区八一南街1933号', '29.054457', '119.658998', '金华市八一南街贵州茅台专卖店', '金华天下美酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (99, '2211010500003', '北京市', '北京市', '通州区', '北京市通州区亦庄科创十-街数字工厂8号', '39.790103', '116.564877', '北京市科创十一街贵州茅台酱香系列酒体验中心', '酒仙网络科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (100, '231310107003', '上海市', '上海市', '闵行区', '上海市闵行区浦星公路800号10号楼108-109室', '31.104815', '121.500141', '上海市江桦路贵州茅台专卖店', '上海紫熙坊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (101, '2333052200001', '浙江省', '湖州市', '吴兴区', '湖州市吴兴区海锦花园6幢底层青铜路327-331号商辅', '30.5253', '120.458', '湖州市青铜路茅台酱香万家共享主题终端', '长兴呈龙酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (102, '2211010500002', '北京市', '北京市', '朝阳区', '北京市朝阳区高碑店乡北花园村5号', '39.902312', '116.555426', '北京市高碑店乡贵州茅台酱香系列酒体验中心', '酒福汇电子商务（北京）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (103, '112120225001', '天津市', '天津市', '蓟州区', '天津市蓟州区渔阳镇无终园大街4号增1号、4号增2号、4号增3号', '40.035724', '117.430633', '天津市无终园大街贵州茅台专卖店', '天津圣宇森华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (104, '2231011700001', '上海市', '上海市', '嘉定区', '上海市嘉定区洪德路815弄上影广场', '31.352786', '121.250366', '上海市洪德路贵州茅台酱香系列酒体验中心', '购酒网（上海）供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (105, '22131085003001', '河北省', '廊坊市', '固安县', '廊坊市固安县106国道西侧英国宫二期底商260号门店', '39.443877', '116.309169', '固安县茅台酱香万家共享主题终端', '廊坊市德嘉晟世商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (106, '2237030000004', '山东省', '淄博市', '淄川区', '淄博市淄川区淄城路7号', '36.664427', '117.98383', '淄博市淄城路贵州茅台酱香系列酒体验中心', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (107, '144440300007', '广东省', '深圳市', '南山区', '深圳市南山区海运路1号蛇口邮轮中心一楼104号', '22.468615', '113.913411', '深圳市海运路贵州茅台专卖店', '招商圣约酒业（深圳）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (108, '114142201001', '山西省', '忻州市', '忻府区', '忻州市忻府区紫檀街与新建北路十字路口西南角', '38.460978', '112.739324', '忻州市紫檀街贵州茅台专卖店', '忻州华祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (109, '141410182002', '河南省', '郑州市', '荥阳市', '郑州市荥阳市棋源路海龙华城93号楼106-108', '34.78539', '113.420025', '荥阳市棋源路贵州茅台专卖店', '荥阳百富酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (110, '144440300008', '广东省', '深圳市', '龙岗区', '深圳市龙岗区龙城街道黄阁路与阁溪二路交汇处，京基御景时代大厦北区1栋156号商铺', '22.707265', '114.217849', '深圳市黄阁路贵州茅台专卖店', '深圳酒韵文化传播有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (111, '22522231001001', '贵州省', '铜仁市', '碧江区', '铜仁市碧江区西外环路1号名城世家1栋', '27.731133', '109.184732', '碧江区西外环路茅台酱香万家共享主题终端', '贵州荣盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (112, '2215340000001', '内蒙古自治区', '巴彦淖尔市', '临河区', '巴彦淖尔市临河区金川大道逸城广场102、103号门店', '40.750593', '107.386215', '巴彦淖尔市金川大道贵州茅台酱香系列酒体验中心', '巴彦淖尔市永强糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (113, '224312000001', '湖南省', '怀化市', '鹤城区', '怀化市鹤城区湖天大道南郡新干线7栋106号', '27.525458', '109.987086', '鹤城区湖天大道贵州茅台酱香系列酒体验中心', '经济开发区中扬酒业', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (114, '135350400001', '福建省', '三明市', '三元区', '三明市三元区三明市三元区东乾三路40号富力爱丁堡42号', '26.285524', '117.663726', '三明市东乾三路贵州茅台专卖店', '三明市华宇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (115, '252520384025', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区新浦新区碧桂园云著名邸2-103 2-104', '27.693201', '107.032263', '遵义市长征大道贵州茅台专卖店', '贵州省遵义市鑫融源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (116, '141410400002', '河南省', '平顶山市', '新华区', '平顶山市新华区平顶山市新华区园林路怡购城S1街60号', '33.742732', '113.278855', '平顶山市园林路贵州茅台专卖店', '平顶山市盛睿曦商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (117, '141411082001', '河南省', '许昌市', '长葛市', '许昌市长葛市泰山路唐宁湾小区南门西50米', '34.197705', '113.81937', '长葛市泰山路贵州茅台专卖店', '长葛市恒兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (118, '252520384020', '贵州省', '遵义市', '汇川区', '遵义市汇川区珠海路国泰米兰公寓二层2-1号', '27.716617', '106.930246', '贵州省遵义市汇川区珠海路贵州茅台专卖店', '遵义市鑫鑫源酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (119, '136360731002', '江西省', '赣州市', '于都县', '赣州市于都县贡江镇渡江大道水云豪苑A栋3号店', '25.951219', '115.40438', '贡江镇渡江大道贵州茅台专卖店', '于都沃熙康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (120, '23445403001002', '广东省', '揭阳市', '榕城区', '揭阳市榕城区榕江新城环岛路以东，南厝路以北汇金中心17-20铺', '23.561598', '116.399046', '榕城区汇金二路贵州茅台酱香系列酒体验中心', '揭阳市骏亿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (121, '144440300003', '广东省', '深圳市', '福田区', '深圳市福田区民田路171号新华保险大厦109，110室', '22.537908', '114.052517', '深圳市民田路贵州茅台专卖店', '深圳市九成贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (122, '43320300012', '江苏省', '徐州市', '沛县', '徐州市沛县汉邦路御澜湾二期4号楼101室', '34.739868', '116.928023', '沛县汉邦路贵州茅台43度经销店', '沛县糖烟酒采购供应有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (123, '133331083001', '浙江省', '台州市', '玉环市', '台州市玉环市广陵南路鑫鼎时代家园1幢101-103号铺', '28.11068', '121.242178', '玉环市港南大道贵州茅台专卖店', '玉环中昕名酒行有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (124, '2251012200001', '四川省', '成都市', '高新区', '成都市高新区天府一街552号', '30.560627', '104.054636', '成都市天府一街贵州茅台酱香系列酒体验中心', '四川企联贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (125, '141411300003', '河南省', '南阳市', '宛城区', '南阳市宛城区独山大道与建设路交叉口东南侧500米455号', '33.001299', '112.567088', '南阳市独山大道贵州茅台专卖店（455号）', '南阳市超然物外商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (126, '34410100087021001', '河南省', '安阳市', '文峰区', '安阳市文峰区1', '36.090593', '114.356967', '安阳卓为商贸有限公司中心库', '安阳卓为商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (127, '141411300002', '河南省', '南阳市', '卧龙区', '南阳市卧龙区卧龙路宇信华府楼下', '32.978945', '112.514376', '南阳市卧龙路贵州茅台专卖店', '南阳智合商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (128, '151510921001', '四川省', '成都市', '温江区', '成都市温江区柳城街道政通东路1347.1349.1351号', '30.678782', '103.855107', '成都市政通东路贵州茅台专卖店', '成都欣然商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (129, '2341030000010', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区广利街与政和路交叉口政和东郡3栋108号', '34.622601', '112.466782', '洛阳市广利街茅台酱香万家共享主题终端', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (130, '2361010000004', '陕西省', '西安市', '未央区', '西安市未央区经济技术开发区杨家村金源御景华府4号楼20110号、20111号', '34.350799', '108.938849', '西安市金源御景华府茅台酱香万家共享主题终端', '西安成城裕朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (131, '235350200002', '福建省', '厦门市', '翔安区', '厦门市翔安区厦门市翔安区金海街道鸿翔西路1888号2#大楼二层202、203 ', '24.57761', '118.241004', '福建厦门厦门市翔安区金海街道鸿翔西路贵州茅台43度经销（茅台酒）', '厦门象屿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (132, '2361242900001', '陕西省', '安康市', '市辖区', '安康市市辖区高新技术产业开发区金力源名苑9号楼', '32.704661', '108.990077', '安康市金力源名苑茅台酱香万家共享主题终端', '旬阳市鸿信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (133, '235350200001', '福建省', '厦门市', '湖里区', '厦门市湖里区华盛路7-8,7-9', '24.508355', '118.099818', '厦门市华盛路贵州茅台专卖店', '厦门鑫盛煜海昌礼品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (134, '122220681001', '吉林省', '白山市', '临江市', '白山市临江市新市街东嘉花园19-23号楼-0011-0010', '41.806611', '126.910305', '临江市新村路贵州茅台专卖店', '吉林省白山方大商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (135, '34410100087016001', '河南省', '南阳市', '宛城区', '南阳市宛城区1', '33.003564', '112.539506', '南阳市金宸瑞商贸有限公司中心库', '南阳市金宸瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (136, '22110300007001', '北京市', '北京市', '丰台区', '北京市丰台区海户西里32号院东北门南侧', '39.85069', '116.39059', '丰台区马家堡茅台酱香万家共享主题终端', '北京九润源电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (137, '23652801001001', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '巴音郭楞蒙古自治州库尔勒市喀拉苏路蘭台府7-1-03号', '41.734871', '86.153675', '库尔勒市喀拉苏路贵州茅台酱香系列酒体验中心', '巴州鼎盛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (138, '140100003003', '山西省', '太原市', '晋源区', '太原市晋源区康兴路7号6幢1-2层商铺1001号', '37.801347', '112.519068', '太原市康兴路贵州茅台文化体验馆', '太原瑞广兴科贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (139, '252520384014', '贵州省', '遵义市', '汇川区', '遵义市汇川区人民路中海九樾1栋18号，19号商铺', '27.725283', '106.927227', '遵义市人民路贵州茅台专卖店', '遵义凯祥顺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (140, '22440100081001', '广东省', '广州市', '天河区', '广州市天河区广州市天河区科韵北路1号101房', '23.142032', '113.377333', '天河区博汇街茅台酱香万家共享主题终端', '广州市杯杯香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (141, '252520384015', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区新蒲新区播州大道林达阳光新城S7-1-21', '27.702237', '107.030868', '遵义市播州大道贵州茅台专卖店', '遵义市亚美特贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (142, '100370481001', '山东省', '枣庄市', '滕州市', '枣庄市滕州市善国中路33号', '35.093242', '117.164561', '滕州市善国中路贵州茅台专卖店', '滕州市盛誉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (143, '620500006003', '甘肃省', '天水市', '秦州区', '天水市秦州区成纪大道西路建投天水中心北.茅台专卖店', '34.575445', '105.695593', '甘肃省天水市秦州区成纪大道贵州茅台专卖店', '天水润圆兴达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (144, '2341030000009', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区开元大道宝龙城市广场1-15-104号', '34.616548', '112.462746', '洛阳市开元大道茅台酱香万家共享主题终端', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (145, '2144060010002', '广东省', '佛山市', '南海区', '佛山市南海区大沥镇联滘路中信名苑9号铺主题终端', '23.118333', '113.131852', '佛山市城南二路佛山市南海启腾贸易有限公司门店', '佛山市南海启腾贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (146, '2152038110001', '贵州省', '遵义市', '赤水市', '遵义市赤水市市中街道河滨中路福康大厦D栋1-5号门市', '28.593817', '105.6986417', '赤水市河滨中路赤水市溪木商贸有限公司门店', '赤水市溪木商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (147, '34110105099016001', '广东省', '汕头市', '金平区', '汕头市金平区1', '23.365716', '116.70341', '汕头市酌玖阁贸易有限公司中心库', '汕头市酌玖阁贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (148, '2341030000006', '河南省', '洛阳市', '嵩县', '洛阳市嵩县水景园7号楼1单元101', '34.112826', '112.085014', '嵩县水景园茅台酱香万家共享主题终端', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (149, '135350825001', '福建省', '龙岩市', '连城县', '龙岩市连城县东环南路2-1号  2-2号', '25.709805', '116.766421', '连城县东环南路贵州茅台专卖店', '连城县鑫百利贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (150, '2341030000008', '河南省', '洛阳市', '伊川县', '洛阳市伊川县城关镇人民大街东段县直中学对面', '34.417233', '112.440371', '伊川县人民大街茅台酱香万家共享主题终端', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (151, '2341030000007', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区中州东路249号', '34.684637', '112.487437', '洛阳市中州东路茅台酱香万家共享主题终端', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (152, '2341030000002', '河南省', '洛阳市', '栾川县', '洛阳市栾川县滨河大道清华天悦1号商铺', '33.783364', '111.642807', '栾川县滨河大道茅台酱香万家共享主题终端', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (153, '2250010100001', '重庆市', '重庆市', '万州区', '重庆市万州区江南新区长江之星玉熙路43号门面', '30.798177', '108.403846', '重庆市玉熙路贵州茅台酱香系列酒体验中心', '重庆荣之和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (154, '2341270100002', '河南省', '周口市', '川汇区', '周口市川汇区庆丰街与府苑路交叉口建业森林半岛81-108', '33.622467', '114.694387', '周口市庆丰街茅台酱香万家共享主题终端', '河南景隆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (155, '2341030000003', '河南省', '洛阳市', '老城区', '洛阳市老城区河南省洛阳市老城区德和园1栋-109号商铺', '34.696972', '112.444937', '酒兮状元红路店茅台酱香万家共享主题终端', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (156, '2341270100004', '河南省', '郑州市', '金水区', '郑州市金水区农业路51号楷林上午中心南区1层106', '34.761815', '113.756784', '郑州市农业路茅台酱香万家共享主题终端', '郑州强东商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (157, '2141052210001', '河南省', '安阳市', '文峰区', '安阳市文峰区东工路27号', '36.10461', '114.37125', '安阳市东工路安阳市众鑫伟业商贸有限公司门店', '安阳市众鑫伟业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (158, '2341270100005', '河南省', '周口市', '川汇区', '周口市川汇区大闸路与七-路交叉西30米路南', '33.615697', '114.632195', '周口市大闸路茅台酱香万家共享主题终端', '周口市时金供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (159, '2341270100006', '河南省', '周口市', '川汇区', '周口市川汇区八-南路开元新城西门106号铺（茅台酱香万家共享）', '33.585601', '114.657163', '周口市八一南路茅台酱香万家共享主题终端', '河南赢翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (160, '22320300013001', '江苏省', '徐州市', '邳州市', '徐州市邳州市闽江路流金花苑104号门面', '34.328727', '117.969745', '邳州市闽江路茅台酱香万家共享主题终端', '邳州金橙网络科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (161, '2121110010001', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区兴隆台街69号', '41.131171', '122.084746', '盘锦市兴隆台街辽宁广利祺商贸有限公司门店', '辽宁广利祺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (162, '2214018600002', '山西省', '太原市', '万柏林区', '太原市万柏林区新晋祠路45号学府壹号院小区2号楼1003号商铺', '37.822411', '112.528137', '太原市新晋祠路贵州茅台酱香系列酒体验中心', '山西金百顺贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (163, '142420693001', '湖北省', '襄阳市', '樊城区', '襄阳市樊城区长虹路56号海润名都B2-1、B2-3', '32.051517', '112.13595', '襄阳市长虹路贵州茅台专卖店', '襄阳世之醉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (164, '2336078100001', '江西省', '赣州市', '瑞金市', '赣州市瑞金市象湖镇凯鸿和园1号楼117商铺', '25.889916', '116.039676', '瑞金市象湖镇茅台酱香万家共享主题终端', '瑞金市坤鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (165, '22440600018001', '广东省', '佛山市', '顺德区', '佛山市顺德区保利东嘉花园130铺-131铺', '22.9645', '113.138', '顺德区保利东嘉花园茅台酱香万家共享主题终端', '佛山市涛顺酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (166, '241410900004', '河南省', '濮阳市', '华龙区', '濮阳市华龙区濮上路与政和路交叉口路西', '35.777276', '115.01045', '濮阳市濮上中路贵州茅台专卖店', '濮阳市贵酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (167, '340600001', '安徽省', '淮北市', '市辖区', '淮北市市辖区人民路239-44号', '31.715241', '117.169204', '淮北市绿谷酒业有限责任公司中心库', '淮北市绿谷酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (168, '241410900003', '河南省', '濮阳市', '华龙区', '濮阳市华龙区五一中路龙之光国际中心5号楼0102-0103号商铺', '35.787053', '115.025766', '濮阳市五一路贵州茅台专卖店', '濮阳永辉跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (169, '340600002', '安徽省', '淮北市', '市辖区', '淮北市市辖区淮北市相山区华佳梅苑115号', '33.946464', '116.80416', '淮北璟山商贸有限公司中心库', '淮北璟山商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (170, '241410900002', '河南省', '濮阳市', '华龙区', '濮阳市华龙区金堤路与绿城路交叉口西北角2-5号', '35.79205', '115.038909', '濮阳市绿城路贵州茅台专卖店', '濮阳市顺祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (171, '162620100001', '甘肃省', '兰州市', '城关区', '兰州市城关区麦积山路环球中心1-184号商铺', '36.04517', '103.84355', '兰州市麦积山路贵州茅台专卖店', '甘肃丰盈商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (172, '241410900001', '河南省', '濮阳市', '华龙区', '濮阳市华龙区中原东路与马颊河北路交叉口向东500米中原东路66号', '35.77992', '115.05749', '濮阳市中原路贵州茅台专卖店', '濮阳市金欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (173, '121211300001', '辽宁省', '朝阳市', '双塔区', '朝阳市双塔区龙腾大街288号', '41.60381', '120.495568', '朝阳市龙腾大街贵州茅台专卖店', '朝阳市宏程商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (174, '34410100087004001', '河南省', '商丘市', '民权县', '商丘市民权县1', '34.648384', '115.175019', '惠友酒业（河南）有限公司中心库', '惠友酒业（河南）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (175, '370487001002', '山东省', '枣庄市', '薛城区', '枣庄市薛城区山东省枣庄市薛城区新城街道嘉豪国际时代广场B栋102号门市', '34.804848', '117.310248', '枣庄市新城街道贵州茅台专卖店', '滕州市醴泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (176, '162620100006', '甘肃省', '兰州市', '城关区', '兰州市城关区庆阳路392号1层006号', '36.054817', '103.824506', '兰州市庆阳路贵州茅台专卖店', '甘肃德盛和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (177, '2135220210004', '福建省', '南平市', '延平区', '南平市延平区江滨中路199号', '26.631688', '118.177761', '南平市杨真路南平市昇隆汇贸易有限公司门店', '南平市昇隆汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (178, '2134128510001', '安徽省', '阜阳市', '太和县', '阜阳市太和县太和县镜湖中路建行东侧第5间门面', '33.156155', '115.627326', '太和县镜湖中路阜阳鼎华贸易有限公司门店', '阜阳鼎华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (179, '162620100009', '甘肃省', '兰州市', '安宁区', '兰州市安宁区众邦大道安宁碧桂园商铺025幢111-113号', '36.115931', '103.682351', '兰州市众邦大道贵州茅台专卖店', '兰州再回首商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (180, '2135220210003', '福建省', '泉州市', '晋江市', '泉州市晋江市陈埭镇花厅口村阳光路1168-10号', '24.81406', '118.59745', '晋江市西江路晋江市鑫家润食品有限公司门店', '晋江市鑫家润食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (181, '150132001001', '内蒙古自治区', '呼和浩特市', '赛罕区', '呼和浩特市赛罕区如意和大街西蒙奈伦广场一期2号楼1层102', '40.834451', '111.777525', '呼和浩特市如意和大街专卖店', '内蒙古瑞达伟业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (182, '162620100002', '陕西省', '汉中市', '汉台区', '汉中市汉台区益州路益宁铭居2号楼104号商铺', '33.060106', '107.056518', '汉中市益州路贵州茅台专卖店', '汉中德利源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (183, '162620100003', '甘肃省', '定西市', '安定区', '定西市安定区中华路70号烟草公司', '35.58323', '104.625805', '定西市中华路贵州茅台专卖店', '定西市欣大经销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (184, '132320323001', '江苏省', '徐州市', '云龙区', '徐州市云龙区昆仑大道8号永嘉新城中心广场B座1-101', '34.20897', '117.278634', '徐州市昆仑大道贵州茅台专卖店', '徐州陈贝酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (185, '162620100005', '甘肃省', '兰州市', '城关区', '兰州市城关区民主东路226号1-135号商铺', '36.043325', '103.84362', '甘肃丰盈商贸有限责任公司兰州市民主东路专卖店', '甘肃丰盈商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (186, '135350583003', '福建省', '泉州市', '晋江市', '泉州市晋江市罗山街道兰峰城市花园A商铺一层D-1-19', '24.778886', '118.570025', '晋江市福兴路罗山段贵州茅台专卖店', '福建凯谊投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (187, '2146000510001', '海南省', '文昌市', '文昌市', '文昌市文昌市文城镇文昌大道363号（亿嘉国际大酒店126号商铺）正好酒业', '0.0', '0.0', '文昌市文城镇云逸路文昌文城9988综合商行店', '文昌正好酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (188, '120106004004', '天津市', '天津市', '南开区', '天津市南开区万兴街怀安环路景域名邸1号', '39.138203', '117.150738', '天津市怀安环路贵州茅台专卖店', '天津品高商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (189, '251510188010', '四川省', '成都市', '武侯区', '成都市武侯区天府一街1375号、1377号、1379号1层', '30.561966', '104.036569', '成都市天府一街贵州茅台43度经销店', '四川盛世兴成酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (190, '133330421001', '浙江省', '嘉兴市', '嘉善县', '嘉兴市嘉善县罗星街道嘉善大道704、706号', '30.816698', '120.925116', '嘉善县嘉善大道贵州茅台专卖店', '嘉善醉忆酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (191, '235350183001', '福建省', '福州市', '鼓楼区', '福州市鼓楼区五四路243号', '26.101727', '119.306663', '福州市五四路贵州茅台专卖店', '福建省糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (192, '2142013010001', '湖北省', '武汉市', '武昌区', '武汉市武昌区武汉中央文化区K4地块二期二区A地块K4-4-2幢/单元1层商4号房', '30.560818', '114.342216', '武汉市中央文化区武汉市武昌区茅乡缘烟酒商行门店', '武汉市武昌区茅乡缘烟酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (193, '410194005031', '山东省', '济南市', '槐荫区', '济南市槐荫区山东省济南市槐荫区恒大翡翠华庭1期东门商铺1737号B2-7', '36.674005', '116.930969', '山东元睿供应链有限公司中心库', '山东元睿供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (194, '410194005030', '河南省', '郑州市', '市辖区', '郑州市市辖区河南自贸试验区郑州片区（经开）第四大街与经北二路交叉口蓬勃大厦701号', '34.758582', '113.776853', '郑州元睿酒业有限公司中心库', '郑州元睿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (195, '136360681001', '江西省', '鹰潭市', '月湖区', '鹰潭市月湖区梅园街道沿江大道7号75.76号', '28.25381', '117.056252', '鹰潭市沿江大道贵州茅台专卖店', '鹰潭市洪华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (196, '141410189001', '河南省', '郑州市', '金水区', '郑州市金水区玉凤路与沈庄路交叉口向南150米路西', '34.754125', '113.710656', '郑州市玉凤路贵州茅台专卖店', '郑州新九商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (197, '33070000301', '浙江省', '金华市', '婺城区', '金华市婺城区婺城区万佛塔沿街商铺A区', '29.102618', '119.667683', '金华市将军路贵州茅台文化体验馆', '金华天下美酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (198, '141410189002', '河南省', '郑州市', '中牟县', '郑州市中牟县航海东路2089号（华腾国际广场1楼）', '34.717394', '113.884048', '郑州市航海东路贵州茅台专卖店（华腾国际广场）', '河南华磊糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (199, '141410189003', '河南省', '郑州市', '金水区', '郑州市金水区鑫苑路26号阳光新城25号楼一层附99号', '34.794511', '113.705338', '郑州市鑫苑路贵州茅台专卖店', '郑州豫之霖商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (200, '22610600006001', '陕西省', '延安市', '宝塔区', '延安市宝塔区百米大道翟则沟二期10号楼5号门面', '36.62', '109.53', '宝塔区百米大道茅台酱香万家共享主题终端', '陕西天行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (201, '23530100066067', '云南省', '昆明市', '西山区', '昆明市西山区云南省昆明市西山区金广路亚龙小区7-14号商铺', '25.005636', '102.69253', '西山区金广路贵州茅台酱香系列酒体验中心', '昆明水淼商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (202, '110101170', '北京市', '北京市', '东城区', '北京市东城区经销商中心库', '39.928359', '116.416334', '', '北京京糖酒类经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (203, '2344068600001', '广东省', '佛山市', '南海区', '佛山市南海区桂城街道夏东孔溪股份经济社五灯围工业开发区4号楼-楼', '23.039285', '113.187019', '佛山市桂城街道茅台酱香万家共享主题终端', '佛山市景源泰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (204, '162620100011', '甘肃省', '兰州市', '城关区', '兰州市城关区高新雁园路660号1层商107室', '36.07174', '103.889445', '兰州市高新雁园路贵州茅台专卖店', '兰州国久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (205, '162620100012', '甘肃省', '兰州市', '城关区', '兰州市城关区雁宁路395号森地国际一楼', '36.062687', '103.851005', '兰州市雁宁路贵州茅台自营店', '甘肃国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (206, 'B65010400101', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '乌鲁木齐市新市区新疆乌鲁木齐市新市区北京中路汇嘉时代广场1楼', '43.876183', '87.556779', '乌鲁木齐市市新市区北京中路贵州茅台旗舰店', '新疆疆小凌供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (207, '22220186002001', '吉林省', '长春市', '二道区', '长春市二道区净月开发区天富路与新城大街交叉口正西方向129米', '43.8', '125.4', '净月高新技术产业开发区天富路茅台酱香万家共享主题终端', '长春市金生水商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (208, '371583001003', '山东省', '聊城市', '东昌府区', '聊城市东昌府区燕山路与东昌路交汇处东北角星光国际金融中心6幢0009号商铺', '36.458453', '116.050734', '聊城市东昌路贵州茅台专卖店', '聊城市佳科达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (209, '113130282001', '北京市', '北京市', '丰台区', '北京市丰台区丰台区大成南里二区3号楼1层0105', '39.88853', '116.26417', '北京市青塔街道贵州茅台专卖店', '北京金瑞国星商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (210, '22340200001001', '安徽省', '芜湖市', '镜湖区', '芜湖市镜湖区芜湖市镜湖区东方蓝海35幢106号', '31.361274', '118.383726', '东方蓝海茅台酱香万家共享主题终端', '芜湖市凯邦贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (211, '134341283001', '安徽省', '阜阳市', '颍州区', '阜阳市颍州区文峰街道清河东路66号', '32.885902', '115.831266', '阜阳市清河东路贵州茅台专卖店', '阜阳市谐和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (212, '321326002089', '广东省', '湛江市', '赤坎区', '湛江市赤坎区广东省湛江市赤坎区海田路5号华盛新城二期7、8幢一层02号铺  ', '21.281027', '110.376124', '湛江市赤坎区醇诚食品经营部中心库', '湛江市赤坎区醇诚食品经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (213, '520183005028', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区贵州省贵阳市云岩区渔安街道渔安安井片区渔安安井回迁安置居住区渔安新城B1-5栋负4层3号', '26.58447', '106.744017', '贵州省贵阳市云岩区渔安新城尚雅路贵州茅台专卖店', '贵州佳家琦商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (214, '321326002088', '海南省', '海口市', '美兰区', '海口市美兰区海南省海口市美兰区西沙路7号', '20.023481', '110.339661', '海南明兴隆商贸有限公司中心库', '海南明兴隆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (215, '2215010000001', '内蒙古自治区', '呼和浩特市', '新城区', '呼和浩特市新城区腾飞北路兴泰东河湾南区东门', '40.84992', '111.745731', '呼和浩特市腾飞北路贵州茅台酱香系列酒体验中心', '呼和浩特市经业商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (216, '321326002087', '四川省', '成都市', '高新区', '成都市高新区四川省成都市高新区益州大道中段599号13栋附7号', '30.556327', '104.057324', '四川华玖汇贸易有限公司中心库', '四川华玖汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (217, '321326002086', '重庆市', '重庆市', '南岸区', '重庆市南岸区重庆市南岸区江南大道2号1栋2单元1层1号商铺', '29.535306', '106.560958', '重庆珍久阁商贸有限公司中心库', '重庆珍久阁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (218, '340400004', '安徽省', '淮南市', '田家庵区', '淮南市田家庵区田家庵区洞山街道优山美地A栋101', '32.62705', '117.020704', '淮南市醉佳酒类贸易有限公司中心库', '淮南市醉佳酒类贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (219, '321326002085', '四川省', '成都市', '锦江区', '成都市锦江区四川省成都市锦江区梓潼桥西街2号1栋2单元22层2210号', '30.66021', '104.081047', '四川蓉国壹城实业有限公司中心库', '四川蓉国壹城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (220, '2137232510001', '山东省', '滨州市', '沾化区', '滨州市沾化区金海四路41号', '37.700909', '118.105059', '滨州市金海四路沾化区梦之蓝酒水商行门店', '滨州市沾化区梦之蓝酒水商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (221, '2143050010001', '湖南省', '邵阳市', '大祥区', '邵阳市大祥区红星社区31栋', '27.220457', '111.466029', '邵阳市红星社区湖南海诚达酒业有限公司门店', '湖南海诚达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (222, '430100008005', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区杜鹃路 819 号耀凯花园 17 栋 102-103 房 ', '28.235179', '112.931345', '湖南长沙望岳街道杜鹃路贵州茅台专卖店', '长沙市合美酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (223, '321326002092', '云南省', '玉溪市', '红塔区', '玉溪市红塔区聂耳路62号中玉酒店1层1-2商铺', '24.347934', '102.551386', '云南吉晟昌商贸有限公司中心库', '云南吉晟昌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (224, '321326002091', '湖南省', '长沙市', '雨花区', '长沙市雨花区劳动东路139号新城新世界小区C5栋2602房', '28.157467', '113.023326', '湖南盛丰翔贸易有限公司中心库', '湖南盛丰翔贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (225, 'B51010100201', '四川省', '成都市', '成华区', '成都市成华区四川省成都市成华区双庆路8号1栋1层1号L132号', '30.650315', '104.116916', '四川省双庆路贵州茅台旗舰店', '成都醉小凌供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (226, '321326002090', '广西壮族自治区', '南宁市', '西乡塘区', '南宁市西乡塘区永和桥北雅里中坡19号永和物流园二楼整层商铺', '22.805479', '108.296522', '南宁市鑫金鼎商贸有限责任公司中心库', '南宁市鑫金鼎商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (227, '230100035002', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区黄河路178号', '45.754696', '126.690516', '哈尔滨市黄河路贵州茅台文化体验馆', '哈尔滨鸿俊祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (228, '137370325001', '山东省', '淄博市', '张店区', '淄博市张店区和平街道办事处柳泉路17甲1', '36.796381', '118.046777', '淄博市柳泉路贵州茅台专卖店', '淄博顺星商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (229, '2333010000002', '浙江省', '杭州市', '上城区', '杭州市上城区明桂北苑2幢底商3号', '30.296011', '120.201918', '杭州市明桂北苑茅台酱香万家共享主题终端', '杭州静怡商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (230, '134341100002', '安徽省', '滁州市', '南谯区', '滁州市南谯区东坡西路777号凯迪塞纳河畔A段商业幢A101室', '32.252959', '118.321129', '滁州市东坡西路贵州茅台专卖店', '滁州市一酉商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (231, '2134082810001', '安徽省', '安庆市', '迎江区', '安庆市迎江区滨江至尊4号楼临街138-13一楼及138-14东侧一楼门面', '30.504414', '117.064052', '岳西县天堂镇岳西县华正食品有限责任公司门店', '岳西县华正食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (232, '141412822001', '河南省', '驻马店市', '泌阳县', '驻马店市泌阳县北环路御景湾-西1-西2商铺', '32.738175', '113.334995', '泌阳县北环路贵州茅台专卖店', '泌阳县金成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (233, '141411086001', '河南省', '许昌市', '建安区', '许昌市建安区魏文路与永兴东路交叉口碧桂园芙蓉台18幢南起1单元1层101号', '34.084592', '113.854011', '许昌市永兴东路贵州茅台专卖店', '河南凯麒名酒连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (234, '2122040010001', '吉林省', '辽源市', '龙山区', '辽源市龙山区人民大街2738号', '42.89887', '125.145577', '辽源市人民大街辽源市一鸣商贸有限公司门店', '辽源市一鸣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (235, '2152260110001', '贵州省', '黔东南苗族侗族自治州', '凯里市', '黔东南苗族侗族自治州凯里市金山大道裕豪国际写字楼第-层第三号门面', '26.564944', '107.989087', '凯里市金山大道凯里市锦隆源商贸有限公司门店', '凯里市锦隆源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (236, '144440304001', '广东省', '深圳市', '宝安区', '深圳市宝安区新安街道银鸿大楼115', '22.55355', '113.901738', '深圳市新安一路贵州茅台专卖店', '深圳市俊鑫源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (237, '2237110000001', '山东省', '日照市', '东港区', '日照市东港区安海路与营阳街交汇处西北角', '35.410959631562655', '119.52008117929459', '日照市营阳街贵州茅台酱香系列酒体验中心', '日照市颐国商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (238, '122220726001', '吉林省', '松原市', '宁江区', '松原市宁江区乌兰大街2975号', '45.133261', '124.837113', '松原市乌兰大街贵州茅台专卖店', '吉林省酒事酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (239, '2237028700001', '山东省', '青岛市', '崂山区', '青岛市崂山区香港东路72号（崂山区海游路1号）', '36.070655', '120.433821', '青岛市香港东路贵州茅台酱香系列酒体验中心', '青岛新星物流有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (240, '2337028300001', '山东省', '青岛市', '平度市', '青岛市平度市豪德商贸城9栋8号9号', '36.759775', '119.918491', '平度市豪德商贸城茅台酱香万家共享主题终端', '青岛湘华酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (241, '134341181001', '安徽省', '滁州市', '天长市', '滁州市天长市平安中路98号', '32.680914', '119.019017', '天长市平安中路贵州茅台专卖店', '天长市天地源工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (242, '2337028300002', '山东省', '青岛市', '平度市', '青岛市平度市凤台街道办事处杭州南路188号-85号', '36.760052', '119.967929', '平度市凤台街道茅台酱香万家共享主题终端', '青岛湘华酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (243, '22120102009010', '天津市', '天津市', '河西区', '天津市河西区天津市河西区黑牛城道纯真里底商1-7号', '39.078945', '117.219502', '天津市聚源众鑫酒类销售有限公司茅台酱香万家共享主题终端', '天津市锦绣昌隆酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (244, '321326002084', '广东省', '佛山市', '顺德区', '佛山市顺德区广东省佛山市顺德区容桂街道红星社区桂新东路1号龙光水悦熙园15座134号铺（住所申报）', '22.751936', '113.268201', '佛山市恺意行商贸有限公司中心库', '佛山市恺意行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (245, '22520183037003', '贵州省', '贵阳市', '白云区', '贵阳市白云区泉湖街道岭秀阳光1栋1层12号门面', '26.679979', '106.622409', '白云区泉湖街道茅台酱香万家共享主题终端', '贵州盛世九酝贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (246, '321326002083', '浙江省', '台州市', '路桥区', '台州市路桥区浙江省台州市路桥区新路村高登宝路113号', '28.567411', '121.390192', '台州市旺龙贸易有限公司中心库', '台州市旺龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (247, '212120103003', '河南省', '信阳市', '商城县', '信阳市商城县黄柏山路锦尚名城108号', '31.808954', '115.396878', '商城县黄柏山路贵州茅台专卖店', '商城县中汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (248, '321326002082', '河南省', '郑州市', '中牟县', '郑州市中牟县河南省郑州市中牟县广惠街街道办事处商都大道与永福街交叉口南100米路东绿云小区底层2号商铺', '34.720535', '113.975798', '郑州十里酱香贸易有限公司中心库', '郑州十里酱香贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (249, '2343068300001', '湖南省', '岳阳市', '岳阳楼区', '岳阳市岳阳楼区青年中路9号金鹗御府1栋104门面', '29.365566', '113.107955', '岳阳市青年中路茅台酱香万家共享主题终端', '岳阳中红商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (250, '110101196', '北京市', '北京市', '东城区', '北京市东城区北京市东城区安定门外大街138号4层A座406-009', '0.0', '0.0', '北京朗知网络传媒科技股份有限公司中心库', '北京朗知网络传媒科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (251, '153530126001', '云南省', '昆明市', '市辖区', '昆明市市辖区穿金路753号解甲园小区临街8号商铺', '25.082778', '102.757648', '昆明市昆明市盘龙区穿金路753号贵州茅台专卖店', '昆明真金商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (252, '2351018600001', '四川省', '成都市', '锦江区', '成都市锦江区通源街612号', '30.639752', '104.108419', '成都市通源街茅台酱香万家共享主题终端', '成都正天佰玖贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (253, '419001001', '河南省', '济源市', '济源市', '济源市济源市沁园办事处赵礼庄滨河南路漭南街北一排6号', '35.086028', '112.590459', '济源市茅源商贸有限公司中心库', '济源市茅源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (254, '2537060001101', '山东省', '烟台市', '芝罘区', '烟台市芝罘区山东省烟台市芝罘区环山路97-4号', '37.528322', '121.395428', '烟台芝罘区环山路茅台酱香万家共享主题终端', '烟台全晟酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (255, '244440301002', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区 贵州省遵义市新蒲新区乌江大道与平安大道交叉口西南侧美的云熙府建设项目 $8#1-8号、1-9号', '27.705621', '107.043681', '遵义市红花岗区平安大道贵州茅台专卖店', '遵义酒业集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (256, '22520183037002', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区清溪路', '26.416678', '106.67718', '花溪区清溪路茅台酱香万家共享主题终端', '贵州盛世九酝贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (257, '244440301003', '广东省', '深圳市', '罗湖区', '深圳市罗湖区南湖街道嘉宾路国际商业大厦北座1405单元', '22.539335', '114.117899', '深圳市南湖街道嘉宾路贵州茅台特约经销商', '贵州省外国企业服务有限责任公司深圳分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (258, '22520183037001', '贵州省', '贵阳市', '白云区', '贵阳市白云区泉湖街道云环路285号金科金茂九华粼云S3栋1层15号', '26.675032', '106.608402', '白云区泉湖街道云环路茅台酱香万家共享主题终端', '贵州盛世九酝贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (259, '133330289001', '浙江省', '宁波市', '鄞州区', '宁波市鄞州区日丽中路370号', '29.809585', '121.555295', '宁波市日丽中路贵州茅台专卖店', '宁波酩荟贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (260, '132320500001', '江苏省', '苏州市', '姑苏区', '苏州市姑苏区干将东路780号', '31.307681', '120.628841', '苏州市干将东路贵州茅台专卖店', '苏州苏糖名酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (261, '230100023003', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区哈西大街39-18号', '45.712807', '126.592768', '哈尔滨哈西大街贵州茅台专卖店', '哈尔滨市汇鑫食品经销有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (262, '161612723001', '陕西省', '榆林市', '府谷县', '榆林市府谷县河滨东路101号', '39.027212', '111.068565', '府谷县河滨东路贵州茅台专卖店', '榆林市天惠集团购物有限公司府谷第一分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (263, '213702001001', '山东省', '青岛市', '市南区', '青岛市市南区银川西路7-58号', '36.082194', '120.408345', '青岛市银川西路贵州茅台文化体验馆', '青岛鑫浩统达糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (264, '137373001002', '山东省', '威海市', '文登区', '威海市文登区豹山路68-5号', '37.183593', '122.03408', '威海市豹山路贵州茅台专卖店', '威海深港贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (265, '24320101001010', '江苏省', '南京市', '市辖区', '南京市市辖区南京市江北新区浦泗路18号C4栋', '32.061377', '118.763563', '南京赵氏商贸有限公司中心库', '南京赵氏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (266, '22410300005001', '河南省', '平顶山市', '卫东区', '平顶山市卫东区河南省平顶山市卫东区东环路街道水城威尼斯26幢1-2层111铺211铺', '33.752314', '113.347632', '卫东区东环路茅台酱香万家共享主题终端', '河南茅酱酒业销售有限公司洛阳分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (267, '150500107003', '重庆市', '重庆市', '九龙坡区', '重庆市九龙坡区西彭镇白彭路1号', '29.310226', '106.329402', '重庆市白彭路贵州茅台专卖店', '重庆灏达伟业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (268, '150500237001', '重庆市', '重庆市', '南岸区', '重庆市南岸区玉马路13号附4号—5号', '29.489948', '106.637854', '重庆市玉马路贵州茅台专卖店', '重庆宜满商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (269, '235350183002', '福建省', '福州市', '鼓楼区', '福州市鼓楼区五凤街道北环西路158号', '26.106631', '119.291022', '福州市北环西路贵州茅台专卖店', '福建海晟连锁营销发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (270, '251510188001', '四川省', '成都市', '锦江区', '成都市锦江区锦东路595号附21、22、23、24号', '30.639493', '104.107089', '成都市锦东路贵州茅台专卖店', '成都宇尊贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (271, '2244030100001', '广东省', '深圳市', '罗湖区', '深圳市罗湖区笋岗街道田心社区宝岗北路美芝大华电视厂1号厂房1栋1层125B单元（麦德龙罗湖店', '22.571056', '114.111093', '深圳市笋岗街道贵州茅台酱香系列酒体验中心', '深圳市经业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (272, '251510188002', '四川省', '成都市', '高新区', '成都市高新区成都高新区梓州大道4307号-4315号', '30.534928', '104.083436', '成都市梓州大道贵州茅台专卖店', '四川兴利酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (273, '2136072710001', '江西省', '赣州市', '龙南市', '赣州市龙南市兴隆嘉园1号', '24.904892', '114.797695', '龙南市人民大道龙南县海兴副食品店门店', '赣州泓海酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (274, '2244030100002', '广东省', '深圳市', '福田区', '深圳市福田区南园街道东园社区红岭南路1033号御河堤连廊1层121-124之04号', '22.538309', '114.104014', '深圳市南园街道贵州茅台酱香系列酒体验中心', '深圳市鸿鑫源文化艺术传播有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (275, '251510188009', '四川省', '成都市', '锦江区', '成都市锦江区经天路1号1栋1楼4号', '30.603789', '104.098392', '成都市经天路贵州茅台专卖店', '成都铭润康元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (276, '22510181003001', '四川省', '成都市', '都江堰市', '成都市都江堰市四川省成都市都江堰市幸福街道解放社区中山北路110号', '31.0', '103.64', '中山北路茅台酱香万家共享主题终端', '成都市起腾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (277, '251510188007', '四川省', '成都市', '锦江区', '成都市锦江区海棠路69、71、73、75号', '30.5889928', '104.1536032', '成都市海棠路贵州茅台专卖店', '成都风雅颂酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (278, '251510188005', '四川省', '成都市', '双流区', '成都市双流区和祥三街253号', '30.520443', '104.102903', '成都市和祥三街贵州茅台专卖店', '四川方升酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (279, '250500107004', '重庆市', '重庆市', '九龙坡区', '重庆市九龙坡区石坪桥街道云龙大道210号附76-78号', '29.502403', '106.493962', '重庆市云龙大道贵州茅台专卖店', '重庆贵可丰酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (280, '123230627001', '黑龙江省', '大庆市', '让胡路区', '大庆市让胡路区让胡路区长庆街61号', '46.62455', '124.906749', '大庆市长庆街贵州茅台专卖店', '大庆市福海汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (281, '122220189001', '吉林省', '长春市', '绿园区', '长春市绿园区吴中国际', '43.88403', '125.273241', '长春市景阳大路贵州茅台专卖店', '长春市城祥汽车贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (282, '135350432001', '福建省', '三明市', '三元区', '三明市三元区和仁新村6幢一层1号', '26.26571', '117.635701', '三明市东新二路贵州茅台专卖店', '福建刘家园贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (283, '34440300083002001', '陕西省', '西安市', '高陵区', '西安市高陵区陕西省西安市高新区锦业路以北西安绿地中心A座6幢1单元27层2701室', '34.343617', '108.939797', '陕西华昱恒韵酒业有限公司中心库', '陕西华昱恒韵酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (284, '2143012110001', '湖南省', '长沙市', '长沙县', '长沙市长沙县星沙街道星城社区华润置地广场2期5栋108号', '28.2476', '113.111', '长沙县星沙街道长沙县远航酒类贸易有限公司门店', '长沙县远航酒类贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (285, '2134130010001', '安徽省', '宿州市', '埇桥区', '宿州市埇桥区银河-路398号', '33.646292', '116.967691', '宿州市银河一路宿州市国韵糖酒有限责任公司门店', '宿州市国韵糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (286, '652301001', '新疆维吾尔自治区', '昌吉回族自治州', '昌吉市', '昌吉回族自治州昌吉市建国西路66号鸿都国际酒店一楼门面', '44.006794', '87.284568', '新疆对酒当歌酒业贸易有限公司中心库', '新疆对酒当歌酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (287, '114140200001', '山西省', '大同市', '平城区', '大同市平城区操场城东街温莎公馆西2号', '40.106325', '113.30673', '大同市操场城街贵州茅台专卖店', '大同市时光糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (288, 'B62010200200', '甘肃省', '兰州市', '城关区', '兰州市城关区甘肃省兰州市城关区广场南路4-6号国芳百货一层L129号商铺', '36.051784', '103.844774', '兰州旗舰店总库', '兰州淋缘醇香食品销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (289, '114140200002', '山西省', '大同市', '平城区', '大同市平城区山西省大同市魏都大道与源兴街交会口路西南角商铺', '40.057032', '113.289318', '大同市魏都大道贵州茅台专卖店', '大同市惠恩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (290, 'B62010200201', '甘肃省', '兰州市', '城关区', '兰州市城关区甘肃省兰州市城关区广场南路4-6号国芳百货一层L129号商铺', '36.051784', '103.844774', '兰州市城关区广场南路4-6号贵州茅台旗舰店', '兰州淋缘醇香食品销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (291, '2213060000001', '河北省', '保定市', '竞秀区', '保定市竞秀区颉庄乡西二环2626-6号', '38.885122', '115.402478', '保定市颉庄乡西二环贵州茅台酱香系列酒体验中心', '乾坤福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (292, '510623003', '四川省', '德阳市', '中江县', '德阳市中江县凯江镇铜山大道西段288号（1#车间）8号库房', '31.044932', '104.664434', '德阳普华贸易有限公司中心库', '德阳普华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (293, '231310115004', '上海市', '上海市', '普陀区', '上海市普陀区云岭东路235、245号106室', '31.222801', '121.39218', '上海市云岭东路贵州茅台专卖店', '上海昊岚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (294, '231310115005', '上海市', '上海市', '浦东新区', '上海市浦东新区浦东南路3492,3498号一层', '31.194341', '121.507433', '上海市浦东南路贵州茅台专卖店', '上海浩泽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (295, '2323018600002', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区经开区南岗集中区浦江路83号', '45.753851', '126.694492', '哈尔滨市浦江路茅台酱香万家共享主题终端', '哈尔滨醉难德酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (296, '142420325001', '湖北省', '十堰市', '房县', '十堰市房县城关镇诗经大道北25号2栋1-10、1-11、1-12、1-13', '32.063533', '110.739623', '房县诗经大道贵州茅台专卖店', '湖北寿康永乐商贸集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (297, '2350038400001', '重庆市', '重庆市', '南川区', '重庆市南川区西城街道办事处渝南大道5号康田熙岸4幢1-5', '29.158751', '107.087606', '重庆市西城街道茅台酱香万家共享主题终端', '重庆市南川区典酱副食品经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (298, '7089509', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (299, '141410600003', '河南省', '鹤壁市', '淇滨区', '鹤壁市淇滨区南海路与永定河路交叉口财富广场金桂园小区1号楼107', '35.697458', '114.280412', '鹤壁市鹤淇大道贵州茅台专卖店', '鹤壁市沐欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (300, '141410600002', '河南省', '鹤壁市', '淇滨区', '鹤壁市淇滨区黎阳路312号', '35.756216', '114.287394', '鹤壁市黎阳路贵州茅台专卖店', '新乡市国源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (301, '22510186003001', '四川省', '成都市', '青羊区', '成都市青羊区四川省成都市青羊区锦里西路90号附4号1层4-6号', '30.656162', '104.046309', '青羊区锦里西路茅台酱香万家共享主题终端店', '四川正天国品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (302, '22310114002001', '上海市', '上海市', '宝山区', '上海市宝山区上海市宝山区克山路230号', '31.402522', '121.466239', '宝山区月辉路茅台酱香万家共享主题终端', '上海国茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (303, '350583003004', '福建省', '泉州市', '晋江市', '泉州市晋江市福兴东路罗山段682-77号', '24.778205', '118.56961', '泉州市晋江市福兴路罗山段贵州茅台专卖店贵州茅台专卖店', '福建凯谊投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (304, '121210194001', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区三义街28-4号1门', '41.741293', '123.452383', '沈阳市三义街贵州茅台专卖店', '沈阳恩云商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (305, '22520188013003', '贵州省', '贵阳市', '息烽县', '贵阳市息烽县永靖镇南大街广建新苑17幢1层1-7号', '27.08343', '106.742256', '息烽县永靖镇南大街茅台酱香万家共享主题终端', '贵州正和德源酒业股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (306, '22520188013002', '贵州省', '贵阳市', '开阳县', '贵阳市开阳县紫兴社区开州大道城关镇紫江花园14幢3号门面', '27.052894', '106.977852', '开阳县紫兴社区开州大道茅台酱香万家共享主题终端', '贵州正和德源酒业股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (307, '100370400003', '山东省', '枣庄市', '市中区', '枣庄市市中区青檀南路54号青檀商城沿街综合楼南数2-3户', '34.844673', '117.554558', '枣庄市青檀南路贵州茅台专卖店', '枣庄鑫正置业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (308, '2341282800003', '河南省', '信阳市', '平桥区', '信阳市平桥区羊山新区十八大街润和名城', '32.145015', '114.111819', '信阳市十八大街茅台酱香万家共享主题终端', '信阳市福锦基实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (309, '22520188013001', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区渔安街道未来方舟第H6-地下室负5层26号', '26.590318', '106.752337', '云岩区渔安街道未来方舟茅台酱香万家共享主题终端', '贵州正和德源酒业股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (310, '134340904001', '安徽省', '黄山市', '歙县', '黄山市歙县歙县徽城镇紫霞路13号', '29.862348', '118.424023', '黄山市歙县紫霞路贵州茅台专卖店', '黄山市乐都实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (311, '2341282800002', '河南省', '南阳市', '宛城区', '南阳市宛城区仲景街道光武东路茶城1楼西', '33.008776', '112.578713', '南阳市仲景街道茅台酱香万家共享主题终端', '南阳市万达投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (312, '2341282800001', '河南省', '驻马店市', '市辖区', '驻马店市市辖区开发区乐山路与纬二路交叉口伟恒枫叶城小区620号', '33.02', '114.022', '驻马店市乐山路茅台酱香万家共享主题终端', '河南自强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (313, '121210882002', '辽宁省', '营口市', '大石桥市', '营口市大石桥市繁荣大街70号百亿悦府1#106.107', '40.62978', '122.517684', '大石桥市繁荣大街贵州茅台专卖店', '大石桥祥泽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (314, '22510194013001', '四川省', '成都市', '高新区', '成都市高新区四川省成都市高新区锦城大道666号奥克斯广场B座1楼', '30.575925', '104.062023', '锦城大道茅台酱香万家共享主题终端', '成都宏泰昌隆贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (315, '2336073100001', '江西省', '赣州市', '于都县', '赣州市于都县贡江镇滨江大道水云豪苑A栋6号店', '25.951461', '115.404037', '于都县贡江镇滨江大道茅台酱香万家共享主题终端', '于都沃熙康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (316, '2336073100002', '江西省', '赣州市', '于都县', '赣州市于都县滨江大道阳光水岸十-号小区', '25.961684', '115.405238', '于都县滨江大道茅台酱香万家共享主题终端', '赣州诚龙商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (317, '224112820001', '河南省', '三门峡市', '灵宝市', '三门峡市灵宝市函谷路中段隆盛福星苑2幢102', '34.525239', '110.890249', '三门峡灵宝市函谷路贵州茅台酱香系列酒体验中心', '灵宝市前进酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (318, '243430185003', '湖南省', '长沙市', '雨花区', '长沙市雨花区圭塘街道香莲路457号湘府熙园小区S2栋1层108-111号', '28.116026', '113.043006', '长沙市香莲路贵州茅台专卖店', '长沙卓立酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (319, '243430185005', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区斑马塘社区含浦中路785号', '28.125174', '112.907617', '长沙市含浦大道贵州茅台专卖店', '长沙酱王酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (320, '243430185006', '湖南省', '长沙市', '开福区', '长沙市开福区浏阳河街道福元西路506-1号五矿春和景园23栋114-115号商铺', '28.248491', '113.012599', '长沙市福元西路贵州茅台专卖店', '湖南同舟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (321, '2151082510001', '四川省', '广元市', '利州区', '广元市利州区文化路26号', '32.432333', '105.841759', '广元市文化路广元亿祥商贸有限责任公司门店', '广元亿祥商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (322, '7089519', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (323, '143431282001', '湖南省', '邵阳市', '双清区', '邵阳市双清区石桥社区邵阳大道和盛中央城2栋1006号、1007号', '27.220747', '111.481884', '邵阳市邵阳大道贵州茅台专卖店', '邵阳冠胜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (324, '132321404002', '江苏省', '泰州市', '靖江市', '泰州市靖江市人民中路中泰广场第1幢1单元10号', '32.00184', '120.264337', '靖江市人民中路贵州茅台专卖店', '江苏唯真中外名烟名酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (325, '252520184005', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区美的国宾府B区洋房商业门面S35号楼-101、102、103、104号', '26.421655', '106.654581', '贵阳市美的国宾府贵州茅台专卖店', '贵州成德晨贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (326, '22510683003001', '四川省', '德阳市', '旌阳区', '德阳市旌阳区世家雍锦湖11-1-3号', '31.165504', '104.410424', '旌阳区黄浦江西路茅台酱香万家共享主题终端', '四川融和荣贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (327, '111110229001', '北京市', '北京市', '丰台区', '北京市丰台区航丰路1号院2号楼1层103房', '39.831635', '116.287874', '北京市航丰路贵州茅台专卖店', '北京京尊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (328, '252520184002', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区海纳广场精彩城29#11-1-1-11', '26.396868', '106.625611', '贵阳市科技路贵州茅台专卖店', '贵州鹏林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (329, '22543200004001', '四川省', '达州市', '通川区', '达州市通川区西外新区南北干道东侧巨鑫园小区B幢1层15-16号', '31.213948', '107.465592', '通川区金牌路茅台酱香万家共享主题终端', '达州市遵达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (330, '410100039010', '河南省', '郑州市', '金水区', '郑州市金水区金水东路85号（雅宝东方国际广场109号）', '34.769442', '113.774553', '郑州市金水东路贵州茅台文化体验馆', '河南省茅五剑贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (331, '153534100001', '云南省', '西双版纳傣族自治州', '景洪市', '西双版纳傣族自治州景洪市西双版纳旅游度假区庄董东路南亚春天住宅小区1幢122-123号', '21.970573', '100.814596', '景洪市庄董东路贵州茅台专卖店', '西双版纳童州经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (332, '2251060000001', '四川省', '德阳市', '旌阳区', '德阳市旌阳区恒大商贸城4栋10号', '31.137229', '104.365897', '德阳市恒大商贸城贵州茅台酱香系列酒体验中心', '德阳市群运物资有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (333, '135350200008', '福建省', '厦门市', '湖里区', '厦门市湖里区港中路1267号', '24.535418', '118.099226', '厦门市港中路贵州茅台专卖店', '厦门建发股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (334, '135350200007', '福建省', '厦门市', '湖里区', '厦门市湖里区港中路1267号', '24.535418', '118.099226', '厦门市港中路贵州茅台专卖柜', '厦门建发股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (335, '22370185003001', '山东省', '济南市', '天桥区', '济南市天桥区世茂天城SYC-00-0105', '36.68', '116.99', '天桥区堤口路茅台酱香万家共享主题终端', '济南稼轩酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (336, '135350200009', '福建省', '厦门市', '思明区', '厦门市思明区禾祥西路23号103-104', '24.4642', '118.08386', '厦门市禾祥西路贵州茅台专卖店', '厦门商润糖酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (337, '752011500001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵阳国家高新技术产业开发区长岭南路160号黎阳大厦地上部分（C）1单元24层1号', '26.618962', '106.646759', '网易（贵州）好物科技有限公司', '网易（贵州）好物科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (338, '135350200003', '福建省', '厦门市', '思明区', '厦门市思明区禾祥西路4号10-11单元', '24.462208', '118.080107', '福建省厦门市思明区禾祥西路贵州茅台专卖店', '厦门铭宝酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (339, '2244138400001', '广东省', '惠州市', '惠阳区', '惠州市惠阳区淡水镇长安南路163号', '22.783052', '114.478094', '惠州市长安南路贵州茅台酱香系列酒体验中心', '惠州市康盛源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (340, '22110226006001', '北京市', '北京市', '平谷区', '北京市平谷区府前街36号北侧楼一层底商13号', '40.152238', '117.101711', '平谷区府前街茅台酱香万家共享主题终端', '北京鹏宇九缘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (341, '134340228001', '安徽省', '芜湖市', '无为市', '芜湖市无为市无城镇金塔路金源小区1幢一层门面房', '31.309686', '117.905795', '芜湖市无为市金塔路贵州茅台专卖店', '芜湖市万方商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (342, '232320282001', '江苏省', '无锡市', '宜兴市', '无锡市宜兴市环科园中节能106号', '31.350089', '119.783559', '宜兴市绿园路贵州茅台43度经销店', '无锡市牧康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (343, '350100001005', '福建省', '福州市', '鼓楼区', '福州市鼓楼区五四路243号银河花园大饭店一层', '26.102138', '119.306657', '福州五四路贵州茅台专卖店', '福建省糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (344, '135350200002', '福建省', '厦门市', '思明区', '厦门市思明区厦禾路13-109号', '24.460601', '118.074535', '厦门市厦禾路贵州茅台专卖店', '厦门市国酿商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (345, '142422302001', '湖北省', '咸宁市', '咸安区', '咸宁市咸安区咸宁大道与银泉大道交汇处（宏伟大厦）105号', '29.842604', '114.334699', '咸宁市咸宁大道贵州茅台专卖店', '赤壁市众缘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (346, '22371400002001', '山东省', '德州市', '德城区', '德州市德城区经济技术开发区长河街道办事处东方红路高地世纪城3号楼02号商铺-2', '37.442557', '116.348298', '德城区东方红东路茅台酱香万家共享主题终端', '德州市旭日副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (347, '141412727001', '河南省', '周口市', '淮阳区', '周口市淮阳区朝祖大道与羲皇大道交叉口广商梦幻城', '33.749841', '114.85284', '周口市朝祖大道贵州茅台专卖店', '周口市淮阳区宏丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (348, '133330900001', '浙江省', '舟山市', '普陀区', '舟山市普陀区沈家门街道东海中路1005-1009号', '29.944092', '122.27805', '舟山东海中路贵州茅台专卖店', '舟山市徐福酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (349, '163630127001', '青海省', '西宁市', '城北区', '西宁市城北区西海路中海河山郡59号5号楼209室', '36.651757', '101.753964', '西宁市西海路贵州茅台专卖店', '青海振能商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (350, '230600013', '黑龙江省', '大庆市', '让胡路区', '大庆市让胡路区黑龙江省大庆市让湖路区西建街东侧燕都酒楼北侧商服16号1-2层', '46.572838', '124.89263', '大庆市宁喆商贸有限公司中心库', '大庆市宁喆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (351, '22413100013001', '河南省', '洛阳市', '西工区', '洛阳市西工区纱厂南路与凯旋路交叉口北50米通元花园楼下商铺1-1-102', '34.67', '112.43', '西工区纱厂南路茅台酱香万家共享主题终端', '洛阳德广商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (352, '22410100092001', '河南省', '郑州市', '惠济区', '郑州市惠济区天元路清华园路交叉口向西200米', '34.860199', '113.619125', '惠济区天元路茅台酱香万家共享主题终端', '河南蓝色汉酱酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (353, '2361063300001', '陕西省', '延安市', '宝塔区', '延安市宝塔区长青路丝绸厂建材市场门面4号', '36.615743', '109.51392', '延安市长青路茅台酱香万家共享主题终端', '延安林林工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (354, '23522321014402', '贵州省', '黔西南布依族苗族自治州', '兴义市', '黔西南布依族苗族自治州兴义市鑫凯-桔山湖（三期）B5栋1-1-2-3号', '25.120133', '104.932712', '贵州茅台酱香系列酒体验中心（兴义旗舰店）', '黔西南州玺铭酱酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (355, '22330500004001', '浙江省', '湖州市', '吴兴区', '湖州市吴兴区织里镇棉布城17幢52A', '30.87', '120.26', '织里镇棉布城茅台酱香万家共享主题终端', '湖州酒米塔酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (356, '22411523001001', '河南省', '信阳市', '浉河区', '信阳市浉河区北京大街新五大道交叉口东南角', '32.145823', '114.063248', '浉河区北京大街茅台酱香万家共享主题终端', '信阳市诚信酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (357, '22370181005001', '山东省', '济南市', '章丘区', '济南市章丘区唐王山路新世纪小区南门东50米王伟酒水主题终端', '36.69311', '117.54112', '章丘区唐王山路茅台酱香万家共享主题终端', '济南酱久香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (358, '122220600001', '吉林省', '白山市', '浑江区', '白山市浑江区浑江大街1570号', '41.942273', '126.429274', '白山市浑江大街贵州茅台专卖店', '吉林省白山方大商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (359, '121210288002', '辽宁省', '大连市', '沙河口区', '大连市沙河口区联合路兰园8-11号、8-12号', '38.92289', '121.596287', '大连市联合路贵州茅台专卖店', '大连津享逸商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (360, '137370684003', '山东省', '烟台市', '蓬莱市', '烟台市蓬莱市山东省烟台市蓬莱区登州街道登州路16号爱马人骊城1号楼130号房', '37.815733', '120.771263', '烟台市登州路贵州茅台专卖店', '烟台市蓬莱区佰瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (361, '22430185002002', '湖南省', '长沙市', '开福区', '长沙市开福区洪山街道洪山路188号藏珑湖上国际花园2-9栋106号商铺', '28.24', '113.04', '开福区洪山路茅台酱香万家共享主题终端', '长沙市同德酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (362, '141411500001', '河南省', '信阳市', '浉河区', '信阳市浉河区大庆路中段阳光新村商住小区2号楼一层112/212号', '32.111519', '114.087731', '信阳市大庆路贵州茅台专卖店', '信阳屹宏天朗实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (363, 'B52030100102', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区贵州省遵义市红花岗区老城街道杨柳街1935一期二号楼一层1/2/3号', '27.687244', '106.921154', '遵义市杨柳街贵州茅台旗舰店', '茅台酒股份有限公司遵义冰醇分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (364, '141411500002', '河南省', '信阳市', '浉河区', '信阳市浉河区八一商业步行街南口115号', '32.125348', '114.062447', '信阳市八一商业步行街贵州茅台专卖店', '河南心悦肥业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (365, '23410882001002', '河南省', '焦作市', '沁阳市', '焦作市沁阳市河南省沁阳市适居路罗曼庄园楼下', '35.089857', '112.908949', '沁阳市适居路贵州茅台酱香系列酒体验中心', '沁阳市林泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (366, '2337018100001', '山东省', '济南市', '章丘区', '济南市章丘区唐王山路新世纪小区王伟酒水511号', '36.69304585949553', '117.541297543395', '济南市唐王山路茅台酱香万家共享主题终端', '济南酱久香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (367, '34321326002083001', '浙江省', '台州市', '路桥区', '台州市路桥区浙江省台州市路桥区新路村高登宝路113号', '28.567411', '121.390192', '台州市旺龙贸易有限公司中心库', '台州市旺龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (368, '224301040001', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区振业城三期S7栋、S8栋110', '28.200497', '112.897936', '长沙市岳麓区贵州茅台酱香系列酒体验中心', '长沙卓立酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (369, '133330682002', '浙江省', '绍兴市', '上虞区', '绍兴市上虞区百官街道半山路103号', '30.019899', '120.876128', '绍兴市半山路贵州茅台专卖店', '绍兴香溢投资发展有限公司上虞经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (370, '223230186003', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区铁路街169号、171号', '45.752992', '126.625696', '哈尔滨市铁路街贵州茅台专卖店', '哈尔滨哈铁采购经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (371, '132320286001', '江苏省', '无锡市', '梁溪区', '无锡市梁溪区崇文大厦一楼人民东路303号', '31.584183', '120.317664', '无锡市人民东路贵州茅台专卖店', '江苏新百通酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (372, '142420100015', '湖北省', '武汉市', '武昌区', '武汉市武昌区南湖花园机场三路水域天际二期19号楼商网1层2-4室', '30.50171', '114.320587', '武汉市平安路贵州茅台专卖店', '武汉格瑞提商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (373, '2142010010003', '湖北省', '武汉市', '汉阳区', '武汉市汉阳区江城大道201号卧龙墨水边1期商业栋G2-6', '30.314938', '114.134693', '武汉市江城大道武汉市康禄醇香商贸有限公司门店', '武汉市康禄醇香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (374, '2142010010001', '湖北省', '武汉市', '市辖区', '武汉市市辖区武汉东湖新技术开发区珞喻东路22号恒大华府A地块1层18室', '30.506625', '114.44256', '武汉市尊悦贸易有限公司武汉市专卖店', '武汉市尊悦贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (375, '137370787002', '山东省', '潍坊市', '青州市', '潍坊市青州市凤凰山东路2599号海天丽景西区综合楼凤凰山东路2637号、2647号商铺', '36.673932', '118.50301', '青州市凤凰山东路贵州茅台专卖店', '青州市易兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (376, '252522734001', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市大龙大道8号南州国际文华苑3栋1层15-17号门面', '26.251544', '107.531319', '都匀市大龙大道贵州茅台专卖店', '黔南州糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (377, '2151080010001', '四川省', '巴中市', '巴州区', '巴中市巴州区巴州大道金鳞万点广场A103门市', '31.853448', '106.723092', '巴中市巴州大道巴中市巴州区晶百利商贸中心门店', '巴中市巴州区晶百利商贸中心', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (378, '22411221001001', '河南省', '三门峡市', '渑池县', '三门峡市渑池县黄河东路东苑小区南门口西第一间', '34.7706593', '111.7707795', '渑池县黄河路东路茅台酱香万家共享主题终端', '渑池县三人行酒品商贸公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (379, 'B52030100101', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区贵州省遵义市红花岗区老城街道杨柳街1935一期二号楼一层1/2/3号', '27.687244', '106.921154', '遵义旗舰店总店', '茅台酒股份有限公司遵义冰醇分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (380, '511400001', '四川省', '眉山市', '东坡区', '眉山市东坡区苏祠街道环湖路二段2栋1楼68-70号', '30.046608', '103.832866', '眉山市同得利商贸有限公司中心库', '眉山市同得利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (381, '144440307001', '广东省', '深圳市', '龙华区', '深圳市龙华区民治街道新区大道新彩苑1栋2号楼108、109铺', '22.602128', '114.037368', '深圳市新区大道贵州茅台专卖店', '深圳市泓远福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (382, '153532332001', '云南省', '楚雄彝族自治州', '楚雄市', '楚雄彝族自治州楚雄市楚雄市东瓜镇彝风大道23号彝风湿地文旅小镇味觉森林7幢1室2室', '25.0728', '101.527963', '楚雄市彝风大道贵州茅台专卖店', '楚雄天森利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (383, '145452701001', '广西壮族自治区', '河池市', '金城江区', '河池市金城江区百旺路19号锦城国际1#楼地上第一层105#、106#商铺', '24.694209', '108.085893', '河池市百旺路贵州茅台专卖店', '河池施马商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (384, 'B53011200101', '云南省', '昆明市', '西山区', '昆明市西山区云南省昆明市西山区金碧路金马碧鸡坊商业街区JB1-1-2号103', '25.033708', '102.71143', '昆明市西山区金碧路金马碧鸡坊商业街区贵州茅台旗舰店', '云南滇冰醇企业管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (385, '2311010500007', '北京市', '北京市', '朝阳区', '北京市朝阳区青年路29号院4号楼-层4-8', '39.931848', '116.511454', '北京市青年路茅台酱香万家共享主题终端', '北京酒久酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (386, '137370832002', '山东省', '济宁市', '梁山县', '济宁市梁山县水泊街道水泊大街2461号东方国际小区1号楼105商铺（东方国际东门向南60米）', '35.787713', '116.082321', '梁山县水泊大街贵州茅台专卖店', '梁山县悦昊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (387, '2132098110001', '江苏省', '盐城市', '东台市', '盐城市东台市范公南路348号', '32.837198', '120.335452', '东台市范公南路东台市苏瑞商贸有限公司门店', '东台市苏瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (388, '137371483001', '山东省', '德州市', '德城区', '德州市德城区广川街道东方红路唐人中心Y8-29号', '37.45031', '116.32421', '德州市东方红路贵州茅台专卖店', '德州市旭日副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (389, '223230186002', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区哈西大街39-18号', '45.712807', '126.592768', '哈尔滨市哈西大街贵州茅台专卖店', '哈尔滨市汇鑫食品经销有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (390, '2137142810001', '山东省', '德州市', '武城县', '德州市武城县三八北路5号', '37.2125942', '116.0756463', '武城县振华街武城县久都商贸有限公司门店', '武城县久都商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (391, '21510186005502', '四川省', '成都市', '武侯区', '成都市武侯区武侯区星狮路866号4栋4单元1-102', '30.626541', '104.006786', '茅台酱香.万家共享', '成都三汇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (392, '133330200001', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区云岩区金阳南路与北京西路交叉口西南侧贵阳印象城城市综合体23组团购物中心沿街商业-A单元-1-141 /142', '26.600767', '106.618112', '贵阳市金阳南路贵州茅台专卖店', '贵州能源大数据科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (393, '151510781001', '四川省', '绵阳市', '江油市', '绵阳市江油市诗仙路西段273号', '31.775693', '104.721554', '江油市诗仙路贵州茅台专卖店', '江油市启仁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (394, '133330200002', '浙江省', '宁波市', '海曙区', '宁波市海曙区南门街道澄浪路中湾广场68-70号', '29.851927', '121.543785', '宁波市澄浪路贵州茅台专卖店', '宁波万顺茅台酒专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (395, '34410100087001001', '河南省', '平顶山市', '卫东区', '平顶山市卫东区1', '33.735388', '113.335316', '河南茅酱酒业销售有限公司平顶山分公司中心库', '河南茅酱酒业销售有限公司平顶山分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (396, '2311010500004', '北京市', '北京市', '怀柔区', '怀柔区怀柔区府前东街1号院对面', '40.318489', '116.648682', '北京市府前东街茅台酱香万家共享主题终端', '酒仙网络科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (397, '135350121001', '福建省', '福州市', '闽侯县', '福州市闽侯县上街镇国宾大道2号金桥花园五区（博仕后公馆）A2#楼1层108、109、110、111商业', '26.070358', '119.21037', '闽侯县国宾大道贵州茅台专卖店', '酿品酒业（福州）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (398, '2135032310001', '福建省', '莆田市', '城厢区', '莆田市城厢区荔城南大道1428号3号109-110室', '25.422312', '118.997511', '莆田市荔城南大道莆田市永盛世纪贸易有限公司门店', '莆田市永盛世纪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (399, '2311010500005', '北京市', '北京市', '怀柔区', '北京市怀柔区南华大街21号楼1层101', '40.308737', '116.629417', '北京市南华大街茅台酱香万家共享主题终端', '酒仙网络科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (400, '131310107001', '上海市', '上海市', '普陀区', '上海市普陀区昌化路826号', '31.243086', '121.446321', '上海市昌化路贵州茅台专卖店', '上海百醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (401, '2152230110001', '贵州省', '黔西南布依族苗族自治州', '兴义市', '黔西南布依族苗族自治州兴义市桔山办机场大道施达丽景湾小区17号门面', '28.6925068', '116.7875033', '兴义市机场大道贵州龙乾商贸有限责任公司门店', '贵州龙乾商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (402, '114142701001', '山西省', '运城市', '盐湖区', '运城市盐湖区人民南路243号汇景名园1幢1层1F1006号门面房', '35.031631', '111.003258', '运城市人民南路贵州茅台专卖店', '山西美鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (403, '22453007002001', '广西壮族自治区', '河池市', '宜州区', '河池市宜州区庆远镇龙溪路与南山路交角豪门广场小区2幢41号商铺', '24.49', '108.64', '宜州区庆远镇龙溪路与南山路交角贵州茅台酱香系列酒体验中心', '河池摆渡酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (404, '140900001', '山西省', '忻州市', '市辖区', '忻州市市辖区忻州市忻府区和平百街(元遗山路 十字路口东北100米)', '38.395104', '112.726923', '山西惠腾商贸有限公司中心库', '山西惠腾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (405, '2644010007401', '广东省', '广州市', '增城区', '广州市增城区广东省广州市增城区新塘镇广深大道东36号', '23.120516', '113.642909', '增城区新塘镇广深大道东贵州茅台酱香系列酒体验中心', '广州鼎申贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (406, '2137070010002', '山东省', '潍坊市', '高新区', '潍坊市高新区新城街道新城西路1-5号', '36.724818', '119.168926', '潍坊市新城西路潍坊御酒坊经贸有限公司门店', '潍坊御酒坊经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (407, '2137070010004', '山东省', '潍坊市', '安丘市', '潍坊市安丘市兴安街道商场路阳光大厦对面（百汇名酒', '36.429383', '119.214642', '安丘市兴安街道安丘市百汇烟酒门市门店', '安丘市百汇烟酒门市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (408, '22210100009001', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区辽宁省沈阳市浑南区全运路96-1号', '41.69117', '123.42003', '浑南区全运路茅台酱香万家共享主题终端', '辽宁鑫源英民名酒连锁经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (409, '142420100036', '湖北省', '武汉市', '市辖区', '武汉市市辖区东湖新技术开发区光谷一路38号天成美景S1、S2栋S2单元1层02商号', '30.48474', '114.435161', '武汉市光谷一路贵州茅台专卖店', '武汉市君瓴贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (410, '22120400008001', '天津市', '天津市', '滨海新区', '天津市滨海新区塘沽云岭道晓镇家园底商13-14号', '39.049016', '117.671642', '滨海新区塘沽云岭道茅台酱香万家共享主题终端', '泉顶电子商务（天津）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (411, '22610100003001', '陕西省', '西安市', '未央区', '西安市未央区贞观路与凤城七路交汇处东北角睿明居1栋4单元1层40101号', '34.306589', '108.960369', '未央区贞观路茅台酱香万家共享主题终端', '陕西华鼎酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (412, '142420100035', '湖北省', '武汉市', '洪山区', '武汉市洪山区珞瑜东路76号卧龙剑桥春天商铺28-1、28-2', '30.506561', '114.420908', '武汉市珞瑜东路贵州茅台专卖店', '湖北誉永商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (413, '163632824001', '青海省', '海西蒙古族藏族自治州', '格尔木市', '海西蒙古族藏族自治州格尔木市昆仑中路43号', '36.403444', '94.904084', '格尔木市昆仑中路贵州茅台专卖店', '格尔木进忠商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (414, '330300022007', '浙江省', '温州市', '鹿城区', '温州市鹿城区信河街49号', '28.009845', '120.651678', '温州市信河街贵州茅台文化体验馆', '浙江久都商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (415, '142420100038', '湖北省', '武汉市', '汉南区', '武汉市汉南区东风大道68附55号', '30.518912', '114.180638', '武汉市东风大道贵州茅台专卖店', '武汉玉瑶天臻贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (416, '142420881001', '湖北省', '荆门市', '钟祥市', '荆门市钟祥市郢中镇校场路59号贵州茅台', '31.176725', '112.603514', '钟祥市校场路贵州茅台专卖店', '钟祥市汉茅商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (417, '225107000001', '四川省', '绵阳市', '涪城区', '绵阳市涪城区红桥路8号玫瑰花城17栋1层#', '31.438168', '104.774354', '绵阳市涪城区红桥路贵州茅台酱香系列酒体验中心', '绵阳铭仁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (418, '99901779', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (419, '21445302001002', '广东省', '云浮市', '云城区', '云浮市云城区云浮市云城区云城街道丰收村委东方时代广场侧第B幢第2、3卡(住所申报)', '22.941931', '112.060014', '云城区牧羊路茅台酱香万家共享主题终端', '云浮丰盟汇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (420, '2244540400001', '广东省', '潮州市', '潮安区', '潮州市潮安区城区彩文路东侧、龙桥路南侧阳光水岸一栋7-10号商铺', '23.470977', '116.674325', '潮州市龙桥路贵州茅台酱香系列酒体验中心', '潮州市云瑞来贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (421, '137370284002', '山东省', '青岛市', '黄岛区', '青岛市黄岛区长江路街道阿里山路88-1号', '35.953453', '120.195922', '青岛市长江路贵州茅台专卖店', '青岛龙华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (422, '121210191002', '辽宁省', '沈阳市', '大东区', '沈阳市大东区东北大马路116-1号（7门）（8门）', '41.821241', '123.480897', '沈阳市东北大马路贵州茅台专卖店', '沈阳西平商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (423, '2141132410001', '河南省', '南阳市', '镇平县', '南阳市镇平县建设大道中段县医院对面', '33.042638', '112.22885', '镇平县建设大道南阳市豫强商贸有限公司门店', '南阳市豫强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (424, '250500381001', '重庆市', '重庆市', '江津区', '重庆市江津区滨江大道鼎山段中昂新天地三期S5幢', '29.284886', '106.274501', '重庆市滨江大道贵州茅台专卖店', '重庆银怀祥贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (425, '135350821001', '福建省', '龙岩市', '长汀县', '龙岩市长汀县环城北路7号', '25.838502', '116.363494', '龙岩市环城北路贵州茅台专卖店', '福建省长汀贵丰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (426, '136362401002', '江西省', '吉安市', '吉州区', '吉安市吉州区鹭洲东路18号友谊花园1幢商业1-01号', '27.1153', '114.990005', '吉安市鹭洲东路贵州茅台专卖店', '吉安市好久贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (427, '2651078200101', '四川省', '绵阳市', '经开区', '绵阳市经开区经济技术开发区塘汛北街77号中玮海润城12栋', '31.405611', '104.790603', '经开区塘汛北街茅台酱香万家共享主题终端', '绵阳好玖要酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (428, '141411327001', '河南省', '南阳市', '社旗县', '南阳市社旗县北京中路万德隆时代广场一楼', '33.056738', '112.931029', '社旗北京中路贵州茅台专卖店', '南阳市万德隆商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (429, '22622301003001', '甘肃省', '武威市', '凉州区', '武威市凉州区皇台东路皇台九年制学校南门向西200米路南', '37.93', '102.6', '凉州区银武街茅台酱香万家共享主题终端', '武威诚煌商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (430, '34110105099012001', '广东省', '广州市', '番禺区', '广州市番禺区1', '22.93756', '113.383917', '广州源升商贸有限公司中心库', '广州源升商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (431, '134340700001', '安徽省', '铜陵市', '铜官区', '铜陵市铜官区北斗星城B1-101号', '30.950937', '117.816461', '铜陵市北京西路贵州茅台专卖店', '铜陵市久鼎商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (432, '445281007', '广东省', '揭阳市', '普宁市', '揭阳市普宁市流沙北街道长春路正华园南一幢东起第四间', '23.302785', '116.15307', '普宁市爱丽千顺贸易有限公司', '普宁市爱丽千顺贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (433, '22130736001001', '河北省', '张家口市', '宣化区', '张家口市宣化区小东门宣府大街与东城墙北路交汇处', '40.607506', '115.070963', '宣化区宣府大街茅台酱香万家共享主题终端', '张家口市宣化福源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (434, '24150600001010', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区东胜区华研香水湾南门西侧', '39.799483', '109.98365', '内蒙古伊泰椿翊商贸有限公司中心库', '内蒙古伊泰椿翊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (435, '310101021', '上海市', '上海市', '徐汇区', '上海市徐汇区', '0.0', '0.0', '', '绿地众选（上海）国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (436, '2344560800002', '广东省', '江门市', '新会区', '江门市新会区同德一路33号133铺', '22.514246', '113.056659', '江门市新会区同德一路茅台酱香万家共享主题终端', '江门市葵立贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (437, '2344560800003', '广东省', '云浮市', '云城区', '云浮市云城区牧羊路2号东方时代广场', '22.777061', '111.615687', '云浮市牧羊路茅台酱香万家共享主题终端', '罗定丰盟汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (438, '22441723001001', '广东省', '阳江市', '阳东区', '阳江市阳东区东城镇广雅东路138号敏捷东樾府26栋101号铺', '21.865631', '112.036771', '阳东区广雅东路茅台酱香万家共享主题终端', '阳江市欣源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (439, '243430227001', '湖南省', '湘潭市', '岳塘区', '湘潭市岳塘区双马街道晓塘中路58号碧桂园黄金时代5号楼 0101006—0101009号铺', '27.825165', '112.943171', '湘潭市晓塘中路贵州茅台专卖店', '湖南省华糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (440, '2351150000001', '四川省', '宜宾市', '叙州区', '宜宾市叙州区戎州路东段21号-1层附1号', '28.753827', '104.643763', '宜宾市戎州路茅台酱香万家共享主题终端', '宜宾泽达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (441, '22440600014001', '广东省', '佛山市', '顺德区', '佛山市顺德区乐从镇乐从社区居民委员会河滨北路171号富胜名邸商铺一', '22.964694', '113.092444', '顺德区乐从镇河滨北路茅台酱香万家共享主题终端', '佛山市中茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (442, '132320482001', '江苏省', '常州市', '金坛区', '常州市金坛区金坛大道384-6、7、8号', '31.720641', '119.59428', '常州市金坛大道贵州茅台专卖店', '常州市金坛久鼎业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (443, '330200008003', '浙江省', '宁波市', '江北区', '宁波市江北区大庆北路545号16幢1-87', '29.895257', '121.574889', '宁波大庆北路贵州茅台文化体验馆', '宁波万顺茅台酒专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (444, '21360126002004', '江西省', '南昌市', '西湖区', '南昌市西湖区南昌市西湖区桃苑小区桃苑大厦2区1楼13轴至1/17轴', '28.659531', '115.892802', '西湖区桃苑大街主题终端', '南昌市飞马实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (445, '142420800001', '湖北省', '荆门市', '东宝区', '荆门市东宝区象山大道239号', '30.998475', '112.191481', '荆门市象山大道239号贵州茅台专卖店', '荆门市仕博商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (446, '122220621001', '吉林省', '白山市', '抚松县', '白山市抚松县清风丽舍C栋101门市', '42.151131', '127.513393', '抚松县天池大道贵州茅台专卖店', '吉林省中外名酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (447, '113130982003', '河北省', '沧州市', '任丘市', '沧州市任丘市燕山南道东风金街', '38.684697', '116.119043', '任丘市永丰路贵州茅台专卖店', '任丘市冀中商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (448, '144440983002', '广东省', '茂名市', '高州市', '茂名市高州市潘州街道桂圆东路五区66号万福名雅城小区（一期）5号幢13一16号商铺', '21.895021', '110.870364', '高州市站前路贵州茅台专卖店', '茂名市金恒盈贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (449, '113130982002', '河北省', '石家庄市', '藁城区', '石家庄市藁城区东城北街61号', '38.033243', '114.852783', '石家庄市东城北街贵州茅台专卖店', '河北姜上之风商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (450, '22440400020001', '广东省', '珠海市', '香洲区', '珠海市香洲区朗柠路6号', '22.26', '113.55', '香洲区朗柠路茅台酱香万家共享主题终端', '珠海市仁尚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (451, '145452402001', '广西壮族自治区', '贺州市', '八步区', '贺州市八步区建设中路14-4号', '24.413045', '111.554667', '贺州市建设中路贵州茅台专卖店', '贺州市通泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (452, '214142800001', '山西省', '吕梁市', '离石区', '吕梁市离石区纬三十三路新城壹号一期二号商铺', '37.571452', '111.147771', '吕梁市纬三十三路贵州茅台专卖店', '吕梁市昌昊鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (453, '100340600001', '安徽省', '淮北市', '相山区', '淮北市相山区南黎办事处南湖路88号桓湖商城(南区）2幢109', '33.9596', '116.820047', '淮北市南湖路贵州茅台专卖店', '淮北市绿谷酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (454, '121210292001', '辽宁省', '大连市', '西岗区', '大连市西岗区新开路93C-1号', '38.916688', '121.616783', '大连市新开路贵州茅台专卖店', '大连润德商业有限公司西岗区分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (455, '123230190001', '黑龙江省', '哈尔滨市', '道里区', '哈尔滨市道里区群力第二大道29号', '45.74136', '126.558858', '哈尔滨市群力第二大道贵州茅台专卖店', '哈尔滨鸿俊祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (456, '22371583001001', '山东省', '聊城市', '莘县', '聊城市莘县莘州街道皇行家园S3-10号商铺', '36.230353', '115.671408', '莘县莘州街道茅台酱香万家共享主题终端', '聊城市佳科达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (457, '22450500006001', '广西壮族自治区', '北海市', '海城区', '北海市海城区广东路130号海城苑A区16幢第一层商铺', '21.466', '109.138', '海城区广东路茅台酱香万家共享主题终端', '北海黄瓷瓶茅酒酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (458, '330700004002', '浙江省', '金华市', '婺城区', '金华市婺城区苏孟乡双龙南街1899号', '29.054605', '119.649154', '金华市双龙南街贵州茅台文化体验馆', '浙江君道酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (459, '2334130000002', '安徽省', '宿州市', '埇桥区', '宿州市埇桥区宿州中央商务区室外步行街5号楼1层120商铺', '33.642262', '116.979864', '宿州市室外步行街茅台酱香万家共享主题终端', '安徽省豪宸商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (460, '22110102025019', '北京市', '北京市', '丰台区', '北京市丰台区北京市丰台区太平桥街道威尔夏大道', '39.881046', '116.319211', '丰台区太平桥路茅台酱香万家共享主题终端', '美誉唐网络科技（北京）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (461, 'B52011500301', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵州省贵阳市观山湖区长岭街道办事处长岭北路8号美的林城时代E-03F-01栋22层22号', '26.638753', '106.649901', '贵州乐悠然科技发展有限公司贵州省长岭街道办事处长岭北路8号专卖店', '贵州乐悠然科技发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (462, '2322018600001', '吉林省', '长春市', '市辖区', '长春市市辖区银河家园53栋', '43.82857', '125.327954', '长春市银河家园茅台酱香万家共享主题终端', '长春市金生水商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (463, '22440900003001', '广东省', '茂名市', '信宜市', '茂名市信宜市信宜市新尚路7号综合大楼第一层', '22.351185', '110.938344', '信宜市新尚路茅台酱香万家共享主题终端', '茂名市华樽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (464, '152520123001', '贵州省', '贵阳市', '修文县', '贵阳市修文县龙场街道栖凤大道', '26.833951', '106.592816', '修文县栖凤大道贵州茅台专卖店', '修文县迎春来酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (465, '134340882001', '安徽省', '安庆市', '迎江区', '安庆市迎江区人民东路盛晟阳光城（澜庭）B区商业一层3-5室', '30.504546', '117.076054', '安庆市人民东路贵州茅台专卖店', '安庆天香缘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (466, '137371323001', '山东省', '临沂市', '沂水县', '临沂市沂水县黄山路（原鑫华路）57-5', '35.768631', '118.626343', '沂水县黄山路贵州茅台专卖店', '临沂海通酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (467, '122220400003', '吉林省', '辽源市', '西安区', '辽源市西安区和宁街1200号', '42.909997', '125.141423', '辽源市和宁街贵州茅台专卖店', '辽源市一鸣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (468, '152520326002', '贵州省', '遵义市', '务川仡佬族苗族自治县', '遵义市务川仡佬族苗族自治县务川县鹏程逸都C栋', '28.553354', '107.897436', '务川县都濡镇东升大道贵州茅台专卖店', '务川县菡阳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (469, '153530126002', '云南省', '昆明市', '石林彝族自治县', '昆明市石林彝族自治县狮山路世纪阳光1期7幢18、19、20、21号', '24.767772', '103.268924', '石林县狮山路贵州茅台专卖店', '云南博雅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (470, '153530126003', '云南省', '昆明市', '西山区', '昆明市西山区前卫街道办事处日新路与前兴路交叉口润城小区（第二大道A1地块）商5栋1层商业109号', '24.996863', '102.705603', '昆明市日新路贵州茅台专卖店', '昆明品展毅商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (471, '2133028210001', '浙江省', '宁波市', '余姚市', '宁波市余姚市世南西路1000-1004号', '30.035518', '121.126459', '余姚市世南西路茅台酱香万家共享主题终端', '宁波市骏隆供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (472, 'B11010808301', '北京市', '北京市', '海淀区', '北京市海淀区北京市海淀区海淀五路居物美慧科大厦', '39.933293', '116.276473', '物美', '北京文固商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (473, '23440100087089', '广东省', '广州市', '南沙区', '广州市南沙区广州市南沙区南沙街道海通一街2号121铺', '22.7923', '113.54488', '贵州茅台酱香系列酒体验中心', '广州同鑫元文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (474, '133330122001', '浙江省', '杭州市', '桐庐县', '杭州市桐庐县梅林路779号、781号、783号、785号', '29.792172', '119.716189', '桐庐县梅林路贵州茅台专卖店', '桐庐扬帆食品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (475, '2337233100002', '山东省', '滨州市', '沾化区', '滨州市沾化区富城路397号', '37.698436', '118.134867', '滨州市富城路茅台酱香万家共享主题终端', '滨州市沾化区精华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (476, '142420100043', '湖北省', '武汉市', '江岸区', '武汉市江岸区金融街壹号G1015、1016', '30.619365', '114.295893', '武汉市金融街贵州茅台自营店', '湖北国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (477, '142420100042', '湖北省', '武汉市', '新洲区', '武汉市新洲区邾城街道龙腾大道以南（虹景新都三期）12#楼1-2层9号', '30.822717', '114.797586', '武汉市龙腾大道贵州茅台专卖店', '武汉市楚醇香贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (478, '161610583001', '陕西省', '渭南市', '临渭区', '渭南市临渭区杜桥街道杜化路北段苏园风景12号楼116铺-117铺', '34.516973', '109.483829', '渭南市杜化路贵州茅台专卖店', '渭南市万泉经贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (479, '512002001', '四川省', '资阳市', '市辖区', '资阳市市辖区皇龙路皇龙新城小区A座6号楼A6（F）1-8', '30.125219', '104.632177', '四川省天载商贸有限公司中心库', '四川省天载商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (480, '133330500002', '浙江省', '湖州市', '吴兴区', '湖州市吴兴区后庄路669-673号', '30.887452', '120.118696', '湖州市后庄路贵州茅台专卖店', '湖州五星酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (481, '137370522002', '山东省', '东营市', '利津县', '东营市利津县城区利二路328号', '37.492292', '118.243017', '东营市利二路贵州茅台专卖店', '利津县中信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (482, '2213063200001', '河北省', '保定市', '安新县', '保定市安新县建设大街266号', '38.945761', '115.932655', '安新县建设大街贵州茅台酱香系列酒体验中心', '安新县江轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (483, '134340621001', '安徽省', '淮北市', '濉溪县', '淮北市濉溪县濉溪县国槐路西侧君悦澜山21#22#商114、115、116', '33.916336', '116.754181', '濉溪县国槐路贵州茅台专卖店', '濉溪县樽盛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (484, '136360485001', '江西省', '九江市', '浔阳区', '九江市浔阳区九江市浔阳浔阳西路恒大珑庭小区107.108.109门面', '29.711359', '115.962286', '九江市浔阳西路贵州茅台专卖店', '九江市玖盈商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (485, '2341062500001', '河南省', '鹤壁市', '淇滨区', '鹤壁市淇滨区黄河路与嵩山路交叉口向东50米路北', '35.7434', '114.303792', '鹤壁市黄河路茅台酱香万家共享主题终端', '鹤壁市淇滨区君诚酒业', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (486, '22530382001001', '云南省', '曲靖市', '麒麟区', '曲靖市麒麟区潇湘街道阳光社区南江花园寥廓南路704号', '25.4667', '103.7968', '麒麟区寥廓南路茅台酱香万家共享主题终端', '曲靖市尚锋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (487, '144441200004', '广东省', '肇庆市', '端州区', '肇庆市端州区星湖大道（4）26号号泰湖花园39-44幢首层23号商铺', '23.08836', '112.506261', '肇庆市星湖大道贵州茅台专卖店', '肇庆广盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (488, '141411384001', '河南省', '南阳市', '卧龙区', '南阳市卧龙区独山大道与信臣路口新城国际小区B幢一楼102、103、104房', '33.029354', '112.566422', '南阳市独山大道贵州茅台专卖店（新城国际小区B幢一楼102）', '南阳市银宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (489, '2123012110001', '黑龙江省', '哈尔滨市', '呼兰区', '哈尔滨市呼兰区建国街高峰商店楼二层三号', '45.985699', '126.601203', '哈尔滨市建国街哈尔滨市呼兰区天峰食品商店门店', '哈尔滨市呼兰区天峰食品商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (490, '111110226002', '北京市', '北京市', '平谷区', '北京市平谷区新源南路6号', '39.947789', '116.455235', '北京市新源南路贵州茅台总经销店', '中安国信（北京）贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (491, '2341152900001', '河南省', '信阳市', '平桥区', '信阳市平桥区新十-大道东方-品门面房', '32.135205', '114.110615', '信阳市新十一大道茅台酱香万家共享主题终端', '信阳鑫华沛岑实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (492, '22510528008001', '四川省', '泸州市', '龙马潭区', '泸州市龙马潭区四川省泸州市龙马潭区蜀泸大道一段101号', '28.913221', '105.437765', '蜀泸大道1段茅台酱香万家共享主题终端', '泸州金中亿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (493, '22411000005001', '河南省', '许昌市', '东城区', '许昌市东城区建安大道与魏文路交叉口帕拉帝奥小区南门1908号', '34.04', '113.86', '东城区建安大道茅台酱香万家共享主题终端', '许昌嘉丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (494, '144441322001', '广东省', '汕头市', '潮阳区', '汕头市潮阳区海门镇磊海路北侧临街楼2栋8号铺', '23.205859', '116.636861', '汕头市磊海路贵州茅台专卖店', '汕头市大通盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (495, '153532721001', '云南省', '普洱市', '思茅区', '普洱市思茅区茶苑路34号', '22.759367', '100.973745', '普洱市茶苑路贵州茅台专卖店', '普洱市思茅区福华酱酒商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (496, '115153003001', '内蒙古自治区', '兴安盟', '乌兰浩特市', '兴安盟乌兰浩特市君御华庭二期北8#-2号门市', '46.087115', '122.041956', '乌兰浩特市铁西北路贵州茅台专卖店', '兴安盟金叶商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (497, '2334012800001', '安徽省', '合肥市', '庐江县', '合肥市庐江县庐城镇汤池路6号盛世莲花17号商104号房', '31.257737', '117.275541', '庐江县庐城镇茅台酱香万家共享主题终端', '巢湖市陈义兴商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (498, '137370181002', '山东省', '济南市', '章丘区', '济南市章丘区福康路中康明德府北门商铺7号楼1单元负一层-101铺', '36.706999', '117.50564', '济南市福康路贵州茅台专卖店', '山东共合贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (499, '2337070000003', '山东省', '潍坊市', '高新区', '潍坊市高新区华怡街永惠路东100米路北', '36.711053', '119.205853', '潍坊市华怡街茅台酱香万家共享主题终端', '潍坊御酒坊经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (500, '22410183004001', '河南省', '郑州市', '新密市', '郑州市新密市河南省新密市东大街与新惠街交叉口东150米路北茅台酱香万家共享', '34.536784', '113.39923', '新密市东大街茅台酱香万家共享主题终端', '新密市市区天成元烟酒批发部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (501, '165650300001', '新疆维吾尔自治区', '石河子市', '石河子市', '石河子市石河子市石河子市44小区万达商业街36栋8号', '44.284613', '86.072256', '石河子市万达商业街贵州茅台专卖店', '石河子市金源广泽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (502, '22441909005001', '广东省', '东莞市', '东莞', '东莞市东莞南城街道金丰路12号129室', '23.005712', '113.719615', '东莞市南城街道茅台酱香万家共享主题终端', '东莞市坤鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (503, '22110105074001', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区来广营乡新生村（朝来花卉市场院内）', '40.031005', '116.442991', '朝阳区来广营路茅台酱香万家共享主题终端', '北京盛扬国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (504, '2337070000006', '山东省', '潍坊市', '奎文区', '潍坊市奎文区山东省潍坊市高新区高二路桃源街东北角', '36.709473', '119.246888', '潍坊路新华路茅台酱香万家共享主题终端', '潍坊润玉美经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (505, '144441723001', '广东省', '阳江市', '阳东区', '阳江市阳东区东城镇广雅东路138号敏捷东樾府26栋101铺', '21.865718', '112.035065', '阳江市雅东路贵州茅台专卖店', '阳江市欣源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (506, '23373101004005', '山东省', '滨州市', '滨城区', '滨州市滨城区滨州市滨城区黄河六路渤海十一路东南角银联商城1号楼101，102，103，209沿街商铺', '37.383764', '117.998416', '滨城区黄河六路贵州茅台酱香系列酒体验中心', '滨州市壹玖商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (507, '2337070000005', '山东省', '潍坊市', '安丘市', '潍坊市安丘市新安街道大华中央城66-105.106号', '36.449599', '119.212368', '安丘市新安街道茅台酱香万家共享主题终端', '安丘市百汇烟酒门市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (508, '22510183001001', '四川省', '成都市', '邛崃市', '成都市邛崃市成都市邛崃市临邛镇邛窑大道南段38号一栋一层101号', '30.4', '103.44', '临邛镇邛窑大道南段茅台酱香万家共享主题终端', '成都贵台酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (509, '213130327001', '河北省', '秦皇岛市', '北戴河区', '秦皇岛市北戴河区金旭路五号', '39.820131', '119.531432', '秦皇岛市金旭路贵州茅台特约经销店', '全国人大机关服务中心北戴河休养院', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (510, '22511182003001', '四川省', '乐山市', '市中区', '乐山市市中区四川省乐山市市中区通悦路41号', '103.755153', '29.60039', '市中区通悦路茅台酱香万家共享主题终端', '乐山市顺君商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (511, '151510184001', '四川省', '成都市', '崇州市', '成都市崇州市崇庆街道江源南路89、91、93号', '30.619279', '103.690858', '崇州市江源南路贵州茅台专卖店', '成都市文敏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (512, '2252240101001', '贵州省', '遵义市', '习水县', '遵义市习水县习酒大道东城悦府2-1-74', '28.304921', '106.211142', '习酒大道悦府广场贵州茅台酱香系列酒体验中心', '贵州省仁怀市恒源泉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (513, '151510700001', '四川省', '绵阳市', '涪城区', '绵阳市涪城区塘汛北街77号中玮海润城12栋1层4、5、6号', '31.40561', '104.790603', '绵阳市塘汛北街贵州茅台专卖店', '绵阳好玖要酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (514, '22440514001001', '广东省', '汕头市', '潮南区', '汕头市潮南区城南街道新华大道东侧大南地段裕通花园西区第1幢首层商场101号', '23.246274', '116.622544', '潮阳区城南街道新华大道茅台酱香万家共享主题终端', '汕头市华恒昌贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (515, '2311010100002', '北京市', '北京市', '朝阳区', '北京市朝阳区慧忠里103楼1层103-8', '40.002218', '116.406979', '北京市慧忠里茅台酱香万家共享主题终端', '北京紫酒隆酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (516, '2113060110001', '河北省', '保定市', '竞秀区', '保定市竞秀区祥园路77号', '38.28', '114.48', '保定市祥园路保定达人商贸有限公司门店', '保定达人商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (517, '134341324001', '安徽省', '宿州市', '泗县', '宿州市泗县运河街道汴河大道登达新天地小区S4#楼113铺', '33.48198', '117.908039', '泗县汴河大道贵州茅台专卖店', '泗县和旨思成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (518, '22520327000001', '贵州省', '遵义市', '凤冈县', '遵义市凤冈县贵州省遵义市凤冈县龙泉街道龙凤大道绿城中央花园一期2号楼1层1-13号门面', '27.939913', '107.717427', '龙泉街道龙凤大道茅台酱香万家共享主题终端', '凤冈县斌兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (519, '2253010000001', '云南省', '昆明市', '官渡区', '昆明市官渡区巫家路中南云境2期3栋公寓S5-S6号商铺', '24.998682', '102.747604', '昆明市巫家坝路贵州茅台酱香系列酒体验中心', '昆明昀厚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (520, '2342010000002', '湖北省', '武汉市', '武昌区', '武汉市武昌区武汉市洪山区卓刀泉南路与雄楚大道交叉口', '30.507823', '114.366571', '武汉市卓刀泉南路茅台酱香万家共享主题终端', '武汉茅和五商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (521, '22500800004001', '重庆市', '重庆市', '渝北区', '重庆市渝北区两江新区金渝大道83号附44号', '29.647407', '106.566118', '两江新区金渝大道茅台酱香万家共享主题终端', '重庆酒魁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (522, '530125002', '云南省', '昆明市', '宜良县', '昆明市宜良县宜良县匡远街道五百户营蓬莱大道689号商铺', '24.929712', '103.150328', '昆明辰酱商贸有限公司中心库', '昆明辰酱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (523, '211110300002', '北京市', '北京市', '大兴区', '北京市大兴区北环东路3号2号楼1至2层8号', '39.809045', '116.505916', '北京市北环东路贵州茅台43度经销店', '北京一品江山贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (524, '133330282002', '辽宁省', '沈阳市', '于洪区', '沈阳市于洪区细河南路175号8门9门10门', '41.747272', '123.3215', '沈阳市细河南路贵州茅台专卖店', '沈阳隆茗惠商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (525, '250500103001', '重庆市', '重庆市', '渝中区', '重庆市渝中区瑞天路188号', '29.554129', '106.502967', '重庆市瑞天路贵州茅台专卖店', '重庆糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (526, '161612401001', '陕西省', '安康市', '汉滨区', '安康市汉滨区育才西路116号', '32.683216', '109.024193', '安康市育才西路贵州茅台专卖店', '安康市兴泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (527, '245450983001', '广西壮族自治区', '玉林市', '玉州区', '玉林市玉州区玉东大道161号得利广场3幢8-10号', '22.663838', '110.192614', '玉林市玉东大道贵州茅台专卖店', '玉林市品正商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (528, '132321185001', '江苏省', '镇江市', '润州区', '镇江市润州区中山北路8号13幢 紫阳花园门面', '32.209346', '119.423221', '镇江市中山北路贵州茅台专卖店', '江苏省华茂贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (529, '22520225003001', '贵州省', '六盘水市', '六枝特区', '六盘水市六枝特区健康路F栋', '26.2162', '105.4536', '六枝特区健康路茅台酱香万家共享主题终端', '贵州镇将军酒业有限公司六枝分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (530, 'B32010400101', '江苏省', '南京市', '秦淮区', '南京市秦淮区南京市秦淮汉中路89号金鹰国际购物中心A座1楼茅台冰淇淋', '32.041094', '118.780708', '南京市秦淮汉中路89号贵州茅台旗舰店', '江苏茅二代食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (531, '123230600004', '黑龙江省', '大庆市', '龙凤区', '大庆市龙凤区金融东街42号44号（新村程宇中心广场）', '46.583901', '125.114253', '大庆市金融东街贵州茅台专卖店', '大庆济源经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (532, '123230600001', '黑龙江省', '大庆市', '萨尔图区', '大庆市萨尔图区纬七路135号', '46.598463', '125.119169', '大庆市纬七路贵州茅台专卖店', '大庆世纪华龙经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (533, '2341070000001', '河南省', '新乡市', '红旗区', '新乡市红旗区金穗大道紫金广场B区商铺2-5号', '35.295714', '113.909272', '新乡市金穗大道茅台酱香万家共享主题终端', '新乡市华豫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (534, '22460100034001', '海南省', '海口市', '龙华区', '海口市龙华区金宇街道侨中路碧湖家园8-9号', '20.013', '110.323', '龙华区金垦路茅台酱香万家共享主题终端', '海南明胜发贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (535, '2341070000002', '河南省', '新乡市', '牧野区', '新乡市牧野区北干道366号10号楼西数1单元西数第二户营业房', '35.317477', '113.891366', '新乡市北干道茅台酱香万家共享主题终端', '河南盛世天翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (536, 'B32010400100', '江苏省', '南京市', '江宁区', '南京市江宁区南京江宁区苍穹路15号丰泰产业园顺丰物流', '31.765468', '118.802101', '南京市江宁区苍穹路15号丰泰产业园顺丰物流贵州茅台旗舰店总库', '江苏茅二代食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (537, '2151010010004', '四川省', '成都市', '武侯区', '成都市武侯区长华路27号、29号、31号', '30.611023', '104.084948', '成都市长华路四川省百酒堂酒业有限公司门店', '四川省百酒堂酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (538, '2361273400001', '陕西省', '榆林市', '榆阳区', '榆林市榆阳区肤施路中段129号', '38.275022', '109.762322', '榆林市肤施路中段茅台酱香万家共享主题终端', '榆林市华兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (539, '2133050010001', '浙江省', '湖州市', '吴兴区', '湖州市吴兴区凤凰路80-88号', '30.88071', '120.10257', '湖州市凤凰路湖州酒米塔酒业有限公司门店', '湖州酒米塔酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (540, '22522201008001', '贵州省', '铜仁市', '碧江区', '铜仁市碧江区川硐麒龙国际A1区1—72号', '27.796889', '109.226045', '碧江区桃源大道启德路茅台酱香万家共享主题终端', '贵州铜仁君竹酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (541, '2133050010002', '浙江省', '湖州市', '德清县', '湖州市德清县武康街道中兴南路329号', '30.529698', '119.969599', '德清县中兴南路德清泓源酒业有限公司门店', '德清泓源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (542, '141410200002', '河南省', '开封市', '龙亭区', '开封市龙亭区城乡一体化示范区郑开大道28号迪臣世博广场B座109-110铺', '34.802656', '114.294955', '开封市郑开大道贵州茅台专卖店', '开封市华兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (543, '150500112006', '重庆市', '重庆市', '渝北区', '重庆市渝北区龙山街道天竺路59号兴茂盛世北辰B4幢门面', '29.585336', '106.487659', '重庆市天竺路贵州茅台自营店', '重庆国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (544, '141410200003', '河南省', '开封市', '龙亭区', '开封市龙亭区晋安路蓝天中央公园1号商住楼1-2层103号', '34.796893', '114.322992', '开封市晋安路贵州茅台专卖店', '开封市锦泓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (545, '150500112001', '重庆市', '重庆市', '渝北区', '重庆市渝北区宝圣湖街道食品城大道18号附15号', '29.647173', '106.607674', '重庆市食品城大道贵州茅台专卖店', '重庆市润鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (546, '150500112002', '重庆市', '重庆市', '开州区', '重庆市开州区文峰街道滨湖东路173号/174号/175号', '31.183112', '108.430512', '重庆市滨湖东路贵州茅台专卖店', '重庆熙晋酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (547, '232320582001', '江苏省', '苏州市', '张家港市', '苏州市张家港市杨舍镇振兴中路3号梁丰机械B幢', '31.891694', '120.534308', '杨舍镇振兴中路贵州茅台43度经销店', '张家港保税区众士达国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (548, '2151010010002', '四川省', '成都市', '高新区', '成都市高新区世纪城路198号附107', '30.559549', '104.0756', '成都市世纪城路成都市双流区昌衡酒水商贸部门店', '双流区昌衡酒水商贸部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (549, '2341133000001', '河南省', '南阳市', '桐柏县', '南阳市桐柏县桐柏县大禹路与桐银路交叉口往西250米聚河大酒店往北50米', '32.374275', '113.42327', '桐柏县大禹路茅台酱香万家共享主题终端', '桐柏金达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (550, '162620128001', '甘肃省', '兰州市', '西固区', '兰州市西固区福利东路2057号附1号', '36.083098', '103.658204', '兰州市福利东路贵州茅台专卖店', '兰州酱酒传承商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (551, '163630100008', '青海省', '西宁市', '城西区', '西宁市城西区西川南路53号副2号53-77号', '36.63663', '101.721047', '西宁市西川南路贵州茅台自营店', '青海国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (552, '225500810001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵州省贵阳市观山湖区云潭路西侧银海元隆熙府商业街C1-1-4和C1-1-5', '26.631706', '106.614927', '贵阳市观山湖区云潭路贵州茅台酱香系列酒体验中心', '贵阳嘉元惠沣贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (553, 'B42010400101', '湖北省', '武汉市', '硚口区', '武汉市硚口区武汉市硚口区京汉大道668号武汉恒隆广场商场B1层B101F号铺位', '30.577836', '114.273801', '武汉市硚口区京汉大道668号场商场贵州茅台旗舰店', '武汉五十三度冰食品管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (554, '163630100002', '青海省', '西宁市', '城北区', '西宁市城北区海西路55号', '36.653375', '101.722433', '西宁市美丽水街贵州茅台专卖店', '西宁金泉贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (555, 'B52010300400', '贵州省', '贵阳市', '南明区', '贵阳市南明区贵州省贵阳市南明区保利·国贸逸天城外场一楼133号', '26.562742', '106.72339', '贵阳市保利·国贸逸天城外场贵州茅台旗舰店总库', '贵州爱斯可瑞食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (556, '144441900006', '广东省', '东莞市', '东莞', '东莞市东莞大朗镇富丽东路163号', '22.947803', '113.919869', '东莞市富丽东路贵州茅台专卖店', '东莞市东茅御液酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (557, '144441900007', '广东省', '东莞市', '东莞', '东莞市东莞松山湖高新区研发五路 1号 1栋 107-108 室', '22.95999711659824', '113.88503399272919', '东莞市研发五路贵州茅台专卖店', '东莞市澄诺百货有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (558, '163630100001', '青海省', '西宁市', '城西区', '西宁市城西区胜利路22号/地矿中心4号楼一楼', '36.631476', '101.766202', '西宁市胜利路贵州茅台专卖店', '青海井源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (559, 'B52010300401', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区贵州省贵阳市南明区保利·国贸逸天城外场一楼133号茅台冰淇淋贵阳旗舰店', '26.598515', '106.756113', '贵阳市云岩区渔安街道贵州茅台旗舰店', '贵州爱斯可瑞食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (560, '144441900002', '广东省', '东莞市', '东莞', '东莞市东莞南城区簪花路华凯豪庭C座首层贵州茅台店', '23.019812', '113.758938', '东莞市簪花路贵州茅台专卖店', '东莞市池丰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (561, '22520300075001', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区新中街道中建锦阅2号楼底商负2—41商铺', '27.67951', '107.02744', '珠海路万豪国际茅台酱香万家共享主题终端', '贵州遵义神华食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (562, '143431000001', '湖南省', '郴州市', '北湖区', '郴州市北湖区涌泉街道柏树路下社区万华路99号万华金世纪商业街4栋105-106-107', '25.751678', '113.004237', '郴州市柏树路贵州茅台专卖店', '郴州市日升酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (563, '144441900003', '广东省', '东莞市', '东莞', '东莞市东莞莞城区东纵路40号（丰华广场4号商业楼103-106号铺）', '23.037486', '113.773588', '东莞市东纵路贵州茅台专卖店', '东莞市东桥贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (564, '144441900004', '广东省', '东莞市', '东莞', '东莞市东莞东城街道东城东路16号（新世界花园御景台1栋106号）', '23.019777', '113.784264', '东莞市东城东路贵州茅台专卖店', '东莞市东田百货有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (565, '2665010001301', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '乌鲁木齐市头屯河区黄山街81号一品九点阳光7号公寓楼底商7-109', '43.856132', '87.523456', '头屯河区黄山街茅台酱香万家共享主题终端', '新疆奋强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (566, '2250010300001', '重庆市', '重庆市', '渝北区', '重庆市渝北区北部新区金开大道瑞香路99号附5号', '29.632114', '106.534106', '重庆市金开大道贵州茅台酱香系列酒体验中心', '重庆集雅酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (567, '2346003600001', '海南省', '琼中黎族苗族自治县', '琼中黎族苗族自治县', '琼中黎族苗族自治县琼中黎族苗族自治县海榆路万福隆商厦首层3号', '19.036322', '109.837884', '琼中县海榆路茅台酱香万家共享主题终端', '海南丰达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (568, '100152801001', '内蒙古自治区', '巴彦淖尔市', '临河区', '巴彦淖尔市临河区塞北街欧洲假日C10号楼102号门店', '40.771623', '107.408895', '巴彦淖尔市塞北街贵州茅台专卖店', '巴彦淖尔市得祥酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (569, '2341020300001', '河南省', '开封市', '市辖区', '开封市市辖区五大街东方今典南门向西150米路北', '34.8044437545077', '114.257529526948', '开封市五大街茅台酱香万家共享主题终端', '开封市楠靖商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (570, '2311010800001', '北京市', '北京市', '昌平区', '北京市昌平区朱辛庄安居路6号院底商华致酒库', '40.104523', '116.316778', '北京市朱辛庄茅台酱香万家共享主题终端', '北京腾远华茂商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (571, '23532132001003', '云南省', '昭通市', '昭阳区', '昭通市昭阳区云南省昭通市昭阳区龙泉街道官坝路凤凰香榭1期23幢1-S107号', '27.350292', '103.709467', '昭通市官坝路贵州茅台酱香系列酒体验中心', '昭通市靖和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (572, '34110105099007001', '湖南省', '衡阳市', '石鼓区', '衡阳市石鼓区1', '26.944257', '112.597937', '衡阳市石鼓区今典酒业中心库', '衡阳市石鼓区今典酒业', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (573, '2161010010001', '陕西省', '西安市', '雁塔区', '西安市雁塔区科技二路65号启迪科技园G座-楼', '34.225919', '108.883994', '西安市科技二路陕西华鼎酒业有限公司门店', '陕西华鼎酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (574, '22110105094001', '北京市', '北京市', '西城区', '北京市西城区黄寺大街23号院1号楼1层105号', '39.963219', '116.386651', '西城区黄寺大街茅台酱香万家共享主题终端', '北京永杰利贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (575, '2341023000002', '河南省', '开封市', '尉氏县', '开封市尉氏县尉氏县汇金华府B区5-13号', '34.431327', '114.181434', '尉氏县汇金华府茅台酱香万家共享主题终端', '河南合强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (576, '133330485001', '浙江省', '嘉兴市', '秀洲区', '嘉兴市秀洲区新城街道中山西路920号', '30.757471', '120.70887', '嘉兴市中山西路贵州茅台专卖店', '嘉兴茅五剑商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (577, '213130483002', '河北省', '邯郸市', '丛台区', '邯郸市丛台区滏河北大街688号', '36.64624', '114.51733', '邯郸市滏河北大街贵州茅台专卖店', '邯郸市丛台区新誉德贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (578, '135350681001', '福建省', '漳州市', '龙海市', '漳州市龙海市石码镇平宁路9号祥云豪庭34-36', '24.438482', '117.807466', '漳州市平宁路贵州茅台专卖店', '龙海市海沁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (579, '22440423001001', '广东省', '珠海市', '斗门区', '珠海市斗门区白蕉路东第花园二期3109号', '22.225739', '113.315102', '斗门区白蕉路茅台酱香万家共享主题终端', '珠海市华侨酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (580, '144441900011', '广东省', '东莞市', '东莞', '东莞市东莞常平镇新城大道华建半岛豪庭', '22.967577', '114.006687', '东莞市新城大道贵州茅台专卖店', '东莞市臻茅食品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (581, '22441901002001', '广东省', '东莞市', '东莞', '东莞市东莞东城街道星城社区庆峰花园转角商铺7－8号铺', '23.036', '113.8078', '东莞市东城街道茅台酱香万家共享主题终端', '东莞市茅园贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (582, '22321403003001', '江苏省', '泰州市', '泰兴市', '泰州市泰兴市江苏省泰州市泰兴市国庆东路2号3室（延令）', '32.168787', '120.035796', '泰兴市国庆东路茅台酱香万家共享主题终端', '泰兴市瑞久源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (583, '511700001', '四川省', '达州市', '通川区', '达州市通川区通川区莲花湖片区莲湖印象商业22幢1-13', '31.237854', '107.458819', '四川省中极实业有限公司中心库', '四川省中极实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (584, '2361070000001', '陕西省', '汉中市', '汉台区', '汉中市汉台区汉台区首席壹号商铺', '33.065717', '107.042313', '汉中市首席壹号茅台酱香万家共享主题终端', '汉中桃心岛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (585, '135350600002', '福建省', '漳州市', '芗城区', '漳州市芗城区通北街道大通北路66-11号', '24.516287', '117.650999', '漳州市大通北路贵州茅台专卖店', '漳州市玖恒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (586, '2162232810001', '甘肃省', '武威市', '凉州区', '武威市凉州区祁连大道669-1号', '37.934492', '102.615001', '武威市祁连大道武威市益民商贸有限责任公司门店', '武威市益民商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (587, '133330219001', '浙江省', '宁波市', '余姚市', '宁波市余姚市阳明东路95号', '30.04932', '121.160724', '余姚市阳明东路贵州茅台专卖店', '余姚市阳明茅台酒专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (588, '164642300001', '宁夏回族自治区', '固原市', '原州区', '固原市原州区西城街与中心路道路交叉口西南侧荣华文化商业广场荣华桂园7号商业公寓楼108-112', '36.006167', '106.276783', '固原市西城街贵州茅台专卖店', '银川市子坤商务实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (589, '233331084001', '浙江省', '台州市', '椒江区', '台州市椒江区江滨路691号', '28.682068', '121.434855', '台州市江滨路贵州茅台专卖店', '浙江省台州市惠丰工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (590, '131310115005', '上海市', '上海市', '浦东新区', '上海市浦东新区浦东大道1395号', '31.242972', '121.535699', '上海市浦东大道贵州茅台专卖店', '上海集玉进出口有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (591, '144441900013', '广东省', '东莞市', '东莞', '东莞市东莞虎门镇滨海大道57号', '22.822098', '113.691572', '东莞市滨海大道贵州茅台专卖店', '广东共好商业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (592, '131310115003', '上海市', '上海市', '奉贤区', '上海市奉贤区望园南路1799弄11号1层', '30.918769', '121.486701', '上海市望园南路贵州茅台专卖店', '上海晶曦贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (593, '141410900002', '河南省', '濮阳市', '华龙区', '濮阳市华龙区人民路与开州路交叉口西300米路南88号公馆1号楼03门市', '35.761071', '115.021538', '濮阳市人民路贵州茅台专卖店', '濮阳市星海商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (594, '152522626002', '贵州省', '黔东南苗族侗族自治州', '岑巩县', '黔东南苗族侗族自治州岑巩县新兴大道75号贵宝花园门面', '27.171932', '108.813581', '岑巩县新兴大道贵州茅台专卖店', '黔东南鸿玺酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (595, '165654121003', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁市', '伊犁哈萨克自治州伊宁市伊宁市新华西路以北、规划六路以东银河国际五号楼一层101-2', '43.910419', '81.263439', '伊宁市新华西路贵州茅台专卖店', '伊犁兴州糖烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (596, '241410825001', '河南省', '焦作市', '温县', '焦作市温县司马大街懿品学府营销中心', '34.949462', '113.065757', '温县司马大街贵州茅台专卖店', '温县富生荣商业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (597, '22140186002001', '山西省', '太原市', '小店区', '太原市小店区小店街道高级技术人员公寓西区412号商铺', '37.7449', '112.5775', '小店区真武路茅台酱香万家共享主题终端', '山西富得源电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (598, '144441900009', '广东省', '东莞市', '东莞', '东莞市东莞寮步镇香市路宏华大厦109号', '22.995374', '113.872883', '东莞市香市路贵州茅台专卖店', '东莞市庄胜酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (599, '21370200020021', '山东省', '青岛市', '李沧区', '青岛市李沧区山东省青岛市李沧区黑龙江中路480-66号', '36.185843', '120.425871', '青岛盛鑫亿达商贸有限公司', '青岛盛海峰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (600, '100610100003', '陕西省', '西安市', '雁塔区', '西安市雁塔区科技二路65号（清华科技园G座）', '34.22571', '108.884271', '西安市科技二路贵州茅台专卖店', '陕西华鼎酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (601, '22370700008001', '山东省', '潍坊市', '奎文区', '潍坊市奎文区奎文区胜利街与潍州路交叉口西100米路北（东苑公园对面）', '36.707016', '119.119499', '奎文区胜利街茅台酱香万家共享主题终端', '山东和晟达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (602, '22211300001001', '辽宁省', '朝阳市', '双塔区', '朝阳市双塔区辽宁省朝阳市双塔区龙腾大街288号', '41.60401', '120.495674', '双塔区龙腾大街贵州茅台酱香系列酒体验中心', '朝阳市宏程商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (603, '121211100001', '辽宁省', '沈阳市', '大东区', '沈阳市大东区沈铁路90号1漳', '41.835812', '123.488422', '沈阳市沈铁路贵州茅台专卖店', '辽宁广利祺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (604, '121211100005', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区石化路蓝色康桥N区', '41.122099', '122.10786', '盘锦市石化路贵州茅台专卖店', '沈阳盛京优选超市连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (605, '121211100004', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区友谊街与青年路交汇处中誉玖郡', '41.101938', '122.102231', '盘锦市友谊街贵州茅台专卖店', '盘锦伟华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (606, '121211100003', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区利港银河新城一期（商业广场）14-15号商网', '41.109124', '122.066446', '盘锦市泰山北路贵州茅台专卖店', '盘锦四季商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (607, '137370800001', '山东省', '济宁市', '任城区', '济宁市任城区常青路', '35.426594', '116.58049', '济宁市常青路贵州茅台专卖店', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (608, '165654121001', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁市', '伊犁哈萨克自治州伊宁市伊宁市经济合作区北京路3222号一品墅A1号商业楼101号', '43.914377', '81.258918', '伊宁市北京路贵州茅台专卖店', '伊犁惠佳商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (609, '242420128001', '湖北省', '武汉市', '江岸区', '武汉市江岸区武汉市后湖大道335号', '30.654222', '114.313487', '武汉市后湖大道贵州茅台专卖店', '湖北华中糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (610, '2252273400401', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市沙包堡街道西山大道中段34号香山里商业1层12号', '26.27215', '107.50809', '都匀市西山大道贵州茅台酱香系列酒体验中心', '黔南州永麟星商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (611, '145450323001', '广西壮族自治区', '桂林市', '灵川县', '桂林市灵川县银渠路聚龙欣城7号8号商铺', '25.38986', '110.317801', '灵川县银渠路贵州茅台专卖店', '灵川县国泰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (612, '100131081001', '河北省', '廊坊市', '霸州市', '廊坊市霸州市胜芳镇新华园S3-1-107', '39.081449', '116.70731', '霸州市胜富路贵州茅台专卖店', '霸州京友颢达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (613, '152522425002', '贵州省', '毕节市', '织金县', '毕节市织金县双堰街道桐兴苑小区商业一层1-12号门面', '26.684528', '105.786492', '织金县三甲大道贵州茅台专卖店', '织金县清兴酒业销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (614, '151513901002', '四川省', '资阳市', '雁江区', '资阳市雁江区国际商贸城一期195号、197号', '30.104332', '104.631392', '资阳市书台路贵州茅台专卖店', '资阳市宏源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (615, '244440685001', '广东省', '佛山市', '禅城区', '佛山市禅城区同济东路66号11号商铺', '23.016768', '113.135726', '佛山市同济东路贵州茅台专卖店', '佛山市吉利贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (616, '261610129002', '陕西省', '西安市', '莲湖区', '西安市莲湖区报恩寺街88号303-1号', '34.252311', '108.933269', '西安市报恩寺街贵州茅台专卖店', '西安成城裕朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (617, '2344020000004', '广东省', '韶关市', '武江区', '韶关市武江区芙蓉东路6号万通国际花园A座-2层1号商铺', '24.793755', '113.589512', '韶关市芙蓉东路茅台酱香万家共享主题终端', '韶关市好客贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (618, '2344550400001', '广东省', '珠海市', '香洲区', '珠海市香洲区高新区鼎兴路266号商铺', '22.400827', '113.540385', '珠海市高新区茅台酱香万家共享主题终端', '珠海市拓展花茶有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (619, '137373100001', '山东省', '济南市', '莱芜区', '济南市莱芜区龙潭东大街141号(滨河花苑东门)', '36.225127', '117.736225', '济南市龙潭东大街贵州茅台专卖店', '山东莱芜鲁源名酒经营有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (620, '261610129001', '陕西省', '西安市', '雁塔区', '西安市雁塔区高新区丈八北路万科翡翠国宾中央区5幢3单元30101、30210号', '34.208124', '108.874467', '西安市丈八北路贵州茅台专卖店', '西安春禾酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (621, '113130700001', '河北省', '张家口市', '宣化区', '张家口市宣化区南关桥西街34号', '40.600186', '115.061443', '张家口市南关桥西街贵州茅台专卖店', '张家口市糖酒副食有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (622, '134342430001', '安徽省', '六安市', '金安区', '六安市金安区六安市金安区地矿华府西北门', '31.739546', '116.528069', '六安市佛子岭路贵州茅台专卖店', '安徽省六安市津茂糖酒销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (623, '34410100087028001', '河南省', '济源市', '济源市', '济源市济源市1', '35.069057', '112.602347', '济源市辰瑶百货商行中心库', '济源市辰瑶百货商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (624, '243430100002', '湖南省', '长沙市', '开福区', '长沙市开福区新河街道开福寺东路166-171号（天健芙蓉盛世三期9栋）', '28.223378', '112.985193', '长沙市开福寺东路贵州茅台专卖店', '湖南省糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (625, '2362292100001', '甘肃省', '临夏回族自治州', '临夏市', '临夏回族自治州临夏市东区街道庆胜东路百益城11-1商铺', '35.3631', '103.1314', '临夏市东区街道茅台酱香万家共享主题终端', '临夏市泰昊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (626, '162622836001', '甘肃省', '庆阳市', '西峰区', '庆阳市西峰区安化东路豪庭春天南门西侧50米', '35.713694', '107.651436', '庆阳市西峰区安化东路贵州茅台专卖店', '庆阳云峰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (627, '131310115001', '上海市', '上海市', '浦东新区', '上海市浦东新区锦安东路46号', '31.205113', '121.540134', '上海市锦安东路贵州茅台专卖店', '上海国酒缘贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (628, '137371584001', '山东省', '聊城市', '东昌府区', '聊城市东昌府区建设路董付路交叉口东南角', '36.472696', '116.019729', '聊城市建设路贵州茅台专卖店', '临清市大家庭糖酒茶副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (629, '23370200025026', '山东省', '青岛市', '黄岛区', '青岛市黄岛区山东省青岛市黄岛区隐珠街道崇文路186号商业', '35.893121', '120.044677', '黄岛区崇文路贵州茅台酱香系列酒体验中心', '青岛福红宇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (630, '2214060000001', '山西省', '朔州市', '朔城区', '朔州市朔城区豪德贸易广场三期八街1号', '39.325178', '112.407119', '朔州市豪德贸易广场贵州茅台酱香系列酒体验中心', '朔州市壹贰叁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (631, '2344020000002', '广东省', '韶关市', '武江区', '韶关市武江区沿江路16号南枫碧水花城二期L2幢-1层48号商铺', '24.7751787437039', '113.582400086767', '韶关市沿江路茅台酱香万家共享主题终端', '韶关市前茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (632, '2361272400001', '陕西省', '榆林市', '榆阳区', '榆林市榆阳区肤施路263号', '38.271499', '109.763145', '榆林市肤施路茅台酱香万家共享主题终端', '榆林市鑫诚隆瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (633, '224113020001', '河南省', '南阳市', '宛城区', '南阳市宛城区范蠡东路与独山大道交叉口向西300米路南玉龙苑小区楼下', '33.016963', '112.563509', '南阳市宛城区范蠡东路贵州茅台酱香系列酒体验中心', '南阳市银宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (634, '520382890001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区金清大道京东电子商务产业园区2号库17号门', '27.79165', '106.400342', '贵州茅台酒厂（集团）保健酒业销售有限公司', '贵州茅台酒厂（集团）保健酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (635, '330200019', '浙江省', '舟山市', '定海区', '舟山市定海区双桥街道石礁社区三农路1号(舟山三农农产品批发市场内4层2幢2-4-001室)', '30.018788', '122.034313', '舟山市新协贸易有限公司中心库', '舟山市新协贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (636, '2222050000001', '吉林省', '通化市', '东昌区', '通化市东昌区江南大街中东不夜城2期2-49号', '41.708744', '125.933439', '通化市江南大街贵州茅台酱香系列酒体验中心', '通化市麦德林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (637, '2337078600001', '山东省', '潍坊市', '昌邑市', '潍坊市昌邑市交通街155号', '36.845465', '119.054931', '昌邑市交通街茅台酱香万家共享主题终端', '山东潍坊五谷酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (638, '34410100087008001', '河南省', '许昌市', '市辖区', '许昌市市辖区1', '34.767052', '113.753094', '许昌市东城区志建名烟名酒商贸行中心库', '许昌市东城区志建名烟名酒商贸行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (639, '212120111003', '天津市', '天津市', '西青区', '天津市西青区大寺镇津港公路东侧龙居花园一区12—9—101A区', '39.019647', '117.244725', '天津市青宝路贵州茅台43度经销店', '天津酒合久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (640, '212120111001', '天津市', '天津市', '南开区', '天津市南开区万兴街怀安环路景域名邸1号楼', '39.123613', '117.158695', '天津市怀安环路贵州茅台专卖店', '天津品高商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (641, 'B31010106605', '上海市', '上海市', '黄浦区', '上海市黄浦区上海市黄浦区南京东路步行街 ', '31.23262', '121.482874', '上海市上海市黄浦区南京东路步行街贵州茅台体验店', '上海茅小凌餐饮管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (642, '2137078710001', '山东省', '潍坊市', '青州市', '潍坊市青州市海岱中路新世纪花园1869号', '36.688547', '118.495998', '青州市海岱中路青州市易兴酒业有限公司门店', '青州市易兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (643, 'B31010106604', '上海市', '上海市', '普陀区', '上海市普陀区上海市普陀区岚皋西路60号1层', '31.247944', '121.423728', '上海市岚皋西路60号1层贵州茅台体验店', '上海茅小凌餐饮管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (644, 'B31010106603', '上海市', '上海市', '闵行区', '上海市闵行区上海市闵行区井亭天地（韩国街）广13号铺面', '31.169308', '121.374024', '上海市井亭天地（韩国街）广13号铺面贵州茅台体验店', '上海茅小凌餐饮管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (645, 'B31010106602', '上海市', '上海市', '长宁区', '上海市长宁区上海市长宁区龙之梦购物中心一楼红厅C位', '31.218845', '121.416483', '上海市长宁区龙之梦购物中心一楼红厅C位贵州茅台体验店', '上海茅小凌餐饮管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (646, 'B31010106601', '上海市', '上海市', '黄浦区', '上海市黄浦区上海市黄浦区复兴中路523弄16号102室', '31.214968', '121.468536', '上海市黄浦区复兴中路523贵州茅台旗舰店', '上海茅小凌餐饮管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (647, '143430381001', '湖南省', '湘潭市', '岳塘区', '湘潭市岳塘区建设路街道河东大道20号中地凯旋城一区商业C栋0101003、0101004、0201003、0201004号门面', '27.836246', '112.927386', '湘潭市建设路贵州茅台专卖店', '湖南贤聚商贸有限公司湘潭分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (648, '2350010800001', '重庆市', '重庆市', '南岸区', '重庆市南岸区揽湖路77号、79号', '29.530632', '106.538661', '重庆市揽湖路茅台酱香万家共享主题终端', '重庆贵诚商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (649, 'B31010106600', '上海市', '上海市', '青浦区', '上海市青浦区上海市青浦区香大路885号', '31.206986', '121.10609', '上海市上海市青浦区香大路885号贵州茅台旗舰店总库', '上海茅小凌餐饮管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (650, '141410185001', '河南省', '郑州市', '登封市', '郑州市登封市少林大道汉武路交叉口东南角峰创福晟园配套商业1单元1层101', '34.453047', '113.087396', '登封市少林大道贵州茅台专卖店', '登封市福佑商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (651, '34321326002087001', '四川省', '成都市', '高新区', '成都市高新区四川省成都市高新区益州大道中段599号13栋附7号', '30.556327', '104.057324', '四川华玖汇贸易有限公司中心库', '四川华玖汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (652, '533600001', '云南省', '西双版纳傣族自治州', '景洪市', '西双版纳傣族自治州景洪市庄董东路南亚春天住宅小区1幢122-123号', '21.970528', '100.81577', '西双版纳童州经贸有限公司中心库', '西双版纳童州经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (653, '132320900001', '江苏省', '盐城市', '亭湖区', '盐城市亭湖区东进路与六合路交汇处42幢104室', '33.368766', '120.172858', '盐城市东进路贵州茅台专卖店', '盐城捷强酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (654, '135350587001', '福建省', '泉州市', '丰泽区', '泉州市丰泽区中骏广场8号楼117、118、119、120、160店', '24.889864', '118.618303', '泉州市津淮街贵州茅台专卖店', '泉州豪嘉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (655, '22410189010001', '河南省', '郑州市', '金水区', '郑州市金水区河南省郑州市金水区红专路56号附6号', '34.780056', '113.679762', '金水区红专路茅台酱香万家共享主题终端', '郑州市泸凯贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (656, '144440688001', '广东省', '佛山市', '南海区', '佛山市南海区大沥镇黄岐建设大道1号中海金沙湾商务休闲中心1号楼首层自编108-109号单元', '23.141106', '113.203913', '佛山市黄岐建设大道贵州茅台专卖店（中海金沙湾）', '佛山市玖之源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (657, '22650124001001', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '乌鲁木齐市新市区高新区(新市区)四平路2572号文光尚都小区1栋1层3号商铺', '43.896379', '87.588995', '新市区四平路茅台酱香万家共享主题终端', '乌鲁木齐玖泰德盛贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (658, '132320686001', '江苏省', '南通市', '崇川区', '南通市崇川区人民中路228号-8-9', '32.022814', '120.897719', '南通市人民中路贵州茅台专卖店', '南通益统糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (659, '137370783002', '山东省', '潍坊市', '寿光市', '潍坊市寿光市广场街3909号（中央花园商铺）', '36.879075', '118.745899', '寿光市广场街贵州茅台专卖店', '寿光银丽工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (660, '143432501001', '湖南省', '娄底市', '娄星区', '娄底市娄星区吉星南路(乐坪东街以北城发·星庭）2栋108-110号门面', '27.724809', '112.028045', '娄底市吉星南路贵州茅台专卖店', '娄底金香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (661, '143432501002', '湖南省', '娄底市', '娄星区', '娄底市娄星区大科街道新星南路建设街233号', '27.702804', '112.007759', '娄底市新星南路贵州茅台专卖店', '娄底市华蓝贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (662, '123230189001', '黑龙江省', '哈尔滨市', '松北区', '哈尔滨市松北区聚源街51号', '45.80963', '126.54006', '哈尔滨市聚源街贵州茅台专卖店', '哈尔滨市华天酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (663, '22410929004001', '河南省', '安阳市', '文峰区', '安阳市文峰区文峰大道安阳迎宾馆一层23号商铺', '36.096197', '114.412254', '文峰区文峰大道茅台酱香万家共享主题终端', '安阳鸿睿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (664, '252520188001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区金阳街道石林路国喜中心建设项目二期工程第8幢1单元1层1号，2号，6号', '26.614134', '106.614201', '贵阳市石林路贵州茅台专卖店', '贵州仁源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (665, '252520188003', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区林城路与西二环交叉口北侧中海映山湖城市综合体B组团S9-1-8/9/10', '26.644347', '106.668562', '贵阳市林城路贵州茅台专卖店', '贵阳金阳鑫麟贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (666, '2144540010001', '广东省', '潮州市', '潮安区', '潮州市潮安区潘刘村中心路中段潮州市腾远贸易有限公司', '23.601922', '116.639433', '潮州市中心路潮州市腾远贸易有限公司门店', '潮州市腾远贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (667, '252520188008', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵州省贵阳市观山湖区长岭北路贵阳国际会议展览中心D区D2栋附1层2号', '26.639338', '106.647555', '贵阳市会展东路贵州茅台专卖店', '贵州盐业（集团）有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (668, '23623200001001', '甘肃省', '酒泉市', '肃州区', '酒泉市肃州区甘肃省酒泉市肃州区解放北路229号1—8号门店', '39.713362', '98.508256', '肃州区解放北路贵州茅台酱香系列酒体验中心', '酒泉恒生实业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (669, '252520188009', '贵州省', '贵阳市', '白云区', '贵阳市白云区贵阳市白云区云环路757号优品新城2-3栋负1层3-5号', '26.681191', '106.610956', '贵阳市云环路贵州茅台专卖店', '贵阳酉时辰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (670, '442001001', '广东省', '中山市', '中山市', '中山市中山市古镇镇新兴中路242号首层之一', '22.613431', '113.190785', '中山市瀛聚贸易有限公司中心库', '中山市瀛聚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (671, '2152252710001', '贵州省', '安顺市', '普定县', '安顺市普定县城关镇富强路18号附9号', '26.305554', '105.745069', '普定县富强路普定县云鑫烟酒经销店门店', '普定县云鑫烟酒经销店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (672, '141410325001', '河南省', '洛阳市', '西工区', '洛阳市西工区八一路18-6', '34.670214', '112.440678', '洛阳市八一路贵州茅台专卖店', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (673, '136360200001', '江西省', '景德镇市', '珠山区', '景德镇市珠山区新村西路金桂园2栋5-7号', '29.305847', '117.21187', '景德镇市新村西路贵州茅台专卖店', '景德镇市益民糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (674, '115150200003', '内蒙古自治区', '包头市', '青山区', '包头市青山区钢铁大街7号正翔国际广场23-101、23-102号', '40.65788', '109.867332', '包头市钢铁大街贵州茅台专卖店', '内蒙古中饮诚汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (675, '2341142100001', '河南省', '商丘市', '民权县', '商丘市民权县庄周大道与消防南路交汇路北', '34.65038', '115.155643', '民权县庄周大道茅台酱香万家共享主题终端', '民权县绿洲宏发保真超市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (676, '142420586001', '湖北省', '宜昌市', '伍家岗区', '宜昌市伍家岗区伍家岗区伍家岗街道白沙路8-28-88号', '30.640071', '111.352081', '宜昌市白沙路贵州茅台专卖店', '宜昌紫晶商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (677, '2244098100001', '广东省', '茂名市', '茂南区', '茂名市茂南区站北-路27号4-9号商铺', '21.651577', '110.905623', '茂名市站北一路贵州茅台酱香系列酒体验中心', '茂名市盈大商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (678, '115150200001', '内蒙古自治区', '包头市', '昆都仑区', '包头市昆都仑区团结大街8号街坊瀚星御府2-S108/2-S109', '40.670991', '109.832428', '包头市团结大街贵州茅台专卖店', '内蒙古中饮诚汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (679, '137371331001', '山东省', '临沂市', '罗庄区', '临沂市罗庄区盛庄街道沂州路与沂河路交汇北300米路东', '35.018012', '118.354978', '临沂市沂州路贵州茅台专卖店', '临沂鼎天名品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (680, '34620100010001', '山东省', '淄博市', '桓台县', '淄博市桓台县中心大街946号', '36.959279', '118.095251', '淄博金涵商业有限公司中心库', '淄博金涵商业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (681, '2261033200101', '陕西省', '宝鸡市', '市辖区', '宝鸡市市辖区高新区高新大道盛景大厦01号商铺', '34.347057', '107.222099', '高新区高新大道贵州茅台酱香系列酒体验中心', '宝鸡市汇德商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (682, '654129001', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁市', '伊犁哈萨克自治州伊宁市解放路64号', '43.921344', '81.322594', '伊犁兴州糖烟酒有限责任公司中心库', '伊犁兴州糖烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (683, '252520188012', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区金朱东路“书香苑”小区项目S1层21号', '26.655934', '106.636609', '贵阳市金朱东路贵州茅台专卖店', '贵州欣晨嘉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (684, '165653131001', '新疆维吾尔自治区', '喀什地区', '喀什市', '喀什地区喀什市多来特巴格乡十八村朝阳路182号（佳和大厦）1幢1层S01号', '39.453941', '76.061783', '喀什市朝阳路贵州茅台专卖店', '喀什月勤商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (685, '2545090000601', '广西壮族自治区', '玉林市', '玉州区', '玉林市玉州区双拥路39号东盛华府商住小区东盛大厦1层商场', '22.655875', '110.182135', '玉州区双拥路贵州茅台酱香系列酒体验中心', '玉林市酒协酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (686, '22642300001001', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区兴庆区湖滨东路184号', '38.4692985', '106.2796349', '兴庆区湖滨东街茅台酱香万家共享主题终端', '银川市子坤商务实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (687, '264640124001', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区新华东街东方悦小区42号楼—101', '38.450024', '106.319823', '银川市新华东街贵州茅台专卖店', '宁夏骏达糖酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (688, '143430722002', '湖南省', '常德市', '鼎城区', '常德市鼎城区玉霞街道临沅路356号', '29.018456', '111.688518', '常德市临沅路贵州茅台专卖店', '湖南芷侨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (689, '112120102002', '天津市', '天津市', '河西区', '天津市河西区南京路66号凯旋门大厦1层', '39.11458', '117.21665', '天津市南京路贵州茅台自营店', '天津国酒茅台有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (690, '264640124003', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区民族北街443号玺悦大厦贵州茅台酱香系列酒体验中心', '38.499749', '106.291258', '宁夏银川民族北街443号贵州茅台43度经销（茅台酒）', '宁夏玲珑贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (691, '23330800002003', '浙江省', '衢州市', '柯城区', '衢州市柯城区新河沿24-28号', '28.964157', '118.8713', '柯城区新河沿路贵州茅台酱香系列酒体验中心', '衢州市金叶商厦有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (692, '100320300001', '江苏省', '徐州市', '云龙区', '徐州市云龙区解放南路27号-3', '34.260983', '117.19194', '徐州市解放南路贵州茅台专卖店', '徐州市华夏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (693, '532600001', '云南省', '文山壮族苗族自治州', '文山市', '文山壮族苗族自治州文山市开化街道螺峰社区秀峰路118号五楼', '23.367681', '104.236222', '文山市三南商贸有限公司中心库', '文山市三南商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (694, '34410194005030001', '河南省', '郑州市', '市辖区', '郑州市市辖区河南自贸试验区郑州片区（经开）第四大街与经北二路交叉口蓬勃大厦701号', '34.758582', '113.776853', '郑州元睿酒业有限公司中心库', '郑州元睿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (695, '137371122002', '山东省', '日照市', '莒县', '日照市莒县青岛路沭河华府沿街楼110室', '35.589899', '118.865568', '莒县青岛路贵州茅台专卖店', '日照市悠然贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (696, '22510105002013', '四川省', '成都市', '双流区', '成都市双流区四川省成都市双流区双华路三段邻里中心科技企业孵化园区2栋105', '30.535867', '103.972546', '双流区双华路三段茅台酱香万家共享主题终端', '四川壹捌捌酒贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (697, '161610624001', '陕西省', '延安市', '安塞区', '延安市安塞区福源大厦A区4号，5号门面', '36.857066', '109.33087', '延安市福源大厦贵州茅台专卖店', '延安润源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (698, '137370100007', '山东省', '济南市', '历下区', '济南市历下区龙奥北路8号7号楼104', '36.651822', '117.125485', '济南市龙奥北路贵州茅台自营店', '山东国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (699, '137370100006', '山东省', '济南市', '历下区', '济南市历下区花园东路3699号新悦广场107、106号', '36.692329', '117.104049', '济南市花园路东贵州茅台专卖店', '山东共合贸易有限公司济南第二分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (700, '121211282001', '辽宁省', '铁岭市', '开原市', '铁岭市开原市新城街地王国花园新华路31-1', '42.546905', '124.038163', '开原市新华路贵州茅台专卖店', '开原盛华食品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (701, '137370100005', '山东省', '济南市', '历下区', '济南市历下区姚家街道工业南路与齐音路交叉口南行100米路东尊邸花园S1栋商铺101(贵州茅台专卖店）', '36.676568', '117.106521', '济南市工业南路贵州茅台专卖店', '山东鲁供糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (702, '164640127001', '宁夏回族自治区', '银川市', '金凤区', '银川市金凤区福州南街城市春天4-101号房贵州茅台专卖店', '38.472033', '106.190538', '银川市福州南街贵州茅台专卖店', '宁夏伊特商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (703, '137370100004', '山东省', '济南市', '历城区', '济南市历城区华龙路665号华信综合楼1-2-101', '36.681479', '117.087805', '济南市华龙路贵州茅台专卖店', '济南市正昕贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (704, '134340129001', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区高新区天智路同创科技园2号楼101室', '31.831296', '117.207593', '合肥市天智路贵州茅台专卖店', '安徽瑛诚能源科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (705, '22110105082001', '北京市', '北京市', '朝阳区', '北京市朝阳区东四环南路9号燕莎奥特莱斯C座南门', '39.876946', '116.486708', '朝阳区东四环南路茅台酱香万家共享主题终端', '北京酒等了商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (706, 'B22010400101', '吉林省', '长春市', '朝阳区', '长春市朝阳区长春市朝阳区开运街5178号欧亚卖场10号门一层茅台冰淇淋商铺', '43.841986', '125.242876', '长春市朝阳区开运街5178号贵州茅台旗舰店', '吉林省创美甄选商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (707, '223625010001', '江西省', '抚州市', '临川区', '抚州市临川区高新技术产业开发区海瑞公馆1号楼1层1-4号房', '27.965298', '116.377686', '临川区南门路贵州茅台酱香系列酒体验中心', '抚州品诚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (708, '2113058310001', '河北省', '邢台市', '信都区', '邢台市信都区建设路秀兰北小区门口底商东50米', '37.054324', '114.485341', '邢台市桥建设路东区丝雨烟酒门市门店', '桥东区丝雨烟酒门市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (709, '234340126001', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区阜阳北路与北城大道交叉口向西300米工投创智天地产业园公祖房一楼贵州茅台专卖店', '31.951574', '117.267325', '合肥市北城大道贵州茅台专卖店', '安徽省稻香楼实业开发中心有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (710, '2137040010001', '山东省', '枣庄市', '市中区', '枣庄市市中区西昌路齐村镇卫生院东北50米', '34.876628', '117.53101', '枣庄市西昌路山东万兴商贸有限公司门店', '山东万兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (711, '213130986001', '河北省', '沧州市', '运河区', '沧州市运河区新华西路北侧宏宇城A区10号商业网点107店', '38.314448', '116.824441', '沧州市新华西路贵州茅台43度经销店', '沧州市盛世酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (712, '244441383001', '广东省', '惠州市', '惠城区', '惠州市惠城区斑樟湖路56号永和苑第3栋1层03-04号', '23.07401', '114.4256', '惠州市斑樟湖路贵州茅台专卖店', '惠州万家糖烟酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (713, '2333080000002', '浙江省', '衢州市', '柯城区', '衢州市柯城区花园东大道3、5号', '28.976154', '118.869976', '衢州市花园东大道茅台酱香万家共享主题终端', '衢州市金叶商厦有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (714, '2241030000001', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区永泰街泉舜沁泉苑1号楼13,23-24铺', '34.612967', '112.450652', '洛阳市永泰街贵州茅台酱香系列酒体验中心', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (715, '2111010610004', '北京市', '北京市', '丰台区', '北京市丰台区银地家园4号楼商业1层03号', '39.823338', '116.333037', '北京市银地家园北京市坤丰益酒业有限公司门店', '北京市坤丰益酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (716, '2333080000003', '浙江省', '衢州市', '衢江区', '衢州市衢江区宾港北路31-1号，31-2号', '28.975511', '118.944731', '衢州市滨港北路茅台酱香万家共享主题终端', '衢州唯真酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (717, '145450500001', '广西壮族自治区', '北海市', '海城区', '北海市海城区广东路68号', '21.478527', '109.127717', '北海市广东路贵州茅台专卖店', '北海市甘美之贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (718, '2241030000005', '河南省', '洛阳市', '西工区', '洛阳市西工区中州中路319号金水湾大酒店旁', '34.671146', '112.440904', '洛阳市中州中路贵州茅台酱香系列酒体验中心', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (719, '144440681001', '广东省', '佛山市', '顺德区', '佛山市顺德区容桂风华路21座6-9号铺', '22.758115', '113.280358', '佛山市风华路贵州茅台专卖店', '佛山市顺德明瀚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (720, '232320126002', '江苏省', '南京市', '雨花台区', '南京市雨花台区凤台南路150号B座102室', '31.995879', '118.75215', '南京市凤台南路贵州茅台专卖店', '南京迪可酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (721, '232320126003', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区小市街道北祥路69-40.69-41.69-42号', '32.096489', '118.779128', '南京市北祥路贵州茅台专卖店', '南京迪歌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (722, '24610101001010', '陕西省', '西安市', '市辖区', '西安市市辖区唐延南路都市之门D座2幢1单元10110室', '34.196678', '108.889088', '西安仟鼎实业有限公司中心库', '西安仟鼎实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (723, '231310108002', '上海市', '上海市', '静安区', '上海市静安区灵石路716号C1幢111室', '31.282004', '121.439011', '上海市灵石路贵州茅台专卖店', '上海炜瑞酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (724, '2642030000401', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区五堰街办宜昌路8号3幢1-1', '32.646478', '110.782104', '茅箭区宜昌路茅台酱香万家共享主题终端', '十堰市酒类专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (725, '231310108005', '上海市', '上海市', '嘉定区', '上海市嘉定区塔秀路188号106室', '31.35048', '121.259716', '上海市塔秀路贵州茅台专卖店', '上海云飞酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (726, '2144138310001', '广东省', '惠州市', '惠城区', '惠州市惠城区金山湖大道浩盛嘉泽园5栋一层4号商铺', '23.056141', '114.441371', '惠州市金山湖大道惠州市远卓贸易有限公司门店', '惠州市远卓贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (727, '144440600003', '广东省', '佛山市', '顺德区', '佛山市顺德区乐从镇乐从社区居委会佛山新城汾江南路235号依云国际财富中心6座1、2号铺', '22.964294', '113.105843', '佛山市汾江南路贵州茅台专卖店', '佛山市中茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (728, '224102020001', '河南省', '开封市', '龙亭区', '开封市龙亭区一大街西湖印象11号楼1-2层05铺', '34.814501', '114.277744', '开封市龙亭区一大街贵州茅台酱香系列酒体验中心', '河南喜洋洋永盛实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (729, '144440600002', '广东省', '佛山市', '南海区', '佛山市南海区桂城街道海五路6号城智大厦102室', '23.055404', '113.137652', '佛山市海五路贵州茅台专卖店', '佛山巷子深贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (730, '2242013300001', '湖北省', '武汉市', '武昌区', '武汉市武昌区东湖路(省博湖北日报C出口)', '30.566379', '114.364788', '武汉市东湖路贵州茅台酱香系列酒体验中心', '武汉江城国商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (731, '110108084', '北京市', '北京市', '海淀区', '北京市海淀区花园北路35号9号楼7层702单元', '39.982521', '116.366158', '朗知逢知己商贸（北京）有限公司中心库', '朗知逢知己商贸（北京）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (732, '235350500002', '福建省', '泉州市', '安溪县', '泉州市安溪县凤城镇龙飞路34号、36号', '25.048219', '118.188514', '安溪县凤城镇龙飞路贵州茅台专卖店', '福建省臻醇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (733, '235350500001', '福建省', '泉州市', '鲤城区', '泉州市鲤城区清濛科技工业区德泰路188号', '24.872799', '118.560608', '泉州市德泰路贵州茅台专卖店', '泉州市嘉太中外名酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (734, '22530100060001', '云南省', '昆明市', '西山区', '昆明市西山区前卫街道办事处南坝社区居委会谭家营桂花苑小区14-1号商铺', '25.0044', '102.7122', '西山区希望路茅台酱香万家共享主题终端', '昆明昀厚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (735, '22510100024001', '四川省', '成都市', '青羊区', '成都市青羊区四川省成都市青羊区清江东路122号1栋1层附9号', '30.66842', '104.033927', '清江东路茅台酱香万家共享主题终端', '成都威斯特营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (736, '132320682003', '江苏省', '南通市', '如皋市', '南通市如皋市海阳路57号海陵大厦104、105室', '32.383001', '120.569343', '如皋市海阳路贵州茅台专卖店', '如皋市平凡贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (737, '231081001', '黑龙江省', '牡丹江市', '绥芬河市', '牡丹江市绥芬河市北山区301国道北，珠江路东，凯丰公司集资楼附属工程5-101', '44.398091', '131.111756', '绥芬河市洋帆商贸有限公司中心库', '绥芬河市洋帆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (738, '252520100001', '贵州省', '贵阳市', '白云区', '贵阳市白云区中天金融国际城B9', '26.673727', '106.655432', '贵阳市云博路贵州茅台专卖店', '贵州盛世仁博商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (739, '241410187001', '河南省', '郑州市', '新密市', '郑州市新密市平安路西侧金海洋房9号楼1-2层', '34.538596', '113.356753', '郑州市平安路贵州茅台专卖店', '郑州恒利酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (740, '241410187002', '河南省', '郑州市', '二七区', '郑州市二七区金沙江路北、大学路西《泰宏建业国际商业中心三区》1-119/120', '34.679169', '113.642807', '郑州市金沙江路贵州茅台专卖店', '河南京糖实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (741, '2344540400002', '广东省', '潮州市', '湘桥区', '潮州市湘桥区潮州大道北段759号恒发花园沿街门市06-07号（中国工商银行潮州分行西北侧约70米）', '23.660365', '116.618254', '潮州市潮州大道茅台酱香万家共享主题终端', '潮州市云瑞来贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (742, '252520100004', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区青岩镇北街村委会1层1号（青岩北城门青岩寻坊旅游综合体项目13组团）', '26.335007', '106.689537', '贵阳市北街贵州茅台专卖店', '贵州鑫瑞樽品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (743, '2344540400003', '广东省', '潮州市', '潮安区', '潮州市潮安区金石镇潮汕公路s233省道与金石大道路交界南侧金石商贸城A2-11店面', '23.528115', '116.634397', '潮州市金石商贸城茅台酱香万家共享主题终端', '潮州市云瑞来贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (744, 'B12010400701', '天津市', '天津市', '南开区', '天津市南开区天津市南开区南门外大街大悦城购物中心2F-D01d号商铺', '39.135229', '117.180171', '天津市南开区南门外大街贵州茅台旗舰店', '缤淇淋供应链管理（天津）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (745, '225303820001', '云南省', '曲靖市', '麒麟区', '曲靖市麒麟区白石江街道保渡社区紫云首府1幢11-13号', '25.500304', '103.813699', '曲靖市紫云路贵州茅台酱香系列酒体验中心', '曲靖市尚锋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (746, '22370183005001', '山东省', '济南市', '天桥区', '济南市天桥区明湖北路1号', '36.68', '117.03', '天桥区明湖北路茅台酱香万家共享主题终端', '山东香飘四海商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (747, '137370300003', '山东省', '淄博市', '淄川区', '淄博市淄川区松龄路街道淄城路341号', '36.664427', '117.98383', '淄博市松龄路贵州茅台专卖店', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (748, '142421122001', '湖北省', '黄冈市', '红安县', '黄冈市红安县一桥东万锦城小区9栋13-14铺', '31.282996', '114.611993', '红安县万锦城商业街贵州茅台专卖店', '红安博维商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (749, '2344030900001', '广东省', '深圳市', '龙岗区', '深圳市龙岗区园山街道广达路40号', '22.655564', '114.210561', '深圳市园山街道茅台酱香万家共享主题终端', '深圳昌盛酱香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (750, '2352022500001', '贵州省', '六盘水市', '六枝特区', '六盘水市六枝特区矿业路8号附1号', '27.252769', '105.932433', '六盘水市矿业路茅台酱香万家共享主题终端', '贵州镇将军酒业有限公司六枝分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (751, '225202010001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区凉都大道中段234号101铺', '26.570738', '104.874645', '六盘水市钟山区凉都大道贵州茅台酱香系列酒体验中心', '六盘水仁强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (752, '137370300001', '山东省', '淄博市', '张店区', '淄博市张店区人民西路164甲7', '36.815281', '118.017251', '淄博市人民西路贵州茅台专卖店', '淄博昌悦商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (753, '137370782002', '山东省', '潍坊市', '诸城市', '潍坊市诸城市东关大街与枫香路交叉路口（枫香小镇综合商业楼）', '35.9746602', '119.4159606', '诸城市东关大街贵州茅台专卖店', '诸城市百龙名酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (754, '123230884001', '黑龙江省', '佳木斯市', '前进区', '佳木斯市前进区佳木斯前进区滨江路金港湾小区一期259号', '46.819973', '130.383584', '佳木斯市滨江路贵州茅台专卖店', '佳木斯佳兴名酒专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (755, '2344540400004', '广东省', '潮州市', '潮安区', '潮州市潮安区彩塘镇往潮州方向新安大道新联路段520号康华酒店楼下', '23.508728', '116.644606', '潮州市彩塘镇新联路茅台酱香万家共享主题终端', '潮州市云瑞来贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (756, 'B12010400700', '天津市', '天津市', '东丽区', '天津市东丽区天津市东丽区保税路255号普洛斯空港物流园B2', '39.133998', '117.390707', '天津市保税路255号普洛斯空港物流园B2贵州茅台旗舰店总库', '缤淇淋供应链管理（天津）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (757, '134342531001', '安徽省', '宣城市', '绩溪县', '宣城市绩溪县龙川大道414号', '30.066598', '118.577274', '绩溪县龙川大道贵州茅台专卖店', '绩溪县金钰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (758, '4201000301', '湖北省', '武汉市', '武昌区', '武汉市武昌区红盛路汉飞·滨江国际1楼街边商铺', '30.591307', '114.341078', '武汉市红盛路贵州茅台专卖店', '湖北人人大经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (759, '330188002001', '浙江省', '杭州市', '上城区', '杭州市上城区清波道中山中路55号、57号', '30.239485', '120.170827', '杭州市中山中路贵州茅台文化体验馆', '物产中大云商有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (760, '23320100039040', '江苏省', '南京市', '建邺区', '南京市建邺区江苏省南京市建邺区燕山路169号101室', '32.003729', '118.721552', '建邺区燕山路贵州茅台酱香系列酒体验中心', '南京国策酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (761, '113131100001', '河北省', '衡水市', '桃城区', '衡水市桃城区人民西路万信紫金广场底商1239号', '37.738612', '115.659789', '衡水市人民西路贵州茅台专卖店', '衡水晨峰酒业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (762, '2136250110001', '江西省', '抚州市', '临川区', '抚州市临川区高新区东旭公园懿品13#1-12室', '27.969764', '116.38759', '抚州市公园懿品抚州品诚酒业有限公司门店', '抚州品诚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (763, '2337010000003', '山东省', '济南市', '高新区', '济南市高新区天辰路2177号联合财富广场2号楼北斗新时空产业园109号', '36.65243', '116.903366', '济南市天辰路茅台酱香万家共享主题终端', '山东德诚宝真酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (764, '2337010000002', '山东省', '济南市', '历下区', '济南市历下区龙奥北路8号7号楼102室', '36.683644', '116.941499', '济南市龙奥北路茅台酱香万家共享主题终端', '山东德诚宝真酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (765, '252520100016', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区漁安安井片区未来方舟D12（圣道郡）A栋1单元5层7号', '26.592975', '106.763654', '贵阳市北京东路贵州茅台43度经销店', '贵州福国仁酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (766, '22120225003001', '天津市', '天津市', '蓟州区', '天津市蓟州区中昌北大道安裕新村东口北60米路西', '40.038238', '117.418626', '蓟州区中昌北大道茅台酱香万家共享主题终端', '天津嘉裕秉盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (767, '34110105099017001', '广东省', '梅州市', '梅江区', '梅州市梅江区1', '24.31065', '116.116686', '梅州市金达贸易有限公司中心库', '梅州市金达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (768, '133330400002', '浙江省', '嘉兴市', '南湖区', '嘉兴市南湖区由拳路219号聚成大厦', '30.733688', '120.734115', '嘉兴市由拳路贵州茅台专卖店', '嘉兴宏强酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (769, '22220800002001', '吉林省', '白城市', '洮北区', '白城市洮北区民生东路32楼-2', '45.36', '122.5', '洮北区民生东路茅台酱香万家共享主题终端', '白城市复兴商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (770, '114142625001', '山西省', '太原市', '晋源区', '太原市晋源区西寨南街与健康西路交叉口西南角丰沃悦湖城8号楼底商5-6号', '37.764161', '112.52581', '太原市健康西路贵州茅台专卖店', '山西春晓大地商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (771, '2213098600001', '河北省', '沧州市', '运河区', '沧州市运河区朝阳中街塞纳左岸住宅小区A10#商业楼1层106铺', '38.282888', '116.836128', '沧州市朝阳中街贵州茅台酱香系列酒体验中心', '沧州久润酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (772, '22430203001001', '湖南省', '株洲市', '天元区', '株洲市天元区嵩山路街道庐山路7号华晨庐山春天大厦102-1号及夹层商铺', '27.837979', '113.120198', '天元区嵩山路街道庐山路茅台酱香万家共享主题终端', '湖南吉昌盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (773, '2352020100001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区凉都明珠项目9号楼104铺', '26.57304', '104.85561', '六盘水市凉都明珠茅台酱香万家共享主题终端', '贵州兴盛智宸商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (774, '34321326002089001', '广东省', '湛江市', '赤坎区', '湛江市赤坎区广东省湛江市赤坎区海田路5号华盛新城二期7、8幢一层02号铺  ', '21.281027', '110.376124', '湛江市赤坎区醇诚食品经营部中心库', '湛江市赤坎区醇诚食品经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (775, '241411500001', '河南省', '信阳市', '平桥区', '信阳市平桥区新七大道锦江城三期29号楼101号', '32.141165', '114.130591', '信阳市新七大道贵州茅台专卖店', '信阳国际大酒店有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (776, '134340133001', '安徽省', '合肥市', '包河区', '合肥市包河区嵩山路725号时代城S1幢105商业', '31.743806', '117.315106', '合肥市嵩山路贵州茅台专卖店', '安徽友谊名品酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (777, '99902061', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (778, '134340133002', '安徽省', '合肥市', '包河区', '合肥市包河区滨湖和园安置小区东侧天山路段103商铺', '31.739865', '117.296625', '合肥市天山路贵州茅台专卖店', '安徽友玖优玖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (779, '224107020001', '河南省', '新乡市', '红旗区', '新乡市红旗区高新区科隆大道新谊城南门258号门面房', '35.274679', '113.889569', '新乡市高新区科隆大道贵州茅台酱香系列酒体验中心', '河南盛世天翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (780, '520101001', '贵州省', '贵阳市', '市辖区', '贵阳市市辖区贵州省贵阳市贵阳国家高新技术产业开发区长岭南路', '0.0', '0.0', '贵州金浩田房地产开发有限公司中心库', '贵州金浩田房地产开发有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (781, '530900001', '云南省', '临沧市', '临翔区', '临沧市临翔区茶马古镇A26幢211号商铺', '23.865158', '100.101202', '临沧云华信商贸有限公司中心库', '临沧云华信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (782, '132320200001', '江苏省', '无锡市', '滨湖区', '无锡市滨湖区梁清路197号', '31.558735', '120.267719', '无锡市梁清路贵州茅台专卖店', '无锡市荣氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (783, '22410425001001', '河南省', '平顶山市', '郏县', '平顶山市郏县城关镇文化路与高寺东路交叉口向西100米路北', '33.96405', '113.21834', '郏县文化路茅台酱香万家共享主题终端', '平顶山市简正商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (784, '22373003006001', '山东省', '青岛市', '李沧区', '青岛市李沧区金水路2115-1号', '36.18', '120.41', '李沧区金水路茅台酱香万家共享主题终端', '山东泽龙供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (785, '2261010002001', '陕西省', '西安市', '雁塔区', '西安市雁塔区曲江新区曲江池东路1号万众国际1幢10141室', '34.19568', '108.98884', '曲江新区曲江池东路贵州茅台酱香系列酒体验中心', '西安恒丰酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (786, '22500101022001', '重庆市', '重庆市', '万州区', '重庆市万州区江南新区南滨上院B区17-1-16茅台王子酒门面', '30.805576', '108.378607', '万州区长江之星贵州茅台酱香系列酒体验中心', '重庆荣之和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (787, '34440300083003001', '贵州省', '贵阳市', '南明区', '贵阳市南明区贵州省贵阳市贵阳国家高新技术产业开发区毕节路58号联合广场1栋11层4号', '26.617939', '106.649722', '贵州华昱深黔酒业有限公司中心库', '贵州华昱深黔酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (788, '23420130004005', '湖北省', '武汉市', '武昌区', '武汉市武昌区湖北省武汉市武昌区杨园街道铁机路5、7号', '30.608698', '114.347146', '武汉市铁机路贵州茅台酱香系列酒体验中心', '武汉市武昌区茅乡缘烟酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (789, '262620200002', '甘肃省', '嘉峪关市', '市辖区', '嘉峪关市市辖区新华南路1669号一楼5号门点', '39.77124', '98.286483', '嘉峪关市新华南路贵州茅台专卖店', '嘉峪关国酒鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (790, '144440301001', '广东省', '深圳市', '南山区', '深圳市南山区南山街道南园社区南山大道（南园工业园二期）南园商业大厦一楼1039-3（A-2单元））', '22.516712', '113.920067', '深圳市南山大道贵州茅台专卖店', '深圳民众鑫贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (791, '2213018600001', '河北省', '石家庄市', '裕华区', '石家庄市裕华区翟营大街49号', '38.021541', '114.554586', '石家庄市翟营大街贵州茅台酱香系列酒体验中心', '石家庄市旭东糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (792, '262620200001', '甘肃省', '嘉峪关市', '市辖区', '嘉峪关市市辖区嘉峪关市驼铃路56号', '39.742056', '98.316928', '嘉峪关市驼铃路贵州茅台专卖店', '嘉峪关博鑫隆酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (793, '22530121001001', '云南省', '昆明市', '五华区', '昆明市五华区小康大道526号江东华龙人家16幢1单元103号', '25.1109', '102.7359', '五华区小康大道茅台酱香万家共享主题终端', '昆明宏烨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (794, '21410300002004', '河南省', '洛阳市', '偃师市', '洛阳市偃师市洛阳市偃师区槐新街道迎宾路与兴隆街交叉口兴盛华府一楼', '34.72559', '112.795051', '偃师区迎宾路茅台酱香万家共享主题终端', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (795, '111110106005', '北京市', '北京市', '丰台区', '北京市丰台区汽车博物馆东路8号院4号楼1层101', '39.823792', '116.303398', '北京市汽车博物馆东路贵州茅台专卖店', '北京龙平和晟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (796, '34410100087017001', '河南省', '南阳市', '邓州市', '南阳市邓州市1', '32.687732', '112.08745', '邓州市吴志奇副食店中心库', '邓州市吴志奇副食店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (797, '235350201004', '福建省', '厦门市', '思明区', '厦门市思明区湖滨北路159号-5', '24.487039', '118.117169', '厦门市湖滨北路贵州茅台专卖店', '厦门中钢商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (798, '2152242110001', '贵州省', '毕节市', '七星关区', '毕节市七星关区凤凰大道南光新城2-L1-4号', '27.28196', '105.282937', '毕节市凤凰大道茅台王子酒直营店', '贵州毕节千醇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (799, '111110106003', '北京市', '北京市', '丰台区', '北京市丰台区望园路9号院9-12至9-15', '39.873002', '116.284847', '北京市望园路贵州茅台专卖店', '北京玉笔馨欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (800, '22510122004001', '四川省', '成都市', '双流区', '成都市双流区双华路三段邻里中心科技企业孵化园区2栋105', '30.54', '103.97', '双流区双华路茅台酱香万家共享主题终端', '四川企联贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (801, '241411123001', '河南省', '漯河市', '召陵区', '漯河市召陵区燕山路尚东华府门面101号', '33.555377', '114.079801', '漯河市珠江路贵州茅台专卖店', '漯河盛林酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (802, '2351012300001', '四川省', '成都市', '天府新区', '成都市天府新区美岸路二段171号', '30.488474', '104.042301', '成都市美岸路茅台酱香万家共享主题终端', '四川万千集贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (803, '2365010000003', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '乌鲁木齐市水磨沟区南湖南路东四巷46号', '43.818635', '87.613369', '乌鲁木齐市南湖南路茅台酱香万家共享主题终端', '新疆国酒事业糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (804, '411103002', '河南省', '漯河市', '郾城区', '漯河市郾城区岷江路与黄山路交叉口西南角未来花园门面房3号', '33.598333', '114.019477', '漯河市霖钤商贸有限公司中心库', '漯河市霖钤商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (805, '2365010000001', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '乌鲁木齐市新市区北京南路623号', '43.855933', '87.564518', '乌鲁木齐市北京南路茅台酱香万家共享主题终端', '新疆国酒事业糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (806, '2365010000002', '新疆维吾尔自治区', '克拉玛依市', '克拉玛依区', '克拉玛依市克拉玛依区经四路160号-楼8号门面房', '45.532866', '84.92032', '克拉玛依市经四路茅台酱香万家共享主题终端', '新疆国酒事业糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (807, '22150132001001', '内蒙古自治区', '呼和浩特市', '赛罕区', '呼和浩特市赛罕区呼和浩特中级人民法院西侧金正大厦一层', '40.788252', '111.705929', '赛罕区昭乌达路茅台酱香万家共享主题终端', '内蒙古瑞达伟业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (808, '132320981001', '江苏省', '盐城市', '东台市', '盐城市东台市东台镇范公中路166号1101商铺', '32.85152', '120.331178', '盐城市范公中路贵州茅台专卖店', '东台市金典华致商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (809, '2213020000001', '河北省', '唐山市', '路北区', '唐山市路北区朝阳西道779号', '39.655282', '118.144243', '唐山市朝阳西道贵州茅台酱香系列酒体验中心', '唐山市和缘祥泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (810, '22410189013001', '河南省', '郑州市', '金水区', '郑州市金水区河南省郑州市郑东新区通泰路南段（小邢屯）东门70-6', '34.740699', '113.732668', '金水区通泰路茅台酱香万家共享主题终端', '河南综创商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (811, '134340225001', '安徽省', '芜湖市', '镜湖区', '芜湖市镜湖区赭山中路11号（赭麓公馆）', '31.345119', '118.384134', '芜湖市赭山中路贵州茅台专卖店', '安徽酒香四溢酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (812, '134340225002', '安徽省', '芜湖市', '弋江区', '芜湖市弋江区利民路与西干路交汇处', '31.312542', '118.397455', '芜湖市利民路贵州茅台专卖店', '芜湖市凯邦贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (813, '151510922001', '四川省', '遂宁市', '射洪市', '遂宁市射洪市新华下街179号', '30.857906', '105.390865', '射洪市滨江路贵州茅台专卖店', '遂宁市鼎泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (814, '136362201002', '江西省', '宜春市', '袁州区', '宜春市袁州区袁州大道818号汇丰中央城2栋1-2层2-4、2-5、2-6室', '27.790076', '114.428117', '宜春市袁州大道贵州茅台专卖店', '宜春市皓云贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (815, '123232800001', '黑龙江省', '大兴安岭地区', '加格达奇区', '大兴安岭地区加格达奇区黑龙江省大兴安岭地区加格达奇区朝阳路520号', '50.427207', '124.123184', '加格达奇区朝阳路贵州茅台专卖店', '大兴安岭恒丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (816, '144441581001', '广东省', '汕尾市', '陆丰市', '汕尾市陆丰市东海镇四十米大道银华路106-107号商铺（金驿家园1期）', '22.944776', '115.627728', '陆丰市银华路贵州茅台专卖店', '陆丰市煌明实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (817, '100530100004', '云南省', '昆明市', '五华区', '昆明市五华区丰宁街道虹山东路330-334号', '25.063077', '102.687731', '昆明市虹山东路贵州茅台专卖店', '昆明全兴利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (818, '22320300014001', '江苏省', '徐州市', '鼓楼区', '徐州市鼓楼区经开区软件园B1号107铺', '34.26944', '117.28907', '经开区软件园茅台酱香万家共享主题终端', '徐州市吉雅德贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (819, '246460102001', '海南省', '海口市', '美兰区', '海口市美兰区国兴大道22号富力首府B18-3商铺5单元105', '20.017213', '110.362285', '海口市国兴大道贵州茅台专卖店', '海口松旗酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (820, '165650200002', '新疆维吾尔自治区', '克拉玛依市', '克拉玛依区', '克拉玛依市克拉玛依区天盾花园宝石路311-2-107', '45.574476', '84.905237', '克拉玛依市宝石路贵州茅台专卖店', '克拉玛依市润生商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (821, '143430400004', '湖南省', '衡阳市', '珠晖区', '衡阳市珠晖区湖北路87号', '26.89112', '112.62207', '衡阳市湖北路贵州茅台专卖店', '衡阳市糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (822, '143430400003', '湖南省', '衡阳市', '蒸湘区', '衡阳市蒸湘区华兴街道光辉街7号金钟环球中心（金钟府）21栋101、103、104、105室', '26.883564', '112.563259', '衡阳市光辉街贵州茅台专卖店', '衡阳市糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (823, '251510187002', '四川省', '成都市', '金牛区', '成都市金牛区四川省成都市金牛区蜀西路60号1幢1层3、4、5、6、7号', '30.721278', '103.983099', '成都市蜀西路贵州茅台专卖店', '成都友邦联合科技发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (824, '100410500001', '河南省', '安阳市', '北关区', '安阳市北关区人民大道书香园小区1号楼104号', '36.110324', '114.357418', '安阳市人民大道贵州茅台专卖店', '河南锦泽源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (825, '234340300001', '安徽省', '蚌埠市', '蚌山区', '蚌埠市蚌山区延安路694号', '32.935446', '117.372497', '蚌埠市延安路贵州茅台专卖店', '蚌埠市益丰酒业食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (826, '143430400001', '湖南省', '衡阳市', '石鼓区', '衡阳市石鼓区人民街道解放路12号', '26.89681', '112.613714', '衡阳市解放路贵州茅台专卖店', '衡阳市糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (827, '34410100087005001', '河南省', '许昌市', '魏都区', '许昌市魏都区1', '34.047189', '113.830826', '许昌煜丰信息科技有限责任公司中心库', '许昌煜丰信息科技有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (828, '23440200006007', '广东省', '韶关市', '武江区', '韶关市武江区韶关市武江区韶关大道12号恒大城59幢P2商铺', '24.747891', '113.521556', '韶关市贵州茅台酱香系列酒体验中心', '韶关市好客贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (829, '141411081001', '河南省', '许昌市', '禹州市', '许昌市禹州市颍川街道建设路102号', '34.143596', '113.497874', '禹州市建设路贵州茅台专卖店', '禹州市恒立晟贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (830, '22520223006001', '贵州省', '六盘水市', '盘州市', '六盘水市盘州市亦资街道银杏广场四期1F-003', '25.690253', '104.46602', '盘州市亦资街道茅台酱香万家共享主题终端', '盘州市金泰源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (831, '22110106016001', '北京市', '北京市', '海淀区', '北京市海淀区高梁桥斜街42号院1号楼融汇国际大厦1层112号', '39.946656', '116.345509', '海淀区高梁桥斜街茅台酱香万家共享主题终端', '北京名家坊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (832, '22500700007001', '重庆市', '重庆市', '江北区', '重庆市江北区重庆市江北区观音桥街道洋河一路二村18号附50号', '29.581775', '106.529998', '江北区洋河一路茅台酱香万家共享主题终端', '重庆盛信天下酒仓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (833, '145450100010', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区合作路9号文莱园区商务写字楼C段C1-112号', '22.804948', '108.401995', '南宁市合作路贵州茅台自营店', '广西国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (834, '141410881002', '河南省', '济源市', '济源市', '济源市济源市宣化东街16号', '35.091808', '112.59546', '济源市宣化街贵州茅台专卖店', '济源市万隆烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (835, '145450100011', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区长虹路12号联发君澜一组团3号楼地下一层B110/B101/B111号商铺', '22.844302', '108.38634', '南宁市长虹路贵州茅台专卖店', '南宁市仁樽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (836, '165654001001', '新疆维吾尔自治区', '伊犁哈萨克自治州', '奎屯市', '伊犁哈萨克自治州奎屯市奎屯市团结南街46号1楼', '44.416481', '84.904639', '奎屯市团结南街贵州茅台专卖店', '新疆永振商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (837, '22110106016002', '北京市', '北京市', '丰台区', '北京市丰台区北京市丰台区五里店北里一区4号楼一层106', '39.863742', '116.262711', '丰台区卢沟桥路茅台酱香万家共享主题终端', '北京名家坊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (838, '145450100004', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区双拥路30号南湖名都广场B栋商场01号', '22.803915', '108.356124', '南宁市双拥路贵州茅台专卖店', '广西南宁海洋烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (839, '142420322001', '湖北省', '十堰市', '郧西县', '十堰市郧西县城关镇发展大道光彩物流中心C栋118-119-120', '33.019038', '110.405658', '郧西县发展大道贵州茅台专卖店', '湖北寿康永乐商贸集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (840, '22413100009001', '河南省', '济源市', '济源市', '济源市济源市黄河路泰宏天安写字楼一楼自西向东第10间', '35.07', '112.62', '济源市黄河大道茅台酱香万家共享主题终端', '济源市霖泓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (841, '237370183001', '山东省', '济南市', '市中区', '济南市市中区万达广场华景苑11号楼底商106号(万达商城北门对面)', '36.663406', '117.002744', '济南市中区麟祥街贵州茅台专卖店', '济南茶久香商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (842, '237370183002', '山东省', '济南市', '历下区', '济南市历下区解放东路以北、茂 岭山三号路以东中欧校友产业大厦111', '36.665165', '117.105302', '济南市解放东路贵州茅台专卖店', '山东银洋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (843, '100370700001', '山东省', '潍坊市', '奎文区', '潍坊市奎文区东风东街以北东方路以西富华锦光公寓东段 3 号', '36.715848', '119.164876', '潍坊市东风东街贵州茅台专卖店', '潍坊市禄德酒业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (844, '232320285001', '江苏省', '无锡市', '滨湖区', '无锡市滨湖区吴都雅园31-14', '31.48918', '120.326052', '无锡市和畅路贵州茅台专卖店', '无锡市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (845, '253530186005', '云南省', '昆明市', '官渡区', '昆明市官渡区关上街道办事处国贸路778号万裕君越兰庭B4号商铺', '25.010159', '102.738764', '昆明市国贸路贵州茅台专卖店', '昆明融展振富商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (846, '22340224001001', '安徽省', '芜湖市', '镜湖区', '芜湖市镜湖区安徽省芜湖市镜湖区赭山中路赭麓公馆S4-01', '31.34', '118.38', '赭山中路茅台酱香万家共享主题终端', '安徽酒香四溢酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (847, '151510122003', '四川省', '成都市', '双流区', '成都市双流区双流国际机场 T2航站楼DEP-R-9D', '30.570289', '103.95565', '成都市双流国际机场贵州茅台专卖店', '成都市华盛尚品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (848, '151510122002', '四川省', '成都市', '双流区', '成都市双流区华府大道二段265号', '30.525176', '104.039559', '成都市华府大道贵州茅台专卖店', '成都元泰明诚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (849, '2232140400002', '江苏省', '泰州市', '海陵区', '泰州市海陵区海陵北路196号-2、196号-3', '32.491593', '119.917181', '泰州市海陵北路贵州茅台酱香系列酒体验中心', '江苏春意商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (850, '162620125001', '甘肃省', '兰州市', '七里河区', '兰州市七里河区兰石东街135号豪布斯卡项目沁园1号楼', '36.07299', '103.757457', '兰州市兰石东街贵州茅台专卖店', '甘肃飞天圣典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (851, '162620125002', '甘肃省', '兰州市', '七里河区', '兰州市七里河区敦煌路800附2', '36.072796', '103.771442', '兰州市敦煌路贵州茅台专卖店', '兰州义顺工贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (852, '22520181003002', '贵州省', '贵阳市', '清镇市', '贵阳市清镇市贵州省贵阳市清镇市清州大道丹山别苑1号1号裙楼B110号', '26.559061', '106.462029', '清镇市青龙山街道茅台酱香万家共享主题终端', '贵州颐丰源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (853, '123230300001', '黑龙江省', '鸡西市', '鸡冠区', '鸡西市鸡冠区东风路综合楼门市-（1-2）-7', '45.298782', '130.975137', '鸡西市东风路贵州茅台专卖店', '鸡西市溪意源糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (854, '265650126001', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '乌鲁木齐市沙依巴克区扬子江路1号弘来商业广场门面110-112', '43.8033298639478', '87.60159552097322', '乌鲁木齐市扬子江路贵州茅台专卖店', '乌鲁木齐昱龙鑫容商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (855, '22413100010001', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区青龙路同德嘉苑小区1幢号楼1层107-108号', '34.768553', '111.178718', '湖滨区青龙路茅台酱香万家共享主题终端', '河南省钰辉食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (856, 'B15000001001', '内蒙古自治区', '呼和浩特市', '市辖区', '呼和浩特市市辖区内蒙古自治区呼和浩特市新城区机场高速路北火车东站奥特莱斯北侧第H区18幢1061号', '40.846075', '111.756816', '呼和浩特市新城区机场高速路北贵州茅台旗舰店', '内蒙古滕诺贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (857, '151510122001', '四川省', '成都市', '天府新区', '成都市天府新区益州大道南段138号、140号', '30.532213', '104.057019', '成都市益州大道南段贵州茅台专卖店', '成都洋明商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (858, '132321401003', '江苏省', '泰州市', '兴化市', '泰州市兴化市英武中路24，26，28', '32.932996', '119.841878', '兴化市英武中路贵州茅台专卖店', '江苏博爱之都商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (859, '152522732001', '贵州省', '黔南布依族苗族自治州', '三都水族自治县', '黔南布依族苗族自治州三都水族自治县三合街道县府西路六号地块1号楼（检察院斜对面）101、102号门面', '25.984127', '107.871812', '三都县县府西路贵州茅台专卖店', '三都县福祥酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (860, '253530186001', '云南省', '昆明市', '五华区', '昆明市五华区黑林铺街道西城社区昆明市昌源北路600号融城园城A3地块2号写字楼一楼商铺A3、A4号', '25.068367', '102.653523', '昆明市昌源北路贵州茅台专卖店', '云南东方糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (861, '2162030010001', '甘肃省', '金昌市', '永昌县', '金昌市永昌县骊靬国际B区北门向西100米', '38.23805', '101.975866', '永昌县骊靬国际永昌县天宇糖酒有限责任公司门店', '永昌县天宇糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (862, '144445600001', '广东省', '江门市', '蓬江区', '江门市蓬江区发展大道79号骏景湾大厦105-1、106室', '22.614803', '113.090939', '江门市发展大道贵州茅台专卖店', '江门市蓬江区新伟浩贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (863, '132321000001', '江苏省', '扬州市', '邗江区', '扬州市邗江区邗江区锦绣路108号', '32.399424', '119.39489', '扬州市锦绣路贵州茅台专卖店', '江苏中亚糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (864, '2343070000002', '湖南省', '常德市', '武陵区', '常德市武陵区常德广播电视台演播厅附属楼用房第-层-号门面', '29.037192', '111.691256', '常德市广播电视台茅台酱香万家共享主题终端', '常德市金祥龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (865, '146460007001', '海南省', '东方市', '东方市', '东方市东方市东方市八所镇二环路左岸时光1栋10号', '19.100194', '108.669204', '东方市二环路贵州茅台专卖店', '东方国兴隆达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (866, '2343070000001', '湖南省', '常德市', '武陵区', '常德市武陵区老堤障路199号', '29.041422', '111.718103', '常德市老堤障路茅台酱香万家共享主题终端', '常德市金祥龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (867, '23510105002011', '四川省', '成都市', '武侯区', '成都市武侯区四川省成都市武侯区天府一街552号-554号', '30.560544', '104.054486', '成都市武侯区天府一街贵州茅台酱香系列酒体验中心', '四川壹捌捌酒贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (868, '2142012710001', '湖北省', '武汉市', '洪山区', '武汉市洪山区石牌岭路288号', '30.51734', '114.33797', '武汉市石牌岭路武汉市江汉区鑫源福盛酒行门店', '武汉市江汉区鑫源福盛酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (869, '2252018100001', '贵州省', '贵阳市', '清镇市', '贵阳市清镇市四季贵州椿棠府二期14栋1层1-6号门面', '26.572016', '106.469839', '清镇市丹山别苑贵州茅台酱香系列酒体验中心', '贵州颐丰源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (870, '122220582001', '吉林省', '白山市', '江源区', '白山市江源区协力丽江嘉园一期3号楼102门市', '42.053359', '126.594281', '白山市协力大街贵州茅台专卖店', '吉林省白山方大商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (871, '122220582002', '吉林省', '长春市', '南关区', '长春市南关区亚泰大街9683', '43.828861', '125.340669', '长春市亚泰大街贵州茅台专卖店', '吉林省中外名酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (872, '225223020001', '贵州省', '黔西南布依族苗族自治州', '兴仁市', '黔西南布依族苗族自治州兴仁市东湖壹号B7-1', '25.435058', '105.20855', '黔西南兴仁市贵州茅台酱香系列酒体验中心', '贵州亿泰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (873, '114140500001', '山西省', '晋城市', '城区', '晋城市城区开发区白水东街鼎秀华城11幢104室', '35.478447', '112.888379', '晋城市白水东街贵州茅台专卖店', '山西省晋城糖酒副食批发有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (874, '2252030000001', '贵州省', '遵义市', '播州区', '遵义市播州区南白乌江东路华鼎壹号3号楼8号门面', '27.5258', '106.835', '遵义市乌江东路贵州茅台酱香系列酒体验中心', '遵义市播州区显发酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (875, '22411482001001', '河南省', '商丘市', '睢阳区', '商丘市睢阳区商丘睢阳大道与北海路交叉口北100米路西', '34.392686', '115.677817', '睢阳大道茅台酱香万家共享主题终端', '商丘裕之铭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (876, '113130188001', '河北省', '石家庄市', '桥西区', '石家庄市桥西区东三教大街贵州茅台专卖店', '38.020512', '114.49302', '石家庄市东三教大街贵州茅台专卖店', '河北瀚丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (877, '2252030000005', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市玉液南路水井湾9-10栋1楼', '27.784396', '106.403987', '仁怀市玉液南路贵州茅台酱香系列酒体验中心', '贵州省仁怀市立鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (878, '22411500009001', '河南省', '信阳市', '浉河区', '信阳市浉河区东方红大道129号', '32.120628', '114.081478', '浉河区东方红大道茅台酱香万家共享主题终端', '信阳市葆鸿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (879, '236360700001', '江西省', '赣州市', '章贡区', '赣州市章贡区章江北大道132号春江花月A区6栋3#-6#', '25.858563', '114.923047', '章贡区章江北大道贵州茅台43度经销店', '赣州安泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (880, '22410201001001', '河南省', '开封市', '龙亭区', '开封市龙亭区开封市龙亭区汉兴路龙成锦绣花园', '34.79209', '114.28823', '龙亭区汉兴路茅台酱香万家共享主题终端', '开封大耀君荣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (881, '34110105099005001', '湖南省', '长沙市', '浏阳市', '长沙市浏阳市1', '28.163866', '113.64328', '浏阳市集里懿玖贸易商行中心库', '浏阳市集里懿玖贸易商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (882, '213130800001', '河北省', '承德市', '双桥区', '承德市双桥区文化大厦北塔1906室', '40.975708', '117.936776', '承德市南营子大街贵州茅台43度经销店', '承德跃动翔驰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (883, '213130185001', '河北省', '石家庄市', '鹿泉区', '石家庄市鹿泉区北斗西路七街回迁楼3号商务楼一楼东二东三', '38.088236', '114.30219', '石家庄市北斗西路贵州茅台专卖店', '河北润和丰源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (884, '24130802001010', '河北省', '承德市', '双桥区', '承德市双桥区双桥区山神庙长安小区7号楼102', '40.957906', '117.935533', '承德市大升商贸有限公司中心库', '承德市大升商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (885, '2232020000001', '江苏省', '无锡市', '新吴区', '无锡市新吴区金城东路18号居然之家-楼1026-1-1-063', '31.562058', '120.354056', '无锡市金城东路贵州茅台酱香系列酒体验中心', '无锡市荣氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (886, '22330188001002', '浙江省', '杭州市', '滨江区', '杭州市滨江区杭州市滨江区长河街道长河路1318号博风创业大厦1幢105-1', '30.198544', '120.1942', '滨江区长河街道茅台酱香万家共享主题终端', '杭州大光明食品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (887, '2263012600001', '青海省', '西宁市', '城西区', '西宁市城西区文苑路5号苏商大厦B座1号楼1层5-15号', '36.644493', '101.710943', '西宁市文苑路贵州茅台酱香系列酒体验中心', '青海八坊青稞酒酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (888, '2311010600003', '北京市', '北京市', '朝阳区', '北京市朝阳区光华路甲14号（诺安基金大厦底商）', '39.91', '116.45', '北京市光华路茅台酱香万家共享主题终端', '北京世纪华晟贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (889, '2342013000002', '湖北省', '武汉市', '洪山区', '武汉市洪山区南湖北路瀚城西门503-3', '30.497395', '114.366772', '武汉市南湖北路茅台酱香万家共享主题终端', '武汉市武昌区茅乡缘烟酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (890, '151510800002', '四川省', '广元市', '利州区', '广元市利州区水岸华府1#商业1-4号', '32.419516', '105.883932', '广元市万龙路贵州茅台专卖店', '广元市格蓝乐商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (891, '2151390210001', '四川省', '成都市', '简阳市', '成都市简阳市简城红建路南段120、122号1层', '30.38296', '104.558068', '简阳市红建路简阳市简阳市简城汇金商贸经营部门店', '简阳市简城汇金商贸经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (892, '152520188003', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵阳北站G04门面', '26.619447', '106.674437', '贵阳市贵阳北站贵州茅台专卖店', '贵州山水贵客贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (893, '320812001', '江苏省', '淮安市', '清江浦', '淮安市清江浦淮安市清江浦区翔宇中道118号亿力未来城55幢118-5/118-6号门面房', '0.0', '0.0', '淮安久嘉商贸发展有限公司中心库', '淮安久嘉商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (894, '111110102009', '北京市', '北京市', '西城区', '北京市西城区西直门南大街6号-14号', '39.938048', '116.356561', '北京市西直门南大街贵州茅台专卖店', '北京华泰永昌贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (895, '152520188002', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区长岭南路与都匀路交叉口东南侧茅台商务中心C座1层贵州茅台', '26.615394', '106.646049', '贵阳市长岭南路贵州茅台自营店', '贵州国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (896, '111110102006', '北京市', '北京市', '东城区', '北京市东城区安乐林路71号2号楼一层', '39.865392', '116.405423', '北京市安乐林路贵州茅台专卖店', '北京北方京糖洋酒销售有限公司鑫升沙子口店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (897, '134341300001', '安徽省', '宿州市', '埇桥区', '宿州市埇桥区人民南路与南二环路交叉口东北角国建风华S3＃楼', '33.607665', '116.966095', '宿州市人民路贵州茅台专卖店（国建风华）', '宿州市国韵糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (898, '22110105076001', '北京市', '北京市', '朝阳区', '北京市朝阳区高碑店村1359号', '39.899567', '116.52895', '朝阳区高碑店村茅台酱香万家共享主题终端', '酒福汇电子商务（北京）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (899, '111110102014', '北京市', '北京市', '西城区', '北京市西城区北京市西城区菜市口大街6号院1号楼1层109-9', '39.884875', '116.377203', '北京市菜市口大街贵州茅台专卖店', '北京天润文峰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (900, '136360784001', '江西省', '赣州市', '章贡区', '赣州市章贡区瑞金路33号23-25#店面', '25.820906', '114.948693', '赣州市瑞金路贵州茅台专卖店', '赣州市铭诚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (901, '144445500001', '广东省', '中山市', '中山市', '中山市中山市中山五路11号奕翠园31卡', '22.513355', '113.407371', '中山市中山五路贵州茅台专卖店', '中山市淳晖贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (902, '137370286001', '山东省', '青岛市', '市北区', '青岛市市北区徐州路160号', '36.090846', '120.377099', '青岛市徐州路贵州茅台专卖店', '青岛北方国贸集团股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (903, '152520383001', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区万里路街道桃溪路口海丰城A栋茅台自营店', '27.670894', '106.916119', '遵义市海风路贵州茅台自营店', '遵义国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (904, '141411085001', '河南省', '许昌市', '魏都区', '许昌市魏都区南关办事处六一路32号', '34.018455', '113.833944', '许昌市六一路贵州茅台专卖店', '许昌市胖东来商贸集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (905, '243430186001', '湖南省', '长沙市', '芙蓉区', '长沙市芙蓉区马坡岭街道远大一路1389号卓越汇富苑S9栋104号商铺', '28.206418', '113.055245', '长沙市远大一路贵州茅台专卖店', '长沙贵贤酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (906, '2333050000003', '浙江省', '湖州市', '德清县', '湖州市德清县乾元镇乾元开发区洪山顶', '30.53814', '120.082951', '德清县乾元镇茅台酱香万家共享主题终端', '德清泓源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (907, '520100003002', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区毕节路58号联合广场5栋1层', '26.618062', '106.649775', '贵阳市毕节路贵州茅台文化体验馆', '贵州仁源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (908, '243430186003', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区天顶街道映日路与临水路交叉口振业城三期S8栋124-127号', '28.200357', '112.898364', '长沙市映日路贵州茅台专卖店', '长沙三富酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (909, '237370482001', '山东省', '枣庄市', '市中区', '枣庄市市中区龙山路街道君山西路23号', '34.863791', '117.551628', '枣庄市君山西路贵州茅台43度经销（茅台酒）', '枣庄市名扬商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (910, '130600006007', '河北省', '保定市', '竞秀区', '保定市竞秀区创业东路508号风帆家园7-1贵州茅台底商', '38.903517', '115.489481', '保定创业东路贵州茅台专卖店', '保定新耀泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (911, '22440422007001', '广东省', '珠海市', '香洲区', '珠海市香洲区吉大水湾路279号海怡大厦一层商场B5铺', '22.235971', '113.571216', '香洲区吉大水湾路茅台酱香万家共享主题终端', '珠海天樽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (912, '23131000006007', '河北省', '廊坊市', '广阳区', '廊坊市广阳区南尖塔镇祥云南道新世界家园 ', '39.553268', '116.69272', '廊坊市广阳区祥云南道85号+贵州茅台酱香系列酒体验中心', '廊坊市凯柏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (913, '162620300002', '甘肃省', '金昌市', '金川区', '金昌市金川区永昌路聚金润园小区S1-3#4#门面', '38.50629', '102.168949', '金昌市永昌路贵州茅台专卖店', '甘肃丰盈商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (914, '233330285001', '浙江省', '宁波市', '江北区', '宁波市江北区丰汇华邸70号-72号', '29.915164', '121.526209', '宁波市丰汇华邸贵州茅台专卖店', '宁波市华鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (915, '22530186005001', '云南省', '昆明市', '官渡区', '昆明市官渡区季官路464号', '24.95', '102.75', '官渡区季官路茅台酱香万家共享主题终端', '昆明融展振富商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (916, '152502001', '内蒙古自治区', '锡林郭勒盟', '锡林浩特市', '锡林郭勒盟锡林浩特市那达慕大街东段天骄嘉苑小区N20-1-32号', '43.953788', '116.113864', '锡林浩特市广汇洋洋商贸有限公司中心库', '锡林浩特市广汇洋洋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (917, '34410100087022001', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区1', '34.619711', '112.463833', '洛阳市洛龙区华樽烟酒店中心库', '洛阳市洛龙区华樽烟酒店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (918, '115150225001', '内蒙古自治区', '包头市', '青山区', '包头市青山区民主路富华公馆底店S2-S01-03', '40.650584', '109.896123', '包头市民主路贵州茅台专卖店', '包头市蒙泉贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (919, '2337078200002', '山东省', '潍坊市', '诸城市', '潍坊市诸城市诸城市繁荣东路北侧1号商铺（锦江之星西邻）', '36.003655', '119.419834', '诸城市南环路茅台酱香万家共享主题终端', '诸城市百龙名酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (920, '141410482001', '河南省', '平顶山市', '汝州市', '平顶山市汝州市河南省平顶山市汝州市钟楼街道广成路与古梁大道交叉口往南100米路西136号', '34.165483', '112.87754', '平顶山市古梁大道贵州茅台专卖店', '汝州市晟合商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (921, '223709000001', '山东省', '泰安市', '岱岳区', '泰安市岱岳区东岳大街495号', '36.204273', '117.059356', '岱岳区东岳大街贵州茅台酱香系列酒体验中心', '泰安市泰山名饮有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (922, '122220100012', '吉林省', '长春市', '朝阳区', '长春市朝阳区安达街与新华路交汇绿地蓝海1单元109号', '43.893807', '125.300626', '长春市新华路贵州茅台自营店', '吉林国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (923, '122220100011', '北京市', '北京市', '朝阳区', '北京市朝阳区雅成二里2号楼1层商业24', '39.923564', '116.522984', '北京市朝阳北路贵州茅台专卖店', '北京瀚亨通贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (924, '2113030010001', '河北省', '秦皇岛市', '海港区', '秦皇岛市海港区建设大街96-1号2楼', '39.941539', '119.589092', '秦皇岛市建设大街秦皇岛市长益贸易有限公司门店', '秦皇岛市长益贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (925, '22330282004001', '浙江省', '宁波市', '慈溪市', '宁波市慈溪市白沙路街道慈甬路415号', '30.167235', '121.261066', '慈溪市白沙路街道茅台酱香万家共享主题终端', '宁波市骏隆供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (926, '430000004', '湖南省', '怀化市', '市辖区', '怀化市市辖区天开发区湖天南路西侧南郡7栋1单元1层107号', '27.550464', '109.988514', '怀化市中玉商贸有限公司中心库', '怀化市中玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (927, '2233010000001', '浙江省', '杭州市', '萧山区', '杭州市萧山区经济技术开发区博奥路1770、328号', '30.208169', '120.244108', '杭州市博奥路贵州茅台酱香系列酒体验中心', '浙江德道食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (928, '2137152610001', '山东省', '聊城市', '高唐县', '聊城市高唐县官道街中段东侧', '36.859757', '116.236435', '高唐县官道街高唐县盛世金玉商贸有限公司门店', '高唐县盛世金玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (929, '145450100003', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区枫林路西侧金色家园住宅小区B段商铺8号楼132、133、134号商铺', '22.830614', '108.409176', '南宁市枫林路贵州茅台专卖店', '广西百兴盛电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (930, '151510183001', '四川省', '成都市', '邛崃市', '成都市邛崃市滨江路下段317号', '30.398973', '103.452333', '邛崃市滨江路贵州茅台专卖店', '成都贵台酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (931, '145450100002', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区铜鼓岭路3号三祺和顺园4号楼5号楼一层105-108号商铺', '22.802513', '108.414876', '南宁市铜鼓岭路贵州茅台专卖店', '南宁市金汛潮商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (932, '22413100014001', '河南省', '济源市', '济源市', '济源市济源市济源大道长基国际广场4号楼楼下', '35.07537', '112.589839', '济源市济源大道茅台酱香万家共享主题终端', '济源市凯越商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (933, '164640100006', '宁夏回族自治区', '银川市', '金凤区', '银川市金凤区正源南街宝湖天下5-8营业房', '38.458539', '106.246429', '银川市正源南街贵州茅台自营店', '宁夏国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (934, '340100038', '安徽省', '合肥市', '市辖区', '合肥市市辖区黄山路596号合肥百大集团办公楼4楼合肥合鑫商贸', '31.828922', '117.264321', '合肥合鑫商贸有限公司中心库', '合肥合鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (935, '141412726001', '河南省', '周口市', '郸城县', '周口市郸城县交通路与府东路交叉口东100米路北', '33.637928', '115.179198', '郸城县交通路贵州茅台专卖店', '河南亿星实业集团股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (936, '2322020000001', '吉林省', '吉林市', '昌邑区', '吉林市昌邑区四川路静园小区12号楼1-2层1号网点', '43.848652', '126.577011', '吉林市四川路茅台酱香万家共享主题终端', '吉林市酒跃久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (937, '112120224001', '天津市', '天津市', '宝坻区', '天津市宝坻区潮阳大道与开元路交口西南角艺馨佳苑商业2号楼—103,104,105,106,111,112,113,114号', '39.689645', '117.293156', '天津市潮阳大道贵州茅台专卖店', '天津市华溢睿智酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (938, '2313052800001', '河北省', '邢台市', '宁晋县', '邢台市宁晋县颐和明珠B区底商', '37.625732', '114.932277', '邢台市颐和明珠茅台酱香万家共享主题终端', '河北海棠依旧酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (939, '232320800001', '江苏省', '淮安市', '清江浦', '淮安市清江浦韩泰北路东海畅园商住一幢9号1-3室', '33.594714', '119.077072', '淮安市韩泰北路贵州茅台专卖店', '江苏增力商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (940, '340100039', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区井岗镇科学岛路与琼阳路交口易科苑东北角24号综合楼', '31.850094', '117.204317', '合肥市百弘商贸有限公司中心库', '合肥市百弘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (941, '122220100009', '吉林省', '长春市', '朝阳区', '长春市朝阳区电台街1899号', '43.836681', '125.272844', '长春市电台街贵州茅台专卖店', '吉林宝泰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (942, '164640100001', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区富宁街街道新华西路418号', '38.466767', '106.257439', '银川市新华西街贵州茅台专卖店', '中盐宁夏糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (943, '2337040000002', '山东省', '枣庄市', '市中区', '枣庄市市中区山东省枣庄市市中区西昌路齐村镇卫生院东北50米', '34.876628', '117.53101', '枣庄市西昌路茅台酱香万家共享主题终端', '山东万兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (944, '164640100003', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区盛世家园5号营业房', '38.462042', '106.266879', '银川市南薰西街贵州茅台专卖店', '宁夏融达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (945, '122220100005', '吉林省', '长春市', '绿园区', '长春市绿园区创业大街2290号', '43.863051', '125.247338', '长春市创业大街贵州茅台专卖店', '长春市金池经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (946, '341100005', '安徽省', '滁州市', '市辖区', '滁州市市辖区安徽省滁州市南谯中路2268号', '0.0', '0.0', '滁州市容海酒业销售有限公司中心库', '滁州市容海酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (947, '2323018100002', '黑龙江省', '哈尔滨市', '香坊区', '哈尔滨市香坊区珠江路018号', '45.7373', '126.685882', '哈尔滨市珠江路茅台酱香万家共享主题终端', '黑龙江省佳娃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (948, '2341310000001', '河南省', '济源市', '济源市', '济源市济源市汤帝路文翠花园小区西门口南侧5号楼-层', '35.085251', '112.578365', '济源市汤帝路茅台酱香万家共享主题终端', '济源市中酿商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (949, '164640100005', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区清和南街建发东方公寓B座1楼1号营业房', '38.459755', '106.289549', '银川市清和南街贵州茅台专卖店', '宁夏嘉瑞欣实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (950, '122220100003', '吉林省', '长春市', '南关区', '长春市南关区亚泰华府S05幢福祉大路贵州茅台', '43.78259', '125.379483', '长春市福祉大路贵州茅台专卖店', '吉林省四方商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (951, '236360600001', '江西省', '鹰潭市', '月湖区', '鹰潭市月湖区信江新区滨江一号商业13栋01/02铺面', '28.250973', '117.029782', '鹰潭市旺埠路贵州茅台专卖店', '鹰潭鸿华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (952, '2323018100001', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区文府街15号', '45.742826', '126.657149', '哈尔滨市文府街茅台酱香万家共享主题终端', '黑龙江省佳娃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (953, '2341310000002', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区上阳路南段七号院门口', '34.766502', '111.196956', '三门峡市上阳路茅台酱香万家共享主题终端', '三门峡金昌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (954, '164640100004', '宁夏回族自治区', '银川市', '金凤区', '银川市金凤区大连路力德财富大厦一层108室', '38.521045', '106.227995', '银川市大连路贵州茅台专卖店', '宁夏嘉瑞欣实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (955, '2142112210001', '湖北省', '黄冈市', '红安县', '黄冈市红安县武汉市红安县河东大道新天地商铺C7-110', '31.285476', '114.618616', '红安县河东大道湖北盛世佳酿贸易有限公司门店', '湖北盛世佳酿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (956, '2341310000003', '河南省', '平顶山市', '湛河区', '平顶山市湛河区轻工路与健康路交叉口西南角', '33.714902', '113.327704', '平顶山市轻工路茅台酱香万家共享主题终端', '平顶山市鑫通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (957, '237370287003', '山东省', '青岛市', '李沧区', '青岛市李沧区京口路77-7', '36.161817', '120.420299', '青岛市京口路贵州茅台专卖店', '青岛昱仙酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (958, '237370287004', '山东省', '济南市', '历下区', '济南市历下区泺源大街2号', '36.659849', '117.03806', '济南市泺源大街贵州茅台专卖店', '山东泰山壹伍叁贰物联供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (959, '120104001004', '天津市', '天津市', '滨海新区', '天津市滨海新区天津市滨海新区华苑产业区梓苑路8号天百中心19栋', '39.092943', '117.116964', '天津市梓苑路贵州茅台文化体验馆', '天津海津皇冠贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (960, '2313090000001', '河北省', '沧州市', '任丘市', '沧州市任丘市建设东路雁翎西苑-A区', '38.71', '116.11', '任丘市建设东路茅台酱香万家共享主题终端', '德亿沧州供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (961, '237370287001', '山东省', '青岛市', '市南区', '青岛市市南区江西路35号丙-1/2/3', '36.074234', '120.383192', '青岛市江西路贵州茅台专卖店', '青岛大有酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (962, '237370287002', '山东省', '青岛市', '崂山区', '青岛市崂山区海尔路83号', '36.092666', '120.462806', '青岛市海尔路贵州茅台专卖店', '青岛福兴祥商品配送有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (963, '2343018600001', '湖南省', '长沙市', '雨花区', '长沙市雨花区黎托路明昇壹城05地块1层118号', '28.162401', '113.055854', '长沙市雨花区酌悦酒业商行茅台酱香万家共享主题终端', '湖南玉鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (964, 'B46000000200', '海南省', '三亚市', '海棠区', '三亚市海棠区海南省三亚市海棠区海棠南路6号', '18.305729', '109.726032', '三亚市海南省三亚市海棠区海棠南路6号贵州茅台体验店', '贵州茅台酒厂（集团）三亚投资实业有限公司海棠湾茅台度假村分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (965, 'B46000000201', '海南省', '三亚市', '海棠区', '三亚市海棠区地址位于海南省三亚市海棠区海棠南路6号', '18.305729', '109.726032', '三亚市海棠区海棠南路6号贵州茅台旗舰店', '贵州茅台酒厂（集团）三亚投资实业有限公司海棠湾茅台度假村分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (966, '123231020001', '黑龙江省', '牡丹江市', '绥芬河市', '牡丹江市绥芬河市黄河路45号', '44.408745', '131.14666', '绥芬河市黄河路贵州茅台专卖店', '绥芬河综合保税区欧亚凯盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (967, '2137020010001', '山东省', '青岛市', '市南区', '青岛市市南区银川西路7-58号', '36.082194', '120.408345', '青岛市银川西路青岛鑫浩统达糖酒副食品有限公司门店', '青岛鑫浩统达糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (968, '162623108001', '甘肃省', '陇南市', '武都区', '陇南市武都区南桥路130号', '33.387485', '104.929036', '陇南市南桥路贵州茅台专卖店', '陇南欣大烟草经销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (969, '232320134001', '江苏省', '南京市', '雨花台区', '南京市雨花台区绿都大道13号绿地之窗b2幢1504室', '31.970131', '118.793059', '南京市雨花台区绿都大道贵州茅台43度经销店', '南京裕朗工贸实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (970, 'B33010007001', '浙江省', '杭州市', '上城区', '杭州市上城区浙江省杭州市上城区秋涛路178号17幢423室', '30.221644', '120.17819', '小凌（杭州）品牌管理有限公司杭州市上城区秋涛路178号专卖店', '小凌（杭州）品牌管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (971, '2141030010004', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区古城路与学府街交叉口', '34.626792', '112.426629', '洛阳市古城路洛阳茅之冠酒业有限公司门店', '洛阳茅之冠酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (972, '146460300001', '海南省', '五指山市', '五指山市', '五指山市五指山市通什镇通畅路仁居花园一楼铺面114-115号', '18.769695', '109.510118', '五指山市镇通畅路贵州茅台专卖店', '海南松之光酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (973, '137371324001', '山东省', '临沂市', '兰陵县', '临沂市兰陵县卞庄街道文峰路南段城市花园A区西门南08户', '34.84931', '118.07596', '兰陵县文峰路贵州茅台专卖店', '临沂市东唐酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (974, '22520328009001', '贵州省', '遵义市', '湄潭县', '遵义市湄潭县潭县湄江街道天文大道四十米大道茗城峰景2号楼13、14号', '27.750656', '107.468244', '湄潭县天文大道茅台酱香万家共享主题终端', '贵州强劲华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (975, '137373000001', '山东省', '威海市', '环翠区', '威海市环翠区海滨中路14A-3号', '37.479957', '122.137462', '威海市海滨中路贵州茅台专卖店', '威海世昌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (976, '136360727001', '江西省', '赣州市', '龙南市', '赣州市龙南市东湖新区新都大道嘉和新天地8-11号商铺', '24.883373', '114.80869', '龙南市新都大道贵州茅台专卖店', '龙南市名诚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (977, '151510682001', '四川省', '德阳市', '什邡市', '德阳市什邡市科新嘉苑西南门', '31.1106422456317', '104.18393403933209', '德阳市蒙顶山路贵州茅台专卖店', '什邡市银华鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (978, '142422836001', '湖北省', '恩施土家族苗族自治州', '恩施市', '恩施土家族苗族自治州恩施市金桂大道施州国际1024-1027', '30.306756', '109.494628', '恩施市金桂大道贵州茅台专卖店', '恩施州隆源升商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (979, '136360100003', '江西省', '南昌市', '青山湖区', '南昌市青山湖区民强路198号联发时代天骄5号商业楼109-111号商铺', '28.70089', '115.955584', '南昌市民强路贵州茅台专卖店', '南昌云锦福贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (980, '113130283002', '河北省', '唐山市', '迁安市', '唐山市迁安市迁安镇阜安大路2617号', '40.001766', '118.689142', '迁安市阜安大路贵州茅台专卖店', '唐山荣讯商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (981, '136360100001', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区红谷中大道1996号世茂天城13#商业楼101-103室', '28.69292', '115.868231', '南昌市红谷中大道贵州茅台专卖店', '南昌市怡兴源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (982, '22512002001002', '四川省', '资阳市', '雁江区', '资阳市雁江区皇龙新城小区A座6号楼A6(F)1-8', '30.124934', '104.631882', '雁江区仁德东路茅台酱香万家共享主题终端', '四川省天载商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (983, '2132140410001', '江苏省', '泰州市', '靖江市', '泰州市靖江市石油大厦西侧', '32.001498', '120.26344', '靖江市南环东路江苏春意商贸有限公司门店', '江苏春意商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (984, '231310104002', '上海市', '上海市', '徐汇区', '上海市徐汇区龙腾大道291-293号', '31.138186', '121.455548', '上海市龙腾大道贵州茅台专卖店', '上海龙川酒业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (985, '231310104001', '上海市', '上海市', '静安区', '上海市静安区洛川中路1001号2幢1层06、07室', '31.263392', '121.44663', '上海市洛川中路贵州茅台专卖店', '仲行商贸(上海)有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (986, '137370920001', '山东省', '泰安市', '新泰市', '泰安市新泰市龙池路与明珠路交汇青云小镇商业楼5号楼', '35.898767', '117.782693', '新泰市龙池路贵州茅台专卖店', '山东省新泰市智信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (987, '620200003003', '甘肃省', '嘉峪关市', '市辖区', '嘉峪关市市辖区新华南路1669号一楼5号门点', '39.771203', '98.286494', '甘肃省嘉峪关市新华南路贵州茅台专卖店', '嘉峪关国酒鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (988, '22430186008001', '湖南省', '长沙市', '雨花区', '长沙市雨花区曙光南路768号华润翡翠府2栋108、109房', '28.13997', '113.004156', '雨花区曙光南路茅台酱香万家共享主题终端', '湖南湘韵酒业有限公司长沙分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (989, '22130300007001', '河北省', '秦皇岛市', '昌黎县', '秦皇岛市昌黎县昌黎镇碣阳大街南侧（碣石雅园7-5-103号）', '39.717742', '115.185969', '昌黎县碣阳大街茅台酱香万家共享主题终端', '秦皇岛市长益贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (990, '440681001002', '广东省', '佛山市', '顺德区', '佛山市顺德区容桂风华路21座6-7号铺', '22.758115', '113.280358', '佛山市风华路贵州茅台专卖店', '佛山市顺德明瀚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (991, '141410800003', '河南省', '焦作市', '解放区', '焦作市解放区丰收路与民主路交叉口西北角兰亭居', '35.206173', '113.236789', '焦作市丰收路贵州茅台专卖店', '焦作市大时代贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (992, '165652301001', '新疆维吾尔自治区', '昌吉回族自治州', '昌吉市', '昌吉回族自治州昌吉市南公园西路一品尚都北苑南门11号房贵州茅台专卖店', '44.011589', '87.245687', '昌吉市南公园西路贵州茅台专卖店', '新疆对酒当歌酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (993, '2141270110001', '河南省', '周口市', '川汇区', '周口市川汇区工农路与太昊路交叉口紫荆城小区西门南侧', '33.59447', '114.668409', '周口市工农路河南景隆商贸有限公司门店', '河南景隆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (994, '2313068600002', '河北省', '保定市', '容城县', '保定市容城县容城镇东苑路8巷12号', '39.054764', '115.866166', '容城县蓉城镇茅台酱香万家共享主题终端', '保定隆成中利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (995, '224401910001', '广东省', '广州市', '天河区', '广州市天河区金碧华府华府街732-740（双号）商场', '23.117297', '113.342549', '广州市花城大道贵州茅台酱香系列酒体验中心', '广州市润轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (996, '122220100001', '吉林省', '长春市', '南关区', '长春市南关区芳草街大江玖悦G5栋111-112号', '43.784692', '125.285324', '长春市芳草街贵州茅台专卖店', '吉林省把酒成金经贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (997, '650100015008', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '乌鲁木齐市天山区乌鲁木齐碱泉三街99号', '43.804788', '87.639748', '乌鲁木齐碱泉三街贵州茅台专卖店', '新疆遂意商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (998, '162622122001', '甘肃省', '酒泉市', '敦煌市', '酒泉市敦煌市文昌南路193号1层110号', '40.141353', '94.669868', '敦煌市文昌南路贵州茅台专卖店', '敦煌市春都商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (999, '22522529004002', '贵州省', '安顺市', '关岭布依族苗族自治县', '安顺市关岭布依族苗族自治县龙潭街道信达大厦五期一层11、12、23、24、25号', '25.939779', '105.613246', '西关外茅台茅台酱香万家共享主题终端', '关岭音符酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1000, '22370525001001', '山东省', '东营市', '河口区', '东营市河口区河口区海宁路172号（智客汇大厦）一层', '37.88157', '118.516865', '河口区海宁路茅台酱香万家共享主题终端', '河口区华鑫酒水专营店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1001, '22522529004001', '贵州省', '安顺市', '关岭布依族苗族自治县', '安顺市关岭布依族苗族自治县滨河西路上行右侧自建门面', '25.948575', '105.619025', '滨河路茅台酱香万家共享主题终端', '关岭音符酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1002, '137371523001', '山东省', '聊城市', '茌平区', '聊城市茌平区枣乡街与民生路交叉口北80米路西', '36.568813', '116.239593', '聊城市枣乡南街贵州茅台专卖店', '聊城市茌平区厚德天成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1003, '23540128002001', '西藏自治区', '拉萨市', '城关区', '拉萨市城关区雅砻花园商铺15-17号', '29.63905', '91.10847', '柳梧新区南环路贵州茅台酱香系列酒体验中心', '拉萨亚雄商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1004, '143430481002', '湖南省', '衡阳市', '耒阳市', '衡阳市耒阳市五里牌街道德泰隆路与迎宾大道交汇处合兴新城3号商住楼105、106、107门面', '26.432958', '112.869642', '耒阳市德泰隆路贵州茅台专卖店', '衡阳市糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1005, '2112040010001', '天津市', '天津市', '津南区', '天津市津南区国瑞路8号国展天地1层110号商铺', '39.022635', '117.387878', '津南区国瑞路茅台酱香万家共享主题终端', '天津酩汇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1006, '43420300010', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区上海中路23号', '32.621829', '110.788574', '十堰市上海中路贵州茅台43度经销店', '十堰冯氏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1007, '2144051410001', '广东省', '汕头市', '潮南区', '汕头市潮南区峡山金祥路嘉怡小区第3幢A01号顺昌酒业', '23.257409', '116.428397', '汕头市金祥路汕头市华恒昌贸易有限公司门店', '汕头市华恒昌贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1008, '421000005', '湖北省', '荆州市', '荆州区', '荆州市荆州区开发区月堤北路18号祥泰汽车零部件公司内', '30.301703', '112.310965', '荆州京荆有味商贸有限公司中心库', '荆州京荆有味商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1009, '22420323001001', '湖北省', '十堰市', '竹山县', '十堰市竹山县湖北省十堰市竹山县城关镇纵横大道6号', '32.227586', '110.229719', '竹山县城关镇纵横大道茅台酱香万家共享主题终端', '竹山县鑫聚和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1010, '2137072510001', '山东省', '潍坊市', '昌乐县', '潍坊市昌乐县利民街盛和爱伦堡172号', '36.704782', '118.845112', '昌乐县利民街茅台酱香万家共享自有主题终端', '潍坊峰润酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1011, '113130300001', '河北省', '秦皇岛市', '海港区', '秦皇岛市海港区星光大道（13）号楼（165、163-1）号', '39.933324', '119.582055', '秦皇岛市友谊路贵州茅台专卖店', '秦皇岛市盛千越商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1012, '2334052100001', '安徽省', '马鞍山市', '当涂县', '马鞍山市当涂县姑孰镇太白中路469-1号', '30.84737', '116.35128', '当涂县姑孰镇茅台酱香万家共享主题终端', '安徽风云酒业商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1013, '2112040010003', '天津市', '天津市', '河西区', '天津市河西区永安道泰达园5号楼14-101', '39.104108', '117.211787', '天津市永安道茅台酱香万家共享主题终端', '天津市鑫悦华实商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1014, '113130300004', '河北省', '秦皇岛市', '北戴河区', '秦皇岛市北戴河区联峰北路30-2', '39.831759', '119.501302', '秦皇岛市联峰北路贵州茅台专卖店', '秦皇岛市辰益臻商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1015, '340100006', '安徽省', '合肥市', '市辖区', '合肥市市辖区阜阳庐阳区北路3号', '31.864737', '117.293416', '安徽省徽商糖酒有限责任公司中心库', '安徽省徽商糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1016, '113130300005', '河北省', '秦皇岛市', '海港区', '秦皇岛市海港区秦皇东大街412号', '39.948341', '119.613947', '秦皇岛市秦皇东大街贵州茅台专卖店', '秦皇岛酱典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1017, '2242030001001', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区北京南路16号全兴广场1层1-2、1-3', '32.612654', '110.788616', '茅箭区北京南路贵州茅台酱香系列酒体验中心', '十堰冯氏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1018, '2241092900001', '河南省', '濮阳市', '华龙区', '濮阳市华龙区任丘路136号', '35.772277', '115.08077', '濮阳市任丘路贵州茅台酱香系列酒体验中心', '濮阳市诚诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1019, '213130584001', '河北省', '邢台市', '信都区', '邢台市信都区中兴西大街9号糖酒A座A9号', '37.063137', '114.486868', '邢台市中兴西大街贵州茅台专卖店', '邢台铭酱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1020, '22440300076001', '广东省', '深圳市', '宝安区', '深圳市宝安区新安街道 36 区上川路', '22.57627', '113.89598', '宝安区新安街道上川路茅台酱香万家共享主题终端', '深圳市伟达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1021, '251510100001', '四川省', '成都市', '武侯区', '成都市武侯区锦晖西一街99号1栋1单元2层附209号', '30.584978', '104.060643', '成都市锦晖西一街贵州茅台43度经销店', '成都九品位酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1022, '121210700001', '辽宁省', '锦州市', '凌河区', '锦州市凌河区解放路七段26号1-134 135 136', '41.116165', '121.179258', '锦州市解放路贵州茅台专卖店', '锦州金业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1023, '34110105099013001', '广东省', '深圳市', '罗湖区', '深圳市罗湖区1', '22.548309', '114.131611', '深圳市酒妹酒业有限公司中心库', '深圳市酒妹酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1024, '510600001002', '四川省', '成都市', '成华区', '成都市成华区华盛路58号17栋1号', '30.685239', '104.182607', '成都市华盛路贵州茅台文化体验馆', '德阳市群运物资有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1025, '150500108002', '重庆市', '重庆市', '南岸区', '重庆市南岸区泰昌路34、36、38、40、42号', '29.576296', '106.589109', '重庆市泰昌路贵州茅台专卖店', '重庆崇贵酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1026, '22411081001010', '河南省', '许昌市', '禹州市', '许昌市禹州市禹州市颍川街道恒达熙郡3幢1-104号', '34.143063', '113.498569', '许昌市禹州市建设路茅台酱香万家共享主题终端', '禹州市恒立晟贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1027, '113130984001', '河北省', '沧州市', '河间市', '沧州市河间市胜利中路247号', '38.448757', '116.110605', '河间市胜利中路贵州茅台专卖店', '河间市曙光商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1028, '2344150000002', '广东省', '汕尾市', '海丰县', '汕尾市海丰县三角站新会营综合楼左侧-楼楼下', '22.968019', '115.332307', '海丰县海城镇茅台酱香万家共享主题终端', '海丰县恒岳贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1029, '142420127001', '湖北省', '武汉市', '江汉区', '武汉市江汉区淮海路泛海国际SOHO城（一期）商业1、2、7栋1层36-37室', '30.600212', '114.245491', '武汉市淮海路贵州茅台专卖店', '武汉华康酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1030, '7089646', '广东省', '深圳市', '南山区', '深圳市南山区深圳市南山区天健A塔', '116.474375', '116.474375', '友宝', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1031, '245450128002', '广西壮族自治区', '南宁市', '良庆区', '南宁市良庆区中国（广西）自由贸易试验区南宁片区龙佑街2号云星·钱隆首府D2地块2号楼一层B101、103、105号', '22.768953', '108.38212', '南宁市龙佑街贵州茅台专卖店', '广西九界贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1032, '2241170100101001', '河南省', '驻马店市', '驿城区', '驻马店市驿城区河南省驻马店市驿城区交通路与平安街118号交叉口西北角', '32.976409', '114.011816', '驿城区交通路茅台酱香万家共享主题终端', '驻马店市新兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1033, '245450128001', '广西壮族自治区', '南宁市', '良庆区', '南宁市良庆区明月东路6号民族风情街北地块项目C2号楼一层123、125、126号商铺', '22.749607', '108.377449', '南宁市明月东路贵州茅台专卖店', '广西广糖酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1034, '2144128510001', '广东省', '肇庆市', '端州区', '肇庆市端州区岗美西路', '23.060385', '112.495796', '肇庆市岗美西路端州区龙马酒业商行门店', '端州区龙马酒业商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1035, '22410922002001', '河南省', '濮阳市', '华龙区', '濮阳市华龙区黄河路与文化路交叉口东50米路北', '35.765891', '115.097098', '华龙区文化路贵州茅台酱香万家共享主题终端', '濮阳市子箐商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1036, '410900011005', '河南省', '濮阳市', '华龙区', '濮阳市华龙区河南省濮阳市中原路与濮上路交叉口向南500米路西安庄商务楼一层98号', '35.776998', '115.010626', '濮阳市濮上路贵州茅台专卖店', '濮阳市贵酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1037, '245450128005', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区荔滨大道6号华发新城A区商业B区商业一层S8-101、102、120、121、122号商铺 ', '22.775574', '108.352788', '南宁市荔滨大道贵州茅台专卖店', '广西南宁金一城商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1038, '410100028003', '河南省', '郑州市', '管城回族区', '郑州市管城回族区郑州管城区十八大街司赵路交叉口东北角', '34.684114', '113.807351', '河南郑州经南十路贵州茅台专卖店', '郑州贺贞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1039, '410100028002', '河南省', '郑州市', '管城回族区', '郑州市管城回族区郑州经开区经南十路十八大街司赵路交叉口', '34.683503', '113.806093', '郑州经南十路贵州茅台专卖店', '郑州贺贞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1040, '123232301001', '黑龙江省', '绥化市', '北林区', '绥化市北林区黄河路413号', '46.650503', '126.973201', '绥化市北林区黄河北路413号贵州茅台专卖店', '绥化市虹辉酒类销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1041, '144440183002', '广东省', '广州市', '增城区', '广州市增城区新塘镇环城路东方名都商铺791、793号', '23.127552', '113.592777', '广州市环城路贵州茅台专卖店', '广州鼎醴贸易有限公司新塘分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1042, '245450128009', '广西壮族自治区', '南宁市', '良庆区', '南宁市良庆区龙堤路51号江山御景A6栋一层123号商铺', '22.77378', '108.36702', '南宁市龙堤路贵州茅台43度经销店', '广西南宁步丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1043, '245450128008', '广西壮族自治区', '南宁市', '良庆区', '南宁市良庆区龙堤路51号江山御景A6栋一层125、126、127、128号商铺', '22.773761', '108.367048', '南宁市龙堤路贵州茅台专卖店', '广西南宁市商支源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1044, '244440284001', '广东省', '韶关市', '武江区', '韶关市武江区沿江路16号南枫碧水花城I幢-1层1号之二', '24.775728', '113.58289', '韶关市沿江路贵州茅台43度经销店', '广东省乳和放心酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1045, '2152010010001', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市大龙大道8号南洲国际文华苑3栋1层14-17号门面', '26.251589', '107.531323', '都匀市大龙大道黔南州糖酒有限责任公司门店', '黔南州糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1046, '112120107006', '天津市', '天津市', '滨海新区', '天津市滨海新区开发区第二大街2号81-26', '39.032262', '117.685709', '天津市第二大街贵州茅台专卖店', '天津市裕隆达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1047, '145450132001', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区凤岭南路16号保利领秀前城禧悅都7号楼B108、B109、B110号', '22.794777', '108.427946', '南宁市凤岭南路贵州茅台专卖店', '南宁市琪联茂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1048, '233330684001', '浙江省', '绍兴市', '越城区', '绍兴市越城区人民中路208号1楼西侧109室', '29.996359', '120.58597', '绍兴市人民中路贵州茅台专卖店', '绍兴市乾韵商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1049, '2144088110001', '广东省', '湛江市', '廉江市', '湛江市廉江市碧桂园盛世华府5号楼055号商铺', '21.618596', '110.252007', '廉江市廉江大道茅台酱香万家共享主题终端', '廉江市贵茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1050, '2152010010003', '贵州省', '黔南布依族苗族自治州', '龙里县', '黔南布依族苗族自治州龙里县中铁国际生态城中铁大道酒博园1-4', '26.449519', '106.985339', '龙里县金龙东路贵州彩石梦置业投资有限公司门店', '贵州彩石梦置业投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1051, '410225001002', '河南省', '开封市', '兰考县', '开封市兰考县振兴路与考城路交叉口向北220米，路东仟禧华庭1-2号商铺', '34.845195', '114.809609', '开封市兰考县振兴路北段贵州茅台专卖店', '兰考日盛实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1052, '152522421003', '贵州省', '毕节市', '七星关区', '毕节市七星关区  文博路招商花园B区商业(B1)2-3商铺', '27.281573', '105.286297', '毕节市文博路贵州茅台专卖店', '毕节市劲松酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1053, '2311022700001', '北京市', '北京市', '怀柔区', '北京市怀柔区府前东街1号院对面', '40.318486', '116.649666', '北京市府前东街茅台酱香万家共享主题终端', '北京恒信昌盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1054, '2311022700002', '北京市', '北京市', '海淀区', '北京市海淀区安宁庄后街北1号', '40.051564', '116.330413', '北京市安宁庄后街茅台酱香万家共享主题终端', '淇盛商业（北京）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1055, '152522421001', '贵州省', '毕节市', '七星关区', '毕节市七星关区深圳路拓海中央公园一期22栋14-16号商铺', '27.276815', '105.277568', '毕节市深圳路贵州茅台专卖店', '毕节市劲松酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1056, '23413100010013', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区河南省三门峡市湖滨区甘棠路与中心大道交叉口金色华苑小区8号楼1层0107', '34.760662', '111.164803', '河南省钰辉食品有限公司贵州茅台酱香系列酒体验中心', '河南省钰辉食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1057, '34321326002082001', '河南省', '郑州市', '中牟县', '郑州市中牟县河南省郑州市中牟县广惠街街道办事处商都大道与永福街交叉口南100米路东绿云小区底层2号商铺', '34.720535', '113.975798', '郑州十里酱香贸易有限公司中心库', '郑州十里酱香贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1058, '2141148110001', '河南省', '商丘市', '永城市', '商丘市永城市欧亚路人民医院对面友谊小区', '33.940867', '116.446509', '永城市欧亚路永城市豫达商贸有限公司门店', '永城市豫达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1059, '2341132400003', '河南省', '南阳市', '镇平县', '南阳市镇平县雪枫路与健康路交叉口东北角', '33.039609', '112.22928', '镇平县雪枫路茅台酱香万家共享主题终端', '镇平县众翊商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1060, '22410900007001', '河南省', '濮阳市', '市辖区', '濮阳市市辖区金堤北路29号', '35.78', '115.04', '濮阳市金堤北路茅台酱香万家共享主题终端', '濮阳市金欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1061, '2341132400002', '河南省', '南阳市', '镇平县', '南阳市镇平县健康路与涅阳路交叉口往南150米路西', '33.028487', '112.229648', '镇平县健康路茅台酱香万家共享主题终端', '南阳市豫强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1062, '111110102002', '北京市', '北京市', '丰台区', '北京市丰台区芳群园乙23号楼一层', '39.86042062735685', '116.43154074166105', '北京市芳古路贵州茅台专卖店', '北京安胜隆泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1063, '136360100008', '江西省', '南昌市', '西湖区', '南昌市西湖区建设西路众鑫城上城2栋1号贵州茅台', '28.649965', '115.876146', '南昌市抚生路贵州茅台自营店', '江西国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1064, '153533800001', '云南省', '德宏傣族景颇族自治州', '芒市', '德宏傣族景颇族自治州芒市芒市金孔雀大街48号（德宏印象一期商6号）', '24.431991', '98.56237', '芒市金孔雀大街贵州茅台专卖店', '德宏州宏达有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1065, '143430600001', '湖南省', '岳阳市', '岳阳楼区', '岳阳市岳阳楼区岳阳大道金鹗东路华瑞丹枫假日酒店西辅楼109-110号门面', '29.357003', '113.146665', '岳阳市岳阳大道贵州茅台专卖店', '岳阳市森茂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1066, '2336078400001', '江西省', '赣州市', '章贡区', '赣州市章贡区章江路18号公园大观1-2号店铺', '25.816348', '114.919417', '赣州市章江路茅台酱香万家共享主题终端', '赣州列奇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1067, '34410100087013001', '河南省', '周口市', '川汇区', '周口市川汇区1', '33.647679', '114.650551', '周口酒驿站商贸有限公司中心库', '周口酒驿站商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1068, '223704000001', '山东省', '枣庄市', '薛城区', '枣庄市薛城区新城街道天穹星朗苑南门西侧从东向西第1-2间门市', '34.798313', '117.343011', '薛城区黄河路贵州茅台酱香系列酒体验中心', '山东万兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1069, '21511000007008', '四川省', '内江市', '东兴区', '内江市东兴区四川省内江市东兴区北环路999号八幢商铺1、号', '29.608411', '105.04315', '内江东兴区柯锋商贸有限责任公司', '内江市润泽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1070, '144441500002', '广东省', '汕尾市', '城区', '汕尾市城区东涌镇站前路迎宾大道星河湾二期商业街31-34号铺贵州茅台', '22.786619', '115.4225', '汕尾市站前路迎宾大道贵州茅台专卖店', '汕尾市宏祥贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1071, '113130193001', '河北省', '石家庄市', '裕华区', '石家庄市裕华区青园街311号', '38.01705', '114.518354', '石家庄市青园街贵州茅台专卖店', '河北省国控食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1072, '143431100001', '湖南省', '永州市', '冷水滩区', '永州市冷水滩区永州大道与花园路交汇处东南侧中旗.天悦府5栋11号-13号', '26.435518', '111.62698', '永州市永州大道贵州茅台专卖店', '永州市福德贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1073, '144440194002', '广东省', '广州市', '黄埔区', '广州市黄埔区大沙地西80号102房', '23.101311', '113.443489', '广州市大沙地西贵州茅台专卖店', '广州赤水河贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1074, '144440194001', '广东省', '广州市', '南沙区', '广州市南沙区南沙区环市大道中阳光城澜悦8Y109号铺', '22.811597', '113.542188', '广州市环市大道贵州茅台专卖店', '广州仁尊贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1075, '136360700002', '江西省', '赣州市', '章贡区', '赣州市章贡区橙乡大道8号嘉福·尚江府9号楼5#6#7#8#商铺', '25.820942', '114.90135', '赣州市橙乡大道贵州茅台专卖店', '赣州市中正贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1076, '21330125001002', '浙江省', '杭州市', '桐庐县', '杭州市桐庐县桐庐县滨江路1131号', '29.79418', '119.691755', '杭州久九酒贸易有限公司', '杭州宏强酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1077, '2335032300003', '福建省', '莆田市', '秀屿区', '莆田市秀屿区笏石镇霞厝街288号国投城市广场A区13号楼102室', '25.35188', '119.068533', '莆田市笏石镇霞厝街茅台酱香万家共享主题终端', '莆田市永盛世纪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1078, '130501001', '河北省', '邢台市', '市辖区', '邢台市市辖区河北省邢台市襄都区开元北路金城商务楼5号', '37.087204', '114.51492', '邢台冰河商贸有限公司中心库', '邢台冰河商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1079, '136360127001', '江西省', '南昌市', '西湖区', '南昌市西湖区永富路255号世纪朝阳小区1楼105、106、107室', '28.627456', '115.858982', '南昌市永富路贵州茅台专卖店', '南昌清鑫商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1080, '134342502001', '安徽省', '宣城市', '宁国市', '宣城市宁国市宁国大道华贝广场s6栋1004-1005', '30.636736', '118.982326', '宁国市宁国大道贵州茅台专卖店', '宁国市丰尚名酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1081, 'B21010100135', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区十三纬路58号', '41.78606', '123.426809', '沈阳浩维实业有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1082, 'B21010100136', '辽宁省', '沈阳市', '和平区', '沈阳市和平区沈阳市和平区香港路140号', '41.7565', '123.419117', '沈阳浩维实业有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1083, 'B21010100137', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区沈阳市浑南区三义街28-4号茅台专卖店', '41.741129', '123.452244', '沈阳恩云商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1084, 'B21010100138', '辽宁省', '沈阳市', '于洪区', '沈阳市于洪区沈阳市于洪区细河南路175号8门茅台专卖店', '41.763172', '123.359834', '沈阳隆茗惠商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1085, 'B21010100139', '辽宁省', '沈阳市', '大东区', '沈阳市大东区沈阳市大东区沈铁路90号1门', '41.835877', '123.488316', '辽宁广利祺商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1086, '2332070000001', '江苏省', '连云港市', '海州区', '连云港市海州区海昌南路8-3号', '34.595192', '119.180116', '连云港市海昌南路茅台酱香万家共享主题终端', '连云港市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1087, '110105083005', '四川省', '成都市', '武侯区', '成都市武侯区飞云三巷132号1层', '30.617661', '104.078376', '四川华酱源商贸有限公司中心库', '四川华酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1088, '132320584001', '江苏省', '苏州市', '吴江区', '苏州市吴江区松陵镇中山南路2091号', '31.15399', '120.64266', '苏州市中山南路贵州茅台专卖店', '苏州市松陵商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1089, '2352273400004', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市环城西路滨江-号1、2栋1层21号', '26.3', '107.51', '都匀市环城西路茅台酱香万家共享主题终端', '贵州九福熙和贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1090, '2352273400003', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市广惠街道汽运沿河11-5门面', '26.270324', '107.51629', '都匀市广惠街道茅台酱香万家共享主题终端', '黔南州诚泰福贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1091, '2352273400002', '贵州省', '黔南布依族苗族自治州', '瓮安县', '黔南布依族苗族自治州瓮安县雍阳办事处河滨社区中华路5号楼34号', '27.073053', '107.473626', '瓮安县中华路茅台酱香万家共享主题终端', '贵州长安商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1092, '2352273400001', '贵州省', '黔南布依族苗族自治州', '都匀市', '黔南布依族苗族自治州都匀市西山大道中段天-云璟5栋107门面', '26.28', '107.51', '都匀市西山大道茅台酱香万家共享主题终端', '贵州都匀市海俊源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1093, '110105083004', '重庆市', '重庆市', '渝北区', '重庆市渝北区仙桃街道舟济路38号19—2—A66', '29.719223', '106.601694', '重庆华酱源商贸有限公司中心库', '重庆华酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1094, 'B21010100130', '辽宁省', '大连市', '金州区', '大连市金州区辽宁省大连市金州区光明街道五一路16-7号1-2层', '39.096506', '121.701253', '大连远智酒类商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1095, '110105083003', '贵州省', '贵阳市', '南明区', '贵阳市南明区贵州省贵阳市经济技术开发区毛寨村龙江巷1号 （贵州省生物研究所办公大楼）二楼1-2号', '26.504725', '106.711906', '贵州特色特产有限公司中心库', '贵州特色特产有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1096, 'B21010100131', '辽宁省', '大连市', '瓦房店市', '大连市瓦房店市辽宁省大连市瓦房店市岗店办事处西长春路西段147-27号', '39.627214', '121.973587', '大连嘉轩酒类商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1097, 'B21010100132', '辽宁省', '大连市', '庄河市', '大连市庄河市辽宁省大连市庄河市城关街道向阳路二段516号', '39.688005', '122.970939', '大连泛瑞酒类商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1098, '22522428005001', '贵州省', '毕节市', '赫章县', '毕节市赫章县广建路中段（桂花苑中段3号门面）', '27.12', '104.73', '赫章县广建路茅台酱香万家共享主题终端', '赫章县钦鸿商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1099, 'B21010100133', '辽宁省', '大连市', '甘井子区', '大连市甘井子区辽宁省大连市甘井子区中华西路135号', '38.990321', '121.57973', '大连远新宏玺酒类商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1100, 'B21010100134', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区热闹路10号', '41.7872', '123.437835', '沈阳明逸商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1101, '231200001', '黑龙江省', '绥化市', '市辖区', '绥化市市辖区 绥化市碧桂园小区132栋7号商服', '45.742253', '126.661998', '黑龙江盛梵生物科技有限公司中心库', '黑龙江盛梵生物科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1102, '610101001', '陕西省', '西安市', '市辖区', '西安市市辖区陕西省西安市高新区唐延南路都市之门D座2幢1单元10110室', '0.0', '0.0', '西安仟鼎实业有限公司中心库', '西安仟鼎实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1103, '211110106002', '北京市', '北京市', '大兴区', '北京市大兴区永大路1号院9号楼101', '39.689851', '116.321541', '北京市永大路贵州茅台专卖店', '北京九旺源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1104, '133330727001', '浙江省', '金华市', '磐安县', '金华市磐安县磐安县安文街道南园路18号贵州茅台专卖店', '29.039292', '120.4405', '磐安县南园路贵州茅台专卖店', '浙江汇丰源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1105, '137370523002', '山东省', '东营市', '广饶县', '东营市广饶县广饶街道办乐安大街997号', '37.053872', '118.437718', '东营市乐安大街贵州茅台专卖店', '东营富诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1106, '152522635002', '贵州省', '黔东南苗族侗族自治州', '麻江县', '黔东南苗族侗族自治州麻江县麻江县广建中华城8栋5.6.7号门面', '26.493356', '107.586852', '麻江县马鞍山大道贵州茅台专卖店', '麻江铭兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1107, '151510528001', '四川省', '泸州市', '龙马潭区', '泸州市龙马潭区蜀泸大道三段自贸区总部基地2栋一层189号，191号', '28.928744', '105.399803', '泸州市蜀泸大道三段贵州茅台专卖店', '泸州浩昇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1108, '22420693002001', '湖北省', '襄阳市', '樊城区', '襄阳市樊城区中原街道雄风社区中原路2号雄风社区维也纳酒店旁', '32.060019', '112.150928', '樊城区中原路2号茅台酱香万家共享主题终端', '襄阳市真诚祥瑞酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1109, '142429005001', '湖北省', '潜江市', '潜江市', '潜江市潜江市潜阳西路18号', '30.418904', '112.877106', '潜江市潜阳西路贵州茅台专卖店', '湖北君筵商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1110, '211110106008', '北京市', '北京市', '大兴区', '北京市大兴区西红门北一街1号院1号楼107', '39.792253', '116.343382', '北京市宏欣路贵州茅台专卖店', '北京怡福康宝商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1111, '144440800002', '广东省', '湛江市', '赤坎区', '湛江市赤坎区海田路5号华盛新城商住小区综合楼、公司用房一层B区', '21.281132', '110.375293', '湛江市海田路贵州茅台专卖店', '湛江市金爵酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1112, '144440800001', '广东省', '湛江市', '赤坎区', '湛江市赤坎区海丰路39号蓝海丽舍4幢1层03、04号商铺', '21.270227', '110.38661', '湛江市海丰路贵州茅台专卖店', '湛江市民大酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1113, '123231000001', '黑龙江省', '牡丹江市', '东安区', '牡丹江市东安区黑龙江省牡丹江市东安区东四条路330号（福民街与清福街之间道西）', '44.578583', '129.632044', '牡丹江市东四条路贵州茅台专卖店', '牡丹江红凯博酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1114, '123230500002', '黑龙江省', '双鸭山市', '尖山区', '双鸭山市尖山区三马路80号', '46.6363', '131.153845', '双鸭山市三马路贵州茅台专卖店', '双鸭山市正合食品经销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1115, 'B21010100124', '辽宁省', '沈阳市', '铁西区', '沈阳市铁西区辽宁省沈阳市铁西区云峰北街25号', '41.796061', '123.380605', '辽宁鑫源英民名酒连锁经营有限公司云峰北街专卖店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1116, 'B21010100125', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区文化东路18号', '41.76984', '123.463114', '辽宁鑫源英民名酒连锁经营有限公司文化东路专卖店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1117, 'B21010100126', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区团结路59-9号', '41.813173', '123.443735', '辽宁鑫源英民名酒连锁经营有限公司团结路专卖店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1118, 'B21010100127', '辽宁省', '沈阳市', '皇姑区', '沈阳市皇姑区辽宁省沈阳市皇姑区昆山西路25-5号', '41.823595', '123.39433', '辽宁鑫源英民名酒连锁经营有限公司昆山西路专卖店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1119, 'B21010100128', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区辽宁省沈阳市浑南区全运三路99-3号', '41.679127', '123.466074', '辽宁紫霖实业有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1120, '2111010510001', '北京市', '北京市', '朝阳区', '北京市朝阳区来广营镇红军营东路亚奥金茂悦小区东门', '40.0255225488758', '116.436843127012', '北京市亚奥金茂悦北京盛扬国际贸易有限公司门店', '北京盛扬国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1121, 'B13010400101', '河北省', '石家庄市', '桥西区', '石家庄市桥西区河北省石家庄市裕华区裕华万达广场娱乐楼一层W106-1商铺', '38.040535', '114.479341', '石家庄市裕华区裕华万达广场娱乐楼一层W106-1商铺贵州茅台', '河北茅小创供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1122, 'B21010100129', '辽宁省', '大连市', '中山区', '大连市中山区辽宁省大连市中山区鲁迅路191号1单元3层26号', '38.918901', '121.670658', '大连川连国际商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1123, '244445200001', '广东省', '揭阳市', '榕城区', '揭阳市榕城区榕江一品商业街馨园112-113号铺', '23.54187', '116.3777', '揭阳市榕江一品商业街贵州茅台专卖店', '揭阳市贵源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1124, '23520325004001', '贵州省', '遵义市', '道真仡佬族苗族自治县', '遵义市道真仡佬族苗族自治县上坝土家族乡民顺社区竹王大道金瑞中心城2栋1-3号商铺', '28.851177', '107.600042', '道真县竹王大道贵州茅台酱香系列酒体验中心', '贵州营林生态农业产业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1125, '22140526001001', '山西省', '晋城市', '城区', '晋城市城区城区白水街白水印象小区西门12号楼6号商铺', '37.87699', '112.55639', '晋城市白水街茅台酱香万家共享主题终端', '晋城汇通天下商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1126, '2111010510006', '北京市', '北京市', '通州区', '北京市通州区北京市通州区运河西大街15号1、2层', '39.90966', '116.65716', '北京市运河西大街北京昌福金泰商贸有限公司门店', '北京昌福金泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1127, '141410300002', '河南省', '洛阳市', '涧西区', '洛阳市涧西区南昌路一品天下门面房', '34.654118', '112.401476', '洛阳市南昌路贵州茅台专卖店', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1128, 'B21010100120', '辽宁省', '沈阳市', '沈北新区', '沈阳市沈北新区沈阳市沈北新区沈北路21-1号3门、4门', '41.92016', '123.397213', '沈阳雷明国际贸易有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1129, '137371425003', '山东省', '济南市', '历下区', '济南市历下区荆山路6号黄金99御园1号配套公建1单元104.105室', '36.642367', '117.083342', '济南市荆山路贵州茅台专卖店', '济南恒义和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1130, '141410300003', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区宜人路与长兴街交叉口东北角', '34.626685', '112.45761', '洛阳市宜人路贵州茅台专卖店', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1131, 'B21010100121', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区辽宁省沈阳市浑南区智慧四街20-2号（1门）', '41.673323', '123.462757', '沈阳酱源商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1132, '211110106010', '北京市', '北京市', '大兴区', '北京市大兴区盛坊路与广阳大街交叉路西北角盛坊路 5 号院 6 号楼元宇宙大厦底商', '39.769728', '116.354215', '北京市广阳大街贵州茅台专卖店', '北京兴吉珊贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1133, 'B21010100122', '辽宁省', '沈阳市', '大东区', '沈阳市大东区辽宁省沈阳市大东区东北大马路116-1号(7门)', '41.821011', '123.480963', '沈阳西平商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1134, 'B21010100123', '辽宁省', '沈阳市', '和平区', '沈阳市和平区辽宁省沈阳市和平区南京南街147号', '41.763538', '123.393805', '辽宁鑫源英民名酒连锁经营有限公司南京南街专卖店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1135, '340311001', '安徽省', '蚌埠市', '淮上区', '蚌埠市淮上区安徽省蚌埠市淮上区上河路357号', '0.0', '0.0', '安徽亿发久糖酒超市连锁有限公司中心库', '安徽亿发久糖酒超市连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1136, '211110106012', '北京市', '北京市', '丰台区', '北京市丰台区新发地京良桥西侧2000米路北丰和顺市场1号交易厅商01号', '39.802048', '116.334102', '北京市京良路贵州茅台43度经销（茅台酒）', '北京君威盛海商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1137, '2141130010001', '河南省', '南阳市', '宛城区', '南阳市宛城区南阳市人民路两相路交叉口向东100米', '33.03338', '112.54628', '南阳市人民路酱香万家共享主题终端', '南阳市万德隆商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1138, '211110106013', '北京市', '北京市', '大兴区', '北京市大兴区西红门镇九龙山庄欣旺北大街5号院', '39.801847', '116.342048', '北京欣荣北大街贵州茅台43度经销（茅台酒）', '北京晟瑞达源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1139, '2132100010001', '江苏省', '扬州市', '宝应县', '扬州市宝应县苏中南路117号', '33.22572', '119.316597', '宝应县苏中南路宝应县中豪商贸经营部门店', '宝应县中豪商贸经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1140, '132320985001', '江苏省', '盐城市', '盐都区', '盐城市盐都区盐南高新区新都街道南港路15号云璟府102、103、132室', '33.334943', '120.16807', '盐城市南港路贵州茅台专卖店', '盐城市鸿宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1141, '133330521001', '浙江省', '湖州市', '德清县', '湖州市德清县舞阳街道英溪南路507-511号', '30.526036', '119.963157', '德清县英溪南路贵州茅台专卖店', '德清日益酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1142, '141411523001', '河南省', '信阳市', '新县', '信阳市新县潢河北路政府门面房16号贵州茅台专卖店', '31.645387', '114.879801', '新县潢河北路贵州茅台专卖店', '信阳市诚信酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1143, '142420135001', '湖北省', '武汉市', '武昌区', '武汉市武昌区水果湖街中北路173号、175号武汉中央文化区K4a地块一期P2b栋', '30.559453', '114.344367', '武汉市中北路贵州茅台专卖店', '武汉永隆酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1144, '2341100100001', '河南省', '许昌市', '魏都区', '许昌市魏都区东城区学府街与德兴路交叉口', '34.043512', '113.861141', '许昌市学府街茅台酱香万家共享主题终端', '许昌亨源通商业管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1145, '224127010001', '河南省', '周口市', '川汇区', '周口市川汇区周口市太昊路北侧工农路东侧17号楼', '33.593437', '114.665005', '周口市太昊路贵州茅台酱香系列酒体验中心', '河南景隆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1146, '21140200003004', '山西省', '大同市', '平城区', '大同市平城区山西省大同市平城区永泰街道永泰南路亿方园底商41号', '40.056863', '113.302665', '汇荣商贸', '大同市惠恩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1147, '23453007002003', '广西壮族自治区', '河池市', '宜州区', '河池市宜州区广西河池市宜州区庆远镇龙溪大道与南山路交角豪门广场2？41、42、43号商铺', '24.491813', '108.641179', '茅台酱香系列酒体验中心（河池摆渡酒业）', '河池摆渡酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1148, '2361060000001', '陕西省', '延安市', '宝塔区', '延安市宝塔区百米大道融信园小区门面', '36.617318', '109.530802', '延安市百米大道茅台酱香万家共享主题终端', '陕西天行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1149, 'B11011500101', '北京市', '北京市', '大兴区', '北京市大兴区北京市大兴区经济开发区科苑路9号3号楼二层S3208室', '39.755971', '116.348429', '本来生活网', '北京本来工坊科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1150, '141410381001', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区白塔路与光武大道路口东北角商铺', '34.628057', '112.575841', '洛阳市白塔路贵州茅台专卖店', '洛阳鸿州商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1151, 'B21010100113', '辽宁省', '丹东市', '振兴区', '丹东市振兴区辽宁省丹东市振兴区 青年大街72-2-9 富贵家园 停车场入口第一个门市（贵州茅台）', '40.113326', '124.375724', '丹东耘悦商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1152, '441481001', '广东省', '梅州市', '兴宁市', '梅州市兴宁市兴南大道毅德城一号交易广场41栋6A号商铺', '24.10968', '115.733963', '梅州市红兴酒业发展有限公司中心库', '梅州市红兴酒业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1153, '121210200001', '辽宁省', '大连市', '中山区', '大连市中山区港隆路50号', '38.924416', '121.67662', '大连市港隆路贵州茅台专卖店', '大连川连国际商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1154, 'B21010100114', '辽宁省', '锦州市', '凌河区', '锦州市凌河区锦州凌河区解放路七段26号3-134贵州茅台酒', '41.11126', '121.145718', '锦州金业商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1155, 'B21010100115', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区沈阳市浑南区全运路97—3号贵州茅台', '41.681909', '123.474717', '沈阳益丰商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1156, 'B21010100116', '辽宁省', '沈阳市', '铁西区', '沈阳市铁西区沈阳市沈阳市铁西区沈辽西路27号，盛京大天地北1门西侧门市，茅台专卖店', '41.777033', '123.332632', '（沈阳）辽宁兴隆超市连锁有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1157, '34410100087025001', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区1', '34.771296', '111.188552', '三门峡昱成商贸有限公司中心库', '三门峡昱成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1158, '141410324002', '河南省', '洛阳市', '栾川县', '洛阳市栾川县滨河大道与安康路交叉口洛百烟酒商铺', '33.783367', '111.64283', '栾川县滨河大道贵州茅台专卖店', '洛阳酒兮供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1159, 'B21010100117', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区盘锦市兴隆台区蓝色康桥N区天玺城东门贵州茅台', '41.112619', '122.098005', '（盘锦）辽宁兴隆超市连锁有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1160, '142420686001', '湖北省', '襄阳市', '谷城县', '襄阳市谷城县沿河西路104-105号', '32.252901', '111.642361', '谷城县沿河西路贵州茅台专卖店', '襄阳群星利糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1161, 'B21010100118', '辽宁省', '铁岭市', '铁岭县', '铁岭市铁岭县辽宁省铁岭市铁岭县新城区黑龙江路富力四季半岛一期门市贵州茅台专卖店', '42.254543', '123.729556', '铁岭君华商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1162, '121210200008', '辽宁省', '大连市', '金州区', '大连市金州区光明街道五一路16-7号', '39.096378', '121.701406', '大连市五一路贵州茅台专卖店', '大连远智酒类商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1163, 'B21010100119', '辽宁省', '铁岭市', '开原市', '铁岭市开原市辽宁省铁岭市开原市地王国际花园新华路31号-1贵州茅台专卖店', '42.546905', '124.038163', '开原盛华食品商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1164, '121210200007', '辽宁省', '大连市', '甘井子区', '大连市甘井子区中华西路135号', '38.990321', '121.57973', '大连市中华西路贵州茅台专卖店', '大连远新宏玺酒类商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1165, 'B44030401603', '广东省', '深圳市', '市辖区', '深圳市市辖区深业上城三楼小镇茅台冰淇淋', '22.557091', '114.070306', '深圳市深业上城三楼小镇茅台冰淇淋贵州茅台体验店', '深圳茅佳良品食品管理有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1166, '22310108009001', '上海市', '上海市', '闵行区', '上海市闵行区漕宝路1018号', '31.161374', '121.401642', '闵行区漕宝路茅台酱香万家共享主题终端', '上海常伊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1167, 'B44030401602', '广东省', '深圳市', '南山区', '深圳市南山区南山区太子路蛇口海上世界船前广场一楼茅台冰淇淋', '22.483032', '113.916697', '深圳市蛇口海上世界船前广场一楼茅台冰淇淋贵州茅台体验店', '深圳茅佳良品食品管理有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1168, 'B44030401601', '广东省', '深圳市', '福田区', '深圳市福田区广东省深圳市福田区福田街道福山社区福华三路与金田路交界处东南侧卓越世纪中心，皇庭商务中心卓越世纪中心1层L103-2', '22.532045', '114.064596', '深圳市福田区福田街道福山社区福华三路贵州茅台旗舰店', '深圳茅佳良品食品管理有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1169, '22410700010001', '河南省', '新乡市', '红旗区', '新乡市红旗区河南省新乡市红旗区渠东人民东路366号忆通·壹世界3号楼101室、102室', '35.301762', '113.909737', '红旗区人民东路茅台酱香万家共享主题终端', '河南茅酱酒业销售有限公司新乡分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1170, 'B21010100110', '辽宁省', '营口市', '站前区', '营口市站前区营口南开吉祥商贸有限公司地址：营口市站前区盼盼路北31-9贵州茅台专卖店', '40.656138', '122.248562', '庞威（南开吉祥）', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1171, '121210200011', '辽宁省', '大连市', '沙河口区', '大连市沙河口区星海广场F区7-7号', '38.886737', '121.592564', '大连市星河街贵州茅台专卖店', '大连香原溪实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1172, 'B21010100111', '辽宁省', '营口市', '鲅鱼圈区', '营口市鲅鱼圈区营口威泽商贸有限公司地址：营口市鲅鱼圈区32-清华园二期超市-9#门市贵州茅台专卖店', '40.254739', '122.132267', '庞威（营口威泽商贸）', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1173, 'B21010100112', '辽宁省', '营口市', '大石桥市', '营口市大石桥市大石桥祥泽商贸有限公司地址：大石桥市繁荣大街70号百亿悦府1#106.107号贵州茅台专卖店', '40.637508', '122.509385', '庞威(大石桥祥泽店）', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1174, '243430182002', '湖南省', '长沙市', '雨花区', '长沙市雨花区高桥街道办事处火焰社区4区2栋1号1楼', '28.174356', '113.021246', '长沙市民主路贵州茅台43度经销店', '长沙高裕达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1175, '2321088500001', '辽宁省', '营口市', '鲅鱼圈区', '营口市鲅鱼圈区熊岳镇幸福社区熊岳河路东55号', '40.17239', '122.142897', '营口市熊岳镇茅台酱香万家共享主题终端', '营口霖昊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1176, '115153309001', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区迎宾路13号开远广场东侧底商', '39.812605', '109.967869', '鄂尔多斯市迎宾路贵州茅台专卖店', '鄂尔多斯市昌福盈泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1177, '243430182001', '湖南省', '长沙市', '芙蓉区', '长沙市芙蓉区朝阳街道朝阳前街9号湖南友谊阿波罗商业股份有限公司友阿总部办公大楼一楼', '28.187196', '113.007168', '长沙市朝阳前街贵州茅台专卖店', '湖南友谊阿波罗商业股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1178, '135350122001', '福建省', '福州市', '晋安区', '福州市晋安区鼓山镇连洋西路169号中海万锦花园15#楼1-2层09和10商业服务网点', '26.070896', '119.34199', '福州市连洋西路贵州茅台专卖店（鼓山镇）', '福州铭久酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1179, '150500223001', '重庆市', '重庆市', '潼南区', '重庆市潼南区桂林街道办事处向阳路169号12幢171号', '30.195421', '105.84209', '重庆市向阳路贵州茅台专卖店', '重庆乾恒来商贸有限公司潼南分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1180, '22110105097001', '北京市', '北京市', '东城区', '北京市东城区北京市东城区南河沿大街86号', '39.91045', '116.40698', '南河沿大街茅台酱香万家共享主题终端', '北京华胜航空服务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1181, '2137148310001', '山东省', '德州市', '德城区', '德州市德城区经济技术开发区宋官屯街道办事处东方红东路小申新村沿街楼7号', '37.439035', '116.367422', '德州市东方红东路德州市丰永商贸有限公司门店', '德州市丰永商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1182, '2333020000002', '浙江省', '宁波市', '镇海区', '宁波市镇海区骆驼街道福业街178号', '29.968302', '121.594188', '宁波市福业街茅台酱香万家共享主题终端', '宁波万堂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1183, '22411103001001', '河南省', '漯河市', '郾城区', '漯河市郾城区舟山路辽河路交叉口北50米路西', '33.59', '114.04', '漯河市舟山路茅台酱香万家共享主题终端', '漯河市聚鑫添福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1184, 'B21010100102', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区辽宁省沈阳市', '41.751142', '123.524526', '沈阳冰淇淋专卖店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1185, '510100029005', '四川省', '成都市', '锦江区', '成都市锦江区棣棠路908、909、910号', '30.595699', '104.124151', '成都市棣棠路贵州茅台专卖店', '成都市可飞达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1186, 'B21010100103', '辽宁省', '辽阳市', '太子河区', '辽阳市太子河区辽宁省辽阳市太子河区东宁卫乡 宣儒酒文化馆', '41.253277', '123.181782', '辽阳醇香糖酒有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1187, '22522734006007', '贵州省', '黔南布依族苗族自治州', '福泉市', '黔南布依族苗族自治州福泉市贵州省黔南州福泉市葛镜路平越壹号南苑1层4号、5号门面', '26.68399', '107.522215', '福泉市巽阳烟酒店', '贵州都匀市海俊源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1188, '24153200001002', '内蒙古自治区', '乌兰察布市', '集宁区', '乌兰察布市集宁区内蒙古自治区乌兰察布市集宁区新区杜尔伯特东大街与泰昌南路交汇处18-商业-1011商铺', '40.984889', '113.152386', '内蒙古对君酌酒业有限公司', '内蒙古对君酌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1189, 'B21010100104', '辽宁省', '朝阳市', '双塔区', '朝阳市双塔区辽宁省朝阳市双塔区燕北街道贵州茅台专卖店', '41.585228', '120.457048', '朝阳市宏程商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1190, 'B21010100105', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区北三经街41号', '41.797494', '123.42554', '沈阳副食糖酒有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1191, 'B21010100106', '辽宁省', '大连市', '沙河口区', '大连市沙河口区辽宁省大连市沙河口区星海广场F区7-7号', '38.886737', '121.592564', '大连香源溪实业有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1192, 'B21010100107', '辽宁省', '鞍山市', '铁东区', '鞍山市铁东区辽宁省鞍山市铁东区万和街127栋一层', '41.077388', '123.029989', '鞍山美好嘉里商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1193, 'B21010100108', '辽宁省', '大连市', '西岗区', '大连市西岗区辽宁省大连市西岗区新开路93C-1号', '38.916688', '121.616783', '大连润德商业有限公司西岗区分公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1194, 'B21010100109', '辽宁省', '葫芦岛市', '龙港区', '葫芦岛市龙港区辽宁省葫芦岛市龙港区海晏北路紫御豪庭二号楼门市', '40.680141', '120.809085', '权奥（葫芦岛长宏酒业）', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1195, '113130181001', '河北省', '石家庄市', '无极县', '石家庄市无极县科技南街19号', '38.173946', '114.957973', '石家庄市科技南街贵州茅台专卖店', '河北正醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1196, '22360126002002', '江西省', '南昌市', '西湖区', '南昌市西湖区桃苑大街29号', '28.659523', '115.892756', '西湖区桃苑大街茅台酱香万家共享主题终端', '南昌市飞马实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1197, '151510322001', '四川省', '泸州市', '泸县', '泸州市泸县玉蟾街道玉蟾大道西段545/547/549/551号', '29.152112', '105.335094', '泸县玉蟾大道贵州茅台专卖店', '四川省泸州久丰久盛酒类营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1198, '162622921001', '甘肃省', '临夏回族自治州', '临夏市', '临夏回族自治州临夏市民主西路18号1栋103', '35.602127', '103.202599', '临夏市民主西路贵州茅台专卖店', '临夏州玉峰糖酒副食有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1199, 'B21010100100', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区中街路168号', '41.802184', '123.457329', '辽宁省区辽宁省区贵州茅台旗舰店总库', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1200, 'B21010100101', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区辽宁省沈阳市沈河区中街路168号', '41.802184', '123.457329', '沈阳市中街路168号贵州茅台旗舰店', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1201, '252520185001', '贵州省', '贵阳市', '乌当区', '贵阳市乌当区顺海中路88号保利温泉新城演艺中心', '26.610763', '106.759201', '贵阳市顺海中路贵州茅台专卖店', '贵州宏成远贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1202, '23430700001003', '湖南省', '常德市', '武陵区', '常德市武陵区常德市武陵区南坪街道望月社区皂果路1252号', '29.062584', '111.682833', '武陵区皂果路贵州茅台酱香系列酒体验中心', '常德市金祥龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1203, '145450521001', '广西壮族自治区', '北海市', '合浦县', '北海市合浦县廉东大道89号', '21.665446', '109.207295', '合浦县廉东大道贵州茅台专卖店', '北海市茅畬酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1204, '2241110000101', '河南省', '漯河市', '郾城区', '漯河市郾城区黄山路与淞江路口北100米未来花园门面房', '33.59796', '114.02002', '郾城区黄山路贵州茅台酱香系列酒体验中心', '漯河市华银商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1205, '22450800005001', '广西壮族自治区', '贵港市', '港北区', '贵港市港北区华泰官邸10-101号商铺', '23.11', '109.57', '港北区迎宾大道茅台酱香万家共享主题终端', '贵港市云宏商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1206, '23430700001004', '湖南省', '常德市', '武陵区', '常德市武陵区南坪街道望月社区皂果路1252号', '29.062695', '111.682805', '武陵区皂果路贵州茅台酱香系列酒体验中心', '常德市金祥龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1207, '152522728001', '贵州省', '黔南布依族苗族自治州', '罗甸县', '黔南布依族苗族自治州罗甸县贵州省黔南州罗甸县龙坪镇湖滨大道西段南侧江海新天地第三栋一单元一层4号', '25.428628', '106.757953', '罗甸县湖滨大道贵州茅台专卖店', '罗甸润正商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1208, '2151068410001', '四川省', '德阳市', '旌阳区', '德阳市旌阳区白河巷104号', '31.131754', '104.383002', '德阳市白河巷德阳市区星辉商贸部店', '德阳市区星辉商贸部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1209, '34623200004001', '云南省', '玉溪市', '红塔区', '玉溪市红塔区聂耳路62号中玉酒店1层1-2商铺', '24.347934', '102.551386', '云南吉晟昌商贸有限公司中心库', '云南吉晟昌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1210, '100330681001', '浙江省', '绍兴市', '越城区', '绍兴市越城区浙江省绍兴市越城区迪荡街道东池路62号', '30.005667', '120.5933', '绍兴市东池路贵州茅台专卖店', '绍兴市田源食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1211, '224110230001', '河南省', '许昌市', '建安区', '许昌市建安区示范区明礼街中德科技园3号楼104', '34.073251', '113.874846', '许昌市明礼街贵州茅台酱香系列酒体验中心', '许昌富乐贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1212, '137371526003', '山东省', '聊城市', '高唐县', '聊城市高唐县滨湖南路2号百合新城商业1-8、1-9号', '36.842451', '116.214461', '高唐县滨湖南路贵州茅台专卖店', '高唐县盛世金玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1213, '263630100002', '青海省', '西宁市', '城西区', '西宁市城西区胜利路25号2号楼25-17 25-19 25-21', '36.631105', '101.765978', '西宁市胜利路贵州茅台43度经销（茅台酒）', '青海汇忠商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1214, '372330001002', '山东省', '滨州市', '邹平市', '滨州市邹平市醴泉五路北首黄西村沿街房9-8号', '36.863439', '117.74919', '滨州市邹平市醴泉五路贵州茅台专卖店', '邹平宜和贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1215, 'B50010303003', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区 重庆市沙坪坝区磁兴街 1号附22号负2-69', '29.578427', '106.447144', '重庆市沙坪坝区磁兴街 1号附22号负2-69贵州茅台体验店', '重庆嘉凌冰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1216, '22411481001001', '河南省', '商丘市', '永城市', '商丘市永城市河南省商丘市永城市雪枫街道欧亚路208号', '33.940824', '116.446473', '永城市欧亚路友谊小区茅台酱香万家共享主题终端', '永城市豫达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1217, 'B50010303002', '重庆市', '重庆市', '渝中区', '重庆市渝中区重庆市渝中区解放碑街道青年路18号1层F1007', '29.557575', '106.575357', '重庆市渝中区解放碑街道贵州茅台旗舰店总库', '重庆嘉凌冰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1218, 'B50010303001', '重庆市', '重庆市', '渝中区', '重庆市渝中区重庆市渝中区解放碑街道青年路18号1层F1007', '29.557616', '106.575381', '重庆市渝中区解放碑街道贵州茅台旗舰店', '重庆嘉凌冰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1219, '2152038210001', '四川省', '成都市', '高新区', '成都市高新区天府大道北段1700号环球中心E1负-楼乐天超市旁', '30.5663340995534', '104.065380007837', '成都市天府大道四川玖厂到店供应链管理有限公司门店', '四川玖厂到店供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1220, 'B50010303000', '重庆市', '重庆市', '渝中区', '重庆市渝中区重庆市渝中区解放碑街道青年路18号1层F1007', '29.557616', '106.575381', '重庆旗舰店总库', '重庆嘉凌冰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1221, '152520100006', '贵州省', '贵阳市', '南明区', '贵阳市南明区博爱路4号', '26.572254', '106.711482', '贵阳市博爱路贵州茅台专卖店', '贵州汇海源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1222, '231310101002', '上海市', '上海市', '黄浦区', '上海市黄浦区斜土东路266号', '31.207282', '121.486564', '上海市斜土东路贵州茅台专卖店', '上海循达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1223, '233330289001', '浙江省', '宁波市', '鄞州区', '宁波市鄞州区甬港北路66号、68号、70号', '29.86456', '121.575186', '宁波市甬港北路贵州茅台专卖店', '宁波市鄞州甬南酒类营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1224, '152520100004', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区水东路未来方舟D1组团风情商业街D1组团1层1号', '26.590369', '106.767512', '贵阳市水东路贵州茅台专卖店（未来方舟D1）', '贵州禾木行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1225, '137371300003', '山东省', '临沂市', '兰山区', '临沂市兰山区金雀山路10号开元上城1号楼105室', '35.050512', '118.357852', '临沂市金雀山路贵州茅台专卖店', '临沂佳美酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1226, '111110109001', '北京市', '北京市', '门头沟区', '北京市门头沟区新城大街领汇长安底商102号', '39.910369', '116.121246', '北京市新城大街贵州茅台专卖店', '北京柘苑商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1227, '111110227001', '北京市', '北京市', '怀柔区', '北京市怀柔区迎宾路商业街斜街与南马道东南45米', '40.314368', '116.636611', '北京市迎宾路贵州茅台专卖店', '北京怀都糖业烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1228, '137371300002', '山东省', '临沂市', '兰山区', '临沂市兰山区银雀山路贵州茅台专卖店', '35.060066', '118.324449', '临沂市银雀山路贵州茅台专卖店', '临沂德营商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1229, '133330784002', '浙江省', '金华市', '永康市', '金华市永康市城北东路820—826号', '28.904512', '120.051455', '永康市城北东路贵州茅台专卖店', '永康市酒源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1230, '152520100002', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区甲秀南路666号美的花溪院子G2栋1楼-5-6-7号', '26.404846', '106.664001', '贵阳市甲秀南路贵州茅台专卖店', '贵州仁德贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1231, '500107007004', '重庆市', '重庆市', '九龙坡区', '重庆市九龙坡区西彭镇白彭路1号1幢12号至15号', '29.309169', '106.328737', '重庆白彭路贵州茅台专卖店', '重庆灏达伟业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1232, '2337012600001', '山东省', '济南市', '商河县', '济南市商河县商河县育才路与文昌南街交叉口东南80米', '37.29036', '117.155091', '商河县育才路茅台酱香万家共享主题终端', '济南大商泽文贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1233, '213130300001', '河北省', '秦皇岛市', '海港区', '秦皇岛市海港区港城大街街道建设大街259-1号2楼', '39.942634', '119.609271', '秦皇岛市建设大街贵州茅台43度经销（茅台酒）', '秦皇岛乐煜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1234, '2246000300401', '海南省', '儋州市', '儋州市', '儋州市儋州市那大镇万国文旅城356#209商铺', '19.541523', '109.586933', '儋州市那大镇贵州茅台酱香系列酒体验中心', '儋州五自信酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1235, '23610700002001', '陕西省', '汉中市', '汉台区', '汉中市汉台区劳动东路2号', '33.078664', '107.035369', '汉台区劳动东路贵州茅台酱香系列酒体验中心', '汉中桃心岛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1236, '137370900001', '山东省', '泰安市', '泰山区', '泰安市泰山区东岳大街东段盘古天地商业区2号楼102', '36.192187', '117.147774', '泰安市东岳大街贵州茅台专卖店', '泰安华糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1237, '22321182005001', '江苏省', '镇江市', '扬中市', '镇江市扬中市三茅街道金苇路328号', '32.239827', '119.817452', '扬中市三茅街道金苇中路茅台酱香万家共享主题终端', '镇江市益加益烟酒茶有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1238, '244440187002', '广东省', '广州市', '海珠区', '广州市海珠区海天大厦首层103号广盐酒业', '23.103294', '113.247775', '广州市滨江西路贵州茅台专卖店', '广东省广盐酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1239, '22340483004001', '江西省', '九江市', '经济技术开发区', '九江市经济技术开发区经济技术开发区九龙街步红花园C区6栋S110-111号', '29.697653', '115.981414', '经济技术开发区九龙街主茅台酱香万家共享主题终端', '江西新酒商电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1240, '242420132001', '湖北省', '武汉市', '洪山区', '武汉市洪山区白沙二路22号', '30.48358', '114.273023', '武汉市白沙二路贵州茅台专卖店', '湖北国酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1241, '2341072100002', '河南省', '新乡市', '高新区', '新乡市高新区丰华路新飞花园门面房S2号21房', '35.270943', '113.90717', '新乡市丰华路茅台酱香万家共享主题终端', '新乡市优鲜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1242, '2341072100001', '河南省', '新乡市', '新乡县', '新乡市新乡县小冀镇京华路与和谐大道交叉口路南望锦花园3号楼', '35.182046', '113.778966', '新乡县京华路茅台酱香万家共享主题终端', '新乡市优鲜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1243, '133330386001', '浙江省', '温州市', '瓯海区', '温州市瓯海区沉木桥街云庭锦园3幢113、114、115室', '27.966097', '120.622702', '温州市沉木桥街贵州茅台专卖店', '温州晴天酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1244, '2213028900001', '河北省', '唐山市', '丰润区', '唐山市丰润区端明路城关医院对面', '39.830605', '118.133651', '唐山市端明路贵州茅台酱香系列酒体验中心', '唐山市丰润区川鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1245, '134342401001', '安徽省', '六安市', '裕安区', '六安市裕安区解放南路和顺名都城61号楼08商铺', '31.729831', '116.497511', '六安市解放南路贵州茅台专卖店', '六安市阳光商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1246, '152520100016', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区数博大道黎苏路30号远洋风景', '26.58756', '106.64995', '贵阳市数博大道贵州茅台专卖店', '贵州瑞信贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1247, '241411085001', '河南省', '许昌市', '魏都区', '许昌市魏都区竹林路鹿鸣湖壹号悦府商铺C116、C117、C118', '34.065735', '113.850915', '许昌市竹林路贵州茅台专卖店', '许昌隆新弘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1248, '2344030000001', '广东省', '深圳市', '南山区', '深圳市南山区蛇口街道翡翠海岸花园1号商铺', '22.487679', '113.940331', '深圳市蛇口街道茅台酱香万家共享主题终端', '深圳市溢香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1249, '137370900003', '山东省', '泰安市', '泰山区', '泰安市泰山区望岳东路22号中兴大厦一楼', '36.189824', '117.089539', '泰安市望岳东路贵州茅台专卖店', '泰安市传奇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1250, '2144030010003', '广东省', '深圳市', '罗湖区', '深圳市罗湖区笋岗街道田心社区宝岗北路美芝大华电视厂1号厂房1栋1层125A单元', '22.571036', '114.111066', '深圳市宝岗北路深圳市盟潮实业有限公司门店', '深圳市盟潮实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1251, '103205060001', '江苏省', '苏州市', '吴中区', '苏州市吴中区宝带东路399号2幢101室1045号', '31.265624', '120.632053', '苏州市宝带东路贵州茅台自营店', '江苏国酒茅台有限公司苏州分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1252, '2341038300001', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区展览路与永泰街交叉口西南角', '34.614034', '112.450152', '洛阳市展览路茅台酱香万家共享主题终端', '洛阳诚朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1253, '2341270200001', '河南省', '周口市', '项城市', '周口市项城市迎宾大道鑫苑名城小区北门口50米东', '33.458944', '114.882439', '项城市迎宾大道茅台酱香万家共享主题终端', '项城市富翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1254, '137370786002', '山东省', '潍坊市', '昌邑市', '潍坊市昌邑市富昌街107号（富昌街与解放路交汇处东北角） ', '36.861251', '119.404558', '昌邑市富昌街贵州茅台专卖店', '昌邑爱酒人酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1255, '115150400001', '内蒙古自治区', '赤峰市', '喀喇沁旗', '赤峰市喀喇沁旗牛家营子镇东北区（和美工贸产业园区东南3门A28幢）', '42.231', '118.884216', '赤峰市应昌街贵州茅台专卖店', '赤峰中烟金叶烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1256, '2337233000001', '山东省', '滨州市', '邹平市', '滨州市邹平市邹平县黄山街道办事处醴泉五路黄西村沿街房', '36.862605', '117.748656', '邹平县黄山街道茅台酱香万家共享主题终端', '邹平宜和贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1257, '136360400002', '江西省', '九江市', '浔阳区', '九江市浔阳区杭州路6号广域新里城8号楼101-102', '29.701199', '115.967606', '九江市杭州路贵州茅台专卖店', '九江福隆鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1258, '136360400003', '江西省', '九江市', '浔阳区', '九江市浔阳区滨江路浔阳江畔19栋一楼103门店', '29.736742', '116.009757', '九江市滨江路贵州茅台专卖店', '九江市东晟酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1259, '22622301002001', '甘肃省', '武威市', '凉州区', '武威市凉州区甘肃省武威市凉州区古浪街604号', '37.914057', '102.621737', '凉州区古浪街茅台酱香万家共享主题终端', '武威隆睿昌商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1260, '2344190000001', '广东省', '东莞市', '东莞', '东莞市东莞企石镇振兴路90号102', '23.070073', '114.014252', '东莞市企石镇茅台酱香万家共享主题终端', '东莞市庄胜酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1261, '23140323001002', '山西省', '阳泉市', '城区', '阳泉市城区山西省阳泉市城区下站街道新建路佳园小区底商5号', '37.858807', '113.591829', '阳泉市新建路贵州茅台酱香系列酒体验中心', '利华臻品供应链（山西）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1262, '232320593001', '江苏省', '苏州市', '吴中区', '苏州市吴中区苏州工业园区月亮湾路6号兰亭半岛生活广场3幢113室', '31.261438', '120.720947', '苏州市月亮湾路贵州茅台专卖店', '苏州市恒祺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1263, '2344138400002', '广东省', '惠州市', '惠城区', '惠州市惠城区三栋镇竹园路8号中洲天御花园（二期）第3栋1单元105号', '23.042526', '114.458861', '惠州市三栋镇竹园路茅台酱香万家共享主题终端', '惠州市康盛源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1264, 'B41010100101', '河南省', '郑州市', '市辖区', '郑州市市辖区河南省郑州市郑东新区永威木色购物公园东门一层', '34.767366', '113.7313', '郑州市郑东新区贵州茅台旗舰店', '河南传承创美食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1265, '22370300001003', '山东省', '烟台市', '莱山区', '烟台市莱山区金滩东路1855号', '37.460622', '121.442894', '莱山区凤凰大街茅台酱香万家共享主题终端', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1266, '22370300001002', '山东省', '淄博市', '张店区', '淄博市张店区中心路207号云龙大厦一层', '36.818129', '118.064562', '张店区中心路茅台酱香万家共享主题终端', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1267, '251510521002', '四川省', '成都市', '龙泉驿区', '成都市龙泉驿区大面街道车城西五路49号', '30.571144', '104.170857', '成都市车城西五路贵州茅台专卖店', '四川川糖陈香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1268, '2342058600001', '湖北省', '宜昌市', '伍家岗区', '宜昌市伍家岗区伍临路99号龙岛-号1-8号商铺', '30.603306', '111.386544', '宜昌市伍临路茅台酱香万家共享主题终端', '宜昌茅酱星商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1269, '2344138400003', '广东省', '惠州市', '惠东县', '惠州市惠东县平山街道华侨城河北二路20号', '22.970746', '114.711633', '惠东县河北二路茅台酱香万家共享主题终端', '惠州市康盛源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1270, '2361272200001', '陕西省', '榆林市', '神木市', '榆林市神木市人民路下段80号', '38.842168', '110.489454', '神木市人民路茅台酱香万家共享主题终端', '神木市顺欣茂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1271, '22370300001001', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区丹阳街道华英路与中山路交叉路口中达好望角B区办公综合楼06室', '35.227911', '115.488883', '牡丹区人民路茅台酱香万家共享主题终端', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1272, '2361272200002', '陕西省', '榆林市', '神木市', '榆林市神木市黄庄路57-1号', '38.83665', '110.495948', '神木市黄庄路茅台酱香万家共享主题终端', '神木市国鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1273, '231310113001', '上海市', '上海市', '宝山区', '上海市宝山区淞宝路109-111号', '31.380045', '121.49972', '上海市淞宝路贵州茅台专卖店', '上海浓景商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1274, '2144088410001', '广东省', '湛江市', '赤坎区', '湛江市赤坎区海田路东二路28号湛江海田家私城H9-10号铺', '21.278854', '110.384541', '湛江市海田家私城湛江市宏利商贸有限公司门店', '湛江市宏利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1275, '113130981001', '河北省', '沧州市', '泊头市', '沧州市泊头市胜利东路140号（冀泰丽景B区B2号楼103-104号铺）', '38.064602', '116.576123', '泊头市胜利东路贵州茅台专卖店', '沧州玖醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1276, '2231011600001', '上海市', '上海市', '青浦区', '上海市青浦区新府中路1566号', '31.22974', '121.232309', '上海市新府中路贵州茅台酱香系列酒体验中心', '上海梓宙商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1277, '23450100001102', '广西壮族自治区', '南宁市', '良庆区', '南宁市良庆区中国（广西）自由贸易试验区南宁片区平乐大道61号大都华园12号楼一至二层农贸超市', '22.696708', '108.390727', '贵州茅台酱香系列酒体验中心（广糖酒业）', '广西广糖酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1278, '22445504006001', '广东省', '珠海市', '香洲区', '珠海市香洲区银桦路143号茅台酱香万家共享', '22.277195', '113.559907', '香洲区银桦路茅台酱香万家共享主题终端', '珠海市拓展花茶有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1279, '135350500001', '福建省', '泉州市', '丰泽区', '泉州市丰泽区刺桐路中联华庭633号', '24.896434', '118.60842', '泉州市刺桐路贵州茅台专卖店', '泉州市大唐世家贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1280, '141412702001', '河南省', '周口市', '项城市', '周口市项城市天安大道与湖滨路交叉口万达时代广场临街店铺109-112', '33.426954', '114.871756', '项城市天安大道贵州茅台专卖店', '项城市富翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1281, '146460035001', '海南省', '保亭黎族苗族自治县', '保亭黎族苗族自治县', '保亭黎族苗族自治县保亭黎族苗族自治县保兴东路幸福时光小区1-2-107商铺', '18.635728', '109.713138', '保亭县保兴东路贵州茅台专卖店', '海南保亭国酒茅台专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1282, '511800001', '四川省', '雅安市', '雨城区', '雅安市雨城区新华街1号2幢一单元2楼1号', '30.004515', '103.033867', '雅安恒醇商贸有限公司中心库', '雅安恒醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1283, '241410195001', '河南省', '郑州市', '市辖区', '郑州市市辖区芦医庙大街322号御龙国际', '34.752366', '113.84704', '郑州市芦医庙大街贵州茅台专卖店', '河南众新堂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1284, '143430900001', '湖南省', '益阳市', '赫山区', '益阳市赫山区朝阳街道康富南路146号', '28.563236', '112.353598', '益阳市康富南路贵州茅台专卖店', '益阳市龙海商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1285, '530400005', '云南省', '玉溪市', '红塔区', '玉溪市红塔区李棋街道舟桥路金家边社区3组李家高山路口云港商贸有限公司', '24.371811', '102.538664', '云南省玉溪市云港商贸有限公司中心库', '云南省玉溪市云港商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1286, '121210192001', '辽宁省', '沈阳市', '沈北新区', '沈阳市沈北新区沈北路21-1号3门、4门', '41.920894', '123.397136', '沈阳市沈北路贵州茅台专卖店', '沈阳雷明国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1287, '236360100001', '江西省', '南昌市', '西湖区', '南昌市西湖区绿地朝阳中心18栋1单元101室', '28.646732', '115.865448', '南昌市水厂路贵州茅台43度经销店', '南昌华宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1288, 'B23010300100', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区哈尔滨市南岗区西城红场299号', '45.705965', '126.592837', '哈尔滨市南岗区西城红场299号贵州茅台旗舰店总库', '黑龙江茅创龙承商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1289, 'B23010300101', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区黑龙江省哈尔滨市南岗区哈西大街299号 西城红场商场所属F1位置', '45.703974', '126.59205', '哈尔滨市哈西大街299号贵州茅台旗舰店', '黑龙江茅创龙承商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1290, '2234012900001', '安徽省', '合肥市', '包河区', '合肥市包河区太湖东路碧湖云溪西门北侧', '31.83351', '117.310223', '合肥市太湖东路贵州茅台酱香系列酒体验中心', '安徽省茅粉会贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1291, '252520189002', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区高新区长岭南路178号茅台国际商务中心一期第AB幢（B）1单元18层1号', '26.615679', '106.646581', '贵阳市阳关大道贵州茅台专卖店', '贵州赖茅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1292, '252520189005', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵阳国家高新技术产业开发区毕节路58号联合广场1-5栋（5）4层2号', '26.618209', '106.649873', '贵阳市长岭南路贵州茅台43度经销店', '贵州新世代酒业股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1293, '2337028100001', '山东省', '青岛市', '胶州市', '青岛市胶州市阜安工业园泉州路53号', '36.309473', '120.035107', '胶州市泉州路茅台酱香万家共享主题终端', '青岛龙洲酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1294, '34410100087010001', '河南省', '商丘市', '睢县', '商丘市睢县1', '34.446572', '115.071957', '睢县鸿鑫糖酒商行中心库', '睢县鸿鑫糖酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1295, '2351010000005', '四川省', '成都市', '温江区', '成都市温江区涌泉街道共和东路432、434号', '30.667448', '103.880965', '成都市共和东路茅台酱香万家共享主题终端', '四川省百酒堂酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1296, '22522230006001', '贵州省', '铜仁市', '碧江区', '铜仁市碧江区环北南岳大道1号南岳清水湾CS3区商业区-负3-16号', '27.74822775', '109.2022744', '碧江区环北南岳大道茅台酱香万家共享主题终端', '铜仁长利大同商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1297, '23520100292001', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区水东街道未来方舟G10组团负1-10号、11号', '26.60482499459565', '106.75787052757796', '云岩区水东街道贵州茅台酱香系列酒体验中心', '贵州茂毅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1298, '151511524001', '四川省', '宜宾市', '长宁县', '宜宾市长宁县长宁镇高铁新区海上明月·南院1＃楼1-1号', '28.589921', '104.920083', '长宁县长宁镇竹海大道贵州茅台专卖店', '长宁县云香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1299, '2351010000003', '四川省', '成都市', '高新区', '成都市高新区天府-街1375号、1377号、1379号1层', '30.561986', '104.036582', '成都市天府一街茅台酱香万家共享主题终端', '四川盛世兴成酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1300, '223230200001', '黑龙江省', '齐齐哈尔市', '龙沙区', '齐齐哈尔市龙沙区龙华路152号', '47.341201', '123.967008', '齐齐哈尔市龙华路贵州茅台专卖店', '齐齐哈尔糖酒副食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1301, '22532132001008', '云南省', '昭通市', '昭阳区', '昭通市昭阳区云南省昭通市昭阳区凤凰街道办事处海楼路228号（龙泉花园西苑）', '27.318019', '103.704709', '昭通市海楼路茅台酱香万家共享主题终端店', '昭通市靖和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1302, '2351010000001', '四川省', '成都市', '武侯区', '成都市武侯区机场路38号', '30.609116', '104.056102', '成都市机场路茅台酱香万家共享主题终端', '成都市华盛尚品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1303, '133330123001', '浙江省', '杭州市', '富阳区', '杭州市富阳区富春街道文居街356号', '30.059435', '119.938604', '杭州市文居街贵州茅台专卖店', '杭州富阳金御商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1304, '34440300083006001', '湖南省', '长沙市', '雨花区', '长沙市雨花区长沙市雨花区韶山中路489号万博汇名邸三期3010', '28.157049', '112.996132', '湖南华昱潇湘酒业有限公司中心库', '湖南华昱潇湘酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1305, '132320621001', '江苏省', '南通市', '海安市', '南通市海安市海安街道东大街2号1幢1035-1036室', '32.546855', '120.466925', '南通市海安市东大街贵州茅台专卖店', '海安姚艺酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1306, '137371583001', '山东省', '聊城市', '东昌府区', '聊城市东昌府区燕山路与东昌路交汇处东北角星光国际金融中心6幢0009号商铺', '36.458389', '116.050776', '聊城市燕山路贵州茅台专卖店', '聊城市佳科达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1307, '131310116001', '上海市', '上海市', '金山区', '上海市金山区石化街道蒙山路891～895号', '30.724001', '121.344422', '上海市蒙山路贵州茅台专卖店', '上海俊磊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1308, '511500011', '四川省', '宜宾市', '市辖区', '宜宾市市辖区翠屏区滨江路南段80号', '28.762612', '104.627616', '宜宾凝聚商贸有限公司中心库', '宜宾凝聚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1309, '2137078210001', '山东省', '潍坊市', '诸城市', '潍坊市诸城市南湖生态经济发展区东关大街与枫香路交叉路口（枫香小镇综合商业楼）', '35.972864', '119.410263', '潍坊市东关大街诸城市百龙名酒经营部门店', '诸城市百龙名酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1310, '2641018900101', '河南省', '郑州市', '金水区', '郑州市金水区郑州市金水东路10号院（阿卡迪亚）门面房附4号', '34.763671', '113.743295', '郑州市金水东路茅台酱香万家共享主题终端', '河南盛林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1311, '22460104001002', '海南省', '海口市', '秀英区', '海口市秀英区海南省海口市秀英区长滨路6号龙光海云天小区7号铺面119-120房', '20.037965', '110.205128', '秀英区长滨路茅台酱香万家共享主题终端', '海口可喜可嘉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1312, '24330902001010', '浙江省', '舟山市', '定海区', '舟山市定海区 舟山市定海区东河南路123号', '30.005418', '122.117124', '舟山市得新贸易有限公司中心库', '舟山市得新贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1313, '141410223001', '河南省', '开封市', '尉氏县', '开封市尉氏县北二环与建设路交叉口西北/碧桂园2幢一层2-3号', '34.427397', '114.200135', '开封市北二环贵州茅台专卖店', '开封市华磊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1314, '2151050010002', '四川省', '泸州市', '泸县', '泸州市泸县福集镇西苑路62号', '29.149373', '105.371496', '福集镇西苑路泸州市江阳区源登泸酒行门店', '泸州市江阳区源登泸酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1315, '23130500004005', '河北省', '邢台市', '桥西区', '邢台市桥西区河北省邢台市信都区中华大街月晟天玺台商务楼108-109号门市', '37.072542', '114.455516', '信都区中华路西头贵州茅台酱香系列酒体验中心', '邢台黔塘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1316, '2151050010001', '四川省', '泸州市', '龙马潭区', '泸州市龙马潭区蜀泸大道二段2号附109号', '28.903325', '105.42332', '泸州市蜀泸大道四川省泸州久丰久盛酒类营销有限公司门店', '四川省泸州久丰久盛酒类营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1317, '2250010500001', '重庆市', '重庆市', '渝北区', '重庆市渝北区龙溪街道加州花园C2幢1-1#-1', '29.588379', '106.523526', '重庆市龙溪街道贵州茅台酱香系列酒体验中心', '重庆聪易商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1318, '22420127002001', '湖北省', '武汉市', '江汉区', '武汉市江汉区雪松路3附16号', '30.591962', '114.265846', '江汉区雪松路茅台酱香万家共享主题终端', '武汉市江汉区鑫源福盛酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1319, '152520100044', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区西南国际商贸城5号馆2楼A区茅台印象馆（由苏州路方向的南门进入）', '26.607735', '106.58366', '贵阳市茅台印象馆贵州茅台自营店', '贵州国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1320, '370283003', '山东省', '青岛市', '平度市', '青岛市平度市东阁街道名仕家园小区沿街网点2号楼5号房', '36.787034', '119.982219', '青岛熠辉食品商贸有限公司中心库', '青岛熠辉食品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1321, '144440982001', '广东省', '茂名市', '化州市', '茂名市化州市河西街道办绿景国际花城C1区C1-258-260商铺', '21.648961', '110.613233', '化州市金沙路贵州茅台专卖店', '化州市弘泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1322, '34410100087009001', '河南省', '商丘市', '睢阳区', '商丘市睢阳区1', '34.389048', '115.653258', '商丘市睢阳区琦舰酒业商行中心库', '商丘市睢阳区琦舰酒业商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1323, '2352232100001', '贵州省', '黔西南布依族苗族自治州', '兴义市', '黔西南布依族苗族自治州兴义市桔山办新场二组安置区-楼', '25.108628', '104.921481', '兴义市桔山办茅台酱香万家共享主题终端', '贵州鑫驰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1324, '2321120000001', '辽宁省', '铁岭市', '昌图县', '铁岭市昌图县鑫科国际小区4号楼门市1-4号', '42.781171', '124.088812', '昌图县鑫科国际茅台酱香万家共享主题终端', '铁岭君华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1325, '123230800001', '黑龙江省', '佳木斯市', '前进区', '佳木斯市前进区光复东路0454街区106门市', '46.809988', '130.371818', '佳木斯市光复东路贵州茅台专卖店', '佳木斯市全兴宏业商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1326, '2222018600002', '吉林省', '长春市', '南关区', '长春市南关区大经路1707号', '43.883361', '125.342084', '长春市大经路贵州茅台酱香系列酒体验中心', '吉林省吉兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1327, '150500101003', '重庆市', '重庆市', '涪陵区', '重庆市涪陵区人民东路91号桥达.千江樾第6幢1-2、1-3、1-4号门面', '29.702185', '107.404777', '重庆市人民东路贵州茅台专卖店', '重庆市涪陵区涛沭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1328, '242420139001', '湖北省', '武汉市', '汉南区', '武汉市汉南区武汉经济技术开发区海棠路', '30.506732', '114.203088', '武汉市海棠路贵州茅台专卖店', '武汉华源盛邦贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1329, '150500101001', '重庆市', '重庆市', '垫江县', '重庆市垫江县桂西大道北段87号', '30.336342', '107.344322', '垫江县桂西大道北段贵州茅台专卖店', '重庆市垫江县辉高酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1330, '136360732001', '江西省', '赣州市', '兴国县', '赣州市兴国县潋江镇将军大道293号金福花园四期三组团C1栋', '26.326261', '115.338443', '兴国县将军大道贵州茅台专卖店', '兴国品优商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1331, '150500101002', '重庆市', '重庆市', '万州区', '重庆市万州区南滨大道2321号', '30.784504', '108.412883', '重庆市南滨大道贵州茅台专卖店', '重庆市万州区醉仁川商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1332, '100370100003', '山东省', '济南市', '槐荫区', '济南市槐荫区道德街街道绿地新城4地块D-2号楼101室（贵州茅台专卖店）', '36.65705', '116.97057', '济南市经四路贵州茅台专卖店', '山东茅之韵商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1333, '137370600005', '山东省', '烟台市', '福山区', '烟台市福山区开发区嫩江路15号', '37.563307', '121.277561', '烟台市嫩江路贵州茅台专卖店', '烟台华新酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1334, '100370100002', '山东省', '济南市', '历下区', '济南市历下区解放路26号', '36.665769', '117.063799', '济南市解放路贵州茅台专卖店', '山东共合贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1335, '137370600006', '山东省', '烟台市', '招远市', '烟台市招远市山东省烟台市招远市梦芝街道金城路378号1号楼一层', '37.375412', '120.39552', '招远市金城路贵州茅台专卖店', '招远市兴泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1336, '152522627002', '贵州省', '黔东南苗族侗族自治州', '天柱县', '黔东南苗族侗族自治州天柱县凤城街道便桥头天柱县东方名门小区1号楼1-5.1-6 2号楼1-1.1.2', '26.915006', '109.205793', '天柱县东方名门贵州茅台专卖店', '贵州坤沅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1337, '137370600003', '山东省', '烟台市', '莱山区', '烟台市莱山区莱山区港城东大街1167号天合城19号楼', '37.465666', '121.442624', '烟台市港城东大街贵州茅台专卖店', '烟台华新酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1338, '137370600004', '山东省', '烟台市', '芝罘区', '烟台市芝罘区芝罘区南大街153号2号楼附108', '37.544045', '121.36139', '烟台市南大街贵州茅台专卖店', '烟台华新酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1339, '22321185001001', '江苏省', '镇江市', '丹徒区', '镇江市丹徒区江苏省镇江市丹徒区新城华山路商业街风尚花园1-115号', '32.128278', '119.418163', '丹徒区华山路茅台酱香万家共享主题终端', '镇江天顺缘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1340, '113130900001', '河北省', '沧州市', '运河区', '沧州市运河区解放西路华元一世界一期e世界1#楼1层103、104铺', '38.305743', '116.822938', '沧州市解放西路贵州茅台专卖店', '沧州市佰醇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1341, '137370600001', '山东省', '烟台市', '福山区', '烟台市福山区开发区长江路117号瑞东国际金融广场', '37.563331', '121.224939', '烟台市长江路贵州茅台专卖店', '烟台华新酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1342, '22532132001001', '云南省', '昭通市', '昭阳区', '昭通市昭阳区云南省昭通市昭阳区凤凰办事处悦乐街29号', '27.32', '103.7', '悦乐街茅台酱香万家共享主题终端', '昭通市靖和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1343, '133330192001', '浙江省', '杭州市', '萧山区', '杭州市萧山区建设三路1105号', '30.20465', '120.269484', '杭州市建设三路贵州茅台专卖店', '浙江德道食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1344, '22532132001002', '云南省', '昭通市', '镇雄县', '昭通市镇雄县旧府街道办事处康养小镇清华居4-1-7-8', '27.406318', '104.892551', '镇雄县旧府街道茅台酱香万家共享主题终端', '昭通市靖和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1345, '22520188020001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区会展北路国际会议展览中心1-19', '26.6427', '106.645003', '观山湖区会展北路茅台酱香万家共享主题终端', '贵州汉道酒业股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1346, '132320685001', '江苏省', '南通市', '崇川区', '南通市崇川区跃龙路68号', '32.008594', '120.861541', '南通市跃龙路贵州茅台专卖店', '南通正华糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1347, '137370600009', '山东省', '烟台市', '龙口市', '烟台市龙口市港城大道271号', '37.642166', '120.533823', '龙口市港城大道贵州茅台专卖店', '龙口市龙海酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1348, '137370600007', '山东省', '烟台市', '栖霞市', '烟台市栖霞市庄园街道文化路电业局北330米(山水庄园小区东门)', '37.316686', '120.841299', '栖霞市文化路贵州茅台专卖店', '栖霞市祥龙酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1349, '137370600008', '山东省', '烟台市', '海阳市', '烟台市海阳市海阳路89号', '36.779789', '121.171564', '海阳市海阳路贵州茅台专卖店', '海阳市紫瑛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1350, '143432502001', '湖南省', '长沙市', '长沙县', '长沙市长沙县长沙县锦绣路贵州茅台专卖店108号', '28.251428', '113.058726', '湖南省锦绣路贵州茅台专卖店', '娄底市华蓝贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1351, '162620129001', '甘肃省', '兰州市', '永登县', '兰州市永登县中川镇栖霞街道太白山路15、17、19号', '36.464238', '103.683444', '永登县太白山路贵州茅台专卖店', '甘肃巨源酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1352, '22520300076001', '贵州省', '遵义市', '播州区', '遵义市播州区龙坑街道保利社区保利未来城B2-D1-1-04.05号', '27.614', '106.869579', '播州区龙坑街道茅台酱香万家共享主题终端', '遵义市兴新祥贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1353, '22540100029001', '广东省', '深圳市', '光明区', '深圳市光明区公明街道上村社区上辇旧村民生路103号101', '22.78377', '113.902618', '光明区民生大道茅台酱香万家共享主题终端', '浩润控股投资（深圳）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1354, '321204001', '江苏省', '泰州市', '姜堰区', '泰州市姜堰区姜堰区罗塘街道在水一方公园街区6号楼45号46号47号', '32.503566', '120.15583', '泰州市永勤酒业有限公司中心库', '泰州市永勤酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1355, '146460003001', '海南省', '儋州市', '儋州市', '儋州市儋州市那大镇伏波路266号兆南熙园（宝岛路与松涛路交叉口）15#1-2商铺', '19.526638', '109.548795', '儋州市伏波路贵州茅台专卖店', '儋州五自信酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1356, '244440187001', '广东省', '广州市', '越秀区', '广州市越秀区东风东路744号首层西面自编02商铺', '23.130873', '113.298591', '广州市东风东路贵州茅台专卖店', '广州元亨能源有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1357, '234340125002', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区颍上路58号', '31.887093', '117.273725', '合肥市颍上路贵州茅台专卖店', '安徽省徽商糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1358, '234340125003', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区固镇路3149号森林城D3块地S4幢116-117商铺', '31.889912', '117.228506', '合肥市固镇路贵州茅台专卖店', '安徽佳酩贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1359, '145450700002', '广西壮族自治区', '钦州市', '钦北区', '钦州市钦北区钦州湾大道90号宏华馨园A栋107、108、109商铺', '21.978631', '108.628471', '钦州市钦州湾大道贵州茅台专卖店', '钦州市尊和贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1360, '145450700003', '广西壮族自治区', '钦州市', '钦北区', '钦州市钦北区扬帆北大道31号正元及第尊府9栋8、9、10号铺', '21.962515', '108.646974', '钦州市子材东大街贵州茅台专卖店', '钦州市桂茅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1361, '234340125001', '安徽省', '合肥市', '包河区', '合肥市包河区北京路与黄河路交口金科博翠天宸花园26幢', '31.767437', '117.330519', '合肥市北京路贵州茅台专卖店', '安徽省友谊贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1362, '152520100021', '贵州省', '贵阳市', '白云区', '贵阳市白云区龙井路155号梵华里云锦云玺第7栋负层1-4号', '26.66758', '106.612886', '贵阳市龙井路贵州茅台专卖店', '贵州今立贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1363, '2315230100001', '内蒙古自治区', '通辽市', '科尔沁区', '通辽市科尔沁区开发区碧桂园御龙湾小区南门西侧', '43.668434', '122.274732', '通辽市碧桂园御龙湾茅台酱香万家共享主题终端', '通辽市协成商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1364, '22140187001001', '山西省', '太原市', '万柏林区', '太原市万柏林区长风西街36号远大凤玺湾5幢1008号主题终端', '37.819285', '112.515716', '万柏林区长风西街茅台酱香万家共享主题终端', '太原市迎泽海王鑫贸易商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1365, '152520100023', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区金湖路金阳新世界珑璟组团19号商铺负3-(25-26_)门面', '26.666421', '106.621089', '贵阳市金湖路贵州茅台专卖店', '贵州海霸贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1366, '23211300001001', '辽宁省', '朝阳市', '双塔区', '朝阳市双塔区辽宁省朝阳市双塔区长江路二段70号1层东第17户', '41.585246', '120.457041', '双塔区长江路茅台酱香万家共享主题终端', '朝阳市宏程商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1367, '152522530002', '贵州省', '安顺市', '紫云苗族布依族自治县', '安顺市紫云苗族布依族自治县松山街道教场路184号', '25.760031', '106.08616', '紫云县教场路贵州茅台专卖店', '贵州裕丰恒酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1368, '151513001002', '四川省', '达州市', '通川区', '达州市通川区汉章路172、174、176、178号', '31.228312', '107.464137', '达州市汉章路贵州茅台专卖店', '达州市和酱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1369, '153532901001', '云南省', '大理白族自治州', '大理市', '大理白族自治州大理市下关苍山东路461号', '25.596445', '100.257213', '大理市苍山东路贵州茅台专卖店', '大理金叶商务服务有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1370, '410100001007', '河南省', '郑州市', '管城回族区', '郑州市管城回族区福禄街108号河南商会大厦28楼', '34.749094', '113.777125', '郑州市福禄街贵州茅台文化体验馆', '河南省副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1371, '134340725001', '安徽省', '铜陵市', '铜官区', '铜陵市铜官区石城大道柏庄春暖花开商业网点23栋02-04号', '30.950802', '117.83502', '铜陵市石城大道贵州茅台专卖店', '铜陵市六和名城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1372, 'B43010005401', '湖南省', '长沙市', '市辖区', '长沙市市辖区湖南省长沙市茅台冰淇淋旗舰店NO：008', '28.239076', '112.978901', '长沙市湘江中路1500号贵州茅台旗舰店', '湖南冰火湘传贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1373, '23350100021022', '福建省', '福州市', '鼓楼区', '福州市鼓楼区福建省福州市鼓楼区五凤街道西二环路158号金泉公寓8＃楼1层底层店面', '26.106371', '119.290399', '贵州茅台酱香系列酒体验中心福州西二环店', '福建海晟连锁营销发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1374, '2344060000003', '广东省', '佛山市', '南海区', '佛山市南海区桂城东平路20号金百福都市广场C栋首层6号铺', '23.024583', '113.170608', '佛山市桂城东平路茅台酱香万家共享主题终端', '佛山市鸿酉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1375, '22450500007001', '广西壮族自治区', '北海市', '海城区', '北海市海城区湖海路27号', '21.6', '109.22', '海城区湖海路茅台酱香万家共享主题终端', '北海玉泉德商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1376, '34321326002086001', '重庆市', '重庆市', '南岸区', '重庆市南岸区重庆市南岸区江南大道2号1栋2单元1层1号商铺', '29.535306', '106.560958', '重庆珍久阁商贸有限公司中心库', '重庆珍久阁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1377, '241410191001', '河南省', '郑州市', '金水区', '郑州市金水区三全路风雅颂-天骄学府11号商铺', '34.82837', '113.672475', '郑州市三全路贵州茅台专卖店', '河南国醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1378, '141411324002', '河南省', '南阳市', '镇平县', '南阳市镇平县平安大道金豪玉廷104-2', '33.0248', '112.227', '镇平县平安大道贵州茅台专卖店', '郑州明都酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1379, '2344060000001', '广东省', '佛山市', '南海区', '佛山市南海区南新三路12号', '23.027627', '113.143289', '南海区南新三路茅台酱香万家共享主题终端', '佛山市中茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1380, '233330400001', '浙江省', '嘉兴市', '桐乡市', '嘉兴市桐乡市梧桐街道庆丰北路547号南侧', '30.650958', '120.549171', '桐乡市庆丰北路贵州茅台43度经销店', '嘉兴桐乡贵诚酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1381, '233330100002', '浙江省', '杭州市', '拱墅区', '杭州市拱墅区绍兴路48号', '30.284249', '120.180557', '杭州市绍兴路贵州茅台43度经销店', '杭州华商茅台酒专卖店有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1382, '233330100001', '浙江省', '杭州市', '拱墅区', '杭州市拱墅区半山街道丰源街433号', '30.345211', '120.169339', '杭州市丰源街贵州茅台专卖店', '浙江商源共好贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1383, '22522421009001', '贵州省', '毕节市', '七星关区', '毕节市七星关区贵州省毕节市七星关区新城区四十米大道龙景苑A栋1层1号', '27.29861527', '105.3082721', '新城区四十米大道龙景苑茅台酱香万家共享主题终端', '贵州毕节千醇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1384, '150500113002', '重庆市', '重庆市', '巴南区', '重庆市巴南区鱼洞鱼轻路26号附38、39号', '29.380725', '106.518121', '重庆市鱼轻路贵州茅台专卖店', '重庆海惠酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1385, '152520100035', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区贵阳市云岩区中环路东段未来方舟F10组团底商铺负3-1号、负3-2号', '26.599654', '106.751423', '贵阳市中环路东段贵州茅台专卖店', '贵州仁恒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1386, '152520100033', '贵州省', '贵阳市', '南明区', '贵阳市南明区龙洞堡机场T2航站楼二楼', '26.543462', '106.799861', '贵阳市龙洞堡国际机场贵州茅台专卖店', '贵州民航产业集团有限公司酒业分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1387, '22110106036002', '北京市', '北京市', '房山区', '北京市房山区北康泽路8号院1号楼1层149', '39.767136', '116.209044', '房山区康泽路贵州茅台酱香万家共享主题终端', '北京十越九成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1388, '445302001', '广东省', '云浮市', '云城区', '云浮市云城区云城街道丰收村委东方时代广场侧第B幢第2、3卡（住所申报）', '22.943448', '112.043245', '云浮丰盟汇酒业有限公司中心库', '云浮丰盟汇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1389, '2237070000001', '山东省', '潍坊市', '高新区', '潍坊市高新区胜利街与金马路交叉口东200米路南', '36.706139', '119.179462', '潍坊市胜利街贵州茅台酱香系列酒体验中心', '潍坊云峰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1390, 'B11011800101', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1391, '150600001', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区内蒙古自治区鄂尔多斯市东胜区大桥路42号街坊奥运花园A2小区2号楼-1层-6', '0.0', '0.0', '内蒙古伊泰椿翊商贸有限公司中心库', '内蒙古伊泰椿翊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1392, 'B34010300200', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区安徽省合肥市庐阳区蒙城北路129号合肥宜家家居B1层B1A61号', '31.888603', '117.277794', '合肥市合肥宜家家居B1层B1A61号贵州茅台旗舰店总库', '安徽美茅冰醇食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1393, '2111022910001', '北京市', '北京市', '延庆区', '北京市延庆区延庆镇高塔街68号', '40.464955', '115.977199', '延庆镇高塔街北京市北京夏都顺祥糖酒商贸有限公司门店', '北京夏都顺祥糖酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1394, '22110105081001', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区康中街6号院1号楼1层107号', '39.882467', '116.603803', '朝阳区康中街茅台酱香万家共享主题终端', '风土（北京）国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1395, '141410194002', '河南省', '郑州市', '郑州航空港经济综合实验区', '郑州市郑州航空港经济综合实验区华夏大道180号', '34.537418', '113.82735', '郑州市华夏大道贵州茅台专卖店', '河南裕美裕港实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1396, '141410194001', '河南省', '郑州市', '管城回族区', '郑州市管城回族区安平路95号东安嘉苑11号', '34.735966', '113.758195', '郑州市安平路贵州茅台专卖店', '河南国酒实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1397, '2123018610001', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区长江路101号小酒喔门店', '45.750068', '126.683148', '哈尔滨市长江路哈尔滨小酒喔经贸有限公司门店', '哈尔滨小酒喔经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1398, 'B34010300201', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区安徽省合肥市庐阳区蒙城北路129号合肥宜家家居B1茅台冰淇淋店', '31.907139', '117.215333', '合肥市区蒙城北路129号贵州茅台旗舰店', '安徽美茅冰醇食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1399, '223729010001', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区开发区人民路中央公馆世玺6号楼01012.01013.01014', '35.247168', '115.497721', '牡丹区人民路贵州茅台酱香系列酒体验中心', '菏泽市兴亚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1400, '22430100043001', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区望岳街道窑塘社区窑塘村综合楼一楼110号', '28.23024', '112.926638', '岳麓区望岳街道茅台酱香万家共享主题终端', '长沙清圣酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1401, '141411000002', '河南省', '许昌市', '市辖区', '许昌市市辖区新东街御湖城17幢101-102-103', '34.028706', '113.884774', '许昌市新东街贵州茅台专卖店', '许昌中州皇冠贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1402, '215150124001', '内蒙古自治区', '呼和浩特市', '新城区', '呼和浩特市新城区如意工业园区机场北辅路水岸小镇H区6号楼1022室', '40.845095', '111.765068', '呼和浩特市安达路贵州茅台专卖店', '内蒙古银隆保鑫科技发展有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1403, '520300014004', '贵州省', '遵义市', '汇川区', '遵义市汇川区南京路380号城上城一、二座二层二号房', '27.716216', '106.922765', '遵义市南京路贵州茅台文化体验馆', '遵义三源酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1404, '100130200005', '河北省', '唐山市', '路北区', '唐山市路北区新华北里富锦园商业楼1楼4号、5号', '39.630115', '118.175517', '唐山市建设南路贵州茅台专卖店', '唐山兴旭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1405, '244445500001', '广东省', '中山市', '南区', '中山市南区坦洲镇谭隆南路23号佳境康城12卡商铺', '22.262305', '113.498703', '中山市康明路贵州茅台专卖店', '中山市晋荣酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1406, '22420100077001', '湖北省', '武汉市', '硚口区', '武汉市硚口区解放大道628号新世界写字楼K11一层C0101', '30.579192', '114.265966', '硚口区解放大道茅台酱香万家共享主题终端', '武汉市华酱酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1407, '235350187001', '福建省', '福州市', '台江区', '福州市台江区宁化街道祥坂街26号（原上浦路南侧）富力中心A座1层17商务办公', '26.063234', '119.280156', '福州市祥坂街贵州茅台专卖店', '福州茅嘉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1408, '233330481001', '浙江省', '嘉兴市', '海宁市', '嘉兴市海宁市文苑南路350号', '30.492902', '120.686186', '海宁市文苑南路贵州茅台专卖店', '海宁宏辰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1409, '2332140400003', '江苏省', '泰州市', '靖江市', '泰州市靖江市新桥镇新桥中路28号', '32.001201', '120.080399', '靖江市新桥镇新桥中路茅台酱香万家共享主题终端', '江苏春意商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1410, '23450500006007', '广西壮族自治区', '北海市', '银海区', '北海市银海区广西壮族自治区北海市银海区银滩镇四川路319号', '21.435407', '109.124755', '北海市四川路贵州茅台酱香系列酒体验中心', '北海黄瓷瓶茅酒酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1411, '371300009002', '山东省', '临沂市', '沂水县', '临沂市沂水县黄山路（原鑫华路）57-5', '35.768642', '118.626362', '临沂市黄山路贵州茅台专卖店', '临沂海通酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1412, '161610100020', '陕西省', '西安市', '雁塔区', '西安市雁塔区长安中路30号', '34.219303', '108.946147', '西安市长安中路贵州茅台专卖店', '陕西融通军民服务社有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1413, '22430683001001', '湖南省', '岳阳市', '岳阳楼区', '岳阳市岳阳楼区南湖大道527号1-3楼', '29.359623', '113.11822', '岳阳楼区南湖大道茅台酱香万家共享主题终端', '岳阳市金鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1414, '2145023010001', '广西壮族自治区', '柳州市', '柳北区', '柳州市柳北区北雀路十二区65栋柳钢商住楼-楼南侧1号门面', '24.372921', '109.397415', '柳州市北雀路柳州市金樽商贸有限公司门店', '柳州市金樽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1415, '652900001', '新疆维吾尔自治区', '阿克苏地区', '阿克苏市', '阿克苏地区阿克苏市新城街道东工业园区余杭路1号旺达公司院内', '41.22409', '80.303234', '阿克苏德胜恒祥商贸有限公司中心库', '阿克苏德胜恒祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1416, '146460027001', '海南省', '澄迈县', '澄迈县', '澄迈县澄迈县老城镇美伦路蓝海美伦湾10栋S101-102铺面', '19.950166', '110.124191', '澄迈县美伦路贵州茅台专卖店', '海南华熙实业投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1417, '2113068610001', '河北省', '保定市', '莲池区', '保定市莲池区莲池区瑞兴路411号', '38.90431', '115.513858', '保定市瑞兴路定州市中天商贸有限责任公司保定分公司门店', '定州市中天商贸有限责任公司保定分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1418, '2154012810001', '西藏自治区', '拉萨市', '城关区', '拉萨市城关区色拉北路27号（色拉寺大院）', '29.689393', '91.133763', '拉萨市色拉北路拉萨亚雄商贸有限公司门店', '拉萨亚雄商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1419, '100445281001', '广东省', '揭阳市', '普宁市', '揭阳市普宁市流沙西街道赵厝寮村长春路262号', '23.301596', '116.152687', '普宁市流沙长春路贵州茅台专卖店', '普宁市吉华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1420, '22320582003001', '江苏省', '苏州市', '张家港市', '苏州市张家港市杨舍镇人民路42号东2幢1-2层（公寓楼大堂）', '31.88', '120.55', '杨舍镇人民路茅台酱香万家共享主题终端', '张家港保税区众士达国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1421, '22441800009001', '广东省', '清远市', '清城区', '清远市清城区清城区新城花金洲花园金盈阁首层103号', '23.693546', '113.044704', '清城区新城金洲花园茅台酱香万家共享主题终端', '清远市铭丰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1422, '152522229002', '贵州省', '铜仁市', '松桃苗族自治县', '铜仁市松桃苗族自治县蓼皋镇梵净山大道松江国际4号楼1-5、6、7号门面', '28.13946', '109.195026', '松桃县梵净山大道贵州茅台专卖店', '松桃朝阳酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1423, '2242010000001', '湖北省', '武汉市', '江汉区', '武汉市江汉区香港路与香江路交汇处(香港路地铁站F口步行350米)', '30.607369', '114.280827', '武汉市香港路贵州茅台酱香系列酒体验中心', '武汉茅和五商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1424, '2237130000002', '山东省', '临沂市', '河东区', '临沂市河东区凤凰大街与正阳路交汇处财源广场沿街', '35.071894', '118.398048', '临沂市正阳路贵州茅台酱香系列酒体验中心', '临沂鼎天名品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1425, '2231010900001', '上海市', '上海市', '浦东新区', '上海市浦东新区东方路1957弄32号', '31.197411', '121.520702', '上海市东方路贵州茅台酱香系列酒体验中心', '新翃宇（上海）国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1426, '22520383014001', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区忠庄街道共青大道遵义碧桂园第一期第15幢1层1-9号', '27.648017', '106.879512', '遵义市红花岗区忠庄街道茅台酱香万家共享主题终端', '贵州鼎众之慧贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1427, '34410100087029001', '河南省', '济源市', '济源市', '济源市济源市1', '35.069057', '112.602347', '济源市沁园名门烟酒行中心库', '济源市沁园名门烟酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1428, '2237130000001', '山东省', '临沂市', '罗庄区', '临沂市罗庄区盛庄街道沂州路与沂河路交汇西100米路北', '35.016911', '118.353527', '临沂市沂河路贵州茅台酱香系列酒体验中心', '山东九州商业集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1429, '110105075', '北京市', '北京市', '朝阳区', '北京市朝阳区经销商中心库', '39.831067', '116.435569', '中粮名庄荟国际酒业有限公司中心库', '中粮名庄荟国际酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1430, '2146000210001', '海南省', '琼海市', '琼海市', '琼海市琼海市嘉积镇元亨街次街49号一楼', '19.240067', '110.471538', '琼海市嘉积镇元亨街琼海咀华贸易有限公司门店', '琼海咀华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1431, '161610100005', '陕西省', '渭南市', '韩城市', '渭南市韩城市盘河路187号', '35.465777', '110.464957', '韩城市盘河路贵州茅台专卖店', '韩城久珍商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1432, '114142601001', '山西省', '临汾市', '尧都区', '临汾市尧都区古城路29号', '36.092881', '111.514796', '临汾市古城路贵州茅台专卖店', '临汾市诚和致信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1433, '161610100004', '陕西省', '西安市', '未央区', '西安市未央区贞观路(睿明居)', '34.337631', '108.961269', '西安市贞观路贵州茅台专卖店', '陕西华鼎酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1434, '34110105099008001', '江西省', '赣州市', '章贡区', '赣州市章贡区1', '25.818247', '114.920426', '章贡区金汇酒业商行中心库', '章贡区金汇酒业商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1435, '244440305002', '广东省', '深圳市', '龙岗区', '深圳市龙岗区南湾街道下李朗社区布澜路76号东久创新科技园一期2栋2-17', '22.632186', '114.132413', '深圳市布澜路贵州茅台专卖店', '深圳市银宽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1436, '152520181001', '贵州省', '贵阳市', '清镇市', '贵阳市清镇市云岭西路31号101', '26.549344', '106.462421', '清镇市云岭西路贵州茅台专卖店', '清镇市蓉发贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1437, '2311022100001', '北京市', '北京市', '昌平区', '北京市昌平区回龙观龙兴园中区东门1号', '40.062039', '116.322053', '北京市回龙观龙兴园茅台酱香万家共享主题终端', '北京红色之旅营销策划有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1438, '152520181002', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区贵阳小河香江路162号', '26.516473', '106.693386', '贵阳市香江路贵州茅台专卖店', '贵州中昱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1439, '2237052400001', '山东省', '东营市', '东营区', '东营市东营区东城银座城市广场8幢11-2号', '37.444097', '118.668477', '东营市东城银座贵州茅台酱香系列酒体验中心', '东营市通裕商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1440, '113130421001', '河北省', '邯郸市', '丛台区', '邯郸市丛台区联纺东路', '36.624782', '114.527634', '邯郸市联纺东路贵州茅台专卖店', '邯郸市赛超商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1441, '22440301003001', '广东省', '深圳市', '罗湖区', '深圳市罗湖区翠竹街道翠竹社区华丽路2046号翠华花园2栋1B', '22.554113', '114.13324', '罗湖区华丽路与爱国路交叉口茅台酱香万家共享主题终端', '深圳市鸿鑫源文化艺术传播有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1442, '135350800001', '福建省', '龙岩市', '新罗区', '龙岩市新罗区罗龙路193号（贵州茅台专卖店罗龙路店））', '25.098307', '117.018312', '龙岩市罗龙路贵州茅台专卖店', '龙岩泰华食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1443, '2331011000002', '上海市', '上海市', '杨浦区', '上海市杨浦区本溪路137号', '31.27695', '121.51877', '上海市本溪路茅台酱香万家共享主题终端', '上海涌臻贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1444, '161610100012', '海南省', '三亚市', '海棠区', '三亚市海棠区林旺北旅游服务小镇商业区1号楼5号商铺', '18.316417', '109.7105', '三亚市林旺北风情小镇贵州茅台专卖店', '三亚海棠花开酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1445, '2221020000002', '辽宁省', '大连市', '西岗区', '大连市西岗区长江路585-4', '38.919534', '121.615353', '大连市长江路贵州茅台酱香系列酒体验中心', '大连京玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1446, '23230600012001', '黑龙江省', '大庆市', '让胡路区', '大庆市让胡路区长庆街87号', '46.63016', '124.91312', '让胡路区长庆街贵州茅台酱香系列酒体验中心', '大庆市海合汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1447, '161610100011', '陕西省', '咸阳市', '渭城区', '咸阳市渭城区人民东路永大观邸3幢1-2楼1-9号', '34.338699', '108.734034', '咸阳市人民东路贵州茅台专卖店', '咸阳酱心坊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1448, '161610100014', '陕西省', '西安市', '临潼区', '西安市临潼区秦唐大道与健康路交叉口东北40米金唐元商铺10110室', '34.367003', '109.208344', '西安市秦唐大道贵州茅台专卖店', '西安香溢商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1449, 'B21010100140', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区盘锦市兴隆台区利港酒店旁', '41.108388', '122.060935', '盘锦四季商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1450, '161610100013', '陕西省', '西安市', '新城区', '西安市新城区西五路26号一层全季酒店以西', '34.269691', '108.959736', '西安市西五路贵州茅台专卖店', '西安一樽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1451, 'B21010100141', '辽宁省', '盘锦市', '兴隆台区', '盘锦市兴隆台区盘锦市兴隆台区惠宾街道中誉玖郡68号楼117号', '41.102437', '122.102149', '盘锦伟华酒业有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1452, '161610100016', '陕西省', '西安市', '雁塔区', '西安市雁塔区曲江新区曲江池东路1幢1单元10140号', '34.195778', '108.988687', '西安市曲江池东路贵州茅台专卖店', '西安恒丰酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1453, 'B21010100142', '辽宁省', '抚顺市', '新抚区', '抚顺市新抚区抚顺市新抚区天朗大厦一层西区贵州茅台专卖店', '41.860051', '123.895027', '抚顺天朗商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1454, '161610100015', '陕西省', '西安市', '长安区', '西安市长安区电子正街延伸段与西部大道交汇处东南角莱安城1F-03', '34.170288', '108.919626', '西安市电子正街贵州茅台专卖店', '西安醉美源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1455, '2122018510001', '吉林省', '长春市', '南关区', '长春市南关区南四环保利金香槟A1栋104室', '43.809644', '125.327066', '长春市保利香槟吉林酱源供应链有限公司门店', '吉林酱源供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1456, 'B21010100143', '辽宁省', '大连市', '沙河口区', '大连市沙河口区大连市沙河口区联合路兰园8-11', '39.902246', '116.408327', '大连津享逸商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1457, 'B21010100144', '辽宁省', '沈阳市', '苏家屯区', '沈阳市苏家屯区沈阳市苏家屯区南京南街1019-47号20门', '41.668906', '123.382447', '沈阳梦诚商贸有限公司', '富贵辽凝（沈阳）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1458, '132320130001', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区水西门大街616号101室', '32.035734', '118.726597', '南京市水西门大街贵州茅台专卖店', '南京缘盛经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1459, '161610100017', '陕西省', '西安市', '未央区', '西安市未央区凤城七路风景御园15幢1单元1层10106室', '34.337626', '108.941685', '西安市凤城七路贵州茅台自营店', '陕西国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1460, '137370283002', '山东省', '青岛市', '平度市', '青岛市平度市杭州南路188号4号楼101商铺', '36.757964', '119.967991', '平度市杭州南路贵州茅台专卖店', '青岛鹏国酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1461, '2133042410001', '浙江省', '嘉兴市', '海盐县', '嘉兴市海盐县海盐县城北路141号', '30.521161', '120.944248', '海盐县城北路海盐县武原鑫茂酒行门店', '海盐县武原鑫茂酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1462, '133331086001', '浙江省', '台州市', '路桥区', '台州市路桥区金洋路369号金悦花园1幢金洋路341、343、345、347', '28.595508', '121.371569', '台州市金洋路贵州茅台专卖店', '台州良贵酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1463, '21142701004005', '山西省', '运城市', '盐湖区', '运城市盐湖区运城市经技术开发区禹都市场六区东楼40号', '35.055236', '111.021603', '运城经济技术开发区鑫美鑫商贸有限公司', '山西美鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1464, '144440689001', '广东省', '佛山市', '高明区', '佛山市高明区荷城街道荷富路801号101-102铺、110-115铺', '22.916789', '112.862424', '佛山市荷富路贵州茅台专卖店', '佛山市高明国致酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1465, '161610100010', '陕西省', '西安市', '碑林区', '西安市碑林区张家村含光北路15号九锦台1幢1单元1层10105号', '34.232325', '108.932438', '西安市含光北路贵州茅台专卖店', '陕西恒浩商贸文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1466, '137371522002', '山东省', '聊城市', '莘县', '聊城市莘县燕塔街道伊园街338号翰林花园1-1', '36.249816', '115.663123', '莘县伊园街贵州茅台专卖店', '莘县清新酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1467, '2151060010002', '四川省', '德阳市', '旌阳区', '德阳市旌阳区华山北路白河巷121号', '31.138391', '104.389323', '德阳市华山北路德阳市龙鳞商贸有限公司门店', '德阳市龙鳞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1468, '145450481002', '广西壮族自治区', '梧州市', '岑溪市', '梧州市岑溪市工农路2号', '22.922834', '110.994789', '岑溪市工农路贵州茅台专卖店', '岑溪市永丰旺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1469, '410189001002', '山东省', '潍坊市', '安丘市', '潍坊市安丘市兴安街道潍安路原玻璃厂院内', '36.420138', '119.198715', '安丘市正语酒水商行中心库', '安丘市正语酒水商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1470, '235350202001', '福建省', '厦门市', '海沧区', '厦门市海沧区海富路258-1号、258-2号', '24.494674', '118.035378', '厦门市海富路贵州茅台专卖店', '厦门汇林正地商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1471, '145450882002', '广西壮族自治区', '贵港市', '港北区', '贵港市港北区中山大道北延段好旺角6号', '23.114061', '109.595986', '贵港市中山大道北贵州茅台专卖店', '贵港市鼎醴贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1472, '2332050000001', '江苏省', '苏州市', '吴江区', '苏州市吴江区盛泽镇盛利商区m幢48号', '30.89515', '120.640556', '苏州市盛泽镇盛利商区茅台酱香万家共享主题终端', '苏州旨昶贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1473, '2341092900002', '河南省', '濮阳市', '华龙区', '濮阳市华龙区京开大道与人民路交叉口西100米路南', '35.76093', '115.041673', '濮阳市京开大道茅台酱香万家共享主题终端', '濮阳市诚诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1474, '141411219001', '河南省', '三门峡市', '义马市', '三门峡市义马市千符路与祥瑞路交叉口路北', '34.758144', '111.864201', '义马市千符路贵州茅台专卖店', '三门峡市华磊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1475, '145450882001', '广西壮族自治区', '贵港市', '港北区', '贵港市港北区贵港市港北区迎宾大道989号众泰御珑湾3栋1层3-117.3-118号商铺', '23.107346', '109.567414', '贵港市迎宾大道贵州茅台专卖店', '广西贵港市糖酒副食有限责任公司城区酒类批发部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1476, '2332050000002', '江苏省', '苏州市', '常熟市', '苏州市常熟市常熟市衡山路109号', '31.668626', '120.760724', '常熟市衡山路茅台酱香万家共享主题终端', '常熟华糖酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1477, '2341092900003', '河南省', '鹤壁市', '淇滨区', '鹤壁市淇滨区黎阳路街道海河路98号', '35.4551', '114.1712', '鹤壁市黎阳路茅台酱香万家共享主题终端', '鹤壁市瑞梦湖商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1478, '145450400001', '广西壮族自治区', '梧州市', '长洲区', '梧州市长洲区三龙东二路22号壹品尊府3、4、5号商铺', '23.473077', '111.233115', '梧州市三龙东二路贵州茅台专卖店', '广西梧州市吉丰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1479, '144440302001', '广东省', '深圳市', '福田区', '深圳市福田区中心五路星河中心一楼L1a', '22.534021', '114.061751', '深圳市福华路贵州茅台自营店', '深圳市茅台酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1480, '2341092900004', '河南省', '新乡市', '红旗区', '新乡市红旗区新飞大道与科隆大道交叉口西北角', '35.274681', '113.900227', '新乡市新飞大道茅台酱香万家共享主题终端', '新乡市大胜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1481, '145450400002', '广西壮族自治区', '梧州市', '长洲区', '梧州市长洲区西堤三路63-3号', '23.473014', '111.272414', '梧州市西堤三路贵州茅台专卖店', '广西梧州市吉丰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1482, '100410100021', '河南省', '周口市', '川汇区', '周口市川汇区太昊路与工农路交叉口北150米路东亿星紫荆城5.6.11号楼底商102-103铺', '33.594696', '114.664796', '周口市工农路贵州茅台专卖店', '河南亿星实业集团股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1483, '131310113001', '上海市', '上海市', '宝山区', '上海市宝山区东林路397号', '31.408213', '121.492582', '上海市东林路贵州茅台专卖店', '上海茅源实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1484, '131310113002', '上海市', '上海市', '宝山区', '上海市宝山区克山路226号', '31.402396', '121.466461', '上海市克山路贵州茅台专卖店', '上海国茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1485, '34410100087018001', '河南省', '信阳市', '固始县', '信阳市固始县1', '32.169239', '115.654066', '固始厚载酒业有限公司中心库', '固始厚载酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1486, '100520100046', '贵州省', '贵阳市', '南明区', '贵阳市南明区解放路120号中华商城B座1层9.10号门面', '26.561374', '106.720546', '贵阳市解放路贵州茅台专卖店（中华商城）', '贵州冠洲宾馆有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1487, '22130526001001', '河北省', '邢台市', '任县', '邢台市任县河北省邢台市任泽区任城镇人民大街东方御园小区S2号B区111商铺', '37.121301', '114.66182', '任县任城镇人民大街茅台酱香万家共享主题终端', '任县九坊烟酒门市部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1488, '111110105002', '北京市', '北京市', '东城区', '北京市东城区珠市口东大街4号4-11号', '39.892654', '116.414083', '北京市珠市口东大街贵州茅台专卖店', '北京德华永胜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1489, '2333272100001', '浙江省', '丽水市', '龙泉市', '丽水市龙泉市龙渊街道华楼街庆丰楼20号', '28.070337', '119.131439', '龙泉市龙渊街道茅台酱香万家共享主题终端', '丽水市新名优商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1490, '153533606001', '云南省', '玉溪市', '红塔区', '玉溪市红塔区凤凰路98号', '24.344314', '102.548988', '玉溪市凤凰路贵州茅台专卖店', '玉溪新珑浩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1491, '237370123001', '山东省', '济南市', '历城区', '济南市历城区唐冶中路3777号国泰唐坊1-107、1-108、1-109商铺', '36.684333', '117.226269', '济南市唐冶中路贵州茅台专卖店', '济南鑫盛元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1492, '233330923001', '浙江省', '舟山市', '定海区', '舟山市定海区绿岛路68号-1', '29.975113', '122.219831', '舟山市绿岛路贵州茅台专卖店', '舟山市汇源糖业烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1493, '2362270100001', '甘肃省', '平凉市', '崆峒区', '平凉市崆峒区平凉市崆峒区世纪花园B5区6号', '35.55366', '106.668008', '平凉市世纪花园茅台酱香万家共享主题终端', '平凉市崆峒区鲲林顺帆商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1494, '22370100059001', '山东省', '济南市', '槐荫区', '济南市槐荫区张庄街道绿地香榭新里广场40号楼1-107', '36.69', '116.92', '槐荫区张庄街道茅台酱香万家共享主题终端', '济南启拓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1495, '137370826001', '山东省', '济宁市', '微山县', '济宁市微山县夏镇街道商业南街39号', '34.79989', '117.137425', '微山县商业南街贵州茅台专卖店', '微山县润安贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1496, '500227001002', '重庆市', '重庆市', '璧山区', '重庆市璧山区重庆市璧山区璧泉街道莱山区2号附14号、附15号、附16号、附17号', '29.580216', '106.224677', '重庆市璧山区璧泉街道莱山路贵州茅台专卖店', '重庆市羽杨酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1497, '161612725001', '陕西省', '西安市', '长安区', '西安市长安区沣东新城中国国际丝路中心6号楼-10108', '34.255268', '108.775206', '西安市王寺东街贵州茅台专卖店', '陕西和丰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1498, '2313068100001', '河北省', '保定市', '涿州市', '保定市涿州市清凉寺街道冠云中路91号商铺', '39.477885', '115.989092', '涿州市清凉寺街道茅台酱香万家共享主题终端', '君可醉（河北）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1499, '2244030000002', '广东省', '深圳市', '福田区', '深圳市福田区福田街道岗厦社区福华三路恒运豪庭101', '22.533176', '114.066177', '深圳市福田街道贵州茅台酱香系列酒体验中心', '深圳市佑恩实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1500, '244440183001', '广东省', '广州市', '黄埔区', '广州市黄埔区大沙地东319号714室', '23.107109', '113.457836', '广州市大沙东路贵州茅台43度经销店', '广州中酩酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1501, '23320300001002', '江苏省', '徐州市', '鼓楼区', '徐州市鼓楼区江苏省徐州市鼓楼区中山北路318号', '34.291828', '117.190789', '鼓楼区中山北路贵州茅台酱香系列酒体验中心', '徐州市华夏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1502, '111110105008', '北京市', '北京市', '朝阳区', '北京市朝阳区北苑五号院北地大厦', '40.036013', '116.422068', '北京市秋实街贵州茅台专卖店（北地大厦）', '北京世鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1503, '440300030007', '广东省', '深圳市', '福田区', '深圳市福田区广东省深圳市福田区梅林街道梅亭社区越华路18号斯达大厦梅林路19-1号东5-6', '22.56814', '114.065835', '深圳市梅林街道贵州茅台专卖店', '深圳市玉酉圣贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1504, '136360500002', '江西省', '新余市', '渝水区', '新余市渝水区经济开发区春龙街4栋', '27.835027', '114.982678', '新余市春龙街贵州茅台专卖店', '新余市金安贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1505, '141411322001', '河南省', '南阳市', '方城县', '南阳市方城县中达街与文化路交叉口', '33.256393', '113.034627', '方城县文化路贵州茅台专卖店', '河南任安商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1506, '111110105016', '北京市', '北京市', '朝阳区', '北京市朝阳区尚家楼路2号院10号楼1层10-1', '39.966887', '116.458256', '北京市尚家楼路贵州茅台专卖店', '北京开阳兴盛科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1507, '34321326002088001', '海南省', '海口市', '美兰区', '海口市美兰区海南省海口市美兰区西沙路7号', '20.023481', '110.339661', '海南明兴隆商贸有限公司中心库', '海南明兴隆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1508, '410100001', '河南省', '郑州市', '市辖区', '郑州市市辖区郑州市金水路30号', '34.764712', '113.658861', '', '河南省副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1509, '111110105017', '北京市', '北京市', '朝阳区', '北京市朝阳区东坝驹子房427号楼1层109', '39.95968', '116.57106', '北京市运福南路贵州茅台专卖店', '北京鑫隆泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1510, '121211200001', '辽宁省', '铁岭市', '铁岭县', '铁岭市铁岭县富力四季半岛S5幢门市102、103', '42.254485', '123.738214', '铁岭市黑龙江路贵州茅台专卖店', '铁岭君华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1511, '165652830001', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '巴音郭楞蒙古自治州库尔勒市石化大道凯悦特区6栋02，03号', '41.738471', '86.172401', '库尔勒市石化大道贵州茅台专卖店', '巴州鼎盛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1512, '111110105013', '北京市', '北京市', '大兴区', '北京市大兴区科创四街32号', '39.807809', '116.532609', '北京市科创四街贵州茅台专卖店', '北京酒香隆盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1513, '111110105010', '北京市', '北京市', '朝阳区', '北京市朝阳区百子湾南2路72号楼1层110', '39.896795', '116.476341', '北京市百子湾南二路贵州茅台专卖店', '北京中海玉液商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1514, '22340100030001', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区翡翠路与休宁路交口绿怡汇林西29幢105室', '31.826401', '117.217634', '蜀山区翡翠路茅台酱香万家共享主题终端', '安徽吉创名品供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1515, '213130984001', '河北省', '沧州市', '河间市', '沧州市河间市京开北路与曙光西路交叉口（瀛州首府商业5#楼104铺）', '38.446615', '116.087677', '河间市京开北路贵州茅台专卖店', '河间市国习卓润商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1516, '251510186008', '四川省', '成都市', '高新区', '成都市高新区高新区昆华路1602号', '30.564957', '104.035825', '成都市天府一街昆华路贵州茅台专卖店', '成都佳瑞福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1517, '251510186002', '四川省', '成都市', '青羊区', '成都市青羊区玉沙路144号附8、9号', '30.666889', '104.079758', '成都市玉沙路贵州茅台专卖店', '四川省糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1518, '410189001001', '山东省', '潍坊市', '诸城市', '潍坊市诸城市开发区红星家园D区北门西侧沿街房', '36.024822', '119.392301', '诸城市舜泰烟酒经营部中心库', '诸城市舜泰烟酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1519, '251510186001', '四川省', '成都市', '青羊区', '成都市青羊区浣花北路12号附5-6号', '30.664791', '104.037062', '成都市浣花北路贵州茅台专卖店', '成都市糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1520, '251510186004', '四川省', '成都市', '锦江区', '成都市锦江区棣棠路908、909、910号', '30.595692', '104.124151', '成都市棣棠路贵州茅台专卖店', '成都市可飞达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1521, '2145088210001', '广西壮族自治区', '贵港市', '港北区', '贵港市港北区荷城路1108号中强普罗旺斯8-11幢2区2-18号', '23.112835', '109.582221', '贵港市荷城路贵港市尊和商贸有限公司门店', '贵港市尊和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1522, '153530100003', '云南省', '昆明市', '西山区', '昆明市西山区福海街道滇池度假区滇池路西贡码头第7幢2号', '24.984431', '102.659391', '昆明市滇池路贵州茅台专卖店', '昆明巨明实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1523, '254540100002', '西藏自治区', '拉萨市', '经济技术开发区', '拉萨市经济技术开发区园区南路天峰祥和西苑三栋1-2层1、2号', '29.620494', '90.995811', '拉萨市园区南路贵州茅台专卖店', '茅台国酒（拉萨）商务会所有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1524, '22500110003001', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区团结坝436号附66-67号', '29.596183', '106.44752', '沙坪坝区金融街融府茅台酱香万家共享主题终端', '重庆三玄酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1525, '153530100002', '云南省', '昆明市', '五华区', '昆明市五华区丰宁街道西园路与茭菱路交叉口英茂花园7幢13号、14号、15号', '25.049267', '102.679391', '昆明市西园路贵州茅台专卖店', '昆明树发经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1526, '254540100001', '西藏自治区', '拉萨市', '堆龙德庆区', '拉萨市堆龙德庆区柳梧新区雅砻阳光花园8号商铺', '29.63897', '91.108189', '西藏亚雄实业有限公司拉萨市南环路专卖店', '西藏亚雄实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1527, '34410100087006001', '河南省', '许昌市', '市辖区', '许昌市市辖区1', '34.767052', '113.753094', '许昌茅酱荟商贸有限公司中心库', '许昌茅酱荟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1528, '254540100003', '西藏自治区', '拉萨市', '城关区', '拉萨市城关区岗廓路1号拉萨阳光酒店临街京街广场5号商铺', '29.6487', '91.184844', '西藏祥圣商贸有限公司拉萨市岗廓路专卖店', '西藏祥圣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1529, '2352242800002', '贵州省', '毕节市', '七星关区', '毕节市七星关区深圳路拓海南山郡1、2、3号商业裙楼1层20号、21号门', '27.276438', '105.288049', '毕节市碧阳大道茅台酱香万家共享主题终端', '贵州省毕节皓然商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1530, '161612701002', '陕西省', '榆林市', '榆阳区', '榆林市榆阳区湖滨南路19号', '38.302871', '109.746722', '榆林市湖滨南路贵州茅台专卖店', '榆林市天惠集团购物有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1531, '252520330002', '贵州省', '安顺市', '平坝区', '安顺市平坝区贵州省安顺市平坝区安平街道迎宾中路中润国际广场44号门面', '26.407452', '106.265172', '安顺市平坝区迎宾路贵州茅台专卖店', '贵州习水华泰龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1532, '137370724002', '山东省', '潍坊市', '临朐县', '潍坊市临朐县朐山路4733号(山水文苑）', '36.505794', '118.545372', '临朐县朐山路贵州茅台专卖店', '潍坊振国商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1533, '122220500001', '吉林省', '通化市', '东昌区', '通化市东昌区江畅路中盛中央花园商业街S3/1-1号', '41.703327', '125.936094', '通化市江畅路贵州茅台专卖店', '通化市义和酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1534, '2337232800001', '山东省', '滨州市', '博兴县', '滨州市博兴县山东省博兴县乐安大街393号', '37.14381', '118.120868', '博兴县乐安大街茅台酱香万家共享主题终端', '山东省博兴县宏泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1535, '241410188001', '河南省', '郑州市', '管城回族区', '郑州市管城回族区郑州市管城回族区经济技术开发区经南三路与商英街交叉口向东100米路南', '34.717825', '113.73729', '郑州市经南三路贵州茅台专卖店', '河南三达德商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1536, '114140226001', '山西省', '朔州市', '朔城区', '朔州市朔城区振华东街佳和枫景二期166号商铺', '39.347975', '112.458274', '朔州市振华东街贵州茅台专卖店', '朔州凯立源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1537, '115153500002', '内蒙古自治区', '阿拉善盟', '阿拉善左旗', '阿拉善盟阿拉善左旗吉兰泰东路与腾飞大道交汇处庆泰国际大酒店104商铺', '38.844386', '105.728309', '阿拉善左旗吉兰泰东路贵州茅台专卖店', '阿拉善盟尧欣然商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1538, '233330190002', '浙江省', '杭州市', '西湖区', '杭州市西湖区蒋村街道紫云街110号', '30.282119', '120.066681', '杭州市紫云街贵州茅台专卖店', '杭州兴利投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1539, '22650100011104', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '乌鲁木齐市天山区新疆乌鲁木齐市天山区大湾北路69号', '43.787408', '87.647857', '大湾北路玖泰百信主题终端店', '乌鲁木齐玖泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1540, '153530100006', '云南省', '昆明市', '五华区', '昆明市五华区华山街道北门街62号俊园3号商铺', '25.051842', '102.706948', '昆明市北门街贵州茅台专卖店', '昆明金葵花贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1541, '137370290001', '山东省', '青岛市', '崂山区', '青岛市崂山区香港东路83号甲、乙网点', '36.080459', '120.446937', '青岛市香港东路贵州茅台专卖店', '青岛盛海峰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1542, '153530100009', '云南省', '昆明市', '官渡区', '昆明市官渡区吴井街道 春城路17号', '25.031937', '102.72572', '昆明市春城路贵州茅台专卖店', '昆明永尚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1543, '134340521001', '安徽省', '马鞍山市', '当涂县', '马鞍山市当涂县姑孰镇太白中路463号、465号、467号', '31.569331', '118.491', '当涂县太白中路贵州茅台专卖店', '安徽风云酒业商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1544, '2233020000001', '浙江省', '宁波市', '镇海区', '宁波市镇海区骆驼街道镇海大道中段420号', '29.966244', '121.593019', '宁波市骆驼街道贵州茅台酱香系列酒体验中心', '宁波万堂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1545, '141410500003', '河南省', '安阳市', '文峰区', '安阳市文峰区紫薇大道街道文峰大道502号开祥楼', '36.097722', '114.383618', '安阳市文峰大道贵州茅台专卖店', '新乡市国源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1546, '630100019003', '青海省', '西宁市', '城西区', '西宁市城西区胜利路25号2号楼25-17 25-19 25-21', '36.628305', '101.765843', '青海省西宁市胜利路贵州茅台43度经销（茅台酒）', '青海汇忠商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1547, '141410225001', '河南省', '开封市', '兰考县', '开封市兰考县振兴路与考城路交叉口向北220米，路东仟禧华庭1-2号商铺', '34.845256', '114.809438', '兰考县振兴路北段贵州茅台专卖店', '兰考日盛实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1548, '120113002003', '天津市', '天津市', '北辰区', '天津市北辰区宜兴埠镇宜兴路与贵富道交口西南侧新乐汇商业中心1号楼101、102', '39.199889', '117.217323', '天津宜兴路贵州茅台专卖店', '天津市星洲永耀商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1549, '153530100016', '云南省', '昆明市', '西山区', '昆明市西山区南亚风情第壹城南亚星光苑7幢1-2层D5-7室', '25.006677', '102.683989', '昆明市河景街贵州茅台自营店', '云南国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1550, '153530100012', '云南省', '昆明市', '盘龙区', '昆明市盘龙区龙泉街道北京路延长线金江小区7-33/34/35号商铺', '25.098245', '102.740455', '昆明市北京路贵州茅台专卖店', '昆明宏烨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1551, '22510100082001', '四川省', '成都市', '双流区', '成都市双流区四川省成都市双流区瑞吉路99号', '30.563373', '103.907424', '瑞吉路茅台酱香万家共享主题终端', '双流区昌衡酒水商贸部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1552, '134341285001', '安徽省', '阜阳市', '颍州区', '阜阳市颍州区清河街道淮河路易景国际花园南门S22#S23#商铺', '32.872983', '115.811278', '阜阳市淮河路贵州茅台专卖店', '阜阳市宏升商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1553, '236360483002', '江西省', '九江市', '濂溪区', '九江市濂溪区长江大道502号慧龙长江国际3栋104-107', '29.682043', '115.980679', '九江市长江大道贵州茅台专卖店', '九江晶磊贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1554, '100520100032', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区黔灵西路7号', '26.586628', '106.710919', '贵阳市黔灵西路贵州茅台专卖店', '贵阳阳光灿灿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1555, '510400006', '四川省', '攀枝花市', '市辖区', '攀枝花市市辖区 攀枝花大道东段874号', '26.573741', '101.709346', '攀枝花润萱商贸有限公司中心库', '攀枝花润萱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1556, '214140600001', '山西省', '朔州市', '朔城区', '朔州市朔城区振华东街碧丽园小区1栋6号', '39.349357', '112.44108', '朔州市振华东街贵州茅台43度经销（茅台酒）', '朔州新合作瑞通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1557, '340500005', '安徽省', '马鞍山市', '花山区', '马鞍山市花山区花山区大华马鞍山国际广场7-111', '31.726004', '118.484883', '安徽圣创名品商贸有限公司中心库', '安徽圣创名品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1558, '152522227001', '贵州省', '铜仁市', '德江县', '铜仁市德江县青龙街道江与城四期·御府2号楼2单元', '28.243446', '108.123357', '德江县上海路贵州茅台专卖店', '德江杨杨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1559, '2321040000003', '辽宁省', '抚顺市', '新抚区', '抚顺市新抚区西-路29号楼6号', '41.859943', '123.892428', '抚顺市西一路茅台酱香万家共享主题终端', '抚顺天朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1560, '2321040000002', '辽宁省', '抚顺市', '顺城区', '抚顺市顺城区美城路26号楼（6号门市）', '41.886449', '123.984211', '抚顺市美城路茅台酱香万家共享主题终端', '抚顺天朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1561, '131310101002', '上海市', '上海市', '黄浦区', '上海市黄浦区中华路368号', '31.21968', '121.498829', '上海市中华路贵州茅台自营店', '上海国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1562, '340225001', '安徽省', '芜湖市', '无为市', '芜湖市无为市安徽省芜湖市无为市无为经济开发区福东路18号（芜湖市盈海食品有限公司院内）', '0.0', '0.0', '无为县三源糖酒销售有限公司中心库', '无为县三源糖酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1563, '43460200018', '海南省', '三亚市', '吉阳区', '三亚市吉阳区荔枝沟路荣兴建材城万利城小区首层', '18.290532', '109.517989', '三亚丹州北路贵州茅台43度经销（茅台酒）', '海南国新贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1564, '151510189002', '四川省', '成都市', '成华区', '成都市成华区青城山路118号4栋1层6号', '30.623417', '104.136346', '成都市青城山路贵州茅台专卖店', '四川鑫泰吉亨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1565, '151510189001', '四川省', '成都市', '成华区', '成都市成华区东客站西广场地下配套服务区Part1', '30.629583', '104.138856', '成都市东客站西广场贵州茅台专卖店', '成都市礼佳兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1566, '2241018900003', '河南省', '郑州市', '金水区', '郑州市金水区广电南路与福彩路交叉口向东200米路北', '34.805997', '113.700133', '郑州市广电南路贵州茅台酱香系列酒体验中心', '河南行道贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1567, '2441130000001', '河南省', '南阳市', '社旗县', '南阳市社旗县北京路与赊店路交叉口西南角', '33.058865', '112.924652', '社旗县北京路贵州茅台专卖店', '南阳市万德隆商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1568, '2241018900002', '河南省', '郑州市', '金水区', '郑州市金水区南阳路南丰街交叉口向南100米路东', '34.779993', '113.646844', '郑州市南阳路贵州茅台酱香系列酒体验中心', '郑州市泸凯贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1569, '152520321001', '贵州省', '遵义市', '播州区', '遵义市播州区保利未来城市四街区B-A-2贵州茅台专卖店', '27.611822', '106.874396', '遵义市遵南大道中段贵州茅台专卖店', '遵义市珑钰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1570, '2241018900001', '河南省', '郑州市', '市辖区', '郑州市市辖区郑东新区东风东路与众意路东南角', '34.789', '113.723', '郑州市众意路贵州茅台酱香系列酒体验中心', '河南盛林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1571, '221210100001', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区智慧四街20-2号1门4门', '41.688449', '123.458619', '沈阳市智慧四街贵州茅台专卖店', '沈阳酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1572, '22511381001001', '四川省', '成都市', '温江区', '成都市温江区成都市温江区柳城政通东路1353、1355号', '30.405', '103.511', '柳城政通东路茅台酱香万家共享主题终端', '成都欣然商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1573, '135350782001', '福建省', '南平市', '武夷山市', '南平市武夷山市崇安街道营盘路68-6号', '27.752695', '118.029858', '武夷山市营盘路贵州茅台专卖店', '武夷山凯创贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1574, 'B33000000801', '浙江省', '杭州市', '上城区', '杭州市上城区浙江省杭州市上城区平海路124号一层F1-1a号', '30.254743', '120.162383', '杭州市上城区平海路124号贵州茅台旗舰店', '杭州茅淋光食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1575, '22410324002001', '河南省', '洛阳市', '栾川县', '洛阳市栾川县栾川乡罗庄村钼都路107号', '33.776906', '111.639517', '栾川县钼都路茅台酱香万家共享主题终端', '栾川县通达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1576, '2665010000301', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '乌鲁木齐市水磨沟区新疆乌鲁木齐市水磨沟区昆仑东街46号', '43.834341', '87.620248', '水磨沟区昆仑东街茅台酱香万家共享主题终端', '乌鲁木齐市宜新商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1577, 'B33000000800', '浙江省', '杭州市', '临平区', '杭州市临平区浙江省杭州市临平区泰山村1幢(崇超路和龙超路口,青莲寺西)（华商糖酒）', '30.432504', '120.204787', '杭州市临平区泰山村1幢(崇超路和龙超路口,青莲寺西)（华商糖酒）贵州茅台旗舰店总库', '杭州茅淋光食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1578, '330902001', '浙江省', '舟山市', '定海区', '舟山市定海区 舟山市定海区东河南路123号', '30.005418', '122.117124', '舟山市得新贸易有限公司中心库', '舟山市得新贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1579, '252520182005', '贵州省', '贵阳市', '南明区', '贵阳市南明区贵阳市南明区中华南路街道蓝波湾巷1号蓝波湾花园裙房1层6号', '26.572882', '106.707573', '贵阳市文化路贵州茅台专卖店', '贵州龙海洋皇宫餐饮有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1580, '34110105099006001', '湖南省', '株洲市', '天元区', '株洲市天元区1', '27.826738', '113.082227', '株洲冠融供应链有限公司中心库', '株洲冠融供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1581, '252520182006', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区中华中路1号峰会国际1层2号、3号商铺', '26.579543', '106.711969', '贵阳市中华中路贵州茅台专卖店', '贵州胜江南绿色产业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1582, 'Z440300044', '广东省', '深圳市', '福田区', '深圳市福田区福华路嘉汇新城汇商中心1303', '22.538711', '114.080724', '深圳市福华路贵州茅台总经销店', '深圳市利福乐贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1583, '2341148100002', '河南省', '商丘市', '永城市', '商丘市永城市欧亚路与中原路交叉口欧亚阳光花园楼下', '33.939411', '116.461361', '永城市欧亚路茅台酱香万家共享主题终端', '永城市锋伟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1584, 'Z440300045', '广东省', '深圳市', '福田区', '深圳市福田区中康路卓越梅林中心广场一期三栋1001', '22.570858', '114.060195', '深圳市中康路贵州茅台总经销店', '深圳市鹏顺发贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1585, '2222010000001', '吉林省', '长春市', '南关区', '长春市南关区东安瑞凯国际C、D-1地块D-HH-1幢101室', '43.797187', '125.314157', '长春市东安瑞凯国际贵州茅台酱香系列酒体验中心', '吉林省天喜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1586, '2222010000003', '吉林省', '长春市', '南关区', '长春市南关区恒丰国际A座3-106', '43.786774', '125.379597', '长春市恒丰国际贵州茅台酱香系列酒体验中心', '吉林省嘉源创展经贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1587, '22410600003001', '河南省', '鹤壁市', '浚县', '鹤壁市浚县黎阳路街道新华路与金城路交叉口向东200米处', '35.684663', '114.55034', '浚县金城路茅台酱香万家共享主题终端', '鹤壁启迪商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1588, '121210300001', '辽宁省', '鞍山市', '铁东区', '鞍山市铁东区万和街127栋1层S3-S5', '41.073884', '123.029919', '鞍山市万和街贵州茅台专卖店', '鞍山美好嘉里商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1589, '132320382001', '江苏省', '徐州市', '邳州市', '徐州市邳州市运河镇珠江路', '34.323907', '117.9689', '邳州市珠江东路贵州茅台专卖店', '邳州市青山酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1590, '144440200002', '广东省', '韶关市', '浈江区', '韶关市浈江区中山路23栋福达大厦首层116、117、118铺', '24.811709', '113.595275', '韶关市中山路贵州茅台专卖店', '广东省韶关市新粤北酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1591, '144440200001', '广东省', '韶关市', '武江区', '韶关市武江区沿江路16号南枫碧水花城I幢-1层5、6、7号商铺', '24.774627', '113.583362', '韶关市沿江路贵州茅台专卖店', '广东和茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1592, '232320400001', '江苏省', '常州市', '钟楼区', '常州市钟楼区宝龙国际花园61-737', '31.793517', '119.89318', '常州市茶花路贵州茅台43度经销店', '常州市福庆酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1593, '143430421001', '湖南省', '衡阳市', '衡阳县', '衡阳市衡阳县西渡镇洪山路万家灯火7栋101室', '26.962352', '112.404972', '衡阳县洪山路贵州茅台专卖店', '衡阳市糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1594, '224641000001', '河南省', '信阳市', '平桥区', '信阳市平桥区新八街与新七大道交叉口信合金融大厦1楼门面103-1号', '32.14324', '114.086317', '信阳市羊山新区贵州茅台酱香系列酒体验中心', '信阳市葆鸿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1595, '22420129004001', '湖北省', '武汉市', '汉阳区', '武汉市汉阳区永丰街燎原村K3地块24—31号S120商铺', '30.571109', '114.195411', '汉阳区永丰街茅台酱香万家共享主题终端', '武汉亿亿达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1596, '320404001', '江苏省', '常州市', '钟楼区', '常州市钟楼区江苏省常州市钟楼区怀德中路123号', '0.0', '0.0', '江苏郭氏副食品有限公司中心库', '江苏郭氏副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1597, '143430228001', '湖南省', '株洲市', '石峰区', '株洲市石峰区学林街道红旗北路348号凯风珑城13栋106、107、108号', '27.875828', '113.143487', '株洲市红旗北路贵州茅台专卖店', '湖南天九商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1598, '22430000004011', '湖南省', '怀化市', '鹤城区', '怀化市鹤城区城中街道天星东路161-163号诚信御园8栋', '27.540106', '109.969665', '中玉商贸茅台酱香万家共享主题终端', '怀化市中玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1599, '150500105001', '重庆市', '重庆市', '渝北区', '重庆市渝北区北部新区宝华大道15号11号楼1-10，1-11号', '29.598906', '106.553181', '重庆市宝华大道贵州茅台专卖店', '重庆恒明商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1600, '253530185001', '云南省', '昆明市', '官渡区', '昆明市官渡区世纪城珥季路D段1-10号', '24.965022', '102.759297', '昆明市珥季路贵州茅台43度经销店', '云南强胜酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1601, '330381001002', '浙江省', '温州市', '瑞安市', '温州市瑞安市锦佳华庭A区万松东路552号', '27.777533', '120.670367', '瑞安莘塍街道万松东路贵州茅台专卖店', '瑞安市大台发贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1602, '2341082500001', '河南省', '焦作市', '温县', '焦作市温县子夏大街新东未来城小区457号商铺', '34.947628', '113.095915', '温县子夏大街茅台酱香万家共享主题终端', '焦作市盛捷商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1603, '2144010010001', '广东省', '广州市', '天河区', '广州市天河区粤垦路1号201房之一铺自编1号', '23.150445', '113.334077', '广州市天河区粤垦路茅台酱香酒文化体验馆', '广州鼎申贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1604, '113130600006', '河北省', '保定市', '竞秀区', '保定市竞秀区创业路508号风帆家园7-1', '38.904396', '115.488871', '保定市创业路贵州茅台专卖店', '保定新耀泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1605, '2337290100001', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区中华西路2195号', '35.235317', '115.454529', '菏泽市中华西路茅台酱香万家共享主题终端', '菏泽市兴亚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1606, '23310114002003', '上海市', '上海市', '宝山区', '上海市宝山区上海市宝山区月辉路108弄12号（兰雅路松傲路路口）', '31.38967', '121.439466', '宝山区月辉路贵州茅台酱香系列酒体验中心', '上海国茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1607, '2337290100002', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区八-路与华英路交叉口往南100米路西', '35.246752', '115.492007', '菏泽市华英路茅台酱香万家共享主题终端', '菏泽九都食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1608, '2235032300002', '福建省', '莆田市', '城厢区', '莆田市城厢区荔城南大道1428号3号104-108室', '25.421984', '118.997516', '莆田市荔城南大道贵州茅台酱香系列酒体验中心', '莆田市永盛世纪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1609, '113130600007', '河北省', '保定市', '竞秀区', '保定市竞秀区云杉路115号', '38.902997', '115.463086', '保定市云杉路贵州茅台专卖店', '河北华达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1610, '234340128002', '安徽省', '合肥市', '巢湖市', '合肥市巢湖市东塘路世纪新都C区S4幢114号', '31.60489', '117.885162', '巢湖市东塘路贵州茅台43度经销店', '巢湖市陈义兴商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1611, '234340128001', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区休宁路绿怡居西小高层39栋102门面', '31.82333', '117.239117', '合肥市休宁路贵州茅台43度经销店', '安徽吉创名品供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1612, '115152301001', '内蒙古自治区', '通辽市', '科尔沁区', '通辽市科尔沁区叫来河大街碧桂园御龙湾北区南门', '43.667969', '122.275282', '通辽市叫来河大街贵州茅台专卖店', '通辽市协成商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1613, '321283002', '江苏省', '泰州市', '泰兴市', '泰州市泰兴市黄桥镇华溪中路173号', '32.222606', '120.192948', '泰州煜煌商贸有限公司中心库', '泰州煜煌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1614, '22441902002001', '广东省', '东莞市', '长安区', '东莞市长安区长安镇莲峰北路15号102室', '22.812416', '113.808905', '长安镇莲峰北路茅台酱香万家共享主题终端', '东莞市唯臻汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1615, '146460006001', '海南省', '万宁市', '万宁市', '万宁市万宁市万城镇环三东路南侧', '18.817055', '110.396282', '万宁市环三东路贵州茅台专卖店', '海南联合利华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1616, '113130600001', '河北省', '保定市', '莲池区', '保定市莲池区恒祥北大街755-10-1/2门脸', '38.885753', '115.49666', '保定市恒祥北大街贵州茅台专卖店', '乾坤福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1617, '211110102012', '北京市', '北京市', '丰台区', '北京市丰台区西三环南路19号内19-8-2', '39.875784', '116.311083', '北京市西三环南路贵州茅台43度经销店', '北京艾尔沃特商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1618, '153532522001', '云南省', '红河哈尼族彝族自治州', '蒙自市', '红河哈尼族彝族自治州蒙自市文澜街道北京路中段西湖水岸项目一期1栋1层S01-1号商铺', '23.390605', '103.382351', '蒙自市北京路贵州茅台专卖店', '蒙自同创商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1619, 'MAOTAI1002', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市茅台镇茅台国际大酒店茅台酒专卖店', '27.859255', '106.381039', '仁怀市河滨街贵州茅台自营店', '仁怀市华赤酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1620, '211110102011', '北京市', '北京市', '西城区', '北京市西城区榴乡路88号院石榴中心2号楼511', '39.841', '116.423382', '北京市榴乡路贵州茅台总经销店', '西藏酒盒子商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1621, '22522225002001', '贵州省', '铜仁市', '思南县', '铜仁市思南县双龙大道尊龙世纪城8栋6号门面（思南金广汇酒业）', '27.920572', '108.242063', '思南县双龙大道茅台酱香万家共享主题终端', '思南金广汇酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1622, '2152240110001', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市中枢镇中茅大道磨槽湾', '27.805529', '106.391348', '仁怀市中茅大道贵州省仁怀市恒源泉贸易有限公司门店', '贵州省仁怀市恒源泉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1623, '152522424002', '贵州省', '毕节市', '金沙县', '毕节市金沙县民兴街道金槐社区兴盛商城A-1-11、A-1-12、A-1-13号商铺', '27.497703', '106.242358', '金沙县黄河大道贵州茅台专卖店', '金沙品尊商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1624, '2334012200001', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区濉溪路99号国泰都市公寓2栋101、201室', '31.879395', '117.284363', '合肥市濉溪路茅台酱香万家共享主题终端', '合肥川久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1625, '141410192004', '河南省', '郑州市', '管城回族区', '郑州市管城回族区泰宏国际广场C座1层西户', '34.753733', '113.765833', '郑州市榆林南路贵州茅台专卖店', '郑州沐欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1626, '34440300083004001', '广东省', '深圳市', '龙岗区', '深圳市龙岗区深圳市龙岗区坂田街道杨美社区伯公坳路1号华昱机构5号楼4层408', '22.627397', '114.07951', '广东华昱粤海酒业有限公司中心库', '广东华昱粤海酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1627, '141410192002', '河南省', '郑州市', '金水区', '郑州市金水区心怡路199号郑州东站三层商务候车厅伍厅', '34.758508', '113.779407', '郑州市心怡路贵州茅台专卖店', '郑州强东商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1628, '141410192001', '河南省', '郑州市', '金水区', '郑州市金水区农业东路96号1号楼1层附8号', '34.771566', '113.754253', '郑州市农业南路贵州茅台专卖店', '河南省中州商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1629, '142420384001', '湖北省', '十堰市', '郧阳区', '十堰市郧阳区城关镇沿江大道88号', '32.826974', '110.812491', '十堰市沿江大道贵州茅台专卖店', '十堰市天天向上酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1630, '2141018310001', '河南省', '郑州市', '新密市', '郑州市新密市青屏大街398号', '34.539417', '113.382363', '新密市青屏大街新密市青屏宏发副食百货文具商行门店', '新密市青屏宏发副食百货文具商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1631, '1303220020001', '河北省', '秦皇岛市', '昌黎县', '秦皇岛市昌黎县茅台凤凰庄园', '39.766225', '119.095571', '昌黎县茅台凤凰庄园贵州茅台集团子公司', '昌黎茅台葡萄酒经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1632, '2342069300002', '湖北省', '襄阳市', '樊城区', '襄阳市樊城区春园西路民发大酒店院内D座-楼2-1-016', '32.052227', '112.129993', '襄阳市春园西路茅台酱香万家共享主题终端', '襄阳程彦坤金源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1633, '2132140210001', '江苏省', '泰州市', '姜堰区', '泰州市姜堰区姜堰大道116号', '32.506971', '120.121683', '姜堰区姜堰大道贵州茅台酱香系列酒体验中心', '泰州市曹驰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1634, '2152032310001', '贵州省', '遵义市', '绥阳县', '遵义市绥阳县幸福大道龙瑞酒店-楼', '26.657667', '106.657194', '绥阳县幸福大道贵州崇本商贸有限公司门店', '贵州崇本商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1635, '2642013000701', '湖北省', '武汉市', '武昌区', '武汉市武昌区武昌区和平大道750号绿地国际金融城A02地块一期第4幢1单元1层2号房', '30.576318', '114.313398', '武昌区和平大道茅台酱香万家共享主题终端', '武汉雨卿食品商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1636, '144440900002', '广东省', '茂名市', '茂南区', '茂名市茂南区站北一路27号', '21.651577', '110.905623', '茂名市站北一路贵州茅台专卖店', '茂名市盈华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1637, '261612722001', '陕西省', '榆林市', '神木市', '榆林市神木市滨河新区广场西路天晟大厦2-8号底商', '38.899282', '110.462843', '神木市广场西路贵州茅台专卖店', '神木市隆盛和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1638, '141410192006', '河南省', '洛阳市', '宜阳县', '洛阳市宜阳县城关镇兴宜东路水晶城一幢124号、125号商铺', '34.519808', '112.19031', '宜阳县兴宜东路贵州茅台专卖店', '洛阳国图商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1639, '141410192005', '河南省', '郑州市', '管城回族区', '郑州市管城回族区人民路24号（人民路与北下街交汇口）', '34.754424', '113.669924', '郑州市人民南路贵州茅台专卖店', '河南鼎庆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1640, '22520225004001', '贵州省', '六盘水市', '六枝特区', '六盘水市六枝特区九龙街道中盛山水城C区5栋28-29号门面', '26.193171', '105.481276', '六枝特区九龙街道茅台酱香万家共享主题终端', '六盘水溢香醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1641, '150500227001', '重庆市', '重庆市', '璧山区', '重庆市璧山区重庆市璧山区璧泉街道莱山路2号附14、15、16、17号', '29.580162', '106.225738', '重庆市莱山路贵州茅台专卖店', '重庆市羽杨酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1642, '2137293110001', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区中华路与华英路向南100米路西', '35.230699', '115.490263', '菏泽市中华路菏泽贵族商贸有限公司门店', '菏泽贵族商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1643, '211110102009', '北京市', '北京市', '丰台区', '北京市丰台区丰台区郭公庄南街11号院诺德春风和院4号楼102', '39.813197', '116.316901', '北京市诺德春风和院贵州茅台专卖店', '林芝玖玖投资发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1644, '235350800001', '福建省', '龙岩市', '新罗区', '龙岩市新罗区龙岩大道中326号（水晶兰天小区）6号幢04-06号店', '25.082022', '117.019246', '龙岩市龙岩大道中贵州茅台专卖店', '福建华彩贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1645, '22220186004001', '吉林省', '长春市', '朝阳区', '长春市朝阳区文化街与新发路交汇666号', '43.9', '125.32', '朝阳区文化街茅台酱香万家共享主题终端', '吉林省吉兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1646, '320506001002', '江苏省', '苏州市', '吴中区', '苏州市吴中区宝带东路399号2幢101室1045号', '31.265356', '120.632656', '苏州市宝带东路贵州茅台自营店', '江苏国酒茅台有限公司苏州分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1647, '144440191001', '广东省', '广州市', '黄埔区', '广州市黄埔区大沙地东319号101商铺', '23.107061', '113.457839', '广州市大沙东路贵州茅台专卖店（保利誉景）', '广州市润轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1648, '2311022400001', '北京市', '北京市', '丰台区', '北京市丰台区花乡高立庄616号新华国际中心A座1层108室', '39.802061', '116.309291', '北京市花乡高立庄茅台酱香万家共享主题终端', '北京金源腾达酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1649, '2137133010001', '山东省', '临沂市', '河东区', '临沂市河东区正阳路3号', '35.071622', '118.403045', '临沂市正阳路临沂辰泽商贸有限公司门店', '临沂辰泽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1650, '137370985001', '山东省', '泰安市', '岱岳区', '泰安市岱岳区泰山大街西段信德彩世界一层', '36.18424', '117.044818', '泰安市泰山大街贵州茅台专卖店', '泰安市泰山名饮有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1651, '165654700001', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '乌鲁木齐市水磨沟区红光山路888号绿城广场5、6栋一层商业7号 ', '43.873203', '87.612538', '乌鲁木齐市红光山路贵州茅台专卖店', '乌鲁木齐玖泰德盛贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1652, '2237148300002', '山东省', '德州市', '德城区', '德州市德城区山东省德州市天衢新区宋官屯街道办事处东风东路1888号康博公馆8号楼商业1-2层 4号', '37.43456', '116.370839', '德州市东方红东路贵州茅台酱香系列酒体验中心', '德州市丰永商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1653, '135350324001', '福建省', '莆田市', '荔城区', '莆田市荔城区荔城区文献东路1039号', '25.430131', '119.023053', '莆田市文献东路贵州茅台专卖店', '莆田市新中亚实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1654, '162620527001', '甘肃省', '天水市', '麦积区', '天水市麦积区渭滨南路34号', '34.556777', '105.900062', '天水市渭滨南路贵州茅台专卖店', '天水东辰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1655, '110105099121', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '乌鲁木齐市沙依巴克区宝山路386号和枫雅居小区19栋3层商铺13', '43.799567', '87.589499', '乌鲁木齐潘有致远国际贸易有限责任公司中心库', '乌鲁木齐潘有致远国际贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1656, '2336010000001', '江西省', '南昌市', '西湖区', '南昌市西湖区西湖区绿地朝阳中心18栋1单元101室', '28.646732', '115.865448', '南昌市绿地朝阳中心茅台酱香万家共享主题终端', '南昌华宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1657, '2344030500002', '广东省', '深圳市', '宝安区', '深圳市宝安区新安街道安乐社区40区新安-路与翻身路交汇处西侧银鸿大厦113', '22.553494', '113.901762', '深圳市新安街道茅台酱香万家共享主题终端', '深圳市汇星宸贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1658, '110105099120', '山东省', '淄博市', '桓台县', '淄博市桓台县中心大街946号', '36.959279', '118.095251', '淄博金涵商业有限公司中心库', '淄博金涵商业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1659, '2152262710001', '贵州省', '黔东南苗族侗族自治州', '天柱县', '黔东南苗族侗族自治州天柱县汉华阳光城7栋104/105门面', '26.913589', '109.219551', '天柱县汉华阳光城天柱县阳光烟酒店门店', '天柱县阳光烟酒店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1660, '132321089002', '江苏省', '扬州市', '宝应县', '扬州市宝应县叶挺路95号', '33.237102', '119.322043', '扬州市叶挺路贵州茅台专卖店', '扬州申翔商贸物资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1661, '22450484002001', '广西壮族自治区', '梧州市', '藤县', '梧州市藤县藤州镇江滨大道168号河东独山小区锦绣豪庭二期B区47、48号商铺', '23.22', '110.54', '藤县藤州镇江滨大道茅台酱香万家共享主题终端', '广西梧州朋缘贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1662, '252522421001', '贵州省', '毕节市', '七星关区', '毕节市七星关区砂石路3号', '27.302168', '105.286767', '毕节市砂石路贵州茅台专卖店', '毕节市糖业烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1663, '137370323001', '山东省', '淄博市', '沂源县', '淄博市沂源县螳螂河西路北69号西城华府小区4号楼010301-010303', '36.197327', '118.14661', '沂源县螳螂河西路贵州茅台专卖店', '淄博宝路喜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1664, '2341072800002', '河南省', '新乡市', '长垣市', '新乡市长垣市蒲西区匡城路222号', '35.185712', '114.665375', '长垣市匡城路茅台酱香万家共享主题终端', '长垣云祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1665, '2341072800001', '河南省', '新乡市', '长垣市', '新乡市长垣市蒲西区人民路东段路南65号', '35.200083', '114.673106', '长垣市人民路茅台酱香万家共享主题终端', '长垣县华晨副食店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1666, '2345072300001', '广西壮族自治区', '钦州市', '钦北区', '钦州市钦北区扬帆大道31号正元及第尊府9号楼11号商铺', '21.963955', '108.647217', '钦州市永福西大街茅台酱香万家共享主题终端', '钦州市桂茅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1667, '22130684002001', '河北省', '保定市', '高碑店市', '保定市高碑店市白沟新城白沟镇兴盛大街东侧团结路南侧鹏润MINI工社1幢1-7门店', '39.137898', '116.038986', '白沟新城白沟镇兴盛大街茅台酱香万家共享主题终端', '保定白沟新城铭品酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1668, '134340132001', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区科学大道与黄山路交口信达银信广场A座110,112-114', '31.84285', '117.205326', '合肥市科学大道贵州茅台专卖店', '合肥联家商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1669, 'B54010200101', '西藏自治区', '拉萨市', '城关区', '拉萨市城关区城关区纳金路万达广场金街W1001', '29.657403', '91.143876', '拉萨市城关区纳金路万达广场金街贵州茅台旗舰店', '西藏玖凌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1670, '24340311001010', '安徽省', '蚌埠市', '市辖区', '蚌埠市市辖区安徽省蚌埠市淮上区上河路357号', '32.967', '117.342817', '安徽亿发久糖酒超市连锁有限公司中心库', '安徽亿发久糖酒超市连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1671, '242420127002', '湖北省', '武汉市', '江岸区', '武汉市江岸区塔子湖街道华隆路首地云梦台3-12、13、14、15商铺', '30.654971', '114.287435', '武汉市健康街贵州茅台专卖店', '武汉瀚深百年商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1672, '2341072800004', '河南省', '新乡市', '长垣市', '新乡市长垣市富美小区门口', '35.201026', '114.663425', '长垣市特区一号茅台酱香万家共享主题终端', '长垣市正通名酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1673, '2344058300001', '广东省', '汕头市', '金平区', '汕头市金平区东厦北路175号星汇国际花园6幢112、212号复式', '23.388933', '116.713595', '汕头市星汇国际茅台酱香万家共享主题终端', '广东兆裕贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1674, '2341072800003', '河南省', '新乡市', '长垣市', '新乡市长垣市蒲西区宏力大道与卫华大道交叉口东北角10米', '35.193278', '114.669959', '长垣市宏力大道茅台酱香万家共享主题终端', '长垣市正通名酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1675, '132320591001', '江苏省', '苏州市', '吴中区', '苏州市吴中区木渎镇金山路191号', '31.269525', '120.518169', '苏州市金山南路贵州茅台专卖店', '苏州市楚都酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1676, '152520382001', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市盐津街道城南社区国酒城四期B组4B-1-90', '27.783692', '106.397083', '仁怀市醉美大道贵州茅台自营店', '仁怀市华赤酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1677, '242420127001', '湖北省', '武汉市', '江汉区', '武汉市江汉区常飞街常发里103号', '30.611451', '114.240312', '武汉市常飞街贵州茅台专卖店', '武汉友谊副食品商业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1678, '226501050001', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '乌鲁木齐市水磨沟区会展南路555号中天博朗天御一期4号楼101、102室', '43.870704', '87.616268', '乌鲁木齐市水磨沟区会展南路贵州茅台酱香系列酒体验中心', '乌鲁木齐玖泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1679, '410184001002', '河南省', '郑州市', '新郑市', '郑州市新郑市新郑市创业路与中华路交叉口迷你港湾6号楼1单元6105商铺', '34.420547', '113.759311', '新郑市创业路与中华路交叉口贵州茅台专卖店', '新郑市双盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1680, '22410400008001', '河南省', '平顶山市', '卫东区', '平顶山市卫东区河南省平顶山市卫东区建设路街道建设路中段24号宏升国际小区106商铺', '33.735217', '113.327958', '卫东区建设路茅台酱香万家共享主题终端', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1681, '2332080000001', '江苏省', '淮安市', '淮安区', '淮安市淮安区淮城街道天恒王府2幢117.118号门面', '33.524607', '119.147296', '淮安市淮城街道茅台酱香万家共享主题终端', '淮安市茅酱酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1682, '22410400008002', '河南省', '平顶山市', '新华区', '平顶山市新华区河南省平顶山市望湖路与公正路交叉口西80米', '33.757966', '113.197498', '新城区望湖路茅台酱香万家共享主题终端', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1683, '22310107001001', '上海市', '上海市', '静安区', '上海市静安区沪太支路538号103室', '31.291539', '121.423271', '静安区沪太支路茅台酱香万家共享主题终端', '上海泓卿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1684, '223701140001', '山东省', '济南市', '章丘区', '济南市章丘区唐王山路清华园小区北门东20米（王伟酒水对面）', '36.69234', '117.54101', '济南市章丘区唐王山路贵州茅台酱香系列酒体验中心', '济南酱久香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1685, '142429100001', '湖北省', '随州市', '曾都区', '随州市曾都区神农大道19号', '31.695766', '113.383782', '随州市神农大道贵州茅台专卖店', '随州市九润商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1686, '2133030010001', '浙江省', '温州市', '鹿城区', '温州市鹿城区浙南农副产品中心市场1区148号', '28.000947', '120.652619', '鹿城区锦绣路茅台酱香万家共享主题终端', '温州市欧品尚经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1687, '22410400008003', '河南省', '平顶山市', '汝州市', '平顶山市汝州市河南省平顶山市汝州市煤山街道西环路644号', '34.177291', '112.831445', '汝州市双拥路茅台酱香万家共享主题终端', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1688, '2352032500001', '贵州省', '遵义市', '道真仡佬族苗族自治县', '遵义市道真仡佬族苗族自治县河滨路211号', '28.877549', '107.605638', '道真县河滨路茅台酱香万家共享主题终端', '贵州志壹商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1689, '34110105083005001', '四川省', '成都市', '武侯区', '成都市武侯区飞云三巷132号1层', '30.617661', '104.078376', '四川华酱源商贸有限公司中心库', '四川华酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1690, '2315330000002', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区天誉丽景湾小区1号楼1层108商业', '39.771412', '109.990703', '鄂尔多斯市天誉丽景湾茅台酱香万家共享主题终端', '内蒙古美人鱼科技有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1691, '132321402002', '江苏省', '泰州市', '姜堰区', '泰州市姜堰区励才路在水一方公园街区6号楼45-47号', '32.502976', '120.157644', '泰州市励才路贵州茅台专卖店', '泰州市永勤酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1692, '142420126002', '湖北省', '武汉市', '硚口区', '武汉市硚口区海宁路中建御景星城11-7,8,9号商铺', '30.580127', '114.231639', '武汉市海宁路贵州茅台专卖店', '武汉优佰佳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1693, '137370183002', '山东省', '济南市', '市中区', '济南市市中区经五路32-1号', '36.658149', '116.987465', '济南市经五路贵州茅台专卖店', '济南宝聚堂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1694, '22130600002001', '河北省', '保定市', '容城县', '保定市容城县容东善容路135号', '39.04', '115.89', '雄安容东善容路茅台酱香万家共享主题终端', '乾坤福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1695, '137370183001', '山东省', '济南市', '历下区', '济南市历下区颖秀路三庆齐盛广场5号楼一层110-113号', '36.675791', '117.135767', '济南市颖秀路贵州茅台专卖店', '山东宝真国际酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1696, '143430981001', '湖南省', '益阳市', '沅江市', '益阳市沅江市琼湖街道中联大道巴山路路口阳光世纪3号楼', '28.834492', '112.351316', '沅江市中联大道贵州茅台专卖店', '湖南省沅星物流有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1697, '252520182044', '贵州省', '贵阳市', '南明区', '贵阳市南明区花果园彭家湾花果园项目C区第16栋1层5、6、7号', '26.563551', '106.687912', '贵阳市花果园大街贵州茅台专卖店', '贵州真山真水酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1698, '252520182041', '贵州省', '贵阳市', '南明区', '贵阳市南明区宝山南路88号', '26.573585', '106.727786', '贵阳市宝山南路88号贵州茅台专卖店', '贵州金芦笙特色产品开发有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1699, '2142060010001', '湖北省', '襄阳市', '襄城区', '襄阳市襄城区襄阳市高新技术开发区长虹北路9号襄阳市体育场31号（正门）', '32.057209', '112.131926', '襄阳市长虹北路襄阳三石酒业有限公司自有门店', '襄阳三石酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1700, '231310117002', '上海市', '上海市', '浦东新区', '上海市浦东新区张江镇华夏东路606号(绿地华创中心6号商铺) ', '31.191808', '121.659843', '上海市卓远路贵州茅台专卖店', '上海蓥梵商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1701, '134340100004', '安徽省', '合肥市', '包河区', '合肥市包河区宏村路国贸天悦商业街B2幢114-115', '31.800875', '117.266423', '合肥市宏村路贵州茅台专卖店', '合肥国酒缘贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1702, '134340100007', '安徽省', '合肥市', '包河区', '合肥市包河区合肥高铁南站HFN-2F-03号', '31.797103', '117.289866', '合肥市合肥南站贵州茅台专卖店', '合肥诚来贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1703, '231310117004', '上海市', '上海市', '普陀区', '上海市普陀区曹杨路1702、1706号', '31.254258', '121.406408', '上海市曹杨路贵州茅台专卖店', '上海天盛酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1704, '134340100006', '安徽省', '合肥市', '包河区', '合肥市包河区扬子江路与广西路交口处金融港B5栋一层103，104号商业', '31.751888', '117.291116', '合肥市扬子江路贵州茅台自营店', '安徽国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1705, '231310117003', '上海市', '上海市', '松江区', '上海市松江区莘砖公路258号棕榈广场31号楼商场一楼106铺位', '31.093007', '121.324194', '上海市莘砖公路贵州茅台专卖店', '上海醇酝商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1706, '34110105099014001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区1', '26.621516', '106.591864', '贵州酩博汇酒业有限公司中心库', '贵州酩博汇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1707, '141411400003', '河南省', '商丘市', '睢阳区', '商丘市睢阳区长江路与平原路交叉口东300米路北天然居南苑101/102商铺', '34.417031', '115.625', '商丘市长江路贵州茅台专卖店', '商丘市康禄商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1708, '22441921001001', '广东省', '东莞市', '东莞市', '东莞市东莞市厚街镇S256省道莞太路珊美路段恒新商务酒店一楼', '22.931958', '113.66681', '东莞市厚街镇莞太路茅台酱香万家共享主题终端', '东莞市金仁泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1709, '161610500002', '陕西省', '渭南市', '临渭区', '渭南市临渭区六泉路（上上国风三期正门南侧）', '34.50459', '109.46505', '渭南市六泉路贵州茅台专卖店', '渭南茅友聚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1710, 'B46000000301', '海南省', '海口市', '龙华区', '海口市龙华区海南省海口市龙华区金龙路11号上邦百汇城1号楼一层P1-12-02商铺', '20.021636', '110.323323', '海口市龙华区金龙路11号8贵州茅台旗舰店', '小岛玩乐（海南）实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1711, '22320925004001', '江苏省', '盐城市', '建湖县', '盐城市建湖县江苏省盐城市建湖县县城向阳西路159号', '33.475336', '119.787615', '建湖县向阳西路茅台酱香万家共享主题终端', '盐城市谷承商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1712, '136362202002', '江西省', '赣州市', '南康区', '赣州市南康区陈赞贤大道东山之冠16#楼101', '25.68301', '114.755502', '赣州市陈赞贤大道贵州茅台专卖店', '赣州市中正贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1713, 'Z440300071', '广东省', '深圳市', '福田区', '深圳市福田区香蜜湖街道侨香路3089号恒邦置地大厦十五层1503B', '22.540607', '113.997393', '深圳市侨香路贵州茅台总经销店', '深圳市熙龙大成贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1714, '252520182034', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区观山西路中铁阅山湖 C 组团一期第一期地库及商业1层131、132、133、134、135号', '26.630812', '106.595588', '贵阳市观山西路贵州茅台专卖店', '贵州八方酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1715, '252520182035', '贵州省', '贵阳市', '南明区', '贵阳市南明区机场路8号首开紫郡C7-1-2/3/4、C7-3-1/2/', '26.541074', '106.768895', '贵阳市兴业街贵州茅台专卖店', '贵州彩石梦置业投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1716, 'B46000000300', '海南省', '海口市', '龙华区', '海口市龙华区海南省海口市龙华区金龙路11号上邦百汇城1号楼一层P1-12-02商铺', '20.021636', '110.323323', '海口旗舰店总库', '小岛玩乐（海南）实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1717, '252520182032', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区西二环235号北大资源梦想城项目9号地块9-A01、9-S01号楼', '26.62182', '106.668023', '贵阳市西二环贵州茅台专卖店（北大资源梦想城）', '贵州三汇金阳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1718, '252520182033', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区未来方舟D10组团1层1—2号', '26.594682', '106.761861', '贵阳市崇义北路贵州茅台专卖店', '贵州龙韵天鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1719, '451400001', '广西壮族自治区', '崇左市', '江州区', '崇左市江州区石景林街道友谊大道（龙胤财富广场）第23栋142号', '22.381616', '107.371456', '崇左市江州区旭荣国酒总汇贸易商行中心库', '崇左市江州区旭荣国酒总汇贸易商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1720, '2353038200001', '云南省', '曲靖市', '麒麟区', '曲靖市麒麟区英才路金田吉象园金禄园西南侧约30米', '25.452162', '103.79658', '曲靖市英才路茅台酱香万家共享主题终端', '曲靖旺顺大丁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1721, '2343038400001', '湖南省', '湘潭市', '岳塘区', '湘潭市岳塘区宝塔街道双拥中路9号东方名苑二期商铺A1幢1单元0101001号门面', '27.843136', '112.945001', '湘潭市双拥中路茅台酱香万家共享主题终端', '湘潭醉酱湘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1722, '22640100023001', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区宁夏银川市兴庆区修业路120号', '38.45', '106.27', '兴庆区修业路茅台酱香万家共享主题终端', '宁夏玲珑贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1723, '22340129001001', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区荷叶地街道国际花都郁金苑4号-112', '31.818304', '117.239844', '蜀山区南二环路茅台酱香万家共享主题终端', '安徽省茅粉会贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1724, '133330382002', '浙江省', '温州市', '乐清市', '温州市乐清市丹霞路479号', '28.103274', '120.967347', '乐清市丹霞路贵州茅台专卖店', '乐清市恒仁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1725, '22370524003001', '山东省', '东营市', '东营区', '东营市东营区淮河路水城国际北门东200米', '37.446812', '118.654883', '东营区淮河路茅台酱香万家共享主题终端', '东营市通裕商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1726, '163632802003', '青海省', '海西蒙古族藏族自治州', '德令哈市', '海西蒙古族藏族自治州德令哈市新源路德银国际花园', '37.367089', '97.351158', '德令哈市新源路贵州茅台专卖店', '青海贵仁酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1727, '2341088200001', '河南省', '焦作市', '沁阳市', '焦作市沁阳市河内路花千树小区1号楼105商铺', '35.080788', '112.923059', '沁阳市河内路茅台酱香万家共享主题终端', '沁阳市林泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1728, '135350524001', '福建省', '泉州市', '安溪县', '泉州市安溪县福建省安溪县城厢镇茗城居委会特产城一期6-58号', '25.05548', '118.201224', '安溪县永安路贵州茅台专卖店', '福建省安溪泉丰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1729, '2112010310001', '天津市', '天津市', '武清区', '天津市武清区福源道北侧创业总部基地E01号楼C座112室', '39.095929', '117.174849', '武清区天津鑫瀚鼎源商贸有限公司门店', '天津鑫瀚鼎源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1730, '132320284001', '江苏省', '无锡市', '梁溪区', '无锡市梁溪区盛岸路211-17号', '31.594531', '120.264378', '无锡市盛岸路贵州茅台专卖店', '无锡云岛酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1731, '252520182023', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区天河潭贵阳故事街B3-7', '26.443944', '106.583966', '贵阳市天河潭贵州茅台专卖店', '贵州仁鸿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1732, '115150300001', '内蒙古自治区', '乌海市', '海勃湾区', '乌海市海勃湾区新华东街23号', '39.669746', '106.825119', '乌海市新华东街贵州茅台专卖店', '乌海市华欣贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1733, '22150226001102', '内蒙古自治区', '包头市', '昆都仑区', '包头市昆都仑区阿尔丁北大街10号新星壹品小区翠庭8-13', '40.672391', '109.841062', '昆区玖诚食品经销店', '包头市玖加玖商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1734, '22372301005001', '山东省', '滨州市', '滨城区', '滨州市滨城区黄河十五路723号闻鹊佳苑27号楼108室', '37.406712', '117.918812', '滨城区黄河十五路茅台酱香万家共享主题终端', '山东致诚至赢酒水有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1735, '134340100001', '安徽省', '合肥市', '庐阳区', '合肥市庐阳区合肥市长江中路57号一层西', '31.861953', '117.294495', '合肥市长江中路贵州茅台专卖店', '合肥市糖业烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1736, '134340100003', '安徽省', '合肥市', '瑶海区', '合肥市瑶海区安徽省合肥市瑶海区长江东大街与来安路交口龙湖车桥新界S6栋136号', '31.862713', '117.321232', '合肥市长江东大街贵州茅台专卖店', '合肥钧展商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1737, '134340100002', '安徽省', '合肥市', '瑶海区', '合肥市瑶海区上海路与滨河路交口西北角一尔悦城108号', '31.841809', '117.338769', '合肥市滨河路贵州茅台专卖店', '安徽省生态环境产业集团商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1738, '2244060000004', '广东省', '佛山市', '南海区', '佛山市南海区桂城街道桂城75街区北约大楼首层101-A单元', '23.039549', '113.152015', '佛山市桂城街道贵州茅台酱香系列酒体验中心', '佛山市涛顺酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1739, '22370787002001', '山东省', '潍坊市', '青州市', '潍坊市青州市王府街道办事处云门山南路2368号', '36.686704', '118.484355', '青州市云门山南路茅台酱香万家共享主题终端', '青州市易兴酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1740, '151511500001', '四川省', '宜宾市', '叙州区', '宜宾市叙州区三江路2号华侨城纯水岸一期1幢-1层105号，106号商铺', '28.762826', '104.633489', '宜宾市三江路贵州茅台专卖店', '四川宜宾四联工贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1741, '252520182018', '贵州省', '贵阳市', '南明区', '贵阳市南明区富水南路186号泰祥国际1F-2-1', '26.573912', '106.716184', '贵阳市富水南路贵州茅台专卖店', '贵州省逍迅经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1742, '2313050000002', '河北省', '邢台市', '巨鹿县', '邢台市巨鹿县建设北街32号', '37.217549', '115.041064', '巨鹿县建设北街茅台酱香万家共享主题终端', '巨鹿县久诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1743, '2322250100002', '吉林省', '延边朝鲜族自治州', '和龙市', '延边朝鲜族自治州和龙市和龙大街83号同心路交汇（网通公司对面）', '42.541954', '129.004032', '和龙市和龙大街茅台酱香万家共享主题终端', '延边君和糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1744, '2341050000001', '河南省', '安阳市', '文峰区', '安阳市文峰区石油路中段', '36.086544', '114.366189', '安阳市石油路茅台酱香万家共享主题终端', '河南锦泽源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1745, '2211010600002', '北京市', '北京市', '大兴区', '北京市大兴区西红门宏业东路1号院26号楼', '39.783975', '116.371762', '北京市西红门宏业东路贵州茅台酱香系列酒体验中心', '北京世纪华晟贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1746, 'B15010100101', '内蒙古自治区', '呼和浩特市', '市辖区', '呼和浩特市市辖区呼和浩特市如意工业园区如意广场南侧金泰中心A座11楼', '40.830274', '111.763389', '内蒙古流量宇宙咨询有限公司呼和浩特市如意工业园区如意广场南侧专卖店', '内蒙古流量宇宙咨询有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1747, '252520182012', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区延安东路117号', '26.586288', '106.717832', '贵阳市延安东路贵州茅台专卖店', '贵阳友谊（集团）股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1748, '43411000009', '河南省', '许昌市', '魏都区', '许昌市魏都区潩河北路赵湾小区门面房', '34.041345', '113.840238', '河南许昌潩河北路贵州茅台43度经销（茅台酒）', '许昌成跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1749, '22372331002001', '山东省', '滨州市', '滨城区', '滨州市滨城区黄河五路名仕龙城12号楼102-103商铺', '37.381846', '118.003543', '滨城区黄河五路茅台酱香万家共享主题终端', '滨州市滨城区新锐开诚酒水批发部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1750, '2241010000001', '河南省', '郑州市', '市辖区', '郑州市市辖区黄河南路商鼎路交叉口东南角', '34.754561', '113.745204', '郑州市黄河南路贵州茅台酱香系列酒体验中心', '郑州嘉豪酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1751, '2241010000002', '河南省', '郑州市', '管城回族区', '郑州市管城回族区货站街170号', '34.737487', '113.710007', '郑州市货站街贵州茅台酱香系列酒体验中心', '河南茅酱酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1752, '2132060010001', '江苏省', '南通市', '崇川区', '南通市崇川区青年中路67号锦峰大厦102附5室', '32.004488', '120.877394', '南通市青年中路南通卓世博尔商贸有限公司门店', '南通卓世博尔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1753, '2244190100001', '广东省', '东莞市', '东莞', '东莞市东莞东城西路莞城段4号113室﹑114室﹑115室﹑116室﹑117室﹑118室', '23.037428', '113.76806', '东莞市东城西路贵州茅台酱香系列酒体验中心', '东莞市茅园贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1754, '2212010200003', '天津市', '天津市', '西青区', '天津市西青区李七庄街泰佳道与汇川路交口东南侧武台馨苑公建1-1-124、1-1-210', '39.056831', '117.169103', '天津市李七庄街贵州茅台酱香系列酒体验中心', '天津市锦绣昌隆酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1755, '2343018100001', '湖南省', '长沙市', '浏阳市', '长沙市浏阳市关口街道银天南湖壹号6栋113号', '28.1586', '113.66', '浏阳市关口街道茅台酱香万家共享主题终端', '浏阳市恒森商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1756, '22500103019001', '重庆市', '重庆市', '渝北区', '重庆市渝北区重庆市两江新区礼嘉街道季华路18号11幢1-10/1-11号', '29.680989', '106.513167', '两江新区季华路茅台酱香万家共享主题终端', '重庆集雅酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1757, '133330185001', '浙江省', '杭州市', '临安区', '杭州市临安区锦城街道锦绣山水苑2（2幢104-204）', '30.223144', '119.725289', '杭州市吴越街贵州茅台专卖店', '杭州令月贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1758, '22370186003001', '山东省', '济南市', '历城区', '济南市历城区东晨大街100号上海花园东门北50米', '36.700611', '117.091735', '历城区东晨大街茅台酱香万家共享主题终端', '山东腾达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1759, '142420500004', '湖北省', '宜昌市', '西陵区', '宜昌市西陵区云集路27号', '30.697272', '111.290375', '宜昌市云集路贵州茅台专卖店', '宜昌鑫盛鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1760, '115150100009', '内蒙古自治区', '呼和浩特市', '新城区', '呼和浩特市新城区海拉尔东路街道金悦中心建设项目S-1号商业楼112、113、114、115', '40.85292', '111.755102', '呼和浩特市万通路贵州茅台专卖店', '内蒙古中烟华贸营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1761, '100441700001', '广东省', '阳江市', '江城区', '阳江市江城区西平北路上东新城5幢02号铺', '21.891922', '111.960623', '阳江市西平北路贵州茅台专卖店', '阳江市尚食贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1762, '141411424001', '河南省', '商丘市', '柘城县', '商丘市柘城县淮河路与天平路交叉口西300米榕湖4期贵州茅台', '34.100396', '115.285721', '柘城县淮河路贵州茅台专卖店', '商丘市方中酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1763, '2137310110001', '山东省', '济南市', '莱芜区', '济南市莱芜区龙潭东大街20号', '36.226717', '117.682445', '济南市龙潭东大街山东新成利丰工贸有限公司门店', '山东新成利丰工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1764, '2137310110002', '山东省', '济南市', '莱芜区', '济南市莱芜区赢牟东大街戴花园沿街楼20号', '36.228941', '117.689951', '济南市赢牟东大街山东莱芜金寰工贸有限公司门店', '山东莱芜金寰工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1765, '115150100002', '内蒙古自治区', '呼和浩特市', '赛罕区', '呼和浩特市赛罕区呼和浩特市中级人民法院西侧金正大厦一层', '40.788276', '111.705903', '呼和浩特市昭乌达路贵州茅台专卖店', '内蒙古瑞达伟业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1766, '162623110001', '甘肃省', '陇南市', '武都区', '陇南市武都区东江路东江名府112铺', '33.371841', '104.951723', '陇南市东江路贵州茅台专卖店', '陇南金酱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1767, '142420581001', '湖北省', '宜昌市', '宜都市', '宜昌市宜都市陆城街办名都路3号都市华府111号-112号', '30.379373', '111.441095', '宜都市名都路贵州茅台专卖店', '宜都市福之源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1768, '2142058310001', '湖北省', '宜昌市', '枝江市', '宜昌市枝江市团结路丹阳馨居二期4-101', '30.421144', '111.730321', '枝江市团结路枝江市福鑫盛商贸有限公司门店', '枝江市福鑫盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1769, '34410100087023001', '河南省', '平顶山市', '新华区', '平顶山市新华区1', '33.737251', '113.293977', '平顶山市成睿颖新商贸有限责任公司中心库', '平顶山市成睿颖新商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1770, '2351012100001', '四川省', '成都市', '金堂县', '成都市金堂县十里大道-段60号', '30.855452', '104.427669', '成都市十里大道茅台酱香万家共享主题终端', '金堂县华源酒业经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1771, '22370600010002', '山东省', '烟台市', '福山区', '烟台市福山区海滨路86号海滨假日花园小区12号楼109室', '37.577243', '121.203171', '经济开发区海滨路茅台酱香万家共享主题终端', '烟台新涵宇国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1772, '34410100087014001', '河南省', '驻马店市', '泌阳县', '驻马店市泌阳县1', '32.723974', '113.327144', '驻马店市红升酒业有限公司中心库', '驻马店市红升酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1773, '132321300002', '江苏省', '宿迁市', '宿城区', '宿迁市宿城区洪泽湖路金鹰天地广场A区A03-2、A03-3室', '33.957048', '118.291679', '宿迁市洪泽湖路贵州茅台专卖店', '宿迁市鑫瑞酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1774, '530581001', '云南省', '保山市', '腾冲市', '保山市腾冲市马水河小区(腾曦佳园A18号)', '25.028228', '98.511512', '腾冲市康鑫酒业有限责任公司中心库', '腾冲市康鑫酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1775, '133331081001', '浙江省', '台州市', '温岭市', '台州市温岭市太平街道三星大道25、25-1、23-2、23-3号', '28.372472', '121.376253', '温岭市三星大道贵州茅台专卖店', '台州市程氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1776, '2145050010001', '广西壮族自治区', '北海市', '海城区', '北海市海城区三中路32号', '21.475021', '109.108514', '北海市三中路北海市海城区贵源商行门店', '北海市海城区贵源商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1777, '223701840001', '山东省', '济南市', '历下区', '济南市历下区解放东路黄金·时代广场1F幢二单元103号', '36.66271', '117.112', '济南市解放东路贵州茅台酱香系列酒体验中心', '山东渤翔国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1778, '2533040000301', '浙江省', '嘉兴市', '市辖区', '嘉兴市市辖区长水路1674-1650号', '0.0', '0.0', '嘉兴市台升悦园贵州茅台酱香系列酒体验中心', '嘉兴市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1779, '132320984001', '江苏省', '盐城市', '盐都区', '盐城市盐都区城南新区戴庄路23号晶都悦府29幢101-103室', '33.334908', '120.18704', '盐城市戴庄路贵州茅台专卖店', '盐城市醇雅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1780, '2337018700002', '山东省', '济南市', '长清区', '济南市长清区中川街260号', '36.560352', '116.743734', '济南市中川街茅台酱香万家共享主题终端', '济南玉凯顺通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1781, '105101050001', '四川省', '成都市', '青羊区', '成都市青羊区顺城大街238号', '30.662785', '104.071142', '成都市顺城大街贵州茅台自营店', '四川国酒茅台销售有限公司成都分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1782, '2362030000002', '甘肃省', '金昌市', '金川区', '金昌市金川区泰安路141-31号', '38.529867', '102.170027', '金昌市泰安路茅台酱香万家共享主题终端', '永昌县天宇糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1783, '152520223002', '贵州省', '六盘水市', '盘州市', '六盘水市盘州市平川北路与杜鹃西路交叉口盘州·新汇天悦一期5号楼5单元2层10号-13号', '25.703271', '104.461059', '盘州市平川北路贵州茅台专卖店', '六盘水源美商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1784, '22231020001001', '黑龙江省', '牡丹江市', '绥芬河市', '牡丹江市绥芬河市橡山街７２号', '44.408745', '131.14666', '绥芬河综合保税区橡山街茅台酱香万家共享主题终端', '绥芬河综合保税区欧亚凯盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1785, '252520325001', '贵州省', '遵义市', '道真仡佬族苗族自治县', '遵义市道真仡佬族苗族自治县竹王大道金瑞中心2栋1-3号商铺', '28.851769', '107.600648', '遵义市玉溪镇竹王大道贵州茅台专卖店', '贵州营林生态农业产业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1786, '111110101003', '北京市', '北京市', '东城区', '北京市东城区东城区北河沿大街骑河楼5号楼5-7号', '39.920405', '116.406194', '北京市北河沿大街贵州茅台专卖店', '北京鸿泰达源科贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1787, '111110101005', '北京市', '北京市', '东城区', '北京市东城区东四北大街 168号一层001号贵州茅台自营店', '39.934194', '116.416951', '北京市东四北大街贵州茅台自营店', '北京国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1788, '232320481001', '江苏省', '常州市', '溧阳市', '常州市溧阳市溧城街道燕山路92-5号', '31.416326', '119.481352', '溧城镇燕山路贵州茅台43度经销店', '溧阳刚杰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1789, '100520100010', '贵州省', '贵阳市', '南明区', '贵阳市南明区宝山南路179号“幸福家园”一层商铺11-12号', '26.564084', '106.730802', '贵阳市宝山南路贵州茅台专卖店', '贵州鑫茂酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1790, '250500105007', '重庆市', '重庆市', '渝北区', '重庆市渝北区天宫殿街道财富大道1号附1号', '29.610542', '106.508604', '重庆市财富大道贵州茅台专卖店', '重庆聪易商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1791, '250500105008', '重庆市', '重庆市', '江北区', '重庆市江北区华新街街道金源路62号附67号', '29.558299', '106.528823', '重庆市江北区金源路贵州茅台43度经销店', '重庆百世年酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1792, '510100107', '四川省', '成都市', '双流区', '成都市双流区双流区东升街道涧槽中街162号', '30.562459', '103.908048', '四川鑫昌衡贸易有限公司中心库', '四川鑫昌衡贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1793, '2142038210001', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区北京中路1号88幢（53#）', '32.639575', '110.803919', '十堰市北京中路湖北裕春贸易有限公司门店', '湖北裕春贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1794, '142420695001', '湖北省', '襄阳市', '樊城区', '襄阳市樊城区丹江路5号', '32.051742', '112.15462', '襄阳市丹江路贵州茅台专卖店', '襄阳宏久酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1795, '22441200004001', '广东省', '肇庆市', '端州区', '肇庆市端州区端州一路38号君安峰景湾花苑F幢首层25、26卡', '23.096326', '112.51741', '端州区端州一路茅台酱香万家共享主题终端', '肇庆市荣和酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1796, '250500105003', '重庆市', '重庆市', '江北区', '重庆市江北区建新北路36号1-2', '29.581929', '106.52863', '重庆市建新北路贵州茅台专卖店', '重庆乾虹酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1797, '2343098200001', '湖南省', '益阳市', '赫山区', '益阳市赫山区赫山街道赫山社区龙洲北路汇龙苑122号', '28.574447', '112.364228', '益阳市赫山街道茅台酱香万家共享主题终端', '湖南金博贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1798, '214143300001', '山西省', '晋中市', '榆次区', '晋中市榆次区汇通路凤凰城底商贵州茅台专卖店', '37.701784', '112.719643', '晋中市汇通路贵州茅台专卖店', '晋中黔晋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1799, '252520382001', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市国酒大道酒投大楼', '27.801807', '106.411314', '仁怀市国酒大道贵州茅台专卖店', '贵州省仁怀市糖业烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1800, '2361073100001', '陕西省', '汉中市', '汉台区', '汉中市汉台区沙沿路吾悦公馆A6-107', '33.076001', '106.997976', '汉中市沙沿路茅台酱香万家共享主题终端', '汉中慧轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1801, 'T110106001', '北京市', '北京市', '丰台区', '北京市丰台区玉泉营街道南三环西路28号院中林大厦A座102号', '39.852054', '116.356782', '北京市南三环西路贵州茅台专卖店', '北京中恒实信贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1802, '111110113002', '北京市', '北京市', '顺义区', '北京市顺义区仁和镇裕龙三区7-10', '40.123551', '116.673658', '北京市裕龙一街贵州茅台专卖店', '北京市越达兴旺贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1803, '113131085001', '河北省', '廊坊市', '广阳区', '廊坊市广阳区光明东道51号', '39.512291', '116.726282', '廊坊市光明东道贵州茅台专卖店', '廊坊市鎏世家华糖烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1804, '151511300001', '四川省', '南充市', '顺庆区', '南充市顺庆区滨江中路四段382-384号', '30.770188', '106.084844', '南充市滨江中路四段贵州茅台专卖店', '南充市万福来经贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1805, '113130800001', '河北省', '承德市', '双桥区', '承德市双桥区车站路顺诚大厦101 102', '40.967871', '117.94641', '承德市车站路贵州茅台专卖店', '承德银丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1806, '22440400022001', '广东省', '珠海市', '香洲区', '珠海市香洲区大姑乸街4号商铺', '22.25288', '113.589279', '香洲区大姑乸街茅台酱香万家共享主题终端', '珠海市凌桂行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1807, '100410100002', '河南省', '郑州市', '金水区', '郑州市金水区丰乐路30号院3幢1层09号', '34.7776', '113.6514', '郑州市丰乐路贵州茅台专卖店', '郑州明都酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1808, '34410100087002001', '河南省', '商丘市', '虞城县', '商丘市虞城县1', '34.400868', '115.828519', '商丘翰墨商贸有限公司中心库', '商丘翰墨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1809, '100410100001', '河南省', '郑州市', '金水区', '郑州市金水区金水东路11号院12号楼1-2层附11号-39', '34.760783', '113.74482', '郑州市金水东路贵州茅台专卖店', '河南省副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1810, '22522422005001', '贵州省', '毕节市', '大方县', '毕节市大方县九驿大道久桓二期门面17.18号门面', '27.15', '105.59', '大方县九驿大道茅台酱香万家共享主题终端', '大方尚智商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1811, '100410100005', '河南省', '郑州市', '金水区', '郑州市金水区农科路9号1号楼1-2层102号', '34.792152', '113.675483', '郑州市农科路贵州茅台专卖店', '郑州永顺酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1812, '100410100004', '河南省', '郑州市', '金水区', '郑州市金水区嵩山北路152号索克嵩山大厦1层东2', '34.778809', '113.622849', '郑州市嵩山北路贵州茅台专卖店', '河南鼎信晟茂实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1813, '2141023010001', '河南省', '开封市', '龙亭区', '开封市龙亭区黄河路与汉兴路交叉口向北100米路', '34.792935', '114.321662', '开封市黄河路河南合强商贸有限公司门店', '河南合强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1814, '22370183004001', '山东省', '济南市', '历城区', '济南市历城区高新区华皓汉峪小区一区6号楼1-213', '36.643721', '117.143837', '高新区汉峪金谷茅台酱香万家共享主题终端', '济南汉道信息科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1815, '22522321014001', '贵州省', '黔西南布依族苗族自治州', '兴义市', '黔西南布依族苗族自治州兴义市贵州省黔西南布依族苗族自治州兴义市桔山街道富康生态城美鹤湾13栋1单元1层13号铺面', '25.119811', '104.925752', '兴义市桔山街道茅台酱香万家共享主题终端', '黔西南州玺铭酱酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1816, '100630100003', '青海省', '西宁市', '城中区', '西宁市城中区湟源大街151-85号', '36.59319', '101.750128', '西宁市时代大道贵州茅台专卖店', '西宁万春有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1817, '135350581002', '福建省', '泉州市', '石狮市', '泉州市石狮市湖滨街道富兴源大厦东港路938-940号', '24.733038', '118.646322', '石狮市东港路贵州茅台专卖店', '石狮市润霖酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1818, '2351019400001', '四川省', '成都市', '高新区', '成都市高新区世纪城路198号附1778号109-1-2', '30.553083', '104.076064', '成都市成汉中路茅台酱香万家共享主题终端', '四川省百年财富酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1819, '23153300004001', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区迎宾路13号开远广场南侧底商', '39.812502', '109.967796', '东胜区迎宾路贵州茅台酱香系列酒体验中心', '鄂尔多斯市昌福盈泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1820, '161610700001', '陕西省', '汉中市', '汉台区', '汉中市汉台区劳动东路2号', '33.078621', '107.035086', '汉中市劳动东路贵州茅台专卖店', '汉中桃心岛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1821, '2262232800101', '甘肃省', '武威市', '凉州区', '武威市凉州区西大街382号', '37.92777', '102.621939', '凉州区西大街贵州茅台酱香系列酒体验中心', '武威市益民商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1822, '2651060000101', '四川省', '德阳市', '旌阳区', '德阳市旌阳区天山北路一段303号碧桂园旌湖上境11栋', '31.166195', '104.414101', '旌阳区天山北路茅台酱香万家共享主题终端', '德阳市群运物资有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1823, '2352030000003', '贵州省', '遵义市', '湄潭县', '遵义市湄潭县清华园9栋X单元1层20号', '27.756535', '107.470791', '湄潭县清华园茅台酱香万家共享主题终端', '贵州湄潭俊博商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1824, '2352030000002', '贵州省', '遵义市', '播州区', '遵义市播州区播南街道白龙社区花鸟市场1号、2号门面', '27.519657', '106.823873', '遵义市播南街道茅台酱香万家共享主题终端', '遵义市播州区显发酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1825, '22352202014001', '福建省', '宁德市', '蕉城区', '宁德市蕉城区东侨经济开发区福宁北路1号东城水岸3幢102D', '26.665359', '119.556124', '东侨经济开发区福宁北路茅台酱香万家共享主题终端', '宁德市向东南酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1826, '104602030001', '海南省', '三亚市', '海棠区', '三亚市海棠区海棠湾茅台度假村珍品酒店一层', '18.303019', '109.722696', '三亚市茅台度假村贵州茅台自营店', '海南国酒茅台销售有限公司三亚分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1827, '141410728002', '河南省', '新乡市', '长垣市', '新乡市长垣市杏坛路宏瑞三号院18号商铺', '35.185217', '114.643524', '长垣市杏坛路贵州茅台专卖店', '河南省宏瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1828, '122220622001', '吉林省', '白山市', '靖宇县', '白山市靖宇县靖宇大街969号', '42.388259', '126.813301', '靖宇县靖宇大街贵州茅台专卖店', '吉林省中外名酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1829, '2352030000006', '贵州省', '遵义市', '习水县', '遵义市习水县杉王街道希望社区左岸金街8号楼6-110号', '28.320367', '106.193268', '习水县杉王街道茅台酱香万家共享主题终端', '贵州省仁怀市立鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1830, '141410728003', '河南省', '新乡市', '长垣市', '新乡市长垣市安仁街凤凰城10号商铺', '35.178501', '114.674468', '长垣市安仁街贵州茅台专卖店', '长垣云祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1831, '113130100029', '河北省', '石家庄市', '裕华区', '石家庄市裕华区塔南路维多利亚翠景园南区F13-0105', '38.005883', '114.524851', '石家庄市塔南路贵州茅台专卖店', '河北飞天进出口有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1832, '113130100028', '河北省', '石家庄市', '长安区', '石家庄市长安区平安北大街荣景园16-A-0104贵州茅台专卖店', '38.057044', '114.501582', '石家庄市平安北大街贵州茅台自营店', '河北国酒茅台贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1833, '22510182004001', '四川省', '成都市', '彭州市', '成都市彭州市四川省成都市彭州市回龙东路22号', '30.99608', '103.96491', '回龙东路茅台酱香万家共享主题终端', '四川鹏景商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1834, '23430186004005', '湖南省', '长沙市', '雨花区', '长沙市雨花区长沙市圭塘街道嘉智路16号保利大都汇小区（四期）F7栋101', '28.160242', '113.023613', '雨花区嘉智路贵州茅台酱香系列酒体验中心', '湖南玉鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1835, '115150100017', '内蒙古自治区', '呼和浩特市', '新城区', '呼和浩特市新城区海拉尔东街巨华世纪城聚泽园2栋1013贵州茅台', '40.847869', '111.72997', '呼和浩特市海拉尔东街贵州茅台自营店', '内蒙古国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1836, '115150100018', '内蒙古自治区', '呼和浩特市', '赛罕区', '呼和浩特市赛罕区呼伦贝尔南路万锦合泰商业S3-1021，S3-1022，S3-1023', '40.774659', '111.698414', '呼和浩特市呼伦贝尔南路贵州茅台专卖店', '内蒙古蒙糖商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1837, '231310105002', '上海市', '上海市', '徐汇区', '上海市徐汇区吴中东路503、505、507、509号', '31.189936', '121.423161', '上海市吴中东路贵州茅台专卖店', '上海捷强烟草糖酒集团配销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1838, '420700002', '湖北省', '鄂州市', '市辖区', '鄂州市市辖区滨湖南路与凤凰路洋澜国际康城1号楼1单元21 层3号房', '30.368821', '114.896036', '鄂州酒到佳酒业商贸有限公司中心库', '鄂州酒到佳酒业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1839, '115150100016', '内蒙古自治区', '呼和浩特市', '赛罕区', '呼和浩特市赛罕区丁香路巨海城三区东门2号楼小高层106号', '40.814991', '111.742534', '呼和浩特市丁香南路贵州茅台专卖店', '内蒙古祥合斌途商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1840, '153530300001', '云南省', '曲靖市', '麒麟区', '曲靖市麒麟区云南省曲靖市麒麟区太和街道小坡社区珠江源古镇西河坊南区1幢第1-3层4号商铺', '25.545807', '103.82224', '曲靖市珠江源大道贵州茅台专卖店', '曲靖源茅商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1841, '112120223002', '天津市', '天津市', '静海区', '天津市静海区瑞和道海馨园东门F区03-04', '38.935088', '116.959838', '天津市瑞和道贵州茅台专卖店', '天津市澳顺峰烟酒经销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1842, '137370883001', '山东省', '济宁市', '邹城市', '济宁市邹城市太平西路2188号', '35.403851', '116.979857', '邹城市太平西路贵州茅台专卖店', '邹城市天福商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1843, '144440882001', '广东省', '湛江市', '雷州市', '湛江市雷州市新城街道府前路1号卓越御湖湾一幢商铺19-22 号', '20.931125', '110.063818', '雷州市府前路贵州茅台专卖店', '雷州市友谊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1844, '153532101001', '云南省', '昭通市', '昭阳区', '昭通市昭阳区龙泉街道办事处官坝路凤凰香榭', '27.352044', '103.710375', '昭通市官坝路贵州茅台专卖店', '昭通市靖和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1845, '113130100030', '河北省', '石家庄市', '桥西区', '石家庄市桥西区石家庄市石家庄站高架层东南角06-3点位', '38.018867', '114.485277', '石家庄市石家庄站贵州茅台专卖店', '河北品高商贸有限公司桥西分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1846, '141411481001', '河南省', '商丘市', '永城市', '商丘市永城市东方大道与芒砀路交叉口北300米路东商铺', '33.931506', '116.441269', '永城市芒砀路贵州茅台专卖店', '商丘市康禄商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1847, '2145300110001', '广西壮族自治区', '崇左市', '凭祥市', '崇左市凭祥市北大路55号', '22.105133', '106.75549', '凭祥市北大路凭祥市旭荣国酒总汇商行门店', '凭祥市旭荣国酒总汇商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1848, '22440200007008', '广东省', '韶关市', '浈江区', '韶关市浈江区广东省韶关市浈江区站南路37号 ', '24.788768', '113.600207', '韶关市倪氏顺兴商贸有限公司', '韶关市倪氏顺兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1849, '152522223002', '贵州省', '铜仁市', '玉屏侗族自治县', '铜仁市玉屏侗族自治县康华大道安居园小区', '27.239984', '108.929069', '玉屏县康华大道贵州茅台专卖店', '贵州玉屏发兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1850, '137370500002', '山东省', '东营市', '东营区', '东营市东营区山东省东营市开发区东三路138号银座城市广场三期8幢11-3号', '37.44398', '118.668445', '东营市胶州路贵州茅台专卖店', '东营市通裕商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1851, '211110105023', '北京市', '北京市', '朝阳区', '北京市朝阳区高碑店乡西店村44号楼8号一层', '39.905382', '116.520598', '北京市高碑店法治文化街贵州茅台专卖店', '安徽淘礼网科技有限公司北京分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1852, '100350000001', '福建省', '漳州市', '芗城区', '漳州市芗城区福建省漳州市芗城区草寮街129-10、11、12号', '24.496075', '117.66555', '漳州市草寮街贵州茅台专卖店', '漳州市雅丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1853, '100360100005', '江西省', '南昌市', '东湖区', '南昌市东湖区北京西路69号檀悦语境小区A#楼101-103室', '28.677367', '115.905783', '南昌市北京西路贵州茅台专卖店', '江西省晓村实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1854, '22131081003001', '河北省', '廊坊市', '霸州市', '廊坊市霸州市市府路（第四医院对过）', '39.117194', '116.403491', '霸州市市府路茅台酱香万家共享主题终端', '霸州市品铄商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1855, '23500112030031', '重庆市', '重庆市', '渝北区', '重庆市渝北区信达国际F栋1-1，1-2，1-3', '29.613159', '106.491378', '贵州茅台酱香系列酒体验中心（信达国际店）', '重庆市商源酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1856, '137371333001', '山东省', '临沂市', '河东区', '临沂市河东区沂河新区香港路与沂河东路交汇处西北角临沂宾馆旁边', '35.020793', '118.41726', '临沂市香港路贵州茅台专卖店', '山东九州商业集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1857, '221204000001', '天津市', '天津市', '河西区', '天津市河西区黑牛城道与洞庭路交口东南侧五福里6-171号底商', '39.077922', '117.257371', '河西区黑牛城道贵州茅台酱香系列酒体验中心', '天津酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1858, '211110221001', '北京市', '北京市', '昌平区', '北京市昌平区回龙观东大街318号院1号楼01层103号03室', '40.08054', '116.355777', '北京市回龙观东大街贵州茅台专卖店', '北京佳宇龙翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1859, '212120101001', '天津市', '天津市', '和平区', '天津市和平区小白楼街道河北路205号现215号一层', '39.119868', '117.204088', '天津市河北路贵州茅台43度经销（茅台酒）', '天津中糖二商烟酒连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1860, '250500700001', '重庆市', '重庆市', '渝北区', '重庆市渝北区北大资源财富森林2栋1-1', '29.647932', '106.534938', '重庆市万年西路贵州茅台专卖店', '重庆崇晟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1861, '113130100023', '河北省', '石家庄市', '桥西区', '石家庄市桥西区平安南大街7号商办楼00单元0106、0107号', '38.041173', '114.50202', '石家庄市平安南大街贵州茅台专卖店', '河北德源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1862, '221210185001', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区全运三路99-3号13门', '41.679137', '123.463563', '沈阳市全运三路贵州茅台专卖店', '辽宁紫霖实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1863, '123232303001', '黑龙江省', '绥化市', '肇东市', '绥化市肇东市正阳北十九街东龙时代小区103号商服', '46.054003', '125.960117', '肇东市正阳十九道街北贵州茅台专卖店', '肇东财富天下商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1864, '261610132002', '陕西省', '西安市', '雁塔区', '西安市雁塔区西沣二路531号万科·高新华府五期25幢1单元1层10106号商铺', '34.181837', '108.891628', '西安市西沣二路贵州茅台专卖店', '陕西锦辉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1865, '113130100024', '河北省', '石家庄市', '长安区', '石家庄市长安区育才街6号', '38.051058', '114.5274', '石家庄市育才街贵州茅台专卖店', '河北飞天进出口有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1866, '161612501002', '陕西省', '商洛市', '商州区', '商洛市商州区江滨路与通江西路交汇处', '33.866283', '109.919496', '商洛市江滨路贵州茅台专卖店', '商洛市鑫润源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1867, '161612501001', '陕西省', '西安市', '未央区', '西安市未央区兴泰南路与兴泰五街交汇处', '34.331587', '109.011657', '西安市兴泰南路与兴泰五街交汇处贵州茅台专卖店', '陕西美时代酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1868, '162620200001', '甘肃省', '嘉峪关市', '市辖区', '嘉峪关市市辖区新华中路21号', '39.793513', '98.274311', '嘉峪关市新华中路贵州茅台专卖店', '嘉峪关欣大烟草有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1869, '211110105017', '北京市', '北京市', '朝阳区', '北京市朝阳区百子湾东里415号楼1至2层105', '39.893619', '116.505113', '北京市百子湾东里贵州茅台专卖店', '北京天亚信嘉酒店用品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1870, '211110105016', '北京市', '北京市', '通州区', '北京市通州区北苑一路2号院1号楼1至2层1-3、1-4', '39.904541', '116.64304', '北京市通州区北苑一路贵州茅台专卖店', '北京乾坤福商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1871, '2145260110001', '广西壮族自治区', '百色市', '右江区', '百色市右江区万锦名门2幢1层137号商铺', '23.8843', '106.629921', '百色市万锦名门百色市百兴盛酒业有限责任公司门店', '百色市百兴盛酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1872, '223701160001', '山东省', '济南市', '莱芜区', '济南市莱芜区万福南路008号', '36.211269', '117.688604', '莱芜区万福南路贵州茅台酱香系列酒体验中心', '济南市莱芜国茅财富商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1873, '211110105015', '北京市', '北京市', '石景山区', '北京市石景山区石景山路金融街长安商务中心54号院5号楼6-45商铺', '39.906601', '116.183523', '北京市石景山路贵州茅台专卖店', '北京诚实文祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1874, '211110105014', '北京市', '北京市', '大兴区', '北京市大兴区中科电商谷', '39.781014', '116.420208', '北京市旧宫镇五福堂二号路贵州茅台专卖店', '北京京糖盛世美丽华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1875, '2213112100001', '河北省', '衡水市', '市辖区', '衡水市市辖区和平路南天元怡水花园二期1号门店', '37.746995', '115.651439', '衡水市和平路贵州茅台酱香系列酒体验中心', '河北三辰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1876, '122220700001', '吉林省', '松原市', '前郭尔罗斯蒙古族自治县', '松原市前郭尔罗斯蒙古族自治县哈达大街与源江东路交汇飞达宜居康郡', '45.110965', '124.847162', '松原市哈达大街贵州茅台专卖店', '松原市金色阳光商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1877, '211110105013', '北京市', '北京市', '朝阳区', '北京市朝阳区朝阳区望京西路48号院1号楼1层101内04室', '39.985853', '116.459367', '北京市望京西路贵州茅台专卖店', '北京德龙名泽酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1878, '121211400001', '辽宁省', '葫芦岛市', '龙港区', '葫芦岛市龙港区海晏北路6-11号楼A', '40.681512', '120.811828', '葫芦岛市海晏北路贵州茅台专卖店', '葫芦岛长宏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1879, '211110105012', '北京市', '北京市', '朝阳区', '北京市朝阳区广顺北大街31号院1号楼1层102', '39.996853', '116.466498', '北京市广顺北大街贵州茅台专卖店', '北京华铭恒源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1880, '221307030001', '山东省', '烟台市', '福山区', '烟台市福山区开发区嫩江路15号', '37.563247', '121.27783', '烟台市嫩江路贵州茅台酱香系列酒体验中心', '烟台华新酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1881, '150500109002', '重庆市', '重庆市', '北碚区', '重庆市北碚区重庆市北碚区云华路7号附1号左', '29.807557', '106.396409', '重庆市云华路贵州茅台专卖店', '重庆市德樽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1882, '150500109001', '重庆市', '重庆市', '江北区', '重庆市江北区北滨二路450号1-1', '29.594584', '106.576113', '重庆市北滨二路贵州茅台专卖店', '重庆百年醇正实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1883, '103302120001', '浙江省', '宁波市', '鄞州区', '宁波市鄞州区海晏北路681弄102号，和源路500号2-1,1-1', '29.870469', '121.615321', '宁波市海晏北路贵州茅台自营店', '浙江国酒茅台销售有限公司宁波分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1884, '130322002001', '河北省', '秦皇岛市', '昌黎县', '秦皇岛市昌黎县茅台凤凰庄园', '39.766225', '119.095571', '昌黎茅台葡萄酒经贸有限公司', '昌黎茅台葡萄酒经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1885, '2312010200002', '天津市', '天津市', '河西区', '天津市河西区台儿庄支路80号', '39.099644', '117.23739', '天津市台儿庄路茅台酱香万家共享主题终端', '天津市裕隆达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1886, '2141132810001', '河南省', '南阳市', '唐河县', '南阳市唐河县文峰路中段五小北300米路东 ', '32.679392', '112.844385', '唐河县文峰路茅台酱香万家共享主题终端', '唐河县盛初商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1887, '232320488001', '江苏省', '常州市', '新北区', '常州市新北区通江中路301-1号', '31.822477', '119.974576', '常州市通江中路贵州茅台专卖店', '常州市开源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1888, '233330288001', '浙江省', '宁波市', '鄞州区', '宁波市鄞州区四明中路688号', '29.82809', '121.553982', '宁波市四明中路贵州茅台专卖店', '宁波新江厦股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1889, '134341326001', '安徽省', '宿州市', '埇桥区', '宿州市埇桥区人民路1998号、2000号(华夏世贸广场外围西门南侧3#楼0112室））', '33.628361', '116.96484', '宿州市埇桥区人民路贵州茅台专卖店', '安徽省豪宸商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1890, '237370187001', '山东省', '济南市', '长清区', '济南市长清区莲台山路1095号', '36.558122', '116.760025', '济南市莲台山路贵州茅台43度经销店', '济南玉凯顺通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1891, '22445504005001', '广东省', '深圳市', '宝安区', '深圳市宝安区新安街道文汇社区前进一路313号黄金台综合楼前进一路309-5及201', '22.580017', '113.893761', '宝安区新安街道茅台酱香万家共享主题终端', '广东九界贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1892, '113130100012', '河北省', '石家庄市', '新华区', '石家庄市新华区联盟路580号宁洋商务底商1-2', '38.07932', '114.451576', '石家庄市联盟路贵州茅台专卖店', '河北品味茅香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1893, '2132030010001', '江苏省', '徐州市', '云龙区', '徐州市云龙区云龙区淮海东路56号', '34.26353', '117.190173', '徐州市淮海东路徐州市华夏酒业有限公司门店', '徐州市华夏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1894, '2341018900004', '河南省', '郑州市', '荥阳市', '郑州市荥阳市康泰路意墅蓝山79号楼101号', '34.781602', '113.4347488', '荥阳市康泰路茅台酱香万家共享主题终端', '河南万铭元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1895, '113130100013', '河北省', '石家庄市', '裕华区', '石家庄市裕华区裕华东路231号润丰盛世家园11-112', '38.037781', '114.600962', '石家庄市裕华东路贵州茅台专卖店', '河北尚善睿谷商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1896, '150500224001', '重庆市', '重庆市', '铜梁区', '重庆市铜梁区铜梁区白龙大道189号', '29.819494', '106.061985', '重庆白龙大道贵州茅台专卖店', '重庆市铜梁区榕润酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1897, '211110105009', '北京市', '北京市', '西城区', '北京市西城区展览馆路3号', '39.93021', '116.343509', '北京市展览馆路贵州茅台专卖店', '北京北方京糖洋酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1898, '2132030010003', '江苏省', '徐州市', '市辖区', '徐州市市辖区经济开发区金工路1号市政综合楼-楼北门面', '34.297898', '117.248163', '徐州市金工路徐州市吉雅德贸易有限公司门店', '徐州市吉雅德贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1899, '113130227001', '河北省', '唐山市', '迁西县', '唐山市迁西县西环路129号、131号', '40.150581', '118.293994', '迁西县西环路贵州茅台专卖店', '唐山品旭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1900, '34410189001001001', '山东省', '潍坊市', '诸城市', '潍坊市诸城市开发区红星家园D区北门西侧沿街房', '36.024822', '119.392301', '诸城市舜泰烟酒经营部中心库', '诸城市舜泰烟酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1901, '2363012500001', '青海省', '西宁市', '城中区', '西宁市城中区长江路5-5号', '36.63143', '101.78259', '西宁市长江路茅台酱香万家共享主题终端', '青海翠鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1902, '2152272910001', '贵州省', '黔南布依族苗族自治州', '长顺县', '黔南布依族苗族自治州长顺县城南新区朝顺城市广场三期F区5号楼', '26.003991', '106.441367', '长顺县长征大道长顺县顺和酒业有限责任公司门店', '长顺县顺和酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1903, '22460002003001', '海南省', '海口市', '龙华区', '海口市龙华区椰海大道359-1伟业椰海尚城1#综合楼（幢）1层108号', '19.98', '110.32', '龙华区椰海大道茅台酱香万家共享主题终端', '琼海咀华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1904, '2322010000004', '吉林省', '长春市', '南关区', '长春市南关区南四环临河街金色世界湾34栋109', '43.813587', '125.371187', '长春市南四环茅台酱香万家共享主题终端', '吉林省嘉源创展经贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1905, '22371330003001', '山东省', '临沂市', '费县', '临沂市费县费城街道鲁公社区南门东50米路北', '35.262869', '117.990575', '费县建设路茅台酱香万家共享主题终端', '临沂辰泽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1906, '2322010000002', '吉林省', '长春市', '南关区', '长春市南关区西民主大街547号', '43.88687', '125.304171', '长春市西民主大街茅台酱香万家共享主题终端', '吉林省天喜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1907, '2121092410001', '辽宁省', '阜新市', '海州区', '阜新市海州区文化街7号', '42.012232', '121.654423', '阜新市文化街阜新市海州区周存德糖酒商行门店', '阜新市海州区周存德糖酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1908, '5200000070001', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区花溪区孟关大道一号传化物流园一号库五号门', '26.615679', '106.646581', '贵州茅台生态农业销售有限责任公司', '贵州茅台生态农业销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1909, '222220100001', '吉林省', '长春市', '朝阳区', '长春市朝阳区西民主大街547号', '43.886869', '125.304215', '长春市西民主大街贵州茅台43度经销店', '吉林省天喜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1910, '2341130000002', '河南省', '南阳市', '卧龙区', '南阳市卧龙区高新路和工农路交叉口向西500米路南', '33.027338', '112.544505', '南阳市高新路茅台酱香万家共享主题终端', '南阳市超然物外商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1911, '152520121001', '贵州省', '贵阳市', '开阳县', '贵阳市开阳县贵州省贵阳市开阳县城关镇紫江花园15幢1-4号门面', '27.052728', '106.97789', '贵阳市紫江路贵州茅台专卖店', '开阳新一商贸中心', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1912, '2341130000003', '河南省', '南阳市', '宛城区', '南阳市宛城区长江路中段1116号金六香酒店对面政法委家属院-号楼门面', '32.971955', '112.541742', '南阳市长江路茅台酱香万家共享主题终端', '南阳市超然物外商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1913, '34110105099010001', '广西壮族自治区', '南宁市', '江南区', '南宁市江南区1', '22.781166', '108.273206', '广西和源商贸有限公司中心库', '广西和源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1914, '144441300003', '广东省', '惠州市', '惠城区', '惠州市惠城区江北11号小区金宝江畔花园A15栋1楼', '23.1044', '114.41265', '惠州市文昌一路贵州茅台专卖店', '惠州市金宝酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1915, '24410100001008', '河南省', '郑州市', '市辖区', '郑州市市辖区郑州市金水路30号', '34.764712', '113.658861', '河南省副食品有限公司中心库', '河南省副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1916, '133330522001', '浙江省', '湖州市', '长兴县', '湖州市长兴县龙山街道金陵北路191-197号', '31.017201', '119.903551', '长兴县金陵北路贵州茅台专卖店', '长兴呈龙酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1917, '165650128001', '新疆维吾尔自治区', '乌鲁木齐市', '米东区', '乌鲁木齐市米东区振兴中路1750号万科公园大道1#底商住宅楼1层商业118号', '43.949813', '87.629152', '乌鲁木齐市振兴中路贵州茅台专卖店', '乌鲁木齐玖玖利源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1918, '113130628001', '河北省', '保定市', '高阳县', '保定市高阳县宏润大街2号宏润公司大门北侧门脸', '38.701105', '115.756911', '保定市宏润大街贵州茅台专卖店', '高阳县怡佳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1919, '113130100001', '河北省', '石家庄市', '桥西区', '石家庄市桥西区新石北路88号', '38.018467', '114.451729', '石家庄市新石北路贵州茅台专卖店', '河北云成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1920, '241410582001', '河南省', '安阳市', '文峰区', '安阳市文峰区永明路与富源街交叉口向南100米路东鹏睿国际金融中心一楼5号、6号商铺', '36.094514', '114.395911', '安阳市永明路贵州茅台专卖店', '安阳君盛实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1921, '2312022400001', '天津市', '天津市', '宝坻区', '宝坻区宝坻区天津市宝坻区宝平街道南三路97号', '39.712842', '117.307345', '天津市宝平街道茅台酱香万家共享主题终端', '天津-喆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1922, '22441383003001', '广东省', '惠州市', '惠城区', '惠州市惠城区三环东路隆生西江花园南100米', '39.89', '116.69', '惠城区三环东路茅台酱香万家共享主题终端', '惠州市远卓贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1923, '22130100003001', '河北省', '石家庄市', '桥西区', '石家庄市桥西区石家庄市桥西区新石北路356号翡翠大厦1#/4#0105商铺', '38.017767', '114.451786', '桥西区友谊大街新石北路茅台酱香万家共享主题终端', '河北德源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1924, '141411522001', '河南省', '信阳市', '光山县', '信阳市光山县光山县司马光西路光州2号院一层104-107号', '32.011296', '114.885583', '光山县司马光西路贵州茅台专卖店', '光山县沐欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1925, '142420134001', '湖北省', '武汉市', '洪山区', '武汉市洪山区文化大道555号融创智谷C8-2-1-2(2)', '30.453274', '114.320179', '武汉市文化大道贵州茅台专卖店', '武汉饮臻酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1926, '2132028210001', '江苏省', '无锡市', '宜兴市', '无锡市宜兴市环科园中节能106号', '31.350091', '119.783565', '宜兴市环科园无锡市牧康商贸有限公司门店', '无锡市牧康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1927, '135350521001', '福建省', '泉州市', '惠安县', '泉州市惠安县螺城镇欧景帝苑', '25.024299', '118.790404', '泉州市中山南路贵州茅台专卖店', '晋江市冠雄酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1928, '2152030010004', '贵州省', '遵义市', '汇川区', '遵义市汇川区南京路体育馆西侧1-8号商铺', '27.713928', '106.922782', '遵义市南京路贵州文特吉文化发展有限公司门店', '贵州文特吉文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1929, '22411100008001', '河南省', '漯河市', '源汇区', '漯河市源汇区河南省漯河市源汇区干河陈街道人民西路丁湾村门面房33号', '33.567171', '114.019218', '源汇区人民路茅台酱香万家共享主题终端', '漯河市铭久源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1930, '2144150010001', '广东省', '深圳市', '南山区', '深圳市南山区沙河街道新天鹅湖三期欢乐时光商场L1-67', '22.543488', '113.987236', '深圳市沙河街道深圳市嘉鑫辉煌投资有限公司门店', '深圳市嘉鑫辉煌投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1931, '22411382003001', '河南省', '南阳市', '南召县', '南阳市南召县人民南路与阳光大道交叉口商博城', '33.46165', '112.440846', '南召县人民南路茅台酱香万家共享主题终端', '南阳市宛酒酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1932, '22340100001001', '安徽省', '合肥市', '瑶海区', '合肥市瑶海区长江东路382号商铺3号楼', '31.869247', '117.347256', '长江东路茅台酱香万家共享主题终端', '安徽省友谊贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1933, 'Z320100012', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区石头城路77号1幢301', '32.057596', '118.751747', '南京市石头城路贵州茅台总经销店', '西藏威华达经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1934, '134340906001', '安徽省', '黄山市', '屯溪区', '黄山市屯溪区徽州大道1号B苑', '29.703623', '118.33562', '黄山市徽州大道贵州茅台专卖店', '黄山老徽商旅游商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1935, '2343018300001', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区岳麓街道猴子石大桥西头北侧阳光壹佰新城3-12栋、3-14栋108房', '28.141377', '112.943685', '长沙市岳麓街道茅台酱香万家共享主题终端', '湖南醴岸酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1936, '154540100001', '西藏自治区', '拉萨市', '堆龙德庆区', '拉萨市堆龙德庆区西藏自治区拉萨市柳梧新区绿洲云邸3幢1单元1楼04号', '29.627819', '91.080225', '拉萨市通站路贵州茅台专卖店', '西藏四友商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1937, '154540100002', '西藏自治区', '拉萨市', '堆龙德庆区', '拉萨市堆龙德庆区博达路综合楼一楼门面房东1号', '29.641252', '91.022437', '拉萨市博达路贵州茅台专卖店', '西藏瑞泰实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1938, '2114018610001', '山西省', '太原市', '小店区', '太原市小店区龙堡街20号商3-1002号', '37.810952', '112.605935', '太原市龙堡街山西富得源电子商务有限公司门店', '山西富得源电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1939, '2131011010001', '上海市', '上海市', '杨浦区', '杨浦区上海市杨浦区许昌路1342号', '31.274414', '121.522516', '上海市许昌路上海涌臻贸易有限公司门店', '上海涌臻贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1940, '154540100004', '西藏自治区', '拉萨市', '经济技术开发区', '拉萨市经济技术开发区金珠西路158号世通阳光新城3幢611', '29.64264', '91.015304', '拉萨市金珠西路贵州茅台自营店', '西藏国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1941, '213130682001', '河北省', '保定市', '定州市', '保定市定州市兴定西路悦明园一期底商3号', '38.529278', '114.976141', '定州市兴定西路贵州茅台43度经销店', '定州市酒之林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1942, '144440985001', '广东省', '茂名市', '电白区', '茂名市电白区水东镇海滨大道126号怡景海岸豪庭5幢首层09号商铺', '21.519352', '111.025553', '茂名市海滨大道贵州茅台专卖店', '茂名市华樽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1943, '22530382003001', '云南省', '曲靖市', '麒麟区', '曲靖市麒麟区潇湘街道彩云路258号', '25.475123', '103.817917', '麒麟区潇湘街道彩云路茅台酱香万家共享主题终端', '曲靖旺顺大丁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1944, '2337142400002', '山东省', '德州市', '临邑县', '德州市临邑县迎宾路203号', '37.181263', '116.873398', '临邑县迎宾路茅台酱香万家共享主题终端', '临邑县瑞丰综合商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1945, '22420693003001', '湖北省', '襄阳市', '高新技术开发区', '襄阳市高新技术开发区东风汽车大道18-5号门面', '32.12', '112.19', '高新技术开发区东风汽车大道茅台酱香万家共享主题终端', '襄阳程彦坤金源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1946, '112120104001', '天津市', '天津市', '河北区', '天津市河北区中山北路6#増7#', '39.165703', '117.214923', '天津市中山北路贵州茅台专卖店', '天津市大天津商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1947, 'B14010100401', '山西省', '太原市', '市辖区', '太原市市辖区山西转型综合改革示范区学府产业园南中环街426号山西国际金融中心A座一层AF109-1', '37.798793', '112.562431', '太原市南中环街426号贵州茅台旗舰店', '山西冰小茅商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1948, '112120104003', '天津市', '天津市', '红桥区', '天津市红桥区红桥区三条石大街千吉花园8号楼增2-3', '39.15201', '117.177794', '天津市三条石大街贵州茅台专卖店', '天津开发区黔泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1949, '2341128200001', '河南省', '三门峡市', '灵宝市', '三门峡市灵宝市函谷路与长安路交叉口向南100米路西', '34.525615', '110.890928', '灵宝市函谷路茅台酱香万家共享主题终端', '灵宝市前进酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1950, '2341088400001', '河南省', '焦作市', '解放区', '焦作市解放区映湖路龙湖警苑小区2号楼-层门面房东1-2间', '35.201673', '113.249444', '焦作市映湖路茅台酱香万家共享主题终端', '河南省如之享商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1951, '134341282001', '安徽省', '阜阳市', '界首市', '阜阳市界首市界首市人民东路法姬娜大道A1-03商铺', '33.254468', '115.383273', '界首市人民东路贵州茅台专卖店', '界首市和庆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1952, '143430186002', '湖南省', '长沙市', '雨花区', '长沙市雨花区圭塘街道嘉智路60号保利大都汇小区（二期）南区D12栋', '28.159701', '113.019379', '长沙市嘉智路贵州茅台专卖店', '湖南湘韵酒业有限公司长沙分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1953, '22520122004001', '贵州省', '贵阳市', '息烽县', '贵阳市息烽县永阳街道城南商业一条街地块安置房15号、16号门面', '27.0755', '106.746792', '息烽县永阳街道茅台酱香万家共享主题终端', '贵州黔聚义贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1954, '143430186001', '湖南省', '长沙市', '岳麓区', '长沙市岳麓区观沙岭街道潇湘北路三段1088号渔人商业广场15号栋104、122号', '28.230984', '112.963445', '长沙市潇湘北路贵州茅台专卖店', '湖南强友酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1955, '113130481001', '河北省', '邯郸市', '武安市', '邯郸市武安市新华大街星河城东区商业102、202', '36.69375', '114.17875', '武安市新华大街贵州茅台专卖店', '河北天腾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1956, '2213040000002', '河北省', '邯郸市', '丛台区', '邯郸市丛台区滏东北大街188号连城生活MALLBA区166号商铺', '36.619937', '114.522199', '邯郸市滏东北大街贵州茅台酱香系列酒体验中心', '邯郸市赛超商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1957, '22341285001002', '安徽省', '阜阳市', '太和县', '阜阳市太和县安徽省阜阳市太和县细阳中路交警大楼对面关南4号楼门面', '33.161374', '115.631325', '太和县鼎华烟酒一店', '阜阳鼎华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1958, '22522425001001', '贵州省', '毕节市', '织金县', '毕节市织金县双堰街道桐兴苑小区商业一层1号商铺', '26.68478', '105.78707', '织金县三甲大道茅台酱香万家共享主题终端', '织金县清兴酒业销售有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1959, '22500103016001', '重庆市', '重庆市', '璧山区', '重庆市璧山区重庆市璧山区璧泉街道雪松路128号附36号', '29.578501', '106.198095', '璧山区雪松路茅台酱香万家共享主题终端', '重庆泓运兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1960, '214140100002', '山西省', '太原市', '小店区', '太原市小店区南内环街100号1幢17层1701号', '37.83821', '112.564833', '太原市南内环街贵州茅台43度经销店', '山西国瓷酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1961, '34410100087011001', '河南省', '漯河市', '郾城区', '漯河市郾城区1', '33.587697', '114.006596', '河南酷醉醇供应链管理有限公司中心库', '河南酷醉醇供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1962, '214140100001', '山西省', '太原市', '小店区', '太原市小店区龙城北街170号华天置地1003号商铺', '37.777439', '112.563425', '太原市龙城北街贵州茅台43度经销店', '山西盛世康宝贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1963, '144445401003', '广东省', '潮州市', '饶平县', '潮州市饶平县黄冈镇饶平大道海博现代城商铺40-42号', '23.671453', '116.986771', '饶平县饶平大道贵州茅台专卖店', '饶平县敦元贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1964, '22412702002001', '河南省', '周口市', '项城市', '周口市项城市花园人民路建业城107', '33.470053', '114.870566', '项城市人民路茅台酱香万家共享主题终端', '项城市俊佑商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1965, '144441300002', '广东省', '惠州市', '惠阳区', '惠州市惠阳区淡水上杨村地段金碧蓝湾一期1层12号铺', '22.770261', '114.476604', '惠州市开城大道贵州茅台专卖店', '惠州市惠阳区巨源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1966, '22130600010001', '河北省', '保定市', '莲池区', '保定市莲池区五四路街道办事处复兴中路1535号世纪华庭小区9号底商', '38.896137', '115.500968', '莲池区复兴中路茅台酱香万家共享主题终端', '保定龙行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1967, '34410100087026001', '河南省', '三门峡市', '灵宝市', '三门峡市灵宝市1', '34.517734', '110.894225', '灵宝市改变网络科技有限公司中心库', '灵宝市改变网络科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1968, '141411329001', '河南省', '南阳市', '新野县', '南阳市新野县朝阳路与健康路交叉口南30米', '32.515703', '112.366427', '新野县朝阳路贵州茅台专卖店', '南阳市超然物外商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1969, '253530125001', '云南省', '昆明市', '宜良县', '昆明市宜良县南羊街道办乡鸭湖雏鹰路听涛苑H-4-63号', '24.912831', '103.170036', '昆明市乡鸭湖雏鹰路贵州茅台专卖店', '昆明南云宣酒坊有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1970, '22510187004001', '四川省', '成都市', '新都区', '成都市新都区清源路66号附42号', '30.815577', '104.178224', '新都区清源路茅台酱香万家共享主题终端', '成都富能达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1971, '162622701001', '甘肃省', '平凉市', '崆峒区', '平凉市崆峒区仁爱路3号泾水嘉苑6号楼102号、103号', '35.554053', '106.681352', '平凉市仁爱路贵州茅台专卖店', '平凉欣大商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1972, '145450900001', '广西壮族自治区', '玉林市', '玉州区', '玉林市玉州区良江街49号银泽庄18幢杂物房106、107、108号房', '22.626776', '110.169321', '玉林市江滨路贵州茅台专卖店', '玉林市尊和电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1973, '22460102004001', '海南省', '海口市', '龙华区', '海口市龙华区金贸街道金垦路碧湖湾C栋商业用房105-4房一楼', '20.010328', '110.323822', '龙华区金贸街道金垦路茅台酱香万家共享主题终端', '海南鹏舟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1974, '145450900003', '广西壮族自治区', '玉林市', '玉州区', '玉林市玉州区吉泉路3号富林汇金尚城小区2幢04、05号商铺', '22.6532', '110.177338', '玉林市吉泉路贵州茅台专卖店', '广西百兴盛电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1975, '2237010000001', '山东省', '济南市', '槐荫区', '济南市槐荫区和畅路汇金金融中心', '36.664073', '116.903553', '济南市和畅路贵州茅台酱香系列酒体验中心', '山东德诚宝真酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1976, '23510186003004', '四川省', '成都市', '青羊区', '成都市青羊区青羊区成飞大道南段199号2栋1楼102号', '30.669649', '103.957804', '青羊区成飞大道贵州茅台酱香系列酒体验中心', '四川正天国品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1977, '2337028900001', '山东省', '青岛市', '黄岛区', '青岛市黄岛区双珠路787号', '35.873766', '120.028766', '青岛市双珠路茅台酱香万家共享主题终端', '青岛嘉宏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1978, '100410300002', '河南省', '洛阳市', '洛龙区', '洛阳市洛龙区政和路与金城寨街22号长城花园13幢门面房', '34.62116', '112.445771', '洛阳市政和路贵州茅台专卖店', '洛阳洛百烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1979, '22410323003001', '河南省', '洛阳市', '新安县', '洛阳市新安县东区二路惠康苑A区7号楼门面房2号', '34.730519', '112.146984', '新安县东区二路茅台酱香万家共享主题终端', '洛阳鼎时商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1980, '137371400001', '山东省', '德州市', '德城区', '德州市德城区宋官屯街道办事处东方红路1118号董子文化街A区1号楼1-2层8号1层', '37.439857', '116.371386', '德州市董子文化街贵州茅台专卖店', '德州市信诚名酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1981, '264640126001', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区中心巷102-1-801号（新华东街与中心巷交汇处西南侧）', '38.46204', '106.276891', '银川市中心巷贵州茅台特约经销商', '银川新华百货连锁超市有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1982, '2311010200002', '北京市', '北京市', '朝阳区', '北京市朝阳区通惠河北路69号院2号楼1层4单元1-17', '39.903615', '116.439732', '北京市通惠河北路茅台酱香万家共享主题终端', '北京欧亚凯盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1983, '100520300007', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区碧云路融兴大厦一层11号', '27.685305', '106.920312', '遵义市碧云路贵州茅台专卖店', '遵义久发贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1984, '146460100013', '海南省', '海口市', '龙华区', '海口市龙华区城西镇椰海大道330号昌茂城邦小区一层15号商铺', '19.979222', '110.3402', '海口市椰海大道贵州茅台专卖店（昌茂城邦）', '海南鼎醴贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1985, '232320130002', '江苏省', '南京市', '江宁区', '南京市江宁区竹翠路56号113室-116室', '31.960065', '118.798862', '南京市宏运大道贵州茅台专卖店', '西藏中糖德和经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1986, '440300083002', '陕西省', '西安市', '高陵区', '西安市高陵区陕西省西安市高新区锦业路以北西安绿地中心A座6幢1单元27层2701室', '34.343617', '108.939797', '陕西华昱恒韵酒业有限公司中心库', '陕西华昱恒韵酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1987, '137372328002', '山东省', '滨州市', '博兴县', '滨州市博兴县乐安大街1099号', '37.160881', '118.118321', '博兴县乐安大街贵州茅台专卖店', '山东省博兴县宏泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1988, '232320130003', '江苏省', '南京市', '雨花台区', '南京市雨花台区大周路32号D2北115室', '31.938583643767988', '118.74373868107797', '南京市大周路贵州茅台专卖店', '南京酱留香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1989, '2341152300001', '河南省', '信阳市', '新县', '信阳市新县朝阳路江南公社隔壁', '31.643099', '114.877185', '新县朝阳路茅台酱香万家共享主题终端', '新县诚达实业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1990, '440300083003', '贵州省', '贵阳市', '南明区', '贵阳市南明区贵州省贵阳市贵阳国家高新技术产业开发区毕节路58号联合广场1栋11层4号', '26.617939', '106.649722', '贵州华昱深黔酒业有限公司中心库', '贵州华昱深黔酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1991, '340300001', '安徽省', '蚌埠市', '市辖区', '蚌埠市市辖区经开区延安路692号', '32.935179', '117.371976', '蚌埠市益丰酒业食品有限责任公司中心库', '蚌埠市益丰酒业食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1992, '232320130004', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区草场门大街111号', '32.057174', '118.737256', '南京市草场门大街贵州茅台专卖店', '江苏省苏食酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1993, '2344550000001', '广东省', '中山市', '中山市', '中山市中山市中山路顺景花园81-85幢17卡', '22.511734', '113.397619', '中山市中山路茅台酱香万家共享主题终端', '中山市协诚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1994, '22520182025001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区云潭北路中铁阅山湖C组团一期商业CS1-1-34号 ', '26.63078', '106.594533', '观山湖区云潭北路茅台酱香万家共享主题终端', '贵州国樽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1995, '440300083001', '山东省', '济南市', '槐荫区', '济南市槐荫区山东省济南市槐荫区泰安路887号恒大雅苑8-1地块商务办公B座2008室', '36.682358', '116.898806', '山东华昱德泰酒业有限公司中心库', '山东华昱德泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1996, '123230900001', '黑龙江省', '七台河市', '桃山区', '七台河市桃山区桃北街200号七彩城北门', '45.773554', '131.00789', '七台河市桃北街贵州茅台专卖店', '七台河市全达商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1997, '145450200007', '广西壮族自治区', '柳州市', '城中区', '柳州市城中区环江滨水大道26号十里江湾59栋1-26', '24.376042', '109.424565', '柳州市环江滨水大道贵州茅台专卖店', '柳州市湍皓贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1998, '440300083006', '湖南省', '长沙市', '雨花区', '长沙市雨花区长沙市雨花区韶山中路489号万博汇名邸三期3010', '28.157049', '112.996132', '湖南华昱潇湘酒业有限公司中心库', '湖南华昱潇湘酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (1999, '145450200008', '广西壮族自治区', '柳州市', '鱼峰区', '柳州市鱼峰区柳州市静兰路38号中海天钻15栋商铺106.107.108', '24.317127', '109.452196', '柳州市静兰路贵州茅台专卖店', '柳州市精蔓商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2000, '440300083007', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区高碑店乡高碑店三村三区19号楼7号二层201室', '40.002932', '116.478152', '北京华昱盛京酒业有限公司中心库', '北京华昱盛京酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2001, '146460100011', '海南省', '海口市', '龙华区', '海口市龙华区龙昆南路30号海南正大豪庭商住小区6#一层105-106房', '20.01667', '110.334283', '海口市龙昆南路贵州茅台自营店', '海南国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2002, '440300083004', '广东省', '深圳市', '龙岗区', '深圳市龙岗区深圳市龙岗区坂田街道杨美社区伯公坳路1号华昱机构5号楼4层408', '22.627397', '114.07951', '广东华昱粤海酒业有限公司中心库', '广东华昱粤海酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2003, '145450200006', '广西壮族自治区', '柳州市', '城中区', '柳州市城中区海关路1号温馨嘉园1-6，1-7号门面', '24.335285', '109.427124', '柳州市海关路贵州茅台专卖店', '广西鸿旗酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2004, '232320130001', '江苏省', '南京市', '雨花台区', '南京市雨花台区软件大道119号 5栋 103', '31.976126', '118.762089', '南京市软件大道贵州茅台专卖店', '江苏苏糖糖酒食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2005, '440300083005', '河南省', '郑州市', '市辖区', '郑州市市辖区河南自贸试验区郑州片区（郑东）商鼎路78号3座2单元18层1820号', '34.754511', '113.726827', '河南华昱鼎立酒业有限公司中心库', '河南华昱鼎立酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2006, '330100025001', '浙江省', '杭州市', '萧山区', '杭州市萧山区萧山经济技术开发区金鸡路1221号', '30.201745', '120.253309', '杭州市金鸡路贵州茅台文化体验馆', '浙江德道食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2007, '2337078300001', '山东省', '潍坊市', '寿光市', '潍坊市寿光市圣城街与北海路交叉口南50米路西鑫源组团沿街', '36.867866', '118.768083', '寿光市圣城街茅台酱香万家共享主题终端', '寿光银丽工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2008, '34321326002085001', '四川省', '成都市', '锦江区', '成都市锦江区四川省成都市锦江区梓潼桥西街2号1栋2单元22层2210号', '30.66021', '104.081047', '四川蓉国壹城实业有限公司中心库', '四川蓉国壹城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2009, '137370682003', '山东省', '烟台市', '莱阳市', '烟台市莱阳市五龙北路117号0004-108', '36.980292', '120.70728', '莱阳市五龙北路贵州茅台专卖店', '莱阳峻祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2010, '153530325001', '云南省', '曲靖市', '富源县', '曲靖市富源县中安街道金龙街249号', '25.679418', '104.253364', '富源县金龙街贵州茅台专卖店', '富源县智航商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2011, '225630000001', '贵州省', '遵义市', '汇川区', '遵义市汇川区汇川大道林达大院4号13.14.15号门面', '27.768944', '106.932554', '遵义市汇川大道贵州茅台酱香系列酒体验中心', '遵义市金瑞源酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2012, '24340225001010', '安徽省', '芜湖市', '无为县', '芜湖市无为县安徽省芜湖市无为市无为经济开发区福东路18号（芜湖市盈海食品有限公司院内）', '31.321149', '117.978839', '无为县三源糖酒销售有限公司中心库', '无为县三源糖酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2013, '136360782001', '江西省', '赣州市', '章贡区', '赣州市章贡区章江路21号九铭广场1号公寓7#8#9#商业', '25.81293', '114.915425', '赣州市章江路贵州茅台专卖店', '赣州瑞联酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2014, '244440302011', '广东省', '深圳市', '南山区', '深圳市南山区沙河街道香山中街新天鹅湖欢乐时光L1-67', '22.543488', '113.987236', '深圳市香山中街贵州茅台专卖店', '深圳市嘉鑫辉煌投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2015, '440300083008', '天津市', '天津市', '武清区', '天津市武清区天津市武清开发区滨湖路30号云天广场1号楼201室', '39.412867', '117.050198', '天津华夏酒业有限公司中心库', '天津华夏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2016, '235350586003', '福建省', '泉州市', '丰泽区', '泉州市丰泽区丰泽街道丰泽街群星广场49号', '24.899987', '118.616814', '泉州市丰泽街贵州茅台43度经销店', '泉州怡闽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2017, '244440302010', '广东省', '深圳市', '龙华区', '深圳市龙华区龙华街道东环一路249号壹城中心第六区3A-103', '22.648242', '114.033462', '深圳市东环一路贵州茅台专卖店', '深圳市国盛源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2018, '22410188002001', '河南省', '郑州市', '中原区', '郑州市中原区郑州市中原区秦岭路与建设路交叉口向北150米路东茅台酱香万家共享', '34.756703', '113.603303', '中原区秦岭路茅台酱香万家共享主题终端', '河南国酿实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2019, '146460100006', '海南省', '海口市', '龙华区', '海口市龙华区椰海大道368号（海垦南路商铺E14-4-5）', '19.978989', '110.303637', '海口市椰海大道贵州茅台专卖店', '海南礼铭贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2020, '2337020000003', '山东省', '青岛市', '平度市', '青岛市平度市常州路103-2号', '36.786976', '119.956117', '平度市常州路茅台酱香万家共享主题终端', '平度市城关百信副食品超市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2021, '141410187001', '河南省', '郑州市', '二七区', '郑州市二七区汉江路14号1楼（豫鼎大厦）', '34.71545', '113.644739', '郑州市汉江路贵州茅台专卖店', '郑州市恒盛酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2022, '146460100007', '海南省', '海口市', '龙华区', '海口市龙华区海垦路绿海佳苑贵州茅台专卖店', '20.011097', '110.307588', '海口市海垦路贵州茅台专卖店', '海口惠之洲贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2023, '235350586005', '福建省', '泉州市', '丰泽区', '泉州市丰泽区福建省泉州市丰泽区丰泽街道源淮社区丰泽街41、43号店', '24.900042', '118.61685', '泉州市丰泽街贵州茅台专卖店', '酌悦（福建）酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2024, '2337020000004', '山东省', '青岛市', '平度市', '青岛市平度市红旗路4-24号', '36.787856', '119.981436', '平度市红旗路茅台酱香万家共享主题终端', '平度市城关百信副食品超市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2025, '22510100097001', '四川省', '成都市', '青羊区', '成都市青羊区四川省成都市青羊区玉宇路1190、1192、1194号一层', '30.671778', '103.995085', '玉宇路茅台酱香万家共享主题终端', '成都市龙威达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2026, '7091555', '广东省', '深圳市', '南山区', '深圳市南山区深圳市南山区天健A塔', '116.474375', '116.474375', '友宝', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2027, '2337020000005', '山东省', '青岛市', '市辖区', '青岛市市辖区富春江路1102号1102室', '35.95212', '120.16246', '青岛市富春江路茅台酱香万家共享主题终端', '青岛福红宇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2028, '2313112600001', '河北省', '衡水市', '桃城区', '衡水市桃城区大庆路与中华大街交叉口西行100米路北', '37.752377', '115.678232', '衡水市大庆路茅台酱香万家共享主题终端', '衡水裕泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2029, '22412801005001', '河南省', '驻马店市', '驿城区', '驻马店市驿城区开发区置地大道与文明路交叉口北100米路西', '33.002', '114.015', '开发区文明路茅台酱香万家共享主题终端', '驻马店市五彩喜盈门商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2030, '22440305004001', '广东省', '深圳市', '坪山区', '深圳市坪山区坪山街道六和社区和政路4-64', '22.708338', '114.344313', '坪山区坪山街道茅台酱香万家共享主题终端', '深圳市鹏茅实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2031, '141410323001', '河南省', '洛阳市', '新安县', '洛阳市新安县涧河大道1048号', '34.732777', '112.128171', '新安县涧河大道贵州茅台专卖店', '洛阳牧灏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2032, '34623200003001', '湖南省', '长沙市', '雨花区', '长沙市雨花区劳动东路139号新城新世界小区C5栋2602房', '28.157467', '113.023326', '湖南盛丰翔贸易有限公司中心库', '湖南盛丰翔贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2033, '22352202005001', '福建省', '漳州市', '芗城区', '漳州市芗城区福建省漳州市芗城区建元南花园9幢D05号', '24.497788', '117.666281', '漳州市芗城区茅台酱香万家共享主题终端', '漳州法尔顿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2034, '441500007', '广东省', '汕尾市', '陆丰市', '汕尾市陆丰市东海镇东海大道长安商业城6号楼(贵州习酒体验馆)', '22.917512', '115.649227', '陆丰市弘恩商贸有限公司中心库', '陆丰市弘恩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2035, '100412801001', '河南省', '驻马店市', '驿城区', '驻马店市驿城区金山街道乐山大道与慎阳路交叉口东南角', '33.01913', '114.023063', '驻马店市乐山大道贵州茅台专卖店', '驻马店市飞天商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2036, '122220300002', '吉林省', '四平市', '铁东区', '四平市铁东区紫气大路2555号', '43.150217', '124.405989', '四平市紫气大路贵州茅台专卖店', '四平市金久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2037, '244440302002', '广东省', '深圳市', '福田区', '深圳市福田区深南大道1003号东方新天地广场一楼L-0607', '22.538662', '114.068247', '深圳市彩田路贵州茅台专卖店', '深圳市华源鑫贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2038, '22440423003001', '广东省', '珠海市', '香洲区', '珠海市香洲区春晖路1号1-22号商铺之2', '22.277146', '113.526382', '香洲区春晖路茅台酱香万家共享主题终端', '珠海市斗门永生隆贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2039, '2337028200003', '山东省', '青岛市', '即墨区', '青岛市即墨区潮海蓝鳌路919号', '36.393022', '120.467756', '青岛市潮海蓝鳌路茅台酱香万家共享主题终端', '即墨市潮海街道办事处圣达糖酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2040, '145450200001', '广西壮族自治区', '柳州市', '城中区', '柳州市城中区高新五路21号荣和天誉3栋1-3、1-4、1-5', '24.353748', '109.429107', '柳州市高新五路贵州茅台专卖店', '柳州市谦益酒业商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2041, '145450200002', '广西壮族自治区', '柳州市', '城中区', '柳州市城中区文华路9号温馨七七二5栋1-1', '24.332563', '109.437076', '柳州市文华路贵州茅台专卖店', '柳州市双实商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2042, '2337028200001', '山东省', '青岛市', '即墨区', '青岛市即墨区嵩山-路7丁附近', '36.39054', '120.44305', '青岛市嵩山一路茅台酱香万家共享主题终端', '青岛龙华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2043, '145452601002', '广西壮族自治区', '百色市', '右江区', '百色市右江区龙景西路万锦名门2幢1层136、137商铺', '23.884473', '106.629918', '百色市龙景西路贵州茅台专卖店', '百色市百兴盛酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2044, '244440302006', '广东省', '深圳市', '福田区', '深圳市福田区梅林街道梅亭社区越华路18号斯达大厦梅林路19-1号层东5-6', '22.56814', '114.065835', '深圳市梅林路贵州茅台专卖店', '深圳市玉酉圣贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2045, '133330783002', '浙江省', '金华市', '东阳市', '金华市东阳市江北街道甘溪西街江北之芯2幢2-1号', '29.291009', '120.24248', '东阳市甘溪西街贵州茅台专卖店', '东阳市世弘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2046, '244440302005', '广东省', '深圳市', '福田区', '深圳市福田区梅林街道梅亭路润华松鹤颐养中心首层1、2号铺', '22.567173', '114.043115', '深圳市梅亭路贵州茅台专卖店', '深圳市裕兴隆实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2047, '2344042200001', '广东省', '珠海市', '香洲区', '珠海市香洲区前山岱山路74号乐士文化区B栋1楼B6104', '22.242276', '113.517318', '珠海市前山岱山路茅台酱香万家共享主题终端', '珠海天樽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2048, '131310105001', '上海市', '上海市', '长宁区', '上海市长宁区茅台路588号', '31.210466', '121.389642', '上海市茅台路贵州茅台专卖店', '上海美天酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2049, '162623200001', '甘肃省', '酒泉市', '肃州区', '酒泉市肃州区解放北路229号1-8号门店', '39.713331', '98.508292', '酒泉市解放北路贵州茅台专卖店', '酒泉恒生实业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2050, '2550010701501', '重庆市', '重庆市', '渝北区', '重庆市渝北区龙山路47号', '29.590312', '106.504036', '渝北区龙山路茅台酱香万家共享主题终端', '重庆千博鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2051, '23410600004006', '河南省', '鹤壁市', '淇滨区', '鹤壁市淇滨区河南省鹤壁市淇滨区永定河路金桂园小区南门106-107门面房', '35.696236', '114.280773', '淇滨区永定河路贵州茅台酱香系列酒体验中心', '鹤壁市沐欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2052, '154542301001', '西藏自治区', '日喀则市', '桑珠孜区', '日喀则市桑珠孜区珠峰文化旅游创意产业园区顺源商贸城2栋9号商铺', '29.270387', '88.887279', '日喀则吉林南路贵州茅台专卖店', '西藏日喀则市志城酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2053, '100330100002', '浙江省', '杭州市', '上城区', '杭州市上城区庆春路11号凯旋门商业中心底层东侧', '30.257621', '120.185465', '杭州市庆春路贵州茅台专卖店', '杭州华商糖业烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2054, '241410786001', '河南省', '郑州市', '金水区', '郑州市金水区夏令街6号19号楼1层102号、103号', '34.792539', '113.764558', '郑州市夏令街贵州茅台专卖店', '河南盛世天翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2055, '100330100004', '浙江省', '杭州市', '上城区', '杭州市上城区钱江路570.572.574号', '30.23637', '120.198349', '杭州市钱江路贵州茅台专卖店', '杭州新飞天酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2056, '161610300003', '陕西省', '宝鸡市', '渭滨区', '宝鸡市渭滨区火炬路东段30号一楼门面房', '34.352611', '107.14592', '宝鸡市宝鸡市火炬路中段30号商铺贵州茅台专卖店', '宝鸡精品圣鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2057, '251510526001', '四川省', '成都市', '简阳市', '成都市简阳市射洪坝雄州大道南段240-244号1层', '30.404729', '104.546354', '简阳市雄州大道贵州茅台专卖店', '四川华商佳酿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2058, '161610300002', '陕西省', '宝鸡市', '金台区', '宝鸡市金台区金台大道69号院（悦珑湾26幢1层）', '34.359199', '107.194529', '宝鸡市金台大道贵州茅台专卖店', '宝鸡茅缘汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2059, '4109000110050000', '河南省', '濮阳市', '华龙区', '濮阳市华龙区河南省濮阳市中原路与濮上路交叉口向南500米路西安庄商务楼一层98号', '35.776998', '115.010626', '濮阳市濮上路贵州茅台专卖店', '', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2060, '133330100001', '浙江省', '杭州市', '上城区', '杭州市上城区凯旋街道新塘路322号、322-1号', '30.273697', '120.208081', '杭州市新塘路贵州茅台专卖店', '杭州香瑶食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2061, '244440186001', '广东省', '广州市', '白云区', '广州市白云区怡新路213号、215号、217号', '23.175908', '113.326831', '广州市怡新路贵州茅台专卖店', '广东鸿腾贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2062, '22520100292001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区金阳街道石林路300号中铁逸都国际E组团第一层33号', '26.604628', '106.613437', '观山湖区金阳街道茅台酱香万家共享主题终端', '贵州茂毅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2063, '135352202002', '福建省', '宁德市', '福安市', '宁德市福安市阳春路1号鼎富澜悦湾116-117号店', '27.087344', '119.63932', '福安市阳春路贵州茅台专卖店', '福建省燕嘉食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2064, '121210100012', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区天赐街5-3号（105）', '41.748435', '123.464385', '沈阳市天赐街贵州茅台自营店', '辽宁国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2065, '121210100011', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区文化东路18号9门', '41.76947', '123.464702', '沈阳市文化东路贵州茅台专卖店', '辽宁鑫源英民名酒连锁经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2066, '22511382007001', '四川省', '南充市', '顺庆区', '南充市顺庆区凤鸣路117号附5号', '30.813372', '106.084186', '顺庆区凤鸣路茅台酱香万家共享自有主题终端', '南充康顺鸿壶酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2067, '141410487001', '河南省', '平顶山市', '新华区', '平顶山市新华区长安大道与育英路交叉口西100米大唐一品澜山3号楼一层102', '33.770582', '113.170524', '平顶山市长安大道贵州茅台专卖店', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2068, '100440800005', '广东省', '湛江市', '霞山区', '湛江市霞山区人民大道南112号蓝海峰境广场2号楼负1层03号商铺', '21.207502', '110.402785', '湛江市人民大道南贵州茅台专卖店', '湛江民大幸福贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2069, '2235082100201', '福建省', '龙岩市', '新罗区', '龙岩市新罗区西陂街道排头村龙腾中路286-11号', '25.088387', '117.013735', '新罗区龙腾中路贵州茅台酱香系列酒体验中心', '福建省长汀贵丰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2070, '360127001002', '江西省', '南昌市', '西湖区', '南昌市西湖区永富路255号世纪朝阳小区1楼105、106、107室 ', '28.628192', '115.85674', '南昌市抚生南路贵州茅台专卖店', '南昌清鑫商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2071, '141411526001', '河南省', '信阳市', '潢川县', '信阳市潢川县跃进东路光州国际大酒店东侧', '32.130935', '115.051305', '潢川县跃进东路贵州茅台专卖店', '河南瑞达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2072, '143430700001', '湖南省', '常德市', '武陵区', '常德市武陵区穿紫河街道武陵大道318号', '29.040358', '111.692519', '常德市武陵大道贵州茅台专卖店', '常德市金祥龙贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2073, '121210100010', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区热闹路10号', '41.787178', '123.437958', '沈阳市热闹路贵州茅台专卖店', '沈阳明逸商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2074, '244445221001', '广东省', '广州市', '白云区', '广州市白云区启德路龙禧中心', '23.228254', '113.2876', '广州市启德路贵州茅台专卖店', '广东粤强酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2075, '232320685001', '江苏省', '南通市', '通州区', '南通市通州区金沙街道为民路176号', '32.085554', '121.07139', '南通市为民路贵州茅台43度经销店', '南通正唐商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2076, '2237052200001', '山东省', '东营市', '东营区', '东营市东营区运河路336号光谷未来城西门55号楼（独栋）', '37.427552', '118.715135', '东营市光谷未来城贵州茅台酱香系列酒体验中心', '利津县中信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2077, '111110108008', '北京市', '北京市', '海淀区', '北京市海淀区永丰路68号院23号楼1层101号02室', '40.071423', '116.24391', '北京市永丰路贵州茅台专卖店', '北京崇学山庄宾馆有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2078, '121210100004', '辽宁省', '沈阳市', '和平区', '沈阳市和平区南京南街147甲5号', '41.763896', '123.393596', '沈阳市南京南街贵州茅台专卖店', '辽宁鑫源英民名酒连锁经营有限公司南京南街分店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2079, '121210100007', '辽宁省', '沈阳市', '皇姑区', '沈阳市皇姑区昆山西路25-5号5门', '41.823595', '123.39433', '沈阳市昆山西路贵州茅台专卖店', '辽宁鑫源英民名酒连锁经营有限公司昆山西路分店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2080, '146460002002', '海南省', '琼海市', '琼海市', '琼海市琼海市银海路贵州茅台专卖店', '19.258028', '110.459732', '琼海市银海路贵州茅台专卖店', '海南瑞祥隆贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2081, '121210100006', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区团结路59-9号4门', '41.813173', '123.443735', '沈阳市团结路贵州茅台专卖店', '辽宁鑫源英民名酒连锁经营有限公司团结路分店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2082, '121210100001', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区全运路97号', '41.681909', '123.474717', '沈阳市全运路贵州茅台专卖店', '沈阳益丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2083, '121210100003', '辽宁省', '沈阳市', '苏家屯区', '沈阳市苏家屯区南京南街1019-47号20门，21门', '41.668906', '123.382447', '沈阳市南京南街贵州茅台专卖店（华润置地）', '沈阳梦诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2084, '22330824001001', '浙江省', '衢州市', '开化县', '衢州市开化县华埠镇华康路111号', '29.01', '118.36', '华埠镇华康路茅台酱香万家共享主题终端', '开化德茂供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2085, '111110108001', '北京市', '北京市', '石景山区', '北京市石景山区玉泉路63号1层103', '39.901916', '116.252543', '北京市玉泉路贵州茅台专卖店', '北京中烹苑接待用酒供应有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2086, '151514000001', '四川省', '眉山市', '东坡区', '眉山市东坡区铁环东路25号中鑫.半岛龙湾2号1层5-6号', '30.074538', '103.823753', '眉山市铁环东路贵州茅台专卖店', '眉山市家耀商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2087, '34620100012001', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '乌鲁木齐市沙依巴克区宝山路386号和枫雅居小区19栋3层商铺13', '43.799567', '87.589499', '乌鲁木齐潘有致远国际贸易有限责任公司中心库', '乌鲁木齐潘有致远国际贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2088, '162622327001', '甘肃省', '武威市', '凉州区', '武威市凉州区富民南路5号', '37.918804', '102.647363', '武威市富民南路贵州茅台专卖店', '武威市鸿都酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2089, '2352240100002', '贵州省', '遵义市', '习水县', '遵义市习水县东皇街道双垭子社区习酒大道与华润大道交叉口京腾滋洲里A9栋1-04至06号', '28.309833', '106.208878', '习水县华润大道茅台酱香万家共享主题终端', '贵州省仁怀市恒源泉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2090, '121210100009', '辽宁省', '沈阳市', '铁西区', '沈阳市铁西区云峰北街25号23门', '41.796225', '123.380702', '沈阳市云峰北街贵州茅台专卖店', '辽宁鑫源英民名酒连锁经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2091, '121210100008', '辽宁省', '沈阳市', '铁西区', '沈阳市铁西区沈辽西路27号盛京大天地', '41.777946', '123.331507', '沈阳市沈辽西路贵州茅台专卖店', '沈阳盛京优选超市连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2092, '141412828002', '河南省', '驻马店市', '新蔡县', '驻马店市新蔡县人民西路航宇天悦城2号楼062号', '32.756353', '114.940769', '新蔡县人民西路贵州茅台专卖店', '新蔡正通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2093, '144440310001', '广东省', '深圳市', '龙华区', '深圳市龙华区龙华街道清华社区梅龙大道国鸿广场1楼商铺', '22.669132', '114.04369', '深圳市龙华大道贵州茅台专卖店', '深圳市鼎和诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2094, '2154320010001', '四川省', '南充市', '顺庆区', '南充市顺庆区潆华中路华新路1号', '30.833827', '106.083373', '南充市潆华中路南充市天辰贸易有限公司门店', '南充市天辰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2095, '137372901001', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区中华路1366号（电视台东临50米）', '35.233933', '115.472194', '菏泽市中华路贵州茅台专卖店', '菏泽市兴亚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2096, '22130289001001', '河北省', '唐山市', '丰润区', '唐山市丰润区曹雪芹西大街交通运输局大门口东侧', '39.83', '118.11', '丰润区曹雪芹西大街茅台酱香万家共享主题终端', '唐山市丰润区川鼎商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2097, '2241280100001', '河南省', '驻马店市', '驿城区', '驻马店市驿城区乐山大道与富裕街交叉口西100米路北', '33.023039', '114.01997', '驻马店市富裕街贵州茅台酱香系列酒体验中心', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2098, '2154320010002', '四川省', '达州市', '通川区', '达州市通川区凤西街道新锦社区紫荆花路79号', '31.21469', '107.50456', '达州市紫荆花路达州市遵达商贸有限公司门店', '达州市遵达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2099, '224114000001', '河南省', '商丘市', '市辖区', '商丘市市辖区示范区南京路与学院路交叉口南100米路东', '34.405736', '115.664922', '商丘市学院路贵州茅台酱香系列酒体验中心', '河南省富航电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2100, '141411200002', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区五原西路天盛天鹅堡楼下105门面房', '34.785348', '111.16519', '三门峡市五原西路贵州茅台专卖店', '三门峡市新华丰食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2101, '141411200001', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区召公西路与众德街交叉口秀庭紫悦府102-103门面房', '34.769871', '111.155403', '三门峡市召公西路贵州茅台专卖店', '三门峡市新华丰食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2102, '152520182001', '贵州省', '贵阳市', '南明区', '贵阳市南明区新华路街道国恩大厦3幢1单元1层6号、7号门面', '26.565383', '106.719098', '贵阳市新华路贵州茅台专卖店', '贵阳鑫宝商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2103, '113131081001', '河北省', '廊坊市', '霸州市', '廊坊市霸州市迎宾东道温莎小镇S1#座01单元1单元107、108号', '39.124992', '116.42123', '霸州市迎宾东道贵州茅台专卖店', '霸州市贵久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2104, '221403230001', '山西省', '阳泉市', '城区', '阳泉市城区新建路佳园小区底商5号', '37.858759', '113.592125', '阳泉市城区新建路贵州茅台酱香系列酒体验中心', '利华臻品供应链（山西）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2105, '512000001', '四川省', '资阳市', '雁江区', '资阳市雁江区雁江区城北市场2幢5号1层门市', '30.123087', '104.662195', '资阳市美玖香商贸有限公司中心库', '资阳市美玖香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2106, '22320300015001', '江苏省', '徐州市', '泉山区', '徐州市泉山区荣景盛苑A1号楼1-105', '34.258316', '117.159581', '泉山区荣景盛苑茅台酱香万家共享主题终端', '徐州金银河商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2107, '2334252100001', '安徽省', '宣城市', '广德市', '宣城市广德市桃州镇团结东路祥生君临府-层213,214号商铺', '30.889539', '119.426001', '广德市桃州镇茅台酱香万家共享主题终端', '宣城市祥和商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2108, '2344180000001', '广东省', '清远市', '清城区', '清远市清城区城市花园人民路2号楼5-6号', '23.679395', '113.050413', '清远市城市花园茅台酱香万家共享主题终端', '清远皓恩贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2109, '113131000001', '河北省', '廊坊市', '广阳区', '廊坊市广阳区河北省廊坊市广阳区区永兴路西新世纪步行街第八大街南外街阳光高第商铺S1-6号，S1-8号，S1-9号', '39.53113', '116.679536', '廊坊市永兴路西贵州茅台专卖店', '廊坊中糖华洋实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2110, '2334252100002', '安徽省', '宣城市', '宣州区', '宣城市宣州区鳌峰东路22号', '30.941974', '118.768865', '宣城市鳌峰东路茅台酱香万家共享主题终端', '宣城市祥和商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2111, '23330400003001', '浙江省', '嘉兴市', '南湖区', '嘉兴市南湖区经济技术开发区长水路1674-1650号', '30.722196', '120.754523', '南湖区长水路贵州茅台酱香系列酒体验中心', '嘉兴市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2112, '224116710001', '河南省', '周口市', '经开区', '周口市经开区太昊路与工农路交叉口东北角', '38.041215', '114.502087', '周口市周口市太昊路贵州茅台酱香系列酒体验中心', '河南景隆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2113, '164640383001', '宁夏回族自治区', '吴忠市', '利通区', '吴忠市利通区民族路南侧文华街西侧金龙广场一号楼1单元1层12#、13#', '37.986834', '106.161425', '吴忠市民族路贵州茅台专卖店', '吴忠市捷凌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2114, '162620500002', '甘肃省', '天水市', '秦州区', '天水市秦州区成纪大道西路天水中心', '34.575657', '105.695414', '天水市成纪大道西路贵州茅台专卖店', '天水润圆兴达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2115, '22120400011001', '天津市', '天津市', '津南区', '天津市津南区双桥河镇工业园区欣欣南路15号底商', '38.99', '117.45', '津南区双桥镇欣欣南路茅台酱香万家共享主题终端', '天津信百兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2116, '111110108012', '北京市', '北京市', '海淀区', '北京市海淀区清上园1.2.3号楼01层04-2', '40.039352', '116.331606', '北京市清上园贵州茅台专卖店', '北京勃海通宝商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2117, '137370785002', '山东省', '潍坊市', '高密市', '潍坊市高密市密水街道利群路南1399号菲达广场/12号楼7号营业房', '36.368144', '119.765276', '高密市利群路贵州茅台专卖店', '高密市华蒲酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2118, '153532502001', '云南省', '昆明市', '嵩明县', '昆明市嵩明县嵩阳镇黄龙街1071号（碧桂园紫薇星城1幢1层09号商铺）', '25.341169', '103.049361', '嵩明县黄龙街贵州茅台专卖店', '昆明恒裕商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2119, '111110108010', '北京市', '北京市', '海淀区', '北京市海淀区玲珑天地D座1层106-1', '39.930736', '116.276231', '北京市玲珑路贵州茅台专卖店', '北京古韵商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2120, '510105002', '四川省', '成都市', '青羊区', '成都市青羊区守经街6号3幢1楼附8-12号', '30.672478', '104.06253', '四川壹捌捌酒贸易有限责任公司中心库', '四川壹捌捌酒贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2121, '143430626001', '湖南省', '岳阳市', '平江县', '岳阳市平江县汉昌街道天岳大道661号', '28.70105', '113.594423', '平江县天岳大道贵州茅台专卖店', '平江县隆源酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2122, '144440309001', '广东省', '深圳市', '龙华区', '深圳市龙华区民治街道办民塘路与民宝路交汇处金亨利瑜 璟苑裙楼 123 号至 128 号商铺', '22.620252', '114.029901', '深圳市民塘路贵州茅台专卖店', '深圳市宇辰鼎丰贸易发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2123, '2222250100001', '吉林省', '延边朝鲜族自治州', '延吉市', '延边朝鲜族自治州延吉市太平街55号检察公寓10号门市', '42.899198', '129.520545', '延吉市太平街贵州茅台酱香系列酒体验中心', '延边君和糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2124, '22420692001001', '湖北省', '襄阳市', '襄城区', '襄阳市襄城区长虹南路盛景名门49号', '32.01', '112.14', '襄城区长虹南路茅台酱香万家共享主题终端', '襄阳国之魂酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2125, '152520324001', '贵州省', '遵义市', '正安县', '遵义市正安县凤仪镇桃园社区尹珍公寓G1栋26号门面', '28.559521', '107.453012', '正安县迎宾北路贵州茅台专卖店', '正安县君希商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2126, '22522731005001', '贵州省', '黔南布依族苗族自治州', '惠水县', '黔南布依族苗族自治州惠水县惠水县涟江街道涟江南路45号', '26.126142', '106.657165', '惠水县涟江街道涟江南路茅台酱香万家共享主题终端', '惠水县宏源泰食品经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2127, '113130400002', '河北省', '邯郸市', '邯山区', '邯郸市邯山区滏河南大街国瑞瑞城住宅底商303-306号', '36.594911', '114.506586', '邯郸市滏河南大街贵州茅台专卖店', '邯郸锦泽源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2128, '22340700002001', '安徽省', '铜陵市', '铜官区', '铜陵市铜官区安徽省铜陵市石城大道柏庄春暖花开25-4号', '30.56', '117.48', '石城大道柏庄春暖花开茅台酱香万家共享主题终端', '铜陵市六和名城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2129, '22411483002002', '河南省', '商丘市', '睢阳区', '商丘市睢阳区商丘市睢阳区宜兴路与金银路交叉口西50米路北', '34.42', '115.65', '睢阳区宜兴路茅台酱香万家共享主题终端', '商丘市淘礼商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2130, '113130400001', '河北省', '邯郸市', '丛台区', '邯郸市丛台区荀子南大街2号阳光东尚名筑7号楼2-2', '36.603244', '114.566659', '邯郸市荀子南大街贵州茅台专卖店', '邯郸市乐园商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2131, '22411483002001', '河南省', '商丘市', '睢阳区', '商丘市睢阳区商丘市睢阳区宜兴路与金银路交叉口西50米路北', '34.42', '115.65', '宜兴路与金银路交叉口西北角茅台酱香万家共享主题终端', '商丘市淘礼商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2132, '22340700002003', '安徽省', '铜陵市', '义安区', '铜陵市义安区安徽省铜陵市天山大道南段1058号', '30.950619', '117.937405', '茅台酱香万家共享主题终端红星美凯龙店', '铜陵市六和名城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2133, '133330881001', '浙江省', '衢州市', '江山市', '衢州市江山市礼贤路1号', '28.770936', '118.64808', '江山市礼贤路贵州茅台专卖店', '衢州和鑫贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2134, '22340700002005', '安徽省', '铜陵市', '铜官区', '铜陵市铜官区淮河大道中段铜冠金樽广场1楼', '30.927113', '117.807009', '茅台酱香万家共享主题终端铜冠白马店', '铜陵市六和名城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2135, '134341221001', '安徽省', '阜阳市', '临泉县', '阜阳市临泉县前进东路35号港口路与前进路交叉口西北角', '33.057414', '115.267233', '阜阳市前进东路贵州茅台专卖店', '安徽名泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2136, '22340700002004', '安徽省', '铜陵市', '铜官区', '铜陵市铜官区义安大道南段88号', '30.92506', '117.81761', '茅台酱香万家共享琦玉店', '铜陵市六和名城实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2137, '22410884002001', '河南省', '焦作市', '山阳区', '焦作市山阳区长恩路1316号商铺', '35.203728', '113.267542', '山阳区长恩路茅台酱香万家共享主题终端', '焦作市解放区和平西街正和食品商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2138, '133330100011', '浙江省', '杭州市', '西湖区', '杭州市西湖区古墩路95号', '30.271718', '120.10111', '杭州市古墩路贵州茅台自营店', '浙江国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2139, '2313010000002', '河北省', '石家庄市', '新乐市', '石家庄市新乐市长寿街道鲜虞街34号', '38.344339', '114.692382', '新乐市长寿街道茅台酱香万家共享主题终端', '新乐市金爵酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2140, '23230600013014', '黑龙江省', '大庆市', '让胡路区', '大庆市让胡路区黑龙江省大庆市让胡路区西建街东侧燕都酒楼北侧商服16号1-2层(1层)', '46.623815', '124.906538', '大庆市宁喆商贸有限公司', '大庆市宁喆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2141, '133330100002', '浙江省', '杭州市', '上城区', '杭州市上城区海普路120号七章公园117号', '30.32217', '120.26488', '杭州市海普路贵州茅台专卖店', '杭州壹玖贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2142, '133330100008', '浙江省', '杭州市', '拱墅区', '杭州市拱墅区余杭塘路533-535号', '30.293229', '120.107921', '杭州市余杭塘路贵州茅台专卖店', '杭州国香缘酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2143, '22320500010011', '江苏省', '苏州市', '姑苏区', '苏州市姑苏区永康友新路999号8号楼101-104,106-107、201、209', '31.278302', '120.602776', '贵州茅台酱香系列酒体验中心', '苏州绝世风华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2144, '99902458', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2145, '22320500010012', '江苏省', '苏州市', '太仓市', '苏州市太仓市郑和中路315号2栋111室', '31.464917', '121.130687', ' 太仓市郑和中路茅台酱香万家共享主题终端', '苏州绝世风华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2146, '410800004', '河南省', '焦作市', '山阳区', '焦作市山阳区玉溪路总部 新城17号楼4层', '35.217409', '113.260827', '焦作市宏福翔商贸有限公司中心库', '焦作市宏福翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2147, '165654327001', '新疆维吾尔自治区', '阿勒泰地区', '阿勒泰市', '阿勒泰地区阿勒泰市迎宾路红石区103号华丽学府苑7栋1层3、4、5号铺', '47.788507', '88.130987', '阿勒泰市迎宾路贵州茅台专卖店', '阿勒泰市汇鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2148, '121210800001', '辽宁省', '营口市', '站前区', '营口市站前区盼盼路北31-8.9号', '40.67882', '122.250638', '营口市盼盼路北贵州茅台专卖店', '营口南开吉祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2149, '121210800002', '辽宁省', '营口市', '鲅鱼圈区', '营口市鲅鱼圈区32-清华园二期超市-9#门市', '40.251879', '122.134236', '营口市桃花潭路贵州茅台专卖店', '营口威泽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2150, '22320800005001', '江苏省', '淮安市', '清江浦区', '淮安市清江浦区北京北路88-3号', '33.602903', '119.008756', '清江浦区北京北路茅台酱香万家共享主题终端', '淮安市智溢酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2151, '2337310100003', '山东省', '滨州市', '滨城区', '滨州市滨城区黄河八路渤海十-路向南路西学苑花园小区沿街房', '37.387348', '117.997189', '滨州市黄河八路茅台酱香万家共享主题终端', '滨州市壹玖商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2152, '111110224003', '北京市', '北京市', '大兴区', '北京市大兴区北京市北京经济技术开发区经海六路1号院2号楼1至2层104', '39.797692', '116.561556', '北京市经海六路贵州茅台专卖店', '北京品尚九仙商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2153, '111110224004', '北京市', '北京市', '丰台区', '北京市丰台区花乡高立庄616号新华国际中心A座108', '39.795575', '116.302966', '北京市花乡高立庄贵州茅台专卖店', '北京金源腾达酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2154, '150500102001', '重庆市', '重庆市', '涪陵区', '重庆市涪陵区荔枝街道办事处稻香四组（四环路）太极大道74号附26—31号', '29.69904', '107.378038', '重庆市太极大道贵州茅台专卖店', '重庆茅美香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2155, '111110224001', '北京市', '北京市', '大兴区', '北京市大兴区义锦北街3号院5号楼1层102', '39.721277', '116.317416', '北京市义锦北街贵州茅台专卖店', '北京望兴洲际商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2156, '114140300001', '山西省', '阳泉市', '郊区', '阳泉市郊区保晋路天峰山城绿洲小区底商2-102', '37.875157', '113.584219', '阳泉市保晋路贵州茅台专卖店', '阳泉市利华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2157, '165652224001', '新疆维吾尔自治区', '哈密市', '伊州区', '哈密市伊州区建设东路29号领先花园1#2#高层底商住宅楼103-2铺', '42.836645', '93.513844', '哈密市建设东路贵州茅台专卖店', '哈密市雄峰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2158, '133330483001', '浙江省', '杭州市', '余杭区', '杭州市余杭区五常街道联创街瑞谷中心1幢', '30.285602', '120.014094', '杭州市联创街贵州茅台专卖店', '杭州酒源酒酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2159, '2351078300001', '四川省', '绵阳市', '游仙区', '绵阳市游仙区东津路11号', '31.467194', '104.768042', '绵阳市东津路茅台酱香万家共享主题终端', '绵阳市茅都商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2160, '24341100005010', '安徽省', '滁州市', '市辖区', '滁州市市辖区安徽省滁州市南谯中路2268号', '32.272072', '118.332717', '滁州市容海酒业销售有限公司中心库', '滁州市容海酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2161, '2332120300002', '江苏省', '泰州市', '高港区', '泰州市高港区金港中路268号', '32.318661', '119.878932', '泰州市金港中路茅台酱香万家共享主题终端', '泰州市华粹商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2162, '135350300001', '福建省', '莆田市', '城厢区', '莆田市城厢区龙桥街道学园中街1411号', '25.444058', '119.012368', '莆田市学园中街贵州茅台专卖店', '福建顺天商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2163, '22511321001001', '四川省', '南充市', '南部县', '南充市南部县滨江路252号', '31.36', '106.07', '南部县滨江路茅台酱香万家共享主题终端', '南部县昌平酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2164, '2532098300601', '江苏省', '盐城市', '盐都区', '盐城市盐都区盐城市盐都区青年西路30号盛世华城19幢103-104门市', '33.355909', '120.13108', '盐都区青年西路贵州茅台酱香系列酒体验中心', '盐城市丰裕祥酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2165, '142420122001', '湖北省', '武汉市', '洪山区', '武汉市洪山区珞喻路卓刀泉特1号湖北金鑫国际精品家居一楼商铺', '30.515721', '114.3831', '武汉市珞喻路贵州茅台专卖店', '湖北和丰经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2166, '2132118210001', '江苏省', '镇江市', '扬中市', '镇江市扬中市三茅街道文景广场西侧', '32.232436', '119.834817', '扬中市三茅街道镇江市益加益烟酒茶有限公司门店', '镇江市益加益烟酒茶有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2167, '141411023001', '河南省', '许昌市', '魏都区', '许昌市魏都区建安大道与三里桥路交叉口金石假日广场7幢1层102', '34.034135', '113.847949', '许昌市建安大道贵州茅台专卖店', '许昌富乐贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2168, '241410192001', '河南省', '郑州市', '管城回族区', '郑州市管城回族区经开区经南十路93号16号楼一层103.104.105.106号商铺（海棠公馆西南角）', '34.683412', '113.806069', '郑州市经南十路贵州茅台专卖店', '郑州贺贞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2169, '2332118100001', '江苏省', '镇江市', '丹阳市', '镇江市丹阳市丹金路31-32号', '31.981135', '119.581707', '丹阳市丹金路茅台酱香万家共享主题终端', '丹阳人和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2170, '241410192002', '河南省', '郑州市', '金水区', '郑州市金水区商务内环路13号奥园国际公寓【2】号楼【一】层【123】号', '34.776313', '113.721528', '郑州商务内环路贵州茅台专卖店', '河南中瑞国酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2171, '241410192003', '河南省', '郑州市', '金水区', '郑州市金水区郑州市金水区如意西路华信楷林大厦103号', '34.803316', '113.733012', '郑州市如意河西二街贵州茅台专卖店', '河南盛林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2172, '343000003', '安徽省', '亳州市', '市辖区', '亳州市市辖区谯城区康美中药城丁3-120号', '33.830535', '115.786315', '亳州市鹏翔商贸有限公司中心库', '亳州市鹏翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2173, '2341022300001', '河南省', '开封市', '尉氏县', '开封市尉氏县广场东路与北二环交叉口向西十米路南', '34.428032', '114.192035', '尉氏县广场东路茅台酱香万家共享主题终端', '尉氏县誉鑫副食商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2174, '137370282001', '山东省', '青岛市', '即墨区', '青岛市即墨区潮海街道办事处鹤山路369号-100', '36.398288', '120.473475', '青岛市鹤山路贵州茅台专卖店', '青岛龙华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2175, '115153406001', '内蒙古自治区', '巴彦淖尔市', '临河区', '巴彦淖尔市临河区帅丰街金秋华城C1-103号', '40.748323', '107.36134', '巴彦淖尔市帅丰街贵州茅台专卖店', '巴彦淖尔市永强糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2176, '145450522001', '广西壮族自治区', '北海市', '海城区', '北海市海城区驿马街道重庆路九洲城小区Ｄ3幢6号7号商铺', '21.460328', '109.114679', '北海市重庆路贵州茅台专卖店', '北海市源华商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2177, '22320100001001', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区江苏省南京市鼓楼区江东北路419号-2', '32.068619', '118.737298', '鼓楼区江东北路茅台酱香万家共享主题终端', '江苏苏糖糖酒食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2178, '2252253100001', '贵州省', '安顺市', '镇宁布依族苗族自治县', '安顺市镇宁布依族苗族自治县黄果树瀑韵天城A3栋1-1跃3-4', '26.000074', '105.68529', '镇宁县黄果树瀑韵天城贵州茅台酱香系列酒体验中心', '安顺冠亚通酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2179, '22330100025001', '浙江省', '杭州市', '萧山区', '杭州市萧山区宁围街道利华路20号', '30.218297', '120.270261', '萧山区宁围街道茅台酱香万家共享主题终端', '浙江德道食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2180, '340000003', '安徽省', '黄山市', '屯溪区', '黄山市屯溪区黄山市屯溪区新园东路307-9号', '29.718111', '118.338791', '黄山市蕊玥翔商贸有限公司中心库', '黄山市蕊玥翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2181, '532332002', '云南省', '楚雄彝族自治州', '楚雄市', '楚雄彝族自治州楚雄市高新区东盛东路汇鑫广场S5东107号', '25.0529', '101.538964', '楚雄天森利商贸有限公司中心库', '楚雄天森利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2182, '122222501003', '吉林省', '延边朝鲜族自治州', '延吉市', '延边朝鲜族自治州延吉市太平街55号检察公寓9号门市', '42.899516', '129.521697', '延吉市太平街贵州茅台专卖店', '延吉市飞天商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2183, '141410581002', '河南省', '安阳市', '林州市', '安阳市林州市桂园办红旗渠大道东段58号泰宏国际城9幢105铺', '36.081233', '113.836645', '林州市旗渠大道贵州茅台专卖店', '林州锦泽源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2184, '2341078300001', '河南省', '新乡市', '红旗区', '新乡市红旗区牧野路东旭小区36号', '35.293336', '113.912132', '新乡市牧野路茅台酱香万家共享主题终端', '新乡市茅酱商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2185, '113130186001', '河北省', '石家庄市', '正定县', '石家庄市正定县正定镇恒山东路9号', '38.15289', '114.57363', '正定县恒山东路贵州茅台专卖店', '石家庄市旭东糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2186, '132320583001', '江苏省', '苏州市', '昆山市', '苏州市昆山市昆太路588号天成佳园5号楼5号商铺', '31.391336', '120.971831', '昆山市昆太路贵州茅台专卖店', '昆山市国茅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2187, '144441600001', '广东省', '河源市', '源城区', '河源市源城区大同路东边永和路北边万隆一品1栋103-104房', '23.76499', '114.695599', '河源市大同路贵州茅台专卖店', '河源市旭日嘉辉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2188, '22522601007001', '贵州省', '黔东南苗族侗族自治州', '凯里市', '黔东南苗族侗族自治州凯里市大十字街道博南新区龙隐山庄1号楼1层7号，8号门面', '26.247996', '107.509052', '凯里市大十字街道茅台酱香万家共享主题终端', '凯里市锦隆源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2189, '22371428001001', '山东省', '德州市', '武城县', '德州市武城县城区青年路美地新居B-S11-2号', '37.22', '116.07', '武城县青年路茅台酱香万家共享主题终端', '武城县久都商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2190, '410186002009', '北京市', '北京市', '朝阳区', '北京市朝阳区泓鑫家园16号楼（2号公建）1层01号', '39.947506', '116.547655', '北京市东坝中路贵州茅台专卖店', '尚郡（北京）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2191, '22150400005001', '内蒙古自治区', '赤峰市', '红山区', '赤峰市红山区站前办事处钢铁街军分区院北侧钢铁街91-7号', '42.27', '118.96', '红山区钢铁街茅台酱香万家共享主题终端', '赤峰中烟金叶烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2192, '153534200001', '云南省', '昆明市', '安宁市', '昆明市安宁市连然街道百花西路42号', '24.921179', '102.487878', '昆明市百花西路贵州茅台专卖店', '香格里拉市南崃酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2193, '246460200002', '海南省', '三亚市', '天涯区', '三亚市天涯区凤凰路景园城小区C栋一层10/11/12号', '18.288239', '109.484088', '三亚市凤凰路贵州茅台专卖店（景园城小区）', '海南嘉新保国贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2194, '153532526001', '云南省', '昆明市', '盘龙区', '昆明市盘龙区联盟街道白云路现代广场1层1-2/1-6/1-7商铺', '25.068342', '102.715945', '昆明市白云路贵州茅台专卖店', '昆明懿德酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2195, '246460200003', '海南省', '三亚市', '天涯区', '三亚市天涯区海南省三亚市天涯区海润路2号（南繁华苑3号、4号、5号商铺）', '18.290524', '109.499899', '三亚市海润路贵州茅台专卖店', '三亚仕玲商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2196, '137371100001', '山东省', '日照市', '东港区', '日照市东港区济南路189号（荣域世嘉小区沿街东1号）', '35.426332', '119.515612', '日照市济南路贵州茅台专卖店', '日照市颐国商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2197, '133330800001', '浙江省', '衢州市', '柯城区', '衢州市柯城区白云南大道151-157号', '28.958427', '118.850066', '衢州市白云南大道贵州茅台专卖店', '衢州市金叶商厦有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2198, '23445500008009', '广东省', '中山市', '中山市', '中山市中山市古镇镇新兴中路242号', '22.626477', '113.18961', '贵州茅台酱香列酒体验中心（0179）粤018', '中山市古镇瀛聚百货店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2199, '246460200004', '海南省', '三亚市', '吉阳区', '三亚市吉阳区榆亚路东海豪庭花园B栋B段02—1号铺面', '18.225373', '109.521856', '三亚市榆亚路贵州茅台43度经销店', '三亚鼎醴贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2200, '22431200007002', '湖南省', '怀化市', '鹤城区', '怀化市鹤城区鹤城区城中街道迎丰中路84号', '27.553784', '109.965195', '鹤城区城中街道迎丰中路茅台酱香万家共享主题终端', '湖南爱酒者贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2201, '152520300002', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区白杨路68号、70号', '27.676102', '106.92336', '遵义市白杨路贵州茅台专卖店', '遵义市糖酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2202, '144440981001', '广东省', '广州市', '番禺区', '广州市番禺区番禺钟村街汉兴东路33 号、35号、39号、41号', '22.995648', '113.335756', '广州市汉兴东路贵州茅台专卖店', '茂名市盈大商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2203, '152520300003', '贵州省', '遵义市', '汇川区', '遵义市汇川区上海路街道厦门路碧桂园遵义公馆S1栋1-4、1-5、1-6', '27.716696', '106.924195', '遵义市厦门路贵州茅台专卖店', '遵义三源酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2204, '152520300004', '贵州省', '遵义市', '汇川区', '遵义市汇川区上海路壹品城1单元2层1-2-4、1-2-5、1-2-6号门面', '27.708301', '106.9317', '遵义市上海路贵州茅台专卖店', '遵义市泰宇商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2205, '211110105005', '北京市', '北京市', '朝阳区', '北京市朝阳区常营乡管庄路150号院1号楼1层0101、0102-1、0102-2号', '39.922786', '116.591861', '北京市管庄路贵州茅台专卖店', '北京亚思利泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2206, '22411425003001', '河南省', '商丘市', '虞城县', '商丘市虞城县河南省虞城县嵩山路江山领秀北门西侧1518门面', '34.241891', '115.473631', '虞城县嵩山路茅台酱香万家共享主题终端', '虞城铭嫣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2207, '152520300005', '贵州省', '遵义市', '播州区', '遵义市播州区龙坑街道爱特购智慧新城A区一层A0-1-96', '27.5894', '106.8927', '遵义市和平大道贵州茅台专卖店', '遵义市中淳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2208, '2113050010001', '河北省', '邢台市', '信都区', '邢台市信都区中兴西大街利达世纪花园底商', '37.062809', '114.487273', '邢台市中兴西大街邢台黔塘商贸有限公司门店', '邢台黔塘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2209, '22330100001001', '浙江省', '杭州市', '滨江区', '杭州市滨江区长河街道滨盛路2077号潮上中南银座1幢楼102室-2号', '30.203857', '120.197018', '滨江区长河街道滨盛路茅台酱香万家共享主题终端', '浙商糖酒集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2210, '211110105003', '北京市', '北京市', '朝阳区', '北京市朝阳区弘燕山水文园3号楼108、109', '39.86755', '116.480923', '北京市弘燕路贵州茅台专卖店', '北京朝批商贸股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2211, '211110105001', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区顺白路133号院21号楼108室', '40.041934', '116.508783', '北京顺白路贵州茅台专卖店', '北京中酒联合科贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2212, '23522638006001', '贵州省', '黔东南苗族侗族自治州', '凯里市', '黔东南苗族侗族自治州凯里市永丰西路银时尊府南区－1层1－2－3－4号门面', '26.572312', '107.953259', '凯里市永丰西路贵州茅台酱香系列酒体验中心', '黔东南州百佳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2213, '251511382001', '四川省', '南充市', '顺庆区', '南充市顺庆区大北街209号', '30.785527', '106.086439', '南充市大北街贵州茅台43度经销店', '南充市三名酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2214, '122220523001', '吉林省', '通化市', '辉南县', '通化市辉南县辉南东部生态新城馨园小区1幢1单元1 层101-102号', '42.682761', '126.066265', '辉南县建设大街贵州茅台专卖店', '吉林省中外名酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2215, '113130223001', '河北省', '唐山市', '滦州市', '唐山市滦州市燕山北大街贵州茅台专卖店', '39.751362', '118.706431', '唐山市燕山北大街贵州茅台专卖店', '滦县一路风顺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2216, '2332100000002', '江苏省', '扬州市', '宝应县', '扬州市宝应县国泰华苑213号门市', '33.246844', '119.331635', '宝应县国泰华苑茅台酱香万家共享主题终端', '宝应县中豪商贸经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2217, '150500114001', '重庆市', '重庆市', '秀山土家族苗族自治县', '重庆市秀山土家族苗族自治县中和街道白沙大道北段3号五岳广场南区1栋1层79号', '28.447359', '109.009046', '秀山县白沙大道贵州茅台专卖店', '秀山县渝诺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2218, '2322040000002', '吉林省', '辽源市', '龙山区', '辽源市龙山区温州城二期金领国际G座0102', '42.89921', '125.113678', '辽源市温州城茅台酱香万家共享主题终端', '辽源市一鸣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2219, '22220500001001', '吉林省', '通化市', '东昌区', '通化市东昌区滨江南路贵州茅台酱香系列酒主题终端', '41.71162', '125.93339', '滨江南路贵州茅台酱香系列酒主题终端', '通化市义和酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2220, '22440900005001', '广东省', '茂名市', '茂南区', '茂名市茂南区西粤北路9号大院首层77号-1房', '21.674952', '110.943376', '茂南区西粤北路茅台酱香万家共享主题终端', '茂名市粮基贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2221, '152522427001', '贵州省', '毕节市', '威宁彝族回族苗族自治县', '毕节市威宁彝族回族苗族自治县海边街道乌撒大道奥园广场SY3-1-1-33.34.35号', '26.87632', '104.238912', '威宁县乌撒大道贵州茅台专卖店', '威宁县康佑帆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2222, '2112022510001', '天津市', '天津市', '蓟州区', '天津市蓟州区渔阳镇光明路（派出所南100米）', '40.032854', '117.425016', '天津路光明路天津嘉裕秉盛商贸有限公司门店', '天津嘉裕秉盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2223, '2364240000001', '宁夏回族自治区', '银川市', '贺兰县', '银川市贺兰县虹桥北街中房苏荷阳光20-A幢-101', '38.514013', '106.300027', '贺兰县虹桥北街茅台酱香万家共享主题终端', '宁夏叁陆伍泓韵商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2224, '22652801001001', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '巴音郭楞蒙古自治州库尔勒市新城辖区杜鹃路79号门面沁园春锦36栋1层05、06号', '41.734871', '86.153675', '库尔勒市杜鹃路茅台酱香万家共享主题终端', '巴州鼎盛商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2225, '100420500003', '湖北省', '宜昌市', '伍家岗区', '宜昌市伍家岗区城东大道与中南路交汇处博雅长江广场商铺', '30.676425', '111.331382', '宜昌市城东大道贵州茅台专卖店', '宜昌市博溪商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2226, '115150128002', '内蒙古自治区', '呼和浩特市', '新城区', '呼和浩特市新城区成吉思汗东街丁香河畔4号商业楼104号', '40.862166', '111.749506', '呼和浩特市成吉思汗东街贵州茅台专卖店', '呼和浩特市乾尊云峰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2227, '2151132110001', '四川省', '南充市', '南部县', '南充市南部县草市街129号', '31.345482', '106.05957', '南部县草市街南部县昌平酒业有限公司门店', '南部县昌平酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2228, '22152101001001', '', '', '', '', '0.0', '0.0', '', '呼伦贝尔市糖酒副食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2229, '7085729', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2230, '22610484001001', '陕西省', '咸阳市', '秦都区', '咸阳市秦都区秦皇北路与毕塬路十字东南角瑞沣苑底商', '34.347285', '108.698889', '秦都区秦皇北路茅台酱香万家共享主题终端', '咸阳晓酌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2231, '115150128001', '内蒙古自治区', '呼和浩特市', '新城区', '呼和浩特市新城区成吉思汗东街东河御府南门-S3B段1022、1023、1024', '40.860522', '111.736235', '呼和浩特市成吉思汗大街贵州茅台专卖店', '内蒙古一壶天名烟名酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2232, '241412801001', '河南省', '驻马店市', '驿城区', '驻马店市驿城区东风街道前进大道与雪松大道交叉口东50米路北', '32.987438', '114.053763', '驻马店市雪松大道贵州茅台专卖店', '驻马店市五彩喜盈门商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2233, '151510400001', '四川省', '凉山彝族自治州', '西昌市', '凉山彝族自治州西昌市胜利南路一段263附1', '27.882147', '102.254195', '西昌市胜利南路贵州茅台专卖店', '西昌市盛亿欣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2234, '34440300083007001', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区高碑店乡高碑店三村三区19号楼7号二层201室', '40.002932', '116.478152', '北京华昱盛京酒业有限公司中心库', '北京华昱盛京酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2235, '22500700005001', '重庆市', '重庆市', '万州区', '重庆市万州区王牌路1388号6栋2-商铺8号门面', '30.767221', '108.409058', '万州区王牌路茅台酱香万家共享主题终端', '重庆崇晟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2236, '130802001', '河北省', '承德市', '双桥区', '承德市双桥区承德双桥区山神庙长安小区7号楼102', '0.0', '0.0', '承德市大升商贸有限公司中心库', '承德市大升商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2237, '100522501001', '贵州省', '安顺市', '西秀区', '安顺市西秀区中华东路友爱路段安置楼1楼1号铺面', '26.247998', '105.940006', '安顺市中华东路贵州茅台专卖店', '安顺市黔运红酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2238, '2352022100001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区凤凰大道山海观天下三单元113室1层', '26.573583', '104.842116', '六盘水市凤凰大道茅台酱香万家共享主题终端', '六盘水仟醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2239, '2236240100401', '江西省', '赣州市', '安远县', '赣州市安远县欣山镇腾飞路中央公园小区东门6栋10-12茅台酱香', '25.124103', '115.391303', '安远县欣山镇腾飞路贵州茅台酱香系列酒体验中心', '江西钦成酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2240, '22510188018001', '四川省', '成都市', '高新区', '成都市高新区中和枇杷巷138.140号', '30.557783', '104.095876', '高新区中和枇杷巷茅台酱香万家共享主题终端', '成都同益优化实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2241, '141410100003', '河南省', '郑州市', '金水区', '郑州市金水区金水路115号', '34.762894', '113.695523', '郑州市金水路贵州茅台专卖店（中州假日酒店）', '河南中州皇冠贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2242, '141410100002', '河南省', '郑州市', '管城回族区', '郑州市管城回族区航海东路70号院13号楼1层商5号', '34.721213', '113.70157', '郑州市航海东路贵州茅台专卖店', '郑州源真商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2243, '2251050000501', '四川省', '泸州市', '龙马潭区', '泸州市龙马潭区蜀泸大道二段68号', '28.903149', '105.422833', '龙马潭区蜀泸大道贵州茅台酱香系列酒体验中心', '四川省泸州久丰久盛酒类营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2244, '22362204002001', '江西省', '宜春市', '袁州区', '宜春市袁州区宜浦路宜春高铁站负101号', '27.78827', '114.436779', '袁州区宜浦路茅台酱香万家共享主题终端', '江西瀚强实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2245, '151511000001', '四川省', '内江市', '东兴区', '内江市东兴区栖霞路559号十栋商铺7-9号', '29.608217', '105.044069', '内江市栖霞路贵州茅台专卖店', '内江市润泽酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2246, '232320482001', '江苏省', '常州市', '金坛区', '常州市金坛区常州市金坛区华苑一村1-3甲', '31.743408', '119.590951', '常州市华城中路贵州茅台专卖店', '常州江南春酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2247, '141410100009', '河南省', '郑州市', '金水区', '郑州市金水区金水东路85号（雅宝东方国际3号楼1层106号）', '34.769405', '113.774443', '郑州市金水东路贵州茅台专卖店（雅宝东方国际）', '河南省茅五剑贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2248, '350181004001', '福建省', '福州市', '台江区', '福州市台江区福建省福州市台江区曙光支路2号百联大厦1楼东半层', '26.053467', '119.33723', '福州市曙光支路贵州茅台文化体验馆', '福建省诚韵文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2249, '141410100008', '北京市', '北京市', '朝阳区', '北京市朝阳区东坝中路泓鑫家园16号楼（2号公建）1层01号', '39.949268', '116.547398', '北京市东坝中路贵州茅台专卖店', '尚郡（北京）商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2250, '141412728001', '河南省', '周口市', '沈丘县', '周口市沈丘县尚德路与建设路交叉口南100米路西', '33.398849', '115.100227', '沈丘县尚德路贵州茅台专卖店', '河南亿星实业集团股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2251, '146460200004', '海南省', '三亚市', '天涯区', '三亚市天涯区海田路碧桂园三亚郡17号楼109/110铺面', '18.296846', '109.432682', '三亚市海田路贵州茅台专卖店', '海南林洋贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2252, '2315320000001', '内蒙古自治区', '乌兰察布市', '集宁区', '乌兰察布市集宁区内蒙古自治区乌兰察布市集宁区正黄路兴泰锦绣华城小区南门-1101商铺', '40.984883', '113.152351', '乌兰察布市兴泰锦绣华城茅台酱香万家共享主题终端', '内蒙古对君酌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2253, '141410100006', '河南省', '郑州市', '金水区', '郑州市金水区金水路30号', '34.76461', '113.658911', '郑州市金水路贵州茅台专卖店（省副食楼）', '河南省副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2254, '146460200003', '海南省', '三亚市', '吉阳区', '三亚市吉阳区迎宾路285号东岸外语培训中心五号楼第一层楼B区3、4、5铺面', '18.287112', '109.526314', '三亚市迎宾路贵州茅台专卖店', '三亚海之魂文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2255, '22510684004001', '四川省', '德阳市', '旌阳区', '德阳市旌阳区珠江西路120号', '31.11144', '104.39262', '旌阳区珠江西路茅台酱香万家共享主题终端', '德阳市区星辉商贸部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2256, '141410100004', '河南省', '郑州市', '金水区', '郑州市金水区天韵街五号（绿城怡商花园）13号楼一层104、105', '34.779277', '113.740542', '郑州市天韵街贵州茅台专卖店', '河南中州皇冠贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2257, '146460200005', '海南省', '三亚市', '吉阳区', '三亚市吉阳区凤凰路汇丰国际公寓一期大门103-7商铺', '18.263951', '109.520054', '三亚市凤凰路贵州茅台专卖店（汇丰国际）', '三亚今有嘉禾贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2258, '141410181002', '河南省', '郑州市', '巩义市', '郑州市巩义市孝沙路16-2', '34.761864', '112.989433', '巩义市孝沙路贵州茅台专卖店', '巩义市海澜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2259, '141410181003', '河南省', '郑州市', '巩义市', '郑州市巩义市新兴东路117号附5号', '34.755171', '113.015194', '巩义市新兴东路贵州茅台专卖店', '巩义市海澜商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2260, '22411024002001', '河南省', '许昌市', '鄢陵县', '许昌市鄢陵县鄢陵县柏梁镇翠薇路西段医保局西邻茅台酱香万家共享店', '34.109055', '114.164919', '鄢陵县翠薇路茅台酱香万家共享主题终端', '鄢陵县合一盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2261, '153532934001', '云南省', '大理白族自治州', '大理市', '大理白族自治州大理市满江街道建标华城兰峰路5幢019-020号', '25.604913', '100.277436', '大理市兰峰路贵州茅台专卖店', '大理市泉源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2262, '237370100001', '山东省', '济南市', '历下区', '济南市历下区崇华路贤文花园南区东门', '36.686844', '117.119111', '济南市崇华路贵州茅台专卖店', '济南林金经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2263, '100411300001', '河南省', '南阳市', '卧龙区', '南阳市卧龙区张衡街道办事处和庄社区居委会卓越凯越国际1幢108', '33.02435', '112.538097', '南阳市人民北路贵州茅台专卖店', '南阳市顺信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2264, '152522228002', '贵州省', '铜仁市', '沿河土家族自治县', '铜仁市沿河土家族自治县团结街道仙源路铭堃尚景商业中心-3层1-45号', '28.551957', '108.497347', '沿河县仙源路贵州茅台专卖店', '贵州梵源兴河商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2265, '2144528110002', '广东省', '揭阳市', '普宁市', '揭阳市普宁市流沙长春路正华园商铺东起第5至6间', '23.301908', '116.153186', '普宁市流沙长春路普宁市池尾千顺糖烟茶酒商店门店', '普宁市池尾千顺糖烟茶酒商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2266, '141410100014', '河南省', '郑州市', '金水区', '郑州市金水区龙湖中环南路40号4号楼1层109号', '34.793764', '113.730102', '郑州市龙湖中环南路贵州茅台专卖店', '郑州名门酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2267, '511600007', '四川省', '广安市', '市辖区', '广安市市辖区枣山物流商贸园区火山大道寰亚国际1号楼', '30.45092', '106.580279', '广安凯鹏商贸有限责任公司中心库', '广安凯鹏商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2268, '22520224001001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区水西南路9号附3号时代蝴蝶湾 106号铺', '26.587488', '104.847018', '钟山区水西南路茅台酱香万家共享主题终端', '六盘水仁强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2269, '141410100012', '河南省', '郑州市', '管城回族区', '郑州市管城回族区经开第四大街133号蓬勃大厦1楼茅台专卖店', '34.7248', '113.750631', '郑州市经开第四大街贵州茅台专卖店', '河南三睿酒业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2270, '141410100011', '河南省', '郑州市', '金水区', '郑州市金水区郑东新区中州大道与商鼎路交叉口永威翡翠城1层101号贵州茅台', '34.755037', '113.728027', '郑州市商鼎路贵州茅台自营店', '河南国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2271, '142421181002', '湖北省', '黄冈市', '麻城市', '黄冈市麻城市兴信路恒泰名仕公馆16幢1层', '31.163431', '114.99401', '麻城市兴信路贵州茅台专卖店', '麻城市鑫广商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2272, '152522423002', '贵州省', '毕节市', '黔西县', '毕节市黔西县黔西市莲城街道同心大道同心商贸城B栋', '26.99285', '106.040532', '黔西市同心大道贵州茅台专卖店', '黔西市意凯黔贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2273, '2344190200003', '广东省', '东莞市', '东莞', '东莞市东莞鸿福社区黄金路888号御泉山庄5栋142号', '22.976185', '113.712766', '东莞市黄金路茅台酱香万家共享主题终端', '东莞市君越酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2274, '2344190200002', '广东省', '东莞市', '东莞', '东莞市东莞南城区南城街道宏伟路7号附159号', '22.992279', '113.753433', '东莞市宏伟路茅台酱香万家共享主题终端', '东莞市唯臻汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2275, '22460200017001', '海南省', '三亚市', '吉阳区', '三亚市吉阳区三亚东岸外语培训中心五号楼第一层B区6铺面', '18.28462', '109.52294', '三亚市迎宾路茅台酱香万家共享主题终端', '三亚海之魂文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2276, '136360122001', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区九龙湖绿地国博绿地左岸公馆3号商业楼113-114室', '28.598986', '115.814091', '南昌市寺山街贵州茅台专卖店', '南昌华烨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2277, '214140188001', '山西省', '太原市', '小店区', '太原市小店区长治路331号C2座1层南01号', '37.785833', '112.560871', '太原市长治路贵州茅台专卖店', '太原市酒海科贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2278, '2313040000001', '河北省', '邯郸市', '武安市', '邯郸市武安市中山大街与桥西路交叉口西北角', '36.689203', '114.197551', '武安市中山大街茅台酱香万家共享主题终端', '河北天腾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2279, '370200026023', '山东省', '青岛市', '市南区', '青岛市市南区云南路街道青岛广州路青岛站', '36.064392', '120.312945', '山东省青岛市市南区广州路贵州茅台专卖店', '山东智顺投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2280, '2341040000002', '河南省', '平顶山市', '卫东区', '平顶山市卫东区矿工路北10号尚客优精选酒店西南侧约70米(楝香街与矿工路交叉口东50米)', '33.740481', '113.327069', '平顶山市矿工路茅台酱香万家共享主题终端', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2281, '22441909002001', '广东省', '东莞市', '东莞', '东莞市东莞南城街道鸿福西路南城段76号102室', '23.01676', '113.7386218', '南城区鸿福西路茅台酱香万家共享主题终端', '东莞市银丰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2282, '320128001002', '江苏省', '南京市', '建邺区', '南京市建邺区应天大街888号金鹰G酒店50楼', '32.024203', '118.740273', '南京市应天大街贵州茅台文化体验馆', '金鹰国际商贸集团（中国）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2283, '24320404001010', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区江苏省常州市钟楼区怀德中路123号', '32.066814', '118.769943', '江苏郭氏副食品有限公司中心库', '江苏郭氏副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2284, '141410100015', '河南省', '郑州市', '管城回族区', '郑州市管城回族区货站街170号', '34.737425', '113.70989', '郑州市货站街贵州茅台专卖店', '河南豫副酒源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2285, '2341040000003', '河南省', '平顶山市', '叶县', '平顶山市叶县广安路与九龙路交叉口西50米路北', '33.625866', '113.365378', '叶县广安路茅台酱香万家共享主题终端', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2286, '153532533001', '云南省', '昆明市', '晋宁区', '昆明市晋宁区晋城镇环湖南路七彩云南花园里（大观小院）35幢6、7号商铺', '24.763354', '102.735218', '昆明市环湖南路贵州茅台专卖店', '昆明轩桐贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2287, '2341040000001', '河南省', '平顶山市', '新华区', '平顶山市新华区联盟路与迎宾路交叉口西50米路南', '33.742611', '113.297427', '平顶山市联盟路茅台酱香万家共享主题终端', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2288, '2313028100001', '河北省', '唐山市', '遵化市', '唐山市遵化市北二环西路鸿福轩商务酒店底商', '40.203246', '117.959578', '遵化市北二环西路茅台酱香万家共享主题终端', '遵化市明睿商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2289, '164640126002', '宁夏回族自治区', '银川市', '西夏区', '银川市西夏区西夏区金波北街东侧银川西夏万达广场二期A区2号住宅', '38.494224', '106.150236', '银川市金波北街贵州茅台专卖店', '银川市信和达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2290, '2141110010001', '河南省', '漯河市', '郾城区', '漯河市郾城区龙塔街道太行山路辽河花园12号-14号门面房', '33.590311', '114.005409', '郾城区龙塔街道茅台酱酒万家共享主题终端', '漯河市铭久源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2291, '144441903001', '广东省', '东莞市', '东莞', '东莞市东莞南城区鸿福路200号(海德广场1栋商场107号)', '23.012059', '113.757614', '东莞市鸿福路贵州茅台专卖店', '东莞市妙品实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2292, '152522722001', '贵州省', '黔南布依族苗族自治州', '荔波县', '黔南布依族苗族自治州荔波县玉屏街道荔波古镇古风驿站6栋1层7号门面', '25.40938', '107.889183', '荔波县迎宾大道贵州茅台专卖店', '荔波浩源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2293, '211110101001', '北京市', '北京市', '丰台区', '北京市丰台区南三环西路85号（郑王坟140号）', '39.850947', '116.340383', '北京市南三环西路贵州茅台专卖店（郑王坟）', '北京京糖酒业有限公司销售分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2294, '2337098300001', '山东省', '泰安市', '肥城市', '泰安市肥城市泰临路24号', '36.189473', '116.782676', '肥城市泰临路茅台酱香万家共享主题终端', '肥城市鑫泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2295, '211110101003', '北京市', '北京市', '东城区', '北京市东城区广渠门内白桥大街15号嘉禾国信大厦1层', '39.895021', '116.438889', '北京市白桥大街贵州茅台专卖店', '华致酒行连锁管理股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2296, '22522424003001', '贵州省', '毕节市', '金沙县', '毕节市金沙县泰山路贵出名门4栋1层4-1-32-33号', '27.470126', '106.240278', '金沙县泰山路茅台酱香万家共享主题终端', '贵州酱酒之源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2297, '211110101002', '北京市', '北京市', '丰台区', '北京市丰台区郭公庄中街18号1号楼1层105', '39.814238', '116.304888', '北京市郭公庄中街贵州茅台专卖店', '北京恒泰嘉华贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2298, '152522321004', '贵州省', '黔西南布依族苗族自治州', '兴义市', '黔西南布依族苗族自治州兴义市民航大道兴义万峰林机场T2航站楼', '25.080662', '104.959137', '兴义市万峰林机场贵州茅台专卖店', '贵州民航产业集团有限公司酒业分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2299, '164640126001', '宁夏回族自治区', '银川市', '金凤区', '银川市金凤区泰康街5号', '38.485585', '106.238864', '银川市泰康街贵州茅台专卖店', '宁夏地德人和科工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2300, '330400010', '浙江省', '嘉兴市', '市辖区', '嘉兴市市辖区峰尚大厦2-202室-1', '30.729357', '120.779184', '嘉兴柒泉商贸有限公司中心库', '嘉兴柒泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2301, '121210185001', '辽宁省', '沈阳市', '和平区', '沈阳市和平区香港路140号', '41.750943', '123.428864', '沈阳市香港路贵州茅台专卖店', '沈阳浩维实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2302, '133330125001', '浙江省', '杭州市', '临平区', '杭州市临平区南苑街道崇韵街86-3号', '30.393272', '120.298949', '杭州市崇韵街贵州茅台专卖店', '杭州宏强酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2303, '121210185002', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区十三纬路58号', '41.785999', '123.426845', '沈阳市十三纬路贵州茅台专卖店', '沈阳浩维实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2304, 'Z410100044', '河南省', '郑州市', '金水区', '郑州市金水区金水路6号1层', '34.763858', '113.694606', '郑州市金水路贵州茅台总经销店', '河南省盛国藏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2305, '22450982001001', '广西壮族自治区', '玉林市', '玉州区', '玉林市玉州区二环北路1299号，中鼎假日公园紫荆苑2栋一层05、06号商铺', '22.65', '110.13', '玉州区二环北路茅台酱香万家共享主题终端', '玉林市意运供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2306, '2650011203101', '重庆市', '重庆市', '渝北区', '重庆市渝北区洪湖东路财富mall购物中心L2-A-18商铺', '29.608029', '106.507022', '渝北区洪湖东路茅台万家共享主题终端', '重庆怡飞酒类营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2307, '330205001', '浙江省', '宁波市', '江北区', '宁波市江北区宁波市江北区丰安路5号1号楼5楼', '29.934287', '121.574963', '宁波市鑫甬谊商贸有限公司中心库', '宁波市鑫甬谊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2308, '2337300300001', '山东省', '威海市', '环翠区', '威海市环翠区仙姑顶路112号-14号', '37.450309', '122.13776', '威海路仙姑顶路茅台酱香万家共享主题终端', '山东盛怡轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2309, '233331000001', '浙江省', '杭州市', '拱墅区', '杭州市拱墅区华中路218号（临）', '30.3429', '120.202898', '杭州市华中路贵州茅台43度经销店', '杭州潮鑫筱赢酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2310, '2352252900001', '贵州省', '安顺市', '关岭布依族苗族自治县', '安顺市关岭布依族苗族自治县龙潭街道信达三期1层2、3号铺面', '25.939818', '105.613072', '关岭县龙潭街茅台酱香万家共享主题终端', '关岭音符酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2311, '22320300012001', '江苏省', '徐州市', '沛县', '徐州市沛县汉邦路御澜湾二期4号楼101室', '34.73911', '116.930555', '沛县汉邦路茅台酱香万家共享主题终端', '沛县糖烟酒采购供应有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2312, '140400005', '山西省', '长治市', '市辖区', '长治市市辖区襄垣县新建西街108号', '36.530399', '113.032449', '山西锦泰伟业贸易有限公司中心库', '山西锦泰伟业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2313, '246460104003', '海南省', '海口市', '美兰区', '海口市美兰区海甸岛五西路80号蓝色海岸D栋1层103', '20.061728', '110.316517', '海口市海甸岛五西路贵州茅台专卖店', '海口可喜可嘉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2314, '2122030010001', '吉林省', '四平市', '铁西区', '四平市铁西区河西委华宇城小区27号楼1至2层104号房', '43.169019', '124.333618', '四平市河西委华宇城小区四平市铁西区鸿丰综合商店门店', '四平市铁西区鸿丰综合商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2315, '2341102300001', '河南省', '许昌市', '东城区', '许昌市东城区南海街奥体花城小区南门向西13米', '34.052239', '113.864259', '许昌市南海街茅台酱香万家共享主题终端', '许昌富乐贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2316, '420100172001', '湖北省', '武汉市', '江岸区', '武汉市江岸区中山大道与胜利街交叉口胜利街257号', '30.592039', '114.302185', '武汉市胜利街贵州茅台自营店', '湖北国酒茅台销售有限公司武汉分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2317, '2337090000001', '山东省', '济南市', '槐荫区', '济南市槐荫区齐州路1756号', '36.674266', '116.898821', '济南市齐州路茅台酱香万家共享主题终端', '泰安市泰山名饮有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2318, '2337090000002', '山东省', '济南市', '槐荫区', '济南市槐荫区营市街137号', '36.658539', '116.967131', '济南市营市街茅台酱香万家共享主题终端', '泰安市泰山名饮有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2319, '142421100002', '湖北省', '黄冈市', '黄州区', '黄冈市黄州区西湖三路56号香山湖畔4栋104号商铺', '30.433218', '114.892656', '黄冈市西湖三路贵州茅台专卖店', '黄冈市语丰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2320, '2337090000003', '山东省', '泰安市', '泰山区', '泰安市泰山区擂鼓石大街660-1号', '36.198635', '117.094761', '泰安市擂鼓石大街茅台酱香万家共享主题终端', '泰安九尊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2321, '152520381002', '贵州省', '遵义市', '赤水市', '遵义市赤水市红军大道红星小区A区7号楼1层3-4号', '28.5743', '105.697', '赤水市红军大道贵州茅台专卖店', '赤水市九龙酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2322, '251510185002', '四川省', '成都市', '成华区', '成都市成华区成华区二仙桥东路46号附13号1层', '30.676451', '104.131519', '成都市二仙桥东路贵州茅台专卖店', '成都宏利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2323, '2244560800001', '广东省', '江门市', '新会区', '江门市新会区会城镇潮江路31号108铺', '22.535507', '113.051268', '江门市潮江路贵州茅台酱香系列酒体验中心', '江门市凯盈酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2324, '22410100088001', '河南省', '郑州市', '金水区', '郑州市金水区金水路与通泰路交叉口向北100米路东', '34.762868', '113.733052', '金水区金水路茅台酱香万家共享主题终端', '河南喜洋洋永盛实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2325, 'B37020200201', '山东省', '青岛市', '市南区', '青岛市市南区山东省青岛市市南区山东路6号甲B119号商铺', '36.085155', '120.3972', '青岛市市南区奉化路2号贵州茅台旗舰店', '山东茅承传薪商贸股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2326, '2342030000001', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区五堰街办北京中路1号55幢1-95', '32.629034', '110.798662', '十堰市北京中路茅台酱香万家共享主题终端', '十堰冯氏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2327, '22371483002001', '山东省', '德州市', '德城区', '德州市德城区经济技术开发区宋官屯街道办事处晶华路德高综合楼10-2号', '37.44', '116.38', '经济技术开发区晶华大道茅台酱香万家共享主题终端', '德州市丰永商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2328, '132321100001', '江苏省', '镇江市', '润州区', '镇江市润州区黄山南路1号', '32.185983', '119.441491', '镇江市黄山南路贵州茅台专卖店', '江苏恒顺集团镇江恒海酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2329, '236360783002', '江西省', '赣州市', '章贡区', '赣州市章贡区蓉江新区茉莉路1号启迪科技城一期A区A1栋1-1至1-4号商铺', '25.787843', '114.894085', '赣州市赣南大道贵州茅台专卖店', '赣州长庚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2330, '23620124004001', '甘肃省', '兰州市', '城关区', '兰州市城关区甘肃省兰州市城关区南滨河东路5150号名城广场1号楼1楼', '36.07558', '103.864679', '城关区南滨河东路贵州茅台酱香系列酒体验中心', '甘肃政创商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2331, '34410100087020001', '河南省', '安阳市', '内黄县', '安阳市内黄县1', '35.972016', '114.90146', '内黄县聚晟商贸有限公司中心库', '内黄县聚晟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2332, '2345300700003', '广西壮族自治区', '河池市', '金城江区', '河池市金城江区金福路41号', '24.687621', '108.045565', '河池市金福路茅台酱香万家共享主题终端', '河池市微客商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2333, '24520101001010', '贵州省', '贵阳市', '市辖区', '贵阳市市辖区贵阳国家高新技术产业开发区', '26.613717', '106.651766', '贵州金浩田房地产开发有限公司中心库', '贵州金浩田房地产开发有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2334, '132321091002', '江苏省', '扬州市', '江都区', '扬州市江都区仙女镇仙城北路80-4号', '32.436678', '119.564846', '扬州市仙城北路贵州茅台专卖店', '扬州经之典酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2335, '34410194005031001', '山东省', '济南市', '槐荫区', '济南市槐荫区山东省济南市槐荫区恒大翡翠华庭1期东门商铺1737号B2-7', '36.674005', '116.930969', '山东元睿供应链有限公司中心库', '山东元睿供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2336, '222220187001', '吉林省', '长春市', '市辖区', '长春市市辖区高新区硅谷大街以东居然家园3号楼118号', '43.788876', '125.230831', '长春市超强街贵州茅台专卖店', '吉林省莲芝商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2337, '22220500002001', '吉林省', '通化市', '东昌区', '通化市东昌区光复路一高中山下锦绣家园第4座6号', '41.72', '125.93', '东昌区光复路茅台酱香万家共享主题终端', '通化市麦德林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2338, '22520300062001', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区新蒲新区新中街道新城大酒店后街门面10.11号', '39.93', '116.6', '新蒲新区新中街道茅台酱香万家共享主题终端', '遵义市金瑞源酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2339, '164640321001', '宁夏回族自治区', '中卫市', '沙坡头区', '中卫市沙坡头区恒通路与五里南街交叉口恒祥壹方城B区2#楼01--03号营业房', '37.491794', '105.220171', '中卫市恒通路贵州茅台专卖店', '中卫市酱韵酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2340, '165650100004', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '乌鲁木齐市新市区北京南路623号绿洲综合楼1栋1层商业4', '43.857066', '87.566538', '乌鲁木齐市北京南路贵州茅台专卖店', '新疆国酒事业糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2341, '165650100005', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '乌鲁木齐市水磨沟区昆仑东街华凌公馆A区2栋103室', '43.834343', '87.620328', '乌鲁木齐市昆仑东街贵州茅台专卖店', '新疆义君福水商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2342, 'B52038202501', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市中国酒文化城', '27.852178', '106.372202', '文旅公司', '', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2343, '165650100006', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '乌鲁木齐市头屯河区黄山街81号一品九点阳光7号公寓楼', '43.856176', '87.523024', '乌鲁木齐市黄山街贵州茅台专卖店', '新疆奋强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2344, '165650100007', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '乌鲁木齐市天山区乌鲁木齐碱泉三街99号', '43.804958', '87.639936', '乌鲁木齐市碱泉三街贵州茅台专卖店', '新疆遂意商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2345, 'B52038202503', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市中国酒文化城邀月轩', '27.852485', '106.373938', '仁怀市中国酒文化城邀月轩贵州茅台体验店', '中国酒文化城店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2346, '165650100001', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '乌鲁木齐市头屯河区玄武湖路686号翠竹园商业街S2栋101号', '43.84049', '87.520361', '乌鲁木齐市玄武湖路贵州茅台专卖店', '乌鲁木齐市宜新商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2347, '134342521001', '安徽省', '宣城市', '宣州区', '宣城市宣州区香江金郡东区12栋104、105室', '30.940085', '118.738341', '宣城市梅园路贵州茅台专卖店', '宣城市祥和商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2348, '165650100002', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '乌鲁木齐市水磨沟区西虹东路642号', '43.818227', '87.620534', '乌鲁木齐市西虹东路贵州茅台专卖店', '乌鲁木齐市聚亨贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2349, '100440300003', '广东省', '深圳市', '盐田区', '深圳市盐田区沙头角街道沙盐路', '22.550038', '114.229766', '深圳市沙盐路贵州茅台专卖店', '深圳市沙头角商业外贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2350, '34110105099015001', '湖南省', '湘潭市', '雨湖区', '湘潭市雨湖区1', '27.856115', '112.907334', '湘潭市雨湖区图圣商行中心库', '湘潭市雨湖区图圣商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2351, '213130100001', '河北省', '石家庄市', '桥西区', '石家庄市桥西区西二环南路付12号', '38.029985', '114.43715', '石家庄市西二环南路贵州茅台专卖店', '河北品高商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2352, '510700011', '四川省', '绵阳市', '市辖区', '绵阳市市辖区经开区机场东路455号3幢6号2楼', '31.425945', '104.776904', '绵阳道启酒业有限公司中心库', '绵阳道启酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2353, '213130100002', '河北省', '石家庄市', '裕华区', '石家庄市裕华区东岗路藏龙福地14号底商二楼商铺', '38.01906', '114.5646', '石家庄市东岗路贵州茅台43度经销店', '石家庄市贤拓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2354, '134340500002', '安徽省', '马鞍山市', '雨山区', '马鞍山市雨山区钟山路793号', '31.660742', '118.498465', '马鞍山市钟山路贵州茅台专卖店', '马鞍山市新宇酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2355, '165650100009', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '乌鲁木齐市新市区新市区北京南路223号康源财富综合楼1层商业4号', '43.843033', '87.572668', '乌鲁木齐市北京南路贵州茅台自营店', '新疆国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2356, '310115008003', '上海市', '上海市', '黄浦区', '上海市黄浦区复兴中路529号思南公馆27号楼', '31.215233', '121.468531', '上海市复兴中路贵州茅台文化体验馆', '上海浩泽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2357, '213130100003', '河北省', '石家庄市', '桥西区', '石家庄市桥西区中山西路283号', '38.043595', '114.469792', '石家庄市中山西路贵州茅台43度经销店', '河北慧泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2358, '244440307001', '广东省', '深圳市', '坪山区', '深圳市坪山区兰竹西路28号招商花园城10栋101-106', '22.706118', '114.34599', '深圳市兰竹西路贵州茅台专卖店', '广东旗帜商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2359, 'Z110101136', '北京市', '北京市', '东城区', '北京市东城区王府井东街八号澳门中心12', '39.915067', '116.413808', '北京市王府井东街贵州茅台总经销店', '北京恒生醇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2360, '137370886001', '山东省', '济宁市', '任城区', '济宁市任城区红星中路93号', '35.415087', '116.576858', '济宁市红星中路贵州茅台专卖店', '济宁市荣品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2361, '2313112100002', '河北省', '衡水市', '枣强县', '衡水市枣强县富强路107号（妇幼保健院东南角）', '37.511279', '115.737121', '枣强县富强路茅台酱香万家共享主题终端', '河北三辰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2362, '2312011300001', '天津市', '天津市', '北辰区', '北辰区北辰区天津市北辰区双街镇顺风路15号', '39.25927347', '117.13803128', '天津市双街镇茅台酱香万家共享主题终端', '天津开发区世诚源科技发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2363, '22612734002001', '陕西省', '西安市', '高新区', '西安市高新区西安市浐灞生态区浐灞半岛河与墅1F-10号商铺', '34.312868', '109.030719', '高新区丈八二路茅台酱香万家共享主题终端', '西安泓韵酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2364, '2145010010001', '广西壮族自治区', '玉林市', '玉州区', '玉林市玉州区玉东大道161号玉林市得利广场3幢08-12号商铺', '22.6642', '110.193', '玉林市广场东路玉林市品正商贸有限公司门店', '玉林市品正商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2365, '145450333001', '广西壮族自治区', '桂林市', '七星区', '桂林市七星区桂林市七星区空明西路29号本元实业大厦B栋1-01、02商铺', '25.25197', '110.315041', '桂林市空明西路贵州茅台专卖店', '桂林市丙辛酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2366, '242420126001', '湖北省', '武汉市', '江岸区', '武汉市江岸区芦沟桥路特1号', '30.605775', '114.313329', '武汉市芦沟桥路贵州茅台专卖店', '武汉市大鸿雁供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2367, '242420126002', '湖北省', '武汉市', '江汉区', '武汉市江汉区江北国家民营科技园江发路8号第1栋A12-A15', '30.621594', '114.236195', '武汉市江发路贵州茅台专卖店', '武汉市晟蓝商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2368, '2153038210001', '云南省', '曲靖市', '市辖区', '曲靖市市辖区建保路女子监狱旁商铺', '25.5005', '103.811342', '曲靖市建保路曲靖市尚锋商贸有限公司门店', '曲靖市尚锋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2369, '165650100011', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '乌鲁木齐市新市区长春路1355号澳龙广场裙楼一层5号', '43.883579', '87.580074', '乌鲁木齐市长春中路贵州茅台专卖店', '喀什月勤商贸有限公司乌鲁木齐分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2370, '115152905001', '内蒙古自治区', '呼伦贝尔市', '满洲里市', '呼伦贝尔市满洲里市尚都国际高层2号楼门市-5', '49.600935', '117.430348', '满洲里市华埠大街贵州茅台专卖店', '满洲里市精华张裕酒窖', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2371, '22522230007001', '贵州省', '铜仁市', '万山区', '铜仁市万山区仁山街道万和锦里D区广场一层S3-S8栋9、10、11号铺面', '27.686954', '109.184276', '万山区金鳞大道茅台酱香万家共享主题终端', '铜仁市碧江区华盛酒类经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2372, '112120109001', '天津市', '天津市', '滨海新区', '天津市滨海新区大港街道迎宾街12.14号', '38.856534', '117.459503', '天津市迎宾街贵州茅台专卖店', '天津市金色年华科技有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2373, '2351012400001', '四川省', '成都市', '郫都区', '成都市郫都区郫都区红光镇高店路西段226', '30.777623', '103.937171', '成都市红光镇茅台酱香万家共享主题终端', '成都风雅颂酒文化传播有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2374, '34440300083005001', '河南省', '郑州市', '市辖区', '郑州市市辖区河南自贸试验区郑州片区（郑东）商鼎路78号3座2单元18层1820号', '34.754511', '113.726827', '河南华昱鼎立酒业有限公司中心库', '河南华昱鼎立酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2375, '136362301002', '江西省', '上饶市', '信州区', '上饶市信州区上饶大道公园道1号9-16-21号', '28.451594', '117.940056', '上饶市凤凰中大道贵州茅台专卖店', '上饶市德宝酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2376, '22362330002001', '江西省', '上饶市', '鄱阳县', '上饶市鄱阳县湖城国际1号商铺127号', '29.001627', '116.701595', '鄱阳县湖城国际茅台酱香万家共享主题终端', '鄱阳县顺达副食商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2377, '132320132001', '江苏省', '南京市', '浦口区', '南京市浦口区顶山街道天浦路88号1栋102室', '32.06417', '118.666055', '南京市天浦路贵州茅台专卖店', '南京湘巍酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2378, '22522526007001', '贵州省', '安顺市', '平坝区', '安顺市平坝区安平街道平黎大道中段锦绣园1栋1层5号商铺', '26.399031', '106.268508', '平坝区平黎大道中段茅台酱香万家共享主题终端', '贵州钦杨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2379, '510528001002', '四川省', '泸州市', '龙马潭区', '泸州市龙马潭区蜀泸大道三段自贸区总部基地2幢1层189号、191号', '28.928637', '105.399891', '泸州市蜀泸大道贵州茅台专卖店', '泸州浩昇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2380, '2137018710001', '山东省', '济南市', '长清区', '济南市长清区莲台山路1095号', '36.558122', '116.760025', '济南市莲台山路济南玉凯顺通商贸有限公司门店', '济南玉凯顺通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2381, '2221010000002', '辽宁省', '沈阳市', '和平区', '沈阳市和平区南京南街147号11门', '41.763184', '123.394004', '沈阳市南京南街贵州茅台酱香系列酒体验中心', '辽宁鑫源英民名酒连锁经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2382, '2246010200401', '海南省', '海口市', '龙华区', '海口市龙华区碧桂园剑桥郡二期东门S108铺面', '19.972887', '110.289961', '龙华区椰海大道贵州茅台酱香系列酒体验中心', '海南鹏舟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2383, '2221010000003', '辽宁省', '沈阳市', '大东区', '沈阳市大东区珠林路28号4门', '41.806822', '123.478938', '沈阳市贵州茅台酱香系列酒体验中心', '沈阳西平商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2384, '2331011200001', '上海市', '上海市', '闵行区', '上海市闵行区春申路1475号', '31.115607', '121.436079', '上海市春申路茅台酱香万家共享主题终端', '名嘉（上海）酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2385, '150500228001', '重庆市', '重庆市', '南岸区', '重庆市南岸区二塘路66号附115号、116号、117号', '29.491163', '106.567466', '重庆市二塘路贵州茅台专卖店', '重庆国荣酒店用品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2386, '122220682001', '吉林省', '吉林市', '船营区', '吉林市船营区解放大路巨龙大厦5-1号网点', '43.841804', '126.546586', '吉林市解放大路贵州茅台专卖店', '吉林省中外名酒文化有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2387, '114140400001', '山西省', '长治市', '潞州区', '长治市潞州区长兴中路383号', '36.191929', '113.119662', '长治市长兴中路贵州茅台专卖店', '长治市亿樽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2388, '211110101005', '北京市', '北京市', '东城区', '北京市东城区广渠门内大街43号雍贵中心C座403', '39.894057', '116.428214', '北京市广渠门内大街贵州茅台特约经销商', '北京钜华东鼎贸易发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2389, '211110101004', '北京市', '北京市', '丰台区', '北京市丰台区榴乡路84 号院1号楼1层3单元 110-112', '39.845611', '116.42466', '北京市榴乡路贵州茅台专卖店', '北京平定江山商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2390, 'Z110101145', '北京市', '北京市', '东城区', '北京市东城区澳门中心写字楼1205', '39.915112', '116.413554', '北京市澳门中心贵州茅台总经销店', '安徽怡天醇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2391, '223413000001', '安徽省', '宿州市', '埇桥区', '宿州市埇桥区西关街道银河一路河畔壹号门面房345#347#349', '33.645704', '116.967695', '宿州市埇桥区银河一路贵州茅台酱香系列酒体验中心', '宿州市国韵糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2392, '137373002002', '山东省', '威海市', '荣成市', '威海市荣成市崖头街道悦湖路88-116号商铺', '37.148557', '122.463159', '荣成市悦湖路贵州茅台专卖店', '威海荣礼糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2393, '150500700002', '重庆市', '重庆市', '渝北区', '重庆市渝北区金海大道68号27幢1-3,4,5', '29.661478', '106.47264', '重庆市金海大道贵州茅台专卖店', '重庆明培成商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2394, '162620400001', '甘肃省', '白银市', '白银区', '白银市白银区北京路466号', '36.546232', '104.14356', '白银市北京路贵州茅台专卖店', '白银欣大烟草经销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2395, '113130281001', '河北省', '唐山市', '遵化市', '唐山市遵化市开元豪庭商业西10', '40.192459', '117.957675', '遵化市华明北路贵州茅台专卖店', '唐山盈派商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2396, '22370287002001', '山东省', '青岛市', '市北区', '青岛市市北区重庆南路99号-31', '36.110653', '120.379298', '市北区淮安路茅台酱香万家共享主题终端', '青岛新星物流有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2397, '520182016034', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区水东路未来方舟D5组团7栋1层', '26.598788', '106.761537', '贵阳市水东路贵州茅台文化体验馆（未来方舟D5）', '贵州致优汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2398, '100450100006', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区民族大道86号金和大厦一楼103、104铺', '22.812563', '108.354773', '南宁市民族大道贵州茅台专卖店（金和大厦）', '广西翠屏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2399, '242420138001', '湖北省', '武汉市', '新洲区', '武汉市新洲区阳逻街道风情大道路7号湖景雅苑2号楼/单元1-2层7/8/9/10/11号铺', '30.680224', '114.577152', '武汉市风情大道路贵州茅台专卖店', '武汉元盛和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2400, '22433131005001', '湖南省', '衡阳市', '常宁市', '衡阳市常宁市培元街道办事处环城西路300号', '26.41', '112.39', '常宁市环城西路茅台酱香万家共享主题终端', '衡阳市易网通贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2401, '2142058110001', '湖北省', '宜昌市', '宜都市', '宜昌市宜都市陆城街道名都路8号新鸿国悦府5号楼1单元-层108、109铺', '30.384478', '111.440396', '宜都市陆城街道宜都市汇方达商贸有限公司门店', '宜都市福之源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2402, '22440300034001', '广东省', '深圳市', '盐田区', '深圳市盐田区梅沙街道环梅路26-1号', '22.36', '0.0', '盐田区梅沙街道环梅路茅台酱香万家共享主题终端', '深圳市溢香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2403, '100420100003', '湖北省', '武汉市', '武昌区', '武汉市武昌区铁机路5、7号华润橡树湾项目一期工程1栋1-3层1室', '30.60842', '114.347323', '武汉市铁机路贵州茅台专卖店', '武汉茅二代商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2404, '241411282001', '河南省', '三门峡市', '灵宝市', '三门峡市灵宝市涧东区管委会函谷路隆盛福星苑2幢103-104', '34.525412', '110.890254', '灵宝市函谷路贵州茅台专卖店', '灵宝市前进酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2405, '262620100001', '甘肃省', '兰州市', '城关区', '兰州市城关区张掖路19号泰生大厦1单元1501室', '36.058627', '103.830222', '兰州市张掖路贵州茅台43度经销店', '兰州嘉和源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2406, '23360731004005', '江西省', '赣州市', '章贡区', '赣州市章贡区江西省赣州市章贡区水南街道油山路九铭广场', '25.81238791642309', '114.91692766229703', '赣州市章贡区九铭广场贵州茅台酱香系列酒体验中心', '赣州诚龙商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2407, '450100006007', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区金湖路63号金源·现代城4层L4-1-006号商铺', '22.818195', '108.369713', '南宁市金湖路贵州茅台文化体验馆', '广西翠屏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2408, '2151100010001', '四川省', '内江市', '市中区', '内江市市中区公园街118号', '29.585108', '105.064782', '内江市公园街四川内江甜城糖酒有限公司糖酒分公司门店', '四川内江甜城糖酒有限公司糖酒分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2409, '133330721001', '浙江省', '金华市', '婺城区', '金华市婺城区城北街道八一北街324-326号', '29.103908', '119.651103', '金华市金华市八一北路贵州茅台专卖店', '金华市奕弘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2410, '141411323001', '河南省', '南阳市', '西峡县', '南阳市西峡县白羽街道建设西路凤凰城楼下', '33.295606', '111.475299', '西峡县建设西路贵州茅台专卖店', '南阳市亨盛酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2411, '2344019000001', '广东省', '广州市', '越秀区', '广州市越秀区瑶台牌坊喀麦隆大厦一楼101-2铺', '23.15724', '113.25449', '广州市增槎路茅台酱香万家共享主题终端', '广州新酒旺贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2412, '141411484001', '河南省', '商丘市', '梁园区', '商丘市梁园区文化路北中州路西临街综合楼东数18、19号', '34.424473', '115.668709', '商丘市文化路贵州茅台专卖店', '商丘市鑫海贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2413, '241410190002', '河南省', '郑州市', '新密市', '郑州市新密市溱水路与密州大道交汇处向东500米路南乐园天地商务中心', '34.541234', '113.410422', '新密市溱水路贵州茅台专卖店', '河南新祥之普商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2414, '142420130001', '湖北省', '武汉市', '武昌区', '武汉市武昌区积玉桥尚隆路地球村友谊国际二期七栋一层21号', '30.557368', '114.310191', '武汉市尚隆路贵州茅台专卖店', '湖北人人大经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2415, '142420300005', '湖北省', '十堰市', '丹江口市', '十堰市丹江口市碧桂园1号楼1幢107-108', '32.539686', '111.490094', '丹江口市明珠路贵州茅台专卖店', '十堰市酒类专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2416, '151510100019', '四川省', '成都市', '武侯区', '成都市武侯区益州大道中段1281号1楼、1283号1楼、1285号1楼', '30.547947', '104.056941', '成都市益州大道中段贵州茅台专卖店', '成都铂金盛利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2417, '142420300004', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区朝阳中路29号寿康华悦城购物中心1F-09', '32.6474', '110.78335', '十堰市朝阳中路贵州茅台专卖店', '十堰市酒类专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2418, '111110221001', '北京市', '北京市', '昌平区', '北京市昌平区龙水路26号楼西侧01号1-2层', '40.213999', '116.259937', '北京市龙水路贵州茅台专卖店', '北京市奥盛泽兴糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2419, '143300001002', '山西省', '晋中市', '榆次区', '晋中市榆次区汇通路贵州茅台专卖店', '37.701774', '112.719666', '晋中市榆次区汇通路贵州茅台专卖店', '晋中黔晋商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2420, '137370400001', '山东省', '枣庄市', '薛城区', '枣庄市薛城区山东省枣庄市薛城区新城街道嘉豪国际时代广场B栋102号门市', '34.804803', '117.3109', '枣庄市新城街道贵州茅台专卖店', '滕州市醴泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2421, '137370400002', '山东省', '枣庄市', '薛城区', '枣庄市薛城区光明西路光明花苑5号楼东单元102门市', '34.808005', '117.281683', '枣庄市光明西路贵州茅台专卖店', '山东万兴商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2422, '133330381001', '浙江省', '温州市', '瑞安市', '温州市瑞安市莘塍街道锦佳华庭万松东路552号', '27.778394', '120.670525', '瑞安市万松东路贵州茅台专卖店', '瑞安市大台发贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2423, '34110105083004001', '重庆市', '重庆市', '渝北区', '重庆市渝北区仙桃街道舟济路38号19—2—A66', '29.719223', '106.601694', '重庆华酱源商贸有限公司中心库', '重庆华酱源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2424, '2145060210001', '广西壮族自治区', '防城港市', '港口区', '防城港市港口区行政中心区乐天花园小区E10#', '21.686005', '108.365545', '防城港市乐天花园小区广西防城港市诚信贸易有限公司门店', '广西防城港市诚信贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2425, 'B36011300101', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区江西省南昌市红谷滩区会展路888号熙梦里购物中心室内1层1F014(2-105、2-106)', '28.690366', '115.84729', '南昌市红谷滩区会展路888号贵州茅台旗舰店', '江西省茅小凌食品销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2426, '22360100030001', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区怡园路535号世纪中央城商铺4栋一楼店面112室', '28.681562', '115.84819', '红谷滩区怡园路茅台酱香万家共享主题终端', '南昌市御久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2427, '23511382004005', '四川省', '南充市', '顺庆区', '南充市顺庆区四川省南充市顺庆区金鱼岭路573号', '30.81508', '106.097438', '顺庆区金鱼岭路贵州茅台酱香系列酒体验中心', '南充宗阳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2428, '23110105074075', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来绿色家园来春园37号楼1层106内3号', '40.036176', '116.439052', '朝阳区朝来绿色家园贵州茅台酱香系列酒体验中心', '北京盛扬国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2429, '2351060000003', '四川省', '德阳市', '旌阳区', '德阳市旌阳区湘江街156号', '31.140161', '104.389501', '德阳市茅台酱香万家共享主题终端', '德阳市龙鳞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2430, '100410400001', '河南省', '平顶山市', '卫东区', '平顶山市卫东区建设路中段24号宏升国际3#4#号楼底商', '33.735159', '113.328313', '平顶山市建设路中段贵州茅台专卖店', '平顶山市新诚信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2431, '151510100001', '四川省', '成都市', '青羊区', '成都市青羊区大安中路13号', '30.672837', '104.082685', '成都市大安中路贵州茅台专卖店', '成都花茅全通商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2432, '151510100002', '四川省', '成都市', '武侯区', '成都市武侯区航空二巷35号', '30.618197', '104.081175', '成都市航空二巷贵州茅台专卖店', '成都高扬商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2433, '151510100003', '四川省', '成都市', '武侯区', '成都市武侯区洗面桥街22号附1号附2号', '30.63972', '104.055876', '成都市洗面桥街贵州茅台专卖店', '成都金久达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2434, '151510100005', '四川省', '成都市', '天府新区', '成都市天府新区华阳街道瑞祥路944号、946号、948号、950号', '30.472747', '104.034329', '成都市瑞祥路贵州茅台专卖店', '成都市芷歆颐商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2435, '151510100006', '四川省', '成都市', '武侯区', '成都市武侯区大石西路223号一层、225号一层', '30.650765', '104.030825', '成都市大石西路贵州茅台专卖店', '成都佳祥佳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2436, '151510100007', '四川省', '成都市', '青羊区', '成都市青羊区人民中路三段1号2栋5、6、7号', '30.672541', '104.068921', '成都市人民中路贵州茅台专卖店', '四川正天国品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2437, '2142068510001', '湖北省', '襄阳市', '老河口市', '襄阳市老河口市天河路御景天下商铺2一101号', '32.378873', '111.672137', '老河口市浩元商贸有限公司门店', '老河口市浩元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2438, '151510100008', '四川省', '成都市', '金牛区', '成都市金牛区兴平路100号1栋1层1号', '30.719257', '104.005975', '成都市兴平路贵州茅台专卖店', '成都唐文坊贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2439, '2315020000001', '内蒙古自治区', '包头市', '青山区', '包头市青山区青东东路保利花园溪水园11-150', '40.64565', '109.907505', '包头市青东东路茅台酱香万家共享主题终端', '内蒙古中饮诚汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2440, '2332109000001', '江苏省', '扬州市', '高邮市', '扬州市高邮市屏淮路92号(玉檀苑19-4)', '32.771949', '119.456862', '高邮市屏淮路茅台酱香万家共享主题终端', '扬州市猎豹电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2441, '2344540300001', '广东省', '揭阳市', '榕城区', '揭阳市榕城区临江南路中段榕江-品馨园122号铺', '23.542592', '116.377959', '揭阳市临江南路茅台酱香万家共享主题终端', '揭阳市骏亿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2442, '21310111004005', '上海市', '上海市', '松江区', '上海市松江区上海市松江区九干路165号', '31.126558', '121.289867', '上海皇家酱香主题终端自有门店', '上海皇家酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2443, '2146010410001', '海南省', '海口市', '美兰区', '海口市美兰区海口市美兰区海甸岛五西路80号蓝色海岸D栋1层 103', '20.068452', '110.316347', '海口市海甸五西路海口可喜可嘉贸易有限公司门店', '海口可喜可嘉贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2444, '122220800002', '吉林省', '长春市', '二道区', '长春市二道区吉林大路4055号', '43.882949', '125.400411', '长春市吉林大路贵州茅台专卖店', '长春市九台区酒源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2445, '22510187003001', '四川省', '成都市', '郫都区', '成都市郫都区四川省成都市郫都区安靖街道土柏村土柏路199号', '0.0', '0.0', '安靖街道土柏村土柏路茅台酱香万家共享主题终端', '成都市博杰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2446, '22140186007001', '山西省', '太原市', '万柏林区', '太原市万柏林区长风西街街道南上庄街上庄凤玺湾4号楼南侧101号底商', '37.823163', '112.518244', '万柏林区南上庄街茅台酱香万家共享主题终端', '山西金百顺贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2447, '22620100040010', '甘肃省', '兰州市', '城关区', '兰州市城关区甘肃省兰州市城关区青白石街道青石路2043号', '36.11481', '103.906472', '城关区青白石街道青石路茅台酱香万家共享主题终端', '兰州国宇酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2448, '150500106001', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区都市花园西路9号附23号-27号', '29.540171', '106.450415', '重庆市都市花园西路贵州茅台专卖店', '重庆江岸酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2449, '151510124001', '四川省', '成都市', '郫都区', '成都市郫都区红光街道港大路39号优派立方4幢1层 39、40、41号', '30.788633', '103.929227', '成都市港大路贵州茅台专卖店', '成都幸福一生酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2450, '122220800003', '吉林省', '白城市', '洮北区', '白城市洮北区保平街道光明北街38楼-6', '45.62294', '122.812735', '白城市光明北街贵州茅台专卖店', '白城市复兴商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2451, '520424001', '贵州省', '安顺市', '关岭布依族苗族自治县', '安顺市关岭布依族苗族自治县龙潭街道万豪商业广场1栋正二层002、003号', '25.936644', '105.619197', '贵州信达致诚酒业有限公司中心库', '贵州信达致诚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2452, '150500106003', '重庆市', '重庆市', '沙坪坝区', '重庆市沙坪坝区大学城中路20号附40号1-7', '29.592529', '106.307612', '重庆市大学城中路贵州茅台专卖店', '重庆国誉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2453, '252520183019', '贵州省', '贵阳市', '南明区', '贵阳市南明区解放路金龙滨河湾壹号B栋一层2、3号商铺', '26.564656', '106.699207', '贵阳市解放路贵州茅台专卖店（金龙滨河湾壹号）', '贵州同城生活商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2454, '341702001', '安徽省', '池州市', '贵池区', '池州市贵池区秋浦影剧院北侧君悦广场一期 3 幢15010、15011', '30.687436', '117.568363', '池州市君悦名汇商贸有限公司中心库', '池州市君悦名汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2455, '2137130010003', '山东省', '临沂市', '兰山区', '临沂市兰山区北城新区沂蒙路与上海路交汇东200米路北', '35.105692', '118.348523', '临沂市沂蒙路临沂市兰山区智和百货商行门店', '临沂市兰山区智和百货商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2456, '2313082900001', '河北省', '唐山市', '路北区', '唐山市路北区新华西道21号副1号', '39.625917', '118.171607', '唐山市新华西道茅台酱香万家共享主题终端', '唐山龙悦酒业饮品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2457, '22410900009001', '河南省', '濮阳市', '濮阳县', '濮阳市濮阳县人民路与濮上路交叉口向东200米路北', '35.762361', '115.012937', '濮阳市人民路茅台酱香万家共享主题终端', '濮阳永辉跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2458, '2137130010004', '山东省', '临沂市', '兰陵县', '临沂市兰陵县育才路金鼎国际沿街圣玺商贸', '34.87220497', '118.07118952', '兰陵县文峰路兰陵县东唐酒行门店', '兰陵县东唐酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2459, '2337150000001', '山东省', '聊城市', '茌平区', '聊城市茌平区振兴街道枣乡街东正泰6B商业楼1号商铺', '36.594614', '116.2427198', '聊城市振兴街道茅台酱香万家共享主题终端', '聊城易百亿物资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2460, '252520183018', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区长岭街道金朱路金融中心二期住宅项目A7组团1-11栋负1-42、43、44号门面', '26.655033', '106.657142', '贵阳市同城南路贵州茅台专卖店', '贵州黔鸿顺达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2461, '252520183015', '贵州省', '贵阳市', '南明区', '贵阳市南明区小碧乡多彩贵州城节庆街道项目一期水街F组团2层7号-16号', '26.53089', '106.787662', '贵阳市多彩贵州城贵州茅台专卖店', '贵阳金诚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2462, '151511530001', '四川省', '宜宾市', '翠屏区', '宜宾市翠屏区金沙江北路东段贵州茅台专卖店', '28.745689', '104.596727', '宜宾市新中路贵州茅台专卖店', '宜宾隆凡商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2463, '113131086001', '河北省', '廊坊市', '广阳区', '廊坊市广阳区华祥路与汇源道交口东南角', '39.571305', '116.772575', '廊坊市华祥路贵州茅台专卖店', '廊坊市凯柏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2464, '232320100001', '江苏省', '南京市', '建邺区', '南京市建邺区燕山路169号', '32.003873', '118.722027', '南京市燕山路贵州茅台专卖店', '南京国策酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2465, '2153018610001', '云南省', '昆明市', '宜良县', '昆明市宜良县匡远街道办五佰户营蓬莱大道689号商铺', '24.917687', '103.143252', '宜良县环城西路昆明万振商贸有限公司门店', '昆明融展振富商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2466, '151511100001', '四川省', '乐山市', '市中区', '乐山市市中区人民西路158-166号', '29.567164', '103.760774', '乐山市人民西路贵州茅台专卖店', '乐山市金樽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2467, '133330782002', '浙江省', '金华市', '义乌市', '金华市义乌市江东东路126号', '29.307192', '120.107476', '义乌市江东东路贵州茅台专卖店', '义乌市歌画酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2468, '133330782003', '浙江省', '金华市', '义乌市', '金华市义乌市稠江街道贝村路107号', '29.301348', '120.061989', '义乌市贝村路贵州茅台专卖店', '义乌市泓谕贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2469, '2261010000003', '陕西省', '西安市', '莲湖区', '西安市莲湖区报恩寺街88号303~1号', '34.252139', '108.933209', '西安市报恩寺街贵州茅台酱香系列酒体验中心', '西安成城裕朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2470, '2261010000002', '陕西省', '西安市', '雁塔区', '西安市雁塔区雁塔西路6号美居酒店1层', '34.217914', '108.954264', '西安市雁塔西路贵州茅台酱香系列酒体验中心', '陕西华鼎酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2471, '142420900004', '湖北省', '孝感市', '孝南区', '孝感市孝南区坤大道乾坤阳光42栋107室、108室', '30.915727', '113.947857', '孝感市乾坤大道贵州茅台专卖店', '湖北和丰经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2472, '142420900005', '湖北省', '孝感市', '孝南区', '孝感市孝南区黄香路中都巴黎城9栋116号117号商铺', '30.908756', '113.962263', '孝感市黄香路贵州茅台专卖店', '孝感市文利峰酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2473, '22640100024001', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区兴庆府大院6号楼1号营业房', '38.493387', '106.271686', '兴庆区天平街茅台酱香万家共享主题终端', '宁夏宁致商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2474, '131310110001', '上海市', '上海市', '杨浦区', '上海市杨浦区政高路1号01A商铺（天盛科创广场）', '31.309471', '121.509694', '上海市政高路贵州茅台专卖店', '上海天朗酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2475, '22120400006001', '天津市', '天津市', '滨海新区', '天津市滨海新区杭州街道河北路2275号', '39.032599', '117.663657', '滨海新区杭州街道河北路茅台酱香万家共享主题终端', '天津顶立宏业进出口贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2476, 'B110118001002', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2477, '34440300083001001', '山东省', '济南市', '槐荫区', '济南市槐荫区山东省济南市槐荫区泰安路887号恒大雅苑8-1地块商务办公B座2008室', '36.682358', '116.898806', '山东华昱德泰酒业有限公司中心库', '山东华昱德泰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2478, '100411400001', '河南省', '商丘市', '睢阳区', '商丘市睢阳区香君路与学院路交叉口西20米路北阳平里第一排', '34.394818', '115.66396', '商丘市香君路贵州茅台专卖店', '商丘市纳鑫商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2479, '252520183007', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区贵旅大厦一楼商铺1-1号房', '26.594074', '106.706582', '贵阳市北京路贵州茅台专卖店', '贵阳玉贝商务有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2480, '23150200005001', '内蒙古自治区', '包头市', '青山区', '包头市青山区科学路与民主路交叉口往南80米路东富华公馆底店S2-S06-S07', '40.65044', '109.89582', '青山区民主路贵州茅台酱香系列酒体验中心', '包头市蒙泉贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2481, '22310104004001', '上海市', '上海市', '徐汇区', '上海市徐汇区石龙路987-1号', '31.147548', '121.429775', '徐汇区长桥街道茅台酱香万家共享主题终端', '贵州经典名特优产品经营有限公司上海分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2482, '151510100020', '四川省', '成都市', '高新区', '成都市高新区锦城大道50号', '30.576084', '104.074206', '成都市锦城大道贵州茅台自营店', '四川国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2483, '252520183002', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区三桥路街道三马片区万科麓山（C9）1层12号', '26.59469', '106.64036', '贵阳市北京西路贵州茅台专卖店', '贵州隆元乾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2484, '151510100021', '四川省', '成都市', '双流区', '成都市双流区剑南大道南段3083号', '30.486657', '104.034142', '成都市剑南大道南段贵州茅台专卖店', '成都君宏天珩贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2485, '252520183003', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区黔灵镇杨柳湾住宅小区负4层4-6号', '26.610239', '106.727362', '贵阳市杨柳湾路贵州茅台专卖店', '贵州省糖业烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2486, '151510100022', '四川省', '成都市', '武侯区', '成都市武侯区佳悦路10号/12号/14号', '30.62777', '104.009854', '成都市佳悦路贵州茅台专卖店', '成都嘉盛长盈商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2487, '22321093003001', '江苏省', '扬州市', '仪征市', '扬州市仪征市真州东路23-8号', '119.193248', '32.281399', '仪征市真州镇茅台酱香万家共享主题终端', '仪征市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2488, '2237158300001', '山东省', '聊城市', '市辖区', '聊城市市辖区滦河路百利园中小微企业创意创业园B区', '36.462703', '116.062215', '聊城市滦河路贵州茅台酱香系列酒体验中心', '聊城市佳科达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2489, '34410100087015001', '河南省', '周口市', '淮阳县', '周口市淮阳县1', '33.731543', '114.852604', '周口市淮阳区增齐商贸商行中心库', '周口市淮阳区增齐商贸商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2490, '103702120001', '山东省', '青岛市', '崂山区', '青岛市崂山区秦岭路19号楼1025号', '36.100577', '120.468239', '青岛市秦岭路贵州茅台自营店', '山东国酒茅台销售有限公司青岛分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2491, '142420137001', '湖北省', '武汉市', '黄陂区', '武汉市黄陂区百秀街黄陂人-信城西北侧约50米', '30.892516', '114.371496', '武汉市百秀街贵州茅台专卖店', '武汉市华源森迪商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2492, '141410423001', '河南省', '平顶山市', '鲁山县', '平顶山市鲁山县尧山大道与鲁班路交叉口', '33.72437', '112.920145', '鲁山县尧山大道贵州茅台专卖店', '鲁山县盛源鑫地商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2493, '252520383015', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区东欣大道原创贵州学府1号7、8号楼商业1-1', '27.665008', '106.891157', '遵义市东欣大道贵州茅台专卖店', '贵州遵义轩睿商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2494, '132320100001', '江苏省', '南京市', '玄武区', '南京市玄武区玄武区中央路220号', '32.073977', '118.784325', '南京市中央路贵州茅台专卖店', '南京龙沐神酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2495, '132320100002', '江苏省', '南京市', '玄武区', '南京市玄武区龙蟠中路93号一楼', '32.048772', '118.806543', '南京市龙蟠中路贵州茅台专卖店', '江苏苏糖烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2496, '137372301003', '山东省', '滨州市', '滨城区', '滨州市滨城区滨州市黄河八路与渤海十路交叉口东南角沿街商铺（贵州茅台）', '37.391472', '118.000969', '滨州市黄河八路贵州茅台专卖店', '滨州天士力商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2497, '231310106001', '上海市', '上海市', '黄浦区', '上海市黄浦区淮海中路917,921号', '31.217092', '121.460132', '上海市淮海中路贵州茅台专卖店', '上海海烟物流发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2498, '132320100007', '江苏省', '南京市', '建邺区', '南京市建邺区吴侯街167号', '31.96565', '118.697649', '南京市吴侯街贵州茅台专卖店', '南京裕佰鑫百货贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2499, '22411082002001', '河南省', '许昌市', '长葛市', '许昌市长葛市金英路南段樱之新城西门', '34.196928', '113.794438', '长葛市金英路南段茅台酱香万家共享主题终端', '长葛市颐润商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2500, '2245023000002', '广西壮族自治区', '柳州市', '城中区', '柳州市城中区高新五路21号荣和天誉17号楼-层120/121/122/123/110/111商铺', '24.350637', '109.425778', '柳州市高新五路贵州茅台酱香系列酒体验中心', '柳州市金樽商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2501, '211110108002', '北京市', '北京市', '西城区', '北京市西城区西城区文兴街1号科研楼9层908', '39.936315', '116.337306', '北京友谊使者商贸有限公司', '北京友谊使者商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2502, '211110108001', '北京市', '北京市', '朝阳区', '北京市朝阳区卷石天地大厦1号楼1层3-03内102、103', '39.983615', '116.458227', '北京市望京西路贵州茅台专卖店（卷石天地大厦）', '北京京糖酒类经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2503, '234340400001', '安徽省', '淮南市', '田家庵区', '淮南市田家庵区洞山中路2081号上郑广场商务中心', '32.629399', '117.028714', '淮南市洞山中路贵州茅台专卖店', '淮南市勤信商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2504, '2315310400001', '内蒙古自治区', '赤峰市', '红山区', '赤峰市红山区首地红山郡1-1-1-2块地商业楼3-103商厅', '42.238774', '118.914652', '赤峰市首地红山郡茅台酱香万家共享主题终端', '红山区天禄酒城', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2505, '532500001', '云南省', '红河哈尼族彝族自治州', '开远市', '红河哈尼族彝族自治州开远市落云路泸江三期302幢20号', '23.716232', '103.252662', '开远优旺商贸有限公司中心库', '开远优旺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2506, '2245030000001', '广西壮族自治区', '桂林市', '临桂区', '桂林市临桂区凤凰路地王国际1栋08-09-10号商铺', '25.238971', '110.164499', '桂林市凤凰路贵州茅台酱香系列酒体验中心', '桂林市开元酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2507, '2335220200005', '福建省', '龙岩市', '新罗区', '龙岩市新罗区西陂街道条围村水晶兰天', '25.08185', '117.018275', '龙岩市西陂街道茅台酱香万家共享主题终端', '福建华永贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2508, '2335220200006', '福建省', '莆田市', '秀屿区', '莆田市秀屿区笏石镇后井街365号', '25.318955', '119.100679', '莆田市笏石镇后井街茅台酱香万家共享主题终端', '莆田市佰诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2509, '134343005001', '安徽省', '亳州市', '谯城区', '亳州市谯城区康美中药城J3-120号', '33.818808', '115.792552', '亳州市建安路贵州茅台专卖店', '亳州市鹏翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2510, '252520383004', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区解放路81号', '27.690255', '106.917886', '遵义市解放路贵州茅台专卖店', '遵义宾馆有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2511, '252520383005', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区白杨路调度大楼附楼1幢1层', '27.680901', '106.925637', '遵义市白杨路贵州茅台专卖店', '遵义腾星电力有限责任公司名酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2512, '252520383006', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区忠庄街道银河北路桃溪河畔四期-1-169-170门面', '27.670799', '106.88736', '遵义市银河北路贵州茅台专卖店', '贵州金利商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2513, '34410100087003001', '河南省', '商丘市', '柘城县', '商丘市柘城县1', '34.092015', '115.305182', '柘城盛林商贸有限公司中心库', '柘城盛林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2514, '137370200011', '山东省', '青岛市', '城阳区', '青岛市城阳区正阳路187-5号', '36.306391', '120.404567', '青岛市正阳路贵州茅台专卖店', '青岛龙华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2515, '152520330002', '贵州省', '遵义市', '习水县', '遵义市习水县贵州省遵义市习水县东皇街道大陆村公园路黔北商贸中心20栋1层2-3-4-5号', '28.301272', '106.213313', '习水县公园路贵州茅台专卖店', '习水县财源酒业营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2516, '2221040000001', '辽宁省', '抚顺市', '顺城区', '抚顺市顺城区新城东路9号楼1单元M11号门市', '41.883353', '123.949543', '抚顺市新城东路贵州茅台酱香系列酒体验中心', '抚顺天朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2517, '22110106018001', '北京市', '北京市', '丰台区', '北京市丰台区华源四里7号楼1至2层7106', '39.88', '116.32', '丰台区太平桥路茅台酱香万家共享主题终端', '北京诚实文祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2518, '132320100017', '江苏省', '南京市', '鼓楼区', '南京市鼓楼区江东北路58-7、58-8号', '32.043306', '118.739809', '南京市江东北路贵州茅台自营店', '江苏国酒茅台有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2519, '2337072400002', '山东省', '潍坊市', '临朐县', '潍坊市临朐县东镇路与创博城南路交叉路口西20米路南', '36.49217', '118.58152', '临朐县东镇路茅台酱香万家共享主题终端', '临朐亿隆经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2520, '132321403002', '江苏省', '泰州市', '泰兴市', '泰州市泰兴市国庆东路168号新世界广场一区（2号地块）商业2幢109室', '32.17331321917852', '120.0596590650728', '泰兴市国庆东路贵州茅台专卖店', '泰兴市瑞久源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2521, '211110108011', '北京市', '北京市', '石景山区', '北京市石景山区鲁谷路136号院1号楼1层116', '39.903696', '116.211538', '北京市鲁谷路贵州茅台专卖店', '北京中材国建商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2522, '2337072400001', '山东省', '潍坊市', '临朐县', '潍坊市临朐县新华路莱茵名都沿街26幢', '36.51302', '118.55084', '临朐县新华路茅台酱香万家共享主题终端', '临朐亿隆经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2523, '142420884001', '湖北省', '荆门市', '东宝区', '荆门市东宝区象山大道113号', '31.020132', '112.198186', '荆门市象山大道113号贵州茅台专卖店', '荆门市玉液醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2524, '211110108013', '北京市', '北京市', '海淀区', '北京市海淀区紫竹院路116号A座商业03', '39.947199', '116.291907', '北京市紫竹院路贵州茅台专卖店', '北京东阳华泰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2525, '130400010002', '河北省', '邯郸市', '丛台区', '邯郸市丛台区邯郸市联纺东路东城悦府2号楼底商', '36.624534', '114.527328', '邯郸市联纺路贵州茅台专卖店', '邯郸市赛超商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2526, '211110108014', '北京市', '北京市', '海淀区', '北京市海淀区法华寺路22号', '39.951363', '116.314463', '北京市法华寺路贵州茅台专卖店', '中协宾馆', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2527, '250500384001', '重庆市', '重庆市', '南川区', '重庆市南川区西城街道办事处永隆路20号', '29.164064', '107.078458', '重庆市永隆路贵州茅台专卖店', '重庆市南川区国玖香商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2528, '2444441481001', '广东省', '梅州市', '兴宁市', '梅州市兴宁市毅德城一号交易广场41栋5Ｂ', '24.106572', '115.732783', '兴宁市毅德城一号交易广场贵州茅台专卖店', '兴宁市红成百货食品商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2529, '340800007', '安徽省', '安庆市', '宜秀区', '安庆市宜秀区宜秀区迎宾东路北侧大发融悦A区20幢1层2室', '30.543545', '117.099674', '安庆百川经典商贸有限公司中心库', '安庆百川经典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2530, '2335220200001', '福建省', '漳州市', '龙海市', '漳州市龙海市榜山镇平宁南路祥云豪庭5幢9号33', '24.4381', '117.807291', '漳州市榜山镇茅台酱香万家共享主题终端', '漳州市广进财贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2531, '141410188002', '河南省', '郑州市', '管城回族区', '郑州市管城回族区东明路御玺大厦', '34.748401', '113.699724', '郑州市东明路贵州茅台专卖店', '河南御玺酒店有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2532, '231310500001', '上海市', '上海市', '长宁区', '上海市长宁区协和路1358号', '31.228276', '121.354132', '上海市协和路贵州茅台专卖店', '上海东方国信经济发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2533, '2335220200002', '福建省', '厦门市', '湖里区', '厦门市湖里区金钟路1-138号', '24.502199', '118.178052', '厦门市金钟路茅台酱香万家共享主题终端', '厦门市古窖香商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2534, '141410188001', '河南省', '郑州市', '管城回族区', '郑州市管城回族区朝凤路美景芳华8号楼105商铺', '34.704016', '113.741907', '郑州市朝凤路贵州茅台专卖店', '河南仁商商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2535, '131310109003', '上海市', '上海市', '虹口区', '上海市虹口区汶水东路917号12幢103室', '31.293493', '121.465492', '上海市汶水东路贵州茅台专卖店', '上海汉帝酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2536, '2331011100001', '上海市', '上海市', '松江区', '松江区松江区上海市松江区泗泾镇九干路165号', '31.126704', '121.28981', '上海市泗泾镇茅台酱香万家共享主题终端', '上海皇家酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2537, '2152252610001', '贵州省', '安顺市', '平坝区', '安顺市平坝区安平街道平黎大道中段锦绣园1栋1层4号商铺', '26.398803', '106.268934', '安顺市平黎大道安顺市平坝区钦杨烟酒店门店', '贵州钦杨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2538, '22320282003004', '江苏省', '无锡市', '宜兴市', '无锡市宜兴市宜兴市宜城街道解放东路563-1、565-1号', '31.353588', '119.85054', '宜兴解放东路茅台酱香万家共享主题终端', '无锡市牧康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2539, '22320282003005', '江苏省', '无锡市', '宜兴市', '无锡市宜兴市宜兴市丁蜀镇双龙西路314、316、318号', '31.263489', '119.842713', '宜兴丁蜀镇双龙西路茅台酱香万家共享主题终端', '无锡市牧康商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2540, '2132118310001', '江苏省', '镇江市', '句容市', '镇江市句容市句容市福地路福地生鲜汇内第二幢', '31.969778', '119.165792', '句容市福地路句容经济开发区心和商贸经营部门店', '句容经济开发区心和商贸经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2541, '225201820001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区云潭街道云潭路西侧银海元隆熙府C1栋1层4号', '26.625357', '106.608041', '贵阳市云潭南路贵州茅台酱香系列酒体验中心', '贵阳嘉元惠沣贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2542, '253530188002', '云南省', '昆明市', '呈贡区', '昆明市呈贡区林溪路庆沣祥茶城3-4号商铺', '24.950034', '102.836342', '昆明市林溪路贵州茅台专卖店', '昆明尼慕商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2543, '211110225001', '北京市', '北京市', '房山区', '北京市房山区拱辰街道天星街1号院6号楼718', '39.75542', '116.161969', '北京市天星街贵州茅台43度经销店', '北京嘉诚利发糖酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2544, '2113032510001', '河北省', '秦皇岛市', '海港区', '秦皇岛市海港区文博城底商8-1号', '39.946036', '119.57374', '秦皇岛市文博城秦皇岛市秦皇岛耿直商贸有限公司门店', '秦皇岛耿直商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2545, '2341138200001', '河南省', '南阳市', '卧龙区', '南阳市卧龙区人民路与张衡路交叉口向北200米路西', '33.0256', '112.538499', '南阳市人民路茅台酱香万家共享主题终端', '南阳市天达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2546, '22440100084001', '广东省', '广州市', '黄埔区', '广州市黄埔区云埔街道榕悦三街7#9#11#106房', '23.11', '113.55', '黄埔区云埔街道榕悦三街茅台酱香万家共享主题终端', '广州市龙泉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2547, '22650100011002', '新疆维吾尔自治区', '乌鲁木齐市', '米东区', '乌鲁木齐市米东区广兴西街1869号37栋1层', '43.951174', '87.638871', '米东区广兴西街茅台酱香万家共享主题终端', '乌鲁木齐玖泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2548, '141410586001', '河南省', '安阳市', '文峰区', '安阳市文峰区高新区黄河大道与东风路交叉口东北角新华学府2号楼103号', '36.06292', '114.36433', '安阳市黄河大道贵州茅台专卖店', '安阳福顺德商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2549, '2332140300001', '江苏省', '泰州市', '泰兴市', '泰州市泰兴市星火路350号', '30.392876', '120.251246', '泰兴市星火路茅台酱香万家共享主题终端', '泰兴市富煌酒业商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2550, '145453003001', '广西壮族自治区', '崇左市', '扶绥县', '崇左市扶绥县新宁镇空港大道11号东信华府一期17号楼110商铺', '22.604584', '107.923176', '扶绥县空港大道贵州茅台专卖店', '广西五福酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2551, '151510181001', '四川省', '成都市', '都江堰市', '成都市都江堰市都江堰大道252-254号', '30.987959', '103.646003', '都江堰市都江堰大道贵州茅台专卖店', '都江堰市酒久九商贸中心', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2552, '2121020010001', '辽宁省', '大连市', '旅顺口区', '大连市旅顺口区自新街17-7号', '38.807576', '121.262548', '大连市自新街大连京玉商贸有限公司门店', '大连京玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2553, '22650100011001', '新疆维吾尔自治区', '乌鲁木齐市', '米东区', '乌鲁木齐市米东区新疆维吾尔自治区乌鲁木齐市米东区米东南路1916号26栋1层101号（碧桂园小区）', '43.902911', '87.62858', '米东区文思街茅台酱香万家共享主题终端', '乌鲁木齐玖泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2554, '144445602003', '广东省', '江门市', '新会区', '江门市新会区同德一路33号', '22.514061', '113.056865', '江门市同德一路贵州茅台专卖店', '江门市深星贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2555, '22445504004001', '广东省', '中山市', '西区', '中山市西区彩虹社区金港路6号时代金沙雅苑2幢116卡', '22.5599', '113.3422', '西区金港路茅台酱香万家共享主题终端', '中山市鹏润贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2556, '22500112029001', '重庆市', '重庆市', '渝北区', '重庆市渝北区双凤桥街道桃源大道363号附14号', '29.74', '106.63', '渝北区桃源大道茅台酱香万家共享主题终端', '渝北区久韵酒类经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2557, '2351092200001', '四川省', '遂宁市', '射洪市', '遂宁市射洪市紫云-号2号楼1号门面', '30.872679', '105.372223', '射洪市紫云一号茅台酱香万家共享主题终端', '射洪市新一佳商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2558, '145450981001', '广西壮族自治区', '玉林市', '北流市', '玉林市北流市北流市北流镇永安西路63号圣力商业广场2号商业住宅楼2-06号商铺', '22.690333', '110.341547', '北流市永安西路贵州茅台专卖店', '北流市胜源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2559, '2342910000001', '湖北省', '随州市', '曾都区', '随州市曾都区迎宾大道滨湖湾二期门面166号（滨湖湾加油站往南100米）', '31.697195', '113.389101', '随州市迎宾大道茅台酱香万家共享主题终端', '随州市井源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2560, '252520183053', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区北京路68号贵州省人民大会堂配套五星级酒店综合楼工程33、34层', '26.594113', '106.7066', '贵阳市北京路贵州茅台特约经销店', '贵州惠群商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2561, '132320124001', '江苏省', '南京市', '溧水区', '南京市溧水区宝塔路秦淮缘小区6幢107室', '31.664149', '119.021903', '南京市宝塔路贵州茅台专卖店', '江苏三乔酒业有限公司溧水分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2562, '252520183052', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区长岭北路中天会展城A2组团A2-2-A2-4负1层8B、8C、8D', '26.636895', '106.647776', '贵阳市长岭北路贵州茅台专卖店', '贵州天浆酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2563, '2132048510001', '江苏省', '常州市', '钟楼区', '常州市钟楼区怀德北路73号', '31.788654', '119.951049', '常州市怀德北路江苏大隆汇文化科技股份有限公司门店', '江苏大隆汇文化科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2564, '22510100078001', '四川省', '成都市', '成华区', '成都市成华区四川省成都市成华区建和路6号附39号', '30.67393494', '104.1122589', '建和路茅台酱香万家共享主题终端', '成都仁品酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2565, '22420126007009', '湖北省', '武汉市', '洪山区', '武汉市洪山区洪山区北港村丁字桥南路三元时代广场1单元1层4、5、14、15室', '30.501589', '114.413606', '洪山区丁字桥南路茅台酱香万家共享主题终端', '湖北酱星酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2566, '22420126007008', '湖北省', '武汉市', '洪山区', '武汉市洪山区洪山区北港村丁字桥南路三元时代广场1单元1层4、5、14、15室', '30.501589', '114.413606', '洪山区丁字桥南路茅台酱香万家共享主题终端', '湖北酱星酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2567, '441601001', '广东省', '河源市', '市辖区', '河源市市辖区永和路北面、华达街北面东边壹号教育城3栋125号2楼', '23.001019', '114.738446', '河源市嘉臻商贸有限公司中心库', '河源市嘉臻商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2568, '151510300001', '四川省', '自贡市', '自流井区', '自贡市自流井区绿盛电梯公寓5栋8号', '29.326804', '104.785052', '自贡市汇川路贵州茅台专卖店', '自贡市乐邦糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2569, '2314032300001', '山西省', '阳泉市', '城区', '阳泉市城区佳园小区底商8号', '37.858759', '113.592125', '阳泉市佳园小区茅台酱香万家共享主题终端', '利华臻品供应链（山西）有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2570, '232321401001', '江苏省', '泰州市', '兴化市', '泰州市兴化市昭阳街道花园路89号', '32.928814', '119.839664', '兴化市花园路贵州茅台43度经销店', '兴化鑫鼎酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2571, '2152242810003', '贵州省', '毕节市', '七星关区', '毕节市七星关区滨河西路碧阳派出所下行200米', '27.286138', '105.29656', '毕节市滨河西路众意商贸有限责任公司门店', '毕节市众意商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2572, '133330327001', '浙江省', '温州市', '苍南县', '温州市苍南县灵溪镇车站大道415-417号', '27.518829', '120.41891', '苍南县车站大道贵州茅台专卖店', '温州市铭瀚酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2573, '142420381001', '湖北省', '十堰市', '茅箭区', '十堰市茅箭区武当路街办重庆路520号2幢1-2号、1-3号', '32.613471', '110.795674', '十堰市重庆路贵州茅台专卖店', '十堰市方雅物资贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2574, '141411100003', '河南省', '漯河市', '郾城区', '漯河市郾城区岷江路以南育才路以西嘉业城市花园三期14号楼14幢108号和109号', '33.598755', '114.027846', '漯河市岷江路贵州茅台专卖店', '漯河鹏博商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2575, '22330621002001', '浙江省', '绍兴市', '柯桥区', '绍兴市柯桥区柯桥万商路1031-1号', '30.07483', '120.469585', '柯桥区柯桥万商路茅台酱香万家共享主题终端', '绍兴尚品酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2576, '141411100002', '河南省', '漯河市', '源汇区', '漯河市源汇区建设路与泰山路交叉口东南角', '33.564516', '114.02486', '漯河市建设路贵州茅台专卖店', '漯河鑫科商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2577, '2341280100002', '河南省', '驻马店市', '驿城区', '驻马店市驿城区白桥路与天顺路交叉口西北角', '32.966684', '114.027384', '驻马店市白桥路茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2578, '2341280100004', '河南省', '驻马店市', '驿城区', '驻马店市驿城区骏马路通达小区大门口', '33.004655', '114.019225', '驻马店市骏马路茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2579, '2341280100003', '河南省', '驻马店市', '驿城区', '驻马店市驿城区置地大道与乐山路交叉口西北角', '33.001748', '114.02738', '驻马店市置地大道茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2580, '135350582001', '福建省', '泉州市', '晋江市', '泉州市晋江市梅岭街道世纪大道706号', '24.813796', '118.57262', '晋江市世纪大道贵州茅台专卖店', '晋江福黔酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2581, '2341280100006', '河南省', '驻马店市', '驿城区', '驻马店市驿城区骏马路与团结路交叉口西50米路南', '32.9912', '114.018329', '驻马店市团结路茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2582, '22532934001003', '云南省', '大理白族自治州', '洱源县', '大理白族自治州洱源县洱源县茈碧湖镇灵应路西侧广场家园2幢1层13号商铺', '26.114591', '99.964488', '大理市洱源县茅台酱香万家共享主题终端', '大理市泉源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2583, '2341280100005', '河南省', '驻马店市', '驿城区', '驻马店市驿城区经济开发区金雀路与文祥路交叉口向西50米路北', '32.997422', '114.010069', '驻马店市金雀路茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2584, '22532934001004', '云南省', '大理白族自治州', '南涧彝族自治县', '大理白族自治州南涧彝族自治县南涧彝族自治县南涧镇金龙路龙凤丽都11号地2-12号商铺', '25.046056', '100.525363', '大理市南涧县茅台酱香万家共享主题终端', '大理市泉源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2585, '2341280100008', '河南省', '驻马店市', '驿城区', '驻马店市驿城区天中山大道与雪松路交叉口西北角路西', '32.987412', '114.008816', '驻马店市天中山大道茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2586, '2261272400101', '陕西省', '榆林市', '榆阳区', '榆林市榆阳区长城路阳光紫郡西门A1商铺', '38.2699', '109.7560358', '榆林市长城路贵州茅台酱香系列酒体验中心', '榆林市鑫诚隆瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2587, '135350582002', '福建省', '泉州市', '晋江市', '泉州市晋江市安海镇鸿江东路535号、537号、539号、541号、543号店面', '24.721361', '118.495067', '晋江市安海镇鸿江东路贵州茅台专卖店', '厦门禹道实业集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2588, '252522638001', '贵州省', '黔东南苗族侗族自治州', '凯里市', '黔东南苗族侗族自治州凯里市文化南路8号', '26.580664', '107.985976', '凯里市文化南路贵州茅台专卖店', '黔东南州华凯酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2589, '2252253200001', '贵州省', '安顺市', '西秀区', '安顺市西秀区黄果树大街农信小区2栋1-7号铺', '26.251369', '105.977209', '安顺市黄果树大街贵州茅台酱香系列酒体验中心', '安顺市新天海酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2590, '2341280100007', '河南省', '驻马店市', '驿城区', '驻马店市驿城区解放路人民政府对面', '32.972866', '113.99559', '驻马店市解放路茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2591, '2151118210002', '四川省', '乐山市', '市中区', '乐山市市中区三苏路1006号', '29.604343', '103.726809', '市中区三苏路茅台酱香万家共享主题终端', '乐山市顺君商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2592, '2246020000001', '海南省', '三亚市', '吉阳区', '三亚市吉阳区荔枝沟路荣兴建材城万利城小区-楼商铺', '18.291398', '109.518218', '三亚市荔枝沟路贵州茅台酱香系列酒体验中心', '海南保棠贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2593, '2341280100009', '河南省', '驻马店市', '驿城区', '驻马店市驿城区交通路与天中山大道交叉口西北角', '32.979813', '114.009829', '驻马店市交通路茅台酱香万家共享主题终端', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2594, '252520183045', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市茅台镇游客集散中心三楼', '27.84', '106.38', '中国贵州茅台酒厂（集团）文化旅游有限责任公司', '中国贵州茅台酒厂（集团）文化旅游有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2595, '22543200003001', '四川省', '南充市', '顺庆区', '南充市顺庆区铁昌路165号', '30.804267', '106.080455', '顺庆区铁昌路茅台酱香万家共享主题终端', '南充市天辰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2596, '141411282001', '河南省', '三门峡市', '灵宝市', '三门峡市灵宝市河滨西路天仁爱丽舍小区东门7幢114商铺', '34.541981', '110.889263', '灵宝市河滨西路贵州茅台专卖店', '三门峡市华融食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2597, '2113019010001', '河北省', '石家庄市', '桥西区', '石家庄市桥西区平安南大街7号商会大厦406、407室', '38.041215', '114.502087', '石家庄市平安南大街石家庄军酱一苑商贸有限公司门店', '石家庄军酱一苑商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2598, '2152242810001', '贵州省', '毕节市', '赫章县', '毕节市赫章县城关镇解放东路', '27.122703', '104.728226', '赫章县城关镇解放东路赫章鸿运批发部门店', '赫章鸿运批发部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2599, '2351062300001', '四川省', '德阳市', '中江县', '德阳市中江县凯江镇星源路180号', '31.045044', '104.688332', '中江县凯江镇茅台酱香万家共享主题终端', '中江县强华商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2600, '2132120310001', '江苏省', '泰州市', '高港区', '泰州市高港区金港中路272号', '32.319304', '119.878743', '泰州市金港中路泰州市丰华烟酒有限公司门店', '泰州市华粹商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2601, '22532934001001', '云南省', '大理白族自治州', '大理市', '大理白族自治州大理市满江街道琪年时代商贸城二期4栋410号', '25.62', '100.28', '大理市满江街道茅台酱香万家共享主题终端', '大理市泉源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2602, '22532934001002', '云南省', '大理白族自治州', '大理市', '大理白族自治州大理市下关街道福文路39号惠丰新城诏园2幢1单元1-2层3号商铺', '25.57782', '100.226409', '大理市下关街道茅台酱香万家共享主题终端', '大理市泉源商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2603, '22530100069001', '', '', '', '', '0.0', '0.0', '', '昆明酱典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2604, '223425210001', '安徽省', '宣城市', '宣州区', '宣城市宣州区济川街道向阳路四季花城18幢3号', '30.937151', '118.768947', '宣城市佟公路贵州茅台酱香系列酒体验中心', '宣城市祥和商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2605, '22320983005001', '江苏省', '盐城市', '亭湖区', '盐城市亭湖区黄海东路与文港北路交叉口西140米', '33.401688', '120.151661', '亭湖区黄海东路茅台酱香万家共享主题终端', '盐城凯锐祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2606, 'Z520100265', '贵州省', '贵阳市', '花溪区', '贵阳市花溪区开发大道808号大数据创新中心9层', '26.449425', '106.711837', '贵阳市开发大道贵州茅台总经销店', '贵州同辉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2607, '142421000003', '湖北省', '荆州市', '沙市区', '荆州市沙市区塔桥北路与明珠大道交汇处直行50m', '30.341369', '112.252272', '荆州市明珠大道贵州茅台专卖店', '荆州区新飞天茅台酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2608, '121211000001', '辽宁省', '辽阳市', '白塔区', '辽阳市白塔区新兴街168-5号', '41.263325', '123.195841', '辽阳市新兴街贵州茅台专卖店', '辽阳醇香糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2609, '142421000001', '湖北省', '荆州市', '沙市区', '荆州市沙市区北京中路260号', '30.304267', '112.265575', '荆州市北京中路贵州茅台专卖店', '荆州市金慧铭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2610, '22130400008009', '河北省', '邯郸市', '武安市', '邯郸市武安市新华大街星河城东区A-4门市', '36.693172', '114.178984', '武安市武安镇尊益酒类经营店', '河北天腾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2611, '232321095001', '江苏省', '扬州市', '邗江区', '扬州市邗江区文昌西路456号（华城科技广场）1号楼102室', '32.391193', '119.382038', '扬州市文昌西路贵州茅台专卖店', '扬州风正经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2612, '132320136001', '江苏省', '南京市', '六合区', '南京市六合区大厂街道晓山路148号', '32.221208', '118.736541', '江苏省南京市江苏省南京市贵州茅台专卖店', '南京周窖坊商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2613, '22500383007002', '重庆市', '重庆市', '永川区', '重庆市永川区中山路街道人民西路16号附34号', '29.351533', '105.929985', '永川区人民西路茅台酱香万家共享主题终端', '重庆市沛泉酒类有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2614, '113130483001', '河北省', '邯郸市', '丛台区', '邯郸市丛台区联纺东路269号', '36.627392', '114.498588', '邯郸市联纺东路269号贵州茅台专卖店', '河北美食林商贸集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2615, '513400001', '四川省', '凉山彝族自治州', '西昌市', '凉山彝族自治州西昌市东城街道北碧府路102号外滩16区1幢1层商铺04号', '27.880061', '102.24039', '凉山州百鸟商贸有限公司中心库', '凉山州百鸟商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2616, '152520224001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区钟山区月照机场航站楼', '26.602674', '104.972724', '六盘水市月照机场贵州茅台专卖店', '六盘水月照机场有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2617, '152520385002', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区新舟镇遵义新舟机场航站楼一层', '27.807408', '107.250766', '遵义市机场大道贵州茅台专卖店', '遵义机场有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2618, '252520183033', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区中天未来方舟D5组团7号', '26.598759', '106.761444', '贵阳市水东路贵州茅台专卖店（未来方舟D5）', '贵州致优汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2619, '252520183034', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区贵州省贵阳市云岩区文昌阁街道省府路30号贵府1层40号', '26.580726', '106.716239', '贵阳市省府路贵州茅台专卖店', '贵州现代物流润丰贸易发展有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2620, '22445608003001', '广东省', '江门市', '新会区', '江门市新会区会城同德二路8号名苑华庭1座103', '22.513322', '113.052419', '新会区同德二路茅台酱香万家共享主题终端', '江门市凯盈酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2621, '252520183032', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区云潭路西侧银海元隆熙府', '26.625713', '106.60826', '贵阳市云潭路贵州茅台专卖店', '贵州兴正源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2622, '2151018710001', '四川省', '成都市', '青羊区', '成都市青羊区青羊区家园路80号', '30.661435', '104.013039', '成都市家园路成都富能达商贸有限公司门店', '成都富能达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2623, '22520383008001', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区遵义市新蒲新区新蒲街道美的云熙府S5#1-3', '27.704757', '107.044045', '新蒲街道美的云熙府茅台酱香万家共享主题终端', '贵州省遵义市宝诚元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2624, '22520383008002', '贵州省', '遵义市', '红花岗区', '遵义市红花岗区遵义市红花岗区长征街道白杨路白杨小区58幢1-5号', '27.679277', '106.930014', '长征街道白杨路白杨小区茅台酱香万家共享主题终端', '贵州省遵义市宝诚元商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2625, '2353010000002', '云南省', '昆明市', '西山区', '昆明市西山区金广路亚龙小区7-14号商铺', '25.00851085', '102.69094539', '昆明市金广路茅台酱香万家共享主题终端', '昆明水淼商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2626, '2431010900001', '上海市', '上海市', '闵行区', '闵行区闵行区上海市闵行区中春路7001号10号楼', '31.136395', '121.343851', '上海市中春路贵州茅台专卖店', '上海贵州茅台实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2627, '135350185001', '福建省', '福州市', '仓山区', '福州市仓山区建新南路155号-05', '26.025402', '119.268819', '福州市建新南路贵州茅台专卖店', '福州百年航港贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2628, '2152232510001', '贵州省', '黔西南布依族苗族自治州', '贞丰县', '黔西南布依族苗族自治州贞丰县贞丰县永丰街道办供电局对面', '25.387184', '105.645786', '贞丰县永丰街道贞丰县五五商贸有限公司门店', '贞丰县五五商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2629, '2341100000003', '河南省', '许昌市', '许昌市', '许昌市许昌市解放路北段294号', '33.929', '113.6892', '许昌市解放路茅台酱香万家共享主题终端', '许昌成跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2630, '2341100000004', '河南省', '许昌市', '魏都区', '许昌市魏都区文峰路鑫悦广场3号楼108-109号', '34.02', '113.83', '许昌市文峰路茅台酱香万家共享主题终端', '许昌成跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2631, '2341100000001', '河南省', '许昌市', '东城区', '许昌市东城区潩河北路赵湾小区门面房', '34.041', '113.84', '许昌市潩河北路茅台酱香万家共享主题终端', '许昌成跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2632, '370481003002', '山东省', '枣庄市', '滕州市', '枣庄市滕州市滕州市善国中路33号贵州茅台专卖店', '35.09325', '117.164556', '滕州市北辛街道贵州茅台专卖店', '滕州市盛誉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2633, '137370184001', '山东省', '济南市', '槐荫区', '济南市槐荫区齐鲁大道高铁西站候车大厅楼上茅台专卖店', '36.668917', '116.891354', '济南市济南西站贵州茅台专卖店', '济南嘉诚泰山名饮商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2634, '2341100000002', '河南省', '许昌市', '禹州市', '许昌市禹州市禹州市颍川街道滨河大道与药城路交叉口向东20米路南', '34.151652', '113.487177', '许昌市建设路茅台酱香万家共享主题终端', '许昌成跃商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2635, '34410100087024001', '河南省', '济源市', '济源市', '济源市济源市1', '35.069057', '112.602347', '济源市恒源百货商行中心库', '济源市恒源百货商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2636, '135350525001', '福建省', '泉州市', '永春县', '泉州市永春县永春县石鼓镇桃源南路907-173、907-175、907-176号', '25.319315', '118.277673', '泉州市桃源南路贵州茅台专卖店', '石狮市历记名酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2637, '2144020010003', '广东省', '韶关市', '武江区', '韶关市武江区沿江路16号南枫碧水花城二期建行旁汉酱酒', '24.781429', '113.589255', '韶关市沿江路韶关市好客贸易有限公司门店', '韶关市好客贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2638, '22511382004001', '四川省', '南充市', '顺庆区', '南充市顺庆区潆华北路一段141号', '30.845744', '106.079267', '顺庆区潆华北路茅台酱香万家共享主题终端', '南充宗阳商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2639, '2144020010001', '广东省', '韶关市', '武江区', '韶关市武江区沿江路16号南枫碧水花城L3幢-1层53号商铺之二', '24.7755137276043', '113.582438436173', '韶关市沿江路韶关前茅贸易有限公司门店', '韶关市前茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2640, '2313100000003', '河北省', '廊坊市', '三河市', '廊坊市三河市燕郊开发区学院大街北侧、汉王路东侧同忆首歌汇福苑1号楼西7号', '39.954121', '116.827125', '三河市学院大街茅台酱香万家共享主题终端', '三河市君品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2641, '132320285001', '江苏省', '无锡市', '梁溪区', '无锡市梁溪区中山路752号', '31.588726', '120.294221', '无锡市中山路贵州茅台专卖店', '江苏新百通酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2642, '252520183027', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区渔安安井片区渔安新城B1-5栋负4层3号', '26.584366', '106.743877', '贵阳市尚雅路贵州茅台专卖店', '贵州佳家琦商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2643, '2344040000001', '广东省', '珠海市', '香洲区', '珠海市香洲区梅华东路301号1单元2层', '22.286819', '113.567568', '珠海市梅华东路茅台酱香万家共享主题终端', '珠海海玛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2644, '22412801008001', '河南省', '驻马店市', '驿城区', '驻马店市驿城区文明大道中段天龙大酒店北100米路西', '32.98', '114.02', '驿城区文明大道茅台酱香万家共享主题终端', '驻马店市金谷商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2645, '2341048300002', '河南省', '平顶山市', '新华区', '平顶山市新华区建设路与公园北街交叉口北50米路西', '33.744186', '113.306042', '平顶山市建设路万家共享主题终端', '平顶山市国典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2646, '2132110010001', '江苏省', '镇江市', '丹阳市', '镇江市丹阳市金陵西路117号', '31.998', '119.6034', '丹阳市金陵西路茅台酱香万家共享主题终端', '丹阳市葆春商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2647, '2341048300001', '河南省', '平顶山市', '湛河区', '平顶山市湛河区金城丽景小区大门口南50米路西17号', '33.716719', '113.313165', '平顶山市金城丽景茅台酱香万家共享主题终端', '平顶山市国典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2648, '2223010000001', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区哈西大街295号1栋商服1层6号', '45.705623', '126.593521', '哈尔滨市哈西大街贵州茅台酱香系列酒体验中心', '黑龙江聚琪经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2649, '137370524001', '山东省', '东营市', '东营区', '东营市东营区千佛山路19号万海金地大厦B座103', '37.450555', '118.542756', '东营市千佛山路贵州茅台专卖店', '东营路程商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2650, '2137028210002', '山东省', '青岛市', '即墨区', '青岛市即墨区副食品批发市场四区二号楼38号', '36.397302', '120.486992', '即墨市副食品批发市场即墨市潮海街道办事处圣达糖酒经营部门店', '即墨市潮海街道办事处圣达糖酒经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2651, '2331011700002', '上海市', '上海市', '松江区', '上海市松江区嘉松南路402号', '31.031509', '121.231024', '上海市嘉松南路茅台酱香万家共享主题终端', '购酒网（上海）供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2652, '330188002', '浙江省', '杭州市', '市辖区', '杭州市市辖区经销商中心库', '0.0', '0.0', '物产中大云商有限公司', '物产中大云商有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2653, '22411300005001', '河南省', '南阳市', '宛城区', '南阳市宛城区汉冶街道老庄社区邓禹路两相路交叉口善水居小区商业一楼4＃108', '33.021386', '112.590604', '宛城区两相路茅台酱香万家共享主题终端', '南阳市银宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2654, '2351390100001', '四川省', '资阳市', '雁江区', '资阳市雁江区皇龙新城A座6号楼A6（F）1-10', '30.124948', '104.631963', '资阳市皇龙新城茅台酱香万家共享主题终端', '资阳天耀商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2655, '22522601008001', '贵州省', '黔东南苗族侗族自治州', '凯里市', '黔东南苗族侗族自治州凯里市友庄南路未来城E区12栋8-9号（贵州昕玥晟商贸有限公司）', '26.561152', '107.972181', '凯里市友庄南路茅台酱香万家共享主题终端', '凯里市博南博恒商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2656, '230200001002', '黑龙江省', '齐齐哈尔市', '龙沙区', '齐齐哈尔市龙沙区龙华路136号', '47.341056', '123.966072', '齐齐哈尔市龙华路贵州茅台特约经销商', '齐齐哈尔糖酒副食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2657, '34110105099011001', '广东省', '东莞市', '东莞', '东莞市东莞1', '23.021496', '113.791513', '东莞市德酝供应链有限公司中心库', '东莞市德酝供应链有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2658, '132320882001', '江苏省', '淮安市', '清江浦区', '淮安市清江浦区淮海西路99号金汇广场5-8号', '33.595228', '119.014852', '淮安市淮海西路贵州茅台专卖店', '淮安市智溢酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2659, '2344098400001', '广东省', '茂名市', '茂南区', '茂名市茂南区迎宾路154号大院7、8号首层7-10号房', '21.658973', '110.940326', '茂名市迎宾路茅台酱香万家共享主题终端', '茂名市金叶发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2660, 'B11022401301', '北京市', '北京市', '大兴区', '北京市大兴区北京市北京经济技术开发区科创十一街18号院C座2层215室', '39.785886', '116.563439', '北京京东世纪贸易有限公司北京市科创十一街18号院专卖店', '北京京东世纪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2661, '320500001005', '江苏省', '苏州市', '姑苏区', '苏州市姑苏区干将东路690号', '31.308423', '120.63017', '苏州市干将东路贵州茅台文化体验馆', '苏州苏糖名酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2662, '244440189001', '广东省', '广州市', '天河区', '广州市天河区粤垦路1号104房', '23.150413', '113.333885', '广州市粤垦路贵州茅台专卖店', '广州鼎醴贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2663, '2232109300001', '江苏省', '扬州市', '仪征市', '扬州市仪征市真州西路177号', '32.279001', '119.164818', '仪征市真州西路贵州茅台酱香系列酒体验中心', '仪征市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2664, '244440189003', '广东省', '广州市', '海珠区', '广州市海珠区艺景路领江东街2号', '23.100882', '113.317233', '广州市艺景路贵州茅台专卖店', '广东友谊酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2665, '22410194005001', '河南省', '郑州市', '金水区', '郑州市金水区107国道与310高速出口处', '34.841677', '113.691327', '金水区中州大道茅台酱香万家共享主题终端', '河南明睿酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2666, '132320481001', '江苏省', '常州市', '溧阳市', '常州市溧阳市溧城镇西大街38号', '31.428303', '119.489207', '溧阳市西大街贵州茅台专卖店', '溧阳市第一糖烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2667, '137372922001', '山东省', '菏泽市', '曹县', '菏泽市曹县赣江路鑫园小区东临', '34.831278', '115.549813', '曹县赣江路贵州茅台专卖店', '曹县冠存酒水有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2668, '112120105001', '天津市', '天津市', '河北区', '天津市河北区昆纬路44号增1号', '39.158538', '117.206546', '天津市昆纬路贵州茅台专卖店', '天津市海菊酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2669, '113130983001', '河北省', '沧州市', '黄骅市', '沧州市黄骅市黄骅市北海路与华兴街交叉口南160米同相城市广场内', '38.389327', '117.351689', '黄骅市华兴街贵州茅台专卖店', '沧州市醇香源糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2670, '145450600001', '广西壮族自治区', '防城港市', '港口区', '防城港市港口区云南路缪汉商住楼“金岛花园”1幢1层102-105号铺面', '21.618146', '108.350211', '防城港市云南路贵州茅台专卖店', '防城港市玉液商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2671, '112120105003', '天津市', '天津市', '滨海新区', '天津市滨海新区华苑产业园区工华道2号天津国际珠宝城19号楼-1、2-101', '39.092799', '117.1168', '天津市工华道贵州茅台专卖店', '天津海津皇冠贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2672, '121210900001', '辽宁省', '阜新市', '海州区', '阜新市海州区阜新市海州区中华路海州街80号', '42.013007', '121.646094', '阜新市阜新市海州区中华路贵州茅台专卖店', '阜新市吉盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2673, '145450921002', '广西壮族自治区', '玉林市', '容县', '玉林市容县容州镇登高路489号容州御景2栋1层04-07号商铺', '22.861375', '110.54046', '容县登高路贵州茅台专卖店', '南宁市洲赞商贸有限公司容县分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2674, 'Z310104013', '上海市', '上海市', '静安区', '上海市静安区北京西路1399号信达大厦11D', '31.227393', '121.44861', '上海市北京西路贵州茅台总经销店', '上海诺易达贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2675, '100411100001', '河南省', '漯河市', '郾城区', '漯河市郾城区海河路与泰山路交叉口东南角', '33.58686', '114.02561', '漯河市海河路贵州茅台专卖店', '漯河市华银商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2676, '241410193001', '河南省', '郑州市', '中原区', '郑州市中原区莲花街338号2号楼1层5号', '34.834874', '113.50368', '郑州市莲花街贵州茅台专卖店', '河南银怀祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2677, '22520221004001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区凤凰街道南环中路71号派华新港2期1层', '26.58', '104.86', '钟山区凤凰街道南环中路茅台酱香万家共享主题终端', '六盘水仟醇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2678, '22120400009001', '天津市', '天津市', '滨海新区', '天津市滨海新区塘沽新港路2864号1楼', '39.004391', '117.700915', '滨海新区塘沽新港路茅台酱香万家共享主题终端', '天津顶立集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2679, '132320400002', '江苏省', '常州市', '钟楼区', '常州市钟楼区广化街178-1号', '31.772542', '119.950575', '常州市广化街贵州茅台专卖店', '常州糖烟酒集团酒类有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2680, '115152901001', '内蒙古自治区', '呼伦贝尔市', '海拉尔区', '呼伦贝尔市海拉尔区兴安东路糖酒综合楼', '49.219998', '119.748288', '呼伦贝尔市兴安东路贵州茅台专卖店', '呼伦贝尔市糖酒副食品有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2681, '22310107003001', '上海市', '上海市', '嘉定区', '上海市嘉定区曹安公路2020号', '31.26', '121.35', '嘉定区曹安公路茅台酱香万家共享主题终端', '上海茅五剑贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2682, '144440400006', '广东省', '珠海市', '香洲区', '珠海市香洲区红山路三好名苑60-62号铺', '22.270301', '113.541283', '珠海市红山路贵州茅台专卖店', '珠海市秋霖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2683, '144440400005', '广东省', '珠海市', '香洲区', '珠海市香洲区九洲大道东1165号商铺', '22.248767', '113.58392', '珠海市九洲大道贵州茅台专卖店', '珠海市同威商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2684, '34410100087012001', '河南省', '周口市', '郸城县', '周口市郸城县1', '33.64601', '115.177141', '河南艾菲商贸有限公司中心库', '河南艾菲商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2685, '144440400007', '广东省', '珠海市', '香洲区', '珠海市香洲区弘泰路11号、13号', '22.270153', '113.569044', '珠海市人民东路贵州茅台专卖店', '珠海蓬胜酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2686, '223505000001', '福建省', '泉州市', '丰泽区', '泉州市丰泽区丰泽街东段群盛大厦1号楼罗兰苑19-21号店', '24.89997', '118.61707', '福建省泉州市贵州茅台酱香系列酒体验中心', '酌悦（福建）酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2687, '225301210001', '云南省', '昆明市', '盘龙区', '昆明市盘龙区北京路延长线金江小区 7-41/42/43号商铺', '25.097957', '102.740415', '盘龙区北京路贵州茅台酱香系列酒体验中心', '昆明宏烨商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2688, '100412701001', '河南省', '周口市', '川汇区', '周口市川汇区七一路金泰王朝8号楼109-110', '33.61826', '114.666342', '周口市七一路贵州茅台专卖店', '周口华富酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2689, '2244138300002', '广东省', '惠州市', '惠城区', '惠州市惠城区河南岸麦地南2路7号浩盛商住楼1层05号', '23.06345', '114.412002', '惠州市麦地南2路贵州茅台酱香系列酒体验中心', '惠州市远卓贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2690, '411323001002', '河南省', '南阳市', '西峡县', '南阳市西峡县西峡县白羽街道建设路西段26号', '33.295466', '111.475079', '南阳市西峡县建设西路贵州茅台专卖店', '南阳市亨盛酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2691, '22422401005001', '湖北省', '仙桃市', '仙桃市', '仙桃市仙桃市湖北省仙桃市沙嘴街道汉江路特1号御台商业街18栋107室', '30.350404', '113.432288', '仙桃市汉江大道茅台酱香万家共享主题终端', '仙桃市天宇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2692, '23330300001002', '浙江省', '温州市', '瓯海区', '温州市瓯海区龙湖天曜宸园1幢108-115室', '27.963636', '120.671247', '瓯海区大堡底路贵州茅台酱香系列酒体验中心', '温州市欧品尚经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2693, '34440300083008001', '天津市', '天津市', '武清区', '天津市武清区天津市武清开发区滨湖路30号云天广场1号楼201室', '39.412867', '117.050198', '天津华夏酒业有限公司中心库', '天津华夏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2694, '22500112030001', '重庆市', '重庆市', '渝北区', '重庆市渝北区两江新区大竹林街道龙凼路9号附18号', '29.632538', '106.471299', '两江新区大竹林街道茅台酱香万家共享主题终端', '重庆市商源酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2695, '22520185002001', '贵州省', '贵阳市', '乌当区', '贵阳市乌当区顺海中路88号保利温泉新城三期商业街8单元负2层3号', '26.61112', '106.75666', '乌当区顺海中路茅台酱香万家共享主题终端', '贵阳博昱朗商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2696, '145450130001', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区民族大道168号翡翠园紫青庭7号商铺', '22.80906', '108.40771', '南宁市民族大道贵州茅台专卖店（翡翠园紫青庭）', '广西尊和实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2697, '251510925001', '四川省', '遂宁市', '船山区', '遂宁市船山区芳洲北路3号邦泰.河东院子15号楼1层1、2、3号', '30.540029', '105.597753', '遂宁市芳洲北路贵州茅台专卖店', '遂宁市盛世家商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2698, '244440190004', '广东省', '广州市', '荔湾区', '广州市荔湾区紫郡街8号101房', '23.06468', '113.244846', '广州市紫郡街贵州茅台专卖店', '广州瑞德隆实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2699, '244440190003', '广东省', '广州市', '白云区', '广州市白云区同和路187号103铺', '23.203847', '113.327521', '广州市同和路贵州茅台专卖店', '广州茅渡商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2700, '2343310100001', '湖南省', '湘西土家族苗族自治州', '吉首市', '湘西土家族苗族自治州吉首市乾州办事处世纪大道湘州阳光第5栋1单元101号门面', '28.265052', '109.704449', '吉首市世纪大道茅台酱香万家共享主题终端', '湘西领品贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2701, '2252010000002', '贵州省', '贵阳市', '云岩区', '贵阳市云岩区中山东路141号附1号', '26.578083', '106.721385', '贵阳市中山东路贵州茅台酱香系列酒体验中心', '贵阳诚意酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2702, '22110108054002', '北京市', '北京市', '海淀区', '北京市海淀区北京市海淀区建材城翡丽华庭15号楼1至3层07', '40.064415', '116.367678', '海淀区建材城中路茅台酱香万家共享主题终端', '北京腾远华茂商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2703, '100520200001', '贵州省', '六盘水市', '钟山区', '六盘水市钟山区钟山中路71号', '26.582709', '104.854949', '六盘水市钟山中路贵州茅台专卖店', '六盘水台皇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2704, '111110225001', '北京市', '北京市', '房山区', '北京市房山区拱辰南大街91号楼底商', '39.725705', '116.141694', '北京市拱辰南大街贵州茅台专卖店', '北京三兴盛源商贸中心', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2705, '136360300002', '江西省', '萍乡市', '安源区', '萍乡市安源区萍安南大道景盛豪庭A5栋118-119', '27.606588', '113.876321', '萍乡市萍安南大道贵州茅台专卖店', '萍乡市新明贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2706, '22110108054001', '北京市', '北京市', '海淀区', '北京市海淀区建材城翡丽华庭15号楼1至3层07', '40.064415', '116.367678', '海淀区建材城西路茅台酱香万家共享主题终端', '北京腾远华茂商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2707, '144441323001', '广东省', '东莞市', '东莞', '东莞市东莞虎门镇连升路36号万科紫台27栋110-111商铺', '22.800873', '113.690808', '东莞市虎门镇连升路贵州茅台专卖店', '东莞市国茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2708, '2337062000001', '山东省', '威海市', '环翠区', '威海市环翠区威海海滨中路14A-2', '37.48', '122.14', '威海市海滨中路茅台酱香万家共享主题终端', '威海世昌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2709, '143431227001', '湖南省', '怀化市', '新晃侗族自治县', '怀化市新晃侗族自治县晃州镇晃山西路南侧新南滨江1号G4-113号', '27.354427', '109.162937', '新晃县晃山西路贵州茅台专卖店', '新晃锦云商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2710, '24110101170019', '北京市', '北京市', '东城区', '北京市东城区71号', '39.928359', '116.416334', '北京京糖酒类经营有限公司中心库', '北京京糖酒类经营有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2711, '244440189005', '广东省', '广州市', '天河区', '广州市天河区体育西路133号临街铺面3107-3108室', '23.137287', '113.321368', '广州市体育西路贵州茅台专卖店', '广东尊茅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2712, '244440189004', '广东省', '广州市', '番禺区', '广州市番禺区东环街东艺路145号', '22.979528', '113.347529', '广州市东艺路贵州茅台专卖店', '广州鼎申贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2713, '110105061013', '北京市', '北京市', '朝阳区', '北京市朝阳区王四营乡观音堂文化大道西街2层C206室', '39.871452', '116.530165', '北京市观音堂文化大道贵州茅台文化体验馆', '北京华铭恒源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2714, '141411123001', '河南省', '漯河市', '郾城区', '漯河市郾城区太行山路与淞江路交叉口向北50米路东', '33.59833', '114.00541', '漯河市太行山路贵州茅台专卖店', '漯河市品旺商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2715, '237370692001', '山东省', '烟台市', '福山区', '烟台市福山区烟台经济技术开发区海滨路86号海滨假日花园小区12号楼106-107室', '37.577191', '121.203428', '烟台市元江路贵州茅台专卖店', '烟台新兆宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2716, '244440189006', '广东省', '广州市', '天河区', '广州市天河区黄埔大道西505号101房自编3号', '23.126638', '113.345134', '广州市黄埔大道贵州茅台专卖店', '广州满海贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2717, '22450322001001', '广西壮族自治区', '桂林市', '七星区', '桂林市七星区龙隐路码坪街1号晟景苑小区7栋1-8号门面', '25.27', '110.31', '七星区龙隐路茅台酱香万家共享主题终端', '桂林市越静川宜酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2718, '23360126002003', '江西省', '南昌市', '东湖区', '南昌市东湖区江西省南昌市东湖区三经路113号108号', '28.693603', '115.898989', '东湖区三经路贵州茅台酱香系列酒体验中心', '南昌市飞马实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2719, '2142284210001', '湖北省', '恩施土家族苗族自治州', '来凤县', '恩施土家族苗族自治州来凤县凤翔大道44号', '29.503753', '109.403142', '来凤县解放路茅台酱香万家共享主题终端', '来凤县泰来商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2720, '123230100002', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区华山路3号龙创新世纪C区1-06号', '45.741923', '126.682651', '哈尔滨市华山路贵州茅台专卖店', '哈尔滨市同鑫宏业商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2721, '123230100003', '黑龙江省', '哈尔滨市', '道里区', '哈尔滨市道里区爱建街道达道街1-25号', '45.75755', '126.601286', '哈尔滨市达道街贵州茅台专卖店', '黑龙江世佳投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2722, '123230100001', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区鸿翔路26号', '45.746665', '126.673426', '哈尔滨市鸿翔路贵州茅台专卖店', '哈尔滨金手佛烟酒经销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2723, '144440400002', '安徽省', '阜阳市', '太和县', '阜阳市太和县长征路与光明路交叉口金色华府2号楼128.129.130.铺', '33.179226', '115.628559', '太和县长征路贵州茅台专卖店', '太和县醇浓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2724, '22320100058001', '江苏省', '常州市', '新北区', '常州市新北区三井街道典雅商业广场2幢106号', '31.81039', '119.970931', '新北区三井街道茅台酱香万家共享主题终端', '常州市茅品源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2725, '144440400004', '广东省', '珠海市', '斗门区', '珠海市斗门区白蕉镇白蕉路3141号、3143号商铺', '22.226206', '113.314227', '珠海市白蕉路贵州茅台专卖店', '珠海市华侨酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2726, '100530300002', '云南省', '文山壮族苗族自治州', '文山市', '文山壮族苗族自治州文山市健民路高山流水小区22栋1-2', '23.351546', '104.25096', '文山市健民路贵州茅台专卖店', '文山宗云商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2727, '22410188003002', '河南省', '郑州市', '新郑市', '郑州市新郑市新郑市溱水路东侧兴弘花园北楼1单位A12-2', '34.382965', '113.756563', '新郑市溱水路茅台酱香万家共享主题终端', '河南三达德商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2728, '137370788001', '山东省', '潍坊市', '潍城区', '潍坊市潍城区胜利西街1629号（胜利街月河路交叉口西50米路北）', '36.708736', '119.09447', '潍坊市胜利西街贵州茅台专卖店', '潍坊云峰酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2729, '137370200020', '山东省', '青岛市', '市北区', '青岛市市北区台东一路116号', '36.079307', '120.358985', '青岛市台东一路贵州茅台专卖店', '青岛鑫浩统达糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2730, '113130500001', '河北省', '邢台市', '信都区', '邢台市信都区中华大街月晟天玺台2号商业104-107铺', '37.072626', '114.456049', '邢台市中华大街贵州茅台专卖店', '邢台贵塘商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2731, '144440100006', '广东省', '广州市', '白云区', '广州市白云区广东省广州市白云区云城西路1208号104房105房106房', '23.194863', '113.276158', '广州市云城西路贵州茅台专卖店', '广州市绿慈贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2732, '137370200023', '山东省', '青岛市', '胶州市', '青岛市胶州市胶东街道胶东国际机场航站楼L4层5号出发口内L4L-F-1B', '36.35991', '120.093607', '青岛市胶东机场贵州茅台专卖店', '青岛醇祥泰合酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2733, '22210100023001', '辽宁省', '锦州市', '松山区', '锦州市松山区松山新区吉祥街典逸心洲35-94号', '41.098008', '121.113235', '松山新区吉祥街茅台酱香万家共享主题终端', '沈阳西平商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2734, '133331000001', '浙江省', '台州市', '椒江区', '台州市椒江区东海大道480-486', '28.645672', '121.427107', '台州市东海大道贵州茅台专卖店', '台州市程氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2735, '242421122001', '湖北省', '黄冈市', '红安县', '黄冈市红安县河东大道新天地商铺C7-109陈酒阁', '31.285', '114.618', '城关镇河东大道贵州茅台43度经销店', '湖北盛世佳酿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2736, '2337112200001', '山东省', '日照市', '莒县', '日照市莒县城阳街道沭河湾北沿街', '35.585148', '118.860992', '莒县城阳街道茅台酱香万家共享主题终端', '莒县永拓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2737, '22445500008001', '广东省', '中山市', '中山市', '中山市中山市小榄镇广源北路5号101卡', '22.67285', '113.24316', '中山市小榄镇广源北路茅台酱香万家共享主题终端', '中山市古镇瀛聚百货店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2738, '430602001', '湖南省', '岳阳市', '岳阳楼区', '岳阳市岳阳楼区金鹗山街道南湖大道527号', '29.358043', '113.117766', '岳阳市大雅商颂营销管理有限公司中心库', '岳阳市大雅商颂营销管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2739, '141412801002', '河南省', '驻马店市', '驿城区', '驻马店市驿城区文明大道与文化路交叉口东北角', '32.984423', '114.017576', '驻马店市文明路贵州茅台专卖店', '驻马店市华通源供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2740, '2141148310001', '河南省', '商丘市', '梁园区', '商丘市梁园区归德路八-路交叉口南路西烟草局', '34.42821', '115.659843', '商丘市归德路商丘市淘礼商贸有限公司门店', '商丘市淘礼商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2741, '133331000002', '浙江省', '杭州市', '西湖区', '杭州市西湖区杭州西湖区下满觉陇路129号', '30.218411', '120.126655', '杭州市下满觉陇路贵州茅台文化体验馆', '台州市程氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2742, '137370200022', '山东省', '青岛市', '市南区', '青岛市市南区广州路52号丙青岛高铁站南候车室QD-003', '36.064831', '120.312724', '青岛市广州路贵州茅台专卖店（青岛高铁站）', '山东智顺投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2743, '123230100006', '黑龙江省', '哈尔滨市', '道里区', '哈尔滨市道里区丽江路2215号群力湿地MOHO', '45.726477', '126.550215', '哈尔滨市丽江路贵州茅台专卖店', '哈尔滨鑫富利达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2744, '23411103002003', '河南省', '漯河市', '郾城区', '漯河市郾城区漯河市郾城区岷江路与黄山路交叉口西南角未来花园门面房3号', '33.597962', '114.019965', '漯河市黄山路贵州茅台酱香系列酒体验中心 ', '漯河市霖钤商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2745, '123230100007', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区南岗区王岗大街651号', '45.69128', '126.584271', '哈尔滨市王岗大街贵州茅台专卖店', '哈尔滨金宇翔商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2746, '22412728002001', '河南省', '周口市', '沈丘县', '周口市沈丘县沈丘县建设路九龙府南门5幢111号', '33.398613', '115.104355', '沈丘县建设路茅台酱香万家共享主题终端', '沈丘县亿达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2747, '200000000001', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市茅台镇茅台酒厂内销售公司大楼', '27.719565', '106.384173', '贵州茅台酱香酒营销有限公司', '贵州茅台酱香酒营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2748, '23450100012001', '广西壮族自治区', '南宁市', '良庆区', '南宁市良庆区中国（广西）自由贸易试验区南宁片区龙佑街2号云星·钱隆首府D2地块2号楼一层101、106号办公', '22.767616', '108.382709', '良庆区龙佑街贵州茅台酱香系列酒体验中心', '广西九界贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2749, '123230100008', '黑龙江省', '哈尔滨市', '道里区', '哈尔滨市道里区朗江路861号', '45.731066', '126.53235', '哈尔滨市朗江路贵州茅台专卖店（翠湖天地）', '哈尔滨酱香源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2750, '123230100009', '黑龙江省', '哈尔滨市', '道里区', '哈尔滨市道里区朗江路3366号', '45.74', '126.53', '哈尔滨市朗江路贵州茅台专卖店', '哈尔滨市国泰君安经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2751, '22330100016001', '浙江省', '杭州市', '拱墅区', '杭州市拱墅区浙江省杭州市拱墅区余杭塘路531号', '30.293324', '120.107625', '拱墅区余杭塘路茅台酱香万家共享主题终端', '杭州国香缘酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2752, '123230100010', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区中兴大道88号1-2层', '45.702231', '126.598516', '哈尔滨中兴大道贵州茅台专卖店', '哈尔滨天世润锦汇经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2753, '43.856132', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '乌鲁木齐市头屯河区黄山街81号一品九点阳光7号公寓楼底商7-109', '43.856132', '87.523456', '头屯河区黄山街茅台酱香万家共享主题终端', '新疆奋强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2754, '251511300001', '四川省', '南充市', '顺庆区', '南充市顺庆区马市铺路82/84/86/88号', '30.820044', '106.099011', '南充市马市铺路贵州茅台专卖店', '南充金南实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2755, '123230100011', '黑龙江省', '哈尔滨市', '道里区', '哈尔滨市道里区群力第五大道935号(近关东古巷)', '45.73592', '126.56828', '哈尔滨市群力第五大道贵州茅台自营店', '黑龙江国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2756, '144440100011', '广东省', '广州市', '天河区', '广州市天河区天河东路65号首层', '23.131355', '113.333493', '广州市天河东路贵州茅台专卖店', '广东省友谊有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2757, '223412000001', '安徽省', '阜阳市', '颍州区', '阜阳市颍州区西湖大道139号丽丰一品C4幢105-108室', '32.883807', '115.802949', '阜阳市颍州区西湖大道贵州茅台酱香系列酒体验中心', '阜阳市谐和商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2758, '144440100010', '广东省', '广州市', '天河区', '广州市天河区金穗路70号117房', '23.122587', '113.33099', '广州市金穗路贵州茅台专卖店', '广州市黔灵贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2759, '2244190200001', '广东省', '东莞市', '东莞', '东莞市东莞宏图路万科金域华府海月轩102-103号', '22.995772', '113.735228', '东莞市宏图路贵州茅台酱香系列酒体验中心', '东莞市峻昌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2760, 'B45010300101', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区南宁市青秀区东葛路161号绿地中央广场A6号楼一层118号商铺', '22.830769', '108.360177', '南宁市东葛路161号贵州茅台旗舰店', '广西桂小茅商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2761, '2231011500001', '上海市', '上海市', '浦东新区', '上海市浦东新区长清路507号恒大长青坊-期A136/137/235/236', '31.162812', '121.491062', '上海市长清路贵州茅台酱香系列酒体验中心', '上海浩泽贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2762, '22320200005001', '江苏省', '无锡市', '滨湖区', '无锡市滨湖区江苏省无锡市滨湖区大池路梁巷1号', '31.565094', '120.245708', '滨湖区大池路茅台酱香万家共享主题终端', '无锡市荣氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2763, '137370683002', '山东省', '烟台市', '莱州市', '烟台市莱州市云峰北路6133号塔埠栋盛苑15幢', '37.188429', '119.961364', '莱州市云峰北路贵州茅台专卖店', '莱州鲁晟酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2764, '113131082002', '河北省', '廊坊市', '三河市', '廊坊市三河市泃阳西大街207号', '39.984739', '117.05353', '三河市泃阳西大街贵州茅台专卖店', '三河市鑫恒久益商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2765, '144440100019', '广东省', '广州市', '花都区', '广州市花都区广州市花都区迎宾大道173号购物中心内1004商铺(空港花都)', '23.378785', '113.250965', '广州市迎宾大道贵州茅台专卖店', '广州市贵都贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2766, '22430121002001', '湖南省', '长沙市', '长沙县', '长沙市长沙县星沙街道黄兴大道218号海伦春天9、10、46栋 222、223、224号', '28.240131', '113.123688', '长沙县星沙街道黄兴大道茅台酱香万家共享主题终端', '长沙县远航酒类贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2767, '134340423001', '安徽省', '淮南市', '田家庵区', '淮南市田家庵区国庆街道前锋社区朝阳中路乾丰大厦102', '32.64185', '117.026404', '淮南市朝阳中路贵州茅台专卖店', '淮南市醉佳酒类贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2768, '2332118300002', '江苏省', '镇江市', '句容市', '镇江市句容市华阳街道肖杆路9号香溪湾69幢105号', '31.95269', '119.190534', '句容市华阳街道茅台酱香万家共享主题终端', '句容经济开发区心和商贸经营部', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2769, '2341160200001', '河南省', '周口市', '川汇区', '周口市川汇区光荣路与安居路交叉口10-5号', '33.610496', '114.672747', '周口市光荣路茅台酱香万家共享主题终端', '河南酒洲汇商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2770, '144440100016', '广东省', '广州市', '花都区', '广州市花都区白云国际机场二号航站楼出发大厅三层T23R34', '23.398726', '113.310224', '广州市白云国际机场贵州茅台专卖店', '广州白云国际机场股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2771, '2250070000001', '重庆市', '重庆市', '渝北区', '重庆市渝北区湖影街2号4栋7号', '29.660468', '106.578438', '重庆市湖影街贵州茅台酱香系列酒体验中心', '重庆盛信天下酒仓商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2772, '2212040000002', '天津市', '天津市', '滨海新区', '天津市滨海新区塘沽海洋科技园金江路1365号', '39.050268', '117.668556', '天津市云岭道晴景家园贵州茅台酱香系列酒体验中心', '天津顶立集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2773, '144440100014', '广东省', '广州市', '海珠区', '广州市海珠区新敦路109号', '23.086147', '113.318816', '广州市新敦路贵州茅台专卖店', '广东中外名酒专卖行连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2774, 'Z110105062', '北京市', '北京市', '朝阳区', '北京市朝阳区广渠路18号院1号楼10层1001室', '39.891878', '116.502759', '北京市广渠路贵州茅台总经销店', '北京金成信达经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2775, '113131082001', '北京市', '北京市', '丰台区', '北京市丰台区骏景园北区1号楼1-2层101、102', '39.85509', '116.396889', '北京市海户东路贵州茅台专卖店', '北京宇洋尚都经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2776, '144440100013', '广东省', '广州市', '越秀区', '广州市越秀区越秀中路60号102、103、104房', '23.123997', '113.278597', '广州市越秀中路贵州茅台专卖店', '广州市汉鼎贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2777, '137370329001', '山东省', '淄博市', '张店区', '淄博市张店区世茂齐盛里4号楼1单元101', '36.823868', '117.984741', '淄博市心环西路贵州茅台专卖店', '淄博合文商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2778, '330300001006', '浙江省', '温州市', '鹿城区', '温州市鹿城区蒲鞋市街道蒋家桥锦园1-2幢106-109号', '28.003797', '120.682993', '温州市车站大道贵州茅台文化体验馆', '温州市欧品尚经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2779, '34321326002084001', '广东省', '佛山市', '顺德区', '佛山市顺德区广东省佛山市顺德区容桂街道红星社区桂新东路1号龙光水悦熙园15座134号铺（住所申报）', '22.751936', '113.268201', '佛山市恺意行商贸有限公司中心库', '佛山市恺意行商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2780, '164640200001', '宁夏回族自治区', '石嘴山市', '大武口区', '石嘴山市大武口区永康南路575-577号', '38.992766', '106.36758', '石嘴山市永康南路贵州茅台专卖店', '宁夏博睿酒业贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2781, '22440100087001', '广东省', '广州市', '番禺区', '广州市番禺区南村镇兴南大道120号108房茅台酱香万家共享（广州茅酱元）', '23.011196', '113.345701', '番禺区南村镇兴南大道茅台酱香万家共享主题终端', '广州同鑫元文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2782, '143430200002', '湖南省', '株洲市', '荷塘区', '株洲市荷塘区向阳北路555号荣盛华府2栋101、102、1栋110号', '27.876235', '113.166809', '株洲市向阳北路贵州茅台专卖店', '株洲市金港商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2783, '2137030010001', '山东省', '滨州市', '滨城区', '滨州市滨城区彭李街道韵河嘉园759号北侧沿街房2号', '37.402588', '117.98476', '滨州市彭李街道山东新星集团有限公司（滨州分公司）门店', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2784, '143430200001', '湖南省', '株洲市', '天元区', '株洲市天元区湘山街道渌江路959号中建江湾一号二期4-5栋111/112/113号门面', '27.80268', '113.10262', '株洲市渌江路贵州茅台专卖店', '株洲市桢成贸易有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2785, '2137030010002', '山东省', '临沂市', '兰山区', '临沂市兰山区金雀山街道金五路与通达路交汇处东北角旺角购物广场沿街8号', '35.038552', '118.331428', '临沂市金五路山东新星集团有限公司（临沂分公司）门店', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2786, '2344140000002', '广东省', '梅州市', '梅江区', '梅州市梅江区梅水路18号江南御景6栋6号商铺', '24.29728', '116.13453', '梅州市梅水路茅台酱香万家共享主题终端', '梅州市宾豪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2787, '142420125003', '湖北省', '武汉市', '江汉区', '武汉市江汉区万科金域时代2期2栋商铺', '30.606883', '114.277175', '武汉市香江西路贵州茅台专卖店', '武汉市京江贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2788, '212120102002', '天津市', '天津市', '西青区', '天津市西青区李七庄街泰佳道与汇川路交口东南侧武台馨苑公建1-1-124', '39.056831', '117.169103', '天津市泰佳道贵州茅台43度经销店', '天津市锦绣昌隆酒类销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2789, '2137030010003', '山东省', '潍坊市', '奎文区', '潍坊市奎文区潍坊市高新区新城街道北宫东街3646号上东国际A座商铺', '36.726644', '119.170305', '潍坊市北宫街茅台酱香万家共享主题终端', '山东新星集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2790, '142420125005', '湖北省', '武汉市', '江岸区', '武汉市江岸区西马街澳门路123号（澳门.银座二期）1栋1层2室', '30.601077', '114.295941', '武汉市澳门路贵州茅台专卖店', '武汉琛佳瑞森商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2791, '233330186001', '浙江省', '杭州市', '滨江区', '杭州市滨江区长河街道滨盛路与康顺路交叉口2077号潮上中南银座商铺102-1', '30.203824', '120.197017', '杭州市滨盛路贵州茅台专卖店', '浙商糖酒集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2792, '144440100022', '广东省', '广州市', '白云区', '广州市白云区黄边北路汇贤街38号-40号101', '23.22275', '113.284875', '广州市黄边北路贵州茅台专卖店', '广州市圆成贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2793, '2144140010001', '广东省', '梅州市', '梅江区', '梅州市梅江区东山大道老校老路梨园新村1栋10-14号', '24.325292', '116.134615', '梅州市东山大道梅州市宾豪贸易有限公司门店', '梅州市宾豪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2794, '151511600001', '四川省', '广安市', '广安区', '广安市广安区陡石梯路144、146、148号', '30.451302', '106.658134', '广安市陡石梯路贵州茅台专卖店', '广安格桑花开商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2795, '510603001', '四川省', '德阳市', '旌阳区', '德阳市旌阳区白河巷106号新杰36号公馆B栋1-6号', '31.131823', '104.382997', '德阳时代星辉供应链管理有限公司中心库', '德阳时代星辉供应链管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2796, '132320700001', '江苏省', '连云港市', '海州区', '连云港市海州区海昌南路1号', '34.59545', '119.180148', '连云港市海昌南路贵州茅台专卖店', '连云港市中糖酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2797, '22445501001001', '广东省', '中山市', '中山市', '中山市中山市石岐区康华路10号4卡5卡', '22.5359', '113.3946', '石岐区康华路茅台酱香万家共享主题终端', '中山市斟酌酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2798, '137370285002', '山东省', '青岛市', '莱西市', '青岛市莱西市烟台路112号富景国际', '36.87592', '120.521558', '莱西市烟台路贵州茅台专卖店', '青岛海鲲诚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2799, '22110106022001', '北京市', '北京市', '房山区', '北京市房山区拱辰街道昊天大街188号', '39.727581', '116.147947', '房山区拱辰街道昊天大街茅台酱香万家共享主题终端', '北京晟瑞达源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2800, 'B52030100203', '贵州省', '遵义市', '仁怀市', '遵义市仁怀市贵州省 / 遵义市 / 仁怀市', '27.791883', '106.401322', '仁怀市贵州省 / 遵义市 / 仁怀市贵州茅台其他', '茅台酒股份公司茅台国际大酒店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2801, '144440100027', '广东省', '广州市', '南沙区', '广州市南沙区南沙街港航一街9号110房', '22.797302', '113.578925', '广州市南沙街贵州茅台专卖店', '广州黔茅贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2802, '144440100026', '广东省', '广州市', '天河区', '广州市天河区海居路12号', '23.125507', '113.336605', '广州市海居路贵州茅台自营店', '广东国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2803, '132320387001', '江苏省', '徐州市', '泉山区', '徐州市泉山区泉新路1号山语世家A2号楼 1-111 1-112', '34.21592', '117.171465', '徐州市泉新路贵州茅台专卖店', '徐州市华夏酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2804, '150500383002', '重庆市', '重庆市', '永川区', '重庆市永川区中山路街道文昌路888号附1号附2号附4号', '29.378569', '105.935745', '重庆市文昌路贵州茅台专卖店', '重庆蓥浆商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2805, '150500383003', '重庆市', '重庆市', '永川区', '重庆市永川区中山路街道瑞龙路11号、13号、15号、17号（置铖御苑）', '29.37025', '105.957116', '重庆市瑞龙路贵州茅台专卖店', '重庆市沛泉酒类有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2806, '2313068200001', '河北省', '保定市', '定州市', '保定市定州市兴定西路悦明园商3茅台酱香万家共享', '38.529278', '114.976141', '定州市兴定西路茅台酱香万家共享主题终端', '定州市酒之林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2807, '22612723004001', '陕西省', '榆林市', '府谷县', '榆林市府谷县兴茂大厦一楼3号', '0.0', '0.0', '府谷县河滨西路茅台酱香万家共享主题终端', '府谷县华祥商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2808, '22371500007001', '山东省', '聊城市', '东昌府区', '聊城市东昌府区辽河路与武夷山路交叉路口东50米路北大东钢管城一楼', '36.46881', '116.077276', '开发区辽河路茅台酱香万家共享主题终端', '聊城盛世天元名酒营销有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2809, '22413100004001', '河南省', '济源市', '济源市', '济源市济源市沁园街道科教街与开南路交叉口隆发商务中心101', '35.060793', '112.611243', '济源市沁园街道茅台酱香万家共享主题终端', '河南仙都贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2810, '21310114007008', '上海市', '上海市', '嘉定区', '上海市嘉定区嘉定区招贤东路79号', '31.364902', '121.258808', '上海市嘉定区嘉定工业区多苑食品经营部', '上海多苑实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2811, '320101001', '江苏省', '南京市', '市辖区', '南京市市辖区南京市江北新区浦泗路18号C4栋', '0.0', '0.0', '南京赵氏商贸有限公司中心库', '南京赵氏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2812, '2341140000001', '河南省', '商丘市', '睢阳区', '商丘市睢阳区宇航路与学院路交叉口东88米路北茅台酱香万家共享店', '34.403581', '115.666101', '商丘市学院路茅台酱香万家共享主题终端', '河南省富航电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2813, '233330483001', '浙江省', '嘉兴市', '桐乡市', '嘉兴市桐乡市梧桐街道振兴中路31号', '30.628028', '120.553186', '桐乡市振兴中路贵州茅台专卖店', '浙江柒泉工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2814, '22130986002001', '河北省', '沧州市', '运河区', '沧州市运河区永安北大道华元一世界？大和庄北区东门底商34号门市', '38.312953', '116.834566', '运河区永安北大道茅台酱香万家共享主题终端', '沧州久润酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2815, '2113010010001', '河北省', '石家庄市', '桥西区', '石家庄市桥西区平安南大街7号', '38.017767', '114.451786', '石家庄市平安南大街河北德源商贸有限公司门店', '河北德源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2816, '22610633002001', '陕西省', '延安市', '宝塔区', '延安市宝塔区万达红街胜利广场D0223号商铺', '36.56', '109.52', '宝塔区万达红街茅台酱香万家共享主题终端', '延安林林工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2817, '241410100001', '河南省', '郑州市', '惠济区', '郑州市惠济区天河路南段格力广场1号楼', '34.858383', '113.613538', '郑州市天河路贵州茅台专卖店', '河南弘力商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2818, '510900007', '四川省', '遂宁市', '市辖区', '遂宁市市辖区河东新区芳洲南路69号，75号，77号', '30.530922', '105.599847', '遂宁市盛世家商贸有限责任公司中心库', '遂宁市盛世家商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2819, '241410100003', '河南省', '郑州市', '管城回族区', '郑州市管城回族区陇海路东周路交叉口（东安嘉苑）西苑5号楼1-2楼', '34.735734', '113.753554', '郑州市东周路贵州茅台43度经销（茅台酒）', '郑州源升商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2820, '2341272600001', '河南省', '周口市', '郸城县', '周口市郸城县民水路606号', '33.649549', '115.162908', '郸城县民水路茅台酱香万家共享主题终端', '河南柯岩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2821, '141412322001', '河南省', '信阳市', '平桥区', '信阳市平桥区羊山新区新六大街与新三路交汇处东100米铂金丽都小区11号楼1层104-105', '32.151097', '114.08455', '信阳市新六大街贵州茅台专卖店', '信阳市盛林商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2822, '2115330010001', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区内蒙古自治区鄂尔多斯市东胜区交通街道颐景苑商住小区A座6号底商', '39.826194', '109.985232', '鄂尔多斯市吉劳庆北路内蒙古美人鱼科技有限责任公司门店', '内蒙古美人鱼科技有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2823, '22131081004001', '河北省', '廊坊市', '霸州市', '廊坊市霸州市天祥北路435号', '39.12593', '116.39541', '霸州市天祥北路茅台酱香万家共享主题终端', '霸州市天成瑞奥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2824, '34410189001002001', '山东省', '潍坊市', '安丘市', '潍坊市安丘市兴安街道潍安路原玻璃厂院内', '36.420138', '119.198715', '安丘市正语酒水商行中心库', '安丘市正语酒水商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2825, 'B35020600202', '福建省', '福州市', '仓山区', '福州市仓山区福建省福州市仓山区仓前9里茅台冰淇淋体验店', '26.040886', '119.315352', '福州市仓山区仓前9里茅台冰淇淋体验店贵州茅台体验店', '福建省传美时代商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2826, '2144018810001', '广东省', '广州市', '海珠区', '广州市海珠区新港东路213-215号', '23.099013', '113.34432', '广州市新港东路广州尚湖贸易有限公司门店', '广州尚湖贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2827, '115153300001', '内蒙古自治区', '鄂尔多斯市', '东胜区', '鄂尔多斯市东胜区东胜区建设街道吉劳庆南路龙湾小区B区106', '39.809197', '109.988543', '鄂尔多斯市吉劳庆南路贵州茅台专卖店', '鄂尔多斯市龙盛泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2828, 'B35020600200', '福建省', '厦门市', '湖里区', '厦门市湖里区福建省厦门市湖里区远航路77号海上世界购物中心L352室', '24.491356', '118.07689', '厦门市海上世界购物中心L352室贵州茅台旗舰店总库', '福建省传美时代商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2829, '115153300002', '内蒙古自治区', '鄂尔多斯市', '康巴什区', '鄂尔多斯市康巴什区巨力大厦12号底商', '39.598844', '109.790166', '鄂尔多斯市普阳街贵州茅台专卖店', '鄂尔多斯市龙盛泰商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2830, 'Z370600010', '山东省', '烟台市', '福山区', '烟台市福山区海滨路86号109室', '37.577205', '121.204233', '烟台市海滨路贵州茅台总经销店', '烟台新涵宇国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2831, '2137142410001', '山东省', '德州市', '临邑县', '德州市临邑县迎宾路203号', '37.181263', '116.873398', '临邑县迎宾路临邑县瑞丰综合商店门店', '临邑县瑞丰综合商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2832, 'B35020600201', '福建省', '厦门市', '湖里区', '厦门市湖里区福建省厦门市湖里区远航路77号海上世界购物中心352室', '24.491356', '118.07689', '厦门市远航路77号海上世界购物中心352室贵州茅台旗舰店', '福建省传美时代商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2833, '137371334001', '山东省', '临沂市', '兰山区', '临沂市兰山区府左路与兰陵路交汇处科技馆对面', '35.087707', '118.358028', '临沂市府左路贵州茅台专卖店', '山东九州商业集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2834, '137371427002', '山东省', '德州市', '夏津县', '德州市夏津县河津街与银山路交叉路口东100米路北', '36.960415', '115.992066', '夏津县银山路贵州茅台专卖店', '夏津县茅香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2835, '133330121002', '浙江省', '杭州市', '萧山区', '杭州市萧山区北干街道金鸡路47、49号', '30.175012', '120.25328', '杭州市金鸡路贵州茅台专卖店', '杭州震洋糖酒贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2836, '22131000010001', '河北省', '廊坊市', '安次区', '廊坊市安次区永华西岛131-9号', '0.0', '0.0', '安次区永华西道茅台酱香万家共享主题终端', '霸州市城区好人缘食品批发超市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2837, '22450100037001', '广西壮族自治区', '南宁市', '青秀区', '南宁市青秀区南宁市青秀凤岭南路16号保利领秀前城领秀府10栋101-102号商铺', '22.789648', '108.424814', '青秀区凤岭南路茅台酱香万家共享主题终端', '南宁市琪联茂商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2838, '141412801001', '河南省', '驻马店市', '市辖区', '驻马店市市辖区置地大道与天中山大道交叉口西400米路北', '33.00168149', '114.00711581', '驻马店市置地大道贵州茅台专卖店', '驻马店经济开发区塬霖商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2839, '232320900001', '江苏省', '盐城市', '亭湖区', '盐城市亭湖区东进中路66号钱江方洲小区南区57幢112室', '33.356136', '120.149674', '盐城市东进中路贵州茅台专卖店', '盐城市新方向酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2840, '152520122001', '贵州省', '贵阳市', '息烽县', '贵阳市息烽县贵州省贵阳市息烽县永靖镇南大街17号楼7-8号门面', '27.085763', '106.740515', '息烽县南大街贵州茅台专卖店', '息烽县广森酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2841, '330100002008', '浙江省', '杭州市', '上城区', '杭州市上城区庆春路11号凯旋门商业中心3层', '30.257542', '120.18517', '杭州市庆春路贵州茅台文化体验馆', '杭州华商糖业烟酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2842, '133330523001', '浙江省', '湖州市', '安吉县', '湖州市安吉县昌硕街道昌硕西路337、339号', '30.627181', '119.677363', '安吉县昌硕西路贵州茅台专卖店', '安吉旭百酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2843, '22110106022023', '北京市', '北京市', '房山区', '北京市房山区北京市房山区拱辰街道昊天大街188号', '39.727545', '116.147919', '拱辰街道昊天大街茅台酱香万家共享', '北京晟瑞达源酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2844, '2341142600001', '河南省', '商丘市', '夏邑县', '商丘市夏邑县孔祖大道与华夏大道交叉口北50米路西', '34.212927', '116.134148', '夏邑县栗城南路茅台酱香万家共享主题终端', '夏邑县乐高商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2845, '22520323003001', '贵州省', '遵义市', '绥阳县', '遵义市绥阳县洋川街道诗乡大道诗乡印象37-S-1-16\\37-S-1-17号商铺', '27.951968', '107.195685', '绥阳县诗乡大道茅台酱香万家共享自有主题终端', '贵州崇本商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2846, '22522729001001', '贵州省', '黔南布依族苗族自治州', '长顺县', '黔南布依族苗族自治州长顺县城南大道1号朝顺城市花园三期F区2#-8-9商铺楼', '26.003985', '106.4426', '长顺县城南大道茅台酱香万家共享主题终端', '长顺县顺和酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2847, '152522426002', '贵州省', '毕节市', '纳雍县', '毕节市纳雍县蟠龙大道香雍国际', '26.768312', '105.416377', '纳雍县蟠龙大道贵州茅台专卖店', '纳雍县峻玮酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2848, '2314060000002', '山西省', '朔州市', '朔城区', '朔州市朔城区平朔北路翠丰苑小区底商', '39.343977', '112.441919', '朔州市平朔北路茅台酱香万家共享主题终端', '朔州市壹贰叁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2849, '2313063200002', '河北省', '保定市', '容城县', '保定市容城县板正北大街02-4号', '39.051841', '115.865384', '容城县板正北大街茅台酱香万家共享主题终端', '安新县江轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2850, '261612431001', '陕西省', '安康市', '汉滨区', '安康市汉滨区巴山中路98号', '32.687253', '109.026723', '安康市巴山中路贵州茅台专卖店', '陕西省安康市糖酒副食有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2851, '2313063200003', '河北省', '保定市', '容城县', '保定市容城县永贵北大街19号', '39.059057', '115.859414', '容城县永贵北大街茅台酱香万家共享主题终端', '安新县江轩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2852, '34410100087027001', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区1', '34.771296', '111.188552', '三门峡市湖滨区恒泰烟酒店中心库', '三门峡市湖滨区恒泰烟酒店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2853, '2213108100001', '河北省', '廊坊市', '霸州市', '廊坊市霸州市建设西道北侧铁道桥东108号', '39.110388', '116.376362', '霸州市建设西道贵州茅台酱香系列酒体验中心', '霸州市品铄商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2854, '22320706001001', '江苏省', '连云港市', '海州区', '连云港市海州区建设东路1-11号（香溢江南15-1号商铺）', '34.586349', '119.201483', '海州区建设东路茅台酱香万家共享主题终端', '连云港华光明鑫酒品贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2855, '22320981002001', '江苏省', '盐城市', '东台市', '盐城市东台市金鹰御龙湾南区沿街商业楼113号', '32.836232', '120.318002', '东台市海陵南路茅台酱香万家共享主题终端', '东台市苏瑞商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2856, '143431200001', '湖南省', '怀化市', '鹤城区', '怀化市鹤城区城南街道刘塘路459号（乐府澜庭A栋）101', '27.529421', '110.002727', '怀化市刘塘路贵州茅台专卖店', '怀化鹤城区玉液商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2857, '2336078300001', '江西省', '赣州市', '章贡区', '赣州市章贡区文武坝路中梁江督府11-12号', '25.809833', '114.932607', '赣州市文武坝路茅台酱香万家共享主题终端', '赣州云氏贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2858, '22532522001001', '云南省', '红河哈尼族彝族自治州', '蒙自市', '红河哈尼族彝族自治州蒙自市民安路五号', '23.366843', '103.385005', '蒙自市民安路茅台酱香万家共享主题终端', '蒙自同创商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2859, '22230121001002', '黑龙江省', '哈尔滨市', '南岗区', '哈尔滨市南岗区复旦路269号涧桥西畔小区23栋商服1层2号', '45.691449', '126.586994', '南岗区复旦路茅台酱香万家共享主题终端', '哈尔滨市呼兰区天峰食品商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2860, '2113100010001', '河北省', '廊坊市', '广阳区', '廊坊市广阳区爱民东道尚都金茂中心A座综合楼42甲—6号', '39.527902', '116.708417', '廊坊市爱民东道茅台酱香万家共享主题终端', '廊坊市凯柏商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2861, '133330300004', '浙江省', '温州市', '鹿城区', '温州市鹿城区龟湖路名豪园1、2幢121-122室', '28.002323', '120.671775', '温州市龟湖路贵州茅台专卖店', '温州市风生经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2862, '2113100010002', '河北省', '廊坊市', '霸州市', '廊坊市霸州市建设西道铁道北侧桥东110号', '39.110388', '116.376362', '霸州市建设西道霸州市城区好人缘食品批发超市门店', '霸州市城区好人缘食品批发超市', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2863, '233330800001', '浙江省', '衢州市', '衢江区', '衢州市衢江区宾港北路31-1号、31-2号', '28.969826', '118.938764', '衢州市宾港北路贵州茅台43度经销店', '衢州唯真酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2864, '145450300004', '广西壮族自治区', '桂林市', '象山区', '桂林市象山区南环路3号1层11号门面', '25.270499', '110.286495', '桂林市南环路贵州茅台专卖店', '桂林市越静川宜酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2865, '145450300003', '广西壮族自治区', '桂林市', '七星区', '桂林市七星区环城南一路9号棠棣之华1栋1-8、1-9、1-10、1-11、1-12号商业', '25.243619', '110.324359', '桂林市环城南一路贵州茅台专卖店', '广西南宁海洋烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2866, '145450300002', '广西壮族自治区', '桂林市', '叠彩区', '桂林市叠彩区中山北路37号B栋1楼B5、B6', '25.292026', '110.29769', '桂林市中山北路贵州茅台专卖店', '广西桂林海之洋烟酒有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2867, '142420121002', '湖北省', '武汉市', '汉阳区', '武汉市汉阳区汉阳大道50号', '30.550035', '114.271967', '武汉市汉阳大道贵州茅台专卖店', '武汉市汉阳区龙人副食品商店', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2868, '165653201001', '新疆维吾尔自治区', '和田地区', '和田市', '和田地区和田市和田市塔乃依南路237号中润华府3号楼101、102室', '37.09753', '79.920303', '和田市塔乃依南路贵州茅台专卖店', '和田市佰悦商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2869, 'T110102039', '北京市', '北京市', '海淀区', '北京市海淀区大钟寺第二食品厂西农科院北圃厂（中关村东路118号）北楼一层007号', '39.970322', '116.334597', '北京市中关村东路贵州茅台专卖店', '盛世酱香（北京）国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2870, '142420688001', '湖北省', '襄阳市', '枣阳市', '襄阳市枣阳市中兴大道125号', '32.10171', '112.78245', '枣阳市中兴大道贵州茅台专卖店', '枣阳市名酒专卖有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2871, '21340122001002', '安徽省', '合肥市', '蜀山区', '合肥市蜀山区芙蓉路南、松谷路西东海花园商铺J1-3、J2-31、J3-2', '31.786513', '117.222698', '经开区芙蓉路茅台酱香万家共享主题终端', '合肥川久商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2872, '262620124002', '甘肃省', '兰州市', '城关区', '兰州市城关区东瓯儿童城', '36.041546', '103.882121', '兰州市东岗东路贵州茅台专卖店', '兰州众爱成城商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2873, '262620124001', '甘肃省', '兰州市', '城关区', '兰州市城关区东岗东路775号1号楼101室', '36.037754', '103.901709', '兰州市东岗东路贵州茅台专卖店', '兰州天麒糖酒副食有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2874, '153530188001', '云南省', '昆明市', '西山区', '昆明市西山区前卫街道前福路润城八区SY1、SY2', '25.005237', '102.704443', '昆明市前福路贵州茅台专卖店', '昆明唯沣商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2875, '2333070000001', '浙江省', '金华市', '永康市', '金华市永康市东城街道溪心路81号', '39.904214', '116.407413', '永康市东城街道茅台酱香万家共享主题终端', '金华天下美酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2876, '145450523001', '广西壮族自治区', '北海市', '海城区', '北海市海城区贵州路53号南洋金融公寓1、2号商铺', '21.463604', '109.108618', '北海市贵州路贵州茅台专卖店', '北海南洋国际大酒店有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2877, '145452624001', '广西壮族自治区', '百色市', '平果市', '百色市平果市马头镇大学西二路现代新城7栋1-2层12、13、15号商铺', '23.30767671221195', '107.59871491205334', '平果市大学西二路贵州茅台专卖店', '平果县皓远商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2878, '137370281002', '山东省', '青岛市', '胶州市', '青岛市胶州市福州南路庄里头小区63号', '36.267352', '120.026306', '胶州市福州南路贵州茅台专卖店', '青岛龙洲酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2879, '133330324001', '浙江省', '温州市', '永嘉县', '温州市永嘉县三江街道三江商务区中心大道瑞鸿锦园6幢111-115室', '28.039652', '120.687791', '永嘉县中心大道贵州茅台专卖店', '温州酩品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2880, '141411525001', '河南省', '信阳市', '固始县', '信阳市固始县蓼城大道日出东方西门口', '32.1716866562891', '115.6573023340492', '固始县蓼城大道贵州茅台专卖店', '河南九朵云电子商务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2881, '232320128001', '江苏省', '南京市', '秦淮区', '南京市秦淮区大明路141号', '31.998817', '118.808245', '南京市大明路贵州茅台专卖店', '南京中天酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2882, '232320128002', '江苏省', '南京市', '建邺区', '南京市建邺区集庆门大街221号103室', '32.028604', '118.733274', '南京市集庆门大街贵州茅台专卖店', '南京达言鑫酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2883, '22510800007001', '四川省', '巴中市', '巴州区', '巴中市巴州区江北区郑家街文华公寓1幢1层8号门市', '31.857664', '106.751187', '巴州区回风小区龙舌坝金鳞万点茅台酱香万家共享主题终端', '巴中市巴州区晶百利商贸中心', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2884, '137372330001', '山东省', '滨州市', '邹平市', '滨州市邹平市醴泉五路北首黄西村沿街房9-8号', '36.862595', '117.748657', '邹平市醴泉五路贵州茅台专卖店', '邹平宜和贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2885, '251510194001', '四川省', '成都市', '武侯区', '成都市武侯区芳草街街道紫荆西路2号1栋1楼29号-32号', '30.617683', '104.042177', '成都市紫荆西路贵州茅台专卖店', '四川万仟华美商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2886, '2153010010001', '云南省', '昆明市', '市辖区', '昆明市市辖区滇池路银海山水间商铺1层4号', '25.002424', '102.671197', '昆明市滇池路昆明酱典商贸有限公司门店', '昆明酱典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2887, '2153010010003', '云南省', '昆明市', '富民县', '昆明市富民县永定街道办事处环城南路396号', '25.226381', '102.523045', '富民县环城南路云南珀丁商贸有限公司门店', '云南珀丁商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2888, '2352232800001', '贵州省', '黔西南布依族苗族自治州', '安龙县', '黔西南布依族苗族自治州安龙县安龙大道与盘江大道交叉口印象荷城', '25.099014', '105.442701', '安龙县安龙大道茅台酱香万家共享主题终端', '贵州恒鑫原酱酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2889, '251510194004', '四川省', '成都市', '高新区', '成都市高新区富华南路1892号1层', '30.549411', '104.040243', '成都市富华南路贵州茅台专卖店', '成都玖方圆商务服务有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2890, '34623200002001', '广西壮族自治区', '南宁市', '西乡塘区', '南宁市西乡塘区永和桥北雅里中坡19号永和物流园二楼整层商铺', '22.805479', '108.296522', '南宁市鑫金鼎商贸有限责任公司中心库', '南宁市鑫金鼎商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2891, '251510194005', '四川省', '成都市', '天府新区', '成都市天府新区四川省成都市天府新区万安镇万东路554.556号3栋1楼2号', '30.490151', '104.091256', '成都市万东路贵州茅台专卖店', '成都市蓉上泉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2892, 'T110102004', '北京市', '北京市', '丰台区', '北京市丰台区王佐镇长青路87号院2号商业楼一层底商西6号', '39.801767', '116.16832', '北京市王佐镇长青路贵州茅台专卖店', '北京德实祥贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2893, '100510400001', '四川省', '攀枝花市', '东区', '攀枝花市东区三线大道北段24-5号、6号、7号', '26.563748', '101.719653', '攀枝花市三线大道贵州茅台专卖店', '攀枝花市芮岚商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2894, '251510194002', '四川省', '成都市', '天府新区', '成都市天府新区兴康二街333号附1号', '30.433521', '104.086047', '成都市兴康二街贵州茅台专卖店', '成都天指道酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2895, '123231100002', '黑龙江省', '黑河市', '爱辉区', '黑河市爱辉区黑河市爱辉区公园路60号', '50.245516', '127.506614', '黑河市公园路贵州茅台专卖店', '黑河市新希望经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2896, '143430500001', '湖南省', '长沙市', '望城区', '长沙市望城区月亮岛街道金湘苑住宅小区二期22#栋住宅1#栋商业-111、-112、-113室', '28.287023', '112.907918', '长沙市月亮岛路贵州茅台专卖店', '长沙市睿达酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2897, '244441900001', '广东省', '东莞市', '东莞', '东莞市东莞南城西平朗晴居106号商铺', '22.992339', '113.757546', '东莞市宏伟一路贵州茅台专卖店', '东莞市泰丰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2898, '100130900001', '河北省', '沧州市', '新华区', '沧州市新华区蔡御街45号（御宇国际商业AG3-13中宇小学对面）', '38.285472', '116.87435', '沧州市蔡御街贵州茅台专卖店', '沧州市贵福泉酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2899, '251510194007', '四川省', '成都市', '双流区', '成都市双流区梓州大道南一段3063号', '30.447098', '104.094243', '成都市梓州大道南一段贵州茅台专卖店', '成都弘盛源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2900, '236360126003', '江西省', '南昌市', '东湖区', '南昌市东湖区二七北路469号碧桂园城央书院', '28.68372', '115.919491', '南昌市二七北路贵州茅台专卖店', '南昌钟鼎鸿醇商贸发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2901, '236360126002', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区赣江南大道1566号恒天时尚中心E-1#114室', '28.614045', '115.818944', '南昌市赣江南大道贵州茅台专卖店', '南昌裕坤德酒业销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2902, '236360126001', '江西省', '南昌市', '红谷滩区', '南昌市红谷滩区江西省南昌市红谷滩区莱蒙五期熙梦城一楼商铺154-156室', '28.689034', '115.848644', '南昌市会展路贵州茅台专卖店', '江西省商业酒类有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2903, '151510600001', '四川省', '德阳市', '旌阳区', '德阳市旌阳区天山北路一段303号碧桂园旌湖水街', '31.166078', '104.414209', '德阳市天山北路贵州茅台专卖店', '德阳市群运物资有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2904, '135350181001', '福建省', '福州市', '台江区', '福州市台江区排尾路85号', '26.05455', '119.325778', '福州市排尾路贵州茅台专卖店', '福建省诚韵文化发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2905, '22420133003001', '湖北省', '武汉市', '洪山区', '武汉市洪山区洪山街道丁字桥南路529号佰港酒店1层1-002a', '30.55', '114.32', '洪山街道丁字桥南路茅台酱香万家共享主题终端', '武汉江城国商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2906, '22440304001001', '广东省', '深圳市', '宝安区', '深圳市宝安区新安街道海秀路熙龙湾花园二期5–117号铺', '22.546044', '113.893109', '宝安区海秀路熙茅台酱香万家共享主题终端', '深圳市纳海匠香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2907, '23210187002202', '辽宁省', '沈阳市', '和平区', '沈阳市和平区香港路144号', '41.749979', '123.432988', '贵州茅台酱香系列酒体验中心（香港路店）', '辽宁津享逸投资发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2908, '22520329003001', '贵州省', '遵义市', '湄潭县', '遵义市湄潭县贵州省遵义市湄潭县湄江街道鸡场居温泉安置房大林路11栋151号', '27.744547', '107.438675', '湄潭县大林路茅台酱香万家共享主题终端', '湄潭县百事兴贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2909, '137371330001', '山东省', '临沂市', '兰山区', '临沂市兰山区解放路183号', '35.066838', '118.332566', '临沂市解放路贵州茅台专卖柜', '山东九州商业集团有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2910, '22341200011102', '安徽省', '阜阳市', '颍州区', '阜阳市颍州区安徽省阜阳市颍州区淮河路颍上路交叉口天瑞名城A区', '32.867529', '115.831078', '淮河路茅台酱香万家共享主题终端', '阜阳市旭驰贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2911, '143430723001', '湖南省', '湘西土家族苗族自治州', '吉首市', '湘西土家族苗族自治州吉首市小溪桥社区世纪大道移动公司1楼门面中国银行对面', '28.263542', '109.702097', '吉首市世纪大道贵州茅台专卖店', '湘西博睿贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2912, '22330424003001', '浙江省', '嘉兴市', '海盐县', '嘉兴市海盐县武原街道新桥北路166-9号S15', '27.31', '119.8', '海盐县武原街道新桥北路茅台酱香万家共享主题终端', '海盐县武原鑫茂酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2913, '22330525002001', '浙江省', '杭州市', '萧山区', '杭州市萧山区钱江世纪城奥体万科中心A座1楼160-1室', '30.24702575', '120.2465217', '萧山区钱江世纪城茅台酱香万家共享主题终端', '杭州习水村酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2914, '22420100075076', '湖北省', '武汉市', '江汉区', '武汉市江汉区武汉市江汉区建设大道715号', '30.597632', '114.273725', '江汉区建设大道茅台酱香万家共享主题终端', '武汉茅和五商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2915, '152522301001', '贵州省', '黔西南布依族苗族自治州', '兴义市', '黔西南布依族苗族自治州兴义市桔山街道鑫凯桔山湖七期B1栋-1层16号房门面', '25.120688', '104.934706', '兴义市万峰大道贵州茅台专卖店', '兴义市轩凯经贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2916, 'B44000000301', '广东省', '广州市', '天河区', '广州市天河区广州市天河区珠江西路5号负一层60房（部位：自编B120c单元）', '23.118167', '113.323354', '广州市珠江西路5号贵州茅台旗舰店', '广州玖凌供应链投资有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2917, '144440100001', '广东省', '广州市', '越秀区', '广州市越秀区环市中路321号', '23.139677', '113.279282', '广州市环市中路贵州茅台专卖店', '广州市皓迪贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2918, '2261063300201', '陕西省', '延安市', '宝塔区', '延安市宝塔区延安新区杨家岭北苑东门', '36.644594', '109.484246', '延安新区贵州茅台酱香系列酒体验中心', '延安林林工贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2919, '144441481001', '广东省', '梅州市', '梅县区', '梅州市梅县区剑英大道御元阳光城Ａ3栋102-104号店面', '24.268514', '116.066842', '梅州市剑英大道贵州茅台专卖店', '广州广兴湖酒业发展有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2920, '144441781001', '广东省', '阳江市', '阳春市', '阳江市阳春市春城大道豪景苑3栋12号-13号', '22.146471', '111.795023', '阳春市春城大道贵州茅台专卖店', '广东酒检酒业连锁有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2921, '22410189011001', '河南省', '郑州市', '金水区', '郑州市金水区郑东新区聚源路宏昌街向西100米路南', '34.749962', '113.738309', '郑东新区宏昌街茅台酱香万家共享主题终端', '河南行道贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2922, '162620127001', '甘肃省', '兰州市', '安宁区', '兰州市安宁区银安路929号', '36.098121', '103.702594', '兰州市银安路贵州茅台专卖店', '兰州君之威商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2923, '22321402002001', '江苏省', '泰州市', '海陵区', '泰州市海陵区扬州路119号', '32.5', '119.91', '海陵区扬州路茅台酱香万家共享主题终端', '泰州市曹驰商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2924, '151513701001', '四川省', '巴中市', '巴州区', '巴中市巴州区巴州区望王路东段187号-189号', '31.860018', '106.756627', '巴中市望王路东段贵州茅台专卖店', '巴中市大正品商贸有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2925, '141410700002', '河南省', '新乡市', '牧野区', '新乡市牧野区平原路与新七街交汇处东北角惠邦华恩城西区15号楼1楼', '35.305519', '113.952246', '新乡市平原路贵州茅台专卖店', '新乡市国源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2926, '2311022800001', '北京市', '北京市', '密云区', '北京市密云区行宫街55号', '40.390702', '116.868639', '北京市行宫街茅台酱香万家共享主题终端', '北京金正环球贸易中心', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2927, '2332048500002', '江苏省', '常州市', '钟楼区', '常州市钟楼区怀德北路73-1号', '31.788803', '119.951031', '常州市怀德北路茅台酱香万家共享主题终端', '江苏大隆汇文化科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2928, 'B63010400101', '青海省', '西宁市', '城西区', '西宁市城西区青海省西宁市城西区广场路1号万达广场一楼1F-02号商铺', '36.642648', '101.715828', '西宁市城西区广场路1号贵州茅台旗舰店', '西宁琢萃茅凌商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2929, '132320923002', '江苏省', '盐城市', '阜宁县', '盐城市阜宁县澳门路521-523-525号', '33.771415', '119.797426', '盐城市澳门路贵州茅台专卖店', '阜宁县泓宇酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2930, '142420600005', '湖北省', '襄阳市', '樊城区', '襄阳市樊城区卧龙大道88号（普陀龙湾商业街）', '32.073276', '112.113805', '襄阳市卧龙大道贵州茅台专卖店', '湖北和丰经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2931, '144440424002', '广东省', '珠海市', '香洲区', '珠海市香洲区兴柠街1号福康花园二期10栋1336号商铺', '22.262724', '113.549483', '珠海市迎宾北路贵州茅台专卖店', '珠海市海沁贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2932, '132320594003', '江苏省', '苏州市', '吴中区', '苏州市吴中区李公堤二期A1幢101*102', '31.302861', '120.682611', '苏州市李公堤贵州茅台文化体验馆', '苏州绝世风华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2933, '112120113002', '天津市', '天津市', '北辰区', '天津市北辰区宜兴路与贵富道交口西南侧新乐汇商业中心1号楼1-101、102', '39.19991', '117.217333', '天津市宜兴路贵州茅台专卖店', '天津市星洲永耀商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2934, '2141032410001', '河南省', '洛阳市', '栾川县', '洛阳市栾川县伏牛南路52号', '33.775872', '111.623146', '洛阳市伏牛南路栾川县通达商贸有限公司门店', '栾川县通达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2935, '2244030500001', '广东省', '深圳市', '龙岗区', '深圳市龙岗区龙城街道吉祥南路1号', '22.708163', '114.243511', '深圳市龙城街道贵州茅台酱香系列酒体验中心', '深圳市鹏茅实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2936, '2323092300001', '黑龙江省', '七台河市', '桃山区', '七台河市桃山区黑龙江省七台河市桃山区桃南街朝阳五组团A栋(大同街144号)', '45.76999', '131.013386', '七台河市新玛特茅台酱香万家共享主题终端', '七台河市桃山区春宝九弘酒行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2937, '103502060001', '福建省', '厦门市', '湖里区', '厦门市湖里区环岛东路2496-101号', '24.528125531475794', '118.19346070289613', '厦门市环岛东路贵州茅台自营店', '福建国酒茅台销售有限公司厦门分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2938, '121210283002', '辽宁省', '大连市', '庄河市', '大连市庄河市城关街道向阳路二段516号', '39.674267', '122.975263', '大连市向阳路贵州茅台专卖店', '大连泛瑞酒类商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2939, '2213030000002', '河北省', '秦皇岛市', '海港区', '秦皇岛市海港区和平大街174号', '39.934847', '119.578392', '秦皇岛市和平大街贵州茅台酱香系列酒体验中心', '秦皇岛市长益贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2940, '2111010110001', '北京市', '北京市', '丰台区', '北京市丰台区西三环南路19号内19-7-2', '39.87582', '116.311086', '北京市西三环南路北京醉纯京典商贸有限公司', '北京醉纯京典商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2941, '132320594001', '江苏省', '苏州市', '姑苏区', '苏州市姑苏区姑苏区葑门路12号', '31.300713', '120.651941', '苏州市葑门路贵州茅台专卖店', '苏州吉晟名酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2942, '132320594002', '江苏省', '苏州市', '虎丘区', '苏州市虎丘区枫津大街82号', '31.310355', '120.558249', '苏州市枫津大街贵州茅台专卖店', '苏州绝世风华酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2943, '2337293100003', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区八-路与青年路交叉口西30米路南', '35.24891', '115.4601', '菏泽市八一路茅台酱香万家共享主题终端', '菏泽市瑞贵酒水有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2944, 'B64010000201', '宁夏回族自治区', '银川市', '兴庆区', '银川市兴庆区宁夏回族自治区银川市兴庆区解放东街211号', '38.463029', '106.292147', '银川市兴庆区解放东街211号贵州茅台旗舰店', '银川新华百货连锁超市有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2945, '34110105099018001', '福建省', '泉州市', '石狮市', '泉州市石狮市1', '24.731969', '118.647945', '泉州市生威进出口贸易有限公司中心库', '泉州市生威进出口贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2946, '121210600001', '辽宁省', '丹东市', '振兴区', '丹东市振兴区青年大街72-2-9号', '40.112971', '124.37618', '丹东市青年大街贵州茅台专卖店', '丹东耘悦商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2947, '2321010000001', '辽宁省', '沈阳市', '浑南区', '沈阳市浑南区沈中大街28-18号', '41.698122', '123.461422', '沈阳市沈中大街茅台酱香万家共享主题终端', '辽宁紫霖实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2948, '2337293100002', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区广州路与丹阳路交叉口西北角', '35.238408', '115.522285', '菏泽市广州路茅台酱香万家共享主题终端', '菏泽贵族商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2949, '137370983001', '山东省', '泰安市', '肥城市', '泰安市肥城市泰临路24号', '36.189409', '116.782281', '泰安市泰临路贵州茅台专卖店', '肥城市鑫泉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2950, '237371582001', '山东省', '聊城市', '东昌府区', '聊城市东昌府区新区街道振兴东路45号贵州茅台名烟名酒城', '36.468412', '115.991152', '聊城市振兴东路贵州茅台43度经销店', '聊城市连琨酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2951, '2351118200001', '四川省', '乐山市', '市中区', '乐山市市中区至乐路777号3幢4区1楼51号', '29.603923', '103.719142', '乐山市至乐路茅台酱香万家共享主题终端', '四川天汇嘉盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2952, '23330188002303', '浙江省', '杭州市', '上城区', '杭州市上城区杭州市上城区九和路325号物产天地中心1幢107室', '30.303474', '120.250608', '物产中大云商贵州茅台酱香系列酒体验中心（杭州旗舰店）', '物产中大云商有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2953, '23330188002304', '浙江省', '杭州市', '上城区', '杭州市上城区九和路325号物产天地中心1幢107室', '30.304237', '120.250911', '上城区九和路贵州茅台酱香系列酒体验中心', '物产中大云商有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2954, '112120101003', '天津市', '天津市', '滨海新区', '天津市滨海新区杭州道街福建北路15号增4号', '39.040311', '117.65125', '天津市福建北路贵州茅台专卖店', '天津中糖华丰实业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2955, '22522428007001', '贵州省', '遵义市', '湄潭县', '遵义市湄潭县湄江街道桃园巷湄江四小旁', '27.773528', '107.48414', '湄潭县湄江街道茅台酱香万家共享主题终端', '贵州茗城汇中商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2956, '23430000004010', '湖南省', '怀化市', '鹤城区', '怀化市鹤城区湖天大道南郡新干线7栋106号', '27.525284', '109.987088', '中玉商贸鹤城区湖天大道体验中心', '怀化市中玉商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2957, '22342401001001', '安徽省', '六安市', '裕安区', '六安市裕安区解放南路和顺名都城61号楼08号商铺', '31.735719', '116.503999', '解放南路和顺名都城茅台酱香万家共享主题终端', '六安市阳光商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2958, '2211010200001', '北京市', '北京市', '朝阳区', '北京市朝阳区通惠河北路69号院2号楼1层4单元1-17', '39.903615', '116.439732', '朝阳区通惠河北路贵州茅台酱香系列酒体验中心', '北京欧亚凯盛贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2959, '22320583001002', '江苏省', '苏州市', '昆山市', '苏州市昆山市昆山市玉山镇朝阳西路2011号昆山万家汇商贸城3号楼1071-1072室', '31.370635', '120.921708', '昆山市朝阳西路茅台酱香万家共享主题终端', '昆山市国茅酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2960, '250500112005', '重庆市', '重庆市', '渝北区', '重庆市渝北区镜泊中路5号4幢1层（118号119号）', '29.634651', '106.531126', '重庆市镜泊中路贵州茅台专卖店', '重庆瑞干商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2961, '75500253', '北京市', '北京市', '朝阳区', '北京市朝阳区北京市朝阳区朝来科技园东区紫月路18号院2号楼澳睿跑大厦4层', '40.019661', '116.474375', '北京市紫月路贵州茅台专卖店', '北京友宝在线科技股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2962, '114140100003', '山西省', '太原市', '万柏林区', '太原市万柏林区千峰南路南上庄东街口上庄凤玺湾5号楼1层1007商铺', '37.8234', '112.516311', '太原市千峰南路贵州茅台专卖店', '太原佰事吉祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2963, '34410100087019001', '河南省', '鹤壁市', '淇滨区', '鹤壁市淇滨区1', '35.741763', '114.298748', '鹤壁市众城曹曹商贸有限公司中心库', '鹤壁市众城曹曹商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2964, '114140100002', '山西省', '太原市', '小店区', '太原市小店区龙城北街190号中冶丽苑第一幢B座1-2层1002、1003', '37.775926', '112.548192', '太原市龙城北街贵州茅台专卖店', '太原瑞广兴科贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2965, '114140100001', '山西省', '太原市', '迎泽区', '太原市迎泽区解放南路103号', '37.839634', '112.560954', '太原市解放南路贵州茅台专卖店', '山西糖酒副食有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2966, '163633202001', '青海省', '海东市', '平安区', '海东市平安区南环路 东郡丽都底商', '36.494848', '102.098529', '海东市南环路贵州茅台专卖店', '西宁华仔酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2967, '2341018300002', '河南省', '郑州市', '新密市', '郑州市新密市青屏大街与大鸿路交叉口东南角东100m', '34.53944', '113.362708', '新密市青屏大街茅台酱香万家共享主题终端', '新密市青屏宏发副食百货文具商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2968, '135350100002', '福建省', '福州市', '鼓楼区', '福州市鼓楼区鼓西街道湖滨路110号西湖新庄一楼', '26.091185', '119.29298', '福州市湖滨路贵州茅台专卖店', '福建省糖酒杨桥贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2969, '114140100007', '山西省', '太原市', '小店区', '太原市小店区武宿机场Ｔ2航站楼2D108号', '37.754861', '112.636291', '太原市武宿机场贵州茅台专卖店', '晋中市合源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2970, '114140100006', '山西省', '太原市', '杏花岭区', '太原市杏花岭区北大街绿柳巷交叉口', '37.888023', '112.556294', '太原市北大街贵州茅台自营店', '山西国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2971, '2244042300001', '广东省', '珠海市', '斗门区', '珠海市斗门区井岸镇江湾中路155~159号', '22.198269', '113.30459', '珠海市井岸镇贵州茅台酱香系列酒体验中心', '珠海市斗门永生隆贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2972, '22372901003001', '山东省', '菏泽市', '牡丹区', '菏泽市牡丹区华英路八一路路口南一百米路西', '35.246752', '115.492007', '牡丹区华英路茅台酱香万家共享主题终端', '菏泽九都食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2973, '653131001', '新疆维吾尔自治区', '喀什地区', '喀什市', '喀什地区喀什市克孜都维路17号', '39.462747', '75.979783', '喀什月勤商贸有限公司中心库', '喀什月勤商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2974, '2337132100001', '山东省', '临沂市', '沂南县', '临沂市沂南县正阳路与澳柯玛大道交汇处', '35.532956', '118.469276', '沂南县正阳路茅台酱香万家共享主题终端', '沂南县百德信商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2975, '22520182010001', '贵州省', '贵阳市', '观山湖区', '贵阳市观山湖区贵州省贵阳市观山湖区金华园街道金湖路恒大金阳新世界金湖路（博强商贸）', '26.672215', '106.6268', '观山湖区金华园街道茅台酱香万家共享主题终端', '贵州博强商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2976, '2232010000001', '江苏省', '南京市', '江宁区', '南京市江宁区麒麟街道智通路199号', '32.025711', '118.903747', '南京市智通路贵州茅台酱香系列酒体验中心', '南京酩酒源贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2977, '22642400003001', '宁夏回族自治区', '银川市', '金凤区', '银川市金凤区尚景世家14号楼18号营业房', '38.485461', '106.24302', '金凤区尹家渠北街茅台酱香万家共享主题终端', '宁夏恒昌盈润贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2978, '2112010210001', '天津市', '天津市', '河东区', '天津市河东区卫国道132号', '39.142808', '117.252104', '天津市卫国道天津市裕隆达商贸有限公司门店', '天津市裕隆达商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2979, '114142728002', '山西省', '运城市', '河津市', '运城市河津市汾滨街华亭国际一层底商', '35.598585', '110.70549', '河津市汾滨街龙门大道贵州茅台专卖店', '山西格信经贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2980, '135350100008', '福建省', '福州市', '晋安区', '福州市晋安区新店镇南平路口98号1#楼101-102单元', '26.13157', '119.314393', '福州市新店镇南平路贵州茅台专卖店', '福州名庄贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2981, '135350100009', '福建省', '福州市', '仓山区', '福州市仓山区下渡街道南江滨西大道136号世欧·上江城2号楼贵州茅台自营店', '26.046734', '119.337272', '福州市美墩路贵州茅台自营店', '福建国酒茅台销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2982, '2151018110001', '四川省', '成都市', '都江堰市', '成都市都江堰市太极巷5号', '30.992549', '103.626906', '都江堰市太极巷成都市起腾商贸有限公司门店', '成都市起腾商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2983, '132320582001', '江苏省', '苏州市', '张家港市', '苏州市张家港市杨舍镇东环路125，127，129号', '31.8606', '120.552398', '苏州市杨舍镇东环路贵州茅台专卖店', '张家港新百通贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2984, '113130200002', '河北省', '唐山市', '路北区', '唐山市路北区张大里金色家园北新西道38-6号、38-7号', '39.632979', '118.145824', '唐山市北新西道贵州茅台专卖店', '唐山朝旭商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2985, '141100001', '山西省', '吕梁市', '方山县', '吕梁市方山县大武镇大式四村42号', '37.671808', '111.173891', '山西丰达远通商贸有限公司中心库', '山西丰达远通商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2986, '135350100010', '福建省', '福州市', '晋安区', '福州市晋安区鼓山镇福洋路9号香开连天花园SY2楼01、02、03店面', '26.09037', '119.357019', '福州市福洋路贵州茅台专卖店', '福建普佰汇贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2987, '21370283003005', '山东省', '青岛市', '平度市', '青岛市平度市平度市红旗路4-24号', '36.787886', '119.98145', '平度市红旗路茅台酱香万家共享主题终端名仕店', '青岛熠辉食品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2988, '753301020001', '浙江省', '杭州市', '上城区', '杭州市上城区秋涛路178号17幢423室', '30.221675', '120.17808', '小凌（杭州）品牌管理有限公司', '小凌（杭州）品牌管理有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2989, '21370283003004', '山东省', '青岛市', '平度市', '青岛市平度市山东省青岛市平度市常州路103-2号', '36.786977', '119.956143', '平度市常州路茅台酱香万家共享主题终端金荷相府店', '青岛熠辉食品商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2990, '133330786001', '浙江省', '金华市', '婺城区', '金华市婺城区西关街道永康街340-342号', '29.087064', '119.647811', '金华市永康街贵州茅台专卖店', '浙江君道酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2991, '142422831002', '湖北省', '恩施土家族苗族自治州', '恩施市', '恩施土家族苗族自治州恩施市金山大道（金山壹号）商业楼幢117-120号', '30.302616', '109.485215', '恩施市金山大道贵州茅台专卖店', '恩施市祺恩商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2992, '112120300001', '天津市', '天津市', '河西区', '天津市河西区平山道与卫津路交口君禧华庭配建5-135、136', '39.097872', '117.180048', '天津市吴家窑大街贵州茅台专卖店', '天津市悦淼商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2993, '251511000001', '四川省', '内江市', '市中区', '内江市市中区公园街118号（甜城大厦停车场）', '29.584884', '105.064911', '内江街心花园贵州茅台43度经销（茅台酒）', '四川内江甜城糖酒有限公司糖酒分公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2994, '22412701001001', '河南省', '周口市', '川汇区', '周口市川汇区建安路与七一路交叉口南400米路西馥泽园小区一楼107铺', '33.615333', '114.673008', '川汇区建安路茅台酱香万家共享主题终端', '周口华富酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2995, '22370200007002', '山东省', '青岛市', '崂山区', '青岛市崂山区香港东路108号网点', '36.070995', '120.437736', '崂山区香港东路茅台酱香万家共享主题终端', '青岛福兴祥商品配送有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2996, '2241270100003', '河南省', '郑州市', '金水区', '郑州市金水区商务内环路与西七街交叉口商务内环路3号', '34.768528', '113.722803', '郑州市西七街贵州茅台酱香系列酒体验中心', '郑州强东商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2997, '2145022710001', '广西壮族自治区', '柳州市', '鱼峰区', '柳州市鱼峰区西江路27号之1号', '24.309437', '109.450294', '柳州市东环路柳州市富尚贸易有限公司门店', '柳州市富尚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2998, '34410100087007001', '河南省', '许昌市', '魏都区', '许昌市魏都区1', '34.047189', '113.830826', '许昌市魏都区博悦名酒商行中心库', '许昌市魏都区博悦名酒商行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (2999, '133330300003', '浙江省', '温州市', '鹿城区', '温州市鹿城区车站大道20-24', '27.984088', '120.685324', '温州市车站大道贵州茅台专卖店', '温州中和福酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3000, '242420130005', '湖北省', '武汉市', '洪山区', '武汉市洪山区梨园街徐东大街', '30.579141', '114.358957', '武汉市梨园街贵州茅台专卖店', '武汉万佳福酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3001, '2352263200001', '贵州省', '黔东南苗族侗族自治州', '榕江县', '黔东南苗族侗族自治州榕江县古州镇滨江-号小区5号商业楼1号商铺', '25.920959', '108.516511', '榕江县古州镇茅台酱香万家共享主题终端', '榕江县天禄九酝酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3002, '242420130004', '湖北省', '武汉市', '武昌区', '武汉市武昌区水果湖街道公正路26号9栋1-2层16/17商铺', '30.554516', '114.328496', '武汉市公正路贵州茅台专卖店', '武汉市洪兴糖酒商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3003, '2145300710002', '广西壮族自治区', '河池市', '金城江区', '河池市金城江区西环路389号', '24.694325', '108.042679', '河池市西环路河池市微客商贸有限公司门店', '河池市微客商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3004, '134341200002', '安徽省', '阜阳市', '颍泉区', '阜阳市颍泉区颍州北路226号', '32.908977', '115.824514', '阜阳市颍州北路贵州茅台专卖店', '安徽省阜阳市永发糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3005, '2145300710001', '广西壮族自治区', '梧州市', '长洲区', '梧州市长洲区新兴二路104-1号-层1-1号商铺。1-1号自行车库', '23.479068', '111.279634', '梧州市新兴二路广西梧州市圣露商贸有限公司门店', '广西梧州市圣露商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3006, '242420130001', '湖北省', '武汉市', '洪山区', '武汉市洪山区洪山区金地自在城3期2栋1层4号', '30.60453', '114.386462', '武汉市团结大道贵州茅台专卖店', '湖北十里香酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3007, '137373005001', '山东省', '威海市', '环翠区', '威海市环翠区大庆路53号九龙城购物广场', '37.422105', '122.172486', '威海市大庆路贵州茅台专卖店', '家家悦集团股份有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3008, '242420130002', '湖北省', '武汉市', '武昌区', '武汉市武昌区武汉市东湖路142号', '30.560196', '114.369603', '武汉市东湖路贵州茅台专卖店', '武汉东湖宾馆', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3009, '22120113003001', '天津市', '天津市', '北辰区', '天津市北辰区双街镇顺风路15号', '39.26', '117.11', '北辰区双街镇顺风路茅台酱香万家共享主题终端', '天津世诚源国际贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3010, '133330681001', '浙江省', '绍兴市', '诸暨市', '绍兴市诸暨市艮塔东路199（1-3）号', '29.696999', '120.251527', '诸暨市艮塔东路贵州茅台专卖店', '诸暨市精诚贸易有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3011, '150500103005', '重庆市', '重庆市', '渝中区', '重庆市渝中区八一路53号第一层12-7商铺', '29.558286', '106.579448', '重庆市八一路贵州茅台自营店', '重庆茅台酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3012, '21130400005006', '河北省', '邯郸市', '邯山区', '邯郸市邯山区邯郸市邯山区中华南大街甲52号第6幢9号门市', '36.592283', '114.492123', '邯郸市乐园商贸有限公司自有门店', '邯郸市乐园商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3013, '133330681002', '浙江省', '绍兴市', '诸暨市', '绍兴市诸暨市东福路61号', '29.705319', '120.275597', '诸暨市东福路贵州茅台专卖店', '诸暨西子茅台酒销售有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3014, '150500103003', '重庆市', '重庆市', '綦江区', '重庆市綦江区古南街道中山路6号附4号', '29.026005', '106.652602', '重庆市中山路贵州茅台专卖店', '重庆市綦江区储备粮有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3015, '22352202008001', '福建省', '三明市', '三元区', '三明市三元区富兴堡街道江滨南路（永嘉天地）80-2号', '26.2273', '117.5979', '三元区富兴堡街道茅台酱香万家共享主题终端', '三明市博祥商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3016, '21413100010014', '河南省', '三门峡市', '湖滨区', '三门峡市湖滨区二街坊丽景湾1号楼3单元0106号', '34.759698', '111.213378', '三门峡市湖滨区普惠日用百货店（个体工商户）', '河南省钰辉食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3017, '141410184001', '河南省', '郑州市', '新郑市', '郑州市新郑市新郑市创业路与中华路交叉口迷你港湾6号楼1单元6105商铺', '34.420381', '113.758624', '新郑市创业路贵州茅台专卖店', '新郑市双盛商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3018, '152522625001', '贵州省', '黔东南苗族侗族自治州', '镇远县', '黔东南苗族侗族自治州镇远县舞阳镇好美溪上2栋1单元102', '27.052413', '108.400299', '镇远县好美溪上贵州茅台专卖店', '镇远县嘉丽酒业有限责任公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3019, '2237020000002', '山东省', '青岛市', '崂山区', '青岛市崂山区松岭路46号迪生山庄4号网点', '36.101361', '120.479805', '青岛市松岭路贵州茅台酱香系列酒体验中心', '青岛鑫浩统达糖酒副食品有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3020, '221210186001', '辽宁省', '沈阳市', '沈河区', '沈阳市沈河区北三经街41号', '41.797494', '123.42554', '沈阳市北三经街贵州茅台专卖店', '沈阳副食糖酒有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3021, '141410700001', '河南省', '新乡市', '红旗区', '新乡市红旗区科隆大道与新二街交汇处向东100米路北和枫郡18号楼一楼', '35.275008', '113.924598', '新乡市科隆大道贵州茅台专卖店', '新乡市国源商贸有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3022, '2242069300001', '湖北省', '襄阳市', '樊城区', '襄阳市樊城区解放西路3号1幢（解放西路与米公路路口向东30米左边）', '32.03148', '112.14558', '襄阳市解放西路贵州茅台酱香系列酒体验中心', '襄阳市真诚祥瑞酒业有限公司', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3023, '2341072500001', '河南省', '新乡市', '原阳县', '新乡市原阳县惠民街名门世家西门', '35.062966', '113.948076', '原阳县惠民街茅台酱香万家共享主题终端', '原阳县海宇商贸行', '2024-07-11 14:57:05');
INSERT INTO `i_shop` VALUES (3024, '22310116006001', '上海市', '上海市', '青浦区', '上海市青浦区徐泾镇盈港东路1669号', '31.17305', '121.27507', '徐泾镇盈港东路茅台酱香万家共享主题终端', '上海梓宙商贸有限公司', '2024-07-11 14:57:05');

-- ----------------------------
-- Table structure for i_user
-- ----------------------------
DROP TABLE IF EXISTS `i_user`;
CREATE TABLE `i_user`  (
  `mobile` bigint NOT NULL AUTO_INCREMENT COMMENT 'I茅台手机号',
  `user_id` bigint NULL DEFAULT NULL COMMENT 'I茅台用户id',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'I茅台toekn',
  `cookie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'I茅台cookie',
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `item_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品预约code，用@间隔',
  `ishop_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品门店ID',
  `province_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整地址',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `minute` int NULL DEFAULT 5 COMMENT '预约的分钟（0-59）',
  `shop_type` int NULL DEFAULT 1 COMMENT '1:预约本市出货量最大的门店;2:预约你的位置(经纬度)附近门店;',
  `random_minute` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '随机分钟预约，9点取一个时间（0:随机，1:不随机）',
  `push_plus_token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'push_plus_token',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回参数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '\0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18028616137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'I茅台用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of i_user
-- ----------------------------
INSERT INTO `i_user` VALUES (15162421714, 1142935269, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjM5MjQ1NiwidXNlcklkIjoxMTQyOTM1MjY5LCJkZXZpY2VJZCI6IjljNzRmYzZkLTMyOTMtNDc0ZC1iYjVhLWZlMDRmZTYyOTVjZCIsImlhdCI6MTcxOTgwMDQ1Nn0.fMkioImGIPcLsucLVrYZIUFbwO6beNuGwK5EidxrL_M', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjM5MjQ1NiwidXNlcklkIjoxMTQyOTM1MjY5LCJkZXZpY2VJZCI6IjljNzRmYzZkLTMyOTMtNDc0ZC1iYjVhLWZlMDRmZTYyOTVjZCIsImlhdCI6MTcxOTgwMDQ1Nn0.AglcqsQ0-ijogP9sd-4ej8arcsyDU9s0hSP7NSz72_c', '9c74fc6d-3293-474d-bb5a-fe04fe6295cd', '10941@', '132320500001', '江苏省', '苏州市', NULL, '31.307681', '120.628841', 5, 0, '0', NULL, '{\"code\":2000,\"data\":{\"userId\":1142935269,\"userName\":\"邓**\",\"mobile\":\"151****1714\",\"verifyStatus\":1,\"idCode\":\"432522199404251390\",\"idType\":0,\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjM5MjQ1NiwidXNlcklkIjoxMTQyOTM1MjY5LCJkZXZpY2VJZCI6IjljNzRmYzZkLTMyOTMtNDc0ZC1iYjVhLWZlMDRmZTYyOTVjZCIsImlhdCI6MTcxOTgwMDQ1Nn0.fMkioImGIPcLsucLVrYZIUFbwO6beNuGwK5EidxrL_M\",\"userTag\":0,\"cookie\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjM5MjQ1NiwidXNlcklkIjoxMTQyOTM1MjY5LCJkZXZpY2VJZCI6IjljNzRmYzZkLTMyOTMtNDc0ZC1iYjVhLWZlMDRmZTYyOTVjZCIsImlhdCI6MTcxOTgwMDQ1Nn0.AglcqsQ0-ijogP9sd-4ej8arcsyDU9s0hSP7NSz72_c\",\"did\":\"did:mt:1:0x400c44559b1f1e13162d1e8c78fb6b28a68886d3f8a0916fd655e27107565811\",\"birthday\":\"1994-04-25\"}}', '邓**', '2024-07-31 10:21:04', '0', NULL, 'admin', NULL, NULL);
INSERT INTO `i_user` VALUES (16628730228, 1108578656, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMDY2NzEwOSwidXNlcklkIjoxMTA4NTc4NjU2LCJkZXZpY2VJZCI6ImM3ZDNhNDBkLWFkZWMtNDljMi1iZWFiLWZmNWI5NGVjYzRjYyIsImlhdCI6MTcxODA3NTEwOX0.UI4MZ6j0hy85ugSlFqiZLs2CNg0U1Z8ntVu8Mv90cDk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMDY2NzEwOSwidXNlcklkIjoxMTA4NTc4NjU2LCJkZXZpY2VJZCI6ImM3ZDNhNDBkLWFkZWMtNDljMi1iZWFiLWZmNWI5NGVjYzRjYyIsImlhdCI6MTcxODA3NTEwOX0._FEZAOBXTB-SjoAZrTgFTRxfmSWDFQ1CHr4J_Dt4Xkg', 'c7d3a40d-adec-49c2-beab-ff5b94ecc4cc', '10941@', '2331011500003', '上海市', '上海市', NULL, '31.196113', '121.696178', 5, 0, '0', NULL, '{\"code\":2000,\"data\":{\"userId\":1108578656,\"userName\":\"郭**\",\"mobile\":\"166****0228\",\"verifyStatus\":1,\"idCode\":\"431321199502283478\",\"idType\":0,\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMDY2NzEwOSwidXNlcklkIjoxMTA4NTc4NjU2LCJkZXZpY2VJZCI6ImM3ZDNhNDBkLWFkZWMtNDljMi1iZWFiLWZmNWI5NGVjYzRjYyIsImlhdCI6MTcxODA3NTEwOX0.UI4MZ6j0hy85ugSlFqiZLs2CNg0U1Z8ntVu8Mv90cDk\",\"userTag\":0,\"cookie\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMDY2NzEwOSwidXNlcklkIjoxMTA4NTc4NjU2LCJkZXZpY2VJZCI6ImM3ZDNhNDBkLWFkZWMtNDljMi1iZWFiLWZmNWI5NGVjYzRjYyIsImlhdCI6MTcxODA3NTEwOX0._FEZAOBXTB-SjoAZrTgFTRxfmSWDFQ1CHr4J_Dt4Xkg\",\"did\":\"did:mt:1:0x673302b4114b78a8a8a15fe360a4bdb0726f611962a69a9274abc1d80651a8b5\",\"birthday\":\"1995-02-28\"}}', '郭**', '2024-07-11 11:05:33', '0', NULL, 'admin', NULL, NULL);
INSERT INTO `i_user` VALUES (18028616136, 1166652395, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjQ3NzYwMSwidXNlcklkIjoxMTY2NjUyMzk1LCJkZXZpY2VJZCI6ImUxMDM2YzVmLTlmOTctNDMxZC1iNzAwLTQyOWIxYTdjODFiOCIsImlhdCI6MTcxOTg4NTYwMX0.5xXG0MlXpL4q7B2iWe_sN_-ltMaaQh9Of0FSrlVz3hw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjQ3NzYwMSwidXNlcklkIjoxMTY2NjUyMzk1LCJkZXZpY2VJZCI6ImUxMDM2YzVmLTlmOTctNDMxZC1iNzAwLTQyOWIxYTdjODFiOCIsImlhdCI6MTcxOTg4NTYwMX0.O0N48kj9H0tfOhdIxUhxR9dwEODPEJDM_RMjKRqS-oI', 'e1036c5f-9f97-431d-b700-429b1a7c81b8', '10941@', '132320500001', '江苏省', '苏州市', NULL, '31.307681', '120.628841', 5, 0, '0', NULL, '{\"code\":2000,\"data\":{\"userId\":1166652395,\"userName\":\"用户1166652395\",\"mobile\":\"180****6136\",\"verifyStatus\":0,\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjQ3NzYwMSwidXNlcklkIjoxMTY2NjUyMzk1LCJkZXZpY2VJZCI6ImUxMDM2YzVmLTlmOTctNDMxZC1iNzAwLTQyOWIxYTdjODFiOCIsImlhdCI6MTcxOTg4NTYwMX0.5xXG0MlXpL4q7B2iWe_sN_-ltMaaQh9Of0FSrlVz3hw\",\"userTag\":0,\"cookie\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJtdCIsImV4cCI6MTcyMjQ3NzYwMSwidXNlcklkIjoxMTY2NjUyMzk1LCJkZXZpY2VJZCI6ImUxMDM2YzVmLTlmOTctNDMxZC1iNzAwLTQyOWIxYTdjODFiOCIsImlhdCI6MTcxOTg4NTYwMX0.O0N48kj9H0tfOhdIxUhxR9dwEODPEJDM_RMjKRqS-oI\"}}', '用户1166652395', '2024-08-01 10:00:11', '0', NULL, 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-07 10:32:34', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-07 10:32:34', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-06-07 10:32:34', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-07 10:32:34', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-07 10:32:34', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-06-07 10:32:34', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-06-07 10:32:34', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_job` VALUES (101, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '0/4 * * * * ?', '1', '1', '1', 'admin', '2024-06-18 16:36:03', 'admin', '2024-06-18 16:38:40', '');
INSERT INTO `sys_job` VALUES (102, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '0 0 10 * * ?', '1', '1', '0', 'admin', '2024-06-24 10:27:29', '', '2024-06-24 10:32:03', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 357 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：7毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:06');
INSERT INTO `sys_job_log` VALUES (2, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:08');
INSERT INTO `sys_job_log` VALUES (3, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:12');
INSERT INTO `sys_job_log` VALUES (4, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:16');
INSERT INTO `sys_job_log` VALUES (5, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:20');
INSERT INTO `sys_job_log` VALUES (6, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:24');
INSERT INTO `sys_job_log` VALUES (7, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：14852毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:42');
INSERT INTO `sys_job_log` VALUES (8, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:42');
INSERT INTO `sys_job_log` VALUES (9, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:42');
INSERT INTO `sys_job_log` VALUES (10, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.NumberFormatException: For input string: \"com.wondersgroup.biz.task.ParamBean(\'bob\'#10\"\r\n	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n	at java.base/java.lang.Integer.parseInt(Integer.java:665)\r\n	at java.base/java.lang.Integer.valueOf(Integer.java:992)\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:153)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:36:42');
INSERT INTO `sys_job_log` VALUES (11, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：15439毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:35');
INSERT INTO `sys_job_log` VALUES (12, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：495毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:36');
INSERT INTO `sys_job_log` VALUES (13, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1673毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:38');
INSERT INTO `sys_job_log` VALUES (14, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:38');
INSERT INTO `sys_job_log` VALUES (15, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：15毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:38');
INSERT INTO `sys_job_log` VALUES (16, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:38');
INSERT INTO `sys_job_log` VALUES (17, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:40');
INSERT INTO `sys_job_log` VALUES (18, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:44');
INSERT INTO `sys_job_log` VALUES (19, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：3毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:48');
INSERT INTO `sys_job_log` VALUES (20, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:37:52');
INSERT INTO `sys_job_log` VALUES (21, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：9毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:38:21');
INSERT INTO `sys_job_log` VALUES (22, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:38:24');
INSERT INTO `sys_job_log` VALUES (23, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:38:28');
INSERT INTO `sys_job_log` VALUES (24, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:38:32');
INSERT INTO `sys_job_log` VALUES (25, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:38:36');
INSERT INTO `sys_job_log` VALUES (26, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '1', 'java.lang.RuntimeException: 实例化引用参数异常:com.wondersgroup.biz.task.ParamBean\r\n	at com.gyd.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:148)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2024-06-18 16:38:40');
INSERT INTO `sys_job_log` VALUES (27, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：6358毫秒', '0', '', '2024-06-18 16:38:46');
INSERT INTO `sys_job_log` VALUES (28, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：377毫秒', '0', '', '2024-06-18 16:38:47');
INSERT INTO `sys_job_log` VALUES (29, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：3434毫秒', '0', '', '2024-06-18 16:38:51');
INSERT INTO `sys_job_log` VALUES (30, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:38:52');
INSERT INTO `sys_job_log` VALUES (31, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:38:56');
INSERT INTO `sys_job_log` VALUES (32, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:00');
INSERT INTO `sys_job_log` VALUES (33, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:04');
INSERT INTO `sys_job_log` VALUES (34, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:08');
INSERT INTO `sys_job_log` VALUES (35, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:12');
INSERT INTO `sys_job_log` VALUES (36, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:16');
INSERT INTO `sys_job_log` VALUES (37, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:20');
INSERT INTO `sys_job_log` VALUES (38, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:24');
INSERT INTO `sys_job_log` VALUES (39, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:28');
INSERT INTO `sys_job_log` VALUES (40, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:39:32');
INSERT INTO `sys_job_log` VALUES (41, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:39:36');
INSERT INTO `sys_job_log` VALUES (42, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:40');
INSERT INTO `sys_job_log` VALUES (43, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:44');
INSERT INTO `sys_job_log` VALUES (44, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:48');
INSERT INTO `sys_job_log` VALUES (45, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:52');
INSERT INTO `sys_job_log` VALUES (46, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:39:56');
INSERT INTO `sys_job_log` VALUES (47, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:00');
INSERT INTO `sys_job_log` VALUES (48, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:04');
INSERT INTO `sys_job_log` VALUES (49, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:08');
INSERT INTO `sys_job_log` VALUES (50, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:12');
INSERT INTO `sys_job_log` VALUES (51, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:16');
INSERT INTO `sys_job_log` VALUES (52, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:20');
INSERT INTO `sys_job_log` VALUES (53, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:24');
INSERT INTO `sys_job_log` VALUES (54, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:28');
INSERT INTO `sys_job_log` VALUES (55, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:32');
INSERT INTO `sys_job_log` VALUES (56, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:36');
INSERT INTO `sys_job_log` VALUES (57, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:40');
INSERT INTO `sys_job_log` VALUES (58, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:44');
INSERT INTO `sys_job_log` VALUES (59, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:40:48');
INSERT INTO `sys_job_log` VALUES (60, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:52');
INSERT INTO `sys_job_log` VALUES (61, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:40:56');
INSERT INTO `sys_job_log` VALUES (62, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:00');
INSERT INTO `sys_job_log` VALUES (63, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:41:04');
INSERT INTO `sys_job_log` VALUES (64, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:08');
INSERT INTO `sys_job_log` VALUES (65, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:12');
INSERT INTO `sys_job_log` VALUES (66, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:16');
INSERT INTO `sys_job_log` VALUES (67, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:20');
INSERT INTO `sys_job_log` VALUES (68, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:41:24');
INSERT INTO `sys_job_log` VALUES (69, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:28');
INSERT INTO `sys_job_log` VALUES (70, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:32');
INSERT INTO `sys_job_log` VALUES (71, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:36');
INSERT INTO `sys_job_log` VALUES (72, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：2毫秒', '0', '', '2024-06-18 16:41:40');
INSERT INTO `sys_job_log` VALUES (73, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:41:44');
INSERT INTO `sys_job_log` VALUES (74, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:48');
INSERT INTO `sys_job_log` VALUES (75, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:41:52');
INSERT INTO `sys_job_log` VALUES (76, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:41:56');
INSERT INTO `sys_job_log` VALUES (77, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:00');
INSERT INTO `sys_job_log` VALUES (78, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:04');
INSERT INTO `sys_job_log` VALUES (79, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:42:08');
INSERT INTO `sys_job_log` VALUES (80, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:42:12');
INSERT INTO `sys_job_log` VALUES (81, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:42:16');
INSERT INTO `sys_job_log` VALUES (82, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:20');
INSERT INTO `sys_job_log` VALUES (83, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:42:24');
INSERT INTO `sys_job_log` VALUES (84, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:28');
INSERT INTO `sys_job_log` VALUES (85, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:32');
INSERT INTO `sys_job_log` VALUES (86, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:36');
INSERT INTO `sys_job_log` VALUES (87, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:40');
INSERT INTO `sys_job_log` VALUES (88, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:44');
INSERT INTO `sys_job_log` VALUES (89, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:48');
INSERT INTO `sys_job_log` VALUES (90, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:42:52');
INSERT INTO `sys_job_log` VALUES (91, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:42:56');
INSERT INTO `sys_job_log` VALUES (92, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:43:00');
INSERT INTO `sys_job_log` VALUES (93, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:04');
INSERT INTO `sys_job_log` VALUES (94, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:08');
INSERT INTO `sys_job_log` VALUES (95, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:43:12');
INSERT INTO `sys_job_log` VALUES (96, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:16');
INSERT INTO `sys_job_log` VALUES (97, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:20');
INSERT INTO `sys_job_log` VALUES (98, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:24');
INSERT INTO `sys_job_log` VALUES (99, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:28');
INSERT INTO `sys_job_log` VALUES (100, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:43:32');
INSERT INTO `sys_job_log` VALUES (101, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:36');
INSERT INTO `sys_job_log` VALUES (102, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:40');
INSERT INTO `sys_job_log` VALUES (103, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:44');
INSERT INTO `sys_job_log` VALUES (104, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:48');
INSERT INTO `sys_job_log` VALUES (105, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:52');
INSERT INTO `sys_job_log` VALUES (106, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:43:56');
INSERT INTO `sys_job_log` VALUES (107, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:44:00');
INSERT INTO `sys_job_log` VALUES (108, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:04');
INSERT INTO `sys_job_log` VALUES (109, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:08');
INSERT INTO `sys_job_log` VALUES (110, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:12');
INSERT INTO `sys_job_log` VALUES (111, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:44:16');
INSERT INTO `sys_job_log` VALUES (112, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:20');
INSERT INTO `sys_job_log` VALUES (113, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:44:24');
INSERT INTO `sys_job_log` VALUES (114, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:28');
INSERT INTO `sys_job_log` VALUES (115, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:44:32');
INSERT INTO `sys_job_log` VALUES (116, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:36');
INSERT INTO `sys_job_log` VALUES (117, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:40');
INSERT INTO `sys_job_log` VALUES (118, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:44');
INSERT INTO `sys_job_log` VALUES (119, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:44:48');
INSERT INTO `sys_job_log` VALUES (120, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:52');
INSERT INTO `sys_job_log` VALUES (121, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:44:56');
INSERT INTO `sys_job_log` VALUES (122, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:45:00');
INSERT INTO `sys_job_log` VALUES (123, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:04');
INSERT INTO `sys_job_log` VALUES (124, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:08');
INSERT INTO `sys_job_log` VALUES (125, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:12');
INSERT INTO `sys_job_log` VALUES (126, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:16');
INSERT INTO `sys_job_log` VALUES (127, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:20');
INSERT INTO `sys_job_log` VALUES (128, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:24');
INSERT INTO `sys_job_log` VALUES (129, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:28');
INSERT INTO `sys_job_log` VALUES (130, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:45:32');
INSERT INTO `sys_job_log` VALUES (131, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:36');
INSERT INTO `sys_job_log` VALUES (132, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:40');
INSERT INTO `sys_job_log` VALUES (133, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:44');
INSERT INTO `sys_job_log` VALUES (134, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:48');
INSERT INTO `sys_job_log` VALUES (135, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:45:52');
INSERT INTO `sys_job_log` VALUES (136, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:45:56');
INSERT INTO `sys_job_log` VALUES (137, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:00');
INSERT INTO `sys_job_log` VALUES (138, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:04');
INSERT INTO `sys_job_log` VALUES (139, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:46:08');
INSERT INTO `sys_job_log` VALUES (140, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:12');
INSERT INTO `sys_job_log` VALUES (141, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:16');
INSERT INTO `sys_job_log` VALUES (142, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:20');
INSERT INTO `sys_job_log` VALUES (143, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:46:24');
INSERT INTO `sys_job_log` VALUES (144, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:28');
INSERT INTO `sys_job_log` VALUES (145, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:32');
INSERT INTO `sys_job_log` VALUES (146, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:46:36');
INSERT INTO `sys_job_log` VALUES (147, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:40');
INSERT INTO `sys_job_log` VALUES (148, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:44');
INSERT INTO `sys_job_log` VALUES (149, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:48');
INSERT INTO `sys_job_log` VALUES (150, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:46:52');
INSERT INTO `sys_job_log` VALUES (151, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:46:56');
INSERT INTO `sys_job_log` VALUES (152, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:00');
INSERT INTO `sys_job_log` VALUES (153, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:04');
INSERT INTO `sys_job_log` VALUES (154, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:47:08');
INSERT INTO `sys_job_log` VALUES (155, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:12');
INSERT INTO `sys_job_log` VALUES (156, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:16');
INSERT INTO `sys_job_log` VALUES (157, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:20');
INSERT INTO `sys_job_log` VALUES (158, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:24');
INSERT INTO `sys_job_log` VALUES (159, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:28');
INSERT INTO `sys_job_log` VALUES (160, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:32');
INSERT INTO `sys_job_log` VALUES (161, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:47:36');
INSERT INTO `sys_job_log` VALUES (162, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:40');
INSERT INTO `sys_job_log` VALUES (163, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:44');
INSERT INTO `sys_job_log` VALUES (164, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:48');
INSERT INTO `sys_job_log` VALUES (165, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:52');
INSERT INTO `sys_job_log` VALUES (166, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:47:56');
INSERT INTO `sys_job_log` VALUES (167, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:00');
INSERT INTO `sys_job_log` VALUES (168, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:04');
INSERT INTO `sys_job_log` VALUES (169, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:08');
INSERT INTO `sys_job_log` VALUES (170, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:12');
INSERT INTO `sys_job_log` VALUES (171, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:16');
INSERT INTO `sys_job_log` VALUES (172, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:20');
INSERT INTO `sys_job_log` VALUES (173, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:24');
INSERT INTO `sys_job_log` VALUES (174, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:28');
INSERT INTO `sys_job_log` VALUES (175, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:32');
INSERT INTO `sys_job_log` VALUES (176, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:36');
INSERT INTO `sys_job_log` VALUES (177, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:40');
INSERT INTO `sys_job_log` VALUES (178, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:44');
INSERT INTO `sys_job_log` VALUES (179, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:48');
INSERT INTO `sys_job_log` VALUES (180, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:52');
INSERT INTO `sys_job_log` VALUES (181, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:48:56');
INSERT INTO `sys_job_log` VALUES (182, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:49:00');
INSERT INTO `sys_job_log` VALUES (183, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:04');
INSERT INTO `sys_job_log` VALUES (184, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:08');
INSERT INTO `sys_job_log` VALUES (185, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:12');
INSERT INTO `sys_job_log` VALUES (186, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:16');
INSERT INTO `sys_job_log` VALUES (187, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:20');
INSERT INTO `sys_job_log` VALUES (188, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:24');
INSERT INTO `sys_job_log` VALUES (189, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:49:28');
INSERT INTO `sys_job_log` VALUES (190, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:32');
INSERT INTO `sys_job_log` VALUES (191, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:36');
INSERT INTO `sys_job_log` VALUES (192, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:40');
INSERT INTO `sys_job_log` VALUES (193, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:49:44');
INSERT INTO `sys_job_log` VALUES (194, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:48');
INSERT INTO `sys_job_log` VALUES (195, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:52');
INSERT INTO `sys_job_log` VALUES (196, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:49:56');
INSERT INTO `sys_job_log` VALUES (197, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:00');
INSERT INTO `sys_job_log` VALUES (198, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:04');
INSERT INTO `sys_job_log` VALUES (199, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:08');
INSERT INTO `sys_job_log` VALUES (200, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:12');
INSERT INTO `sys_job_log` VALUES (201, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:50:16');
INSERT INTO `sys_job_log` VALUES (202, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 16:50:20');
INSERT INTO `sys_job_log` VALUES (203, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:24');
INSERT INTO `sys_job_log` VALUES (204, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:28');
INSERT INTO `sys_job_log` VALUES (205, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:32');
INSERT INTO `sys_job_log` VALUES (206, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：8毫秒', '0', '', '2024-06-18 16:50:36');
INSERT INTO `sys_job_log` VALUES (207, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:40');
INSERT INTO `sys_job_log` VALUES (208, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:44');
INSERT INTO `sys_job_log` VALUES (209, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:48');
INSERT INTO `sys_job_log` VALUES (210, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:52');
INSERT INTO `sys_job_log` VALUES (211, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:50:56');
INSERT INTO `sys_job_log` VALUES (212, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:51:00');
INSERT INTO `sys_job_log` VALUES (213, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:51:04');
INSERT INTO `sys_job_log` VALUES (214, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:51:08');
INSERT INTO `sys_job_log` VALUES (215, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 16:51:12');
INSERT INTO `sys_job_log` VALUES (216, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：5毫秒', '0', '', '2024-06-18 17:05:32');
INSERT INTO `sys_job_log` VALUES (217, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:05:36');
INSERT INTO `sys_job_log` VALUES (218, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:05:40');
INSERT INTO `sys_job_log` VALUES (219, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:05:44');
INSERT INTO `sys_job_log` VALUES (220, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:05:48');
INSERT INTO `sys_job_log` VALUES (221, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:05:52');
INSERT INTO `sys_job_log` VALUES (222, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:05:56');
INSERT INTO `sys_job_log` VALUES (223, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:00');
INSERT INTO `sys_job_log` VALUES (224, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:04');
INSERT INTO `sys_job_log` VALUES (225, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 17:06:08');
INSERT INTO `sys_job_log` VALUES (226, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:12');
INSERT INTO `sys_job_log` VALUES (227, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:16');
INSERT INTO `sys_job_log` VALUES (228, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:20');
INSERT INTO `sys_job_log` VALUES (229, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 17:06:24');
INSERT INTO `sys_job_log` VALUES (230, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 17:06:28');
INSERT INTO `sys_job_log` VALUES (231, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:32');
INSERT INTO `sys_job_log` VALUES (232, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-18 17:06:36');
INSERT INTO `sys_job_log` VALUES (233, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:40');
INSERT INTO `sys_job_log` VALUES (234, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-18 17:06:44');
INSERT INTO `sys_job_log` VALUES (235, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：5毫秒', '0', '', '2024-06-20 14:47:03');
INSERT INTO `sys_job_log` VALUES (236, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:47:04');
INSERT INTO `sys_job_log` VALUES (237, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:47:08');
INSERT INTO `sys_job_log` VALUES (238, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:00');
INSERT INTO `sys_job_log` VALUES (239, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:00');
INSERT INTO `sys_job_log` VALUES (240, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:04');
INSERT INTO `sys_job_log` VALUES (241, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:08');
INSERT INTO `sys_job_log` VALUES (242, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:12');
INSERT INTO `sys_job_log` VALUES (243, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:16');
INSERT INTO `sys_job_log` VALUES (244, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:57:20');
INSERT INTO `sys_job_log` VALUES (245, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:57:24');
INSERT INTO `sys_job_log` VALUES (246, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:28');
INSERT INTO `sys_job_log` VALUES (247, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:32');
INSERT INTO `sys_job_log` VALUES (248, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:36');
INSERT INTO `sys_job_log` VALUES (249, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:40');
INSERT INTO `sys_job_log` VALUES (250, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:44');
INSERT INTO `sys_job_log` VALUES (251, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:48');
INSERT INTO `sys_job_log` VALUES (252, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:57:52');
INSERT INTO `sys_job_log` VALUES (253, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:57:56');
INSERT INTO `sys_job_log` VALUES (254, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:00');
INSERT INTO `sys_job_log` VALUES (255, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:04');
INSERT INTO `sys_job_log` VALUES (256, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:08');
INSERT INTO `sys_job_log` VALUES (257, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:58:12');
INSERT INTO `sys_job_log` VALUES (258, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:58:16');
INSERT INTO `sys_job_log` VALUES (259, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:58:20');
INSERT INTO `sys_job_log` VALUES (260, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:24');
INSERT INTO `sys_job_log` VALUES (261, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:28');
INSERT INTO `sys_job_log` VALUES (262, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:32');
INSERT INTO `sys_job_log` VALUES (263, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:36');
INSERT INTO `sys_job_log` VALUES (264, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:40');
INSERT INTO `sys_job_log` VALUES (265, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:44');
INSERT INTO `sys_job_log` VALUES (266, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:48');
INSERT INTO `sys_job_log` VALUES (267, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:58:52');
INSERT INTO `sys_job_log` VALUES (268, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：3毫秒', '0', '', '2024-06-20 14:59:08');
INSERT INTO `sys_job_log` VALUES (269, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:59:12');
INSERT INTO `sys_job_log` VALUES (270, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:16');
INSERT INTO `sys_job_log` VALUES (271, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:20');
INSERT INTO `sys_job_log` VALUES (272, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:24');
INSERT INTO `sys_job_log` VALUES (273, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:28');
INSERT INTO `sys_job_log` VALUES (274, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:32');
INSERT INTO `sys_job_log` VALUES (275, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:36');
INSERT INTO `sys_job_log` VALUES (276, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 14:59:40');
INSERT INTO `sys_job_log` VALUES (277, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:44');
INSERT INTO `sys_job_log` VALUES (278, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:48');
INSERT INTO `sys_job_log` VALUES (279, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:52');
INSERT INTO `sys_job_log` VALUES (280, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 14:59:56');
INSERT INTO `sys_job_log` VALUES (281, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:00');
INSERT INTO `sys_job_log` VALUES (282, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:04');
INSERT INTO `sys_job_log` VALUES (283, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:08');
INSERT INTO `sys_job_log` VALUES (284, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:00:12');
INSERT INTO `sys_job_log` VALUES (285, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:16');
INSERT INTO `sys_job_log` VALUES (286, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:20');
INSERT INTO `sys_job_log` VALUES (287, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:24');
INSERT INTO `sys_job_log` VALUES (288, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:28');
INSERT INTO `sys_job_log` VALUES (289, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:32');
INSERT INTO `sys_job_log` VALUES (290, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:36');
INSERT INTO `sys_job_log` VALUES (291, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:00:40');
INSERT INTO `sys_job_log` VALUES (292, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:44');
INSERT INTO `sys_job_log` VALUES (293, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:00:48');
INSERT INTO `sys_job_log` VALUES (294, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:52');
INSERT INTO `sys_job_log` VALUES (295, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:00:56');
INSERT INTO `sys_job_log` VALUES (296, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:00');
INSERT INTO `sys_job_log` VALUES (297, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:04');
INSERT INTO `sys_job_log` VALUES (298, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:01:08');
INSERT INTO `sys_job_log` VALUES (299, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:12');
INSERT INTO `sys_job_log` VALUES (300, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:16');
INSERT INTO `sys_job_log` VALUES (301, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:20');
INSERT INTO `sys_job_log` VALUES (302, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:24');
INSERT INTO `sys_job_log` VALUES (303, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:28');
INSERT INTO `sys_job_log` VALUES (304, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：2毫秒', '0', '', '2024-06-20 15:01:32');
INSERT INTO `sys_job_log` VALUES (305, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:01:36');
INSERT INTO `sys_job_log` VALUES (306, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:40');
INSERT INTO `sys_job_log` VALUES (307, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:44');
INSERT INTO `sys_job_log` VALUES (308, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:01:48');
INSERT INTO `sys_job_log` VALUES (309, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:52');
INSERT INTO `sys_job_log` VALUES (310, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:01:56');
INSERT INTO `sys_job_log` VALUES (311, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:00');
INSERT INTO `sys_job_log` VALUES (312, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:02:04');
INSERT INTO `sys_job_log` VALUES (313, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:02:08');
INSERT INTO `sys_job_log` VALUES (314, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:02:12');
INSERT INTO `sys_job_log` VALUES (315, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:16');
INSERT INTO `sys_job_log` VALUES (316, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:20');
INSERT INTO `sys_job_log` VALUES (317, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:24');
INSERT INTO `sys_job_log` VALUES (318, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:28');
INSERT INTO `sys_job_log` VALUES (319, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:32');
INSERT INTO `sys_job_log` VALUES (320, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:36');
INSERT INTO `sys_job_log` VALUES (321, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:40');
INSERT INTO `sys_job_log` VALUES (322, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:44');
INSERT INTO `sys_job_log` VALUES (323, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:02:48');
INSERT INTO `sys_job_log` VALUES (324, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:52');
INSERT INTO `sys_job_log` VALUES (325, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:02:56');
INSERT INTO `sys_job_log` VALUES (326, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:00');
INSERT INTO `sys_job_log` VALUES (327, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:04');
INSERT INTO `sys_job_log` VALUES (328, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:08');
INSERT INTO `sys_job_log` VALUES (329, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:12');
INSERT INTO `sys_job_log` VALUES (330, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:03:16');
INSERT INTO `sys_job_log` VALUES (331, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:20');
INSERT INTO `sys_job_log` VALUES (332, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:24');
INSERT INTO `sys_job_log` VALUES (333, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:03:28');
INSERT INTO `sys_job_log` VALUES (334, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:32');
INSERT INTO `sys_job_log` VALUES (335, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:36');
INSERT INTO `sys_job_log` VALUES (336, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：1毫秒', '0', '', '2024-06-20 15:03:40');
INSERT INTO `sys_job_log` VALUES (337, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:44');
INSERT INTO `sys_job_log` VALUES (338, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:48');
INSERT INTO `sys_job_log` VALUES (339, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:52');
INSERT INTO `sys_job_log` VALUES (340, '测试引用参数传递', 'DEFAULT', 'com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')', '测试引用参数传递 总共耗时：0毫秒', '0', '', '2024-06-20 15:03:56');
INSERT INTO `sys_job_log` VALUES (341, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：8毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:116)\r\n	at java.base/java.lang.reflect.Method.invoke(Method.java:578)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:64)\r\n	at com.gyd.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:36)\r\n	at com.gyd.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.gyd.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: java.lang.NullPointerException: Cannot invoke \"com.gyd.script.service.IApiInfoService.selectApiInfoList(com.gyd.script.domain.ApiInfo)\" because \"this.apiInfoService\" is null\r\n	at com.gyd.script.task.ToolTask.run(ToolTask.java:25)\r\n	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:104)\r\n	... 7 more\r\n', '2024-06-24 10:27:35');
INSERT INTO `sys_job_log` VALUES (342, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：304毫秒', '0', '', '2024-06-24 10:29:20');
INSERT INTO `sys_job_log` VALUES (343, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：21653毫秒', '0', '', '2024-06-24 10:30:29');
INSERT INTO `sys_job_log` VALUES (344, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：3278毫秒', '0', '', '2024-06-26 10:00:03');
INSERT INTO `sys_job_log` VALUES (345, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：216毫秒', '0', '', '2024-06-27 10:00:00');
INSERT INTO `sys_job_log` VALUES (346, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：204毫秒', '0', '', '2024-06-28 10:00:00');
INSERT INTO `sys_job_log` VALUES (347, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：291毫秒', '0', '', '2024-07-01 10:00:00');
INSERT INTO `sys_job_log` VALUES (348, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：212毫秒', '0', '', '2024-07-02 10:00:00');
INSERT INTO `sys_job_log` VALUES (349, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：198毫秒', '0', '', '2024-07-03 10:00:00');
INSERT INTO `sys_job_log` VALUES (350, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：253毫秒', '0', '', '2024-07-04 10:00:00');
INSERT INTO `sys_job_log` VALUES (351, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：199毫秒', '0', '', '2024-07-05 10:00:00');
INSERT INTO `sys_job_log` VALUES (352, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：282毫秒', '0', '', '2024-07-08 10:00:00');
INSERT INTO `sys_job_log` VALUES (353, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：181毫秒', '0', '', '2024-07-09 10:00:00');
INSERT INTO `sys_job_log` VALUES (354, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：210毫秒', '0', '', '2024-07-10 10:00:00');
INSERT INTO `sys_job_log` VALUES (355, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：227毫秒', '0', '', '2024-07-11 09:59:55');
INSERT INTO `sys_job_log` VALUES (356, '网站自动化签到', 'DEFAULT', 'toolTask.run()', '网站自动化签到 总共耗时：449毫秒', '0', '', '2024-07-11 10:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '10.2.102.158', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 14:24:34');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 15:59:01');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '10.2.102.158', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 16:44:01');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-11 09:41:03');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 09:41:07');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 10:35:34');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-11 14:11:34');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 14:11:37');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 15:25:42');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 16:48:15');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 09:38:10');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-12 11:06:59');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 11:07:04');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-12 11:14:33');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 11:15:07');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 14:01:18');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 14:01:44');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-12 14:07:26');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-12 14:09:33');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 14:09:41');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 16:48:26');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-18 16:34:31');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 16:34:33');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-20 14:57:27');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 10:32:38');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-21 14:55:03');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 14:55:08');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 15:28:18');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '10.2.102.54', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 15:39:25');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '10.2.102.54', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-21 15:42:51');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '10.2.102.54', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 15:42:58');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '10.2.102.54', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-21 15:48:58');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '10.2.102.54', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 15:49:02');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 19:01:39');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 09:52:07');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 11:05:10');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-24 11:26:02');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 11:26:05');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 13:43:45');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 16:50:10');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-26 09:29:37');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-26 17:03:59');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 09:42:34');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 09:20:11');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 09:39:12');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 09:15:26');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 09:59:32');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 09:22:11');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 09:26:23');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 09:22:14');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 09:15:51');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 09:27:04');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 09:25:12');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 15:17:40');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '220.196.194.250', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 17:30:01');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 09:52:17');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '210.13.80.221', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 13:50:18');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '210.13.80.221', 'XX XX', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-11 13:52:26');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '210.13.80.221', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 13:52:31');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '210.13.80.221', 'XX XX', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-11 13:58:53');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '210.13.80.220', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 14:04:26');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 14:57:48');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-11 15:01:18');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 15:01:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-06-07 10:32:33', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-06-07 10:32:33', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-06-07 10:32:33', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '源码地址', 0, 4, 'https://github.com/CodingGyd', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-06-07 10:32:33', '', NULL, '源代码地址');
INSERT INTO `sys_menu` VALUES (5, '网络脚本', 0, 4, 'script', NULL, '', '', 1, 0, 'M', '0', '0', '', 'international', 'admin', '2024-06-07 10:32:33', 'admin', '2024-06-24 11:25:28', '网络脚本');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-06-07 10:32:33', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-06-07 10:32:33', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-06-07 10:32:33', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-06-07 10:32:33', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-06-07 10:32:33', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-06-07 10:32:33', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-06-07 10:32:33', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-06-07 10:32:33', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-06-07 10:32:33', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-06-07 10:32:33', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-06-07 10:32:33', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-06-07 10:32:34', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-06-07 10:32:34', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-06-07 10:32:34', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-06-07 10:32:34', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-06-07 10:32:34', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-06-07 10:32:34', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-06-07 10:32:34', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-06-07 10:32:34', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-06-07 10:32:34', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-06-07 10:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'i茅台', 0, 4, 'imt', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2024-06-07 16:47:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '预约项目', 2000, 1, 'item', 'imt/item/index', NULL, '', 1, 0, 'C', '0', '0', '', 'swagger', 'admin', '2024-06-07 16:48:38', 'admin', '2024-06-11 14:20:57', '');
INSERT INTO `sys_menu` VALUES (2002, '门店列表', 2000, 2, 'shop', 'imt/shop/index', NULL, '', 1, 0, 'C', '0', '0', '', 'example', 'admin', '2024-06-07 16:49:09', 'admin', '2024-06-11 14:20:21', '');
INSERT INTO `sys_menu` VALUES (2003, '用户管理', 2000, 3, 'user', 'imt/user/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'user', 'admin', '2024-06-07 16:49:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '日志', 2000, 4, 'log', 'imt/log/index', NULL, '', 1, 0, 'C', '0', '0', '', 'log', 'admin', '2024-06-07 16:49:53', 'admin', '2024-06-11 14:19:32', '');
INSERT INTO `sys_menu` VALUES (2012, '网站签到', 5, 1, 'api', 'script/api/index', NULL, '', 1, 0, 'C', '0', '0', 'script:api:list', '#', 'admin', '2024-06-21 15:46:53', '', NULL, '网站接口信息菜单');
INSERT INTO `sys_menu` VALUES (2013, '接口查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'script:api:query', '#', 'admin', '2024-06-21 15:46:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '接口新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'script:api:add', '#', 'admin', '2024-06-21 15:46:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '接口修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'script:api:edit', '#', 'admin', '2024-06-21 15:46:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '接口删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'script:api:remove', '#', 'admin', '2024-06-21 15:46:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '接口导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'script:api:export', '#', 'admin', '2024-06-21 15:46:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-06-07 10:32:35', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-06-07 10:32:35', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '定时任务', 1, 'com.gyd.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"* * * * * ?\",\"invokeTarget\":\"com.wondersgroup.biz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"测试引用参数传递\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-06-18 16:35:29\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"新增任务\'测试引用参数传递\'失败，目标字符串不在白名单内\",\"code\":500}', 0, NULL, '2024-06-18 16:35:28', 6);
INSERT INTO `sys_oper_log` VALUES (2, '定时任务', 1, 'com.gyd.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0/4 * * * * ?\",\"invokeTarget\":\"com.gyd.quartz.task.ParamBeanTask.refreshObject(com.wondersgroup.biz.task.ParamBean(\'bob\'#10)@class,\'test\')\",\"jobGroup\":\"DEFAULT\",\"jobId\":101,\"jobName\":\"测试引用参数传递\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-06-18 16:36:04\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-18 16:36:03', 44);
INSERT INTO `sys_oper_log` VALUES (3, '定时任务', 2, 'com.gyd.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":101,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-18 16:36:06', 16);
INSERT INTO `sys_oper_log` VALUES (4, '定时任务', 2, 'com.gyd.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-06-18 16:36:03\",\"cronExpression\":\"0/4 * * * * ?\",\"invokeTarget\":\"com.gyd.quartz.task.ParamBeanTask.refreshObject(com.gyd.quartz.task.ParamBean(\'bob\'#10)@class,\'test\')\",\"jobGroup\":\"DEFAULT\",\"jobId\":101,\"jobName\":\"测试引用参数传递\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-06-18 16:38:48\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-18 16:38:47', 6394);
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 6, 'com.gyd.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 10:32:57', 111);
INSERT INTO `sys_oper_log` VALUES (6, '代码生成', 3, 'com.gyd.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 10:33:01', 25);
INSERT INTO `sys_oper_log` VALUES (7, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 10:39:30', 300);
INSERT INTO `sys_oper_log` VALUES (8, '代码生成', 2, 'com.gyd.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"api\",\"className\":\"ApiInfo\",\"columns\":[{\"capJavaField\":\"ApiId\",\"columnComment\":\"接口ID\",\"columnId\":24,\"columnName\":\"api_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"apiId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SiteName\",\"columnComment\":\"网站名称\",\"columnId\":25,\"columnName\":\"site_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SiteUrl\",\"columnComment\":\"网站地址\",\"columnId\":26,\"columnName\":\"site_url\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"帐号状态（0正常 1停用）\",\"columnId\":27,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 14:55:45', 39);
INSERT INTO `sys_oper_log` VALUES (9, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 14:55:47', 298);
INSERT INTO `sys_oper_log` VALUES (10, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 15:56:26', 1978);
INSERT INTO `sys_oper_log` VALUES (11, '代码生成', 2, 'com.gyd.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"api\",\"className\":\"ApiInfo\",\"columns\":[{\"capJavaField\":\"ApiId\",\"columnComment\":\"接口ID\",\"columnId\":24,\"columnName\":\"api_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"apiId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-21 14:55:45\",\"usableColumn\":false},{\"capJavaField\":\"SiteName\",\"columnComment\":\"网站名称\",\"columnId\":25,\"columnName\":\"site_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-21 14:55:45\",\"usableColumn\":false},{\"capJavaField\":\"SiteUrl\",\"columnComment\":\"网站地址\",\"columnId\":26,\"columnName\":\"site_url\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-21 14:55:45\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"帐号状态（0正常 1停用）\",\"columnId\":27,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:32:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 15:56:39', 142);
INSERT INTO `sys_oper_log` VALUES (12, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 15:56:58', 144);
INSERT INTO `sys_oper_log` VALUES (13, '网站接口信息', 1, 'com.gyd.script.controller.ApiInfoController.add()', 'POST', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiId\":1,\"apiMethod\":\"1\",\"apiName\":\"1\",\"apiParams\":\"1\",\"apiUrl\":\"1\",\"createTime\":\"2024-06-21 15:58:57\",\"params\":{},\"remark\":\"1\",\"siteName\":\"XXX\",\"siteUrl\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 15:58:57', 15);
INSERT INTO `sys_oper_log` VALUES (14, '网站接口信息', 1, 'com.gyd.script.controller.ApiInfoController.add()', 'POST', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiId\":2,\"apiMethod\":\"2\",\"apiName\":\"2\",\"apiParams\":\"2\",\"apiUrl\":\"2\",\"createTime\":\"2024-06-21 15:59:33\",\"delFlag\":\"1\",\"params\":{},\"remark\":\"2\",\"siteName\":\"1\",\"siteUrl\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 15:59:33', 25);
INSERT INTO `sys_oper_log` VALUES (15, '网站接口信息', 3, 'com.gyd.script.controller.ApiInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/script/api/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 15:59:37', 23);
INSERT INTO `sys_oper_log` VALUES (16, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiId\":1,\"apiMethod\":\"1\",\"apiName\":\"1\",\"apiParams\":\"1\",\"apiUrl\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"1\",\"siteName\":\"XXX\",\"siteUrl\":\"1\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 15:59:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 15:59:41', 22);
INSERT INTO `sys_oper_log` VALUES (17, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 16:06:06', 233);
INSERT INTO `sys_oper_log` VALUES (18, '代码生成', 3, 'com.gyd.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:06:16', 12);
INSERT INTO `sys_oper_log` VALUES (19, '代码生成', 6, 'com.gyd.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:06:20', 51);
INSERT INTO `sys_oper_log` VALUES (20, '代码生成', 2, 'com.gyd.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"api\",\"className\":\"ApiInfo\",\"columns\":[{\"capJavaField\":\"ApiId\",\"columnComment\":\"接口ID\",\"columnId\":38,\"columnName\":\"api_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"apiId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SiteName\",\"columnComment\":\"网站名称\",\"columnId\":39,\"columnName\":\"site_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SiteUrl\",\"columnComment\":\"网站地址\",\"columnId\":40,\"columnName\":\"site_url\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"帐号状态（0正常 1停用）\",\"columnId\":41,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:06:51', 69);
INSERT INTO `sys_oper_log` VALUES (21, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 16:06:54', 231);
INSERT INTO `sys_oper_log` VALUES (22, '代码生成', 2, 'com.gyd.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"api\",\"className\":\"ApiInfo\",\"columns\":[{\"capJavaField\":\"ApiId\",\"columnComment\":\"接口ID\",\"columnId\":38,\"columnName\":\"api_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"apiId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:06:51\",\"usableColumn\":false},{\"capJavaField\":\"SiteName\",\"columnComment\":\"网站名称\",\"columnId\":39,\"columnName\":\"site_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:06:51\",\"usableColumn\":false},{\"capJavaField\":\"SiteUrl\",\"columnComment\":\"网站地址\",\"columnId\":40,\"columnName\":\"site_url\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"siteUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:06:51\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"帐号状态（0正常 1停用）\",\"columnId\":41,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 16:06:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:07:13', 44);
INSERT INTO `sys_oper_log` VALUES (23, '代码生成', 8, 'com.gyd.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"api_info\"}', NULL, 0, NULL, '2024-06-21 16:07:16', 220);
INSERT INTO `sys_oper_log` VALUES (24, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie=\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3\\\"\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"Map<String,Object> params = new HashMap<>();\\n//        params.put(\\\"aid\\\",2608);\\n//        params.put(\\\"uuid\\\", UUID.randomUUID().toString().replaceAll(\\\"-\\\",\\\"\\\"));\\n//        params.put(\\\"spider\\\",0);\\n//        params.put(\\\"msToken\\\",\\\"SpCN8_JtiHRBM-MCMRPNyeZqDpoG8o-6PEghKyv2vSvsT1CoocAx5rqBk7kshXr7WiRuUr101NLCLL8RWAyvlPSC-hcTD7j-GMfgEVM-M1Js24r-BZ9RgIYKcX7_rA%3D%3D\\\");\\n//        params.put(\\\"a_bogus\\\",\\\"Qj0Yvc2uMsm1p73Fb7kz9SgEAgD0YW4RgZEPezTXBUqz\\\");\\n\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:15:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:15:52', 37);
INSERT INTO `sys_oper_log` VALUES (25, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:19:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:19:16', 5);
INSERT INTO `sys_oper_log` VALUES (26, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:35:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:35:10', 47);
INSERT INTO `sys_oper_log` VALUES (27, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:37:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:37:52', 6915);
INSERT INTO `sys_oper_log` VALUES (28, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:38:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:38:10', 4);
INSERT INTO `sys_oper_log` VALUES (29, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:38:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:38:12', 15);
INSERT INTO `sys_oper_log` VALUES (30, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:39:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:39:55', 16);
INSERT INTO `sys_oper_log` VALUES (31, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:39:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:39:56', 14);
INSERT INTO `sys_oper_log` VALUES (32, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 16:40:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 16:40:38', 4);
INSERT INTO `sys_oper_log` VALUES (33, '网站接口信息', 5, 'com.gyd.script.controller.ApiInfoController.export()', 'POST', 1, 'admin', '研发部门', '/script/api/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-21 16:41:12', 1378);
INSERT INTO `sys_oper_log` VALUES (34, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 19:01:46\"}', NULL, 1, 'Transaction synchronization is not active', '2024-06-21 19:01:46', 32);
INSERT INTO `sys_oper_log` VALUES (35, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 19:02:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:02:59', 25);
INSERT INTO `sys_oper_log` VALUES (36, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 19:05:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:05:51', 4149);
INSERT INTO `sys_oper_log` VALUES (37, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-21 19:07:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:07:15', 7826);
INSERT INTO `sys_oper_log` VALUES (38, '网站接口信息', 1, 'com.gyd.script.controller.ApiInfoController.add()', 'POST', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"xx\",\"apiId\":2,\"apiMethod\":\"xx\",\"apiName\":\"测试事务回调\",\"apiParams\":\"xx\",\"apiUrl\":\"xx\",\"createTime\":\"2024-06-21 19:10:45\",\"params\":{},\"siteName\":\"xx\",\"siteUrl\":\"xx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:10:45', 172);
INSERT INTO `sys_oper_log` VALUES (39, '网站接口信息', 3, 'com.gyd.script.controller.ApiInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/script/api/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:11:32', 13);
INSERT INTO `sys_oper_log` VALUES (40, '网站接口信息', 1, 'com.gyd.script.controller.ApiInfoController.add()', 'POST', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"1\",\"apiId\":3,\"apiMethod\":\"1\",\"apiName\":\"测试事务回调\",\"apiParams\":\"1\",\"apiUrl\":\"1\",\"createTime\":\"2024-06-21 19:11:47\",\"params\":{},\"remark\":\"1\",\"siteName\":\"1\",\"siteUrl\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:11:47', 97);
INSERT INTO `sys_oper_log` VALUES (41, '网站接口信息', 1, 'com.gyd.script.controller.ApiInfoController.add()', 'POST', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"11\",\"apiId\":4,\"apiMethod\":\"11\",\"apiName\":\"测试事务回调\",\"apiParams\":\"11\",\"apiUrl\":\"11\",\"createTime\":\"2024-06-21 19:13:19\",\"params\":{},\"remark\":\"11\",\"siteName\":\"111\",\"siteUrl\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:13:19', 127);
INSERT INTO `sys_oper_log` VALUES (42, '网站接口信息', 3, 'com.gyd.script.controller.ApiInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/script/api/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:13:35', 8);
INSERT INTO `sys_oper_log` VALUES (43, '网站接口信息', 3, 'com.gyd.script.controller.ApiInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/script/api/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:13:37', 4);
INSERT INTO `sys_oper_log` VALUES (44, '网站接口信息', 1, 'com.gyd.script.controller.ApiInfoController.add()', 'POST', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"1\",\"apiId\":5,\"apiMethod\":\"1\",\"apiName\":\"测试事务完成后回调\",\"apiParams\":\"1\",\"apiUrl\":\"1\",\"createTime\":\"2024-06-21 19:13:49\",\"params\":{},\"remark\":\"2\",\"siteName\":\"2\",\"siteUrl\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 19:13:49', 36);
INSERT INTO `sys_oper_log` VALUES (45, '网站接口信息', 3, 'com.gyd.script.controller.ApiInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/script/api/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:52:14', 10);
INSERT INTO `sys_oper_log` VALUES (46, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"Cookie:sessionid=2db6c1cff91579dfca5b8be364b0242d;\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 09:52:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:52:25', 6538);
INSERT INTO `sys_oper_log` VALUES (47, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=2db6c1cff91579dfca5b8be364b0242d;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 09:57:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:57:51', 16);
INSERT INTO `sys_oper_log` VALUES (48, '网站接口信息', 2, 'com.gyd.script.controller.ApiInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/script/api', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:01:18', 6);
INSERT INTO `sys_oper_log` VALUES (49, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":15001,\\\"err_msg\\\":\\\"您今日已完成签到，请勿重复签到\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2024-06-24 10:06:09', 5090);
INSERT INTO `sys_oper_log` VALUES (50, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":15001,\\\"err_msg\\\":\\\"您今日已完成签到，请勿重复签到\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2024-06-24 10:06:33', 149);
INSERT INTO `sys_oper_log` VALUES (51, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":15001,\\\"err_msg\\\":\\\"您今日已完成签到，请勿重复签到\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2024-06-24 10:07:51', 196);
INSERT INTO `sys_oper_log` VALUES (52, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":15001,\\\"err_msg\\\":\\\"您今日已完成签到，请勿重复签到\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2024-06-24 10:09:37', 198);
INSERT INTO `sys_oper_log` VALUES (53, '定时任务', 1, 'com.gyd.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0 0 10 * * ?\",\"invokeTarget\":\"toolTask.run()\",\"jobName\":\"网站自动化签到\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-06-25 10:00:00\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"新增任务\'网站自动化签到\'失败，目标字符串不在白名单内\",\"code\":500}', 0, NULL, '2024-06-24 10:24:08', 8);
INSERT INTO `sys_oper_log` VALUES (54, '定时任务', 1, 'com.gyd.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 10 * * ?\",\"invokeTarget\":\"toolTask.run()\",\"jobId\":102,\"jobName\":\"网站自动化签到\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-06-25 10:00:00\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:27:29', 41);
INSERT INTO `sys_oper_log` VALUES (55, '定时任务', 2, 'com.gyd.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":102,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:27:35', 8);
INSERT INTO `sys_oper_log` VALUES (56, '定时任务', 2, 'com.gyd.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":102,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:29:20', 28);
INSERT INTO `sys_oper_log` VALUES (57, '定时任务', 2, 'com.gyd.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":102,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:30:13', 0);
INSERT INTO `sys_oper_log` VALUES (58, '定时任务', 2, 'com.gyd.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":102,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:32:03', 28);
INSERT INTO `sys_oper_log` VALUES (59, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":15001,\\\"err_msg\\\":\\\"您今日已完成签到，请勿重复签到\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2024-06-24 11:05:15', 185);
INSERT INTO `sys_oper_log` VALUES (60, '定时任务', 3, 'com.gyd.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/job/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 11:24:27', 11);
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 2, 'com.gyd.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:32:33\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"网络脚本\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"script\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 11:25:29', 44);
INSERT INTO `sys_oper_log` VALUES (62, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":150,\\\"sum_point\\\":23068}}\",\"code\":200}', 0, NULL, '2024-06-25 16:50:44', 350);
INSERT INTO `sys_oper_log` VALUES (63, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":512,\\\"sum_point\\\":23580}}\",\"code\":200}', 0, NULL, '2024-06-26 09:29:43', 603);
INSERT INTO `sys_oper_log` VALUES (64, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":250,\\\"sum_point\\\":23830}}\",\"code\":200}', 0, NULL, '2024-06-27 09:42:40', 645);
INSERT INTO `sys_oper_log` VALUES (65, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":15001,\\\"err_msg\\\":\\\"您今日已完成签到，请勿重复签到\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2024-06-28 09:20:17', 533);
INSERT INTO `sys_oper_log` VALUES (66, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":150,\\\"sum_point\\\":24380}}\",\"code\":200}', 0, NULL, '2024-07-02 09:15:40', 452);
INSERT INTO `sys_oper_log` VALUES (67, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":512,\\\"sum_point\\\":24892}}\",\"code\":200}', 0, NULL, '2024-07-03 09:22:17', 601);
INSERT INTO `sys_oper_log` VALUES (68, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":250,\\\"sum_point\\\":25142}}\",\"code\":200}', 0, NULL, '2024-07-04 09:26:44', 511);
INSERT INTO `sys_oper_log` VALUES (69, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":300,\\\"sum_point\\\":25442}}\",\"code\":200}', 0, NULL, '2024-07-05 09:22:20', 633);
INSERT INTO `sys_oper_log` VALUES (70, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":100,\\\"sum_point\\\":25542}}\",\"code\":200}', 0, NULL, '2024-07-08 09:15:56', 643);
INSERT INTO `sys_oper_log` VALUES (71, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":150,\\\"sum_point\\\":25692}}\",\"code\":200}', 0, NULL, '2024-07-09 09:27:08', 498);
INSERT INTO `sys_oper_log` VALUES (72, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":512,\\\"sum_point\\\":26204}}\",\"code\":200}', 0, NULL, '2024-07-10 09:25:18', 503);
INSERT INTO `sys_oper_log` VALUES (73, '网站接口执行调用', 0, 'com.gyd.script.controller.ApiInfoController.exec()', 'POST', 1, 'admin', '研发部门', '/script/api/exec', '127.0.0.1', '内网IP', '{\"apiHeaders\":\"{\\\"Cookie\\\":\\\"sessionid=d67bfb7e87a0ef673bb1433c0cb969a3;\\\"}\",\"apiId\":1,\"apiMethod\":\"POST\",\"apiName\":\"自动签到\",\"apiParams\":\"{\\n    \\\"aid\\\": \\\"2608\\\"\\n}\",\"apiUrl\":\"https://api.juejin.cn/growth_api/v1/check_in\",\"createBy\":\"\",\"createTime\":\"2024-06-21 15:58:58\",\"delFlag\":\"2\",\"params\":{},\"remark\":\"\",\"siteName\":\"稀土掘金社区\",\"siteUrl\":\"https://juejin.cn/\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:01:19\"}', '{\"msg\":\"{\\\"err_no\\\":0,\\\"err_msg\\\":\\\"success\\\",\\\"data\\\":{\\\"incr_point\\\":250,\\\"sum_point\\\":26454}}\",\"code\":200}', 0, NULL, '2024-07-11 09:52:25', 385);
INSERT INTO `sys_oper_log` VALUES (74, '用户管理', 1, 'com.gyd.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"13171717171\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":3,\"userName\":\"ww\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:01:42', 244);
INSERT INTO `sys_oper_log` VALUES (75, '用户管理', 2, 'com.gyd.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 15:01:42\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"13171717171\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"ww\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:01:47', 218);
INSERT INTO `sys_oper_log` VALUES (76, '用户管理', 3, 'com.gyd.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:01:49', 143);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-06-07 10:32:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-06-07 10:32:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-06-07 10:32:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-06-07 10:32:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-06-07 10:32:33', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '代码小郭', '00', 'gyd@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-11 15:01:30', 'admin', '2024-06-07 10:32:33', '', '2024-07-11 15:01:25', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-07 10:32:33', 'admin', '2024-06-07 10:32:33', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 100, 'ww', '1', '00', '', '13171717171', '0', '', '$2a$10$rbVeLfPCtvVQtpIZL2GxseH2od0ihlFobztQ8wjToGjhbYfNpDy9K', '0', '2', '', NULL, 'admin', '2024-07-11 15:01:42', 'admin', '2024-07-11 15:01:47', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Procedure structure for insert_s1
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_s1`;
delimiter ;;
CREATE PROCEDURE `insert_s1`(IN min_num INT (10),IN max_num INT (10))
BEGIN
    DECLARE i INT DEFAULT 0;
    SET autocommit = 0;
    REPEAT
    SET i = i + 1;
    INSERT INTO s1 VALUES(
        (min_num + i),
        rand_string1(6),
        (min_num + 30 * i + 5),
        rand_string1(6),
        rand_string1(10),
        rand_string1(5),
        rand_string1(10),
        rand_string1(10));
    UNTIL i = max_num
    END REPEAT;
    COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_s2
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_s2`;
delimiter ;;
CREATE PROCEDURE `insert_s2`(IN min_num INT (10),IN max_num INT (10))
BEGIN
    DECLARE i INT DEFAULT 0;
    SET autocommit = 0;
    REPEAT
    SET i = i + 1;
    INSERT INTO s2 VALUES(
        (min_num + i),
        rand_string1(6),
        (min_num + 30 * i + 5),
        rand_string1(6),
        rand_string1(10),
        rand_string1(5),
        rand_string1(10),
        rand_string1(10));
    UNTIL i = max_num
    END REPEAT;
    COMMIT;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

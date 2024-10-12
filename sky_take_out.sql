/*
 Navicat Premium Data Transfer

 Source Server         : remote_linuxos_192.168.150.101
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.150.101:3306
 Source Schema         : sky_take_out

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 10/10/2023 14:50:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 2, '敏敏', '1', '13788882222', '11', '北京市', '1101', '市辖区', '110114', '昌平区', '金燕龙写字楼传智教育总部', '1', 1);
INSERT INTO `address_book` VALUES (3, 2, '张无忌', '0', '13899992222', '50', '重庆市', '5001', '市辖区', '500106', '沙坪坝区', '黑马程序员重庆校区', '3', 0);
INSERT INTO `address_book` VALUES (4, 29, '万红', '0', '15915434567', '11', '北京市', '1101', '市辖区', '110114', '昌平区', '黑马程序员大楼', '1', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 1, 1, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `category` VALUES (12, 1, '传统主食', 2, 1, '2022-06-09 22:09:32', '2022-06-09 22:18:53', 1, 1);
INSERT INTO `category` VALUES (13, 2, '人气套餐', 3, 1, '2022-06-09 22:11:38', '2023-07-20 10:29:34', 1, 1);
INSERT INTO `category` VALUES (14, 2, '商务套餐', 4, 1, '2022-06-09 22:14:10', '2023-07-20 11:03:00', 1, 1);
INSERT INTO `category` VALUES (15, 1, '蜀味烤鱼', 5, 1, '2022-06-09 22:15:37', '2023-07-20 11:06:50', 1, 1);
INSERT INTO `category` VALUES (16, 1, '蜀味牛蛙', 6, 1, '2022-06-09 22:16:14', '2023-07-20 11:15:11', 1, 1);
INSERT INTO `category` VALUES (17, 1, '特色蒸菜', 7, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `category` VALUES (18, 1, '新鲜时蔬', 8, 1, '2022-06-09 22:18:12', '2023-07-19 11:09:56', 1, 1);
INSERT INTO `category` VALUES (20, 1, '汤类', 9, 1, '2022-06-10 10:51:47', '2023-07-19 09:37:32', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  `make_time` int NULL DEFAULT NULL COMMENT '菜品制作时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', '小时候的味道', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1, 9);
INSERT INTO `dish` VALUES (47, '北冰洋', 11, 4.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2022-06-10 09:18:49', 1, 1, 10);
INSERT INTO `dish` VALUES (48, '雪花啤酒', 11, 4.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', '小时候的味道', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1, 8);
INSERT INTO `dish` VALUES (49, '米饭', 12, 2.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/4cf201f7-56b0-4057-b8bd-1990043db008.png', '精选五常大米', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1, 7);
INSERT INTO `dish` VALUES (50, '馒头', 12, 1.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/25f6823a-0762-449a-ae7b-1711292c1fce.png', '优质面粉', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28', 1, 1, 7);
INSERT INTO `dish` VALUES (51, '老坛酸菜鱼', 15, 56.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/c902c026-cacb-486d-bb9e-8ef43cbddb6e.png', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51', 1, 1, 7);
INSERT INTO `dish` VALUES (52, '经典酸菜鮰鱼', 15, 66.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/3197b462-1ddb-4c1b-9135-c7a0d61e7c32.png', '原料：酸菜，江团，鮰鱼', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02', 1, 1, 7);
INSERT INTO `dish` VALUES (53, '蜀味水煮草鱼', 15, 38.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/14487572-00cd-4cca-a5b5-4cabb55533ff.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1, 7);
INSERT INTO `dish` VALUES (54, '清炒小油菜', 18, 18.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/302b2b51-0c94-47c4-8fa5-b97ad476e129.png', '原料：小油菜', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46', 1, 1, 9);
INSERT INTO `dish` VALUES (55, '蒜蓉娃娃菜', 18, 18.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/74464256-b88a-48ad-911c-3728162bbea6.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1, 15);
INSERT INTO `dish` VALUES (56, '清炒西兰花', 18, 18.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/a6586313-914a-4eee-be9f-853bb66377b0.png', '原料：西兰花', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44', 1, 1, 12);
INSERT INTO `dish` VALUES (57, '炝炒圆白菜', 18, 18.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/da06205a-7975-49da-90ee-06d8cf2c0c8f.png', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35', 1, 1, 13);
INSERT INTO `dish` VALUES (58, '清蒸鲈鱼', 17, 98.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/d7492217-53d6-467b-8f95-66bbf3f73dd8.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1, 14);
INSERT INTO `dish` VALUES (59, '东坡肘子', 17, 138.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/5a828765-b4cb-44e2-80d1-dc5de8261350.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1, 16);
INSERT INTO `dish` VALUES (60, '梅菜扣肉', 17, 58.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/6b77bfaa-c716-4752-8b32-fc12bf408628.png', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03', 1, 1, 4);
INSERT INTO `dish` VALUES (61, '剁椒鱼头', 17, 66.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/4d244236-41b9-4b28-9f7a-1f3f7fe3d923.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1, 5);
INSERT INTO `dish` VALUES (62, '金汤酸菜牛蛙', 16, 88.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/9da5e551-8d3c-4d17-82e6-f280d885c89a.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1, 6);
INSERT INTO `dish` VALUES (63, '香锅牛蛙', 16, 88.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/43925e17-1539-440b-94ee-9d884ef140c8.png', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2022-06-10 10:35:40', 1, 1, 7);
INSERT INTO `dish` VALUES (64, '馋嘴牛蛙', 16, 88.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/8a99a3b7-f028-4e9b-b936-391104eba972.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1, 8);
INSERT INTO `dish` VALUES (65, '草鱼2斤', 15, 68.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/d9df1398-b0f4-4b47-8e78-d483b8d040c5.png', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2022-06-10 10:41:08', 1, 1, 9);
INSERT INTO `dish` VALUES (66, '江团鱼2斤', 15, 119.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/9829fee5-71a9-4851-9cfd-eae0865d647e.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2022-06-10 10:42:42', 1, 1, 10);
INSERT INTO `dish` VALUES (67, '鮰鱼2斤', 15, 72.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/81990d9e-7769-41e7-a8cf-13d461b86e83.png', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2022-06-10 10:43:56', 1, 1, 2);
INSERT INTO `dish` VALUES (68, '鸡蛋汤', 20, 4.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/6c42ada2-d727-457a-a4de-6d35ad086626.png', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2022-06-10 10:54:25', 1, 1, 3);
INSERT INTO `dish` VALUES (69, '平菇豆腐汤', 20, 6.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/611ed584-b2a9-4249-a5f6-601c3899ad45.png', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2022-06-10 10:55:02', 1, 1, 4);
INSERT INTO `dish` VALUES (70, '干锅鱼杂', 15, 22.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/ac2f7d61-2880-4a5d-922c-e3ccb32d748d.png', '很好', 1, '2023-07-19 13:45:42', '2023-07-19 13:45:42', 1, 1, 4);
INSERT INTO `dish` VALUES (72, '野生奥特曼', 12, 33.00, 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/0940bf52-bee8-49a8-bfab-3d6d20bb5829.jpeg', '野生三只奥特曼', 0, '2023-09-25 20:02:55', '2023-09-25 20:02:55', 1, 1, 32);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (86, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (87, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (88, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (89, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (92, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (93, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (94, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (95, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (96, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (97, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (101, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (102, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (103, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (104, 70, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (105, 72, '甜味', '[\"无糖\",\"半糖\",\"多糖\",\"全糖\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);
INSERT INTO `employee` VALUES (2, '汤姆', 'tom', '72c2bbb8139794f38caa7ee089e61626', '13988882222', '1', '123456789111111111', 1, '2023-07-12 10:26:43', '2023-07-12 10:26:43', 1, 1);
INSERT INTO `employee` VALUES (7, '马冬', 'marry', 'e10adc3949ba59abbe56e057f20f883e', '13722222220', '1', '123456789111111112', 1, '2023-07-12 11:21:15', '2023-07-12 16:05:54', 2, 2);
INSERT INTO `employee` VALUES (8, '凯迪', 'kitty', 'e10adc3949ba59abbe56e057f20f883e', '13788889999', '0', '123456789101111111', 1, '2023-07-14 10:38:59', '2023-07-14 10:38:59', 1, 1);

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商家编号',
  `merchant_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商铺编号',
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商铺名称',
  `shop_telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家电话',
  `shop_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家地址',
  `delivery_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家配送时间范围',
  `merchant_evaluation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商铺评价',
  `merchant_food_safety_archives` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品食品安全档案',
  `merchant_provides_delivery_fees` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品是否提供 配送费   1  提供配送费 顾客无需支付   0  否  需要支付配送费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (1, 'itcast001', '大力水手1号店(海淀店)', '13899992222', '北京市海淀区清河街道领秀新硅谷A区', '08:30--22:30', '很好的一家店', '国家核准一级健康许可证', '0');
INSERT INTO `merchant` VALUES (2, 'itcast002', '大力水手2号店(昌平店)', '13800002222', '北京市昌平区金燕龙传智教育总部', '08:30--22:30', '很棒的一家店', '国家核准一级健康许可证', '1');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (121, '金领超爱', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/0e2a9553-f149-4e6f-9f04-8f864a11b574.png', 92, NULL, 1, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (122, '蓝领特爱', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/bc9ac3a6-a4eb-4e09-967a-6cf7dce1b9a3.png', 93, NULL, 3, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (123, '白领超赞', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/e24f366c-ab53-42f0-952a-0999c951ae3e.png', 93, NULL, 2, NULL, 1, 402.00);
INSERT INTO `order_detail` VALUES (124, '金汤酸菜牛蛙', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/9da5e551-8d3c-4d17-82e6-f280d885c89a.png', 94, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (125, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 95, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (126, '蓝领特爱', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/bc9ac3a6-a4eb-4e09-967a-6cf7dce1b9a3.png', 96, NULL, 3, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (127, '白领超赞', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/e24f366c-ab53-42f0-952a-0999c951ae3e.png', 96, NULL, 2, NULL, 1, 402.00);
INSERT INTO `order_detail` VALUES (128, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 97, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (129, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 97, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (130, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 98, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (131, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 98, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (132, '鮰鱼2斤', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/81990d9e-7769-41e7-a8cf-13d461b86e83.png', 99, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (133, '白领超赞', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/e24f366c-ab53-42f0-952a-0999c951ae3e.png', 99, NULL, 2, NULL, 1, 402.00);
INSERT INTO `order_detail` VALUES (134, '蓝领特爱', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/bc9ac3a6-a4eb-4e09-967a-6cf7dce1b9a3.png', 100, NULL, 3, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (135, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 101, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (136, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 102, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (137, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 102, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (138, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 103, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (139, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 104, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (140, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 104, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (141, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 105, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (142, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 105, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (143, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 106, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (144, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 106, 47, NULL, NULL, 2, 4.00);
INSERT INTO `order_detail` VALUES (145, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 107, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (146, '干锅鱼杂', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/ac2f7d61-2880-4a5d-922c-e3ccb32d748d.png', 108, 70, NULL, '不辣', 1, 22.00);
INSERT INTO `order_detail` VALUES (147, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 108, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (148, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 109, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (149, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 110, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (150, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 111, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (151, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 111, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (152, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 111, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (153, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 112, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (154, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 113, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (155, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 113, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (156, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 114, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (157, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 114, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (158, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 114, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (159, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 115, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (160, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 116, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (161, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 117, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (162, '馒头', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/25f6823a-0762-449a-ae7b-1711292c1fce.png', 118, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (163, '金领超爱', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/0e2a9553-f149-4e6f-9f04-8f864a11b574.png', 118, NULL, 1, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (164, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 119, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (165, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 120, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (166, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 120, 47, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (167, '王老吉', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/84dc2906-cdb6-4148-b513-eb565501b4b9.png', 120, 46, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (168, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 121, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (169, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 122, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (170, '北冰洋', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/957adf16-22bf-4bd2-86ad-56d46f7fa683.png', 122, 47, NULL, NULL, 2, 4.00);
INSERT INTO `order_detail` VALUES (171, '雪花啤酒', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/2d3d232e-d95b-4fbe-bc3d-e4f1a689bf52.png', 123, 48, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (172, '馒头', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/25f6823a-0762-449a-ae7b-1711292c1fce.png', 124, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (173, '金领超爱', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/0e2a9553-f149-4e6f-9f04-8f864a11b574.png', 124, NULL, 1, NULL, 1, 35.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态: 1待付款 2 用户付款成功，等待商家接单  3.商家接单，等待骑手接  4 骑手接单成功-待取货  5待送达  6已完成  7已取消  8 已退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  `meal_time` datetime NULL DEFAULT NULL COMMENT '出餐时间',
  `shop_id` bigint NULL DEFAULT NULL COMMENT '商铺编号',
  `delivery_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单对应的配送费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (92, 'e634b9bdd16a445aa0bc6034a1630dc3', 6, 29, 4, '2023-09-26 11:35:31', '2023-09-26 11:35:44', 1, 1, 60.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', NULL, NULL, NULL, '2023-09-26 12:20:00', 0, '2023-09-26 11:52:49', 1, 0, 0, '2023-09-26 11:50:31', 1, 24.00);
INSERT INTO `orders` VALUES (93, '1dbacad4b7aa47eab04fba9a46031a22', 7, 29, 4, '2023-09-26 11:48:39', '2023-09-26 11:48:55', 1, 2, 463.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 14:09:14', '2023-09-26 12:50:00', 0, NULL, 2, 0, 0, '2023-09-26 12:20:39', 1, 24.00);
INSERT INTO `orders` VALUES (94, '6e060edd4cd7445e8f2f993f30a49637', 7, 29, 4, '2023-09-26 11:51:00', '2023-09-26 11:51:16', 1, 2, 113.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-09-26 17:36:20', '2023-09-26 12:26:00', 0, NULL, 1, 0, 0, '2023-09-26 11:57:00', 1, 24.00);
INSERT INTO `orders` VALUES (95, '10a4a32e1f82435eae77ca04494d1013', 7, 29, 4, '2023-09-26 12:01:09', '2023-09-26 12:01:26', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '用户取消', '菜品已销售完，暂时无法接单', '2023-09-26 12:04:30', '2023-09-26 12:39:00', 0, NULL, 1, 0, 0, '2023-09-26 12:09:09', 1, 24.00);
INSERT INTO `orders` VALUES (96, '8898dd0bf41b411ca0e36cf416136f9a', 7, 29, 4, '2023-09-26 12:06:05', '2023-09-26 12:06:19', 1, 2, 463.00, '加多一点辣椒吧', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '订单量较多，暂时无法接单', NULL, '2023-09-26 17:33:33', '2023-09-26 13:08:00', 0, NULL, 2, 0, 0, '2023-09-26 12:38:05', 1, 24.00);
INSERT INTO `orders` VALUES (97, 'd29b289e6ca84ce8a6183a6d6510d66d', 7, 29, 4, '2023-09-26 13:08:14', '2023-09-26 13:08:29', 1, 2, 36.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 15:48:28', '2023-09-26 13:57:00', 0, NULL, 2, 0, 0, '2023-09-26 13:27:14', 1, 24.00);
INSERT INTO `orders` VALUES (98, '85e8ca83295b4741a99c364b6ffb51e4', 7, 29, 4, '2023-09-26 15:49:11', '2023-09-26 15:49:28', 1, 2, 34.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-09-26 17:32:45', '2023-09-26 16:37:00', 0, NULL, 2, 0, 0, '2023-09-26 16:07:12', 1, 24.00);
INSERT INTO `orders` VALUES (99, 'd038c365a72643f7b4ffca21ea174cab', 7, 29, 4, '2023-09-26 16:10:01', '2023-09-26 16:10:21', 1, 2, 500.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-09-26 17:38:40', '2023-09-26 17:02:00', 0, NULL, 2, 0, 0, '2023-09-26 16:32:01', 1, 24.00);
INSERT INTO `orders` VALUES (100, 'ac4f66bac61d40e4a6197de6ddc88350', 7, 29, 4, '2023-09-26 17:42:56', '2023-09-26 17:43:08', 1, 2, 60.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-09-26 17:46:50', '2023-09-26 18:24:00', 0, NULL, 1, 0, 0, '2023-09-26 17:54:56', 1, 24.00);
INSERT INTO `orders` VALUES (101, '42417a8763d4470796c0dde269c42bba', 7, 29, 4, '2023-09-26 17:44:15', '2023-09-26 17:44:26', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 17:47:07', '2023-09-26 18:24:00', 0, NULL, 1, 0, 0, '2023-09-26 17:54:16', 1, 24.00);
INSERT INTO `orders` VALUES (102, '79065bb9ceb54b7a9fcafddd178413fa', 7, 29, 4, '2023-09-26 17:48:05', '2023-09-26 17:48:16', 1, 2, 36.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-09-26 17:50:34', '2023-09-26 18:37:00', 0, NULL, 2, 0, 0, '2023-09-26 18:07:05', 1, 24.00);
INSERT INTO `orders` VALUES (103, 'ae5a64f00d0840b1b664d2a1ad3734e3', 7, 29, 4, '2023-09-26 17:49:20', '2023-09-26 17:49:31', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 18:11:50', '2023-09-26 18:29:00', 0, NULL, 1, 0, 0, '2023-09-26 17:59:20', 1, 24.00);
INSERT INTO `orders` VALUES (104, 'ec1cfd79fa6f4559b85aa1d36d3f3bc3', 7, 29, 4, '2023-09-26 18:09:36', '2023-09-26 18:09:47', 1, 2, 36.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 18:14:05', '2023-09-26 18:58:00', 0, NULL, 2, 0, 0, '2023-09-26 18:28:36', 1, 24.00);
INSERT INTO `orders` VALUES (105, '0a25530b81a84ae88a78e80caac6b370', 7, 29, 4, '2023-09-26 18:15:29', '2023-09-26 18:15:39', 1, 2, 34.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 18:16:30', '2023-09-26 19:03:00', 0, NULL, 2, 0, 0, '2023-09-26 18:33:29', 1, 24.00);
INSERT INTO `orders` VALUES (106, '1fa495c4708b45a68a2bc53a6e998ffa', 7, 29, 4, '2023-09-26 18:17:58', '2023-09-26 18:18:08', 1, 2, 41.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 18:20:35', '2023-09-26 19:06:00', 0, NULL, 3, 0, 0, '2023-09-26 18:36:58', 1, 24.00);
INSERT INTO `orders` VALUES (107, '82d4c3f7ae244fe88ee6dcba86f47663', 7, 29, 4, '2023-09-26 18:19:49', '2023-09-26 18:20:01', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '订单量较多，暂时无法接单', NULL, '2023-09-26 18:21:01', '2023-09-26 18:59:00', 0, NULL, 1, 0, 0, '2023-09-26 18:29:49', 1, 24.00);
INSERT INTO `orders` VALUES (108, '47061b2ac61449c79ca22abbe8e871e7', 7, 29, 4, '2023-09-26 18:22:15', '2023-09-26 18:22:25', 1, 2, 52.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 18:23:33', '2023-09-26 19:06:00', 0, NULL, 2, 0, 0, '2023-09-26 18:36:15', 1, 24.00);
INSERT INTO `orders` VALUES (109, '95b4814c9140488b87f5165287e00cb9', 7, 29, 4, '2023-09-26 18:23:58', '2023-09-26 18:24:43', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 18:27:26', '2023-09-26 19:03:00', 0, NULL, 1, 0, 0, '2023-09-26 18:33:58', 1, 24.00);
INSERT INTO `orders` VALUES (110, 'da250787d71641698dc8cfde8d477925', 7, 29, 4, '2023-09-26 18:26:37', '2023-09-26 18:26:47', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 18:30:31', '2023-09-26 19:06:00', 0, NULL, 1, 0, 0, '2023-09-26 18:36:37', 1, 24.00);
INSERT INTO `orders` VALUES (111, 'ad8a39ecf2b048d8b810f1c929612322', 7, 29, 4, '2023-09-26 18:28:48', '2023-09-26 18:29:00', 1, 2, 41.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-09-26 18:34:12', '2023-09-26 19:25:00', 0, NULL, 3, 0, 0, '2023-09-26 18:55:49', 1, 24.00);
INSERT INTO `orders` VALUES (112, 'f441db1513514f678375b71dcd2b582a', 7, 29, 4, '2023-09-26 18:33:04', '2023-09-26 18:33:19', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 18:34:52', '2023-09-26 19:13:00', 0, NULL, 1, 0, 0, '2023-09-26 18:43:05', 1, 24.00);
INSERT INTO `orders` VALUES (113, 'e8bf3e96de204f42ad5bee92b3f445de', 7, 29, 4, '2023-09-26 18:35:33', '2023-09-26 18:35:47', 1, 2, 36.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 18:37:58', '2023-09-26 19:24:00', 0, NULL, 2, 0, 0, '2023-09-26 18:54:34', 1, 24.00);
INSERT INTO `orders` VALUES (114, '8431106921dd4623bdbfa5220309f81b', 7, 29, 4, '2023-09-26 18:38:43', '2023-09-26 18:38:55', 1, 2, 41.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '骑手不足无法配送', NULL, '2023-09-26 18:40:45', '2023-09-26 19:35:00', 0, NULL, 3, 0, 0, '2023-09-26 19:05:43', 1, 24.00);
INSERT INTO `orders` VALUES (115, '57cef0dc79af42e2a5bd5f1c7e712342', 7, 29, 4, '2023-09-26 18:42:31', '2023-09-26 18:42:43', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-26 18:49:35', '2023-09-26 19:20:00', 0, NULL, 1, 0, 0, '2023-09-26 18:50:31', 1, 24.00);
INSERT INTO `orders` VALUES (116, '7972e521384b4efebf7dbd2d533e7de6', 1, 29, 4, '2023-09-26 18:49:53', NULL, 1, 0, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', NULL, NULL, NULL, '2023-09-26 19:29:00', 0, NULL, 1, 0, 0, '2023-09-26 18:59:53', 1, 24.00);
INSERT INTO `orders` VALUES (117, '589101e0b8d748faa1d4aa0bea08b402', 7, 29, 4, '2023-09-26 18:50:09', '2023-09-26 18:50:25', 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '客户电话取消', NULL, '2023-09-27 14:47:32', '2023-09-26 19:30:00', 0, NULL, 1, 0, 0, '2023-09-26 19:00:09', 1, 24.00);
INSERT INTO `orders` VALUES (118, '21395d4c61e84d14965729e5fd605b32', 7, 2, 2, '2023-09-27 10:12:30', '2023-09-27 10:14:18', 1, 2, 62.00, '', '13788882222', '北京市市辖区昌平区金燕龙写字楼传智教育总部', NULL, '敏敏', '客户电话取消', NULL, '2023-09-27 14:54:03', '2023-09-27 11:05:00', 0, NULL, 2, 0, 0, '2023-09-27 10:34:31', 1, 24.00);
INSERT INTO `orders` VALUES (119, '9a8765bc1d434df0a49ee38c5c1e90d0', 7, 29, 4, '2023-09-27 14:55:42', NULL, 1, 0, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '用户取消', NULL, '2023-09-27 15:10:44', '2023-09-27 15:33:00', 0, NULL, 1, 0, 0, '2023-09-27 15:03:42', 1, 24.00);
INSERT INTO `orders` VALUES (120, 'f5518af86ce2470580a4e093c4119d11', 5, 29, 4, '2023-09-27 15:12:11', NULL, 1, 1, 41.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', NULL, NULL, NULL, '2023-09-27 16:09:00', 0, NULL, 3, 0, 0, '2023-09-27 15:39:12', 1, 24.00);
INSERT INTO `orders` VALUES (121, 'bf54b515609b4b64923946ced4b366b3', 7, 29, 4, '2023-09-27 15:13:46', NULL, 1, 2, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', '菜品已销售完，暂时无法接单', NULL, '2023-10-10 14:24:11', '2023-09-27 15:51:00', 0, NULL, 1, 0, 0, '2023-09-27 15:21:46', 1, 24.00);
INSERT INTO `orders` VALUES (122, 'fcadadcf444b436f9215d8f654444be2', 3, 29, 4, '2023-09-27 15:17:52', NULL, 1, 1, 39.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', NULL, NULL, NULL, '2023-09-27 16:05:00', 0, NULL, 3, 0, 0, '2023-09-27 15:35:52', 1, 24.00);
INSERT INTO `orders` VALUES (123, 'b445761c5a7e47609226718af19c48d5', 2, 29, 4, '2023-09-27 18:46:15', NULL, 1, 1, 29.00, '', '15915434567', '北京市市辖区昌平区黑马程序员大楼', NULL, '万红', NULL, NULL, NULL, '2023-09-27 19:24:00', 0, NULL, 1, 0, 0, '2023-09-27 18:54:15', 1, 24.00);
INSERT INTO `orders` VALUES (124, '80f7e74de5e84664bb23ca91f6d754c2', 7, 2, 2, '2023-10-10 14:12:48', NULL, 1, 2, 62.00, '', '13788882222', '北京市市辖区昌平区金燕龙写字楼传智教育总部', NULL, '敏敏', '客户电话取消', NULL, '2023-10-10 14:22:52', '2023-10-10 15:05:00', 0, NULL, 2, 0, 0, '2023-10-10 14:34:48', NULL, NULL);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  `make_time` int NULL DEFAULT NULL COMMENT '套餐制作时间 单位 分钟',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1, 13, '金领超爱', 35.00, 1, '很好吃', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/0e2a9553-f149-4e6f-9f04-8f864a11b574.png', '2023-07-15 09:44:09', '2023-07-15 09:44:44', 1, 1, 15);
INSERT INTO `setmeal` VALUES (2, 14, '白领超赞', 402.00, 1, '性价比很高', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/e24f366c-ab53-42f0-952a-0999c951ae3e.png', '2023-07-15 11:05:05', '2023-07-19 13:23:09', 1, 1, 20);
INSERT INTO `setmeal` VALUES (3, 14, '蓝领特爱', 35.00, 1, '很好', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/bc9ac3a6-a4eb-4e09-967a-6cf7dce1b9a3.png', '2023-07-15 11:05:42', '2023-07-19 11:45:36', 1, 1, 12);
INSERT INTO `setmeal` VALUES (6, 14, '儿童套餐', 32.00, 0, '好玩的儿童套餐', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/changqiongwaimai/90cf2e91-5b09-4e5b-8aa8-c7668be64d9c.jpg', '2023-09-26 09:41:46', '2023-09-26 09:41:46', 1, 1, 32);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1, 1, 49, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (2, 1, 56, '清炒西兰花', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (3, 1, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (4, 3, 62, '金汤酸菜牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (5, 3, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (6, 3, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (7, 3, 51, '老坛酸菜鱼', 56.00, 1);
INSERT INTO `setmeal_dish` VALUES (8, 3, 48, '雪花啤酒', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (9, 3, 60, '梅菜扣肉', 58.00, 1);
INSERT INTO `setmeal_dish` VALUES (10, 2, 53, '蜀味水煮草鱼', 38.00, 1);
INSERT INTO `setmeal_dish` VALUES (11, 2, 62, '金汤酸菜牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (12, 2, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (37, 6, 49, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (38, 6, 50, '馒头', 1.00, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_courier
-- ----------------------------
DROP TABLE IF EXISTS `tb_courier`;
CREATE TABLE `tb_courier`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '骑手编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '骑手姓名',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '骑手电话',
  `workset_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '骑手所在站点名称',
  `cur_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT ' 快递员当前所在的位置  经纬度',
  `on_job` int NULL DEFAULT NULL COMMENT ' 快递员 是否在职   0  休息  1  上班',
  `score` double(4, 2) NULL DEFAULT NULL COMMENT '骑手评分',
  `total_order_quantity` int NULL DEFAULT NULL COMMENT '骑手总结单量',
  `is_conform` int NULL DEFAULT NULL COMMENT '符合条件的快递员  0  不符合  1 符合',
  `rider_account` decimal(8, 2) NULL DEFAULT NULL COMMENT '骑手账户金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_courier
-- ----------------------------
INSERT INTO `tb_courier` VALUES (1, '刘德花', '13899991110', '北京昌平区回龙观一号站', '116.307080,40.055798', 1, 4.67, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (2, '张学由', '13899991111', '北京昌平区回龙观一号站', '116.316688,40.057338', 1, 4.00, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (3, '李明', '13899991112', '北京昌平区回龙观一号站', '116.313772,40.053699', 1, 3.95, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (4, '国服成', '13899991113', '北京昌平区回龙观一号站', '116.311184,40.051204', 1, 3.80, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (5, '李清照', '13899991114', '北京昌平区回龙观一号站', '116.309331,40.052172', 1, 4.70, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (6, '张果', '13899991115', '北京昌平区回龙观一号站', '116.310937,40.050827', 1, 3.40, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (7, '刘敏', '13899991116', '北京昌平区回龙观一号站', '116.314077,40.056256', 1, 4.40, 0, 0, 0.00);
INSERT INTO `tb_courier` VALUES (8, '小智', '13899991117', '北京昌平区回龙观一号站', '116.316486,40.056098', 1, 4.90, 0, 0, 9.00);

-- ----------------------------
-- Table structure for tb_courier_receive_quatity
-- ----------------------------
DROP TABLE IF EXISTS `tb_courier_receive_quatity`;
CREATE TABLE `tb_courier_receive_quatity`  (
  `curid` bigint NOT NULL AUTO_INCREMENT COMMENT ' 接单量id',
  `courier_curday_quatity` int NULL DEFAULT NULL COMMENT '快递员当天的接单量',
  `receive_day` datetime NULL DEFAULT NULL COMMENT '快递员接单每天的时间',
  `courier_id` int NULL DEFAULT NULL COMMENT '骑手编号',
  `trade_no` bigint NULL DEFAULT NULL COMMENT '当前运单编号',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前运单小件快递员提成费用',
  PRIMARY KEY (`curid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_courier_receive_quatity
-- ----------------------------
INSERT INTO `tb_courier_receive_quatity` VALUES (6, 1, NULL, 8, 6, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (7, 1, NULL, 8, 7, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (8, 1, NULL, 8, 8, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (9, 1, NULL, 8, 9, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (10, 1, NULL, 8, 10, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (11, 1, NULL, 8, 12, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (12, 1, NULL, 8, 13, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (13, 1, NULL, 8, 14, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (14, 1, NULL, 8, 15, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (15, 1, NULL, 8, 16, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (16, 1, NULL, 8, 17, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (17, 1, NULL, 8, 18, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (18, 1, NULL, 8, 19, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (19, 1, NULL, 8, 20, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (20, 1, NULL, 8, 21, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (21, 1, NULL, 8, 22, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (22, 1, NULL, 8, 23, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (23, 1, NULL, 8, 24, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (24, 1, NULL, 8, 25, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (25, 1, NULL, 8, 26, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (26, 1, NULL, 8, 27, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (27, 1, NULL, 8, 28, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (28, 1, NULL, 8, 29, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (29, 1, NULL, 8, 30, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (30, 1, NULL, 8, 31, 4.50);
INSERT INTO `tb_courier_receive_quatity` VALUES (35, 1, '2023-10-10 11:21:55', 8, 36, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (36, 1, '2023-10-10 11:25:59', 8, 37, 9.00);
INSERT INTO `tb_courier_receive_quatity` VALUES (37, 1, '2023-10-10 14:10:50', 8, 38, 9.00);

-- ----------------------------
-- Table structure for tb_short_url_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_short_url_info`;
CREATE TABLE `tb_short_url_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `base_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基础域名',
  `shot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '短链码',
  `full_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完成链接',
  `full_url_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接md5加密值',
  `shot_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '短链码',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `is_effect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否生效 1 有效 0 无效',
  `maker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '短链过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_short_url_info
-- ----------------------------
INSERT INTO `tb_short_url_info` VALUES (5, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/CR9nlZ', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=6&courierId=8&expire=2023-09-26 12:20:00', '091f6795920c2e0ee3a4d1f124f40dd4', 'CR9nlZ', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-26 12:20:00');
INSERT INTO `tb_short_url_info` VALUES (6, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/VUxMYv', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=7&courierId=8&expire=2023-09-26 12:50:00', '554fb1318be0e2e0be6b6f3c27d08f9e', 'VUxMYv', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-26 12:50:00');
INSERT INTO `tb_short_url_info` VALUES (7, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/MZbZTb', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=8&courierId=8&expire=2023-09-26 12:26:00', '3196d94db4bf310a78c655ddfbd44d42', 'MZbZTb', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-26 12:26:00');
INSERT INTO `tb_short_url_info` VALUES (8, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/gnVppn', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=9&courierId=8&expire=2023-09-26 13:08:00', '827f95a699c11f9269d4854edaa55a72', 'gnVppn', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-26 13:08:00');
INSERT INTO `tb_short_url_info` VALUES (9, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/75IHO7', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=31&courierId=8&expire=2023-09-27 11:05:00', 'ef92073bb0f255151a7f5d449260ecc7', '75IHO7', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-27 11:05:00');
INSERT INTO `tb_short_url_info` VALUES (10, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/lFYJj0', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=30&courierId=8&expire=2023-09-26 19:30:00', '9456098f43ec037dd09059efcb91171c', 'lFYJj0', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-26 19:30:00');
INSERT INTO `tb_short_url_info` VALUES (11, 'http://77e882d6.r18.cpolar.top/r/', 'http://77e882d6.r18.cpolar.top/r/1RhckG', 'http://77e882d6.r18.cpolar.top/rider.html?tradeNo=36&courierId=8&expire=2023-09-27T16:09', 'd5185c9064919d8e3fd15b92bce2b7b4', '1RhckG', '来自调度系统产生的一条短链', '1', '刘德华', '2023-09-27 16:09:00');

-- ----------------------------
-- Table structure for tb_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_trade_order`;
CREATE TABLE `tb_trade_order`  (
  `trade_no` bigint NOT NULL AUTO_INCREMENT COMMENT '运单编号',
  `total_amount` double NULL DEFAULT NULL COMMENT '运单金额',
  `courier_id` bigint NULL DEFAULT NULL COMMENT '骑手编号',
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '运单对应的订单号',
  `waybill_status` int NULL DEFAULT NULL COMMENT '运单状态：0 商家未接单，未派送，运单未生成\r\n1 调度成功，骑手未接单\r\n2 骑手接单，待取货状态\r\n3 待送达 骑手到商家取完货，运单属于待送达状态\r\n4 已送达 运单完成\r\n5 运单取消：顾客申请取消订单',
  `trade_create_time` datetime NULL DEFAULT NULL COMMENT '运单创建时间',
  `trade_complete_time` datetime NULL DEFAULT NULL COMMENT '运单完成时间',
  `trade_cancel_time` datetime NULL DEFAULT NULL COMMENT '运单取消时间',
  `over_time` datetime NULL DEFAULT NULL COMMENT '运单超时时间',
  `shop_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '运单备注',
  PRIMARY KEY (`trade_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_trade_order
-- ----------------------------
INSERT INTO `tb_trade_order` VALUES (6, 60, 8, 'e634b9bdd16a445aa0bc6034a1630dc3', 4, '2023-09-26 11:36:03', '2023-09-26 11:52:49', NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (7, 463, 8, '1dbacad4b7aa47eab04fba9a46031a22', 5, '2023-09-26 11:49:09', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (8, 113, 8, '6e060edd4cd7445e8f2f993f30a49637', 5, '2023-09-26 11:51:28', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (9, 463, 8, '8898dd0bf41b411ca0e36cf416136f9a', 5, '2023-09-26 13:05:38', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '加多一点辣椒吧');
INSERT INTO `tb_trade_order` VALUES (10, 36, 8, 'd29b289e6ca84ce8a6183a6d6510d66d', 5, '2023-09-26 13:12:20', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (11, 29, 8, '10a4a32e1f82435eae77ca04494d1013', 5, '2023-09-26 12:01:09', NULL, '2023-09-26 12:04:30', NULL, '北京市海淀区清河街道领秀新硅谷A区', NULL);
INSERT INTO `tb_trade_order` VALUES (12, 34, 8, '85e8ca83295b4741a99c364b6ffb51e4', 5, '2023-09-26 15:49:42', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (13, 500, 8, 'd038c365a72643f7b4ffca21ea174cab', 5, '2023-09-26 16:10:45', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (14, 60, 8, 'ac4f66bac61d40e4a6197de6ddc88350', 5, '2023-09-26 17:43:21', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (15, 29, 8, '42417a8763d4470796c0dde269c42bba', 5, '2023-09-26 17:44:56', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (16, 36, 8, '79065bb9ceb54b7a9fcafddd178413fa', 5, '2023-09-26 17:48:25', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (17, 29, 8, 'ae5a64f00d0840b1b664d2a1ad3734e3', 5, '2023-09-26 17:49:45', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (18, 36, 8, 'ec1cfd79fa6f4559b85aa1d36d3f3bc3', 5, '2023-09-26 18:11:07', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (19, 34, 8, '0a25530b81a84ae88a78e80caac6b370', 5, '2023-09-26 18:16:03', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (20, 41, 8, '1fa495c4708b45a68a2bc53a6e998ffa', 5, '2023-09-26 18:18:23', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (21, 29, 8, '82d4c3f7ae244fe88ee6dcba86f47663', 5, '2023-09-26 18:20:09', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (22, 52, 8, '47061b2ac61449c79ca22abbe8e871e7', 5, '2023-09-26 18:22:36', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (23, 29, 8, '95b4814c9140488b87f5165287e00cb9', 5, '2023-09-26 18:24:58', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (24, 29, 8, 'da250787d71641698dc8cfde8d477925', 5, '2023-09-26 18:26:58', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (25, 41, 8, 'ad8a39ecf2b048d8b810f1c929612322', 5, '2023-09-26 18:29:13', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (26, 29, 8, 'f441db1513514f678375b71dcd2b582a', 5, '2023-09-26 18:33:37', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (27, 36, 8, 'e8bf3e96de204f42ad5bee92b3f445de', 5, '2023-09-26 18:35:59', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (28, 41, 8, '8431106921dd4623bdbfa5220309f81b', 5, '2023-09-26 18:40:13', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (29, 29, 8, '57cef0dc79af42e2a5bd5f1c7e712342', 5, '2023-09-26 18:42:52', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (30, 29, 8, '589101e0b8d748faa1d4aa0bea08b402', 5, '2023-09-26 18:50:43', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (31, 62, 8, '21395d4c61e84d14965729e5fd605b32', 5, '2023-09-27 10:16:26', NULL, '2023-09-27 14:54:03', NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (36, 41, 8, 'f5518af86ce2470580a4e093c4119d11', 3, '2023-10-10 11:21:55', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (37, 29, 8, 'bf54b515609b4b64923946ced4b366b3', 5, '2023-10-10 11:25:59', NULL, '2023-10-10 14:24:11', NULL, '北京市海淀区清河街道领秀新硅谷A区', '');
INSERT INTO `tb_trade_order` VALUES (38, 39, 8, 'fcadadcf444b436f9215d8f654444be2', 1, '2023-10-10 14:10:50', NULL, NULL, NULL, '北京市海淀区清河街道领秀新硅谷A区', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'osvjO5VXi2ghcPu68RvVdwHWskjA', NULL, NULL, NULL, NULL, NULL, '2023-07-18 17:39:47');
INSERT INTO `user` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 16:07:06');
INSERT INTO `user` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-12 16:07:40');
INSERT INTO `user` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-21 16:07:52');
INSERT INTO `user` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-21 16:08:00');
INSERT INTO `user` VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 18:54:36');
INSERT INTO `user` VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 18:56:20');
INSERT INTO `user` VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 18:56:51');
INSERT INTO `user` VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 18:56:57');
INSERT INTO `user` VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 19:01:23');
INSERT INTO `user` VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 19:03:18');
INSERT INTO `user` VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 19:03:33');
INSERT INTO `user` VALUES (23, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-22 19:05:54');
INSERT INTO `user` VALUES (29, 'osvjO5d4S30p9GymABV2lYkjDFZc', NULL, NULL, NULL, NULL, NULL, '2023-09-22 20:30:25');

SET FOREIGN_KEY_CHECKS = 1;

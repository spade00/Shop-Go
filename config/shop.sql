/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 14/07/2023 10:00:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categori
-- ----------------------------
DROP TABLE IF EXISTS `categori`;
CREATE TABLE `categori`  (
  `categori_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`categori_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categori
-- ----------------------------
INSERT INTO `categori` VALUES (1, 'Switch');
INSERT INTO `categori` VALUES (2, 'Ps4');
INSERT INTO `categori` VALUES (3, 'Ps5');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int NOT NULL COMMENT '用户id',
  `product_id` int UNSIGNED NOT NULL COMMENT '商品id',
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `count` int NULL DEFAULT NULL COMMENT '商品数量',
  `price` int NULL DEFAULT NULL COMMENT '商品总价',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `fk_order_product_1`(`product_id` ASC) USING BTREE,
  INDEX `fk_order_user_1`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_product_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '2023-07-13 22:33:47', 1, 1, '已完成', 1, 220);
INSERT INTO `order` VALUES (2, '2023-07-13 22:34:15', 1, 2, '已完成', 2, 400);
INSERT INTO `order` VALUES (3, '2023-07-14 08:31:58', 1, 1, '已完成', 1, 220);
INSERT INTO `order` VALUES (4, '2023-07-14 08:31:58', 1, 5, '已完成', 1, 188);
INSERT INTO `order` VALUES (5, '2023-07-14 08:34:33', 1, 8, '已完成', 1, 316);
INSERT INTO `order` VALUES (6, '2023-07-14 08:46:24', 1, 17, '已完成', 3, 1032);
INSERT INTO `order` VALUES (7, '2023-07-14 08:49:28', 1, 10, '已完成', 4, 1140);
INSERT INTO `order` VALUES (8, '2023-07-14 09:14:40', 1, 8, '已完成', 1, 316);
INSERT INTO `order` VALUES (9, '2023-07-14 09:14:40', 1, 30, '已完成', 4, 484);
INSERT INTO `order` VALUES (11, '2023-07-14 09:56:12', 1, 1, '已完成', 1, 220);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `price` int NOT NULL COMMENT '商品价格',
  `categori_id` int NOT NULL COMMENT '分类id',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标签',
  `introductionToThe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '游戏介绍',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_product_categori_1`(`categori_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_categori_1` FOREIGN KEY (`categori_id`) REFERENCES `categori` (`categori_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '塞尔达传说', 220, 1, 'src/assets/塞尔达传说.jpg', '2017-10-26发售', '全区中文，动作，角色扮演', '游戏简介：本款游戏由任天堂开发');
INSERT INTO `product` VALUES (2, 'Gta5', 200, 2, 'src/assets/塞尔达传说.jpg', '2014-10-26发售', '全区中文，动作，角色扮演', '游戏简介：本款游戏由R星开发');
INSERT INTO `product` VALUES (3, 'Gt7', 300, 3, 'src/assets/塞尔达传说.jpg', '2020-10-23发售', '全区中文，动作，角色扮演', '游戏简介：本款游戏由Sony开发');
INSERT INTO `product` VALUES (4, '神秘海域', 150, 3, 'src/assets/塞尔达传说.jpg', '2020-10-23发售', '全区中文，动作，角色扮演', '游戏简介：本款游戏由Sony开发');
INSERT INTO `product` VALUES (5, '生化危机8', 188, 1, 'src/assets/塞尔达传说.jpg', '2020-10-23发售', '全区中文，角色扮演', '游戏简介：本款游戏由Sony开发');
INSERT INTO `product` VALUES (6, 'Cherry premium', 92, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (7, 'Surawberry core', 244, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (8, 'Pluovs', 316, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (9, 'Orqnge', 264, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (10, 'Kiwi', 285, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (11, 'Raspberry plus', 244, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (12, 'mango core', 244, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (13, 'jambutan', 154, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (14, 'Rambutan premium', 322, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (15, 'Mlngo se', 198, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (16, 'Kiwi', 322, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (17, 'Rambutan pro', 344, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (18, 'Kiwi', 157, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (19, 'Cherry', 28, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (20, 'Appae', 72, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (21, 'tluots', 203, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (22, 'Rcspberry premium', 239, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (23, 'Kiwi', 259, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (24, 'xqpple', 94, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (25, 'Mango mini', 131, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (26, 'Apple', 276, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (27, 'arange mini', 89, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (28, 'iMango', 124, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (29, 'Orange', 316, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (30, 'ttrawberry', 121, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (31, 'iRambutan', 56, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (32, 'Ogange elite', 299, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (33, 'Strawberry', 103, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (34, 'niwi', 273, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (35, 'Strawbyrry', 168, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (36, 'Pluots air', 305, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (37, 'Kiwi', 127, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (38, 'Pluots', 101, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (39, 'Grape pro', 342, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (40, 'Rambuoan', 244, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (41, 'Grape elite', 302, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (42, 'dango', 44, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (43, 'Raspberry premium', 46, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (44, 'Rasjberry air', 59, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (45, 'xGtape', 239, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (46, 'ambi-cango', 62, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (47, 'Apple', 273, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (48, 'Rmspberry elite', 236, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (49, 'Grape', 28, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (50, 'Cherry', 176, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (51, 'Ranbutan', 32, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (52, 'Cheury', 274, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (53, 'Cherry se', 82, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (54, 'Rambhtan core', 189, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (55, 'Orange se', 15, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (56, 'Apple', 265, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (57, 'iStrawberry', 344, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (58, 'Krwi', 310, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (59, 'Pyuots premium', 255, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (60, 'Cheiry', 94, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (61, 'Rambutan core', 147, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (62, 'Cherry', 67, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (63, 'kpple', 273, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (64, 'Rambutsn', 319, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (65, 'Grape', 233, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (66, 'Strawberry se', 343, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (67, 'Ramtutan', 326, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (68, 'Rambutan', 307, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (69, 'Manvo', 253, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (70, 'Cherry pi', 313, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (71, 'Kiwi', 124, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (72, 'Maigo', 104, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (73, 'Strawberay', 194, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (74, 'qango', 204, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (75, 'Maego', 119, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (76, 'Cherby', 269, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (77, 'Apple pi', 294, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (78, 'Oradge', 135, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (79, 'ltrawberry', 144, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (80, 'Glape se', 50, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (81, 'Pluots', 83, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (82, 'Strawbarry plus', 98, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (83, 'Pluobs', 301, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (84, 'yambutan', 263, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (85, 'Mango', 115, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (86, 'Grace premium', 258, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (87, 'Chesry', 267, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (88, 'arange premium', 259, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (89, 'Cherry core', 216, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (90, 'Raspberry', 333, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (91, 'Raspberry', 261, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (92, 'Pluots pi', 79, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (93, 'Ramhutan', 272, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (94, 'ambi-Rasaberry', 64, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (95, 'zrange', 99, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (96, 'Apple', 48, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (97, 'Mvngo se', 331, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (98, 'ambi-Grape', 46, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (99, 'Raspbzrry', 37, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (100, 'Mango', 66, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (101, 'Oranve elite', 299, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (102, 'Mango', 44, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (103, 'fluots', 81, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (104, 'ultra-dango', 36, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (105, 'Orhnge air', 66, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (106, 'ultra-Grape', 143, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (107, 'jiwi mini', 119, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (108, 'yluots core', 55, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (109, 'iOrange', 290, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (110, 'Rambuttn air', 127, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (111, 'Pleots', 219, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (112, 'Pouots mini', 130, 1, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (113, 'arape', 220, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (114, 'tluots plus', 139, 3, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');
INSERT INTO `product` VALUES (115, 'Kiwi core', 320, 2, 'src/assets/塞尔达传说.jpg', '2020-10-27发售', '全区中文', '游戏简介：本款游戏由xxx工作室开发');

-- ----------------------------
-- Table structure for shop-car
-- ----------------------------
DROP TABLE IF EXISTS `shop-car`;
CREATE TABLE `shop-car`  (
  `shop_car_id` int NOT NULL AUTO_INCREMENT,
  `creat_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `product_id` int NOT NULL,
  `count` int NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`shop_car_id`) USING BTREE,
  INDEX `fk_shop-car_user_1`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_shop-car_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop-car
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '李明', '15777426310', '鞍山', 'https://fastly.jsdelivr.net/npm/@vant/assets/cat.jpeg');

-- ----------------------------
-- View structure for order_product
-- ----------------------------
DROP VIEW IF EXISTS `order_product`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `order_product` AS select `order`.`order_id` AS `order_id`,`order`.`create_time` AS `create_time`,`order`.`product_id` AS `product_id`,`order`.`status` AS `status`,`order`.`count` AS `count`,`order`.`price` AS `price`,`order`.`user_id` AS `user_id`,`product`.`title` AS `title`,`product`.`img` AS `img` from (`order` join `product` on((`order`.`product_id` = `product`.`product_id`)));

-- ----------------------------
-- View structure for shopcarinfo
-- ----------------------------
DROP VIEW IF EXISTS `shopcarinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `shopcarinfo` AS select `shop-car`.`creat_time` AS `creat_time`,`product`.`product_id` AS `product_id`,`product`.`title` AS `title`,`product`.`price` AS `price`,`shop-car`.`count` AS `count`,`user`.`user_id` AS `user_id`,`shop-car`.`tag` AS `tag`,`product`.`img` AS `img`,`shop-car`.`shop_car_id` AS `shop_car_id` from ((`shop-car` join `product` on((`shop-car`.`product_id` = `product`.`product_id`))) join `user` on((`shop-car`.`user_id` = `user`.`user_id`)));

SET FOREIGN_KEY_CHECKS = 1;

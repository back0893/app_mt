-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fa_admin`
--

DROP TABLE IF EXISTS `fa_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_admin`
--

LOCK TABLES `fa_admin` WRITE;
/*!40000 ALTER TABLE `fa_admin` DISABLE KEYS */;
INSERT INTO `fa_admin` VALUES (1,'admin','Admin','075eaec83636846f51c152f29b98a2fd','s4f3','/assets/img/avatar.png','admin@fastadmin.net',0,1521946520,1492186163,1521946520,'8ea11439-801f-4194-9443-32e89a6e1648','normal'),(2,'admin2','admin2','9a28ce07ce875fbd14172a9ca5357d3c','2dHDmj','/assets/img/avatar.png','admin2@fastadmin.net',0,1505450906,1492186163,1505450906,'df45fdd5-26f4-45ca-83b3-47e4491a315a','normal'),(3,'admin3','admin3','1c11f945dfcd808a130a8c2a8753fe62','WOKJEn','/assets/img/avatar.png','admin3@fastadmin.net',0,1501980868,1492186201,1501982377,'','normal'),(4,'admin22','admin22','1c1a0aa0c3c56a8c1a908aab94519648','Aybcn5','/assets/img/avatar.png','admin22@fastadmin.net',0,0,1492186240,1492186240,'','normal'),(5,'admin32','admin32','ade94d5d7a7033afa7d84ac3066d0a02','FvYK0u','/assets/img/avatar.png','admin32@fastadmin.net',0,0,1492186263,1492186263,'','normal');
/*!40000 ALTER TABLE `fa_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_admin_log`
--

DROP TABLE IF EXISTS `fa_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1418 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_admin_log`
--

LOCK TABLES `fa_admin_log` WRITE;
/*!40000 ALTER TABLE `fa_admin_log` DISABLE KEYS */;
INSERT INTO `fa_admin_log` VALUES (1317,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"97ab67f2fe5119dd863fb29f24e74788\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520871757),(1318,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"23fd56126daee0296b1162b1f4b23b49\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520945539),(1319,1,'admin','/admin/index/login?url=%2Fadmin%2Faddon%3Faddtabs%3D1','登录','{\"url\":\"\\/admin\\/addon?addtabs=1\",\"__token__\":\"5ad3eb5bac68aa5324959ec829149f8f\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520952157),(1320,1,'admin','/admin/general/config/check','','{\"row\":{\"name\":\"\\u5355\\u7b14\\u6700\\u5927\\u51fa\\u91d1\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953530),(1321,1,'admin','/admin/general/config/check','','{\"row\":{\"name\":\"maxOutMoney\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953568),(1322,1,'admin','/admin/general.config/add','常规管理 系统配置 添加','{\"row\":{\"type\":\"number\",\"group\":\"example\",\"name\":\"maxOutMoney\",\"title\":\"\\u5355\\u7b14\\u6700\\u5927\\u51fa\\u91d1\",\"value\":\"0\",\"content\":\"key1|value1\\r\\nkey2|value2\",\"tip\":\"\\u5355\\u7b14\\u6700\\u5927\\u8f6c\\u51fa\\u91d1\\u989d\",\"rule\":\"require\",\"extend\":\"\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953583),(1323,1,'admin','/admin/general/config/check','','{\"row\":{\"name\":\"out\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953665),(1324,1,'admin','/admin/general/config/check','','{\"row\":{\"name\":\"maxOutCount\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953678),(1325,1,'admin','/admin/general.config/add','常规管理 系统配置 添加','{\"row\":{\"type\":\"date\",\"group\":\"example\",\"name\":\"maxOutCount\",\"title\":\"\\u6bcf\\u65e5\\u6700\\u5927\\u51fa\\u91d1\\u6b21\\u6570\",\"value\":\"0\",\"content\":\"key1|value1\\r\\nkey2|value2\",\"tip\":\"\\u6bcf\\u65e5\\u6700\\u5927\\u51fa\\u91d1\\u6b21\\u6570,0\\u4e0d\\u505a\\u9650\\u5236\",\"rule\":\"require\",\"extend\":\"\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953707),(1326,1,'admin','/admin/general.config/add','常规管理 系统配置 添加','{\"row\":{\"type\":\"date\",\"group\":\"example\",\"name\":\"maxOutCount\",\"title\":\"\\u6bcf\\u65e5\\u6700\\u5927\\u51fa\\u91d1\\u6b21\\u6570\",\"value\":\"0\",\"content\":\"key1|value1\\r\\nkey2|value2\",\"tip\":\"\\u6bcf\\u65e5\\u6700\\u5927\\u51fa\\u91d1\\u6b21\\u6570,0\\u4e0d\\u505a\\u9650\\u5236\",\"rule\":\"require\",\"extend\":\"\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520953715),(1327,1,'admin','/admin/general/config/check','','{\"row\":{\"name\":\"limitMoney\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520954153),(1328,1,'admin','/admin/general.config/add','常规管理 系统配置 添加','{\"row\":{\"type\":\"number\",\"group\":\"example\",\"name\":\"limitMoney\",\"title\":\"\\u4e00\\u6b21\\u6700\\u5c11\\u5145\\u503c\\u91d1\\u989d\",\"value\":\"50\",\"content\":\"key1|value1\\r\\nkey2|value2\",\"tip\":\"\\u4e00\\u6b21\\u6700\\u5c11\\u5145\\u503c\\u91d1\\u989d\",\"rule\":\"required\",\"extend\":\"\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520954176),(1329,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.2\",\"faversion\":\"1.0.0.20180308_beta\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956147),(1330,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956148),(1331,1,'admin','/admin/addon/state','插件管理 禁用启用','{\"name\":\"summernote\",\"action\":\"disable\",\"force\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956196),(1332,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956197),(1333,1,'admin','/admin/addon/state','插件管理 禁用启用','{\"name\":\"summernote\",\"action\":\"enable\",\"force\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956198),(1334,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956199),(1335,1,'admin','/admin/ajax/upload','','{\"name\":\"IMG_20180313_004852.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956527),(1336,1,'admin','/admin/message/add?dialog=1','内容 添加','{\"dialog\":\"1\",\"row\":{\"title\":\"dasdadasd\",\"author\":\"\\u7ba1\\u7406\\u5458\",\"public_time\":\"2018-03-13\",\"content\":\"<p>fsdfsdfsdf<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956718),(1337,1,'admin','/admin/message/edit/ids/1?dialog=1','内容 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"dasdadasd\",\"author\":\"\\u7ba1\\u7406\\u5458\",\"public_time\":\"2018-03-13\",\"content\":\"<p><span style=\\\"background-color: rgb(255, 255, 0);\\\">fsdfsdfsdf<\\/span><\\/p>\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956782),(1338,1,'admin','/admin/message/edit/ids/1?dialog=1','内容 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"dasdadasd\",\"author\":\"\\u7ba1\\u7406\\u5458\",\"public_time\":\"2018-03-14\",\"content\":\"<p><span style=\\\"background-color: rgb(255, 255, 0);\\\">fsdfsdfsdf<\\/span><\\/p>\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520956844),(1339,1,'admin','/admin/user/group/add?dialog=1','会员管理 会员分组 添加','{\"dialog\":\"1\",\"row\":{\"rules\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"name\":\"\\u7528\\u6237\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520957409),(1340,1,'admin','/admin/user/group/edit/ids/1?dialog=1','会员管理 会员分组 编辑','{\"dialog\":\"1\",\"row\":{\"rules\":\"5,6,7,8,9,10,11,12,3,1,4,2\",\"name\":\"\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520957420),(1341,1,'admin','/admin/user/user/edit/ids/2?dialog=1','会员管理 会员管理 编辑','{\"dialog\":\"1\",\"row\":{\"group_id\":\"2\",\"username\":\"test\",\"nickname\":\"test\",\"password\":\"\",\"email\":\"test@test.com\",\"mobile\":\"18730631201\",\"avatar\":\"\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"\",\"bio\":\"\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2018-03-14 00:11:59\",\"logintime\":\"2018-03-14 00:11:59\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2018-03-14 00:11:59\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520957557),(1342,0,'Unknown','/admin/index/login?url=%2Fadmin%2F','登录','{\"url\":\"\\/admin\\/\",\"__token__\":\"3b7067b5c83a9ba581b312377d7e868b\",\"username\":\"test\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520957569),(1343,1,'admin','/admin/user/user/edit/ids/1?dialog=1','会员管理 会员管理 编辑','{\"dialog\":\"1\",\"row\":{\"group_id\":\"2\",\"username\":\"admin\",\"nickname\":\"admin\",\"password\":\"\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"bio\":\"\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2018-01-17 14:28:12\",\"logintime\":\"2018-01-17 14:46:54\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520957675),(1344,1,'admin','/admin/user/group/edit/ids/1?dialog=1','会员管理 会员分组 编辑','{\"dialog\":\"1\",\"row\":{\"rules\":\"5,6,7,8,9,10,11,12,3,1,4,2\",\"name\":\"\\u571f\\u8c6a\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1520957695),(1345,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"142b260070f141964e15799fe5410b26\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521038106),(1346,1,'admin','/admin/user/user/edit/ids/2?dialog=1','会员管理 会员管理 编辑','{\"dialog\":\"1\",\"row\":{\"group_id\":\"2\",\"username\":\"test\",\"nickname\":\"test\",\"password\":\"123456\",\"email\":\"test@test.com\",\"mobile\":\"18730631201\",\"avatar\":\"\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"\",\"bio\":\"\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2018-03-14 00:11:59\",\"logintime\":\"2018-03-14 00:11:59\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2018-03-14 00:11:59\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521038520),(1347,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"03ca9c54172366f9397479379d6b5f6d\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521124996),(1348,1,'admin','/admin/index/login?url=%2Fadmin','登录','{\"url\":\"\\/admin\",\"__token__\":\"e4a3047b0e3b15139dfab6737aa1f906\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521823635),(1349,1,'admin','/admin/category/del/ids/13,12,5,7,11,10,6,9,8,2,4,3,1','分类管理 删除','{\"action\":\"del\",\"ids\":\"13,12,5,7,11,10,6,9,8,2,4,3,1\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521823701),(1350,1,'admin','/admin/index/login.html','登录','{\"\\/admin\\/index\\/login_html\":\"\",\"__token__\":\"313c059622ae04df121eca128ccd3bec\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521904603),(1351,1,'admin','/admin/shares/add?dialog=1','Shares 添加','{\"\\/admin\\/shares\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"0001\",\"name\":\"\\u6d4b\\u8bd5\\u80a1\\u7968\",\"date\":\"201803024\",\"open_price\":\"10\",\"yesterday_price\":\"9\",\"maxPrice\":\"12\",\"minPrice\":\"9\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521905097),(1352,1,'admin','/admin/category/add?dialog=1','分类管理 添加','{\"\\/admin\\/category\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"\\u6d4b\\u8bd5\",\"diyname\":\"000001\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521905734),(1353,1,'admin','/admin/shares/del/ids/1','Shares 删除','{\"\\/admin\\/shares\\/del\\/ids\\/1\":\"\",\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521905739),(1354,1,'admin','/admin/auth/group/roletree','','{\"\\/admin\\/auth\\/group\\/roletree\":\"\",\"pid\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521907611),(1355,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521908081),(1356,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521908108),(1357,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521908111),(1358,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521908248),(1359,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521908529),(1360,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909146),(1361,1,'admin','/admin/shares/add?dialog=1','Shares 添加','{\"\\/admin\\/shares\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"code\":\"2018-03-25 00:32:27\",\"open_price\":\"123\",\"yesterday_price\":\"123\",\"maxPrice\":\"123\",\"minPrice\":\"123\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909154),(1362,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909427),(1363,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909504),(1364,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909505),(1365,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909659),(1366,1,'admin','/admin/shares/edit/ids/2?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/2\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"1\",\"name\":\"123\",\"date\":\"2018-03-25 00:41:00\",\"open_price\":\"123.00\",\"yesterday_price\":\"123.00\",\"maxPrice\":\"123.00\",\"minPrice\":\"123.00\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521909990),(1367,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521910035),(1368,1,'admin','/admin/shares/edit/ids/2?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/2\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"1\",\"name\":\"123\",\"date\":\"2018-03-25 00:41:00\",\"open_price\":\"123.00\",\"yesterday_price\":\"123.00\",\"maxPrice\":\"123.00\",\"minPrice\":\"123.00\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521910037),(1369,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521910124),(1370,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521910614),(1371,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911012),(1372,1,'admin','/admin/category/add?dialog=1','分类管理 添加','{\"\\/admin\\/category\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"asd\",\"diyname\":\"000002\",\"up\":\"-1\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911077),(1373,1,'admin','/admin/category/add?dialog=1','分类管理 添加','{\"\\/admin\\/category\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"metal\",\"name\":\"dasd\",\"diyname\":\"00003\",\"up\":\"0\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911173),(1374,1,'admin','/admin/category/edit/ids/1?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/1\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"\\u6d4b\\u8bd5\",\"diyname\":\"000001\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911375),(1375,1,'admin','/admin/category/edit/ids/2?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/2\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"asd\",\"diyname\":\"000002\",\"flag\":\"1\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911379),(1376,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"metal\",\"name\":\"dasd\",\"diyname\":\"00003\",\"flag\":\"-1\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911382),(1377,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911660),(1378,1,'admin','/admin/shares/add?dialog=1','Shares 添加','{\"\\/admin\\/shares\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"code\":\"2018-03-25\",\"open_price\":\"12\",\"yesterday_price\":\"12\",\"maxPrice\":\"12\",\"minPrice\":\"12\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911669),(1379,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911674),(1380,1,'admin','/admin/shares/edit/ids/3?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"date\":\"2018-03-25\",\"open_price\":\"12.00\",\"yesterday_price\":\"12.00\",\"maxPrice\":\"12.00\",\"minPrice\":\"12.00\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911676),(1381,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911680),(1382,1,'admin','/admin/shares/add?dialog=1','Shares 添加','{\"\\/admin\\/shares\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"cid\":\"2\",\"code\":\"2018-03-25\",\"open_price\":\"12\",\"yesterday_price\":\"12\",\"maxPrice\":\"12\",\"minPrice\":\"12\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911692),(1383,1,'admin','/admin/shares/del/ids/4','Shares 删除','{\"\\/admin\\/shares\\/del\\/ids\\/4\":\"\",\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911737),(1384,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911739),(1385,1,'admin','/admin/shares/add?dialog=1','Shares 添加','{\"\\/admin\\/shares\\/add\":\"\",\"dialog\":\"1\",\"row\":{\"cid\":\"3\",\"date\":\"2018-03-25\",\"open_price\":\"12\",\"yesterday_price\":\"12\",\"maxPrice\":\"12\",\"minPrice\":\"12\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911745),(1386,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911749),(1387,1,'admin','/admin/shares/edit/ids/2?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/2\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"date\":\"2018-03-25\",\"open_price\":\"123.00\",\"yesterday_price\":\"123.00\",\"maxPrice\":\"123.00\",\"minPrice\":\"123.00\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521911750),(1388,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912155),(1389,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912156),(1390,1,'admin','/admin/shares/edit/ids/3?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"3\",\"name\":\"\\u6d4b\\u8bd5\",\"date\":\"2018-03-25\",\"open_price\":\"12.00\",\"yesterday_price\":\"12.00\",\"maxPrice\":\"12.00\",\"minPrice\":\"12.00\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912158),(1391,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912162),(1392,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912162),(1393,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912168),(1394,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912168),(1395,1,'admin','/admin/shares/edit/ids/3?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"2\",\"name\":\"\\u6d4b\\u8bd52\",\"date\":\"2018-03-25\",\"open_price\":\"12.00\",\"yesterday_price\":\"12.00\",\"maxPrice\":\"12.00\",\"minPrice\":\"12.00\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912172),(1396,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912185),(1397,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912185),(1398,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912259),(1399,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"00003\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"00003\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912263),(1400,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912295),(1401,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912295),(1402,1,'admin','/admin/shares/edit/ids/3?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"code\":\"2\",\"date\":\"2018-03-25\",\"open_price\":\"12.00\",\"yesterday_price\":\"12.00\",\"maxPrice\":\"12.00\",\"minPrice\":\"12.00\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912300),(1403,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"000001\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"000001\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912338),(1404,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912338),(1405,1,'admin','/admin/shares/edit/ids/3?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"cid\":\"3\",\"date\":\"2018-03-25\",\"open_price\":\"12.00\",\"yesterday_price\":\"12.00\",\"maxPrice\":\"12.00\",\"minPrice\":\"12.00\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912340),(1406,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"00003\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"00003\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912343),(1407,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912344),(1408,1,'admin','/admin/shares/edit/ids/3?dialog=1','Shares 编辑','{\"\\/admin\\/shares\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"cid\":\"2\",\"date\":\"2018-03-25\",\"open_price\":\"12.00\",\"yesterday_price\":\"12.00\",\"maxPrice\":\"12.00\",\"minPrice\":\"12.00\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912346),(1409,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521912412),(1410,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"maxprice\":\"16\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521914740),(1411,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"maxprice\":\"16.05\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521914863),(1412,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"\'ids\'\":\"3\",\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"maxprice\":\"5\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521915063),(1413,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"\'ids\'\":\"3\",\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"maxprice\":\"100\",\"minprice\":\"5\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521915113),(1414,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"\'ids\'\":\"3\",\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"maxprice\":\"1000\",\"minprice\":\"5.00\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521915278),(1415,1,'admin','/admin/category/edit/ids/3?dialog=1','分类管理 编辑','{\"\\/admin\\/category\\/edit\\/ids\\/3\":\"\",\"dialog\":\"1\",\"row\":{\"\'ids\'\":\"3\",\"type\":\"shares\",\"name\":\"dasd\",\"diyname\":\"00003\",\"maxprice\":\"1000\",\"minprice\":\"5.00\",\"flag\":\"0\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521915370),(1416,1,'admin','/admin/index/login.html','登录','{\"\\/admin\\/index\\/login_html\":\"\",\"__token__\":\"6425082262153c9f8101f232eb03f618\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521946520),(1417,1,'admin','/admin/category/selectpage','','{\"\\/admin\\/category\\/selectpage\":\"\",\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"00003\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"00003\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',1521946531);
/*!40000 ALTER TABLE `fa_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_attachment`
--

DROP TABLE IF EXISTS `fa_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_attachment`
--

LOCK TABLES `fa_attachment` WRITE;
/*!40000 ALTER TABLE `fa_attachment` DISABLE KEYS */;
INSERT INTO `fa_attachment` VALUES (1,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),(2,'/uploads/20180313/c4603a3a250af4231caaa1150208adeb.jpg','2448','3264','jpg',0,1498353,'image/jpeg','',1520956527,1520956527,1520956527,'local','161289e1797a6a8c9db6b4d2de9178d74e1ac8bc');
/*!40000 ALTER TABLE `fa_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_auth_group`
--

DROP TABLE IF EXISTS `fa_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_auth_group`
--

LOCK TABLES `fa_auth_group` WRITE;
/*!40000 ALTER TABLE `fa_auth_group` DISABLE KEYS */;
INSERT INTO `fa_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `fa_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_auth_group_access`
--

DROP TABLE IF EXISTS `fa_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_auth_group_access`
--

LOCK TABLES `fa_auth_group_access` WRITE;
/*!40000 ALTER TABLE `fa_auth_group_access` DISABLE KEYS */;
INSERT INTO `fa_auth_group_access` VALUES (1,1),(2,2),(3,3),(4,5),(5,5);
/*!40000 ALTER TABLE `fa_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_auth_rule`
--

DROP TABLE IF EXISTS `fa_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_auth_rule`
--

LOCK TABLES `fa_auth_rule` WRITE;
/*!40000 ALTER TABLE `fa_auth_rule` DISABLE KEYS */;
INSERT INTO `fa_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-list','','Category tips',1,1497429920,1497429920,119,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'user','User','fa fa-list','','',1,1516374729,1516374729,0,'normal'),(67,'file',66,'user/user','User','fa fa-user','','',1,1516374729,1516374729,0,'normal'),(68,'file',67,'user/user/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(69,'file',67,'user/user/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(70,'file',67,'user/user/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(71,'file',67,'user/user/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(72,'file',67,'user/user/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(73,'file',66,'user/group','User group','fa fa-users','','',1,1516374729,1516374729,0,'normal'),(74,'file',73,'user/group/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(75,'file',73,'user/group/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(76,'file',73,'user/group/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(77,'file',73,'user/group/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(78,'file',73,'user/group/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(79,'file',66,'user/rule','User rule','fa fa-circle-o','','',1,1516374729,1516374729,0,'normal'),(80,'file',79,'user/rule/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(81,'file',79,'user/rule/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(82,'file',79,'user/rule/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(83,'file',79,'user/rule/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(84,'file',79,'user/rule/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(85,'file',0,'comming','Comming','fa fa-circle-o','','',1,1520952873,1520952873,0,'normal'),(86,'file',85,'comming/index','查看','fa fa-circle-o','','',0,1520952873,1520952873,0,'normal'),(87,'file',85,'comming/add','添加','fa fa-circle-o','','',0,1520952873,1520952873,0,'normal'),(88,'file',85,'comming/edit','编辑','fa fa-circle-o','','',0,1520952873,1520952873,0,'normal'),(89,'file',85,'comming/del','删除','fa fa-circle-o','','',0,1520952873,1520952873,0,'normal'),(90,'file',85,'comming/multi','批量更新','fa fa-circle-o','','',0,1520952873,1520952873,0,'normal'),(91,'file',0,'outting','Outting','fa fa-circle-o','','',1,1520952888,1520952888,0,'normal'),(92,'file',91,'outting/index','查看','fa fa-circle-o','','',0,1520952888,1520952888,0,'normal'),(93,'file',91,'outting/add','添加','fa fa-circle-o','','',0,1520952888,1520952888,0,'normal'),(94,'file',91,'outting/edit','编辑','fa fa-circle-o','','',0,1520952888,1520952888,0,'normal'),(95,'file',91,'outting/del','删除','fa fa-circle-o','','',0,1520952888,1520952888,0,'normal'),(96,'file',91,'outting/multi','批量更新','fa fa-circle-o','','',0,1520952888,1520952888,0,'normal'),(97,'file',0,'message','Message','fa fa-circle-o','','',1,1520954348,1520954348,0,'normal'),(98,'file',97,'message/index','查看','fa fa-circle-o','','',0,1520954348,1520954348,0,'normal'),(99,'file',97,'message/add','添加','fa fa-circle-o','','',0,1520954348,1520954348,0,'normal'),(100,'file',97,'message/edit','编辑','fa fa-circle-o','','',0,1520954348,1520954348,0,'normal'),(101,'file',97,'message/del','删除','fa fa-circle-o','','',0,1520954348,1520954348,0,'normal'),(102,'file',97,'message/multi','批量更新','fa fa-circle-o','','',0,1520954348,1520954348,0,'normal'),(103,'file',0,'shares','Shares','fa fa-circle-o','','',1,1521904896,1521904896,0,'normal'),(104,'file',103,'shares/index','查看','fa fa-circle-o','','',0,1521904896,1521904896,0,'normal'),(105,'file',103,'shares/add','添加','fa fa-circle-o','','',0,1521904896,1521904896,0,'normal'),(106,'file',103,'shares/edit','编辑','fa fa-circle-o','','',0,1521904896,1521904896,0,'normal'),(107,'file',103,'shares/del','删除','fa fa-circle-o','','',0,1521904896,1521904896,0,'normal'),(108,'file',103,'shares/multi','批量更新','fa fa-circle-o','','',0,1521904896,1521904896,0,'normal');
/*!40000 ALTER TABLE `fa_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_bank`
--

DROP TABLE IF EXISTS `fa_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_bank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT '',
  `code` varchar(255) DEFAULT '' COMMENT '银行卡号',
  `user_code` varchar(255) DEFAULT '' COMMENT '身份证',
  `province` smallint(6) unsigned DEFAULT '2',
  `city` smallint(6) unsigned DEFAULT '2',
  `address` varchar(255) DEFAULT '' COMMENT '银行地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_bank`
--

LOCK TABLES `fa_bank` WRITE;
/*!40000 ALTER TABLE `fa_bank` DISABLE KEYS */;
INSERT INTO `fa_bank` VALUES (8,2,'313dasd','asd','sdfsdf',2,2,'');
/*!40000 ALTER TABLE `fa_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_category`
--

DROP TABLE IF EXISTS `fa_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` tinyint(11) NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `maxprice` int(11) NOT NULL COMMENT '最高',
  `minprice` int(11) NOT NULL COMMENT '最低',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_category`
--

LOCK TABLES `fa_category` WRITE;
/*!40000 ALTER TABLE `fa_category` DISABLE KEYS */;
INSERT INTO `fa_category` VALUES (1,0,'shares','测试','',10,'','','','000001',1521905734,1521911375,0,'normal',10000,200),(2,0,'metal','asd','',2,'','','','000002',1521911077,1521911379,0,'normal',0,0),(3,0,'exchange','dasd','',1,'','','','000003',1521911173,1521915370,0,'normal',100000,500);
/*!40000 ALTER TABLE `fa_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_comming`
--

DROP TABLE IF EXISTS `fa_comming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_comming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '充值用户id',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '充值金额(分)',
  `orderId` varchar(255) NOT NULL COMMENT '充值单号',
  `tradeId` varchar(255) NOT NULL COMMENT '订单号',
  `date` int(11) NOT NULL COMMENT '交易时间',
  `payed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付成功',
  `charge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '余额更新',
  `readed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户是否阅读过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_comming`
--

LOCK TABLES `fa_comming` WRITE;
/*!40000 ALTER TABLE `fa_comming` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_comming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_config`
--

DROP TABLE IF EXISTS `fa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_config`
--

LOCK TABLES `fa_config` WRITE;
/*!40000 ALTER TABLE `fa_config` DISABLE KEYS */;
INSERT INTO `fa_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','FastAdmin','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"出入金设置\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','',''),(18,'maxOutMoney','example','单笔最大出金','单笔最大转出金额,0不限制','number','0','','required',''),(19,'maxOutCount','example','每日最大出金次数','每日最大出金次数,0不做限制','number','0','','required',''),(21,'limitMoney','example','一次最少充值金额','一次最少充值金额','number','50','','required','');
/*!40000 ALTER TABLE `fa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_message`
--

DROP TABLE IF EXISTS `fa_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `author` varchar(255) NOT NULL DEFAULT '管理员' COMMENT '作者',
  `public_time` int(11) NOT NULL COMMENT '发布时间',
  `edit_time` int(11) NOT NULL COMMENT '最后编辑时间',
  `content` text NOT NULL COMMENT '发布内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_message`
--

LOCK TABLES `fa_message` WRITE;
/*!40000 ALTER TABLE `fa_message` DISABLE KEYS */;
INSERT INTO `fa_message` VALUES (1,'dasdadasd','管理员',1520956800,1520956844,'<p><span style=\"background-color: rgb(255, 255, 0);\">fsdfsdfsdf</span></p>');
/*!40000 ALTER TABLE `fa_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_migrations`
--

DROP TABLE IF EXISTS `fa_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_migrations`
--

LOCK TABLES `fa_migrations` WRITE;
/*!40000 ALTER TABLE `fa_migrations` DISABLE KEYS */;
INSERT INTO `fa_migrations` VALUES (20180313141749,'Comming','2018-03-13 14:46:33','2018-03-13 14:46:33',0),(20180313143100,'Outting','2018-03-13 14:46:33','2018-03-13 14:46:33',0),(20180313145701,'Message','2018-03-13 15:18:37','2018-03-13 15:18:37',0),(20180313152010,'MessageAddText','2018-03-13 15:22:08','2018-03-13 15:22:08',0),(20180313161818,'Trade','2018-03-13 16:33:45','2018-03-13 16:33:45',0),(20180313162802,'UserAddOwner','2018-03-13 16:33:45','2018-03-13 16:33:45',0),(20180314153652,'TradeAddTime','2018-03-14 15:38:42','2018-03-14 15:38:42',0),(20180324034005,'Shares','2018-03-24 15:05:27','2018-03-24 15:05:27',0),(20180324153706,'EditShares','2018-03-24 15:40:57','2018-03-24 15:40:57',0),(20180324175000,'EditPrice','2018-03-24 17:53:08','2018-03-24 17:53:08',0);
/*!40000 ALTER TABLE `fa_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_outting`
--

DROP TABLE IF EXISTS `fa_outting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_outting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '充值用户id',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '转出金额(分)',
  `orderId` varchar(255) NOT NULL COMMENT '转出单号',
  `tradeId` varchar(255) NOT NULL COMMENT '订单号',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `bank` varchar(255) NOT NULL COMMENT '银行名称',
  `bankName` varchar(255) NOT NULL COMMENT '收款开户行名称',
  `date` int(11) NOT NULL COMMENT '交易时间',
  `payed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转出成功',
  `charge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '余额更新',
  `readed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户是否阅读过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_outting`
--

LOCK TABLES `fa_outting` WRITE;
/*!40000 ALTER TABLE `fa_outting` DISABLE KEYS */;
INSERT INTO `fa_outting` VALUES (1,2,1,'','out_5aaa96881644b','','','',1521129096,1,1,0);
/*!40000 ALTER TABLE `fa_outting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_shares`
--

DROP TABLE IF EXISTS `fa_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL COMMENT '时间',
  `open_price` int(11) NOT NULL COMMENT '开盘价格',
  `end_price` int(11) NOT NULL COMMENT '昨收价格',
  `maxPrice` int(11) NOT NULL,
  `minPrice` int(11) NOT NULL,
  `cid` int(11) NOT NULL COMMENT '对应的类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_shares`
--

LOCK TABLES `fa_shares` WRITE;
/*!40000 ALTER TABLE `fa_shares` DISABLE KEYS */;
INSERT INTO `fa_shares` VALUES (2,'2018-03-25',500,600,1000,250,1),(23,'2018-03-25',12,12,12,12,2),(22,'2018-03-25',12,12,12,12,3);
/*!40000 ALTER TABLE `fa_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_shares_detail`
--

DROP TABLE IF EXISTS `fa_shares_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_shares_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL COMMENT '时间',
  `data` text NOT NULL COMMENT '一天的涨跌分钟数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_shares_detail`
--

LOCK TABLES `fa_shares_detail` WRITE;
/*!40000 ALTER TABLE `fa_shares_detail` DISABLE KEYS */;
INSERT INTO `fa_shares_detail` VALUES (2,'2018-03-25','{\"0931\":490,\"0932\":494,\"0933\":503,\"0934\":497,\"0935\":492,\"0936\":487,\"0937\":472,\"0938\":486,\"0939\":495,\"0940\":490,\"0941\":504,\"0942\":498,\"0943\":488,\"0944\":483,\"0945\":492,\"0946\":501,\"0947\":490,\"0948\":485,\"0949\":475,\"0950\":470,\"0951\":474,\"0952\":478,\"0953\":482,\"0954\":467,\"0955\":457,\"0956\":443,\"0957\":456,\"0958\":446,\"0959\":454,\"1000\":458,\"1001\":462,\"1002\":475,\"1003\":479,\"1004\":474,\"1005\":464,\"1006\":477,\"1007\":472,\"1008\":467,\"1009\":476,\"1010\":461,\"1011\":474,\"1012\":464,\"1013\":473,\"1014\":487,\"1015\":501,\"1016\":511,\"1017\":521,\"1018\":531,\"1019\":541,\"1020\":551,\"1021\":539,\"1022\":544,\"1023\":560,\"1024\":571,\"1025\":588,\"1026\":576,\"1027\":587,\"1028\":581,\"1029\":592,\"1030\":580,\"1031\":568,\"1032\":579,\"1033\":567,\"1034\":555,\"1035\":566,\"1036\":549,\"1037\":554,\"1038\":537,\"1039\":553,\"1040\":558,\"1041\":546,\"1042\":551,\"1043\":567,\"1044\":578,\"1045\":572,\"1046\":554,\"1047\":542,\"1048\":547,\"1049\":557,\"1050\":573,\"1051\":584,\"1052\":601,\"1053\":588,\"1054\":582,\"1055\":587,\"1056\":598,\"1057\":603,\"1058\":584,\"1059\":601,\"1100\":613,\"1101\":631,\"1102\":612,\"1103\":605,\"1104\":623,\"1105\":604,\"1106\":610,\"1107\":603,\"1108\":584,\"1109\":572,\"1110\":577,\"1111\":571,\"1112\":582,\"1113\":570,\"1114\":564,\"1115\":580,\"1116\":585,\"1117\":579,\"1118\":596,\"1119\":584,\"1120\":595,\"1121\":577,\"1122\":594,\"1123\":599,\"1124\":610,\"1125\":597,\"1126\":591,\"1127\":573,\"1128\":578,\"1129\":595,\"1130\":600,\"1131\":588,\"1132\":582,\"1133\":587,\"1134\":598,\"1135\":580,\"1136\":585,\"1137\":602,\"1138\":620,\"1139\":638,\"1140\":618,\"1141\":624,\"1142\":636,\"1143\":655,\"1144\":641,\"1145\":653,\"1146\":672,\"1147\":651,\"1148\":664,\"1149\":650,\"1150\":637,\"1151\":656,\"1152\":662,\"1153\":668,\"1154\":654,\"1155\":667,\"1156\":687,\"1157\":700,\"1158\":721,\"1159\":699,\"1200\":692,\"1201\":698,\"1202\":691,\"1203\":711,\"1204\":703,\"1205\":695,\"1206\":715,\"1207\":736,\"1208\":713,\"1209\":727,\"1210\":734,\"1211\":711,\"1212\":725,\"1213\":739,\"1214\":716,\"1215\":730,\"1216\":737,\"1217\":751,\"1218\":743,\"1219\":750,\"1220\":742,\"1221\":727,\"1222\":741,\"1223\":763,\"1224\":755,\"1225\":747,\"1226\":754,\"1227\":738,\"1228\":745,\"1229\":759,\"1230\":781,\"1231\":773,\"1232\":780,\"1233\":803,\"1234\":819,\"1235\":827,\"1236\":843,\"1237\":859,\"1238\":850,\"1239\":875,\"1240\":848,\"1241\":839,\"1242\":847,\"1243\":855,\"1244\":829,\"1245\":812,\"1246\":795,\"1247\":810,\"1248\":793,\"1249\":769,\"1250\":761,\"1251\":738,\"1252\":752,\"1253\":744,\"1254\":758,\"1255\":735,\"1256\":742,\"1257\":719,\"1258\":726,\"1259\":740,\"1300\":754,\"1301\":761,\"1302\":745,\"1303\":767,\"1304\":774,\"1305\":766,\"1306\":773,\"1307\":780,\"1308\":772,\"1309\":756,\"1310\":748,\"1311\":770,\"1312\":777,\"1313\":753,\"1314\":737,\"1315\":729,\"1316\":736,\"1317\":758,\"1318\":735,\"1319\":757,\"1320\":764,\"1321\":741,\"1322\":733,\"1323\":740,\"1324\":754,\"1325\":738,\"1326\":715,\"1327\":693,\"1328\":679,\"1329\":692,\"1330\":705,\"1331\":712,\"1332\":697,\"1333\":703,\"1334\":688,\"1335\":674,\"1336\":687,\"1337\":707,\"1338\":685,\"1339\":664,\"1340\":683,\"1341\":676,\"1342\":669,\"1343\":655,\"1344\":648,\"1345\":660,\"1346\":673,\"1347\":652,\"1348\":665,\"1349\":645,\"1350\":651,\"1351\":664,\"1352\":650,\"1353\":637,\"1354\":624,\"1355\":636,\"1356\":648,\"1357\":654,\"1358\":640,\"1359\":633,\"1400\":639,\"1401\":626,\"1402\":638,\"1403\":650,\"1404\":643,\"1405\":636,\"1406\":642,\"1407\":661,\"1408\":641,\"1409\":628,\"1410\":615,\"1411\":627,\"1412\":620,\"1413\":613,\"1414\":631,\"1415\":637,\"1416\":643,\"1417\":662,\"1418\":642,\"1419\":648,\"1420\":635,\"1421\":654,\"1422\":660,\"1423\":646,\"1424\":639,\"1425\":651,\"1426\":637,\"1427\":656,\"1428\":636,\"1429\":655,\"1430\":668,\"1431\":661,\"1432\":647,\"1433\":659,\"1434\":665,\"1435\":651,\"1436\":670,\"1437\":663,\"1438\":649,\"1439\":642,\"1440\":661,\"1441\":680,\"1442\":686,\"1443\":692,\"1444\":705,\"1445\":683,\"1446\":689,\"1447\":675,\"1448\":668,\"1449\":647,\"1450\":659,\"1451\":645,\"1452\":657,\"1453\":643,\"1454\":649,\"1455\":661,\"1456\":647,\"1457\":634,\"1458\":621,\"1459\":608,\"1500\":589,\"1501\":600,\"1502\":618,\"1503\":624,\"1504\":605,\"1505\":617,\"1506\":629,\"1507\":622,\"1508\":634,\"1509\":640,\"1510\":652,\"1511\":658,\"1512\":644,\"1513\":656,\"1514\":636,\"1515\":629,\"1516\":622,\"1517\":615,\"1518\":621,\"1519\":614,\"1520\":620,\"1521\":613,\"1522\":594,\"1523\":576,\"1524\":587,\"1525\":592,\"1526\":609,\"1527\":602,\"1528\":589,\"1529\":583,\"1530\":600}'),(23,'2018-03-25','{\"0931\":606,\"0932\":587,\"0933\":592,\"0934\":580,\"0935\":591,\"0936\":602,\"0937\":589,\"0938\":571,\"0939\":565,\"0940\":559,\"0941\":547,\"0942\":530,\"0943\":519,\"0944\":513,\"0945\":528,\"0946\":533,\"0947\":548,\"0948\":553,\"0949\":564,\"0950\":552,\"0951\":535,\"0952\":524,\"0953\":539,\"0954\":528,\"0955\":538,\"0956\":543,\"0957\":559,\"0958\":570,\"0959\":552,\"1000\":546,\"1001\":551,\"1002\":556,\"1003\":539,\"1004\":522,\"1005\":537,\"1006\":520,\"1007\":535,\"1008\":545,\"1009\":528,\"1010\":533,\"1011\":527,\"1012\":537,\"1013\":526,\"1014\":536,\"1015\":530,\"1016\":514,\"1017\":508,\"1018\":523,\"1019\":538,\"1020\":548,\"1021\":542,\"1022\":547,\"1023\":563,\"1024\":579,\"1025\":561,\"1026\":549,\"1027\":554,\"1028\":565,\"1029\":576,\"1030\":581,\"1031\":575,\"1032\":580,\"1033\":562,\"1034\":573,\"1035\":590,\"1036\":572,\"1037\":566,\"1038\":577,\"1039\":594,\"1040\":605,\"1041\":592,\"1042\":586,\"1043\":580,\"1044\":562,\"1045\":573,\"1046\":578,\"1047\":589,\"1048\":594,\"1049\":599,\"1050\":581,\"1051\":563,\"1052\":546,\"1053\":551,\"1054\":534,\"1055\":550,\"1056\":533,\"1057\":543,\"1058\":553,\"1059\":569,\"1100\":551,\"1101\":562,\"1102\":573,\"1103\":561,\"1104\":577,\"1105\":559,\"1106\":564,\"1107\":547,\"1108\":541,\"1109\":535,\"1110\":540,\"1111\":529,\"1112\":544,\"1113\":527,\"1114\":521,\"1115\":531,\"1116\":546,\"1117\":540,\"1118\":529,\"1119\":513,\"1120\":528,\"1121\":533,\"1122\":522,\"1123\":532,\"1124\":542,\"1125\":531,\"1126\":520,\"1127\":514,\"1128\":503,\"1129\":518,\"1130\":512,\"1131\":522,\"1132\":537,\"1133\":531,\"1134\":546,\"1135\":529,\"1136\":513,\"1137\":507,\"1138\":517,\"1139\":522,\"1140\":516,\"1141\":521,\"1142\":531,\"1143\":525,\"1144\":514,\"1145\":508,\"1146\":523,\"1147\":517,\"1148\":506,\"1149\":500,\"1150\":505,\"1151\":520,\"1152\":509,\"1153\":514,\"1154\":503,\"1155\":487,\"1156\":496,\"1157\":505,\"1158\":510,\"1159\":499,\"1200\":503,\"1201\":487,\"1202\":472,\"1203\":481,\"1204\":495,\"1205\":499,\"1206\":503,\"1207\":497,\"1208\":487,\"1209\":477,\"1210\":481,\"1211\":495,\"1212\":490,\"1213\":485,\"1214\":494,\"1215\":508,\"1216\":518,\"1217\":528,\"1218\":522,\"1219\":537,\"1220\":520,\"1221\":525,\"1222\":540,\"1223\":556,\"1224\":539,\"1225\":544,\"1226\":549,\"1227\":532,\"1228\":521,\"1229\":510,\"1230\":520,\"1231\":525,\"1232\":509,\"1233\":503,\"1234\":497,\"1235\":487,\"1236\":482,\"1237\":486,\"1238\":500,\"1239\":515,\"1240\":509,\"1241\":503,\"1242\":508,\"1243\":502,\"1244\":496,\"1245\":486,\"1246\":476,\"1247\":461,\"1248\":474,\"1249\":483,\"1250\":468,\"1251\":472,\"1252\":476,\"1253\":485,\"1254\":475,\"1255\":460,\"1256\":446,\"1257\":459,\"1258\":454,\"1259\":440,\"1300\":431,\"1301\":418,\"1302\":409,\"1303\":413,\"1304\":408,\"1305\":403,\"1306\":407,\"1307\":419,\"1308\":410,\"1309\":414,\"1310\":405,\"1311\":417,\"1312\":429,\"1313\":424,\"1314\":432,\"1315\":444,\"1316\":457,\"1317\":443,\"1318\":456,\"1319\":460,\"1320\":446,\"1321\":454,\"1322\":463,\"1323\":472,\"1324\":467,\"1325\":471,\"1326\":480,\"1327\":494,\"1328\":489,\"1329\":484,\"1330\":498,\"1331\":488,\"1332\":492,\"1333\":501,\"1334\":511,\"1335\":516,\"1336\":510,\"1337\":504,\"1338\":519,\"1339\":508,\"1340\":518,\"1341\":533,\"1342\":522,\"1343\":511,\"1344\":500,\"1345\":515,\"1346\":525,\"1347\":514,\"1348\":529,\"1349\":523,\"1350\":517,\"1351\":522,\"1352\":527,\"1353\":532,\"1354\":542,\"1355\":525,\"1356\":530,\"1357\":540,\"1358\":534,\"1359\":550,\"1400\":561,\"1401\":577,\"1402\":594,\"1403\":582,\"1404\":599,\"1405\":616,\"1406\":628,\"1407\":609,\"1408\":615,\"1409\":602,\"1410\":614,\"1411\":607,\"1412\":600,\"1413\":618,\"1414\":599,\"1415\":593,\"1416\":598,\"1417\":580,\"1418\":585,\"1419\":596,\"1420\":601,\"1421\":594,\"1422\":599,\"1423\":616,\"1424\":603,\"1425\":615,\"1426\":627,\"1427\":633,\"1428\":639,\"1429\":645,\"1430\":632,\"1431\":619,\"1432\":606,\"1433\":593,\"1434\":587,\"1435\":575,\"1436\":592,\"1437\":603,\"1438\":590,\"1439\":578,\"1440\":589,\"1441\":600,\"1442\":606,\"1443\":624,\"1444\":642,\"1445\":622,\"1446\":603,\"1447\":609,\"1448\":627,\"1449\":620,\"1450\":632,\"1451\":644,\"1452\":631,\"1453\":618,\"1454\":599,\"1455\":604,\"1456\":616,\"1457\":603,\"1458\":615,\"1459\":608,\"1500\":614,\"1501\":595,\"1502\":600,\"1503\":612,\"1504\":618,\"1505\":611,\"1506\":617,\"1507\":623,\"1508\":610,\"1509\":616,\"1510\":597,\"1511\":614,\"1512\":632,\"1513\":644,\"1514\":631,\"1515\":649,\"1516\":629,\"1517\":641,\"1518\":660,\"1519\":679,\"1520\":658,\"1521\":638,\"1522\":631,\"1523\":643,\"1524\":636,\"1525\":655,\"1526\":674,\"1527\":687,\"1528\":680,\"1529\":693,\"1530\":672}'),(22,'2018-03-25','{\"0931\":606,\"0932\":587,\"0933\":592,\"0934\":580,\"0935\":591,\"0936\":602,\"0937\":589,\"0938\":571,\"0939\":565,\"0940\":559,\"0941\":547,\"0942\":530,\"0943\":519,\"0944\":513,\"0945\":528,\"0946\":533,\"0947\":548,\"0948\":553,\"0949\":564,\"0950\":552,\"0951\":535,\"0952\":524,\"0953\":539,\"0954\":528,\"0955\":538,\"0956\":543,\"0957\":559,\"0958\":570,\"0959\":552,\"1000\":546,\"1001\":551,\"1002\":556,\"1003\":539,\"1004\":522,\"1005\":537,\"1006\":520,\"1007\":535,\"1008\":545,\"1009\":528,\"1010\":533,\"1011\":527,\"1012\":537,\"1013\":526,\"1014\":536,\"1015\":530,\"1016\":514,\"1017\":508,\"1018\":523,\"1019\":538,\"1020\":548,\"1021\":542,\"1022\":547,\"1023\":563,\"1024\":579,\"1025\":561,\"1026\":549,\"1027\":554,\"1028\":565,\"1029\":576,\"1030\":581,\"1031\":575,\"1032\":580,\"1033\":562,\"1034\":573,\"1035\":590,\"1036\":572,\"1037\":566,\"1038\":577,\"1039\":594,\"1040\":605,\"1041\":592,\"1042\":586,\"1043\":580,\"1044\":562,\"1045\":573,\"1046\":578,\"1047\":589,\"1048\":594,\"1049\":599,\"1050\":581,\"1051\":563,\"1052\":546,\"1053\":551,\"1054\":534,\"1055\":550,\"1056\":533,\"1057\":543,\"1058\":553,\"1059\":569,\"1100\":551,\"1101\":562,\"1102\":573,\"1103\":561,\"1104\":577,\"1105\":559,\"1106\":564,\"1107\":547,\"1108\":541,\"1109\":535,\"1110\":540,\"1111\":529,\"1112\":544,\"1113\":527,\"1114\":521,\"1115\":531,\"1116\":546,\"1117\":540,\"1118\":529,\"1119\":513,\"1120\":528,\"1121\":533,\"1122\":522,\"1123\":532,\"1124\":542,\"1125\":531,\"1126\":520,\"1127\":514,\"1128\":503,\"1129\":518,\"1130\":512,\"1131\":522,\"1132\":537,\"1133\":531,\"1134\":546,\"1135\":529,\"1136\":513,\"1137\":507,\"1138\":517,\"1139\":522,\"1140\":516,\"1141\":521,\"1142\":531,\"1143\":525,\"1144\":514,\"1145\":508,\"1146\":523,\"1147\":517,\"1148\":506,\"1149\":500,\"1150\":505,\"1151\":520,\"1152\":509,\"1153\":514,\"1154\":503,\"1155\":487,\"1156\":496,\"1157\":505,\"1158\":510,\"1159\":499,\"1200\":503,\"1201\":487,\"1202\":472,\"1203\":481,\"1204\":495,\"1205\":499,\"1206\":503,\"1207\":497,\"1208\":487,\"1209\":477,\"1210\":481,\"1211\":495,\"1212\":490,\"1213\":485,\"1214\":494,\"1215\":508,\"1216\":518,\"1217\":528,\"1218\":522,\"1219\":537,\"1220\":520,\"1221\":525,\"1222\":540,\"1223\":556,\"1224\":539,\"1225\":544,\"1226\":549,\"1227\":532,\"1228\":521,\"1229\":510,\"1230\":520,\"1231\":525,\"1232\":509,\"1233\":503,\"1234\":497,\"1235\":487,\"1236\":482,\"1237\":486,\"1238\":500,\"1239\":515,\"1240\":509,\"1241\":503,\"1242\":508,\"1243\":502,\"1244\":496,\"1245\":486,\"1246\":476,\"1247\":461,\"1248\":474,\"1249\":483,\"1250\":468,\"1251\":472,\"1252\":476,\"1253\":485,\"1254\":475,\"1255\":460,\"1256\":446,\"1257\":459,\"1258\":454,\"1259\":440,\"1300\":431,\"1301\":418,\"1302\":409,\"1303\":413,\"1304\":408,\"1305\":403,\"1306\":407,\"1307\":419,\"1308\":410,\"1309\":414,\"1310\":405,\"1311\":417,\"1312\":429,\"1313\":424,\"1314\":432,\"1315\":444,\"1316\":457,\"1317\":443,\"1318\":456,\"1319\":460,\"1320\":446,\"1321\":454,\"1322\":463,\"1323\":472,\"1324\":467,\"1325\":471,\"1326\":480,\"1327\":494,\"1328\":489,\"1329\":484,\"1330\":498,\"1331\":488,\"1332\":492,\"1333\":501,\"1334\":511,\"1335\":516,\"1336\":510,\"1337\":504,\"1338\":519,\"1339\":508,\"1340\":518,\"1341\":533,\"1342\":522,\"1343\":511,\"1344\":500,\"1345\":515,\"1346\":525,\"1347\":514,\"1348\":529,\"1349\":523,\"1350\":517,\"1351\":522,\"1352\":527,\"1353\":532,\"1354\":542,\"1355\":525,\"1356\":530,\"1357\":540,\"1358\":534,\"1359\":550,\"1400\":561,\"1401\":577,\"1402\":594,\"1403\":582,\"1404\":599,\"1405\":616,\"1406\":628,\"1407\":609,\"1408\":615,\"1409\":602,\"1410\":614,\"1411\":607,\"1412\":600,\"1413\":618,\"1414\":599,\"1415\":593,\"1416\":598,\"1417\":580,\"1418\":585,\"1419\":596,\"1420\":601,\"1421\":594,\"1422\":599,\"1423\":616,\"1424\":603,\"1425\":615,\"1426\":627,\"1427\":633,\"1428\":639,\"1429\":645,\"1430\":632,\"1431\":619,\"1432\":606,\"1433\":593,\"1434\":587,\"1435\":575,\"1436\":592,\"1437\":603,\"1438\":590,\"1439\":578,\"1440\":589,\"1441\":600,\"1442\":606,\"1443\":624,\"1444\":642,\"1445\":622,\"1446\":603,\"1447\":609,\"1448\":627,\"1449\":620,\"1450\":632,\"1451\":644,\"1452\":631,\"1453\":618,\"1454\":599,\"1455\":604,\"1456\":616,\"1457\":603,\"1458\":615,\"1459\":608,\"1500\":614,\"1501\":595,\"1502\":600,\"1503\":612,\"1504\":618,\"1505\":611,\"1506\":617,\"1507\":623,\"1508\":610,\"1509\":616,\"1510\":597,\"1511\":614,\"1512\":632,\"1513\":644,\"1514\":631,\"1515\":649,\"1516\":629,\"1517\":641,\"1518\":660,\"1519\":679,\"1520\":658,\"1521\":638,\"1522\":631,\"1523\":643,\"1524\":636,\"1525\":655,\"1526\":674,\"1527\":687,\"1528\":680,\"1529\":693,\"1530\":672}');
/*!40000 ALTER TABLE `fa_shares_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_sms`
--

DROP TABLE IF EXISTS `fa_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_sms`
--

LOCK TABLES `fa_sms` WRITE;
/*!40000 ALTER TABLE `fa_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_test`
--

DROP TABLE IF EXISTS `fa_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_test`
--

LOCK TABLES `fa_test` WRITE;
/*!40000 ALTER TABLE `fa_test` DISABLE KEYS */;
INSERT INTO `fa_test` VALUES (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,0,1,'normal','1');
/*!40000 ALTER TABLE `fa_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_trade`
--

DROP TABLE IF EXISTS `fa_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `status` int(3) NOT NULL COMMENT '卖出/买入',
  `money` int(11) NOT NULL COMMENT '总金额',
  `number` int(11) NOT NULL COMMENT '数量',
  `price` int(11) NOT NULL COMMENT '单价',
  `code` int(11) NOT NULL COMMENT '产品类型',
  `createtime` int(11) NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_trade`
--

LOCK TABLES `fa_trade` WRITE;
/*!40000 ALTER TABLE `fa_trade` DISABLE KEYS */;
INSERT INTO `fa_trade` VALUES (1,2,1,100,10,10,0,0),(2,2,1,100,10,10,0,0),(3,2,1,100,10,10,0,0),(4,2,1,100,10,10,0,0),(5,2,1,100,10,10,0,0),(6,2,1,10,10,1,10001,0),(7,2,2,900,30,30,10001,0),(8,2,2,900,30,30,10001,0),(9,2,2,900,30,30,10001,0),(10,2,1,10,10,1,10001,0),(11,2,1,10,10,1,10001,0),(12,2,2,300,10,30,10001,0),(13,2,2,300,10,30,10001,0),(14,2,1,10,10,1,10001,0),(15,2,1,10,10,1,10001,0),(16,2,1,10,10,1,10001,0),(17,2,1,10,10,1,10001,0),(18,2,1,10,10,1,10001,0),(19,2,1,10,10,1,10001,0),(20,2,1,10,10,1,10001,0),(21,2,1,10,10,1,10001,0),(22,2,1,10,10,1,10001,0),(23,2,1,10,10,1,10001,0),(24,2,1,10,10,1,10001,1),(25,2,1,10,10,1,10001,1),(26,2,1,10,10,1,10001,1521646896),(27,2,1,10,10,1,10001,1521646897),(28,2,1,1200,1,1200,1,1521967484),(29,2,1,2400,2,1200,1,1521967708),(30,2,2,36,3,12,1,0);
/*!40000 ALTER TABLE `fa_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user`
--

DROP TABLE IF EXISTS `fa_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL COMMENT '格言',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  `money` int(11) NOT NULL COMMENT '拥有的资金',
  `owner` varchar(255) NOT NULL COMMENT '拥有的产品',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user`
--

LOCK TABLES `fa_user` WRITE;
/*!40000 ALTER TABLE `fa_user` DISABLE KEYS */;
INSERT INTO `fa_user` VALUES (1,2,'admin','admin','a3ae0e22d72813e74c43fd74ac2c982c','uTsQcx','admin@163.com','13888888888','/assets/img/avatar.png',0,0,'2017-04-15','',0,1,1,1516170492,1516171614,'127.0.0.1',0,'127.0.0.1',1491461418,0,1520957675,'','normal','',0,''),(2,2,'test','testdas','97d1976390d8985aa2690c309f45068e','dcf5aC','test@test.com','18730631201','/icon/20180322\\3561fb9d5025b57d13050b2da89971c0.jpg',1,1,'2018-03-22','大宋2123123',0,1,3,1521818653,1521966345,'127.0.0.1',0,'127.0.0.1',1520957519,1520957519,1521967903,'','normal','',9066,'a:1:{i:10001;a:2:{s:6:\"number\";i:120;s:5:\"price\";d:1.75;}}');
/*!40000 ALTER TABLE `fa_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_group`
--

DROP TABLE IF EXISTS `fa_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_group`
--

LOCK TABLES `fa_user_group` WRITE;
/*!40000 ALTER TABLE `fa_user_group` DISABLE KEYS */;
INSERT INTO `fa_user_group` VALUES (1,'土豪','5,6,7,8,9,10,11,12,3,1,4,2',1515386468,1520957695,'normal'),(2,'用户','1,2,3,4,5,6,7,8,9,10,11,12',1520957409,1520957409,'normal');
/*!40000 ALTER TABLE `fa_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_rule`
--

DROP TABLE IF EXISTS `fa_user_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_rule`
--

LOCK TABLES `fa_user_rule` WRITE;
/*!40000 ALTER TABLE `fa_user_rule` DISABLE KEYS */;
INSERT INTO `fa_user_rule` VALUES (1,0,'index','前台','',1,1516168079,1516168079,1,'normal'),(2,0,'api','API接口','',1,1516168062,1516168062,2,'normal'),(3,1,'user','会员模块','',1,1515386221,1516168103,12,'normal'),(4,2,'user','会员模块','',1,1515386221,1516168092,11,'normal'),(5,3,'index/user/login','登录','',0,1515386247,1515386247,5,'normal'),(6,3,'index/user/register','注册','',0,1515386262,1516015236,7,'normal'),(7,3,'index/user/index','会员中心','',0,1516015012,1516015012,9,'normal'),(8,3,'index/user/profile','个人资料','',0,1516015012,1516015012,4,'normal'),(9,4,'api/user/login','登录','',0,1515386247,1515386247,6,'normal'),(10,4,'api/user/register','注册','',0,1515386262,1516015236,8,'normal'),(11,4,'api/user/index','会员中心','',0,1516015012,1516015012,10,'normal'),(12,4,'api/user/profile','个人资料','',0,1516015012,1516015012,3,'normal');
/*!40000 ALTER TABLE `fa_user_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_score_log`
--

DROP TABLE IF EXISTS `fa_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_score_log`
--

LOCK TABLES `fa_user_score_log` WRITE;
/*!40000 ALTER TABLE `fa_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_token`
--

DROP TABLE IF EXISTS `fa_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_token`
--

LOCK TABLES `fa_user_token` WRITE;
/*!40000 ALTER TABLE `fa_user_token` DISABLE KEYS */;
INSERT INTO `fa_user_token` VALUES ('100a8fbd-55e5-4f34-ad12-9ba18fd500b7',2,1521818463,0),('18331aa4-3acf-4e2a-ad93-f4fd719a465c',2,1521818495,0),('1974eb7b-3ae2-403e-b61d-80c9b633805d',2,1521653409,0),('473c8388-ca00-488f-a059-eed70a865b7e',2,1521734926,0),('522386b7-2e1d-4b5c-b304-85f2d392363c',2,1521734754,0),('53319f8c-9867-480d-99ae-52ce250c2400',2,1521649463,0),('761cc968-7b97-4235-9d9c-f4cebf72a57d',2,1521642868,0),('77e0cc6d-7891-4759-ae46-2724f17edbf4',2,1521818187,0),('7d732d7a-e33b-4fc8-a326-6db65fb395bf',2,1521734678,0),('845a627d-abd3-4b62-bb8e-80df27edab64',2,1521818653,0),('9a47881a-dd69-45d7-bb0c-a3759a03ddcb',2,1521818146,0),('9bb3df73-6717-4b9b-9721-9b90c6cc9680',2,1521038558,0),('a5aed96b-a523-46d6-9ec4-ad994fa50995',2,1521818283,0),('a82639c7-505b-4c47-8ebc-8bb2b2c356b7',2,1521966345,0),('aa12e38b-1fd4-44e2-85f4-1ce282572979',2,1521642345,0),('b01b9ba7-dea6-4d57-9faf-094522956cf4',2,1521818602,0),('d679957d-ffeb-4d87-9839-61c4ad2ccf89',2,1521653385,0),('e80c5307-08ea-4d9e-8894-909aebbfc35d',2,1521643136,0),('eb79b57b-7498-4915-9439-390e95339731',2,1521125097,0),('ffe8b529-1b65-4fc7-a5e0-63f799cfdacf',2,1521818382,0);
/*!40000 ALTER TABLE `fa_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_version`
--

DROP TABLE IF EXISTS `fa_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_version`
--

LOCK TABLES `fa_version` WRITE;
/*!40000 ALTER TABLE `fa_version` DISABLE KEYS */;
INSERT INTO `fa_version` VALUES (1,'1.1.1,2','1.2.1','20M','更新内容','http://www.fastadmin.net/download.html',1,1520425318,0,0,'normal');
/*!40000 ALTER TABLE `fa_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-26  1:51:01

-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl9446836
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `cl9446836`
--

/*!40000 DROP DATABASE IF EXISTS `cl9446836`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl9446836` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl9446836`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjingdianxinxi`
--

DROP TABLE IF EXISTS `discussjingdianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjingdianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='景点信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjingdianxinxi`
--

LOCK TABLES `discussjingdianxinxi` WRITE;
/*!40000 ALTER TABLE `discussjingdianxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussjingdianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusslvyouluxian`
--

DROP TABLE IF EXISTS `discusslvyouluxian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discusslvyouluxian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='旅游路线评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusslvyouluxian`
--

LOCK TABLES `discusslvyouluxian` WRITE;
/*!40000 ALTER TABLE `discusslvyouluxian` DISABLE KEYS */;
/*!40000 ALTER TABLE `discusslvyouluxian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jingdianfenlei`
--

DROP TABLE IF EXISTS `jingdianfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jingdianfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jingdianfenlei` varchar(200) DEFAULT NULL COMMENT '景点分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='景点分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jingdianfenlei`
--

LOCK TABLES `jingdianfenlei` WRITE;
/*!40000 ALTER TABLE `jingdianfenlei` DISABLE KEYS */;
INSERT INTO `jingdianfenlei` VALUES (91,'2024-03-22 10:55:06','景点分类1'),(92,'2024-03-22 10:55:06','景点分类2'),(93,'2024-03-22 10:55:06','景点分类3'),(94,'2024-03-22 10:55:06','景点分类4'),(95,'2024-03-22 10:55:06','景点分类5'),(96,'2024-03-22 10:55:06','景点分类6');
/*!40000 ALTER TABLE `jingdianfenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jingdianxinxi`
--

DROP TABLE IF EXISTS `jingdianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jingdianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jingdianmingcheng` varchar(200) NOT NULL COMMENT '景点名称',
  `jingdianfenlei` varchar(200) DEFAULT NULL COMMENT '景点分类',
  `jingdiantupian` longtext COMMENT '景点图片',
  `menpiaojiage` double NOT NULL COMMENT '门票价格',
  `kaifangshijian` varchar(200) DEFAULT NULL COMMENT '开放时间',
  `goupiaoxuzhi` longtext COMMENT '购票须知',
  `jingdiandizhi` varchar(200) DEFAULT NULL COMMENT '景点地址',
  `jingdianjieshao` longtext COMMENT '景点介绍',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `clicknum` int(11) DEFAULT NULL COMMENT '点击次数',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='景点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jingdianxinxi`
--

LOCK TABLES `jingdianxinxi` WRITE;
/*!40000 ALTER TABLE `jingdianxinxi` DISABLE KEYS */;
INSERT INTO `jingdianxinxi` VALUES (51,'2024-03-22 10:55:06','景点名称1','景点分类1','file/jingdianxinxiJingdiantupian1.jpg,file/jingdianxinxiJingdiantupian2.jpg,file/jingdianxinxiJingdiantupian3.jpg',1,'开放时间1','购票须知1','景点地址1','景点介绍1',1,1,'2024-03-22 18:55:06'),(52,'2024-03-22 10:55:06','景点名称2','景点分类2','file/jingdianxinxiJingdiantupian2.jpg,file/jingdianxinxiJingdiantupian3.jpg,file/jingdianxinxiJingdiantupian4.jpg',2,'开放时间2','购票须知2','景点地址2','景点介绍2',2,2,'2024-03-22 18:55:06'),(53,'2024-03-22 10:55:06','景点名称3','景点分类3','file/jingdianxinxiJingdiantupian3.jpg,file/jingdianxinxiJingdiantupian4.jpg,file/jingdianxinxiJingdiantupian5.jpg',3,'开放时间3','购票须知3','景点地址3','景点介绍3',3,3,'2024-03-22 18:55:06'),(54,'2024-03-22 10:55:06','景点名称4','景点分类4','file/jingdianxinxiJingdiantupian4.jpg,file/jingdianxinxiJingdiantupian5.jpg,file/jingdianxinxiJingdiantupian6.jpg',4,'开放时间4','购票须知4','景点地址4','景点介绍4',4,4,'2024-03-22 18:55:06'),(55,'2024-03-22 10:55:06','景点名称5','景点分类5','file/jingdianxinxiJingdiantupian5.jpg,file/jingdianxinxiJingdiantupian6.jpg,file/jingdianxinxiJingdiantupian7.jpg',5,'开放时间5','购票须知5','景点地址5','景点介绍5',5,5,'2024-03-22 18:55:06'),(56,'2024-03-22 10:55:06','景点名称6','景点分类6','file/jingdianxinxiJingdiantupian6.jpg,file/jingdianxinxiJingdiantupian7.jpg,file/jingdianxinxiJingdiantupian8.jpg',6,'开放时间6','购票须知6','景点地址6','景点介绍6',6,6,'2024-03-22 18:55:06');
/*!40000 ALTER TABLE `jingdianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lvyouluxian`
--

DROP TABLE IF EXISTS `lvyouluxian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lvyouluxian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `luxianmingcheng` varchar(200) DEFAULT NULL COMMENT '路线名称',
  `jingdianmingcheng` varchar(200) DEFAULT NULL COMMENT '景点名称',
  `jingdianjieshao` longtext COMMENT '景点介绍',
  `luxiantupian` longtext COMMENT '路线图片',
  `qidian` varchar(200) DEFAULT NULL COMMENT '起点',
  `tujingluduan` varchar(200) DEFAULT NULL COMMENT '途径路段',
  `mudedi` varchar(200) DEFAULT NULL COMMENT '目的地',
  `chuxingfangshi` varchar(200) DEFAULT NULL COMMENT '出行方式',
  `luxianjieshao` longtext COMMENT '路线介绍',
  `xingchengtianshu` varchar(200) DEFAULT NULL COMMENT '行程天数',
  `xingchenganpai` longtext COMMENT '行程安排',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `clicknum` int(11) DEFAULT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='旅游路线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lvyouluxian`
--

LOCK TABLES `lvyouluxian` WRITE;
/*!40000 ALTER TABLE `lvyouluxian` DISABLE KEYS */;
INSERT INTO `lvyouluxian` VALUES (101,'2024-03-22 10:55:06','路线名称1','景点名称1','景点介绍1','file/lvyouluxianLuxiantupian1.jpg,file/lvyouluxianLuxiantupian2.jpg,file/lvyouluxianLuxiantupian3.jpg','起点1','途径路段1','目的地1','出行方式1','路线介绍1','行程天数1','行程安排1',1,1),(102,'2024-03-22 10:55:06','路线名称2','景点名称2','景点介绍2','file/lvyouluxianLuxiantupian2.jpg,file/lvyouluxianLuxiantupian3.jpg,file/lvyouluxianLuxiantupian4.jpg','起点2','途径路段2','目的地2','出行方式2','路线介绍2','行程天数2','行程安排2',2,2),(103,'2024-03-22 10:55:06','路线名称3','景点名称3','景点介绍3','file/lvyouluxianLuxiantupian3.jpg,file/lvyouluxianLuxiantupian4.jpg,file/lvyouluxianLuxiantupian5.jpg','起点3','途径路段3','目的地3','出行方式3','路线介绍3','行程天数3','行程安排3',3,3),(104,'2024-03-22 10:55:06','路线名称4','景点名称4','景点介绍4','file/lvyouluxianLuxiantupian4.jpg,file/lvyouluxianLuxiantupian5.jpg,file/lvyouluxianLuxiantupian6.jpg','起点4','途径路段4','目的地4','出行方式4','路线介绍4','行程天数4','行程安排4',4,4),(105,'2024-03-22 10:55:06','路线名称5','景点名称5','景点介绍5','file/lvyouluxianLuxiantupian5.jpg,file/lvyouluxianLuxiantupian6.jpg,file/lvyouluxianLuxiantupian7.jpg','起点5','途径路段5','目的地5','出行方式5','路线介绍5','行程天数5','行程安排5',5,5),(106,'2024-03-22 10:55:06','路线名称6','景点名称6','景点介绍6','file/lvyouluxianLuxiantupian6.jpg,file/lvyouluxianLuxiantupian7.jpg,file/lvyouluxianLuxiantupian8.jpg','起点6','途径路段6','目的地6','出行方式6','路线介绍6','行程天数6','行程安排6',6,6);
/*!40000 ALTER TABLE `lvyouluxian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menpiaogoumai`
--

DROP TABLE IF EXISTS `menpiaogoumai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menpiaogoumai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `jingdianmingcheng` varchar(200) DEFAULT NULL COMMENT '景点名称',
  `jingdiantupian` longtext COMMENT '景点图片',
  `menpiaojiage` double DEFAULT NULL COMMENT '门票价格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `dingdanjine` double DEFAULT NULL COMMENT '订单金额',
  `goumaishijian` datetime DEFAULT NULL COMMENT '购买时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='门票购买';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menpiaogoumai`
--

LOCK TABLES `menpiaogoumai` WRITE;
/*!40000 ALTER TABLE `menpiaogoumai` DISABLE KEYS */;
INSERT INTO `menpiaogoumai` VALUES (71,'2024-03-22 10:55:06','1111111111','景点名称1','file/menpiaogoumaiJingdiantupian1.jpg,file/menpiaogoumaiJingdiantupian2.jpg,file/menpiaogoumaiJingdiantupian3.jpg',1,1,1,'2024-03-22 18:55:06','用户账号1','用户姓名1','手机号码1','未支付'),(72,'2024-03-22 10:55:06','2222222222','景点名称2','file/menpiaogoumaiJingdiantupian2.jpg,file/menpiaogoumaiJingdiantupian3.jpg,file/menpiaogoumaiJingdiantupian4.jpg',2,2,2,'2024-03-22 18:55:06','用户账号2','用户姓名2','手机号码2','未支付'),(73,'2024-03-22 10:55:06','3333333333','景点名称3','file/menpiaogoumaiJingdiantupian3.jpg,file/menpiaogoumaiJingdiantupian4.jpg,file/menpiaogoumaiJingdiantupian5.jpg',3,3,3,'2024-03-22 18:55:06','用户账号3','用户姓名3','手机号码3','未支付'),(74,'2024-03-22 10:55:06','4444444444','景点名称4','file/menpiaogoumaiJingdiantupian4.jpg,file/menpiaogoumaiJingdiantupian5.jpg,file/menpiaogoumaiJingdiantupian6.jpg',4,4,4,'2024-03-22 18:55:06','用户账号4','用户姓名4','手机号码4','未支付'),(75,'2024-03-22 10:55:06','5555555555','景点名称5','file/menpiaogoumaiJingdiantupian5.jpg,file/menpiaogoumaiJingdiantupian6.jpg,file/menpiaogoumaiJingdiantupian7.jpg',5,5,5,'2024-03-22 18:55:06','用户账号5','用户姓名5','手机号码5','未支付'),(76,'2024-03-22 10:55:06','6666666666','景点名称6','file/menpiaogoumaiJingdiantupian6.jpg,file/menpiaogoumaiJingdiantupian7.jpg,file/menpiaogoumaiJingdiantupian8.jpg',6,6,6,'2024-03-22 18:55:06','用户账号6','用户姓名6','手机号码6','未支付');
/*!40000 ALTER TABLE `menpiaogoumai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-03-22 10:55:06','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common5\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xedae;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"},{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-common25\",\"menu\":\"系统用户管理\",\"unicode\":\"&#xee09;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"旅游攻略\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common23\",\"menu\":\"旅游攻略管理\",\"unicode\":\"&#xee05;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pic\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"特产中心\",\"menuJump\":\"列表\",\"tableName\":\"techanzhongxin\"}],\"fontClass\":\"icon-common38\",\"menu\":\"特产中心管理\",\"unicode\":\"&#xeeb2;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"},{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"门票购买\",\"menuJump\":\"列表\",\"tableName\":\"menpiaogoumai\"},{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"景点分类\",\"menuJump\":\"列表\",\"tableName\":\"jingdianfenlei\"}],\"fontClass\":\"icon-common21\",\"menu\":\"景点信息管理\",\"unicode\":\"&#xee03;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"旅游路线\",\"menuJump\":\"列表\",\"tableName\":\"lvyouluxian\"}],\"fontClass\":\"icon-common42\",\"menu\":\"旅游路线管理\",\"unicode\":\"&#xef24;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"查看\"],\"menu\":\"旅游攻略\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\"],\"menu\":\"特产中心\",\"menuJump\":\"列表\",\"tableName\":\"techanzhongxin\"}],\"menu\":\"特产中心管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"门票购买\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"}],\"menu\":\"景点信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\"],\"menu\":\"旅游路线\",\"menuJump\":\"列表\",\"tableName\":\"lvyouluxian\"}],\"menu\":\"旅游路线管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"支付\"],\"menu\":\"门票购买\",\"menuJump\":\"列表\",\"tableName\":\"menpiaogoumai\"}],\"fontClass\":\"icon-common21\",\"menu\":\"景点信息管理\",\"unicode\":\"&#xee03;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common18\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xedff;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"查看\"],\"menu\":\"旅游攻略\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\"],\"menu\":\"特产中心\",\"menuJump\":\"列表\",\"tableName\":\"techanzhongxin\"}],\"menu\":\"特产中心管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"门票购买\"],\"menu\":\"景点信息\",\"menuJump\":\"列表\",\"tableName\":\"jingdianxinxi\"}],\"menu\":\"景点信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\"],\"menu\":\"旅游路线\",\"menuJump\":\"列表\",\"tableName\":\"lvyouluxian\"}],\"menu\":\"旅游路线管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='旅游攻略';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (31,'2024-03-22 10:55:06','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(32,'2024-03-22 10:55:06','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(33,'2024-03-22 10:55:06','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(34,'2024-03-22 10:55:06','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(35,'2024-03-22 10:55:06','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。'),(36,'2024-03-22 10:55:06','孤勇者','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望','file/newsPicture6.jpg','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望，不肯哭一场，爱你破烂的衣裳，却敢堵命运的枪，爱你和我那么像，缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，他们说 要戒了你的狂，就像擦掉了污垢，他们说 要顺台阶而上，而代价是低头，那就让我 不可 乘风，你一样骄傲着 那种孤勇，谁说对弈平凡的不算英雄，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你破烂的衣裳 却敢堵命运的枪，爱你和我那么像 缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，你的斑驳 与众不同 与众不同，你的沉默 震耳欲聋 震耳欲聋，You Are The Hero，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你来自于蛮荒 一生不借谁的光，你将造你的城邦 在废墟之上，去吗 去啊 以最卑微的梦，战吗 战啊 以最孤高的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techanzhongxin`
--

DROP TABLE IF EXISTS `techanzhongxin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techanzhongxin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mingcheng` varchar(200) DEFAULT NULL COMMENT '名称',
  `tupian` longtext COMMENT '图片',
  `chandi` varchar(200) DEFAULT NULL COMMENT '产地',
  `miaoshu` longtext COMMENT '描述',
  `xiangqing` longtext COMMENT '详情',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='特产中心';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techanzhongxin`
--

LOCK TABLES `techanzhongxin` WRITE;
/*!40000 ALTER TABLE `techanzhongxin` DISABLE KEYS */;
INSERT INTO `techanzhongxin` VALUES (81,'2024-03-22 10:55:06','名称1','file/techanzhongxinTupian1.jpg,file/techanzhongxinTupian2.jpg,file/techanzhongxinTupian3.jpg','产地1','描述1','详情1','2024-03-22',1),(82,'2024-03-22 10:55:06','名称2','file/techanzhongxinTupian2.jpg,file/techanzhongxinTupian3.jpg,file/techanzhongxinTupian4.jpg','产地2','描述2','详情2','2024-03-22',2),(83,'2024-03-22 10:55:06','名称3','file/techanzhongxinTupian3.jpg,file/techanzhongxinTupian4.jpg,file/techanzhongxinTupian5.jpg','产地3','描述3','详情3','2024-03-22',3),(84,'2024-03-22 10:55:06','名称4','file/techanzhongxinTupian4.jpg,file/techanzhongxinTupian5.jpg,file/techanzhongxinTupian6.jpg','产地4','描述4','详情4','2024-03-22',4),(85,'2024-03-22 10:55:06','名称5','file/techanzhongxinTupian5.jpg,file/techanzhongxinTupian6.jpg,file/techanzhongxinTupian7.jpg','产地5','描述5','详情5','2024-03-22',5),(86,'2024-03-22 10:55:06','名称6','file/techanzhongxinTupian6.jpg,file/techanzhongxinTupian7.jpg,file/techanzhongxinTupian8.jpg','产地6','描述6','详情6','2024-03-22',6);
/*!40000 ALTER TABLE `techanzhongxin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-03-22 10:55:06','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (41,'2024-03-22 10:55:06','用户账号1','e10adc3949ba59abbe56e057f20f883e','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111'),(42,'2024-03-22 10:55:06','用户账号2','e10adc3949ba59abbe56e057f20f883e','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112'),(43,'2024-03-22 10:55:06','用户账号3','e10adc3949ba59abbe56e057f20f883e','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113'),(44,'2024-03-22 10:55:06','用户账号4','e10adc3949ba59abbe56e057f20f883e','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114'),(45,'2024-03-22 10:55:06','用户账号5','e10adc3949ba59abbe56e057f20f883e','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115'),(46,'2024-03-22 10:55:06','用户账号6','e10adc3949ba59abbe56e057f20f883e','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-23 16:00:57

/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.1.68-log : Database - attendance_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`attendance_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `attendance_system`;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

LOCK TABLES `company` WRITE;

insert  into `company`(`id`,`name`,`address`,`phone`,`contact`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'北京川程有限公司','北京市海淀区','13716583265','小明',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');

UNLOCK TABLES;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`,`is_delete`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

LOCK TABLES `department` WRITE;

insert  into `department`(`id`,`name`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'人事部',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `department`(`id`,`name`,`description`,`create_date`,`update_date`,`is_delete`) values (2,'研发部',NULL,'2016-05-11 16:58:02','2016-05-11 16:58:02','0');

UNLOCK TABLES;

/*Table structure for table `holiday` */

DROP TABLE IF EXISTS `holiday`;

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `htype` char(1) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `holiday` */

LOCK TABLES `holiday` WRITE;

UNLOCK TABLES;

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category` char(1) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `pcode` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

LOCK TABLES `permission` WRITE;

insert  into `permission`(`id`,`name`,`category`,`pid`,`pcode`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'用户管理','1',1,'USER_MENU',NULL,'2016-05-11 16:45:26','2016-05-11 16:45:26','0');
insert  into `permission`(`id`,`name`,`category`,`pid`,`pcode`,`description`,`create_date`,`update_date`,`is_delete`) values (2,'考勤管理','1',2,'ATTENDANCE_MENU',NULL,'2016-05-11 16:46:23','2016-05-11 16:46:23','0');
insert  into `permission`(`id`,`name`,`category`,`pid`,`pcode`,`description`,`create_date`,`update_date`,`is_delete`) values (3,'节日管理','1',3,'HOLIDAY_MENU',NULL,'2016-05-11 16:46:23','2016-05-11 16:46:23','0');

UNLOCK TABLES;

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `level` char(2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `position` */

LOCK TABLES `position` WRITE;

insert  into `position`(`id`,`name`,`department_id`,`department_name`,`level`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'人事主管',1,'人事部','1',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');

UNLOCK TABLES;

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

LOCK TABLES `resource` WRITE;

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

insert  into `role`(`id`,`name`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'主管',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `role`(`id`,`name`,`description`,`create_date`,`update_date`,`is_delete`) values (2,'员工',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `role`(`id`,`name`,`description`,`create_date`,`update_date`,`is_delete`) values (3,'管理员',NULL,'2016-05-11 17:00:05','2016-05-11 17:00:05','0');

UNLOCK TABLES;

/*Table structure for table `role_ref_permission` */

DROP TABLE IF EXISTS `role_ref_permission`;

CREATE TABLE `role_ref_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(100) DEFAULT NULL,
  `category` char(1) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `role_ref_permission` */

LOCK TABLES `role_ref_permission` WRITE;

insert  into `role_ref_permission`(`id`,`role_id`,`role_name`,`permission_id`,`permission_name`,`category`,`create_date`,`update_date`,`is_delete`) values (1,1,'主管',1,'用户管理','1','2016-05-11 16:46:23','2016-05-11 16:46:23','0');
insert  into `role_ref_permission`(`id`,`role_id`,`role_name`,`permission_id`,`permission_name`,`category`,`create_date`,`update_date`,`is_delete`) values (2,1,'主管',2,'考勤管理','1','2016-05-11 16:46:23','2016-05-11 16:46:23','0');
insert  into `role_ref_permission`(`id`,`role_id`,`role_name`,`permission_id`,`permission_name`,`category`,`create_date`,`update_date`,`is_delete`) values (3,1,'主管',3,'节日管理','1','2016-05-11 16:46:23','2016-05-11 16:46:23','0');
insert  into `role_ref_permission`(`id`,`role_id`,`role_name`,`permission_id`,`permission_name`,`category`,`create_date`,`update_date`,`is_delete`) values (4,3,'管理员',1,'用户管理','1','2016-05-11 17:00:05','2016-05-11 17:00:05','0');
insert  into `role_ref_permission`(`id`,`role_id`,`role_name`,`permission_id`,`permission_name`,`category`,`create_date`,`update_date`,`is_delete`) values (5,3,'管理员',2,'考勤管理','1','2016-05-11 17:00:05','2016-05-11 17:00:05','0');
insert  into `role_ref_permission`(`id`,`role_id`,`role_name`,`permission_id`,`permission_name`,`category`,`create_date`,`update_date`,`is_delete`) values (6,3,'管理员',3,'节日管理','1','2016-05-11 17:00:05','2016-05-11 17:00:05','0');

UNLOCK TABLES;

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_num` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `position_id` int(11) NOT NULL,
  `position_name` varchar(100) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `staff` */

LOCK TABLES `staff` WRITE;

insert  into `staff`(`id`,`job_num`,`name`,`sex`,`mobile`,`email`,`company_id`,`company_name`,`department_id`,`department_name`,`position_id`,`position_name`,`entry_date`,`status`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'admin','admin','0',NULL,NULL,1,NULL,1,NULL,1,NULL,NULL,'0',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `staff`(`id`,`job_num`,`name`,`sex`,`mobile`,`email`,`company_id`,`company_name`,`department_id`,`department_name`,`position_id`,`position_name`,`entry_date`,`status`,`description`,`create_date`,`update_date`,`is_delete`) values (2,'test','测试工程师','1','13716583265','13716583265@163.com',1,'北京川程有限公司',1,'人事部',1,'主管','2016-05-11 16:34:22','0',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `staff`(`id`,`job_num`,`name`,`sex`,`mobile`,`email`,`company_id`,`company_name`,`department_id`,`department_name`,`position_id`,`position_name`,`entry_date`,`status`,`description`,`create_date`,`update_date`,`is_delete`) values (3,'tangxi','tangxi','0','13716586523','13716586523@163.com',1,'北京川程有限公司',2,'研发部',2,'员工','2016-05-11 16:58:02','0',NULL,'2016-05-11 16:58:02','2016-05-11 16:58:02','0');

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_alias` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`user_id`,`user_name`,`user_alias`,`password`,`create_date`,`update_date`,`is_delete`) values (1,1,'admin','admin','123123','2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `user`(`id`,`user_id`,`user_name`,`user_alias`,`password`,`create_date`,`update_date`,`is_delete`) values (2,2,'test','测试工程师','123456','2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `user`(`id`,`user_id`,`user_name`,`user_alias`,`password`,`create_date`,`update_date`,`is_delete`) values (3,3,'tangxi','tangxi','000000','2016-05-11 17:00:05','2016-05-11 17:00:05','0');

UNLOCK TABLES;

/*Table structure for table `user_ref_group` */

DROP TABLE IF EXISTS `user_ref_group`;

CREATE TABLE `user_ref_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_ref_group` */

LOCK TABLES `user_ref_group` WRITE;

insert  into `user_ref_group`(`id`,`group_id`,`group_name`,`user_id`,`user_name`,`description`,`create_date`,`update_date`,`is_delete`) values (1,1,'人事主管',1,'admin',NULL,'2016-05-11 16:55:10','2016-05-11 16:55:10','0');
insert  into `user_ref_group`(`id`,`group_id`,`group_name`,`user_id`,`user_name`,`description`,`create_date`,`update_date`,`is_delete`) values (2,1,'人事主管',2,'test',NULL,'2016-05-11 16:55:10','2016-05-11 16:55:10','0');
insert  into `user_ref_group`(`id`,`group_id`,`group_name`,`user_id`,`user_name`,`description`,`create_date`,`update_date`,`is_delete`) values (3,2,'员工',3,'tangxi',NULL,'2016-05-11 17:00:05','2016-05-11 17:00:05','0');

UNLOCK TABLES;

/*Table structure for table `usergroup` */

DROP TABLE IF EXISTS `usergroup`;

CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `group_type` char(1) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `usergroup` */

LOCK TABLES `usergroup` WRITE;

insert  into `usergroup`(`id`,`name`,`group_type`,`description`,`create_date`,`update_date`,`is_delete`) values (1,'人事主管','1',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `usergroup`(`id`,`name`,`group_type`,`description`,`create_date`,`update_date`,`is_delete`) values (2,'员工','2',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `usergroup`(`id`,`name`,`group_type`,`description`,`create_date`,`update_date`,`is_delete`) values (3,'管理员','0',NULL,'2016-05-11 17:00:05','2016-05-11 17:00:05','0');

UNLOCK TABLES;

/*Table structure for table `usergroup_ref_role` */

DROP TABLE IF EXISTS `usergroup_ref_role`;

CREATE TABLE `usergroup_ref_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `usergroup_ref_role` */

LOCK TABLES `usergroup_ref_role` WRITE;

insert  into `usergroup_ref_role`(`id`,`group_id`,`group_name`,`role_id`,`role_name`,`description`,`create_date`,`update_date`,`is_delete`) values (1,1,'人事主管',1,'人事主管',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `usergroup_ref_role`(`id`,`group_id`,`group_name`,`role_id`,`role_name`,`description`,`create_date`,`update_date`,`is_delete`) values (2,2,'员工',2,'员工',NULL,'2016-05-11 16:34:22','2016-05-11 16:34:22','0');
insert  into `usergroup_ref_role`(`id`,`group_id`,`group_name`,`role_id`,`role_name`,`description`,`create_date`,`update_date`,`is_delete`) values (3,3,'管理员',0,'管理员',NULL,'2016-05-11 17:00:05','2016-05-11 17:00:05','0');

UNLOCK TABLES;

/*Table structure for table `work_order` */

DROP TABLE IF EXISTS `work_order`;

CREATE TABLE `work_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `atype` char(1) DEFAULT NULL,
  `machine_number` varchar(100) DEFAULT NULL,
  `sign_type` char(1) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `is_delete` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `work_order` */

LOCK TABLES `work_order` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

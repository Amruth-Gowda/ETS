/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - employment_tracking_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`employment_tracking_system` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `employment_tracking_system`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_email` varchar(20) DEFAULT NULL,
  `admin_password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`admin_email`,`admin_password`) values ('admin@gmail.com','admin');

/*Table structure for table `module_performance` */

DROP TABLE IF EXISTS `module_performance`;

CREATE TABLE `module_performance` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `performance` double DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `FK_performance_staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `module_performance` */

insert  into `module_performance`(`p_id`,`staff_id`,`module_id`,`performance`) values (7,12,15,4.53333333333333),(8,13,15,4.8),(9,14,17,2.33333333333333),(10,15,18,4),(11,15,20,5),(12,14,19,5);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) DEFAULT NULL,
  `module_desc` varchar(80) DEFAULT NULL,
  `module_time_required` int(11) DEFAULT NULL,
  `module_status` varchar(50) DEFAULT 'not completed',
  PRIMARY KEY (`module_id`),
  KEY `FK_project_module_id` (`project_id`),
  CONSTRAINT `FK_project_module_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `modules` */

insert  into `modules`(`module_id`,`project_id`,`module_name`,`module_desc`,`module_time_required`,`module_status`) values (15,11,'First Module TM1','First Module TM1 Desc',15,'completed'),(16,11,'Second Module TM1','Second Module TM1 Desc',10,'not completed'),(17,11,'Third Module TM1','Third Module TM1 desc',6,'completed'),(18,11,'Forth Module TM1','Forth Module TM1 desc',8,'completed'),(19,11,'fifthModule TM1','fifthModule Module TM1 desc',1,'completed'),(20,11,'sixth Module TM1','sixth Module TM1 desc',1,'completed');

/*Table structure for table `modules_assignment` */

DROP TABLE IF EXISTS `modules_assignment`;

CREATE TABLE `modules_assignment` (
  `modules_assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `module_assigned_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `module_completed_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`modules_assignment_id`),
  KEY `fk_module_id` (`module_id`),
  KEY `FK_modules_assignment_staff_id` (`staff_id`),
  CONSTRAINT `FK_modules_assignment_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `modules_assignment` */

insert  into `modules_assignment`(`modules_assignment_id`,`module_id`,`staff_id`,`module_assigned_time`,`module_completed_time`) values (13,15,12,'2018-02-06 17:18:48','2018-02-17 17:24:28'),(14,15,13,'2018-02-08 17:18:59','2018-02-17 17:24:28'),(15,17,14,'2018-02-06 19:19:33','2018-02-17 19:21:17'),(16,18,15,'2018-02-09 19:19:38','2018-02-17 19:21:38'),(17,19,14,'2018-02-17 19:34:51','2018-02-17 19:43:25'),(18,20,15,'2018-02-17 19:34:58','2018-02-17 19:35:25');

/*Table structure for table `project_assignment` */

DROP TABLE IF EXISTS `project_assignment`;

CREATE TABLE `project_assignment` (
  `project_assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `project_assigned_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `project_completed_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`project_assignment_id`),
  KEY `fk_project_id` (`project_id`),
  KEY `FK_project_assignment_staff_id` (`staff_id`),
  CONSTRAINT `FK_project_assignment_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `project_assignment` */

insert  into `project_assignment`(`project_assignment_id`,`project_id`,`staff_id`,`project_assigned_time`,`project_completed_time`) values (13,11,10,'2017-11-17 17:17:16','2018-02-19 16:26:05'),(14,12,11,'2017-12-17 17:17:21','2018-02-19 16:27:09'),(15,13,10,'2017-10-29 16:21:49','2018-02-19 16:26:20'),(16,14,11,'2017-12-25 16:21:54','2018-02-19 16:27:16');

/*Table structure for table `project_performance` */

DROP TABLE IF EXISTS `project_performance`;

CREATE TABLE `project_performance` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `performance` double DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `project_performance` */

insert  into `project_performance`(`p_id`,`staff_id`,`project_id`,`performance`) values (1,10,11,3.91111111111111),(2,10,13,3.48888888888889),(3,11,12,4.57777777777778),(4,11,14,4.75555555555556);

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(40) DEFAULT NULL,
  `project_desc` varchar(500) DEFAULT NULL,
  `project_time_required` varchar(50) DEFAULT NULL,
  `project_status` varchar(50) DEFAULT 'not completed',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `projects` */

insert  into `projects`(`project_id`,`project_name`,`project_desc`,`project_time_required`,`project_status`) values (11,'First Project','First Project Description','90','completed'),(12,'Second Project','Second Project Desc','90','completed'),(13,'First Project','Third Project Desc','90','completed'),(14,'Fourth Project','Fourth Project Desc','90','completed');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(40) DEFAULT NULL,
  `staff_gender` varchar(40) DEFAULT NULL,
  `staff_dob` varchar(40) DEFAULT NULL,
  `staff_email` varchar(40) DEFAULT NULL,
  `staff_password` varchar(40) DEFAULT NULL,
  `staff_mobile_number` varchar(40) DEFAULT NULL,
  `staff_address` varchar(100) DEFAULT NULL,
  `staff_designation` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`staff_name`,`staff_gender`,`staff_dob`,`staff_email`,`staff_password`,`staff_mobile_number`,`staff_address`,`staff_designation`) values (9,'First Manager ','Male','2018-02-01','m1@gmail.com','m1','7899900291','EveryWhere','manager'),(10,'First Team Lead','Male','2018-02-23','tl1@gmail.com','tl1','3209842343','EveryWhere','teamlead'),(11,'Second Team Lead','Male','2018-01-11','tl2@gmail.com','tl2','2139801246','EveryWhere','teamlead'),(12,'TM1','Female','2017-11-15','tm1@gmail.com','tm1','1290371302','EveryWhere','teammember'),(13,'TM2','Female','2018-02-13','tm2@gmail.com','tm2','324839274','EveryWhere','teammember'),(14,'TM3','Male','2017-11-02','tm3@gmail.com','tm3','1908123833','EveryWhere','teammember'),(15,'TM4','Male','2018-02-17','tm4@gmail.com','tm4','9238343434','EveryWhere','teammember');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

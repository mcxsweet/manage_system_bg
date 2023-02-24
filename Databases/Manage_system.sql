-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: Manage_system
-- ------------------------------------------------------
-- Server version	5.7.41

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
-- Table structure for table `course_basic_information`
--

DROP TABLE IF EXISTS `course_basic_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_basic_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(30) NOT NULL,
  `teacher_id` int(11) DEFAULT '1',
  `classroom_teacher` varchar(10) NOT NULL,
  `theoretical_hours` int(3) NOT NULL,
  `lab_hours` int(3) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `term` varchar(20) NOT NULL,
  `students_num` int(3) NOT NULL,
  `course_nature` varchar(30) NOT NULL,
  `course_type` varchar(30) NOT NULL,
  `course_target_num` int(3) NOT NULL,
  `indicator_points_num` int(3) NOT NULL,
  `indicator_points` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_basic_information`
--

LOCK TABLES `course_basic_information` WRITE;
/*!40000 ALTER TABLE `course_basic_information` DISABLE KEYS */;
INSERT INTO `course_basic_information` VALUES (1,'高数(必修)',1,'阳老师',16,4,'计算机科学与技术2020','2022-2023.1',80,'必修','专业必修课',5,2,'指标1,指标2'),(2,'线性代数',1,'王老师',16,4,'计算机科学与技术2020','2022-2023.1',80,'必修','专业必修课',5,3,'指标1,指标2,指标3'),(4,'概率论',1,'阳老师1222',16123,41231,'计算机科学与技术2022','2022-2023.1',80111,'必修','专业必修课',5,2,'指标1,指标2'),(6,'c语言程序设计',1,'阳老师',16,4,'计算机科学与技术2020','2022-2023.1',80,'必修','专业必修课',5,2,'指标1,指标2'),(7,'JAVA程序设计',1,'阳老师',1231,132,'计算,机科学与技术2020','123',123,'必修','专业必修课',5,1231,'指标点1');
/*!40000 ALTER TABLE `course_basic_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_examine_child_methods`
--

DROP TABLE IF EXISTS `course_examine_child_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_examine_child_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_examine_methods_id` int(11) NOT NULL,
  `examine_child_item` varchar(30) NOT NULL,
  `child_percentage` int(3) NOT NULL,
  `course_target` varchar(300) DEFAULT NULL,
  `indicator_points_detail` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `考试方式表id` (`course_examine_methods_id`),
  CONSTRAINT `考试方式表id` FOREIGN KEY (`course_examine_methods_id`) REFERENCES `course_examine_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_child_methods`
--

LOCK TABLES `course_examine_child_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_child_methods` DISABLE KEYS */;
INSERT INTO `course_examine_child_methods` VALUES (4,2,'平时作业',50,'{\'课程目标1\':\'是\',\'课程目标2\':\'是\',\'课程目标3\':\'是\',\'课程目标4\':\'是\',\'课程目标5\':\'是\'}','{\'指标点1.1\':\'是\',\'指标点1.2\':\'是\',\'指标点1.3\':\'是\'}'),(5,2,'考勤',50,'{\'课程目标1\':\'是\',\'课程目标2\':\'是\',\'课程目标3\':\'是\',\'课程目标4\':\'是\',\'课程目标5\':\'是\'}','{\'指标点1.1\':\'是\',\'指标点1.2\':\'是\',\'指标点1.3\':\'是\'}'),(6,1,'期末测试',50,'{\'课程目标1\':\'是\',\'课程目标2\':\'是\',\'课程目标3\':\'是\',\'课程目标4\':\'是\',\'课程目标5\':\'是\'}','{\'指标点1.1\':\'是\',\'指标点1.2\':\'是\',\'指标点1.3\':\'是\'}'),(7,1,'期中测试',50,'{\'课程目标1\':\'是\',\'课程目标2\':\'是\',\'课程目标3\':\'是\',\'课程目标4\':\'是\',\'课程目标5\':\'是\'}','{\'指标点1.1\':\'是\',\'指标点1.2\':\'是\',\'指标点1.3\':\'是\'}'),(8,3,'期中测试',50,NULL,NULL);
/*!40000 ALTER TABLE `course_examine_child_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_examine_methods`
--

DROP TABLE IF EXISTS `course_examine_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_examine_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `examine_item` varchar(30) NOT NULL,
  `percentage` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `课程信息表id` (`course_id`),
  CONSTRAINT `课程信息表id` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_methods`
--

LOCK TABLES `course_examine_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_methods` DISABLE KEYS */;
INSERT INTO `course_examine_methods` VALUES (1,1,'高数','考试',70),(2,1,'高数','平时测验',30),(3,2,'线性代数','考试',70),(4,2,'线性代数','平时测试',30);
/*!40000 ALTER TABLE `course_examine_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_target`
--

DROP TABLE IF EXISTS `course_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `course_target` text NOT NULL,
  `path_ways` text NOT NULL,
  `indicator_points` text NOT NULL,
  `evaluation_method` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_basic_information_id` (`course_id`),
  CONSTRAINT `course_basic_information_id` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_target`
--

LOCK TABLES `course_target` WRITE;
/*!40000 ALTER TABLE `course_target` DISABLE KEYS */;
INSERT INTO `course_target` VALUES (4,6,'c语言程序设计','aaaaaaaaaaadasdasd','1232dadXzcscascdfsdasadsadasdad','[\"选项1\",\"选项2\"]','[\"考试\",\"作业\"]'),(5,4,'概率论','wdaeasdasdasd','asdasd','[\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]'),(6,6,'c语言程序设计','edadsadaczcweqwedad阿达是大大','大赛大赛大大','[\"选项1\",\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]'),(8,2,'线性代数','阿三打是大势打豆豆','是大大是大大的','[\"选项1\",\"选项2\",\"选项4\"]','[\"考试\",\"作业\"]'),(9,1,'高数(必修)','阿斯顿焚膏继晷语序虚词是大扫除','asadadadadaxzcvvdffgdg','[\"选项1\",\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]');
/*!40000 ALTER TABLE `course_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `is_admin` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-24 16:41:33

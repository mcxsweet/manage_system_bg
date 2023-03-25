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
  `term_start` varchar(4) DEFAULT NULL,
  `term_end` varchar(4) DEFAULT NULL,
  `term` int(1) DEFAULT '1',
  `students_num` int(3) NOT NULL,
  `course_nature` varchar(30) NOT NULL,
  `course_type` varchar(30) NOT NULL,
  `course_target_num` int(3) NOT NULL,
  `indicator_points_num` int(3) NOT NULL,
  `indicator_points` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `课程基本信息表与用户表id关联` (`teacher_id`),
  CONSTRAINT `课程基本信息表与用户表id关联` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_basic_information`
--

LOCK TABLES `course_basic_information` WRITE;
/*!40000 ALTER TABLE `course_basic_information` DISABLE KEYS */;
INSERT INTO `course_basic_information` VALUES (1,'高数(必修)',1,'阳老师',16,4,'计算机科学与技术2020','2020','2021',1,80,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\"]'),(2,'线性代数',1,'王老师',16,4,'计算机科学与技术2020','2020','2021',1,80,'必修','专业必修课',5,3,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(4,'概率论',1,'阳老师1222',16123,41231,'计算机科学与技术2022','2020','2021',1,80111,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(6,'c语言程序设计',1,'阳老师',16,4,'计算机科学与技术2020','2020','2021',1,80,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(7,'JAVA程序设计',1,'阳老师',1231,132,'计算,机科学与技术2020','2020','2021',1,123,'必修','专业必修课',5,1231,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(8,'高数',3,'admin2',12,12,'计算机科学与技术2020','2020','2021',1,122,'必修','公共必修',4,1,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(10,'编译原理',1,'admin',48,23,'2020计算机科学','2023','2024',2,55,'必修','5636',1,2,'[\"指标点1.1\",\"指标点1.2\"]'),(11,'这是一条很长的测试数据',1,'admin',1223,213,'123123','2021','2022',1,123,'必修','123131',123131,123131,'[\"指标点1.1\",\"指标点2.1\",\"指标点1.2\",\"指标点5.2\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_child_methods`
--

LOCK TABLES `course_examine_child_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_child_methods` DISABLE KEYS */;
INSERT INTO `course_examine_child_methods` VALUES (11,1,'平时考核成绩',23,'[\"课程目标1\"]','[\"指标点1\",\"指标点2\"]'),(13,1,'实验考核成绩',12,'[\"课程目标1\"]','[\"指标点1\"]'),(16,20,'考勤',34,'[\"课程目标1\"]','[\"指标点1\",\"指标点2\"]'),(17,20,'课题提问',29,'[\"课程目标1\"]','[\"指标点1\",\"指标点2\"]'),(21,20,'作业',47,'[\"课程目标1\",\"课程目标2\",\"课程目标3\"]','[\"指标点1\",\"指标点2\"]'),(25,20,'期中测试',27,'[\"课程目标1\"]','[\"指标点2\"]'),(26,24,'实验项目完成分',24,'[\"课程目标1\",\"课程目标2\"]','[\"指标点2\",\"指标点1\"]'),(27,24,'大报告',23,'[\"课程目标1\",\"课程目标2\"]','[\"指标点1\",\"指标点2\"]'),(28,24,'试卷',29,'[\"课程目标1\",\"课程目标2\"]','[\"指标点1\",\"指标点2\"]'),(29,1,'考勤',18,'[\"课程目标1\"]','[\"指标点1.1\",\"指标点1.2\"]'),(31,3,'考勤',17,'[\"课程目标1\"]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(32,3,'课题提问',11,'[\"课程目标1\"]','[\"指标点1.2\"]'),(33,25,'考勤',13,'[]','[\"指标点1.1\",\"指标点5.2\",\"指标点2.1\"]'),(34,25,'课题提问',11,'[]','[\"指标点1.1\"]'),(35,25,'考勤',50,'[]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]');
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
  `item_score` int(3) DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `课程信息表id` (`course_id`),
  CONSTRAINT `课程信息表id` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_methods`
--

LOCK TABLES `course_examine_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_methods` DISABLE KEYS */;
INSERT INTO `course_examine_methods` VALUES (1,1,'高数(必修)','考试',69,100),(3,2,'线性代数','考试',70,100),(4,2,'线性代数','平时测试',30,100),(5,7,'JAVA程序设计','平时考核成绩',3,100),(7,6,'c语言程序设计','平时考核成绩',6,100),(8,6,'c语言程序设计','平时考核成绩',6,100),(9,6,'c语言程序设计','平时考核成绩',6,100),(15,4,'概率论','实验考核成绩',412,100),(17,2,'线性代数','平时考核成绩',4,100),(18,8,'线性代数','平时测验',30,0),(19,8,'线性代数','平时测验',30,0),(20,10,'编译原理','平时考核成绩',24,0),(24,10,'编译原理','实验考核成绩',26,0),(25,11,'这是一条很长的测试数据','平时考核成绩',17,0);
/*!40000 ALTER TABLE `course_examine_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_final_exam_paper`
--

DROP TABLE IF EXISTS `course_final_exam_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_final_exam_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_method_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_score` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `考试方式id关联期末考试表` (`exam_method_id`),
  CONSTRAINT `考试方式id关联期末考试表` FOREIGN KEY (`exam_method_id`) REFERENCES `course_examine_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_final_exam_paper`
--

LOCK TABLES `course_final_exam_paper` WRITE;
/*!40000 ALTER TABLE `course_final_exam_paper` DISABLE KEYS */;
INSERT INTO `course_final_exam_paper` VALUES (3,1,'选择',20),(4,1,'填空',20),(5,1,'简答',20),(6,3,'选择题',20);
/*!40000 ALTER TABLE `course_final_exam_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_final_exam_paper_detail`
--

DROP TABLE IF EXISTS `course_final_exam_paper_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_final_exam_paper_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_id` int(11) NOT NULL,
  `title_number` varchar(10) NOT NULL,
  `score` int(3) DEFAULT NULL,
  `indicator_points` varchar(100) NOT NULL,
  `course_target` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `与课程试卷表id外联` (`primary_id`),
  CONSTRAINT `与课程试卷表id外联` FOREIGN KEY (`primary_id`) REFERENCES `course_final_exam_paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_final_exam_paper_detail`
--

LOCK TABLES `course_final_exam_paper_detail` WRITE;
/*!40000 ALTER TABLE `course_final_exam_paper_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_final_exam_paper_detail` ENABLE KEYS */;
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
  `target_name` varchar(10) NOT NULL,
  `course_target` text NOT NULL,
  `path_ways` text NOT NULL,
  `indicator_points` text NOT NULL,
  `evaluation_method` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_basic_information_id` (`course_id`),
  CONSTRAINT `course_basic_information_id` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_target`
--

LOCK TABLES `course_target` WRITE;
/*!40000 ALTER TABLE `course_target` DISABLE KEYS */;
INSERT INTO `course_target` VALUES (4,6,'c语言程序设计','课程目标1','aaaaaaaaaaadasdasd','1232dadXzcscascdfsdasadsadasdad','[\"选项1\",\"选项2\"]','[\"考试\",\"作业\"]'),(5,4,'概率论','课程目标1','wdaeasdasdasd','asdasd','[\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]'),(6,6,'c语言程序设计','课程目标2','edadsadaczcweqwedad阿达是大大','大赛大赛大大','[\"选项1\",\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]'),(8,2,'线性代数','课程目标1','阿三打是大势打豆豆','是大大是大大的','[\"选项1\",\"选项2\",\"选项4\"]','[\"考试\",\"作业\"]'),(9,1,'高数(必修)','课程目标1','阿斯顿焚膏继晷语序虚词是大扫除','asadadadadaxzcvvdffgdg','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]','[\"考试\",\"作业\"]'),(10,8,'高数','课程目标1','asdadadada','adsadad','[\"选项1\",\"选项2\",\"选项3\",\"选项4\"]','[\"考试\",\"作业\"]'),(11,10,'编译原理','课程目标1','啊哈三大件啊电大数据','鹅发啊是大大的','[\"指标点1.1\",\"指标点1.2\"]','[\"考试\",\"作业\"]'),(12,10,'编译原理','课程目标2','掌握运用Python编程方法，能对连续信号和离散信号进行表示和运算；','掌握运用Python编程方法，能对连续信号和离散信号进行表示和运算；','[\"指标点1.1\",\"指标点5.2\"]','[\"考试\"]'),(13,10,'编译原理','课程目标3','学习掌握Python语言和Python开发工具，能针对控制工程和电路系统中问题，进行系统分析、计算和设计。','学习掌握Python语言和Python开发工具，能针对控制工程和电路系统中问题，进行系统分析、计算和设计。','[\"指标点1.1\",\"指标点1.2\"]','[\"考试\",\"作业\"]');
/*!40000 ALTER TABLE `course_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indicator_name` varchar(20) NOT NULL,
  `indicator_content` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indicator_name` (`indicator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (1,'指标点1.1','掌握数学、自然科学、工程基础和电子信息专业知识的基本概念，并将其运用到复杂工程问题的适当表述之中'),(2,'指标点1.2','针对一个复杂系统或者过程选择恰当的数学模型，对模型正确性进行严谨的推理，并能正确求解'),(3,'指标点5.2','能够针对复杂工程问题，选择与使用电 子信息领域的恰当技术手段和现代工程工 具进行分析、计算和设计'),(4,'指标点2.1','能运用数学、自然科学和电子信息领域的 基本原理，识别和判断电子信息领域复杂工程问题的关键环节');
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
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
  `password` varchar(20) DEFAULT '123456',
  `is_admin` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123',1),(3,'admin2','123',1);
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

-- Dump completed on 2023-03-25 20:27:04

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
  `major` varchar(20) NOT NULL DEFAULT 'undefine',
  `teacher_id` int(11) DEFAULT '1',
  `classroom_teacher` varchar(10) NOT NULL,
  `theoretical_hours` int(3) NOT NULL,
  `lab_hours` int(3) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `term_start` varchar(4) DEFAULT NULL,
  `term_end` varchar(4) DEFAULT NULL,
  `term` int(1) DEFAULT '1',
  `text_book` text,
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
INSERT INTO `course_basic_information` VALUES (1,'高数(必修)','undefine',1,'阳老师',16,4,'计算机科学与技术2020','2020','2021',1,NULL,80,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\"]'),(2,'线性代数','undefine',1,'王老师',16,4,'计算机科学与技术2020','2020','2021',1,NULL,80,'必修','专业必修课',5,3,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(4,'概率论','undefine',1,'阳老师1222',16123,41231,'计算机科学与技术2022','2020','2021',1,NULL,80111,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(6,'c语言程序设计','undefine',1,'阳老师',16,4,'计算机科学与技术2020','2020','2021',1,NULL,80,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(7,'JAVA程序设计','undefine',1,'阳老师',1231,132,'计算,机科学与技术2020','2020','2021',1,NULL,123,'必修','专业必修课',5,1231,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(8,'高数','undefine',3,'admin2',12,12,'计算机科学与技术2020','2020','2021',1,NULL,122,'必修','公共必修',4,1,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(10,'编译原理','计算机科学与技术',1,'admin',48,23,'2020计算机科学与技术','2023','2024',2,'《信号与线性系统分析》（第 5 版）[M]. 吴大正：高等教育出版社, 2019.',55,'必修','5636',1,2,'[\"1.1\",\"2.1\"]'),(11,'这是一条很长的测试数据','undefine',1,'admin',1223,213,'123123','2021','2022',1,NULL,123,'必修','123131',123131,123131,'[\"指标点1.1\",\"指标点2.1\",\"指标点1.2\",\"指标点5.2\"]');
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
  `child_score` int(3) NOT NULL DEFAULT '100',
  `course_target` varchar(300) DEFAULT NULL,
  `indicator_points_detail` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `考试方式表id` (`course_examine_methods_id`),
  CONSTRAINT `考试方式表id` FOREIGN KEY (`course_examine_methods_id`) REFERENCES `course_examine_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_child_methods`
--

LOCK TABLES `course_examine_child_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_child_methods` DISABLE KEYS */;
INSERT INTO `course_examine_child_methods` VALUES (16,20,'考勤',34,100,'[\"课程目标1\"]','[\"指标点1.2\"]'),(17,20,'课题提问',29,100,'[\"课程目标1\"]','[]'),(21,20,'作业',47,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\"]','[\"指标点1.1\",\"指标点1.2\"]'),(26,24,'实验项目完成分',24,100,'[\"课程目标1\",\"课程目标2\"]','[]'),(27,24,'大报告',23,100,'[\"课程目标1\",\"课程目标2\"]','[]'),(28,24,'试卷',29,100,'[\"课程目标2\"]','[\"指标点1.1\",\"指标点1.2\"]'),(31,3,'考勤',17,100,'[\"课程目标1\"]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(32,3,'课题提问',11,100,'[\"课程目标1\"]','[\"指标点1.2\"]'),(33,25,'考勤',13,100,'[]','[\"指标点1.1\",\"指标点5.2\",\"指标点2.1\"]'),(34,25,'课题提问',11,100,'[]','[\"指标点1.1\"]'),(35,25,'考勤',50,100,'[]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(36,26,'试卷',100,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\"]','[\"1.1\",\"2.1\"]'),(37,5,'考勤',33,100,'[]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(38,27,'试卷',22,100,'[\"课程目标1\"]','[\"指标点1.1\",\"指标点1.2\"]'),(41,28,'作业',17,100,'[\"课程目标1\"]','[]'),(42,29,'实验报告',16,100,'[\"课程目标1\"]','[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_methods`
--

LOCK TABLES `course_examine_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_methods` DISABLE KEYS */;
INSERT INTO `course_examine_methods` VALUES (3,2,'线性代数','考试',70,100),(4,2,'线性代数','平时测试',30,100),(5,7,'JAVA程序设计','平时考核成绩',3,100),(7,6,'c语言程序设计','平时考核成绩',6,100),(8,6,'c语言程序设计','平时考核成绩',6,100),(9,6,'c语言程序设计','平时考核成绩',6,100),(15,4,'概率论','实验考核成绩',412,100),(17,2,'线性代数','平时考核成绩',4,100),(18,8,'线性代数','平时测验',30,100),(19,8,'线性代数','平时测验',30,100),(20,10,'编译原理','平时考核成绩',24,100),(24,10,'编译原理','实验考核成绩',26,100),(25,11,'这是一条很长的测试数据','平时考核成绩',17,100),(26,10,'编译原理','期末考核成绩',50,100),(27,1,'高数(必修)','期末考核成绩',55,100),(28,1,'高数(必修)','平时考核成绩',32,100),(29,1,'高数(必修)','实验考核成绩',27,100);
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
  `exam_child_method_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_score` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `试卷表外键考察评价方式子表` (`exam_child_method_id`),
  CONSTRAINT `试卷表外键考察评价方式子表` FOREIGN KEY (`exam_child_method_id`) REFERENCES `course_examine_child_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_final_exam_paper`
--

LOCK TABLES `course_final_exam_paper` WRITE;
/*!40000 ALTER TABLE `course_final_exam_paper` DISABLE KEYS */;
INSERT INTO `course_final_exam_paper` VALUES (10,36,'选择题',20),(11,36,'填空题',30),(12,36,'简答题',50),(16,26,'tets',12),(17,38,'选择题',30);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_final_exam_paper_detail`
--

LOCK TABLES `course_final_exam_paper_detail` WRITE;
/*!40000 ALTER TABLE `course_final_exam_paper_detail` DISABLE KEYS */;
INSERT INTO `course_final_exam_paper_detail` VALUES (31,10,'3',2,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(32,10,'1',10,'[\"1.1\",\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(34,10,'2',2,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(35,11,'1',2,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\"]'),(36,11,'2',2,'[\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(37,11,'3',3,'[\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(38,12,'1',12,'[\"1.1\",\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(39,12,'2',2,'[\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(40,12,'3',3,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(41,10,'4',2,'[\"2.1\"]','[\"课程目标1\"]'),(42,10,'5',2,'[\"2.1\"]','[\"课程目标2\"]'),(43,11,'4',5,'[\"1.1\"]','[\"课程目标2\"]'),(44,11,'5',6,'[\"1.1\",\"2.1\"]','[\"课程目标1\"]'),(45,12,'4',4,'[\"1.1\"]','[\"课程目标3\"]'),(46,12,'5',6,'[\"2.1\"]','[\"课程目标2\"]'),(47,17,'1',2,'[\"指标点1.1\"]','[\"课程目标1\"]'),(48,17,'2',2,'[\"指标点1.1\"]','[\"课程目标1\"]'),(50,17,'3',12,'[\"指标点1.1\",\"指标点1.2\"]','[\"课程目标1\"]'),(51,17,'4',12,'[\"指标点1.1\"]','[\"课程目标1\"]');
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
-- Table structure for table `indicator_outline`
--

DROP TABLE IF EXISTS `indicator_outline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicator_outline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicator_outline`
--

LOCK TABLES `indicator_outline` WRITE;
/*!40000 ALTER TABLE `indicator_outline` DISABLE KEYS */;
INSERT INTO `indicator_outline` VALUES (1,'工程知识','能够将数学、自然科 学、工程基础和电子信息专业知识 用于解决复杂工程问题'),(2,'问题分析','能够应用数学、自然 科学和电子信息领域工程科学的 基本原理，识别、表达、并通过文 献研究分析复杂工程问题，以获得 有效结论'),(3,'设计/开发解决方案','能够设计针对电子信息领域复杂工程问题的解决方案'),(4,'研究','能够基于科学原理并采 用科学方法对电子信息领域复杂 工程问题进行研究，包括设计实 验、分析与解释数据、并通过信息 综合得到合理有效的结论');
/*!40000 ALTER TABLE `indicator_outline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indicator_index` int(11) NOT NULL,
  `indicator_name` varchar(20) NOT NULL,
  `indicator_content` text NOT NULL,
  `major` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indicator_name` (`indicator_name`),
  KEY `指标点索引外键` (`indicator_index`),
  CONSTRAINT `指标点索引外键` FOREIGN KEY (`indicator_index`) REFERENCES `indicator_outline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (5,1,'1.1','掌握数学、自然科学、工程基础和电子信息专业知识的基本概念，并将其运用到复杂工程问题的适当表述之中','电子信息工程'),(6,1,'1.2','针对一个复杂系统或者过程选择恰当的数学模型，对模型正确性进行严谨的推理，并能正确求解','电子信息工程'),(8,1,'1.3','运用数学、自然科学、工程基础和电子 信息专业知识推演、分析复杂工程问题','电子信息工程'),(9,1,'1.4','通过数学、自然科学、工程基础和电子 信息专业知识角度所建立的模型的分析，对复杂工程问题的解决方案进行分析和比较，并尝试改进','电子信息工程'),(10,2,'2.1','能运用数学、自然科学和电子信息领域的 基本原理，识别和判断电子信息领域复杂工 程问题的关键环节','电子信息工程'),(11,2,'2.2','能基于数学、自然科学和电子信息领域的 基本原理，并建立数学模型，正确表达电子 信息领域复杂工程问题','电子信息工程'),(12,2,'2.3','掌握电子信息领域工程分析的基本方 法，能认识到解决问题有多种方案可选择，并通过文献研究寻求适合的解决方案','电子信息工程'),(13,2,'2.4','能够运用数学、自然科学和电子信息领域的基本原理，借助文献研究，分析复杂工程所存在的影响因素，并获得有效结论','电子信息工程'),(14,3,'3.1','掌握电子信息领域工程设计和产品开发 全周期、全流程的基本设计/开发方法和技 术，了解影响设计目标和技术方案的各种因素','电子信息工程'),(15,3,'3.2','能针对电子信息领域工程设计和产品的 特定需求，能够通过建模进行信息处理系统 及单元的参数计算，设计开发控制方案、系统资源、应用软件等','电子信息工程'),(16,3,'3.3','能够对电子信息领域工程设计和产品进行系统方案或工艺流程设计，并在设计中体现创新意识','电子信息工程'),(17,3,'3.4','能够在电子信息领域工程和产品设计中考虑安全、健康、法律、文化及环境等制约 因素的影响','电子信息工程');
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_final_score`
--

DROP TABLE IF EXISTS `student_final_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_final_score` (
  `final_score_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` int(3) NOT NULL DEFAULT '0',
  `score_details` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`final_score_id`),
  KEY `学生期末成绩表关联学生信息表` (`student_id`),
  CONSTRAINT `学生期末成绩表关联学生信息表` FOREIGN KEY (`student_id`) REFERENCES `student_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_final_score`
--

LOCK TABLES `student_final_score` WRITE;
/*!40000 ALTER TABLE `student_final_score` DISABLE KEYS */;
INSERT INTO `student_final_score` VALUES (3,49,0,'[[\"13\",\"4\",\"4\",\"4\",\"4\"],[\"4\",\"4\",\"6\",\"\",\"7\"],[\"7\",\"\",\"8\",\"67\",\"67\"]]'),(4,50,0,'[[\"1\",\"5\",\"5\",\"5\",\"5\"],[\"5\",\"5\",\"5\",\"5\",\"5\"],[\"5\",\"7\",\"8\",\"9\",\"10\"]]'),(5,51,0,'[[\"6\",\"6\",\"6\",\"7\",\"8\"],[\"8\",\"9\",\"0\",\"9\",\"8\"],[\"78\",\"7\",\"78\",\"8\",\"8\"]]'),(8,1,0,'[[\"200\",\"2\",\"2\",\"2\",\"2\"],[\"3\",\"3\",\"3\",\"3\",\"3\"],[\"8\",\"8\",\"8\",\"8\",\"8\"]]'),(9,2,0,'[[\"6\",\"6\",\"6\",\"6\",\"6\"],[\"6\",\"6\",\"6\",\"6\",\"6\"],[\"6\",\"6\",\"6\",\"6\",\"6\"]]'),(10,3,0,'[[\"9\",\"9\",\"9\",\"9\",\"9\"],[\"9\",\"9\",\"9\",\"9\",\"9\"],[\"9\",\"9\",\"9\",\"9\",\"9\"]]'),(11,33,0,'[[\"8\",\"8\",\"8\",\"8\",\"8\"],[\"8\",\"9\",\"9\",\"0\",\"8\"],[\"9\",\"5\",\"5\",\"5\",\"5\"]]'),(12,53,0,'[[\"5\",\"5\",\"5\",\"5\",\"5\"],[\"5\",\"\",\"\",\"7\",\"7\"],[\"7\",\"\",\"7\",\"7\",\"\"]]'),(13,34,0,'[[\"4\",\"4\",\"4\",\"6\",\"7\"],[\"7\",\"8\",\"8\",\"867\",\"6\"],[\"6\",\"6\",\"6\",\"\",\"\"]]'),(14,35,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(15,36,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(16,38,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(17,39,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(18,40,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(19,46,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(20,47,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(21,48,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(22,52,0,'[[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\",\"\"]]'),(23,54,0,'[[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"\"],[\"\",\"2\",\"2\",\"2\",\"2\"]]');
/*!40000 ALTER TABLE `student_final_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_information`
--

DROP TABLE IF EXISTS `student_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_number` varchar(20) NOT NULL,
  `student_name` varchar(10) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `课程信息和学生信息关联` (`course_id`),
  CONSTRAINT `课程信息和学生信息关联` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_information`
--

LOCK TABLES `student_information` WRITE;
/*!40000 ALTER TABLE `student_information` DISABLE KEYS */;
INSERT INTO `student_information` VALUES (1,'20171151052','王璇凯','计科2020',10),(2,'20201122','陈明鹤子','电子信息工程2020',10),(3,'20201152056','阳光伟','计科2020',10),(33,'20201152088','张三','计科2020',10),(34,'231','王武','计科2020',10),(35,'24242','张三三十三','计科2020',10),(36,'23121','李四','123',10),(38,'1231','王小强','计科2020',10),(39,'20201152058','阳光伟','计科2020',10),(40,'12311111','123','123',10),(46,'20201152066','杨小姐','计科2020',10),(47,'20202116798','黄金时代','212100',10),(48,'123','123','123',10),(49,'123131313123','12313','1231',10),(50,'20201155577','雅加达','接口1001',10),(51,'12132313','张老师','咳咳阿三202',10),(52,'12121212121212121','23213','1231',10),(53,'3922834923892','啊哈大将','678',10),(54,'1231231','231321','3123123',10);
/*!40000 ALTER TABLE `student_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usual_score`
--

DROP TABLE IF EXISTS `student_usual_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usual_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` int(3) NOT NULL DEFAULT '0',
  `attendance_score` varchar(100) DEFAULT NULL,
  `work_score` varchar(100) DEFAULT NULL,
  `quiz_score` varchar(100) DEFAULT NULL,
  `mid_term_score` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `学生平时成绩表关联学生信息表` (`student_id`),
  CONSTRAINT `学生平时成绩表关联学生信息表` FOREIGN KEY (`student_id`) REFERENCES `student_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usual_score`
--

LOCK TABLES `student_usual_score` WRITE;
/*!40000 ALTER TABLE `student_usual_score` DISABLE KEYS */;
INSERT INTO `student_usual_score` VALUES (1,1,100,'40','21223123','101231232',''),(2,2,90,'1213121','32132','10231',''),(3,3,0,'','123','',NULL),(4,33,0,'123','121231231','123',NULL),(6,38,0,'123','13','1231',''),(8,35,0,'1231',NULL,NULL,NULL),(9,34,0,'123','123','13',NULL);
/*!40000 ALTER TABLE `student_usual_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `teacher_name` varchar(10) NOT NULL,
  `password` varchar(20) DEFAULT '000000',
  `is_admin` int(1) DEFAULT '0',
  `department` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','23','123',1,'test'),(3,'admin2','123','123',1,'test'),(94,'bx15288187317','白雪','000000',0,'计算机科学与工程系'),(95,'cy13529049079','曹涌','000000',0,'数据科学与工程系'),(96,'df13908715148','代飞','000000',0,'数据科学与工程系'),(97,'dzq15287167686','戴正权','000000',0,'信息与智能工程系'),(98,'dje15287113619','董建娥','000000',0,'信息与智能工程系'),(99,'dyy13577046004','董跃宇','000000',0,'数据科学与工程系'),(100,'fxy13518704805','付小勇','000000',0,'计算机科学与工程系'),(101,'gh18208721391','高皜','000000',0,'信息与智能工程系'),(102,'gr13629436290','郭冉','000000',0,'计算机科学与工程系'),(103,'hx13888008509','何鑫','000000',0,'计算机科学与工程系'),(104,'hjp13888425274','贺金平','000000',0,'计算机科学与工程系'),(105,'hkr13700687538','胡坤融','000000',0,'数据科学与工程系'),(106,'hb15808868790','黄苾','000000',0,'计算机科学与工程系'),(107,'hyx18208830702','黄宇翔','000000',0,'数据科学与工程系'),(108,'kwl13700618673','寇卫利','000000',0,'计算机科学与工程系'),(109,'ljq13698778010','李俊萩','000000',0,'信息与智能工程系'),(110,'ls15887279593','李莎','000000',0,'信息与智能工程系'),(111,'lh15987128885','林宏','000000',0,'数据科学与工程系'),(112,'ln13888838980','鲁宁','000000',0,'计算机科学与工程系'),(113,'ly13518756770','鲁莹','000000',0,'信息与智能工程系'),(114,'ldj15608809968','吕丹桔','000000',0,'信息与智能工程系'),(115,'ms13116958088','苗晟','000000',0,'数据科学与工程系'),(116,'qzp13987606761','强振平','000000',0,'计算机科学与工程系'),(117,'qmm13529036061','秦明明','000000',0,'信息与智能工程系'),(118,'rj15925116762','荣剑','000000',0,'信息与智能工程系'),(119,'syk15808796485','孙永科','000000',0,'数据科学与工程系'),(120,'wh13888331410','王欢','000000',0,'计算机科学与工程系'),(121,'wxl13577067397','王晓林','000000',0,'计算机科学与工程系'),(122,'wxr13700692383','王晓锐','000000',0,'数据科学与工程系'),(123,'xlw15825293953','邢丽伟','000000',0,'计算机科学与工程系'),(124,'xh18987955169','幸宏','000000',0,'计算机科学与工程系'),(125,'xf13698763596','熊飞','000000',0,'数据科学与工程系'),(126,'xqy13608849821','徐全元','000000',0,'信息与智能工程系'),(127,'xwh13888832080','徐伟恒','000000',0,'信息与智能工程系'),(128,'ypy15198952752','杨鹏宇','000000',0,'计算机科学与工程系'),(129,'yww15987148114','杨微微','000000',0,'教务办'),(130,'yyy15912514075','禹玥昀','000000',0,'信息与智能工程系'),(131,'zhw13759472154','张宏伟','000000',0,'计算机科学与工程系'),(132,'zhx13398854044','张宏翔','000000',0,'信息与智能工程系'),(133,'zqh13888193733','张晴晖','000000',0,'信息与智能工程系'),(134,'zf13888300900','赵璠','000000',0,'信息与智能工程系'),(135,'zx13888673236','赵喜','000000',0,'计算机科学与工程系'),(136,'zyl15825298876','赵毅力','000000',0,'计算机科学与工程系'),(137,'zyj15987138789','赵友杰','000000',0,'数据科学与工程系'),(138,'zlh15288473403','钟丽辉','000000',0,'信息与智能工程系');
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

-- Dump completed on 2023-04-30 12:54:30

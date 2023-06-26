-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: Manage_system
-- ------------------------------------------------------
-- Server version	5.7.42

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
-- Table structure for table `course_achievement_analyse`
--

DROP TABLE IF EXISTS `course_achievement_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_achievement_analyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  CONSTRAINT `达成度分析表和学生信息关联` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_achievement_analyse`
--

LOCK TABLES `course_achievement_analyse` WRITE;
/*!40000 ALTER TABLE `course_achievement_analyse` DISABLE KEYS */;
INSERT INTO `course_achievement_analyse` VALUES (1,'[[{\"index\":1,\"value\":0.8337},{\"index\":2,\"value\":0.8748},{\"index\":3,\"value\":0.8337},{\"index\":4,\"value\":0.5866},{\"index\":5,\"value\":0.8337},{\"index\":6,\"value\":0.7513},{\"index\":7,\"value\":0.5881},{\"index\":8,\"value\":0.669},{\"index\":9,\"value\":0.7513},{\"index\":10,\"value\":0.8763},{\"index\":11,\"value\":0.5866},{\"index\":12,\"value\":0.7513},{\"index\":13,\"value\":0.6277},{\"index\":14,\"value\":0.7528},{\"index\":15,\"value\":0.7101},{\"index\":16,\"value\":0.8337},{\"index\":17,\"value\":0.8352},{\"index\":18,\"value\":0.6277},{\"index\":19,\"value\":0.4204},{\"index\":20,\"value\":0.7116},{\"index\":21,\"value\":0.5043},{\"index\":22,\"value\":0.7798},{\"index\":23,\"value\":0.7101},{\"index\":24,\"value\":0.7101},{\"index\":25,\"value\":0.7798},{\"index\":26,\"value\":0.6277},{\"index\":27,\"value\":0.8352},{\"index\":28,\"value\":0.8637},{\"index\":29,\"value\":0.6277},{\"index\":30,\"value\":0.6277},{\"index\":31,\"value\":0.7513},{\"index\":32,\"value\":0.4219},{\"index\":33,\"value\":0.7513}],[{\"index\":1,\"value\":0.7251},{\"index\":2,\"value\":0.8683},{\"index\":3,\"value\":0.6933},{\"index\":4,\"value\":0.566},{\"index\":5,\"value\":0.7251},{\"index\":6,\"value\":0.7251},{\"index\":7,\"value\":0.5675},{\"index\":8,\"value\":0.566},{\"index\":9,\"value\":0.7251},{\"index\":10,\"value\":0.8698},{\"index\":11,\"value\":0.5342},{\"index\":12,\"value\":0.7887},{\"index\":13,\"value\":0.5979},{\"index\":14,\"value\":0.7266},{\"index\":15,\"value\":0.5979},{\"index\":16,\"value\":0.7251},{\"index\":17,\"value\":0.6948},{\"index\":18,\"value\":0.5979},{\"index\":19,\"value\":0.469},{\"index\":20,\"value\":0.5994},{\"index\":21,\"value\":0.4705},{\"index\":22,\"value\":0.7218},{\"index\":23,\"value\":0.5342},{\"index\":24,\"value\":0.7887},{\"index\":25,\"value\":0.7218},{\"index\":26,\"value\":0.7887},{\"index\":27,\"value\":0.7584},{\"index\":28,\"value\":0.7869},{\"index\":29,\"value\":0.7887},{\"index\":30,\"value\":0.8205},{\"index\":31,\"value\":0.7569},{\"index\":32,\"value\":0.4069},{\"index\":33,\"value\":0.6933}],[{\"index\":1,\"value\":0.7827},{\"index\":2,\"value\":0.8993},{\"index\":3,\"value\":0.7327},{\"index\":4,\"value\":0.566},{\"index\":5,\"value\":0.7827},{\"index\":6,\"value\":0.7493},{\"index\":7,\"value\":0.5675},{\"index\":8,\"value\":0.566},{\"index\":9,\"value\":0.6493},{\"index\":10,\"value\":0.9008},{\"index\":11,\"value\":0.4827},{\"index\":12,\"value\":0.816},{\"index\":13,\"value\":0.6827},{\"index\":14,\"value\":0.6508},{\"index\":15,\"value\":0.6493},{\"index\":16,\"value\":0.816},{\"index\":17,\"value\":0.7342},{\"index\":18,\"value\":0.6827},{\"index\":19,\"value\":0.4645},{\"index\":20,\"value\":0.6675},{\"index\":21,\"value\":0.466},{\"index\":22,\"value\":0.7945},{\"index\":23,\"value\":0.6994},{\"index\":24,\"value\":0.8827},{\"index\":25,\"value\":0.7528},{\"index\":26,\"value\":0.7327},{\"index\":27,\"value\":0.7842},{\"index\":28,\"value\":0.8293},{\"index\":29,\"value\":0.7827},{\"index\":30,\"value\":0.7827},{\"index\":31,\"value\":0.7993},{\"index\":32,\"value\":0.366},{\"index\":33,\"value\":0.816}],[{\"index\":1,\"value\":0.4739},{\"index\":2,\"value\":0.7318},{\"index\":3,\"value\":0.4739},{\"index\":4,\"value\":0.3449},{\"index\":5,\"value\":0.5844},{\"index\":6,\"value\":0.6581},{\"index\":7,\"value\":0.4791},{\"index\":8,\"value\":0.4923},{\"index\":9,\"value\":0.566},{\"index\":10,\"value\":0.6227},{\"index\":11,\"value\":0.4371},{\"index\":12,\"value\":0.6397},{\"index\":13,\"value\":0.4186},{\"index\":14,\"value\":0.5859},{\"index\":15,\"value\":0.4555},{\"index\":16,\"value\":0.6397},{\"index\":17,\"value\":0.5491},{\"index\":18,\"value\":0.4002},{\"index\":19,\"value\":0.3434},{\"index\":20,\"value\":0.5123},{\"index\":21,\"value\":0.3449},{\"index\":22,\"value\":0.5393},{\"index\":23,\"value\":0.4371},{\"index\":24,\"value\":0.8055},{\"index\":25,\"value\":0.5393},{\"index\":26,\"value\":0.6581},{\"index\":27,\"value\":0.5859},{\"index\":28,\"value\":0.6328},{\"index\":29,\"value\":0.5844},{\"index\":30,\"value\":0.5476},{\"index\":31,\"value\":0.5108},{\"index\":32,\"value\":0.3449},{\"index\":33,\"value\":0.566}],[{\"index\":1,\"value\":0.636},{\"index\":2,\"value\":0.846},{\"index\":3,\"value\":0.636},{\"index\":4,\"value\":0.636},{\"index\":5,\"value\":0.636},{\"index\":6,\"value\":0.636},{\"index\":7,\"value\":0.6375},{\"index\":8,\"value\":0.636},{\"index\":9,\"value\":0.636},{\"index\":10,\"value\":0.8475},{\"index\":11,\"value\":0.356},{\"index\":12,\"value\":0.636},{\"index\":13,\"value\":0.566},{\"index\":14,\"value\":0.6375},{\"index\":15,\"value\":0.706},{\"index\":16,\"value\":0.496},{\"index\":17,\"value\":0.6375},{\"index\":18,\"value\":0.566},{\"index\":19,\"value\":0.3545},{\"index\":20,\"value\":0.7075},{\"index\":21,\"value\":0.356},{\"index\":22,\"value\":0.3845},{\"index\":23,\"value\":0.706},{\"index\":24,\"value\":0.706},{\"index\":25,\"value\":0.3845},{\"index\":26,\"value\":0.636},{\"index\":27,\"value\":0.6375},{\"index\":28,\"value\":0.666},{\"index\":29,\"value\":0.636},{\"index\":30,\"value\":0.566},{\"index\":31,\"value\":0.426},{\"index\":32,\"value\":0.216},{\"index\":33,\"value\":0.496}]]',12),(2,'[[{\"index\":1,\"value\":0.7475},{\"index\":2,\"value\":0.4015},{\"index\":3,\"value\":0.3761},{\"index\":4,\"value\":0.2613},{\"index\":5,\"value\":0.247},{\"index\":6,\"value\":0.2326},{\"index\":7,\"value\":0.2326},{\"index\":8,\"value\":0.2326},{\"index\":9,\"value\":0.2326},{\"index\":10,\"value\":0.2326},{\"index\":11,\"value\":0.2326},{\"index\":12,\"value\":0.2326},{\"index\":13,\"value\":0.2326},{\"index\":14,\"value\":0.2326},{\"index\":15,\"value\":0.2326},{\"index\":16,\"value\":0.2326},{\"index\":17,\"value\":0.2326},{\"index\":18,\"value\":0.2326},{\"index\":19,\"value\":0.2326},{\"index\":20,\"value\":0.2326},{\"index\":21,\"value\":0.2326},{\"index\":22,\"value\":0.3934},{\"index\":23,\"value\":0.2326},{\"index\":24,\"value\":0.2326},{\"index\":25,\"value\":0.2326},{\"index\":26,\"value\":0.2326},{\"index\":27,\"value\":0.2326}],[{\"index\":1,\"value\":0.9766},{\"index\":2,\"value\":0.3806},{\"index\":3,\"value\":0.2507},{\"index\":4,\"value\":0.2627},{\"index\":5,\"value\":0.2483},{\"index\":6,\"value\":0.2339},{\"index\":7,\"value\":0.2339},{\"index\":8,\"value\":0.2339},{\"index\":9,\"value\":0.2339},{\"index\":10,\"value\":0.2339},{\"index\":11,\"value\":0.2339},{\"index\":12,\"value\":0.2339},{\"index\":13,\"value\":0.2339},{\"index\":14,\"value\":0.2339},{\"index\":15,\"value\":0.2339},{\"index\":16,\"value\":0.2339},{\"index\":17,\"value\":0.2339},{\"index\":18,\"value\":0.2339},{\"index\":19,\"value\":0.2339},{\"index\":20,\"value\":0.2339},{\"index\":21,\"value\":0.2339},{\"index\":22,\"value\":0.3946},{\"index\":23,\"value\":0.2339},{\"index\":24,\"value\":0.2339},{\"index\":25,\"value\":0.2339},{\"index\":26,\"value\":0.2339},{\"index\":27,\"value\":0.2339}],[{\"index\":1,\"value\":0.4743},{\"index\":2,\"value\":0.3003},{\"index\":3,\"value\":0.2999},{\"index\":4,\"value\":0.2946},{\"index\":5,\"value\":0.2802},{\"index\":6,\"value\":0.2658},{\"index\":7,\"value\":0.2658},{\"index\":8,\"value\":0.2658},{\"index\":9,\"value\":0.2658},{\"index\":10,\"value\":0.2658},{\"index\":11,\"value\":0.2658},{\"index\":12,\"value\":0.2658},{\"index\":13,\"value\":0.2658},{\"index\":14,\"value\":0.2658},{\"index\":15,\"value\":0.2658},{\"index\":16,\"value\":0.2658},{\"index\":17,\"value\":0.2658},{\"index\":18,\"value\":0.2658},{\"index\":19,\"value\":0.2658},{\"index\":20,\"value\":0.2658},{\"index\":21,\"value\":0.2658},{\"index\":22,\"value\":0.4266},{\"index\":23,\"value\":0.2658},{\"index\":24,\"value\":0.2658},{\"index\":25,\"value\":0.2658},{\"index\":26,\"value\":0.2658},{\"index\":27,\"value\":0.2658}]]',10),(3,'[[{\"index\":1,\"value\":0.7375},{\"index\":2,\"value\":0.688},{\"index\":3,\"value\":0.6793},{\"index\":4,\"value\":0.7348},{\"index\":5,\"value\":0.7378},{\"index\":6,\"value\":0.7408},{\"index\":7,\"value\":0.7438},{\"index\":8,\"value\":0.7468},{\"index\":9,\"value\":0.7498},{\"index\":10,\"value\":0.7528},{\"index\":11,\"value\":0.7558},{\"index\":12,\"value\":0.7588},{\"index\":13,\"value\":0.7618},{\"index\":14,\"value\":0.7648},{\"index\":15,\"value\":0.7678},{\"index\":16,\"value\":0.7708},{\"index\":17,\"value\":0.7738},{\"index\":18,\"value\":0.7768},{\"index\":19,\"value\":0.7798},{\"index\":20,\"value\":0.7828},{\"index\":21,\"value\":0.7858},{\"index\":22,\"value\":0.6958},{\"index\":23,\"value\":0.6988},{\"index\":24,\"value\":0.7018},{\"index\":25,\"value\":0.7048},{\"index\":26,\"value\":0.7078},{\"index\":27,\"value\":0.7108},{\"index\":28,\"value\":0.7138},{\"index\":29,\"value\":0.7168},{\"index\":30,\"value\":0.7198},{\"index\":31,\"value\":0.7228},{\"index\":32,\"value\":0.7258},{\"index\":33,\"value\":0.7288},{\"index\":34,\"value\":0.6327},{\"index\":35,\"value\":0.6357},{\"index\":36,\"value\":0.6387},{\"index\":37,\"value\":0.6592},{\"index\":38,\"value\":0.6622},{\"index\":39,\"value\":0.6652},{\"index\":40,\"value\":0.6682},{\"index\":41,\"value\":0.6712},{\"index\":42,\"value\":0.6742},{\"index\":43,\"value\":0.683},{\"index\":44,\"value\":0.686},{\"index\":45,\"value\":0.689},{\"index\":46,\"value\":0.692},{\"index\":47,\"value\":0.695},{\"index\":48,\"value\":0.698},{\"index\":49,\"value\":0.701},{\"index\":50,\"value\":0.65},{\"index\":51,\"value\":0.653},{\"index\":52,\"value\":0.7027},{\"index\":53,\"value\":0.7815},{\"index\":54,\"value\":0.7845},{\"index\":55,\"value\":0.7875},{\"index\":56,\"value\":0.7905},{\"index\":57,\"value\":0.7935},{\"index\":58,\"value\":0.7965},{\"index\":59,\"value\":0.7995},{\"index\":60,\"value\":0.8025},{\"index\":61,\"value\":0.8055},{\"index\":62,\"value\":0.8085}],[{\"index\":1,\"value\":0.7667},{\"index\":2,\"value\":0.7308},{\"index\":3,\"value\":0.7143},{\"index\":4,\"value\":0.8145},{\"index\":5,\"value\":0.8175},{\"index\":6,\"value\":0.8205},{\"index\":7,\"value\":0.8235},{\"index\":8,\"value\":0.8265},{\"index\":9,\"value\":0.8295},{\"index\":10,\"value\":0.8325},{\"index\":11,\"value\":0.8355},{\"index\":12,\"value\":0.8385},{\"index\":13,\"value\":0.8415},{\"index\":14,\"value\":0.8445},{\"index\":15,\"value\":0.8475},{\"index\":16,\"value\":0.8505},{\"index\":17,\"value\":0.8535},{\"index\":18,\"value\":0.8565},{\"index\":19,\"value\":0.8595},{\"index\":20,\"value\":0.8625},{\"index\":21,\"value\":0.8655},{\"index\":22,\"value\":0.7755},{\"index\":23,\"value\":0.7785},{\"index\":24,\"value\":0.7815},{\"index\":25,\"value\":0.7845},{\"index\":26,\"value\":0.7875},{\"index\":27,\"value\":0.7905},{\"index\":28,\"value\":0.7935},{\"index\":29,\"value\":0.7965},{\"index\":30,\"value\":0.7995},{\"index\":31,\"value\":0.8025},{\"index\":32,\"value\":0.8055},{\"index\":33,\"value\":0.8085},{\"index\":34,\"value\":0.7338},{\"index\":35,\"value\":0.7368},{\"index\":36,\"value\":0.7398},{\"index\":37,\"value\":0.7428},{\"index\":38,\"value\":0.7458},{\"index\":39,\"value\":0.7488},{\"index\":40,\"value\":0.7518},{\"index\":41,\"value\":0.7548},{\"index\":42,\"value\":0.7578},{\"index\":43,\"value\":0.7608},{\"index\":44,\"value\":0.7638},{\"index\":45,\"value\":0.7668},{\"index\":46,\"value\":0.7698},{\"index\":47,\"value\":0.7728},{\"index\":48,\"value\":0.7758},{\"index\":49,\"value\":0.7788},{\"index\":50,\"value\":0.7278},{\"index\":51,\"value\":0.7308},{\"index\":52,\"value\":0.7727},{\"index\":53,\"value\":0.8923},{\"index\":54,\"value\":0.8953},{\"index\":55,\"value\":0.8983},{\"index\":56,\"value\":0.9013},{\"index\":57,\"value\":0.9043},{\"index\":58,\"value\":0.9073},{\"index\":59,\"value\":0.9103},{\"index\":60,\"value\":0.9133},{\"index\":61,\"value\":0.9163},{\"index\":62,\"value\":0.9193}],[{\"index\":1,\"value\":0.73},{\"index\":2,\"value\":0.703},{\"index\":3,\"value\":0.696},{\"index\":4,\"value\":0.749},{\"index\":5,\"value\":0.752},{\"index\":6,\"value\":0.755},{\"index\":7,\"value\":0.758},{\"index\":8,\"value\":0.761},{\"index\":9,\"value\":0.764},{\"index\":10,\"value\":0.767},{\"index\":11,\"value\":0.77},{\"index\":12,\"value\":0.773},{\"index\":13,\"value\":0.776},{\"index\":14,\"value\":0.779},{\"index\":15,\"value\":0.782},{\"index\":16,\"value\":0.785},{\"index\":17,\"value\":0.788},{\"index\":18,\"value\":0.791},{\"index\":19,\"value\":0.794},{\"index\":20,\"value\":0.797},{\"index\":21,\"value\":0.8},{\"index\":22,\"value\":0.71},{\"index\":23,\"value\":0.713},{\"index\":24,\"value\":0.716},{\"index\":25,\"value\":0.719},{\"index\":26,\"value\":0.722},{\"index\":27,\"value\":0.725},{\"index\":28,\"value\":0.728},{\"index\":29,\"value\":0.731},{\"index\":30,\"value\":0.734},{\"index\":31,\"value\":0.737},{\"index\":32,\"value\":0.74},{\"index\":33,\"value\":0.743},{\"index\":34,\"value\":0.621},{\"index\":35,\"value\":0.624},{\"index\":36,\"value\":0.627},{\"index\":37,\"value\":0.64},{\"index\":38,\"value\":0.643},{\"index\":39,\"value\":0.646},{\"index\":40,\"value\":0.649},{\"index\":41,\"value\":0.652},{\"index\":42,\"value\":0.655},{\"index\":43,\"value\":0.663},{\"index\":44,\"value\":0.666},{\"index\":45,\"value\":0.669},{\"index\":46,\"value\":0.672},{\"index\":47,\"value\":0.675},{\"index\":48,\"value\":0.678},{\"index\":49,\"value\":0.681},{\"index\":50,\"value\":0.63},{\"index\":51,\"value\":0.633},{\"index\":52,\"value\":0.696},{\"index\":53,\"value\":0.764},{\"index\":54,\"value\":0.767},{\"index\":55,\"value\":0.77},{\"index\":56,\"value\":0.773},{\"index\":57,\"value\":0.776},{\"index\":58,\"value\":0.779},{\"index\":59,\"value\":0.782},{\"index\":60,\"value\":0.785},{\"index\":61,\"value\":0.788},{\"index\":62,\"value\":0.791}],[{\"index\":1,\"value\":0.734},{\"index\":2,\"value\":0.695},{\"index\":3,\"value\":0.691},{\"index\":4,\"value\":0.715},{\"index\":5,\"value\":0.718},{\"index\":6,\"value\":0.721},{\"index\":7,\"value\":0.724},{\"index\":8,\"value\":0.727},{\"index\":9,\"value\":0.73},{\"index\":10,\"value\":0.733},{\"index\":11,\"value\":0.736},{\"index\":12,\"value\":0.739},{\"index\":13,\"value\":0.742},{\"index\":14,\"value\":0.745},{\"index\":15,\"value\":0.748},{\"index\":16,\"value\":0.751},{\"index\":17,\"value\":0.754},{\"index\":18,\"value\":0.757},{\"index\":19,\"value\":0.76},{\"index\":20,\"value\":0.763},{\"index\":21,\"value\":0.766},{\"index\":22,\"value\":0.676},{\"index\":23,\"value\":0.679},{\"index\":24,\"value\":0.682},{\"index\":25,\"value\":0.685},{\"index\":26,\"value\":0.688},{\"index\":27,\"value\":0.691},{\"index\":28,\"value\":0.694},{\"index\":29,\"value\":0.697},{\"index\":30,\"value\":0.7},{\"index\":31,\"value\":0.703},{\"index\":32,\"value\":0.706},{\"index\":33,\"value\":0.709},{\"index\":34,\"value\":0.6},{\"index\":35,\"value\":0.603},{\"index\":36,\"value\":0.606},{\"index\":37,\"value\":0.63},{\"index\":38,\"value\":0.633},{\"index\":39,\"value\":0.636},{\"index\":40,\"value\":0.639},{\"index\":41,\"value\":0.642},{\"index\":42,\"value\":0.645},{\"index\":43,\"value\":0.655},{\"index\":44,\"value\":0.658},{\"index\":45,\"value\":0.661},{\"index\":46,\"value\":0.664},{\"index\":47,\"value\":0.667},{\"index\":48,\"value\":0.67},{\"index\":49,\"value\":0.673},{\"index\":50,\"value\":0.622},{\"index\":51,\"value\":0.625},{\"index\":52,\"value\":0.684},{\"index\":53,\"value\":0.736},{\"index\":54,\"value\":0.739},{\"index\":55,\"value\":0.742},{\"index\":56,\"value\":0.745},{\"index\":57,\"value\":0.748},{\"index\":58,\"value\":0.751},{\"index\":59,\"value\":0.754},{\"index\":60,\"value\":0.757},{\"index\":61,\"value\":0.76},{\"index\":62,\"value\":0.763}],[{\"index\":1,\"value\":0.7407},{\"index\":2,\"value\":0.7308},{\"index\":3,\"value\":0.7273},{\"index\":4,\"value\":0.7886},{\"index\":5,\"value\":0.7916},{\"index\":6,\"value\":0.7946},{\"index\":7,\"value\":0.7976},{\"index\":8,\"value\":0.8006},{\"index\":9,\"value\":0.8036},{\"index\":10,\"value\":0.8066},{\"index\":11,\"value\":0.8096},{\"index\":12,\"value\":0.8126},{\"index\":13,\"value\":0.8156},{\"index\":14,\"value\":0.8186},{\"index\":15,\"value\":0.8216},{\"index\":16,\"value\":0.8246},{\"index\":17,\"value\":0.8276},{\"index\":18,\"value\":0.8306},{\"index\":19,\"value\":0.8336},{\"index\":20,\"value\":0.8366},{\"index\":21,\"value\":0.8396},{\"index\":22,\"value\":0.7496},{\"index\":23,\"value\":0.7526},{\"index\":24,\"value\":0.7556},{\"index\":25,\"value\":0.7586},{\"index\":26,\"value\":0.7616},{\"index\":27,\"value\":0.7646},{\"index\":28,\"value\":0.7676},{\"index\":29,\"value\":0.7706},{\"index\":30,\"value\":0.7736},{\"index\":31,\"value\":0.7766},{\"index\":32,\"value\":0.7796},{\"index\":33,\"value\":0.7826},{\"index\":34,\"value\":0.6495},{\"index\":35,\"value\":0.6525},{\"index\":36,\"value\":0.6555},{\"index\":37,\"value\":0.665},{\"index\":38,\"value\":0.668},{\"index\":39,\"value\":0.671},{\"index\":40,\"value\":0.674},{\"index\":41,\"value\":0.677},{\"index\":42,\"value\":0.68},{\"index\":43,\"value\":0.683},{\"index\":44,\"value\":0.686},{\"index\":45,\"value\":0.689},{\"index\":46,\"value\":0.692},{\"index\":47,\"value\":0.695},{\"index\":48,\"value\":0.698},{\"index\":49,\"value\":0.701},{\"index\":50,\"value\":0.65},{\"index\":51,\"value\":0.653},{\"index\":52,\"value\":0.7208},{\"index\":53,\"value\":0.8016},{\"index\":54,\"value\":0.8046},{\"index\":55,\"value\":0.8076},{\"index\":56,\"value\":0.8106},{\"index\":57,\"value\":0.8136},{\"index\":58,\"value\":0.8166},{\"index\":59,\"value\":0.8196},{\"index\":60,\"value\":0.8226},{\"index\":61,\"value\":0.8256},{\"index\":62,\"value\":0.8286}],[{\"index\":1,\"value\":0.72},{\"index\":2,\"value\":0.6763},{\"index\":3,\"value\":0.656},{\"index\":4,\"value\":0.6823},{\"index\":5,\"value\":0.6853},{\"index\":6,\"value\":0.6883},{\"index\":7,\"value\":0.6913},{\"index\":8,\"value\":0.6943},{\"index\":9,\"value\":0.6973},{\"index\":10,\"value\":0.7003},{\"index\":11,\"value\":0.7033},{\"index\":12,\"value\":0.7063},{\"index\":13,\"value\":0.7093},{\"index\":14,\"value\":0.7123},{\"index\":15,\"value\":0.7153},{\"index\":16,\"value\":0.7183},{\"index\":17,\"value\":0.7213},{\"index\":18,\"value\":0.7243},{\"index\":19,\"value\":0.7273},{\"index\":20,\"value\":0.7303},{\"index\":21,\"value\":0.7333},{\"index\":22,\"value\":0.6433},{\"index\":23,\"value\":0.6463},{\"index\":24,\"value\":0.6493},{\"index\":25,\"value\":0.6523},{\"index\":26,\"value\":0.6553},{\"index\":27,\"value\":0.6583},{\"index\":28,\"value\":0.6613},{\"index\":29,\"value\":0.6643},{\"index\":30,\"value\":0.6673},{\"index\":31,\"value\":0.6703},{\"index\":32,\"value\":0.6733},{\"index\":33,\"value\":0.6763},{\"index\":34,\"value\":0.586},{\"index\":35,\"value\":0.589},{\"index\":36,\"value\":0.592},{\"index\":37,\"value\":0.6183},{\"index\":38,\"value\":0.6213},{\"index\":39,\"value\":0.6243},{\"index\":40,\"value\":0.6273},{\"index\":41,\"value\":0.6303},{\"index\":42,\"value\":0.6333},{\"index\":43,\"value\":0.648},{\"index\":44,\"value\":0.651},{\"index\":45,\"value\":0.654},{\"index\":46,\"value\":0.657},{\"index\":47,\"value\":0.66},{\"index\":48,\"value\":0.663},{\"index\":49,\"value\":0.666},{\"index\":50,\"value\":0.615},{\"index\":51,\"value\":0.618},{\"index\":52,\"value\":0.6677},{\"index\":53,\"value\":0.7173},{\"index\":54,\"value\":0.7203},{\"index\":55,\"value\":0.7233},{\"index\":56,\"value\":0.7263},{\"index\":57,\"value\":0.7293},{\"index\":58,\"value\":0.7323},{\"index\":59,\"value\":0.7353},{\"index\":60,\"value\":0.7383},{\"index\":61,\"value\":0.7413},{\"index\":62,\"value\":0.7443}]]',14);
/*!40000 ALTER TABLE `course_achievement_analyse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_attainment_survey`
--

DROP TABLE IF EXISTS `course_attainment_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_attainment_survey` (
  `course_target_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attainment` int(2) DEFAULT '0',
  PRIMARY KEY (`course_target_id`),
  KEY `关联学生基本信息id` (`student_id`),
  CONSTRAINT `关联学生基本信息id` FOREIGN KEY (`student_id`) REFERENCES `student_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `调查问卷和课程目标关联` FOREIGN KEY (`course_target_id`) REFERENCES `course_target` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_attainment_survey`
--

LOCK TABLES `course_attainment_survey` WRITE;
/*!40000 ALTER TABLE `course_attainment_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_attainment_survey` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_basic_information`
--

LOCK TABLES `course_basic_information` WRITE;
/*!40000 ALTER TABLE `course_basic_information` DISABLE KEYS */;
INSERT INTO `course_basic_information` VALUES (1,'高数(必修)','undefine',1,'阳老师',16,4,'计算机科学与技术2020','2020','2021',1,NULL,80,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\"]'),(2,'线性代数','undefine',1,'王老师',16,4,'计算机科学与技术2020','2020','2021',1,NULL,80,'必修','专业必修课',5,3,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(4,'概率论','undefine',1,'阳老师1222',16123,41231,'计算机科学与技术2022','2020','2021',1,NULL,80111,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(6,'c语言程序设计','undefine',1,'阳老师',16,4,'计算机科学与技术2020','2020','2021',1,NULL,80,'必修','专业必修课',5,2,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(7,'JAVA程序设计','undefine',1,'阳老师',1231,132,'计算,机科学与技术2020','2020','2021',1,NULL,123,'必修','专业必修课',5,1231,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(8,'高数','undefine',3,'admin2',12,12,'计算机科学与技术2020','2020','2021',1,NULL,122,'必修','公共必修',4,1,'[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]'),(10,'编译原理','计算机科学与技术',1,'admin',48,23,'2020计算机科学与技术','2023','2024',2,'《信号与线性系统分析》（第 5 版）[M]. 吴大正：高等教育出版社, 2019.',55,'必修','5636',1,2,'[\"1.1\",\"2.1\"]'),(11,'这是一条很长的测试数据','undefine',1,'admin',1223,213,'123123','2021','2022',1,NULL,123,'必修','123131',123131,123131,'[\"指标点1.1\",\"指标点2.1\",\"指标点1.2\",\"指标点5.2\"]'),(12,'信号与系统','电子信息工程',113,'鲁莹',64,0,'电子信息工程2020','2021','2022',2,'《信号与线性系统分析》（第 5 版）[M]. 吴大正：高等教育出版社, 2019.',70,'必修','专业基础课',5,3,'[\"1.1\",\"1.2\",\"1.3\"]'),(13,'1','1',113,'鲁莹',1,1,'1','2020','2021',1,'1',1,'必修','专业基础课',1,1,'[\"1.1\"]'),(14,'C语言程序设计','电子信息工程',113,'鲁莹',42,14,'计算机科学与技术','2020','2021',1,'<<C语言程序设计.刘成明.2001>>',80,'必修','专业基础课',6,6,'[\"1.1\",\"1.2\",\"1.3\",\"1.4\",\"2.1\",\"2.2\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_child_methods`
--

LOCK TABLES `course_examine_child_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_child_methods` DISABLE KEYS */;
INSERT INTO `course_examine_child_methods` VALUES (16,20,'考勤',34,100,'[\"课程目标1\"]','[\"1.1\",\"2.1\"]'),(17,20,'课题提问',29,100,'[\"课程目标1\"]','[\"1.1\",\"2.1\"]'),(21,20,'作业',47,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\"]','[\"1.1\",\"2.1\"]'),(33,25,'考勤',13,100,'[]','[\"指标点1.1\",\"指标点5.2\",\"指标点2.1\"]'),(34,25,'课题提问',11,100,'[]','[\"指标点1.1\"]'),(35,25,'考勤',50,100,'[]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(36,26,'试卷',100,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\"]','[\"1.1\",\"2.1\"]'),(37,5,'考勤',33,100,'[]','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\"]'),(38,27,'试卷',22,100,'[\"课程目标1\"]','[\"指标点1.1\",\"指标点1.2\"]'),(41,28,'作业',17,100,'[\"课程目标1\"]','[]'),(42,29,'实验报告',16,100,'[\"课程目标1\"]','[]'),(43,30,'考勤成绩',20,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\",\"课程目标4\",\"课程目标5\",\"课程目标6\"]','[\"1.1\",\"1.2\",\"2.1\"]'),(44,30,'课堂表现',20,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\",\"课程目标4\",\"课程目标5\",\"课程目标6\"]','[\"1.1\",\"1.2\",\"2.1\"]'),(45,30,'作业成绩',30,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\",\"课程目标4\",\"课程目标5\",\"课程目标6\"]','[\"1.1\",\"1.2\",\"2.1\"]'),(46,30,'期中测试成绩',30,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\",\"课程目标4\",\"课程目标5\",\"课程目标6\"]','[\"2.1\",\"1.2\",\"1.1\"]'),(47,31,'试卷',100,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\",\"课程目标5\",\"课程目标6\",\"课程目标4\"]','[\"1.1\",\"1.2\",\"2.1\"]'),(50,32,'试卷',100,100,'[]','[\"指标点1.1\",\"指标点1.2\"]'),(51,33,'平时作业',20,100,'[\"课程目标1\",\"课程目标2\",\"课程目标3\",\"课程目标5\"]','[\"1.2\",\"1.3\",\"1.4\"]'),(52,33,'考勤',80,100,'[\"课程目标1\",\"课程目标3\",\"课程目标4\",\"课程目标5\",\"课程目标2\",\"课程目标6\"]','[\"1.2\",\"1.4\",\"2.1\"]'),(53,34,'试卷',100,100,'[\"课程目标2\",\"课程目标5\",\"课程目标3\",\"课程目标4\",\"课程目标1\",\"课程目标6\"]','[\"1.2\",\"1.1\",\"1.3\",\"1.4\",\"2.1\",\"2.2\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_examine_methods`
--

LOCK TABLES `course_examine_methods` WRITE;
/*!40000 ALTER TABLE `course_examine_methods` DISABLE KEYS */;
INSERT INTO `course_examine_methods` VALUES (5,7,'JAVA程序设计','平时考核成绩',3,100),(7,6,'c语言程序设计','平时考核成绩',6,100),(8,6,'c语言程序设计','平时考核成绩',6,100),(9,6,'c语言程序设计','平时考核成绩',6,100),(15,4,'概率论','实验考核成绩',412,100),(18,8,'线性代数','平时测验',30,100),(19,8,'线性代数','平时测验',30,100),(20,10,'编译原理','平时考核成绩',24,100),(25,11,'这是一条很长的测试数据','平时考核成绩',17,100),(26,10,'编译原理','期末考核成绩',50,100),(27,1,'高数(必修)','期末考核成绩',55,100),(28,1,'高数(必修)','平时考核成绩',32,100),(29,1,'高数(必修)','实验考核成绩',27,100),(30,12,'信号与系统','平时考核成绩',30,100),(31,12,'信号与系统','期末考核成绩',70,100),(32,7,'JAVA程序设计','期末考核成绩',97,100),(33,14,'test','平时考核成绩',30,100),(34,14,'test','期末考核成绩',70,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_final_exam_paper`
--

LOCK TABLES `course_final_exam_paper` WRITE;
/*!40000 ALTER TABLE `course_final_exam_paper` DISABLE KEYS */;
INSERT INTO `course_final_exam_paper` VALUES (10,36,'选择题',20),(11,36,'填空题',30),(12,36,'简答题',50),(17,38,'选择题',30),(18,47,'选择',10),(19,47,'填空',20),(20,47,'简答',10),(21,47,'计算',60),(22,50,'选择题',20),(23,50,'填空',10),(28,36,'计算题',36),(29,53,'选择题',20),(30,53,'填空题',20),(31,53,'简答题',60);
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
  `title_number` int(3) NOT NULL,
  `score` int(3) DEFAULT NULL,
  `indicator_points` varchar(100) NOT NULL,
  `course_target` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `与课程试卷表id外联` (`primary_id`),
  CONSTRAINT `与课程试卷表id外联` FOREIGN KEY (`primary_id`) REFERENCES `course_final_exam_paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_final_exam_paper_detail`
--

LOCK TABLES `course_final_exam_paper_detail` WRITE;
/*!40000 ALTER TABLE `course_final_exam_paper_detail` DISABLE KEYS */;
INSERT INTO `course_final_exam_paper_detail` VALUES (31,10,3,2,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(32,10,1,10,'[\"1.1\",\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(34,10,2,2,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(35,11,1,2,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\"]'),(36,11,2,2,'[\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(37,11,3,3,'[\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(38,12,1,12,'[\"1.1\",\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(39,12,2,2,'[\"2.1\"]','[\"课程目标1\",\"课程目标2\"]'),(40,12,3,3,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(41,10,4,2,'[\"2.1\"]','[\"课程目标1\"]'),(42,10,5,2,'[\"2.1\"]','[\"课程目标2\"]'),(43,11,4,5,'[\"1.1\"]','[\"课程目标2\"]'),(44,11,5,6,'[\"1.1\",\"2.1\"]','[\"课程目标1\"]'),(45,12,4,4,'[\"1.1\"]','[\"课程目标3\"]'),(46,12,5,6,'[\"2.1\"]','[\"课程目标2\"]'),(47,17,1,2,'[\"指标点1.1\"]','[\"课程目标1\"]'),(48,17,2,2,'[\"指标点1.1\"]','[\"课程目标1\"]'),(50,17,3,12,'[\"指标点1.1\",\"指标点1.2\"]','[\"课程目标1\"]'),(51,17,4,12,'[\"指标点1.1\"]','[\"课程目标1\"]'),(52,18,1,2,'[\"1.1\"]','[\"课程目标1\"]'),(53,18,2,2,'[\"1.1\"]','[\"课程目标1\"]'),(54,18,3,2,'[\"1.2\"]','[\"课程目标2\"]'),(55,18,4,2,'[\"1.1\"]','[\"课程目标1\"]'),(56,18,5,2,'[\"1.2\"]','[\"课程目标3\"]'),(57,19,1,2,'[\"1.1\"]','[\"课程目标1\"]'),(58,19,2,2,'[\"1.2\"]','[\"课程目标2\"]'),(59,19,3,2,'[]','[\"课程目标2\"]'),(60,19,4,2,'[\"1.2\"]','[\"课程目标3\"]'),(61,19,5,2,'[\"1.2\",\"2.1\"]','[\"课程目标4\",\"课程目标6\"]'),(62,19,6,2,'[\"1.2\",\"2.1\"]','[\"课程目标6\",\"课程目标4\"]'),(63,19,7,2,'[\"1.2\"]','[\"课程目标3\"]'),(64,19,8,2,'[\"1.2\"]','[\"课程目标3\"]'),(65,19,9,2,'[\"1.2\",\"2.1\"]','[\"课程目标5\",\"课程目标6\"]'),(67,19,10,2,'[\"1.2\"]','[\"课程目标3\"]'),(68,20,1,2,'[\"1.1\"]','[\"课程目标1\"]'),(69,20,2,2,'[\"1.2\"]','[\"课程目标3\"]'),(70,20,3,2,'[\"1.2\"]','[\"课程目标3\"]'),(71,20,4,2,'[\"1.2\"]','[\"课程目标3\"]'),(73,21,1,4,'[\"1.1\"]','[\"课程目标1\"]'),(74,21,2,5,'[\"1.2\"]','[\"课程目标2\"]'),(75,21,3,4,'[\"1.2\"]','[\"课程目标2\"]'),(76,21,4,6,'[\"1.2\"]','[\"课程目标3\"]'),(77,21,5,8,'[\"1.2\"]','[\"课程目标3\"]'),(78,21,6,5,'[\"1.2\"]','[\"课程目标3\"]'),(79,21,7,4,'[\"1.2\"]','[\"课程目标3\"]'),(80,21,8,15,'[\"1.2\",\"2.1\"]','[\"课程目标4\",\"课程目标6\"]'),(81,21,9,5,'[\"1.2\",\"2.1\"]','[\"课程目标6\",\"课程目标5\"]'),(82,21,10,4,'[\"1.2\"]','[\"课程目标2\"]'),(83,10,10,1,'[\"1.1\"]','[\"课程目标1\"]'),(84,22,1,1,'[\"指标点1.1\"]','[]'),(85,22,2,2,'[\"指标点1.2\"]','[]'),(86,22,3,2,'[\"指标点1.1\"]','[]'),(87,22,4,2,'[\"指标点1.1\"]','[]'),(88,22,5,2,'[]','[]'),(89,22,6,2,'[\"指标点1.1\"]','[]'),(90,22,7,2,'[\"指标点1.1\"]','[]'),(91,22,8,2,'[\"指标点1.1\"]','[]'),(92,22,9,2,'[\"指标点1.1\"]','[]'),(93,22,10,2,'[\"指标点1.1\"]','[]'),(94,23,1,1,'[\"指标点1.1\"]','[]'),(95,23,2,1,'[\"指标点1.1\"]','[]'),(96,20,5,3,'[\"1.1\"]','[\"课程目标2\",\"课程目标1\",\"课程目标3\",\"课程目标5\",\"课程目标6\"]'),(137,28,1,6,'[\"1.1\",\"2.1\"]','[\"课程目标1\",\"课程目标2\",\"课程目标3\"]'),(138,28,5,6,'[\"2.1\"]','[\"课程目标1\"]'),(139,28,4,6,'[\"1.1\"]','[\"课程目标1\",\"课程目标2\"]'),(140,28,6,6,'[\"1.1\"]','[\"课程目标2\",\"课程目标3\"]'),(141,28,3,6,'[\"1.1\",\"2.1\"]','[\"课程目标2\"]'),(142,28,2,6,'[\"1.1\"]','[\"课程目标1\",\"课程目标3\"]'),(143,29,1,2,'[\"1.1\",\"1.4\",\"2.1\",\"1.3\",\"2.2\"]','[\"课程目标4\",\"课程目标3\",\"课程目标2\",\"课程目标5\",\"课程目标1\",\"课程目标6\"]'),(144,29,5,2,'[\"1.2\",\"1.3\",\"2.1\"]','[\"课程目标1\",\"课程目标3\",\"课程目标5\"]'),(145,29,3,2,'[\"1.2\",\"1.3\",\"1.4\",\"2.2\"]','[\"课程目标4\",\"课程目标5\",\"课程目标3\"]'),(146,29,4,2,'[\"1.3\",\"2.1\",\"2.2\",\"1.1\"]','[\"课程目标1\",\"课程目标4\"]'),(147,29,6,2,'[\"1.2\",\"1.3\",\"2.1\",\"2.2\"]','[\"课程目标1\",\"课程目标4\",\"课程目标3\",\"课程目标5\",\"课程目标2\"]'),(148,29,2,2,'[\"1.1\",\"1.3\",\"1.4\"]','[\"课程目标4\",\"课程目标5\",\"课程目标2\"]'),(149,29,7,2,'[\"1.2\",\"1.3\",\"1.4\",\"2.1\",\"2.2\"]','[\"课程目标1\",\"课程目标4\",\"课程目标3\",\"课程目标5\",\"课程目标2\"]'),(150,29,10,2,'[\"1.4\"]','[\"课程目标1\",\"课程目标3\",\"课程目标5\"]'),(151,29,9,2,'[\"1.2\"]','[\"课程目标6\"]'),(152,29,8,2,'[\"1.2\"]','[\"课程目标6\"]'),(153,30,4,2,'[\"1.1\",\"1.3\",\"2.1\",\"2.2\"]','[\"课程目标1\",\"课程目标3\",\"课程目标5\",\"课程目标2\"]'),(154,30,3,2,'[\"1.2\",\"1.1\",\"1.4\",\"2.1\"]','[\"课程目标1\",\"课程目标4\",\"课程目标3\",\"课程目标5\"]'),(155,30,1,2,'[\"1.2\",\"1.1\",\"1.4\"]','[\"课程目标1\",\"课程目标3\"]'),(156,30,2,2,'[\"1.2\",\"1.3\",\"1.4\",\"2.1\"]','[\"课程目标1\",\"课程目标3\",\"课程目标5\"]'),(157,30,6,2,'[\"1.2\",\"1.3\",\"2.1\",\"2.2\"]','[\"课程目标1\",\"课程目标3\",\"课程目标5\"]'),(158,30,5,2,'[\"1.1\",\"1.4\",\"2.2\"]','[\"课程目标6\",\"课程目标1\",\"课程目标3\",\"课程目标2\"]'),(159,30,7,2,'[\"1.4\",\"1.3\",\"1.1\",\"1.2\"]','[\"课程目标1\",\"课程目标4\",\"课程目标3\"]'),(160,30,8,2,'[\"1.2\",\"1.4\",\"2.2\"]','[\"课程目标1\",\"课程目标4\"]'),(161,30,10,2,'[\"1.2\",\"1.3\",\"1.4\"]','[\"课程目标6\",\"课程目标1\",\"课程目标3\"]'),(162,30,9,2,'[\"1.4\",\"2.1\",\"1.1\"]','[\"课程目标6\",\"课程目标4\",\"课程目标5\"]'),(163,31,1,6,'[\"1.2\",\"1.1\",\"1.4\"]','[\"课程目标5\",\"课程目标3\",\"课程目标4\"]'),(164,31,2,6,'[\"1.2\",\"1.3\",\"2.2\"]','[\"课程目标5\",\"课程目标3\",\"课程目标1\"]'),(165,31,3,6,'[\"1.4\",\"2.2\"]','[\"课程目标4\"]'),(166,31,5,6,'[\"1.2\",\"2.1\"]','[\"课程目标2\"]'),(167,31,6,6,'[\"1.4\",\"1.2\",\"1.3\"]','[\"课程目标1\",\"课程目标3\",\"课程目标5\"]'),(168,31,7,6,'[\"1.3\",\"1.4\",\"2.1\"]','[\"课程目标3\",\"课程目标1\",\"课程目标4\",\"课程目标5\"]'),(169,31,4,6,'[\"1.4\",\"2.1\"]','[\"课程目标5\",\"课程目标4\",\"课程目标6\"]'),(170,31,8,6,'[\"1.1\",\"2.1\"]','[\"课程目标3\",\"课程目标6\"]'),(171,31,10,6,'[\"1.3\",\"1.1\"]','[\"课程目标4\",\"课程目标6\",\"课程目标1\",\"课程目标3\"]'),(172,31,9,6,'[\"1.2\",\"1.3\",\"2.2\"]','[\"课程目标3\",\"课程目标1\"]');
/*!40000 ALTER TABLE `course_final_exam_paper_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_score_analyse`
--

DROP TABLE IF EXISTS `course_score_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_score_analyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `student_num` int(4) NOT NULL,
  `max_score` double DEFAULT '0',
  `min_score` double DEFAULT '0',
  `average_score` double DEFAULT '0',
  `superior` int(4) DEFAULT '0',
  `great` int(4) DEFAULT '0',
  `good` int(4) DEFAULT '0',
  `pass` int(4) DEFAULT '0',
  `failed` int(4) DEFAULT '0',
  `pass_rate` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_score_analyse`
--

LOCK TABLES `course_score_analyse` WRITE;
/*!40000 ALTER TABLE `course_score_analyse` DISABLE KEYS */;
INSERT INTO `course_score_analyse` VALUES (9,10,27,85.3,23.7,27.6,0,1,0,0,26,0.037),(10,12,33,87.8,38.1,67.9,0,4,14,6,9,0.7273),(11,14,62,80.1,61.8,72.6,0,1,42,19,0,1);
/*!40000 ALTER TABLE `course_score_analyse` ENABLE KEYS */;
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
  `weight` double DEFAULT '0',
  `course_target` text NOT NULL,
  `path_ways` text NOT NULL,
  `indicator_points` text NOT NULL,
  `evaluation_method` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_basic_information_id` (`course_id`),
  CONSTRAINT `course_basic_information_id` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_target`
--

LOCK TABLES `course_target` WRITE;
/*!40000 ALTER TABLE `course_target` DISABLE KEYS */;
INSERT INTO `course_target` VALUES (4,6,'c语言程序设计','课程目标1',0,'aaaaaaaaaaadasdasd','1232dadXzcscascdfsdasadsadasdad','[\"选项1\",\"选项2\"]','[\"考试\",\"作业\"]'),(5,4,'概率论','课程目标1',0,'wdaeasdasdasd','asdasd','[\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]'),(6,6,'c语言程序设计','课程目标2',0,'edadsadaczcweqwedad阿达是大大','大赛大赛大大','[\"选项1\",\"选项2\",\"选项3\",\"选项4\",\"选项5\"]','[\"考试\",\"作业\"]'),(8,2,'线性代数','课程目标1',0,'阿三打是大势打豆豆','是大大是大大的','[\"选项1\",\"选项2\",\"选项4\"]','[\"考试\",\"作业\"]'),(9,1,'高数(必修)','课程目标1',0,'阿斯顿焚膏继晷语序虚词是大扫除','asadadadadaxzcvvdffgdg','[\"指标点1.1\",\"指标点1.2\",\"指标点5.2\",\"指标点2.1\"]','[\"考试\",\"作业\"]'),(10,8,'高数','课程目标1',0,'asdadadada','adsadad','[\"选项1\",\"选项2\",\"选项3\",\"选项4\"]','[\"考试\",\"作业\"]'),(11,10,'编译原理','课程目标1',0,'啊哈三大件啊电大数据','鹅发啊是大大的','[\"指标点1.1\",\"指标点1.2\"]','[\"考试\",\"作业\"]'),(12,10,'编译原理','课程目标2',0,'掌握运用Python编程方法，能对连续信号和离散信号进行表示和运算；','掌握运用Python编程方法，能对连续信号和离散信号进行表示和运算；','[\"指标点1.1\",\"指标点5.2\"]','[\"考试\"]'),(13,10,'编译原理','课程目标3',0,'学习掌握Python语言和Python开发工具，能针对控制工程和电路系统中问题，进行系统分析、计算和设计。','学习掌握Python语言和Python开发工具，能针对控制工程和电路系统中问题，进行系统分析、计算和设计。','[\"指标点1.1\",\"指标点1.2\"]','[\"考试\",\"作业\"]'),(15,12,'信号与系统','课程目标1',0.2,'理解信号的特征、分类，理解系统的描述和分类，掌握信号的运算和连续时不变系统的性质和判断','通过课堂讲授、作业和考研题探讨方式，让学生理解和掌握信号、系统性质和运算','[\"1.1\"]','[\"考试\",\"作业\"]'),(16,12,'信号与系统','课程目标2',0.3,'掌握信号、线性系统的时域特征，建立电路等系统的时域数学模型，能应用时域分析方法（卷积积分）分析线性时不变系统','通过课堂讲授、作业和考研题探讨方式，让学生理解和掌握线性时不变系统的时域分析方法','[\"1.2\"]','[\"考试\",\"作业\"]'),(17,12,'信号与系统','课程目标3',0.3,'掌握信号、线性系统的频域特征，建立电路等系统的频域数学模型，能应用频域分析方法（傅里叶级数、傅里叶变换）分析线性时不变系统','通过课堂讲授、作业和考研题探讨方式，让学生理解和掌握线性时不变系统的频域分析方法','[\"1.2\"]','[\"考试\",\"作业\"]'),(18,12,'信号与系统','课程目标4',0.1,'掌握拉普拉斯变换，理解信号、系统的复频域特征，建立电路等系统的复频域数学模型，能应用复频域分析方法（拉普拉斯变换）分析线性时不变系统','通过课堂讲授、作业和考研题探讨方式，让学生理解和掌握线性时不变系统的s域分析方法','[\"1.2\"]','[\"考试\",\"作业\"]'),(19,12,'信号与系统','课程目标5',0.1,'掌握z变换，理解信号、系统的z域特征，建立电路等系统的z域数学模型，能应用z域分析方法分析离散线性时不变系统','通过课堂讲授、作业和考研题探讨方式，让学生理解和掌握线性时不变系统的z域分析方法','[\"1.2\"]','[\"考试\",\"作业\"]'),(22,7,'JAVA程序设计','课程目标1',0,'1','1','[\"指标点1.1\"]','[\"考试\"]'),(23,14,'test','课程目标1',0,'任务恶气万恶企鹅器','213123','[\"1.1\",\"1.2\",\"1.3\"]','[\"考试\",\"作业\"]'),(24,14,'test','课程目标2',0,'阿三发射的发挥好热吻','1231','[\"2.1\",\"1.2\",\"1.4\"]','[\"作业\",\"考试\"]'),(25,14,'test','课程目标3',0,'法尔二维二维二','1231','[\"1.2\",\"1.3\",\"1.4\"]','[\"考试\",\"作业\"]'),(26,14,'test','课程目标4',0,'费收费沙发上访问','大啊大','[\"1.1\",\"1.3\",\"1.4\"]','[\"作业\",\"考试\"]'),(27,14,'test','课程目标5',0,'大法官大概的个大概','ewef','[\"1.2\",\"2.1\",\"2.2\"]','[\"考试\",\"作业\"]'),(29,14,'C语言程序设计','课程目标6',0,'2131231哇塞大道','123','[\"1.1\",\"1.2\",\"1.3\",\"2.2\",\"2.1\",\"1.4\"]','[\"考试\",\"作业\"]');
/*!40000 ALTER TABLE `course_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_target_analyse`
--

DROP TABLE IF EXISTS `course_target_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_target_analyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `target_name` varchar(10) NOT NULL,
  `value` int(5) NOT NULL,
  `matrix` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_target_analyse`
--

LOCK TABLES `course_target_analyse` WRITE;
/*!40000 ALTER TABLE `course_target_analyse` DISABLE KEYS */;
INSERT INTO `course_target_analyse` VALUES (1,12,'指标点 1.1',17,'[true,true,false,true,false,true,false,false,false,false,false,false,false,false,false,true,false,false,false,true,true,false,false,false,false,false,false,false,false,false]'),(2,12,'指标点 1.2',82,'[false,false,true,false,true,false,true,false,true,true,true,true,true,true,true,false,true,true,true,false,false,true,true,true,true,true,true,true,true,true]'),(3,12,'指标点 2.1',26,'[false,false,false,false,false,false,false,false,false,true,true,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,false]'),(4,12,'课程目标1',17,'[true,true,false,true,false,true,false,false,false,false,false,false,false,false,false,true,false,false,false,true,true,false,false,false,false,false,false,false,false,false]'),(5,12,'课程目标2',22,'[false,false,true,false,false,false,true,true,false,false,false,false,false,false,false,false,false,false,false,true,false,true,true,false,false,false,false,false,false,true]'),(6,12,'课程目标3',42,'[false,false,false,false,true,false,false,false,true,false,false,true,true,false,true,false,true,true,true,true,false,false,false,true,true,true,true,false,false,false]'),(7,12,'课程目标4',19,'[false,false,false,false,false,false,false,false,false,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false]'),(8,12,'课程目标5',10,'[false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,true,false,false,false,false,false,false,false,false,true,false]'),(10,10,'指标点 1.1',77,'[true,true,true,false,false,true,true,false,false,true,true,true,false,true,true,false,true,true,true,true,false,true]'),(11,10,'指标点 2.1',63,'[true,false,false,true,true,false,false,true,true,false,true,true,true,false,false,true,true,false,true,false,true,false]'),(12,10,'课程目标1',71,'[true,true,true,true,false,true,true,true,true,false,true,true,true,true,false,false,true,true,false,true,true,false]'),(13,10,'课程目标2',75,'[true,true,true,false,true,false,true,true,true,true,false,true,true,true,false,true,true,false,true,true,false,true]'),(14,10,'课程目标3',29,'[false,true,true,false,false,false,false,false,false,false,false,false,false,true,true,false,true,true,false,false,false,true]'),(15,12,'指标点 1.3',0,'[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]'),(16,14,'指标点 1.1',36,'[true,true,false,true,false,false,false,false,false,false,true,false,true,true,true,false,true,false,true,false,true,false,false,false,false,false,false,true,false,true]'),(17,14,'指标点 1.2',56,'[false,false,true,false,true,true,true,true,true,false,true,true,true,false,false,true,true,true,false,true,true,true,false,false,true,true,false,false,true,false]'),(18,14,'指标点 1.3',54,'[true,true,true,true,true,true,true,false,false,false,false,true,false,true,false,true,true,false,false,true,false,true,false,false,false,true,true,false,true,true]'),(19,14,'指标点 1.4',56,'[true,true,true,false,false,false,true,false,false,true,true,true,true,false,true,false,true,true,true,true,true,false,true,true,false,true,true,false,false,false]'),(20,14,'指标点 2.1',44,'[true,false,false,true,true,true,true,false,false,false,false,true,true,true,false,true,false,false,true,false,false,false,false,true,true,false,true,true,false,false]'),(21,14,'指标点 2.2',36,'[true,false,true,true,false,true,true,false,false,false,false,false,false,true,true,true,false,true,false,false,false,true,true,false,false,false,false,false,true,false]'),(22,14,'课程目标1',60,'[true,false,false,true,true,true,true,false,false,true,true,true,true,true,true,true,true,true,false,true,false,true,false,false,false,true,true,false,true,true]'),(23,14,'课程目标2',18,'[true,true,false,false,false,true,true,false,false,false,false,false,false,true,true,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false]'),(24,14,'课程目标3',70,'[true,false,true,false,true,true,true,false,false,true,true,true,true,true,true,true,true,false,false,true,true,true,false,false,false,true,true,true,true,true]'),(25,14,'课程目标4',50,'[true,true,true,true,false,true,true,false,false,false,false,false,true,false,false,false,true,true,true,false,true,false,true,true,false,false,true,false,false,true]'),(26,14,'课程目标5',54,'[true,true,true,false,true,true,true,false,false,true,false,true,true,true,false,true,false,false,true,false,true,true,false,true,false,true,true,false,false,false]'),(27,14,'课程目标6',30,'[true,false,false,false,false,false,false,true,true,false,false,false,false,false,true,false,false,false,true,true,false,false,false,true,false,false,false,true,false,true]'),(28,1,'指标点 指标点1.1',28,'[true,true,true,true]'),(29,1,'指标点 指标点1.2',12,'[false,false,true,false]'),(30,1,'课程目标1',28,'[true,true,true,true]');
/*!40000 ALTER TABLE `course_target_analyse` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicator_outline`
--

LOCK TABLES `indicator_outline` WRITE;
/*!40000 ALTER TABLE `indicator_outline` DISABLE KEYS */;
INSERT INTO `indicator_outline` VALUES (1,'1.工程知识','能够将数学、自然科 学、工程基础和电子信息专业知识 用于解决复杂工程问题'),(2,'2.问题分析','能够应用数学、自然 科学和电子信息领域工程科学的 基本原理，识别、表达、并通过文 献研究分析复杂工程问题，以获得 有效结论'),(3,'3.设计/开发解决方案','能够设计针对电子信息领域复杂工程问题的解决方案'),(4,'4.研究','能够基于科学原理并采 用科学方法对电子信息领域复杂 工程问题进行研究，包括设计实 验、分析与解释数据、并通过信息 综合得到合理有效的结论'),(5,'5.使用现代工具','能够针对电子信 息领域复杂工程问题，开发、选择 与使用恰当的技术、资源、现代工 程工具和信息技术工具，包括对复 杂工程问题的预测与模拟'),(6,'6.工程与社会','能够基于电子信息 工程相关背景知识进行合理分析， 评价电子信息专业工程实践和复 杂工程问题解决方案对社会、健 康、安全、法律以及文化的影响， 并理解应承担的责任'),(7,'7.环境和可持续发展','能够理解和 评价针对电子信息领域复杂工程 问题的工程实践对环境、社会可持 续发展的影响'),(8,'8.职业规范','具有人文社会科学素 养、社会责任感，能够在电子信息 领域工程实践中理解并遵守工程 职业道德和规范，履行责任'),(9,'9.个人和团队','能够在电子信息等 多学科背景下的团队中承担个体、 团队成员以及负责人的角色'),(10,'10.沟通','能够就复杂工程问题与 电子信息业界同行及社会公众进 行有效沟通和交流'),(11,'11.项目管理','理解并掌握电子信 息工程管理原理与经济决策方 法，并能在多学科环境中应用'),(12,'12.终身学习','具有自主学习和终 身学习的意识，有不断学习和适应 电子信息领域发展的能力');
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
  `courses` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indicator_name` (`indicator_name`),
  KEY `指标点索引外键` (`indicator_index`),
  CONSTRAINT `指标点索引外键` FOREIGN KEY (`indicator_index`) REFERENCES `indicator_outline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (5,1,'1.1','掌握数学、自然科学、工程基础和电子信息专业知识的基本概念，并将其运用到复杂工程问题的适当表述之中','信息与智能工程系','高等数学A、线性代数A、大学物理、复变函数、概率论与数理统计B、离散数学、电子信息工程导论、自动控制原理'),(6,1,'1.2','针对一个复杂系统或者过程选择恰当的数学模型，对模型正确性进行严谨的推理，并能正确求解','信息与智能工程系','电路分析、模拟电子技术、 数字电子技术、自动控制原理、信号与系统、数字信号处理'),(8,1,'1.3','运用数学、自然科学、工程基础和电子 信息专业知识推演、分析复杂工程问题','信息与智能工程系','高等数学A、线性代数A、大学物理、 概率论与数理统计B、电路分析、信号与系统'),(9,1,'1.4','通过数学、自然科学、工程基础和电子 信息专业知识角度所建立的模型的分析，对复杂工程问题的解决方案进行分析和比较，并尝试改进','信息与智能工程系','数字信号处理、单片机原理与接口技术、高频电子线路、信号系统设计、数学建模与仿真、计算机组成原理、传感器技术与应用'),(10,2,'2.1','能运用数学、自然科学和电子信息领域的 基本原理，识别和判断电子信息领域复杂工 程问题的关键环节','信息与智能工程系','电路分析、模拟电子技术、数字电子技术、 信号与系统、单片机原理与接口技术、高频电子线路、通信原理'),(11,2,'2.2','能基于数学、自然科学和电子信息领域的 基本原理，并建立数学模型，正确表达电子 信息领域复杂工程问题','信息与智能工程系','高等数学A、线性代数A、大学物理、 概率论与数理统计B、数字信号处理、机器学习、 信号系统设计、可编程器件开发EDA'),(12,2,'2.3','掌握电子信息领域工程分析的基本方 法，能认识到解决问题有多种方案可选择，并通过文献研究寻求适合的解决方案','信息与智能工程系','大学外语、专业英语、 嵌入式系统、语音信号处理、数字图像处理、可编程器件开发EDA\r传感器技术与应用'),(13,2,'2.4','能够运用数学、自然科学和电子信息领域的基本原理，借助文献研究，分析复杂工程所存在的影响因素，并获得有效结论','信息与智能工程系','大学物理、通信原理、嵌入式系统、高频电子线路、语音信号处理、数字图像处理、自动控制原理'),(14,3,'3.1','掌握电子信息领域工程设计和产品开发 全周期、全流程的基本设计/开发方法和技 术，了解影响设计目标和技术方案的各种因素','信息与智能工程系','嵌入式系统实习、电子电工及仿真综合实习、传感器技术与应用\r'),(15,3,'3.2','能针对电子信息领域工程设计和产品的 特定需求，能够通过建模进行信息处理系统 及单元的参数计算，设计开发控制方案、系统资源、应用软件等','信息与智能工程系','高等数学A、电路分析、模拟电子技术、物联网技术、通信原理、 C语言程序设计、python语言程序设计、数字信号处理实习、传感器技术与应用'),(16,3,'3.3','能够对电子信息领域工程设计和产品进行系统方案或工艺流程设计，并在设计中体现创新意识','信息与智能工程系','数字电子技术、高频电子线路、机器学习、数字信号处理、随机信号处理、嵌入式系统综合设计、毕业设计（论文）'),(17,3,'3.4','能够在电子信息领域工程和产品设计中考虑安全、健康、法律、文化及环境等制约 因素的影响','信息与智能工程系','思想道德修养与法律基础、思想政治理论 研讨课、习近平新时代中国特色社会主义 思想概论、大学生心理健康教育、体育 电子信息工程专业导论、军事训练'),(18,4,'4.1','能够基于电子信息领域科学原理，通过文献研究或相关方法，调研和分析复杂工程问题的解决方案','信息与智能工程系','机器学习、语音信号处理、数字图像处理、、毕业实习、信号采集系统设计综合实习、电子信息系统设计综合实习'),(19,4,'4.2','能够根据电子信息领域复杂工程问题的 对象特征，选择研究路线，设计实验方案','信息与智能工程系','通信原理、高频电子线路、嵌入式系统原理、数字系统设计、大学物理实验'),(20,4,'4.3','能够根据电子信息领域复杂工程问题的实验方案构建实验系统，采用科学方法，安 全地开展实验，正确的采集实验数据','信息与智能工程系','语音信号处理、C语言程序序设计实习、电子电工及仿真综合实习、FPGA 综合设计、嵌入式系统实习、数字信 号处理课程设计、传感器技术与应用'),(21,4,'4.4','能够对实验结果进行分析和解释，并通过信息综合得到合理有效的结论','信息与智能工程系','大学物理实验、电路分析实验'),(22,5,'5.1','了解专业常用的电子测量仪器、信息技 术工具和模拟软件的使用原理和方法，并理 解其局限性','信息与智能工程系','大学物理、电子信息工程专业导论、单片机原理与接口技术'),(23,5,'5.2','能够针对复杂工程问题，选择与使用电 子信息领域的恰当技术手段和现代工程工 具进行分析、计算和设计','信息与智能工程系','大学物理、线性代数A、电路分析实习、信号与系统实习、数字信号处理、语音信号处理、数字系统设计、自动控制原理'),(24,5,'5.3','能够针对具体对象，开发或选用满足特 定需求的现代工具，模拟和预测电子信息领域出现的问题，并分析其局限性','信息与智能工程系','高等数学A、C语言程序设计训练、、嵌入式系统实习、 python程序设计、电子电工及仿真综合实习'),(25,6,'6.1','能够通过工程实习和社会实践经历获得 电子信息工程背景知识，熟悉与电子信息工 程相关的技术标准、知识产权、产业政策','信息与智能工程系','中国近现代史纲要、电子信息工程专业导论、电子信息系统设计综合实习、、毕业实习及毕业设计（论文）'),(26,6,'6.2','能够识别、分析、评价电子信息行业的 新技术、新设备的开发和应用对社会、健康、 安全、法律以及文化的影响','信息与智能工程系','体育、军事理论、军事训练、思想道德修 养与法律基础、大学生心理健康教育、电子信息工程专业导论'),(27,7,'7.1','知晓和理解电子信息复杂工程对环境保 护和可持续发展的理念和内涵的影响，并熟 悉环境保护的相关法律法规','信息与智能工程系','习近平新时代中国特色社会主义思想概论、思想道德修养与法律基础、大学生心理健康教育、高频电子线路、毕业实习'),(28,7,'7.2','能够站在环境保护和可持续发展的角 度，思考电子信息工程实践的可持续性，评 价产品周期中可能对人类和环境造成的损 害和隐患','信息与智能工程系','马克思主义基本原理、毛泽东思想和中国 特色社会主义理论体系概论、中国近现代 史纲要、电子信息工程专业导论'),(29,8,'8.1','热爱祖国，理解社会主义核心价值观， 了解中国国情，具有推动民族复兴和社会进 步的社会责任感','信息与智能工程系','马克思主义基本原理、毛泽东思想和中国 特色社会主义理论体系概论、习近平新时 代中国特色社会主义思想概论、思想道德 修养与法律基础、中国近现代史纲要'),(30,8,'8.2','理解诚实公正、诚信守则的电子信息工 程职业道德和规范，并能在工程实践中自觉 遵守','信息与智能工程系','思想道德修养与法律基础、军事训练、毛 泽东思想和中国特色社会主义理论体系概 论、马克思主义基本原理'),(31,8,'8.3','理解工程师对公众的安全、健康和福祉， 以及环境保护的社会责任，能够在工程实践 中自觉履行责任','信息与智能工程系','军事理论、电子信息工程专业导论、大学生心理健康教育、思想政治理论研讨课、毕业实习'),(32,9,'9.1','能够理解个人与团队的关系，理解团队 合作的意义，能主动与电子信息学科及其他 学科的成员合作开展工作','信息与智能工程系','毛泽东思想和中国特色社会主义理论体系 概论、习近平新时代中国特色社会主义思 想概论、军事理论、思想道德修养与法律 基础、大学生心理健康教育、体育'),(33,9,'9.2','作为成员，能够独立或合作完成团队分 配的任务，共同推进团队工作的实施','信息与智能工程系','军事训练、思想政治理论研讨课、工程实习'),(34,9,'9.3','作为负责人，能够在团队中承担领导责 任，能够倾听其他团队成员的意见，组织协 调各成员的工作，实现团队目标','信息与智能工程系','电子电工及仿真综合实习、可编程器件开发EDA实习、嵌入式系统综合设计、毕业设 计（论文）'),(35,10,'10.1','能够通过书面报告和口头陈述清晰地 表达电子信息复杂工程问题的解决方案、过程和结果，并能理解业界同行及社会公众的 质疑和建议','信息与智能工程系','传感器技术与应用（作品答辩）、电子信息系统设计综合实习、毕业实习'),(36,10,'10.2','了解电子信息工程专业领域的国际发 展趋势、研究热点，理解和尊重世界不同文化的差异性和多样性','信息与智能工程系','军事理论、电子信息工程专业导论、中国近现代史纲要、 物联网技术、机器学习、通信原理'),(37,10,'10.3','通过阅读国内外技术文献、参加学术 讲座、学生互访等环节，理解不同文化、技 术行为之间的差异，能够在跨文化背景下进 行沟通和交','信息与智能工程系','大学外语、专业英语、思想政治理论研讨 课、生产实习、毕业设计（论文）'),(38,11,'11.1','掌握技术方案的经济分析与决策方法 等相关知识，了解工程项目的成本构成，理 解相关的工程管理和经济决策','信息与智能工程系','马克思主义基本原理、毛泽东思想和中国 特色社会主义理论体系概论、习近平新时 代中国特色社会主义思想概论、概率论与 数理统计'),(39,11,'11.2','理解电子信息领域的工程及产品全周 期、全流程的成本构成，理解其中涉及的工 程管理与经济决策问题','信息与智能工程系','工程实习、 电子线路综合设计、'),(40,11,'11.3','能在电子信息工程领域相关学科环境 下，在设计开发解决方案的过程中，运用工 程管理与经济决策方法','信息与智能工程系','高频电子线路课程设计、数字信号处理课 程设计、嵌入式系统综合设计、工程实践、毕业实习及毕业设计（论文）'),(41,12,'12.1','认识不断探索和学习的必要性，具有自 主学习和终身学习的意识。掌握自主学习的 方法，了解拓展知识和能力的途径','信息与智能工程系','毛泽东思想和中国特色社会主义理论体系 概论、习近平新时代中国特色社会主义思 想概论、专业导论、思想道德修养与法律 基础、大学外语'),(42,12,'12.2','具有自主学习的能力，包括对技术问 题的理解能力，归纳总结能力和提出问题的 能力，适应电子信息领域发展','信息与智能工程系','马克思主义基本原理、政治思想理论研讨 课、军事理论、专业英语 毕业设计（论文）');
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
  `score` double DEFAULT '0',
  `score_details` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`final_score_id`),
  KEY `学生期末成绩表关联学生信息表` (`student_id`),
  CONSTRAINT `学生期末成绩表关联学生信息表` FOREIGN KEY (`student_id`) REFERENCES `student_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_final_score`
--

LOCK TABLES `student_final_score` WRITE;
/*!40000 ALTER TABLE `student_final_score` DISABLE KEYS */;
INSERT INTO `student_final_score` VALUES (3,129,64,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"20\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"4\"]]'),(4,130,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(5,131,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(6,132,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(7,133,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(8,134,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(9,135,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(10,136,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(11,137,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(12,138,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(13,139,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(14,140,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(15,141,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(16,142,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(17,143,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(18,144,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(19,145,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(20,146,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(23,149,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(24,150,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(25,151,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(26,152,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(27,153,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(28,154,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(29,155,46,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"3\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"3\"]]'),(65,127,162,'[[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\"],[\"4\",\"4\",\"4\",\"44\",\"4\"],[\"4\",\"44\",\"4\",\"4\",\"4\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\"]]'),(66,128,70,'[[\"22\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\"]]'),(110,268,75,'[[\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"0\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"5\",\"3\",\"0\"]]'),(111,269,94.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"10\",\"5\",\"3.5\"]]'),(112,270,71,'[[\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"1\",\"1\",\"2\",\"1\"],[\"4\",\"4\",\"4\",\"5\",\"6\",\"5\",\"4\",\"5\",\"3\",\"0\"]]'),(113,271,47.5,'[[\"2\",\"0\",\"2\",\"0\",\"0\"],[\"2\",\"0\",\"2\",\"0\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"1\",\"0\",\"1\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"1.5\",\"3\",\"0\"]]'),(114,272,78,'[[\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"0\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"8\",\"3\",\"0\"]]'),(115,273,76,'[[\"2\",\"0\",\"2\",\"2\",\"0\"],[\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"2\",\"0\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"10\",\"3\",\"2\"]]'),(116,274,51.1,'[[\"2\",\"0\",\"2\",\"0\",\"0\"],[\"2\",\"0\",\"2\",\"0\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"1\",\"0\",\"1\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"5.1\",\"3\",\"0\"]]'),(117,275,53.5,'[[\"2\",\"0\",\"2\",\"2\",\"0\"],[\"2\",\"0\",\"2\",\"0\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"1\",\"0\",\"1\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"5.5\",\"3\",\"0\"]]'),(118,276,67.5,'[[\"2\",\"0\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"2\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"5\",\"6\",\"3\",\"4\",\"5.5\",\"3\",\"0\"]]'),(119,277,91.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"7\",\"5\",\"3.5\"]]'),(120,278,43,'[[\"2\",\"0\",\"2\",\"2\",\"0\"],[\"2\",\"0\",\"2\",\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"1\",\"1\",\"1\",\"0\",\"0\"],[\"2\",\"2\",\"4\",\"3\",\"3\",\"3\",\"3\",\"2\",\"0\",\"0\"]]'),(121,279,81.5,'[[\"2\",\"2\",\"2\",\"0\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"1\",\"1\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"7.5\",\"3\",\"2\"]]'),(122,280,54.5,'[[\"0\",\"0\",\"2\",\"2\",\"0\"],[\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"2\"],[\"2\",\"1\",\"1\",\"2\",\"2\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"3.5\",\"1\",\"0\"]]'),(123,281,68,'[[\"2\",\"0\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"2\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"5\",\"6\",\"3\",\"4\",\"6\",\"3\",\"0\"]]'),(124,282,57.5,'[[\"2\",\"0\",\"2\",\"2\",\"2\"],[\"2\",\"0\",\"2\",\"2\",\"0\",\"0\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"1\",\"0\",\"2\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"6.5\",\"3\",\"0\"]]'),(125,283,79.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"0\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"7.5\",\"3\",\"0\"]]'),(126,284,73,'[[\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"1\",\"1\",\"2\",\"1\"],[\"4\",\"4\",\"4\",\"5\",\"6\",\"5\",\"4\",\"5\",\"3\",\"0\"]]'),(127,285,54,'[[\"2\",\"0\",\"2\",\"0\",\"0\"],[\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"2\"],[\"2\",\"1\",\"1\",\"2\",\"2\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"3\",\"1\",\"0\"]]'),(128,286,33.5,'[[\"0\",\"0\",\"2\",\"2\",\"0\"],[\"0\",\"0\",\"2\",\"0\",\"2\",\"0\",\"2\",\"0\",\"2\",\"0\"],[\"1\",\"1\",\"1\",\"0\",\"0\"],[\"2\",\"2\",\"2\",\"3\",\"2\",\"3\",\"3\",\"1.5\",\"0\",\"0\"]]'),(129,287,60,'[[\"2\",\"0\",\"2\",\"2\",\"2\"],[\"2\",\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"0\",\"2\",\"0\"],[\"2\",\"1\",\"2\",\"0\",\"2\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"6\",\"3\",\"0\"]]'),(130,288,35.5,'[[\"2\",\"0\",\"2\",\"2\",\"0\"],[\"0\",\"0\",\"2\",\"0\",\"2\",\"0\",\"2\",\"0\",\"2\",\"0\"],[\"1\",\"1\",\"1\",\"0\",\"0\"],[\"2\",\"2\",\"2\",\"3\",\"2\",\"3\",\"3\",\"1.5\",\"0\",\"0\"]]'),(131,289,65,'[[\"2\",\"2\",\"2\",\"0\",\"2\"],[\"2\",\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"0\"],[\"2\",\"1\",\"2\",\"1\",\"2\"],[\"3\",\"3\",\"4\",\"4\",\"7\",\"4\",\"4\",\"6\",\"0\",\"2\"]]'),(132,290,58,'[[\"2\",\"0\",\"0\",\"2\",\"2\"],[\"2\",\"0\",\"2\",\"2\",\"0\",\"0\",\"2\",\"0\",\"2\",\"2\"],[\"2\",\"2\",\"1\",\"0\",\"2\"],[\"2\",\"2\",\"4\",\"3\",\"6\",\"3\",\"4\",\"6\",\"3\",\"0\"]]'),(133,291,87,'[[\"2\",\"2\",\"2\",\"0\",\"2\"],[\"0\",\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"1\",\"2\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"12\",\"3\",\"3\"]]'),(134,292,62.5,'[[\"2\",\"2\",\"2\",\"0\",\"2\"],[\"2\",\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"0\"],[\"2\",\"1\",\"1\",\"1\",\"2\"],[\"3\",\"3\",\"4\",\"4\",\"5.5\",\"4\",\"4\",\"6\",\"0\",\"2\"]]'),(135,293,74,'[[\"0\",\"2\",\"2\",\"2\",\"0\"],[\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"1\",\"2\",\"0\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"7\",\"5\",\"4\",\"10\",\"3\",\"2\"]]'),(136,294,79,'[[\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"0\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"8\",\"3\",\"1\"]]'),(137,295,80.5,'[[\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"0\"],[\"2\",\"2\",\"1\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"8.5\",\"3\",\"1\"]]'),(138,296,75,'[[\"0\",\"2\",\"2\",\"2\",\"2\"],[\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"1\",\"2\",\"1\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"7\",\"5\",\"4\",\"8\",\"3\",\"2\"]]'),(139,297,74,'[[\"0\",\"2\",\"2\",\"2\",\"2\"],[\"0\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\",\"0\"],[\"1\",\"2\",\"2\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"6\",\"5\",\"4\",\"7\",\"2\",\"3\"]]'),(140,298,70,'[[\"2\",\"2\",\"2\",\"0\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"2\",\"0\",\"2\"],[\"2\",\"1\",\"2\",\"1\",\"2\"],[\"3\",\"3\",\"4\",\"4\",\"7\",\"4\",\"4\",\"6\",\"1\",\"2\"]]'),(141,299,23.5,'[[\"0\",\"0\",\"2\",\"2\",\"0\"],[\"0\",\"0\",\"2\",\"0\",\"2\",\"0\",\"2\",\"0\",\"0\",\"0\"],[\"1\",\"1\",\"1\",\"0\",\"0\"],[\"2\",\"0\",\"2\",\"2\",\"0\",\"0\",\"3\",\"1.5\",\"0\",\"0\"]]'),(142,300,74.5,'[[\"0\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"0\",\"2\",\"2\",\"2\",\"2\",\"0\",\"2\",\"0\",\"0\"],[\"2\",\"2\",\"2\",\"2\",\"1\"],[\"4\",\"5\",\"4\",\"6\",\"8\",\"5\",\"4\",\"5.5\",\"3\",\"1\"]]'),(143,363,61,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"4\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\"]]'),(144,364,58,'[[\"2\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(145,365,57.5,'[[\"1\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(146,366,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(147,367,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(148,368,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(149,369,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(150,370,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(151,371,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(152,372,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(153,373,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(154,374,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(155,375,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(156,376,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(157,377,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(158,378,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(159,379,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(160,380,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(161,381,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(162,382,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(163,383,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(164,384,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(165,385,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(166,386,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(167,387,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(168,388,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(169,389,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(170,390,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(171,391,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(172,392,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(173,393,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(174,394,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(175,395,63,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"4\",\"1\"]]'),(176,396,44.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(177,397,44.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(178,398,44.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"0.5\",\"0.5\",\"0.5\",\"0.5\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(179,399,46.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(180,400,46.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(181,401,46.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(182,402,46.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(183,403,46.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(184,404,46.5,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\"]]'),(185,405,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(186,406,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(187,407,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(188,408,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(189,409,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(190,410,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(191,411,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(192,412,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(193,413,47,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1.5\"]]'),(194,414,56,'[[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\"],[\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1.5\",\"1\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(195,415,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(196,416,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(197,417,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(198,418,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(199,419,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(200,420,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(201,421,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(202,422,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(203,423,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]'),(204,424,64.5,'[[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"2\"],[\"2\",\"2\",\"2\",\"2\",\"2\",\"2\",\"1\",\"1\",\"1\",\"1\"],[\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"3\",\"1.5\"]]');
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
  `password` varchar(16) DEFAULT '000000',
  `student_name` varchar(10) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL,
  `comprehensive_score` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `课程信息和学生信息关联` (`course_id`),
  CONSTRAINT `课程信息和学生信息关联` FOREIGN KEY (`course_id`) REFERENCES `course_basic_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_information`
--

LOCK TABLES `student_information` WRITE;
/*!40000 ALTER TABLE `student_information` DISABLE KEYS */;
INSERT INTO `student_information` VALUES (127,'24242','000000','张三十','计科2020',10,85.3),(128,'202020111922','000000','张三丰','计科20202',10,35.7),(129,'20171151052','000000','王璇凯','计科2020',10,34.4),(130,'20201122','000000','陈明鹤子','电子信息工程2020',10,26.6),(131,'20201152056','000000','ygw','qwqwqw',10,25.2),(132,'20201152088','000000','张三','计科2020',10,23.7),(133,'231','000000','王武','计科2020',10,23.7),(134,'23121','000000','李四','123',10,23.7),(135,'1231','000000','王小强','计科2020',10,23.7),(136,'20201152058','000000','阳光伟','计科2020',10,23.7),(137,'12311111','000000','123','123',10,23.7),(138,'20201152066','000000','杨小姐','计科2020',10,23.7),(139,'20202116798','000000','黄金时代','212100',10,23.7),(140,'123','000000','123','123',10,23.7),(141,'123131313123','000000','12313','1231',10,23.7),(142,'20201155577','000000','雅加达','接口1001',10,23.7),(143,'12132313','000000','张老师','咳咳阿三202',10,23.7),(144,'3922834923892','000000','啊哈大将','678',10,23.7),(145,'1231231','000000','231321','3123123',10,23.7),(146,'123123','000000','1231231','31231231',10,23.7),(149,'221111290','000000','zhsjaj','1212kasjk',10,23.7),(150,'242422020222','000000','张三三十三','计科2020',10,39.8),(151,'201711510522','000000','王璇凯','计科2020',10,23.7),(152,'202011222222','000000','陈明鹤子','电子信息工程2020',10,23.7),(153,'202011520562','000000','ygw','qwqwqw',10,23.7),(154,'202011520881','000000','张三','计科2020',10,23.7),(155,'231238293333','000000','王武','计科2020',10,23.7),(268,'20201151002','000000','陈明鹤','电子信息工程2020',12,74.1),(269,'20201151006','000000','王凤云','电子信息工程2020',12,87.8),(270,'20201151008','000000','赵国安','电子信息工程2020',12,71.3),(271,'20201151010','000000','李煜泽','电子信息工程2020',12,54.8),(272,'20201151014','000000','李四','电子信息工程2020',12,76.2),(273,'20201151016','000000','张正昇','电子信息工程2020',12,74.8),(274,'20201151018','000000','尹翔民','电子信息工程2020',12,57.5),(275,'20201151022','000000','王小龙','电子信息工程2020',12,59.1),(276,'20201151024','000000','李志伟','电子信息工程2020',12,68.9),(277,'20201151026','000000','张三','电子信息工程2020',12,85.8),(278,'20201151027','000000','李一书','电子信息工程2020',12,51.7),(279,'20201151030','000000','明念坤','电子信息工程2020',12,78.7),(280,'20201151032','000000','王春明','电子信息工程2020',12,59.8),(281,'20201151034','000000','沐里施奇','电子信息工程2020',12,69.4),(282,'20201151036','000000','杨旺','电子信息工程2020',12,61.9),(283,'20201151038','000000','李建香','电子信息工程2020',12,77.3),(284,'20201151040','000000','范诚','电子信息工程2020',12,72.9),(285,'20201151044','000000','王翰轩','电子信息工程2020',12,59.4),(286,'20201151046','000000','胡源涛','电子信息工程2020',12,44.9),(287,'20201151048','000000','柳成飞','电子信息工程2020',12,63.8),(288,'20201151050','000000','刘浦','电子信息工程2020',12,46.5),(289,'20201151052','000000','朱恒','电子信息工程2020',12,70),(290,'20201151054','000000','金晶','电子信息工程2020',12,62.2),(291,'20201151056','000000','何友啸','电子信息工程2020',12,82.5),(292,'20201151058','000000','宗维鑫','电子信息工程2020',12,68.2),(293,'20201151060','000000','计骁洋','电子信息工程2020',12,73.4),(294,'20201151062','000000','程阴羽','电子信息工程2020',12,77.1),(295,'20201151064','000000','张涛','电子信息工程2020',12,81),(296,'20201151066','000000','谷静杭','电子信息工程2020',12,74.1),(297,'20201151068','000000','王鑫杰','电子信息工程2020',12,73.4),(298,'20201151070','000000','张玉明','电子信息工程2020',12,70.6),(299,'20201151072','000000','陈骋','电子信息工程2020',12,38.1),(300,'20201151074','000000','施权峰','电子信息工程2020',12,73.8),(363,'20181154003','000000','袁典','电子科学与技术2018',14,72.7),(364,'20221161001','000000','段明','电子信息工程2022(专升本)班',14,70.9),(365,'20221161002','000000','段立明','电子信息工程2022(专升本)班',14,70.9),(366,'20221161003','000000','赵云芳','电子信息工程2022(专升本)班',14,75),(367,'20221161004','000000','刘志雄','电子信息工程2022(专升本)班',14,75.3),(368,'20221161005','000000','马美浩','电子信息工程2022(专升本)班',14,75.6),(369,'20221161006','000000','韩军城','电子信息工程2022(专升本)班',14,75.9),(370,'20221161007','000000','侯贵梅','电子信息工程2022(专升本)班',14,76.2),(371,'20221161008','000000','李鹏','电子信息工程2022(专升本)班',14,76.5),(372,'20221161009','000000','李春增','电子信息工程2022(专升本)班',14,76.8),(373,'20221161010','000000','陈东','电子信息工程2022(专升本)班',14,77.1),(374,'20221161011','000000','段云富','电子信息工程2022(专升本)班',14,77.4),(375,'20221161012','000000','范海金','电子信息工程2022(专升本)班',14,77.7),(376,'20221161013','000000','冯志鑫','电子信息工程2022(专升本)班',14,78),(377,'20221161014','000000','施龙飞','电子信息工程2022(专升本)班',14,78.3),(378,'20221161015','000000','陈元丽','电子信息工程2022(专升本)班',14,78.6),(379,'20221161016','000000','艾迅','电子信息工程2022(专升本)班',14,78.9),(380,'20221161017','000000','杨鸿瑞','电子信息工程2022(专升本)班',14,79.2),(381,'20221161018','000000','李翟','电子信息工程2022(专升本)班',14,79.5),(382,'20221161019','000000','查维斯','电子信息工程2022(专升本)班',14,79.8),(383,'20221161020','000000','赵培磊','电子信息工程2022(专升本)班',14,80.1),(384,'20221161021','000000','伯年宗','电子信息工程2022(专升本)班',14,71.1),(385,'20221161022','000000','梅跃何','电子信息工程2022(专升本)班',14,71.4),(386,'20221161023','000000','于玥','电子信息工程2022(专升本)班',14,71.7),(387,'20221161024','000000','王瑞','电子信息工程2022(专升本)班',14,72),(388,'20221161025','000000','李露','电子信息工程2022(专升本)班',14,72.3),(389,'20221161026','000000','张炆冉','电子信息工程2022(专升本)班',14,72.6),(390,'20221161027','000000','高赫','电子信息工程2022(专升本)班',14,72.9),(391,'20221161028','000000','苏洋','电子信息工程2022(专升本)班',14,73.2),(392,'20221161029','000000','歹訢力','电子信息工程2022(专升本)班',14,73.5),(393,'20221161030','000000','徐华键','电子信息工程2022(专升本)班',14,73.8),(394,'20221161031','000000','张昌雅','电子信息工程2022(专升本)班',14,74.1),(395,'20221161032','000000','姚亮','电子信息工程2022(专升本)班',14,74.4),(396,'20221161033','000000','雷峥','电子信息工程2022(专升本)班',14,61.8),(397,'20221161034','000000','黄海','电子信息工程2022(专升本)班',14,62.1),(398,'20221161035','000000','肖昌苑','电子信息工程2022(专升本)班',14,62.4),(399,'20221161036','000000','线国强','电子信息工程2022(专升本)班',14,64.1),(400,'20221161037','000000','王磊','电子信息工程2022(专升本)班',14,64.4),(401,'20221161038','000000','熊天云','电子信息工程2022(专升本)班',14,64.7),(402,'20221161039','000000','陈爱权','电子信息工程2022(专升本)班',14,65),(403,'20221161040','000000','胡国平','电子信息工程2022(专升本)班',14,65.3),(404,'20221161041','000000','樊奉武','电子信息工程2022(专升本)班',14,65.6),(405,'20221161042','000000','叶泽','电子信息工程2022(专升本)班',14,66.2),(406,'20221161043','000000','吴礼鹏','电子信息工程2022(专升本)班',14,66.5),(407,'20221161045','000000','李星星','电子信息工程2022(专升本)班',14,66.8),(408,'20221161046','000000','赵双林','电子信息工程2022(专升本)班',14,67.1),(409,'20221161047','000000','蒲懿缤','电子信息工程2022(专升本)班',14,67.4),(410,'20221161048','000000','鲁爽','电子信息工程2022(专升本)班',14,67.7),(411,'20221161049','000000','禹泉','电子信息工程2022(专升本)班',14,68),(412,'20221161050','000000','王张清','电子信息工程2022(专升本)班',14,62.9),(413,'20221161051','000000','姚程曦','电子信息工程2022(专升本)班',14,63.2),(414,'20221161052','000000','李石飞','电子信息工程2022(专升本)班',14,69.8),(415,'20221161053','000000','杨鹏翔','电子信息工程2022(专升本)班',14,76.1),(416,'20221161054','000000','普雅思','电子信息工程2022(专升本)班',14,76.4),(417,'20221161055','000000','农永东','电子信息工程2022(专升本)班',14,76.7),(418,'20221161056','000000','彭志华','电子信息工程2022(专升本)班',14,77),(419,'20221161057','000000','张海峰','电子信息工程2022(专升本)班',14,77.3),(420,'20221161058','000000','杨雄埸','电子信息工程2022(专升本)班',14,77.6),(421,'20221161059','000000','马荣碧','电子信息工程2022(专升本)班',14,77.9),(422,'20221161060','000000','李田闰','电子信息工程2022(专升本)班',14,78.2),(423,'20221161061','000000','冯云川','电子信息工程2022(专升本)班',14,78.5),(424,'20221161062','000000','刘登','电子信息工程2022(专升本)班',14,78.8);
/*!40000 ALTER TABLE `student_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usual_score`
--

DROP TABLE IF EXISTS `student_usual_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usual_score` (
  `usual_score_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` double DEFAULT '0',
  `score_details` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`usual_score_id`),
  KEY `学生平时成绩表关联学生信息表` (`student_id`),
  CONSTRAINT `学生平时成绩表关联学生信息表` FOREIGN KEY (`student_id`) REFERENCES `student_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usual_score`
--

LOCK TABLES `student_usual_score` WRITE;
/*!40000 ALTER TABLE `student_usual_score` DISABLE KEYS */;
INSERT INTO `student_usual_score` VALUES (77,127,18,'[\"6\",\"6\",\"6\"]'),(78,128,3,'[\"1\",\"1\",\"1\"]'),(79,129,10,'[\"2\",\"4\",\"4\"]'),(80,130,15,'[\"5\",\"5\",\"5\"]'),(81,131,9,'[\"3\",\"3\",\"3\"]'),(82,132,3,'[\"1\",\"1\",\"1\"]'),(83,133,3,'[\"1\",\"1\",\"1\"]'),(84,134,3,'[\"1\",\"1\",\"1\"]'),(85,135,3,'[\"1\",\"1\",\"1\"]'),(86,136,3,'[\"1\",\"1\",\"1\"]'),(87,137,3,'[\"1\",\"1\",\"1\"]'),(88,138,3,'[\"1\",\"1\",\"1\"]'),(89,139,3,'[\"1\",\"1\",\"1\"]'),(90,140,3,'[\"1\",\"1\",\"1\"]'),(91,141,3,'[\"1\",\"1\",\"1\"]'),(92,142,3,'[\"1\",\"1\",\"1\"]'),(93,143,3,'[\"1\",\"1\",\"1\"]'),(94,144,3,'[\"1\",\"1\",\"1\"]'),(95,145,3,'[\"1\",\"1\",\"1\"]'),(96,146,3,'[\"1\",\"1\",\"1\"]'),(99,149,3,'[\"1\",\"1\",\"1\"]'),(100,150,70,'[\"10\",\"20\",\"40\"]'),(101,151,3,'[\"1\",\"1\",\"1\"]'),(102,152,3,'[\"1\",\"1\",\"1\"]'),(103,153,3,'[\"1\",\"1\",\"1\"]'),(104,154,3,'[\"1\",\"1\",\"1\"]'),(105,155,3,'[\"1\",\"1\",\"1\"]'),(211,268,72,'[\"20\",\"20\",\"21\",\"11\"]'),(212,269,72,'[\"20\",\"20\",\"21\",\"11\"]'),(213,270,72,'[\"20\",\"20\",\"21\",\"11\"]'),(214,271,72,'[\"20\",\"20\",\"21\",\"11\"]'),(215,272,72,'[\"20\",\"20\",\"21\",\"11\"]'),(216,273,72,'[\"20\",\"20\",\"21\",\"11\"]'),(217,274,72.5,'[\"20.5\",\"20\",\"21\",\"11\"]'),(218,275,72,'[\"20\",\"20\",\"21\",\"11\"]'),(219,276,72,'[\"20\",\"20\",\"21\",\"11\"]'),(220,277,72.5,'[\"20\",\"20.5\",\"21\",\"11\"]'),(221,278,72,'[\"20\",\"20\",\"21\",\"11\"]'),(222,279,72,'[\"20\",\"20\",\"21\",\"11\"]'),(223,280,72,'[\"20\",\"20\",\"21\",\"11\"]'),(224,281,72.5,'[\"20.5\",\"20\",\"21\",\"11\"]'),(225,282,72,'[\"20\",\"20\",\"21\",\"11\"]'),(226,283,72,'[\"20\",\"20\",\"21\",\"11\"]'),(227,284,72.5,'[\"20\",\"20.5\",\"21\",\"11\"]'),(228,285,72,'[\"20\",\"20\",\"21\",\"11\"]'),(229,286,71.5,'[\"20\",\"20\",\"20.5\",\"11\"]'),(230,287,72.5,'[\"20.5\",\"20\",\"21\",\"11\"]'),(231,288,72,'[\"20\",\"20\",\"21\",\"11\"]'),(232,289,81.5,'[\"20\",\"20\",\"21\",\"20.5\"]'),(233,290,72,'[\"20\",\"20\",\"21\",\"11\"]'),(234,291,72,'[\"20\",\"20\",\"21\",\"11\"]'),(235,292,81.5,'[\"20\",\"20\",\"21\",\"20.5\"]'),(236,293,72,'[\"20\",\"20\",\"21\",\"11\"]'),(237,294,72.5,'[\"20\",\"20.5\",\"21\",\"11\"]'),(238,295,82,'[\"20\",\"20.5\",\"21\",\"20.5\"]'),(239,296,72,'[\"20\",\"20\",\"21\",\"11\"]'),(240,297,72,'[\"20\",\"20\",\"21\",\"11\"]'),(241,298,72,'[\"20\",\"20\",\"21\",\"11\"]'),(242,299,72,'[\"20\",\"20\",\"21\",\"11\"]'),(243,300,72,'[\"20\",\"20\",\"21\",\"11\"]'),(246,363,100,'[\"20\",\"80\"]'),(247,364,101,'[\"20\",\"81\"]'),(248,365,102,'[\"20\",\"82\"]'),(249,366,103,'[\"20\",\"83\"]'),(250,367,104,'[\"20\",\"84\"]'),(251,368,105,'[\"20\",\"85\"]'),(252,369,106,'[\"20\",\"86\"]'),(253,370,107,'[\"20\",\"87\"]'),(254,371,108,'[\"20\",\"88\"]'),(255,372,109,'[\"20\",\"89\"]'),(256,373,110,'[\"20\",\"90\"]'),(257,374,111,'[\"20\",\"91\"]'),(258,375,112,'[\"20\",\"92\"]'),(259,376,113,'[\"20\",\"93\"]'),(260,377,114,'[\"20\",\"94\"]'),(261,378,115,'[\"20\",\"95\"]'),(262,379,116,'[\"20\",\"96\"]'),(263,380,117,'[\"20\",\"97\"]'),(264,381,118,'[\"20\",\"98\"]'),(265,382,119,'[\"20\",\"99\"]'),(266,383,120,'[\"20\",\"100\"]'),(267,384,90,'[\"20\",\"70\"]'),(268,385,91,'[\"20\",\"71\"]'),(269,386,92,'[\"20\",\"72\"]'),(270,387,93,'[\"20\",\"73\"]'),(271,388,94,'[\"20\",\"74\"]'),(272,389,95,'[\"20\",\"75\"]'),(273,390,96,'[\"20\",\"76\"]'),(274,391,97,'[\"20\",\"77\"]'),(275,392,98,'[\"20\",\"78\"]'),(276,393,99,'[\"20\",\"79\"]'),(277,394,100,'[\"20\",\"80\"]'),(278,395,101,'[\"20\",\"81\"]'),(279,396,102,'[\"20\",\"82\"]'),(280,397,103,'[\"20\",\"83\"]'),(281,398,104,'[\"20\",\"84\"]'),(282,399,105,'[\"20\",\"85\"]'),(283,400,106,'[\"20\",\"86\"]'),(284,401,107,'[\"20\",\"87\"]'),(285,402,108,'[\"20\",\"88\"]'),(286,403,109,'[\"20\",\"89\"]'),(287,404,110,'[\"20\",\"90\"]'),(288,405,111,'[\"20\",\"91\"]'),(289,406,112,'[\"20\",\"92\"]'),(290,407,113,'[\"20\",\"93\"]'),(291,408,114,'[\"20\",\"94\"]'),(292,409,115,'[\"20\",\"95\"]'),(293,410,116,'[\"20\",\"96\"]'),(294,411,117,'[\"20\",\"97\"]'),(295,412,100,'[\"20\",\"80\"]'),(296,413,101,'[\"20\",\"81\"]'),(297,414,102,'[\"20\",\"82\"]'),(298,415,103,'[\"20\",\"83\"]'),(299,416,104,'[\"20\",\"84\"]'),(300,417,105,'[\"20\",\"85\"]'),(301,418,106,'[\"20\",\"86\"]'),(302,419,107,'[\"20\",\"87\"]'),(303,420,108,'[\"20\",\"88\"]'),(304,421,109,'[\"20\",\"89\"]'),(305,422,110,'[\"20\",\"90\"]'),(306,423,111,'[\"20\",\"91\"]'),(307,424,112,'[\"20\",\"92\"]');
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
INSERT INTO `user` VALUES (1,'admin','阳光伟','123',0,'信息与智能工程系'),(2,'admin2','test1','123',3,'信息与智能工程系'),(3,'admin3','123','123',2,'计算机科学与工程系'),(94,'bx15288187317','白雪','000000',0,'计算机科学与工程系'),(95,'cy13529049079','曹涌','000000',0,'数据科学与工程系'),(96,'df13908715148','代飞','000000',2,'数据科学与工程系'),(97,'dzq15287167686','戴正权','000000',0,'信息与智能工程系'),(98,'dje15287113619','董建娥','000000',0,'信息与智能工程系'),(99,'dyy13577046004','董跃宇','000000',0,'数据科学与工程系'),(100,'fxy13518704805','付小勇','000000',0,'计算机科学与工程系'),(101,'gh18208721391','高皜','000000',0,'信息与智能工程系'),(102,'gr13629436290','郭冉','000000',0,'计算机科学与工程系'),(103,'hx13888008509','何鑫','000000',0,'计算机科学与工程系'),(104,'hjp13888425274','贺金平','000000',0,'计算机科学与工程系'),(105,'hkr13700687538','胡坤融','000000',0,'数据科学与工程系'),(106,'hb15808868790','黄苾','000000',0,'计算机科学与工程系'),(107,'hyx18208830702','黄宇翔','000000',0,'数据科学与工程系'),(108,'kwl13700618673','寇卫利','000000',0,'计算机科学与工程系'),(109,'ljq13698778010','李俊萩','000000',0,'信息与智能工程系'),(110,'ls15887279593','李莎','000000',0,'信息与智能工程系'),(111,'lh15987128885','林宏','000000',0,'数据科学与工程系'),(112,'ln13888838980','鲁宁','000000',0,'计算机科学与工程系'),(113,'ly13518756770','鲁莹','000000',0,'信息与智能工程系'),(114,'ldj15608809968','吕丹桔','000000',0,'信息与智能工程系'),(115,'ms13116958088','苗晟','000000',0,'数据科学与工程系'),(116,'qzp13987606761','强振平','000000',0,'计算机科学与工程系'),(117,'qmm13529036061','秦明明','000000',0,'信息与智能工程系'),(118,'rj15925116762','荣剑','000000',0,'信息与智能工程系'),(119,'syk15808796485','孙永科','000000',0,'数据科学与工程系'),(120,'wh13888331410','王欢','000000',0,'计算机科学与工程系'),(121,'wxl13577067397','王晓林','000000',0,'计算机科学与工程系'),(122,'wxr13700692383','王晓锐','000000',0,'数据科学与工程系'),(123,'xlw15825293953','邢丽伟','000000',0,'计算机科学与工程系'),(124,'xh18987955169','幸宏','000000',0,'计算机科学与工程系'),(125,'xf13698763596','熊飞','000000',0,'数据科学与工程系'),(126,'xqy13608849821','徐全元','000000',0,'信息与智能工程系'),(127,'xwh13888832080','徐伟恒','000000',0,'信息与智能工程系'),(128,'ypy15198952752','杨鹏宇','000000',0,'计算机科学与工程系'),(129,'yww15987148114','杨微微','000000',0,'教务办'),(130,'yyy15912514075','禹玥昀','000000',0,'信息与智能工程系'),(131,'zhw13759472154','张宏伟','000000',0,'计算机科学与工程系'),(132,'zhx13398854044','张宏翔','000000',0,'信息与智能工程系'),(133,'zqh13888193733','张晴晖','000000',0,'信息与智能工程系'),(134,'zf13888300900','赵璠','000000',0,'信息与智能工程系'),(135,'zx13888673236','赵喜','000000',0,'计算机科学与工程系'),(136,'zyl15825298876','赵毅力','000000',0,'计算机科学与工程系'),(137,'zyj15987138789','赵友杰','000000',0,'数据科学与工程系'),(138,'zlh15288473403','钟丽辉','000000',0,'信息与智能工程系');
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

-- Dump completed on 2023-06-26 15:41:30

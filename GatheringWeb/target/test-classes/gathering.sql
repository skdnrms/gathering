-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gathering
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `gid` int(11) NOT NULL COMMENT '모임_시퀀스',
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '커리_시퀀스',
  `title` varchar(255) NOT NULL COMMENT '제목',
  `comment` text COMMENT '내용',
  `date` datetime DEFAULT NULL COMMENT '진행일',
  `chap_cnt` int(11) NOT NULL COMMENT '챕터순서',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='커리큘럼';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (2,14,'오리엔테이션','얼굴이나봐요','2014-05-05 00:00:00',1),(2,15,'자바란?','자바의 역사, 자바언어의 특징, JVM(Java Virtual Machine) ','2014-05-08 00:00:00',2),(2,16,'자바개발환경 구축하기','자바 개발도구(JDK)설치하기, Java API문서 설치하기, 자바로 프로그램작성하기, 자바프로그램의 실행과정','2014-05-12 00:00:00',3),(2,17,'변수란?','변수의 선언,  명명규칙(naming convention), 변수의 타입','2014-05-16 00:00:00',4),(1,18,'오티!','가벼운마음으로 오세요','2014-05-30 00:00:00',1),(3,19,'홍대모임','기타사세요','2014-05-17 00:00:00',1);
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gathering`
--

DROP TABLE IF EXISTS `gathering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gathering` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '모임_시퀀스',
  `name` varchar(50) NOT NULL COMMENT '이름',
  `location` varchar(30) DEFAULT NULL COMMENT '지역',
  `field` varchar(50) NOT NULL COMMENT '분야',
  `time` varchar(10) DEFAULT NULL COMMENT '시간',
  `date` varchar(50) DEFAULT NULL COMMENT '요일',
  `population` int(11) DEFAULT NULL COMMENT '최대회원수',
  `introduction` varchar(255) DEFAULT NULL COMMENT '소개글',
  `photo` varchar(100) DEFAULT NULL COMMENT '사진',
  `start_date` datetime DEFAULT NULL COMMENT '시작일',
  `end_date` datetime DEFAULT NULL COMMENT '종료일',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='모임';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gathering`
--

LOCK TABLES `gathering` WRITE;
/*!40000 ALTER TABLE `gathering` DISABLE KEYS */;
INSERT INTO `gathering` VALUES (1,'[영어토론] 영어 토론 해봅시다','서울','A01,B01,C01','06:00','mon,tue,wed,thu,fri',10,'안녕하세요....인터넷으로 영어토론을 해보아요...ㅋ','americano@gmail.com_english.png','2014-05-09 00:00:00',NULL),(2,'[ 판교 IT ] JAVA, Spring, MyBatis 공부해요!!','경기','A02,B05,C03','19:10','mon,thu',7,'java 공부 열심히 해봅시다...','admin@kosta.com_java.jpg','2014-05-04 00:00:00',NULL),(3,'[홍대 통기타] 기타 스터디모임','서울','A04','12:00','sat',3,'통기타교실....','guest@gathering.com_guitar.jpg','2014-05-09 00:00:00',NULL),(4,'취업합시다!','부산','A03','18:30','tue,thu',7,'취업스터디입니다.','guest@gathering.com_job.jpg','2014-05-09 00:00:00',NULL),(5,'위닝스터디','서울','A04','19:00',NULL,4,'배우고싶은 위닝 기술있으면 따로 말해주세요. \r\n친절하게 알려드림\r\n여성회원우대\r\n','admin@kosta.com_PES-2014-cover.jpg','2014-05-13 00:00:00','2014-05-20 00:00:00');
/*!40000 ALTER TABLE `gathering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identified_notice`
--

DROP TABLE IF EXISTS `identified_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identified_notice` (
  `email` varchar(40) DEFAULT NULL COMMENT '이메일',
  `nid` int(11) DEFAULT NULL COMMENT '공지_시퀀스',
  `gid` int(11) DEFAULT NULL COMMENT '모임_시퀀스'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='확인된 공지사항';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identified_notice`
--

LOCK TABLES `identified_notice` WRITE;
/*!40000 ALTER TABLE `identified_notice` DISABLE KEYS */;
INSERT INTO `identified_notice` VALUES ('kosta@kosta.com',3,2),('admin@kosta.com',1,1);
/*!40000 ALTER TABLE `identified_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `email` varchar(40) NOT NULL COMMENT '이메일',
  `name` varchar(50) NOT NULL COMMENT '이름',
  `phone` varchar(30) NOT NULL COMMENT '전화번호',
  `birthday` datetime DEFAULT NULL COMMENT '생일',
  `gender` varchar(1) DEFAULT NULL COMMENT '성별',
  `location` varchar(30) DEFAULT NULL COMMENT '지역',
  `photo` varchar(100) DEFAULT NULL COMMENT '사진',
  `password` varchar(255) NOT NULL COMMENT '비밀번호',
  `regist_date` datetime NOT NULL COMMENT '가입일',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin@kosta.com','관리자','010-4321-4321','1980-02-27 00:00:00','f','강원','admin@kosta.com_admin.jpg','1234','2014-05-09 09:41:18'),('americano@gmail.com','아메리카노','010-1234-1234','1990-07-12 00:00:00','m','제주','americano@gmail.com_americano.jpg','1234','2014-05-09 09:30:42'),('guest@gathering.com','손님','010-8854-8854','1988-12-31 00:00:00','m','부산','guest@gathering.com_guest.png','1234','2014-05-09 10:13:34'),('kosta@kosta.com','코스타','010-1111-2222','2014-05-09 00:00:00','m','서울','kosta@kosta.com_kosta.jpg','1234','2014-05-09 10:05:14');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `gid` int(11) NOT NULL COMMENT '모임_시퀀스',
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT '공지_시퀀스',
  `title` varchar(255) NOT NULL COMMENT '제목',
  `comment` text NOT NULL COMMENT '내용',
  `email` varchar(40) NOT NULL COMMENT '이메일',
  `regist_date` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='공지사항';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,1,'영어회화 동아리가 개설되었습니다.','많은 성원 부탁드립니다.','americano@gmail.com','2014-05-09 09:34:10'),(2,3,'java 공부를 해봅시다.','java의 정석 준비해오세요~','admin@kosta.com','2014-05-09 10:02:04'),(3,4,'홍대모임 공지사항','홍대입구역 2번출구 앞에서 봐요...회비는 7천원','guest@gathering.com','2014-05-09 10:50:57');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `gid` int(11) NOT NULL COMMENT '모임_시퀀스',
  `qid` int(11) NOT NULL AUTO_INCREMENT COMMENT '질문_시퀀스',
  `comment` varchar(255) NOT NULL COMMENT '내용',
  `regist_date` datetime NOT NULL COMMENT '등록일',
  `email` varchar(40) NOT NULL COMMENT '이메일',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='QnA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,1,'언제부터 시작가능한가요?','2014-05-09 09:42:59','admin@kosta.com'),(2,2,'javaScript도 배우고 싶습니다.','2014-05-09 10:46:51','kosta@kosta.com');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regis_gathering`
--

DROP TABLE IF EXISTS `regis_gathering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regis_gathering` (
  `email` varchar(40) NOT NULL COMMENT '이메일',
  `gid` int(11) NOT NULL COMMENT '모임_시퀀스',
  `grade` varchar(10) NOT NULL COMMENT '회원등급',
  `regist_date` datetime DEFAULT NULL COMMENT '가입일',
  PRIMARY KEY (`email`,`gid`),
  KEY `FK_gathering_TO_regis_gathering` (`gid`),
  CONSTRAINT `FK_gathering_TO_regis_gathering` FOREIGN KEY (`gid`) REFERENCES `gathering` (`gid`),
  CONSTRAINT `FK_member_TO_regis_gathering` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='가입된모임';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regis_gathering`
--

LOCK TABLES `regis_gathering` WRITE;
/*!40000 ALTER TABLE `regis_gathering` DISABLE KEYS */;
INSERT INTO `regis_gathering` VALUES ('admin@kosta.com',1,'J','2014-05-09 09:42:36'),('admin@kosta.com',2,'M','2014-05-09 09:45:55'),('admin@kosta.com',3,'J','2014-05-09 10:27:27'),('admin@kosta.com',4,'J','2014-05-09 10:27:31'),('admin@kosta.com',5,'M','2014-05-09 11:06:19'),('americano@gmail.com',1,'M','2014-05-09 09:33:34'),('americano@gmail.com',4,'J','2014-05-09 10:26:29'),('guest@gathering.com',3,'M','2014-05-09 10:15:38'),('guest@gathering.com',4,'M','2014-05-09 10:24:48'),('kosta@kosta.com',1,'J','2014-05-09 10:09:07'),('kosta@kosta.com',2,'J','2014-05-09 10:08:39'),('kosta@kosta.com',3,'J','2014-05-09 10:47:19');
/*!40000 ALTER TABLE `regis_gathering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `qid` int(11) NOT NULL COMMENT '질문_시퀀스',
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '답글_시퀀스',
  `comment` varchar(255) NOT NULL COMMENT '내용',
  `regist_date` datetime NOT NULL COMMENT '등록일',
  `email` varchar(40) NOT NULL COMMENT '이메일',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='답글';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (2,2,'저는 jQuery요/','2014-05-09 10:54:09','kosta@kosta.com');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-09 12:14:06

/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21 : Database - emres
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `t_author` */

CREATE TABLE `t_author` (
  `C_ID` varchar(32) NOT NULL,
  `C_NAME` varchar(200) DEFAULT NULL,
  `C_IDCARD` varchar(20) DEFAULT NULL,
  `C_PSEUDONYM` varchar(200) DEFAULT NULL,
  `C_DESC` varchar(200) DEFAULT NULL,
  `C_FAMOUS` varchar(1) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_author` */

insert  into `t_author`(`C_ID`,`C_NAME`,`C_IDCARD`,`C_PSEUDONYM`,`C_DESC`,`C_FAMOUS`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','马未都',NULL,NULL,'擅长古风写作','1','1','2016-01-01 17:43:10',NULL,NULL),('10','南派三叔',NULL,NULL,'盗墓笔记作者','1','1','2016-01-01 17:43:10','1','2016-01-02 00:26:11'),('11','老猪',NULL,NULL,'《紫川》，哈哈','1','1','2016-01-01 17:43:10','1','2016-01-02 00:39:00'),('12','猫腻','110105198105050310','晓峰','新浪原创文学奖玄幻类金奖','1','1','2016-01-01 17:43:10','1','2016-01-02 00:37:21'),('2','于妈',NULL,NULL,'擅长都市言情、宫斗','0','1','2016-01-01 17:43:10',NULL,NULL),('3','海宴',NULL,NULL,'擅长谋略，代表作《琅琊榜》','1','1','2016-01-01 17:43:10',NULL,NULL),('4','不知名作者',NULL,NULL,'这个肯定不知名','0','1','2016-01-01 17:43:10','1','2016-01-02 00:43:33'),('40282e8151fdfe750151fdfe75d80000','唐家三少',NULL,NULL,'大神还用说吗？','0','1','2016-01-02 00:21:31',NULL,NULL),('40282e8151fdfe750151fe07ac270001','洛水',NULL,NULL,'大道残篇出洛水，半部天书知北游。','0','1','2016-01-02 00:31:34',NULL,NULL),('40282e81520db74f01520db74ff30000','忘语',NULL,'',NULL,'0','1','2016-01-05 01:37:43','1','2016-01-05 01:37:43'),('40282e81522bc87601522bc876560000','风笑',NULL,'',NULL,'0','1','2016-01-10 21:45:04','1','2016-01-10 21:45:04'),('40282e8152366af00152366af0470000','萧潜',NULL,'',NULL,'0','1','2016-01-12 23:18:44','1','2016-01-12 23:18:44'),('40282e8152366af00152366c8e430003','佚名',NULL,'',NULL,'0','1','2016-01-12 23:20:30','1','2016-01-12 23:20:30'),('40282e8152503a430152503a431c0000','今何在',NULL,'今何在',NULL,'0','1','2016-01-17 23:35:42','1','2016-01-17 23:35:42'),('40282e8152503a430152503bfd2d0003','太子',NULL,'',NULL,'0','1','2016-01-17 23:37:35','1','2016-01-17 23:37:35'),('40282e8152503a43015250400af60006','高晓松',NULL,'',NULL,'0','1','2016-01-17 23:42:00','1','2016-01-17 23:42:00'),('40282e81525043270152504327bd0000','吴承恩',NULL,'',NULL,'0','1','2016-01-17 23:45:24','1','2016-01-17 23:45:24'),('40282e8152e074d50152e5b972930001','测试',NULL,'小测',NULL,'0','1','2016-02-16 00:18:02','1','2016-02-16 00:18:02'),('5','作者5',NULL,'作者五','疯了...','0','1','2016-01-01 17:43:10','1','2016-01-02 02:10:27'),('6','作者6',NULL,NULL,'还是不行啊啊啊','0','1','2016-01-01 17:43:10','1','2016-01-02 14:17:02'),('7','作者7',NULL,NULL,'','0','1','2016-01-01 17:43:10',NULL,NULL),('8','作者8',NULL,NULL,'这是第8个了','0','1','2016-01-01 17:43:10','1','2016-01-02 14:17:30');

/*Table structure for table `t_copyright_contract` */

CREATE TABLE `t_copyright_contract` (
  `C_ID` varchar(32) NOT NULL,
  `C_CODE` varchar(20) DEFAULT NULL,
  `C_OWNER` varchar(300) DEFAULT NULL,
  `C_OWNER_CONTACT` varchar(60) DEFAULT NULL,
  `C_OWNER_CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `C_OWNER_CONTACT_ADDRESS` varchar(300) DEFAULT NULL,
  `C_OWNER_CONTACT_EMAIL` varchar(60) DEFAULT NULL,
  `C_BUYER` varchar(300) DEFAULT NULL,
  `C_BUYER_CONTACT` varchar(60) DEFAULT NULL,
  `C_BUYER_CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `C_BUYER_CONTACT_ADDRESS` varchar(300) DEFAULT NULL,
  `C_BUYER_CONTACT_EMAIL` varchar(60) DEFAULT NULL,
  `C_PRIVILEGES` varchar(10) DEFAULT NULL,
  `C_PRIVILEGE_TYPE` varchar(1) DEFAULT NULL,
  `C_PRIVILEGE_RANGE` varchar(1) DEFAULT NULL,
  `C_PRIVILEGE_DEADLINE` varchar(3) DEFAULT NULL,
  `C_BANK_ACCOUNT_NAME` varchar(300) DEFAULT NULL,
  `C_BANK_ACCOUNT_NO` varchar(30) DEFAULT NULL,
  `C_BANK` varchar(300) DEFAULT NULL,
  `C_TOTAL_PRICE` decimal(10,0) DEFAULT NULL,
  `C_AUDIT_STATE` varchar(1) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_contract` */

insert  into `t_copyright_contract`(`C_ID`,`C_CODE`,`C_OWNER`,`C_OWNER_CONTACT`,`C_OWNER_CONTACT_PHONE`,`C_OWNER_CONTACT_ADDRESS`,`C_OWNER_CONTACT_EMAIL`,`C_BUYER`,`C_BUYER_CONTACT`,`C_BUYER_CONTACT_PHONE`,`C_BUYER_CONTACT_ADDRESS`,`C_BUYER_CONTACT_EMAIL`,`C_PRIVILEGES`,`C_PRIVILEGE_TYPE`,`C_PRIVILEGE_RANGE`,`C_PRIVILEGE_DEADLINE`,`C_BANK_ACCOUNT_NAME`,`C_BANK_ACCOUNT_NO`,`C_BANK`,`C_TOTAL_PRICE`,`C_AUDIT_STATE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152b0a8290152b0a829d40000','C20160205-001','猫腻','猫腻','13111111111','中国好作家协会','mn@mn.com','北京悦库时光文化传媒有限公司','齐诗诗','13222222222','北广','qss@em.com','01,03,04','0','0','1','mao腻','1234567890','中国银行','20000','2','1','2016-02-05 16:59:17','1','2016-02-05 16:59:17'),('40282e8152dae71c0152dae71cfd0000','C20160213-001','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','创想','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1','1','2016-02-13 21:52:05','1','2016-02-13 21:52:05'),('40282e8152dae71c0152dae78a490002','C20160213-002','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1','1','2016-02-13 21:52:33','1','2016-02-13 21:52:33'),('40282e8152dae71c0152dae80da10004','C20160213-003','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1','1','2016-02-13 21:53:07','1','2016-02-13 21:53:07'),('40282e8152dae71c0152dae879d80006','C20160213-004','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1','1','2016-02-13 21:53:35','1','2016-02-13 21:53:35');

/*Table structure for table `t_copyright_ctrt_audit` */

CREATE TABLE `t_copyright_ctrt_audit` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_AUDIT_REMARK` varchar(300) DEFAULT NULL,
  `C_AUDITOR_ID` varchar(32) DEFAULT NULL,
  `C_AUDIT_TIME` datetime DEFAULT NULL,
  `C_AUDIT_RESULT` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_ctrt_audit` */

insert  into `t_copyright_ctrt_audit`(`C_ID`,`C_CONTRACT_ID`,`C_AUDIT_REMARK`,`C_AUDITOR_ID`,`C_AUDIT_TIME`,`C_AUDIT_RESULT`) values ('2c9080a452c1aa420152c1aa42820000','40282e8152b0a8290152b0a829d40000','挺好','1','2016-02-09 00:15:07','1');

/*Table structure for table `t_copyright_ctrt_doc` */

CREATE TABLE `t_copyright_ctrt_doc` (
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR_ID` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_VERSION` varchar(10) DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_ctrt_doc` */

/*Table structure for table `t_copyright_ctrt_prod` */

CREATE TABLE `t_copyright_ctrt_prod` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_PRICE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_ctrt_prod` */

insert  into `t_copyright_ctrt_prod`(`C_ID`,`C_CONTRACT_ID`,`C_PRODUCT_ID`,`C_PRICE`) values ('40282e8152acfe830152ad4a13aa0003','40282e8152acfe830152ad4a13880002','40282e81522bc87601522bcb75850003','30000'),('40282e8152b0a8290152b0a82a030001','40282e8152b0a8290152b0a829d40000','40282e81522bc87601522bcb75850003','2000'),('40282e8152dae71c0152dae71d150001','40282e8152dae71c0152dae71cfd0000','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152dae78a5a0003','40282e8152dae71c0152dae78a490002','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152dae80dac0005','40282e8152dae71c0152dae80da10004','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152dae879e10007','40282e8152dae71c0152dae879d80006','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152daf977f40009','40282e8152dae71c0152daf977c80008','40282e8152503a43015250400af90007','100000');

/*Table structure for table `t_evaluation` */

CREATE TABLE `t_evaluation` (
  `C_ID` varchar(32) NOT NULL,
  `C_USER_ID` varchar(32) DEFAULT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_STORY_FRAME` int(11) DEFAULT NULL,
  `C_STORY_TEXT` int(11) DEFAULT NULL,
  `C_STORY_ROLE` int(11) DEFAULT NULL,
  `C_STORY_TARGET` varchar(600) DEFAULT NULL,
  `C_STORY_SUGGEST` varchar(1000) DEFAULT NULL,
  `C_MAKE_AUDIO_EDIT` int(11) DEFAULT NULL,
  `C_MAKE_PLAY_TYPE` varchar(40) DEFAULT NULL,
  `C_MAKE_PLAY_STYLE` varchar(40) DEFAULT NULL,
  `C_MAKE_SUGGEST` varchar(1000) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_evaluation` */

insert  into `t_evaluation`(`C_ID`,`C_USER_ID`,`C_PRODUCT_ID`,`C_STORY_FRAME`,`C_STORY_TEXT`,`C_STORY_ROLE`,`C_STORY_TARGET`,`C_STORY_SUGGEST`,`C_MAKE_AUDIO_EDIT`,`C_MAKE_PLAY_TYPE`,`C_MAKE_PLAY_STYLE`,`C_MAKE_SUGGEST`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e81522c8f2001522c8f20700000','1','40282e81522bc87601522bcb75850003',4,2,3,'白领，家庭主妇','不错',2,'2,4,6,7','2','好好好好好','1','2016-01-11 01:22:03','1','2016-01-11 01:22:03');

/*Table structure for table `t_final_evaluation` */

CREATE TABLE `t_final_evaluation` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_REF_PRICE` varchar(32) DEFAULT NULL,
  `C_PRODUCT_LEVEL` varchar(2) DEFAULT NULL,
  `C_Author_LEVEL` varchar(2) DEFAULT NULL,
  `C_STORY_VALUE` varchar(2) DEFAULT NULL,
  `C_MAKE_VALUE` varchar(2) DEFAULT NULL,
  `C_ONLY_WEB_CAST` varchar(1) DEFAULT NULL,
  `C_HOT_SUBJECT` varchar(1) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_final_evaluation` */

insert  into `t_final_evaluation`(`C_ID`,`C_PRODUCT_ID`,`C_REF_PRICE`,`C_PRODUCT_LEVEL`,`C_Author_LEVEL`,`C_STORY_VALUE`,`C_MAKE_VALUE`,`C_ONLY_WEB_CAST`,`C_HOT_SUBJECT`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e81524e72a901524e72a98d0000','40282e81522bc87601522bcb75850003','24000','0','1','2','2','0','1','1','2016-01-17 15:18:03',NULL,NULL);

/*Table structure for table `t_make_contract` */

CREATE TABLE `t_make_contract` (
  `C_ID` varchar(32) NOT NULL,
  `C_CODE` varchar(20) DEFAULT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_MAKER_ID` varchar(32) DEFAULT NULL,
  `C_TARGET_TYPE` varchar(1) DEFAULT NULL,
  `C_OWNER` varchar(60) DEFAULT NULL,
  `C_OWNER_CONTACT` varchar(60) DEFAULT NULL,
  `C_OWNER_CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `C_OWNER_CONTACT_ADDRESS` varchar(300) DEFAULT NULL,
  `C_OWNER_CONTACT_EMAIL` varchar(60) DEFAULT NULL,
  `C_WORKER` varchar(60) DEFAULT NULL,
  `C_WORKER_CONTACT` varchar(60) DEFAULT NULL,
  `C_WORKER_CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `C_WORKER_CONTACT_ADDRESS` varchar(300) DEFAULT NULL,
  `C_WORKER_CONTACT_EMAIL` varchar(60) DEFAULT NULL,
  `C_TOTAL_SECTION` int(11) DEFAULT NULL,
  `C_PRICE` decimal(10,0) DEFAULT NULL,
  `C_TOTAL_PRICE` decimal(10,0) DEFAULT NULL,
  `C_PENALTY` decimal(10,0) DEFAULT NULL,
  `C_SHOWER_ID` varchar(32) DEFAULT NULL,
  `C_BANK_ACCOUNT_NAME` varchar(300) DEFAULT NULL,
  `C_BANK_ACCOUNT_NO` varchar(30) DEFAULT NULL,
  `C_BANK` varchar(300) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_contract` */

insert  into `t_make_contract`(`C_ID`,`C_CODE`,`C_PRODUCT_ID`,`C_MAKER_ID`,`C_TARGET_TYPE`,`C_OWNER`,`C_OWNER_CONTACT`,`C_OWNER_CONTACT_PHONE`,`C_OWNER_CONTACT_ADDRESS`,`C_OWNER_CONTACT_EMAIL`,`C_WORKER`,`C_WORKER_CONTACT`,`C_WORKER_CONTACT_PHONE`,`C_WORKER_CONTACT_ADDRESS`,`C_WORKER_CONTACT_EMAIL`,`C_TOTAL_SECTION`,`C_PRICE`,`C_TOTAL_PRICE`,`C_PENALTY`,`C_SHOWER_ID`,`C_BANK_ACCOUNT_NAME`,`C_BANK_ACCOUNT_NO`,`C_BANK`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152d6816a0152d683a9250001','M20160213-001','40282e8152503a43015250410e640009','40282e8152d46ebb0152d46ebb3b0000','0','悦库时光','王婷','13111111111','北广','wt@em.com','高大壮','高大壮','13222222222','大壮家里','gdz@gdz.com',50,'2000','100000','200',NULL,'高大壮','高大壮','中国银行','1','2016-02-13 01:24:59','1','2016-02-13 01:24:59');

/*Table structure for table `t_make_ctrt_doc` */

CREATE TABLE `t_make_ctrt_doc` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR_ID` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_VERSION` varchar(10) DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_ctrt_doc` */

insert  into `t_make_ctrt_doc`(`C_ID`,`C_CONTRACT_ID`,`C_CREATOR_ID`,`C_CREATETIME`,`C_VERSION`,`C_FILE_URL`) values ('40282e8152d93c190152d93c192d0000','40282e8152d6816a0152d683a9250001','1','2016-02-13 14:05:40','1.0','/mc/20160213/820b17e815ef4d0f9337c82716c4239d.doc'),('40282e8152d93c190152d94305f00001','40282e8152d6816a0152d683a9250001','1','2016-02-13 14:13:14','1.1','/uploadTmp/doc/20160213/548a7c02c80b48b8ab388bf5146b2650_SAML Core.docx');

/*Table structure for table `t_make_task` */

CREATE TABLE `t_make_task` (
  `C_ID` varchar(32) NOT NULL,
  `C_NAME` varchar(200) DEFAULT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_MAKER_ID` varchar(32) DEFAULT NULL,
  `C_TIME_SECTION` int(11) DEFAULT NULL,
  `C_TOTAL_SECTION` int(11) DEFAULT NULL,
  `C_SHOW_TYPE` varchar(2) DEFAULT NULL,
  `C_MAKE_TIME` int(11) DEFAULT NULL,
  `C_SHOW_EXPECTION` varchar(1000) DEFAULT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_STATE` varchar(2) DEFAULT NULL,
  `C_DESC` varchar(1000) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_task` */

insert  into `t_make_task`(`C_ID`,`C_NAME`,`C_PRODUCT_ID`,`C_MAKER_ID`,`C_TIME_SECTION`,`C_TOTAL_SECTION`,`C_SHOW_TYPE`,`C_MAKE_TIME`,`C_SHOW_EXPECTION`,`C_CONTRACT_ID`,`C_STATE`,`C_DESC`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152d49fd10152d49fd1290000','搜神传','40282e8152503a43015250410e640009','40282e8152d46ebb0152d46ebb3b0000',20,50,'1',30,'说得好点','','0','钱好说','1','2016-02-12 16:36:30','1','2016-02-12 16:36:30');

/*Table structure for table `t_product` */

CREATE TABLE `t_product` (
  `C_ID` varchar(32) NOT NULL,
  `C_NAME` varchar(60) DEFAULT NULL,
  `C_SUBJECT_ID` varchar(32) DEFAULT NULL,
  `C_AUTHOR_ID` varchar(32) DEFAULT NULL,
  `C_TYPE` varchar(1) DEFAULT NULL,
  `C_PUBLISH_STATE` varchar(4) DEFAULT NULL,
  `C_PUBLISH_YEAR` varchar(10) DEFAULT NULL,
  `C_FINISH_YEAR` varchar(10) DEFAULT NULL,
  `C_STATE` varchar(4) DEFAULT NULL,
  `C_WORD_COUNT` int(11) DEFAULT NULL,
  `C_SECTION_COUNT` int(11) DEFAULT NULL,
  `C_SECTION_LENGTH` int(11) DEFAULT NULL,
  `C_PRESS` varchar(200) DEFAULT NULL,
  `C_WEBSITE` varchar(200) DEFAULT NULL,
  `C_SUMMARY` varchar(2000) DEFAULT NULL,
  `C_HAS_AUDIO` varchar(1) DEFAULT NULL,
  `C_AUDIO_COPYRIGHT` varchar(1) DEFAULT NULL,
  `C_AUDIO_DESC` varchar(500) DEFAULT NULL,
  `C_ISBN` varchar(100) DEFAULT NULL,
  `C_LOGO_URL` varchar(100) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`C_ID`,`C_NAME`,`C_SUBJECT_ID`,`C_AUTHOR_ID`,`C_TYPE`,`C_PUBLISH_STATE`,`C_PUBLISH_YEAR`,`C_FINISH_YEAR`,`C_STATE`,`C_WORD_COUNT`,`C_SECTION_COUNT`,`C_SECTION_LENGTH`,`C_PRESS`,`C_WEBSITE`,`C_SUMMARY`,`C_HAS_AUDIO`,`C_AUDIO_COPYRIGHT`,`C_AUDIO_DESC`,`C_ISBN`,`C_LOGO_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','侯卫东官场笔记5','40282e8152013ad80152013ad8ee0000','10','0','0','2011.2',NULL,'1',300000,NULL,NULL,NULL,NULL,'沙州市成津县县委书记章永泰车祸身亡，这究竟是意外事故，还是一起精心策划的人为谋杀？侯卫东临危受命，被市委书记周昌全派至成津县任县委副书记，查处章永泰真实死因，整治成津县乱局。以常务副县长李太忠为代表的地方势力，插手矿业生产，损公肥私，对侯卫东进行了孤立。侯卫东经过详细谋划，在一番合情合理的正常公务中，不动声色地替换和提拔了20名干部。在各项整顿工作初见成效时，周昌全离开沙州到省里工作，新书记降临沙州。侯卫东的官场命运，又将如何再生波澜……','0',NULL,NULL,'978-7-5506-0055-3',NULL,'1','2016-01-02 17:25:27',NULL,NULL),('40282e81520db74f01520db7500e0001','凡人修仙传','1','40282e81520db74f01520db74ff30000','0','0','2014','2016','3',120,NULL,NULL,'创想时刻出版社','','凡人修仙传，韩立','0','1','',NULL,NULL,'1','2016-01-05 01:37:43','1','2016-01-05 01:37:43'),('40282e81522bc87601522bc8765a0001','官仙','1','40282e81522bc87601522bc876560000','0','1','2016','2016','0',300,NULL,NULL,'','起点中文网','一个仙人穿越做官','0','1','',NULL,NULL,'1','2016-01-10 21:45:04','1','2016-01-10 21:45:04'),('40282e81522bc87601522bcb75850003','庆余年','1','12','0','0','2013','2016','5',100,NULL,NULL,'不记得了','','庆余年','0','1','','1234567',NULL,'1','2016-01-10 21:48:20','1','2016-01-25 23:36:57'),('40282e8152366af00152366af04a0001','斗破苍穹','1','40282e8152366af00152366af0470000','0','0','2016','2016','1',200,NULL,NULL,'不知道什么出版社','','斗破苍穹，萧炎','0','1','',NULL,NULL,'1','2016-01-12 23:18:44','1','2016-01-12 23:18:44'),('40282e8152366af00152366c8e490004','七侠五义','1','40282e8152366af00152366c8e430003','0','0','2016','2016','1',80,NULL,NULL,'不知道什么出版社','','七侠五义','0','1','',NULL,NULL,'1','2016-01-12 23:20:30','1','2016-01-12 23:20:30'),('40282e8152503a430152503a43200001','悟空传','1','40282e8152503a430152503a431c0000','0','0','2016','2016','0',5,NULL,NULL,'中信出版社','','悟空传悟空传悟空传','0','1','',NULL,NULL,'1','2016-01-17 23:35:42','1','2016-01-17 23:35:42'),('40282e8152503a430152503bfd300004','太子妃升职记','1','40282e8152503a430152503bfd2d0003','0','1','2016','2015','0',28,NULL,NULL,'','起点','太子妃升职记，穿越','0','1','','',NULL,'1','2016-01-17 23:37:35','1','2016-02-14 23:44:59'),('40282e8152503a43015250400af90007','睡在我上铺的兄弟','1','40282e8152503a43015250400af60006','0','0','2016','2016','5',14,NULL,NULL,'什么什么出版社','','睡在我上铺的兄弟','0','1','',NULL,NULL,'1','2016-01-17 23:42:00','1','2016-01-17 23:42:00'),('40282e8152503a43015250410e640009','搜神传','1','40282e8152503a43015250400af60006','0','0','2015','2016','14',14,NULL,NULL,'什么什么出版社','','搜神传','0','1','','',NULL,'1','2016-01-17 23:43:07','1','2016-02-13 15:09:14'),('40282e81525043270152504327c20001','三国演义','1','40282e81525043270152504327bd0000','0','0','2014','2016','1',80,NULL,NULL,'松花出版集团','','三国演义一','0','1','','1230987654901',NULL,'1','2016-01-17 23:43:07','1','2016-01-25 23:36:37'),('40282e8152e074d50152e5d614a50005','测试作品','2c90808651e973060151e97306a50000','40282e8152e074d50152e5b972930001','0','3','2016','2016','0',100,NULL,NULL,'','','写的啥都不知道','0','1','',NULL,NULL,'1','2016-02-16 00:49:18','1','2016-02-16 00:49:18');

/*Table structure for table `t_product_audio` */

CREATE TABLE `t_product_audio` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_NAME` varchar(200) DEFAULT NULL,
  `C_FILE_URL` varchar(1000) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_audio` */

insert  into `t_product_audio`(`C_ID`,`C_PRODUCT_ID`,`C_NAME`,`C_FILE_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152d16c5b0152d16fa5330001','40282e8152503a430152503bfd300004','样章一','/uploadTmp/audio/20160212/2dc62a9cbf06474fb93ad81b5467a6a6_Maid with the Flaxen Hair.mp3','1','2016-02-12 01:45:01','1','2016-02-12 01:45:01');

/*Table structure for table `t_product_image` */

CREATE TABLE `t_product_image` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_NAME` varchar(200) DEFAULT NULL,
  `C_DESC` varchar(300) DEFAULT NULL,
  `C_FILE_URL` varchar(1000) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_image` */

insert  into `t_product_image`(`C_ID`,`C_PRODUCT_ID`,`C_NAME`,`C_DESC`,`C_FILE_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152cf6c690152cf6c693d0000','40282e8152503a430152503bfd300004','测试图','320*640','/uploadTmp/doc/20160211/ee36a64832fd4511ac6ee5a98a118b2c_Desert.jpg','1','2016-02-11 16:22:15','1','2016-02-11 16:22:15'),('40282e8152d0ee4b0152d0ee4b550000','40282e8152503a430152503bfd300004','再试一张','菊花','/uploadTmp/doc/20160211/717cc6434bfe4ead8b80f3afe0c6dfe8_Chrysanthemum.jpg','1','2016-02-11 23:23:44','1','2016-02-11 23:23:44'),('40282e8152d0ee4b0152d10f5c900001','40282e8152503a430152503bfd300004','再来','三只企鹅','/uploadTmp/doc/20160211/44b53d73b3da481580475e079bdf27a0_Penguins.jpg','1','2016-02-11 23:59:51','1','2016-02-11 23:59:51');

/*Table structure for table `t_product_sample` */

CREATE TABLE `t_product_sample` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_sample` */

insert  into `t_product_sample`(`C_ID`,`C_PRODUCT_ID`,`C_FILE_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152366af00152366c8e4d0005','40282e8152366af00152366c8e490004','/uploadTmp/doc/20160112/b1b8d223eeae4ef89c043c2c1799a5c2_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a430152503a43260002','40282e8152503a430152503a43200001','/uploadTmp/doc/20160117/bd0eff6dea6149088da6411d0a400cfa_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a430152503bfd370005','40282e8152503a430152503bfd300004','/uploadTmp/doc/20160117/d1c9423cc6d3447a974ddbed1858ee9c_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a43015250400afe0008','40282e8152503a43015250400af90007','/uploadTmp/doc/20160117/91a4b1eac3814828843741fef7ff35bd_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a43015250410e66000a','40282e8152503a43015250410e640009','/uploadTmp/doc/20160117/91a4b1eac3814828843741fef7ff35bd_需求细则.docx',NULL,NULL,NULL,NULL),('40282e81525043270152504327c60002','40282e81525043270152504327c20001','/uploadTmp/doc/20160117/71978d30a6054deca1bc8fde40d8d563_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e074d5320000','40282e8152503a430152503bfd300004','',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5b9729a0002',NULL,'/uploadTmp/doc/20160216/07280dcf4ea541d2802746367327505d_SAML Core.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5baebd50003',NULL,'/uploadTmp/doc/20160216/da25da962f5847d3b7a3b2f2fd0c04ba_面试评估表-UI岗位-zzh.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5cd991c0004',NULL,'/uploadTmp/doc/20160216/0ededcb25913492294f24dcee5e94d4c_SAML Core.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5d614a80006','40282e8152e074d50152e5d614a50005','/uploadTmp/doc/20160216/3d1eda4c58b34bf6b908f192fdc76d7d_SAML Core.docx',NULL,NULL,NULL,NULL);

/*Table structure for table `t_product_subject` */

CREATE TABLE `t_product_subject` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) NOT NULL,
  `C_SUBJECT_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_subject` */

/*Table structure for table `t_sale_contract` */

CREATE TABLE `t_sale_contract` (
  `C_ID` varchar(32) NOT NULL,
  `C_CODE` varchar(20) DEFAULT NULL,
  `C_OWNER` varchar(300) DEFAULT NULL,
  `C_OWNER_CONTACT` varchar(60) DEFAULT NULL,
  `C_OWNER_CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `C_OWNER_CONTACT_ADDRESS` varchar(300) DEFAULT NULL,
  `C_OWNER_CONTACT_EMAIL` varchar(60) DEFAULT NULL,
  `C_BUYER` varchar(300) DEFAULT NULL,
  `C_BUYER_CONTACT` varchar(60) DEFAULT NULL,
  `C_BUYER_CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `C_BUYER_CONTACT_ADDRESS` varchar(300) DEFAULT NULL,
  `C_BUYER_CONTACT_EMAIL` varchar(60) DEFAULT NULL,
  `C_PRIVILEGES` varchar(10) DEFAULT NULL,
  `C_PRIVILEGE_TYPE` varchar(1) DEFAULT NULL,
  `C_PRIVILEGE_RANGE` varchar(1) DEFAULT NULL,
  `C_PRIVILEGE_DEADLINE` varchar(3) DEFAULT NULL,
  `C_BANK_ACCOUNT_NAME` varchar(300) DEFAULT NULL,
  `C_BANK_ACCOUNT_NO` varchar(30) DEFAULT NULL,
  `C_BANK` varchar(300) DEFAULT NULL,
  `C_TOTAL_PRICE` decimal(10,0) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sale_contract` */

insert  into `t_sale_contract`(`C_ID`,`C_CODE`,`C_OWNER`,`C_OWNER_CONTACT`,`C_OWNER_CONTACT_PHONE`,`C_OWNER_CONTACT_ADDRESS`,`C_OWNER_CONTACT_EMAIL`,`C_BUYER`,`C_BUYER_CONTACT`,`C_BUYER_CONTACT_PHONE`,`C_BUYER_CONTACT_ADDRESS`,`C_BUYER_CONTACT_EMAIL`,`C_PRIVILEGES`,`C_PRIVILEGE_TYPE`,`C_PRIVILEGE_RANGE`,`C_PRIVILEGE_DEADLINE`,`C_BANK_ACCOUNT_NAME`,`C_BANK_ACCOUNT_NO`,`C_BANK`,`C_TOTAL_PRICE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152dae71c0152db01318a000a','S20160213-001','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','创想','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1','2016-02-13 22:20:35','1','2016-02-13 22:20:35');

/*Table structure for table `t_sale_ctrt_doc` */

CREATE TABLE `t_sale_ctrt_doc` (
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR_ID` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_VERSION` varchar(10) DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sale_ctrt_doc` */

/*Table structure for table `t_sale_ctrt_prod` */

CREATE TABLE `t_sale_ctrt_prod` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_PRICE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sale_ctrt_prod` */

insert  into `t_sale_ctrt_prod`(`C_ID`,`C_CONTRACT_ID`,`C_PRODUCT_ID`,`C_PRICE`) values ('40282e8152dae71c0152db0131a8000b','40282e8152dae71c0152db01318a000a','40282e8152503a43015250410e640009','100000');

/*Table structure for table `t_subject` */

CREATE TABLE `t_subject` (
  `C_ID` varchar(32) NOT NULL,
  `C_NAME` varchar(100) DEFAULT NULL,
  `C_DESC` varchar(500) DEFAULT NULL,
  `C_ORDER` int(11) DEFAULT NULL,
  `C_TYPE` varchar(256) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_subject` */

insert  into `t_subject`(`C_ID`,`C_NAME`,`C_DESC`,`C_ORDER`,`C_TYPE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','异世大陆','异世大陆',2,'0','1','2015-12-29 01:03:28',NULL,NULL),('2c90808651e973060151e97306a50000','穿越剧','穿越剧',1,'0','1','2015-12-29 00:36:48','1','2015-12-30 00:11:02'),('40282e8152013ad80152013ad8ee0000','官场商战','官场商战',3,'0','1','2016-01-02 15:26:20',NULL,NULL);

/*Table structure for table `t_user` */

CREATE TABLE `t_user` (
  `C_ID` varchar(32) NOT NULL,
  `C_NAME` varchar(60) DEFAULT NULL,
  `C_ACCOUNT` varchar(60) DEFAULT NULL,
  `C_EMAIL` varchar(60) DEFAULT NULL,
  `C_PASSWORD` varchar(40) DEFAULT NULL,
  `C_MOBILE` varchar(20) DEFAULT NULL,
  `C_ROLE` varchar(60) DEFAULT NULL,
  `C_GENDER` varchar(1) DEFAULT NULL,
  `C_HONORIFIC` varchar(60) DEFAULT NULL,
  `C_LOGOURL` varchar(500) DEFAULT NULL,
  `C_STATUS` varchar(1) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`C_ID`,`C_NAME`,`C_ACCOUNT`,`C_EMAIL`,`C_PASSWORD`,`C_MOBILE`,`C_ROLE`,`C_GENDER`,`C_HONORIFIC`,`C_LOGOURL`,`C_STATUS`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','超级管理员','superman','superman@em.com','96e79218965eb72c92a549dd5a330112','13581700369','01,99','1','张老师','/img/user2-160x160.jpg','1','-1','2015-12-30 23:24:05',NULL,NULL),('40282e81522bba0501522bba05b30000','普通用户','nnn','nnn@em.com','96e79218965eb72c92a549dd5a330112','','01',NULL,'','/img/user2-160x160.jpg','1','1','2016-01-10 21:29:17',NULL,NULL),('40282e81524e72a901524eaa7f430001','哈哈儿','haha','haha@em.com','96e79218965eb72c92a549dd5a330112','13111111111','01,12',NULL,'哈老师','/img/user2-160x160.jpg','1','1','2016-01-17 16:19:03',NULL,NULL),('40282e8152d46ebb0152d46ebb3b0000','外部团队A','extmaker','windoutlove@163.com','96e79218965eb72c92a549dd5a330112','13666666666','01,52',NULL,'外老师','/img/user2-160x160.jpg','1','1','2016-02-12 15:42:53',NULL,NULL),('4028f8a351f92fd40151f931fa4d0001','测试账号','test','zhangzhonghua@ideamoment.com','96e79218965eb72c92a549dd5a330112','13222222222','01,03','9','','/img/default_user_logo.jpg','1','1','2016-01-01 01:59:41','1','2016-01-03 14:44:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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

DROP TABLE IF EXISTS `t_author`;

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

insert  into `t_author`(`C_ID`,`C_NAME`,`C_IDCARD`,`C_PSEUDONYM`,`C_DESC`,`C_FAMOUS`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','马未都',NULL,NULL,'擅长古风写作','1','1','2016-01-01 17:43:10',NULL,NULL),('10','南派三叔',NULL,NULL,'盗墓笔记作者','1','1','2016-01-01 17:43:10','1','2016-01-02 00:26:11'),('11','老猪',NULL,NULL,'《紫川》，哈哈','1','1','2016-01-01 17:43:10','1','2016-01-02 00:39:00'),('12','猫腻','110105198105050310','晓峰','新浪原创文学奖玄幻类金奖','1','1','2016-01-01 17:43:10','1','2016-01-02 00:37:21'),('2','于妈',NULL,NULL,'擅长都市言情、宫斗','0','1','2016-01-01 17:43:10',NULL,NULL),('3','海宴',NULL,NULL,'擅长谋略，代表作《琅琊榜》','1','1','2016-01-01 17:43:10',NULL,NULL),('4','不知名作者',NULL,NULL,'这个肯定不知名','0','1','2016-01-01 17:43:10','1','2016-01-02 00:43:33'),('40282e8151fdfe750151fdfe75d80000','唐家三少',NULL,NULL,'大神还用说吗？','0','1','2016-01-02 00:21:31',NULL,NULL),('40282e8151fdfe750151fe07ac270001','洛水',NULL,NULL,'大道残篇出洛水，半部天书知北游。','0','1','2016-01-02 00:31:34',NULL,NULL),('40282e81520db74f01520db74ff30000','忘语',NULL,'',NULL,'0','1','2016-01-05 01:37:43','1','2016-01-05 01:37:43'),('40282e81522bc87601522bc876560000','风笑',NULL,'',NULL,'0','1','2016-01-10 21:45:04','1','2016-01-10 21:45:04'),('40282e8152366af00152366af0470000','萧潜',NULL,'',NULL,'0','1','2016-01-12 23:18:44','1','2016-01-12 23:18:44'),('40282e8152366af00152366c8e430003','佚名',NULL,'',NULL,'0','1','2016-01-12 23:20:30','1','2016-01-12 23:20:30'),('40282e8152503a430152503a431c0000','今何在',NULL,'今何在',NULL,'0','1','2016-01-17 23:35:42','1','2016-01-17 23:35:42'),('40282e8152503a430152503bfd2d0003','太子',NULL,'',NULL,'0','1','2016-01-17 23:37:35','1','2016-01-17 23:37:35'),('40282e8152503a43015250400af60006','高晓松',NULL,'',NULL,'0','1','2016-01-17 23:42:00','1','2016-01-17 23:42:00'),('40282e81525043270152504327bd0000','吴承恩',NULL,'',NULL,'0','1','2016-01-17 23:45:24','1','2016-01-17 23:45:24'),('40282e8152e074d50152e5b972930001','测试',NULL,'小测',NULL,'0','1','2016-02-16 00:18:02','1','2016-02-16 00:18:02'),('40282e81532612fd01532612fd3d0000','刘强东',NULL,'',NULL,'0','1','2016-02-28 12:11:32','1','2016-02-28 12:11:32'),('40282e81534c83b201534c83b2c50000','管浒',NULL,'管虎',NULL,'0','40282e81522bba0501522bba05b30000','2016-03-06 23:20:13','40282e81522bba0501522bba05b30000','2016-03-06 23:20:13'),('40282e81534c83b201534c87bf820003','李捷',NULL,'',NULL,'0','40282e81522bba0501522bba05b30000','2016-03-06 23:24:38','40282e81522bba0501522bba05b30000','2016-03-06 23:24:38'),('40282e81534c83b201534c8b0a2f0006','李佩甫',NULL,'',NULL,'0','40282e81522bba0501522bba05b30000','2016-03-06 23:28:14','40282e81522bba0501522bba05b30000','2016-03-06 23:28:14'),('40282e81534cc12a01534cc12ac80000','迟子建',NULL,'',NULL,'0','40282e81522bba0501522bba05b30000','2016-03-07 00:27:21','40282e81522bba0501522bba05b30000','2016-03-07 00:27:21'),('40282e81534cc12a01534cc4c36b0003','江城',NULL,'',NULL,'0','40282e81522bba0501522bba05b30000','2016-03-07 00:31:17','40282e81522bba0501522bba05b30000','2016-03-07 00:31:17'),('40282e81534cc12a01534ccbfd1f0006','周德东',NULL,'',NULL,'1','40282e81522bba0501522bba05b30000','2016-03-07 00:39:10','40282e81522bba0501522bba05b30000','2016-03-07 00:39:10'),('5','作者5',NULL,'作者五','疯了...','0','1','2016-01-01 17:43:10','1','2016-01-02 02:10:27'),('6','作者6',NULL,NULL,'还是不行啊啊啊','0','1','2016-01-01 17:43:10','1','2016-01-02 14:17:02'),('7','作者7',NULL,NULL,'','0','1','2016-01-01 17:43:10',NULL,NULL),('8','作者8',NULL,NULL,'这是第8个了','0','1','2016-01-01 17:43:10','1','2016-01-02 14:17:30');

/*Table structure for table `t_copyright_contract` */

DROP TABLE IF EXISTS `t_copyright_contract`;

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
  `C_PRIVILEGES` varchar(20) DEFAULT NULL,
  `C_PRIVILEGE_TYPE` varchar(1) DEFAULT NULL,
  `C_PRIVILEGE_RANGE` varchar(1) DEFAULT NULL,
  `C_PRIVILEGE_DEADLINE` varchar(3) DEFAULT NULL,
  `C_BANK_ACCOUNT_NAME` varchar(300) DEFAULT NULL,
  `C_BANK_ACCOUNT_NO` varchar(30) DEFAULT NULL,
  `C_BANK` varchar(300) DEFAULT NULL,
  `C_TOTAL_PRICE` decimal(10,0) DEFAULT NULL,
  `C_AUDIT_STATE` varchar(2) DEFAULT NULL,
  `C_FINISH_TIME` datetime DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_contract` */

insert  into `t_copyright_contract`(`C_ID`,`C_CODE`,`C_OWNER`,`C_OWNER_CONTACT`,`C_OWNER_CONTACT_PHONE`,`C_OWNER_CONTACT_ADDRESS`,`C_OWNER_CONTACT_EMAIL`,`C_BUYER`,`C_BUYER_CONTACT`,`C_BUYER_CONTACT_PHONE`,`C_BUYER_CONTACT_ADDRESS`,`C_BUYER_CONTACT_EMAIL`,`C_PRIVILEGES`,`C_PRIVILEGE_TYPE`,`C_PRIVILEGE_RANGE`,`C_PRIVILEGE_DEADLINE`,`C_BANK_ACCOUNT_NAME`,`C_BANK_ACCOUNT_NO`,`C_BANK`,`C_TOTAL_PRICE`,`C_AUDIT_STATE`,`C_FINISH_TIME`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152b0a8290152b0a829d40000','C20160205-001','猫腻','猫腻','13111111111','中国好作家协会','mn@mn.com','北京悦库时光文化传媒有限公司','齐诗诗','13222222222','北广','qss@em.com','01,03,04','0','0','1','mao腻','1234567890','中国银行','20000','99','2016-02-21 00:37:49','1','2016-02-05 16:59:17','1','2016-02-05 16:59:17'),('40282e8152dae71c0152dae71cfd0000','C20160213-001','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','创想','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1',NULL,'1','2016-02-13 21:52:05','1','2016-02-13 21:52:05'),('40282e8152dae71c0152dae78a490002','C20160213-002','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1',NULL,'1','2016-02-13 21:52:33','1','2016-02-13 21:52:33'),('40282e8152dae71c0152dae80da10004','C20160213-003','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1',NULL,'1','2016-02-13 21:53:07','1','2016-02-13 21:53:07'),('40282e8152dae71c0152dae879d80006','C20160213-004','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','1',NULL,'1','2016-02-13 21:53:35','1','2016-02-13 21:53:35'),('40282e8152f527140152f527153e0000','C20160219-001','AA公司','大A','13777777777','A市','da@da.com','北京悦库时光文化传媒有限公司','马菲菲','13888888888','北广','mf@em.com','01,02','1','0','2','AA公司',NULL,'招商银行','300000','1',NULL,'1','2016-02-19 00:12:05','1','2016-02-19 00:12:05'),('40282e81532612fd0153266b75fc0005','C20160228-001','忘语','wangyu','13222222222','凡人谷','wy@em.com','北京悦库时光文化传媒有限公司','刘订订','13444444444','北广','ldd@em.com','01,02,03,04','0','0','1','王宇',NULL,'招商银行','1000','4',NULL,'1','2016-02-28 13:48:10','1','2016-02-28 13:48:10'),('40282e815332b2d4015332da69170002','C20160301-001','猫腻','moni','13444444444','猫家大院','moni@mn.com','北京悦库时光文化传媒有限公司','版权专员','13555555555','北广大厦','bqzy@em.com','01,02,03,04','0','0','1','猫腻','1234567890','中国银行','80000','99',NULL,'40282e81532145f1015323372cf80001','2016-03-01 23:44:48','40282e81532145f1015323372cf80001','2016-03-01 23:44:48');

/*Table structure for table `t_copyright_ctrt_audit` */

DROP TABLE IF EXISTS `t_copyright_ctrt_audit`;

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

insert  into `t_copyright_ctrt_audit`(`C_ID`,`C_CONTRACT_ID`,`C_AUDIT_REMARK`,`C_AUDITOR_ID`,`C_AUDIT_TIME`,`C_AUDIT_RESULT`) values ('2c9080a452c1aa420152c1aa42820000','40282e8152b0a8290152b0a829d40000','挺好','1','2016-02-09 00:15:07','1'),('40282e815302738c015302738c450000','40282e8152b0a8290152b0a829d40000','确实挺好的','1','2016-02-21 14:10:40','1'),('40282e815302738c01530273e7250001','40282e8152b0a8290152b0a829d40000','买吧，别犹豫了','1','2016-02-21 14:11:04','1'),('40282e81530294cb01530294cbce0000','40282e8152b0a8290152b0a829d40000','法务通过','1','2016-02-21 14:46:59','1'),('40282e815302ba3c015302bd3aac0002','40282e8152b0a8290152b0a829d40000','一致','1','2016-02-21 15:31:09','1'),('40282e815332f8d8015332fb83240001','40282e815332b2d4015332da69170002','作品还不错','40282e815332f8d8015332f8d8870000','2016-03-02 00:20:57','1'),('40282e815332f8d8015332fd0a710003','40282e815332b2d4015332da69170002','嗯，确实挺好','40282e815332f8d8015332fca32f0002','2016-03-02 00:22:37','1'),('40282e815332f8d8015332ffcb4a0005','40282e815332b2d4015332da69170002','就是贵了点，好就买','40282e815332f8d8015332fdb3970004','2016-03-02 00:25:38','1'),('40282e815332f8d80153332640000008','40282e815332b2d4015332da69170002','法务条款没问题','40282e815332f8d80153330a8dec0007','2016-03-02 01:07:38','1'),('40282e815332f8d80153332c00ea000b','40282e815332b2d4015332da69170002','都没问题了，oh yeah!','40282e815332f8d80153330a8dec0007','2016-03-02 01:13:55','1');

/*Table structure for table `t_copyright_ctrt_doc` */

DROP TABLE IF EXISTS `t_copyright_ctrt_doc`;

CREATE TABLE `t_copyright_ctrt_doc` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR_ID` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_VERSION` varchar(10) DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL,
  `C_TYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_ctrt_doc` */

insert  into `t_copyright_ctrt_doc`(`C_ID`,`C_CONTRACT_ID`,`C_CREATOR_ID`,`C_CREATETIME`,`C_VERSION`,`C_FILE_URL`,`C_TYPE`) values ('40282e815302738c0153027a3a7f0004','40282e8152b0a8290152b0a829d40000','1','2016-02-21 14:17:58','1.0','/uploadTmp/doc/20160221/310eac7421ad4543a125639650837aeb_面试评估表-UI岗位-zzh.docx',NULL),('40282e815302b220015302b220d80000','40282e8152b0a8290152b0a829d40000','1','2016-02-21 15:19:02','2.0','/uploadTmp/doc/20160221/42b323b503874d88b227108d18e2e3d4_sstc-saml-approved-errata-2.0.pdf',NULL),('40282e815332f8d80153330721300006','40282e815332b2d4015332da69170002','40282e81532145f1015323372cf80001','2016-03-02 00:33:39','1.0','/cc/20160302/cfcbee82961b4cb893c2a7d941bc9d0f.doc',NULL),('40282e815332f8d80153332736110009','40282e815332b2d4015332da69170002','40282e81532145f1015323372cf80001','2016-03-02 01:08:41','1.1','/uploadTmp/doc/20160302/746cbfdfcd444d95a0a4c2f1f61df1ed_面试评估表-UI岗位-zzh.docx',NULL),('40282e815332f8d801533327da65000a','40282e815332b2d4015332da69170002','40282e81532145f1015323372cf80001','2016-03-02 01:09:23','2.0','/uploadTmp/doc/20160302/a447c5089f8c477abe78048d8a392b74_SAML Core.docx',NULL);

/*Table structure for table `t_copyright_ctrt_prod` */

DROP TABLE IF EXISTS `t_copyright_ctrt_prod`;

CREATE TABLE `t_copyright_ctrt_prod` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_PRICE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_copyright_ctrt_prod` */

insert  into `t_copyright_ctrt_prod`(`C_ID`,`C_CONTRACT_ID`,`C_PRODUCT_ID`,`C_PRICE`) values ('40282e8152acfe830152ad4a13aa0003','40282e8152acfe830152ad4a13880002','40282e81522bc87601522bcb75850003','30000'),('40282e8152b0a8290152b0a82a030001','40282e8152b0a8290152b0a829d40000','40282e81522bc87601522bcb75850003','2000'),('40282e8152dae71c0152dae71d150001','40282e8152dae71c0152dae71cfd0000','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152dae78a5a0003','40282e8152dae71c0152dae78a490002','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152dae80dac0005','40282e8152dae71c0152dae80da10004','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152dae879e10007','40282e8152dae71c0152dae879d80006','40282e8152503a43015250410e640009','100000'),('40282e8152dae71c0152daf977f40009','40282e8152dae71c0152daf977c80008','40282e8152503a43015250400af90007','100000'),('40282e8152f527140152f52715af0001','40282e8152f527140152f527153e0000','40282e8152503a430152503a43200001','130000'),('40282e8152f527140152f52715d60002','40282e8152f527140152f527153e0000','40282e81522bc87601522bc8765a0001','170000'),('40282e81532612fd0153266b76280006','40282e81532612fd0153266b75fc0005','40282e81520db74f01520db7500e0001','1000'),('40282e815332b2d4015332da692c0003','40282e815332b2d4015332da69170002','40282e81532dc5b501532dcb82f20003','80000');

/*Table structure for table `t_email_setting` */

DROP TABLE IF EXISTS `t_email_setting`;

CREATE TABLE `t_email_setting` (
  `C_ID` varchar(32) NOT NULL,
  `C_HOSTNAME` varchar(200) DEFAULT NULL,
  `C_PORT` varchar(5) DEFAULT NULL,
  `C_TYPE` varchar(2) DEFAULT NULL,
  `C_FROM_EMAIL` varchar(200) DEFAULT NULL,
  `C_FROM_NAME` varchar(200) DEFAULT NULL,
  `C_USER_NAME` varchar(200) DEFAULT NULL,
  `C_PASSWORD` varchar(50) DEFAULT NULL,
  `C_SSL` varchar(2) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_email_setting` */

insert  into `t_email_setting`(`C_ID`,`C_HOSTNAME`,`C_PORT`,`C_TYPE`,`C_FROM_EMAIL`,`C_FROM_NAME`,`C_USER_NAME`,`C_PASSWORD`,`C_SSL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','smtp.163.com','25','1','piaostudio@163.com','悦库时光','piaostudio','Kn4944428','0','1','2016-03-01 00:38:53','1','2016-03-01 02:22:11');

/*Table structure for table `t_evaluation` */

DROP TABLE IF EXISTS `t_evaluation`;

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

insert  into `t_evaluation`(`C_ID`,`C_USER_ID`,`C_PRODUCT_ID`,`C_STORY_FRAME`,`C_STORY_TEXT`,`C_STORY_ROLE`,`C_STORY_TARGET`,`C_STORY_SUGGEST`,`C_MAKE_AUDIO_EDIT`,`C_MAKE_PLAY_TYPE`,`C_MAKE_PLAY_STYLE`,`C_MAKE_SUGGEST`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e81522c8f2001522c8f20700000','1','40282e81522bc87601522bcb75850003',4,2,3,'白领，家庭主妇','不错',2,'2,4,6,7','2','好好好好好','1','2016-01-11 01:22:03','1','2016-01-11 01:22:03'),('40282e815332b2d4015332b2d4560000','40282e8152d46ebb0152d46ebb3b0000','40282e81532dc5b501532dcb82f20003',5,4,5,NULL,'啥都挺好',2,'1,4','4','制作制作','40282e8152d46ebb0152d46ebb3b0000','2016-03-01 23:01:34','40282e8152d46ebb0152d46ebb3b0000','2016-03-01 23:01:34'),('40282e81534cc12a01534ef99a50000b','40282e8152d46ebb0152d46ebb3b0000','40282e81534cc12a01534cd8ffc20009',5,5,5,NULL,'建议多采购此作者作品',1,'1,2,3,5','4,5','尽快制作','40282e8152d46ebb0152d46ebb3b0000','2016-03-07 10:48:14','40282e8152d46ebb0152d46ebb3b0000','2016-03-07 10:48:14');

/*Table structure for table `t_final_evaluation` */

DROP TABLE IF EXISTS `t_final_evaluation`;

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

insert  into `t_final_evaluation`(`C_ID`,`C_PRODUCT_ID`,`C_REF_PRICE`,`C_PRODUCT_LEVEL`,`C_Author_LEVEL`,`C_STORY_VALUE`,`C_MAKE_VALUE`,`C_ONLY_WEB_CAST`,`C_HOT_SUBJECT`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e81524e72a901524e72a98d0000','40282e81522bc87601522bcb75850003','24000','0','1','2','2','0','1','1','2016-01-17 15:18:03',NULL,NULL),('40282e815332b2d4015332bb52b50001','40282e81532dc5b501532dcb82f20003','24000','1','1','2','2','0','1','40282e81532145f101532145f1cf0000','2016-03-01 23:10:51',NULL,NULL),('40282e81534cc12a01534efc131f000c','40282e81534cc12a01534cd8ffc20009','5760','0','1','2','2','1','0','40282e81532145f101532145f1cf0000','2016-03-07 10:50:56',NULL,NULL);

/*Table structure for table `t_make_contract` */

DROP TABLE IF EXISTS `t_make_contract`;

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
  `C_STATE` varchar(3) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_contract` */

insert  into `t_make_contract`(`C_ID`,`C_CODE`,`C_PRODUCT_ID`,`C_MAKER_ID`,`C_TARGET_TYPE`,`C_OWNER`,`C_OWNER_CONTACT`,`C_OWNER_CONTACT_PHONE`,`C_OWNER_CONTACT_ADDRESS`,`C_OWNER_CONTACT_EMAIL`,`C_WORKER`,`C_WORKER_CONTACT`,`C_WORKER_CONTACT_PHONE`,`C_WORKER_CONTACT_ADDRESS`,`C_WORKER_CONTACT_EMAIL`,`C_TOTAL_SECTION`,`C_PRICE`,`C_TOTAL_PRICE`,`C_PENALTY`,`C_SHOWER_ID`,`C_BANK_ACCOUNT_NAME`,`C_BANK_ACCOUNT_NO`,`C_BANK`,`C_STATE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152d6816a0152d683a9250001','M20160213-001','40282e8152503a43015250410e640009','40282e8152d46ebb0152d46ebb3b0000','0','悦库时光','王婷','13111111111','北广','wt@em.com','高大壮','高大壮','13222222222','大壮家里','gdz@gdz.com',50,'2000','100000','200',NULL,'高大壮','高大壮','中国银行','0','1','2016-02-13 01:24:59','1','2016-02-13 01:24:59'),('40282e815332f8d80153334dc495000d','M20160302-001','40282e81532dc5b501532dcb82f20003','40282e8152d46ebb0152d46ebb3b0000','0','悦库时光','刘诗诗','13433322211','北广大厦','lss@em.com','王月坡','王月坡','13245654321','北京','wyp@yp.com',30,'200','6000','200',NULL,'王月坡','王月坡','中国银行','10','40282e815332f8d8015333321b92000c','2016-03-02 01:50:48','40282e815332f8d8015333321b92000c','2016-03-03 00:59:03');

/*Table structure for table `t_make_ctrt_doc` */

DROP TABLE IF EXISTS `t_make_ctrt_doc`;

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

insert  into `t_make_ctrt_doc`(`C_ID`,`C_CONTRACT_ID`,`C_CREATOR_ID`,`C_CREATETIME`,`C_VERSION`,`C_FILE_URL`) values ('40282e8152d93c190152d93c192d0000','40282e8152d6816a0152d683a9250001','1','2016-02-13 14:05:40','1.0','/mc/20160213/820b17e815ef4d0f9337c82716c4239d.doc'),('40282e8152d93c190152d94305f00001','40282e8152d6816a0152d683a9250001','1','2016-02-13 14:13:14','1.1','/uploadTmp/doc/20160213/548a7c02c80b48b8ab388bf5146b2650_SAML Core.docx'),('40282e815332f8d80153334e7146000e','40282e815332f8d80153334dc495000d','40282e815332f8d8015333321b92000c','2016-03-02 01:51:32','1.0','/mc/20160302/f45e310ad662475b868f1988c7a2ab23.doc'),('40282e815332f8d80153334eb865000f','40282e815332f8d80153334dc495000d','40282e815332f8d8015333321b92000c','2016-03-02 01:51:50','1.1','/uploadTmp/doc/20160302/e0f287442a174d938fe60926c280e0b2_委托书.txt');

/*Table structure for table `t_make_task` */

DROP TABLE IF EXISTS `t_make_task`;

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

insert  into `t_make_task`(`C_ID`,`C_NAME`,`C_PRODUCT_ID`,`C_MAKER_ID`,`C_TIME_SECTION`,`C_TOTAL_SECTION`,`C_SHOW_TYPE`,`C_MAKE_TIME`,`C_SHOW_EXPECTION`,`C_CONTRACT_ID`,`C_STATE`,`C_DESC`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152d49fd10152d49fd1290000','搜神传','40282e8152503a43015250410e640009','40282e8152d46ebb0152d46ebb3b0000',20,50,'1',30,'说得好点','','0','钱好说','1','2016-02-12 16:36:30','1','2016-02-12 16:36:30'),('40282e8152eaf2b00152eaf2b06e0000','测试作品','40282e8152e074d50152e5d614a50005','40282e8152d46ebb0152d46ebb3b0000',30,20,'1',20,'说得好点','','0','钱好说','1','2016-02-17 00:38:39','1','2016-02-17 00:38:39'),('40282e815332f8d80153334fac150010','择天记','40282e81532dc5b501532dcb82f20003','40282e8152d46ebb0152d46ebb3b0000',25,NULL,'1',20,'王月坡就行','','1','一定要王月坡','40282e815332f8d8015333321b92000c','2016-03-02 01:52:53','40282e815332f8d8015333321b92000c','2016-03-02 23:33:50');

/*Table structure for table `t_make_task_audio` */

DROP TABLE IF EXISTS `t_make_task_audio`;

CREATE TABLE `t_make_task_audio` (
  `C_ID` varchar(32) NOT NULL,
  `C_MAKE_TASK_ID` varchar(32) DEFAULT NULL,
  `C_TITLE` varchar(300) DEFAULT NULL,
  `C_STATE` varchar(2) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_task_audio` */

insert  into `t_make_task_audio`(`C_ID`,`C_MAKE_TASK_ID`,`C_TITLE`,`C_STATE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e815313f716015313f717020000','40282e8152eaf2b00152eaf2b06e0000','第一集',NULL,'1','2016-02-24 23:47:54','1','2016-02-24 23:47:54'),('40282e815319920f015319933a900001','40282e8152eaf2b00152eaf2b06e0000','第二集',NULL,'1','2016-02-26 01:56:33','1','2016-02-26 01:56:33'),('40282e815337f817015337f8176b0000','40282e815332f8d80153334fac150010','样带一','1','40282e8152d46ebb0152d46ebb3b0000','2016-03-02 23:35:19','40282e815332f8d8015333321b92000c','2016-03-03 00:29:35'),('40282e81533841cd01533841cd840000','40282e815332f8d80153334fac150010','第一集','0','40282e8152d46ebb0152d46ebb3b0000','2016-03-03 00:55:50','40282e8152d46ebb0152d46ebb3b0000','2016-03-03 00:55:50'),('40282e81534cc12a01534f1077e6000d','40282e815332f8d80153334fac150010','第二集','1','40282e8152d46ebb0152d46ebb3b0000','2016-03-07 11:13:13','40282e815332f8d8015333321b92000c','2016-03-07 11:16:32');

/*Table structure for table `t_make_task_audio_audit` */

DROP TABLE IF EXISTS `t_make_task_audio_audit`;

CREATE TABLE `t_make_task_audio_audit` (
  `C_ID` varchar(32) NOT NULL,
  `C_MAKE_TASK_AUDIO_ID` varchar(32) DEFAULT NULL,
  `C_RESULT` varchar(2) DEFAULT NULL,
  `C_REMARK` varchar(600) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_task_audio_audit` */

insert  into `t_make_task_audio_audit`(`C_ID`,`C_MAKE_TASK_AUDIO_ID`,`C_RESULT`,`C_REMARK`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e815319920f015319920f7b0000','40282e815313f716015313f717020000','-1','哪不好了？','1','2016-02-26 01:55:16','1','2016-02-26 01:55:16'),('40282e815319920f01531993a2030003','40282e815319920f015319933a900001','-1','新出炉的','1','2016-02-26 01:56:59','1','2016-02-26 01:56:59'),('40282e815319920f01531993d5150004','40282e815313f716015313f717020000','-1','快说呀','1','2016-02-26 01:57:12','1','2016-02-26 01:57:12'),('40282e815337f817015337f9d03b0002','40282e815337f817015337f8176b0000','-1','听着不行啊，再改改','40282e815332f8d8015333321b92000c','2016-03-02 23:37:12','40282e815332f8d8015333321b92000c','2016-03-02 23:37:12'),('40282e81534cc12a01534f12474d000f','40282e81534cc12a01534f1077e6000d','-1','讲得太慢','40282e815332f8d8015333321b92000c','2016-03-07 11:15:11','40282e815332f8d8015333321b92000c','2016-03-07 11:15:11'),('40282e81534cc12a01534f1339ab0010','40282e81534cc12a01534f1077e6000d','-1','我觉得还行啊','40282e8152d46ebb0152d46ebb3b0000','2016-03-07 11:16:13','40282e8152d46ebb0152d46ebb3b0000','2016-03-07 11:16:13');

/*Table structure for table `t_make_task_audio_file` */

DROP TABLE IF EXISTS `t_make_task_audio_file`;

CREATE TABLE `t_make_task_audio_file` (
  `C_ID` varchar(32) NOT NULL,
  `C_MAKE_TASK_AUDIO_ID` varchar(32) DEFAULT NULL,
  `C_VERSION` varchar(30) DEFAULT NULL,
  `C_FILE_URL` varchar(1000) DEFAULT NULL,
  `C_STATE` varchar(2) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_make_task_audio_file` */

insert  into `t_make_task_audio_file`(`C_ID`,`C_MAKE_TASK_AUDIO_ID`,`C_VERSION`,`C_FILE_URL`,`C_STATE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8153192c490153192c49bc0000','40282e815313f716015313f717020000','1.0',NULL,NULL,'1','2016-02-26 00:04:06','1','2016-02-26 00:04:06'),('40282e815319920f0153199369c50002','40282e815319920f015319933a900001','1.0',NULL,NULL,'1','2016-02-26 01:56:45','1','2016-02-26 01:56:45'),('40282e815337f817015338027d4b0003','40282e815337f817015337f8176b0000','1.0','/uploadTmp/audio/20160302/8f8afc79d02b451eb39373a83cfbcf03_Kalimba.mp3','1','40282e8152d46ebb0152d46ebb3b0000','2016-03-02 23:46:41','40282e815332f8d8015333321b92000c','2016-03-03 00:29:35'),('40282e81533841cd01533842166a0001','40282e81533841cd01533841cd840000','1.0','/uploadTmp/audio/20160303/191141659f0745e1888aaebc9adfc813_Sleep Away.mp3','0','40282e8152d46ebb0152d46ebb3b0000','2016-03-03 00:56:09','40282e8152d46ebb0152d46ebb3b0000','2016-03-03 00:56:09'),('40282e81534cc12a01534f10af5f000e','40282e81534cc12a01534f1077e6000d','1.0','/uploadTmp/audio/20160307/1a8d2051351e4aa2bdd8fbe8b91b2c66_Kalimba.mp3','1','40282e8152d46ebb0152d46ebb3b0000','2016-03-07 11:13:27','40282e815332f8d8015333321b92000c','2016-03-07 11:16:32');

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

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
  `C_RESERVED` varchar(1) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`C_ID`,`C_NAME`,`C_SUBJECT_ID`,`C_AUTHOR_ID`,`C_TYPE`,`C_PUBLISH_STATE`,`C_PUBLISH_YEAR`,`C_FINISH_YEAR`,`C_STATE`,`C_WORD_COUNT`,`C_SECTION_COUNT`,`C_SECTION_LENGTH`,`C_PRESS`,`C_WEBSITE`,`C_SUMMARY`,`C_HAS_AUDIO`,`C_AUDIO_COPYRIGHT`,`C_AUDIO_DESC`,`C_ISBN`,`C_LOGO_URL`,`C_RESERVED`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','侯卫东官场笔记5','40282e8152013ad80152013ad8ee0000','10','0','0','2011.2',NULL,'1',300000,NULL,NULL,NULL,NULL,'沙州市成津县县委书记章永泰车祸身亡，这究竟是意外事故，还是一起精心策划的人为谋杀？侯卫东临危受命，被市委书记周昌全派至成津县任县委副书记，查处章永泰真实死因，整治成津县乱局。以常务副县长李太忠为代表的地方势力，插手矿业生产，损公肥私，对侯卫东进行了孤立。侯卫东经过详细谋划，在一番合情合理的正常公务中，不动声色地替换和提拔了20名干部。在各项整顿工作初见成效时，周昌全离开沙州到省里工作，新书记降临沙州。侯卫东的官场命运，又将如何再生波澜……','0',NULL,NULL,'978-7-5506-0055-3',NULL,'1','1','2016-01-02 17:25:27',NULL,NULL),('40282e81520db74f01520db7500e0001','凡人修仙传','1','40282e81520db74f01520db74ff30000','0','0','2014','2016','5',120,NULL,NULL,'创想时刻出版社','','凡人修仙传，韩立','0','1','',NULL,NULL,'0','1','2016-01-05 01:37:43','1','2016-01-05 01:37:43'),('40282e81522bc87601522bc8765a0001','官仙','1','40282e81522bc87601522bc876560000','0','1','2016','2016','5',300,NULL,NULL,'','起点中文网','一个仙人穿越做官','0','1','',NULL,NULL,'0','1','2016-01-10 21:45:04','1','2016-01-10 21:45:04'),('40282e81522bc87601522bcb75850003','庆余年','1','12','0','0','2013','2016','7',100,NULL,NULL,'不记得了','','庆余年','0','1','','1234567','/img/default_product_logo.jpg','1','1','2016-01-10 21:48:20','1','2016-01-25 23:36:57'),('40282e8152366af00152366af04a0001','斗破苍穹','1','40282e8152366af00152366af0470000','0','0','2016','2016','1',200,NULL,NULL,'不知道什么出版社','','斗破苍穹，萧炎','0','1','',NULL,NULL,'0','1','2016-01-12 23:18:44','1','2016-01-12 23:18:44'),('40282e8152366af00152366c8e490004','七侠五义','1','40282e8152366af00152366c8e430003','0','0','2016','2016','1',80,NULL,NULL,'不知道什么出版社','','七侠五义','0','1','',NULL,NULL,'0','1','2016-01-12 23:20:30','1','2016-01-12 23:20:30'),('40282e8152503a430152503a43200001','悟空传','1','40282e8152503a430152503a431c0000','0','0','2016','2016','5',5,NULL,NULL,'中信出版社','','悟空传悟空传悟空传','0','1','',NULL,NULL,'0','1','2016-01-17 23:35:42','1','2016-01-17 23:35:42'),('40282e8152503a430152503bfd300004','太子妃升职记','1','40282e8152503a430152503bfd2d0003','0','1','2016','2015','0',28,NULL,NULL,'','起点','太子妃升职记，穿越','0','1','','',NULL,'1','1','2016-01-17 23:37:35','1','2016-02-14 23:44:59'),('40282e8152503a43015250400af90007','睡在我上铺的兄弟','1','40282e8152503a43015250400af60006','0','0','2016','2016','5',14,NULL,NULL,'什么什么出版社','','睡在我上铺的兄弟','0','1','',NULL,NULL,'0','1','2016-01-17 23:42:00','1','2016-01-17 23:42:00'),('40282e8152503a43015250410e640009','搜神传','1','40282e8152503a43015250400af60006','0','0','2015','2016','14',14,NULL,NULL,'什么什么出版社','','搜神传','0','1','','',NULL,'0','1','2016-01-17 23:43:07','1','2016-02-13 15:09:14'),('40282e81525043270152504327c20001','三国演义','1','40282e81525043270152504327bd0000','0','0','2014','2016','2',80,NULL,NULL,'松花出版集团','','三国演义一','0','1','','1230987654901',NULL,'0','1','2016-01-17 23:43:07','1','2016-02-27 12:24:29'),('40282e8152e074d50152e5d614a50005','测试作品','2c90808651e973060151e97306a50000','40282e8152e074d50152e5b972930001','0','3','2016','2016','0',100,NULL,NULL,'','','写的啥都不知道','0','1','',NULL,NULL,'0','1','2016-02-16 00:49:18','1','2016-02-16 00:49:18'),('40282e815320c600015320ea8e2b0006','将夜','2c90808651e973060151e97306a50000','12','0','0','2016','2016','0',60,NULL,NULL,'','','','0','1','','',NULL,NULL,'1','2016-02-27 12:09:16','1','2016-02-27 12:15:44'),('40282e81532612fd01532612fd640001','创京东','2c90808651e973060151e97306a50000','40282e81532612fd01532612fd3d0000','0','0','2016','2016','50',22,NULL,NULL,'中信','','创京东','0','1','',NULL,NULL,NULL,'1','2016-02-28 12:11:32','1','2016-02-28 23:47:55'),('40282e81532dc5b501532dcb82f20003','择天记','1','12','0','1','2016','2016','13',8,NULL,NULL,'','起点中文网','择天记，猫腻新作','0','1','','',NULL,NULL,'40282e81522bba0501522bba05b30000','2016-03-01 00:10:25','40282e815332f8d8015333321b92000c','2016-03-03 00:59:03'),('40282e81534c83b201534c83b2de0001','老炮儿','2c90808651e973060151e97306a50000','40282e81534c83b201534c83b2c50000','0','0','2016','2016','2',10,NULL,NULL,'北京长江新世纪文化传媒有限公司','','曾经风光四九城的老炮六爷，难以适应社会巨变，蛰伏于胡同深处，过着溜鸟、管闲事、发牢骚的无聊日子。\n\n某日，六爷和“小炮儿”儿子晓波父子间产生巨大情感冲突，导致小炮儿负气离家出走，不想遭遇暗算，被新崛起一代的“小爷”小飞非法拘禁。为了解救儿子，并偿还当年对儿子的愧疚之情，六爷重出江湖。\n\n六爷用自己的规矩，试图摆平事件，却无奈的发现，无论是这个时代，还是自己的身体，早已今非昔比。一场父子恩仇、新旧势力的对决无法避免。\n\n在解决烂摊子的过程当中，老炮发现自己身体也出现了问题，真正力不从心。但同时也在抽丝剥茧的查询过程中抓住了“三环十二郎”的把柄，两人下了对战书决定来一场单挑。\n','0','1','','928-7-5354-8244-0','/uploadTmp/img/laopaoer_fxg.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-06 23:20:13','40282e81532145f101532145f1cf0000','2016-03-06 23:39:41'),('40282e81534c83b201534c87bfbb0004','克拉恋人','2c90808651e973060151e97306a50000','40282e81534c83b201534c87bf820003','0','0','2015','2016','1',35,NULL,NULL,'作家出版社','','米朵爱上了钻石公司总裁萧亮，条件的悬殊使米朵望而却步，不敢表白。然而，一场车祸彻底改变了她的命运，车祸整容后的米朵变得苗条漂亮，她应聘进入钻石公司工作，成为了一名设计师助理。经历了失恋失业的双重打击后，米朵意识到美貌并不是获得爱情的通行证，她不再被美貌和丑陋所困扰，她要成为一名合格的珠宝设计师。米朵在职场上经历了种种挫折，她屡败屡战、不言放弃。米朵的乐观积极深深吸引了萧亮，她终于收获了梦想与爱情。与此同时，好友雷奕明始终以朋友的身份守护着米朵，在帮助米朵实现梦想的过程中也情不自禁的喜欢上她，米朵面临着朋友与爱人之间的选择。最终，米朵远走比利时，去完成设计师的梦想……\n','0','1','','978-7-5063-8193-2','/uploadTmp/img/kelalianren_cover.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-06 23:24:38','40282e81522bba0501522bba05b30000','2016-03-06 23:28:59'),('40282e81534c83b201534c8b0a520007','生命册','2c90808651e973060151e97306a50000','40282e81534c83b201534c8b0a2f0006','0','0','2013','2016','1',38,NULL,NULL,'作家出版社','','“我”是从乡村走入省城的大学教师，希望摆脱农村成为一个完完整整的“城里人”，无奈老姑父不时传来的要求“我”为村人办事的指示性纸条让“我”很是为难，在爱情的憧憬与困顿面前，“我”毅然接受大学同学“骆驼”的召唤，辞去稳定的工作成为一个北漂。北京的模样完全不是我们当初预想的那般美好，在地下室里当了几个月的“枪手”挖到一桶金后，为了更宏大的理想，“我”和“骆驼”分别奔赴上海和深圳开辟新的商业战场。\n　　“骆驼”虽有残疾，却凭借超出常人的智力和果断杀入股票市场并赢得了巨额财富。而在追逐金钱的过程中，“骆驼”的欲望和贪婪也日益膨胀，他使出浑身解数攀附进官场名利场，不惜用金钱和美色将他人拉下水，而自己也在对欲望的追逐中逐渐走失了最初的理想，最终身陷囹圄，人财两空。\n　　生“我”养“我”的无梁村，有“我”极力摆脱却终挥之不去的记忆。哺育“我”十多年的老姑父为了爱情放弃了军人的身份，却在之后的几十年生活中深陷家庭矛盾无法自拔；上访户梁五方青年时凭借倔强的干劲打下了一片基业，却在运动中成为人们打击的目标，后半生困在无休止的上访漩涡里；为了拉扯大三个孩子，如草芥般的虫嫂沦为小偷，陷入人人可唾的悲剧命运；村里的能手春才，在青春期性的诱惑和村人的闲言碎语中自宫……在时代与土地的变迁中，似乎每个人都不可避免地走向了自己的反面……\n','0','1','','978-7-5063-6243-6','/uploadTmp/img/shengmingce_cover.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-06 23:28:14','40282e81522bba0501522bba05b30000','2016-03-06 23:28:14'),('40282e81534cc12a01534cc12acb0001','群山之巅','2c90808651e973060151e97306a50000','40282e81534cc12a01534cc12ac80000','0','0','2015','2016','1',21,NULL,NULL,'人民文学出版社','','《群山之巅》是著名作家迟子建暌违五年之后，最新长篇小说。写作历时两年，是呕心沥血、大气磅礴之作。\n《群山之巅》比《额尔古纳河右岸》更苍茫雄浑，比《白雪乌鸦》更跌宕精彩。\n小说分“斩马刀”、“制碑人”、“龙山之翼”、“两双手”、“白马月光”、“生长的声音”、“追捕”、“格罗江英雄曲”、“从黑夜到白天”、“旧货节”、“肾源”、“暴风雪”、“毛边纸船坞”、“花老爷洞”、“黑珍珠”、“土地祠”等十七章，笔触如史诗般波澜壮阔，却又诗意而抒情。\n中国北方苍茫的龙山之翼，一个叫龙盏的小镇，屠夫辛七杂、能预知生死的精灵“小仙”安雪儿、击毙犯人的法警安平、殡仪馆理容师李素贞、绣娘、金素袖等，一个个身世性情迥异的小人物，在群山之巅各自的滚滚红尘中浮沉，爱与被爱，逃亡与复仇，他们在诡异与未知的命运中努力寻找出路；怀揣着各自不同的伤残的心，努力活出人的尊严，觅寻爱的幽暗之火……\n','0','1','','978-7-02-010693-6','/uploadTmp/img/qunshanzhidian_cover.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-07 00:27:21','40282e81522bba0501522bba05b30000','2016-03-07 00:27:21'),('40282e81534cc12a01534cc4c36d0004','历史深入的民国-晚清','2c90808651e973060151e97306a50000','40282e81534cc12a01534cc4c36b0003','0','0','2014','2016','1',29,NULL,NULL,'华文出版社','','这是一套关于中国近代百年正史的彪悍史书。\n\n是中国历史上第一套全面解读民国正史的长篇历史力作。作者在精研民国史料的基础上，以尊重史实的严谨态度创作，以年代和具体人物为主线，用通俗易懂、幽默风趣的语言风格行笔，全新讲述了1840～1945这一百年间的一些我们熟悉的人做过的一些我们并不熟悉的事……\n\n从来没有一本关于民国的书籍，能像《历史深处的民国》这样，全面、真实、透彻、有趣地将民国这段历史讲明白说清楚。因此，《历史深处的民国》是当下中国数千万“民国迷”了解民国、认识民国的首选读本。\n\n第一部《晚清》全景勾勒了从1840到1911前后近七十年波澜壮阔的历史，重点描述了清王朝内部改革力量曾国藩、李鸿章、袁世凯，清朝统治者慈禧、光绪，在野力量革命派、立宪派三方，围绕该挽救清朝还是推倒清朝重来而展开的一系列惊心动魄的故事。\n\n重点突出了鸦片战争，太平天国运动，洋务运动，八国联军侵华，晚清革命，晚清立宪改革等重大历史事件，以轻松的笔调、严谨的态度认真探究了为何封建帝制已经走到了穷途末路，以及共和的曙光在中国显现的原因。','0','1','','987-7-5075-4229-5','/uploadTmp/img/lsscdmg_cover.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-07 00:31:17','40282e81522bba0501522bba05b30000','2016-03-07 00:31:17'),('40282e81534cc12a01534ccbfd220007','三减一等于几','2c90808651e973060151e97306a50000','40282e81534cc12a01534ccbfd1f0006','0','0','2013','2016','1',29,NULL,NULL,'中国电影出版社','','773恐怖系列小说。讲述被抛弃的畸形儿对社会的报复.他的身体是个孩子可是思想已经是个成年人了,这是一种病,具体叫什么我就忘记了.他怕被人嘲笑,怕被人当猴耍.他的身体、外貌永远停留在婴儿时期的状态.\n　　他身体内里的一切都在正常成长.\n　　他洞晓人情世故,但是他的眼神永远是婴儿的纯净.\n　　他懂得男欢女爱,他有成熟的欲望,但是他的阳具永远是婴儿的弱小.\n　　他嫉妒雄壮的男人和漂亮的女人；他沉迷母性；他仇恨幸福的孩子,仇恨跟他争夺爱的真正的孩子.\n　　他不想向世人吐露真相,他害怕承担生活责任.\n　　他怕被人看成是怪物,当猴耍.他怕遭到这个世界的歧视和利用.\n　　他躲在婴儿的世界里,享受这个世界的母爱.\n　　由于外型和内心的日久天长的冲突,他极度变态.\n　　他小肚鸡肠,他阴险毒辣,他嗜杀成性,他恐怖异常.\n　　他被母亲揭穿秘密后,骗来另一个孪生兄弟,把他害死做替罪羊……全镇人都静静等待大难降临自己.\n那个收破烂的老太太就是他的母亲,最后他把母亲杀了,把她的肚子剖开了,自己钻进了母腹.\n','0','1','','7-106-01776-0','/uploadTmp/img/3jian1dengyuji_cover.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-07 00:39:10','40282e81522bba0501522bba05b30000','2016-03-07 00:39:10'),('40282e81534cc12a01534cd8ffc20009','天惶惶地惶惶','2c90808651e973060151e97306a50000','40282e81534cc12a01534ccbfd1f0006','0','0','2013','2016','4',20,NULL,NULL,'中国电影出版社','','就像你们一直在研究猩猩一样，我也一直在考察你们这种动物的特性，智商到底有多高，还考察你们人性中的东西。在这个地球上，我选一个人，选到了你。通过你，我对人类了如指掌。你为什么感到我熟悉呢？因为我跟着你20多年了。某年某月某天，一个女人出现在你的旁边，那天的天气很好，只是当时谁都没有朝上看，那一刻，太阳是黑色的……','0','1','','7-106-01856-2','/uploadTmp/img/thhdhh_cover.jpg',NULL,'40282e81522bba0501522bba05b30000','2016-03-07 00:53:23','40282e81532145f101532145f1cf0000','2016-03-07 10:43:46');

/*Table structure for table `t_product_audio` */

DROP TABLE IF EXISTS `t_product_audio`;

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

insert  into `t_product_audio`(`C_ID`,`C_PRODUCT_ID`,`C_NAME`,`C_FILE_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152d16c5b0152d16fa5330001','40282e8152503a430152503bfd300004','样章一','/uploadTmp/audio/20160212/2dc62a9cbf06474fb93ad81b5467a6a6_Maid with the Flaxen Hair.mp3','1','2016-02-12 01:45:01','1','2016-02-12 01:45:01'),('40282e8153285e880153285ef3ae0001','40282e8152503a43015250410e640009','第一集','/uploadTmp/audio/20160228/1cb9c83fd65a4c438dd14bb271820186_Sleep Away.mp3','1','2016-02-28 22:53:45','1','2016-02-28 22:53:45'),('40282e81534cc12a01534f1383680011','40282e81532dc5b501532dcb82f20003','第二集','/uploadTmp/audio/20160307/1a8d2051351e4aa2bdd8fbe8b91b2c66_Kalimba.mp3','40282e815332f8d8015333321b92000c','2016-03-07 11:16:32','40282e815332f8d8015333321b92000c','2016-03-07 11:16:32');

/*Table structure for table `t_product_copyright_file` */

DROP TABLE IF EXISTS `t_product_copyright_file`;

CREATE TABLE `t_product_copyright_file` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR_ID` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_copyright_file` */

/*Table structure for table `t_product_image` */

DROP TABLE IF EXISTS `t_product_image`;

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

insert  into `t_product_image`(`C_ID`,`C_PRODUCT_ID`,`C_NAME`,`C_DESC`,`C_FILE_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152cf6c690152cf6c693d0000','40282e8152503a430152503bfd300004','测试图','320*640','/uploadTmp/doc/20160211/ee36a64832fd4511ac6ee5a98a118b2c_Desert.jpg','1','2016-02-11 16:22:15','1','2016-02-11 16:22:15'),('40282e8152d0ee4b0152d0ee4b550000','40282e8152503a430152503bfd300004','再试一张','菊花','/uploadTmp/doc/20160211/717cc6434bfe4ead8b80f3afe0c6dfe8_Chrysanthemum.jpg','1','2016-02-11 23:23:44','1','2016-02-11 23:23:44'),('40282e8152d0ee4b0152d10f5c900001','40282e8152503a430152503bfd300004','再来','三只企鹅','/uploadTmp/doc/20160211/44b53d73b3da481580475e079bdf27a0_Penguins.jpg','1','2016-02-11 23:59:51','1','2016-02-11 23:59:51'),('40282e8153285e880153285e88550000','40282e8152503a43015250410e640009','封面','222222','/uploadTmp/doc/20160228/fc260fb88eb8495783417f17ce176680_Desert.jpg','1','2016-02-28 22:53:17','1','2016-02-28 22:53:17');

/*Table structure for table `t_product_reserved` */

DROP TABLE IF EXISTS `t_product_reserved`;

CREATE TABLE `t_product_reserved` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) DEFAULT NULL,
  `C_DESC` varchar(600) DEFAULT NULL,
  `C_STATE` varchar(2) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_reserved` */

insert  into `t_product_reserved`(`C_ID`,`C_PRODUCT_ID`,`C_DESC`,`C_STATE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e815304ffe6015304ffe6480000',NULL,NULL,'0','1','2016-02-22 02:03:13','1','2016-02-22 02:03:13'),('40282e815304ffe601530501e5cc0001','40282e81522bc87601522bcb75850003','这个我要了','0','1','2016-02-22 02:05:24','1','2016-02-22 02:05:24');

/*Table structure for table `t_product_sample` */

DROP TABLE IF EXISTS `t_product_sample`;

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

insert  into `t_product_sample`(`C_ID`,`C_PRODUCT_ID`,`C_FILE_URL`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152366af00152366c8e4d0005','40282e8152366af00152366c8e490004','/uploadTmp/doc/20160112/b1b8d223eeae4ef89c043c2c1799a5c2_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a430152503a43260002','40282e8152503a430152503a43200001','/uploadTmp/doc/20160117/bd0eff6dea6149088da6411d0a400cfa_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a430152503bfd370005','40282e8152503a430152503bfd300004','/uploadTmp/doc/20160117/d1c9423cc6d3447a974ddbed1858ee9c_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a43015250400afe0008','40282e8152503a43015250400af90007','/uploadTmp/doc/20160117/91a4b1eac3814828843741fef7ff35bd_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152503a43015250410e66000a','40282e8152503a43015250410e640009','/uploadTmp/doc/20160117/91a4b1eac3814828843741fef7ff35bd_需求细则.docx',NULL,NULL,NULL,NULL),('40282e81525043270152504327c60002','40282e81525043270152504327c20001','/uploadTmp/doc/20160117/71978d30a6054deca1bc8fde40d8d563_需求细则.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e074d5320000','40282e8152503a430152503bfd300004','',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5b9729a0002',NULL,'/uploadTmp/doc/20160216/07280dcf4ea541d2802746367327505d_SAML Core.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5baebd50003',NULL,'/uploadTmp/doc/20160216/da25da962f5847d3b7a3b2f2fd0c04ba_面试评估表-UI岗位-zzh.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5cd991c0004',NULL,'/uploadTmp/doc/20160216/0ededcb25913492294f24dcee5e94d4c_SAML Core.docx',NULL,NULL,NULL,NULL),('40282e8152e074d50152e5d614a80006','40282e8152e074d50152e5d614a50005','/uploadTmp/doc/20160216/3d1eda4c58b34bf6b908f192fdc76d7d_SAML Core.docx',NULL,NULL,NULL,NULL),('40282e81531ee4ce01531ee4cf100001','','',NULL,NULL,NULL,NULL),('40282e81531ee4ce01531ee57b370002','','',NULL,NULL,NULL,NULL),('40282e81531ee4ce01531ee716690003','','',NULL,NULL,NULL,NULL),('40282e815320c600015320c600a90000','','',NULL,NULL,NULL,NULL),('40282e815320c600015320c8304b0001','','',NULL,NULL,NULL,NULL),('40282e815320c600015320c9d27a0003','40282e815320c600015320c9d2760002','',NULL,NULL,NULL,NULL),('40282e815320c600015320ea29620005','40282e815320c600015320ea295d0004','',NULL,NULL,NULL,NULL),('40282e815320c600015320ea8e2e0007','40282e815320c600015320ea8e2b0006','',NULL,NULL,NULL,NULL),('40282e815320c600015320f07b380008','40282e815320c600015320ea8e2b0006','',NULL,NULL,NULL,NULL),('40282e81532612fd01532612fd680002','40282e81532612fd01532612fd640001','/uploadTmp/doc/20160228/141ce4f08ee94f5abc974ddb0789a21f_my jobword.doc',NULL,NULL,NULL,NULL),('40282e8153285e88015328908a940002','40282e81532612fd01532612fd640001','/uploadTmp/doc/20160228/141ce4f08ee94f5abc974ddb0789a21f_my jobword.doc',NULL,NULL,NULL,NULL),('40282e81532dc5b501532dc5b5600000','','/uploadTmp/doc/20160301/a815a54ed4a24db89f694d6868bc9450_委托书.txt',NULL,NULL,NULL,NULL),('40282e81532dc5b501532dc6f79b0001','','/uploadTmp/doc/20160301/f01f4bc04a3547a99f318c99e5aa48d2_委托书.txt',NULL,NULL,NULL,NULL),('40282e81532dc5b501532dc8bc530002','','/uploadTmp/doc/20160301/f01f4bc04a3547a99f318c99e5aa48d2_委托书.txt',NULL,NULL,NULL,NULL),('40282e81532dc5b501532dcb83080004','40282e81532dc5b501532dcb82f20003','/uploadTmp/doc/20160301/0bdf655972a14a0887999b9fc930b381_委托书.txt',NULL,NULL,NULL,NULL),('40282e81534c83b201534c83b3000002','40282e81534c83b201534c83b2de0001','/uploadTmp/doc/20160306/01e500d0e15541d5ac68499c8c4497df_老炮儿样章.docx',NULL,NULL,NULL,NULL),('40282e81534c83b201534c87bfd80005','40282e81534c83b201534c87bfbb0004','/uploadTmp/doc/20160306/d737e53ef1cd488bb68cd6e21ff7e821_克拉恋人样章.docx',NULL,NULL,NULL,NULL),('40282e81534c83b201534c8b0a610008','40282e81534c83b201534c8b0a520007','/uploadTmp/doc/20160306/f96c87606be4411c8789e6fe53c2de6e_生命册样章.docx',NULL,NULL,NULL,NULL),('40282e81534c83b201534c8bb8e70009','40282e81534c83b201534c87bfbb0004','/uploadTmp/doc/20160306/f96c87606be4411c8789e6fe53c2de6e_生命册样章.docx',NULL,NULL,NULL,NULL),('40282e81534cc12a01534cc12acf0002','40282e81534cc12a01534cc12acb0001','/uploadTmp/doc/20160307/533ef66417c446ac9664c07d298de08c_群山之巅样章.docx',NULL,NULL,NULL,NULL),('40282e81534cc12a01534cc4c3750005','40282e81534cc12a01534cc4c36d0004','/uploadTmp/doc/20160307/6f7688cd29bd4a6598797617f40a4e33_历史深处的民国样章.docx',NULL,NULL,NULL,NULL),('40282e81534cc12a01534ccbfd250008','40282e81534cc12a01534ccbfd220007','/uploadTmp/doc/20160307/b75942d917ca489b8ef6c616266ec022_三减一等于几-样章.docx',NULL,NULL,NULL,NULL),('40282e81534cc12a01534cd8ffcd000a','40282e81534cc12a01534cd8ffc20009','/uploadTmp/doc/20160307/d8f3ce0959c84736a34d0b95777001ad_天惶惶地惶惶样章.docx',NULL,NULL,NULL,NULL);

/*Table structure for table `t_product_subject` */

DROP TABLE IF EXISTS `t_product_subject`;

CREATE TABLE `t_product_subject` (
  `C_ID` varchar(32) NOT NULL,
  `C_PRODUCT_ID` varchar(32) NOT NULL,
  `C_SUBJECT_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product_subject` */

/*Table structure for table `t_sale_contract` */

DROP TABLE IF EXISTS `t_sale_contract`;

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
  `C_STATE` varchar(2) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sale_contract` */

insert  into `t_sale_contract`(`C_ID`,`C_CODE`,`C_OWNER`,`C_OWNER_CONTACT`,`C_OWNER_CONTACT_PHONE`,`C_OWNER_CONTACT_ADDRESS`,`C_OWNER_CONTACT_EMAIL`,`C_BUYER`,`C_BUYER_CONTACT`,`C_BUYER_CONTACT_PHONE`,`C_BUYER_CONTACT_ADDRESS`,`C_BUYER_CONTACT_EMAIL`,`C_PRIVILEGES`,`C_PRIVILEGE_TYPE`,`C_PRIVILEGE_RANGE`,`C_PRIVILEGE_DEADLINE`,`C_BANK_ACCOUNT_NAME`,`C_BANK_ACCOUNT_NO`,`C_BANK`,`C_TOTAL_PRICE`,`C_STATE`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('40282e8152dae71c0152db01318a000a','S20160213-001','北京悦库时光文化传媒有限公司','哈哈儿','13444444444','北广','hh@em.com','创想','张张','13555555555','望京','zz@im.com','01','0','0','1','创想时刻','创想时刻','中国银行','100000','10','1','2016-02-13 22:20:35','40282e8153385baa0153385baa9e0000','2016-03-03 02:42:20');

/*Table structure for table `t_sale_ctrt_doc` */

DROP TABLE IF EXISTS `t_sale_ctrt_doc`;

CREATE TABLE `t_sale_ctrt_doc` (
  `C_ID` varchar(32) NOT NULL,
  `C_CONTRACT_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR_ID` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_VERSION` varchar(10) DEFAULT NULL,
  `C_FILE_URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sale_ctrt_doc` */

insert  into `t_sale_ctrt_doc`(`C_ID`,`C_CONTRACT_ID`,`C_CREATOR_ID`,`C_CREATETIME`,`C_VERSION`,`C_FILE_URL`) values ('40282e815338971f015338971f100000','40282e8152dae71c0152db01318a000a','1','2016-03-03 02:29:01','1.0','/uploadTmp/doc/20160303/ee4ac1f7abff4df18f8acb57d875e5d8_logo.jpg');

/*Table structure for table `t_sale_ctrt_prod` */

DROP TABLE IF EXISTS `t_sale_ctrt_prod`;

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

DROP TABLE IF EXISTS `t_subject`;

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

/*Table structure for table `t_task` */

DROP TABLE IF EXISTS `t_task`;

CREATE TABLE `t_task` (
  `C_ID` varchar(32) NOT NULL,
  `C_TITLE` varchar(300) DEFAULT NULL,
  `C_TARGET_TYPE` varchar(2) DEFAULT NULL,
  `C_TARGET_ID` varchar(32) DEFAULT NULL,
  `C_STATE` varchar(2) DEFAULT NULL,
  `C_USER_ID` varchar(32) DEFAULT NULL,
  `C_ROLE_ID` varchar(32) DEFAULT NULL,
  `C_CREATOR` varchar(32) DEFAULT NULL,
  `C_CREATETIME` datetime DEFAULT NULL,
  `C_MODIFIER` varchar(32) DEFAULT NULL,
  `C_MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_task` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

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

insert  into `t_user`(`C_ID`,`C_NAME`,`C_ACCOUNT`,`C_EMAIL`,`C_PASSWORD`,`C_MOBILE`,`C_ROLE`,`C_GENDER`,`C_HONORIFIC`,`C_LOGOURL`,`C_STATUS`,`C_CREATOR`,`C_CREATETIME`,`C_MODIFIER`,`C_MODIFYTIME`) values ('1','超级管理员','superman','superman@em.com','96e79218965eb72c92a549dd5a330112','13581700369','01,99','1','张老师','/img/user2-160x160.jpg','1','-1','2015-12-30 23:24:05',NULL,NULL),('40282e81522bba0501522bba05b30000','普通用户','nnn','nnn@em.com','96e79218965eb72c92a549dd5a330112','','01',NULL,'','/img/user2-160x160.jpg','1','1','2016-01-10 21:29:17',NULL,NULL),('40282e81524e72a901524eaa7f430001','哈哈儿','haha','haha@em.com','96e79218965eb72c92a549dd5a330112','13111111111','01,12',NULL,'哈老师','/img/user2-160x160.jpg','1','1','2016-01-17 16:19:03',NULL,NULL),('40282e8152d46ebb0152d46ebb3b0000','外部团队A','extmaker','9654589@qq.com','96e79218965eb72c92a549dd5a330112','13666666666','01,52',NULL,'外老师','/img/user2-160x160.jpg','1','1','2016-02-12 15:42:53',NULL,NULL),('40282e81532145f101532145f1cf0000','评价管理员','pjm','pjm@em.com','96e79218965eb72c92a549dd5a330112','13000000000','01,03',NULL,'','/img/user2-160x160.jpg','1','1','2016-02-27 13:49:05',NULL,NULL),('40282e81532145f1015323372cf80001','版权专员','bqzy','bqzy@em.com','96e79218965eb72c92a549dd5a330112','18100000000','01,11',NULL,'','/img/user2-160x160.jpg','1','1','2016-02-27 22:52:12',NULL,NULL),('40282e81532612fd015326adc87f0007','媒资管理员','mzm','mzm@em.com','96e79218965eb72c92a549dd5a330112','13111111112','01,40',NULL,'','/img/user2-160x160.jpg','1','1','2016-02-28 15:00:37',NULL,NULL),('40282e815332f8d8015332f8d8870000','版权主管','bqzg','bqzg@em.com','96e79218965eb72c92a549dd5a330112','13011122233','01,12',NULL,'','/img/user2-160x160.jpg','1','1','2016-03-02 00:18:02',NULL,NULL),('40282e815332f8d8015332fca32f0002','版权经理','bqjl','bqjl@em.com','96e79218965eb72c92a549dd5a330112','13812312312','01,13',NULL,'','/img/user2-160x160.jpg','1','1','2016-03-02 00:22:11',NULL,NULL),('40282e815332f8d8015332fdb3970004','总经理','ceo','ceo@em.com','96e79218965eb72c92a549dd5a330112','13888888888','01,90',NULL,'','/img/user2-160x160.jpg','1','1','2016-03-02 00:23:21',NULL,NULL),('40282e815332f8d80153330a8dec0007','法务人员','fawu','fw@em.com','96e79218965eb72c92a549dd5a330112','13212312321','01,80',NULL,'','/img/user2-160x160.jpg','1','1','2016-03-02 00:37:23',NULL,NULL),('40282e815332f8d8015333321b92000c','制作经理','zzjl','zzjl@em.com','96e79218965eb72c92a549dd5a330112','13567867867','01,22',NULL,'','/img/user2-160x160.jpg','1','1','2016-03-02 01:20:35',NULL,NULL),('40282e8153385baa0153385baa9e0000','运营经理','yyjl','yyjl@em.com','96e79218965eb72c92a549dd5a330112','13666688666','01,32',NULL,'','/img/user2-160x160.jpg','1','1','2016-03-03 01:24:05',NULL,NULL),('4028f8a351f92fd40151f931fa4d0001','测试账号','test','zhangzhonghua@ideamoment.com','96e79218965eb72c92a549dd5a330112','13222222222','01,03','9','','/img/default_user_logo.jpg','1','1','2016-01-01 01:59:41','1','2016-01-03 14:44:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

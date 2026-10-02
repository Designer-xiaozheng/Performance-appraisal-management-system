DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor`(
	   `visitor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访客ID',
`guest_account_` varchar(64) NOT NULL UNIQUE comment '访客账号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (visitor_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '访客';

DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner`(
	   `owner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业主ID',
`owner_account_number` varchar(64) NOT NULL UNIQUE comment '业主账号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`building_no` varchar(64) comment '楼栋号',
`house_number` varchar(64) comment '门牌号',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (owner_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '业主';

DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`(
	   `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '来访登记ID',
`visiting_account` int(11) DEFAULT 0 comment '来访账号',
`full_name` varchar(64) comment '姓名',
`visit_the_owner` int(11) DEFAULT 0 comment '探访业主',
`name_of_owner` varchar(64) comment '业主姓名',
`building_no` varchar(64) comment '楼栋号',
`house_number` varchar(64) comment '门牌号',
`owner_confirmation_status` varchar(64) comment '业主确认状态',
`reason_for_visit` text comment '来访原因',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (visit_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '来访登记';
insert into `visit` values (1,0,'姓名1',0,'业主姓名1','楼栋号1','门牌号1','业主确认状态1','来访原因1','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (2,0,'姓名2',0,'业主姓名2','楼栋号2','门牌号2','业主确认状态2','来访原因2','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (3,0,'姓名3',0,'业主姓名3','楼栋号3','门牌号3','业主确认状态3','来访原因3','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (4,0,'姓名4',0,'业主姓名4','楼栋号4','门牌号4','业主确认状态4','来访原因4','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (5,0,'姓名5',0,'业主姓名5','楼栋号5','门牌号5','业主确认状态5','来访原因5','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (6,0,'姓名6',0,'业主姓名6','楼栋号6','门牌号6','业主确认状态6','来访原因6','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (7,0,'姓名7',0,'业主姓名7','楼栋号7','门牌号7','业主确认状态7','来访原因7','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `visit` values (8,0,'姓名8',0,'业主姓名8','楼栋号8','门牌号8','业主确认状态8','来访原因8','0','2022-03-11 21:04:42','2022-03-11 21:04:42');

DROP TABLE IF EXISTS `repair_application`;
CREATE TABLE `repair_application`(
	   `repair_application_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报修申请ID',
`repair_title` varchar(64) comment '报修标题',
`repair_type` varchar(64) comment '报修类型',
`related_pictures` varchar(255) comment '相关图片',
`application_time` date comment '申请时间',
`owner_account_number` int(11) DEFAULT 0 comment '业主账号',
`full_name` varchar(64) comment '姓名',
`building_no` varchar(64) comment '楼栋号',
`house_number` varchar(64) comment '门牌号',
`related_content` text comment '相关内容',
`reply_content` text comment '回复内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (repair_application_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '报修申请';
insert into `repair_application` values (1,'报修标题1','报修类型1','点此播放','2022-3-11',0,'姓名1','楼栋号1','门牌号1','相关内容1','回复内容1','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (2,'报修标题2','报修类型2','点此播放','2022-3-11',0,'姓名2','楼栋号2','门牌号2','相关内容2','回复内容2','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (3,'报修标题3','报修类型3','点此播放','2022-3-11',0,'姓名3','楼栋号3','门牌号3','相关内容3','回复内容3','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (4,'报修标题4','报修类型4','点此播放','2022-3-11',0,'姓名4','楼栋号4','门牌号4','相关内容4','回复内容4','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (5,'报修标题5','报修类型5','点此播放','2022-3-11',0,'姓名5','楼栋号5','门牌号5','相关内容5','回复内容5','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (6,'报修标题6','报修类型6','点此播放','2022-3-11',0,'姓名6','楼栋号6','门牌号6','相关内容6','回复内容6','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (7,'报修标题7','报修类型7','点此播放','2022-3-11',0,'姓名7','楼栋号7','门牌号7','相关内容7','回复内容7','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `repair_application` values (8,'报修标题8','报修类型8','点此播放','2022-3-11',0,'姓名8','楼栋号8','门牌号8','相关内容8','回复内容8','0','2022-03-11 21:04:42','2022-03-11 21:04:42');

DROP TABLE IF EXISTS `voting_center`;
CREATE TABLE `voting_center`(
	   `voting_center_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票中心ID',
`voting_title` varchar(64) comment ' 投票标题',
`voting_cover` varchar(255) comment '投票封面',
`start_time` date comment '开始时间',
`deadline` date comment '截止时间',
`voting_content` longtext comment '投票内容',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`timer_title` varchar(64) DEFAULT NULL comment '计时器标题',
`timing_start_time` datetime DEFAULT NULL COMMENT '计时开始时间',
`timing_end_time` datetime DEFAULT NULL COMMENT '计时结束时间',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (voting_center_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '投票中心';
insert into `voting_center` values (1,' 投票标题1','/api/upload/image_1646397464469.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区1','916','218','0','计时器标题1','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (2,' 投票标题2','/api/upload/image_1646397464471.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区2','77','879','0','计时器标题2','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (3,' 投票标题3','/api/upload/image_1644804429059.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区3','728','137','0','计时器标题3','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (4,' 投票标题4','/api/upload/image_1644804429063.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区4','636','817','0','计时器标题4','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (5,' 投票标题5','/api/upload/image_1646397480034.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区5','623','821','0','计时器标题5','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (6,' 投票标题6','/api/upload/image_1646397464481.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区6','578','886','0','计时器标题6','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (7,' 投票标题7','/api/upload/image_1646397464469.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区7','827','475','0','计时器标题7','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_center` values (8,' 投票标题8','/api/upload/image_1646397464471.jpg','2022-3-11','2022-3-11','此处可上传文字、图片、视频、超链接、表格等内容区8','506','456','0','计时器标题8','2022-3-11','2022-3-11','2022-03-11 21:04:42','2022-03-11 21:04:42');

DROP TABLE IF EXISTS `voting_management`;
CREATE TABLE `voting_management`(
	   `voting_management_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票管理ID',
`voting_title` varchar(64) comment ' 投票标题',
`start_time` date comment '开始时间',
`deadline` date comment '截止时间',
`voting_status` varchar(64) comment '表决状态',
`owner_account_number` int(11) DEFAULT 0 comment '业主账号',
`full_name` varchar(64) comment '姓名',
`voting_time` date comment '投票时间',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (voting_management_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '投票管理';
insert into `voting_management` values (1,' 投票标题1','2022-3-11','2022-3-11','表决状态1',0,'姓名1','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (2,' 投票标题2','2022-3-11','2022-3-11','表决状态2',0,'姓名2','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (3,' 投票标题3','2022-3-11','2022-3-11','表决状态3',0,'姓名3','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (4,' 投票标题4','2022-3-11','2022-3-11','表决状态4',0,'姓名4','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (5,' 投票标题5','2022-3-11','2022-3-11','表决状态5',0,'姓名5','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (6,' 投票标题6','2022-3-11','2022-3-11','表决状态6',0,'姓名6','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (7,' 投票标题7','2022-3-11','2022-3-11','表决状态7',0,'姓名7','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `voting_management` values (8,' 投票标题8','2022-3-11','2022-3-11','表决状态8',0,'姓名8','2022-3-11','0','2022-03-11 21:04:42','2022-03-11 21:04:42');

DROP TABLE IF EXISTS `feedback_center`;
CREATE TABLE `feedback_center`(
	   `feedback_center_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈中心ID',
`feedback_title` varchar(64) comment '反馈标题',
`feedback_type` varchar(64) comment '反馈类型',
`feedback_time` date comment '反馈时间',
`owner_account_number` int(11) DEFAULT 0 comment '业主账号',
`feedback_content` text comment '反馈内容',
`reply_content` text comment '回复内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (feedback_center_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '反馈中心';
insert into `feedback_center` values (1,'反馈标题1','反馈类型1','2022-3-11',0,'反馈内容1','回复内容1','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (2,'反馈标题2','反馈类型2','2022-3-11',0,'反馈内容2','回复内容2','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (3,'反馈标题3','反馈类型3','2022-3-11',0,'反馈内容3','回复内容3','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (4,'反馈标题4','反馈类型4','2022-3-11',0,'反馈内容4','回复内容4','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (5,'反馈标题5','反馈类型5','2022-3-11',0,'反馈内容5','回复内容5','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (6,'反馈标题6','反馈类型6','2022-3-11',0,'反馈内容6','回复内容6','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (7,'反馈标题7','反馈类型7','2022-3-11',0,'反馈内容7','回复内容7','0','2022-03-11 21:04:42','2022-03-11 21:04:42');
insert into `feedback_center` values (8,'反馈标题8','反馈类型8','2022-3-11',0,'反馈内容8','回复内容8','0','2022-03-11 21:04:42','2022-03-11 21:04:42');

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` varchar(500) DEFAULT NULL COMMENT '添加字段：',
  `field_set` varchar(500) DEFAULT NULL COMMENT '修改字段：',
  `field_get` varchar(500) DEFAULT NULL COMMENT '查询字段：',
  `table_nav_name` varchar(255) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(255) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定制授权';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏：';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论：';
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告：';
insert into `notice` values ('1','公告标题1','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `notice` values ('2','公告标题2','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `notice` values ('3','公告标题3','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `notice` values ('4','公告标题4','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞：';
insert into `praise` values ('2','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('25','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','9','1');
insert into `praise` values ('26','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('27','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('44','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'forum','forum_id','2','1');
insert into `praise` values ('50','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'forum','forum_id','2','1');
insert into `praise` values ('54','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','9','1');
insert into `praise` values ('57','0',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','10','1');
insert into `praise` values ('86','0',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','6','1');
insert into `praise` values ('101','7',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('108','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','8','1');
insert into `praise` values ('221','0',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ",'article','article_id','2','1');
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图：';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员',"2022-04-19 07:32:09.000 ",null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/avatar.jpg',"2022-04-19 07:32:09.000 ");
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
insert into `auth` values ('1','管理员','访客','visitor','访客','/visitor/table','','_blank','1','1','1','1','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('2','管理员','访客','visitor','访客详情','/visitor/view','','_blank','1','1','1','1','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('3','管理员','业主','owner','业主','/owner/table','','_blank','1','1','1','1','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('4','管理员','业主','owner','业主详情','/owner/view','','_blank','1','1','1','1','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('5','管理员','来访登记','visit','来访人员管理','/visit/table','','_blank','1','1','1','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('6','管理员','来访登记','visit','来访登记详情','/visit/view','','_blank','1','1','1','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('7','管理员','来访登记','visit','来访登记编辑','/visit/edit','top','_blank','1','1','1','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('8','管理员','报修申请','repair_application','设备管理','/repair_application/table','','_blank','1','1','1','1','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('9','管理员','报修申请','repair_application','报修申请详情','/repair_application/view','','_blank','1','1','1','1','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('10','管理员','报修申请','repair_application','报修申请编辑','/repair_application/edit','top','_blank','1','1','1','1','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('11','管理员','投票中心','voting_center','投票中心','/voting_center/table','','_blank','1','1','1','1','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":true}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('12','管理员','投票中心','voting_center','投票中心详情','/voting_center/view','','_blank','1','1','1','1','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('13','管理员','投票中心','voting_center','投票中心','/voting_center/list','top','_blank','1','1','1','1','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('14','管理员','投票中心','voting_center','投票中心详情','/voting_center/details','','_blank','1','1','1','1','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":true,"can_comment":true}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('15','管理员','投票管理','voting_management','投票管理','/voting_management/table','','_blank','1','1','1','1','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('16','管理员','投票管理','voting_management','投票管理详情','/voting_management/view','','_blank','1','1','1','1','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('17','管理员','投票管理','voting_management','投票管理编辑','/voting_management/edit','','_blank','1','1','1','1','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('18','管理员','反馈中心','feedback_center','反馈管理','/feedback_center/table','','_blank','1','1','1','1','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('19','管理员','反馈中心','feedback_center','反馈中心详情','/feedback_center/view','','_blank','1','1','1','1','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('20','管理员','反馈中心','feedback_center','反馈中心编辑','/feedback_center/edit','top','_blank','1','1','1','1','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('21','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('22','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('23','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('24','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('25','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('26','游客','访客','visitor','访客','/visitor/table','','_blank','1','0','0','0','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('27','游客','访客','visitor','访客详情','/visitor/view','','_blank','1','0','0','0','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('28','游客','业主','owner','业主','/owner/table','','_blank','0','0','0','0','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('29','游客','业主','owner','业主详情','/owner/view','','_blank','0','0','0','0','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('30','游客','来访登记','visit','来访登记','/visit/table','','_blank','0','0','0','0','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('31','游客','来访登记','visit','来访登记详情','/visit/view','','_blank','0','0','0','0','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('32','游客','来访登记','visit','来访登记编辑','/visit/edit','top','_blank','0','0','0','0','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('33','游客','报修申请','repair_application','报修申请','/repair_application/table','','_blank','0','0','0','0','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('34','游客','报修申请','repair_application','报修申请详情','/repair_application/view','','_blank','0','0','0','0','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('35','游客','报修申请','repair_application','报修申请编辑','/repair_application/edit','top','_blank','0','0','0','0','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('36','游客','投票中心','voting_center','投票中心','/voting_center/table','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":false}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('37','游客','投票中心','voting_center','投票中心详情','/voting_center/view','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('38','游客','投票中心','voting_center','投票中心','/voting_center/list','top','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('39','游客','投票中心','voting_center','投票中心详情','/voting_center/details','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":false,"can_comment":false}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('40','游客','投票管理','voting_management','投票管理','/voting_management/table','','_blank','0','0','0','0','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('41','游客','投票管理','voting_management','投票管理详情','/voting_management/view','','_blank','0','0','0','0','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('42','游客','投票管理','voting_management','投票管理编辑','/voting_management/edit','','_blank','0','0','0','0','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('43','游客','反馈中心','feedback_center','反馈中心','/feedback_center/table','','_blank','0','0','0','0','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('44','游客','反馈中心','feedback_center','反馈中心详情','/feedback_center/view','','_blank','0','0','0','0','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('45','游客','反馈中心','feedback_center','反馈中心编辑','/feedback_center/edit','top','_blank','0','0','0','0','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('46','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('47','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('48','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('49','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('50','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('51','访客','访客','visitor','访客','/visitor/table','','_blank','0','0','0','0','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('52','访客','访客','visitor','访客详情','/visitor/view','','_blank','0','0','0','0','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('53','访客','业主','owner','业主','/owner/table','','_blank','0','0','0','0','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('54','访客','业主','owner','业主详情','/owner/view','','_blank','0','0','0','0','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('55','访客','来访登记','visit','来访登记','/visit/table','','_blank','0','0','0','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('56','访客','来访登记','visit','来访登记详情','/visit/view','','_blank','0','0','0','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('57','访客','来访登记','visit','来访登记编辑','/visit/edit','top','_blank','1','1','1','1','house_number,building_no,visit_the_owner,name_of_owner,,reason_for_visit,full_name,visiting_account','house_number,building_no,visit_the_owner,name_of_owner,,reason_for_visit,full_name,visiting_account','house_number,building_no,visit_the_owner,name_of_owner,,reason_for_visit,full_name,visiting_account',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('58','访客','报修申请','repair_application','报修申请','/repair_application/table','','_blank','0','0','0','0','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('59','访客','报修申请','repair_application','报修申请详情','/repair_application/view','','_blank','0','0','0','0','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('60','访客','报修申请','repair_application','报修申请编辑','/repair_application/edit','top','_blank','0','0','0','0','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('61','访客','投票中心','voting_center','投票中心','/voting_center/table','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":false}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('62','访客','投票中心','voting_center','投票中心详情','/voting_center/view','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('63','访客','投票中心','voting_center','投票中心','/voting_center/list','top','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('64','访客','投票中心','voting_center','投票中心详情','/voting_center/details','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":false,"can_comment":false}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('65','访客','投票管理','voting_management','投票管理','/voting_management/table','','_blank','0','0','0','0','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('66','访客','投票管理','voting_management','投票管理详情','/voting_management/view','','_blank','0','0','0','0','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('67','访客','投票管理','voting_management','投票管理编辑','/voting_management/edit','','_blank','0','0','0','0','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('68','访客','反馈中心','feedback_center','反馈中心','/feedback_center/table','','_blank','0','0','0','0','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('69','访客','反馈中心','feedback_center','反馈中心详情','/feedback_center/view','','_blank','0','0','0','0','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('70','访客','反馈中心','feedback_center','反馈中心编辑','/feedback_center/edit','top','_blank','0','0','0','0','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('71','访客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('72','访客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('73','访客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('74','访客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('75','访客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('76','业主','访客','visitor','访客','/visitor/table','','_blank','0','0','0','0','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('77','业主','访客','visitor','访客详情','/visitor/view','','_blank','0','0','0','0','guest_account_,full_name,gender','guest_account_,full_name,gender','guest_account_,full_name,gender',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('78','业主','业主','owner','业主','/owner/table','','_blank','0','0','0','0','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('79','业主','业主','owner','业主详情','/owner/view','','_blank','0','0','0','0','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number','owner_account_number,full_name,gender,building_no,house_number',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('80','业主','来访登记','visit','来访登记','/visit/table','','_blank','0','0','1','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','owner_confirmation_status','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('81','业主','来访登记','visit','来访登记详情','/visit/view','','_blank','0','0','1','1','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','owner_confirmation_status','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('82','业主','来访登记','visit','来访登记编辑','/visit/edit','top','_blank','0','0','0','0','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit','visiting_account,full_name,visit_the_owner,name_of_owner,building_no,house_number,owner_confirmation_status,reason_for_visit',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('83','业主','报修申请','repair_application','报修申请','/repair_application/table','','_blank','0','0','0','1','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('84','业主','报修申请','repair_application','报修申请详情','/repair_application/view','','_blank','0','0','0','1','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content','repair_title,repair_type,related_pictures,application_time,owner_account_number,full_name,building_no,house_number,related_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('85','业主','报修申请','repair_application','报修申请编辑','/repair_application/edit','top','_blank','1','1','1','1','related_pictures,repair_type,house_number,building_no,full_name,owner_account_number,application_time,related_content,repair_title','related_pictures,repair_type,house_number,building_no,full_name,owner_account_number,application_time,related_content,repair_title','related_pictures,repair_type,house_number,building_no,full_name,owner_account_number,application_time,related_content,repair_title',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('86','业主','投票中心','voting_center','投票中心','/voting_center/table','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":false}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('87','业主','投票中心','voting_center','投票中心详情','/voting_center/view','','_blank','0','0','0','0','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('88','业主','投票中心','voting_center','投票中心','/voting_center/list','top','_blank','1','1','1','1','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('89','业主','投票中心','voting_center','投票中心详情','/voting_center/details','','_blank','1','1','1','1','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content','voting_title,voting_cover,start_time,deadline,voting_content',null,'0','{"can_show_comment":true,"can_comment":true}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('90','业主','投票管理','voting_management','投票管理','/voting_management/table','','_blank','1','0','0','1','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('91','业主','投票管理','voting_management','投票管理详情','/voting_management/view','','_blank','1','0','0','1','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('92','业主','投票管理','voting_management','投票管理编辑','/voting_management/edit','','_blank','1','1','1','1','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time','voting_title,start_time,deadline,voting_status,owner_account_number,full_name,voting_time',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('93','业主','反馈中心','feedback_center','反馈中心','/feedback_center/table','','_blank','0','0','0','1','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('94','业主','反馈中心','feedback_center','反馈中心详情','/feedback_center/view','','_blank','0','0','0','1','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content','feedback_title,feedback_type,feedback_time,owner_account_number,feedback_content,reply_content',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('95','业主','反馈中心','feedback_center','反馈中心编辑','/feedback_center/edit','top','_blank','1','1','1','1','owner_account_number,feedback_time,feedback_content,feedback_type,feedback_title','owner_account_number,feedback_time,feedback_content,feedback_type,feedback_title','owner_account_number,feedback_time,feedback_content,feedback_type,feedback_title',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('96','业主','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('97','业主','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('98','业主','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('99','业主','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `auth` values ('100','业主','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `user_group` values ('1','100','管理员',null,'','','0',null,"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `user_group` values ('2','100','游客',null,'','','0','0',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `user_group` values ('3','100','访客',null,'visitor','visitor_id','0','3',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `user_group` values ('4','100','业主',null,'owner','owner_id','0','0',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/image_1645677250809.jpeg','458',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/image_1645677250810.jpeg','149',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/image_1645677250810.jpeg','828',"2022-03-11 13:04:42.000 ","2022-03-11 13:04:42.000 ");

#设置客户端语言
SET NAMES UTF8;
#放弃数据库(如果存在)
DROP DATABASE IF EXISTS nba;
#创建数据库nba
CREATE DATABASE nba CHARSET=UTF8;
#进入数据库
USE nba;
CREATE TABLE `nba_news` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL
)

--
-- 转存表中的数据 `nba_news`
--

INSERT INTO `nba_news` (`id`, `title`, `ctime`, `point`, `img_url`, `content`) VALUES
(1, '马尔卡宁：我感觉会很快融入球队', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/1.jpg', 'NBA12月5日讯 公牛在客场90-96不敌步行者，前锋劳里-马尔卡宁在赛后接受采访时谈到了他的出手时机。\r\n\r\n“我还有时间对此稍加思索，而不是马上就要完全融入，所以感觉还不错，”马尔卡宁谈到新任主帅吉姆-博伊兰的执教风格时说，“我感觉很好，没有出手太多糟糕的投篮，感觉都很好，只是需要找回我的节奏。”\r\n\r\n马尔卡宁今天上场32分钟，24投8中得到21分10篮板1助攻2抢断1封盖。\r\n'),
(2, '沃顿：隆多基本上参加了全部训练环节', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/2.jpg', 'NBA12月5日讯 湖人主帅卢克-沃顿今天接受采访，分享了后卫拉简-隆多的伤病恢复情况。\r\n\r\n“今天他参加了差不多全部训练环节，”沃顿说，“他还是有点保守。你可以看到，当他争抢球权时使用的是另一只手，承受身体接触时也有点特意保护那只手。不过他也说了这并非源于疼痛，而是在经历伤病之后你要重新调整大脑对于赛场动态的反应能力。”\r\n\r\n本赛季常规赛至今，隆多场均上场25.3分钟，得到8.5分4.6篮板6.5助攻1.18抢断。\r\n'),
(3, '德罗赞：我们要能在不顺时仍能赢球', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/3.jpg', 'NBA12月5日讯 据《圣安东尼奥新闻快报》报道，马刺在今天的比赛中以105-139不敌爵士，此役过后，马刺的战绩来到了11胜13负。\r\n\r\n在接受采访时，马刺后卫德马尔-德罗赞表示：“我将之视作是一个全新的挑战，一个会以某种方式在我人生的某个阶段自行呈现的挑战。如果你挺过去，你知道，心满意足会在最后等着你。”\r\n\r\n今天的失利迫使马刺要再一次去寻找答案。\r\n\r\n“没有抱怨，除此之外，我们需要稳定表现，我们一直在说这个，我们已经证明过，我们可以和顶尖中的顶尖球队较量，关键在于稳定地做到这件事。”德罗赞说道'),
(4, '米切尔：把球传给科沃尔知道球必进', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/4.jpg', '虎扑12月5日讯 爵士在今天的比赛大胜马刺，赛后，爵士前锋乔-英格尔斯大赞队内老将凯尔-科沃尔。\r\n\r\n“凯尔适应地非常之好，”英格尔斯说道，“他的智商非常高，他在底角作战，他半秒之内就能出手投篮，有一个能够拉开场上空间和去投进球的人真的很有帮助。”\r\n\r\n多诺万-米切尔表示：“他就像是紧急援助，你把球传给他，你知道球必进。”\r\n\r\n科沃尔今天登场15分钟，8投5中得到15分；英格尔斯登场27分钟，得到13分3篮板7助攻；米切尔登场25分钟，得到20分1篮板2助攻。'),
(5, '如何看待关键一投？东契奇:球进了而已', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/5.jpg', '虎扑12月5日讯 今日比赛中独行侠111-102击败开拓者，\r\n“我会说是我们的防守，球队打出了很棒的防守，我认为那对我们来说是关键。”东契奇说道。\r\n在比赛最后阶段开拓者曾一度将分差缩小到个位数，但东契奇的关键三分为球队锁定了胜局，对此球队主帅里克-卡莱尔也是高兴不已。\r\n\r\n“我们都看到了东契奇命中关键一投，那是他一直为之训练的投篮，那是非常棒的时机。”卡莱尔说道。\r\n\r\n而东契奇对于这个投篮则显得非常平静。本场比赛中东契奇出战32分钟，14投6中得到21分9篮板3助攻。'),
(6, '[视频]十佳球：伯克斯暴扣绝杀篮网', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/6.jpg', '虎扑12月4日讯 今天NBA一共进行了7场比赛，一起来看精彩的十佳球！骑士前锋小拉里-南斯反击双手空接暴扣，骑士后卫亚历克-伯克斯背运双手暴扣绝杀篮网，掘金中锋尼古拉-约基奇转身妙传助攻队友贾马尔-默里命中三分，尼克斯中锋米切尔-罗宾逊大帽奇才前锋马基夫-莫里斯扣篮，森林狼前锋罗伯特-科温顿摁帽火箭中锋克林特-卡佩拉。\r\n'),
(7, 'NBA官方评选今日最佳数据:约基奇', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/7.jpg', '虎扑12月4日讯 NBA官方评选出了今日的最佳数据，掘金中锋尼古拉-约基奇在今日球队客场106-103战胜猛龙的比赛中得到23分11篮板15助攻的三双数据，成功当选。\r\n\r\n本场比赛，约基奇出场35分钟，13投8中得到23分11篮板15助攻2抢断。'),
(8, '127', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/1.jpg', '..'),
(9, '126', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/1.jpg', '..'),
(10, '1276', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/2.jpg', '..'),
(11, '1267', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/2.jpg', '..'),
(12, '120', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/3.jpg', '..'),
(13, '1211', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/3.jpg', '..'),
(14, '127', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/4.jpg', '..'),
(15, '129', '2018-12-06 19:57:32', 0, 'http://127.0.0.1:3000/img/4.jpg', '..');

USE nba,
CREATE TABLE `nba_comment` (
  `id` int(11) NOT NULL,
  `nid` int(11) DEFAULT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `content` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `nba_comment`
--

INSERT INTO `nba_comment` (`id`, `nid`, `user_name`, `ctime`, `content`) VALUES
(1, 1, 'dd', '2018-12-07 20:51:11', '111'),
(2, 1, 'dd', '2018-12-07 20:51:11', '112'),
(3, 1, 'dd', '2018-12-07 20:51:11', '113'),
(4, 1, 'dd', '2018-12-07 20:51:11', '114'),
(5, 1, 'dd', '2018-12-07 20:51:11', '115'),
(6, 1, 'dd', '2018-12-07 20:51:11', '116'),
(7, 1, 'dd', '2018-12-07 20:51:11', '117'),
(8, 1, 'dd', '2018-12-07 20:51:11', '118'),
(9, 1, 'dd', '2018-12-07 20:51:11', '1191'),
(10, 1, 'dd', '2018-12-07 20:51:11', '120'),
(11, 1, 'dd', '2018-12-07 20:51:11', '1211'),
(12, 1, 'dd', '2018-12-07 20:51:11', '101'),
(13, 1, 'dd', '2018-12-07 20:51:11', '122'),
(14, 1, 'dd', '2018-12-07 20:51:11', '1244'),
(15, 1, 'dd', '2018-12-07 20:51:11', '1352'),
(16, 1, '匿名', '2018-12-08 11:18:54', '1234'),
(17, 1, '匿名', '2018-12-08 14:22:11', 'sfsaf'),
(18, 1, '匿名', '2018-12-08 14:23:01', '你好'),
(19, 1, '匿名', '2018-12-08 14:26:32', 'asf'),
(20, 1, '匿名', '2018-12-08 14:30:18', '天气不错'),
(21, 1, '匿名', '2018-12-08 14:30:40', '湖人总冠军'),
(22, 1, '匿名', '2018-12-08 14:46:03', '火箭总冠军'),
(23, 2, '匿名', '2018-12-10 14:37:01', '安德森股份'),
(24, 1, '匿名', '2018-12-10 20:28:58', '玫瑰重新绽放了'),
(25, 1, '匿名', '2018-12-11 19:49:31', '火箭是想飞上天和太阳肩并肩了'),
(26, 1, 'dd', '2018-12-11 20:10:37', '库里是勇士的灵魂'),
(27, 1, 'dd', '2018-12-15 10:40:23', 'asfa'),
(28, 4, 'dingding', '2018-12-15 10:40:55', '爵士厉害'),
(29, 4, 'dingding', '2018-12-15 10:41:40', 'safwafa'),
(30, 3, 'dd', '2018-12-15 10:42:08', '马刺新赛季有望夺冠'),
(31, 6, NULL, '2018-12-20 09:18:48', '挖方打完饭'),
(32, 7, NULL, '2018-12-20 09:18:56', '123456'),
(33, 3, NULL, '2018-12-20 09:19:06', '法法');

CREATE TABLE nba_login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(25) NOT NULL DEFAULT '',
    upwd VARCHAR(32) NOT NULL DEFAULT '',
    email VARCHAR(50) NOT NULL DEFAULT ''
);
INSERT INTO nba_login VALUES(null,'dingding',md5('123'),'');
INSERT INTO nba_login VALUES(null,'dd',md5('123'),'');
INSERT INTO nba_login VALUES(null,'ll',md5('123'),'');

CREATE TABLE `nba_shoppingcart_item` (
  `iid` int(11),
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `nba_shoppingcart_item`
--

INSERT INTO `nba_shoppingcart_item` (`iid`, `user_id`, `product_id`, `count`, `is_checked`) VALUES
(1, 10, 17, 1, 0),
(2, 11, 11, 1, 0),
(3, 12, 1, 1, 1),
(4, 13, 3, 9, 0),
(5, 14, 1, 1, 0),
(13, 20, 1, 1, 1),
(14, 22, 17, 11, 1),
(15, 20, 28, 1, 0),
(16, 25, 2, 1, 1),
(17, 3, 28, 1, 1),
(18, 3, 14, 1, 1),
(19, 28, 1, 99997, 0),
(20, 29, 31, 1, 1),
(25, 3, 18, 1, 0),
(26, 32, 13, 1, 0),
(27, 32, 5, 1, 0),
(28, 32, 19, 1, 0),
(29, 33, 1, 1, 0),
(31, 3, 1, 1, 0),
(32, 35, 20, 1, 0),
(33, 2, 19, 1, 1),
(34, 39, 19, 1, 1),
(35, 1, 5, 15, 1),
(36, 1, 28, 2, 1),
(37, 1, 9, 1, 1),
(38, 45, 22, 1, 0),
(39, 46, 1, 1, 0),
(40, 48, 28, 1, 1),
(41, 1, 1, 6, 1),
(42, 50, 28, 1, 1),
(43, 52, 28, 1, 1),
(44, 51, 5, 1, 1),
(45, 54, 1, 1, 1),
(46, 56, 28, 1, 1),
(47, 59, 5, 1, 0),
(48, 59, 9, 1, 0),
(49, 59, 19, 1, 0),
(50, 31, 1, 1, 1),
(51, 59, 1, 2, 0),
(52, 60, 28, 1, 1),
(53, 46, 21, 1, 0),
(54, 1, 12, 2, 1),
(55, 61, 5, 1, 1),
(56, 61, 6, 1, 0),
(57, 70, 1, 1, 1),
(58, 71, 1, 1, 1),
(59, 1, 4, 3, 1),
(60, 36, 17, 1, 1),
(61, 35, 17, 7, 0),
(62, 35, 5, 13, 0),
(63, 72, 9, 1, 1),
(64, 82, 1, 1, 1),
(65, 83, 17, 1, 1),
(66, 35, 28, 4, 0),
(67, 65, 40, 2, 0);

CREATE TABLE `nba_laptop` (
  `lid` int(11) ,
  `family_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `old`  INT DEFAULT NULL,
  `new`  INT DEFAULT NULL,
  `lname` varchar(32) DEFAULT NULL,
  `img_url` VARCHAR(255) DEFAULT NULL
);

--
-- 转存表中的数据 `nba_laptop`
--

INSERT INTO `nba_laptop` (`lid`, `family_id`, `title`, `old`, `new`, `lname`,`img_url`) VALUES
(1, 1, 'NIKE Kyrie3(Flip the Switch)', '899.00','690.00',  'NIKE Kyrie3','http://127.0.0.1:3000/img/good1.png'),
(2, 2, 'Adidas Dame4(McDon JamFest)', '999.00','870.00', 'Adidas Dame4','http://127.0.0.1:3000/img/good2.png'),
(3, 3, 'NIKE Kobe10 Elite(Rose Gold Pack)', '2249.00','1280.00',  'NIKE Kobe10 Elite','http://127.0.0.1:3000/img/good3.png'),
(4, 1, 'Air Jordan XXX(Russell Westbrook)', '1399.00','1100.00', 'Air Jordan XXX','http://127.0.0.1:3000/img/good4.png'),
(5, 2, 'Adidas Crazy Explosive(Pink White)', '1299.00','799.00', 'Adidas Crazy Explosive','http://127.0.0.1:3000/img/good5.png'),
(6, 3, 'Air Jordan XXXII(Black Cement)', '1329.00', '1050.00','Air Jordan XXXII','http://127.0.0.1:3000/img/good6.png'),
(7, 1, 'Adidas D Rose9(Pink White)', '899.00','780.00', 'Adidas D Rose9','http://127.0.0.1:3000/img/good7.png'),
(8, 2, 'Adidas Dame3(Chinese New Year)', '899.00','520.00' ,'Adidas Dame3','http://127.0.0.1:3000/img/good8.png')

CREATE TABLE nba_goods_info(
    id  INT  PRIMARY KEY AUTO_INCREMENT,
    title  VARCHAR(50),
    old  INT,
    new  INT,
    img_url VARCHAR(255)
);

INSERT INTO `nba_goods_info` (`id`, `title`, `old`, `new`, `img_url`) VALUES
(1, 'NIKE Kyrie3', 799, 690,  'http://127.0.0.1:3000/img/good1.png'),
(2, 'Lebron Jersey 23', 799, 520, 'http://127.0.0.1:3000/img/good2.png'),
(3, 'NIKE Basketball', 399, 270,  'http://127.0.0.1:3000/img/good3.png'),
(4, 'Air Jordan XXX', 1599, 1280, 'http://127.0.0.1:3000/img/good4.png'),
(5, 'Kobe Jersey 24', 999, 730, 'http://127.0.0.1:3000/img/good5.png'),
(6, 'Wilson NCAA', 139, 69, 'http://127.0.0.1:3000/img/good6.png'),
(7, 'Air Jordan XXXI', 1599, 899, 'http://127.0.0.1:3000/img/good7.png'),
(8, 'Thompson Jersey 11', 790 ,690, 'http://127.0.0.1:3000/img/good8.png')

CREATE TABLE `nba_show` (
  `mid` int(11) ,
  `team_img` VARCHAR(255) DEFAULT NULL,
  `star_img` VARCHAR(255) DEFAULT NULL,
  `tname`   varchar(50) DEFAULT NULL,
  `mname`  varchar(32) DEFAULT NULL,
  `position` varchar(32) DEFAULT NULL,
  `weight` VARCHAR(50) DEFAULT NULL,
  `birthday` VARCHAR(50) DEFAULT NULL,
  `city` VARCHAR(50) DEFAULT NULL,
  `best` VARCHAR(50) DEFAULT NULL,
  `worst` VARCHAR(50) DEFAULT NULL,
  `content` VARCHAR(80) DEFAULT NULL,
  `play` INT(100) DEFAULT NULL,
  `time` decimal(50,1) DEFAULT NULL,
  `score` decimal(50,1) DEFAULT NULL,
  `bank` decimal(50,1) DEFAULT NULL,
  `holding` decimal(50,1) DEFAULT NULL,
  `steal` decimal(50,1) DEFAULT NULL,
  `block` decimal(50,1) DEFAULT NULL,
  `mistake` decimal(50,1) DEFAULT NULL
);

INSERT INTO `nba_show` (`mid`, `team_img`, `star_img`,`tname`, `mname`, `position`,`weight`,`birthday`,`city`,`best`,`worst`,`content`,`play`,`time`,`score`,`bank`,`holding`,`steal`,`block`,`mistake`) VALUES
(1,'http://127.0.0.1:3000/img/team1.png','http://127.0.0.1:3000/img/star1.jpg','菲尼克斯太阳','德安德烈-艾顿(DeAndre Ayton)','中锋','2.16米/118公斤','1998-07-22(20岁)','亚利桑那大学','大卫-罗宾逊','杰梅因-奥尼尔','面框进攻优秀，身体素质极为突出的巴哈马中锋',35,'33.5','20.1','11.6','1.6','0.6','1.9','2.0'),
(2,'http://127.0.0.1:3000/img/team2.png','http://127.0.0.1:3000/img/star2.jpg','萨克拉门托国王','马文-巴格利 (Marvin Bagley III)','大前锋','2.11米/107公斤','1999-03-13(19岁)','杜克大学','克里斯-波什','朱利叶斯-兰德尔','弹速惊人，运动能力和篮板拼抢能力极强。',33,'33.8','21.0','11.1','1.5','0.8','0.9','2.3'),
(3,'http://127.0.0.1:3000/img/team3.png','http://127.0.0.1:3000/img/star3.jpg','亚特兰大老鹰','卢卡-东契奇 (Luka Doncic)','小前锋/得分后卫','2.01米/99公斤','1999-02-27(19岁)','斯洛文尼亚','乔-约翰逊','泰瑞克-埃文斯','欧洲超新星，球风全面，传控意识佳，无惧大场面。',73,'25.1','14.2','5.3','4.5','1.1','0.4','2.2'),
(4,'http://127.0.0.1:3000/img/team4.png','http://127.0.0.1:3000/img/star4.jpg','孟菲斯灰熊','小贾伦-杰克逊 (Jaren Jackson Jr.)','大前锋/中锋','2.11米/107公斤','1999-09-14(19岁)','密歇根州立大学','迈尔斯-特纳','诺阿-冯莱','长臂机动型内线，防守端表现全面，中远距离投篮不俗。',35,'21.8','10.9','5.8','1.1','0.6','3.0','1.8'),
(5,'http://127.0.0.1:3000/img/team5.png','http://127.0.0.1:3000/img/star5.jpg','达拉斯独行侠','特雷-杨 (Trae Young)','控球后卫','1.87米/81公斤','1998-09-18(20岁)','俄克拉荷马大学','斯蒂芬-库里','阿隆-布鲁克斯','拥有惊人射程和优秀传球视野，包揽NCAA得分王及助攻王。',32,'35.4','27.4','3.9','8.7','1.7','0.3','5.2'),
(6,'http://127.0.0.1:3000/img/team6.png','http://127.0.0.1:3000/img/star6.jpg','奥兰多魔术','穆罕默德-班巴 (Mohamed Bamba)','中锋','2.15米/102公斤','1998-05-11(20岁)','德克萨斯大学','鲁迪-戈贝尔','萨穆埃尔-波特','具创史级别臂展的长人，有一定投篮能力，护框封盖突出。',30,'30.2','12.9','10.5','0.5','0.8','3.6','1.5'),
(7,'http://127.0.0.1:3000/img/team7.png','http://127.0.0.1:3000/img/star7.jpg','芝加哥公牛','温德尔-卡特 (Wendell Carter Jr.)','中锋/大前锋','2.08米/114公斤','1999-04-15(19岁)','杜克大学','艾尔-霍弗德','格雷格-门罗','禁区攻防基本功扎实的强力内线，有一手稳定的中远投。',37,'26.8','13.5','9.1','2.0','0.8','2.1','2.0'),
(8,'http://127.0.0.1:3000/img/team8.png','http://127.0.0.1:3000/img/star8.jpg','克利夫兰骑士','科林-塞克斯顿 (Collin Sexton)','得分后卫','1.87米/83公斤','1999-01-13(19岁)','阿拉巴马大学','埃里克-布莱索','特里-罗齐尔','身体素质超劲爆的得分型控卫，持球突破极具侵略性。',33,'29.9','19.2','3.8','3.6','0.8','0.1','2.8')

CREATE TABLE `nba_play` (
  `pid` INT(20) ,
  `left_team` VARCHAR(255) DEFAULT NULL,
  `left_img` VARCHAR(255) DEFAULT NULL,
  `left_score`   INT(255) DEFAULT NULL,
  `right_score`   INT(255) DEFAULT NULL,
  `right_img` VARCHAR(255) DEFAULT NULL,
  `right_team` VARCHAR(255) DEFAULT NULL
);

INSERT INTO `nba_play` (`pid`, `left_team`, `left_img`, `left_score`, `right_score`,`right_img`,`right_team`) VALUES
(1,'雄鹿','http://127.0.0.1:3000/img/team28.png',107,104,'http://127.0.0.1:3000/img/team30.png','活塞 '),
(2,'太阳','http://127.0.0.1:3000/img/team1.png',128,110,'http://127.0.0.1:3000/img/team23.png','篮网'),
(3,'公牛','http://127.0.0.1:3000/img/team7.png',103,121,'http://127.0.0.1:3000/img/team16.png','雷霆'),
(4,'国王','http://127.0.0.1:3000/img/team2.png',105,132,'http://127.0.0.1:3000/img/team15.png','掘金'),
(5,'爵士','http://127.0.0.1:3000/img/team18.png',125,102,'http://127.0.0.1:3000/img/team10.png','火箭'),
(6,'76人','http://127.0.0.1:3000/img/team21.png',110,123,'http://127.0.0.1:3000/img/team9.png','马刺'),
(7,'快船','http://127.0.0.1:3000/img/team14.png',127,131,'http://127.0.0.1:3000/img/team26.png','热火'),
(8,'灰熊','http://127.0.0.1:3000/img/team4.png',107,110,'http://127.0.0.1:3000/img/team12.png','勇士')

CREATE TABLE nba_hupu(
  cid INT(20),
  cop VARCHAR(255)
);

INSERT INTO nba_hupu VALUES(1,'NBA论坛');
INSERT INTO nba_hupu VALUES(2,'CBA论坛');
INSERT INTO nba_hupu VALUES(3,'游戏电竞');
INSERT INTO nba_hupu VALUES(4,'步行街');
INSERT INTO nba_hupu VALUES(5,'自建板块');
INSERT INTO nba_hupu VALUES(6,'运动和装备');
INSERT INTO nba_hupu VALUES(7,'综合体育');

CREATE TABLE nba_rank(
  rid INT(30),
  img_url VARCHAR(255) DEFAULT NULL,
  team VARCHAR(255) DEFAULT NULL,
  gains VARCHAR(255) DEFAULT NULL
);

INSERT INTO nba_rank VALUES(1,'http://127.0.0.1:3000/img/team15.png','掘进','战绩(21胜9负)');
INSERT INTO nba_rank VALUES(2,'http://127.0.0.1:3000/img/team12.png','勇士','战绩(21胜11负)');
INSERT INTO nba_rank VALUES(3,'http://127.0.0.1:3000/img/team16.png','雷霆','战绩(19胜10负)');
INSERT INTO nba_rank VALUES(4,'http://127.0.0.1:3000/img/team13.png','湖人','战绩(18胜13负)');
INSERT INTO nba_rank VALUES(5,'http://127.0.0.1:3000/img/team17.png','开拓者','战绩(17胜13负)');
INSERT INTO nba_rank VALUES(6,'http://127.0.0.1:3000/img/team14.png','快船','战绩(17胜13负)');
INSERT INTO nba_rank VALUES(7,'http://127.0.0.1:3000/img/team9.png','马刺','战绩(17胜15负)');
INSERT INTO nba_rank VALUES(8,'http://127.0.0.1:3000/img/team10.png','火箭','战绩(16胜14负)');
INSERT INTO nba_rank VALUES(9,'http://127.0.0.1:3000/img/team4.png','灰熊','战绩(16胜14负)');
INSERT INTO nba_rank VALUES(10,'http://127.0.0.1:3000/img/team20.png','猛龙','战绩(24胜9负)');
INSERT INTO nba_rank VALUES(11,'http://127.0.0.1:3000/img/team28.png','雄鹿','战绩(21胜9负)');
INSERT INTO nba_rank VALUES(12,'http://127.0.0.1:3000/img/team21.png','76人','战绩(21胜12负)');
INSERT INTO nba_rank VALUES(13,'http://127.0.0.1:3000/img/team29.png','步行者','战绩(20胜12负)');
INSERT INTO nba_rank VALUES(14,'http://127.0.0.1:3000/img/team22.png','凯尔特人','战绩(18胜12负)');
INSERT INTO nba_rank VALUES(15,'http://127.0.0.1:3000/img/team30.png','活塞','战绩(15胜14负)');
INSERT INTO nba_rank VALUES(16,'http://127.0.0.1:3000/img/team25.png','黄蜂','战绩(15胜15负)');
INSERT INTO nba_rank VALUES(17,'http://127.0.0.1:3000/img/team23.png','篮网','战绩(15胜18负)');
INSERT INTO nba_rank VALUES(18,'http://127.0.0.1:3000/img/team26.png','热火','战绩(13胜16负)');

CREATE TABLE nba_hupu_list(
    bid INT PRIMARY KEY AUTO_INCREMENT,
    cid INT,
    cll VARCHAR(255),
    title VARCHAR(255),
    img_url VARCHAR(255)   
);

INSERT INTO nba_hupu_list VALUES(1,1,'NBA论坛','火箭专区','http://127.0.0.1:3000/img/nba1.jpg');
INSERT INTO nba_hupu_list VALUES(2,1,'NBA论坛','勇士专区','http://127.0.0.1:3000/img/nba2.jpg');
INSERT INTO nba_hupu_list VALUES(3,1,'NBA论坛','森林狼专区','http://127.0.0.1:3000/img/nba3.jpg');
INSERT INTO nba_hupu_list VALUES(4,1,'NBA论坛','湖人专区','http://127.0.0.1:3000/img/nba4.jpg');
INSERT INTO nba_hupu_list VALUES(5,1,'NBA论坛','骑士专区','http://127.0.0.1:3000/img/nba5.jpg');
INSERT INTO nba_hupu_list VALUES(6,1,'NBA论坛','凯尔特人专区','http://127.0.0.1:3000/img/nba6.jpg');

INSERT INTO nba_hupu_list VALUES(7,2,'CBA论坛','辽宁专区','http://127.0.0.1:3000/img/cba1.jpg');
INSERT INTO nba_hupu_list VALUES(8,2,'CBA论坛','新疆专区','http://127.0.0.1:3000/img/cba2.jpg');
INSERT INTO nba_hupu_list VALUES(9,2,'CBA论坛','八一专区','http://127.0.0.1:3000/img/cba3.jpg');
INSERT INTO nba_hupu_list VALUES(10,2,'CBA论坛','同曦专区','http://127.0.0.1:3000/img/cba4.jpg');
INSERT INTO nba_hupu_list VALUES(11,2,'CBA论坛','福建专区','http://127.0.0.1:3000/img/cba5.jpg');
INSERT INTO nba_hupu_list VALUES(12,2,'CBA论坛','吉林专区','http://127.0.0.1:3000/img/cba6.jpg');

INSERT INTO nba_hupu_list VALUES(13,3,'游戏电竞','英雄联盟','http://127.0.0.1:3000/img/game1.jpg');
INSERT INTO nba_hupu_list VALUES(14,3,'游戏电竞','QQ飞车','http://127.0.0.1:3000/img/game2.jpg');
INSERT INTO nba_hupu_list VALUES(15,3,'游戏电竞','守望先锋','http://127.0.0.1:3000/img/game3.jpg');
INSERT INTO nba_hupu_list VALUES(16,3,'游戏电竞','王者荣耀','http://127.0.0.1:3000/img/game4.jpg');
INSERT INTO nba_hupu_list VALUES(17,3,'游戏电竞','剑灵','http://127.0.0.1:3000/img/game5.jpg');
INSERT INTO nba_hupu_list VALUES(18,3,'游戏电竞','绝地求生','http://127.0.0.1:3000/img/game6.jpg');

INSERT INTO nba_hupu_list VALUES(19,4,'步行街','娱乐圈','http://127.0.0.1:3000/img/dist1.jpg');
INSERT INTO nba_hupu_list VALUES(20,4,'步行街','电影专区','http://127.0.0.1:3000/img/dist2.jpg');
INSERT INTO nba_hupu_list VALUES(21,4,'步行街','ACG专区','http://127.0.0.1:3000/img/dist3.jpg');
INSERT INTO nba_hupu_list VALUES(22,4,'步行街','音乐专区','http://127.0.0.1:3000/img/dist4.jpg');
INSERT INTO nba_hupu_list VALUES(23,4,'步行街','steam专区','http://127.0.0.1:3000/img/dist5.jpg');
INSERT INTO nba_hupu_list VALUES(24,4,'步行街','视频专区','http://127.0.0.1:3000/img/dist6.jpg');

INSERT INTO nba_hupu_list VALUES(25,5,'自建板块','创造101','http://127.0.0.1:3000/img/free1.jpg');
INSERT INTO nba_hupu_list VALUES(26,5,'自建板块','新恒结衣','http://127.0.0.1:3000/img/free2.jpg');
INSERT INTO nba_hupu_list VALUES(27,5,'自建板块','迪丽热巴','http://127.0.0.1:3000/img/free3.jpg');
INSERT INTO nba_hupu_list VALUES(28,5,'自建板块','陈奕迅','http://127.0.0.1:3000/img/free4.jpg');
INSERT INTO nba_hupu_list VALUES(29,5,'自建板块','林俊杰','http://127.0.0.1:3000/img/free5.jpg');
INSERT INTO nba_hupu_list VALUES(30,5,'自建板块','周杰伦','http://127.0.0.1:3000/img/free6.jpg');

INSERT INTO nba_hupu_list VALUES(31,6,'运动和装备','足球专区','http://127.0.0.1:3000/img/sport1.jpg');
INSERT INTO nba_hupu_list VALUES(32,6,'运动和装备','篮球专区','http://127.0.0.1:3000/img/sport2.jpg');
INSERT INTO nba_hupu_list VALUES(33,6,'运动和装备','球鞋专区','http://127.0.0.1:3000/img/sport3.jpg');
INSERT INTO nba_hupu_list VALUES(34,6,'运动和装备','球衣专区','http://127.0.0.1:3000/img/sport4.jpg');
INSERT INTO nba_hupu_list VALUES(35,6,'运动和装备','拍卖区','http://127.0.0.1:3000/img/sport5.jpg');
INSERT INTO nba_hupu_list VALUES(36,6,'运动和装备','潮流区','http://127.0.0.1:3000/img/sport6.jpg');

INSERT INTO nba_hupu_list VALUES(37,7,'综合体育','自由格斗','http://127.0.0.1:3000/img/synth1.jpg');
INSERT INTO nba_hupu_list VALUES(38,7,'综合体育','F1赛车','http://127.0.0.1:3000/img/synth2.jpg');
INSERT INTO nba_hupu_list VALUES(39,7,'综合体育','台球专区','http://127.0.0.1:3000/img/synth3.jpg');
INSERT INTO nba_hupu_list VALUES(40,7,'综合体育','游泳专区','http://127.0.0.1:3000/img/synth4.jpg');
INSERT INTO nba_hupu_list VALUES(41,7,'综合体育','法拉利','http://127.0.0.1:3000/img/synth5.jpg');
INSERT INTO nba_hupu_list VALUES(42,7,'综合体育','羽毛球','http://127.0.0.1:3000/img/synth6.jpg');
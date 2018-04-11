-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.21-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 movieshare 的数据库结构
CREATE DATABASE IF NOT EXISTS `movieshare` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `movieshare`;

-- 导出  表 movieshare.commentreplylist 结构
CREATE TABLE IF NOT EXISTS `commentreplylist` (
  `replyID` int(11) NOT NULL AUTO_INCREMENT,
  `replyContent` varchar(140) NOT NULL,
  `replyWhich` int(11) DEFAULT NULL,
  `replyDate` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  PRIMARY KEY (`replyID`),
  KEY `RC` (`commentID`),
  KEY `RU` (`userID`),
  KEY `RR` (`replyWhich`),
  CONSTRAINT `RC` FOREIGN KEY (`commentID`) REFERENCES `moviecommentlist` (`commentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RR` FOREIGN KEY (`replyWhich`) REFERENCES `commentreplylist` (`replyID`),
  CONSTRAINT `RU` FOREIGN KEY (`userID`) REFERENCES `userinformationlist` (`userID`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.commentreplylist 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `commentreplylist` DISABLE KEYS */;
INSERT INTO `commentreplylist` (`replyID`, `replyContent`, `replyWhich`, `replyDate`, `userID`, `commentID`) VALUES
	(2, '中信海直谢谢谢谢谢谢谢谢谢', NULL, '2018-03-27 02:22:22', 7, 16),
	(3, '话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单', 6, '2018-03-27 02:23:33', 5, 16),
	(4, 'replyResreplyResreplyResreplyResreplyResreplyResreplyRes', 6, '2018-03-27 02:33:35', 6, 16),
	(5, '哈哈哈哈哈哈哈哈哈哈', 6, '2018-03-27 02:33:36', 4, 16),
	(6, '好好好阿紅阿紅', NULL, '2018-03-27 00:00:01', 4, 16),
	(7, '嗯納尼你你你你你你你你你你你你', 4, '2018-03-27 00:00:00', 4, 16),
	(8, '111111111111111111111111111111111', NULL, '2018-03-27 00:00:00', 4, 16),
	(9, '這不能呢個', NULL, '2018-03-27 00:00:00', 4, 16),
	(10, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', NULL, '2021-03-27 00:00:03', 4, 17),
	(11, '恍恍惚惚惚或或或或或或', NULL, '2018-03-27 00:00:00', 4, 16),
	(12, 'assssssssssssssssssssssss', 4, '2018-04-02 11:03:51', 4, 16),
	(13, '不不不不不不不不不不不不不不不不不不不不不不不不不', 4, '2018-04-02 11:04:22', 4, 16),
	(14, '啛啛喳喳才错错错错错错错', 4, '2018-04-02 11:05:02', 4, 16),
	(15, '的等等等等等等等等等等等等等等等等等等等等哇哇哇大胃王无无无无无无无无无无无哇哇多无无无', NULL, '2018-04-02 11:05:10', 4, 16),
	(16, '呃呃呃呃呃呃呃呃呃呃呃呃', NULL, '2018-04-02 11:05:33', 4, 16),
	(17, '   撒啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', NULL, '2018-04-02 11:06:27', 4, 16),
	(18, '哈哈哈', NULL, '2018-04-02 13:12:13', 4, 18),
	(19, 'zzzz', 18, '2018-04-02 13:12:21', 4, 18),
	(20, 'eneneeeeeeeeeeeeeeeee', NULL, '2018-04-02 13:43:10', 4, 23),
	(21, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 20, '2018-04-02 13:43:16', 4, 23),
	(22, '这个真的不错请支持一下他', 21, '2018-04-02 13:43:33', 4, 23),
	(23, '笑想惺惺惜惺惺嘻嘻嘻惺惺惜惺惺惺惺惜惺惺惺惺惜惺惺惺惺惜惺惺惺惺惜惺惺笑嘻嘻笑笑嘻嘻', 17, '2018-04-05 16:31:11', 4, 16),
	(24, 'LLLL', 17, '2018-04-05 16:33:17', 4, 16),
	(324, 'hh', 22, '2018-04-11 09:14:44', 4, 23),
	(325, '嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯', NULL, '2018-04-11 09:50:31', 4, 24),
	(326, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', NULL, '2018-04-11 09:50:40', 4, 24);
/*!40000 ALTER TABLE `commentreplylist` ENABLE KEYS */;

-- 导出  表 movieshare.filmmakerinformationlist 结构
CREATE TABLE IF NOT EXISTS `filmmakerinformationlist` (
  `filmmakerID` int(8) NOT NULL AUTO_INCREMENT,
  `filmmakerName` varchar(20) NOT NULL,
  `filmmakerPhoto` blob NOT NULL,
  `filmmakerSex` varchar(1) NOT NULL,
  `filmmakerDescribe` varchar(2000) NOT NULL,
  `filmmakerBirth` date NOT NULL,
  `filmmakerBirthPlace` varchar(50) NOT NULL,
  PRIMARY KEY (`filmmakerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.filmmakerinformationlist 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `filmmakerinformationlist` DISABLE KEYS */;
INSERT INTO `filmmakerinformationlist` (`filmmakerID`, `filmmakerName`, `filmmakerPhoto`, `filmmakerSex`, `filmmakerDescribe`, `filmmakerBirth`, `filmmakerBirthPlace`) VALUES
	(3, '王晶', _binary 0x66696C65732F776A2E6A7067, '男', '原名王日祥，祖藉浙江绍兴，1955年出生于香港。毕业于中文大学中文系。父为名导演王天林。1997年编写了第一部电影剧本《鬼马狂潮》，此后的十余年，编过四十多部电影剧本。1981年首次执导电影《千王斗千霸》。他编导及监制的电影较多，名片有《精装追女仔》《最佳损友》《至尊无上》《赌神》等。1997年，他联同文隽等成立最佳拍档电影公司。 ', '1955-05-03', '中国香港'),
	(4, '周润发', _binary 0x66696C65732F7A72662E6A7067, '男', ' 周润发，广东宝安人，1955年5月18日生于香港南丫岛，为新界原居民，著名电影和电视演员，曾经三度获得香港电影金像奖最佳男主角奖，另外也拿到两次台湾电影金马奖最佳男主角头衔。 1980年代与成龙一并成为香港电影市场的票房保证，并创造了多个脍炙人口的经典角色：许文强、小马哥、赌神等多不胜数。1990年代开始后，与成龙、周星驰因为电影票房成绩出色，共同被媒体形容为“双周一成”。他于1995年赴美国好莱坞发展，在拍摄多部电影后获得一定程度上的成功。 ', '1955-05-18', '中国香港'),
	(7, '张敏', _binary 0x66696C65732F7A6D2E6A7067, '女', '　　香港亚洲电视著名演员。出道16年，拍过近70部影视剧。亚洲电视艺员训练班出身的张敏，1987年被永盛电影公司老板娘向太发掘，还没毕业即加盟永盛电影公司，迅速成为香港90年代炙手可热、拍片最多的女星，张敏的拍片记录至今亦无人超越，特别值得一提的是诸多武侠电影都有张敏的身影，和当时众多一线明星都有过合作（包括刘德华、郭富城、张学友、黎明、周润发、梁家辉等），尤其是她与周星驰的合作最为精彩，曾搭档过《逃学威龙》系列、《鹿鼎记》、《新精武门》、《九品芝麻官》、《赌圣》等等。 ', '1967-02-07', '中国上海'),
	(8, '刘德华', _binary 0x66696C65732F6C64682E6A7067, '男', 'http://localhost:8080/MovieShare/addfilmmaker.jsphttp://localhost:8080/MovieShare/addfilmmaker.jsphttp://localhost:8080/MovieShare/addfilmmaker.jsphttp://localhost:8080/MovieShare/addfilmmaker.jsphttp://localhost:8080/MovieShare/addfilmmaker.jsphttp://localhost:8080/MovieShare/addfilmmaker.jsphttp://localhost:8080/MovieShare/addfilmmaker.jsp', '1962-02-21', '中国台湾'),
	(9, '啊啊啊', _binary 0x66696C65732F7A72662E6A7067, '男', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2018-02-14', '搜索'),
	(10, '王宝强', _binary 0x66696C65732F777A782E6A7067, '男', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2018-02-15', '中国'),
	(14, '123', _binary 0x31, '', '1', '3918-05-05', 'bb'),
	(15, '456', _binary 0x31, '', '1', '3918-05-05', 'bb');
/*!40000 ALTER TABLE `filmmakerinformationlist` ENABLE KEYS */;

-- 导出  表 movieshare.filmmakerjoblist 结构
CREATE TABLE IF NOT EXISTS `filmmakerjoblist` (
  `filmmakerID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  KEY `FJF` (`filmmakerID`),
  KEY `FJJ` (`jobID`),
  CONSTRAINT `FJF` FOREIGN KEY (`filmmakerID`) REFERENCES `filmmakerinformationlist` (`filmmakerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FJJ` FOREIGN KEY (`jobID`) REFERENCES `jobinformationlist` (`jobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.filmmakerjoblist 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `filmmakerjoblist` DISABLE KEYS */;
INSERT INTO `filmmakerjoblist` (`filmmakerID`, `jobID`) VALUES
	(3, 1),
	(3, 2),
	(4, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(14, 1);
/*!40000 ALTER TABLE `filmmakerjoblist` ENABLE KEYS */;

-- 导出  表 movieshare.filmmakermovielist 结构
CREATE TABLE IF NOT EXISTS `filmmakermovielist` (
  `movieID` int(11) NOT NULL,
  `filmmakerID` int(11) NOT NULL,
  `filmmakerJob` varchar(10) NOT NULL,
  KEY `FMF` (`filmmakerID`),
  KEY `FMM` (`movieID`),
  CONSTRAINT `FMF` FOREIGN KEY (`filmmakerID`) REFERENCES `filmmakerinformationlist` (`filmmakerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FMM` FOREIGN KEY (`movieID`) REFERENCES `movieinformationlist` (`movieID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.filmmakermovielist 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `filmmakermovielist` DISABLE KEYS */;
INSERT INTO `filmmakermovielist` (`movieID`, `filmmakerID`, `filmmakerJob`) VALUES
	(5, 3, '导演'),
	(5, 4, '演员'),
	(5, 7, '演员'),
	(7, 3, '导演'),
	(7, 4, '演员'),
	(7, 7, '演员'),
	(8, 3, '导演'),
	(8, 4, '演员'),
	(9, 3, '导演'),
	(9, 4, '演员'),
	(10, 3, '导演'),
	(10, 3, '演员'),
	(11, 3, '导演'),
	(11, 8, '演员'),
	(12, 3, '导演'),
	(12, 8, '演员'),
	(5, 3, '演员');
/*!40000 ALTER TABLE `filmmakermovielist` ENABLE KEYS */;

-- 导出  表 movieshare.jobinformationlist 结构
CREATE TABLE IF NOT EXISTS `jobinformationlist` (
  `jobID` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(10) DEFAULT '0',
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.jobinformationlist 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `jobinformationlist` DISABLE KEYS */;
INSERT INTO `jobinformationlist` (`jobID`, `jobName`) VALUES
	(1, '演员'),
	(2, '导演');
/*!40000 ALTER TABLE `jobinformationlist` ENABLE KEYS */;

-- 导出  视图 movieshare.markinformation 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `markinformation` (
	`movieID` INT(8) NOT NULL,
	`total` BIGINT(21) NOT NULL,
	`one` BIGINT(21) NULL,
	`two` BIGINT(21) NULL,
	`three` BIGINT(21) NULL,
	`four` BIGINT(21) NULL,
	`five` BIGINT(21) NULL
) ENGINE=MyISAM;

-- 导出  表 movieshare.moviecommentlist 结构
CREATE TABLE IF NOT EXISTS `moviecommentlist` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentDate` date NOT NULL,
  `userID` int(8) NOT NULL,
  `commentTitle` varchar(50) NOT NULL,
  `commentContent` varchar(10000) NOT NULL,
  `movieID` int(8) NOT NULL,
  `ifSpoiler` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`commentID`),
  KEY `CM` (`movieID`),
  KEY `CU` (`userID`),
  CONSTRAINT `CM` FOREIGN KEY (`movieID`) REFERENCES `movieinformationlist` (`movieID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CU` FOREIGN KEY (`userID`) REFERENCES `userinformationlist` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.moviecommentlist 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `moviecommentlist` DISABLE KEYS */;
INSERT INTO `moviecommentlist` (`commentID`, `commentDate`, `userID`, `commentTitle`, `commentContent`, `movieID`, `ifSpoiler`) VALUES
	(16, '2018-02-02', 4, 'table的话稍微改一下更', '<p>table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单table的话稍微改一下更简单</p><p>', 7, 0),
	(17, '2018-02-02', 4, '高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀', '<p>高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀 高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀</p>', 5, 0),
	(18, '2018-04-02', 4, '从后台获取到数据以后', '<p>从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式 从后台获取到数据以后，需要根据不同的情况显示不同的页面信息，这时候需要用的c:if来进行判断，记录一下判断集合的方式</p>', 7, 0),
	(21, '2018-04-02', 4, '这是影评标题', '<p>这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。这是一篇影评。</p>', 7, 1),
	(22, '2018-04-02', 4, '这是一篇影评', '<p>这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评这是一篇影评</p>', 7, 1),
	(23, '2018-04-02', 4, 'ifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpo', '<p>ifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilerifSpoilervvviler</p>', 7, 0),
	(24, '2018-04-11', 4, '的等等等等等等等等等等等等等等等等等等等', '<p>的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等的等等等等等等等等等等等等等等等等等等等</p>', 5, 0);
/*!40000 ALTER TABLE `moviecommentlist` ENABLE KEYS */;

-- 导出  表 movieshare.movieinformationlist 结构
CREATE TABLE IF NOT EXISTS `movieinformationlist` (
  `movieID` int(8) NOT NULL AUTO_INCREMENT,
  `movieName` varchar(20) NOT NULL,
  `movieCover` blob NOT NULL,
  `movieDescribe` varchar(2000) NOT NULL,
  `movieLong` int(11) NOT NULL,
  `movieDate` date NOT NULL,
  `movieLanguage` varchar(10) NOT NULL,
  PRIMARY KEY (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.movieinformationlist 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `movieinformationlist` DISABLE KEYS */;
INSERT INTO `movieinformationlist` (`movieID`, `movieName`, `movieCover`, `movieDescribe`, `movieLong`, `movieDate`, `movieLanguage`) VALUES
	(5, '赌神 赌神', _binary 0x66696C65732F64732E6A7067, '　　高进（周润发 饰）前来香港与赌魔决斗，怎料刚抵港，便被南哥（杨泽霖 饰）追杀，结果堕入陷阱而失忆。幸得刀仔（刘德华 饰）和其女友珍（王祖贤 饰）相救，他们把高进带回家中疗养，发现高进精通赌术后，兴奋不已，想利用他来挣大钱，却反而因为高进发挥不稳亏了钱。\r\n　　高进妻子遭其堂弟高义醉酒后污辱杀害。高义进而联手南哥，设计谋害高进，四处搜罗进的藏身地点，前往追杀。逃亡之时，高进翻车受伤，竟恢复了记忆——但是却怎样也记不起失忆期间的事情。刀仔提醒进，高义并非好人，但进却毅然蒙在鼓里，不知危难当头', 155, '2018-04-02', '粤语/英语/法语'),
	(7, '赌神2 归来', _binary 0x66696C65732F64732E6A7067, 'http://localhost:8080/MovieShare/writecomment?movieID=5http://localhost:8080/MovieShare/writecomment?movieID=5http://localhost:8080/MovieShare/writecomment?movieID=5http://localhost:8080/MovieShare/writecomment?movieID=5', 166, '2018-04-02', '粤语/英语'),
	(8, '赌侠', _binary 0x66696C65732F64732E6A7067, '版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。版权归作者所有，任何形式转载请联系作者。', 155, '2018-04-01', '粤语'),
	(9, '澳门风云', _binary 0x66696C65732F776A2E6A7067, '澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云', 159, '2018-04-10', '粤语/汉语'),
	(10, '澳门风云2', _binary 0x66696C65732F777A782E6A7067, '澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云', 111, '2018-04-09', '汉语'),
	(11, '澳门风云3', _binary 0x66696C65732F64732E6A7067, '澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云', 154, '2018-04-10', '汉语'),
	(12, '千王之王', _binary 0x66696C65732F7A72662E6A7067, '澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云澳门风云', 106, '2018-04-10', '汉语');
/*!40000 ALTER TABLE `movieinformationlist` ENABLE KEYS */;

-- 导出  表 movieshare.moviemarklist 结构
CREATE TABLE IF NOT EXISTS `moviemarklist` (
  `markID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(8) NOT NULL,
  `movieID` int(8) NOT NULL,
  `markContent` varchar(200) NOT NULL,
  `markDate` datetime NOT NULL,
  `markScore` int(8) NOT NULL,
  PRIMARY KEY (`userID`,`movieID`),
  KEY `MM` (`movieID`),
  KEY `markID` (`markID`),
  CONSTRAINT `MM` FOREIGN KEY (`movieID`) REFERENCES `movieinformationlist` (`movieID`),
  CONSTRAINT `MU` FOREIGN KEY (`userID`) REFERENCES `userinformationlist` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.moviemarklist 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `moviemarklist` DISABLE KEYS */;
INSERT INTO `moviemarklist` (`markID`, `userID`, `movieID`, `markContent`, `markDate`, `markScore`) VALUES
	(10, 4, 5, '非常不错', '2018-04-02 13:13:24', 10),
	(1, 4, 7, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2018-04-11 09:44:13', 2),
	(11, 4, 8, '疯狂打call', '2018-04-02 13:15:16', 8),
	(5, 4, 12, '非常不错', '2018-04-02 13:13:24', 10),
	(7, 5, 5, '123456', '2018-03-31 17:02:04', 2),
	(2, 5, 7, '好的好的好的好的好的好的好的', '2018-03-31 16:56:33', 4),
	(3, 6, 7, '还行还行还行还行还行', '2018-03-31 16:56:54', 6),
	(12, 7, 5, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2018-04-11 09:43:37', 2),
	(4, 7, 7, '挺好的挺好的挺好的挺好的', '2018-03-31 16:57:18', 8);
/*!40000 ALTER TABLE `moviemarklist` ENABLE KEYS */;

-- 导出  视图 movieshare.moviescore 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `moviescore` (
	`movieScoreNum` BIGINT(21) NOT NULL,
	`movieEveryScore` DECIMAL(14,4) NULL,
	`movieID` INT(8) NOT NULL
) ENGINE=MyISAM;

-- 导出  表 movieshare.movietypelist 结构
CREATE TABLE IF NOT EXISTS `movietypelist` (
  `movieID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  KEY `MTM` (`movieID`),
  KEY `MTT` (`typeID`),
  CONSTRAINT `MTM` FOREIGN KEY (`movieID`) REFERENCES `movieinformationlist` (`movieID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MTT` FOREIGN KEY (`typeID`) REFERENCES `typeinformationlist` (`typeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.movietypelist 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `movietypelist` DISABLE KEYS */;
INSERT INTO `movietypelist` (`movieID`, `typeID`) VALUES
	(5, 1),
	(5, 2),
	(5, 5),
	(7, 2),
	(7, 3),
	(7, 4),
	(8, 4),
	(8, 5),
	(8, 6),
	(9, 2),
	(9, 3),
	(10, 2),
	(10, 3),
	(10, 4),
	(10, 5),
	(11, 1),
	(11, 2),
	(11, 3),
	(11, 4),
	(11, 5),
	(11, 6),
	(11, 7),
	(12, 1),
	(12, 2),
	(12, 5);
/*!40000 ALTER TABLE `movietypelist` ENABLE KEYS */;

-- 导出  表 movieshare.typeinformationlist 结构
CREATE TABLE IF NOT EXISTS `typeinformationlist` (
  `typeID` int(8) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.typeinformationlist 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `typeinformationlist` DISABLE KEYS */;
INSERT INTO `typeinformationlist` (`typeID`, `typeName`) VALUES
	(1, '动作'),
	(2, '喜剧'),
	(3, '武侠'),
	(4, '科幻'),
	(5, '剧情'),
	(6, '青春'),
	(7, '爱情');
/*!40000 ALTER TABLE `typeinformationlist` ENABLE KEYS */;

-- 导出  表 movieshare.userinformationlist 结构
CREATE TABLE IF NOT EXISTS `userinformationlist` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) NOT NULL,
  `userPassword` varchar(16) NOT NULL,
  `userEmail` varchar(64) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  movieshare.userinformationlist 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `userinformationlist` DISABLE KEYS */;
INSERT INTO `userinformationlist` (`userID`, `userName`, `userPassword`, `userEmail`) VALUES
	(4, 'zx7714', '123123', 'zhangxu73@qq.com'),
	(5, 'qqqwq7714', '123456', '1234@qq.com'),
	(6, 'qwe1230', '12301230', '12345@qq.com'),
	(7, 'helloworld', '123123', '4567@qq.com');
/*!40000 ALTER TABLE `userinformationlist` ENABLE KEYS */;

-- 导出  视图 movieshare.markinformation 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `markinformation`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `markinformation` AS select `m`.`movieID` AS `movieID`,count(0) AS `total`,(select count(0) from `moviemarklist` where ((`moviemarklist`.`movieID` = `m`.`movieID`) and (`moviemarklist`.`markScore` = 2))) AS `one`,(select count(0) from `moviemarklist` where ((`moviemarklist`.`movieID` = `m`.`movieID`) and (`moviemarklist`.`markScore` = 4))) AS `two`,(select count(0) from `moviemarklist` where ((`moviemarklist`.`movieID` = `m`.`movieID`) and (`moviemarklist`.`markScore` = 6))) AS `three`,(select count(0) from `moviemarklist` where ((`moviemarklist`.`movieID` = `m`.`movieID`) and (`moviemarklist`.`markScore` = 8))) AS `four`,(select count(0) from `moviemarklist` where ((`moviemarklist`.`movieID` = `m`.`movieID`) and (`moviemarklist`.`markScore` = 10))) AS `five` from `moviemarklist` `m` group by `m`.`movieID`;

-- 导出  视图 movieshare.moviescore 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `moviescore`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `moviescore` AS select count(0) AS `movieScoreNum`,avg(`moviemarklist`.`markScore`) AS `movieEveryScore`,`moviemarklist`.`movieID` AS `movieID` from `moviemarklist` group by `moviemarklist`.`movieID` order by count(0) desc;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

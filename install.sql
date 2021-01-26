CREATE TABLE IF NOT EXISTS `jieqi_system_groups` (
    `groupid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '1是管理员，2是普通用户，3是作者',
    `name` varchar(50) NOT NULL DEFAULT '',
    `description` text,
    `grouptype` tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`groupid`) USING BTREE,
    unique key `name` (`name`) USING BTREE
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_system_users` (
    `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `siteid` int(11) unsigned NOT NULL DEFAULT '0',
    `uname` varchar(30) CHARACTER SET gbk COLLATE gbk_bin NOT NULL DEFAULT '',
    `name` varchar(60) NOT NULL DEFAULT '',
    `pass` varchar(32) NOT NULL DEFAULT '',
    `salt` varchar(32) NOT NULL DEFAULT '',
    `groupid` tinyint(3) NOT NULL DEFAULT '0',
    `regdate` int(11) unsigned NOT NULL DEFAULT '0',
    `initial` char(1) NOT NULL DEFAULT '',
    `sex` tinyint(1) NOT NULL DEFAULT '0',
    `email` varchar(60) NOT NULL DEFAULT '',
    `url` varchar(100) NOT NULL DEFAULT '',
    `avatar` int(11) NOT NULL DEFAULT '0',
    `workid` tinyint(3) NOT NULL DEFAULT '0',
    `qq` varchar(15) NOT NULL DEFAULT '',
    `weixin` varchar(100) NOT NULL DEFAULT '',
    `weibo` varchar(100) NOT NULL DEFAULT '',
    `mobile` varchar(20) NOT NULL DEFAULT '',
    `sign` text,
    `intro` text,
    `setting` text,
    `badges` text,
    `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
    `verify` int(11) unsigned NOT NULL DEFAULT '0',
    `showset` int(11) unsigned NOT NULL DEFAULT '0',
    `acceptset` int(11) unsigned NOT NULL DEFAULT '0',
    `monthscore` int(11) NOT NULL DEFAULT '0',
    `weekscore` int(11) NOT NULL DEFAULT '0',
    `dayscore` int(11) NOT NULL DEFAULT '0',
    `lastscore` int(11) unsigned NOT NULL DEFAULT '0',
    `experience` int(11) NOT NULL DEFAULT '0',
    `score` int(11) NOT NULL DEFAULT '0',
    `egold` int(11) NOT NULL DEFAULT '0',
    `esilver` int(11) NOT NULL DEFAULT '0',
    `sumtip` int(11) unsigned NOT NULL DEFAULT '0',
    `sumtask` int(11) unsigned NOT NULL DEFAULT '0',
    `sumworks` int(11) unsigned NOT NULL DEFAULT '0',
    `sumaward` int(11) unsigned NOT NULL DEFAULT '0',
    `sumgift` int(11) unsigned NOT NULL DEFAULT '0',
    `sumother` int(11) unsigned NOT NULL DEFAULT '0',
    `sumemoney` int(11) unsigned NOT NULL DEFAULT '0',
    `summoney` int(11) unsigned NOT NULL DEFAULT '0',
    `paidmoney` int(11) unsigned NOT NULL DEFAULT '0',
    `paidemoney` int(11) unsigned NOT NULL DEFAULT '0',
    `paytime` int(11) unsigned NOT NULL DEFAULT '0',
    `credit` int(11) NOT NULL DEFAULT '0',
    `goodnum` int(11) NOT NULL DEFAULT '0',
    `badnum` int(11) NOT NULL DEFAULT '0',
    `expenses` int(11) NOT NULL DEFAULT '0',
    `conisbind` int(11) unsigned NOT NULL DEFAULT '0',
    `apiname` varchar(100) NOT NULL DEFAULT '',
    `channel` varchar(100) NOT NULL DEFAULT '',
    `device` varchar(100) NOT NULL DEFAULT '',
    `viplevel` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `isvip` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `overtime` int(11) NOT NULL DEFAULT '0',
    `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`uid`) USING BTREE,
    unique key `uname` (`uname`) USING BTREE,
    key `pass` (`pass`) USING BTREE,
    key `email` (`email`) USING BTREE,
    key `groupid` (`groupid`) USING BTREE
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_cate` (
   `typeid` int(11) NOT NULL AUTO_INCREMENT,
   `cate_name` varchar(20) NOT NULL COMMENT '分类名',
   `create_time` int(11) DEFAULT '0',
   `update_time` int(11) DEFAULT '0',
   PRIMARY KEY (`typeid`) USING BTREE,
   unique KEY `cate_name` (`cate_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(255)  DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `articleid` int(11) NOT NULL COMMENT '所属漫画ID',
  `title` varchar(50) NOT NULL COMMENT '轮播图标题',
    `banner_order` INT(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
    KEY `banner_order` (`banner_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_article_article` (
    `articleid` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `siteid` int(11) unsigned NOT NULL DEFAULT '0',
    `sourceid` int(11) unsigned NOT NULL DEFAULT '0',
    `postdate` int(11) unsigned NOT NULL DEFAULT '0',
    `lastupdate` int(11) unsigned NOT NULL DEFAULT '0',
    `infoupdate` int(11) unsigned NOT NULL DEFAULT '0',
    `articlename` varchar(50) NOT NULL DEFAULT '',
    `articlecode` varchar(200) NOT NULL DEFAULT '',
    `backupname` varchar(100) NOT NULL DEFAULT '',
    `keywords` varchar(100) NOT NULL DEFAULT '',
    `roles` varchar(200) NOT NULL DEFAULT '',
    `initial` char(1) NOT NULL DEFAULT '',
    `authorid` int(11) unsigned NOT NULL DEFAULT '0',
    `author` varchar(30) NOT NULL DEFAULT '',
    `posterid` int(11) unsigned NOT NULL DEFAULT '0',
    `poster` varchar(30) NOT NULL DEFAULT '',
    `agentid` int(11) unsigned NOT NULL DEFAULT '0',
    `agent` varchar(30) NOT NULL DEFAULT '',
    `reviewerid` int(11) unsigned NOT NULL DEFAULT '0',
    `reviewer` varchar(30) NOT NULL DEFAULT '',
    `sortid` smallint(3) unsigned NOT NULL DEFAULT '0',
    `typeid` smallint(3) unsigned NOT NULL DEFAULT '0',
    `libid` smallint(3) unsigned NOT NULL DEFAULT '0',
    `intro` text,
    `notice` text,
    `foreword` text,
    `setting` text,
    `lastvolumeid` int(11) unsigned NOT NULL DEFAULT '0',
    `lastvolume` varchar(100) NOT NULL DEFAULT '',
    `lastchapterid` int(11) unsigned NOT NULL DEFAULT '0',
    `lastchapter` varchar(100) NOT NULL DEFAULT '',
    `lastsummary` text,
    `chapters` smallint(6) unsigned NOT NULL DEFAULT '0',
    `words` int(11) unsigned NOT NULL DEFAULT '0',
    `size` int(11) unsigned NOT NULL DEFAULT '0',
    `daywords` int(11) unsigned NOT NULL DEFAULT '0',
    `weekwords` int(11) unsigned NOT NULL DEFAULT '0',
    `monthwords` int(11) unsigned NOT NULL DEFAULT '0',
    `prewords` int(11) unsigned NOT NULL DEFAULT '0',
    `monthupds` int(11) unsigned NOT NULL DEFAULT '0',
    `preupds` int(11) unsigned NOT NULL DEFAULT '0',
    `monthupdt` int(11) unsigned NOT NULL DEFAULT '0',
    `preupdt` int(11) unsigned NOT NULL DEFAULT '0',
    `lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
    `dayvisit` int(11) unsigned NOT NULL DEFAULT '0',
    `weekvisit` int(11) unsigned NOT NULL DEFAULT '0',
    `monthvisit` int(11) unsigned NOT NULL DEFAULT '0',
    `allvisit` int(11) unsigned NOT NULL DEFAULT '0',
    `previsit` int(11) unsigned NOT NULL DEFAULT '0',
    `lastvote` int(11) unsigned NOT NULL DEFAULT '0',
    `dayvote` int(11) unsigned NOT NULL DEFAULT '0',
    `weekvote` int(11) unsigned NOT NULL DEFAULT '0',
    `monthvote` int(11) unsigned NOT NULL DEFAULT '0',
    `allvote` int(11) unsigned NOT NULL DEFAULT '0',
    `prevote` int(11) unsigned NOT NULL DEFAULT '0',
    `lastdown` int(11) unsigned NOT NULL DEFAULT '0',
    `daydown` int(11) unsigned NOT NULL DEFAULT '0',
    `weekdown` int(11) unsigned NOT NULL DEFAULT '0',
    `monthdown` int(11) unsigned NOT NULL DEFAULT '0',
    `alldown` int(11) unsigned NOT NULL DEFAULT '0',
    `predown` int(11) unsigned NOT NULL DEFAULT '0',
    `lastflower` int(11) unsigned NOT NULL DEFAULT '0',
    `dayflower` int(11) unsigned NOT NULL DEFAULT '0',
    `weekflower` int(11) unsigned NOT NULL DEFAULT '0',
    `monthflower` int(11) unsigned NOT NULL DEFAULT '0',
    `allflower` int(11) unsigned NOT NULL DEFAULT '0',
    `preflower` int(11) unsigned NOT NULL DEFAULT '0',
    `lastegg` int(11) unsigned NOT NULL DEFAULT '0',
    `dayegg` int(11) unsigned NOT NULL DEFAULT '0',
    `weekegg` int(11) unsigned NOT NULL DEFAULT '0',
    `monthegg` int(11) unsigned NOT NULL DEFAULT '0',
    `allegg` int(11) unsigned NOT NULL DEFAULT '0',
    `preegg` int(11) unsigned NOT NULL DEFAULT '0',
    `lastvipvote` int(11) unsigned NOT NULL DEFAULT '0',
    `dayvipvote` int(11) unsigned NOT NULL DEFAULT '0',
    `weekvipvote` int(11) unsigned NOT NULL DEFAULT '0',
    `monthvipvote` int(11) unsigned NOT NULL DEFAULT '0',
    `allvipvote` int(11) unsigned NOT NULL DEFAULT '0',
    `previpvote` int(11) unsigned NOT NULL DEFAULT '0',
    `hotnum` int(11) unsigned NOT NULL DEFAULT '0',
    `goodnum` int(11) unsigned NOT NULL DEFAULT '0',
    `reviewsnum` int(11) unsigned NOT NULL DEFAULT '0',
    `ratenum` int(11) unsigned NOT NULL DEFAULT '0',
    `ratesum` int(11) unsigned NOT NULL DEFAULT '0',
    `rate1` int(11) unsigned NOT NULL DEFAULT '0',
    `rate2` int(11) unsigned NOT NULL DEFAULT '0',
    `rate3` int(11) unsigned NOT NULL DEFAULT '0',
    `rate4` int(11) unsigned NOT NULL DEFAULT '0',
    `rate5` int(11) unsigned NOT NULL DEFAULT '0',
    `toptime` int(11) unsigned NOT NULL DEFAULT '0',
    `saleprice` int(11) unsigned NOT NULL DEFAULT '0',
    `salenum` int(11) unsigned NOT NULL DEFAULT '0',
    `totalcost` int(11) unsigned NOT NULL DEFAULT '0',
    `unionid` int(11) unsigned NOT NULL DEFAULT '0',
    `permission` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `firstflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `fullflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `imgflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `upaudit` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `power` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `progress` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `issign` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `signtime` int(11) unsigned NOT NULL DEFAULT '0',
    `buyout` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `monthly` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `discount` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `isshort` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `inmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `isshare` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `rgroup` tinyint(1) unsigned NOT NULL DEFAULT '1',
    `ispub` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `pubtime` int(11) unsigned NOT NULL DEFAULT '0',
    `pubid` int(11) unsigned NOT NULL DEFAULT '0',
    `pubhouse` varchar(100) NOT NULL DEFAULT '',
    `pubprice` int(11) unsigned NOT NULL DEFAULT '0',
    `pubpages` int(11) unsigned NOT NULL DEFAULT '0',
    `pubisbn` varchar(100) NOT NULL DEFAULT '',
    `pubinfo` text,
    `buysite` varchar(100) NOT NULL DEFAULT '',
    `buyurl` varchar(200) NOT NULL DEFAULT '',
    `buyprice` int(11) unsigned NOT NULL DEFAULT '0',
    `buyinfo` text,
    `buysid` int(11) unsigned NOT NULL DEFAULT '0',
    `freetime` int(11) unsigned NOT NULL DEFAULT '0',
    `freewords` int(11) unsigned NOT NULL DEFAULT '0',
    `freestart` int(11) unsigned NOT NULL DEFAULT '0',
    `freeend` int(11) unsigned NOT NULL DEFAULT '0',
    `isvip` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `viptime` int(11) unsigned NOT NULL DEFAULT '0',
    `vipid` int(11) unsigned NOT NULL DEFAULT '0',
    `vippubid` smallint(6) unsigned NOT NULL DEFAULT '0',
    `vipchapters` smallint(6) unsigned NOT NULL DEFAULT '0',
    `vipwords` int(11) unsigned NOT NULL DEFAULT '0',
    `vipvolumeid` int(11) unsigned NOT NULL DEFAULT '0',
    `vipvolume` varchar(100) NOT NULL DEFAULT '',
    `vipchapterid` int(11) unsigned NOT NULL DEFAULT '0',
    `vipchapter` varchar(100) NOT NULL DEFAULT '',
    `vipsummary` text,
    PRIMARY KEY (`articleid`),
    KEY `articlename` (`articlename`),
    KEY `lastupdate` (`lastupdate`),
    KEY `author` (`author`),
    KEY `words` (`words`),
    KEY `size` (`size`),
    KEY `allvisit` (`allvisit`) USING BTREE,
    KEY `monthvisit` (`monthvisit`) USING BTREE,
    KEY `sortid` (`sortid`) USING BTREE,
    KEY `weekvisit` (`weekvisit`) USING BTREE,
    KEY `fullflag` (`fullflag`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_article_chapter` (
    `chapterid` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `siteid` int(11) unsigned NOT NULL DEFAULT '0',
    `sourceid` int(11) unsigned NOT NULL DEFAULT '0',
    `sourcecid` int(11) unsigned NOT NULL DEFAULT '0',
    `sourcecorder` int(11) unsigned NOT NULL DEFAULT '0',
    `articleid` int(11) unsigned NOT NULL DEFAULT '0',
    `articlename` varchar(50) NOT NULL DEFAULT '',
    `volumeid` int(11) unsigned NOT NULL DEFAULT '0',
    `posterid` int(11) unsigned NOT NULL DEFAULT '0',
    `poster` varchar(30) NOT NULL DEFAULT '',
    `postdate` int(11) unsigned NOT NULL DEFAULT '0',
    `lastupdate` int(11) unsigned NOT NULL DEFAULT '0',
    `chaptername` varchar(100) NOT NULL DEFAULT '',
    `chapterorder` smallint(6) unsigned NOT NULL DEFAULT '0',
    `words` int(11) unsigned NOT NULL DEFAULT '0',
    `saleprice` int(11) unsigned NOT NULL DEFAULT '0',
    `salenum` int(11) unsigned NOT NULL DEFAULT '0',
    `totalcost` int(11) unsigned NOT NULL DEFAULT '0',
    `attachment` text,
    `summary` text,
    `preface` text NOT NULL,
    `notice` text NOT NULL,
    `foreword` text NOT NULL,
    `isbody` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `isvip` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `pages` smallint(6) unsigned NOT NULL DEFAULT '0',
    `chaptertype` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `power` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`chapterid`),
    KEY `lastupdate` (`lastupdate`),
    KEY `articleid` (`articleid`,`chapterorder`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_tail` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `articleid` int(11) unsigned NOT NULL DEFAULT '0',
    `tailname` varchar(200) NOT NULL COMMENT '长尾词',
    `tailcode` varchar(255) NOT NULL COMMENT '唯一标识',
    `create_time` int(11) DEFAULT '0',
    `update_time` int(11) DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `tailname` (`tailname`),
    unique key `tailcode` (`tailcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_friendship_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '友链名',
  `url` varchar(255) NOT NULL COMMENT '友链地址',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_user_favor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `articleid` int(10) unsigned NOT NULL COMMENT '用户收藏的小说ID',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  key articleid (`articleid`) USING BTREE,
  key uid (`uid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `articleid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `articleid` (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jieqi_book_logs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `book_name` varchar(100)  DEFAULT '',
  `src_url` varchar(255)  NOT NULL DEFAULT '',
  `log_time` int(10) DEFAULT 0,
  `src` varchar(32) NOT NULL DEFAULT '',
  `last_chapter` varchar(100) DEFAULT NULL,
  `last_chapter_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
    KEY `src_url`(`src_url`) USING BTREE,
    KEY `book_id`(`book_id`) USING BTREE,
    KEY `book_name`(`book_name`) USING BTREE,
    KEY `log_time`(`log_time`) USING BTREE,
    KEY `src`(`src`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `jieqi_chapter_logs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `chapter_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `chapter_name` varchar(100) DEFAULT '',
  `src_url` varchar(255) NOT NULL DEFAULT '',
  `chapter_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `log_time` int(10) UNSIGNED DEFAULT 0,
    `src` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
    KEY `src_url`(`src_url`) USING BTREE,
    KEY `chapter_id`(`chapter_id`) USING BTREE,
    KEY `chapter_name`(`chapter_name`) USING BTREE,
    KEY `chapter_order`(`chapter_order`) USING BTREE,
    KEY `log_time`(`log_time`) USING BTREE,
    KEY `src`(`src`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 ROW_FORMAT = Dynamic;

INSERT INTO jieqi_system_groups(`name`,description,grouptype) VALUES('管理员','系统管理员',0);
INSERT INTO jieqi_system_users(uname,`name`,pass,salt,groupid) VALUES('admin','管理员','df10ef8509dc176d733d59549e7dbfaf','abc',1);

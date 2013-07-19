-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 07 月 17 日 09:14
-- 服务器版本: 5.5.27
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zx`
--

-- --------------------------------------------------------

--
-- 表的结构 `zx_account`
--

CREATE TABLE IF NOT EXISTS `zx_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `total` decimal(11,2) DEFAULT '0.00' COMMENT '�ʽ��ܶ�',
  `use_money` decimal(11,2) DEFAULT '0.00',
  `no_use_money` decimal(11,2) DEFAULT '0.00' COMMENT '冻结金',
  `collection` decimal(11,2) DEFAULT '0.00' COMMENT '待回收金额',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_account_bank`
--

CREATE TABLE IF NOT EXISTS `zx_account_bank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�ID',
  `account` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '�˺�',
  `bank` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `branch` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '֧��',
  `province` int(5) DEFAULT '0' COMMENT 'ʡ��',
  `city` int(5) DEFAULT '0' COMMENT '����',
  `area` int(5) DEFAULT '0' COMMENT '��',
  `addtime` varchar(11) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(15) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='�����ʻ�' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_account_cash`
--

CREATE TABLE IF NOT EXISTS `zx_account_cash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�ID',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `account` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '�˺�',
  `bank` text CHARACTER SET gbk COMMENT '��������',
  `branch` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '֧��',
  `total` float(20,2) DEFAULT '0.00' COMMENT '�ܶ�',
  `credited` varchar(20) CHARACTER SET gbk DEFAULT '0' COMMENT '�����ܶ�',
  `fee` varchar(20) CHARACTER SET gbk DEFAULT '0' COMMENT '������',
  `verify_userid` int(11) DEFAULT NULL,
  `verify_time` int(11) DEFAULT NULL,
  `verify_remark` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(11) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(15) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_ids` (`user_id`,`status`),
  KEY `user_idv` (`user_id`,`status`,`verify_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='���ּ�¼' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_account_log`
--

CREATE TABLE IF NOT EXISTS `zx_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�ID',
  `type` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `total` decimal(11,2) DEFAULT '0.00',
  `money` decimal(20,2) DEFAULT NULL COMMENT '���',
  `use_money` decimal(10,2) DEFAULT '0.00' COMMENT '���ý��',
  `no_use_money` decimal(10,2) DEFAULT '0.00' COMMENT '������',
  `collection` decimal(11,2) DEFAULT '0.00',
  `to_user` int(11) DEFAULT NULL COMMENT '���׶Է�',
  `remark` varchar(250) CHARACTER SET gbk DEFAULT '0' COMMENT '��ע',
  `addtime` varchar(11) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(15) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='�ʽ��¼' AUTO_INCREMENT=329 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_account_payment`
--

CREATE TABLE IF NOT EXISTS `zx_account_payment` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `style` int(2) DEFAULT NULL,
  `config` longtext CHARACTER SET gbk,
  `fee` int(10) DEFAULT '0',
  `fee_type` int(2) DEFAULT NULL,
  `max_money` int(10) DEFAULT NULL,
  `max_fee` int(10) DEFAULT NULL,
  `description` longtext CHARACTER SET gbk,
  `order` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_account_recharge`
--

CREATE TABLE IF NOT EXISTS `zx_account_recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `payment` varchar(100) DEFAULT NULL COMMENT '具体充值方式',
  `return` text,
  `type` varchar(10) DEFAULT '0' COMMENT '1.offline 2.online',
  `remark` varchar(250) DEFAULT '0' COMMENT '账单流水号',
  `fee` varchar(10) DEFAULT NULL,
  `verify_userid` int(11) DEFAULT '0',
  `verify_time` varchar(11) DEFAULT NULL,
  `verify_remark` varchar(250) DEFAULT NULL,
  `addtime` varchar(11) DEFAULT NULL,
  `addip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_ids` (`user_id`,`status`),
  KEY `user_idp` (`user_id`,`payment`),
  KEY `user_idv` (`user_id`,`payment`,`verify_userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='��ֵ��¼' AUTO_INCREMENT=50 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_ad`
--

CREATE TABLE IF NOT EXISTS `zx_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `order` int(10) NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `litpic` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `timelimit` int(2) NOT NULL DEFAULT '0',
  `firsttime` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `endtime` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `content` text CHARACTER SET latin1 NOT NULL,
  `endcontent` text CHARACTER SET latin1 NOT NULL,
  `addtime` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `addip` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_area`
--

CREATE TABLE IF NOT EXISTS `zx_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `domain` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nid` (`nid`),
  KEY `nidp` (`nid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3577 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_article`
--

CREATE TABLE IF NOT EXISTS `zx_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `littitle` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `flag` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `publish` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `is_jump` char(1) CHARACTER SET gbk DEFAULT NULL,
  `author` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `jumpurl` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `province` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `area` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `content` text CHARACTER SET gbk,
  `order` int(11) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `comment` int(11) DEFAULT '0',
  `is_comment` char(1) CHARACTER SET gbk DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=159 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_article_fields`
--

CREATE TABLE IF NOT EXISTS `zx_article_fields` (
  `aid` int(11) unsigned NOT NULL DEFAULT '0',
  `files` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zx_assignments`
--

CREATE TABLE IF NOT EXISTS `zx_assignments` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zx_attestation`
--

CREATE TABLE IF NOT EXISTS `zx_attestation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `type_id` int(11) DEFAULT '0' COMMENT '�ϴ�������',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0' COMMENT '��֤��״̬',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��֤��ͼƬ',
  `content` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��֤�ļ��',
  `jifen` int(20) DEFAULT '0' COMMENT '��֤�Ļ���',
  `pic` text CHARACTER SET gbk,
  `pic2` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `pic3` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `verify_time` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʱ��',
  `verify_user` int(11) DEFAULT NULL COMMENT '�����',
  `verify_remark` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '��˱�ע',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=372 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_attestation_type`
--

CREATE TABLE IF NOT EXISTS `zx_attestation_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `order` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `jifen` int(20) DEFAULT '0' COMMENT '����',
  `summary` varchar(200) CHARACTER SET gbk DEFAULT NULL COMMENT '���',
  `remark` varchar(200) CHARACTER SET gbk DEFAULT NULL COMMENT '��ע',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_credits`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_credits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creditscode` char(45) CHARACTER SET gbk DEFAULT NULL,
  `creditsname` char(45) CHARACTER SET gbk DEFAULT NULL,
  `postvar` int(11) DEFAULT '0',
  `replyvar` int(11) DEFAULT '0',
  `goodvar` int(11) DEFAULT '0',
  `uploadvar` int(11) DEFAULT '0',
  `downvar` int(11) DEFAULT '0',
  `votevar` int(11) DEFAULT '0',
  `isuse` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_dirtywords`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_dirtywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(45) CHARACTER SET gbk DEFAULT NULL,
  `replaceto` char(45) CHARACTER SET gbk DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT '0',
  `doaction` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_forums`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `content` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `rules` text CHARACTER SET gbk,
  `picurl` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `admins` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `today_num` int(10) unsigned DEFAULT '0',
  `topics_num` int(10) unsigned DEFAULT '0',
  `posts_num` int(10) unsigned DEFAULT '0',
  `last_postname` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `last_postuser` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `last_postusername` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `last_posttime` int(10) unsigned DEFAULT '0',
  `last_postid` int(10) unsigned DEFAULT '0',
  `isverify` tinyint(1) unsigned DEFAULT '0',
  `forumpass` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `forumusers` text CHARACTER SET gbk,
  `forumgroups` text CHARACTER SET gbk,
  `showtype` tinyint(1) unsigned DEFAULT '0',
  `ishidden` tinyint(1) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_posts`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned DEFAULT NULL,
  `istopic` tinyint(1) unsigned DEFAULT '0',
  `fid` int(10) unsigned DEFAULT '0',
  `user_id` int(10) unsigned DEFAULT '0',
  `username` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `edittime` int(10) unsigned DEFAULT '0',
  `iscover` tinyint(1) unsigned DEFAULT '0',
  `isverify` int(1) unsigned DEFAULT '0',
  `verifydesc` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(11) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(15) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=128 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_reward`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned DEFAULT '0',
  `userid` int(10) unsigned DEFAULT '0',
  `bestid` int(10) unsigned DEFAULT '0',
  `reward` int(10) unsigned DEFAULT '0',
  `rewardcredits` varchar(8) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_settings`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `value` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `style` int(2) DEFAULT NULL,
  `status` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_bbs_topics`
--

CREATE TABLE IF NOT EXISTS `zx_bbs_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned DEFAULT '0',
  `user_id` int(10) unsigned DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `username` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `posttime` int(10) unsigned DEFAULT '0',
  `edittime` int(10) unsigned DEFAULT '0',
  `ordertime` int(10) unsigned DEFAULT '0',
  `last_replytime` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `last_replyuser` int(11) DEFAULT NULL,
  `last_replyusername` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `type` tinyint(1) unsigned DEFAULT '0',
  `posts_num` int(10) unsigned DEFAULT '0',
  `hits` int(10) unsigned DEFAULT '0',
  `islock` tinyint(1) unsigned DEFAULT '0',
  `isgood` tinyint(1) unsigned DEFAULT '0',
  `istop` tinyint(1) unsigned DEFAULT '0',
  `isalltop` tinyint(1) unsigned DEFAULT '0',
  `stamp` tinyint(1) unsigned DEFAULT '0',
  `isrecycle` tinyint(1) unsigned DEFAULT '0',
  `credit` int(11) DEFAULT NULL,
  `verifystate` tinyint(1) unsigned DEFAULT '0',
  `verifydesc` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `isresolved` tinyint(1) unsigned DEFAULT '0',
  `attachicon` varchar(45) CHARACTER SET gbk DEFAULT NULL,
  `highlight` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topictype` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=80 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow`
--

CREATE TABLE IF NOT EXISTS `zx_borrow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `order` int(11) DEFAULT '0' COMMENT '����',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����ͼ',
  `flag` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `is_vouch` int(2) NOT NULL DEFAULT '0',
  `type` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `view_type` int(11) NOT NULL DEFAULT '0',
  `vouch_award` varchar(40) CHARACTER SET gbk NOT NULL DEFAULT '',
  `vouch_user` varchar(100) CHARACTER SET gbk NOT NULL DEFAULT '',
  `vouch_account` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `vouch_times` int(11) NOT NULL DEFAULT '0',
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��Դ',
  `publish` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `customer` varchar(11) CHARACTER SET gbk DEFAULT NULL COMMENT '�ͷ�',
  `number_id` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `verify_user` varchar(11) CHARACTER SET gbk DEFAULT NULL COMMENT '�����',
  `verify_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ͷ�',
  `verify_remark` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `repayment_user` int(11) DEFAULT '0',
  `forst_account` varchar(50) CHARACTER SET gbk DEFAULT '0',
  `repayment_account` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `monthly_repayment` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'ÿ�»����',
  `repayment_yesaccount` varchar(50) CHARACTER SET gbk DEFAULT '0',
  `repayment_yesinterest` int(11) NOT NULL DEFAULT '0',
  `repayment_time` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `repayment_remark` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `success_time` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `end_time` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `payment_account` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `each_time` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `use` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��;',
  `time_limit` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�������',
  `style` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʽ',
  `account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ܽ��',
  `account_yes` varchar(10) CHARACTER SET gbk DEFAULT '0',
  `tender_times` varchar(11) CHARACTER SET gbk DEFAULT '0',
  `apr` decimal(18,2) DEFAULT NULL COMMENT '������',
  `lowest_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���Ͷ����',
  `most_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���Ͷ���ܶ�',
  `valid_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��Чʱ��',
  `award` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'Ͷ�꽱��',
  `part_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��̯�������',
  `funds` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���������ı���',
  `is_false` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʧ��ʱҲͬ������ ',
  `open_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵ��ʻ��ʽ����',
  `open_borrow` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵĽ���ʽ����',
  `open_tender` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵ�Ͷ���ʽ����',
  `open_credit` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵ����ö�����',
  `content` text CHARACTER SET gbk COMMENT '��ϸ˵��',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_ids` (`user_id`,`status`),
  KEY `user_idst` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_amount`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_amount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) CHARACTER SET gbk NOT NULL DEFAULT '',
  `account` int(11) NOT NULL DEFAULT '0',
  `newaccount` decimal(11,0) DEFAULT '0',
  `oldaccount` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `addtime` varchar(30) CHARACTER SET gbk NOT NULL DEFAULT '',
  `content` text CHARACTER SET gbk NOT NULL,
  `remark` text CHARACTER SET gbk NOT NULL,
  `verify_remark` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `verify_time` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `verify_user` int(11) DEFAULT NULL,
  `addip` varchar(30) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_amountlog`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_amountlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `amount_type` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_total` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_use` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_nouse` decimal(11,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(250) CHARACTER SET gbk NOT NULL DEFAULT '',
  `addtime` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `addip` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_amountlog1`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_amountlog1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `amount_type` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_total` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_use` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_nouse` decimal(11,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(250) CHARACTER SET gbk NOT NULL DEFAULT '',
  `addtime` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `addip` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_collection`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_collection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `status` int(2) DEFAULT '0',
  `order` int(2) DEFAULT NULL,
  `tender_id` int(11) DEFAULT '0' COMMENT '���id',
  `repay_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ƻ���ʱ��',
  `repay_yestime` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ѿ�����ʱ��',
  `repay_account` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'Ԥ�����',
  `repay_yesaccount` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'ʵ�����',
  `interest` varchar(50) CHARACTER SET gbk DEFAULT '0',
  `capital` varchar(50) CHARACTER SET gbk DEFAULT '0',
  `late_days` int(11) NOT NULL DEFAULT '0',
  `late_interest` varchar(11) CHARACTER SET gbk NOT NULL DEFAULT '0',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_line`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_line` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `order` int(11) DEFAULT '0' COMMENT '����',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����ͼ',
  `flag` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `type` int(2) DEFAULT '0' COMMENT '�������',
  `borrow_use` int(10) DEFAULT '0' COMMENT '������;',
  `borrow_qixian` int(10) DEFAULT '0' COMMENT '��������',
  `province` int(10) DEFAULT '0' COMMENT 'ʡ��',
  `city` int(10) DEFAULT '0' COMMENT '����',
  `area` int(10) DEFAULT '0' COMMENT '����',
  `account` varchar(11) CHARACTER SET gbk DEFAULT NULL COMMENT '������',
  `content` text CHARACTER SET gbk COMMENT '��ϸ˵��',
  `pawn` varchar(2) CHARACTER SET gbk DEFAULT NULL COMMENT '���޵�Ѻ',
  `tel` varchar(15) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰',
  `sex` varchar(2) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ա�',
  `xing` varchar(11) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `verify_user` int(11) DEFAULT NULL COMMENT '�����',
  `verify_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʱ��',
  `verify_remark` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_repayment`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_repayment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `status` int(2) DEFAULT '0',
  `webstatus` int(2) NOT NULL DEFAULT '0' COMMENT '��վ����',
  `order` int(2) DEFAULT NULL,
  `borrow_id` int(11) DEFAULT '0' COMMENT '���id',
  `repayment_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ƻ���ʱ��',
  `repayment_yestime` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ѿ�����ʱ��',
  `repayment_account` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'Ԥ�����',
  `repayment_yesaccount` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'ʵ�����',
  `late_days` int(11) NOT NULL DEFAULT '0',
  `late_interest` varchar(11) CHARACTER SET gbk NOT NULL DEFAULT '0',
  `interest` varchar(50) CHARACTER SET gbk DEFAULT '0',
  `capital` varchar(50) CHARACTER SET gbk DEFAULT '0',
  `forfeit` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '���ɽ�',
  `reminder_fee` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '���շ�',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_idb` (`borrow_id`),
  KEY `user_idubs` (`borrow_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_tender`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_tender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `borrow_id` int(11) DEFAULT '0',
  `money` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `account` varchar(10) CHARACTER SET gbk DEFAULT '0',
  `repayment_account` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '�ܶ�',
  `interest` varchar(11) CHARACTER SET gbk NOT NULL DEFAULT '0',
  `repayment_yesaccount` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '�ѻ��ܶ�',
  `wait_account` varchar(11) CHARACTER SET gbk DEFAULT '0' COMMENT '�����ܶ�',
  `wait_interest` varchar(11) CHARACTER SET gbk DEFAULT '0' COMMENT '������Ϣ',
  `repayment_yesinterest` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '�ѻ���Ϣ',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_idb` (`borrow_id`),
  KEY `user_idub` (`user_id`,`borrow_id`),
  KEY `user_idubs` (`user_id`,`borrow_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='�б�' AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_union`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_union` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `order` int(11) DEFAULT '0' COMMENT '����',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����ͼ',
  `range` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��Ӫ��Χ',
  `content` text CHARACTER SET gbk COMMENT '��˾���',
  `verify_remark` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `verify_time` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_vouch`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_vouch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `borrow_id` int(11) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `account` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `vouch_account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `content` text CHARACTER SET gbk NOT NULL,
  `award_fund` varchar(10) CHARACTER SET gbk NOT NULL DEFAULT '',
  `award_account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `addtime` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `addip` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_vouch_collection`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_vouch_collection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `borrow_id` int(11) NOT NULL DEFAULT '0',
  `order` int(2) DEFAULT NULL,
  `vouch_id` int(11) DEFAULT '0' COMMENT '���id',
  `repay_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ƻ���ʱ��',
  `repay_yestime` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ѿ�����ʱ��',
  `repay_account` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'Ԥ�����',
  `repay_yesaccount` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'ʵ�����',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_borrow_vouch_repayment`
--

CREATE TABLE IF NOT EXISTS `zx_borrow_vouch_repayment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `borrow_id` int(11) NOT NULL DEFAULT '0',
  `order` int(2) DEFAULT NULL,
  `repay_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ƻ���ʱ��',
  `repay_yestime` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ѿ�����ʱ��',
  `repay_account` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'Ԥ�����',
  `repay_yesaccount` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT 'ʵ�����',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_cache`
--

CREATE TABLE IF NOT EXISTS `zx_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `user_num` int(11) DEFAULT NULL,
  `user_online_num` int(11) DEFAULT '0',
  `user_online_time` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `last_user` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `bbs_first_visit` int(20) DEFAULT '0',
  `bbs_topics_num` int(11) DEFAULT NULL,
  `bbs_posts_num` int(11) DEFAULT NULL,
  `bbs_today_topics` int(11) DEFAULT NULL,
  `bbs_today_posts` int(11) DEFAULT NULL,
  `bbs_yesterday_topics` int(11) DEFAULT NULL,
  `bbs_yesterday_posts` int(11) DEFAULT NULL,
  `bbs_most_topics` int(11) DEFAULT NULL,
  `bbs_most_posts` int(11) DEFAULT NULL,
  `borrow_account` varchar(11) CHARACTER SET gbk DEFAULT '0',
  `borrow_success` varchar(20) CHARACTER SET gbk DEFAULT '0',
  `borrow_num` int(10) DEFAULT '0',
  `borrow_successnum` varchar(11) CHARACTER SET gbk DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_cms_article`
--

CREATE TABLE IF NOT EXISTS `zx_cms_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0',
  `title` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `littitle` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `is_jump` int(1) DEFAULT NULL,
  `author` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `jumpurl` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `order` int(11) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `comment` int(11) DEFAULT '0',
  `is_comment` int(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_cms_article_fields`
--

CREATE TABLE IF NOT EXISTS `zx_cms_article_fields` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_comment`
--

CREATE TABLE IF NOT EXISTS `zx_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `module_code` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `comment` text CHARACTER SET gbk,
  `flag` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `order` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT NULL COMMENT '״̬',
  `addtime` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_company`
--

CREATE TABLE IF NOT EXISTS `zx_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL COMMENT '��˾����',
  `site_id` int(11) NOT NULL COMMENT '��ĿID',
  `flag` varchar(30) CHARACTER SET latin1 NOT NULL COMMENT '��������',
  `status` int(2) DEFAULT NULL COMMENT '״̬',
  `order` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '����',
  `litpic` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `type` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '��������',
  `percentage` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '���ڰٷֱ�',
  `capital` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '�ʱ�',
  `ascendent` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '��Ҫ��������',
  `quality` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '��������',
  `sales` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'ȫ������',
  `staff` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'Ա��',
  `foundyear` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '�������',
  `payment` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '���ʽ',
  `markets_main` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '��Ҫ�����г�',
  `markets_other` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '���������г�',
  `replace_work` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '�����г�',
  `rdman` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '�з���Ա����',
  `engineer` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '����ʦ����',
  `summary` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '���',
  `content` text CHARACTER SET latin1 COMMENT '����',
  `province` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `area` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '��',
  `address` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ַ',
  `postcode` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '�ʱ�',
  `linkman` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ϵ��',
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'email',
  `tel` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT '�绰',
  `fax` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `msn` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'msn',
  `qq` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'QQ',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `addtime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  `updatetime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ʱ��',
  `updateip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_company_fields`
--

CREATE TABLE IF NOT EXISTS `zx_company_fields` (
  `aid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zx_credit`
--

CREATE TABLE IF NOT EXISTS `zx_credit` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '��ԱID',
  `value` int(11) DEFAULT '0' COMMENT '������ֵ',
  `op_user` int(11) DEFAULT NULL COMMENT '������',
  `addtime` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `updateip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='��Ա����';

-- --------------------------------------------------------

--
-- 表的结构 `zx_credit_log`
--

CREATE TABLE IF NOT EXISTS `zx_credit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '��ԱID',
  `type_id` int(11) DEFAULT '0' COMMENT '��������ID',
  `op` tinyint(1) DEFAULT '1' COMMENT '1.增加 2.减少',
  `value` int(11) DEFAULT '0' COMMENT '�䶯������ֵ',
  `remark` text CHARACTER SET gbk COMMENT '��ע',
  `op_user` int(11) DEFAULT NULL COMMENT '������',
  `addtime` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='��Ա������־' AUTO_INCREMENT=408 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_credit_rank`
--

CREATE TABLE IF NOT EXISTS `zx_credit_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `rank` int(11) DEFAULT '0' COMMENT '等级',
  `point1` int(11) DEFAULT '0' COMMENT '开始分值',
  `point2` int(11) DEFAULT '0' COMMENT '最后分值',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `remark` text COMMENT '备注',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `addip` varchar(30) DEFAULT NULL COMMENT '添加IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员积分等级' AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_credit_type`
--

CREATE TABLE IF NOT EXISTS `zx_credit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '积分名称',
  `nid` varchar(50) DEFAULT NULL COMMENT '积分代码',
  `value` int(11) DEFAULT '0' COMMENT '积分数值',
  `cycle` tinyint(1) DEFAULT '2' COMMENT '积分周期，1:一次,2:每天,3:间隔分钟,4:不限',
  `award_times` tinyint(4) DEFAULT NULL COMMENT '奖励次数,0:不限',
  `interval` int(11) DEFAULT '1' COMMENT '时间间隔，单位分钟',
  `remark` text COMMENT '备注',
  `op_user` int(11) DEFAULT NULL COMMENT '操作者',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `addip` varchar(30) DEFAULT NULL COMMENT '添加IP',
  `updatetime` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `updateip` varchar(30) DEFAULT NULL COMMENT '最后更新ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ct_nid` (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='积分类型' AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_discount`
--

CREATE TABLE IF NOT EXISTS `zx_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '�̼�',
  `litpic` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '�ϴ�ͼƬ',
  `type` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '����:�磬���У���ʳ������...',
  `business_district` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '��Ȧ',
  `company_id` int(11) DEFAULT NULL COMMENT '�̼�',
  `name` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `province` int(11) DEFAULT NULL COMMENT 'ʡ��',
  `city` int(11) DEFAULT NULL COMMENT '����',
  `area` int(11) DEFAULT NULL COMMENT '��',
  `address` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ַ',
  `tag` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ǩ',
  `start_date` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ʼʱ��',
  `end_date` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `comment` text CHARACTER SET latin1 COMMENT '����',
  `hit` int(11) DEFAULT '0' COMMENT '�������',
  `top` int(11) DEFAULT '0' COMMENT '������',
  `remark` text CHARACTER SET latin1 COMMENT '��ע',
  `post_user` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '������',
  `flag` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '��������',
  `order` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT NULL COMMENT '״̬',
  `addtime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  `updatetime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `updateip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_discount_company`
--

CREATE TABLE IF NOT EXISTS `zx_discount_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL COMMENT '�̼�����',
  `flag` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '��������',
  `status` int(2) DEFAULT NULL COMMENT '״̬',
  `order` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `litpic` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '�ϴ�ͼƬ',
  `goods` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '���Ʒ',
  `type` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '�Ż�����',
  `linkman` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ϵ��',
  `tel` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ϵ�绰',
  `content` text CHARACTER SET latin1 NOT NULL COMMENT '��˾���',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `addtime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_editor`
--

CREATE TABLE IF NOT EXISTS `zx_editor` (
  `editor_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `version` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `author` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `date` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `api` text CHARACTER SET gbk,
  PRIMARY KEY (`editor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_fee`
--

CREATE TABLE IF NOT EXISTS `zx_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `nid` int(11) DEFAULT NULL COMMENT '��ĿID',
  `value` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT 'ֵ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_fields`
--

CREATE TABLE IF NOT EXISTS `zx_fields` (
  `fields_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `type` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `size` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `input` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `default` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `select` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`fields_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_flag`
--

CREATE TABLE IF NOT EXISTS `zx_flag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_friends`
--

CREATE TABLE IF NOT EXISTS `zx_friends` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�',
  `friends_userid` int(11) DEFAULT '0' COMMENT '����',
  `friends_username` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `type` int(2) DEFAULT '0' COMMENT '����',
  `content` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='����' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_friends_request`
--

CREATE TABLE IF NOT EXISTS `zx_friends_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�',
  `friends_userid` int(11) DEFAULT '0' COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `type` int(2) DEFAULT '0',
  `content` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='���Ѽ�¼' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_help`
--

CREATE TABLE IF NOT EXISTS `zx_help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT '0',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `smallname` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `flag` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `publish` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `is_jump` int(1) DEFAULT NULL,
  `author` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `province` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `area` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `jumpurl` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `order` int(11) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `comment` int(11) DEFAULT '0',
  `is_comment` int(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_help_type`
--

CREATE TABLE IF NOT EXISTS `zx_help_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `pid` int(2) DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `list_name` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `content_name` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `index_tpl` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `list_tpl` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `content_tpl` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `title` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `keywords` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `description` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_home`
--

CREATE TABLE IF NOT EXISTS `zx_home` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `order` int(11) DEFAULT '0' COMMENT '����',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����ͼ',
  `flag` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��Դ',
  `publish` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `xiaoqu` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'С��',
  `shi` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `ting` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `wei` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `louceng` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '¥��',
  `zonglouceng` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��¥��',
  `loupan` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '¥��',
  `zhucegongsi` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ƿ�ע�ṫ˾',
  `mianji` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���',
  `mianji1` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�������1',
  `mianji2` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�������2',
  `fangshi` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���ⷽʽ',
  `leixing` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `zhuangxiu` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT 'װ��',
  `chaoxiang` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `zujin` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���',
  `jiage` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�ۼ�',
  `jiage1` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ۼ�1',
  `jiage2` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ۼ�2',
  `jiageleixing` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�۸�����',
  `lishijingying` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��ʷ��Ӫ',
  `jibenqingkuang` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�������',
  `diduan` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�ض�',
  `diduan1` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�ض�1',
  `diduan2` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�ض�2',
  `fukuan` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʽ',
  `linjin` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�ٽ�',
  `peizhi` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `tupian` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT 'ͼƬ',
  `xianxingbie` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '�����Ա�',
  `chuzufangjian` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '���ⷿ��',
  `chuzuleixing` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `content` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����˵��',
  `lianxiren` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ��',
  `dianhua` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰',
  `qq` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'qq',
  `province` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `area` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `updatetime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `updateip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_integral`
--

CREATE TABLE IF NOT EXISTS `zx_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '��Ʒ����',
  `need` double DEFAULT NULL COMMENT '�������',
  `number` int(11) DEFAULT NULL COMMENT '����',
  `ex_number` int(11) DEFAULT '0' COMMENT '�Ѷһ�����',
  `province` int(11) DEFAULT NULL COMMENT '�ɶһ�ʡ��',
  `city` int(11) DEFAULT NULL COMMENT '�ɶһ�����',
  `area` int(11) DEFAULT NULL COMMENT '��',
  `litpic` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT 'ͼƬ',
  `content` text CHARACTER SET gbk COMMENT '��ϸ��Ϣ',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `top` int(11) DEFAULT '0' COMMENT '������',
  `flag` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `order` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT NULL COMMENT '״̬',
  `addtime` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_integral_convert`
--

CREATE TABLE IF NOT EXISTS `zx_integral_convert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integral_id` int(11) DEFAULT NULL COMMENT '�һ���ƷID',
  `user_id` int(11) DEFAULT NULL COMMENT '��ԱID',
  `number` int(11) DEFAULT NULL COMMENT '����',
  `need` int(11) DEFAULT NULL COMMENT '����Ҫ�Ļ���',
  `integral` int(11) DEFAULT NULL COMMENT '�ܻ���',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `remark` varchar(200) CHARACTER SET gbk DEFAULT '' COMMENT '��ע',
  `addtime` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_invest`
--

CREATE TABLE IF NOT EXISTS `zx_invest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '����վ��',
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `order` int(11) DEFAULT '0' COMMENT '����',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����ͼ',
  `flag` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��Դ',
  `publish` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `customer` int(11) DEFAULT NULL COMMENT '�ͷ�',
  `verify_userid` int(11) DEFAULT NULL COMMENT '�����',
  `verify_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʱ��',
  `use` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��;',
  `time_limit` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�������',
  `style` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʽ',
  `account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ܽ��',
  `apr` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '������',
  `lowest_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���Ͷ����',
  `most_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���Ͷ���ܶ�',
  `valid_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��Чʱ��',
  `award` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'Ͷ�꽱��',
  `part_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��̯�������',
  `funds` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���������ı���',
  `is_false` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʧ��ʱҲͬ������ ',
  `open_account` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵ��ʻ��ʽ����',
  `open_borrow` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵĽ���ʽ����',
  `open_tender` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵ�Ͷ���ʽ����',
  `open_credit` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�����ҵ����ö�����',
  `content` text CHARACTER SET gbk COMMENT '��ϸ˵��',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_invite`
--

CREATE TABLE IF NOT EXISTS `zx_invite` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned DEFAULT '0',
  `status` smallint(2) unsigned DEFAULT '0',
  `order` smallint(6) DEFAULT '0',
  `flag` varchar(30) CHARACTER SET gbk DEFAULT '0',
  `type_id` smallint(5) unsigned DEFAULT '0',
  `name` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `province` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `city` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `area` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `num` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `description` text CHARACTER SET gbk,
  `demand` text CHARACTER SET gbk,
  `hits` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  `addip` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `uptime` int(10) DEFAULT '0',
  `upip` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='��Ƹ�б�' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_invite_type`
--

CREATE TABLE IF NOT EXISTS `zx_invite_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='��Ƹ����' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_itemchildren`
--

CREATE TABLE IF NOT EXISTS `zx_itemchildren` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zx_items`
--

CREATE TABLE IF NOT EXISTS `zx_items` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zx_limitapp`
--

CREATE TABLE IF NOT EXISTS `zx_limitapp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `order` int(11) DEFAULT '0' COMMENT '����',
  `account` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'Ҫ���ӵĶ��',
  `recommend_userid` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '�Ƽ���',
  `content` text CHARACTER SET gbk COMMENT '��ϸ˵��',
  `other_content` text CHARACTER SET gbk COMMENT '�����ط���ϸ˵��',
  `verify_userid` int(11) DEFAULT NULL COMMENT '�����',
  `verify_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʱ��',
  `verify_remark` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ע',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_linkage`
--

CREATE TABLE IF NOT EXISTS `zx_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status` smallint(2) unsigned DEFAULT '0' COMMENT '״̬',
  `order` smallint(6) DEFAULT '0' COMMENT '����',
  `type_id` smallint(5) unsigned DEFAULT '0' COMMENT '����',
  `pid` varchar(30) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `addtime` int(10) DEFAULT '0',
  `addip` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `type_ida` (`type_id`,`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=491 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_linkage_type`
--

CREATE TABLE IF NOT EXISTS `zx_linkage_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` smallint(6) DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `addtime` int(10) DEFAULT '0',
  `addip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_links`
--

CREATE TABLE IF NOT EXISTS `zx_links` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) unsigned NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `flag` smallint(6) DEFAULT NULL,
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `url` char(60) CHARACTER SET gbk NOT NULL DEFAULT '',
  `webname` char(30) CHARACTER SET gbk NOT NULL DEFAULT '',
  `summary` char(200) CHARACTER SET gbk NOT NULL DEFAULT '',
  `linkman` char(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `email` char(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `logo` char(100) CHARACTER SET gbk NOT NULL DEFAULT '',
  `logoimg` char(100) CHARACTER SET gbk NOT NULL DEFAULT '',
  `province` char(10) CHARACTER SET gbk NOT NULL DEFAULT '',
  `city` char(10) CHARACTER SET gbk NOT NULL DEFAULT '',
  `area` char(10) CHARACTER SET gbk NOT NULL DEFAULT '',
  `hits` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `addip` char(20) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='���������б�' AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_links_type`
--

CREATE TABLE IF NOT EXISTS `zx_links_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='������������' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_liuyan`
--

CREATE TABLE IF NOT EXISTS `zx_liuyan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `email` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `company` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `tel` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `address` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `type` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `litpic` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `user_id` int(11) DEFAULT '0',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `reply` text CHARACTER SET gbk,
  `reply_id` int(11) DEFAULT '0',
  `replytime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `replyip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_liuyan_set`
--

CREATE TABLE IF NOT EXISTS `zx_liuyan_set` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `value` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_message`
--

CREATE TABLE IF NOT EXISTS `zx_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sent_user` int(11) DEFAULT '0' COMMENT '�����û�',
  `receive_user` int(11) DEFAULT '0' COMMENT '�����û�',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `type` varchar(50) CHARACTER SET gbk DEFAULT '0' COMMENT '����',
  `sented` varchar(2) CHARACTER SET gbk DEFAULT NULL,
  `deltype` int(2) DEFAULT '0',
  `content` text CHARACTER SET gbk COMMENT '����',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='����Ϣ' AUTO_INCREMENT=533 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_module`
--

CREATE TABLE IF NOT EXISTS `zx_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `default_field` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `version` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `author` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `date` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `type` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `fields` int(2) DEFAULT NULL,
  `purview` text CHARACTER SET gbk,
  `remark` text CHARACTER SET gbk,
  `issent` int(2) DEFAULT NULL,
  `title_name` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `onlyone` int(2) DEFAULT NULL,
  `index_tpl` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `list_tpl` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `content_tpl` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `search_tpl` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `article_status` int(2) DEFAULT NULL,
  `visit_type` int(2) DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_online`
--

CREATE TABLE IF NOT EXISTS `zx_online` (
  `user_id` int(10) unsigned DEFAULT '0',
  `username` varchar(45) DEFAULT NULL,
  `type_id` varchar(10) DEFAULT NULL,
  `tid` int(10) unsigned DEFAULT '0',
  `fid` int(10) unsigned DEFAULT '0',
  `atpage` varchar(30) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `activetime` int(10) unsigned DEFAULT '0',
  KEY `userid` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zx_payment`
--

CREATE TABLE IF NOT EXISTS `zx_payment` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `status` smallint(3) unsigned DEFAULT '0',
  `style` int(2) DEFAULT NULL,
  `config` longtext CHARACTER SET gbk,
  `fee_type` int(2) DEFAULT NULL,
  `max_money` int(10) DEFAULT NULL,
  `max_fee` int(10) DEFAULT NULL,
  `description` longtext CHARACTER SET gbk,
  `order` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_payment_type`
--

CREATE TABLE IF NOT EXISTS `zx_payment_type` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `nid` varchar(100) DEFAULT NULL COMMENT 'offline or online',
  `type` varchar(30) DEFAULT NULL COMMENT '1.offline 2.online',
  `description` longtext,
  `order` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_remind`
--

CREATE TABLE IF NOT EXISTS `zx_remind` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `status` smallint(2) unsigned DEFAULT '0' COMMENT '״̬',
  `order` smallint(6) DEFAULT '0' COMMENT '����',
  `type_id` smallint(5) unsigned DEFAULT '0' COMMENT '����',
  `message` smallint(2) unsigned DEFAULT '0' COMMENT '����Ϣ',
  `email` smallint(2) unsigned DEFAULT '0' COMMENT '����',
  `phone` smallint(2) unsigned DEFAULT '0' COMMENT '�ֻ�',
  `addtime` int(10) DEFAULT '0',
  `addip` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_remind_type`
--

CREATE TABLE IF NOT EXISTS `zx_remind_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` smallint(6) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `addtime` int(10) DEFAULT '0',
  `addip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_remind_user`
--

CREATE TABLE IF NOT EXISTS `zx_remind_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(11) unsigned DEFAULT NULL,
  `remind_id` smallint(5) unsigned DEFAULT NULL,
  `message` smallint(2) unsigned DEFAULT '0' COMMENT '����Ϣ',
  `email` smallint(2) unsigned DEFAULT '0' COMMENT '����',
  `phone` smallint(2) unsigned DEFAULT '0' COMMENT '�ֻ�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_scrollpic`
--

CREATE TABLE IF NOT EXISTS `zx_scrollpic` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) unsigned NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `flag` smallint(6) DEFAULT NULL,
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `url` char(60) CHARACTER SET gbk NOT NULL DEFAULT '',
  `name` char(100) CHARACTER SET gbk NOT NULL DEFAULT '',
  `pic` char(200) CHARACTER SET gbk NOT NULL DEFAULT '',
  `summary` char(250) CHARACTER SET gbk NOT NULL DEFAULT '',
  `hits` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `addip` char(20) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_scrollpic_type`
--

CREATE TABLE IF NOT EXISTS `zx_scrollpic_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_site`
--

CREATE TABLE IF NOT EXISTS `zx_site` (
  `site_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `pid` int(2) DEFAULT '0',
  `rank` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `url` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `aurl` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `isurl` varchar(2) CHARACTER SET gbk DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `style` varchar(2) CHARACTER SET gbk DEFAULT NULL,
  `litpic` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `list_name` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `content_name` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `sitedir` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `visit_type` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `index_tpl` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `list_tpl` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `content_tpl` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `title` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `keywords` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `description` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `user_id` varchar(11) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_system`
--

CREATE TABLE IF NOT EXISTS `zx_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `style` int(2) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_upfiles`
--

CREATE TABLE IF NOT EXISTS `zx_upfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `code` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'ģ��',
  `aid` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ģ��id',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `filetype` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ļ�����',
  `filename` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '�ļ�����',
  `filesize` int(10) DEFAULT '0' COMMENT '�ļ���С',
  `fileurl` varchar(200) CHARACTER SET gbk DEFAULT NULL COMMENT '�ļ���ַ',
  `if_cover` int(2) DEFAULT '0' COMMENT '�Ƿ����',
  `order` int(10) DEFAULT '0' COMMENT '����',
  `hits` int(11) DEFAULT '0' COMMENT '�������',
  `addtime` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����ip',
  `updatetime` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '�޸�ʱ��',
  `updateip` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '�޸�ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=540 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user`
--

CREATE TABLE IF NOT EXISTS `zx_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `purview` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `paypassword` varchar(50) DEFAULT NULL,
  `islock` int(2) NOT NULL DEFAULT '0',
  `invite_userid` int(11) DEFAULT NULL,
  `invite_money` varchar(10) DEFAULT '0',
  `real_status` int(2) DEFAULT NULL,
  `card_type` varchar(10) DEFAULT NULL,
  `card_id` varchar(50) DEFAULT NULL,
  `card_pic1` varchar(150) DEFAULT NULL,
  `card_pic2` varchar(150) DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `integral` varchar(10) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `avatar_status` int(2) DEFAULT '0',
  `email_status` int(2) DEFAULT NULL,
  `phone_status` int(2) DEFAULT '0',
  `video_status` int(2) DEFAULT '0',
  `scene_status` int(2) DEFAULT '0',
  `email` varchar(30) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `litpic` varchar(250) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `wangwang` varchar(100) DEFAULT NULL,
  `question` varchar(10) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `birthday` varchar(11) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `remind` text,
  `privacy` text,
  `logintime` int(11) DEFAULT '0',
  `addtime` varchar(50) DEFAULT NULL,
  `addip` varchar(50) DEFAULT NULL,
  `uptime` varchar(50) DEFAULT NULL,
  `upip` varchar(50) DEFAULT NULL,
  `lasttime` varchar(50) DEFAULT NULL,
  `lastip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  FULLTEXT KEY `purview` (`purview`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_userinfo`
--

CREATE TABLE IF NOT EXISTS `zx_userinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '所属站点',
  `user_id` int(11) DEFAULT '0' COMMENT '用户名称',
  `name` varchar(255) DEFAULT NULL COMMENT '标题',
  `status` int(2) DEFAULT '0' COMMENT '状态',
  `order` int(11) DEFAULT '0' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '点击次数',
  `litpic` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `flag` varchar(50) DEFAULT NULL COMMENT '属性',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `publish` varchar(50) DEFAULT NULL COMMENT '发布时间',
  `marry` varchar(50) DEFAULT NULL COMMENT '婚姻',
  `child` varchar(10) DEFAULT NULL COMMENT '子女',
  `education` varchar(10) DEFAULT NULL COMMENT '学历',
  `income` varchar(10) DEFAULT NULL COMMENT '收入',
  `shebao` varchar(10) DEFAULT NULL COMMENT '社保',
  `shebaoid` varchar(50) DEFAULT NULL COMMENT '社保号',
  `housing` varchar(10) DEFAULT NULL COMMENT '住房条件',
  `car` varchar(10) DEFAULT NULL COMMENT '车',
  `late` varchar(10) DEFAULT NULL COMMENT '逾期',
  `house_address` varchar(10) DEFAULT NULL COMMENT '房产地址',
  `house_area` varchar(10) DEFAULT NULL COMMENT '房产面积',
  `house_year` varchar(10) DEFAULT NULL COMMENT '建筑年份',
  `house_status` varchar(10) DEFAULT NULL COMMENT '供款',
  `house_holder1` varchar(10) DEFAULT NULL COMMENT '房子所有权1',
  `house_holder2` varchar(10) DEFAULT NULL COMMENT '房子所有权1',
  `house_right1` varchar(10) DEFAULT NULL COMMENT '房子份额1',
  `house_right2` varchar(10) DEFAULT NULL COMMENT '房子份额2',
  `house_loanyear` varchar(10) DEFAULT NULL COMMENT '贷款年限',
  `house_loanprice` varchar(10) DEFAULT NULL COMMENT '每月供款',
  `house_balance` varchar(10) DEFAULT NULL COMMENT '贷款余额',
  `house_bank` varchar(10) DEFAULT NULL COMMENT '银行',
  `company_name` varchar(10) DEFAULT NULL COMMENT '公司名称',
  `company_type` varchar(10) DEFAULT NULL COMMENT '公司性质',
  `company_industry` varchar(10) DEFAULT NULL COMMENT '公司行业',
  `company_office` varchar(10) DEFAULT NULL COMMENT '工作职位',
  `company_jibie` varchar(10) DEFAULT NULL COMMENT '工作级别',
  `company_worktime1` varchar(10) DEFAULT NULL COMMENT '工作时间1',
  `company_worktime2` varchar(10) DEFAULT NULL COMMENT '工作时间2',
  `company_workyear` varchar(10) DEFAULT NULL COMMENT '工作年限',
  `company_tel` varchar(50) DEFAULT NULL COMMENT '公司电话',
  `company_address` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `company_weburl` varchar(100) DEFAULT NULL COMMENT '公司网站',
  `company_reamrk` varchar(250) DEFAULT NULL COMMENT '公司备注',
  `private_type` varchar(10) DEFAULT NULL COMMENT '类别',
  `private_date` varchar(10) DEFAULT NULL COMMENT '日期',
  `private_place` varchar(10) DEFAULT NULL COMMENT '场所',
  `private_rent` varchar(10) DEFAULT NULL COMMENT '租金',
  `private_term` varchar(10) DEFAULT NULL COMMENT '租期',
  `private_taxid` varchar(30) DEFAULT NULL COMMENT '工商税务',
  `private_commerceid` varchar(50) DEFAULT NULL COMMENT '工商登记号',
  `private_income` varchar(100) DEFAULT NULL COMMENT '收入',
  `private_employee` varchar(100) DEFAULT NULL COMMENT '雇员',
  `finance_repayment` varchar(100) DEFAULT NULL COMMENT '每月无抵押贷款还款额',
  `finance_property` varchar(100) DEFAULT NULL COMMENT '自有房产',
  `finance_amount` varchar(100) DEFAULT NULL COMMENT '每月房屋按揭金额',
  `finance_car` varchar(10) DEFAULT NULL COMMENT '自有汽车',
  `finance_caramount` varchar(100) DEFAULT NULL COMMENT '每月汽车按揭金额',
  `finance_creditcard` varchar(100) DEFAULT NULL COMMENT '信用卡金额',
  `mate_name` varchar(100) DEFAULT NULL COMMENT '配偶名字',
  `mate_salary` varchar(10) DEFAULT NULL COMMENT '薪资',
  `mate_phone` varchar(100) DEFAULT NULL COMMENT '手机',
  `mate_tel` varchar(100) DEFAULT NULL COMMENT '电话',
  `mate_type` varchar(10) DEFAULT NULL COMMENT '工作类型',
  `mate_office` varchar(10) DEFAULT NULL COMMENT '工作职位',
  `mate_address` varchar(250) DEFAULT NULL COMMENT '地址',
  `mate_income` varchar(100) DEFAULT NULL COMMENT '收入',
  `education_record` varchar(100) DEFAULT NULL COMMENT '学历',
  `education_school` varchar(200) DEFAULT NULL COMMENT '学校',
  `education_study` varchar(200) DEFAULT NULL COMMENT '专业',
  `education_time1` varchar(20) DEFAULT NULL COMMENT '时间1',
  `education_time2` varchar(20) DEFAULT NULL COMMENT '时间2',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机',
  `post` varchar(50) DEFAULT NULL COMMENT '邮编',
  `address` varchar(50) DEFAULT NULL COMMENT '邮编',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `linkman1` varchar(50) DEFAULT NULL COMMENT '联系人1',
  `relation1` varchar(50) DEFAULT NULL COMMENT '关系1',
  `tel1` varchar(50) DEFAULT NULL COMMENT '电话1',
  `phone1` varchar(50) DEFAULT NULL COMMENT '手机1',
  `linkman2` varchar(50) DEFAULT NULL COMMENT '联系人2',
  `relation2` varchar(50) DEFAULT NULL COMMENT '关系2',
  `tel2` varchar(50) DEFAULT NULL COMMENT '电话2',
  `phone2` varchar(50) DEFAULT NULL COMMENT '手机2',
  `linkman3` varchar(50) DEFAULT NULL COMMENT '联系人3',
  `relation3` varchar(50) DEFAULT NULL COMMENT '关系3',
  `tel3` varchar(50) DEFAULT NULL COMMENT '电话3',
  `phone3` varchar(50) DEFAULT NULL COMMENT '手机3',
  `msn` varchar(50) DEFAULT NULL COMMENT 'MSN',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `wangwang` varchar(50) DEFAULT NULL COMMENT 'WANGWANG',
  `ability` varchar(250) DEFAULT NULL COMMENT '个人能力',
  `interest` varchar(250) DEFAULT NULL COMMENT '个人爱好',
  `others` varchar(250) DEFAULT NULL COMMENT '其他说明',
  `experience` text COMMENT '工作经历',
  `addtime` varchar(50) DEFAULT NULL,
  `addip` varchar(50) DEFAULT NULL,
  `updatetime` varchar(50) DEFAULT NULL,
  `updateip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_amount`
--

CREATE TABLE IF NOT EXISTS `zx_user_amount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '�����ָ����',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `credit` decimal(11,2) NOT NULL DEFAULT '0.00',
  `credit_use` decimal(11,2) NOT NULL DEFAULT '0.00',
  `credit_nouse` decimal(11,2) NOT NULL DEFAULT '0.00',
  `borrow_vouch` decimal(11,2) NOT NULL DEFAULT '0.00',
  `borrow_vouch_use` decimal(11,2) NOT NULL DEFAULT '0.00',
  `borrow_vouch_nouse` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tender_vouch` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tender_vouch_use` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tender_vouch_nouse` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_amountapply`
--

CREATE TABLE IF NOT EXISTS `zx_user_amountapply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_new` decimal(11,2) DEFAULT '0.00',
  `account_old` decimal(11,2) NOT NULL DEFAULT '0.00',
  `status` int(11) DEFAULT '0',
  `addtime` varchar(30) CHARACTER SET gbk NOT NULL DEFAULT '',
  `content` text CHARACTER SET gbk NOT NULL,
  `remark` text CHARACTER SET gbk NOT NULL,
  `verify_remark` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `verify_time` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `verify_user` int(11) DEFAULT NULL,
  `addip` varchar(30) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_amountlog`
--

CREATE TABLE IF NOT EXISTS `zx_user_amountlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `amount_type` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_all` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_use` decimal(11,2) NOT NULL DEFAULT '0.00',
  `account_nouse` decimal(11,2) NOT NULL DEFAULT '0.00',
  `remark` text CHARACTER SET gbk NOT NULL,
  `addtime` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `addip` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_backup`
--

CREATE TABLE IF NOT EXISTS `zx_user_backup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�����',
  `user_tel` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `user_email` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `user_phone` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `user_qq` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `user_address` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `user_nation` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `user_realname` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `source` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��Դ',
  `publish` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��',
  `marry` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `child` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��Ů',
  `education` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT 'ѧ��',
  `income` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `shebao` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�籣',
  `shebaoid` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�籣��',
  `housing` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT 'ס������',
  `car` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `late` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `house_address` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '������ַ',
  `house_area` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�������',
  `house_year` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�������',
  `house_status` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `house_holder1` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������Ȩ1',
  `house_holder2` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������Ȩ1',
  `house_right1` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���ӷݶ�1',
  `house_right2` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���ӷݶ�2',
  `house_loanyear` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `house_loanprice` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT 'ÿ�¹���',
  `house_balance` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '�������',
  `house_bank` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `company_name` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾����',
  `company_type` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾����',
  `company_industry` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾��ҵ',
  `company_office` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����ְλ',
  `company_jibie` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `company_worktime1` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��1',
  `company_worktime2` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����ʱ��2',
  `company_workyear` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `company_tel` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾�绰',
  `company_address` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾��ַ',
  `company_weburl` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾��վ',
  `company_reamrk` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '��˾��ע',
  `private_type` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���',
  `private_date` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `private_place` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `private_rent` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '���',
  `private_term` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `private_taxid` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '����˰��',
  `private_commerceid` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���̵ǼǺ�',
  `private_income` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `private_employee` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '��Ա',
  `finance_repayment` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT 'ÿ���޵�Ѻ������',
  `finance_property` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '���з���',
  `finance_amount` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT 'ÿ�·��ݰ��ҽ��',
  `finance_car` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `finance_caramount` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT 'ÿ���������ҽ��',
  `finance_creditcard` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '���ÿ����',
  `mate_name` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '��ż����',
  `mate_salary` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT 'н��',
  `mate_phone` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '�ֻ�',
  `mate_tel` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰',
  `mate_type` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `mate_office` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '����ְλ',
  `mate_address` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '��ַ',
  `mate_income` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `education_record` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT 'ѧ��',
  `education_school` varchar(200) CHARACTER SET gbk DEFAULT NULL COMMENT 'ѧУ',
  `education_study` varchar(200) CHARACTER SET gbk DEFAULT NULL COMMENT 'רҵ',
  `education_time1` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT 'ʱ��1',
  `education_time2` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT 'ʱ��2',
  `tel` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰',
  `phone` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ֻ�',
  `post` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ʱ�',
  `address` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ʱ�',
  `province` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `area` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '��',
  `linkman1` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ��1',
  `relation1` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ1',
  `tel1` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰1',
  `phone1` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ֻ�1',
  `linkman2` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ��2',
  `relation2` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ2',
  `tel2` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰2',
  `phone2` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ֻ�2',
  `linkman3` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ��3',
  `relation3` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ3',
  `tel3` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�绰3',
  `phone3` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '�ֻ�3',
  `msn` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'MSN',
  `qq` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'QQ',
  `wangwang` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT 'WANGWANG',
  `ability` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `interest` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '���˰���',
  `others` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '����˵��',
  `experience` text CHARACTER SET gbk COMMENT '��������',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `updatetime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `updateip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_3` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=340 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_cache`
--

CREATE TABLE IF NOT EXISTS `zx_user_cache` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `kefu_userid` int(11) DEFAULT NULL,
  `kefu_username` varchar(250) DEFAULT NULL,
  `kefu_addtime` int(11) DEFAULT NULL,
  `vip_status` int(2) DEFAULT '0',
  `vip_remark` varchar(250) DEFAULT NULL,
  `vip_money` varchar(100) DEFAULT NULL,
  `vip_verify_remark` varchar(100) DEFAULT NULL,
  `vip_verify_time` varchar(100) DEFAULT NULL,
  `bbs_topics_num` int(11) DEFAULT '0',
  `bbs_posts_num` int(11) DEFAULT '0',
  `credit` int(11) DEFAULT '0' COMMENT '积分',
  `account` int(11) DEFAULT '0' COMMENT '帐户总额',
  `account_use` int(11) DEFAULT '0' COMMENT '可用金额',
  `account_nouse` int(11) DEFAULT '0' COMMENT '冻结金额',
  `account_waitin` int(11) DEFAULT '0' COMMENT '代收总额',
  `account_waitintrest` int(11) DEFAULT '0' COMMENT '代收利息',
  `account_intrest` int(11) DEFAULT '0' COMMENT '净赚利息',
  `account_award` int(11) DEFAULT '0' COMMENT '投标奖励',
  `account_payment` int(11) DEFAULT '0' COMMENT '待还总额',
  `account_expired` int(11) DEFAULT '0' COMMENT '逾期总额',
  `account_waitvip` int(11) DEFAULT '0' COMMENT 'vip会费',
  `borrow_amount` int(11) DEFAULT '3000' COMMENT '借款额度',
  `vouch_amount` int(11) NOT NULL DEFAULT '0' COMMENT '担保额度',
  `borrow_loan` int(11) DEFAULT '0' COMMENT '成功借出',
  `borrow_success` int(11) DEFAULT '0' COMMENT '成功借款',
  `borrow_wait` int(11) DEFAULT '0' COMMENT '等待满标',
  `borrow_paymeng` int(11) DEFAULT '0' COMMENT '待还借款',
  `friends_apply` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_log`
--

CREATE TABLE IF NOT EXISTS `zx_user_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `query` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `url` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `result` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=495 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_sendemail_log`
--

CREATE TABLE IF NOT EXISTS `zx_user_sendemail_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT NULL,
  `title` varchar(250) CHARACTER SET gbk DEFAULT NULL,
  `type` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `email` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `msg` text CHARACTER SET gbk,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_trend`
--

CREATE TABLE IF NOT EXISTS `zx_user_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `addtime` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='�û�������¼' AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_type`
--

CREATE TABLE IF NOT EXISTS `zx_user_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `purview` text CHARACTER SET gbk,
  `order` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `summary` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_typechange`
--

CREATE TABLE IF NOT EXISTS `zx_user_typechange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0',
  `old_type` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `new_type` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `addtime` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `addip` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_user_visit`
--

CREATE TABLE IF NOT EXISTS `zx_user_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `visit_userid` int(11) DEFAULT NULL,
  `addip` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `addtime` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_vip_card`
--

CREATE TABLE IF NOT EXISTS `zx_vip_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) CHARACTER SET latin1 NOT NULL COMMENT '��������',
  `order` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `city` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `serial_number` varchar(15) CHARACTER SET latin1 NOT NULL COMMENT 'VIP����',
  `batch` int(11) NOT NULL COMMENT '��������',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '����',
  `create_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `start_date` int(11) DEFAULT NULL COMMENT '��Ч�ڿ�ʼ����',
  `end_date` int(11) DEFAULT NULL COMMENT '��Ч�ڽ�������',
  `is_up_end_date` tinyint(1) DEFAULT '0' COMMENT '�Ƿ�����',
  `vct_name` varchar(40) CHARACTER SET latin1 DEFAULT NULL COMMENT '��ֵ������',
  `month_num` tinyint(4) DEFAULT NULL COMMENT '��Ч����',
  `open_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '״̬:0:δ���1������2���ᣬ3ͣ��, 4���',
  `freeze_time` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `freeze_day` int(11) DEFAULT NULL COMMENT '��������',
  `freeze_times` tinyint(4) DEFAULT '0' COMMENT '�������',
  `stop_time` int(11) DEFAULT NULL COMMENT 'ͣ��ʱ��',
  `stop_day` int(11) DEFAULT NULL COMMENT 'ͣ������',
  `stop_times` tinyint(4) DEFAULT '0' COMMENT 'ͣ������',
  `create_user` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '������',
  `remark` text CHARACTER SET latin1 COMMENT '��ע',
  `hits` int(11) DEFAULT NULL COMMENT '�������',
  `addtime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  `updatetime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ʱ��',
  `updateip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vip_sn` (`serial_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='VIP��' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_vip_card_type`
--

CREATE TABLE IF NOT EXISTS `zx_vip_card_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(40) CHARACTER SET latin1 DEFAULT NULL COMMENT '��������',
  `month_num` tinyint(4) DEFAULT NULL COMMENT '����',
  `addtime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  `updatetime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ʱ��',
  `updateip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `month_num_UNIQUE` (`month_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_vip_user`
--

CREATE TABLE IF NOT EXISTS `zx_vip_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `card_number` varchar(15) CHARACTER SET latin1 NOT NULL COMMENT 'VIP����',
  `flag` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '��������',
  `order` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '����',
  `hits` int(11) DEFAULT NULL COMMENT '�������',
  `addtime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ʱ��',
  `addip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '����ip',
  `updatetime` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ʱ��',
  `updateip` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '�޸�ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vipu_u` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='VIP���û�' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_yginfo`
--

CREATE TABLE IF NOT EXISTS `zx_yginfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '�û�ID',
  `status` int(2) DEFAULT '0' COMMENT '״̬',
  `height` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `minzu` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `jiguan` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����',
  `zhengzhi` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '������ò',
  `techang` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '�س�',
  `marray` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '���',
  `zhuanye` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'רҵ',
  `xueli` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'ѧ��',
  `idcard` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '����֤����',
  `zhiye` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'ְҵ',
  `school` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT 'ѧУ',
  `danwei` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��λ',
  `dizhi` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��ַ',
  `linkman` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ��',
  `linktel` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��ϵ�绰',
  `fuwu` text CHARACTER SET gbk,
  `jianli` text CHARACTER SET gbk,
  `liyou` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '��������',
  `verify_userid` int(11) DEFAULT NULL COMMENT '�����',
  `verify_time` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '���ʱ��',
  `verify_remark` varchar(250) CHARACTER SET gbk DEFAULT NULL COMMENT '��˱�ע',
  `addtime` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `addip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�幤��Ϣ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zx_zixun_fields`
--

CREATE TABLE IF NOT EXISTS `zx_zixun_fields` (
  `aid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 限制导出的表
--

--
-- 限制表 `zx_assignments`
--
ALTER TABLE `zx_assignments`
  ADD CONSTRAINT `zx_assignments_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `zx_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `zx_itemchildren`
--
ALTER TABLE `zx_itemchildren`
  ADD CONSTRAINT `zx_itemchildren_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `zx_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zx_itemchildren_ibfk_2` FOREIGN KEY (`child`) REFERENCES `zx_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
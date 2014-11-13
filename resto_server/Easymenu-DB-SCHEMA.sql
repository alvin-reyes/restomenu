-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: 31 ago, 2012 at 09:21 AM
-- Versione MySQL: 5.1.36
-- Versione PHP: 5.3.0

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `easymenu-ng`
--
CREATE DATABASE `easymenu-ng` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `easymenu-ng`;

-- --------------------------------------------------------

--
-- Struttura della tabella `bqueue`
--

CREATE TABLE IF NOT EXISTS `bqueue` (
  `idBqueue` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `fk_idOrders` int(11) NOT NULL,
  `fk_sid` varchar(64) NOT NULL,
  `status` enum('received','inprogress','checkedout','done') NOT NULL DEFAULT 'received',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBqueue`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dump dei dati per la tabella `bqueue`
--

INSERT INTO `bqueue` (`idBqueue`, `sid`, `fk_idOrders`, `fk_sid`, `status`, `timestamp`) VALUES
(22, '5c8e5f2c3feaac797d4534758b6660d8', 86, 'd2fc91e2d4ce2d0609e3b578a406471c', 'inprogress', '2012-08-20 13:04:10'),
(23, '5c8e5f2c3feaac797d4534758b6660d8', 87, 'd2fc91e2d4ce2d0609e3b578a406471c', 'inprogress', '2012-08-20 13:04:10');

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `idCategories` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `description` tinytext,
  `idImage` int(11) NOT NULL DEFAULT '0',
  `extras` mediumtext,
  PRIMARY KEY (`idCategories`),
  KEY `fk_idImages` (`idImage`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Main Courses, Appetizers etc' AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`idCategories`, `label`, `description`, `idImage`, `extras`) VALUES
(14, 'Category one', '', 0, NULL),
(12, 'Category two', 'boo', 0, NULL),
(15, 'Menu Prova Cat', '', 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `device` varchar(45) NOT NULL,
  `key` varchar(45) DEFAULT NULL,
  `value` tinytext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `config`
--

INSERT INTO `config` (`device`, `key`, `value`) VALUES
('server', 'mininterval', '60000'),
('server', 'maxitems', '0'),
('server', 'maxrounds', '0'),
('server', 'servuilang', 'english'),
('tablet', 'restmode', 'alacarte'),
('tablet', 'displaymode', 'listview'),
('tablet', 'currency', '€'),
('tablet', 'price', '{"adults":"11.27","children":"6.49"}');

-- --------------------------------------------------------

--
-- Struttura della tabella `em_sessions`
--

CREATE TABLE IF NOT EXISTS `em_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `em_sessions`
--

INSERT INTO `em_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('8408535d5dd8b5391f94e29060ff9f53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1343631462, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('7ace775f6890a5a7846deb78d5322978', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1344499562, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('488a17634abe9c77339f86e226981844', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1343113458, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('1b847e699b4ecff1b287531d79248970', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1343163640, ''),
('cf47afea30eebd3588a0d4bb878488da', '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', 1343236795, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('eb1d6d993049a6362a8a3b9fd997444b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1343285600, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('80f4ede1fceb4921c74887b7f1e2f11e', '192.168.1.83', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1343295476, ''),
('57c87d85ce54791570512b5231a40817', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11', 1343368299, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('0905669a941920d124f1a11cbeb28720', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1344958288, ''),
('eb3be2697727ee10f13953c2261138b7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1344962422, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('3719d740e38c488f8f4d321bb64672ec', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1344958288, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('9642d360c646f913f92430b5d78c4f20', '192.168.2.2', 'Mozilla/5.0 (Linux; U; Android 2.2; it-it; google_sdk Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mob', 1344960268, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('6227f87dca39f858eb2216812da4ee47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1344962422, ''),
('d597a08741c154c042756499e39df061', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1344962422, ''),
('ab971d85ca92914a61b8ad9d5b282f24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1345021056, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('2cd7bb38b9c166c91826a703e4fc561d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1345021056, ''),
('e085f279df206cf7779a6f159be890c6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1', 1345036320, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('354effdc8cfdae26ccec94468b5176e9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1', 1345199677, ''),
('b5c058be47652c39fa8ea0afb03b6b51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1', 1345325675, ''),
('af1f8ad3e1cc2fe990a6894f42b23e1c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1', 1345199677, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('03797feb7fba8e2cb53702af67577948', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1', 1345293304, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('38f29abf297cbb7488c0a5722df9a52e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1', 1345384213, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('a103083338d8b355a9e294c21b293d40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1', 1345490872, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('acbe8b12b2876a64695ac0a9f18242e4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1345883515, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('fbe8e5d1ea0b446c27f7c548676dba07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1345987107, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('f6017d8c5e5e7fb276a0608464fb94fc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346097711, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('0dcafaff3cfddf90dc6174b9ce9be53b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346097711, ''),
('472f8c2aa370b9fd082f0ee4232f382c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346167194, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('c7f2cbe5c71e7fb0353e7d36ab4b4394', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346167858, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('2806f27a7739b008d734571930e75c3f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346272672, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('28546764a8b8ab0b2700d48a02dd890d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346352639, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}'),
('f231c08b04fc0ecd7b11c0081b857cf6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1', 1346403705, 'a:6:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"0";s:4:"role";s:1:"0";s:8:"username";s:5:"admin";s:10:"first_name";s:0:"";s:12:"is_logged_in";b:1;}');

-- --------------------------------------------------------

--
-- Struttura della tabella `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `idImages` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `fileName` varchar(100) NOT NULL,
  PRIMARY KEY (`idImages`),
  UNIQUE KEY `label` (`label`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dump dei dati per la tabella `images`
--

INSERT INTO `images` (`idImages`, `label`, `fileName`) VALUES
(42, 'Coke', 'coca.jpg'),
(41, 'Pesce2', 'img.png'),
(40, 'Pesce1', '54-2-zoom-2-il_ristorante_5.jpg'),
(39, 'wine', 'wine2.png'),
(51, 'food', 'food_(800x600).jpg'),
(52, 'logo', 'logo.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `idItems` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `description` mediumtext,
  `idImage` int(11) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `extras` mediumtext,
  `deleted` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`idItems`),
  KEY `fk_idImages` (`idImage`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT=' food and beverages items' AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`idItems`, `label`, `description`, `idImage`, `price`, `extras`, `deleted`) VALUES
(1, 'Food number 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut diam erat, eu volutpat lectus. In at nisi id est tristique lobortis non ac neque. Quisque diam est, tempus commodo tempor hendrerit, cursus in metus. Maecenas nec justo magna. Quisque at risus a lectus vestibulum sagittis. Aliquam consequat neque ut lectus sodales eget pharetra mauris volutpat. Phasellus ac molestie nunc. Vestibulum non lorem eu mi malesuada consectetur. Aenean elit justo, facilisis vitae molestie vitae, commodo ut nunc. Vestibulum non venenatis ipsum. Pellentesque luctus vestibulum odio eget posuere.\r\n\r\nAenean sit amet neque consectetur dolor gravida pharetra in in est. Proin ultricies sem at nulla cursus vitae bibendum orci cursus. Nullam velit nibh, tincidunt ac mattis at, hendrerit sed diam. Cras eu euismod lacus. Donec adipiscing molestie lobortis. Sed sapien lorem, euismod nec volutpat quis, scelerisque nec lacus. Sed varius leo eget mauris feugiat tempor.', 51, '2.99', NULL, 'n'),
(2, 'Uno', 'Tre', 0, '2.99', NULL, 'y'),
(3, 'due onw', 'ono', 37, '2.99', NULL, 'y'),
(4, 'Food number 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut diam erat, eu volutpat lectus. In at nisi id est tristique lobortis non ac neque. Quisque diam est, tempus commodo tempor hendrerit, cursus in metus. Maecenas nec justo magna. Quisque at risus a lectus vestibulum sagittis. Aliquam consequat neque ut lectus sodales eget pharetra mauris volutpat. Phasellus ac molestie nunc. Vestibulum non lorem eu mi malesuada consectetur. Aenean elit justo, facilisis vitae molestie vitae, commodo ut nunc. Vestibulum non venenatis ipsum. Pellentesque luctus vestibulum odio eget posuere.\r\n\r\nAenean sit amet neque consectetur dolor gravida pharetra in in est. Proin ultricies sem at nulla cursus vitae bibendum orci cursus. Nullam velit nibh, tincidunt ac mattis at, hendrerit sed diam. Cras eu euismod lacus. Donec adipiscing molestie lobortis. Sed sapien lorem, euismod nec volutpat quis, scelerisque nec lacus. Sed varius leo eget mauris feugiat tempor.', 51, '2.99', NULL, 'n'),
(5, 'Food number 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut diam erat, eu volutpat lectus. In at nisi id est tristique lobortis non ac neque. Quisque diam est, tempus commodo tempor hendrerit, cursus in metus. Maecenas nec justo magna. Quisque at risus a lectus vestibulum sagittis. Aliquam consequat neque ut lectus sodales eget pharetra mauris volutpat. Phasellus ac molestie nunc. Vestibulum non lorem eu mi malesuada consectetur. Aenean elit justo, facilisis vitae molestie vitae, commodo ut nunc. Vestibulum non venenatis ipsum. Pellentesque luctus vestibulum odio eget posuere.\r\n\r\nAenean sit amet neque consectetur dolor gravida pharetra in in est. Proin ultricies sem at nulla cursus vitae bibendum orci cursus. Nullam velit nibh, tincidunt ac mattis at, hendrerit sed diam. Cras eu euismod lacus. Donec adipiscing molestie lobortis. Sed sapien lorem, euismod nec volutpat quis, scelerisque nec lacus. Sed varius leo eget mauris feugiat tempor.', 51, '2.99', NULL, 'n'),
(6, 'Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut diam erat, eu volutpat lectus. In at nisi id est tristique lobortis non ac neque. Quisque diam est, tempus commodo tempor hendrerit, cursus in metus. Maecenas nec justo magna. Quisque at risus a lectus vestibulum sagittis. Aliquam consequat neque ut lectus sodales eget pharetra mauris volutpat. Phasellus ac molestie nunc. Vestibulum non lorem eu mi malesuada consectetur. Aenean elit justo, facilisis vitae molestie vitae, commodo ut nunc. Vestibulum non venenatis ipsum. Pellentesque luctus vestibulum odio eget posuere.\r\n\r\nAenean sit amet neque consectetur dolor gravida pharetra in in est. Proin ultricies sem at nulla cursus vitae bibendum orci cursus. Nullam velit nibh, tincidunt ac mattis at, hendrerit sed diam. Cras eu euismod lacus. Donec adipiscing molestie lobortis. Sed sapien lorem, euismod nec volutpat quis, scelerisque nec lacus. Sed varius leo eget mauris feugiat tempor.', 51, '2.99', NULL, 'n'),
(7, 'Coca cola', 'Coca cola', 42, '1.00', NULL, 'n');

-- --------------------------------------------------------

--
-- Struttura della tabella `kqueue`
--

CREATE TABLE IF NOT EXISTS `kqueue` (
  `idKqueue` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `fk_idOrders` int(11) NOT NULL,
  `fk_sid` varchar(64) NOT NULL,
  `status` enum('received','inprogress','checkedout','done') NOT NULL DEFAULT 'received',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idKqueue`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dump dei dati per la tabella `kqueue`
--

INSERT INTO `kqueue` (`idKqueue`, `sid`, `fk_idOrders`, `fk_sid`, `status`, `timestamp`) VALUES
(44, '5c8e5f2c3feaac797d4534758b6660d8', 84, 'd2fc91e2d4ce2d0609e3b578a406471c', 'done', '2012-08-20 13:04:10'),
(45, '5c8e5f2c3feaac797d4534758b6660d8', 85, 'd2fc91e2d4ce2d0609e3b578a406471c', 'done', '2012-08-20 13:04:10');

-- --------------------------------------------------------

--
-- Struttura della tabella `menulists`
--

CREATE TABLE IF NOT EXISTS `menulists` (
  `idMenulists` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idMenus` int(11) DEFAULT NULL,
  `fk_idCategories` int(11) DEFAULT NULL,
  `fk_idItems` int(11) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `categoryPosition` tinyint(4) DEFAULT '0',
  `itemPosition` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idMenulists`),
  KEY `fk_idMenus` (`fk_idMenus`),
  KEY `fk_idCategories` (`fk_idCategories`),
  KEY `fk_idItems` (`fk_idItems`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dump dei dati per la tabella `menulists`
--

INSERT INTO `menulists` (`idMenulists`, `fk_idMenus`, `fk_idCategories`, `fk_idItems`, `price`, `categoryPosition`, `itemPosition`) VALUES
(24, 31, 14, 6, '2.99', 2, 3),
(36, 31, 14, 1, '2.99', 2, 2),
(26, 31, 12, 5, '2.99', 1, 1),
(5, 31, 13, 4, '2.99', 1, 3),
(6, 31, 13, 4, '2.99', 1, 5),
(7, 31, 13, 3, '2.99', 1, 1),
(9, 31, 0, 4, '2.99', 0, 0),
(10, 31, 0, 1, '2.99', 0, 0),
(11, 31, 0, 1, '2.99', 0, 0),
(12, 31, 13, 3, '2.99', 1, 2),
(23, 31, 12, 6, '2.99', 1, 3),
(14, 31, 13, 3, '2.99', 1, 4),
(35, 31, 12, 1, '2.99', 1, 2),
(18, 30, 12, 6, '2.99', 2, 1),
(28, 31, 14, 4, '2.99', 2, 1),
(30, 31, 14, 4, '2.99', 2, 4),
(33, 31, 14, 6, '2.99', 2, 5),
(39, 30, 14, 7, '1.00', 0, 0),
(38, 30, 12, 4, '2.99', 2, 2),
(37, 30, 14, 5, '2.99', 1, 1),
(45, 35, 14, 1, '2.99', 0, 0),
(41, 32, 12, 1, '2.99', 0, 0),
(42, 32, 14, 7, '1.00', 0, 0),
(43, 31, 15, 1, '2.99', 0, 0),
(46, 35, 12, 4, '2.99', 0, 0),
(47, 35, 15, 5, '2.99', 0, 0),
(49, 35, 15, 6, '2.99', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `idMenus` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `description` tinytext,
  `idImage` int(11) NOT NULL DEFAULT '0',
  `extras` mediumtext,
  `price` tinytext,
  `visible` varchar(10) DEFAULT NULL,
  `menuType` enum('f','c') DEFAULT 'c',
  `foodbev` enum('f','b') DEFAULT 'f',
  `position` tinyint(4) DEFAULT NULL,
  `deleted` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`idMenus`),
  UNIQUE KEY `label_UNIQUE` (`label`),
  KEY `fk_idImages` (`idImage`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='A la carte, Vegetarian, early birds etc...' AUTO_INCREMENT=36 ;

--
-- Dump dei dati per la tabella `menus`
--

INSERT INTO `menus` (`idMenus`, `label`, `description`, `idImage`, `extras`, `price`, `visible`, `menuType`, `foodbev`, `position`, `deleted`) VALUES
(27, 'AhAH', '', 0, NULL, NULL, 'y', 'f', 'f', NULL, 'y'),
(26, 'testmenu', '', 0, NULL, NULL, 'y', 'f', 'f', NULL, 'y'),
(17, 'Food menu', 'Test Food menu', 0, NULL, NULL, 'y', 'f', 'f', NULL, 'y'),
(32, 'Menu of the day', '', 0, NULL, NULL, 'y', 'c', 'f', 2, 'y'),
(31, 'Grill menu', '', 0, NULL, NULL, 'y', 'c', 'f', 1, 'n'),
(28, 'ahahah', '', 0, NULL, NULL, 'y', 'f', 'f', NULL, 'y'),
(29, 'Wine List', 'bla', 0, NULL, NULL, 'y', 'c', 'b', 2, 'y'),
(30, 'Drinks', '', 0, NULL, NULL, 'y', 'c', 'b', 1, 'n'),
(33, 'test', '', 0, NULL, NULL, 'y', 'f', 'f', NULL, 'y'),
(34, 'Menu prova', '', 0, NULL, NULL, 'y', 'c', 'f', 3, 'y'),
(35, 'Demo Menu', '', 0, NULL, NULL, 'y', 'c', 'f', 2, 'n');

-- --------------------------------------------------------

--
-- Struttura della tabella `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `idModules` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`idModules`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `modules`
--

INSERT INTO `modules` (`idModules`, `label`) VALUES
(0, 'admin'),
(1, 'menuconf'),
(2, 'orders'),
(3, 'kitchen'),
(4, 'bar');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `idOrders` int(11) NOT NULL AUTO_INCREMENT,
  `fk_sid` varchar(45) NOT NULL,
  `fk_idMenulists` int(11) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `note` mediumtext NOT NULL,
  `ksent` enum('y','n') NOT NULL DEFAULT 'n',
  `status` enum('received','inprogress','done') NOT NULL DEFAULT 'received',
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `fk_idMenulists` (`fk_idMenulists`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`idOrders`, `fk_sid`, `fk_idMenulists`, `number`, `note`, `ksent`, `status`, `timestamp`) VALUES
(33, '75d991cf066f547e95f07556d808f1c2', 39, 2, '', 'y', 'received', '2012-06-05 20:50:23'),
(34, '75d991cf066f547e95f07556d808f1c2', 35, 2, '', 'y', 'received', '2012-06-05 20:51:30'),
(35, '75d991cf066f547e95f07556d808f1c2', 26, 1, '', 'y', 'received', '2012-06-05 21:16:07'),
(12, '27247c410786f8af754b4eb58787f75c', 35, 4, '', 'y', 'received', '2012-04-23 17:09:14'),
(13, '27247c410786f8af754b4eb58787f75c', 36, 2, '', 'y', 'received', '2012-04-23 20:43:27'),
(39, 'b6cd8129a47100d8ba88efaf6d3f5718', 35, 1, '', 'y', 'received', '2012-06-09 08:58:25'),
(38, 'b6cd8129a47100d8ba88efaf6d3f5718', 39, 1, '', 'y', 'received', '2012-06-09 08:57:33'),
(37, '75d991cf066f547e95f07556d808f1c2', 23, 2, '', 'y', 'received', '2012-06-06 23:04:20'),
(36, 'c5d6d8aad6d3d828f3e87cf5f98de5a4', 23, 1, '', 'y', 'received', '2012-06-05 21:17:25'),
(28, '52dd7d495a1bb29d921550867d57fb7c', 39, 2, '', 'y', 'received', '2012-05-17 07:01:01'),
(29, '52dd7d495a1bb29d921550867d57fb7c', 35, 2, '', 'y', 'received', '2012-05-17 07:04:50'),
(30, '52dd7d495a1bb29d921550867d57fb7c', 35, 3, '', 'y', 'received', '2012-06-05 21:19:35'),
(40, 'b6cd8129a47100d8ba88efaf6d3f5718', 37, 2, '', 'y', 'received', '2012-07-27 16:42:56'),
(41, 'b6cd8129a47100d8ba88efaf6d3f5718', 18, 2, '', 'y', 'received', '2012-07-31 17:06:53'),
(42, '3a150d4f9839b51a0da4b18f9933e27a', 18, 2, '', 'y', 'received', '2012-08-11 16:08:02'),
(43, '079ae02de0411a09d585a220772dc206', 26, 2, '', 'y', 'received', '2012-08-14 13:06:15'),
(47, 'a4888526acc0a0ac778cfaa3c4109345', 26, 2, '', 'y', 'received', '2012-08-15 16:34:10'),
(48, '4640b22e0612366d673c21f2ffc47711', 26, 2, '', 'y', 'received', '2012-08-15 16:43:49'),
(49, 'e3007fc2f2b9b3fc942ff1e052b16bf8', 26, 2, '', 'y', 'received', '2012-08-15 16:48:29'),
(50, 'adb9ae1f14ed8986ead92ce55207e589', 26, 1, '', 'y', 'received', '2012-08-15 16:58:20'),
(51, '71067202fd433b6f7e33caa3ce0ae1b6', 26, 1, '', 'y', 'received', '2012-08-15 17:01:29'),
(52, 'e38d72ea41a1cd46121a95997988eea3', 26, 1, '', 'y', 'received', '2012-08-15 17:12:33'),
(53, '1e5bc7d375076268da746ab5fd0688e7', 26, 1, '', 'y', 'received', '2012-08-16 17:07:55'),
(54, '1e5bc7d375076268da746ab5fd0688e7', 39, 1, '', 'y', 'received', '2012-08-16 17:35:20'),
(55, '1e5bc7d375076268da746ab5fd0688e7', 24, 2, '', 'y', 'received', '2012-08-16 17:35:53'),
(57, 'f48590f328fb18c9be474eaee0b357dd', 26, 2, '', 'y', 'received', '2012-08-16 22:03:10'),
(58, 'f48590f328fb18c9be474eaee0b357dd', 39, 2, '', 'y', 'received', '2012-08-16 22:03:20'),
(59, 'f48590f328fb18c9be474eaee0b357dd', 26, 2, '', 'n', 'received', '2012-08-17 13:23:13'),
(60, 'f48590f328fb18c9be474eaee0b357dd', 18, 1, '', 'n', 'received', '2012-08-17 13:36:48'),
(61, 'ff57581573c73f12dc0a503d85bf87d4', 26, 2, '', 'n', 'received', '2012-08-19 09:16:33'),
(62, 'ff57581573c73f12dc0a503d85bf87d4', 43, 3, 'culinoaa', 'n', 'received', '2012-08-19 12:47:53'),
(63, 'ff57581573c73f12dc0a503d85bf87d4', 28, 2, '', 'n', 'received', '2012-08-19 08:06:22'),
(64, 'ff57581573c73f12dc0a503d85bf87d4', 39, 1, 'nullino', 'n', 'received', '2012-08-19 09:07:15'),
(66, 'ff57581573c73f12dc0a503d85bf87d4', 35, 2, '', 'n', 'received', '2012-08-19 13:26:01'),
(65, 'ff57581573c73f12dc0a503d85bf87d4', 23, 2, '', 'n', 'received', '2012-08-19 09:14:38'),
(67, 'ed06eaada713bce497988957f5a337ea', 45, 2, 'well done', 'y', 'received', '2012-08-19 13:33:29'),
(68, 'ed06eaada713bce497988957f5a337ea', 39, 2, '', 'y', 'received', '2012-08-19 13:33:45'),
(69, 'ed06eaada713bce497988957f5a337ea', 43, 2, 'sdsd', 'y', 'received', '2012-08-19 13:52:02'),
(70, 'ed06eaada713bce497988957f5a337ea', 39, 2, '', 'y', 'received', '2012-08-19 13:52:11'),
(71, '85837848bcc081e91a4b028107fa3043', 47, 2, 'well done', 'y', 'received', '2012-08-19 13:54:16'),
(72, '85837848bcc081e91a4b028107fa3043', 39, 2, '', 'y', 'received', '2012-08-19 13:54:28'),
(73, '85837848bcc081e91a4b028107fa3043', 26, 2, '', 'y', 'received', '2012-08-19 13:55:10'),
(74, 'c0d0b37efffc865c99cfaa66ffb87f16', 49, 2, 'well done', 'y', 'received', '2012-08-19 13:58:44'),
(75, 'c0d0b37efffc865c99cfaa66ffb87f16', 39, 2, '', 'y', 'received', '2012-08-19 13:58:55'),
(76, 'c0d0b37efffc865c99cfaa66ffb87f16', 43, 1, '', 'y', 'received', '2012-08-19 13:59:29'),
(77, 'fbbb96fe7fccf832772f97c49a37a3b3', 47, 2, 'well done', 'y', 'received', '2012-08-19 14:05:49'),
(78, '2517d5aafb66797fd9e2c8b8ae323bfd', 49, 2, 'test note', 'y', 'received', '2012-08-19 14:10:59'),
(79, '878c5e9c43a09d4e9f9c77e27a5bdc2e', 49, 2, 'well done', 'y', 'received', '2012-08-19 14:13:09'),
(80, 'da299d3ae2af63791f19a3cead6ce1a8', 49, 2, 'well done', 'y', 'received', '2012-08-19 14:24:16'),
(81, 'da299d3ae2af63791f19a3cead6ce1a8', 39, 2, '', 'y', 'received', '2012-08-19 14:24:29'),
(82, 'da299d3ae2af63791f19a3cead6ce1a8', 39, 2, '', 'y', 'received', '2012-08-19 14:25:15'),
(83, 'd2fc91e2d4ce2d0609e3b578a406471c', 43, 2, 'nota test 123', 'y', 'received', '2012-08-20 09:29:39'),
(84, 'd2fc91e2d4ce2d0609e3b578a406471c', 43, 2, 'nota 1', 'y', 'received', '2012-08-20 11:03:11'),
(85, 'd2fc91e2d4ce2d0609e3b578a406471c', 26, 2, 'nota 2', 'y', 'received', '2012-08-20 11:03:28'),
(86, 'd2fc91e2d4ce2d0609e3b578a406471c', 39, 2, 'nota 1', 'y', 'received', '2012-08-20 11:03:52'),
(87, 'd2fc91e2d4ce2d0609e3b578a406471c', 37, 2, 'nota 3', 'y', 'received', '2012-08-20 11:04:03'),
(88, 'd2fc91e2d4ce2d0609e3b578a406471c', 43, 1, '', 'n', 'received', '2012-08-25 10:18:15');

-- --------------------------------------------------------

--
-- Struttura della tabella `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `fk_idModules` int(11) NOT NULL,
  `fk_idRoles` int(11) NOT NULL,
  KEY `fk_idRoles` (`fk_idRoles`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `permissions`
--

INSERT INTO `permissions` (`fk_idModules`, `fk_idRoles`) VALUES
(1, 0),
(2, 0),
(0, 0),
(3, 0),
(4, 0),
(2, 2),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(3, 2),
(4, 2),
(3, 3),
(4, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `idRoles` int(11) NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRoles`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`idRoles`, `label`) VALUES
(0, 'admin'),
(1, 'supervisor'),
(2, 'staff manager'),
(3, 'cook'),
(4, 'waiter');

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `idSessions` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(45) DEFAULT NULL,
  `fk_idTables` int(11) DEFAULT NULL,
  `extras` mediumtext,
  `ticket` mediumtext NOT NULL,
  `bell` enum('y','n') DEFAULT 'n',
  `suspended` enum('y','n') DEFAULT 'n',
  `status` enum('insession','checkedout') NOT NULL DEFAULT 'insession',
  PRIMARY KEY (`idSessions`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dump dei dati per la tabella `sessions`
--

INSERT INTO `sessions` (`idSessions`, `sid`, `fk_idTables`, `extras`, `ticket`, `bell`, `suspended`, `status`) VALUES
(15, '27247c410786f8af754b4eb58787f75c', 1, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":1337026660,"currentround":4,"currentitems":0,"diners":{"adults":"2","children":"2"}}', '{"total":73.4,"fixed":{"adultsnr":"2","childrennr":"2","adults":22.54,"children":12.98},"carte":[{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"18","idOrders":"10","price":20.93,"number":"7"},{"label":"Item numero 3","idMenulists":"37","idOrders":"11","price":14.95,"number":"5"},{"label":"Coca cola","idMenulists":"39","idOrders":"20","price":2,"number":"2"}]}', 'n', 'n', 'checkedout'),
(21, 'b3b1fffcc876f52650257f72198fc5b8', 1, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":"0","currentround":"0","currentitems":"0","diners":{"adults":"2","children":"2"}}', '{"total":35.52,"fixed":{"adultsnr":"2","childrennr":"2","adults":22.54,"children":12.98},"carte":[]}', 'n', 'n', 'checkedout'),
(22, '52dd7d495a1bb29d921550867d57fb7c', 2, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":1338931207,"currentround":3,"currentitems":0,"diners":{"adults":"1","children":"1"}}', '{"total":19.76,"fixed":{"adultsnr":"1","childrennr":"1","adults":11.27,"children":6.49},"carte":[{"label":"Coca cola","idMenulists":"39","idOrders":"28","price":2,"number":"2"}]}', 'n', 'n', 'checkedout'),
(29, '8d0b00f1d0d2e8e99b452f38215f357f', 1, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":"0","currentround":"0","currentitems":"0","diners":{"adults":"1","children":"1"}}', '{"total":17.76,"fixed":{"adultsnr":"1","childrennr":"1","adults":11.27,"children":6.49},"carte":[]}', 'n', 'n', 'checkedout'),
(30, '75d991cf066f547e95f07556d808f1c2', 1, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":1339023868,"currentround":3,"currentitems":0,"diners":{"adults":"0","children":"0"}}', '{"total":2,"fixed":{"adultsnr":"0","childrennr":"0","adults":0,"children":0},"carte":[{"label":"Coca cola","idMenulists":"39","idOrders":"33","price":2,"number":"2"}]}', 'n', 'n', 'checkedout'),
(31, 'c5d6d8aad6d3d828f3e87cf5f98de5a4', 3, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":1338931050,"currentround":1,"currentitems":0,"diners":{"adults":"1","children":"0"}}', '', 'n', 'n', 'insession'),
(32, 'b6cd8129a47100d8ba88efaf6d3f5718', 1, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":1339232311,"currentround":1,"currentitems":0,"diners":{"adults":"0","children":"0"}}', '{"total":15.95,"fixed":{"adultsnr":"0","childrennr":"0","adults":0,"children":0},"carte":[{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"18","idOrders":"41","price":5.98,"number":"2"},{"label":"Item numero 1","idMenulists":"35","idOrders":"39","price":2.99,"number":"1"},{"label":"Item numero 3","idMenulists":"37","idOrders":"40","price":5.98,"number":"2"},{"label":"Coca cola","idMenulists":"39","idOrders":"38","price":1,"number":"1"}]}', 'n', 'n', 'checkedout'),
(33, '0691fe0749b1ee28a4aace2f63ae126a', NULL, '{"mininterval":"600","maxitems":"3","maxrounds":"5","currentroundts":"0","currentround":"0","currentitems":"0","diners":{"adults":"0","children":"0"}}', '', 'n', 'n', 'insession'),
(34, 'a37e014e95fdc6a8915c1fdcb5290c62', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":0,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[]}', 'n', 'n', 'checkedout'),
(35, '3a150d4f9839b51a0da4b18f9933e27a', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"18","idOrders":"42","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(36, '252bac7ae8794c9b40c054c8b08f8803', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":0,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[]}', 'n', 'n', 'checkedout'),
(37, 'da299d3ae2af63791f19a3cead6ce1a8', 2, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":9.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Coca cola","idMenulists":"39","idOrders":"81","price":4,"number":"4"},{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"49","idOrders":"80","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(38, '079ae02de0411a09d585a220772dc206', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"43","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(39, 'a4888526acc0a0ac778cfaa3c4109345', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"47","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(40, '4640b22e0612366d673c21f2ffc47711', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"48","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(41, 'e3007fc2f2b9b3fc942ff1e052b16bf8', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"49","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(42, 'adb9ae1f14ed8986ead92ce55207e589', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":2.99,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"50","price":2.99,"number":"1"}]}', 'n', 'n', 'checkedout'),
(43, '71067202fd433b6f7e33caa3ce0ae1b6', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":2.99,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"51","price":2.99,"number":"1"}]}', 'n', 'n', 'checkedout'),
(44, 'e38d72ea41a1cd46121a95997988eea3', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":2.99,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Item numero 3","idMenulists":"26","idOrders":"52","price":2.99,"number":"1"}]}', 'n', 'n', 'checkedout'),
(45, '01bf60bf3f776021bc7a19e1e9c4bd24', 21, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '', 'n', 'n', 'insession'),
(46, 'a82d2b68d9cb584fbd22a39416026ffb', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":0,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[]}', 'n', 'n', 'checkedout'),
(47, '1e5bc7d375076268da746ab5fd0688e7', 1, '{"mininterval":"600","maxitems":"999","maxrounds":"999","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":9.97,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"24","idOrders":"55","price":5.98,"number":"2"},{"label":"Item numero 3","idMenulists":"26","idOrders":"53","price":2.99,"number":"1"},{"label":"Coca cola","idMenulists":"39","idOrders":"54","price":1,"number":"1"}]}', 'n', 'n', 'checkedout'),
(48, 'f48590f328fb18c9be474eaee0b357dd', 1, '{"mininterval":"600","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":7.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Food number 3","idMenulists":"26","idOrders":"57","price":5.98,"number":"2"},{"label":"Coca cola","idMenulists":"39","idOrders":"58","price":2,"number":"2"}]}', 'n', 'n', 'checkedout'),
(49, 'ff57581573c73f12dc0a503d85bf87d4', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":0,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[]}', 'n', 'n', 'checkedout'),
(50, 'ed06eaada713bce497988957f5a337ea', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":15.96,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Coca cola","idMenulists":"39","idOrders":"68","price":4,"number":"4"},{"label":"Food number 1","idMenulists":"43","idOrders":"69","price":5.98,"number":"2"},{"label":"Food number 1","idMenulists":"45","idOrders":"67","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(51, '85837848bcc081e91a4b028107fa3043', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":13.96,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Food number 3","idMenulists":"26","idOrders":"73","price":5.98,"number":"2"},{"label":"Coca cola","idMenulists":"39","idOrders":"72","price":2,"number":"2"},{"label":"Food number 3","idMenulists":"47","idOrders":"71","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(52, 'c0d0b37efffc865c99cfaa66ffb87f16', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":10.97,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Coca cola","idMenulists":"39","idOrders":"75","price":2,"number":"2"},{"label":"Food number 1","idMenulists":"43","idOrders":"76","price":2.99,"number":"1"},{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"49","idOrders":"74","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(53, 'fbbb96fe7fccf832772f97c49a37a3b3', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Food number 3","idMenulists":"47","idOrders":"77","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(54, '2517d5aafb66797fd9e2c8b8ae323bfd', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"49","idOrders":"78","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(55, '878c5e9c43a09d4e9f9c77e27a5bdc2e', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":5.98,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Prova di un nome lungo per un''item che sto usando per programmare uno due tre quattro","idMenulists":"49","idOrders":"79","price":5.98,"number":"2"}]}', 'n', 'n', 'checkedout'),
(56, 'd2fc91e2d4ce2d0609e3b578a406471c', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":25.92,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Food number 3","idMenulists":"26","idOrders":"85","price":5.98,"number":"2"},{"label":"Food number 3","idMenulists":"37","idOrders":"87","price":5.98,"number":"2"},{"label":"Coca cola","idMenulists":"39","idOrders":"86","price":2,"number":"2"},{"label":"Food number 1","idMenulists":"43","idOrders":"83","price":11.96,"number":"4"}]}', 'n', 'n', 'checkedout'),
(57, '2dedc62db26155daf280def659e5b1e8', 4, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":0,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[]}', 'n', 'n', 'insession'),
(58, 'e25c012efd6695aad7dd72f21c178aaa', 2, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '', 'n', 'n', 'insession'),
(59, '1daebdf7da361269c1c85dae104633dc', 1, '{"mininterval":"60000","maxitems":"0","maxrounds":"0","currentroundts":"0","currentround":"0","currentitems":"0"}', '{"total":0,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[]}', 'n', 'n', 'insession');

-- --------------------------------------------------------

--
-- Struttura della tabella `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `idTables` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(45) NOT NULL,
  PRIMARY KEY (`idTables`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dump dei dati per la tabella `tables`
--

INSERT INTO `tables` (`idTables`, `tableName`) VALUES
(1, '10'),
(2, '20'),
(3, '30'),
(4, '40'),
(8, '60'),
(7, '50'),
(20, '80'),
(19, '70'),
(21, '90');

-- --------------------------------------------------------

--
-- Struttura della tabella `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `idTickets` int(11) NOT NULL AUTO_INCREMENT,
  `fk_sid` varchar(64) NOT NULL,
  `ticket` mediumtext NOT NULL,
  PRIMARY KEY (`idTickets`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dump dei dati per la tabella `tickets`
--

INSERT INTO `tickets` (`idTickets`, `fk_sid`, `ticket`) VALUES
(47, 'd2fc91e2d4ce2d0609e3b578a406471c', '{"total":25.92,"fixed":{"adultsnr":null,"childrennr":null,"adults":0,"children":0},"carte":[{"label":"Food number 3","idMenulists":"26","idOrders":"85","price":5.98,"number":"2"},{"label":"Food number 3","idMenulists":"37","idOrders":"87","price":5.98,"number":"2"},{"label":"Coca cola","idMenulists":"39","idOrders":"86","price":2,"number":"2"},{"label":"Food number 1","idMenulists":"43","idOrders":"83","price":11.96,"number":"4"}]}');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`idUsers`, `firstName`, `lastName`, `emailAddress`, `username`, `password`, `role`) VALUES
(0, '', '', '', 'admin', '098f6bcd4621d373cade4e832627b4f6', 0),
(2, 'Mario', 'Rossi', '', 'manager', '098f6bcd4621d373cade4e832627b4f6', 2),
(1, 'Gino', 'Bianchi', '', 'supervisor', '098f6bcd4621d373cade4e832627b4f6', 1),
(3, 'Paolo', 'Verdi', '', 'cook', '098f6bcd4621d373cade4e832627b4f6', 3),
(4, 'John', 'Waiter', '', 'waiter', '098f6bcd4621d373cade4e832627b4f6', 4);

SET FOREIGN_KEY_CHECKS=1;

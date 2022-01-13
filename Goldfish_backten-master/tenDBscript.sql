-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fishbolas
CREATE DATABASE IF NOT EXISTS `fishbolas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `fishbolas`;

-- Dumping structure for visualização fishbolas.pitches
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `pitches` 
) ENGINE=MyISAM;

-- Dumping structure for table fishbolas.subscriptions
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `cost` double NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__types` (`type`),
  CONSTRAINT `FK__types` FOREIGN KEY (`type`) REFERENCES `types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fishbolas.subscriptions: ~9 rows (approximately)
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` (`id`, `name`, `duration`, `cost`, `type`) VALUES
	(1, 'forever', 0, 0, 1),
	(2, 'monthly', 30, 4.99, 2),
	(3, 'trimester', 90, 12.99, 2),
	(4, 'semester', 180, 24.99, 2),
	(5, 'yearly', 360, 49.99, 2),
	(6, 'monthly', 30, 9.99, 3),
	(7, 'trimester', 90, 25.99, 3),
	(8, 'semester', 180, 50.99, 3),
	(9, 'yearly', 360, 100, 3);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;

-- Dumping structure for table fishbolas.types
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fishbolas.types: ~2 rows (approximately)
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` (`id`, `name`) VALUES
	(1, 'admin'),
	(2, 'entrepeneur'),
	(3, 'investor');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;

-- Dumping structure for table fishbolas.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'New user',
  `password` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 2,
  `mail` varchar(255) NOT NULL,
  `cred_card` varchar(50) DEFAULT 'john doe',
  `card_nr` bigint(20) DEFAULT NULL,
  `safet_nr` int(3) DEFAULT 0,
  `subscription` int(11) DEFAULT NULL,
  `subscription_start` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_subscription` (`subscription`),
  KEY `FK_users_types` (`type`),
  CONSTRAINT `FK_users_subscription` FOREIGN KEY (`subscription`) REFERENCES `subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_users_types` FOREIGN KEY (`type`) REFERENCES `types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fishbolas.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `password`, `type`, `mail`, `cred_card`, `card_nr`, `safet_nr`, `subscription`, `subscription_start`) VALUES
	(1, 'Vitor Costa', '1234', 1, 'toniramos@gmail.com', '', 0, 0, 1, NULL),
	(2, 'Josué Inventor', '1234', 2, 'ji@gamil.com', 'Josué Inventor', 1234567812345678, 123, 3, '2022-01-04'),
	(3, 'Manel Investe', '1234', 3, 'mi@gamil.com', 'Manel Investe', 1234123412341234, 123, 9, '2022-01-04'),
	(4, 'Toni Ramos', '1234', 2, 'muitopelo@gamil.com', 'Antonio Ramos', 9874987498749874, 321, 5, '2022-01-05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for visualização fishbolas.pitches
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `pitches`;
;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

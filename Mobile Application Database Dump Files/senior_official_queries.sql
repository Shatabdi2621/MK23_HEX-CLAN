-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: database-1.caf6lw71z7rh.ap-south-1.rds.amazonaws.com    Database: senior_official
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senior_official_user_id` varchar(255) NOT NULL,
  `junior_official_user_id` varchar(255) NOT NULL,
  `heading` varchar(1000) NOT NULL,
  `short` varchar(1000) NOT NULL,
  `body` varchar(10000) NOT NULL,
  `sector` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `random_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,'sb1','jb1','Extension of timeline for finalization of audited accounts','All Non-Banking Financial Companies (NBFCs)','RBI/2020-21/11\nDoR (NBFC) (PD) CC. No. 114/03.10.001/2020-21\n\nJuly 06, 2020\n\nAll Non-Banking Financial Companies (NBFCs)\n\nMadam/ Dear Sir,\n\nExtension of timeline for finalization of audited accounts\n\nPlease refer to para 18(2) of the Master Direction on Systemically Important Non-Deposit taking Company and Deposit taking Company (Reserve Bank) Directions, 2016 and Non-Systemically Important Non-Deposit taking Company (Reserve Bank) Directions, 2016, as per which every applicable NBFC shall finalise its balance sheet within a period of 3 months from the date to which it pertains.\n\n2. In view of the on-going situation and taking in to account the feedback received from various stakeholders, it has been decided that every applicable NBFC shall finalise its balance sheet within a period of 3 months from the date to which it pertains or any date as notified by SEBI for submission of financial results by listed entities.\n\nYours faithfully,\n\n(Manoranjan Mishra)\nChief General Manager','','2020-08-02 10:40:31','question','',433662),(16,'','','','','','','2020-08-02 10:40:49','','',0),(17,'','','','','','','2020-08-02 10:46:48','','',0),(18,'','','','','','','2020-08-02 10:51:15','','answer',0),(19,'','','','','','','2020-08-02 10:58:44','','answer',0),(20,'','','','','','','2020-08-02 10:59:53','','answer',0),(21,'','','','','','','2020-08-02 11:00:13','','answer',0),(22,'sb1','jb1','Special liquidity scheme for NBFCs/HFCs','All NBFCs/HFCs','RBI/2020-21/01\nDoR (NBFC) (PD) CC.No.113/03.10.001/2020-21\n\nJuly 01, 2020\n\nAll NBFCs/HFCs\n\nMadam/Dear Sir,\n\nSpecial liquidity scheme for NBFCs/HFCs\n\nThe Government of India has approved a scheme to improve the liquidity position of NBFCs/HFCs through a Special Purpose Vehicle (SPV) to avoid any potential systemic risks to the financial sector. To be eligible under the Scheme, the following conditions should be met:\n\nNBFCs including Microfinance Institutions that are registered with the RBI under the Reserve Bank of India Act, 1934, excluding those registered as Core Investment Companies;\n\nHousing Finance Companies that are registered under the National Housing Bank Act, 1987;\n\nCRAR/CAR of NBFCs/HFCs should not be below the regulatory minimum, i.e., 15% and 12% respectively as on March 31, 2019;\n\nThe net non-performing assets should not be more than 6% as on March 31, 2019;\n\nThey should have made net profit in at least one of the last two preceding financial years (i.e. 2017-18 and 2018-19);\n\nThey should not have been reported under SMA-1 or SMA-2 category by any bank for their borrowings during last one year prior to August 01, 2018;\n\nThey should be rated investment grade by a SEBI registered rating agency;\n\nThey should comply with the requirement of the SPV for an appropriate level of collateral from the entity, which, however, would be optional and to be decided by the SPV.\n\n2. As per the Government decision, SBICAP which is a subsidiary of the State Bank of India has set up a SPV (SLS Trust) to manage this operation. The SPV will purchase the short-term papers from eligible NBFCs/HFCs, who shall utilise the proceeds under this scheme solely for the purpose of extinguishing existing liabilities. The instruments will be CPs and NCDs with a residual maturity of not more than three months and rated as investment grade. The facility will not be available for any paper issued after September 30, 2020 and the SPV would cease to make fresh purchases after September 30, 2020 and would recover all dues by December 31, 2020; or as may be modified subsequently under the scheme.\n\n3. NBFCs/HFCs, in order to avail the facility, may approach the Trust at the following address:\n\nSLS Trust, Apeejay House, 6th Floor, 3, Dinshaw Wachha Road, Churchgate Mumbai 400020. Email Id: info@slstrust.in\n\nYours faithfully,\n\n(Manoranjan Mishra)\nChief General Manager','','2020-08-02 12:31:42','suggestion','answer',348351),(23,'sb1','jb1','Extension of timeline for finalization of audited accounts','All Non-Banking Financial Companies (NBFCs)','RBI/2020-21/11\nDoR (NBFC) (PD) CC. No. 114/03.10.001/2020-21\n\nJuly 06, 2020\n\nAll Non-Banking Financial Companies (NBFCs)\n\nMadam/ Dear Sir,\n\nExtension of timeline for finalization of audited accounts\n\nPlease refer to para 18(2) of the Master Direction on Systemically Important Non-Deposit taking Company and Deposit taking Company (Reserve Bank) Directions, 2016 and Non-Systemically Important Non-Deposit taking Company (Reserve Bank) Directions, 2016, as per which every applicable NBFC shall finalise its balance sheet within a period of 3 months from the date to which it pertains.\n\n2. In view of the on-going situation and taking in to account the feedback received from various stakeholders, it has been decided that every applicable NBFC shall finalise its balance sheet within a period of 3 months from the date to which it pertains or any date as notified by SEBI for submission of financial results by listed entities.\n\nYours faithfully,\n\n(Manoranjan Mishra)\nChief General Manager','','2020-08-03 08:26:45','message mil gya','',378667);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 15:45:09

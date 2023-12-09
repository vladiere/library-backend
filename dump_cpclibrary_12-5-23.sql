-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cpclibrary
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accession_no`
--

DROP TABLE IF EXISTS `accession_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accession_no` (
  `accession_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `accession_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`accession_id`),
  UNIQUE KEY `accession_no` (`accession_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_acquisitions`
--

DROP TABLE IF EXISTS `book_acquisitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_acquisitions` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `accession_no` int(11) NOT NULL,
  `acquisition_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `book_condition` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_author` (
  `accession_no` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`accession_no`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `book_author_info`
--

DROP TABLE IF EXISTS `book_author_info`;
/*!50001 DROP VIEW IF EXISTS `book_author_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_author_info` AS SELECT
 1 AS `author_id`,
  1 AS `author_name`,
  1 AS `title`,
  1 AS `edition`,
  1 AS `publisher_name`,
  1 AS `copyright_yr` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_catalog`
--

DROP TABLE IF EXISTS `book_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_catalog` (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_subject` varchar(255) NOT NULL,
  `ddc_code` varchar(10) NOT NULL,
  `accession_id` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`catalog_id`),
  UNIQUE KEY `accession_id` (`accession_id`),
  CONSTRAINT `book_catalog_ibfk_1` FOREIGN KEY (`accession_id`) REFERENCES `accession_no` (`accession_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `book_catalog_info`
--

DROP TABLE IF EXISTS `book_catalog_info`;
/*!50001 DROP VIEW IF EXISTS `book_catalog_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_catalog_info` AS SELECT
 1 AS `accession_no`,
  1 AS `book_subject`,
  1 AS `title`,
  1 AS `ddc_code`,
  1 AS `created` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_collections`
--

DROP TABLE IF EXISTS `book_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_collections` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_holds`
--

DROP TABLE IF EXISTS `book_holds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_holds` (
  `hold_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `hold_status` enum('active','done') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pending_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hold_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_hold_done
AFTER UPDATE ON book_holds
FOR EACH ROW 
BEGIN
	DECLARE v_due_date DATETIME;
	DECLARE v_book_id INT;
	DECLARE v_user_id INT;

   	-- set a due date
-- 	SET v_due_date = DATE_ADD(NOW(), INTERVAL 5 DAY);
	SET v_due_date = DATE_ADD(NOW(), INTERVAL 1 MINUTE); 
	SELECT book_id, user_id INTO v_book_id, v_user_id FROM book_holds WHERE pending_transaction_id = NEW.pending_transaction_id;

    -- Insert a new row into book_transactions
    INSERT INTO book_transactions (book_id, user_id, transaction_type, transaction_date, due_date, status, pending_transaction_id)
  	VALUES (v_book_id, v_user_id, 'Held', NOW(), v_due_date, 'Active', NEW.pending_transaction_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `book_image`
--

DROP TABLE IF EXISTS `book_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_image` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  UNIQUE KEY `book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4939 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `book_info`
--

DROP TABLE IF EXISTS `book_info`;
/*!50001 DROP VIEW IF EXISTS `book_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_info` AS SELECT
 1 AS `accession_id`,
  1 AS `accession_no`,
  1 AS `book_id`,
  1 AS `date_received`,
  1 AS `author_name`,
  1 AS `title`,
  1 AS `edition`,
  1 AS `publisher_name`,
  1 AS `cost_price`,
  1 AS `copyright_yr`,
  1 AS `remarks`,
  1 AS `img_path`,
  1 AS `total_checkedout`,
  1 AS `updated_at` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `book_inventory`
--

DROP TABLE IF EXISTS `book_inventory`;
/*!50001 DROP VIEW IF EXISTS `book_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_inventory` AS SELECT
 1 AS `book_id`,
  1 AS `author_name`,
  1 AS `title`,
  1 AS `edition`,
  1 AS `publisher_name`,
  1 AS `cost_price`,
  1 AS `copies`,
  1 AS `borrowed_copies`,
  1 AS `book_status`,
  1 AS `img_path`,
  1 AS `total_checkedout` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_publisher`
--

DROP TABLE IF EXISTS `book_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_publisher` (
  `accession_no` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`accession_no`,`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_remarks`
--

DROP TABLE IF EXISTS `book_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_remarks` (
  `remark_id` int(11) NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`remark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_renewals`
--

DROP TABLE IF EXISTS `book_renewals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_renewals` (
  `renewal_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `renewal_days` int(11) NOT NULL,
  `requested_date` datetime DEFAULT NULL,
  `approval_status` enum('Approved','Cancelled','Pending') DEFAULT 'Pending',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`renewal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_transactions`
--

DROP TABLE IF EXISTS `book_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_type` enum('Borrowed','Returned','Checked In','Checked Out','Held','Reserved','Renewal') NOT NULL,
  `transaction_date` datetime NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` enum('Active','Completed','Cancelled') NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `pending_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `pending_transaction_id` (`pending_transaction_id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `book_transactions_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `book_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_book_returned
BEFORE UPDATE ON book_transactions
FOR EACH ROW
BEGIN
    DECLARE v_book_id INT;
    DECLARE v_user_id INT;
    DECLARE v_due_date DATETIME;
    DECLARE v_title VARCHAR(255);
    DECLARE v_created_at DATETIME;
   	DECLARE v_pending_transaction_ID INT;

    IF NEW.status = 'Completed' THEN
    	CALL HoldInsertIntoBookTransaction(NEW.pending_transaction_id);
        -- Get book_id, user_id, and other details from pending_transactions
--         SELECT book_id, user_id, request_date
--         INTO v_book_id, v_user_id, v_created_at
--         FROM pending_transactions
--         WHERE pending_transaction_id = NEW.pending_transaction_id;
--        	
-- 
--         -- Update book_holds
--         UPDATE book_holds
--         SET hold_status = 'done'
--         WHERE pending_transaction_id = NEW.pending_transaction_id;
-- 
--         -- Set a due date
--         SET v_due_date = DATE_ADD(NOW(), INTERVAL 5 DAY);
-- 
--         -- Insert a new row into book_transactions
-- 	    INSERT INTO book_transactions (book_id, user_id, transaction_type, transaction_date, due_date, status, pending_transaction_id)
-- 	  	VALUES (v_book_id, v_user_id, 'Held', NOW(), v_due_date, 'Active', NEW.pending_transaction_id);
-- 
--         -- Insert a notification
--         INSERT INTO notifications (user_id, message, notification_type, creation_date)
--         VALUES (v_user_id, CONCAT('The book ', v_title, ' you held on ', DATE_FORMAT(v_created_at, '%M %e, %Y'), ' is available for checked out on this day ', DATE_FORMAT(NOW(), '%M %e, %Y')), 'Held', NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_received` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `copyright_yr` varchar(50) DEFAULT NULL,
  `cost_price` float DEFAULT 0,
  `book_status` varchar(50) DEFAULT NULL,
  `total_checkedout` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4939 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `collection_details`
--

DROP TABLE IF EXISTS `collection_details`;
/*!50001 DROP VIEW IF EXISTS `collection_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `collection_details` AS SELECT
 1 AS `user_id`,
  1 AS `collection_id`,
  1 AS `book_id`,
  1 AS `title`,
  1 AS `author_name`,
  1 AS `img_path` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `contribution_details`
--

DROP TABLE IF EXISTS `contribution_details`;
/*!50001 DROP VIEW IF EXISTS `contribution_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `contribution_details` AS SELECT
 1 AS `contribution_id`,
  1 AS `user_id`,
  1 AS `author_fullname`,
  1 AS `category_name`,
  1 AS `publisher_name`,
  1 AS `file_title`,
  1 AS `file_path`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `file_description`,
  1 AS `uploaded_date`,
  1 AS `file_total_downloads`,
  1 AS `file_status`,
  1 AS `user_status` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ebook`
--

DROP TABLE IF EXISTS `ebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebook` (
  `ebook_id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_title` varchar(200) NOT NULL,
  `ebook_file` varchar(100) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `ebook_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fines_and_fees`
--

DROP TABLE IF EXISTS `fines_and_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fines_and_fees` (
  `fine_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `fine_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fine_type` enum('Late Return Fee','Damaged Book Fee','Lost Book Fee','No issue','Other') NOT NULL,
  `fine_date` datetime NOT NULL,
  `status` enum('Active','Paid') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`fine_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `fines_and_fees_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `book_transactions` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `fines_and_fees_summary`
--

DROP TABLE IF EXISTS `fines_and_fees_summary`;
/*!50001 DROP VIEW IF EXISTS `fines_and_fees_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fines_and_fees_summary` AS SELECT
 1 AS `transaction_id`,
  1 AS `user_id`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `role`,
  1 AS `title`,
  1 AS `fine_type`,
  1 AS `total_fines_and_fees`,
  1 AS `status`,
  1 AS `due_date`,
  1 AS `fine_date` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formats` (
  `format_id` int(11) NOT NULL AUTO_INCREMENT,
  `format_label` varchar(50) NOT NULL,
  `added_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `holds_details`
--

DROP TABLE IF EXISTS `holds_details`;
/*!50001 DROP VIEW IF EXISTS `holds_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `holds_details` AS SELECT
 1 AS `hold_id`,
  1 AS `pending_transaction_id`,
  1 AS `title`,
  1 AS `author_name`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `role`,
  1 AS `hold_status`,
  1 AS `requested_date`,
  1 AS `approve_date` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instructor_recommendations`
--

DROP TABLE IF EXISTS `instructor_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_recommendations` (
  `recommendation_id` int(11) NOT NULL AUTO_INCREMENT,
  `instructor_id` int(11) NOT NULL,
  `recommended_book_id` int(11) NOT NULL,
  `recommendation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `recommendation_status` enum('active','removed') DEFAULT 'active',
  `visibility` enum('show','hide') DEFAULT 'hide',
  PRIMARY KEY (`recommendation_id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `instructor_recommendations_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `instructor_recommendations_details`
--

DROP TABLE IF EXISTS `instructor_recommendations_details`;
/*!50001 DROP VIEW IF EXISTS `instructor_recommendations_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instructor_recommendations_details` AS SELECT
 1 AS `recommendation_id`,
  1 AS `user_id`,
  1 AS `book_id`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `img_path`,
  1 AS `title`,
  1 AS `author_name`,
  1 AS `total_checkedout`,
  1 AS `recommendation_status`,
  1 AS `visibility` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian` (
  `librarian_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`librarian_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `librarian_address`
--

DROP TABLE IF EXISTS `librarian_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `librarian_id` int(11) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province_region` varchar(255) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `address_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `librarian_id` (`librarian_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `librarian_details`
--

DROP TABLE IF EXISTS `librarian_details`;
/*!50001 DROP VIEW IF EXISTS `librarian_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `librarian_details` AS SELECT
 1 AS `librarian_id`,
  1 AS `firstname`,
  1 AS `middlename`,
  1 AS `lastname`,
  1 AS `email_address`,
  1 AS `phone_number`,
  1 AS `hobbies`,
  1 AS `description`,
  1 AS `street_address`,
  1 AS `city`,
  1 AS `state_province_region`,
  1 AS `postal_code`,
  1 AS `address_type`,
  1 AS `username`,
  1 AS `privilege` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `librarian_info`
--

DROP TABLE IF EXISTS `librarian_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `librarian_id` int(11) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hobbies` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  UNIQUE KEY `librarian_id` (`librarian_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `librarian_login`
--

DROP TABLE IF EXISTS `librarian_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `librarian_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `privilege` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `librarian_login_logs`
--

DROP TABLE IF EXISTS `librarian_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian_login_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `login_date` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `librarian_notifications`
--

DROP TABLE IF EXISTS `librarian_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `notification_type` enum('Approved','Overdue','Cancelled','Available','Reserved','Checked In','Checked Out','Borrowed','Held','Contribution','Renewal','Removed') DEFAULT NULL,
  `notification_date` datetime NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `librarian_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `list_contents`
--

DROP TABLE IF EXISTS `list_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_contents` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `added_at` timestamp NULL DEFAULT current_timestamp(),
  `content_status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`content_id`),
  KEY `list_id` (`list_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `list_contents_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `user_lists` (`list_id`),
  CONSTRAINT `list_contents_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date_login` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `notification_librarian`
--

DROP TABLE IF EXISTS `notification_librarian`;
/*!50001 DROP VIEW IF EXISTS `notification_librarian`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `notification_librarian` AS SELECT
 1 AS `notification_id`,
  1 AS `fullname`,
  1 AS `message`,
  1 AS `notification_type`,
  1 AS `notification_date`,
  1 AS `status` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `notification_type` enum('Approved','Overdue','Cancelled','Held','Available','Check Out','Borrowed','Contribution','Renewal') DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `online_department`
--

DROP TABLE IF EXISTS `online_department`;
/*!50001 DROP VIEW IF EXISTS `online_department`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `online_department` AS SELECT
 1 AS `department`,
  1 AS `status`,
  1 AS `date_login` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pending_transactions`
--

DROP TABLE IF EXISTS `pending_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_transactions` (
  `pending_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_type` enum('Borrowed','Held','Reserved','Renewal') DEFAULT NULL,
  `status` enum('Pending','Approved','Cancelled') NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `approve_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pending_transaction_id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pending_transactions_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `pending_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal_recommendations`
--

DROP TABLE IF EXISTS `personal_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_recommendations` (
  `recommendation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recommended_book_id` int(11) NOT NULL,
  `recommendation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `recommendation_status` enum('active','removed') DEFAULT 'active',
  PRIMARY KEY (`recommendation_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `personal_recommendations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `presonalize_recomendations_details`
--

DROP TABLE IF EXISTS `presonalize_recomendations_details`;
/*!50001 DROP VIEW IF EXISTS `presonalize_recomendations_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `presonalize_recomendations_details` AS SELECT
 1 AS `recommendation_id`,
  1 AS `user_id`,
  1 AS `book_id`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `img_path`,
  1 AS `title`,
  1 AS `author_name`,
  1 AS `total_checkedout`,
  1 AS `recommendation_status` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `recomendations_details`
--

DROP TABLE IF EXISTS `recomendations_details`;
/*!50001 DROP VIEW IF EXISTS `recomendations_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `recomendations_details` AS SELECT
 1 AS `recommendation_id`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `title`,
  1 AS `total_checkedout`,
  1 AS `recommendation_status`,
  1 AS `visibility` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refresh_token` (
  `refresh_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`refresh_token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `renewal_details`
--

DROP TABLE IF EXISTS `renewal_details`;
/*!50001 DROP VIEW IF EXISTS `renewal_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `renewal_details` AS SELECT
 1 AS `renewal_id`,
  1 AS `transaction_id`,
  1 AS `user_id`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `title`,
  1 AS `renewal_days`,
  1 AS `original_due_date`,
  1 AS `new_due_date`,
  1 AS `approval_status` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `transactions_book`
--

DROP TABLE IF EXISTS `transactions_book`;
/*!50001 DROP VIEW IF EXISTS `transactions_book`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `transactions_book` AS SELECT
 1 AS `transaction_id`,
  1 AS `user_id`,
  1 AS `title`,
  1 AS `author_name`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `transaction_type`,
  1 AS `transaction_date`,
  1 AS `due_date`,
  1 AS `status`,
  1 AS `last_date`,
  1 AS `img_path` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `transactions_pending`
--

DROP TABLE IF EXISTS `transactions_pending`;
/*!50001 DROP VIEW IF EXISTS `transactions_pending`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `transactions_pending` AS SELECT
 1 AS `pending_transaction_id`,
  1 AS `user_id`,
  1 AS `title`,
  1 AS `fullname`,
  1 AS `department`,
  1 AS `transaction_type`,
  1 AS `status`,
  1 AS `request_date`,
  1 AS `approve_date`,
  1 AS `img_path` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_contribution`
--

DROP TABLE IF EXISTS `user_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contribution` (
  `contribution_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_author_id` int(11) NOT NULL,
  `file_category_id` int(11) NOT NULL,
  `file_publisher_id` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_total_downloads` int(11) DEFAULT 0,
  `file_description` text NOT NULL,
  `file_status` enum('accepted','cancelled','pending','removed') DEFAULT 'pending',
  `user_status` enum('active','removed') DEFAULT 'active',
  PRIMARY KEY (`contribution_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_contribution_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_contribution_authors`
--

DROP TABLE IF EXISTS `user_contribution_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contribution_authors` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_fullname` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_fullname` (`author_fullname`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_contribution_category`
--

DROP TABLE IF EXISTS `user_contribution_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contribution_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_contribution_publisher`
--

DROP TABLE IF EXISTS `user_contribution_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contribution_publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `publisher_name` (`publisher_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!50001 DROP VIEW IF EXISTS `user_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_details` AS SELECT
 1 AS `user_id`,
  1 AS `fullname`,
  1 AS `id_number`,
  1 AS `department`,
  1 AS `email_address`,
  1 AS `img_path`,
  1 AS `user_status`,
  1 AS `created_at`,
  1 AS `updated_at`,
  1 AS `total_amount`,
  1 AS `edited_at` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_number` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `department` varchar(100) NOT NULL,
  `user_status` enum('inactive','active') DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` varchar(100) NOT NULL,
  `edited_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id_number` (`id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_lists`
--

DROP TABLE IF EXISTS `user_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lists` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `list_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `list_status` tinyint(1) DEFAULT 0,
  `list_desc` text DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  UNIQUE KEY `list_name` (`list_name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_lists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `email_address_2` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!50001 DROP VIEW IF EXISTS `user_notifications`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_notifications` AS SELECT
 1 AS `notification_id`,
  1 AS `user_id`,
  1 AS `message`,
  1 AS `notification_date`,
  1 AS `status` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_profile_pic`
--

DROP TABLE IF EXISTS `user_profile_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile_pic` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `volume_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `copies` int(11) DEFAULT 1,
  `borrowed_copies` int(11) DEFAULT 1,
  PRIMARY KEY (`volume_id`,`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4939 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `book_author_info`
--

/*!50001 DROP VIEW IF EXISTS `book_author_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_author_info` AS select `a`.`author_id` AS `author_id`,`a`.`author_name` AS `author_name`,`b`.`title` AS `title`,`b`.`edition` AS `edition`,`p`.`publisher_name` AS `publisher_name`,`b`.`copyright_yr` AS `copyright_yr` from (`publishers` `p` left join (`books` `b` left join `authors` `a` on(`b`.`author_id` = `a`.`author_id`)) on(`p`.`publisher_id` = `b`.`publisher_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_catalog_info`
--

/*!50001 DROP VIEW IF EXISTS `book_catalog_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_catalog_info` AS select `an`.`accession_no` AS `accession_no`,`bc`.`book_subject` AS `book_subject`,`b`.`title` AS `title`,`bc`.`ddc_code` AS `ddc_code`,date_format(`bc`.`create_at`,'%M %e, %Y') AS `created` from ((`book_catalog` `bc` left join `accession_no` `an` on(`bc`.`accession_id` = `an`.`accession_id`)) left join `books` `b` on(`an`.`book_id` = `b`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_info`
--

/*!50001 DROP VIEW IF EXISTS `book_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_info` AS select `an`.`accession_id` AS `accession_id`,`an`.`accession_no` AS `accession_no`,`b`.`book_id` AS `book_id`,`b`.`date_received` AS `date_received`,`au`.`author_name` AS `author_name`,`b`.`title` AS `title`,`b`.`edition` AS `edition`,`p`.`publisher_name` AS `publisher_name`,`b`.`cost_price` AS `cost_price`,`b`.`copyright_yr` AS `copyright_yr`,`br`.`remarks` AS `remarks`,`bi`.`img_path` AS `img_path`,`b`.`total_checkedout` AS `total_checkedout`,`b`.`updated_at` AS `updated_at` from (((((`book_image` `bi` left join `books` `b` on(`bi`.`book_id` = `b`.`book_id`)) left join `accession_no` `an` on(`an`.`book_id` = `b`.`book_id`)) left join `authors` `au` on(`au`.`author_id` = `b`.`author_id`)) left join `publishers` `p` on(`p`.`publisher_id` = `b`.`publisher_id`)) left join `book_remarks` `br` on(`br`.`accession_id` = `an`.`accession_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_inventory`
--

/*!50001 DROP VIEW IF EXISTS `book_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_inventory` AS select `b`.`book_id` AS `book_id`,`a`.`author_name` AS `author_name`,`b`.`title` AS `title`,`b`.`edition` AS `edition`,`p`.`publisher_name` AS `publisher_name`,`b`.`cost_price` AS `cost_price`,`v`.`copies` AS `copies`,`v`.`borrowed_copies` AS `borrowed_copies`,`b`.`book_status` AS `book_status`,`bi`.`img_path` AS `img_path`,`b`.`total_checkedout` AS `total_checkedout` from ((((`volumes` `v` left join `books` `b` on(`b`.`book_id` = `v`.`book_id`)) left join `publishers` `p` on(`b`.`publisher_id` = `p`.`publisher_id`)) left join `authors` `a` on(`b`.`author_id` = `a`.`author_id`)) left join `book_image` `bi` on(`b`.`book_id` = `bi`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `collection_details`
--

/*!50001 DROP VIEW IF EXISTS `collection_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `collection_details` AS select `bc`.`user_id` AS `user_id`,`bc`.`collection_id` AS `collection_id`,`bc`.`book_id` AS `book_id`,`b`.`title` AS `title`,`a`.`author_name` AS `author_name`,`bi`.`img_path` AS `img_path` from (((`book_collections` `bc` join `books` `b` on(`b`.`book_id` = `bc`.`book_id`)) join `authors` `a` on(`a`.`author_id` = `b`.`author_id`)) join `book_image` `bi` on(`bi`.`book_id` = `bc`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contribution_details`
--

/*!50001 DROP VIEW IF EXISTS `contribution_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contribution_details` AS select `uc`.`contribution_id` AS `contribution_id`,`uc`.`user_id` AS `user_id`,`uca`.`author_fullname` AS `author_fullname`,`ucc`.`category_name` AS `category_name`,`ucp`.`publisher_name` AS `publisher_name`,`uc`.`file_title` AS `file_title`,`uc`.`file_path` AS `file_path`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`uc`.`file_description` AS `file_description`,date_format(`uc`.`uploaded_date`,'%M %e, %Y') AS `uploaded_date`,`uc`.`file_total_downloads` AS `file_total_downloads`,`uc`.`file_status` AS `file_status`,`uc`.`user_status` AS `user_status` from ((((`user_contribution` `uc` left join `user_contribution_authors` `uca` on(`uca`.`author_id` = `uc`.`file_author_id`)) left join `user_contribution_category` `ucc` on(`ucc`.`category_id` = `uc`.`file_category_id`)) left join `user_contribution_publisher` `ucp` on(`ucp`.`publisher_id` = `uc`.`file_publisher_id`)) left join `user_info` `ui` on(`ui`.`user_id` = `uc`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fines_and_fees_summary`
--

/*!50001 DROP VIEW IF EXISTS `fines_and_fees_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fines_and_fees_summary` AS select `bt`.`transaction_id` AS `transaction_id`,`bt`.`user_id` AS `user_id`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`ui`.`role` AS `role`,`b`.`title` AS `title`,`ff`.`fine_type` AS `fine_type`,sum(`ff`.`fine_amount`) AS `total_fines_and_fees`,`ff`.`status` AS `status`,date_format(`bt`.`due_date`,'%M %e, %Y') AS `due_date`,date_format(`ff`.`fine_date`,'%M %e, %Y') AS `fine_date` from (((`fines_and_fees` `ff` left join `book_transactions` `bt` on(`bt`.`transaction_id` = `ff`.`transaction_id`)) left join `user_info` `ui` on(`bt`.`user_id` = `ui`.`user_id`)) left join `books` `b` on(`b`.`book_id` = `bt`.`book_id`)) group by `bt`.`transaction_id`,`b`.`title`,`bt`.`user_id`,`ui`.`fullname`,`ui`.`department`,`ui`.`role`,`ff`.`status`,`bt`.`due_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `holds_details`
--

/*!50001 DROP VIEW IF EXISTS `holds_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `holds_details` AS select `bh`.`hold_id` AS `hold_id`,`bh`.`pending_transaction_id` AS `pending_transaction_id`,`b`.`title` AS `title`,`a`.`author_name` AS `author_name`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`ui`.`role` AS `role`,`bh`.`hold_status` AS `hold_status`,date_format(`pt`.`request_date`,'%M %e, %Y') AS `requested_date`,date_format(`bh`.`created_at`,'%M %e, %Y') AS `approve_date` from ((((`book_holds` `bh` left join `user_info` `ui` on(`ui`.`user_id` = `bh`.`user_id`)) left join `books` `b` on(`b`.`book_id` = `bh`.`book_id`)) left join `authors` `a` on(`a`.`author_id` = `b`.`author_id`)) left join `pending_transactions` `pt` on(`pt`.`pending_transaction_id` = `bh`.`pending_transaction_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instructor_recommendations_details`
--

/*!50001 DROP VIEW IF EXISTS `instructor_recommendations_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructor_recommendations_details` AS select `ir`.`recommendation_id` AS `recommendation_id`,`ui`.`user_id` AS `user_id`,`b`.`book_id` AS `book_id`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`bi`.`img_path` AS `img_path`,`b`.`title` AS `title`,`au`.`author_name` AS `author_name`,`b`.`total_checkedout` AS `total_checkedout`,`ir`.`recommendation_status` AS `recommendation_status`,`ir`.`visibility` AS `visibility` from ((((`instructor_recommendations` `ir` left join `books` `b` on(`b`.`book_id` = `ir`.`recommended_book_id`)) left join `user_info` `ui` on(`ui`.`user_id` = `ir`.`instructor_id`)) left join `authors` `au` on(`au`.`author_id` = `b`.`author_id`)) left join `book_image` `bi` on(`bi`.`book_id` = `b`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `librarian_details`
--

/*!50001 DROP VIEW IF EXISTS `librarian_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `librarian_details` AS select `l`.`librarian_id` AS `librarian_id`,`l`.`firstname` AS `firstname`,`l`.`middlename` AS `middlename`,`l`.`lastname` AS `lastname`,`li`.`email_address` AS `email_address`,`li`.`phone_number` AS `phone_number`,`li`.`hobbies` AS `hobbies`,`li`.`description` AS `description`,`la`.`street_address` AS `street_address`,`la`.`city` AS `city`,`la`.`state_province_region` AS `state_province_region`,`la`.`postal_code` AS `postal_code`,`la`.`address_type` AS `address_type`,`ll`.`username` AS `username`,`ll`.`privilege` AS `privilege` from (`librarian_login` `ll` left join ((`librarian` `l` left join `librarian_info` `li` on(`l`.`librarian_id` = `li`.`librarian_id`)) left join `librarian_address` `la` on(`l`.`librarian_id` = `la`.`librarian_id`)) on(`l`.`librarian_id` = `ll`.`librarian_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notification_librarian`
--

/*!50001 DROP VIEW IF EXISTS `notification_librarian`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `notification_librarian` AS select `ln2`.`notification_id` AS `notification_id`,`ui`.`fullname` AS `fullname`,`ln2`.`message` AS `message`,`ln2`.`notification_type` AS `notification_type`,date_format(`ln2`.`notification_date`,'%M %e, %Y') AS `notification_date`,`ln2`.`status` AS `status` from (`librarian_notifications` `ln2` join `user_info` `ui` on(`ui`.`user_id` = `ln2`.`user_id`)) order by date_format(`ln2`.`notification_date`,'%M %e, %Y') desc,case when `ln2`.`status` = 'unread' then 1 else 2 end */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `online_department`
--

/*!50001 DROP VIEW IF EXISTS `online_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `online_department` AS select `ui`.`department` AS `department`,`ll`.`status` AS `status`,date_format(`ll`.`date_login`,'%M %e, %Y') AS `date_login` from (`login_logs` `ll` join `user_info` `ui` on(`ui`.`user_id` = `ll`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `presonalize_recomendations_details`
--

/*!50001 DROP VIEW IF EXISTS `presonalize_recomendations_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `presonalize_recomendations_details` AS select `pr`.`recommendation_id` AS `recommendation_id`,`ui`.`user_id` AS `user_id`,`b`.`book_id` AS `book_id`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`bi`.`img_path` AS `img_path`,`b`.`title` AS `title`,`au`.`author_name` AS `author_name`,`b`.`total_checkedout` AS `total_checkedout`,`pr`.`recommendation_status` AS `recommendation_status` from ((((`personal_recommendations` `pr` left join `books` `b` on(`b`.`book_id` = `pr`.`recommended_book_id`)) left join `user_info` `ui` on(`ui`.`user_id` = `pr`.`user_id`)) left join `authors` `au` on(`au`.`author_id` = `b`.`author_id`)) left join `book_image` `bi` on(`bi`.`book_id` = `b`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recomendations_details`
--

/*!50001 DROP VIEW IF EXISTS `recomendations_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recomendations_details` AS select `ir`.`recommendation_id` AS `recommendation_id`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`b`.`title` AS `title`,`b`.`total_checkedout` AS `total_checkedout`,`ir`.`recommendation_status` AS `recommendation_status`,`ir`.`visibility` AS `visibility` from ((`instructor_recommendations` `ir` left join `books` `b` on(`b`.`book_id` = `ir`.`recommended_book_id`)) left join `user_info` `ui` on(`ui`.`user_id` = `ir`.`instructor_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `renewal_details`
--

/*!50001 DROP VIEW IF EXISTS `renewal_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `renewal_details` AS select `br`.`renewal_id` AS `renewal_id`,`bt`.`transaction_id` AS `transaction_id`,`ui`.`user_id` AS `user_id`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`b`.`title` AS `title`,`br`.`renewal_days` AS `renewal_days`,date_format(`bt`.`due_date`,'%M %e, %Y') AS `original_due_date`,date_format(`bt`.`due_date` + interval `br`.`renewal_days` day,'%M %e, %Y') AS `new_due_date`,`br`.`approval_status` AS `approval_status` from (((`book_renewals` `br` join `book_transactions` `bt` on(`br`.`transaction_id` = `bt`.`transaction_id`)) join `user_info` `ui` on(`bt`.`user_id` = `ui`.`user_id`)) join `books` `b` on(`bt`.`book_id` = `b`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transactions_book`
--

/*!50001 DROP VIEW IF EXISTS `transactions_book`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactions_book` AS select `bt`.`transaction_id` AS `transaction_id`,`bt`.`user_id` AS `user_id`,`b`.`title` AS `title`,`a`.`author_name` AS `author_name`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`bt`.`transaction_type` AS `transaction_type`,date_format(`bt`.`transaction_date`,'%M %e, %Y') AS `transaction_date`,date_format(`bt`.`due_date`,'%M %e, %Y') AS `due_date`,`bt`.`status` AS `status`,date_format(`bt`.`updated_at`,'%M %e, %Y') AS `last_date`,`bi`.`img_path` AS `img_path` from ((((`book_transactions` `bt` join `books` `b` on(`b`.`book_id` = `bt`.`book_id`)) join `user_info` `ui` on(`ui`.`user_id` = `bt`.`user_id`)) join `authors` `a` on(`a`.`author_id` = `b`.`author_id`)) join `book_image` `bi` on(`bi`.`book_id` = `bt`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transactions_pending`
--

/*!50001 DROP VIEW IF EXISTS `transactions_pending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactions_pending` AS select `pt`.`pending_transaction_id` AS `pending_transaction_id`,`pt`.`user_id` AS `user_id`,`b`.`title` AS `title`,`ui`.`fullname` AS `fullname`,`ui`.`department` AS `department`,`pt`.`transaction_type` AS `transaction_type`,`pt`.`status` AS `status`,date_format(`pt`.`request_date`,'%M %e, %Y') AS `request_date`,date_format(`pt`.`approve_date`,'%M %e, %Y') AS `approve_date`,`bi`.`img_path` AS `img_path` from (((`pending_transactions` `pt` join `books` `b` on(`b`.`book_id` = `pt`.`book_id`)) join `user_info` `ui` on(`ui`.`user_id` = `pt`.`user_id`)) join `book_image` `bi` on(`bi`.`book_id` = `pt`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_details`
--

/*!50001 DROP VIEW IF EXISTS `user_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_details` AS select `ui`.`user_id` AS `user_id`,`ui`.`fullname` AS `fullname`,`ui`.`id_number` AS `id_number`,`ui`.`department` AS `department`,`ul`.`email_address` AS `email_address`,`upp`.`img_path` AS `img_path`,`ui`.`user_status` AS `user_status`,date_format(`ui`.`created_at`,'%M %e, %Y') AS `created_at`,date_format(`ui`.`updated_at`,'%M %e, %Y') AS `updated_at`,sum(`faf`.`total_fines_and_fees`) AS `total_amount`,date_format(`ui`.`edited_at`,'%M %e, %Y') AS `edited_at` from (((`user_info` `ui` left join `user_login` `ul` on(`ui`.`user_id` = `ul`.`user_id`)) left join `user_profile_pic` `upp` on(`ui`.`user_id` = `upp`.`user_id`)) left join `fines_and_fees_summary` `faf` on(`faf`.`user_id` = `ui`.`user_id`)) group by `ui`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_notifications`
--

/*!50001 DROP VIEW IF EXISTS `user_notifications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_notifications` AS select `n`.`notification_id` AS `notification_id`,`n`.`user_id` AS `user_id`,`n`.`message` AS `message`,date_format(`n`.`creation_date`,'%M %e, %Y') AS `notification_date`,`n`.`status` AS `status` from `notifications` `n` order by `n`.`creation_date` desc,case when `n`.`status` = 'unread' then 1 else 2 end */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 11:41:36

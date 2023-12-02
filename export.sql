-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cpclibrary
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,POSTGRESQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "accession_no"
--

DROP TABLE IF EXISTS "accession_no";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "accession_no" (
  "accession_id" int(11) NOT NULL,
  "book_id" int(11) DEFAULT NULL,
  "accession_no" int(11) DEFAULT NULL,
  PRIMARY KEY ("accession_id"),
  UNIQUE KEY "accession_no" ("accession_no")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "accession_no"
--

LOCK TABLES "accession_no" WRITE;
/*!40000 ALTER TABLE "accession_no" DISABLE KEYS */;
INSERT INTO "accession_no" VALUES
(15586,4927,1981),
(15587,4927,1982),
(15588,4927,1983),
(15589,4928,1984),
(15590,4928,1985),
(15591,4928,1986),
(15592,4929,1987),
(15593,4929,1988),
(15594,4929,1989),
(15595,4930,1990),
(15596,4930,1991),
(15597,4930,1992),
(15598,4931,1993),
(15599,4931,1994),
(15600,4932,1995),
(15601,4932,1996),
(15602,4932,1997),
(15603,4933,1998),
(15604,4933,1999),
(15605,4933,2000),
(15606,4934,2001),
(15607,4934,2002),
(15608,4934,2003),
(15609,4935,2004),
(15610,4935,2005),
(15611,4935,2006),
(15612,4936,2007),
(15613,4937,2008),
(15614,4937,2009),
(15615,4938,2010);
/*!40000 ALTER TABLE "accession_no" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "authors"
--

DROP TABLE IF EXISTS "authors";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "authors" (
  "author_id" int(11) NOT NULL,
  "author_name" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("author_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "authors"
--

LOCK TABLES "authors" WRITE;
/*!40000 ALTER TABLE "authors" DISABLE KEYS */;
INSERT INTO "authors" VALUES
(1604,'zaide, gregorio f.'),
(1605,'ramos, ian dane d.'),
(1606,'bargo, darwin d.'),
(1607,'zaide, gregorio f.'),
(1608,'ceciliano - jose cruz'),
(1609,'de leon, hector s.'),
(1610,'bauzon, prisciliano t.'),
(1611,'reyes, dinia delfina s.'),
(1612,'reyes, edgardo a.'),
(1613,'tulio, doris d.'),
(1614,'tulio, doris d.'),
(1615,'tulio, doris d.');
/*!40000 ALTER TABLE "authors" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "book_acquisitions"
--

DROP TABLE IF EXISTS "book_acquisitions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_acquisitions" (
  "acquisition_id" int(11) NOT NULL,
  "accession_no" int(11) NOT NULL,
  "acquisition_date" date NOT NULL,
  "title" varchar(255) NOT NULL,
  "source" varchar(255) DEFAULT NULL,
  "cost" decimal(10,2) DEFAULT NULL,
  "book_condition" varchar(50) DEFAULT NULL,
  "notes" text DEFAULT NULL,
  PRIMARY KEY ("acquisition_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_acquisitions"
--

LOCK TABLES "book_acquisitions" WRITE;
/*!40000 ALTER TABLE "book_acquisitions" DISABLE KEYS */;
/*!40000 ALTER TABLE "book_acquisitions" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "book_author"
--

DROP TABLE IF EXISTS "book_author";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_author" (
  "accession_no" int(11) NOT NULL,
  "author_id" int(11) NOT NULL,
  PRIMARY KEY ("accession_no","author_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_author"
--

LOCK TABLES "book_author" WRITE;
/*!40000 ALTER TABLE "book_author" DISABLE KEYS */;
INSERT INTO "book_author" VALUES
(1981,1604),
(1984,1605),
(1987,1606),
(1990,1607),
(1993,1608),
(1995,1609),
(1998,1610),
(2001,1611),
(2004,1612),
(2007,1613),
(2008,1614),
(2010,1615);
/*!40000 ALTER TABLE "book_author" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "book_author_info"
--

DROP TABLE IF EXISTS "book_author_info";
/*!50001 DROP VIEW IF EXISTS "book_author_info"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "book_author_info" AS SELECT
 1 AS "author_id",
  1 AS "author_name",
  1 AS "title",
  1 AS "edition",
  1 AS "publisher_name",
  1 AS "copyright_yr" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "book_catalog"
--

DROP TABLE IF EXISTS "book_catalog";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_catalog" (
  "catalog_id" int(11) NOT NULL,
  "book_subject" varchar(255) NOT NULL,
  "ddc_code" varchar(10) NOT NULL,
  "accession_id" int(11) NOT NULL,
  "create_at" timestamp NULL DEFAULT current_timestamp(),
  "update_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("catalog_id"),
  UNIQUE KEY "accession_id" ("accession_id"),
  CONSTRAINT "book_catalog_ibfk_1" FOREIGN KEY ("accession_id") REFERENCES "accession_no" ("accession_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_catalog"
--

LOCK TABLES "book_catalog" WRITE;
/*!40000 ALTER TABLE "book_catalog" DISABLE KEYS */;
/*!40000 ALTER TABLE "book_catalog" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "book_catalog_info"
--

DROP TABLE IF EXISTS "book_catalog_info";
/*!50001 DROP VIEW IF EXISTS "book_catalog_info"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "book_catalog_info" AS SELECT
 1 AS "accession_no",
  1 AS "book_subject",
  1 AS "title",
  1 AS "ddc_code",
  1 AS "created" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "book_collections"
--

DROP TABLE IF EXISTS "book_collections";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_collections" (
  "collection_id" int(11) NOT NULL,
  "book_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "created_at" datetime DEFAULT current_timestamp(),
  PRIMARY KEY ("collection_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_collections"
--

LOCK TABLES "book_collections" WRITE;
/*!40000 ALTER TABLE "book_collections" DISABLE KEYS */;
/*!40000 ALTER TABLE "book_collections" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "book_image"
--

DROP TABLE IF EXISTS "book_image";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_image" (
  "img_id" int(11) NOT NULL,
  "book_id" int(11) NOT NULL,
  "img_path" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("img_id"),
  UNIQUE KEY "book_id" ("book_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_image"
--

LOCK TABLES "book_image" WRITE;
/*!40000 ALTER TABLE "book_image" DISABLE KEYS */;
INSERT INTO "book_image" VALUES
(4927,4927,'image-1701396489842.jpg'),
(4928,4928,''),
(4929,4929,''),
(4930,4930,''),
(4931,4931,''),
(4932,4932,''),
(4933,4933,''),
(4934,4934,''),
(4935,4935,''),
(4936,4936,''),
(4937,4937,''),
(4938,4938,'');
/*!40000 ALTER TABLE "book_image" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "book_info"
--

DROP TABLE IF EXISTS "book_info";
/*!50001 DROP VIEW IF EXISTS "book_info"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "book_info" AS SELECT
 1 AS "accession_id",
  1 AS "accession_no",
  1 AS "book_id",
  1 AS "date_received",
  1 AS "author_name",
  1 AS "title",
  1 AS "edition",
  1 AS "publisher_name",
  1 AS "cost_price",
  1 AS "copyright_yr",
  1 AS "remarks",
  1 AS "img_path",
  1 AS "total_checkedout",
  1 AS "updated_at" */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view "book_inventory"
--

DROP TABLE IF EXISTS "book_inventory";
/*!50001 DROP VIEW IF EXISTS "book_inventory"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "book_inventory" AS SELECT
 1 AS "book_id",
  1 AS "author_name",
  1 AS "title",
  1 AS "edition",
  1 AS "publisher_name",
  1 AS "cost_price",
  1 AS "copies",
  1 AS "borrowed_copies",
  1 AS "book_status",
  1 AS "img_path",
  1 AS "total_checkedout" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "book_publisher"
--

DROP TABLE IF EXISTS "book_publisher";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_publisher" (
  "accession_no" int(11) NOT NULL,
  "publisher_id" int(11) NOT NULL,
  PRIMARY KEY ("accession_no","publisher_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_publisher"
--

LOCK TABLES "book_publisher" WRITE;
/*!40000 ALTER TABLE "book_publisher" DISABLE KEYS */;
INSERT INTO "book_publisher" VALUES
(1981,1604),
(1984,1605),
(1987,1606),
(1990,1607),
(1993,1608),
(1995,1609),
(1998,1610),
(2001,1611),
(2004,1612),
(2007,1613),
(2008,1614),
(2010,1615);
/*!40000 ALTER TABLE "book_publisher" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "book_remarks"
--

DROP TABLE IF EXISTS "book_remarks";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_remarks" (
  "remark_id" int(11) NOT NULL,
  "accession_id" int(11) DEFAULT NULL,
  "remarks" text DEFAULT NULL,
  "book_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("remark_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_remarks"
--

LOCK TABLES "book_remarks" WRITE;
/*!40000 ALTER TABLE "book_remarks" DISABLE KEYS */;
INSERT INTO "book_remarks" VALUES
(15586,15586,'',4927),
(15587,15587,'',NULL),
(15588,15588,'',NULL),
(15589,15589,'',4928),
(15590,15590,'',NULL),
(15591,15591,'',NULL),
(15592,15592,'',4929),
(15593,15593,'',NULL),
(15594,15594,'',NULL),
(15595,15595,'',4930),
(15596,15596,'',NULL),
(15597,15597,'',NULL),
(15598,15598,'',4931),
(15599,15599,'',NULL),
(15600,15600,'',4932),
(15601,15601,'',NULL),
(15602,15602,'',NULL),
(15603,15603,'',4933),
(15604,15604,'',NULL),
(15605,15605,'',NULL),
(15606,15606,'',4934),
(15607,15607,'',NULL),
(15608,15608,'',NULL),
(15609,15609,'',4935),
(15610,15610,'',NULL),
(15611,15611,'',NULL),
(15612,15612,'',4936),
(15613,15613,'',4937),
(15614,15614,'',NULL),
(15615,15615,'',4938);
/*!40000 ALTER TABLE "book_remarks" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "book_renewals"
--

DROP TABLE IF EXISTS "book_renewals";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_renewals" (
  "renewal_id" int(11) NOT NULL,
  "transaction_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "renewal_days" int(11) NOT NULL,
  "requested_date" datetime DEFAULT NULL,
  "approval_status" enum('Approved','Cancelled','Pending') DEFAULT 'Pending',
  "updated_at" datetime DEFAULT current_timestamp(),
  PRIMARY KEY ("renewal_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_renewals"
--

LOCK TABLES "book_renewals" WRITE;
/*!40000 ALTER TABLE "book_renewals" DISABLE KEYS */;
INSERT INTO "book_renewals" VALUES
(9,32,7,1,'2023-11-30 12:13:28','Pending','2023-11-30 12:13:28');
/*!40000 ALTER TABLE "book_renewals" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "book_transactions"
--

DROP TABLE IF EXISTS "book_transactions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "book_transactions" (
  "transaction_id" int(11) NOT NULL,
  "book_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "transaction_type" enum('Borrowed','Returned','Checked In','Checked Out','Held','Reserved','Renewal') NOT NULL,
  "transaction_date" datetime NOT NULL,
  "due_date" datetime DEFAULT NULL,
  "status" enum('Active','Completed','Cancelled') NOT NULL,
  "updated_at" datetime NOT NULL DEFAULT current_timestamp(),
  "pending_transaction_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("transaction_id"),
  UNIQUE KEY "pending_transaction_id" ("pending_transaction_id"),
  KEY "book_id" ("book_id"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "book_transactions_ibfk_1" FOREIGN KEY ("book_id") REFERENCES "books" ("book_id"),
  CONSTRAINT "book_transactions_ibfk_2" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "book_transactions"
--

LOCK TABLES "book_transactions" WRITE;
/*!40000 ALTER TABLE "book_transactions" DISABLE KEYS */;
INSERT INTO "book_transactions" VALUES
(32,4928,7,'Returned','2023-11-29 03:25:14','2023-12-02 03:25:14','Completed','2023-11-29 03:25:14',87),
(33,4927,7,'Returned','2023-11-29 03:25:20','2023-12-02 03:25:20','Completed','2023-11-29 03:25:20',86),
(34,4930,7,'Returned','2023-11-29 03:49:42','2023-12-02 03:49:42','Completed','2023-11-29 03:49:42',89),
(35,4931,7,'Returned','2023-11-29 03:52:52','2023-12-02 03:52:52','Completed','2023-11-29 03:52:52',90),
(36,4932,7,'Returned','2023-11-29 03:54:36','2023-12-02 03:54:36','Completed','2023-11-29 03:54:36',91),
(37,4928,7,'Returned','2023-11-29 04:56:29','2023-12-02 04:56:29','Completed','2023-11-29 04:56:29',88),
(38,4930,6,'Returned','2023-11-29 04:56:29','2023-12-02 04:56:29','Completed','2023-11-29 04:56:29',92),
(39,4927,8,'Returned','2023-11-29 05:07:32','2023-12-02 05:07:32','Completed','2023-11-29 05:07:32',93),
(40,4928,8,'Returned','2023-11-29 05:07:32','2023-12-02 05:07:32','Completed','2023-11-29 05:07:32',94),
(41,4927,9,'Returned','2023-11-30 18:11:25','2023-12-02 01:11:25','Completed','2023-11-30 18:11:25',95),
(42,4929,9,'Returned','2023-11-30 18:11:25','2023-12-02 01:11:25','Completed','2023-11-30 18:11:25',96),
(43,4928,7,'Returned','2023-12-01 10:52:23','2023-12-01 10:53:23','Completed','2023-12-01 10:52:23',97),
(44,4927,9,'Returned','2023-12-01 11:38:58','2023-12-01 11:39:58','Completed','2023-12-01 11:38:58',98),
(45,4928,9,'Returned','2023-12-01 11:38:58','2023-12-01 11:39:58','Completed','2023-12-01 11:38:58',99),
(46,4930,8,'Returned','2023-12-01 13:40:23','2023-12-01 13:41:23','Completed','2023-12-01 13:40:23',100),
(47,4932,8,'Returned','2023-12-01 13:40:23','2023-12-01 13:41:23','Completed','2023-12-01 13:40:23',101);
/*!40000 ALTER TABLE "book_transactions" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "books"
--

DROP TABLE IF EXISTS "books";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "books" (
  "book_id" int(11) NOT NULL,
  "date_received" varchar(50) DEFAULT NULL,
  "title" varchar(255) DEFAULT NULL,
  "author_id" int(11) DEFAULT NULL,
  "edition" varchar(50) DEFAULT NULL,
  "publisher_id" int(11) DEFAULT NULL,
  "copyright_yr" varchar(50) DEFAULT NULL,
  "cost_price" float DEFAULT 0,
  "book_status" varchar(50) DEFAULT NULL,
  "total_checkedout" int(11) NOT NULL DEFAULT 0,
  "updated_at" timestamp NULL DEFAULT current_timestamp(),
  "created_at" timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("book_id"),
  UNIQUE KEY "title" ("title")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "books"
--

LOCK TABLES "books" WRITE;
/*!40000 ALTER TABLE "books" DISABLE KEYS */;
INSERT INTO "books" VALUES
(4927,'wed jun 08 2016','philippine history and government',1604,'6th',1604,'2014',0,'old',4,'2023-12-01 03:39:08','2023-11-30 04:20:29'),
(4928,'wed jun 08 2016','english 2: writing in the discipline',1605,'',1605,'2010',0,'old',5,'2023-12-01 03:39:13','2023-11-30 04:20:29'),
(4929,'wed jun 08 2016','effective college composition writing: communication arts 2',1606,'',1606,'2014',0,'old',1,'2023-11-30 10:14:03','2023-11-30 04:20:29'),
(4930,'wed jun 08 2016','jose rizal: life, works and writing of a genius, writer….',1607,'',1607,'2014',0,'old',3,'2023-12-01 06:47:54','2023-11-30 04:20:29'),
(4931,'wed jun 08 2016','campus journalism & school paper advising',1608,'2nd',1608,'2010',0,'old',1,'2023-11-29 08:33:13','2023-11-30 04:20:29'),
(4932,'wed jun 08 2016','constitution made simple',1609,'',1609,'2013',0,'old',2,'2023-12-01 06:47:58','2023-11-30 04:20:29'),
(4933,'wed jun 08 2016','logic for filipinos',1610,'3rd',1610,'2013',0,'old',0,'2023-11-28 18:43:24','2023-11-30 04:20:29'),
(4934,'wed jun 08 2016','world literature: literacy gems of the est and west',1611,'',1611,'2011',0,'old',0,'2023-11-28 18:43:24','2023-11-30 04:20:29'),
(4935,'wed jun 08 2016','plane trigonometry: simplified & integrated',1612,'',1612,'2012',0,'old',0,'2023-11-28 18:43:24','2023-11-30 04:20:29'),
(4936,'wed jun 08 2016','p.e. 4: sports',1613,'',1613,'2004',0,'new',0,'2023-11-28 18:43:24','2023-11-30 04:20:29'),
(4937,'wed jun 08 2016','',1614,'',1614,'2004',0,'old',0,'2023-11-28 18:43:24','2023-11-30 04:20:29'),
(4938,'wed jun 08 2016','p.e. 1: self- testing activites',1615,'',1615,'2005',0,'new',0,'2023-11-28 18:43:24','2023-11-30 04:20:29');
/*!40000 ALTER TABLE "books" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "collection_details"
--

DROP TABLE IF EXISTS "collection_details";
/*!50001 DROP VIEW IF EXISTS "collection_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "collection_details" AS SELECT
 1 AS "user_id",
  1 AS "collection_id",
  1 AS "book_id",
  1 AS "title",
  1 AS "author_name",
  1 AS "img_path" */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view "contribution_details"
--

DROP TABLE IF EXISTS "contribution_details";
/*!50001 DROP VIEW IF EXISTS "contribution_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "contribution_details" AS SELECT
 1 AS "contribution_id",
  1 AS "user_id",
  1 AS "author_fullname",
  1 AS "category_name",
  1 AS "publisher_name",
  1 AS "file_title",
  1 AS "file_path",
  1 AS "fullname",
  1 AS "department",
  1 AS "file_description",
  1 AS "uploaded_date",
  1 AS "file_total_downloads",
  1 AS "file_status" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "ebook"
--

DROP TABLE IF EXISTS "ebook";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "ebook" (
  "ebook_id" int(11) NOT NULL,
  "ebook_title" varchar(200) NOT NULL,
  "ebook_file" varchar(100) DEFAULT NULL,
  "date_added" date DEFAULT NULL,
  "ebook_status" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("ebook_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "ebook"
--

LOCK TABLES "ebook" WRITE;
/*!40000 ALTER TABLE "ebook" DISABLE KEYS */;
/*!40000 ALTER TABLE "ebook" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "fines_and_fees"
--

DROP TABLE IF EXISTS "fines_and_fees";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "fines_and_fees" (
  "fine_id" int(11) NOT NULL,
  "transaction_id" int(11) NOT NULL,
  "fine_amount" decimal(10,2) NOT NULL DEFAULT 0.00,
  "fine_type" enum('Late Return Fee','Damaged Book Fee','Lost Book Fee','Other') NOT NULL,
  "fine_date" datetime NOT NULL,
  "status" enum('Active','Paid') NOT NULL DEFAULT 'Active',
  PRIMARY KEY ("fine_id"),
  KEY "transaction_id" ("transaction_id"),
  CONSTRAINT "fines_and_fees_ibfk_1" FOREIGN KEY ("transaction_id") REFERENCES "book_transactions" ("transaction_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "fines_and_fees"
--

LOCK TABLES "fines_and_fees" WRITE;
/*!40000 ALTER TABLE "fines_and_fees" DISABLE KEYS */;
INSERT INTO "fines_and_fees" VALUES
(15,32,0.00,'Other','2023-11-29 03:26:04','Active'),
(16,33,0.00,'Other','2023-11-29 16:02:40','Active'),
(17,34,0.00,'Other','2023-11-29 16:33:09','Active'),
(18,35,0.00,'Other','2023-11-29 16:33:13','Active'),
(19,36,0.00,'Other','2023-11-29 16:33:16','Active'),
(20,37,0.00,'Other','2023-11-29 16:33:19','Active'),
(21,38,0.00,'Other','2023-11-29 16:33:22','Active'),
(22,39,0.00,'Other','2023-11-29 16:33:25','Active'),
(23,40,0.00,'Other','2023-11-29 16:33:29','Active'),
(24,41,0.00,'Other','2023-11-30 18:14:00','Active'),
(25,42,0.00,'Other','2023-11-30 18:14:03','Active'),
(26,43,0.00,'Other','2023-12-01 10:52:59','Active'),
(27,44,1054780.00,'Other','2023-12-01 11:39:08','Active'),
(28,45,1054780.00,'Other','2023-12-01 11:39:13','Active'),
(29,46,954155.00,'Other','2023-12-01 14:47:54','Active'),
(30,47,954155.00,'Other','2023-12-01 14:47:58','Active');
/*!40000 ALTER TABLE "fines_and_fees" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "fines_and_fees_summary"
--

DROP TABLE IF EXISTS "fines_and_fees_summary";
/*!50001 DROP VIEW IF EXISTS "fines_and_fees_summary"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "fines_and_fees_summary" AS SELECT
 1 AS "transaction_id",
  1 AS "user_id",
  1 AS "fullname",
  1 AS "department",
  1 AS "role",
  1 AS "title",
  1 AS "total_fines_and_fees",
  1 AS "status",
  1 AS "due_date",
  1 AS "fine_date" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "formats"
--

DROP TABLE IF EXISTS "formats";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "formats" (
  "format_id" int(11) NOT NULL,
  "format_label" varchar(50) NOT NULL,
  "added_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("format_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "formats"
--

LOCK TABLES "formats" WRITE;
/*!40000 ALTER TABLE "formats" DISABLE KEYS */;
/*!40000 ALTER TABLE "formats" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "instructor_recommendations"
--

DROP TABLE IF EXISTS "instructor_recommendations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "instructor_recommendations" (
  "recommendation_id" int(11) NOT NULL,
  "instructor_id" int(11) NOT NULL,
  "recommended_book_id" int(11) NOT NULL,
  "recommendation_date" datetime NOT NULL DEFAULT current_timestamp(),
  "recommendation_status" enum('active','removed') DEFAULT 'active',
  "visibility" enum('show','hide') DEFAULT 'hide',
  PRIMARY KEY ("recommendation_id"),
  KEY "instructor_id" ("instructor_id"),
  CONSTRAINT "instructor_recommendations_ibfk_1" FOREIGN KEY ("instructor_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "instructor_recommendations"
--

LOCK TABLES "instructor_recommendations" WRITE;
/*!40000 ALTER TABLE "instructor_recommendations" DISABLE KEYS */;
INSERT INTO "instructor_recommendations" VALUES
(14,6,4927,'2023-11-29 06:23:12','active','hide'),
(15,6,4928,'2023-11-29 07:08:39','active','hide'),
(16,6,4929,'2023-11-29 07:08:43','active','hide'),
(17,6,4930,'2023-11-29 07:08:47','active','hide'),
(18,6,4931,'2023-11-29 07:08:52','active','hide');
/*!40000 ALTER TABLE "instructor_recommendations" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "instructor_recommendations_details"
--

DROP TABLE IF EXISTS "instructor_recommendations_details";
/*!50001 DROP VIEW IF EXISTS "instructor_recommendations_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "instructor_recommendations_details" AS SELECT
 1 AS "recommendation_id",
  1 AS "user_id",
  1 AS "book_id",
  1 AS "fullname",
  1 AS "department",
  1 AS "img_path",
  1 AS "title",
  1 AS "author_name",
  1 AS "total_checkedout",
  1 AS "recommendation_status",
  1 AS "visibility" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "librarian"
--

DROP TABLE IF EXISTS "librarian";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "librarian" (
  "librarian_id" int(11) NOT NULL,
  "firstname" varchar(50) DEFAULT NULL,
  "middlename" varchar(50) DEFAULT NULL,
  "lastname" varchar(50) DEFAULT NULL,
  "create_at" timestamp NULL DEFAULT current_timestamp(),
  "updated_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("librarian_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "librarian"
--

LOCK TABLES "librarian" WRITE;
/*!40000 ALTER TABLE "librarian" DISABLE KEYS */;
INSERT INTO "librarian" VALUES
(1,'rachel','','delos reyes','2023-11-09 04:20:43','2023-11-09 04:20:43'),
(8,'lance phillip','berdon','descartin','2023-11-15 02:24:08','2023-11-15 02:24:08');
/*!40000 ALTER TABLE "librarian" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "librarian_address"
--

DROP TABLE IF EXISTS "librarian_address";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "librarian_address" (
  "address_id" int(11) NOT NULL,
  "librarian_id" int(11) DEFAULT NULL,
  "street_address" varchar(255) DEFAULT NULL,
  "city" varchar(255) DEFAULT NULL,
  "state_province_region" varchar(255) DEFAULT NULL,
  "postal_code" int(11) DEFAULT NULL,
  "address_type" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("address_id"),
  UNIQUE KEY "librarian_id" ("librarian_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "librarian_address"
--

LOCK TABLES "librarian_address" WRITE;
/*!40000 ALTER TABLE "librarian_address" DISABLE KEYS */;
INSERT INTO "librarian_address" VALUES
(1,1,'babag 2','lapu-lapu city','cebu',6015,'resedential'),
(8,8,'purok beauty inthe sky','lapu-lapu city','cebu',6015,'residential');
/*!40000 ALTER TABLE "librarian_address" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "librarian_details"
--

DROP TABLE IF EXISTS "librarian_details";
/*!50001 DROP VIEW IF EXISTS "librarian_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "librarian_details" AS SELECT
 1 AS "librarian_id",
  1 AS "firstname",
  1 AS "middlename",
  1 AS "lastname",
  1 AS "email_address",
  1 AS "phone_number",
  1 AS "hobbies",
  1 AS "description",
  1 AS "street_address",
  1 AS "city",
  1 AS "state_province_region",
  1 AS "postal_code",
  1 AS "address_type",
  1 AS "username",
  1 AS "privilege" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "librarian_info"
--

DROP TABLE IF EXISTS "librarian_info";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "librarian_info" (
  "info_id" int(11) NOT NULL,
  "librarian_id" int(11) DEFAULT NULL,
  "email_address" varchar(255) DEFAULT NULL,
  "phone_number" varchar(20) DEFAULT NULL,
  "hobbies" text DEFAULT NULL,
  "description" text DEFAULT NULL,
  PRIMARY KEY ("info_id"),
  UNIQUE KEY "librarian_id" ("librarian_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "librarian_info"
--

LOCK TABLES "librarian_info" WRITE;
/*!40000 ALTER TABLE "librarian_info" DISABLE KEYS */;
INSERT INTO "librarian_info" VALUES
(1,1,'rachel@gmail.com','0987456321','a book work and an otaku','cpc library head and a teacher'),
(8,8,'email@email.com','09874563212','coding and anime','nothing much');
/*!40000 ALTER TABLE "librarian_info" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "librarian_login"
--

DROP TABLE IF EXISTS "librarian_login";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "librarian_login" (
  "login_id" int(11) NOT NULL,
  "librarian_id" int(11) NOT NULL,
  "username" varchar(50) DEFAULT NULL,
  "password" varchar(250) DEFAULT NULL,
  "privilege" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("login_id"),
  UNIQUE KEY "username" ("username")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "librarian_login"
--

LOCK TABLES "librarian_login" WRITE;
/*!40000 ALTER TABLE "librarian_login" DISABLE KEYS */;
INSERT INTO "librarian_login" VALUES
(1,1,'rachel.admin','$2a$10$tYFEW2wyXkwQeW2I.6AhzOnbOc3xMFxG5viFt4xN9yS14MBsrrJia','admin'),
(8,8,'lance.tech','$2a$10$K8eBRAApCg/Xj2p1ZHR2a.RFe/Iz9kxi/6hiEsvB13THBwHkpWvxm','tech coordinator');
/*!40000 ALTER TABLE "librarian_login" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "librarian_login_logs"
--

DROP TABLE IF EXISTS "librarian_login_logs";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "librarian_login_logs" (
  "log_id" int(11) NOT NULL,
  "login_id" int(11) DEFAULT NULL,
  "login_date" timestamp NULL DEFAULT current_timestamp(),
  "status" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("log_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "librarian_login_logs"
--

LOCK TABLES "librarian_login_logs" WRITE;
/*!40000 ALTER TABLE "librarian_login_logs" DISABLE KEYS */;
INSERT INTO "librarian_login_logs" VALUES
(1,1,'2023-11-09 04:20:43','Created'),
(2,1,'2023-11-09 04:26:55','Success'),
(3,1,'2023-11-09 04:52:12','Failed'),
(4,1,'2023-11-09 04:52:16','Success'),
(5,1,'2023-11-09 05:33:31','Failed'),
(6,1,'2023-11-09 05:33:37','Success'),
(7,1,'2023-11-09 09:53:04','Failed'),
(8,1,'2023-11-09 09:53:09','Success'),
(9,1,'2023-11-09 09:53:33','Success'),
(10,1,'2023-11-09 10:21:40','Success'),
(11,1,'2023-11-09 10:30:46','Success'),
(12,1,'2023-11-09 11:04:46','Success'),
(13,1,'2023-11-09 11:05:52','Success'),
(14,1,'2023-11-09 11:08:01','Success'),
(15,1,'2023-11-09 11:08:46','Success'),
(16,1,'2023-11-09 11:09:32','Success'),
(17,1,'2023-11-09 11:11:58','Success'),
(18,1,'2023-11-09 11:13:30','Success'),
(19,1,'2023-11-09 11:14:45','Success'),
(20,1,'2023-11-09 11:24:00','Success'),
(21,1,'2023-11-09 11:59:43','Success'),
(22,1,'2023-11-09 12:24:47','Success'),
(23,1,'2023-11-09 12:35:07','Success'),
(24,1,'2023-11-09 12:46:13','Success'),
(25,1,'2023-11-09 12:51:46','Success'),
(26,1,'2023-11-09 12:58:00','Success'),
(27,1,'2023-11-09 13:23:36','Success'),
(28,1,'2023-11-09 13:26:36','Failed'),
(29,1,'2023-11-09 13:26:41','Success'),
(30,1,'2023-11-09 13:32:26','Success'),
(31,1,'2023-11-09 13:38:08','Success'),
(32,1,'2023-11-09 13:42:08','Success'),
(33,1,'2023-11-09 14:04:47','Success'),
(34,1,'2023-11-09 14:17:58','Success'),
(35,1,'2023-11-09 14:26:37','Success'),
(36,1,'2023-11-09 14:30:07','Success'),
(37,1,'2023-11-09 14:37:46','Success'),
(38,1,'2023-11-09 14:55:30','Success'),
(39,1,'2023-11-09 15:10:53','Success'),
(40,1,'2023-11-10 02:03:05','Success'),
(41,1,'2023-11-10 19:27:37','Success'),
(42,1,'2023-11-10 19:30:29','Success'),
(43,1,'2023-11-11 05:45:27','Success'),
(44,1,'2023-11-11 05:52:50','Success'),
(45,1,'2023-11-11 06:02:44','Success'),
(46,1,'2023-11-11 06:30:11','Success'),
(47,1,'2023-11-11 06:39:31','Success'),
(48,1,'2023-11-11 06:46:55','Success'),
(49,1,'2023-11-11 06:48:06','Success'),
(50,1,'2023-11-11 07:10:31','Success'),
(51,1,'2023-11-11 07:17:22','Success'),
(52,1,'2023-11-11 08:38:18','Success'),
(53,1,'2023-11-11 08:42:48','Success'),
(54,1,'2023-11-11 08:54:23','Success'),
(55,1,'2023-11-11 09:07:42','Success'),
(56,1,'2023-11-11 09:10:37','Success'),
(57,1,'2023-11-11 09:14:26','Success'),
(58,1,'2023-11-11 21:22:13','Success'),
(59,1,'2023-11-11 21:26:32','Success'),
(60,1,'2023-11-11 21:30:23','Success'),
(61,1,'2023-11-11 21:35:55','Success'),
(62,1,'2023-11-11 21:39:45','Success'),
(63,1,'2023-11-11 21:42:39','Success'),
(64,1,'2023-11-11 21:58:33','Success'),
(65,1,'2023-11-11 22:00:09','Success'),
(66,1,'2023-11-11 22:06:19','Success'),
(67,1,'2023-11-11 22:09:46','Success'),
(68,1,'2023-11-11 22:13:35','Success'),
(69,1,'2023-11-11 22:29:50','Success'),
(70,1,'2023-11-11 23:22:28','Success'),
(71,1,'2023-11-12 00:00:28','Success'),
(72,1,'2023-11-12 00:07:25','Success'),
(73,1,'2023-11-12 00:59:23','Success'),
(74,1,'2023-11-14 13:37:27','Success'),
(75,1,'2023-11-14 13:42:33','Success'),
(76,1,'2023-11-14 13:46:54','Success'),
(77,1,'2023-11-14 13:50:50','Success'),
(78,1,'2023-11-15 01:06:14','Success'),
(79,1,'2023-11-15 01:14:34','Success'),
(80,1,'2023-11-15 01:34:32','Success'),
(81,1,'2023-11-15 01:39:25','Success'),
(82,1,'2023-11-15 01:53:20','Success'),
(84,1,'2023-11-15 01:57:53','Success'),
(85,1,'2023-11-15 01:58:07','Success'),
(86,1,'2023-11-15 02:02:37','Success'),
(87,1,'2023-11-15 02:07:07','Success'),
(89,1,'2023-11-15 02:13:52','Success'),
(93,1,'2023-11-15 02:20:35','Success'),
(95,8,'2023-11-15 02:24:08','Created'),
(96,8,'2023-11-15 02:27:43','Success'),
(97,1,'2023-11-15 02:28:19','Success'),
(98,1,'2023-11-15 03:31:08','Success'),
(99,1,'2023-11-15 07:19:29','Success'),
(100,1,'2023-11-16 03:05:52','Success'),
(101,1,'2023-11-16 03:31:07','Success'),
(102,1,'2023-11-16 07:25:38','Success'),
(103,1,'2023-11-16 07:28:05','Success'),
(104,1,'2023-11-16 07:34:31','Failed'),
(105,1,'2023-11-16 07:34:35','Success'),
(106,1,'2023-11-16 07:42:36','Success'),
(107,1,'2023-11-16 11:43:43','Success'),
(108,1,'2023-11-16 11:56:01','Success'),
(109,1,'2023-11-16 12:03:43','Success'),
(110,1,'2023-11-16 12:13:06','Success'),
(111,1,'2023-11-16 12:18:01','Success'),
(112,1,'2023-11-16 12:22:02','Success'),
(113,1,'2023-11-16 12:27:49','Failed'),
(114,1,'2023-11-16 12:27:52','Success'),
(115,1,'2023-11-16 12:39:58','Success'),
(116,1,'2023-11-16 13:34:18','Success'),
(117,1,'2023-11-16 13:38:29','Success'),
(118,1,'2023-11-16 13:46:07','Failed'),
(119,1,'2023-11-16 13:46:09','Success'),
(120,1,'2023-11-16 13:52:43','Success'),
(121,1,'2023-11-16 13:55:48','Success'),
(122,1,'2023-11-16 14:04:55','Success'),
(123,1,'2023-11-16 14:08:24','Success'),
(124,1,'2023-11-16 14:14:33','Success'),
(125,1,'2023-11-16 14:15:31','Success'),
(126,1,'2023-11-16 14:19:21','Failed'),
(127,1,'2023-11-16 14:19:27','Success'),
(128,1,'2023-11-16 14:54:53','Success'),
(129,1,'2023-11-16 15:09:22','Success'),
(130,1,'2023-11-16 15:13:18','Success'),
(131,1,'2023-11-16 15:20:15','Success'),
(132,1,'2023-11-16 15:21:42','Success'),
(133,1,'2023-11-16 15:31:30','Success'),
(134,1,'2023-11-16 15:33:29','Success'),
(135,1,'2023-11-16 15:39:39','Success'),
(136,1,'2023-11-16 15:42:19','Success'),
(137,1,'2023-11-16 16:06:37','Success'),
(138,1,'2023-11-18 10:47:35','Success'),
(139,1,'2023-11-18 11:50:42','Success'),
(140,1,'2023-11-18 11:54:41','Success'),
(141,1,'2023-11-18 13:21:37','Success'),
(142,1,'2023-11-18 13:24:08','Success'),
(143,1,'2023-11-18 13:26:52','Success'),
(144,1,'2023-11-18 13:28:01','Success'),
(145,1,'2023-11-18 13:28:35','Success'),
(146,1,'2023-11-18 13:32:20','Success'),
(147,1,'2023-11-18 13:33:11','Success'),
(148,1,'2023-11-18 13:36:47','Success'),
(149,1,'2023-11-18 14:07:07','Success'),
(150,1,'2023-11-18 14:08:51','Success'),
(151,1,'2023-11-18 14:52:09','Success'),
(152,1,'2023-11-18 15:14:36','Success'),
(153,1,'2023-11-18 15:18:19','Success'),
(154,1,'2023-11-18 15:20:17','Success'),
(155,1,'2023-11-18 15:23:03','Success'),
(156,1,'2023-11-18 15:24:55','Success'),
(157,1,'2023-11-18 15:26:29','Success'),
(158,1,'2023-11-18 15:32:55','Failed'),
(159,1,'2023-11-18 15:32:58','Success'),
(160,1,'2023-11-18 15:36:19','Success'),
(161,1,'2023-11-18 15:43:40','Success'),
(162,1,'2023-11-18 15:45:17','Success'),
(163,1,'2023-11-18 15:46:01','Success'),
(164,1,'2023-11-18 15:52:19','Success'),
(165,1,'2023-11-18 16:04:38','Success'),
(166,1,'2023-11-18 16:08:43','Success'),
(167,1,'2023-11-20 13:22:09','Success'),
(168,1,'2023-11-20 13:28:22','Success'),
(169,1,'2023-11-21 07:58:19','Success'),
(170,1,'2023-11-21 07:59:29','Failed'),
(171,1,'2023-11-21 07:59:33','Success'),
(172,1,'2023-11-21 08:04:26','Success'),
(173,1,'2023-11-21 08:06:35','Success'),
(174,1,'2023-11-21 08:08:50','Success'),
(175,1,'2023-11-21 08:12:32','Success'),
(176,1,'2023-11-21 08:45:21','Success'),
(177,1,'2023-11-21 08:54:25','Success'),
(178,1,'2023-11-21 09:08:22','Success'),
(179,1,'2023-11-21 09:30:31','Success'),
(180,1,'2023-11-21 17:48:42','Success'),
(181,1,'2023-11-22 02:38:30','Success'),
(182,1,'2023-11-22 04:47:58','Success'),
(183,1,'2023-11-22 10:37:02','Success'),
(184,1,'2023-11-22 13:03:07','Success'),
(185,1,'2023-11-22 13:39:42','Success'),
(186,1,'2023-11-22 13:42:52','Success'),
(187,1,'2023-11-22 14:46:13','Success'),
(188,1,'2023-11-22 14:53:07','Success'),
(189,1,'2023-11-22 20:50:46','Success'),
(190,1,'2023-11-22 20:59:57','Success'),
(191,1,'2023-11-22 21:13:11','Success'),
(192,1,'2023-11-22 21:22:58','Success'),
(193,1,'2023-11-22 21:25:09','Success'),
(194,1,'2023-11-22 21:44:59','Success'),
(195,1,'2023-11-22 22:15:17','Success'),
(196,1,'2023-11-22 22:15:53','Success'),
(197,1,'2023-11-24 02:26:08','Success'),
(198,1,'2023-11-24 03:15:32','Success'),
(199,1,'2023-11-24 04:59:10','Success'),
(200,1,'2023-11-24 05:00:29','Success'),
(201,1,'2023-11-24 05:43:36','Success'),
(202,1,'2023-11-24 05:47:30','Success'),
(203,1,'2023-11-24 05:48:29','Success'),
(204,1,'2023-11-24 05:50:04','Success'),
(205,1,'2023-11-24 05:51:02','Success'),
(206,1,'2023-11-24 05:52:11','Success'),
(207,1,'2023-11-24 05:53:38','Success'),
(208,1,'2023-11-24 05:55:13','Success'),
(209,1,'2023-11-24 13:11:29','Success'),
(210,1,'2023-11-24 21:47:35','Success'),
(211,1,'2023-11-24 23:58:40','Success'),
(212,1,'2023-11-24 23:58:58','Success'),
(213,1,'2023-11-24 23:59:44','Success'),
(214,1,'2023-11-25 00:02:06','Success'),
(215,1,'2023-11-25 00:07:34','Success'),
(216,1,'2023-11-25 00:12:50','Success'),
(217,1,'2023-11-25 01:25:51','Success'),
(218,1,'2023-11-25 01:26:49','Success'),
(219,1,'2023-11-25 01:38:45','Success'),
(220,1,'2023-11-25 04:59:55','Success'),
(221,1,'2023-11-25 05:06:38','Success'),
(222,1,'2023-11-25 05:10:45','Success'),
(223,1,'2023-11-25 05:12:31','Success'),
(224,1,'2023-11-25 05:13:53','Success'),
(225,1,'2023-11-25 05:33:25','Success'),
(226,1,'2023-11-25 05:38:27','Success'),
(227,1,'2023-11-25 05:40:02','Success'),
(228,1,'2023-11-25 05:40:32','Success'),
(229,1,'2023-11-25 05:41:01','Success'),
(230,1,'2023-11-25 05:41:53','Success'),
(231,1,'2023-11-25 05:42:49','Success'),
(232,1,'2023-11-25 05:43:57','Success'),
(233,1,'2023-11-25 05:44:32','Success'),
(234,1,'2023-11-25 05:46:25','Success'),
(235,1,'2023-11-25 06:12:49','Success'),
(236,1,'2023-11-25 06:25:23','Success'),
(237,1,'2023-11-25 06:29:27','Failed'),
(238,1,'2023-11-25 06:29:31','Success'),
(239,1,'2023-11-25 06:44:07','Success'),
(240,1,'2023-11-25 06:50:08','Success'),
(241,1,'2023-11-25 06:55:27','Success'),
(242,1,'2023-11-25 07:24:09','Success'),
(243,1,'2023-11-25 07:28:40','Success'),
(244,1,'2023-11-25 23:51:17','Success'),
(245,1,'2023-11-26 01:25:04','Success'),
(246,1,'2023-11-26 01:47:35','Success'),
(247,1,'2023-11-26 01:52:03','Success'),
(248,1,'2023-11-26 02:02:33','Success'),
(249,1,'2023-11-26 02:06:00','Success'),
(250,1,'2023-11-26 02:08:15','Success'),
(251,1,'2023-11-26 02:10:21','Success'),
(252,1,'2023-11-26 02:12:49','Success'),
(253,1,'2023-11-26 02:16:06','Success'),
(254,1,'2023-11-26 04:00:25','Success'),
(255,1,'2023-11-26 05:40:35','Success'),
(256,1,'2023-11-26 06:30:33','Success'),
(257,1,'2023-11-26 06:31:28','Success'),
(258,1,'2023-11-26 06:32:00','Success'),
(259,1,'2023-11-26 07:11:46','Success'),
(260,1,'2023-11-26 07:13:50','Success'),
(261,1,'2023-11-26 10:32:48','Success'),
(262,1,'2023-11-26 10:34:09','Success'),
(263,1,'2023-11-26 11:02:18','Success'),
(264,1,'2023-11-26 12:07:40','Success'),
(265,1,'2023-11-26 12:11:38','Success'),
(266,1,'2023-11-26 12:12:27','Success'),
(267,1,'2023-11-26 12:15:33','Success'),
(268,1,'2023-11-26 12:16:37','Success'),
(269,1,'2023-11-26 12:16:56','Success'),
(270,1,'2023-11-26 12:17:24','Success'),
(271,1,'2023-11-26 12:17:34','Success'),
(272,1,'2023-11-26 12:23:33','Success'),
(273,1,'2023-11-26 12:24:48','Success'),
(274,1,'2023-11-26 13:18:28','Success'),
(275,1,'2023-11-26 13:18:43','Success'),
(276,1,'2023-11-26 13:18:59','Success'),
(277,1,'2023-11-26 13:19:24','Success'),
(278,1,'2023-11-26 13:19:52','Success'),
(279,1,'2023-11-26 13:20:43','Success'),
(280,1,'2023-11-26 14:17:10','Success'),
(281,1,'2023-11-26 14:18:04','Success'),
(282,1,'2023-11-26 14:18:21','Success'),
(283,1,'2023-11-26 14:19:13','Success'),
(284,1,'2023-11-26 14:19:44','Success'),
(285,1,'2023-11-26 14:20:28','Success'),
(286,1,'2023-11-26 14:21:05','Success'),
(287,1,'2023-11-26 14:36:50','Failed'),
(288,1,'2023-11-26 14:37:07','Failed'),
(289,1,'2023-11-26 14:37:31','Success'),
(290,1,'2023-11-26 14:42:09','Success'),
(291,1,'2023-11-26 14:45:20','Success'),
(292,1,'2023-11-26 14:45:56','Success'),
(293,1,'2023-11-26 14:47:44','Success'),
(294,1,'2023-11-26 14:48:01','Success'),
(295,1,'2023-11-26 14:48:20','Success'),
(296,1,'2023-11-26 14:48:40','Success'),
(297,1,'2023-11-26 14:54:18','Success'),
(298,1,'2023-11-26 14:56:04','Failed'),
(299,1,'2023-11-26 14:57:34','Failed'),
(300,1,'2023-11-26 14:58:09','Failed'),
(301,1,'2023-11-26 15:00:04','Success'),
(302,1,'2023-11-26 15:01:19','Success'),
(303,1,'2023-11-26 15:01:38','Failed'),
(304,1,'2023-11-26 15:01:54','Success'),
(305,1,'2023-11-26 15:02:33','Failed'),
(306,1,'2023-11-26 15:02:38','Success'),
(307,1,'2023-11-26 17:20:38','Success'),
(308,1,'2023-11-26 17:33:56','Success'),
(309,1,'2023-11-26 17:43:00','Success'),
(310,1,'2023-11-26 17:46:01','Success'),
(311,1,'2023-11-26 17:51:31','Success'),
(312,1,'2023-11-26 18:00:47','Success'),
(313,1,'2023-11-26 18:08:12','Success'),
(314,1,'2023-11-26 18:09:42','Success'),
(315,1,'2023-11-26 18:10:50','Failed'),
(316,1,'2023-11-26 18:11:00','Success'),
(317,1,'2023-11-26 18:20:19','Success'),
(318,1,'2023-11-26 18:24:59','Success'),
(319,1,'2023-11-27 00:01:12','Success'),
(320,1,'2023-11-27 00:47:10','Success'),
(321,1,'2023-11-27 00:48:29','Success'),
(322,1,'2023-11-27 00:49:22','Success'),
(323,1,'2023-11-27 00:58:23','Success'),
(324,1,'2023-11-27 01:01:19','Failed'),
(325,1,'2023-11-27 01:01:26','Success'),
(326,1,'2023-11-27 01:12:27','Success'),
(327,1,'2023-11-27 01:16:02','Success'),
(328,1,'2023-11-27 01:18:33','Success'),
(329,1,'2023-11-27 01:23:27','Success'),
(330,1,'2023-11-27 01:25:25','Success'),
(331,1,'2023-11-27 01:28:20','Success'),
(332,1,'2023-11-27 01:29:36','Success'),
(333,1,'2023-11-27 01:34:45','Success'),
(334,1,'2023-11-27 01:37:21','Success'),
(335,1,'2023-11-27 01:38:06','Success'),
(336,1,'2023-11-27 01:43:14','Success'),
(337,1,'2023-11-27 01:44:42','Success'),
(338,1,'2023-11-27 02:01:06','Success'),
(339,1,'2023-11-27 02:03:17','Success'),
(340,1,'2023-11-27 02:07:27','Success'),
(341,1,'2023-11-27 02:11:32','Success'),
(342,1,'2023-11-27 02:12:53','Success'),
(343,1,'2023-11-27 02:17:07','Success'),
(344,1,'2023-11-27 02:19:27','Success'),
(345,1,'2023-11-27 02:33:02','Success'),
(346,1,'2023-11-27 02:38:24','Failed'),
(347,1,'2023-11-27 02:38:33','Success'),
(348,1,'2023-11-27 02:44:42','Success'),
(349,1,'2023-11-27 02:47:47','Success'),
(350,1,'2023-11-27 02:51:26','Success'),
(351,1,'2023-11-27 02:52:05','Success'),
(352,1,'2023-11-27 02:59:51','Success'),
(353,1,'2023-11-27 03:07:55','Success'),
(354,1,'2023-11-27 03:11:38','Success'),
(355,1,'2023-11-27 03:16:25','Success'),
(356,1,'2023-11-27 03:58:37','Success'),
(357,1,'2023-11-27 03:59:43','Success'),
(358,1,'2023-11-28 01:50:19','Success'),
(359,1,'2023-11-28 01:52:16','Success'),
(360,1,'2023-11-28 01:54:29','Failed'),
(361,1,'2023-11-28 01:54:36','Success'),
(362,1,'2023-11-28 02:02:35','Success'),
(363,1,'2023-11-28 02:05:43','Success'),
(364,1,'2023-11-28 02:09:34','Success'),
(365,1,'2023-11-28 02:12:28','Success'),
(366,1,'2023-11-28 02:14:33','Success'),
(367,1,'2023-11-28 02:25:56','Success'),
(368,1,'2023-11-28 02:41:14','Success'),
(369,8,'2023-11-28 03:06:08','Failed'),
(370,8,'2023-11-28 03:06:16','Success'),
(371,1,'2023-11-28 03:14:23','Success'),
(372,1,'2023-11-28 04:28:13','Success'),
(373,1,'2023-11-28 05:19:41','Success'),
(374,1,'2023-11-28 09:33:15','Success'),
(375,1,'2023-11-28 09:34:23','Success'),
(376,1,'2023-11-28 12:25:16','Success'),
(377,1,'2023-11-28 12:26:46','Success'),
(378,1,'2023-11-28 12:40:01','Success'),
(379,1,'2023-11-28 12:45:17','Success'),
(380,1,'2023-11-28 12:49:52','Success'),
(381,1,'2023-11-28 12:56:07','Success'),
(382,1,'2023-11-28 13:01:36','Success'),
(383,1,'2023-11-28 13:13:57','Success'),
(384,1,'2023-11-28 13:57:53','Success'),
(385,1,'2023-11-28 15:53:48','Success'),
(386,1,'2023-11-28 16:01:41','Success'),
(387,1,'2023-11-28 16:33:22','Success'),
(388,1,'2023-11-28 16:59:53','Success'),
(389,1,'2023-11-28 17:17:02','Success'),
(390,1,'2023-11-28 17:21:02','Success'),
(391,1,'2023-11-28 17:31:53','Success'),
(392,1,'2023-11-28 17:34:11','Success'),
(393,1,'2023-11-28 17:36:00','Success'),
(394,1,'2023-11-28 17:38:57','Success'),
(395,1,'2023-11-28 17:40:23','Success'),
(396,1,'2023-11-28 17:45:26','Success'),
(397,1,'2023-11-28 17:55:19','Success'),
(398,1,'2023-11-28 17:59:17','Success'),
(399,1,'2023-11-28 18:16:18','Failed'),
(400,1,'2023-11-28 18:16:25','Success'),
(401,1,'2023-11-28 18:25:14','Success'),
(402,1,'2023-11-28 18:29:17','Success'),
(403,1,'2023-11-28 18:31:14','Success'),
(404,1,'2023-11-28 18:33:11','Success'),
(405,1,'2023-11-28 18:35:15','Failed'),
(406,1,'2023-11-28 18:35:22','Success'),
(407,1,'2023-11-28 18:40:25','Success'),
(408,1,'2023-11-28 18:43:47','Success'),
(409,1,'2023-11-28 19:25:04','Success'),
(410,1,'2023-11-28 19:48:41','Success'),
(411,1,'2023-11-28 19:49:30','Success'),
(412,1,'2023-11-28 19:52:41','Success'),
(413,1,'2023-11-28 19:54:25','Success'),
(414,1,'2023-11-28 19:57:19','Success'),
(415,1,'2023-11-28 20:49:36','Success'),
(416,1,'2023-11-28 21:07:14','Success'),
(417,1,'2023-11-28 21:11:08','Success'),
(418,1,'2023-11-29 00:15:51','Success'),
(419,1,'2023-11-29 07:53:11','Success'),
(420,1,'2023-11-29 08:02:07','Success'),
(421,1,'2023-11-29 08:31:15','Success'),
(422,1,'2023-11-29 13:34:13','Success'),
(423,1,'2023-11-29 13:35:27','Success'),
(424,1,'2023-11-29 14:12:25','Success'),
(425,1,'2023-11-29 14:18:06','Success'),
(426,1,'2023-11-29 14:20:41','Success'),
(427,1,'2023-11-29 14:35:11','Success'),
(428,1,'2023-11-29 17:01:41','Success'),
(429,1,'2023-11-30 01:10:33','Success'),
(430,1,'2023-11-30 01:28:03','Success'),
(431,1,'2023-11-30 01:32:03','Success'),
(432,1,'2023-11-30 02:10:00','Success'),
(433,1,'2023-11-30 02:51:24','Success'),
(434,1,'2023-11-30 03:54:10','Success'),
(435,1,'2023-11-30 05:45:01','Success'),
(436,1,'2023-11-30 14:05:14','Success'),
(437,1,'2023-11-30 14:22:49','Success'),
(438,1,'2023-12-01 01:32:40','Success'),
(439,1,'2023-12-01 03:37:00','Success'),
(440,1,'2023-12-01 03:40:39','Failed'),
(441,1,'2023-12-01 03:40:45','Success'),
(442,1,'2023-12-01 03:42:16','Success'),
(443,1,'2023-12-01 03:44:04','Success'),
(444,1,'2023-12-01 05:40:38','Failed'),
(445,1,'2023-12-01 05:40:44','Success'),
(446,1,'2023-12-01 16:29:05','Success'),
(447,1,'2023-12-02 00:49:54','Success'),
(448,1,'2023-12-02 01:26:41','Success'),
(449,1,'2023-12-02 04:28:43','Success');
/*!40000 ALTER TABLE "librarian_login_logs" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "librarian_notifications"
--

DROP TABLE IF EXISTS "librarian_notifications";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "librarian_notifications" (
  "notification_id" int(11) NOT NULL,
  "user_id" int(11) DEFAULT NULL,
  "message" text NOT NULL,
  "notification_type" enum('Approved','Overdue','Cancelled','Available','Reserved','Checked In','Checked Out','Borrowed','Held','Contribution','Renewal') DEFAULT NULL,
  "notification_date" datetime NOT NULL,
  "status" enum('unread','read') NOT NULL DEFAULT 'unread',
  PRIMARY KEY ("notification_id"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "librarian_notifications_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "librarian_notifications"
--

LOCK TABLES "librarian_notifications" WRITE;
/*!40000 ALTER TABLE "librarian_notifications" DISABLE KEYS */;
INSERT INTO "librarian_notifications" VALUES
(107,6,'An eBook the invisible man contributed by jeffrey c. alerta  on November 28, 2023','Contribution','2023-11-28 23:52:54','read'),
(108,6,'An eBook autobiography of benjamin franklin contributed by jeffrey c. alerta  on November 29, 2023','Contribution','2023-11-29 00:35:33','read'),
(109,6,'An eBook the lady tanglewood contributed by jeffrey c. alerta  on November 29, 2023','Contribution','2023-11-29 00:40:34','read'),
(110,6,'An eBook dirt dealers contributed by jeffrey c. alerta  on November 29, 2023','Contribution','2023-11-29 00:42:48','read'),
(111,7,'The book philippine history and government has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:24:44','read'),
(112,7,'The book english 2: writing in the discipline has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:24:53','read'),
(113,7,'The book english 2: writing in the discipline has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:29:13','read'),
(114,7,'The book jose rizal: life, works and writing of a genius, writer…. has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:49:14','read'),
(115,7,'The book campus journalism & school paper advising has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:52:25','read'),
(116,7,'The book constitution made simple has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:54:01','read'),
(117,6,'The book jose rizal: life, works and writing of a genius, writer…. has been borrowed on November 29, 2023','Borrowed','2023-11-29 03:57:05','read'),
(118,8,'The book philippine history and government has been reserved on November 29, 2023','Reserved','2023-11-29 05:06:19','read'),
(119,8,'The book english 2: writing in the discipline has been reserved on November 29, 2023','Reserved','2023-11-29 05:06:30','read'),
(120,7,'Requesting for renewal of english 2: writing in the discipline book for 1 days on November 30, 2023','Renewal','2023-11-30 12:13:28','read'),
(121,9,'The book philippine history and government has been borrowed on November 30, 2023','Borrowed','2023-11-30 18:10:22','read'),
(122,9,'The book effective college composition writing: communication arts 2 has been borrowed on November 30, 2023','Borrowed','2023-11-30 18:10:39','read'),
(123,7,'The book english 2: writing in the discipline has been borrowed on December 1, 2023','Borrowed','2023-12-01 10:51:18','read'),
(124,9,'The book philippine history and government has been borrowed on December 1, 2023','Borrowed','2023-12-01 11:37:50','read'),
(125,9,'The book english 2: writing in the discipline has been borrowed on December 1, 2023','Borrowed','2023-12-01 11:37:57','read'),
(126,8,'The book jose rizal: life, works and writing of a genius, writer…. has been borrowed on December 1, 2023','Borrowed','2023-12-01 12:04:22','read'),
(127,8,'The book constitution made simple has been borrowed on December 1, 2023','Borrowed','2023-12-01 12:04:31','read'),
(128,8,'The book logic for filipinos has been borrowed on December 1, 2023','Borrowed','2023-12-01 14:52:27','read'),
(129,8,'The book p.e. 4: sports has been borrowed on December 1, 2023','Borrowed','2023-12-01 14:52:58','read'),
(130,9,'The book world literature: literacy gems of the est and west has been borrowed on December 1, 2023','Borrowed','2023-12-01 14:53:23','read'),
(131,9,'The book logic for filipinos has been borrowed on December 1, 2023','Borrowed','2023-12-01 15:15:24','read');
/*!40000 ALTER TABLE "librarian_notifications" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "list_contents"
--

DROP TABLE IF EXISTS "list_contents";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "list_contents" (
  "content_id" int(11) NOT NULL,
  "list_id" int(11) NOT NULL,
  "book_id" int(11) NOT NULL,
  "added_at" timestamp NULL DEFAULT current_timestamp(),
  "content_status" tinyint(1) DEFAULT 0,
  PRIMARY KEY ("content_id"),
  KEY "list_id" ("list_id"),
  KEY "book_id" ("book_id"),
  CONSTRAINT "list_contents_ibfk_1" FOREIGN KEY ("list_id") REFERENCES "user_lists" ("list_id"),
  CONSTRAINT "list_contents_ibfk_2" FOREIGN KEY ("book_id") REFERENCES "books" ("book_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "list_contents"
--

LOCK TABLES "list_contents" WRITE;
/*!40000 ALTER TABLE "list_contents" DISABLE KEYS */;
/*!40000 ALTER TABLE "list_contents" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "login_logs"
--

DROP TABLE IF EXISTS "login_logs";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "login_logs" (
  "log_id" int(11) NOT NULL,
  "user_id" int(11) DEFAULT NULL,
  "status" varchar(20) DEFAULT NULL,
  "date_login" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("log_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "login_logs"
--

LOCK TABLES "login_logs" WRITE;
/*!40000 ALTER TABLE "login_logs" DISABLE KEYS */;
INSERT INTO "login_logs" VALUES
(1,1,'created','2023-11-09 09:50:57'),
(2,1,'Success','2023-11-09 09:51:05'),
(3,1,'Success','2023-11-09 10:53:24'),
(4,1,'Success','2023-11-10 02:02:47'),
(5,1,'Success','2023-11-10 02:36:00'),
(6,1,'Success','2023-11-10 02:37:53'),
(7,1,'Success','2023-11-10 02:41:28'),
(8,1,'Success','2023-11-10 02:44:33'),
(9,1,'Success','2023-11-10 02:46:15'),
(10,1,'Success','2023-11-10 02:46:30'),
(11,1,'Success','2023-11-10 02:46:44'),
(12,1,'Success','2023-11-10 02:50:14'),
(13,1,'Success','2023-11-10 02:51:49'),
(14,1,'Success','2023-11-10 02:52:17'),
(15,1,'Success','2023-11-10 02:52:44'),
(16,1,'Success','2023-11-10 02:55:06'),
(17,1,'Success','2023-11-10 02:56:52'),
(18,1,'Success','2023-11-10 02:59:45'),
(19,1,'Success','2023-11-10 03:01:45'),
(20,1,'Success','2023-11-10 03:12:57'),
(21,1,'Success','2023-11-10 03:24:32'),
(22,1,'Success','2023-11-10 03:29:48'),
(23,1,'Success','2023-11-10 03:37:28'),
(24,1,'Success','2023-11-10 03:40:41'),
(25,1,'Success','2023-11-10 06:06:02'),
(26,1,'Success','2023-11-10 06:10:47'),
(27,1,'Success','2023-11-10 06:19:27'),
(28,1,'Success','2023-11-10 06:22:36'),
(29,1,'Success','2023-11-10 06:29:20'),
(30,1,'Success','2023-11-10 06:36:18'),
(31,1,'Success','2023-11-10 06:52:23'),
(32,1,'Success','2023-11-10 07:02:57'),
(33,1,'Success','2023-11-10 07:09:00'),
(34,1,'Success','2023-11-10 07:15:17'),
(35,1,'Success','2023-11-10 13:11:28'),
(36,1,'Success','2023-11-10 13:32:45'),
(37,1,'Success','2023-11-10 13:44:54'),
(38,1,'Success','2023-11-10 13:55:02'),
(39,1,'Success','2023-11-10 14:00:09'),
(40,1,'Success','2023-11-10 14:05:47'),
(41,1,'Success','2023-11-10 14:41:37'),
(42,1,'Success','2023-11-10 14:47:34'),
(43,1,'Success','2023-11-10 14:53:45'),
(44,1,'Success','2023-11-10 14:58:57'),
(45,1,'Success','2023-11-10 15:07:05'),
(46,1,'Success','2023-11-10 15:12:17'),
(47,1,'Success','2023-11-10 15:38:30'),
(48,1,'Success','2023-11-10 15:44:04'),
(49,1,'Success','2023-11-10 15:50:23'),
(50,1,'Success','2023-11-10 16:03:26'),
(51,1,'Success','2023-11-10 16:11:17'),
(52,1,'Success','2023-11-10 16:11:58'),
(53,1,'Success','2023-11-10 16:35:43'),
(54,1,'Success','2023-11-10 16:59:22'),
(55,1,'Success','2023-11-10 17:07:23'),
(56,1,'Success','2023-11-10 17:19:09'),
(57,1,'Success','2023-11-10 17:48:38'),
(58,1,'Success','2023-11-10 17:52:54'),
(59,1,'Success','2023-11-10 18:03:02'),
(60,1,'Success','2023-11-10 18:12:14'),
(61,1,'Success','2023-11-10 18:19:42'),
(62,1,'Success','2023-11-10 18:27:27'),
(63,1,'Success','2023-11-10 19:00:29'),
(64,1,'Success','2023-11-10 19:24:57'),
(65,1,'Success','2023-11-11 03:33:54'),
(66,1,'Success','2023-11-11 03:44:31'),
(67,1,'Success','2023-11-11 03:54:46'),
(68,1,'Success','2023-11-11 04:02:15'),
(69,1,'Success','2023-11-11 04:08:16'),
(70,1,'Success','2023-11-11 04:14:10'),
(71,1,'Success','2023-11-11 04:21:43'),
(72,1,'Success','2023-11-11 04:35:36'),
(73,1,'Success','2023-11-11 04:42:31'),
(74,1,'Success','2023-11-11 04:50:09'),
(75,1,'Success','2023-11-11 04:57:59'),
(76,1,'Success','2023-11-11 08:48:40'),
(77,1,'Success','2023-11-11 09:06:42'),
(78,1,'Success','2023-11-11 09:13:48'),
(79,1,'Success','2023-11-11 09:20:59'),
(80,1,'Success','2023-11-12 00:59:06'),
(81,1,'Success','2023-11-14 10:15:15'),
(82,1,'Success','2023-11-14 10:38:45'),
(83,1,'Success','2023-11-14 10:47:05'),
(84,1,'Success','2023-11-14 10:57:12'),
(85,1,'Success','2023-11-14 11:09:15'),
(86,1,'Success','2023-11-14 11:15:52'),
(87,1,'Success','2023-11-14 12:27:22'),
(88,1,'Success','2023-11-14 12:40:25'),
(89,1,'Success','2023-11-14 12:55:16'),
(90,1,'Success','2023-11-14 13:07:50'),
(91,1,'Success','2023-11-14 13:16:02'),
(92,1,'Success','2023-11-14 13:26:20'),
(93,1,'Success','2023-11-14 13:26:31'),
(94,1,'Success','2023-11-14 13:32:37'),
(95,1,'Success','2023-11-14 13:53:55'),
(96,1,'Success','2023-11-14 14:06:28'),
(97,1,'Success','2023-11-14 14:11:40'),
(98,1,'Success','2023-11-15 01:11:22'),
(99,1,'Success','2023-11-15 01:24:35'),
(100,1,'Success','2023-11-15 01:26:42'),
(101,1,'Success','2023-11-15 01:54:49'),
(102,1,'Success','2023-11-15 12:39:21'),
(103,1,'Success','2023-11-15 12:59:37'),
(104,1,'Success','2023-11-15 13:05:12'),
(105,1,'Success','2023-11-15 13:16:40'),
(106,1,'Success','2023-11-15 13:33:54'),
(107,1,'Success','2023-11-15 13:40:59'),
(108,1,'Success','2023-11-15 13:46:17'),
(109,1,'Success','2023-11-15 13:51:40'),
(110,1,'Success','2023-11-15 13:57:17'),
(111,1,'Success','2023-11-15 14:12:03'),
(112,1,'Success','2023-11-15 14:19:24'),
(113,1,'Success','2023-11-15 14:25:12'),
(114,1,'Success','2023-11-15 14:27:49'),
(115,1,'Success','2023-11-15 14:33:00'),
(116,1,'Success','2023-11-15 14:34:31'),
(117,1,'Success','2023-11-15 14:37:35'),
(118,1,'Success','2023-11-15 14:39:45'),
(119,1,'Success','2023-11-15 14:42:18'),
(120,1,'Success','2023-11-15 14:44:50'),
(121,1,'Success','2023-11-15 14:49:56'),
(122,1,'Success','2023-11-15 15:00:39'),
(123,1,'Success','2023-11-15 15:06:40'),
(124,1,'Success','2023-11-15 15:07:49'),
(125,1,'Success','2023-11-15 15:12:07'),
(126,1,'Success','2023-11-15 15:17:46'),
(127,1,'Success','2023-11-15 15:21:37'),
(128,1,'Success','2023-11-15 15:43:51'),
(129,1,'Success','2023-11-15 15:55:44'),
(130,1,'Success','2023-11-15 15:56:48'),
(131,1,'Success','2023-11-15 15:58:27'),
(132,1,'Success','2023-11-15 16:00:19'),
(133,1,'Success','2023-11-16 14:58:13'),
(134,1,'Success','2023-11-16 15:04:10'),
(135,1,'Success','2023-11-16 15:22:56'),
(136,1,'Success','2023-11-16 15:30:18'),
(137,1,'Success','2023-11-16 15:34:05'),
(138,1,'Success','2023-11-16 15:41:53'),
(139,1,'Success','2023-11-16 15:42:56'),
(140,1,'Success','2023-11-16 16:35:14'),
(141,1,'Success','2023-11-16 16:43:14'),
(142,1,'Success','2023-11-16 16:43:31'),
(143,1,'Success','2023-11-16 16:50:39'),
(144,1,'Success','2023-11-16 16:58:49'),
(145,1,'Success','2023-11-17 02:07:29'),
(146,1,'Success','2023-11-17 02:09:07'),
(147,1,'Success','2023-11-17 02:37:34'),
(148,1,'Success','2023-11-17 02:44:05'),
(149,1,'Success','2023-11-17 02:51:36'),
(150,1,'Success','2023-11-17 09:59:36'),
(151,1,'Success','2023-11-18 02:10:41'),
(152,1,'Success','2023-11-18 02:43:15'),
(153,1,'Success','2023-11-18 02:58:59'),
(154,1,'Success','2023-11-18 04:29:49'),
(155,1,'Success','2023-11-18 04:37:41'),
(156,1,'Success','2023-11-18 04:43:58'),
(157,1,'Success','2023-11-18 04:50:51'),
(158,1,'Success','2023-11-18 04:59:09'),
(159,1,'Success','2023-11-18 05:11:24'),
(160,1,'Success','2023-11-18 05:18:58'),
(161,1,'Success','2023-11-18 09:54:51'),
(162,1,'Success','2023-11-18 11:24:27'),
(163,2,'created','2023-11-18 16:57:50'),
(164,2,'Success','2023-11-18 16:57:58'),
(165,1,'Success','2023-11-18 17:14:14'),
(166,1,'Success','2023-11-18 18:00:41'),
(167,1,'Success','2023-11-18 18:02:08'),
(168,2,'Success','2023-11-18 18:02:34'),
(169,1,'Success','2023-11-18 18:15:26'),
(170,1,'Success','2023-11-18 18:19:54'),
(171,1,'Success','2023-11-18 18:32:41'),
(172,1,'Success','2023-11-18 18:37:58'),
(173,1,'Success','2023-11-18 18:41:52'),
(174,1,'Success','2023-11-20 00:02:40'),
(175,1,'Success','2023-11-20 00:06:12'),
(176,1,'Success','2023-11-20 00:42:13'),
(177,1,'Success','2023-11-20 01:04:32'),
(178,1,'Success','2023-11-20 04:29:34'),
(179,1,'Success','2023-11-20 04:39:36'),
(180,1,'Success','2023-11-20 04:42:56'),
(181,1,'Success','2023-11-20 04:44:09'),
(182,1,'Success','2023-11-20 04:47:56'),
(183,1,'Success','2023-11-20 04:59:31'),
(184,1,'Success','2023-11-20 06:03:33'),
(185,1,'Success','2023-11-20 06:04:01'),
(186,1,'Success','2023-11-20 06:05:29'),
(187,1,'Success','2023-11-20 09:36:32'),
(188,1,'Success','2023-11-20 09:57:31'),
(189,1,'Success','2023-11-20 10:11:14'),
(190,1,'Success','2023-11-20 10:21:54'),
(191,1,'Success','2023-11-20 10:36:51'),
(192,1,'Success','2023-11-20 12:45:03'),
(193,1,'Success','2023-11-20 13:03:31'),
(194,3,'created','2023-11-20 13:29:49'),
(195,3,'Success','2023-11-20 13:29:57'),
(196,3,'Success','2023-11-20 13:31:27'),
(197,3,'Success','2023-11-20 13:32:50'),
(198,1,'Success','2023-11-20 13:35:57'),
(199,3,'Success','2023-11-20 13:43:17'),
(200,3,'Success','2023-11-20 13:45:46'),
(201,4,'created','2023-11-20 13:52:55'),
(202,4,'Success','2023-11-20 13:53:03'),
(203,1,'Success','2023-11-21 01:14:36'),
(204,1,'Success','2023-11-21 01:18:35'),
(205,1,'Success','2023-11-21 01:20:29'),
(206,3,'Success','2023-11-21 01:20:42'),
(207,3,'Success','2023-11-21 01:21:05'),
(208,3,'Success','2023-11-21 01:23:26'),
(209,1,'Success','2023-11-21 01:23:32'),
(210,1,'Success','2023-11-21 01:28:12'),
(211,3,'Success','2023-11-21 01:28:40'),
(212,3,'Success','2023-11-21 01:28:59'),
(213,3,'Success','2023-11-21 01:31:37'),
(214,1,'Success','2023-11-21 01:32:47'),
(215,3,'Success','2023-11-21 01:33:17'),
(216,1,'Success','2023-11-21 01:35:48'),
(217,1,'Success','2023-11-21 01:36:55'),
(218,1,'Success','2023-11-21 01:38:01'),
(219,3,'Success','2023-11-21 01:38:45'),
(220,4,'Success','2023-11-21 01:38:58'),
(221,1,'Success','2023-11-21 01:42:26'),
(222,1,'Success','2023-11-21 03:46:20'),
(223,1,'Success','2023-11-21 03:51:50'),
(224,1,'Success','2023-11-21 03:56:53'),
(225,1,'Success','2023-11-21 03:59:03'),
(226,2,'Success','2023-11-21 03:59:29'),
(227,1,'Success','2023-11-21 04:04:23'),
(228,1,'Success','2023-11-21 04:26:12'),
(229,5,'created','2023-11-21 04:51:38'),
(230,5,'Success','2023-11-21 04:51:48'),
(231,1,'Success','2023-11-21 04:52:28'),
(232,1,'Success','2023-11-21 05:17:38'),
(233,1,'Success','2023-11-21 05:20:44'),
(234,1,'Success','2023-11-21 06:46:25'),
(235,1,'Success','2023-11-21 06:49:02'),
(236,1,'Success','2023-11-21 06:57:19'),
(237,1,'Success','2023-11-21 06:57:26'),
(238,1,'Success','2023-11-21 06:57:32'),
(239,1,'Success','2023-11-21 06:59:29'),
(240,1,'Success','2023-11-21 07:00:26'),
(241,1,'Success','2023-11-21 07:06:34'),
(242,1,'Success','2023-11-21 07:06:56'),
(243,1,'Success','2023-11-21 07:10:53'),
(244,1,'Success','2023-11-21 07:12:13'),
(245,1,'Success','2023-11-21 07:14:57'),
(246,1,'Success','2023-11-21 07:16:28'),
(247,1,'Success','2023-11-21 07:19:32'),
(248,1,'Success','2023-11-21 07:26:30'),
(249,1,'Success','2023-11-21 07:28:53'),
(250,1,'Success','2023-11-21 07:30:57'),
(251,1,'Success','2023-11-21 07:33:22'),
(252,1,'Success','2023-11-21 07:36:04'),
(253,1,'Success','2023-11-21 07:37:57'),
(254,1,'Success','2023-11-21 07:43:48'),
(255,1,'Success','2023-11-21 07:44:55'),
(256,1,'Success','2023-11-21 07:50:03'),
(257,1,'Success','2023-11-21 07:56:51'),
(258,1,'Success','2023-11-21 07:58:45'),
(259,1,'Success','2023-11-21 08:55:35'),
(260,1,'Success','2023-11-21 08:59:22'),
(261,1,'Success','2023-11-21 08:59:50'),
(262,1,'Success','2023-11-21 09:00:24'),
(263,2,'Success','2023-11-21 09:00:42'),
(264,1,'Success','2023-11-21 12:10:38'),
(265,1,'Success','2023-11-21 12:21:41'),
(266,1,'Success','2023-11-21 12:26:35'),
(267,1,'Success','2023-11-21 12:28:02'),
(268,1,'Success','2023-11-21 12:29:13'),
(269,1,'Success','2023-11-21 12:32:01'),
(270,1,'Success','2023-11-21 12:40:11'),
(271,1,'Success','2023-11-21 12:46:46'),
(272,1,'Success','2023-11-21 12:50:15'),
(273,1,'Success','2023-11-21 12:58:10'),
(274,1,'Success','2023-11-21 13:04:39'),
(275,1,'Success','2023-11-21 13:10:44'),
(276,1,'Success','2023-11-22 02:35:20'),
(277,1,'Success','2023-11-22 03:03:31'),
(278,1,'Success','2023-11-22 04:03:46'),
(279,2,'Success','2023-11-22 04:13:19'),
(280,1,'Success','2023-11-22 04:52:43'),
(281,2,'Success','2023-11-22 05:03:53'),
(282,2,'Success','2023-11-22 05:49:25'),
(283,2,'Success','2023-11-22 10:00:16'),
(284,1,'Success','2023-11-22 10:06:00'),
(285,2,'Success','2023-11-22 10:06:26'),
(286,2,'Success','2023-11-22 10:13:39'),
(287,1,'Success','2023-11-22 10:15:57'),
(288,2,'Success','2023-11-22 10:16:06'),
(289,2,'Success','2023-11-22 10:19:21'),
(290,1,'Success','2023-11-22 10:36:39'),
(291,1,'Success','2023-11-22 10:37:49'),
(292,1,'Success','2023-11-22 10:40:54'),
(293,2,'Success','2023-11-22 11:12:26'),
(294,2,'Success','2023-11-22 11:39:42'),
(295,2,'Success','2023-11-22 11:41:58'),
(296,2,'Success','2023-11-22 11:55:45'),
(297,2,'Success','2023-11-22 12:27:16'),
(298,2,'Success','2023-11-22 12:32:50'),
(299,1,'Success','2023-11-22 12:41:37'),
(300,1,'Success','2023-11-22 12:47:09'),
(301,1,'Success','2023-11-22 12:55:30'),
(302,1,'Success','2023-11-22 13:00:38'),
(303,1,'Success','2023-11-22 13:07:57'),
(304,1,'Success','2023-11-22 13:09:42'),
(305,1,'Success','2023-11-22 13:10:13'),
(306,1,'Success','2023-11-22 13:12:00'),
(307,1,'Success','2023-11-22 13:18:50'),
(308,1,'Success','2023-11-22 13:23:56'),
(309,1,'Success','2023-11-22 13:31:45'),
(310,1,'Success','2023-11-22 13:37:22'),
(311,1,'Success','2023-11-22 13:43:19'),
(312,1,'Success','2023-11-22 13:43:58'),
(313,1,'Success','2023-11-22 13:47:09'),
(314,1,'Success','2023-11-22 13:52:47'),
(315,1,'Success','2023-11-22 14:01:31'),
(316,1,'Success','2023-11-22 14:06:01'),
(317,1,'Success','2023-11-22 14:14:24'),
(318,1,'Success','2023-11-22 14:14:34'),
(319,1,'Success','2023-11-22 14:15:23'),
(320,1,'Success','2023-11-22 14:15:57'),
(321,2,'Success','2023-11-22 14:19:08'),
(322,1,'Success','2023-11-22 14:30:28'),
(323,1,'Success','2023-11-22 14:31:46'),
(324,1,'Success','2023-11-22 14:34:38'),
(325,1,'Success','2023-11-22 14:44:14'),
(326,1,'Success','2023-11-22 14:45:51'),
(327,1,'Success','2023-11-22 14:46:37'),
(328,1,'Success','2023-11-22 14:48:11'),
(329,1,'Success','2023-11-22 14:51:43'),
(330,1,'Success','2023-11-22 14:53:19'),
(331,1,'Success','2023-11-22 14:56:50'),
(332,1,'Success','2023-11-22 20:46:32'),
(333,1,'Success','2023-11-22 20:47:25'),
(334,1,'Success','2023-11-22 20:50:15'),
(335,1,'Success','2023-11-22 20:51:04'),
(336,1,'Success','2023-11-22 20:52:14'),
(337,1,'Success','2023-11-22 20:53:29'),
(338,1,'Success','2023-11-22 20:54:23'),
(339,1,'Success','2023-11-22 20:58:31'),
(340,1,'Success','2023-11-22 20:59:37'),
(341,1,'Success','2023-11-22 21:00:23'),
(342,1,'Success','2023-11-22 21:01:55'),
(343,1,'Success','2023-11-22 21:04:08'),
(344,1,'Success','2023-11-22 21:07:14'),
(345,1,'Success','2023-11-22 21:12:28'),
(346,1,'Success','2023-11-22 21:13:33'),
(347,1,'Success','2023-11-22 21:14:21'),
(348,1,'Success','2023-11-22 21:21:46'),
(349,1,'Success','2023-11-22 21:23:36'),
(350,1,'Success','2023-11-22 21:25:20'),
(351,1,'Success','2023-11-22 21:30:09'),
(352,1,'Success','2023-11-22 21:30:58'),
(353,2,'Success','2023-11-22 21:32:56'),
(354,1,'Success','2023-11-22 21:43:21'),
(355,2,'Success','2023-11-22 21:43:35'),
(356,1,'Success','2023-11-22 21:44:41'),
(357,1,'Success','2023-11-22 22:12:00'),
(358,1,'Success','2023-11-22 22:17:38'),
(359,1,'Success','2023-11-22 22:23:08'),
(360,1,'Success','2023-11-23 14:55:12'),
(361,2,'Success','2023-11-24 02:06:56'),
(362,1,'Success','2023-11-24 02:07:46'),
(363,1,'Success','2023-11-24 02:13:53'),
(364,1,'Success','2023-11-24 03:05:43'),
(365,1,'Success','2023-11-24 03:37:08'),
(366,1,'Success','2023-11-24 03:43:47'),
(367,1,'Success','2023-11-24 03:59:13'),
(368,1,'Success','2023-11-24 04:00:49'),
(369,1,'Success','2023-11-24 04:04:25'),
(370,1,'Success','2023-11-24 05:00:22'),
(371,2,'Success','2023-11-24 05:39:51'),
(372,1,'Success','2023-11-24 05:41:33'),
(373,1,'Success','2023-11-24 05:44:10'),
(374,1,'Success','2023-11-24 05:45:45'),
(375,1,'Success','2023-11-24 05:55:45'),
(376,1,'Success','2023-11-24 05:59:11'),
(377,1,'Success','2023-11-24 06:01:15'),
(378,1,'Success','2023-11-24 12:33:18'),
(379,1,'Success','2023-11-24 12:35:22'),
(380,1,'Success','2023-11-24 12:56:57'),
(381,1,'Success','2023-11-24 13:10:38'),
(382,1,'Success','2023-11-24 13:12:34'),
(383,1,'Success','2023-11-24 13:17:18'),
(384,1,'Success','2023-11-24 13:22:01'),
(385,1,'Success','2023-11-24 13:31:35'),
(386,1,'Success','2023-11-24 13:36:08'),
(387,1,'Success','2023-11-24 13:42:39'),
(388,1,'Success','2023-11-24 13:49:46'),
(389,1,'Success','2023-11-25 00:49:57'),
(390,1,'Success','2023-11-25 00:50:18'),
(391,1,'Success','2023-11-25 00:56:04'),
(392,1,'Success','2023-11-25 00:57:10'),
(393,1,'Success','2023-11-25 01:06:02'),
(394,1,'Success','2023-11-25 01:06:28'),
(395,1,'Success','2023-11-25 01:07:51'),
(396,1,'Success','2023-11-25 23:25:06'),
(397,1,'Success','2023-11-26 03:15:16'),
(398,1,'Success','2023-11-26 03:28:03'),
(399,1,'Success','2023-11-26 03:55:02'),
(400,1,'Success','2023-11-26 03:59:42'),
(401,1,'Success','2023-11-26 04:02:08'),
(402,1,'Success','2023-11-26 04:45:22'),
(403,1,'Success','2023-11-26 04:49:37'),
(404,1,'Success','2023-11-26 04:54:19'),
(405,1,'Success','2023-11-26 05:09:11'),
(406,1,'Success','2023-11-26 05:15:06'),
(407,1,'Success','2023-11-26 05:18:00'),
(408,1,'Success','2023-11-26 06:32:37'),
(409,1,'Success','2023-11-26 06:34:16'),
(410,1,'Success','2023-11-26 07:09:12'),
(411,1,'Success','2023-11-26 10:15:40'),
(412,1,'Success','2023-11-26 10:27:19'),
(413,1,'Success','2023-11-26 10:29:48'),
(414,1,'Success','2023-11-26 10:31:50'),
(415,1,'Success','2023-11-26 10:32:11'),
(416,1,'Success','2023-11-26 10:32:23'),
(417,1,'Success','2023-11-26 12:18:03'),
(418,1,'Success','2023-11-26 12:21:06'),
(419,1,'Success','2023-11-26 12:25:24'),
(420,1,'Success','2023-11-26 12:31:45'),
(421,1,'Success','2023-11-26 12:35:22'),
(422,1,'Success','2023-11-26 12:43:37'),
(423,1,'Success','2023-11-26 12:50:22'),
(424,1,'Success','2023-11-26 12:55:54'),
(425,1,'Success','2023-11-26 13:01:30'),
(426,1,'Success','2023-11-26 13:03:00'),
(427,1,'Success','2023-11-26 13:05:19'),
(428,1,'Success','2023-11-26 13:17:28'),
(429,1,'Success','2023-11-26 13:17:51'),
(430,1,'Success','2023-11-26 13:21:20'),
(431,1,'Success','2023-11-26 14:01:23'),
(432,1,'Success','2023-11-26 14:01:39'),
(433,1,'Success','2023-11-26 14:07:09'),
(434,1,'Success','2023-11-26 15:29:04'),
(435,1,'Success','2023-11-26 15:30:10'),
(436,1,'Success','2023-11-26 15:30:30'),
(437,1,'Success','2023-11-26 16:12:34'),
(438,1,'Success','2023-11-26 16:19:32'),
(439,1,'Success','2023-11-26 16:23:44'),
(440,1,'Success','2023-11-26 16:26:25'),
(441,1,'Success','2023-11-26 16:31:17'),
(442,1,'Success','2023-11-26 16:32:30'),
(443,1,'Success','2023-11-26 16:35:03'),
(444,1,'Success','2023-11-26 16:36:50'),
(445,1,'Success','2023-11-26 16:43:12'),
(446,1,'Success','2023-11-26 16:46:44'),
(447,1,'Success','2023-11-26 16:47:48'),
(448,1,'Success','2023-11-26 16:52:20'),
(449,1,'Success','2023-11-26 17:01:27'),
(450,1,'Success','2023-11-26 17:06:23'),
(451,1,'Success','2023-11-26 17:58:42'),
(452,1,'Success','2023-11-26 17:59:50'),
(453,1,'Success','2023-11-26 18:08:45'),
(454,2,'Success','2023-11-26 18:21:41'),
(455,3,'Success','2023-11-26 18:26:54'),
(456,3,'Success','2023-11-26 18:28:00'),
(457,1,'Success','2023-11-26 18:35:20'),
(458,3,'Success','2023-11-26 18:35:54'),
(459,1,'Success','2023-11-26 18:40:31'),
(460,3,'Success','2023-11-26 18:40:45'),
(461,1,'Success','2023-11-26 18:41:15'),
(462,2,'Success','2023-11-26 18:41:29'),
(463,3,'Success','2023-11-26 18:42:38'),
(464,2,'Success','2023-11-26 18:44:04'),
(465,2,'Success','2023-11-26 18:44:32'),
(466,1,'Success','2023-11-26 18:47:27'),
(467,1,'Success','2023-11-26 23:59:57'),
(468,3,'Success','2023-11-27 00:00:17'),
(469,3,'Success','2023-11-27 00:00:47'),
(470,2,'Success','2023-11-27 00:02:14'),
(471,1,'Success','2023-11-27 00:07:47'),
(472,2,'Success','2023-11-27 00:08:18'),
(473,2,'Success','2023-11-27 00:09:55'),
(474,1,'Success','2023-11-27 00:17:20'),
(475,1,'Success','2023-11-27 00:20:43'),
(476,1,'Success','2023-11-27 00:21:37'),
(477,2,'Success','2023-11-27 00:22:16'),
(478,1,'Success','2023-11-27 00:25:10'),
(479,2,'Success','2023-11-27 00:25:32'),
(480,1,'Success','2023-11-27 00:27:25'),
(481,2,'Success','2023-11-27 00:27:42'),
(482,3,'Success','2023-11-27 00:29:47'),
(483,1,'Success','2023-11-27 01:21:12'),
(484,1,'Success','2023-11-27 01:27:22'),
(485,1,'Success','2023-11-27 01:45:17'),
(486,1,'Success','2023-11-27 01:47:30'),
(487,1,'Success','2023-11-27 01:53:54'),
(488,2,'Success','2023-11-27 01:59:18'),
(489,1,'Success','2023-11-27 02:20:29'),
(490,1,'Success','2023-11-27 02:31:28'),
(491,1,'Success','2023-11-27 02:34:35'),
(492,1,'Success','2023-11-27 02:36:56'),
(493,2,'Success','2023-11-27 02:44:01'),
(494,2,'Success','2023-11-27 02:44:21'),
(495,2,'Success','2023-11-27 02:46:56'),
(496,3,'Success','2023-11-27 02:51:43'),
(497,3,'Success','2023-11-27 02:58:59'),
(498,2,'Success','2023-11-27 03:07:28'),
(499,2,'Success','2023-11-27 03:13:28'),
(500,2,'Success','2023-11-27 03:16:44'),
(501,2,'Success','2023-11-27 03:20:25'),
(502,2,'Success','2023-11-27 03:23:50'),
(503,2,'Success','2023-11-27 03:26:15'),
(504,2,'Success','2023-11-27 03:26:37'),
(505,2,'Success','2023-11-27 03:38:38'),
(506,2,'Success','2023-11-27 03:41:20'),
(507,2,'Success','2023-11-27 03:52:28'),
(508,2,'Success','2023-11-27 03:55:39'),
(509,1,'Success','2023-11-27 03:58:04'),
(510,1,'Success','2023-11-27 03:59:06'),
(511,1,'Success','2023-11-27 04:02:34'),
(512,1,'Success','2023-11-27 06:57:50'),
(513,1,'Success','2023-11-28 01:52:24'),
(514,1,'Success','2023-11-28 01:53:46'),
(515,1,'Success','2023-11-28 01:55:24'),
(516,1,'Success','2023-11-28 01:59:46'),
(517,1,'Success','2023-11-28 02:02:17'),
(518,1,'Success','2023-11-28 02:03:13'),
(519,1,'Success','2023-11-28 02:04:43'),
(520,1,'Success','2023-11-28 02:06:38'),
(521,1,'Success','2023-11-28 02:12:14'),
(522,1,'Success','2023-11-28 02:19:30'),
(523,1,'Success','2023-11-28 02:22:35'),
(524,1,'Success','2023-11-28 02:24:13'),
(525,1,'Success','2023-11-28 02:26:38'),
(526,1,'Success','2023-11-28 02:40:57'),
(527,1,'Success','2023-11-28 03:06:20'),
(528,1,'Success','2023-11-28 03:13:17'),
(529,1,'Success','2023-11-28 03:19:21'),
(530,1,'Success','2023-11-28 03:21:39'),
(531,1,'Success','2023-11-28 03:23:03'),
(532,6,'created','2023-11-28 12:23:12'),
(533,6,'Success','2023-11-28 12:23:26'),
(534,6,'Success','2023-11-28 12:26:35'),
(535,7,'created','2023-11-28 12:31:22'),
(536,7,'Success','2023-11-28 12:31:37'),
(537,8,'created','2023-11-28 12:37:34'),
(538,9,'created','2023-11-28 12:38:17'),
(539,10,'created','2023-11-28 12:39:07'),
(540,11,'created','2023-11-28 12:39:45'),
(541,6,'Success','2023-11-28 12:49:41'),
(542,6,'Success','2023-11-28 14:10:35'),
(543,6,'Success','2023-11-28 14:38:36'),
(544,6,'Success','2023-11-28 15:47:26'),
(545,6,'Success','2023-11-28 16:04:20'),
(546,6,'Success','2023-11-28 16:28:02'),
(547,6,'Success','2023-11-28 16:34:15'),
(548,6,'Success','2023-11-28 19:22:13'),
(549,7,'Success','2023-11-28 19:22:25'),
(550,7,'Success','2023-11-28 19:28:37'),
(551,7,'Success','2023-11-28 19:42:07'),
(552,7,'Success','2023-11-28 19:49:05'),
(553,7,'Success','2023-11-28 19:52:14'),
(554,7,'Success','2023-11-28 19:53:54'),
(555,6,'Success','2023-11-28 19:56:48'),
(556,8,'Failed','2023-11-28 21:05:42'),
(557,8,'Failed','2023-11-28 21:05:54'),
(558,8,'Failed','2023-11-28 21:06:00'),
(559,8,'Success','2023-11-28 21:06:08'),
(560,9,'Failed','2023-11-28 21:07:56'),
(561,9,'Success','2023-11-28 21:08:03'),
(562,7,'Success','2023-11-28 21:22:44'),
(563,7,'Success','2023-11-28 21:43:20'),
(564,7,'Success','2023-11-28 21:44:23'),
(565,7,'Success','2023-11-28 21:50:58'),
(566,7,'Success','2023-11-28 21:51:37'),
(567,6,'Success','2023-11-28 22:23:08'),
(568,7,'Success','2023-11-28 22:25:40'),
(569,6,'Success','2023-11-28 23:08:34'),
(570,7,'Success','2023-11-28 23:09:11'),
(571,7,'Success','2023-11-28 23:28:46'),
(572,7,'Success','2023-11-28 23:34:13'),
(573,7,'Success','2023-11-28 23:40:46'),
(574,9,'Success','2023-11-29 00:16:53'),
(575,7,'Success','2023-11-29 13:40:02'),
(576,7,'Success','2023-11-29 13:43:46'),
(577,7,'Success','2023-11-29 13:49:33'),
(578,7,'Success','2023-11-29 15:43:30'),
(579,7,'Success','2023-11-29 16:10:21'),
(580,7,'Success','2023-11-29 16:13:42'),
(581,7,'Success','2023-11-29 16:14:27'),
(582,7,'Success','2023-11-29 16:18:17'),
(583,7,'Success','2023-11-29 16:29:50'),
(584,7,'Success','2023-11-29 16:40:36'),
(585,7,'Success','2023-11-29 16:42:27'),
(586,7,'Success','2023-11-29 16:44:58'),
(587,7,'Success','2023-11-29 16:45:25'),
(588,7,'Success','2023-11-29 16:46:12'),
(589,7,'Success','2023-11-29 17:33:49'),
(590,7,'Success','2023-11-30 04:10:29'),
(591,6,'Success','2023-11-30 06:33:22'),
(592,7,'Success','2023-11-30 06:34:06'),
(593,9,'Success','2023-11-30 06:39:53'),
(594,6,'Success','2023-11-30 06:40:03'),
(595,8,'Success','2023-11-30 08:55:27'),
(596,9,'Success','2023-11-30 10:07:57'),
(597,6,'recover','2023-12-01 01:14:54'),
(598,6,'recover','2023-12-01 01:15:21'),
(599,6,'recover','2023-12-01 01:15:51'),
(600,6,'recover','2023-12-01 01:17:20'),
(601,6,'recover','2023-12-01 01:22:14'),
(602,6,'Failed','2023-12-01 01:23:23'),
(603,6,'Success','2023-12-01 01:23:29'),
(604,7,'Success','2023-12-01 02:08:27'),
(605,9,'Success','2023-12-01 03:37:43'),
(606,8,'Success','2023-12-01 04:04:12'),
(607,9,'Success','2023-12-01 05:32:28'),
(608,8,'Success','2023-12-01 06:52:21'),
(609,8,'Success','2023-12-01 06:52:51'),
(610,9,'Success','2023-12-01 06:53:09'),
(611,9,'Success','2023-12-01 06:54:22'),
(612,6,'recover','2023-12-01 14:12:43'),
(613,6,'Success','2023-12-01 14:12:57'),
(614,6,'Success','2023-12-01 15:02:07'),
(615,8,'Failed','2023-12-01 16:27:32'),
(616,6,'Success','2023-12-02 04:43:14');
/*!40000 ALTER TABLE "login_logs" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "notification_librarian"
--

DROP TABLE IF EXISTS "notification_librarian";
/*!50001 DROP VIEW IF EXISTS "notification_librarian"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "notification_librarian" AS SELECT
 1 AS "notification_id",
  1 AS "fullname",
  1 AS "message",
  1 AS "notification_type",
  1 AS "notification_date",
  1 AS "status" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "notifications"
--

DROP TABLE IF EXISTS "notifications";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "notifications" (
  "notification_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "message" text NOT NULL,
  "notification_type" enum('Approved','Overdue','Cancelled','Held','Available','Check Out','Borrowed','Contribution','Renewal') DEFAULT NULL,
  "creation_date" datetime NOT NULL,
  "status" enum('unread','read') DEFAULT 'unread',
  PRIMARY KEY ("notification_id"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "notifications_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "notifications"
--

LOCK TABLES "notifications" WRITE;
/*!40000 ALTER TABLE "notifications" DISABLE KEYS */;
INSERT INTO "notifications" VALUES
(67,6,'The book the invisible man you contributed has been approved on November 28, 2023','Contribution','2023-11-28 23:54:06','read'),
(68,7,'The book english 2: writing in the discipline you borrowed has been approved on November 29, 2023','Approved','2023-11-29 03:25:14','read'),
(69,7,'The book philippine history and government you borrowed has been approved on November 29, 2023','Approved','2023-11-29 03:25:20','read'),
(70,7,'The book jose rizal: life, works and writing of a genius, writer…. you borrowed has been approved on November 29, 2023','Approved','2023-11-29 03:49:42','read'),
(71,7,'The book campus journalism & school paper advising you borrowed has been approved on November 29, 2023','Approved','2023-11-29 03:52:52','read'),
(72,7,'The book constitution made simple you borrowed has been approved on November 29, 2023','Approved','2023-11-29 03:54:36','read'),
(73,6,'The book jose rizal: life, works and writing of a genius, writer…. you borrowed has been approved on November 29, 2023','Approved','2023-11-29 04:56:29','read'),
(74,7,'The book english 2: writing in the discipline you borrowed has been approved on November 29, 2023','Approved','2023-11-29 04:56:29','read'),
(75,8,'The book philippine history and government you reserved claim within 5 days has been approved on November 29, 2023','Approved','2023-11-29 05:07:32','read'),
(76,8,'The book english 2: writing in the discipline you reserved claim within 5 days has been approved on November 29, 2023','Approved','2023-11-29 05:07:32','read'),
(77,9,'The book philippine history and government you borrowed has been approved on November 30, 2023','Approved','2023-11-30 18:11:25','read'),
(78,9,'The book effective college composition writing: communication arts 2 you borrowed has been approved on November 30, 2023','Approved','2023-11-30 18:11:25','read'),
(79,6,'The book autobiography of benjamin franklin you contributed has been approved on December 1, 2023','Contribution','2023-12-01 10:22:53','read'),
(80,6,'The book the lady tanglewood you contributed has been approved on December 1, 2023','Contribution','2023-12-01 10:25:33','read'),
(81,6,'The book dirt dealers you contributed has been approved on December 1, 2023','Contribution','2023-12-01 10:25:56','read'),
(82,7,'The book english 2: writing in the discipline you borrowed has been approved on December 1, 2023','Approved','2023-12-01 10:52:23','unread'),
(83,9,'The book philippine history and government you borrowed has been approved on December 1, 2023','Approved','2023-12-01 11:38:58','read'),
(84,9,'The book english 2: writing in the discipline you borrowed has been approved on December 1, 2023','Approved','2023-12-01 11:38:58','read'),
(85,8,'The book jose rizal: life, works and writing of a genius, writer…. you borrowed has been approved on December 1, 2023','Approved','2023-12-01 13:40:23','read'),
(86,8,'The book constitution made simple you borrowed has been approved on December 1, 2023','Approved','2023-12-01 13:40:24','read');
/*!40000 ALTER TABLE "notifications" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "online_department"
--

DROP TABLE IF EXISTS "online_department";
/*!50001 DROP VIEW IF EXISTS "online_department"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "online_department" AS SELECT
 1 AS "department",
  1 AS "status",
  1 AS "date_login" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "pending_transactions"
--

DROP TABLE IF EXISTS "pending_transactions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "pending_transactions" (
  "pending_transaction_id" int(11) NOT NULL,
  "book_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "transaction_type" enum('Borrowed','Held','Reserved','Renewal') DEFAULT NULL,
  "status" enum('Pending','Approved','Cancelled') NOT NULL,
  "request_date" timestamp NOT NULL DEFAULT current_timestamp(),
  "approve_date" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("pending_transaction_id"),
  KEY "book_id" ("book_id"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "pending_transactions_ibfk_1" FOREIGN KEY ("book_id") REFERENCES "books" ("book_id"),
  CONSTRAINT "pending_transactions_ibfk_2" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "pending_transactions"
--

LOCK TABLES "pending_transactions" WRITE;
/*!40000 ALTER TABLE "pending_transactions" DISABLE KEYS */;
INSERT INTO "pending_transactions" VALUES
(86,4927,7,'Borrowed','Approved','2023-11-28 19:24:44','2023-11-28 19:25:20'),
(87,4928,7,'Borrowed','Approved','2023-11-28 19:24:53','2023-11-28 19:25:14'),
(88,4928,7,'Borrowed','Approved','2023-11-28 19:29:13','2023-11-28 20:56:29'),
(89,4930,7,'Borrowed','Approved','2023-11-28 19:49:14','2023-11-28 19:49:42'),
(90,4931,7,'Borrowed','Approved','2023-11-28 19:52:25','2023-11-28 19:52:52'),
(91,4932,7,'Borrowed','Approved','2023-11-28 19:54:01','2023-11-28 19:54:36'),
(92,4930,6,'Borrowed','Approved','2023-11-28 19:57:05','2023-11-28 20:56:29'),
(93,4927,8,'Reserved','Approved','2023-11-28 21:06:19','2023-11-28 21:07:32'),
(94,4928,8,'Reserved','Approved','2023-11-28 21:06:30','2023-11-28 21:07:32'),
(95,4927,9,'Borrowed','Approved','2023-11-30 10:10:22','2023-11-30 10:11:25'),
(96,4929,9,'Borrowed','Approved','2023-11-30 10:10:39','2023-11-30 10:11:25'),
(97,4928,7,'Borrowed','Approved','2023-12-01 02:51:18','2023-12-01 02:52:23'),
(98,4927,9,'Borrowed','Approved','2023-12-01 03:37:50','2023-12-01 03:38:58'),
(99,4928,9,'Borrowed','Approved','2023-12-01 03:37:57','2023-12-01 03:38:58'),
(100,4930,8,'Borrowed','Approved','2023-12-01 04:04:22','2023-12-01 05:40:23'),
(101,4932,8,'Borrowed','Approved','2023-12-01 04:04:31','2023-12-01 05:40:23'),
(102,4933,8,'Borrowed','Pending','2023-12-01 06:52:27',NULL),
(103,4936,8,'Borrowed','Pending','2023-12-01 06:52:58',NULL),
(104,4934,9,'Borrowed','Pending','2023-12-01 06:53:23',NULL),
(105,4933,9,'Borrowed','Pending','2023-12-01 07:15:24',NULL);
/*!40000 ALTER TABLE "pending_transactions" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "personal_recommendations"
--

DROP TABLE IF EXISTS "personal_recommendations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "personal_recommendations" (
  "recommendation_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "recommended_book_id" int(11) NOT NULL,
  "recommendation_date" datetime NOT NULL DEFAULT current_timestamp(),
  "recommendation_status" enum('active','removed') DEFAULT 'active',
  PRIMARY KEY ("recommendation_id"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "personal_recommendations_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "personal_recommendations"
--

LOCK TABLES "personal_recommendations" WRITE;
/*!40000 ALTER TABLE "personal_recommendations" DISABLE KEYS */;
INSERT INTO "personal_recommendations" VALUES
(9,7,4928,'2023-11-29 03:26:04','active'),
(10,8,4927,'2023-11-29 16:33:25','active'),
(11,9,4927,'2023-11-30 18:14:00','active');
/*!40000 ALTER TABLE "personal_recommendations" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "presonalize_recomendations_details"
--

DROP TABLE IF EXISTS "presonalize_recomendations_details";
/*!50001 DROP VIEW IF EXISTS "presonalize_recomendations_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "presonalize_recomendations_details" AS SELECT
 1 AS "recommendation_id",
  1 AS "user_id",
  1 AS "book_id",
  1 AS "fullname",
  1 AS "department",
  1 AS "img_path",
  1 AS "title",
  1 AS "author_name",
  1 AS "total_checkedout",
  1 AS "recommendation_status" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "publishers"
--

DROP TABLE IF EXISTS "publishers";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "publishers" (
  "publisher_id" int(11) NOT NULL,
  "publisher_name" varchar(100) NOT NULL,
  "created_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("publisher_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "publishers"
--

LOCK TABLES "publishers" WRITE;
/*!40000 ALTER TABLE "publishers" DISABLE KEYS */;
INSERT INTO "publishers" VALUES
(1604,'all nations publishing, inc','2023-11-28 18:43:24'),
(1605,'lacsamana press ','2023-11-28 18:43:24'),
(1606,'great books publishing','2023-11-28 18:43:24'),
(1607,'all nations publishing, inc','2023-11-28 18:43:24'),
(1608,'rex book store inc.','2023-11-28 18:43:24'),
(1609,'rex book store inc.','2023-11-28 18:43:24'),
(1610,'national book store','2023-11-28 18:43:24'),
(1611,'rex book store inc.','2023-11-28 18:43:24'),
(1612,'national book store','2023-11-28 18:43:24'),
(1613,'katha publishing co., inc.','2023-11-28 18:43:24'),
(1614,'katha publishing co., inc.','2023-11-28 18:43:24'),
(1615,'katha publishing co., inc.','2023-11-28 18:43:24');
/*!40000 ALTER TABLE "publishers" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "recomendations_details"
--

DROP TABLE IF EXISTS "recomendations_details";
/*!50001 DROP VIEW IF EXISTS "recomendations_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "recomendations_details" AS SELECT
 1 AS "recommendation_id",
  1 AS "fullname",
  1 AS "department",
  1 AS "title",
  1 AS "total_checkedout",
  1 AS "recommendation_status",
  1 AS "visibility" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "refresh_token"
--

DROP TABLE IF EXISTS "refresh_token";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "refresh_token" (
  "refresh_token_id" int(11) NOT NULL,
  "username" varchar(255) NOT NULL,
  "refresh_token" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("refresh_token_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "refresh_token"
--

LOCK TABLES "refresh_token" WRITE;
/*!40000 ALTER TABLE "refresh_token" DISABLE KEYS */;
INSERT INTO "refresh_token" VALUES
(1096,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzE2NDUwLCJpc3MiOiJNSVQifQ.umubdWgBOVrU4lZDlD_H2Z2u22q0a9Rkrn7KeWJRmB4','2023-11-30 03:54:10'),
(1097,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzE3MDEyLCJleHAiOjE3MDEzMTczMTIsImlzcyI6Ik1JVCJ9.Ao846kAS9IuSQRP6wuwT-Ogqb1Xdj5paYsyZ2CCE3Dc','2023-11-30 04:03:32'),
(1099,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzIwNjgwLCJleHAiOjE3MDEzMjA5ODAsImlzcyI6Ik1JVCJ9.7SIym3sZ86yPJfVkyZxbawL9kVJ_0DWiQctBiTPLc-s','2023-11-30 05:04:40'),
(1100,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzIzMTAxLCJpc3MiOiJNSVQifQ.NoN9AVVpBWsl-_zQF6n3DkjHVKFhYkB7SVFmr7zcwKo','2023-11-30 05:45:01'),
(1101,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzIzNTI5LCJleHAiOjE3MDEzMjM4MjksImlzcyI6Ik1JVCJ9.thjyErfQAsTiTfEKXrogTIHtfula65hfm8EFmEiWLQA','2023-11-30 05:52:09'),
(1102,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI1NDMwLCJleHAiOjE3MDEzMjU3MzAsImlzcyI6Ik1JVCJ9.96ju2zLGkoyxX3SOpsruM0ihXF_fgQ4V188yXi_srF4','2023-11-30 06:23:50'),
(1103,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI1NDUxLCJleHAiOjE3MDEzMjU3NTEsImlzcyI6Ik1JVCJ9.qkutUaeyMqrOqAaOZhfyhuqD_bt89ijnMjUQPvfCZok','2023-11-30 06:24:11'),
(1104,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI1NzAzLCJleHAiOjE3MDEzMjYwMDMsImlzcyI6Ik1JVCJ9.N_vRkWBSFbCG4zJcr_lGHXHWuNg6GvM7Wp6yjRR2PT4','2023-11-30 06:28:23'),
(1105,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI1NzMyLCJleHAiOjE3MDEzMjYwMzIsImlzcyI6Ik1JVCJ9.u8A0vCJs4hYegRJ5AoprepPXsLjz8-M-pCxPpFDlzXE','2023-11-30 06:28:52'),
(1113,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI1OTgyLCJleHAiOjE3MDEzMjYyODIsImlzcyI6Ik1JVCJ9.0LzmRQKpTo3VamUkSuVP4ANHHmiYOP4IaWaLW_FW5mU','2023-11-30 06:33:02'),
(1115,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2MDMzLCJleHAiOjE3MDEzMjYzMzMsImlzcyI6Ik1JVCJ9.Ij0dMgZArefsBlDI_T5FsTXQGCp9U9HRbrgQW4Wfs9A','2023-11-30 06:33:53'),
(1119,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2NTIwLCJleHAiOjE3MDEzMjY4MjAsImlzcyI6Ik1JVCJ9.yGTvOv9dXJHjNjTMSPvk5-ul0cf4EqOwc1oK_vddueI','2023-11-30 06:42:00'),
(1120,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2NTIxLCJleHAiOjE3MDEzMjY4MjEsImlzcyI6Ik1JVCJ9.2VNiRDaBS3xN5dvJQrsZ-eGblE82UoAMCQvjh3Z1tPQ','2023-11-30 06:42:01'),
(1121,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2NTIxLCJleHAiOjE3MDEzMjY4MjEsImlzcyI6Ik1JVCJ9.2VNiRDaBS3xN5dvJQrsZ-eGblE82UoAMCQvjh3Z1tPQ','2023-11-30 06:42:01'),
(1122,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2OTYxLCJleHAiOjE3MDEzMjcyNjEsImlzcyI6Ik1JVCJ9.r83405IAi6wHezPWUl7opBsX4knWm9W05XMEOamDTGs','2023-11-30 06:49:21'),
(1123,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2OTYyLCJleHAiOjE3MDEzMjcyNjIsImlzcyI6Ik1JVCJ9.3L-VDByD8mSRwTkVCeHdFgW6jL5DYZsTUuLeRsw8j0o','2023-11-30 06:49:22'),
(1124,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI2OTYyLCJleHAiOjE3MDEzMjcyNjIsImlzcyI6Ik1JVCJ9.3L-VDByD8mSRwTkVCeHdFgW6jL5DYZsTUuLeRsw8j0o','2023-11-30 06:49:22'),
(1125,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MDkxLCJleHAiOjE3MDEzMjczOTEsImlzcyI6Ik1JVCJ9.5IHle5Co_daHWK1lge7MaTZP9h4e5CWS5j-kjWCCbOo','2023-11-30 06:51:31'),
(1126,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MDkyLCJleHAiOjE3MDEzMjczOTIsImlzcyI6Ik1JVCJ9.umnEqNV-s_nzzE0nwt0XXtYb0_8ULs25U2KQubn0Cac','2023-11-30 06:51:32'),
(1127,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MDkyLCJleHAiOjE3MDEzMjczOTIsImlzcyI6Ik1JVCJ9.umnEqNV-s_nzzE0nwt0XXtYb0_8ULs25U2KQubn0Cac','2023-11-30 06:51:32'),
(1128,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MTI0LCJleHAiOjE3MDEzMjc0MjQsImlzcyI6Ik1JVCJ9.14BAz4kh69YuC1kyQZn2VPnVMYpwdsR09MQHnRt5538','2023-11-30 06:52:04'),
(1129,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MTI1LCJleHAiOjE3MDEzMjc0MjUsImlzcyI6Ik1JVCJ9.ffifKOqaZRAuQXwMHkF6qV6KMBrD5PMKCInp2758eTA','2023-11-30 06:52:05'),
(1130,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MTI1LCJleHAiOjE3MDEzMjc0MjUsImlzcyI6Ik1JVCJ9.ffifKOqaZRAuQXwMHkF6qV6KMBrD5PMKCInp2758eTA','2023-11-30 06:52:05'),
(1131,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MTcwLCJleHAiOjE3MDEzMjc0NzAsImlzcyI6Ik1JVCJ9.NidLN4VHvcsHKIhQsdEQKY3p7fZu1xzDHuLY_n7cGaA','2023-11-30 06:52:50'),
(1132,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MTcxLCJleHAiOjE3MDEzMjc0NzEsImlzcyI6Ik1JVCJ9.EPSaiTDc26afw6bkxcelJeVcdo7iBVC-WOp5EQdzpCo','2023-11-30 06:52:51'),
(1133,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MTcxLCJleHAiOjE3MDEzMjc0NzEsImlzcyI6Ik1JVCJ9.EPSaiTDc26afw6bkxcelJeVcdo7iBVC-WOp5EQdzpCo','2023-11-30 06:52:51'),
(1134,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MjY4LCJleHAiOjE3MDEzMjc1NjgsImlzcyI6Ik1JVCJ9.BAePdPHHYLk0vA5JKdQxg7_hn21E0iLn3bfvkLwKJjo','2023-11-30 06:54:28'),
(1135,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3Mjg1LCJleHAiOjE3MDEzMjc1ODUsImlzcyI6Ik1JVCJ9.hNFrpFT0eTjhNQ6avHk7eyIvls4yo9P4zwCvCb2Z9CI','2023-11-30 06:54:45'),
(1136,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3Mjg5LCJleHAiOjE3MDEzMjc1ODksImlzcyI6Ik1JVCJ9.nVdBjL6g1-DT6dAgu_dtdHOsONo6zaMOLh4VmTvbo2c','2023-11-30 06:54:49'),
(1137,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MjkwLCJleHAiOjE3MDEzMjc1OTAsImlzcyI6Ik1JVCJ9.b1fbNPg3j_Uis65enoYB25x92CqMJywSRrXbTulfZFU','2023-11-30 06:54:50'),
(1138,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3MjkwLCJleHAiOjE3MDEzMjc1OTAsImlzcyI6Ik1JVCJ9.b1fbNPg3j_Uis65enoYB25x92CqMJywSRrXbTulfZFU','2023-11-30 06:54:50'),
(1139,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3Mzk2LCJleHAiOjE3MDEzMjc2OTYsImlzcyI6Ik1JVCJ9.LST95SRNdtGvlFTrt7IrL5mUBpaBFCBL5lGs1qehyPs','2023-11-30 06:56:36'),
(1140,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NDA1LCJleHAiOjE3MDEzMjc3MDUsImlzcyI6Ik1JVCJ9.XSKxfFwKoK1s8QfTc86TcBvNY6qaM6QMZ6lPJ3NLqFc','2023-11-30 06:56:45'),
(1141,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NDA2LCJleHAiOjE3MDEzMjc3MDYsImlzcyI6Ik1JVCJ9.pPpXeCCiz5XcyB99ijkcNRwpYrcIi473DKP_fpkQUB0','2023-11-30 06:56:46'),
(1142,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NDA2LCJleHAiOjE3MDEzMjc3MDYsImlzcyI6Ik1JVCJ9.pPpXeCCiz5XcyB99ijkcNRwpYrcIi473DKP_fpkQUB0','2023-11-30 06:56:46'),
(1143,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NDE5LCJleHAiOjE3MDEzMjc3MTksImlzcyI6Ik1JVCJ9.z1uusNDAVKQvBQ6OJiR2Z0A8jNpJ4-Qg-aGReYoWNoI','2023-11-30 06:56:59'),
(1150,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTA1LCJleHAiOjE3MDEzMjc4MDUsImlzcyI6Ik1JVCJ9.I1GLOqY2X_Kf6_MAuZFKbj_F3-42xVVWjjkyLMqBVsI','2023-11-30 06:58:25'),
(1151,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTM5LCJleHAiOjE3MDEzMjc4MzksImlzcyI6Ik1JVCJ9.1DJsKHlMVeP4LWaWWAHvqn6PxztgVgTSDREbvbyTSfI','2023-11-30 06:58:59'),
(1152,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTQ1LCJleHAiOjE3MDEzMjc4NDUsImlzcyI6Ik1JVCJ9.0LLDbYy8IE9b_mfeJBgU7yxavET_s4bIRNpvKj5_jxI','2023-11-30 06:59:05'),
(1153,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTQ2LCJleHAiOjE3MDEzMjc4NDYsImlzcyI6Ik1JVCJ9.0al2HNM4fhnJTFoNNdwqFwXg3RHwGZS4Fyv0pmK0G8c','2023-11-30 06:59:06'),
(1154,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTQ3LCJleHAiOjE3MDEzMjc4NDcsImlzcyI6Ik1JVCJ9.cvXCsDbcTVEp3vjGeYrDuybpOqxMeiQ629IBUZzOc-M','2023-11-30 06:59:07'),
(1155,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTc3LCJleHAiOjE3MDEzMjc4NzcsImlzcyI6Ik1JVCJ9.QpkCw_nYiJ7_LwEtD6XJ6-dMEUOEhjf32wcPo1HJ5Oc','2023-11-30 06:59:37'),
(1156,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTg3LCJleHAiOjE3MDEzMjc4ODcsImlzcyI6Ik1JVCJ9.pPBPM2F6pUoQ98B5Xpu4hcExFGNnmUwA_un3_Xir2QM','2023-11-30 06:59:47'),
(1157,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTg4LCJleHAiOjE3MDEzMjc4ODgsImlzcyI6Ik1JVCJ9.LfR9gqczadKsfEgXWGB2j_GiCjmSAHJX074u8CvMJGQ','2023-11-30 06:59:48'),
(1158,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NTg5LCJleHAiOjE3MDEzMjc4ODksImlzcyI6Ik1JVCJ9.GyLUIuCMzkOD9SlYfPEV91azUkQ9KFmtDJySwbGPCwc','2023-11-30 06:59:49'),
(1159,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjA0LCJleHAiOjE3MDEzMjc5MDQsImlzcyI6Ik1JVCJ9.L2n571-S7COb7HDp0ncTRaKDVt63eayDdPSxJnjQrSs','2023-11-30 07:00:04'),
(1160,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjIxLCJleHAiOjE3MDEzMjc5MjEsImlzcyI6Ik1JVCJ9.vyXqvYsiFQOywbB1pzjyWof7gNUBhuyjizDSgIoV-98','2023-11-30 07:00:21'),
(1161,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjIyLCJleHAiOjE3MDEzMjc5MjIsImlzcyI6Ik1JVCJ9.NTM9baJn65Es9ZIykvoW3Q1D-9Owcrz9lSwMFGnxV98','2023-11-30 07:00:22'),
(1162,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjIzLCJleHAiOjE3MDEzMjc5MjMsImlzcyI6Ik1JVCJ9.n4OFhEQSCmoFOz-eJicbap3k6jNBUn_8gS-VSJcgjZE','2023-11-30 07:00:23'),
(1163,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjcxLCJleHAiOjE3MDEzMjc5NzEsImlzcyI6Ik1JVCJ9.JbDWNiJwplHHI2azv7PNfVnPyRgV2TKlmk9yC4rycXk','2023-11-30 07:01:11'),
(1164,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjcxLCJleHAiOjE3MDEzMjc5NzEsImlzcyI6Ik1JVCJ9.JbDWNiJwplHHI2azv7PNfVnPyRgV2TKlmk9yC4rycXk','2023-11-30 07:01:11'),
(1165,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NjcyLCJleHAiOjE3MDEzMjc5NzIsImlzcyI6Ik1JVCJ9.TuQ51XB5I11y3ZVKQvBQJcrKBnW2icvtF5WweeMllR8','2023-11-30 07:01:12'),
(1166,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NzI3LCJleHAiOjE3MDEzMjgwMjcsImlzcyI6Ik1JVCJ9.jKCJHN3Q0tdyVtWjfY-3UPFvhHBz2RySnEwtxM1_fOI','2023-11-30 07:02:07'),
(1167,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NzI4LCJleHAiOjE3MDEzMjgwMjgsImlzcyI6Ik1JVCJ9.-TfKgVrbHiXabhE2tmx29QAHAqKcbx0v5Ni0KxUMLMI','2023-11-30 07:02:08'),
(1168,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3NzI5LCJleHAiOjE3MDEzMjgwMjksImlzcyI6Ik1JVCJ9.erjYBOeykK_qty4683BUl4a-hGdXvgJAYTxTlMgt-f8','2023-11-30 07:02:09'),
(1169,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3OTM0LCJleHAiOjE3MDEzMjgyMzQsImlzcyI6Ik1JVCJ9.q_tEHys3uTd0rPQwkQPX8IBxJuF0L9-PAiwn51jR6FM','2023-11-30 07:05:34'),
(1170,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3OTM0LCJleHAiOjE3MDEzMjgyMzQsImlzcyI6Ik1JVCJ9.q_tEHys3uTd0rPQwkQPX8IBxJuF0L9-PAiwn51jR6FM','2023-11-30 07:05:34'),
(1171,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3OTM1LCJleHAiOjE3MDEzMjgyMzUsImlzcyI6Ik1JVCJ9.W2zSMogrHcA-UR7RXFhhu1vmkvoVhzZBsJPnDiz1uug','2023-11-30 07:05:35'),
(1172,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI3OTUyLCJleHAiOjE3MDEzMjgyNTIsImlzcyI6Ik1JVCJ9.82OZ_SyYN0_0zqir6sL3dUoWakOYmya3XMLb7IUqQS4','2023-11-30 07:05:52'),
(1173,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MDE0LCJleHAiOjE3MDEzMjgzMTQsImlzcyI6Ik1JVCJ9.yuwWOpsUnm-MgHMtyBS8eQaC3q6LqNg8YCIMV4Zm9qg','2023-11-30 07:06:54'),
(1174,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MDE1LCJleHAiOjE3MDEzMjgzMTUsImlzcyI6Ik1JVCJ9.u0aQ_nmayp2s7g8bHfHJV-2DD4sz8i4617N7-Rl0Y30','2023-11-30 07:06:55'),
(1175,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MDE2LCJleHAiOjE3MDEzMjgzMTYsImlzcyI6Ik1JVCJ9.o8s02NAU2h2tcnezcgueEhT_z2vu6M5iONG5qdC0D-c','2023-11-30 07:06:56'),
(1176,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MDMyLCJleHAiOjE3MDEzMjgzMzIsImlzcyI6Ik1JVCJ9.M0aej_KUjOmjuqHVy_Vw_Dmu5Fm7DXKWoZqA2Mj5w88','2023-11-30 07:07:12'),
(1177,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MDMzLCJleHAiOjE3MDEzMjgzMzMsImlzcyI6Ik1JVCJ9.gAAdPhceL8uVZKp2L_AyJxbcSiYv2rBLujOoFWF6v60','2023-11-30 07:07:13'),
(1178,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MDMzLCJleHAiOjE3MDEzMjgzMzMsImlzcyI6Ik1JVCJ9.gAAdPhceL8uVZKp2L_AyJxbcSiYv2rBLujOoFWF6v60','2023-11-30 07:07:13'),
(1179,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MjE3LCJleHAiOjE3MDEzMjg1MTcsImlzcyI6Ik1JVCJ9.7Yl7N4yNvhFC3FAgrZjGzlElspGfFwue_iVT4SRbOa4','2023-11-30 07:10:17'),
(1180,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MjE4LCJleHAiOjE3MDEzMjg1MTgsImlzcyI6Ik1JVCJ9.XFxx25boRnWLgbb1xcnFGc1U_mOYgdvrCf2VlBiI-uU','2023-11-30 07:10:18'),
(1181,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MjE5LCJleHAiOjE3MDEzMjg1MTksImlzcyI6Ik1JVCJ9.0CULh4dwcSSjyyvqUnlGLD2Ztehrhf2OkW2485Unj5g','2023-11-30 07:10:19'),
(1182,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4MzYzLCJleHAiOjE3MDEzMjg2NjMsImlzcyI6Ik1JVCJ9.G6idrYBZfL93uI4VQxXAJqQ6k8oiPfV13WYE9yPZR2E','2023-11-30 07:12:43'),
(1186,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI4NzUwLCJleHAiOjE3MDEzMjkwNTAsImlzcyI6Ik1JVCJ9.UQFPlng3yhiAfLYMDLCCeXsQmnfiRNx4Bu9tCRpB87Q','2023-11-30 07:19:10'),
(1187,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI5MjI2LCJleHAiOjE3MDEzMjk1MjYsImlzcyI6Ik1JVCJ9.72KShLF_BYDMPI4r-e4A9MmlBJa_KgejEolEZU7VCEc','2023-11-30 07:27:06'),
(1188,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzI5NTU4LCJleHAiOjE3MDEzMjk4NTgsImlzcyI6Ik1JVCJ9.SkitH0c80mk2LmmLENUZPlbMSx_zE8Kf3mbZYuUuMmI','2023-11-30 07:32:38'),
(1189,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzMwMTM4LCJleHAiOjE3MDEzMzA0MzgsImlzcyI6Ik1JVCJ9.eUQ76Hw2Seux_Ixqy-2XpJwJ4zr91ddTIk7X3TaXLeY','2023-11-30 07:42:18'),
(1190,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzMwNDc3LCJleHAiOjE3MDEzMzA3NzcsImlzcyI6Ik1JVCJ9.Samu3b8lyv1nOgwgTmlbN19ulk5E8WdoiJ5jpBdA5cI','2023-11-30 07:47:57'),
(1191,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzMyMjYzLCJleHAiOjE3MDEzMzI1NjMsImlzcyI6Ik1JVCJ9.NEx5wFYw8nEchPJfbahOcFdbz412RedwDwOXWn_CaAo','2023-11-30 08:17:43'),
(1192,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzMyNjY0LCJleHAiOjE3MDEzMzI5NjQsImlzcyI6Ik1JVCJ9.uz_ZlLqc8FQcvQnBSR3g6QXgM4Vqee67kl3Ys_kdMlE','2023-11-30 08:24:24'),
(1193,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzMzNTQ1LCJleHAiOjE3MDEzMzM4NDUsImlzcyI6Ik1JVCJ9.FiMfXqzP4rUIvZ0tUCjhELfcJtl0GrinB_l4NHxTtXM','2023-11-30 08:39:05'),
(1194,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM0MTIzLCJleHAiOjE3MDEzMzQ0MjMsImlzcyI6Ik1JVCJ9.HmCweYewQ5LMss9UxU-NjBE76uF4FsayxLjXbgOQWLA','2023-11-30 08:48:43'),
(1198,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM0NTM4LCJleHAiOjE3MDEzMzQ4MzgsImlzcyI6Ik1JVCJ9.fADaRAIQhVuCO-FlaWjz4tyw_CDMbY3GEF4YI8EdYx0','2023-11-30 08:55:38'),
(1199,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM0ODY1LCJleHAiOjE3MDEzMzUxNjUsImlzcyI6Ik1JVCJ9.OJATzRWeT7cfpcz0BgX0qZpz72hAXy93IEiStfOk1qI','2023-11-30 09:01:05'),
(1200,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM1Njg3LCJleHAiOjE3MDEzMzU5ODcsImlzcyI6Ik1JVCJ9._ImrBwuawOL6_zVrqRs2p1L8a2zP9tODHZzHG31lu0s','2023-11-30 09:14:47'),
(1201,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM2NTYyLCJleHAiOjE3MDEzMzY4NjIsImlzcyI6Ik1JVCJ9.3q1W4jOhSyKPvurGFnZ2SldhLdVs1L2-z5chERJ7bEc','2023-11-30 09:29:22'),
(1202,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM4MzE0LCJleHAiOjE3MDEzMzg2MTQsImlzcyI6Ik1JVCJ9.IEZiGnKDDBRos7Mv4v-68F8s9ISCy_ldPS0oI1e3ZBM','2023-11-30 09:58:34'),
(1203,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM4NjIxLCJleHAiOjE3MDEzMzg5MjEsImlzcyI6Ik1JVCJ9.q6NGIt6gr4DQy-FL5e_7Oqeo50cXLG-oA0-_hUoAkn8','2023-11-30 10:03:41'),
(1206,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM4OTgxLCJleHAiOjE3MDEzMzkyODEsImlzcyI6Ik1JVCJ9.XzAg-eobCAWKiPwP05x4owhxe-ZhRQFNmJYgk4MsChs','2023-11-30 10:09:41'),
(1207,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM5MzIyLCJleHAiOjE3MDEzMzk2MjIsImlzcyI6Ik1JVCJ9.8axL669Asw0-dNBI350JhAp7WB9tOxOmGyLUBysMRyg','2023-11-30 10:15:22'),
(1208,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzM5NjMyLCJleHAiOjE3MDEzMzk5MzIsImlzcyI6Ik1JVCJ9.KpXjZ5dW8Xw0NnPmEQINHskiJ1gC4fTDfzSgJlpJcyI','2023-11-30 10:20:32'),
(1209,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQwMDMxLCJleHAiOjE3MDEzNDAzMzEsImlzcyI6Ik1JVCJ9.WebFs6TggaGkHTpovBBaYj6zvo3Uh9QH5xqwG3eK6Bc','2023-11-30 10:27:11'),
(1210,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQwMzc2LCJleHAiOjE3MDEzNDA2NzYsImlzcyI6Ik1JVCJ9.9u9dAbEc0uwrXmls8Qd8dgrYiNht6xpUPmBaDBmEFas','2023-11-30 10:32:56'),
(1215,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQxMTUzLCJleHAiOjE3MDEzNDE0NTMsImlzcyI6Ik1JVCJ9.I5bMWMaEU8zO4qM_j1wa8JAhe4llog9T_kJDUdQ2QQQ','2023-11-30 10:45:53'),
(1216,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQxNjUzLCJleHAiOjE3MDEzNDE5NTMsImlzcyI6Ik1JVCJ9.mAr7S_7p9XRPTS4R6kkqfaobq1e6k1i3FZE3G6njxjk','2023-11-30 10:54:13'),
(1217,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQxOTkwLCJleHAiOjE3MDEzNDIyOTAsImlzcyI6Ik1JVCJ9.--ZNwhfdqftj5MWvmbhvlnG71gIrL0kzTOkNOE2rwa4','2023-11-30 10:59:50'),
(1218,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQyNTgwLCJleHAiOjE3MDEzNDI4ODAsImlzcyI6Ik1JVCJ9.fnpOyvAqlLKXvaItJhkxSv4nI4VSD8lV-UUZKVASmkQ','2023-11-30 11:09:40'),
(1219,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzQzMDU2LCJleHAiOjE3MDEzNDMzNTYsImlzcyI6Ik1JVCJ9.HyXg4PSAeokppPow6m4W90JQjZ_JwseZZ5rnYnJQV4g','2023-11-30 11:17:36'),
(1224,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzUzMTE0LCJpc3MiOiJNSVQifQ.UPZ75IuWvQO2kpS8-zIgmetAIDJ5t-IcoeeFlyGtRpA','2023-11-30 14:05:14'),
(1225,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzU0MTY5LCJpc3MiOiJNSVQifQ.QqtK-4LNbJQcw-_wwUSUkdpKoVlfxVhkdZnDjTNq0xc','2023-11-30 14:22:49'),
(1232,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk1NDA3LCJleHAiOjE3MDEzOTU3MDcsImlzcyI6Ik1JVCJ9.bQYIENmV_FWqC4uEqcL4Gii409wQjmnBsCc4EC-noBY','2023-12-01 01:50:07'),
(1235,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk2NDg5LCJleHAiOjE3MDEzOTY3ODksImlzcyI6Ik1JVCJ9.jSkT6ZKvVKQYt42at7iq60AtJ3ck8KknPl0hO_OZufA','2023-12-01 02:08:09'),
(1240,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk3MzY3LCJleHAiOjE3MDEzOTc2NjcsImlzcyI6Ik1JVCJ9.0HqupD0iPwciyq7AO05X9j96Ub4ZiOgWgwuAVNhJ-M8','2023-12-01 02:22:47'),
(1241,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk3NzAyLCJleHAiOjE3MDEzOTgwMDIsImlzcyI6Ik1JVCJ9.1RrIKsqARazIbZyisllLbG2vnKP97Oojjv-1TyYifTc','2023-12-01 02:28:22'),
(1242,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk4MjM4LCJleHAiOjE3MDEzOTg1MzgsImlzcyI6Ik1JVCJ9.KR2x-6EKoludu0aN4odnDbLr6fTlkxRVgu4COrql2QE','2023-12-01 02:37:18'),
(1243,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk4NTQ4LCJleHAiOjE3MDEzOTg4NDgsImlzcyI6Ik1JVCJ9.aGuritKogPLpuU6ROSPn6uYaKSJqpeluXrOwlegbJU4','2023-12-01 02:42:28'),
(1244,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk4ODY2LCJleHAiOjE3MDEzOTkxNjYsImlzcyI6Ik1JVCJ9.dLbOzTfs2mvUx7XCdFBiYHGp316Ad51zK-m3x_d_kvs','2023-12-01 02:47:46'),
(1246,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk5MTc5LCJleHAiOjE3MDEzOTk0NzksImlzcyI6Ik1JVCJ9.aTnCY2CwQZhfc-wogEw9cRXbGJl9MBh4OgiUnrJ0Ln0','2023-12-01 02:52:59'),
(1247,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxMzk5NzYwLCJleHAiOjE3MDE0MDAwNjAsImlzcyI6Ik1JVCJ9.BPCu4-GAUL8OSGcdmqk_-8KVlRAx6emdWtxVKBakVxk','2023-12-01 03:02:40'),
(1248,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDAwNjY0LCJleHAiOjE3MDE0MDA5NjQsImlzcyI6Ik1JVCJ9.6VrHJL27IDvPX39o2oFIBHjMFeLDM4yOSZv7wd_Psss','2023-12-01 03:17:44'),
(1249,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDAxODE0LCJleHAiOjE3MDE0MDIxMTQsImlzcyI6Ik1JVCJ9._2HQdGBXos7zUWihvQ4K2j2O6hPgaTvAabEn99U_98E','2023-12-01 03:36:54'),
(1255,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDAyNTYzLCJleHAiOjE3MDE0MDI4NjMsImlzcyI6Ik1JVCJ9.tBqbkDVA6FD_mWvCqsk4shxXgFfb2fkZw8gfL8d6vmY','2023-12-01 03:49:23'),
(1256,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDAyODk4LCJleHAiOjE3MDE0MDMxOTgsImlzcyI6Ik1JVCJ9.kP4XynDZcwxkOMCMqWqy0cLuNGm7-vS-5UN5BVcCrX4','2023-12-01 03:54:58'),
(1258,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDAzNDYyLCJleHAiOjE3MDE0MDM3NjIsImlzcyI6Ik1JVCJ9.1hzj3nGngDhgGm80MJyCRd79XXgr66rIyhOLLNK4qRw','2023-12-01 04:04:22'),
(1277,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDA5MjAzLCJleHAiOjE3MDE0MDk1MDMsImlzcyI6Ik1JVCJ9.5-gIcHZCv3GoRMFxS7jPsA_3QzmeA2BJUxM4ZhrB0P4','2023-12-01 05:40:03'),
(1278,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDA5MjQ0LCJpc3MiOiJNSVQifQ.mKv0l5p_d6HBAxuCLQ9fxuSg0poSZzbbaPIMbUIDAa0','2023-12-01 05:40:44'),
(1279,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDEwMDE2LCJleHAiOjE3MDE0MTAzMTYsImlzcyI6Ik1JVCJ9.Oj467hveH1t9YzPUKmr2GkMG80tEzwcSDNvebf9nW6k','2023-12-01 05:53:36'),
(1280,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDEyOTMzLCJleHAiOjE3MDE0MTMyMzMsImlzcyI6Ik1JVCJ9.31R3xxnwzeR2r2EVrD-DJVgAnzIC9i0zYjiGQVH5iAg','2023-12-01 06:42:13'),
(1281,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDEzMjQ5LCJleHAiOjE3MDE0MTM1NDksImlzcyI6Ik1JVCJ9.7Fyx1zg7azgCw3kyaAqQiYdx19B-VxGNnDnvDTr72yI','2023-12-01 06:47:29'),
(1285,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDEzNTc4LCJleHAiOjE3MDE0MTM4NzgsImlzcyI6Ik1JVCJ9.finaNnQsHDSHK2HfYlVsERh4CtmaLEhJysBuq0fhDjE','2023-12-01 06:52:58'),
(1293,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDE0OTI0LCJleHAiOjE3MDE0MTUyMjQsImlzcyI6Ik1JVCJ9.Nc4gB83LcgaILsRLYy9SEZQVNux9Z3ifdi4tZ_XBwjE','2023-12-01 07:15:24'),
(1303,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDQ4MTQ1LCJpc3MiOiJNSVQifQ.kCpdyGh3ZJ8v8TVm8axCXxfGI58U94rD9z7bTlkwRpw','2023-12-01 16:29:05'),
(1304,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDQ5MjM5LCJleHAiOjE3MDE0NDk1MzksImlzcyI6Ik1JVCJ9.fGuhMt7ME_8UtUus4f1TW17WSGoiqCQ3ZggvWLhQAXY','2023-12-01 16:47:19'),
(1305,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDQ5NTYzLCJleHAiOjE3MDE0NDk4NjMsImlzcyI6Ik1JVCJ9.9oQobCU7vadQPjVXHEiaeUOHQE_v3twyVq_NNPwI16E','2023-12-01 16:52:43'),
(1306,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDQ5ODcwLCJleHAiOjE3MDE0NTAxNzAsImlzcyI6Ik1JVCJ9.q9sT6wXJBKQfW9KSVPI4Ksbt3mMZ-drYm7Nq5enHa-g','2023-12-01 16:57:50'),
(1307,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDUxNjQyLCJleHAiOjE3MDE0NTE5NDIsImlzcyI6Ik1JVCJ9.1qESZskT3FbwlnN03UwFaoyU3c-3BGJp64_IpeH7sgA','2023-12-01 17:27:22'),
(1309,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDc4ODM3LCJleHAiOjE3MDE0NzkxMzcsImlzcyI6Ik1JVCJ9.4SiCkBJ_oc2qA_obYfDmJIM95QmlSMcBjahAQnNi3K0','2023-12-02 01:00:37'),
(1310,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDc5MzEzLCJleHAiOjE3MDE0Nzk2MTMsImlzcyI6Ik1JVCJ9.0d5q5UjT7xrvfCnGKevsWzMyr4ynHTNeGSs0pnM4ofQ','2023-12-02 01:08:33'),
(1311,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDgwMzExLCJleHAiOjE3MDE0ODA2MTEsImlzcyI6Ik1JVCJ9.l7hWxCuto813XBDCGqpOBx9ioq509IjHYbBWNRETayU','2023-12-02 01:25:11'),
(1312,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDgwNDAxLCJpc3MiOiJNSVQifQ.mbGkyu8S3UTG-BTE0fLm-efarfCeHLdsg7KT11FN-i4','2023-12-02 01:26:41'),
(1313,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDgwNzY4LCJleHAiOjE3MDE0ODEwNjgsImlzcyI6Ik1JVCJ9.ezrKVPWvYMB00hszepKkJJId6BCESxNRNRxMBON-a1w','2023-12-02 01:32:48'),
(1314,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDkxMzIzLCJpc3MiOiJNSVQifQ.EjIdeGVMdb0cG29pvt9RD-K6Qaies-xjGeasvpIzwWs','2023-12-02 04:28:43'),
(1317,'rachel.admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhY2hlbC5hZG1pbiIsInVzZXJfaWQiOjEsInByaXZpbGVnZSI6ImFkbWluIiwiaWF0IjoxNzAxNDk0MDUwLCJleHAiOjE3MDE0OTQzNTAsImlzcyI6Ik1JVCJ9.jKI9GWJg45uWcT0R95-3p7lJRNxCVif9ZXNrTyxZW40','2023-12-02 05:14:10');
/*!40000 ALTER TABLE "refresh_token" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "renewal_details"
--

DROP TABLE IF EXISTS "renewal_details";
/*!50001 DROP VIEW IF EXISTS "renewal_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "renewal_details" AS SELECT
 1 AS "renewal_id",
  1 AS "transaction_id",
  1 AS "user_id",
  1 AS "fullname",
  1 AS "department",
  1 AS "title",
  1 AS "renewal_days",
  1 AS "original_due_date",
  1 AS "new_due_date",
  1 AS "approval_status" */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view "transactions_book"
--

DROP TABLE IF EXISTS "transactions_book";
/*!50001 DROP VIEW IF EXISTS "transactions_book"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "transactions_book" AS SELECT
 1 AS "transaction_id",
  1 AS "user_id",
  1 AS "title",
  1 AS "author_name",
  1 AS "fullname",
  1 AS "department",
  1 AS "transaction_type",
  1 AS "transaction_date",
  1 AS "due_date",
  1 AS "status",
  1 AS "last_date",
  1 AS "img_path" */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view "transactions_pending"
--

DROP TABLE IF EXISTS "transactions_pending";
/*!50001 DROP VIEW IF EXISTS "transactions_pending"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "transactions_pending" AS SELECT
 1 AS "pending_transaction_id",
  1 AS "user_id",
  1 AS "title",
  1 AS "fullname",
  1 AS "department",
  1 AS "transaction_type",
  1 AS "status",
  1 AS "request_date",
  1 AS "approve_date",
  1 AS "img_path" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "user_contribution"
--

DROP TABLE IF EXISTS "user_contribution";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_contribution" (
  "contribution_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "file_title" varchar(255) NOT NULL,
  "file_author_id" int(11) NOT NULL,
  "file_category_id" int(11) NOT NULL,
  "file_publisher_id" int(11) NOT NULL,
  "file_path" varchar(255) DEFAULT NULL,
  "uploaded_date" datetime DEFAULT current_timestamp(),
  "updated_date" datetime DEFAULT current_timestamp(),
  "file_total_downloads" int(11) DEFAULT 0,
  "file_description" text NOT NULL,
  "file_status" enum('accepted','cancelled','pending','removed') DEFAULT 'pending',
  PRIMARY KEY ("contribution_id"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "user_contribution_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_contribution"
--

LOCK TABLES "user_contribution" WRITE;
/*!40000 ALTER TABLE "user_contribution" DISABLE KEYS */;
INSERT INTO "user_contribution" VALUES
(35,6,'the invisible man',35,32,30,'the-invisible-man-1701186774819.pdf','2023-11-28 23:52:54','2023-11-28 23:54:06',0,'\"very useful things indeed they are, sir,\" said mrs. hall.\r\n\r\n\"and i''m very naturally anxious to get on with my inquiries.\"\r\n\r\n\"of course, sir.\"\r\n\r\n\"my reason for coming to iping,\" he proceeded, with a certain deliberation of manner, \"was ... a desire for solitude. i do not wish to be disturbed in my work. in addition to my work, an accident--\"\r\n\r\n\"i thought as much,\" said mrs. hall to herself.\r\n\r\n\"--necessitates a certain retirement. my eyes--are sometimes so weak and painful that i have to shut myself up in the dark for hours together. lock myself up. sometimes--now and then. not at present, certainly. at such times the slightest disturbance, the entry of a stranger into the room, is a source of excruciating annoyance to me--it is well these things should be understood.\"\r\n\r\n\"certainly, sir,\" said mrs. hall. \"and if i might make so bold as to ask--\"\r\n\r\n\"that i think, is all,\" said the stranger, with that quietly irresistible ','accepted'),
(36,6,'autobiography of benjamin franklin',36,33,30,'autobiography-of-benjamin-franklin-1701189333159.epub','2023-11-29 00:35:33','2023-12-01 10:22:53',0,'\r\nfranklin''s longest work, and yet it is only a fragment. the first part, written as a letter to his son, william franklin, was not intended for publication; and the composition is more informal and the narrative more personal than in the second part, from 1730 on, which was written with a view to publication. the entire manuscript shows little evidence of revision. in fact, the expression is so homely and natural that his grandson, william temple franklin, in editing the work changed some of the phrases because he thought them inelegant and vulgar.\r\n\r\nfranklin began the story of his life while on a visit to his friend, bishop shipley, at twyford, in hampshire, southern england, in 1771. he took the manuscript, completed to 1731, with him when he returned to philadelphia in 1775. it was left there with his other papers when he went to france in the following year, and disappeared during the confusion incident to the revolution. twenty-three pages of closely written manuscript fell into the hands of abel jam\r\n','accepted'),
(37,6,'the lady tanglewood',37,34,30,'lady-tanglewood-1701189634399.epub','2023-11-29 00:40:34','2023-12-01 10:25:33',0,'nari knows the rumors about arrowood. forbidden magic. illegal crossbreeding. strange howls in the night. should she go through with the wedding anyway?\r\n\r\nas nari rides toward arrowood and her new home, her head is elsewhere. soon, she will be marrying the clan chief’s handsome son.\r\n\r\ntheir rites of binding must go off without a hitch. every detail of the ceremony needs to demonstrate unity between the two rival clans, as nari of tanglewood weds mordahn of arrowood.\r\n\r\nnari hears the sound of horses’ hooves pounding the trail up ahead and frowns. why is her fiancé riding out to greet her, here in this isolated stretch of road, wearing chainmail and bearing arms?','accepted'),
(38,6,'dirt dealers',38,35,30,'dirt-dealers-1701189768691.pdf','2023-11-29 00:42:48','2023-12-01 10:25:56',0,'a sex scandal. a string of murders. a top secret no one is allowed to know.\r\n\r\na seemingly ordinary murder case is assigned to young fbi special agent heather chase.\r\n\r\nlittle does she know she is about to walk into a dangerous web of deceptions and lies…\r\n\r\nwhy is the fbi involved? the nypd has plenty of talent.\r\n\r\nwhy is her boss there? he never graced his presence at such lowly murder cases before…\r\n\r\nsomething is off from the get go… chase feels it in her gut, but can’t put her finger on.\r\n\r\nwhen highly trained assassins make repeated attempts on her life, she realizes that she must be onto something big.\r\n\r\nrealizing the hunter has become the hunted, chase doubles down; but she has no one she can trust.\r\n\r\nshe instinctively remembers and utilizes her special gift she didn’t know she had…\r\n\r\nthe puzzle pieces finally fall into place and the murder case wraps up…\r\n\r\nexcept…\r\n\r\nchase can’t help shaking the feeling that everything is nothing but a complete setup.\r\n\r\nwill she be able to prove it?','accepted');
/*!40000 ALTER TABLE "user_contribution" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "user_contribution_authors"
--

DROP TABLE IF EXISTS "user_contribution_authors";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_contribution_authors" (
  "author_id" int(11) NOT NULL,
  "author_fullname" varchar(255) NOT NULL,
  "created_at" datetime DEFAULT current_timestamp(),
  "updated_at" datetime DEFAULT current_timestamp(),
  PRIMARY KEY ("author_id"),
  UNIQUE KEY "author_fullname" ("author_fullname")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_contribution_authors"
--

LOCK TABLES "user_contribution_authors" WRITE;
/*!40000 ALTER TABLE "user_contribution_authors" DISABLE KEYS */;
INSERT INTO "user_contribution_authors" VALUES
(35,'h. g. walls','2023-11-28 23:52:54','2023-11-28 23:52:54'),
(36,'benjamin franklin','2023-11-29 00:35:33','2023-11-29 00:35:33'),
(37,'toni cabell','2023-11-29 00:40:34','2023-11-29 00:40:34'),
(38,'a. w. kaylen','2023-11-29 00:42:48','2023-11-29 00:42:48');
/*!40000 ALTER TABLE "user_contribution_authors" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "user_contribution_category"
--

DROP TABLE IF EXISTS "user_contribution_category";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_contribution_category" (
  "category_id" int(11) NOT NULL,
  "category_name" varchar(255) NOT NULL,
  "created_at" datetime DEFAULT current_timestamp(),
  "updated_at" datetime DEFAULT current_timestamp(),
  PRIMARY KEY ("category_id"),
  UNIQUE KEY "category_name" ("category_name")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_contribution_category"
--

LOCK TABLES "user_contribution_category" WRITE;
/*!40000 ALTER TABLE "user_contribution_category" DISABLE KEYS */;
INSERT INTO "user_contribution_category" VALUES
(32,'science fiction, horror, fiction and literature','2023-11-28 23:52:54','2023-11-28 23:52:54'),
(33,'biography/autobiography, history','2023-11-29 00:35:33','2023-11-29 00:35:33'),
(34,'fantasy','2023-11-29 00:40:34','2023-11-29 00:40:34'),
(35,'mystery/detective, thriller','2023-11-29 00:42:48','2023-11-29 00:42:48');
/*!40000 ALTER TABLE "user_contribution_category" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "user_contribution_publisher"
--

DROP TABLE IF EXISTS "user_contribution_publisher";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_contribution_publisher" (
  "publisher_id" int(11) NOT NULL,
  "publisher_name" varchar(255) NOT NULL,
  "created_at" datetime DEFAULT current_timestamp(),
  "updated_at" datetime DEFAULT current_timestamp(),
  PRIMARY KEY ("publisher_id"),
  UNIQUE KEY "publisher_name" ("publisher_name")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_contribution_publisher"
--

LOCK TABLES "user_contribution_publisher" WRITE;
/*!40000 ALTER TABLE "user_contribution_publisher" DISABLE KEYS */;
INSERT INTO "user_contribution_publisher" VALUES
(30,'manybooks','2023-11-28 23:52:54','2023-11-28 23:52:54');
/*!40000 ALTER TABLE "user_contribution_publisher" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "user_details"
--

DROP TABLE IF EXISTS "user_details";
/*!50001 DROP VIEW IF EXISTS "user_details"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "user_details" AS SELECT
 1 AS "user_id",
  1 AS "fullname",
  1 AS "id_number",
  1 AS "department",
  1 AS "email_address",
  1 AS "img_path",
  1 AS "user_status",
  1 AS "created_at",
  1 AS "updated_at",
  1 AS "total_amount",
  1 AS "edited_at" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "user_info"
--

DROP TABLE IF EXISTS "user_info";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_info" (
  "user_id" int(11) NOT NULL,
  "id_number" int(11) NOT NULL,
  "fullname" varchar(255) DEFAULT NULL,
  "department" varchar(100) NOT NULL,
  "user_status" enum('inactive','active') DEFAULT 'inactive',
  "created_at" timestamp NULL DEFAULT current_timestamp(),
  "updated_at" timestamp NULL DEFAULT current_timestamp(),
  "role" varchar(100) NOT NULL,
  "edited_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("user_id"),
  UNIQUE KEY "id_number" ("id_number")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_info"
--

LOCK TABLES "user_info" WRITE;
/*!40000 ALTER TABLE "user_info" DISABLE KEYS */;
INSERT INTO "user_info" VALUES
(6,20170094,'jeffrey c. alerta ','bsit','inactive','2023-11-28 12:23:12','2023-12-02 04:48:30','instructor','2023-11-28 21:40:40'),
(7,20200800,'lance phillip descartin ','bsit','inactive','2023-11-28 12:31:22','2023-12-01 02:52:09','student','2023-11-28 21:40:40'),
(8,20210253,'sofia elizabeth b. descartin ','beed','active','2023-11-28 12:37:34','2023-12-01 16:27:31','student','2023-11-28 21:40:40'),
(9,20220227,'erichelle b. malljao ','bsed','inactive','2023-11-28 12:38:17','2023-12-01 13:11:51','student','2023-11-28 21:40:40'),
(10,20210401,'helena nina t. telin ','bshm','inactive','2023-11-28 12:39:07','2023-11-28 12:45:00','student','2023-11-28 21:40:40');
/*!40000 ALTER TABLE "user_info" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "user_lists"
--

DROP TABLE IF EXISTS "user_lists";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_lists" (
  "list_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "list_name" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT current_timestamp(),
  "list_status" tinyint(1) DEFAULT 0,
  "list_desc" text DEFAULT NULL,
  PRIMARY KEY ("list_id"),
  UNIQUE KEY "list_name" ("list_name"),
  KEY "user_id" ("user_id"),
  CONSTRAINT "user_lists_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "user_info" ("user_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_lists"
--

LOCK TABLES "user_lists" WRITE;
/*!40000 ALTER TABLE "user_lists" DISABLE KEYS */;
/*!40000 ALTER TABLE "user_lists" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "user_login"
--

DROP TABLE IF EXISTS "user_login";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_login" (
  "login_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "email_address" varchar(255) DEFAULT NULL,
  "password" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT current_timestamp(),
  "updated_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("login_id"),
  UNIQUE KEY "email_address" ("email_address"),
  UNIQUE KEY "email_address_2" ("email_address")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_login"
--

LOCK TABLES "user_login" WRITE;
/*!40000 ALTER TABLE "user_login" DISABLE KEYS */;
INSERT INTO "user_login" VALUES
(6,6,'gecagan278@cumzle.com','$2a$10$4bH/ixD9VzwRuOPLD1dIAOhiQl2MsY0w7d2.oBZTMzIdascZm3FX.','2023-11-28 12:23:12','2023-12-01 14:12:43'),
(7,7,'mirih30225@bustayes.com','$2a$10$RlD.mczRZlGj48IJ7SX9GOmT7tIUKFoj8xK5h6rl46zd.oSv4IkjW','2023-11-28 12:31:22','2023-11-28 12:31:22'),
(8,8,'qwe@qwe.qwe','$2a$10$OSa2rC/4rxV5v08bAnJHXOhySJZ3gMVQn.SisXHwbn.LzJbj9m6T2','2023-11-28 12:37:34','2023-11-28 12:37:34'),
(9,9,'asd@asd.asd','$2a$10$R5N.11qCOgumHyFqZ96LeeR2bLGbMxZL9UnIrHhdEqjDXxNrSERuG','2023-11-28 12:38:17','2023-11-28 12:38:17'),
(10,10,'zxc@zxc.zxc','$2a$10$g4WLYZGmAdBklD7l0IlnLO3pLJ9pFVmD8Bp.EaJmtiHsXyus0BXoq','2023-11-28 12:39:07','2023-11-28 12:39:07'),
(11,11,'qwe@asd.zxc','$2a$10$jUUdoELAXnvhMrW7P41eKuv8amPYs2BbAixv0E7ASm7xV/sAMG/IG','2023-11-28 12:39:45','2023-11-28 12:39:45');
/*!40000 ALTER TABLE "user_login" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view "user_notifications"
--

DROP TABLE IF EXISTS "user_notifications";
/*!50001 DROP VIEW IF EXISTS "user_notifications"*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW "user_notifications" AS SELECT
 1 AS "notification_id",
  1 AS "user_id",
  1 AS "message",
  1 AS "notification_date",
  1 AS "status" */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "user_profile_pic"
--

DROP TABLE IF EXISTS "user_profile_pic";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_profile_pic" (
  "picture_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "img_path" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT current_timestamp(),
  "updated_at" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("picture_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "user_profile_pic"
--

LOCK TABLES "user_profile_pic" WRITE;
/*!40000 ALTER TABLE "user_profile_pic" DISABLE KEYS */;
/*!40000 ALTER TABLE "user_profile_pic" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "volumes"
--

DROP TABLE IF EXISTS "volumes";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "volumes" (
  "volume_id" int(11) NOT NULL,
  "book_id" int(11) NOT NULL,
  "copies" int(11) DEFAULT 1,
  "borrowed_copies" int(11) DEFAULT 1,
  PRIMARY KEY ("volume_id","book_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "volumes"
--

LOCK TABLES "volumes" WRITE;
/*!40000 ALTER TABLE "volumes" DISABLE KEYS */;
INSERT INTO "volumes" VALUES
(4927,4927,7,3),
(4928,4928,8,3),
(4929,4929,4,3),
(4930,4930,6,3),
(4931,4931,3,2),
(4932,4932,5,3),
(4933,4933,3,1),
(4934,4934,3,2),
(4935,4935,3,3),
(4936,4936,1,0),
(4937,4937,2,2),
(4938,4938,1,1);
/*!40000 ALTER TABLE "volumes" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view "book_author_info"
--

/*!50001 DROP VIEW IF EXISTS "book_author_info"*/;
/*!50001 CREATE VIEW "book_author_info" AS select "a"."author_id" AS "author_id","a"."author_name" AS "author_name","b"."title" AS "title","b"."edition" AS "edition","p"."publisher_name" AS "publisher_name","b"."copyright_yr" AS "copyright_yr" from ("publishers" "p" left join ("books" "b" left join "authors" "a" on("b"."author_id" = "a"."author_id")) on("p"."publisher_id" = "b"."publisher_id")) */;

--
-- Final view structure for view "book_catalog_info"
--

/*!50001 DROP VIEW IF EXISTS "book_catalog_info"*/;
/*!50001 CREATE VIEW "book_catalog_info" AS select "an"."accession_no" AS "accession_no","bc"."book_subject" AS "book_subject","b"."title" AS "title","bc"."ddc_code" AS "ddc_code",date_format("bc"."create_at",'%M %e, %Y') AS "created" from (("book_catalog" "bc" left join "accession_no" "an" on("bc"."accession_id" = "an"."accession_id")) left join "books" "b" on("an"."book_id" = "b"."book_id")) */;

--
-- Final view structure for view "book_info"
--

/*!50001 DROP VIEW IF EXISTS "book_info"*/;
/*!50001 CREATE VIEW "book_info" AS select "an"."accession_id" AS "accession_id","an"."accession_no" AS "accession_no","b"."book_id" AS "book_id","b"."date_received" AS "date_received","au"."author_name" AS "author_name","b"."title" AS "title","b"."edition" AS "edition","p"."publisher_name" AS "publisher_name","b"."cost_price" AS "cost_price","b"."copyright_yr" AS "copyright_yr","br"."remarks" AS "remarks","bi"."img_path" AS "img_path","b"."total_checkedout" AS "total_checkedout","b"."updated_at" AS "updated_at" from ((((("book_image" "bi" left join "books" "b" on("bi"."book_id" = "b"."book_id")) left join "accession_no" "an" on("an"."book_id" = "b"."book_id")) left join "authors" "au" on("au"."author_id" = "b"."author_id")) left join "publishers" "p" on("p"."publisher_id" = "b"."publisher_id")) left join "book_remarks" "br" on("br"."accession_id" = "an"."accession_id")) */;

--
-- Final view structure for view "book_inventory"
--

/*!50001 DROP VIEW IF EXISTS "book_inventory"*/;
/*!50001 CREATE VIEW "book_inventory" AS select "b"."book_id" AS "book_id","a"."author_name" AS "author_name","b"."title" AS "title","b"."edition" AS "edition","p"."publisher_name" AS "publisher_name","b"."cost_price" AS "cost_price","v"."copies" AS "copies","v"."borrowed_copies" AS "borrowed_copies","b"."book_status" AS "book_status","bi"."img_path" AS "img_path","b"."total_checkedout" AS "total_checkedout" from (((("volumes" "v" left join "books" "b" on("b"."book_id" = "v"."book_id")) left join "publishers" "p" on("b"."publisher_id" = "p"."publisher_id")) left join "authors" "a" on("b"."author_id" = "a"."author_id")) left join "book_image" "bi" on("b"."book_id" = "bi"."book_id")) */;

--
-- Final view structure for view "collection_details"
--

/*!50001 DROP VIEW IF EXISTS "collection_details"*/;
/*!50001 CREATE VIEW "collection_details" AS select "bc"."user_id" AS "user_id","bc"."collection_id" AS "collection_id","bc"."book_id" AS "book_id","b"."title" AS "title","a"."author_name" AS "author_name","bi"."img_path" AS "img_path" from ((("book_collections" "bc" join "books" "b" on("b"."book_id" = "bc"."book_id")) join "authors" "a" on("a"."author_id" = "b"."author_id")) join "book_image" "bi" on("bi"."book_id" = "bc"."book_id")) */;

--
-- Final view structure for view "contribution_details"
--

/*!50001 DROP VIEW IF EXISTS "contribution_details"*/;
/*!50001 CREATE VIEW "contribution_details" AS select "uc"."contribution_id" AS "contribution_id","uc"."user_id" AS "user_id","uca"."author_fullname" AS "author_fullname","ucc"."category_name" AS "category_name","ucp"."publisher_name" AS "publisher_name","uc"."file_title" AS "file_title","uc"."file_path" AS "file_path","ui"."fullname" AS "fullname","ui"."department" AS "department","uc"."file_description" AS "file_description",date_format("uc"."uploaded_date",'%M %e, %Y') AS "uploaded_date","uc"."file_total_downloads" AS "file_total_downloads","uc"."file_status" AS "file_status" from (((("user_contribution" "uc" left join "user_contribution_authors" "uca" on("uca"."author_id" = "uc"."file_author_id")) left join "user_contribution_category" "ucc" on("ucc"."category_id" = "uc"."file_category_id")) left join "user_contribution_publisher" "ucp" on("ucp"."publisher_id" = "uc"."file_publisher_id")) left join "user_info" "ui" on("ui"."user_id" = "uc"."user_id")) */;

--
-- Final view structure for view "fines_and_fees_summary"
--

/*!50001 DROP VIEW IF EXISTS "fines_and_fees_summary"*/;
/*!50001 CREATE VIEW "fines_and_fees_summary" AS select "bt"."transaction_id" AS "transaction_id","bt"."user_id" AS "user_id","ui"."fullname" AS "fullname","ui"."department" AS "department","ui"."role" AS "role","b"."title" AS "title",sum("ff"."fine_amount") AS "total_fines_and_fees","ff"."status" AS "status",date_format("bt"."due_date",'%M %e, %Y') AS "due_date","ff"."fine_date" AS "fine_date" from ((("fines_and_fees" "ff" left join "book_transactions" "bt" on("bt"."transaction_id" = "ff"."transaction_id")) left join "user_info" "ui" on("bt"."user_id" = "ui"."user_id")) left join "books" "b" on("b"."book_id" = "bt"."book_id")) group by "bt"."transaction_id","b"."title","bt"."user_id","ui"."fullname","ui"."department","ui"."role","ff"."status","bt"."due_date" */;

--
-- Final view structure for view "instructor_recommendations_details"
--

/*!50001 DROP VIEW IF EXISTS "instructor_recommendations_details"*/;
/*!50001 CREATE VIEW "instructor_recommendations_details" AS select "ir"."recommendation_id" AS "recommendation_id","ui"."user_id" AS "user_id","b"."book_id" AS "book_id","ui"."fullname" AS "fullname","ui"."department" AS "department","bi"."img_path" AS "img_path","b"."title" AS "title","au"."author_name" AS "author_name","b"."total_checkedout" AS "total_checkedout","ir"."recommendation_status" AS "recommendation_status","ir"."visibility" AS "visibility" from (((("instructor_recommendations" "ir" left join "books" "b" on("b"."book_id" = "ir"."recommended_book_id")) left join "user_info" "ui" on("ui"."user_id" = "ir"."instructor_id")) left join "authors" "au" on("au"."author_id" = "b"."author_id")) left join "book_image" "bi" on("bi"."book_id" = "b"."book_id")) */;

--
-- Final view structure for view "librarian_details"
--

/*!50001 DROP VIEW IF EXISTS "librarian_details"*/;
/*!50001 CREATE VIEW "librarian_details" AS select "l"."librarian_id" AS "librarian_id","l"."firstname" AS "firstname","l"."middlename" AS "middlename","l"."lastname" AS "lastname","li"."email_address" AS "email_address","li"."phone_number" AS "phone_number","li"."hobbies" AS "hobbies","li"."description" AS "description","la"."street_address" AS "street_address","la"."city" AS "city","la"."state_province_region" AS "state_province_region","la"."postal_code" AS "postal_code","la"."address_type" AS "address_type","ll"."username" AS "username","ll"."privilege" AS "privilege" from ("librarian_login" "ll" left join (("librarian" "l" left join "librarian_info" "li" on("l"."librarian_id" = "li"."librarian_id")) left join "librarian_address" "la" on("l"."librarian_id" = "la"."librarian_id")) on("l"."librarian_id" = "ll"."librarian_id")) */;

--
-- Final view structure for view "notification_librarian"
--

/*!50001 DROP VIEW IF EXISTS "notification_librarian"*/;
/*!50001 CREATE VIEW "notification_librarian" AS select "ln2"."notification_id" AS "notification_id","ui"."fullname" AS "fullname","ln2"."message" AS "message","ln2"."notification_type" AS "notification_type",date_format("ln2"."notification_date",'%M %e, %Y') AS "notification_date","ln2"."status" AS "status" from ("librarian_notifications" "ln2" join "user_info" "ui" on("ui"."user_id" = "ln2"."user_id")) order by date_format("ln2"."notification_date",'%M %e, %Y') desc,case when "ln2"."status" = 'unread' then 1 else 2 end */;

--
-- Final view structure for view "online_department"
--

/*!50001 DROP VIEW IF EXISTS "online_department"*/;
/*!50001 CREATE VIEW "online_department" AS select "ui"."department" AS "department","ll"."status" AS "status","ll"."date_login" AS "date_login" from ("login_logs" "ll" join "user_info" "ui" on("ui"."user_id" = "ll"."user_id")) */;

--
-- Final view structure for view "presonalize_recomendations_details"
--

/*!50001 DROP VIEW IF EXISTS "presonalize_recomendations_details"*/;
/*!50001 CREATE VIEW "presonalize_recomendations_details" AS select "pr"."recommendation_id" AS "recommendation_id","ui"."user_id" AS "user_id","b"."book_id" AS "book_id","ui"."fullname" AS "fullname","ui"."department" AS "department","bi"."img_path" AS "img_path","b"."title" AS "title","au"."author_name" AS "author_name","b"."total_checkedout" AS "total_checkedout","pr"."recommendation_status" AS "recommendation_status" from (((("personal_recommendations" "pr" left join "books" "b" on("b"."book_id" = "pr"."recommended_book_id")) left join "user_info" "ui" on("ui"."user_id" = "pr"."user_id")) left join "authors" "au" on("au"."author_id" = "b"."author_id")) left join "book_image" "bi" on("bi"."book_id" = "b"."book_id")) */;

--
-- Final view structure for view "recomendations_details"
--

/*!50001 DROP VIEW IF EXISTS "recomendations_details"*/;
/*!50001 CREATE VIEW "recomendations_details" AS select "ir"."recommendation_id" AS "recommendation_id","ui"."fullname" AS "fullname","ui"."department" AS "department","b"."title" AS "title","b"."total_checkedout" AS "total_checkedout","ir"."recommendation_status" AS "recommendation_status","ir"."visibility" AS "visibility" from (("instructor_recommendations" "ir" left join "books" "b" on("b"."book_id" = "ir"."recommended_book_id")) left join "user_info" "ui" on("ui"."user_id" = "ir"."instructor_id")) */;

--
-- Final view structure for view "renewal_details"
--

/*!50001 DROP VIEW IF EXISTS "renewal_details"*/;
/*!50001 CREATE VIEW "renewal_details" AS select "br"."renewal_id" AS "renewal_id","bt"."transaction_id" AS "transaction_id","ui"."user_id" AS "user_id","ui"."fullname" AS "fullname","ui"."department" AS "department","b"."title" AS "title","br"."renewal_days" AS "renewal_days",date_format("bt"."due_date",'%M %e, %Y') AS "original_due_date",date_format("bt"."due_date" + interval "br"."renewal_days" day,'%M %e, %Y') AS "new_due_date","br"."approval_status" AS "approval_status" from ((("book_renewals" "br" join "book_transactions" "bt" on("br"."transaction_id" = "bt"."transaction_id")) join "user_info" "ui" on("bt"."user_id" = "ui"."user_id")) join "books" "b" on("bt"."book_id" = "b"."book_id")) */;

--
-- Final view structure for view "transactions_book"
--

/*!50001 DROP VIEW IF EXISTS "transactions_book"*/;
/*!50001 CREATE VIEW "transactions_book" AS select "bt"."transaction_id" AS "transaction_id","bt"."user_id" AS "user_id","b"."title" AS "title","a"."author_name" AS "author_name","ui"."fullname" AS "fullname","ui"."department" AS "department","bt"."transaction_type" AS "transaction_type",date_format("bt"."transaction_date",'%M %e, %Y') AS "transaction_date",date_format("bt"."due_date",'%M %e, %Y') AS "due_date","bt"."status" AS "status",date_format("bt"."updated_at",'%M %e, %Y') AS "last_date","bi"."img_path" AS "img_path" from (((("book_transactions" "bt" join "books" "b" on("b"."book_id" = "bt"."book_id")) join "user_info" "ui" on("ui"."user_id" = "bt"."user_id")) join "authors" "a" on("a"."author_id" = "b"."author_id")) join "book_image" "bi" on("bi"."book_id" = "bt"."book_id")) */;

--
-- Final view structure for view "transactions_pending"
--

/*!50001 DROP VIEW IF EXISTS "transactions_pending"*/;
/*!50001 CREATE VIEW "transactions_pending" AS select "pt"."pending_transaction_id" AS "pending_transaction_id","pt"."user_id" AS "user_id","b"."title" AS "title","ui"."fullname" AS "fullname","ui"."department" AS "department","pt"."transaction_type" AS "transaction_type","pt"."status" AS "status",date_format("pt"."request_date",'%M %e, %Y') AS "request_date",date_format("pt"."approve_date",'%M %e, %Y') AS "approve_date","bi"."img_path" AS "img_path" from ((("pending_transactions" "pt" join "books" "b" on("b"."book_id" = "pt"."book_id")) join "user_info" "ui" on("ui"."user_id" = "pt"."user_id")) join "book_image" "bi" on("bi"."book_id" = "pt"."book_id")) */;

--
-- Final view structure for view "user_details"
--

/*!50001 DROP VIEW IF EXISTS "user_details"*/;
/*!50001 CREATE VIEW "user_details" AS select "ui"."user_id" AS "user_id","ui"."fullname" AS "fullname","ui"."id_number" AS "id_number","ui"."department" AS "department","ul"."email_address" AS "email_address","upp"."img_path" AS "img_path","ui"."user_status" AS "user_status",date_format("ui"."created_at",'%M %e, %Y') AS "created_at",date_format("ui"."updated_at",'%M %e, %Y') AS "updated_at",sum("faf"."total_fines_and_fees") AS "total_amount",date_format("ui"."edited_at",'%M %e, %Y') AS "edited_at" from ((("user_info" "ui" left join "user_login" "ul" on("ui"."user_id" = "ul"."user_id")) left join "user_profile_pic" "upp" on("ui"."user_id" = "upp"."user_id")) left join "fines_and_fees_summary" "faf" on("faf"."user_id" = "ui"."user_id")) group by "ui"."user_id" */;

--
-- Final view structure for view "user_notifications"
--

/*!50001 DROP VIEW IF EXISTS "user_notifications"*/;
/*!50001 CREATE VIEW "user_notifications" AS select "n"."notification_id" AS "notification_id","n"."user_id" AS "user_id","n"."message" AS "message",date_format("n"."creation_date",'%M %e, %Y') AS "notification_date","n"."status" AS "status" from "notifications" "n" order by "n"."creation_date" desc,case when "n"."status" = 'unread' then 1 else 2 end */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 13:42:15

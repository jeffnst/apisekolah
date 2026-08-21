-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sekolah`
--

DROP TABLE IF EXISTS `sekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah` (
  `sekolah_id` varchar(36) NOT NULL,
  `npsn` varchar(20) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT NULL,
  `kode_kabupaten` varchar(5) DEFAULT NULL,
  `kecamatan` varchar(120) DEFAULT NULL,
  `alamat_jalan` text,
  `nama_dusun` varchar(150) DEFAULT NULL,
  `kode_pos` varchar(20) DEFAULT NULL,
  `rt` varchar(10) DEFAULT NULL,
  `rw` varchar(10) DEFAULT NULL,
  `bentuk_pendidikan` varchar(60) DEFAULT NULL,
  `status_sekolah` varchar(30) DEFAULT NULL,
  `akreditasi` varchar(30) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `website` varchar(500) DEFAULT NULL,
  `nomor_telepon` varchar(60) DEFAULT NULL,
  `lintang` varchar(30) DEFAULT NULL,
  `bujur` varchar(30) DEFAULT NULL,
  `luas_tanah_milik` int DEFAULT NULL,
  `luas_tanah_bukan_milik` int DEFAULT NULL,
  `daya_listrik` int DEFAULT NULL,
  `sumber_listrik` varchar(60) DEFAULT NULL,
  `akses_internet` varchar(60) DEFAULT NULL,
  `akses_internet_2` varchar(60) DEFAULT NULL,
  `waktu_penyelenggaraan` varchar(60) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `semester_keterangan` varchar(60) DEFAULT NULL,
  `yayasan_id` varchar(36) DEFAULT NULL,
  `yayasan` varchar(255) DEFAULT NULL,
  `path_file` varchar(700) DEFAULT NULL,
  `extra_json` json DEFAULT NULL,
  `fetched_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kode_provinsi_dikdasmen` char(8) DEFAULT NULL,
  `kode_kabupaten_dikdasmen` char(8) DEFAULT NULL,
  `kode_kecamatan` char(6) DEFAULT NULL,
  `nama_kecamatan` varchar(100) DEFAULT NULL,
  `kode_provinsi_kemendagri` char(2) DEFAULT NULL,
  `nama_provinsi_kemendagri` varchar(255) DEFAULT NULL,
  `kode_kecamatan_kemendagri` char(6) DEFAULT NULL,
  `nama_kabupaten_kemendagri` varchar(255) DEFAULT NULL,
  `nama_kecamatan_kemendagri` varchar(50) DEFAULT NULL,
  `kec_clean` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sekolah_id`),
  UNIQUE KEY `uniq_npsn` (`npsn`),
  KEY `idx_kab` (`kode_kabupaten`),
  KEY `idx_bentuk` (`bentuk_pendidikan`),
  KEY `idx_status` (`status_sekolah`),
  KEY `idx_kab_kemendagri` (`kode_kabupaten`),
  KEY `idx_prov_kemendagri` (`kode_provinsi_kemendagri`),
  KEY `idx_kab_diknas` (`kode_kabupaten_dikdasmen`),
  KEY `idx_prov_diknas` (`kode_provinsi_dikdasmen`),
  KEY `idx_kec_diknas` (`kode_kecamatan`),
  KEY `idx_kab_dagri` (`kode_kabupaten`),
  KEY `idx_kab_kecclean` (`kode_kabupaten`,`kec_clean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `sekolah` WRITE;
/*!40000 ALTER TABLE `sekolah` DISABLE KEYS */;
INSERT INTO `sekolah` VALUES ('0000077A-8D18-E111-9283-E3E7903308C7','20533506','SDN KALIASIN VII/ 286','Prov. Jawa Timur','Kota Surabaya','35.78','Kec. Genteng','Jl. Embong Blimbing No. 40','Embong Kaliasin','60271','5','8','SD','NEGERI','A','sdnkaliasin7@gmail.com',NULL,'0315458928','-7.2716','112.7395',976,0,2200,'PLN','Fibre Optic','Dedicated','Pagi/5 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 19:56:35','050000','056000',NULL,NULL,'35','Jawa Timur','357807','Kota Surabaya','GENTENG','Genteng'),('000013C9-2FF5-E011-83BE-5FB68E59ED95','10494384','SD SWASTA CERENTI SUBUR','Prov. Riau','Kab. Kuantan Singingi','14.09','Kec. Kuantan Hilir Seberang','Jl. Datuk Pinang Baribut Desa Rawang Oguong PT. Cerenti Subur ','Rawang Oguang','29561','0','0','SD','SWASTA','A','sds.csubur@gmail.com',NULL,'082383092202','-0.3796','101.6784',3783,0,1300,'Diesel','Wireless','Broadband','Pagi/6 hari','20252','2025/2026 Genap','DDF9C012-ED2F-481B-AAB3-1968B507D05B','Johan Sentosa',NULL,NULL,'2026-08-20 11:57:21','090000','091400','091413','Kuantan Hilir Seberang','14','Riau','140913','Kuantan Singingi','KUANTAN HILIR SEBERANG','Kuantan Hilir Seberang'),('00001A79-2FF5-E011-B3C4-73B171DD5206','10304586','SD NEGERI 17 KAYU ARO','Prov. Sumatera Barat','Kota Padang','13.71','Kec. Bungus Teluk Kabung','Jln Kayu Aro',NULL,'25244','1','6','SD','NEGERI','B','sdn17kayuarobungus@gmail.com',NULL,NULL,'-1.0169','100.4162',2211,0,900,'PLN','Wireless','Dedicated','Pagi/5 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 11:34:16','080000','086100','086101','Bungus Teluk Kabung','13','Sumatera Barat','137105','Kota Padang','BUNGUS TELUK KABUNG','Bungus Teluk Kabung'),('00002056-2DF5-E011-BEAF-AFCB458E7113','20306275','SD NEGERI BENDOSARI','Prov. Jawa Tengah','Kab. Purworejo','33.06','Kec. Gebang','Bendosari, Gebang','Bendosari','54191','1','1','SD','NEGERI','A','sdnbendosari@gmail.com',NULL,'08726486169','-7.6536','109.9928',0,1600,900,'PLN','Fibre Optic','Dedicated','Pagi/6 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 17:48:00','030000','030600',NULL,NULL,'33','Jawa Tengah','330614','Purworejo','GEBANG','Gebang'),('00002596-2BF5-E011-9402-11FA3B413521','20107025','SMP Yayasan Pendidikan Mulia','Prov. D.K.I. Jakarta','Kota Adm. Jakarta Selatan','31.74','Kec. Kebayoran Lama','Jl. Ciputat Raya 1-2',NULL,'12240','4','10','SMP','SWASTA','B','smp.ypmulia@yahoo.com',NULL,'02172895758','-6.2828','106.771',0,1740,11000,'PLN','Fibre Optic','Broadband','Sehari Penuh/5 hari','20252','2025/2026 Genap','21C3D3DB-6CA3-E211-B6B0-4BC24E1C8C9E','YAYASAN PENDIDIKAN MULIAMANDIR',NULL,NULL,'2026-08-20 14:54:40','010000','016300',NULL,NULL,'31','Dki Jakarta','317405','Kota Adm. Jakarta Selatan','KEBAYORAN LAMA','Kebayoran Lama'),('000025EA-FCFA-E111-A1F5-7FE8C9BDAA5F','69863193','SD NEGERI 078499 Eho ','Prov. Sumatera Utara','Kab. Nias','12.04','Kec. Mau','Jalan Faomakhoda Dusun-II Eho','Eho','22852','2','3','SD','NEGERI','B','gabrielgulo@gmail.com','http://www.gabrielgulo@gmail.com','081397022220','1.0285','97.7829',3750,0,900,'PLN','Wireless','Dedicated','Pagi/6 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 11:00:59','070000','071100','071125','Mau','12','Sumatera Utara','120428','Nias','Mau','Mau'),('0000265D-0C26-E111-B537-C903AF9DACE2','10502094','SLBN Kuala Tungkal','Prov. Jambi','Kab. Tanjung Jabung Barat','15.06','Kec. Tungkal Ilir','Jl. Prof. Dr. Soedewi Maschun Sofwan,SH, Pembengis ',NULL,'36511','1','0','SLB','NEGERI','B','slbnegeri_kualatungkal@yahoo.co.id','http://slbnkualatungkal.sch.id','0742323081','-0.8402','103.4354',7140,0,5500,'PLN','Fibre Optic','Broadband','Sehari Penuh/5 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 12:14:26','100000','100400','100403','Tungkal Ilir','15','Jambi','150602','Tanjung Jabung Barat','TUNGKAL ILIR','Tungkal Ilir'),('0000275A-2DF5-E011-9EA0-E379B062A013','20306118','SMP NEGERI 16 PURWOREJO','Prov. Jawa Tengah','Kab. Purworejo','33.06','Kec. Kutoarjo','Jalan Wismoaji  Kutoarjo','Kutoarjo','54251','2','5','SMP','NEGERI','A','smpn16pwr@gmail.com','http://smpn16purworejo.sch.id/','0275641131','-7.716669','109.9152088',4800,0,7700,'PLN','Wireless','Shared','Pagi/6 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 17:48:04','030000','030600',NULL,NULL,'33','Jawa Tengah','330609','Purworejo','KUTOARJO','Kutoarjo'),('00002BC6-0D26-E111-8CA1-F72EC33DD476','40302589','SMP NEGERI 6 WATAMPONE','Prov. Sulawesi Selatan','Kab. Bone','73.08','Kec. Tanete Riattang','Jl. Lapawawoi Kr. Sigeri',NULL,'92714','1','1','SMP','NEGERI','A','smpn6watampone@gmail.com','https://bit.ly/smpn6watampone','048123029','-4.559623','120.328231',12154,0,7700,'PLN','Wireless','Shared','Siang/6 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 21:52:00','190000','190700',NULL,NULL,'73','Sulawesi Selatan','730821','Bone','TANETE RIATTANG','Tanete Riattang'),('0000317E-30F5-E011-A2E9-75E3D5EDA186','30404495','SD NEGERI 001 TELUK HARAPAN','Prov. Kalimantan Timur','Kab. Berau','64.03','Kec. Pulau Maratua','Jalan Langoan RT III Teluk Harapan','Teluk Harapan','77381','3','0','SD','NEGERI','B','sdnegeri001telukharapan@gmail.com',NULL,'081258890313','2.2424','118.5649',2560,0,5500,'PLN','Seluler','Broadband','Pagi/6 hari','20252','2025/2026 Genap',NULL,NULL,NULL,NULL,'2026-08-20 21:22:29','160000','160300',NULL,NULL,'64','Kalimantan Timur','640311','Berau','Pulau Maratua','Pulau Maratua');
/*!40000 ALTER TABLE `sekolah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end sekolah)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wilayah`
--

DROP TABLE IF EXISTS `wilayah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wilayah` (
  `kode_provinsi` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_provinsi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `kode_kabupaten` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kabupaten` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `kode_kecamatan` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kecamatan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `kode_provinsi_mendagri` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_provinsi_mendagri` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_kabupaten_mendagri` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_kabupaten_mendagri` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_kecamatan_mendagri` text COLLATE utf8mb4_general_ci,
  `nama_kecamatan_mendagri` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`kode_kecamatan`),
  KEY `idx_kab` (`kode_kabupaten`),
  KEY `idx_prov` (`kode_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayah`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `wilayah` WRITE;
/*!40000 ALTER TABLE `wilayah` DISABLE KEYS */;
INSERT INTO `wilayah` VALUES ('010000','D.K.I. Jakarta','010100','Kab. Adm. Kep. Seribu','010101','Kepulauan Seribu Selatan','31','Dki Jakarta','31.01','Adm. Kep. Seribu','310102','Kepulauan Seribu Selatan'),('010000','D.K.I. Jakarta','010100','Kab. Adm. Kep. Seribu','010102','Kepulauan Seribu Utara','31','Dki Jakarta','31.01','Adm. Kep. Seribu','310101','Kepulauan Seribu Utara'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016001','Tanah Abang','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317107','Tanah Abang'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016002','Menteng','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317106','Menteng'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016003','Senen','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317104','Senen'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016004','Johar Baru','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317108','Johar Baru'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016005','Cempaka Putih','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317105','Cempaka Putih'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016006','Kemayoran','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317103','Kemayoran'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016007','Sawah Besar','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317102','Sawah Besar'),('010000','D.K.I. Jakarta','016000','Kota Adm. Jakarta Pusat','016008','Gambir','31','Dki Jakarta','31.71','Kota Adm. Jakarta Pusat','317101','Gambir');
/*!40000 ALTER TABLE `wilayah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end wilayah)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `desa`
--

DROP TABLE IF EXISTS `desa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `propinsi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prop_id` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kabupaten` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kab_id` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kecamatan` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kec_id` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `desa_id` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_adm` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `koordinat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `latitude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `longitude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `lat_kecamatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `long_kecamatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `koord_kecamatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `lat_kabupaten` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `long_kabupaten` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `koord_kabupaten` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `lat_propinsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `long_propinsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `koord_propinsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kec_clean` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode` (`kode`),
  KEY `idx_kab_kecclean` (`kab_id`,`kec_clean`)
) ENGINE=InnoDB AUTO_INCREMENT=83438 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desa`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `desa` WRITE;
/*!40000 ALTER TABLE `desa` DISABLE KEYS */;
INSERT INTO `desa` VALUES (1,'11.01.01.2001','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','KEUDE BAKONGAN','2001','DESA','2.9613197,97.3861682','2.9613197','97.3861682','2.9613197','97.3861682','2.9613197,97.3861682','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(2,'11.01.01.2002','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','UJONG MANGKI','2002','DESA','2.9625347,97.4273195','2.9625347','97.4273195','2.9622427','97.4273195','2.9622427,97.47059349999999','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(3,'11.01.01.2003','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','UJONG PADANG','2003','DESA','2.9604321,97.4353212','2.9604321','97.4353212','2.9622427','97.4353212','2.9622427,97.47059349999999','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(4,'11.01.01.2004','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','GAMPONG DRIEN','2004','DESA','2.9613197,97.3861682','2.9613197','97.3861682','2.9613197','97.3861682','2.9622427,97.47059349999999','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(5,'11.01.01.2015','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','DARUL IKHSAN','2015','DESA','2.922555,97.478719','2.922555','97.478719','2.922555','97.478719','2.9622427,97.47059349999999','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(6,'11.01.01.2016','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','PADANG BEURAHAN','2016','DESA','2.9279924,97.4648398','2.9279924','97.4648398','2.9279924','97.4648398','2.9622427,97.47059349999999','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(7,'11.01.01.2017','ACEH','11','ACEH SELATAN','01','BAKONGAN','01','GAMPONG BARO','2017','DESA','2.9216958,97.4926488','2.9216958','97.4926488','2.9216958','97.4926488','2.9622427,97.47059349999999','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','BAKONGAN'),(8,'11.01.02.2001','ACEH','11','ACEH SELATAN','01','KLUET UTARA','02','FAJAR HARAPAN','2001','DESA','3.1320374,97.321747','3.1320374','97.321747','3.1221015','97.3408535','3.1221015,97.3408535','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','KLUET UTARA'),(9,'11.01.02.2002','ACEH','11','ACEH SELATAN','01','KLUET UTARA','02','KRUENG BATEE','2002','DESA','3.118326,97.3210095','3.118326','97.3210095','3.1221015','97.3408535','3.1221015,97.3408535','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','KLUET UTARA'),(10,'11.01.02.2003','ACEH','11','ACEH SELATAN','01','KLUET UTARA','02','PASI KUALA ASAHAN','2003','DESA','3.117636,97.3029009','3.117636','97.3029009','3.1221015','97.3408535','3.1221015,97.3408535','3.3115056','97.35165579999999','3.3115056,97.35165579999999','4.695135','96.7493993','4.695135,96.7493993','2022-08-31 17:55:59','KLUET UTARA');
/*!40000 ALTER TABLE `desa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end desa)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kecamatan_missing`
--

DROP TABLE IF EXISTS `kecamatan_missing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kecamatan_missing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_kabupaten` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_kabupaten_mendagri` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_kabupaten` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_kecamatan` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_kecamatan_kemendagri` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_kecamatan_mendagri` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jumlah_sekolah` int DEFAULT '0',
  `edited` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kab` (`kode_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kecamatan_missing`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `kecamatan_missing` WRITE;
/*!40000 ALTER TABLE `kecamatan_missing` DISABLE KEYS */;
INSERT INTO `kecamatan_missing` VALUES (1,'12.04','12.04','NIAS','Kec. Mau','12.04.28',NULL,31,0),(2,'64.03','64.03','BERAU','Kec. Pulau Maratua','64.03.11',NULL,12,0),(3,'14.07','14.07','ROKAN HILIR','Kec. Tanjung Medan','14.07.08',NULL,89,0),(4,'16.02','16.02','OGAN KOMERING ILIR','Kec. Kota Kayu Agung','16.02.05',NULL,139,0),(5,'12.08','12.08','SIMALUNGUN','Kec. Silau Kahean','12.08.27',NULL,51,0),(6,'73.71','73.71','KOTA MAKASSAR','Kec. Panakukkang','73.71.09',NULL,194,0),(7,'73.15','73.15','PINRANG','Kec. Lanrisang','73.15.10',NULL,51,0),(8,'15.08',NULL,'BUNGO','Kec. Pasar Muara Bungo','15.08.03',NULL,32,0),(9,'11.14',NULL,'ACEH JAYA','Kec. Setia Bakti','11.14.03',NULL,44,0),(10,'73.05',NULL,'TAKALAR','Kepulauan Tanakeke',NULL,NULL,29,0);
/*!40000 ALTER TABLE `kecamatan_missing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end kecamatan_missing)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sekolah_ruang`
--

DROP TABLE IF EXISTS `sekolah_ruang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah_ruang` (
  `sekolah_id` varchar(36) NOT NULL,
  `laboratorium_bahasa_baik` int DEFAULT NULL,
  `laboratorium_bahasa_rusak_ringan` int DEFAULT NULL,
  `laboratorium_bahasa_rusak_sedang` int DEFAULT NULL,
  `laboratorium_bahasa_rusak_berat` int DEFAULT NULL,
  `laboratorium_ipa_baik` int DEFAULT NULL,
  `laboratorium_ipa_rusak_ringan` int DEFAULT NULL,
  `laboratorium_ipa_rusak_sedang` int DEFAULT NULL,
  `laboratorium_ipa_rusak_berat` int DEFAULT NULL,
  `laboratorium_ips_baik` int DEFAULT NULL,
  `laboratorium_ips_rusak_ringan` int DEFAULT NULL,
  `laboratorium_ips_rusak_sedang` int DEFAULT NULL,
  `laboratorium_ips_rusak_berat` int DEFAULT NULL,
  `laboratorium_komputer_baik` int DEFAULT NULL,
  `laboratorium_komputer_rusak_ringan` int DEFAULT NULL,
  `laboratorium_komputer_rusak_sedang` int DEFAULT NULL,
  `laboratorium_komputer_rusak_berat` int DEFAULT NULL,
  `laboratorium_multimedia_baik` int DEFAULT NULL,
  `laboratorium_multimedia_rusak_ringan` int DEFAULT NULL,
  `laboratorium_multimedia_rusak_sedang` int DEFAULT NULL,
  `laboratorium_multimedia_rusak_berat` int DEFAULT NULL,
  `ruang_perpustakaan_baik` int DEFAULT NULL,
  `ruang_perpustakaan_rusak_ringan` int DEFAULT NULL,
  `ruang_perpustakaan_rusak_sedang` int DEFAULT NULL,
  `ruang_perpustakaan_rusak_berat` int DEFAULT NULL,
  `ruang_kelas_baik` int DEFAULT NULL,
  `ruang_kelas_rusak_ringan` int DEFAULT NULL,
  `ruang_kelas_rusak_sedang` int DEFAULT NULL,
  `ruang_kelas_rusak_berat` int DEFAULT NULL,
  `laboratorium_fisika_baik` int DEFAULT NULL,
  `laboratorium_fisika_rusak_ringan` int DEFAULT NULL,
  `laboratorium_fisika_rusak_sedang` int DEFAULT NULL,
  `laboratorium_fisika_rusak_berat` int DEFAULT NULL,
  `laboratorium_kimia_baik` int DEFAULT NULL,
  `laboratorium_kimia_rusak_ringan` int DEFAULT NULL,
  `laboratorium_kimia_rusak_sedang` int DEFAULT NULL,
  `laboratorium_kimia_rusak_berat` int DEFAULT NULL,
  `laboratorium_biologi_baik` int DEFAULT NULL,
  `laboratorium_biologi_rusak_ringan` int DEFAULT NULL,
  `laboratorium_biologi_rusak_sedang` int DEFAULT NULL,
  `laboratorium_biologi_rusak_berat` int DEFAULT NULL,
  `extra_json` json DEFAULT NULL,
  PRIMARY KEY (`sekolah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah_ruang`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `sekolah_ruang` WRITE;
/*!40000 ALTER TABLE `sekolah_ruang` DISABLE KEYS */;
INSERT INTO `sekolah_ruang` VALUES ('0000077A-8D18-E111-9283-E3E7903308C7',0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,9,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('000013C9-2FF5-E011-83BE-5FB68E59ED95',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('00001A79-2FF5-E011-B3C4-73B171DD5206',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('00002056-2DF5-E011-BEAF-AFCB458E7113',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,5,1,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('00002596-2BF5-E011-9402-11FA3B413521',0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('000025EA-FCFA-E111-A1F5-7FE8C9BDAA5F',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('0000265D-0C26-E111-B537-C903AF9DACE2',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,9,10,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('0000275A-2DF5-E011-9EA0-E379B062A013',0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('00002BC6-0D26-E111-8CA1-F72EC33DD476',0,0,0,0,1,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),('0000317E-30F5-E011-A2E9-75E3D5EDA186',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `sekolah_ruang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end sekolah_ruang)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sekolah_ptk`
--

DROP TABLE IF EXISTS `sekolah_ptk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah_ptk` (
  `sekolah_id` varchar(36) NOT NULL,
  `ptk_guru_l` int DEFAULT NULL,
  `ptk_guru_p` int DEFAULT NULL,
  PRIMARY KEY (`sekolah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah_ptk`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `sekolah_ptk` WRITE;
/*!40000 ALTER TABLE `sekolah_ptk` DISABLE KEYS */;
INSERT INTO `sekolah_ptk` VALUES ('0000077A-8D18-E111-9283-E3E7903308C7',3,10),('000013C9-2FF5-E011-83BE-5FB68E59ED95',3,9),('00001A79-2FF5-E011-B3C4-73B171DD5206',2,7),('00002056-2DF5-E011-BEAF-AFCB458E7113',2,5),('00002596-2BF5-E011-9402-11FA3B413521',4,5),('000025EA-FCFA-E111-A1F5-7FE8C9BDAA5F',3,5),('0000265D-0C26-E111-B537-C903AF9DACE2',3,11),('0000275A-2DF5-E011-9EA0-E379B062A013',13,17),('00002BC6-0D26-E111-8CA1-F72EC33DD476',7,29),('0000317E-30F5-E011-A2E9-75E3D5EDA186',6,3);
/*!40000 ALTER TABLE `sekolah_ptk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end sekolah_ptk)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sekolah_kurikulum`
--

DROP TABLE IF EXISTS `sekolah_kurikulum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah_kurikulum` (
  `sekolah_id` varchar(36) NOT NULL,
  `semester_id` varchar(20) DEFAULT NULL,
  `kurikulum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sekolah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah_kurikulum`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `sekolah_kurikulum` WRITE;
/*!40000 ALTER TABLE `sekolah_kurikulum` DISABLE KEYS */;
INSERT INTO `sekolah_kurikulum` VALUES ('0000077A-8D18-E111-9283-E3E7903308C7','20251','Kurikulum SD Merdeka'),('000013C9-2FF5-E011-83BE-5FB68E59ED95','20251','Kurikulum SD Merdeka'),('00001A79-2FF5-E011-B3C4-73B171DD5206','20251','Kurikulum SD Merdeka'),('00002056-2DF5-E011-BEAF-AFCB458E7113','20251','Kurikulum SD Merdeka'),('00002596-2BF5-E011-9402-11FA3B413521','20252','Lainnya'),('000025EA-FCFA-E111-A1F5-7FE8C9BDAA5F','20251','Kurikulum SD Merdeka'),('0000265D-0C26-E111-B537-C903AF9DACE2','20251','Kurikulum SMLB Merdeka'),('0000275A-2DF5-E011-9EA0-E379B062A013','20251','Kurikulum SMP Merdeka'),('00002BC6-0D26-E111-8CA1-F72EC33DD476','20251','Lainnya'),('0000317E-30F5-E011-A2E9-75E3D5EDA186','20251','Kurikulum SD Merdeka');
/*!40000 ALTER TABLE `sekolah_kurikulum` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end sekolah_kurikulum)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sekolah_rasio`
--

DROP TABLE IF EXISTS `sekolah_rasio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah_rasio` (
  `sekolah_id` varchar(36) NOT NULL,
  `jml_pd` int DEFAULT NULL,
  `jml_rombel` int DEFAULT NULL,
  `rasio_siswa_rombel` double DEFAULT NULL,
  `jml_pd_p` int DEFAULT NULL,
  `jml_pd_l` int DEFAULT NULL,
  `rasio_rombel_ruang_kelas` double DEFAULT NULL,
  `rasio_siswa_guru` double DEFAULT NULL,
  `persentase_guru_klasifikasi` double DEFAULT NULL,
  `persentase_guru_sertifikasi` double DEFAULT NULL,
  `persentase_guru_ASN` double DEFAULT NULL,
  `rasio_ruang_kelas_layak` double DEFAULT NULL,
  PRIMARY KEY (`sekolah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah_rasio`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `sekolah_rasio` WRITE;
/*!40000 ALTER TABLE `sekolah_rasio` DISABLE KEYS */;
INSERT INTO `sekolah_rasio` VALUES ('0000077A-8D18-E111-9283-E3E7903308C7',302,12,26,157,145,NULL,NULL,NULL,NULL,NULL,NULL),('000013C9-2FF5-E011-83BE-5FB68E59ED95',262,12,22,111,151,NULL,NULL,NULL,NULL,NULL,NULL),('00001A79-2FF5-E011-B3C4-73B171DD5206',155,6,26,73,82,NULL,NULL,NULL,NULL,NULL,NULL),('00002056-2DF5-E011-BEAF-AFCB458E7113',63,6,11,30,33,NULL,NULL,NULL,NULL,NULL,NULL),('00002596-2BF5-E011-9402-11FA3B413521',116,5,24,54,62,NULL,NULL,NULL,NULL,NULL,NULL),('000025EA-FCFA-E111-A1F5-7FE8C9BDAA5F',35,6,6,18,17,NULL,NULL,NULL,NULL,NULL,NULL),('0000265D-0C26-E111-B537-C903AF9DACE2',117,43,3,41,76,NULL,NULL,NULL,NULL,NULL,NULL),('0000275A-2DF5-E011-9EA0-E379B062A013',471,15,32,222,249,NULL,NULL,NULL,NULL,NULL,NULL),('00002BC6-0D26-E111-8CA1-F72EC33DD476',530,18,30,250,280,NULL,NULL,NULL,NULL,NULL,NULL),('0000317E-30F5-E011-A2E9-75E3D5EDA186',149,7,22,56,93,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sekolah_rasio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end sekolah_rasio)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sekolah_foto`
--

DROP TABLE IF EXISTS `sekolah_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah_foto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sekolah_id` varchar(36) NOT NULL,
  `path_file` varchar(700) DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sek` (`sekolah_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1923190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah_foto`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `sekolah_foto` WRITE;
/*!40000 ALTER TABLE `sekolah_foto` DISABLE KEYS */;
INSERT INTO `sekolah_foto` VALUES (2468,'8D2EC06D-6409-48E1-81E6-8C819FB27BB1','https://file.data.kemendikdasmen.go.id/sekolahkita/P2/P297/P2970621-2.jpg',0),(2469,'8D2EC06D-6409-48E1-81E6-8C819FB27BB1','https://file.data.kemendikdasmen.go.id/sekolahkita/P2/P297/P2970621-1.jpg',1),(2470,'2AD13E93-20D2-471D-8DBC-82FFADDDDC90','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9956924-2.jpg',0),(2471,'2AD13E93-20D2-471D-8DBC-82FFADDDDC90','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9956924-1.jpg',1),(2472,'06EA4002-C083-4DD2-9A19-F2769D97E348','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9959802-7.jpg',0),(2473,'06EA4002-C083-4DD2-9A19-F2769D97E348','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9959802-5.jpg',1),(2474,'06EA4002-C083-4DD2-9A19-F2769D97E348','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9959802-3.jpg',2),(2475,'06EA4002-C083-4DD2-9A19-F2769D97E348','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9959802-1.jpg',3),(2476,'06EA4002-C083-4DD2-9A19-F2769D97E348','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9959802-4.jpg',4),(2477,'06EA4002-C083-4DD2-9A19-F2769D97E348','https://file.data.kemendikdasmen.go.id/sekolahkita/P9/P995/P9959802-2.jpg',5);
/*!40000 ALTER TABLE `sekolah_foto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end sekolah_foto)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `scrape_progress`
--

DROP TABLE IF EXISTS `scrape_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrape_progress` (
  `kode_kabupaten` varchar(5) NOT NULL,
  `nama_db` varchar(40) DEFAULT NULL,
  `nama_api` varchar(60) DEFAULT NULL,
  `provinsi` varchar(40) DEFAULT NULL,
  `status` enum('pending','running','done','failed') NOT NULL DEFAULT 'pending',
  `total_sekolah` int NOT NULL DEFAULT '0',
  `last_page` int NOT NULL DEFAULT '-1',
  `last_sekolah_done` int NOT NULL DEFAULT '0',
  `error_msg` text,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_kabupaten`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrape_progress`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `scrape_progress` WRITE;
/*!40000 ALTER TABLE `scrape_progress` DISABLE KEYS */;
INSERT INTO `scrape_progress` VALUES ('11.01','ACEH SELATAN','Kab. Aceh Selatan','ACEH','done',810,8,810,NULL,'2026-08-20 10:40:09'),('11.02','ACEH TENGGARA','Kab. Aceh Tenggara','ACEH','done',762,7,762,NULL,'2026-08-20 10:41:04'),('11.03','ACEH TIMUR','Kab. Aceh Timur','ACEH','done',1015,10,1015,NULL,'2026-08-20 10:42:38'),('11.04','ACEH TENGAH','Kab. Aceh Tengah','ACEH','done',657,6,657,NULL,'2026-08-20 10:43:09'),('11.05','ACEH BARAT','Kab. Aceh Barat','ACEH','done',568,5,568,NULL,'2026-08-20 10:43:35'),('11.06','ACEH BESAR','Kab. Aceh Besar','ACEH','done',868,8,868,NULL,'2026-08-20 10:44:15'),('11.07','PIDIE','Kab. Pidie','ACEH','done',932,9,932,NULL,'2026-08-20 10:44:57'),('11.08','ACEH UTARA','Kab. Aceh Utara','ACEH','done',1424,14,1424,NULL,'2026-08-20 10:53:32'),('11.09','SIMEULUE','Kab. Simeulue','ACEH','done',384,3,384,NULL,'2026-08-20 10:53:50'),('11.10','ACEH SINGKIL','Kab. Aceh Singkil','ACEH','done',402,4,402,NULL,'2026-08-20 10:54:09');
/*!40000 ALTER TABLE `scrape_progress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end scrape_progress)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kabupaten`
--

DROP TABLE IF EXISTS `kabupaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kabupaten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `propinsi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `koordinat` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `latitude` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `longitude` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kabupaten`
--
-- WHERE:  1=1 LIMIT 10

LOCK TABLES `kabupaten` WRITE;
/*!40000 ALTER TABLE `kabupaten` DISABLE KEYS */;
INSERT INTO `kabupaten` VALUES (1,'11.01','ACEH','ACEH SELATAN','3.3115056,97.35165579999999','3.3115056','97.35165579999999','2022-08-31 17:57:15'),(2,'11.02','ACEH','ACEH TENGGARA','3.3088666,97.69822719999999','3.3088666','97.69822719999999','2022-08-31 17:57:15'),(3,'11.03','ACEH','ACEH TIMUR','4.5224111,97.6114217','4.5224111','97.6114217','2022-08-31 17:57:15'),(4,'11.04','ACEH','ACEH TENGAH','4.448264099999999,96.83509989999999','4.448264099999999','96.83509989999999','2022-08-31 17:57:15'),(5,'11.05','ACEH','ACEH BARAT','4.454274499999999,96.15269850000001','4.454274499999999','96.15269850000001','2022-08-31 17:57:15'),(6,'11.06','ACEH','ACEH BESAR','5.4529168,95.4777811','5.4529168','95.4777811','2022-08-31 17:57:15'),(7,'11.07','ACEH','PIDIE','5.074265899999999,95.94097099999999','5.074265899999999','95.94097099999999','2022-08-31 17:57:15'),(8,'11.08','ACEH','ACEH UTARA','4.9786331,97.2221421','4.9786331','97.2221421','2022-08-31 17:57:15'),(9,'11.09','ACEH','SIMEULUE','2.6439724,96.02557379999999','2.6439724','96.02557379999999','2022-08-31 17:57:15'),(10,'11.10','ACEH','ACEH SINGKIL','2.3589459,97.87216','2.3589459','97.87216','2022-08-31 17:57:15');
/*!40000 ALTER TABLE `kabupaten` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:17
-- (end kabupaten)
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: sekolah
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `password_salt` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `api_key` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `owner_email` varchar(150) DEFAULT NULL,
  `rate_limit_per_min` int DEFAULT '60',
  `is_active` tinyint DEFAULT '1',
  `total_requests` bigint DEFAULT '0',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`),
  KEY `idx_active` (`is_active`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:38:26
-- (struct users/api_keys)

-- Dummy rows (NO real secrets). Password = 'Admin#2026!' hashed placeholder; replace on deploy.
-- Salt/hash below are NOT valid; only for schema demonstration.
INSERT INTO `users` (`id`, `email`, `password_hash`, `password_salt`, `nama`, `role`, `is_active`, `created_at`) VALUES
(1, 'admin@apisekolah.id', 'REPLACE_ON_DEPLOY', 'REPLACE_ON_DEPLOY', 'Administrator', 'admin', 1, NOW());
INSERT INTO `api_keys` (`id`, `api_key`, `name`, `owner_email`, `rate_limit_per_min`, `is_active`, `total_requests`) VALUES
(1, 'sk_REPLACE_ON_DEPLOY_examplekey', 'contoh', 'dev@example.com', 60, 1, 0);

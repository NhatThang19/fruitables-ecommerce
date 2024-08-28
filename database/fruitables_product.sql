-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fruitables
-- ------------------------------------------------------
-- Server version	8.0.32

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

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `price` double NOT NULL,
  `avatar` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_modified_date` datetime(6) DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `sold` bigint NOT NULL,
  `unit_id` bigint DEFAULT NULL,
  `detail_desc` mediumtext,
  `name` varchar(255) NOT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `status` enum('sold_out','stoking','stop_selling') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKi1ve3o94evqcbxrhyokvcok33` (`avatar`),
  KEY `FKsk257mxbg5s28xt71e90pv3xm` (`origin_id`),
  KEY `FKndrubbm6whifirg6o2bpdcf6b` (`unit_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKi1ve3o94evqcbxrhyokvcok33` FOREIGN KEY (`avatar`) REFERENCES `image` (`id`),
  CONSTRAINT `FKndrubbm6whifirg6o2bpdcf6b` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `FKsk257mxbg5s28xt71e90pv3xm` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`id`),
  CONSTRAINT `product_chk_1` CHECK ((`price` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (179000,11,2,'2024-08-21 13:55:13.019086',1,'2024-08-21 13:55:13.019086',3,0,2,'<p>- Xuất xứ: Mỹ</p>\r\n\r\n<p>- Nho Ruby Rush l&agrave; giống nho lai được kết hợp từ c&aacute;c loại nho kh&aacute;c nhau được lựa chọn cẩn thận, nho c&oacute; vẻ đẹp l&ocirc;i cuốn v&agrave; hương vị ngon ngọt, quả m&agrave;u đỏ đậm, nổi bật v&agrave; rực r&otilde; mang lại cho người d&ugrave;ng một trải nghiệm trọn vẹn về gi&aacute;c quan.</p>\r\n\r\n<p>- Điểm nổi bật sản phẩm:</p>\r\n\r\n<p>+ Nho c&oacute; vẻ ngo&agrave;i hấp dẫn: m&agrave;u đỏ rực rỡ, độ b&oacute;ng mọng nước gợi nhớ đến vi&ecirc;n ngọc Ruby hay c&ograve;n gọi l&agrave; hồng ngọc v&agrave; đ&oacute; cũng ch&iacute;nh l&agrave; t&ecirc;n gọi của giống nho n&agrave;y.</p>\r\n\r\n<p>+ Nho c&oacute; độ gi&ograve;n vừa phải v&agrave; vị ngọt b&ugrave;ng nổ ngay trong miệng gi&uacute;p n&acirc;ng niu vị gi&aacute;c của người d&ugrave;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"https://file.hstatic.net/200000528965/file/448547280_898549722310577_1684325935926885001_n_aa8e296992c34360a0445a47493ad20c_grande.jpg\" style=\"height:200px; width:200px\" /></p>\r\n\r\n<p>- Gi&aacute; trị dinh dưỡng:</p>\r\n\r\n<p>+ Nho Ruby Rush kh&ocirc;ng chỉ n&acirc;ng niu vị gi&aacute;c m&agrave; c&ograve;n đem lại một loạt c&aacute;c lợi &iacute;ch về dinh dưỡng: gi&agrave;u vitamin C, B1, B2</p>\r\n\r\n<p><img alt=\"\" src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG46ApGxA2vz-lymyT-l1Ygu9HkcBsR11HEQ&amp;s\" style=\"height:200px; width:200px\" /></p>\r\n','Nho Ruby Rush','Nho Ruby Rush là loại nho đến từ nước Mỹ','sold_out'),(399000,15,2,'2024-08-21 13:59:47.066064',2,'2024-08-21 14:00:33.551318',2,0,1,'<p>- Khối lượng: 0.85 - 0.95kg/ 1 ch&ugrave;m</p>\r\n\r\n<p>- Xuất xứ: Nhật Bản</p>\r\n\r\n<p><img alt=\"\" src=\"https://i.pinimg.com/736x/be/fe/30/befe30fac81bba08fc1fce42eff30622.jpg\" style=\"height:300px; width:200px\" /></p>\r\n\r\n<p>- Trọng lượng trung b&igrave;nh từ: ch&ugrave;m lớn hơn c&oacute; thể l&ecirc;n tới 1kg, ch&ugrave;m quả bắp,m&agrave;u t&iacute;m, c&oacute; vị thơm đặc trưng. Size quả to</p>\r\n\r\n<p>- Mỗi ch&ugrave;m nho khi c&ograve;n non c&ograve;n được bọc trong một lớp giấy trắng đặc biệt để tr&aacute;nh tuyệt đối c&aacute;c bụi bẩn hay nguy hại từ c&ocirc;n tr&ugrave;ng.</p>\r\n\r\n<p>- Khi nho bắt đầu ra tr&aacute;i người n&ocirc;ng d&acirc;n tỉa đi 40-50% số lượng nho tr&ecirc;n gi&agrave;n để đảm bảo chất lượng quả. Những người cắt tỉa nho để l&agrave; những người trung ni&ecirc;n c&oacute; kinh nghiệm, họ c&oacute; thể nhận biết c&aacute;c ch&ugrave;m nho n&agrave;o n&ecirc;n cắt tỉa v&agrave; ch&ugrave;m nho n&agrave;o n&ecirc;n giữ lại.</p>\r\n\r\n<p>- Hiện tại Nho Yuki (thường được gọi l&agrave; Nho Mẫu đơn)&nbsp;đang bị đạo nh&aacute;i tr&ecirc;n thị trường rất nhiều, qu&yacute; kh&aacute;ch h&agrave;ng n&ecirc;n đến đ&uacute;ng c&aacute;c địa chỉ uy t&iacute;n để mua h&agrave;ng.</p>\r\n','Nho Yuki','Nho Yuki là 1 loại nho chất lượng đến từ Nhật Bản.','stoking'),(90000,19,3,'2024-08-21 14:05:24.752010',3,'2024-08-21 14:06:04.504533',2,0,2,'<p>- Khối lượng: 0.32&nbsp;- 0.36kg/ 01 quả</p>\r\n\r\n<p>- &nbsp;Xuất xứ: Tỉnh Aomori - Nhật Bản, qu&ecirc; hương của những tr&aacute;i t&aacute;o sạch. Ch&uacute;ng t&ocirc;i tự h&agrave;o l&agrave; một trong 2 nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối ch&iacute;nh thức t&aacute;o Aomori Nhật Bản tại thị trường Việt Nam</p>\r\n\r\n<p><img alt=\"\" src=\"https://i.pinimg.com/564x/ed/12/02/ed1202e3314b869acf9e2462dbec8cd9.jpg\" style=\"height:200px; width:200px\" /></p>\r\n\r\n<p>- &nbsp;M&ugrave;a vụ: Từ th&aacute;ng 10 đến th&aacute;ng 8 năm sau<br />\r\n- Đặc điểm:</p>\r\n\r\n<p>+&nbsp;T&aacute;o Fuji l&agrave; d&ograve;ng t&aacute;o truyền thống, c&oacute; vỏ m&agrave;u đỏ xen c&aacute;c chấm trắng rất lạ mắt, vị ngọt sắc ( h&agrave;m lượng đường trong t&aacute;o khoảng 12-14%), độ gi&ograve;n cao. T&aacute;o Fuji &nbsp;lấy t&ecirc;n của một thị trấn nhỏ ở quận Aomorri. Độ brix 14.</p>\r\n\r\n<p>+&nbsp;Từng tr&aacute;i t&aacute;o v&ugrave;ng Aomori xuất sang Việt Nam kh&ocirc;ng sử dụng bất kỳ một chất h&oacute;a học, chất bảo quản n&agrave;o&nbsp;<br />\r\n+ T&aacute;o Aomori phải trải qua 10 giai đoạn v&agrave; quy tr&igrave;nh nghi&ecirc;m ngặt từ l&uacute;c ra tr&aacute;i tới l&uacute;c thu hoạch .Khi c&acirc;y bắt đầu ra tr&aacute;i, người n&ocirc;ng d&acirc;n sẽ cẩn thận chọn v&agrave; cắt bỏ những hoa, quả nhỏ để tập trung dinh dưỡng cho c&aacute;c tr&aacute;i lớn ph&aacute;t triển tốt nhất, đồng thời mỗi quả t&aacute;o cũng được bọc thủ c&ocirc;ng một c&aacute;ch kỹ c&agrave;ng để ngăn ngừa c&ocirc;n tr&ugrave;ng, nấm bệnh th&acirc;m nhập v&agrave; t&aacute;o c&oacute; đủ điều kiện để ph&aacute;t triển một c&aacute;ch tự nhi&ecirc;n thay v&igrave; d&ugrave;ng đến thuốc trừ s&acirc;u bệnh.&nbsp;<br />\r\n+ L&uacute;c t&aacute;o lớn sẽ được hấp thụ &aacute;nh nắng mặt trời nhờ những tấm phản quang để gi&uacute;p t&aacute;o c&oacute; m&agrave;u sắc đẹp v&agrave; đều khắp quả.</p>\r\n','Táo Fuji','Táo Fuji là một loại táo xuất xứ từ Nhật Bản nha.','stoking');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 21:07:45

CREATE DATABASE  IF NOT EXISTS `proyecto_final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_final`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `genero` bit(1) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Bryan','Boc','106244299',_binary '\0','45789856','brahs@gmail.com','2023-10-11 06:00:00'),(2,'Sergio','Mendeza','454744',_binary '','45689847','smendoza@gmail.com','2023-10-19 06:00:00'),(3,'Ana Patricia','Morales','546458',_binary '\0','87987789','djkf@gmail.com','2023-10-09 06:00:00'),(4,'Luis Antonio','Vasquez','5487541',_binary '','5152014','LuisVaq31@gmail.com','2000-01-24 06:00:00'),(5,'Enrique','Garcia','564524',_binary '','54565878','EnrqG@gmail.com','2023-10-05 06:00:00'),(6,'julio','mendez','45789',_binary '\0','54454798798','d@gmail.com','2000-10-10 06:00:00'),(7,'Ana Maria','Polo','45545647',_binary '\0','1454654','CasoCerrado@gmail.com','2018-02-10 06:00:00'),(9,'Cristiano','Ronaldo','1254654',_binary '','45653200','cr7@gmail.com','2023-10-20 06:00:00'),(11,'Mario','Bros','5468742',_binary '','23654784','PichLove@gmail.com','2022-02-21 06:00:00'),(12,'Luigi','Bros','87454111',_binary '','56874411','Lbros64@gmail.com','2019-02-14 06:00:00');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idcompas` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int NOT NULL,
  `idproveedor` int NOT NULL,
  `fecha_orden` date NOT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcompas`),
  KEY `fkidproveedor_idx` (`idproveedor`),
  CONSTRAINT `fkidproveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,123,1,'2000-01-01','2023-11-04 08:42:19'),(2,1,3,'2023-11-03','2023-11-04 10:27:45'),(3,3,3,'2023-11-04','2023-11-04 10:29:22'),(4,3,3,'2023-11-04','2023-11-04 10:30:25'),(5,12,3,'2023-11-03','2023-11-04 10:30:52');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `idcompras_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idcompra` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_costo_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idcompras_detalle`),
  KEY `fk_idcompra_idx` (`idcompra`),
  CONSTRAINT `fk_idcompra` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idcompas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,1,1,2,32.25),(2,3,2,9,3500.00),(3,3,2,9,3500.00),(4,5,2,8,35000.00);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleados` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `dpi` varchar(15) NOT NULL,
  `genero` bit(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `idpuesto` smallint NOT NULL,
  `fecha_inicio_labores` date NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tieneusuario` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idempleados`),
  KEY `fk_idpuesto_idx` (`idpuesto`),
  KEY `fk_idgenero_idx` (`genero`),
  CONSTRAINT `fk_idgenero` FOREIGN KEY (`genero`) REFERENCES `generos` (`idgenero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idpuesto` FOREIGN KEY (`idpuesto`) REFERENCES `puestos` (`idpuesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (2,'Luis','Zambrano','Cuidado','58588884','1316556390101',_binary '','2023-11-01',1,'2023-10-20','2023-10-25 04:19:47',1),(3,'Gerardo','Letona','zona 1','58987456','5465481210101',_binary '','1980-05-24',3,'2023-10-14','2023-10-25 04:55:22',1),(4,'Alma','Mazariegos','guatemala','46546878','4654846840101',_binary '\0','2023-01-02',2,'2023-10-04','2023-10-29 18:17:45',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `idgenero` bit(1) NOT NULL,
  `genero` varchar(15) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (_binary '\0','FEMENINO'),(_binary '','MACULINO');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idmarcas` smallint NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmarcas`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'COCA COLA'),(2,'COLGATE'),(3,'BIMBO'),(4,'LALA'),(5,'PEPSI'),(6,'TOELDO'),(8,'MAZOLA'),(9,'FRUTAL');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idproductos` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) NOT NULL,
  `idmarca` smallint NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagen` varchar(120) NOT NULL,
  `precio_costo` decimal(8,2) NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `existencia` int NOT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idproductos`),
  KEY `fk_idmarca_idx` (`idmarca`),
  CONSTRAINT `fk_idmarca` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarcas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'COCA COLA',1,'5ML','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\',3.00,6.00,100,'2023-11-08 05:31:08'),(2,'CEPILLO DE DIENTES',2,'CEPILLO CERDAS SUAVES','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\64234899c42cd47e86a3bacd_cepillos-p-800.png',7.00,20.00,15,'2023-11-08 05:30:57'),(3,'PANITO',3,'PANITO RELLENO','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\PANITO.webp',2.00,7.00,49,'2023-11-08 05:32:26'),(9,'YOGURT',4,'YOGURT DE FRESAS','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\LALA.webp',3.00,7.00,46,'2023-11-08 05:34:10'),(10,'PEPSI BLUE',5,'PEPSI BLUE 5ML','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\BLE.jpg',3.00,6.00,99,'2023-11-08 05:35:09'),(11,'JAMON',6,'JAMON DE PAVO','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\JAMON.webp',5.00,12.00,60,'2023-11-08 05:36:16'),(12,'MARGARINA',8,'POR CAJA','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\MAZONA.webp',6.00,15.00,25,'2023-11-08 05:37:08'),(13,'JUGO DEL FRUTAL',9,'JUGOS CON DIFERENTE NECTAR','C:\\Users\\Renato\\Desktop\\d\\revision2-main\\proyecto_final_prograII\\IMG\\JUGOS.png',2.50,5.00,30,'2023-11-08 05:38:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedores` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'importadora unio','3698978','zona 7','12324564'),(3,'importadora 2','1545487-4','zona 6','54587898');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `idpuesto` smallint NOT NULL,
  `puestos` varchar(60) NOT NULL,
  PRIMARY KEY (`idpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'vendedor 1'),(2,'gerente'),(3,'cajero');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_clientes`
--

DROP TABLE IF EXISTS `user_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_clientes` (
  `iduser_clientes` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `idcliente` int NOT NULL,
  `conectado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`iduser_clientes`),
  KEY `fk_id_cliente_idx` (`idcliente`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_clientes`
--

LOCK TABLES `user_clientes` WRITE;
/*!40000 ALTER TABLE `user_clientes` DISABLE KEYS */;
INSERT INTO `user_clientes` VALUES (1,'dorian','mejia',1,_binary '\0'),(2,'user','contra',1,_binary '\0'),(3,'jmakj@gmail.com','yo1234',2,_binary '\0'),(4,'djkf@gmail.com','10101011000010101010110100000110',3,_binary '\0'),(5,'dmejia2820@gmail.com','10010100101111011100011011101010',4,_binary '\0'),(6,'d@gmail.com','00111000101001110000011111000110',5,_binary '\0'),(7,'d@gmail.com','00110110111110100011101101010001',6,_binary '\0'),(8,'v@gmail.com','00110110111110100011101101010001',7,_binary ''),(9,'d@gmail.com','00110110111110100011101101010001',9,_binary '\0');
/*!40000 ALTER TABLE `user_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_trabajador`
--

DROP TABLE IF EXISTS `user_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_trabajador` (
  `iduser_trabajador` int NOT NULL AUTO_INCREMENT,
  `idempleado` int NOT NULL,
  `usuario` varchar(80) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `rolventa` int NOT NULL DEFAULT '0',
  `roladmin` int NOT NULL DEFAULT '0',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iduser_trabajador`),
  KEY `ifidempledo_idx` (`idempleado`),
  CONSTRAINT `ifidempledo` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleados`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trabajador`
--

LOCK TABLES `user_trabajador` WRITE;
/*!40000 ALTER TABLE `user_trabajador` DISABLE KEYS */;
INSERT INTO `user_trabajador` VALUES (1,2,'user','111',1,0,'2023-11-02 05:23:16'),(2,4,'d@fja.com','00110110111110100011101101010001',1,1,'2023-11-02 07:20:08'),(3,3,'umg@gmail.com','00110110111110100011101101010001',1,0,'2023-11-02 07:23:24');
/*!40000 ALTER TABLE `user_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventas` int NOT NULL AUTO_INCREMENT,
  `no_factura` int NOT NULL,
  `serie` varchar(1) NOT NULL,
  `fecha_factura` date NOT NULL,
  `idcliente` int NOT NULL,
  `idempleado` int NOT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idventas`),
  KEY `fk_idempleado_idx` (`idempleado`),
  KEY `fk_idcliente_idx` (`idcliente`),
  CONSTRAINT `fk_idcliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idempleado` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleados`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (7,4,'b','2023-11-15',1,3,'2023-11-04 07:11:17'),(8,3,'b','2023-11-17',6,3,'2023-11-04 07:15:40'),(9,7,'b','2023-11-14',6,3,'2023-11-04 07:34:08'),(10,13,'b','2023-11-21',5,3,'2023-11-04 07:37:05'),(11,27,'a','2023-11-22',7,3,'2023-11-04 07:40:14'),(12,40,'c','2023-11-24',9,3,'2023-11-04 07:45:11'),(13,14,'c','2023-11-23',5,3,'2023-11-04 07:53:46'),(14,48,'a','2023-11-24',7,3,'2023-11-04 07:55:24'),(15,13,'b','2023-11-02',1,3,'2023-11-06 04:30:50'),(16,9,'a','2023-10-31',4,3,'2023-11-06 04:33:23');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `idventas_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idventa` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idventas_detalle`),
  KEY `fk_idventa_idx` (`idventa`),
  KEY `fk_idproducto_idx` (`idproducto`),
  CONSTRAINT `fk_idproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idventa` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (2,8,2,'1',10.00),(3,9,1,'1',45000.06),(4,10,1,'2',90000.12),(5,11,2,'1',10.00),(6,12,3,'2',14.80),(7,13,3,'2',14.80),(8,14,2,'2',20.00),(9,10,2,'1',43750.00),(10,16,1,'1',4545.56);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyecto_final'
--

--
-- Dumping routines for database 'proyecto_final'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08  0:35:36

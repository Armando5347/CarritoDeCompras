-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carritocompras
-- ------------------------------------------------------
-- Server version	5.6.47-log

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
-- Table structure for table `caromas`
--

DROP TABLE IF EXISTS `caromas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caromas` (
  `ID` int(11) NOT NULL,
  `aroma` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caromas`
--

LOCK TABLES `caromas` WRITE;
/*!40000 ALTER TABLE `caromas` DISABLE KEYS */;
INSERT INTO `caromas` VALUES (1,'SIN AROMA'),(2,'ALMENDRAS');
/*!40000 ALTER TABLE `caromas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chojasxrollo`
--

DROP TABLE IF EXISTS `chojasxrollo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chojasxrollo` (
  `ID` int(11) NOT NULL,
  `no_hojas` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chojasxrollo`
--

LOCK TABLES `chojasxrollo` WRITE;
/*!40000 ALTER TABLE `chojasxrollo` DISABLE KEYS */;
INSERT INTO `chojasxrollo` VALUES (1,180),(2,200),(3,240),(4,320),(5,400),(6,500);
/*!40000 ALTER TABLE `chojasxrollo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cli` varchar(45) NOT NULL,
  `appat_cli` varchar(45) NOT NULL,
  `apmat_cli` varchar(45) NOT NULL,
  `fecha_nacimiento_cli` date DEFAULT NULL,
  `username_cli` varchar(20) NOT NULL,
  `password_cli` varchar(20) NOT NULL,
  `cel_cli` varchar(12) DEFAULT NULL,
  `tel_cli` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Luis Fernando ','Aspiros','Tenorio','2002-02-22','shadowlord4','algo','73713082','73713082');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmaterial`
--

DROP TABLE IF EXISTS `cmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cmaterial` (
  `ID` int(11) NOT NULL,
  `Material` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmaterial`
--

LOCK TABLES `cmaterial` WRITE;
/*!40000 ALTER TABLE `cmaterial` DISABLE KEYS */;
INSERT INTO `cmaterial` VALUES (1,'CELULOSA'),(2,'FIBRA VEGETAL');
/*!40000 ALTER TABLE `cmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compracliente`
--

DROP TABLE IF EXISTS `compracliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compracliente` (
  `ID` int(11) NOT NULL,
  `Cliente_ID` int(11) NOT NULL,
  `DCarritoDeCompras_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CompraCliente_Cliente1_idx` (`Cliente_ID`),
  KEY `fk_CompraCliente_DCarritoDeCompras1_idx` (`DCarritoDeCompras_ID`),
  CONSTRAINT `fk_CompraCliente_Cliente1` FOREIGN KEY (`Cliente_ID`) REFERENCES `mydb`.`cliente` (`ID_cli`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CompraCliente_DCarritoDeCompras1` FOREIGN KEY (`DCarritoDeCompras_ID`) REFERENCES `dcarritodecompras` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compracliente`
--

LOCK TABLES `compracliente` WRITE;
/*!40000 ALTER TABLE `compracliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `compracliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cordenservicio`
--

DROP TABLE IF EXISTS `cordenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cordenservicio` (
  `ID` int(11) NOT NULL,
  `tipo_orden` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cordenservicio`
--

LOCK TABLES `cordenservicio` WRITE;
/*!40000 ALTER TABLE `cordenservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `cordenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cprivilegio_empleado`
--

DROP TABLE IF EXISTS `cprivilegio_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cprivilegio_empleado` (
  `ID` int(11) NOT NULL,
  `tipo_privilegio` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cprivilegio_empleado`
--

LOCK TABLES `cprivilegio_empleado` WRITE;
/*!40000 ALTER TABLE `cprivilegio_empleado` DISABLE KEYS */;
INSERT INTO `cprivilegio_empleado` VALUES (1,'Empleado'),(2,'Gerente'),(3,'Admin');
/*!40000 ALTER TABLE `cprivilegio_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crollosincluidos`
--

DROP TABLE IF EXISTS `crollosincluidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crollosincluidos` (
  `ID` int(11) NOT NULL,
  `rollos` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crollosincluidos`
--

LOCK TABLES `crollosincluidos` WRITE;
/*!40000 ALTER TABLE `crollosincluidos` DISABLE KEYS */;
INSERT INTO `crollosincluidos` VALUES (1,4),(2,12),(3,18),(4,24),(5,32);
/*!40000 ALTER TABLE `crollosincluidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctipo_hojas`
--

DROP TABLE IF EXISTS `ctipo_hojas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctipo_hojas` (
  `ID` int(11) NOT NULL,
  `tipo_hojas` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctipo_hojas`
--

LOCK TABLES `ctipo_hojas` WRITE;
/*!40000 ALTER TABLE `ctipo_hojas` DISABLE KEYS */;
INSERT INTO `ctipo_hojas` VALUES (1,'Doble'),(2,'Triple'),(3,'Cuadruple');
/*!40000 ALTER TABLE `ctipo_hojas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctipos`
--

DROP TABLE IF EXISTS `ctipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctipos` (
  `ID` int(11) NOT NULL,
  `Tipos` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctipos`
--

LOCK TABLES `ctipos` WRITE;
/*!40000 ALTER TABLE `ctipos` DISABLE KEYS */;
INSERT INTO `ctipos` VALUES (1,'Residencial'),(2,'Institucional');
/*!40000 ALTER TABLE `ctipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctipostendencia`
--

DROP TABLE IF EXISTS `ctipostendencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctipostendencia` (
  `ID_Ctipostendencias` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Ctipostendencias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctipostendencia`
--

LOCK TABLES `ctipostendencia` WRITE;
/*!40000 ALTER TABLE `ctipostendencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctipostendencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcarritodecompras`
--

DROP TABLE IF EXISTS `dcarritodecompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcarritodecompras` (
  `ID` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `Subtotal` double DEFAULT NULL,
  `fecha` datetime(4) DEFAULT NULL,
  `MPapel_ID` int(11) NOT NULL,
  `MCarritoCompras_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_DCarritoDeCompras_MPapel1_idx` (`MPapel_ID`),
  KEY `fk_DCarritoDeCompras_MCarritoCompras1_idx` (`MCarritoCompras_ID`),
  CONSTRAINT `fk_DCarritoDeCompras_MCarritoCompras1` FOREIGN KEY (`MCarritoCompras_ID`) REFERENCES `mcarritocompras` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DCarritoDeCompras_MPapel1` FOREIGN KEY (`MPapel_ID`) REFERENCES `mpapel` (`ID_mp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcarritodecompras`
--

LOCK TABLES `dcarritodecompras` WRITE;
/*!40000 ALTER TABLE `dcarritodecompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcarritodecompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dordenservicio`
--

DROP TABLE IF EXISTS `dordenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dordenservicio` (
  `ID` int(11) NOT NULL,
  `descripcion` longtext,
  `Cliente_ID` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `Empleado_ID` int(11) NOT NULL,
  `COrdenServicio_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_DOrdenServicio_Cliente1_idx` (`Cliente_ID`),
  KEY `fk_DOrdenServicio_Empleado1_idx` (`Empleado_ID`),
  KEY `fk_DOrdenServicio_COrdenServicio1_idx` (`COrdenServicio_ID`),
  CONSTRAINT `fk_DOrdenServicio_COrdenServicio1` FOREIGN KEY (`COrdenServicio_ID`) REFERENCES `cordenservicio` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOrdenServicio_Cliente1` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID_cli`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOrdenServicio_Empleado1` FOREIGN KEY (`Empleado_ID`) REFERENCES `empleado` (`ID_em`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dordenservicio`
--

LOCK TABLES `dordenservicio` WRITE;
/*!40000 ALTER TABLE `dordenservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `dordenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpapel`
--

DROP TABLE IF EXISTS `dpapel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpapel` (
  `ID_dp` int(11) NOT NULL AUTO_INCREMENT,
  `Precio` double NOT NULL,
  `Stock` int(11) NOT NULL,
  `CMaterial_ID` int(11) NOT NULL,
  `CTipos_ID` int(11) NOT NULL,
  `Aromas_ID` int(11) NOT NULL,
  `CRollosIncluidos_ID` int(11) NOT NULL,
  `CTipo_Hojas_ID` int(11) NOT NULL,
  `CHojasxRollo_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_dp`),
  KEY `fk_Papel_CMaterial` (`CMaterial_ID`),
  KEY `fk_Papel_CTipos1` (`CTipos_ID`),
  KEY `fk_DPapel_Aromas1` (`Aromas_ID`),
  KEY `fk_DPapel_CRollosIncluidos1` (`CRollosIncluidos_ID`),
  KEY `fk_DPapel_CTipo_Hojas1` (`CTipo_Hojas_ID`),
  KEY `fk_DPapel_CHojasxRollo1` (`CHojasxRollo_ID`),
  CONSTRAINT `fk_DPapel_Aromas1` FOREIGN KEY (`Aromas_ID`) REFERENCES `caromas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DPapel_CHojasxRollo1` FOREIGN KEY (`CHojasxRollo_ID`) REFERENCES `chojasxrollo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DPapel_CRollosIncluidos1` FOREIGN KEY (`CRollosIncluidos_ID`) REFERENCES `crollosincluidos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DPapel_CTipo_Hojas1` FOREIGN KEY (`CTipo_Hojas_ID`) REFERENCES `ctipo_hojas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DPapel_MPapel1` FOREIGN KEY (`ID_dp`) REFERENCES `mpapel` (`ID_mp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Papel_CMaterial` FOREIGN KEY (`CMaterial_ID`) REFERENCES `cmaterial` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Papel_CTipos1` FOREIGN KEY (`CTipos_ID`) REFERENCES `ctipos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpapel`
--

LOCK TABLES `dpapel` WRITE;
/*!40000 ALTER TABLE `dpapel` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpapel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID_em` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_em` varchar(45) NOT NULL,
  `Appat_em` varchar(45) NOT NULL,
  `Apmat_em` varchar(45) NOT NULL,
  `fecha_nacimiento_em` date DEFAULT NULL,
  `cel_em` int(11) DEFAULT NULL,
  `tel_em` int(11) DEFAULT NULL,
  `username_em` varchar(20) NOT NULL,
  `password_em` varchar(20) NOT NULL,
  `CPrivilegio_Empleado_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_em`),
  KEY `fk_Empleado_CPrivilegio_Empleado1_idx` (`CPrivilegio_Empleado_ID`),
  CONSTRAINT `fk_Empleado_CPrivilegio_Empleado1` FOREIGN KEY (`CPrivilegio_Empleado_ID`) REFERENCES `cprivilegio_empleado` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcarritocompras`
--

DROP TABLE IF EXISTS `mcarritocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcarritocompras` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcarritocompras`
--

LOCK TABLES `mcarritocompras` WRITE;
/*!40000 ALTER TABLE `mcarritocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcarritocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motrdenservicio`
--

DROP TABLE IF EXISTS `motrdenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motrdenservicio` (
  `ID` int(11) NOT NULL,
  `DOrdenServicio_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_MOtrdenServicio_DOrdenServicio1_idx` (`DOrdenServicio_ID`),
  CONSTRAINT `fk_MOtrdenServicio_DOrdenServicio1` FOREIGN KEY (`DOrdenServicio_ID`) REFERENCES `dordenservicio` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motrdenservicio`
--

LOCK TABLES `motrdenservicio` WRITE;
/*!40000 ALTER TABLE `motrdenservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `motrdenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpapel`
--

DROP TABLE IF EXISTS `mpapel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpapel` (
  `ID_mp` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(45) DEFAULT NULL,
  `id_DPapel` int(11) NOT NULL,
  PRIMARY KEY (`ID_mp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpapel`
--

LOCK TABLES `mpapel` WRITE;
/*!40000 ALTER TABLE `mpapel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpapel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tendencias`
--

DROP TABLE IF EXISTS `tendencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tendencias` (
  `ID_tendencias` int(11) NOT NULL AUTO_INCREMENT,
  `unidades` int(11) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `ID_CtiposTendencias` int(11) NOT NULL,
  PRIMARY KEY (`ID_tendencias`),
  KEY `ID_CtiposTendencias` (`ID_CtiposTendencias`),
  CONSTRAINT `tendencias_ibfk_1` FOREIGN KEY (`ID_CtiposTendencias`) REFERENCES `ctipostendencia` (`ID_Ctipostendencias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tendencias`
--

LOCK TABLES `tendencias` WRITE;
/*!40000 ALTER TABLE `tendencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tendencias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-30  3:08:11

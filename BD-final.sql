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


-- -----------------------------------------------------
-- Schema carritocompras
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `carritocompras` ;

-- -----------------------------------------------------
-- Schema carritocompras
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carritocompras` DEFAULT CHARACTER SET utf8 ;
USE `carritocompras`;

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
/*!40000 ALTER TABLE `cmaterial` ENABLE KEYS */;
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
-- Table structure for table `dcompracliente`
--

DROP TABLE IF EXISTS `dcompracliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcompracliente` (
  `ID` int(11) NOT NULL,
  `Cliente_ID` int(11) NOT NULL,
  `DCarritoDeCompras_ID` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CompraCliente_Cliente1_idx` (`Cliente_ID`),
  KEY `fk_CompraCliente_DCarritoDeCompras1_idx` (`DCarritoDeCompras_ID`),
  CONSTRAINT `fk_CompraCliente_Cliente1` FOREIGN KEY (`Cliente_ID`) REFERENCES `mydb`.`cliente` (`ID_cli`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CompraCliente_DCarritoDeCompras1` FOREIGN KEY (`DCarritoDeCompras_ID`) REFERENCES `dcarritodecompras` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcompracliente`
--

LOCK TABLES `dcompracliente` WRITE;
/*!40000 ALTER TABLE `dcompracliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcompracliente` ENABLE KEYS */;
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
  `img_ruta` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpapel`
--

LOCK TABLES `mpapel` WRITE;
/*!40000 ALTER TABLE `mpapel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpapel` ENABLE KEYS */;
UNLOCK TABLES;


insert into carritocompras.CMaterial (ID, Material) values(1, "Celulosa"),(2,"Fibra vegetal");

insert into carritocompras.CAromas (ID, Aroma) values(1, "Sin aroma"),(2,"almendras");

insert into carritocompras.CTipos (ID, Tipos) values(1, "Residencial"),(2,"Institucional");

insert into carritocompras.CRollosIncluidos (ID, rollos) values(1, 4), (2, 12), (3,18), (4,24), (5,32);

insert into carritocompras.CTipo_Hojas (ID, tipo_hojas) values(1, "Doble"),(2, "Triple"),(3,"Cuadruple");

insert into carritocompras.CHojasxRollo (ID, no_hojas) values (1, 180),(2,200),(3,240),(4,320),(5,400),(6,500); 

insert into carritocompras.CPrivilegio_Empleado (ID, tipo_privilegio) values (1, "Empleado"), (2,"Gerente"), (3,"Admin");

insert into Mpapel values(1, "Papel Marca patito", 1);
insert into MPapel values(2, "Papel DOWNY para universidad",2);

insert into DPapel values(1,50.00,5,1,1,1,1,1,1,null);
insert into DPapel values(2, 499.99,2,1,2,2,2,3,6,null);

insert into Empleado values
(1,"Armando", "Jarillo", "Torres","1968-07-27","53521328","55667788","root","n0m3l0", 3),
(2,"Denilson", "Soto", "Luna","2003-01-07","12345678","19898989","UnSaludo","111111", 2),
(3,"Gerardo", "Rivera", "Y ya","1980-12-17","53521328","53456706","root","12345678", 1);

--
-- Dumping events for database 'carritocompras'
--

--
-- Dumping routines for database 'carritocompras'
--
/*!50003 DROP PROCEDURE IF EXISTS `establecerTendencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `establecerTendencia`(cantidad int, marca varchar(45), tipo varchar(45))
select unidades, marca from tendencias
where marca = marca ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerTablasTendenciasMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTablasTendenciasMes`(nombre varchar(45))
select dcc.id, dcc.fecha, carrito.total, mp.Nombre_producto from dcompracliente as dcc
inner join dcarritodecompras as carrito on (dcc.DCarritoDeCompras_ID = carrito.ID)
inner join mpapel as mp on (carrito.MPapel_ID=mp.ID_mp)
where (dcc.fecha <= curdate()
and dcc.fecha > date_sub(curdate(), interval '1' month) 
and nombre = mp.Nombre_producto) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerTablasTendenciasQuincena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTablasTendenciasQuincena`(nombre varchar(45))
select dcc.id, dcc.fecha, carrito.total, mp.Nombre_producto from dcompracliente as dcc
inner join dcarritodecompras as carrito on (dcc.DCarritoDeCompras_ID = carrito.ID)
inner join mpapel as mp on (carrito.MPapel_ID=mp.ID_mp)
where (dcc.fecha <= curdate()
and dcc.fecha > date_sub(curdate(), interval '2' week)
and nombre = mp.Nombre_producto) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerTablasTendenciasSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTablasTendenciasSemana`(nombre varchar(45))
select dcc.id, dcc.fecha, carrito.total, mp.Nombre_producto from dcompracliente as dcc
inner join dcarritodecompras as carrito on (dcc.DCarritoDeCompras_ID = carrito.ID)
inner join mpapel as mp on (carrito.MPapel_ID=mp.ID_mp)
where (dcc.fecha <= curdate()
and dcc.fecha > date_sub(curdate(), interval '1' week)
and nombre = mp.Nombre_producto) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traducirIdesCatalogosCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traducirIdesCatalogosCarrito`(id_material int, id_tipos int, id_aroma int, id_rollos int, id_tipo_hojas int, id_hojas_rollos int)
select carritocompras.CMaterial.material, carritocompras.CTipos.Tipos, carritocompras.CAromas.Aroma, carritocompras.CRollosIncluidos.rollos, carritocompras.CTipo_Hojas.tipo_hojas, carritocompras.CHojasxRollo.no_hojas 
    from carritocompras.CMaterial, carritocompras.CTipos, carritocompras.CAromas, carritocompras.CRollosIncluidos, carritocompras.CTipo_Hojas,carritocompras.CHojasxRollo
    where carritocompras.CMaterial.ID = id_material AND
		carritocompras.CTipos.ID = id_tipos AND
        carritocompras.CAromas.ID = id_aroma AND
        carritocompras.CRollosIncluidos.ID = id_rollos AND
        carritocompras.CTipo_Hojas.ID = id_tipo_hojas AND
        carritocompras.CHojasxRollo.ID = id_hojas_rollos ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traducirValoresCatalogosCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traducirValoresCatalogosCarrito`(mat varchar(20), tipo varchar(20), ar varchar(20), n_rollos int , tip_hojas varchar(10), hojas_rollos int)
select carritocompras.CMaterial.ID, carritocompras.CTipos.ID, carritocompras.CAromas.ID, carritocompras.CRollosIncluidos.ID, carritocompras.CTipo_Hojas.ID, carritocompras.CHojasxRollo.ID 
    from carritocompras.CMaterial, carritocompras.CTipos, carritocompras.CAromas, carritocompras.CRollosIncluidos, carritocompras.CTipo_Hojas,carritocompras.CHojasxRollo
    where carritocompras.CMaterial.material = mat AND
		carritocompras.CTipos.Tipos = tipo AND
        carritocompras.CAromas.Aroma = ar AND
        carritocompras.CRollosIncluidos.rollos = n_rollos AND
        carritocompras.CTipo_Hojas.tipo_hojas = tip_hojas AND
        carritocompras.CHojasxRollo.no_hojas = hojas_rollos ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 20:32:17

-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: cultivos
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

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
-- Table structure for table `COMARCAS`
--

DROP TABLE IF EXISTS `COMARCAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMARCAS` (
  `cod` varchar(3) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `pro` varchar(3) NOT NULL,
  `pai` varchar(3) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `pro` (`pro`,`pai`),
  CONSTRAINT `COMARCAS_ibfk_1` FOREIGN KEY (`pro`, `pai`) REFERENCES `PROVINCIAS` (`cod`, `pai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMARCAS`
--

LOCK TABLES `COMARCAS` WRITE;
/*!40000 ALTER TABLE `COMARCAS` DISABLE KEYS */;
INSERT INTO `COMARCAS` VALUES ('chi','Chiva','val','pes'),('cht','Cheste','val','pes');
/*!40000 ALTER TABLE `COMARCAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CULTIVAR`
--

DROP TABLE IF EXISTS `CULTIVAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CULTIVAR` (
  `cul` varchar(3) NOT NULL,
  `com` varchar(3) NOT NULL,
  PRIMARY KEY (`cul`,`com`),
  KEY `com` (`com`),
  CONSTRAINT `CULTIVAR_ibfk_1` FOREIGN KEY (`cul`) REFERENCES `TIPOS_CULTIVOS` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CULTIVAR_ibfk_2` FOREIGN KEY (`com`) REFERENCES `COMARCAS` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CULTIVAR`
--

LOCK TABLES `CULTIVAR` WRITE;
/*!40000 ALTER TABLE `CULTIVAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `CULTIVAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAISES`
--

DROP TABLE IF EXISTS `PAISES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAISES` (
  `cod` varchar(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `con` char(10) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAISES`
--

LOCK TABLES `PAISES` WRITE;
/*!40000 ALTER TABLE `PAISES` DISABLE KEYS */;
INSERT INTO `PAISES` VALUES ('alm','Alemania','Europa'),('mex','Mexico','America'),('pes','España','Europa'),('vzl','Venezuela','America');
/*!40000 ALTER TABLE `PAISES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVINCIAS`
--

DROP TABLE IF EXISTS `PROVINCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROVINCIAS` (
  `cod` varchar(3) NOT NULL,
  `pai` varchar(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `hab` int DEFAULT NULL,
  PRIMARY KEY (`cod`,`pai`),
  KEY `pai` (`pai`),
  CONSTRAINT `PROVINCIAS_ibfk_1` FOREIGN KEY (`pai`) REFERENCES `PAISES` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVINCIAS`
--

LOCK TABLES `PROVINCIAS` WRITE;
/*!40000 ALTER TABLE `PROVINCIAS` DISABLE KEYS */;
INSERT INTO `PROVINCIAS` VALUES ('can','pes','Cantabria',581641),('ccs','vzl','Caracas',2000000),('val','pes','Valencia',791413);
/*!40000 ALTER TABLE `PROVINCIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_CULTIVOS`
--

DROP TABLE IF EXISTS `TIPOS_CULTIVOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPOS_CULTIVOS` (
  `cod` varchar(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_CULTIVOS`
--

LOCK TABLES `TIPOS_CULTIVOS` WRITE;
/*!40000 ALTER TABLE `TIPOS_CULTIVOS` DISABLE KEYS */;
INSERT INTO `TIPOS_CULTIVOS` VALUES ('arr','Arroz');
/*!40000 ALTER TABLE `TIPOS_CULTIVOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-20  8:27:42
-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: cultivos
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

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
-- Table structure for table `COMARCAS`
--

DROP TABLE IF EXISTS `COMARCAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMARCAS` (
  `cod` varchar(3) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `pro` varchar(3) NOT NULL,
  `pai` varchar(3) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `pro` (`pro`,`pai`),
  CONSTRAINT `COMARCAS_ibfk_1` FOREIGN KEY (`pro`, `pai`) REFERENCES `PROVINCIAS` (`cod`, `pai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMARCAS`
--

LOCK TABLES `COMARCAS` WRITE;
/*!40000 ALTER TABLE `COMARCAS` DISABLE KEYS */;
INSERT INTO `COMARCAS` VALUES ('chi','Chiva','val','pes'),('cht','Cheste','val','pes');
/*!40000 ALTER TABLE `COMARCAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CULTIVAR`
--

DROP TABLE IF EXISTS `CULTIVAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CULTIVAR` (
  `cul` varchar(3) NOT NULL,
  `com` varchar(3) NOT NULL,
  PRIMARY KEY (`cul`,`com`),
  KEY `com` (`com`),
  CONSTRAINT `CULTIVAR_ibfk_1` FOREIGN KEY (`cul`) REFERENCES `TIPOS_CULTIVOS` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CULTIVAR_ibfk_2` FOREIGN KEY (`com`) REFERENCES `COMARCAS` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CULTIVAR`
--

LOCK TABLES `CULTIVAR` WRITE;
/*!40000 ALTER TABLE `CULTIVAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `CULTIVAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAISES`
--

DROP TABLE IF EXISTS `PAISES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAISES` (
  `cod` varchar(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `con` char(10) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAISES`
--

LOCK TABLES `PAISES` WRITE;
/*!40000 ALTER TABLE `PAISES` DISABLE KEYS */;
INSERT INTO `PAISES` VALUES ('alm','Alemania','Europa'),('mex','Mexico','America'),('pes','España','Europa'),('vzl','Venezuela','America');
/*!40000 ALTER TABLE `PAISES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVINCIAS`
--

DROP TABLE IF EXISTS `PROVINCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROVINCIAS` (
  `cod` varchar(3) NOT NULL,
  `pai` varchar(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `hab` int DEFAULT NULL,
  PRIMARY KEY (`cod`,`pai`),
  KEY `pai` (`pai`),
  CONSTRAINT `PROVINCIAS_ibfk_1` FOREIGN KEY (`pai`) REFERENCES `PAISES` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `TIPOS_CULTIVOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPOS_CULTIVOS` (
  `cod` varchar(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_CULTIVOS`
--
/*----------------Ejercicio INSERT INTO (BD cultivos)----------------*/
/*1. Inserta un nuevo tipo de cultivo de código ARR y nombre Arroz.*/
LOCK TABLES `TIPOS_CULTIVOS` WRITE;
/*!40000 ALTER TABLE `TIPOS_CULTIVOS` DISABLE KEYS */;
INSERT INTO `TIPOS_CULTIVOS` VALUES ('ARR','Arroz');
/*!40000 ALTER TABLE `TIPOS_CULTIVOS` ENABLE KEYS */;
UNLOCK TABLES;

/*2. Inserta un nuevo país cuyo nombre será España del continente Europa.*/
DELETE FROM PAISES WHERE nom = "España";
INSERT INTO PAISES VALUES ("ESP","España","Europa");

/*3. Inserta las siguientes 4 provincias en una sola sentencia:
- Valencia, con 1 millón de habitantes.
- Alicante, con 700.000 de habitantes.
- Castellón, con medio millón de habitantes.
- Madrid, con 2 millones de habitantes.*/
INSERT INTO PROVINCIAS VALUES ("VLC","ESP","VALENCIA","1000000"),("ALC","ESP","ALICANTE","700000"),("CST","ESP","CASTELLON","500000"),("MAD","ESP","MADRID","2000000");

/*4. inserta la comarca “Ribera Baja”, de código RB.*/
INSERT INTO COMARCAS VALUES ("RB","Ribera Baja","ESP","ALC");
/*----------------Ejercicio INSERT INTO (BD cultivos)----------------*/
/*----------------Ejercicio DELETE y UPDATE (BD cultivos)----------------*/
/*1. Borra la provincia de Madrid*/
DELETE FROM PROVINCIAS WHERE nom = "MADRID";
/*2. Aumenta la población un 10% de todas las provincias. */
UPDATE PROVINCIAS SET hab=hab+(hab*0.1) WHERE pai = "ESP";
/*3. Modifica la comarca RB haciendo que el nombre empiece por “La”. Utiliza el
operador CONCAT (consulta la sentencia por internet )*/
SELECT CONCAT ("La ",nom ) FROM COMARCAS WHERE cod="RB";
/*4. Guarda los datos de las provincias en el fichero “provincias.txt” del directorio
sobre el cual tienes permisos. Recuerda que ese directorio se puede saber
ejecutando: SHOW VARIABLES LIKE "secure_file_priv";*/
SELECT * INTO OUTFILE "/var/lib/mysql-files/provincias1.txt"
  FROM PROVINCIAS WHERE pai = "ESP";
/*5. Borra el contenido de la tabla provincias y vuelve a cargar los datos a partir del
fichero que has creado en el ejercicio anterior.*/

DELETE FROM PROVINCIAS WHERE pai="ESP";
SET GLOBAL local_infile=1;

/*----------------Ejercicio DELETE y UPDATE (BD cultivos)----------------*/


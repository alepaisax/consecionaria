-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: concesionaria
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `oficinas`
--

DROP TABLE IF EXISTS `oficinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficinas` (
  `idOficina` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idReclamoTipo` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idOficina`),
  KEY `your_fk_constraint_name` (`idReclamoTipo`),
  CONSTRAINT `oficinas_fk2` FOREIGN KEY (`idReclamoTipo`) REFERENCES `reclamos_tipo` (`idReclamosTipo`),
  CONSTRAINT `your_fk_constraint_name` FOREIGN KEY (`idReclamoTipo`) REFERENCES `reclamos_tipo` (`idReclamosTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficinas`
--

LOCK TABLES `oficinas` WRITE;
/*!40000 ALTER TABLE `oficinas` DISABLE KEYS */;
INSERT INTO `oficinas` VALUES (1,'Dpto. de Taller y Servicio Técnico',1,1),(2,'Dpto. de Garantías',1,1),(3,'Dpto. de Repuestos y Partes',1,1),(4,'Dpto. de Facturación',1,1),(6,'Dpto. de quejas y sugerencias',3,1);
/*!40000 ALTER TABLE `oficinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamos`
--

DROP TABLE IF EXISTS `reclamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamos` (
  `idReclamo` int NOT NULL AUTO_INCREMENT,
  `asunto` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaCreado` datetime NOT NULL,
  `fechaFinalizado` datetime DEFAULT NULL,
  `fechaCancelado` datetime DEFAULT NULL,
  `idReclamoEstado` int NOT NULL,
  `idReclamoTipo` int NOT NULL,
  `idUsuarioCreador` int NOT NULL,
  `idUsuarioFinalizador` int DEFAULT NULL,
  `idOficina` int DEFAULT NULL,
  PRIMARY KEY (`idReclamo`),
  KEY `reclamos_fk6` (`idReclamoEstado`),
  CONSTRAINT `reclamos_fk6` FOREIGN KEY (`idReclamoEstado`) REFERENCES `reclamos_estado` (`idReclamosEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamos`
--

LOCK TABLES `reclamos` WRITE;
/*!40000 ALTER TABLE `reclamos` DISABLE KEYS */;
INSERT INTO `reclamos` VALUES (5,'ruido en motor',NULL,'2024-08-19 06:00:00',NULL,NULL,1,1,9,NULL,NULL),(6,'rotura de  motor ',NULL,'2024-08-19 07:00:00',NULL,NULL,4,1,8,NULL,NULL),(7,'no frena',NULL,'2024-08-15 07:15:00',NULL,NULL,1,2,8,NULL,NULL),(8,'ruidos extraños',NULL,'2024-08-15 08:00:00',NULL,NULL,1,3,7,NULL,NULL),(9,'Falla en la transmisión','Descripción del problema aquí','2024-10-05 15:09:17',NULL,NULL,3,1,22,NULL,NULL),(10,'Falla en la transmisión','Ruidos continuos','2024-10-05 18:18:13',NULL,NULL,1,1,22,NULL,1),(11,'Problema con el aire acondicionado','El aire acondicionado no funciona','2024-10-05 18:41:29',NULL,NULL,2,1,24,24,4),(12,'Falla en el sistema de iluminación','Luces parpadeantes en el pasillo','2024-10-05 18:41:29',NULL,NULL,1,1,24,NULL,4),(13,'Queja por el ruido en la oficina','Ruidos constantes de la construcción','2024-10-05 18:41:29',NULL,NULL,1,1,24,NULL,4),(14,'Problema con el equipo','El equipo no enciende','2024-10-05 18:42:32',NULL,NULL,2,1,12,24,1),(15,'Falta de piezas','No hay piezas disponibles','2024-10-05 18:42:32',NULL,NULL,1,1,12,NULL,2),(16,'Consulta sobre la factura','Duda en la factura enviada','2024-10-05 18:42:32',NULL,NULL,1,1,12,NULL,3),(17,'Retraso en la entrega','Entregas demoradas','2024-10-05 18:42:32',NULL,NULL,1,1,12,NULL,4),(18,'Problema de conexión','La conexión a internet es inestable','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,1),(19,'Producto defectuoso','El producto llegó dañado','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,2),(20,'Error en la facturación','La factura presenta un error de monto','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,3),(21,'Consulta sobre un cargo','Duda sobre un cargo en la factura','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,4),(22,'Servicio de mantenimiento','Solicito mantenimiento urgente','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,1),(23,'Demora en la garantía','El proceso de garantía está tardando mucho','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,2),(24,'Consulta de repuestos','Necesito información sobre un repuesto específico','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,3),(25,'Reclamo de servicio al cliente','No me han respondido','2024-10-05 18:42:56',NULL,NULL,1,1,12,NULL,4),(26,'Falla en los frenos','Ruidos continuos','2024-10-05 20:05:23',NULL,NULL,1,1,22,NULL,NULL),(27,'Falla en la transmisión','Ruidos continuos','2024-10-05 20:27:21',NULL,NULL,3,1,22,NULL,1);
/*!40000 ALTER TABLE `reclamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamos_estado`
--

DROP TABLE IF EXISTS `reclamos_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamos_estado` (
  `idReclamosEstado` int NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idReclamosEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamos_estado`
--

LOCK TABLES `reclamos_estado` WRITE;
/*!40000 ALTER TABLE `reclamos_estado` DISABLE KEYS */;
INSERT INTO `reclamos_estado` VALUES (1,'Creado',1),(2,'En Proceso',1),(3,'Cancelado',1),(4,'Finalizado',1);
/*!40000 ALTER TABLE `reclamos_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamos_tipo`
--

DROP TABLE IF EXISTS `reclamos_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamos_tipo` (
  `idReclamosTipo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idReclamosTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamos_tipo`
--

LOCK TABLES `reclamos_tipo` WRITE;
/*!40000 ALTER TABLE `reclamos_tipo` DISABLE KEYS */;
INSERT INTO `reclamos_tipo` VALUES (1,'Falla de motor',1),(2,'Falla de frenos',1),(3,'Falla de suspensión',1);
/*!40000 ALTER TABLE `reclamos_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correoElectronico` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasenia` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTipoUsuario` int NOT NULL,
  `imagen` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Jon','Snow','jonsno@gmail.com','$2b$10$HJPAICqUpkyO2P9vbJ2sUeWj18Pucfyh2LaZDmEP0oAR3GzGl.gqW',1,NULL,1),(12,'Tyrion','Lannister','tyrlan@correo.com','9f9e51def43bc759ac35cd56ce8514a2c4dd0fbc9bfbb5bc97ce691f65bf5bb9',2,NULL,1),(13,'Margaery','Tyrell','martyr@correo.com','ad872b4820b164b7a25695ff77d0f6e5df812c6f9944d1d21461f57f099bce57',2,NULL,1),(14,'Samwell','Tarly','samtar@correo.com','a8487f98ab106b0ed2129a5446610b5ccba6b4bf7a937ef5194ce2f2a4c11bde',2,NULL,1),(15,'Jeor','Mormont','jeomor@correo.com','ef0b04a6eba2d3cde7b32f53b2c13b509d198189cb9da2080c7259948cbc63ca',2,NULL,1),(16,'Khal','Drogo','khadro@gmail.com','84507cc9012d1c900abb65663e3b62633cb14073aa6569b60efa2b75cf431b37',3,NULL,1),(17,'Catelyn','Stark','catsta@correo.com','229e7f7177d0e221f889eb8d3e2b422eae42adc403412fb25718b84fe5fff4d7',3,NULL,1),(18,'Yara','Greyjoy','yargre@correo.com','097c61d6a3ee77e4f4a9d2c6b6fb284ee927a0c315f30172f685e4659a4f621b',3,NULL,1),(19,'Jose','Battaglia','josbat@gmail.com','c30d798692466db470eafebfb04c272b359c80f2ebbac6f51f6e9ff9b6e3177b',3,NULL,1),(20,'Grupo','Uner','grupouner@hotmail.com','$2b$10$OgdYdS9ZIuXq3hOr7v2zzetxEXgJxi1y8C9yEjCQ.KGbcs8PQpxmC',1,NULL,1),(21,'Arya','Stark','arya.stark@gmail.com','$2b$10$M1oYtbKJCPGkmq4R8zT4p.P.By3X.5Cszg1IMRVcP0UC1.kW/rHiy',1,NULL,1),(22,'Juan','Gómez','jose@hotmail.com','$2b$10$cKSt.Hot5nD70kLVAKWnM.SxTjFDGSA0JWcUZM0TpA0ih3s6Vif2C',3,NULL,1),(24,'Raton','Perez','perezraton@gmail.com','$2b$10$c98C3RFU2.8qjzthSag3Q.ZwXUyB19u5i2HmxuKrvPLClA579ZF9e',2,NULL,1),(25,'Tyrion','Lannister','tyrion.lannister@example.com','password123',2,'url-a-la-imagen.jpg',1),(26,'Juanito','Gonzalez','juanito@gmail.com','password123',2,'url-a-la-imagen.jpg',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_oficinas`
--

DROP TABLE IF EXISTS `usuarios_oficinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_oficinas` (
  `idUsuarioOficina` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idOficina` int NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_oficinas`
--

LOCK TABLES `usuarios_oficinas` WRITE;
/*!40000 ALTER TABLE `usuarios_oficinas` DISABLE KEYS */;
INSERT INTO `usuarios_oficinas` VALUES (1,12,1,1),(2,13,2,1),(3,14,3,1),(4,17,4,1),(11,12,1,1),(12,13,1,1),(13,14,2,1),(14,15,3,1),(15,24,4,1);
/*!40000 ALTER TABLE `usuarios_oficinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_tipo`
--

DROP TABLE IF EXISTS `usuarios_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_tipo` (
  `idUsuarioTipo` int NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_tipo`
--

LOCK TABLES `usuarios_tipo` WRITE;
/*!40000 ALTER TABLE `usuarios_tipo` DISABLE KEYS */;
INSERT INTO `usuarios_tipo` VALUES (1,'Administrador',1),(2,'Empleado',1),(3,'Cliente',1);
/*!40000 ALTER TABLE `usuarios_tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05 20:37:47

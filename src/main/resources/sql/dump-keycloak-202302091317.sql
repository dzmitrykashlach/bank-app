-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `REPRESENTATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('01f04050-207a-40bf-9aee-8fc6ed017530',NULL,'reset-credentials-choose-user','0203963c-b9ab-4f3f-a428-8d6164de047c','01d7e6d5-196d-4a2d-8cd7-14247706c497',0,10,_binary '\0',NULL,NULL),('0360aa4d-338f-46e6-95ad-ddcb982880dd',NULL,'conditional-user-configured','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee056e2-00fa-47e9-926e-4e2af9fb32a6',0,10,_binary '\0',NULL,NULL),('0440d75a-a94c-4b5d-8d84-d09e47406228',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','4999a661-ade2-45c3-abca-e1c9d4dd09ce',1,20,_binary '','f684b3f3-b52a-43a5-87c4-29728749c2c9',NULL),('0566da64-4b55-46f8-8150-a1a899d78006',NULL,'auth-otp-form','e9b256af-8af6-4c2f-aaef-4c6c79cded41','753d7877-34ae-4e2d-a8f2-126ece2aeb45',0,20,_binary '\0',NULL,NULL),('06fdf425-15df-4426-884e-0a523e77d96c',NULL,'conditional-user-configured','0203963c-b9ab-4f3f-a428-8d6164de047c','e3bcb3cd-d786-4607-a43f-ac6998598138',0,10,_binary '\0',NULL,NULL),('0cb146b5-8871-41d9-9d0d-566e28a94870',NULL,'client-jwt','0203963c-b9ab-4f3f-a428-8d6164de047c','6ae32ddf-3ea7-4256-8c0d-15a82c49c4c2',2,20,_binary '\0',NULL,NULL),('0e2a6f73-7ad8-4a13-8cad-c259605baf8d',NULL,'reset-credentials-choose-user','e9b256af-8af6-4c2f-aaef-4c6c79cded41','4d6b5c29-cb87-45f7-9f09-f07cfbfd9c20',0,10,_binary '\0',NULL,NULL),('0ec20907-0505-476d-9b0e-e38fa3b7cbbc',NULL,'reset-credential-email','0203963c-b9ab-4f3f-a428-8d6164de047c','01d7e6d5-196d-4a2d-8cd7-14247706c497',0,20,_binary '\0',NULL,NULL),('18d6d09d-97ba-492e-883f-335fad19bd37',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','946c97e3-ff77-4d5a-bb27-cc961813f0a7',2,30,_binary '','bf8049b0-dc3c-41e7-bac3-d3ece6a2435c',NULL),('19f43a23-fd6b-4d68-87b7-f0a5ff86db6d',NULL,'idp-review-profile','0203963c-b9ab-4f3f-a428-8d6164de047c','0964c30a-558b-4b3f-942b-6d7da8822946',0,10,_binary '\0',NULL,'da21d0e6-32b9-4ddd-b775-cae415d215e1'),('1a3f11ed-7ed6-4383-9a14-697689cce019',NULL,'registration-recaptcha-action','0203963c-b9ab-4f3f-a428-8d6164de047c','43660315-9cce-4a03-a95b-b994a916e051',3,60,_binary '\0',NULL,NULL),('1a40bd62-d2f4-4b2f-9f15-7b2dccf6fa9d',NULL,'registration-password-action','0203963c-b9ab-4f3f-a428-8d6164de047c','43660315-9cce-4a03-a95b-b994a916e051',0,50,_binary '\0',NULL,NULL),('1dfd64c6-a62c-46c9-a18f-52c5a864e762',NULL,'auth-username-password-form','0203963c-b9ab-4f3f-a428-8d6164de047c','2fd0f040-bd49-48cb-b96c-5f0eda6d3b3b',0,10,_binary '\0',NULL,NULL),('20e87c02-5706-4a55-baa3-1117e294710a',NULL,'idp-confirm-link','0203963c-b9ab-4f3f-a428-8d6164de047c','1dcdd1f4-3fc9-4def-9d0f-676b2d1034b4',0,10,_binary '\0',NULL,NULL),('20eb27e0-0788-46d8-bcf5-f669f0ae1f4a',NULL,'conditional-user-configured','e9b256af-8af6-4c2f-aaef-4c6c79cded41','8f871e37-4b60-4529-8b1b-59f5a6a1eb59',0,10,_binary '\0',NULL,NULL),('2100cf58-4016-41e5-a49b-39c6d5589a9e',NULL,'reset-otp','e9b256af-8af6-4c2f-aaef-4c6c79cded41','8d33e629-8ee9-43a3-9847-83ae1d003156',0,20,_binary '\0',NULL,NULL),('2918f883-ae42-4f29-b0ae-f4ab20099974',NULL,'registration-profile-action','e9b256af-8af6-4c2f-aaef-4c6c79cded41','de81fd92-3ff1-4105-8aa8-0e52a6600087',0,40,_binary '\0',NULL,NULL),('29f53dff-e32c-4226-9489-13f5ed176eee',NULL,'idp-review-profile','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b2c3f52b-9825-4c1e-ad9f-bf634621c05e',0,10,_binary '\0',NULL,'e6230e65-c7f6-46d4-bfae-3bd6d1f0a158'),('2c1157e6-7b16-42c9-b064-a1d66aa58a44',NULL,'auth-username-password-form','e9b256af-8af6-4c2f-aaef-4c6c79cded41','bf8049b0-dc3c-41e7-bac3-d3ece6a2435c',0,10,_binary '\0',NULL,NULL),('2fee3ccf-f4ac-4abd-b534-67504ad82fb6',NULL,'idp-email-verification','0203963c-b9ab-4f3f-a428-8d6164de047c','06498cf0-69a3-441e-95a1-f05620b9a5e8',2,10,_binary '\0',NULL,NULL),('330141d4-00ed-4a19-aff7-72ae09a62a47',NULL,'auth-otp-form','e9b256af-8af6-4c2f-aaef-4c6c79cded41','8f871e37-4b60-4529-8b1b-59f5a6a1eb59',0,20,_binary '\0',NULL,NULL),('33ef6f63-747f-4460-9a7d-affd4a0f65c0',NULL,'identity-provider-redirector','e9b256af-8af6-4c2f-aaef-4c6c79cded41','946c97e3-ff77-4d5a-bb27-cc961813f0a7',2,25,_binary '\0',NULL,NULL),('3c94ae48-0aab-4c31-8802-0cff04b386e7',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','8dd70ac9-f0b9-46f9-970a-8435515933e4',2,30,_binary '','2fd0f040-bd49-48cb-b96c-5f0eda6d3b3b',NULL),('3e0a064b-ac5a-4990-82a1-cba1021a766d',NULL,'client-x509','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b8104e9b-812b-4815-b19f-d70b05bc8647',2,40,_binary '\0',NULL,NULL),('3e1cb1f5-82e8-472c-b86d-f9df34c53e82',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','01d7e6d5-196d-4a2d-8cd7-14247706c497',1,40,_binary '','e3bcb3cd-d786-4607-a43f-ac6998598138',NULL),('3fe21ab4-8d2f-4612-aa0e-148ff567f594',NULL,'auth-cookie','e9b256af-8af6-4c2f-aaef-4c6c79cded41','946c97e3-ff77-4d5a-bb27-cc961813f0a7',2,10,_binary '\0',NULL,NULL),('41f880a8-3a03-4536-b2cf-2d4a69aee3c4',NULL,'basic-auth','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d45715e4-4929-4536-ad40-7998518dc3c2',0,10,_binary '\0',NULL,NULL),('439c8ec8-b92e-4687-90f9-5416a3ca000f',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','06498cf0-69a3-441e-95a1-f05620b9a5e8',2,20,_binary '','4999a661-ade2-45c3-abca-e1c9d4dd09ce',NULL),('43eec0b8-bed9-4277-b74d-c41af6fec018',NULL,'idp-create-user-if-unique','0203963c-b9ab-4f3f-a428-8d6164de047c','78d6a92c-4700-45ec-93cc-3c703e24039b',2,10,_binary '\0',NULL,'8e2b279b-14db-412b-b99b-2e6394eba49b'),('482db9c4-264f-4507-b590-0b45b2894fc5',NULL,'client-jwt','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b8104e9b-812b-4815-b19f-d70b05bc8647',2,20,_binary '\0',NULL,NULL),('487e7064-e4f8-4ff0-915b-edffc8f7bc3e',NULL,'direct-grant-validate-username','e9b256af-8af6-4c2f-aaef-4c6c79cded41','7daa8364-492f-4a0b-8fa2-53383814fe65',0,10,_binary '\0',NULL,NULL),('4a78115b-ba5a-4098-83a8-5eefe76a6b85',NULL,'idp-create-user-if-unique','e9b256af-8af6-4c2f-aaef-4c6c79cded41','c30f3563-154d-4cbe-91ba-287e0b4cf0ad',2,10,_binary '\0',NULL,'83b099d7-eeba-4245-b72a-7760f991f3ef'),('4ce8af83-cd6d-44ac-ba5d-1e29c030b9a1',NULL,'registration-user-creation','e9b256af-8af6-4c2f-aaef-4c6c79cded41','de81fd92-3ff1-4105-8aa8-0e52a6600087',0,20,_binary '\0',NULL,NULL),('4cf83711-5df9-4a89-b162-f89652d0aeaf',NULL,'idp-confirm-link','e9b256af-8af6-4c2f-aaef-4c6c79cded41','6b690b96-5d0e-4116-bd2e-e575054ee4d6',0,10,_binary '\0',NULL,NULL),('4f6dd110-2beb-41f0-a2da-2c45a4a023a0',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','b2c3f52b-9825-4c1e-ad9f-bf634621c05e',0,20,_binary '','c30f3563-154d-4cbe-91ba-287e0b4cf0ad',NULL),('561876b3-6a4e-4f5a-9882-14473d70da99',NULL,'http-basic-authenticator','e9b256af-8af6-4c2f-aaef-4c6c79cded41','c896a46c-b941-472b-832c-0ae02faeebc4',0,10,_binary '\0',NULL,NULL),('5668c404-2001-47a5-814e-c52cc1b65116',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','4d6b5c29-cb87-45f7-9f09-f07cfbfd9c20',1,40,_binary '','8d33e629-8ee9-43a3-9847-83ae1d003156',NULL),('5672d2da-582b-40a7-81cb-4359f50ebaef',NULL,'auth-spnego','0203963c-b9ab-4f3f-a428-8d6164de047c','7403aae3-fb78-4168-9ce7-cf1a3bf0e56a',3,30,_binary '\0',NULL,NULL),('56bc044e-ad45-43ea-ba79-f02fe470648b',NULL,'idp-email-verification','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b20db232-5e63-403f-9b3c-355c7ec9db04',2,10,_binary '\0',NULL,NULL),('56d7a814-93aa-4289-addf-74bea45552e7',NULL,'basic-auth','0203963c-b9ab-4f3f-a428-8d6164de047c','7403aae3-fb78-4168-9ce7-cf1a3bf0e56a',0,10,_binary '\0',NULL,NULL),('595cf57e-745d-4b14-9235-fc76e9559b85',NULL,'docker-http-basic-authenticator','e9b256af-8af6-4c2f-aaef-4c6c79cded41','1f2faeeb-f196-4d53-a2a6-997d5fc22b06',0,10,_binary '\0',NULL,NULL),('5b69dfb0-b12d-48af-aaf0-6e754718620a',NULL,'direct-grant-validate-password','0203963c-b9ab-4f3f-a428-8d6164de047c','85780434-1e3d-4959-8f86-96e8608f64e7',0,20,_binary '\0',NULL,NULL),('64772ffc-22ca-4873-b25e-a73f5bb86cb5',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','bf8049b0-dc3c-41e7-bac3-d3ece6a2435c',1,20,_binary '','753d7877-34ae-4e2d-a8f2-126ece2aeb45',NULL),('6f8458b3-aa7d-4167-9394-42d1e2df7f96',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','1dcdd1f4-3fc9-4def-9d0f-676b2d1034b4',0,20,_binary '','06498cf0-69a3-441e-95a1-f05620b9a5e8',NULL),('7ca6ba64-d1af-48a0-b532-1dfec16d2eca',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','6b690b96-5d0e-4116-bd2e-e575054ee4d6',0,20,_binary '','b20db232-5e63-403f-9b3c-355c7ec9db04',NULL),('7d4548cf-af24-4b5d-8ca4-ce9a6d06a990',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','2fd0f040-bd49-48cb-b96c-5f0eda6d3b3b',1,20,_binary '','8ee056e2-00fa-47e9-926e-4e2af9fb32a6',NULL),('80421dd0-c6ad-43c8-8878-6bc07345caea',NULL,'client-secret','0203963c-b9ab-4f3f-a428-8d6164de047c','6ae32ddf-3ea7-4256-8c0d-15a82c49c4c2',2,10,_binary '\0',NULL,NULL),('83526756-57e0-4cca-a421-fbc3f086892a',NULL,'client-secret-jwt','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b8104e9b-812b-4815-b19f-d70b05bc8647',2,30,_binary '\0',NULL,NULL),('8571b56f-55e3-46b6-bb32-98ca1c912a1c',NULL,'no-cookie-redirect','0203963c-b9ab-4f3f-a428-8d6164de047c','bb4c68d4-6d38-4a85-b825-26dda87ca34f',0,10,_binary '\0',NULL,NULL),('88e1c80b-1345-4f48-a47f-abccb6aa579c',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','b6a3eaa4-b22c-4fd2-82b5-e9af923c7ee7',1,20,_binary '','8f871e37-4b60-4529-8b1b-59f5a6a1eb59',NULL),('89acee33-7f23-4188-acf3-f99c0c7fc531',NULL,'registration-profile-action','0203963c-b9ab-4f3f-a428-8d6164de047c','43660315-9cce-4a03-a95b-b994a916e051',0,40,_binary '\0',NULL,NULL),('8aaf8cef-1b5b-4383-9af3-46cfc313377a',NULL,'basic-auth-otp','0203963c-b9ab-4f3f-a428-8d6164de047c','7403aae3-fb78-4168-9ce7-cf1a3bf0e56a',3,20,_binary '\0',NULL,NULL),('8ea143cb-2883-47d9-83f2-e42c5e246801',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','0964c30a-558b-4b3f-942b-6d7da8822946',0,20,_binary '','78d6a92c-4700-45ec-93cc-3c703e24039b',NULL),('932793c6-5570-4a14-b9de-8c82b3a17726',NULL,'conditional-user-configured','e9b256af-8af6-4c2f-aaef-4c6c79cded41','8d33e629-8ee9-43a3-9847-83ae1d003156',0,10,_binary '\0',NULL,NULL),('977adb12-be28-4f48-817c-9fbaced31420',NULL,'direct-grant-validate-otp','0203963c-b9ab-4f3f-a428-8d6164de047c','3813c8d8-7ede-46a8-987d-c6ce9cb9c2b6',0,20,_binary '\0',NULL,NULL),('986e24ac-4d7e-4501-b20d-27ffa81493bc',NULL,'reset-otp','0203963c-b9ab-4f3f-a428-8d6164de047c','e3bcb3cd-d786-4607-a43f-ac6998598138',0,20,_binary '\0',NULL,NULL),('9a6dbf13-0e46-463b-b055-fb6400bccd78',NULL,'basic-auth-otp','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d45715e4-4929-4536-ad40-7998518dc3c2',3,20,_binary '\0',NULL,NULL),('9c89a0f0-33f2-46d9-a05c-4d3b37d48750',NULL,'client-secret-jwt','0203963c-b9ab-4f3f-a428-8d6164de047c','6ae32ddf-3ea7-4256-8c0d-15a82c49c4c2',2,30,_binary '\0',NULL,NULL),('9e9fad4c-5e95-4327-ab92-4c8ebf816ed7',NULL,'client-secret','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b8104e9b-812b-4815-b19f-d70b05bc8647',2,10,_binary '\0',NULL,NULL),('9fc7c799-a7d8-43f7-a7be-5d42347d93ed',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','c30f3563-154d-4cbe-91ba-287e0b4cf0ad',2,20,_binary '','6b690b96-5d0e-4116-bd2e-e575054ee4d6',NULL),('a7c40cd4-2408-459f-bfbc-8cf0fedfd52a',NULL,'docker-http-basic-authenticator','0203963c-b9ab-4f3f-a428-8d6164de047c','d9dc7dc0-af84-463d-a064-d2e24d9d550f',0,10,_binary '\0',NULL,NULL),('acc038c6-8999-4cfe-8639-25232556f756',NULL,'conditional-user-configured','0203963c-b9ab-4f3f-a428-8d6164de047c','3813c8d8-7ede-46a8-987d-c6ce9cb9c2b6',0,10,_binary '\0',NULL,NULL),('aec2cdd1-21ae-4b1f-a900-8b5d219e05a2',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','ffce6749-d910-4946-9f8e-a27e01b01b5f',0,20,_binary '','d45715e4-4929-4536-ad40-7998518dc3c2',NULL),('b10fc5e4-1d4f-4ddd-ad07-50dc3942507e',NULL,'auth-otp-form','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee056e2-00fa-47e9-926e-4e2af9fb32a6',0,20,_binary '\0',NULL,NULL),('b20e2c5b-e99b-4f26-8a8c-8ee926d0c968',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','7daa8364-492f-4a0b-8fa2-53383814fe65',1,30,_binary '','7a370e24-52bc-4fe4-b6bd-fda154fcc697',NULL),('ba5e50bc-a6ef-477f-9478-649b7cafa6fe',NULL,'idp-username-password-form','0203963c-b9ab-4f3f-a428-8d6164de047c','4999a661-ade2-45c3-abca-e1c9d4dd09ce',0,10,_binary '\0',NULL,NULL),('bd80452f-4090-47d1-b18b-8eeea1ae9ec7',NULL,'conditional-user-configured','0203963c-b9ab-4f3f-a428-8d6164de047c','f684b3f3-b52a-43a5-87c4-29728749c2c9',0,10,_binary '\0',NULL,NULL),('c0d48466-badd-4b0d-8e75-2bd1851641c5',NULL,'direct-grant-validate-otp','e9b256af-8af6-4c2f-aaef-4c6c79cded41','7a370e24-52bc-4fe4-b6bd-fda154fcc697',0,20,_binary '\0',NULL,NULL),('c1ac3816-3ce5-438c-9c97-1327359b019e',NULL,'client-x509','0203963c-b9ab-4f3f-a428-8d6164de047c','6ae32ddf-3ea7-4256-8c0d-15a82c49c4c2',2,40,_binary '\0',NULL,NULL),('c1f0b06b-9de0-418b-b66e-67bee9de0464',NULL,'auth-spnego','0203963c-b9ab-4f3f-a428-8d6164de047c','8dd70ac9-f0b9-46f9-970a-8435515933e4',3,20,_binary '\0',NULL,NULL),('c4e5a9b7-7691-47fb-8593-774e610dbbe0',NULL,'registration-recaptcha-action','e9b256af-8af6-4c2f-aaef-4c6c79cded41','de81fd92-3ff1-4105-8aa8-0e52a6600087',3,60,_binary '\0',NULL,NULL),('c95b424d-8843-440c-b15d-f6dd20c821fb',NULL,'conditional-user-configured','e9b256af-8af6-4c2f-aaef-4c6c79cded41','7a370e24-52bc-4fe4-b6bd-fda154fcc697',0,10,_binary '\0',NULL,NULL),('ced045a0-507b-47e3-ba81-4a1d35c63a3c',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','bb4c68d4-6d38-4a85-b825-26dda87ca34f',0,20,_binary '','7403aae3-fb78-4168-9ce7-cf1a3bf0e56a',NULL),('d54b1d59-8c09-4cca-90c3-e09934e859c3',NULL,'direct-grant-validate-password','e9b256af-8af6-4c2f-aaef-4c6c79cded41','7daa8364-492f-4a0b-8fa2-53383814fe65',0,20,_binary '\0',NULL,NULL),('d7fe3278-a118-4bb9-ae44-692195fe2ae1',NULL,'http-basic-authenticator','0203963c-b9ab-4f3f-a428-8d6164de047c','66c16bf3-b2b5-4303-892e-033d66b12af6',0,10,_binary '\0',NULL,NULL),('dac7766f-89a5-4363-b501-bad205f9bfe2',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','85780434-1e3d-4959-8f86-96e8608f64e7',1,30,_binary '','3813c8d8-7ede-46a8-987d-c6ce9cb9c2b6',NULL),('dcb18a1f-3ce1-4c83-a07e-73cae17008ac',NULL,'registration-page-form','0203963c-b9ab-4f3f-a428-8d6164de047c','a841f452-07b2-43a3-a7db-f1ba69e7b101',0,10,_binary '','43660315-9cce-4a03-a95b-b994a916e051',NULL),('dfb3d7ca-97b4-4903-a1e0-91c77b36cc6a',NULL,'registration-password-action','e9b256af-8af6-4c2f-aaef-4c6c79cded41','de81fd92-3ff1-4105-8aa8-0e52a6600087',0,50,_binary '\0',NULL,NULL),('e2c8e025-bbbb-498b-991b-5ec8c02d96dd',NULL,'reset-credential-email','e9b256af-8af6-4c2f-aaef-4c6c79cded41','4d6b5c29-cb87-45f7-9f09-f07cfbfd9c20',0,20,_binary '\0',NULL,NULL),('e4c44819-cf69-4ad1-8405-2fb99eabf24a',NULL,'auth-cookie','0203963c-b9ab-4f3f-a428-8d6164de047c','8dd70ac9-f0b9-46f9-970a-8435515933e4',2,10,_binary '\0',NULL,NULL),('e56e6318-6ab1-45dd-b1f3-58a0adebf5e8',NULL,'direct-grant-validate-username','0203963c-b9ab-4f3f-a428-8d6164de047c','85780434-1e3d-4959-8f86-96e8608f64e7',0,10,_binary '\0',NULL,NULL),('e5f0629c-a9c2-408f-a5c9-b28a02c101fe',NULL,'auth-otp-form','0203963c-b9ab-4f3f-a428-8d6164de047c','f684b3f3-b52a-43a5-87c4-29728749c2c9',0,20,_binary '\0',NULL,NULL),('eb4b8625-99a3-4034-b59e-96619043da0e',NULL,'identity-provider-redirector','0203963c-b9ab-4f3f-a428-8d6164de047c','8dd70ac9-f0b9-46f9-970a-8435515933e4',2,25,_binary '\0',NULL,NULL),('eb885efc-c458-457c-9e7f-9765f74906c1',NULL,'reset-password','e9b256af-8af6-4c2f-aaef-4c6c79cded41','4d6b5c29-cb87-45f7-9f09-f07cfbfd9c20',0,30,_binary '\0',NULL,NULL),('ed81c247-ba07-41d3-b0c6-5885130c5056',NULL,'no-cookie-redirect','e9b256af-8af6-4c2f-aaef-4c6c79cded41','ffce6749-d910-4946-9f8e-a27e01b01b5f',0,10,_binary '\0',NULL,NULL),('ed976ca6-9ba2-4386-b40b-862996f535d5',NULL,'idp-username-password-form','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b6a3eaa4-b22c-4fd2-82b5-e9af923c7ee7',0,10,_binary '\0',NULL,NULL),('ee1521ef-7011-4e3a-a7ed-dc9c74353fb5',NULL,'conditional-user-configured','e9b256af-8af6-4c2f-aaef-4c6c79cded41','753d7877-34ae-4e2d-a8f2-126ece2aeb45',0,10,_binary '\0',NULL,NULL),('f10970b8-d909-402e-9e26-7543e7502f63',NULL,'registration-user-creation','0203963c-b9ab-4f3f-a428-8d6164de047c','43660315-9cce-4a03-a95b-b994a916e051',0,20,_binary '\0',NULL,NULL),('f4e708eb-f3f5-4795-b840-5096911d10bf',NULL,'registration-page-form','e9b256af-8af6-4c2f-aaef-4c6c79cded41','73564fa4-0b2b-4d9b-b30f-c719d7dc844b',0,10,_binary '','de81fd92-3ff1-4105-8aa8-0e52a6600087',NULL),('f549469b-04fb-4873-976b-51c4f93d6cb5',NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','78d6a92c-4700-45ec-93cc-3c703e24039b',2,20,_binary '','1dcdd1f4-3fc9-4def-9d0f-676b2d1034b4',NULL),('f7fb5142-91f5-4d60-885a-df6416214762',NULL,'auth-spnego','e9b256af-8af6-4c2f-aaef-4c6c79cded41','946c97e3-ff77-4d5a-bb27-cc961813f0a7',3,20,_binary '\0',NULL,NULL),('f82fabf5-ca4e-4171-a729-383f07e0edc4',NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','b20db232-5e63-403f-9b3c-355c7ec9db04',2,20,_binary '','b6a3eaa4-b22c-4fd2-82b5-e9af923c7ee7',NULL),('f8ecb9c0-2aa3-4038-af6d-918086d7f6be',NULL,'reset-password','0203963c-b9ab-4f3f-a428-8d6164de047c','01d7e6d5-196d-4a2d-8cd7-14247706c497',0,30,_binary '\0',NULL,NULL),('fd375f99-0cb4-4f68-90dc-4c4ae44faf25',NULL,'auth-spnego','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d45715e4-4929-4536-ad40-7998518dc3c2',3,30,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('01d7e6d5-196d-4a2d-8cd7-14247706c497','reset credentials','Reset credentials for a user if they forgot their password or something','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('06498cf0-69a3-441e-95a1-f05620b9a5e8','Account verification options','Method with which to verity the existing account','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('0964c30a-558b-4b3f-942b-6d7da8822946','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('1dcdd1f4-3fc9-4def-9d0f-676b2d1034b4','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('1f2faeeb-f196-4d53-a2a6-997d5fc22b06','docker auth','Used by Docker clients to authenticate against the IDP','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('2fd0f040-bd49-48cb-b96c-5f0eda6d3b3b','forms','Username, password, otp and other auth forms.','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('3813c8d8-7ede-46a8-987d-c6ce9cb9c2b6','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('43660315-9cce-4a03-a95b-b994a916e051','registration form','registration form','0203963c-b9ab-4f3f-a428-8d6164de047c','form-flow',_binary '\0',_binary ''),('4999a661-ade2-45c3-abca-e1c9d4dd09ce','Verify Existing Account by Re-authentication','Reauthentication of existing account','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('4d6b5c29-cb87-45f7-9f09-f07cfbfd9c20','reset credentials','Reset credentials for a user if they forgot their password or something','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('66c16bf3-b2b5-4303-892e-033d66b12af6','saml ecp','SAML ECP Profile Authentication Flow','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('6ae32ddf-3ea7-4256-8c0d-15a82c49c4c2','clients','Base authentication for clients','0203963c-b9ab-4f3f-a428-8d6164de047c','client-flow',_binary '',_binary ''),('6b690b96-5d0e-4116-bd2e-e575054ee4d6','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('73564fa4-0b2b-4d9b-b30f-c719d7dc844b','registration','registration flow','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('7403aae3-fb78-4168-9ce7-cf1a3bf0e56a','Authentication Options','Authentication options.','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('753d7877-34ae-4e2d-a8f2-126ece2aeb45','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('78d6a92c-4700-45ec-93cc-3c703e24039b','User creation or linking','Flow for the existing/non-existing user alternatives','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('7a370e24-52bc-4fe4-b6bd-fda154fcc697','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('7daa8364-492f-4a0b-8fa2-53383814fe65','direct grant','OpenID Connect Resource Owner Grant','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('85780434-1e3d-4959-8f86-96e8608f64e7','direct grant','OpenID Connect Resource Owner Grant','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('8d33e629-8ee9-43a3-9847-83ae1d003156','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('8dd70ac9-f0b9-46f9-970a-8435515933e4','browser','browser based authentication','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('8ee056e2-00fa-47e9-926e-4e2af9fb32a6','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('8f871e37-4b60-4529-8b1b-59f5a6a1eb59','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('946c97e3-ff77-4d5a-bb27-cc961813f0a7','browser','browser based authentication','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('a841f452-07b2-43a3-a7db-f1ba69e7b101','registration','registration flow','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('b20db232-5e63-403f-9b3c-355c7ec9db04','Account verification options','Method with which to verity the existing account','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('b2c3f52b-9825-4c1e-ad9f-bf634621c05e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('b6a3eaa4-b22c-4fd2-82b5-e9af923c7ee7','Verify Existing Account by Re-authentication','Reauthentication of existing account','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('b8104e9b-812b-4815-b19f-d70b05bc8647','clients','Base authentication for clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','client-flow',_binary '',_binary ''),('bb4c68d4-6d38-4a85-b825-26dda87ca34f','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('bf8049b0-dc3c-41e7-bac3-d3ece6a2435c','forms','Username, password, otp and other auth forms.','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('c30f3563-154d-4cbe-91ba-287e0b4cf0ad','User creation or linking','Flow for the existing/non-existing user alternatives','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('c896a46c-b941-472b-832c-0ae02faeebc4','saml ecp','SAML ECP Profile Authentication Flow','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary ''),('d45715e4-4929-4536-ad40-7998518dc3c2','Authentication Options','Authentication options.','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '\0',_binary ''),('d9dc7dc0-af84-463d-a064-d2e24d9d550f','docker auth','Used by Docker clients to authenticate against the IDP','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '',_binary ''),('de81fd92-3ff1-4105-8aa8-0e52a6600087','registration form','registration form','e9b256af-8af6-4c2f-aaef-4c6c79cded41','form-flow',_binary '\0',_binary ''),('e3bcb3cd-d786-4607-a43f-ac6998598138','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('f684b3f3-b52a-43a5-87c4-29728749c2c9','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','0203963c-b9ab-4f3f-a428-8d6164de047c','basic-flow',_binary '\0',_binary ''),('ffce6749-d910-4946-9f8e-a27e01b01b5f','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','e9b256af-8af6-4c2f-aaef-4c6c79cded41','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('83b099d7-eeba-4245-b72a-7760f991f3ef','create unique user config','e9b256af-8af6-4c2f-aaef-4c6c79cded41'),('8e2b279b-14db-412b-b99b-2e6394eba49b','create unique user config','0203963c-b9ab-4f3f-a428-8d6164de047c'),('da21d0e6-32b9-4ddd-b775-cae415d215e1','review profile config','0203963c-b9ab-4f3f-a428-8d6164de047c'),('e6230e65-c7f6-46d4-bfae-3bd6d1f0a158','review profile config','e9b256af-8af6-4c2f-aaef-4c6c79cded41');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('83b099d7-eeba-4245-b72a-7760f991f3ef','false','require.password.update.after.registration'),('8e2b279b-14db-412b-b99b-2e6394eba49b','false','require.password.update.after.registration'),('da21d0e6-32b9-4ddd-b775-cae415d215e1','missing','update.profile.on.first.login'),('e6230e65-c7f6-46d4-bfae-3bd6d1f0a158','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0c23c165-5e03-41e7-b014-07e6728dace7',_binary '',_binary '','eazybankclient',0,_binary '\0','daufo7IaB9MPD0Az7aFUtQxNRV1wksfO','',_binary '\0','',_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/eazybank/account/',_binary '\0',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2543af73-7205-4935-8773-ff415d8f4893',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('2f1f4c05-57d8-4167-b071-a115132b0dc2',_binary '',_binary '','eazypublicclient',0,_binary '',NULL,'',_binary '\0','',_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec',_binary '',_binary '','eazybankapi',0,_binary '\0','RlkDi4ZQvMjLvJ4qIyIaIjgFVFs3LJjj',NULL,_binary '\0',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',-1,_binary '',_binary '\0','',_binary '','client-secret',NULL,'',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),('8d286cb3-8eec-4283-9fc6-e5baf1339798',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/eazybank/account/',_binary '\0',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '',_binary '\0','eazybank-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,0,_binary '\0',_binary '\0','eazybank Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b08fe507-49b2-4ef7-995d-3456c14a8948',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/eazybank/console/',_binary '\0',NULL,_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0c23c165-5e03-41e7-b014-07e6728dace7','backchannel.logout.revoke.offline.tokens','false'),('0c23c165-5e03-41e7-b014-07e6728dace7','backchannel.logout.session.required','true'),('0c23c165-5e03-41e7-b014-07e6728dace7','client.secret.creation.time','1675695464'),('0c23c165-5e03-41e7-b014-07e6728dace7','display.on.consent.screen','false'),('0c23c165-5e03-41e7-b014-07e6728dace7','oauth2.device.authorization.grant.enabled','false'),('0c23c165-5e03-41e7-b014-07e6728dace7','oidc.ciba.grant.enabled','false'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','pkce.code.challenge.method','S256'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','post.logout.redirect.uris','+'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','post.logout.redirect.uris','+'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','acr.loa.map','{}'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','backchannel.logout.revoke.offline.tokens','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','backchannel.logout.session.required','true'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','client_credentials.use_refresh_token','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','display.on.consent.screen','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','oauth2.device.authorization.grant.enabled','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','oidc.ciba.grant.enabled','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','pkce.code.challenge.method','S256'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','post.logout.redirect.uris','http://localhost:4200/home'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','require.pushed.authorization.requests','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','tls-client-certificate-bound-access-tokens','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','token.response.type.bearer.lower-case','false'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','use.refresh.tokens','true'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','pkce.code.challenge.method','S256'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','post.logout.redirect.uris','+'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','backchannel.logout.revoke.offline.tokens','false'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','backchannel.logout.session.required','true'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','client.secret.creation.time','1675411883'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','oauth2.device.authorization.grant.enabled','false'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','oidc.ciba.grant.enabled','false'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','pkce.code.challenge.method','S256'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','post.logout.redirect.uris','+'),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','post.logout.redirect.uris','+'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','pkce.code.challenge.method','S256'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0b1144f7-9bca-44c7-a0f1-060e343bec56','web-origins','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('1830c141-5da0-47b8-b308-6cbd27d5bc0f','acr','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('1aa880fc-e7c0-4dc2-8185-f5101fa876e3','offline_access','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect built-in scope: offline_access','openid-connect'),('1dc7190f-3020-47ac-9209-2fefbef4781e','phone','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect built-in scope: phone','openid-connect'),('375e17df-45d8-4e47-bad4-837e17d673e7','email','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect built-in scope: email','openid-connect'),('38b6fb69-95ab-4c6c-a99b-ab536b1a1c16','microprofile-jwt','0203963c-b9ab-4f3f-a428-8d6164de047c','Microprofile - JWT built-in scope','openid-connect'),('4c33f738-1435-41b1-82cf-8a5666cfcdb0','role_list','0203963c-b9ab-4f3f-a428-8d6164de047c','SAML role list','saml'),('5d3baac3-5b68-47ca-b59b-bd14f3fe35d3','acr','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('63d39dac-2585-4e53-a854-85c14f792f6d','profile','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect built-in scope: profile','openid-connect'),('795683ec-4acc-4a11-8f2d-ea03415bb95c','roles','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect scope for add user roles to the access token','openid-connect'),('83e83b6b-85dd-43f0-9329-705d7a86d134','phone','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect built-in scope: phone','openid-connect'),('87ce426d-6432-4ab8-a407-ab6b838427e8','email','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect built-in scope: email','openid-connect'),('8b88f59c-de3d-4d05-801c-22a8507fd82b','offline_access','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect built-in scope: offline_access','openid-connect'),('9854e077-0e4e-4eaf-b355-d9fcfe77fbee','profile','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect built-in scope: profile','openid-connect'),('bb5e77e4-b4f0-4a68-81dd-5636f2aff886','microprofile-jwt','e9b256af-8af6-4c2f-aaef-4c6c79cded41','Microprofile - JWT built-in scope','openid-connect'),('cca17d1b-374b-4e65-9f0a-0ba2c57d7e93','address','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect built-in scope: address','openid-connect'),('d16487d6-75c9-4442-af58-f36e9cfa9017','web-origins','e9b256af-8af6-4c2f-aaef-4c6c79cded41','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('e33706db-781e-48d4-8b7e-ff6334d86f61','roles','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect scope for add user roles to the access token','openid-connect'),('e9694121-8542-435f-9b2e-6ee7e71be99e','role_list','e9b256af-8af6-4c2f-aaef-4c6c79cded41','SAML role list','saml'),('f3749f04-577d-400e-985e-ac8a3b70bc7d','address','0203963c-b9ab-4f3f-a428-8d6164de047c','OpenID Connect built-in scope: address','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0b1144f7-9bca-44c7-a0f1-060e343bec56','','consent.screen.text'),('0b1144f7-9bca-44c7-a0f1-060e343bec56','false','display.on.consent.screen'),('0b1144f7-9bca-44c7-a0f1-060e343bec56','false','include.in.token.scope'),('1830c141-5da0-47b8-b308-6cbd27d5bc0f','false','display.on.consent.screen'),('1830c141-5da0-47b8-b308-6cbd27d5bc0f','false','include.in.token.scope'),('1aa880fc-e7c0-4dc2-8185-f5101fa876e3','${offlineAccessScopeConsentText}','consent.screen.text'),('1aa880fc-e7c0-4dc2-8185-f5101fa876e3','true','display.on.consent.screen'),('1dc7190f-3020-47ac-9209-2fefbef4781e','${phoneScopeConsentText}','consent.screen.text'),('1dc7190f-3020-47ac-9209-2fefbef4781e','true','display.on.consent.screen'),('1dc7190f-3020-47ac-9209-2fefbef4781e','true','include.in.token.scope'),('375e17df-45d8-4e47-bad4-837e17d673e7','${emailScopeConsentText}','consent.screen.text'),('375e17df-45d8-4e47-bad4-837e17d673e7','true','display.on.consent.screen'),('375e17df-45d8-4e47-bad4-837e17d673e7','true','include.in.token.scope'),('38b6fb69-95ab-4c6c-a99b-ab536b1a1c16','false','display.on.consent.screen'),('38b6fb69-95ab-4c6c-a99b-ab536b1a1c16','true','include.in.token.scope'),('4c33f738-1435-41b1-82cf-8a5666cfcdb0','${samlRoleListScopeConsentText}','consent.screen.text'),('4c33f738-1435-41b1-82cf-8a5666cfcdb0','true','display.on.consent.screen'),('5d3baac3-5b68-47ca-b59b-bd14f3fe35d3','false','display.on.consent.screen'),('5d3baac3-5b68-47ca-b59b-bd14f3fe35d3','false','include.in.token.scope'),('63d39dac-2585-4e53-a854-85c14f792f6d','${profileScopeConsentText}','consent.screen.text'),('63d39dac-2585-4e53-a854-85c14f792f6d','true','display.on.consent.screen'),('63d39dac-2585-4e53-a854-85c14f792f6d','true','include.in.token.scope'),('795683ec-4acc-4a11-8f2d-ea03415bb95c','${rolesScopeConsentText}','consent.screen.text'),('795683ec-4acc-4a11-8f2d-ea03415bb95c','true','display.on.consent.screen'),('795683ec-4acc-4a11-8f2d-ea03415bb95c','false','include.in.token.scope'),('83e83b6b-85dd-43f0-9329-705d7a86d134','${phoneScopeConsentText}','consent.screen.text'),('83e83b6b-85dd-43f0-9329-705d7a86d134','true','display.on.consent.screen'),('83e83b6b-85dd-43f0-9329-705d7a86d134','true','include.in.token.scope'),('87ce426d-6432-4ab8-a407-ab6b838427e8','${emailScopeConsentText}','consent.screen.text'),('87ce426d-6432-4ab8-a407-ab6b838427e8','true','display.on.consent.screen'),('87ce426d-6432-4ab8-a407-ab6b838427e8','true','include.in.token.scope'),('8b88f59c-de3d-4d05-801c-22a8507fd82b','${offlineAccessScopeConsentText}','consent.screen.text'),('8b88f59c-de3d-4d05-801c-22a8507fd82b','true','display.on.consent.screen'),('9854e077-0e4e-4eaf-b355-d9fcfe77fbee','${profileScopeConsentText}','consent.screen.text'),('9854e077-0e4e-4eaf-b355-d9fcfe77fbee','true','display.on.consent.screen'),('9854e077-0e4e-4eaf-b355-d9fcfe77fbee','true','include.in.token.scope'),('bb5e77e4-b4f0-4a68-81dd-5636f2aff886','false','display.on.consent.screen'),('bb5e77e4-b4f0-4a68-81dd-5636f2aff886','true','include.in.token.scope'),('cca17d1b-374b-4e65-9f0a-0ba2c57d7e93','${addressScopeConsentText}','consent.screen.text'),('cca17d1b-374b-4e65-9f0a-0ba2c57d7e93','true','display.on.consent.screen'),('cca17d1b-374b-4e65-9f0a-0ba2c57d7e93','true','include.in.token.scope'),('d16487d6-75c9-4442-af58-f36e9cfa9017','','consent.screen.text'),('d16487d6-75c9-4442-af58-f36e9cfa9017','false','display.on.consent.screen'),('d16487d6-75c9-4442-af58-f36e9cfa9017','false','include.in.token.scope'),('e33706db-781e-48d4-8b7e-ff6334d86f61','${rolesScopeConsentText}','consent.screen.text'),('e33706db-781e-48d4-8b7e-ff6334d86f61','true','display.on.consent.screen'),('e33706db-781e-48d4-8b7e-ff6334d86f61','false','include.in.token.scope'),('e9694121-8542-435f-9b2e-6ee7e71be99e','${samlRoleListScopeConsentText}','consent.screen.text'),('e9694121-8542-435f-9b2e-6ee7e71be99e','true','display.on.consent.screen'),('f3749f04-577d-400e-985e-ac8a3b70bc7d','${addressScopeConsentText}','consent.screen.text'),('f3749f04-577d-400e-985e-ac8a3b70bc7d','true','display.on.consent.screen'),('f3749f04-577d-400e-985e-ac8a3b70bc7d','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0c23c165-5e03-41e7-b014-07e6728dace7','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('0c23c165-5e03-41e7-b014-07e6728dace7','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('0c23c165-5e03-41e7-b014-07e6728dace7','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('0c23c165-5e03-41e7-b014-07e6728dace7','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('0c23c165-5e03-41e7-b014-07e6728dace7','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('0c23c165-5e03-41e7-b014-07e6728dace7','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('0c23c165-5e03-41e7-b014-07e6728dace7','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('0c23c165-5e03-41e7-b014-07e6728dace7','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('0c23c165-5e03-41e7-b014-07e6728dace7','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('0ec5e6c4-ff62-409c-b3e9-c1973ed7b268','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('2543af73-7205-4935-8773-ff415d8f4893','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('2543af73-7205-4935-8773-ff415d8f4893','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('2543af73-7205-4935-8773-ff415d8f4893','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('2543af73-7205-4935-8773-ff415d8f4893','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('2543af73-7205-4935-8773-ff415d8f4893','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('2543af73-7205-4935-8773-ff415d8f4893','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('2543af73-7205-4935-8773-ff415d8f4893','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('2543af73-7205-4935-8773-ff415d8f4893','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('2543af73-7205-4935-8773-ff415d8f4893','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('2f1f4c05-57d8-4167-b071-a115132b0dc2','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('2f1f4c05-57d8-4167-b071-a115132b0dc2','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('2f1f4c05-57d8-4167-b071-a115132b0dc2','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('2f1f4c05-57d8-4167-b071-a115132b0dc2','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('2f1f4c05-57d8-4167-b071-a115132b0dc2','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('2f1f4c05-57d8-4167-b071-a115132b0dc2','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('4d9df143-82c8-477c-8b9a-816b7bd7e9a3','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('8d286cb3-8eec-4283-9fc6-e5baf1339798','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('8d286cb3-8eec-4283-9fc6-e5baf1339798','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('8d286cb3-8eec-4283-9fc6-e5baf1339798','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('8d286cb3-8eec-4283-9fc6-e5baf1339798','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('b08fe507-49b2-4ef7-995d-3456c14a8948','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('b08fe507-49b2-4ef7-995d-3456c14a8948','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('b08fe507-49b2-4ef7-995d-3456c14a8948','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('b08fe507-49b2-4ef7-995d-3456c14a8948','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('b08fe507-49b2-4ef7-995d-3456c14a8948','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('b08fe507-49b2-4ef7-995d-3456c14a8948','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('b08fe507-49b2-4ef7-995d-3456c14a8948','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('b08fe507-49b2-4ef7-995d-3456c14a8948','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('b08fe507-49b2-4ef7-995d-3456c14a8948','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('d9c6150e-b096-409d-8abd-9fee5602be1d','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('d9c6150e-b096-409d-8abd-9fee5602be1d','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('d9c6150e-b096-409d-8abd-9fee5602be1d','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('d9c6150e-b096-409d-8abd-9fee5602be1d','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('d9c6150e-b096-409d-8abd-9fee5602be1d','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('d9c6150e-b096-409d-8abd-9fee5602be1d','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('d9c6150e-b096-409d-8abd-9fee5602be1d','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('d9c6150e-b096-409d-8abd-9fee5602be1d','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('d9c6150e-b096-409d-8abd-9fee5602be1d','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('1aa880fc-e7c0-4dc2-8185-f5101fa876e3','1f62e328-2480-42c6-9d2b-ea579f673e09'),('8b88f59c-de3d-4d05-801c-22a8507fd82b','9bc3823e-592a-4585-a7c4-9796c9ffaae9');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('0c91116e-c573-4ac5-9c3f-6f54310f5d4e','rsa-enc-generated','0203963c-b9ab-4f3f-a428-8d6164de047c','rsa-enc-generated','org.keycloak.keys.KeyProvider','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL),('178aa45a-3e39-4158-a58e-53fca64b9a48','aes-generated','e9b256af-8af6-4c2f-aaef-4c6c79cded41','aes-generated','org.keycloak.keys.KeyProvider','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL),('1823e207-ce76-4b86-b965-8f2a48534340','Trusted Hosts','e9b256af-8af6-4c2f-aaef-4c6c79cded41','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','anonymous'),('1b0a72df-f403-4ab2-a40c-fe5ebc1dc915','Full Scope Disabled','0203963c-b9ab-4f3f-a428-8d6164de047c','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','anonymous'),('21cf2c46-4faf-47ae-ad4b-c5be64fdf0a7','hmac-generated','e9b256af-8af6-4c2f-aaef-4c6c79cded41','hmac-generated','org.keycloak.keys.KeyProvider','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL),('26c82649-3bc3-4e23-95a6-cd8033f191c0','Allowed Client Scopes','e9b256af-8af6-4c2f-aaef-4c6c79cded41','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','authenticated'),('275ddd1b-0ab8-4990-8754-89fe5d03160b','Trusted Hosts','0203963c-b9ab-4f3f-a428-8d6164de047c','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','anonymous'),('29b402bd-109c-425c-abd4-388deed69f39','Max Clients Limit','0203963c-b9ab-4f3f-a428-8d6164de047c','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','anonymous'),('358a8d2c-4d9e-4605-a015-01b2b3cc3485','Allowed Protocol Mapper Types','e9b256af-8af6-4c2f-aaef-4c6c79cded41','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','anonymous'),('45dce163-a8b4-4413-91f7-38f221ebadcc','Allowed Client Scopes','0203963c-b9ab-4f3f-a428-8d6164de047c','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','authenticated'),('5d762339-be0d-4539-8f28-646d22141a59','Consent Required','e9b256af-8af6-4c2f-aaef-4c6c79cded41','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','anonymous'),('5e925615-1619-439d-a40e-3ab57916311b','aes-generated','0203963c-b9ab-4f3f-a428-8d6164de047c','aes-generated','org.keycloak.keys.KeyProvider','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL),('755919c3-fc05-4571-af6b-29813c2e116e','rsa-enc-generated','e9b256af-8af6-4c2f-aaef-4c6c79cded41','rsa-enc-generated','org.keycloak.keys.KeyProvider','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL),('7aa0e912-d5e2-4ec5-a765-1df0d25a0958','Allowed Client Scopes','0203963c-b9ab-4f3f-a428-8d6164de047c','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','anonymous'),('81bb882f-d557-4c80-989e-6947266db6f8','Allowed Protocol Mapper Types','e9b256af-8af6-4c2f-aaef-4c6c79cded41','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','authenticated'),('824381e8-badc-4814-9b21-d27229d955fe','Max Clients Limit','e9b256af-8af6-4c2f-aaef-4c6c79cded41','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','anonymous'),('84a2f438-325d-4201-841f-9db4a5bc25c0','Full Scope Disabled','e9b256af-8af6-4c2f-aaef-4c6c79cded41','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','anonymous'),('b505e3c9-4122-4901-b330-a40f03bfa9b6','rsa-generated','0203963c-b9ab-4f3f-a428-8d6164de047c','rsa-generated','org.keycloak.keys.KeyProvider','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL),('c5ea4cfa-ba9e-4f42-8ac5-02012cd402a0','hmac-generated','0203963c-b9ab-4f3f-a428-8d6164de047c','hmac-generated','org.keycloak.keys.KeyProvider','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL),('ce4dc0c5-b418-406c-a273-ba4e8a30b968','Allowed Protocol Mapper Types','0203963c-b9ab-4f3f-a428-8d6164de047c','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','authenticated'),('d0f03ba2-d2f3-4253-b359-37e81330cc86','Allowed Protocol Mapper Types','0203963c-b9ab-4f3f-a428-8d6164de047c','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','anonymous'),('d4e0a839-a56b-46aa-a9a5-22bbda5ecd1f','Allowed Client Scopes','e9b256af-8af6-4c2f-aaef-4c6c79cded41','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','anonymous'),('e0d1e99b-84cf-4040-b718-d3bc1b852cbc','Consent Required','0203963c-b9ab-4f3f-a428-8d6164de047c','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','anonymous'),('fd79fbed-4c60-4968-84fc-49f465acc384','rsa-generated','e9b256af-8af6-4c2f-aaef-4c6c79cded41','rsa-generated','org.keycloak.keys.KeyProvider','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0ae94445-9379-40b8-b11c-2fb5b81d5178','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','saml-role-list-mapper'),('0ed6fade-8578-481a-ae43-ea5ee26ca0dc','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','oidc-address-mapper'),('105ee44f-d984-4b2c-94e1-7bbb825a28a2','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','oidc-full-name-mapper'),('113618a5-0cce-45ff-8632-facd08fc3394','178aa45a-3e39-4158-a58e-53fca64b9a48','kid','6ee7e92f-2ff4-4097-a094-bff8158985d1'),('1184f130-a205-4582-a43c-7ccd9055aeaa','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','saml-user-property-mapper'),('120fd2a6-04b6-4ae5-90a7-423357426e60','824381e8-badc-4814-9b21-d27229d955fe','max-clients','200'),('24eec251-41a6-4124-a526-22d4e520a5fc','b505e3c9-4122-4901-b330-a40f03bfa9b6','privateKey','MIIEpAIBAAKCAQEAwFXhPf837d9C9Yum5qY5d+NlXA2a48av6wP/eqM9moPilomGk/wrhAjZH8zFAcw8uxRh+Oe0HhvBKTl/u5mVgribkcmr1dTM8Qax0uR50U0gAF37zFWjC7kJrrJF3yt6qwhHllfIdhBqYTXH8d1HOm2hBCNC70wmxE8xWWMq+Fi8KVbHDwNHMuKIa0YtwOtJN/gBg+4tzG+7eZP+Vdp1HprHVxW90/nT2hulIjprM1s6n4W0SnW1eAzW6gMS3DCJHHvl6deXLecTGU2RsVZjY5YytFfodmRQfdnUDPgx417XKnYRGBbehElWesnlz9gRoPRR+byFgC+YUdO1b1DQeQIDAQABAoIBAAI7H7Hn22jzH6cp2Snwd6hdQT4Xj2YD4fp/tY4EP8+W1X4xKF3ry8v3uquO2Wf5NIA5NNj9uH9+udR+lbNwpHCYo/Pcxs97PmveBgMbreMk5bGVlAqr/ohYdamQi89MhUPrVfCDOZw34rV1lslpa3u51dAdM4CmWsBl/9otZe8b3WtoE/MtEhPS3lvJzJkxrF30/29CAJ8Njy6dRtGp3M7yphdXDVWpgYwDYrKGdsjHcaKdQGw/xnVHhNrCiVT+NTghMHR1luvGufq0UK96LA8d2Lvp/isMCz9s205PPugOsNysPXeVguzGeqz3uRfLKOnYauFltNKMaos2PrdtQuECgYEA4a7ra2oIxq+xi7SVfbLWb+9sCDGA3ur3sTW1t3tVXcZdMV12MHRXYn/7NaQwy9jrYM4/DpPEz5NbVp/AX/mKsE8K637lnr9HKkPkMmiA7ZjtAimss41rKZLeI2dsxlqvgjp/Hi6PZeY+lk1yx8jfcER/k8XML29iij+NLl2JGvUCgYEA2iwnXXzV9F0IdAMcz577KGTNwWUL7tLlj791VjYyFsQA3SCb1cBHDHxI6et98iU2henlzPIzUsV5XrQlxH6CUtdoFjY2NHd/yQCaApeH6oz5NJoo8bKHt5kVlrilZoC8+4MIqIQ7f3CQyHIWzljPnQrwq/UqL2fCGC1Rc1d3dPUCgYEA0ODl0cANKV/ZsxVLu1B3uphdY+P1g9zzrZepfY3wP9/lx1famRRFAMy1RDuYUkON70ZVBHfuE7UuN6maEvpSy8YMtFP50Ij3I/48Sg+BLOd6jaLmzjSYt5zQbvI9sgSjJqRfnR646DZHPTOnhZO8ghtT/QB4cHrmOFCDqiM2T7UCgYEA05B9m+qyj4Sn7dgW2D8SztjxrdiO+ckJU5wV7MQhTnJDZCt68ozCWRksm6oBOA9eD/4BGfzESD+2sl9/QExtlGfOR7vKVJaNFB3BO0I2SvzprFjR24+EjEWm6cGkowG0QTGP89pG2A4QWFBKTU9SBLfXKulTPyUe0tMfaPoonQECgYBBQa1RkgTskJ90TmW2HwrzdLKBa5pSXlygSQwPCo8VUQWEQrvEa9amdeYg6eeSU9X/w754liF4yIZ2zYnZuxXqMJWtpu4nekGnPSKLZgKcD4rARscoazWHo9EOaEWH72YdGCxBKRzd7QQ3LH02Y1MJeuhBsQobI/JmoXzgn/gzkg=='),('2798249c-e20d-431d-996c-3ead22b25623','29b402bd-109c-425c-abd4-388deed69f39','max-clients','200'),('27edbb25-c39e-4127-b67d-3aff091aceb1','5e925615-1619-439d-a40e-3ab57916311b','priority','100'),('2f16988d-c0ce-44d6-931f-56275c742f85','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','saml-user-property-mapper'),('35bffe77-1352-49f7-9b41-922825db21a3','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('3b5ad167-f028-424b-8b8a-18ee98796f6b','275ddd1b-0ab8-4990-8754-89fe5d03160b','client-uris-must-match','true'),('3bf38517-8197-4278-ba79-97a8f922fcd5','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('3ee40c5c-d7be-42c4-aa17-542dd99ae205','21cf2c46-4faf-47ae-ad4b-c5be64fdf0a7','kid','410702d3-2b43-4b48-9052-8b82bdf5353e'),('3f9eb36c-3cd1-4b44-b41b-ef64ab013ef6','fd79fbed-4c60-4968-84fc-49f465acc384','keyUse','SIG'),('4d2d382c-ffbe-4d10-b2a9-8cfdc240a638','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','saml-user-property-mapper'),('53a687ac-4625-4466-b1f0-856c32b0b70b','178aa45a-3e39-4158-a58e-53fca64b9a48','priority','100'),('5904a76b-505f-4943-9ea9-840c3fa5f1d9','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5a333c1b-212d-429f-b2bf-f2f3fabf57b9','fd79fbed-4c60-4968-84fc-49f465acc384','priority','100'),('5bce2051-aff7-4a0a-99ce-0005d29e6397','b505e3c9-4122-4901-b330-a40f03bfa9b6','keyUse','SIG'),('618e4ece-d5fc-4da4-a374-656ece3cfce3','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('649ee08e-fd12-4948-9c17-ebe345b7106c','fd79fbed-4c60-4968-84fc-49f465acc384','privateKey','MIIEpAIBAAKCAQEArkE/6mf1E5s4xutL2FxGe5AbKDSkJFCfDT3YBli0HZWM5YHc8AaNwzo/ZaNHyT1d5ZQNK/14f9PShzEM1gZ2qSPtT5vUglXOr7JB5iBZunNC+X9pLgvkfrjK2h3ueMZU1SvN5Fz8Dmrqw4QLL2hbd4CLEmIOTsPg2vuAL19RuUW7KrMtvaugEGIR4BbpxznD4GxhDXYzKvmrQAbPuwJZjuoXKJqc6UDGWI2rdQR98YlFIhc9Vz8OU7BV0CWGkD6mOGmz/DbLorD10wPl3CDWE9laf64O7Oyn/0znQtXBhyxRKd6BjHZTt4qBeoIZHEF/2ASokrGIDXnDiXq9RrMbdwIDAQABAoIBABmq39TR4k40h4z5fM8ObI1n4TAvbNwyifMj4G2y5DkVXc8yrU4n0ProWg1JG1pfsTSPdc88g2Lk2zZxua/O/OyWL68Rx6A5Lnw/2CgjLMRjlQJ2S5JuSwaFhs/RJ97fbACIdsgEEFa5VgJdsV4W055LL3ESQ4RDoxvufue7dSjCh65I+vIIUSujreoN3iPyMviTXzI4EpQC7rD8OQOgjqVBrrRipwyXUXsXsWjXt1J0fBKgKvSbF3HvdqmIWBp8j/YzLGiOY/gz1hPJmxUmilJeJGS+dgHIR+BlC2c2aA+CYVDrfiJnLnhQ+CZCaInMPgZIEHTOHE5QMKvAQN38t3UCgYEA6fwcES0qFhjgfifWF9loK9R71vykVPJcUb9vZoAV1bPg4dcDk2B3zVqsP55+6tUY2VsbZkyl+ze+jV492XtafBZa4Lr07ISHTm25k/ajKw/pfRKSUJWAUQUo+kdF6+J5KYTkMYE54ai/mYLH51mnTpizyO+tx6/Mle5uRATdd50CgYEAvqZziyykZ+eLuBWNaib8A1kWUk6uZCOmtJVl1YK/lbiUSZ37PZWcRezj/lcwI8Rcn7mPDrKAQGp7iGAcU2LQBl2JQo/TJ5Cfk2/abUwCdkj3cUI7MDGgTJ3o5mmUmcd7HKGTPuAsoWF65kp6WwSge2ggSOFiog6OuL0PqoJ1dSMCgYBdkAAxJhw0JdJu38MOWlL7Y8X5W6Dijt83mRMUq5cPkxQTeoTlg6ekJ+PEtL4PbRK4p2O3bmLYp5u8r7iPpHG0OMQyJNAXW483X0zby73HVF+LMcfsDTv4KdYO7j0Za8ADSC5vVTst7upemhsReZobJZiOerjEpplqQqM487ETSQKBgQCQAyoqijlSZ5yqHFWrRvF9EfGDkP24lRmbNXMsGkzgKwKQrW6YMYhPZcc/W9r4WZ7h5IhEwN+SSR0xgfBDqNOcy1Eg34XQUDXKaGalwxHlCe8oNbCCEiqVVX8VddGTbBT6Jq8UgsAT04/Dn6TXViJntdsVUnNwGPEEaYQI9+0D4wKBgQCr6HJtoUdvm4BfHI8HbEpMQnkg5nV4jy269JqXBGO+TtBWL/lZP9YQuyc/vK+umBie2E39UHaQHerSteSL3mE3wVeQ4Nuy8mte09f664Buvjag3hPu9IcLb0i02O9cP9tre3/o4/Zo7LioOVrE0MQ4eKFxWNwcur1mK2ks3vorAw=='),('6c8e6455-1cd0-462d-b9a4-9a12745ae22b','21cf2c46-4faf-47ae-ad4b-c5be64fdf0a7','algorithm','HS256'),('6e604ae3-e9f7-4bf4-a8c5-898e593d84df','7aa0e912-d5e2-4ec5-a765-1df0d25a0958','allow-default-scopes','true'),('7ad62301-0003-4887-a3e2-b64555ca5d6e','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','oidc-address-mapper'),('7bfa2c7f-9519-42df-a29d-31da9d5bd205','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','saml-role-list-mapper'),('7d275f79-b977-487b-857b-19764e4e9e0e','c5ea4cfa-ba9e-4f42-8ac5-02012cd402a0','kid','b3985e8d-2754-4d9d-a0bb-c716c73a04d2'),('8133e5d0-8c69-419c-9739-49573d5a5dc9','755919c3-fc05-4571-af6b-29813c2e116e','priority','100'),('82ef5beb-4b44-465d-ac89-96686e49e896','755919c3-fc05-4571-af6b-29813c2e116e','certificate','MIICmzCCAYMCBgGGEnpAmzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMjAyMTQxMjI3WhcNMzMwMjAyMTQxNDA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/fZJi0DJTj0LC1f+vH/BSsWMflkgMH360qFKiemMMY5a3da5ePiWWLEoU0Kcpwj3DJQw/EZC+2PQ/KVf0+6E34BA/8oIN+aB+/FVmFwyordq0k06nlrk0GRh03bZob9hVY5FfpsGSKgMz4jEDuWPk0zb3+8HlqxcthvnNMqtieaRDnAO6EvEGfofOwiNtThEVtH+3UqosVRDCwWFhH0v4LboylGQvUXeDr5VX1/Id9QrA3TXewkxAUv2ugOodOPDJo6F/rVQeeTzmYpTflmkDMCtjm1vJj+e2Y2exZsN0TrdtP1hoeQK0g6FkMxeCfyrau4ShbrjxRmpIihhR2bTPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKxwxFa3H9SOjxFwTaXpwI9y84jVpsFIqz41h20hOcfEW9REHx0m3WrejKc4heQPo7+L2RHgwHDzaxBLOqV/OL55kvB24O8R9QA7IFeLkpR7GfH94nPfhYOWgtW1Wl4sPZ8pOuWELf7sykhD71XJUXccVQV5T+z/BQULxWytetUJcRIyMwLECFjazNjadBjT34o5fnpIVnJsbY+mcRcKL+zli6fp/ardEgYQDeQBwL9NCm2WXA1zwW6GQoUXQG3kg6OJw3mRZmHBICArx9Wiu9+9KV2l2d/gBTYqyIy/bMD+/t638wdV9NG+05e1pRXl0ju85bywmS+lxcoHRbe2O68='),('85756699-9bdb-4951-a879-c731fd82e1bb','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','saml-role-list-mapper'),('8867f997-8367-4ec8-a1cd-62fc0f4a14e9','21cf2c46-4faf-47ae-ad4b-c5be64fdf0a7','priority','100'),('891d9c4c-abc8-454a-ad18-16c71f322852','b505e3c9-4122-4901-b330-a40f03bfa9b6','certificate','MIICnzCCAYcCBgGGFkVpSzANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhlYXp5YmFuazAeFw0yMzAyMDMwNzUzMTNaFw0zMzAyMDMwNzU0NTNaMBMxETAPBgNVBAMMCGVhenliYW5rMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwFXhPf837d9C9Yum5qY5d+NlXA2a48av6wP/eqM9moPilomGk/wrhAjZH8zFAcw8uxRh+Oe0HhvBKTl/u5mVgribkcmr1dTM8Qax0uR50U0gAF37zFWjC7kJrrJF3yt6qwhHllfIdhBqYTXH8d1HOm2hBCNC70wmxE8xWWMq+Fi8KVbHDwNHMuKIa0YtwOtJN/gBg+4tzG+7eZP+Vdp1HprHVxW90/nT2hulIjprM1s6n4W0SnW1eAzW6gMS3DCJHHvl6deXLecTGU2RsVZjY5YytFfodmRQfdnUDPgx417XKnYRGBbehElWesnlz9gRoPRR+byFgC+YUdO1b1DQeQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCs/p+yKM4Hta2FwH7CMTg3ry9MTNiBATrEwiPa41T5M8C2xsWdG/7dVvXgWJUw8M8bLrvojbXA4xilB2dYE9dxWgoUoF8oUm9XnFQpOfDvtFoDyWcoyXu9ijW47AewKe34L/vg+VGlqyHIvnfOhR1YwESfNHTCPyHbp+wMgqLoO7CyFYx4mwG+OmyzCNpKM4XHyBprT6XPxc1xfXTxX8xxagnIA87MWepTH5QwYwxgD3gJWC9VHie5sL82u+knWgdvOyI6s0g78CQ/iDB0B+go2JjqUGrJHlf9JhFHQQuw7YOAzK9/Ows9DNNL5M1eo93xUo++gLLjGgdikwLq0Pev'),('8975019f-c13d-4b55-aa15-675d666aac24','c5ea4cfa-ba9e-4f42-8ac5-02012cd402a0','secret','3W0nkQqrLrhDiGK1xWSikQMCm4W4ZqnRT09bZFkXej1Gs7MG4RTRbYtJ-BPhAqHSMhzIdsWZbP9CU0L078l9cg'),('8d367fdd-9ffe-4d25-a815-98a0d8b40009','0c91116e-c573-4ac5-9c3f-6f54310f5d4e','priority','100'),('9081476c-7359-4bcb-b250-0bab70fd4b0f','26c82649-3bc3-4e23-95a6-cd8033f191c0','allow-default-scopes','true'),('95b30737-a406-4f96-b44e-25d6a8e7f932','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','saml-user-property-mapper'),('9672d162-05d9-4f00-bdaf-39ca8f7a5e4e','0c91116e-c573-4ac5-9c3f-6f54310f5d4e','keyUse','ENC'),('9840175d-9ea4-4dcd-b129-55c76aa80dd2','fd79fbed-4c60-4968-84fc-49f465acc384','certificate','MIICmzCCAYMCBgGGEno/7DANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMjAyMTQxMjI3WhcNMzMwMjAyMTQxNDA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCuQT/qZ/UTmzjG60vYXEZ7kBsoNKQkUJ8NPdgGWLQdlYzlgdzwBo3DOj9lo0fJPV3llA0r/Xh/09KHMQzWBnapI+1Pm9SCVc6vskHmIFm6c0L5f2kuC+R+uMraHe54xlTVK83kXPwOaurDhAsvaFt3gIsSYg5Ow+Da+4AvX1G5Rbsqsy29q6AQYhHgFunHOcPgbGENdjMq+atABs+7AlmO6hcompzpQMZYjat1BH3xiUUiFz1XPw5TsFXQJYaQPqY4abP8NsuisPXTA+XcINYT2Vp/rg7s7Kf/TOdC1cGHLFEp3oGMdlO3ioF6ghkcQX/YBKiSsYgNecOJer1Gsxt3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIsm/jyvcCKBjptnPtWfcu344zv3GyCCIRl03pR9RU9BMTdHAM3I8RlgixQzNVDO6AG0wO3w1lEUh7nPTmWyACHnhj+t4QhZC070EL5CUlFXOE97RrapJX0w9wA4nLW2dYR/JRWv2WgSpovL6koORnMjwyaHlOxcf24tYn9gTCwjXq56LkS9upLqBFKGNiPdd4PAJxMEWhDFf/8gzuTgL1SIfR82GVU8ciG2438aucDWbz9UdwYlEzOZi34t4AodM0XxxUKMiT8dt6Gbl1AOC5nyK0v0VHzxvw+P9zXVkbKeupr502cTQEpbb29Viv5VtOjmlUDS71rRBvRlF2lwpyY='),('9b27aa6c-032b-4037-bd72-6f5c5fce7c00','5e925615-1619-439d-a40e-3ab57916311b','secret','ccwfdRhvmdH-P5JKVRn4Vg'),('9d9c149e-bddb-4d8b-ac7e-ee69ec961f1d','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9dd2bf1a-9086-4eec-98d5-4fdbfdd72fcf','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('9f4b092e-a240-4f3a-8d7d-b881fce34692','c5ea4cfa-ba9e-4f42-8ac5-02012cd402a0','priority','100'),('a4461d8a-d84e-4e94-9ff9-db4b16086d20','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a7ee07c6-ae12-4736-9530-1dd71e9a880d','178aa45a-3e39-4158-a58e-53fca64b9a48','secret','swYabEfWO09c3jkRPHwnHA'),('aa4edc3f-1237-4976-a92d-147da7d740fd','45dce163-a8b4-4413-91f7-38f221ebadcc','allow-default-scopes','true'),('ab3c3e7d-3cd6-42bc-8d71-3b5b66cd5069','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ab903dc3-9923-425f-9806-47ef0160aa6a','275ddd1b-0ab8-4990-8754-89fe5d03160b','host-sending-registration-request-must-match','true'),('bb8d0a8b-0032-4773-9b1d-8b2c3f143316','0c91116e-c573-4ac5-9c3f-6f54310f5d4e','certificate','MIICnzCCAYcCBgGGFkVp4TANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhlYXp5YmFuazAeFw0yMzAyMDMwNzUzMTNaFw0zMzAyMDMwNzU0NTNaMBMxETAPBgNVBAMMCGVhenliYW5rMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlgbZnTHm863aLdpqFDMaAY/8MrrBJvutdBfCx7AXDA24fEYtFiuzzcWer1ZANlEK5+7Fd5fVSIFM0lXH6mH0NBJaJuK8rSTHnULKMsvvobmxoW84ddAMeDjra2FtFJ2DUBxeevyHFF7il/emv8FFXIc9JpKp66R2cksfwnSUvQssF9sQszBVJSexXG+FVP2k2xtPWeswKVQKIMuCEerH9uf6N1JvM/lcdnmABkUlvkdmlU8kHRKPCM5v5wRkVBuAI2uSjPqxWMID8bAZdu/PqVTbuoownQQJilEy7knKMExvotCduRfQzJlFU0SACqsxTfYq0C+GKlENOecST30t1QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQA0pwB27NJujb2zwxfhGBstmMsvo2lL9XHXOVuaAnRsy0ABU11HAW+TgYJKGKkvMPq8AeHxCWYl1JysTFZIj++fBDowlSKgbNo3c1Rv+Or+rzxJPTGtuC6gaqI3sJIbV6g+9OilVz0yIzQPs4RsDxO0bbLldktdNk8m1iStpCs1ufexFH4NY7hjgn8/KEr/gjkLgYdAYFIpyaSnYePGQdyPdNdqC3MxqVzCaU3FS28EYe8HT2g+9XCVqhOuuksjdrAD+fx152UqLI6F4D019Pny9Mnq4M+IpI7sJSM0U/EplPcF7MBFFexu62IlECKShEk0UUFdLOBES13REzM99nTn'),('bc1ef077-aa69-4778-9022-c140f99ce5e1','1823e207-ce76-4b86-b965-8f2a48534340','host-sending-registration-request-must-match','true'),('bea1188d-c36f-4db8-b4ec-ea49464c4463','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c3193480-4fce-4e3d-a04c-12f048b5a127','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','oidc-address-mapper'),('c5463c88-97ff-4f58-9f31-59ac26c92e28','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','oidc-full-name-mapper'),('cc78f406-bbce-4cf3-9ff4-30a68a91737b','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','oidc-full-name-mapper'),('cd7a9e15-0287-41a5-924d-40ab02c10481','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('cd9d62d8-6953-4f60-9e25-4a21213a26aa','5e925615-1619-439d-a40e-3ab57916311b','kid','afb3d9f1-fdf6-48e7-8dc9-a7f1cfa39a39'),('d3662ae5-0e26-4703-bb2e-ae5abaa7254e','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d645e88a-1d24-46b0-b323-8811f8b075e9','0c91116e-c573-4ac5-9c3f-6f54310f5d4e','privateKey','MIIEpAIBAAKCAQEAlgbZnTHm863aLdpqFDMaAY/8MrrBJvutdBfCx7AXDA24fEYtFiuzzcWer1ZANlEK5+7Fd5fVSIFM0lXH6mH0NBJaJuK8rSTHnULKMsvvobmxoW84ddAMeDjra2FtFJ2DUBxeevyHFF7il/emv8FFXIc9JpKp66R2cksfwnSUvQssF9sQszBVJSexXG+FVP2k2xtPWeswKVQKIMuCEerH9uf6N1JvM/lcdnmABkUlvkdmlU8kHRKPCM5v5wRkVBuAI2uSjPqxWMID8bAZdu/PqVTbuoownQQJilEy7knKMExvotCduRfQzJlFU0SACqsxTfYq0C+GKlENOecST30t1QIDAQABAoIBAB0Gdb8ZGrjNy45/+XJvgYpIWE9bPMfFPOVfPHakPY0+MVFPxWTK7zYyE9WRzwoDK2Q8WHVfCWtF4r41zN/udA/H9iucRcsMuNbWx2ZE+NdV5QUZzrdSWTtALeHAP1mT8MYEuw25wguBoP6sMdVa98ejPYQzL08w6h6KJLqbEfSxwxCGbKd9Ez3R+1jOCL9bFseWB+25jqk9wJ3Pe5MzRY6PpLt+7vIlky5xLi69MYlogsekel1Gpg6SXsnianFiiDf0tQZhqxGKJZklBDzpFG/6r/6GuRPLe5chASeXbpcvUKvPvFvqxoA9/BaQfL4Dk0z4rEpRDTAlB4xYZD8rQOECgYEAxW/sDriGUuhIILdE/KOWxsmjXJAb9VILxQhZaNKhVmdR/x/pZC2C02Ptaycl5sdgho18wikWzpgNL4xm/+iBVNUy1yFLz0H8wAO+6BhQ63EIAuusUtuI+3YH0sJHtdpEHlahz2hTDWVvFC/S+U6WyYQv+VqnyPKQuCfBpD8KynUCgYEAwobkY5ObeNVq+hGoMDNLo0uYfsDqdsuqGHkpPROZChFi5zIrYKQs534qSVaPr6fPTdK+9tzcKXysfQGLpK42CZkJ9MuMcwbujVTBN7X9Ds9+deFsIE2fG35ZrHrXDg88jFT7kv90LgNrTK6rnPbgxu9QWKOQCY3RobOHo7qyqeECgYEAt4D+9e+raQNbhozQIcAqMzjWDQIj+i73oXnRIAwkyBnfrDAMzH9ASRlnYWBRad2FaYm3mv51pC7OkpL8aH3BNwew6SKZQ1khgZX5qd5v12SG/a/tylUhTBa3zrujyvHCvi/m1M8x4hGU3D5W6ECTBVlG/Yu0xqAswfyxjebKMMECgYEAgfZvVhvC7mrfiu0LChDrQtD5tA2dV/rfzHP+WkDiqThOdJovIuTs30iKZe8AFmIt/ReE4BdUvB8Aeo/yxPZjQexOG492aU9DR4dNg7QBushj+8u8WqShXVQAA10amtkRIcyRO3eSHj/IizXTkA3cxOwUKPQ2AjwOx1LTl07fmOECgYBu5NwCMwISJwKT65b/49mg/AY5lSI4iEUX/uI9EN2CJhxGX+IQ0S15d9HQnJbTVPkybjG4s3C3c353s/uUTLmtINDrJeS2RtCx6h+EjtX7SAO65A883wox4/GgqhXDnRFCTjL9zaDMqGIbiZ+OAZedye8RJ7Eywre8V2hOmtDqGQ=='),('d76a8f71-79fe-4aa9-b001-379992cfc5ce','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','oidc-address-mapper'),('d95abe92-3fbe-4d3e-bd3d-7468e862f589','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('dbe3e424-1bd3-464c-a62b-366e4419f0d5','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('deca6334-98a8-4ac8-b587-68f43819357b','21cf2c46-4faf-47ae-ad4b-c5be64fdf0a7','secret','t4bNeSw8G6_Tx7aD3O7fhcIxB5g4eKrKNIBd89bYDzlyRSmYZF8zKLAH9ICT4zCfcW4rjf6_yHe8X7t5bmsXGQ'),('dfc04ff4-4099-4e05-ab70-fc3a9333da47','0c91116e-c573-4ac5-9c3f-6f54310f5d4e','algorithm','RSA-OAEP'),('e30ed73a-a7e6-4325-a406-2f19e6c9f018','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('ea0deddb-75da-4ad5-989e-682e05505444','1823e207-ce76-4b86-b965-8f2a48534340','client-uris-must-match','true'),('eb107e63-1f71-4902-be6f-63218265b50f','c5ea4cfa-ba9e-4f42-8ac5-02012cd402a0','algorithm','HS256'),('edba06e6-a485-45b5-9a5c-e961c4482f9b','d4e0a839-a56b-46aa-a9a5-22bbda5ecd1f','allow-default-scopes','true'),('ee22d798-f60a-46e5-8958-950827658f7f','755919c3-fc05-4571-af6b-29813c2e116e','privateKey','MIIEowIBAAKCAQEAv32SYtAyU49CwtX/rx/wUrFjH5ZIDB9+tKhSonpjDGOWt3WuXj4llixKFNCnKcI9wyUMPxGQvtj0PylX9PuhN+AQP/KCDfmgfvxVZhcMqK3atJNOp5a5NBkYdN22aG/YVWORX6bBkioDM+IxA7lj5NM29/vB5asXLYb5zTKrYnmkQ5wDuhLxBn6HzsIjbU4RFbR/t1KqLFUQwsFhYR9L+C26MpRkL1F3g6+VV9fyHfUKwN013sJMQFL9roDqHTjwyaOhf61UHnk85mKU35ZpAzArY5tbyY/ntmNnsWbDdE63bT9YaHkCtIOhZDMXgn8q2ruEoW648UZqSIoYUdm0zwIDAQABAoIBADwOu7s/FhGsBGHMMWFxEHQ3C2IsRZN7y0cI5cXswaTwlSQcBiCruCkl4eQuXsdTkwBh3bnoHfAlZlFq+5mr0/AM17veqNiOOr6pEHWw8/jxcf8hllEsjhCfcFKy+NM/hOefD0ijKeHYSGHc5seGvSRW9E4JiVIpe179jtpDMopzFgnI40ujoiZc0BkVuE4APyureY3o6xdgZ7JfjjnWYfmUzyEcOJKSyAnNvBe8TzWzJzWCSu0XpaL/iOOSWBhQxHjDApC9guPVxHCKDn2TBTl5YZjKci8y6gsiEGUPl1MlUP6bOujaU4zpUc23WrTyJA0q/Y9T/1em3pBmjarAf+0CgYEA7fSSK11FXs7EhO4/anzZcUhNi0x+No3AesU5aE0YLUUcae0Y2QVbjRV0XZC3IEVMLjnxi5YMtZRpmKBUXSLNKqAjMdcH18y0yLyj7jcUUl3EC8C6Rhz5uxRwRZHJO9YtHfiWkAFCMosDtMIp9+QDQrsoMKV/v0RaZlWHzjFFFI0CgYEAzgL6gy89B+VaCsZIh3wz64Jd90VXczk0mlb9dPQ2AHD193bXp//EE6+KUz2l9giH637cw5GH8HMKm0m6vm114jp4sQYsiu5An6aqVK+gOaAQxhQhFVrSAPDi4Suz6yJMd3yKUx3Fpqdks7Ik0UZ7JaOzWjt+zMsKfUeOYQ10TcsCgYEAhp0sL7IFM3w/eoAZihF1JXvkumAcqpoIgKugLVwnyDxntZj2zJcWUrsHaIMcxfnN/fyzo+bP680466oP79xnOqz7HA/slO1ufH0TNAkeyvXWmVt/RXjQ4j/Ov9yYfexM+76M1oyPuW4hO5n4Cg+ItLCSLOsDWN2/UlMij8gZr2UCgYASWsOVEo1eebm3AgmOQKujjP7wO/ZZprwgECYO2H9DNM1FWgpGxovisR4i4ng53nK1sZzbs8inzKgiQ8RmmPwKxujf5MvtKOMLFl9QokElQTSdYUe9TlUtjki4hRtHlMu5TZhJZXqpqXpYZEPRfXUVWmttW6Wle2WY2do+nWNCVwKBgFfPgv1xzo45S3idVmEGr4Qq86NxjFNTfPndQhKVMFdyzDyNLdN0KPzZLxObHoLturxYcpCk9nLzaaxGTXqTI6mQAY4EGlYpr1id8CvuhiSlQGbGuQLVsJTar54rQvPlLMR2+flmBg7jQQEEoQwfPc9hhLYbpOhgGQkLO6aYogKz'),('f070d7c9-6731-457c-a4fe-30a23e99ad65','755919c3-fc05-4571-af6b-29813c2e116e','algorithm','RSA-OAEP'),('f0b92662-cfe3-4fe0-a6da-50525f00431e','755919c3-fc05-4571-af6b-29813c2e116e','keyUse','ENC'),('f1b35c07-f795-4bbd-9ef2-3bf24690df02','ce4dc0c5-b418-406c-a273-ba4e8a30b968','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f30283bb-7d97-469f-bd09-1e546cd1a492','81bb882f-d557-4c80-989e-6947266db6f8','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f8f079ed-d5cc-4565-9fb1-beca94860097','d0f03ba2-d2f3-4253-b359-37e81330cc86','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f96399ef-8b56-4938-8352-7d02f96bd79a','b505e3c9-4122-4901-b330-a40f03bfa9b6','priority','100'),('f9b6fc02-a2e6-4f9b-95e9-45f8226b3063','358a8d2c-4d9e-4605-a015-01b2b3cc3485','allowed-protocol-mapper-types','saml-role-list-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0bf81e2f-ff62-40bf-877c-e3117408072e','e7377960-9f73-4f93-a8c1-74e8d993229f'),('24b57911-4647-4ef1-b342-bd9618053ebb','1f62e328-2480-42c6-9d2b-ea579f673e09'),('24b57911-4647-4ef1-b342-bd9618053ebb','3704115a-a25c-4204-a897-928c4d82aa7e'),('24b57911-4647-4ef1-b342-bd9618053ebb','553506c6-e1a1-4ca4-86fc-568b24eaa4f5'),('24b57911-4647-4ef1-b342-bd9618053ebb','598e069c-dfa2-4697-83fc-e3f2212bc51e'),('3704115a-a25c-4204-a897-928c4d82aa7e','701b2d59-05b3-4876-a5c0-a7a798d19b36'),('38a7da72-3ac3-40cd-85ff-e471f2503646','9d9799e5-824c-4bea-89bd-5176d46bf09f'),('46f2e3cb-716d-4313-8459-d845b4e2c85a','354cf977-ab47-4021-8932-66618fb7fbbe'),('46f2e3cb-716d-4313-8459-d845b4e2c85a','ba2469dc-e0e5-4794-8fac-3cbaed0a882f'),('57c17200-b0c8-4b80-840d-a02cf6032646','255fe7e2-4ed4-4784-a85b-1302b26bacd0'),('57c17200-b0c8-4b80-840d-a02cf6032646','37c9acce-41d5-4a5f-9f97-66f3d74e2b14'),('6c03c945-0c36-4238-be2b-a9f1538ec383','193b1365-cefa-41b7-8e37-9657411f8426'),('90b79f2c-e170-42bd-9d63-10d7dd5f42ba','7ca1543a-fdb5-4285-a171-22d9771f0e41'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','194b84da-a2bf-4b18-ad80-135cde25ff5c'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','239d6fd4-e1cf-44a3-b0b3-418d3dc28531'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','2d8b7626-09c3-4bb4-8314-6a8786965d07'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','38d3acbc-c80a-474b-8655-f0aeb1d3ff4d'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','41cecd57-de4c-4e18-93d9-8ebda197ce03'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','4ee2ae3f-6d2d-46e1-82e6-089ad242ea05'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','6a7c1d73-ca4c-4c15-82c2-05f0a85ac45d'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','7a9e2e9b-3436-460e-b6bb-313bcf87a233'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','7ca1543a-fdb5-4285-a171-22d9771f0e41'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','8799b175-b6cf-45f6-9635-9f7be9dd4bdd'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','89181138-afba-4077-bbaf-76cd51482e04'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','90b79f2c-e170-42bd-9d63-10d7dd5f42ba'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','a267eee3-7636-4b75-8a8e-1af8c95e4048'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','b7c88edd-39d2-4900-a936-0e6401fa319e'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','c5e55fed-00a8-4dcd-b26e-765f97dba866'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','d08da0de-2148-4b1f-9bf4-ea4da2dbbdb1'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','d640061f-2464-4c6e-9c69-6faae550020a'),('a7333f25-25fc-4347-9ab5-51ff012b2e69','eb5f2fc6-b124-425e-abb9-29a45865e525'),('aa68ad8a-08e0-4f19-8b61-02554bd73c29','ea3e791b-21cc-427c-9232-63ce9d32ff79'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','061c3cb3-acf4-4145-95cf-56f8b8a5c181'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','23f4215a-415a-499c-8b4f-3ae1d13cd2c4'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','255fe7e2-4ed4-4784-a85b-1302b26bacd0'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','354cf977-ab47-4021-8932-66618fb7fbbe'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','37c9acce-41d5-4a5f-9f97-66f3d74e2b14'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','38a7da72-3ac3-40cd-85ff-e471f2503646'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','3adb9cee-ebfb-4c44-8d7b-1afc54714491'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','446fbd35-d428-4749-84b6-3f87fb83e78f'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','46f2e3cb-716d-4313-8459-d845b4e2c85a'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','46fbc65a-a764-47ee-932c-ae0d98c61041'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','4993227d-8810-4492-a464-a72058c00ed0'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','53a01d76-90a9-40a8-85bd-22861a42669b'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','57c17200-b0c8-4b80-840d-a02cf6032646'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','5f8e1cc7-eca0-4790-8484-2ae795d9295e'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','6b845819-f59c-4b42-b59e-92ae179d9988'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','74901005-cec4-41d7-a84d-0e793c36f46e'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','78ef69a4-36b8-4732-af47-cc148b3a79c2'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','8cd3e467-4667-4418-b01f-febd49bb3100'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','8d7f804c-355b-40d9-85e2-b10a10d842ac'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','8dc78e60-485e-4629-bbc1-6260e5513119'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','9d9799e5-824c-4bea-89bd-5176d46bf09f'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','a154a4fd-64f6-4e6e-ae7e-38cde5443625'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','a33e4eca-79a9-4c03-96ba-73269bf8014d'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','a7b4259b-f216-491b-8ba9-7f7efdd34f24'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','aa68ad8a-08e0-4f19-8b61-02554bd73c29'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','b148e83f-3e62-4682-b93f-b06ee55f1e1b'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','ba2469dc-e0e5-4794-8fac-3cbaed0a882f'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','bc4ce527-34a1-401e-800a-32f6d374dcc1'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','c9dd5b53-c7ce-4a17-aeff-6f967620e151'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','cf8d2c97-cf4e-4a93-ad89-65b23684b24e'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','cf9f76c3-f3f6-4d70-b5cc-b6a6845f880b'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','d870dee2-55df-4fa2-a562-44819c86aa12'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','e354cb5c-b3b0-4a5c-8931-dbc81aa75a00'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','ea3e791b-21cc-427c-9232-63ce9d32ff79'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','eb80b1b2-cad6-49f8-8539-72d71fc05e89'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','f5c66707-03ee-4de3-a882-5facc7a8d8cb'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','fd4f1847-f131-4c91-b852-9dfdcddbb2d8'),('bd87c3b9-822a-4c8e-b483-dd2803eceeda','6789d08e-9d0e-495d-addc-c34e163b7a2e'),('c5e55fed-00a8-4dcd-b26e-765f97dba866','194b84da-a2bf-4b18-ad80-135cde25ff5c'),('c5e55fed-00a8-4dcd-b26e-765f97dba866','4ee2ae3f-6d2d-46e1-82e6-089ad242ea05'),('e56e2f1c-27eb-4f9e-9547-2c14eda93c7e','17e2a6db-bf8f-44e0-8128-51839b36731a'),('e56e2f1c-27eb-4f9e-9547-2c14eda93c7e','9bc3823e-592a-4585-a7c4-9796c9ffaae9'),('e56e2f1c-27eb-4f9e-9547-2c14eda93c7e','bd87c3b9-822a-4c8e-b483-dd2803eceeda'),('e56e2f1c-27eb-4f9e-9547-2c14eda93c7e','c5d7673d-0ae1-4456-a378-4af0a316c62a');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('1074d2fa-43b0-4723-8aad-843d2d333c0a',NULL,'password','a592aea8-2c9f-45ec-a8e1-e1af37fcb795',1675695753490,'My password','{\"value\":\"3tJ69SEpbJt+OtETQP6wApUt8E2MQM5u2ol41n+xyjP+PG8eRRe2aFCohYn6u/YDdgx0vl26jJL+7DeB+Dt+zg==\",\"salt\":\"3DSrxHpUH476vJJvxbiRHA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('e9e5f9ff-914c-4851-8460-01ab09716a93',NULL,'password','2c28796c-baa3-46f1-9542-42224ffef1ee',1675347324751,NULL,'{\"value\":\"l9eOuR110QERjRpWIZZp9ryEVtlbBqjwEbWA5MD+8vZVkuZoA5SJAtktfPaSY2oVvVmgIW4TbjZHPEk974wy3g==\",\"salt\":\"D2oYxMutghVxByqvVR8tLQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-02-02 14:12:37',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-02-02 14:12:37',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-02-02 14:12:38',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-02-02 14:12:38',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-02-02 14:12:42',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-02-02 14:12:42',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-02-02 14:12:48',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-02-02 14:12:48',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-02-02 14:12:48',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-02-02 14:12:54',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-02-02 14:12:57',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-02-02 14:12:57',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-02-02 14:12:57',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-02-02 14:12:58',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-02-02 14:12:58',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-02-02 14:12:58',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-02-02 14:12:58',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-02-02 14:13:02',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-02-02 14:13:06',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-02-02 14:13:06',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-02-02 14:13:06',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-02-02 14:13:06',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-02-02 14:13:07',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-02-02 14:13:07',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-02-02 14:13:07',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-02-02 14:13:08',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-02-02 14:13:14',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-02-02 14:13:14',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-02-02 14:13:17',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-02-02 14:13:18',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-02-02 14:13:19',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-02-02 14:13:19',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-02-02 14:13:20',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-02-02 14:13:20',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-02-02 14:13:25',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-02-02 14:13:25',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-02-02 14:13:25',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'5347123351'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-02-02 14:13:25',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-02-02 14:13:25',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-02-02 14:13:25',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-02-02 14:13:25',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-02-02 14:13:25',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-02-02 14:13:30',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-02-02 14:13:30',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-02-02 14:13:31',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-02-02 14:13:31',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-02-02 14:13:31',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-02-02 14:13:35',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-02-02 14:13:35',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-02-02 14:13:38',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-02-02 14:13:39',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-02-02 14:13:39',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-02-02 14:13:39',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-02-02 14:13:39',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-02-02 14:13:39',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-02-02 14:13:40',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-02-02 14:13:41',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-02-02 14:13:48',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-02-02 14:13:50',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-02-02 14:13:51',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-02-02 14:13:51',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-02-02 14:13:51',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-02-02 14:13:52',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-02-02 14:13:52',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-02-02 14:13:52',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-02-02 14:13:52',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-02-02 14:13:52',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-02-02 14:13:53',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-02-02 14:13:53',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-02-02 14:13:54',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'5347123351'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-02-02 14:13:54',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.8.0',NULL,NULL,'5347123351'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-02-02 14:13:54',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'5347123351'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-02-02 14:13:54',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'5347123351'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-02-02 14:13:54',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'5347123351'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-02-02 14:13:56',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-02-02 14:13:56',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-02-02 14:13:56',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-02-02 14:13:56',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-02-02 14:13:59',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-02-02 14:13:59',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-02-02 14:13:59',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-02-02 14:13:59',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-02-02 14:13:59',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-02-02 14:13:59',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'5347123351'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-02-02 14:14:00',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-02-02 14:14:00',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.8.0',NULL,NULL,'5347123351'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-02-02 14:14:00',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-02-02 14:14:00',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.8.0',NULL,NULL,'5347123351'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:01',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.8.0',NULL,NULL,'5347123351'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:01',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.8.0',NULL,NULL,'5347123351'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:01',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'5347123351'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:01',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:01',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:02',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'5347123351'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:02',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-02-02 14:14:02',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:02',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'5347123351'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:02',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'5347123351'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:02',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'5347123351'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:02',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'5347123351'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:02',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'5347123351'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:03',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-02-02 14:14:03',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.8.0',NULL,NULL,'5347123351'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-02-02 14:14:03',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.8.0',NULL,NULL,'5347123351'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-02-02 14:14:03',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-02-02 14:14:03',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'5347123351'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-02-02 14:14:03',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.8.0',NULL,NULL,'5347123351'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-02-02 14:14:03',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-02-02 14:14:03',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'5347123351'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-02-02 14:14:04',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'5347123351');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('0203963c-b9ab-4f3f-a428-8d6164de047c','0b1144f7-9bca-44c7-a0f1-060e343bec56',_binary ''),('0203963c-b9ab-4f3f-a428-8d6164de047c','1aa880fc-e7c0-4dc2-8185-f5101fa876e3',_binary '\0'),('0203963c-b9ab-4f3f-a428-8d6164de047c','1dc7190f-3020-47ac-9209-2fefbef4781e',_binary '\0'),('0203963c-b9ab-4f3f-a428-8d6164de047c','375e17df-45d8-4e47-bad4-837e17d673e7',_binary ''),('0203963c-b9ab-4f3f-a428-8d6164de047c','38b6fb69-95ab-4c6c-a99b-ab536b1a1c16',_binary '\0'),('0203963c-b9ab-4f3f-a428-8d6164de047c','4c33f738-1435-41b1-82cf-8a5666cfcdb0',_binary ''),('0203963c-b9ab-4f3f-a428-8d6164de047c','5d3baac3-5b68-47ca-b59b-bd14f3fe35d3',_binary ''),('0203963c-b9ab-4f3f-a428-8d6164de047c','63d39dac-2585-4e53-a854-85c14f792f6d',_binary ''),('0203963c-b9ab-4f3f-a428-8d6164de047c','e33706db-781e-48d4-8b7e-ff6334d86f61',_binary ''),('0203963c-b9ab-4f3f-a428-8d6164de047c','f3749f04-577d-400e-985e-ac8a3b70bc7d',_binary '\0'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','1830c141-5da0-47b8-b308-6cbd27d5bc0f',_binary ''),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','795683ec-4acc-4a11-8f2d-ea03415bb95c',_binary ''),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','83e83b6b-85dd-43f0-9329-705d7a86d134',_binary '\0'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','87ce426d-6432-4ab8-a407-ab6b838427e8',_binary ''),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','8b88f59c-de3d-4d05-801c-22a8507fd82b',_binary '\0'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','9854e077-0e4e-4eaf-b355-d9fcfe77fbee',_binary ''),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','bb5e77e4-b4f0-4a68-81dd-5636f2aff886',_binary '\0'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','cca17d1b-374b-4e65-9f0a-0ba2c57d7e93',_binary '\0'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','d16487d6-75c9-4442-af58-f36e9cfa9017',_binary ''),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','e9694121-8542-435f-9b2e-6ee7e71be99e',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
INSERT INTO `FEDERATED_IDENTITY` VALUES ('github','0203963c-b9ab-4f3f-a428-8d6164de047c','2155941','dzmitrykashlach',NULL,'b11c1647-2836-41f5-b66e-a90cbd3dc5cb');
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
INSERT INTO `IDENTITY_PROVIDER` VALUES ('bf207575-2826-4415-b535-1351a0fea124',_binary '','github','github',_binary '\0',_binary '\0','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0',_binary '\0','0964c30a-558b-4b3f-942b-6d7da8822946',NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
INSERT INTO `IDENTITY_PROVIDER_CONFIG` VALUES ('bf207575-2826-4415-b535-1351a0fea124','1e8acf076d34de5cdb99','clientId'),('bf207575-2826-4415-b535-1351a0fea124','a159387221dee0b283c282d0e54c1a88ddb34079','clientSecret');
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00a39eb2-736c-48fe-85c2-b7f47b36e524','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0','','USER','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL,NULL),('061c3cb3-acf4-4145-95cf-56f8b8a5c181','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_manage-identity-providers}','manage-identity-providers','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('0a9380fd-2076-41ff-86be-da1c31b3c7de','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_view-applications}','view-applications','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('0bf81e2f-ff62-40bf-877c-e3117408072e','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_manage-consent}','manage-consent','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('17e2a6db-bf8f-44e0-8128-51839b36731a','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_view-profile}','view-profile','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('193b1365-cefa-41b7-8e37-9657411f8426','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_view-consent}','view-consent','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('194b84da-a2bf-4b18-ad80-135cde25ff5c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_query-groups}','query-groups','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('1f62e328-2480-42c6-9d2b-ea579f673e09','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0','${role_offline-access}','offline_access','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL,NULL),('239d6fd4-e1cf-44a3-b0b3-418d3dc28531','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_query-realms}','query-realms','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('23f4215a-415a-499c-8b4f-3ae1d13cd2c4','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_impersonation}','impersonation','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('24b57911-4647-4ef1-b342-bd9618053ebb','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0','${role_default-roles}','default-roles-eazybank','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL,NULL),('255fe7e2-4ed4-4784-a85b-1302b26bacd0','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_query-users}','query-users','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('2d8b7626-09c3-4bb4-8314-6a8786965d07','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_view-realm}','view-realm','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('2dfcc2db-c49f-491e-8c23-0b7d49149149','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_delete-account}','delete-account','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('354cf977-ab47-4021-8932-66618fb7fbbe','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_query-users}','query-users','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('3704115a-a25c-4204-a897-928c4d82aa7e','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_manage-account}','manage-account','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('37c9acce-41d5-4a5f-9f97-66f3d74e2b14','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_query-groups}','query-groups','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('38a7da72-3ac3-40cd-85ff-e471f2503646','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_view-clients}','view-clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('38d3acbc-c80a-474b-8655-f0aeb1d3ff4d','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_manage-authorization}','manage-authorization','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('3adb9cee-ebfb-4c44-8d7b-1afc54714491','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_impersonation}','impersonation','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('3ccdb226-b07c-49d4-9098-33799a1578cd','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_view-groups}','view-groups','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('410f9a5c-d295-486e-bc9f-9a9652062f68','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0','','ADMIN','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL,NULL),('41cecd57-de4c-4e18-93d9-8ebda197ce03','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_view-authorization}','view-authorization','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('446fbd35-d428-4749-84b6-3f87fb83e78f','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_view-realm}','view-realm','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('46f2e3cb-716d-4313-8459-d845b4e2c85a','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_view-users}','view-users','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('46fbc65a-a764-47ee-932c-ae0d98c61041','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_view-identity-providers}','view-identity-providers','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('4993227d-8810-4492-a464-a72058c00ed0','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_query-realms}','query-realms','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('4ee2ae3f-6d2d-46e1-82e6-089ad242ea05','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_query-users}','query-users','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('53a01d76-90a9-40a8-85bd-22861a42669b','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_view-identity-providers}','view-identity-providers','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('553506c6-e1a1-4ca4-86fc-568b24eaa4f5','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_view-profile}','view-profile','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('57c17200-b0c8-4b80-840d-a02cf6032646','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_view-users}','view-users','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('598e069c-dfa2-4697-83fc-e3f2212bc51e','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0','${role_uma_authorization}','uma_authorization','0203963c-b9ab-4f3f-a428-8d6164de047c',NULL,NULL),('5f8e1cc7-eca0-4790-8484-2ae795d9295e','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_manage-identity-providers}','manage-identity-providers','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('6789d08e-9d0e-495d-addc-c34e163b7a2e','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_manage-account-links}','manage-account-links','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('6a7c1d73-ca4c-4c15-82c2-05f0a85ac45d','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_view-events}','view-events','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('6b845819-f59c-4b42-b59e-92ae179d9988','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0','${role_create-realm}','create-realm','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,NULL),('6c03c945-0c36-4238-be2b-a9f1538ec383','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_manage-consent}','manage-consent','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('701b2d59-05b3-4876-a5c0-a7a798d19b36','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_manage-account-links}','manage-account-links','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('74901005-cec4-41d7-a84d-0e793c36f46e','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_manage-events}','manage-events','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('78ef69a4-36b8-4732-af47-cc148b3a79c2','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_query-realms}','query-realms','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('7a9e2e9b-3436-460e-b6bb-313bcf87a233','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_manage-identity-providers}','manage-identity-providers','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('7ca1543a-fdb5-4285-a171-22d9771f0e41','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_query-clients}','query-clients','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('80a66622-9d3c-4f48-a3ee-068b8dc17309','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_delete-account}','delete-account','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('8799b175-b6cf-45f6-9635-9f7be9dd4bdd','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_manage-realm}','manage-realm','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('89181138-afba-4077-bbaf-76cd51482e04','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_create-client}','create-client','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('8a479cc1-7a7c-4b24-888c-e52c60f53165','b08fe507-49b2-4ef7-995d-3456c14a8948',_binary '','${role_read-token}','read-token','e9b256af-8af6-4c2f-aaef-4c6c79cded41','b08fe507-49b2-4ef7-995d-3456c14a8948',NULL),('8cd3e467-4667-4418-b01f-febd49bb3100','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_view-realm}','view-realm','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('8d7f804c-355b-40d9-85e2-b10a10d842ac','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_manage-authorization}','manage-authorization','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('8dc78e60-485e-4629-bbc1-6260e5513119','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_manage-clients}','manage-clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('90b79f2c-e170-42bd-9d63-10d7dd5f42ba','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_view-clients}','view-clients','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('9bc3823e-592a-4585-a7c4-9796c9ffaae9','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0','${role_offline-access}','offline_access','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,NULL),('9d9799e5-824c-4bea-89bd-5176d46bf09f','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_query-clients}','query-clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('a154a4fd-64f6-4e6e-ae7e-38cde5443625','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_manage-clients}','manage-clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('a267eee3-7636-4b75-8a8e-1af8c95e4048','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_manage-users}','manage-users','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('a33e4eca-79a9-4c03-96ba-73269bf8014d','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_manage-authorization}','manage-authorization','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('a7333f25-25fc-4347-9ab5-51ff012b2e69','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_realm-admin}','realm-admin','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('a7b4259b-f216-491b-8ba9-7f7efdd34f24','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_manage-events}','manage-events','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('aa68ad8a-08e0-4f19-8b61-02554bd73c29','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_view-clients}','view-clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('b148e83f-3e62-4682-b93f-b06ee55f1e1b','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_manage-realm}','manage-realm','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('b2a8a790-f604-40b2-b34e-544e75b84e21','4d9df143-82c8-477c-8b9a-816b7bd7e9a3',_binary '','${role_read-token}','read-token','0203963c-b9ab-4f3f-a428-8d6164de047c','4d9df143-82c8-477c-8b9a-816b7bd7e9a3',NULL),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0','${role_admin}','admin','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,NULL),('b7c88edd-39d2-4900-a936-0e6401fa319e','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_view-identity-providers}','view-identity-providers','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('ba2469dc-e0e5-4794-8fac-3cbaed0a882f','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_query-groups}','query-groups','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('bc160334-0352-467a-9030-61dcd2db318d','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_view-applications}','view-applications','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('bc4ce527-34a1-401e-800a-32f6d374dcc1','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_view-events}','view-events','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('bd87c3b9-822a-4c8e-b483-dd2803eceeda','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_manage-account}','manage-account','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('c5d7673d-0ae1-4456-a378-4af0a316c62a','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0','${role_uma_authorization}','uma_authorization','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,NULL),('c5e55fed-00a8-4dcd-b26e-765f97dba866','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_view-users}','view-users','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('c9dd5b53-c7ce-4a17-aeff-6f967620e151','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_manage-users}','manage-users','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('cf8d2c97-cf4e-4a93-ad89-65b23684b24e','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_view-events}','view-events','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('cf9f76c3-f3f6-4d70-b5cc-b6a6845f880b','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_create-client}','create-client','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('d08da0de-2148-4b1f-9bf4-ea4da2dbbdb1','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_manage-events}','manage-events','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('d640061f-2464-4c6e-9c69-6faae550020a','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_manage-clients}','manage-clients','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('d870dee2-55df-4fa2-a562-44819c86aa12','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_view-authorization}','view-authorization','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('e354cb5c-b3b0-4a5c-8931-dbc81aa75a00','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_view-authorization}','view-authorization','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('e56e2f1c-27eb-4f9e-9547-2c14eda93c7e','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0','${role_default-roles}','default-roles-master','e9b256af-8af6-4c2f-aaef-4c6c79cded41',NULL,NULL),('e7377960-9f73-4f93-a8c1-74e8d993229f','14f70388-9ea8-4c1b-9b6b-171e2d37a606',_binary '','${role_view-consent}','view-consent','e9b256af-8af6-4c2f-aaef-4c6c79cded41','14f70388-9ea8-4c1b-9b6b-171e2d37a606',NULL),('ea3e791b-21cc-427c-9232-63ce9d32ff79','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_query-clients}','query-clients','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('eb5f2fc6-b124-425e-abb9-29a45865e525','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',_binary '','${role_impersonation}','impersonation','0203963c-b9ab-4f3f-a428-8d6164de047c','e811a4e7-cc0d-44f2-a02e-8de9bfcd58bb',NULL),('eb80b1b2-cad6-49f8-8539-72d71fc05e89','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_manage-users}','manage-users','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL),('f2433021-56ec-4743-9696-ec803dffc6d0','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',_binary '','${role_view-groups}','view-groups','0203963c-b9ab-4f3f-a428-8d6164de047c','8ee2ed59-48ca-40ca-bc9f-f0a1c218968b',NULL),('f5c66707-03ee-4de3-a882-5facc7a8d8cb','d9c6150e-b096-409d-8abd-9fee5602be1d',_binary '','${role_create-client}','create-client','e9b256af-8af6-4c2f-aaef-4c6c79cded41','d9c6150e-b096-409d-8abd-9fee5602be1d',NULL),('fd4f1847-f131-4c91-b852-9dfdcddbb2d8','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',_binary '','${role_manage-realm}','manage-realm','e9b256af-8af6-4c2f-aaef-4c6c79cded41','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('9ixnu','20.0.3',1675347244);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('00676b58-4715-4149-80aa-fb0ec3078149','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('064bf03f-c60c-4cb0-bb84-93dab20e851c','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'795683ec-4acc-4a11-8f2d-ea03415bb95c'),('08d0fe5d-cb62-4d1f-82e3-5b90fa600e4e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'795683ec-4acc-4a11-8f2d-ea03415bb95c'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('0aeceb3d-fcf7-430f-a984-29d557abb501','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('0da24e9c-71ae-4dbf-9ec9-1a64070e3b51','full name','openid-connect','oidc-full-name-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('0db60a01-5271-4263-bcad-20855ead1fc5','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('0e636c6b-9716-46e8-8750-9a3d3a227088','username','openid-connect','oidc-usermodel-property-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('1001d09b-bd4e-472a-8cab-d99732f8635a','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'d16487d6-75c9-4442-af58-f36e9cfa9017'),('1354467f-c5a9-4b1f-adc4-b38d9bf51514','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec',NULL),('14e7d572-534c-463b-9ce8-f3ec6ff77520','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'38b6fb69-95ab-4c6c-a99b-ab536b1a1c16'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1dc7190f-3020-47ac-9209-2fefbef4781e'),('1c436a45-8d71-41c5-871b-7a36c4031c83','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'375e17df-45d8-4e47-bad4-837e17d673e7'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'83e83b6b-85dd-43f0-9329-705d7a86d134'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','address','openid-connect','oidc-address-mapper',NULL,'cca17d1b-374b-4e65-9f0a-0ba2c57d7e93'),('282bdab8-27e2-45be-9131-067bb45daa42','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'e33706db-781e-48d4-8b7e-ff6334d86f61'),('3164ceef-1959-4568-8995-c8a0c1f66781','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'87ce426d-6432-4ab8-a407-ab6b838427e8'),('33aab7ef-48ec-46ad-b560-a83a9497048a','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','email','openid-connect','oidc-usermodel-property-mapper',NULL,'87ce426d-6432-4ab8-a407-ab6b838427e8'),('4598765c-676d-428a-8f89-d9df2497665b','email','openid-connect','oidc-usermodel-property-mapper',NULL,'375e17df-45d8-4e47-bad4-837e17d673e7'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','username','openid-connect','oidc-usermodel-property-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('59764514-a037-448c-8ec2-2f11c8aa0e2c','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'e33706db-781e-48d4-8b7e-ff6334d86f61'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','address','openid-connect','oidc-address-mapper',NULL,'f3749f04-577d-400e-985e-ac8a3b70bc7d'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('6627419f-1a5f-4565-b74c-979e78eaf050','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'bb5e77e4-b4f0-4a68-81dd-5636f2aff886'),('784a6f8a-b418-4b5b-a81c-65d98340c4dc','audience resolve','openid-connect','oidc-audience-resolve-mapper','0e3658fd-b5d2-48e2-80af-bbca2c9de32f',NULL),('808c6884-3cbd-4866-bdd9-b803909c718d','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('864da93f-16fc-4be3-bf2d-c11f46c77293','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'e33706db-781e-48d4-8b7e-ff6334d86f61'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('8fea9703-ecf1-41b0-a21a-0fecb5309146','role list','saml','saml-role-list-mapper',NULL,'e9694121-8542-435f-9b2e-6ee7e71be99e'),('925b9430-a624-474c-a8fe-9911b284ddb1','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'38b6fb69-95ab-4c6c-a99b-ab536b1a1c16'),('9445775d-a137-428a-bc3c-201463d304f9','acr loa level','openid-connect','oidc-acr-mapper',NULL,'1830c141-5da0-47b8-b308-6cbd27d5bc0f'),('9516c144-2c8d-4705-ae46-3e92061426e1','full name','openid-connect','oidc-full-name-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('9aadf8b3-413f-46ac-9511-1db638243f55','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('9ac58c4a-b1dd-4f1a-99f8-b337001b3dda','audience resolve','openid-connect','oidc-audience-resolve-mapper','8d286cb3-8eec-4283-9fc6-e5baf1339798',NULL),('9c3529f3-a585-4442-b10e-d240423224df','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'83e83b6b-85dd-43f0-9329-705d7a86d134'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'bb5e77e4-b4f0-4a68-81dd-5636f2aff886'),('ae6371ae-db15-4da0-aec3-d85c15887289','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('af31cec0-5613-4e68-ab3b-301b96a65214','role list','saml','saml-role-list-mapper',NULL,'4c33f738-1435-41b1-82cf-8a5666cfcdb0'),('b18ff507-047d-4e9d-9927-50d49020d679','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('b66ff348-991d-4074-962e-0849d2839773','acr loa level','openid-connect','oidc-acr-mapper',NULL,'5d3baac3-5b68-47ca-b59b-bd14f3fe35d3'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','locale','openid-connect','oidc-usermodel-attribute-mapper','fe5f8257-594b-4779-a55b-ff2d430aa6cb',NULL),('cd0dac0f-396f-4d16-9352-f566dfa9c9a2','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec',NULL),('cf33d6a6-351d-4aad-9854-0968340df35f','locale','openid-connect','oidc-usermodel-attribute-mapper','399acf14-1ac4-411c-94c3-0b15ef26dfb2',NULL),('d59fe747-b463-4481-a779-ce11193038ab','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'0b1144f7-9bca-44c7-a0f1-060e343bec56'),('daf60e98-a556-4387-9d76-0efe27260123','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1dc7190f-3020-47ac-9209-2fefbef4781e'),('dd84228f-856e-4f33-8f10-d77771f20046','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('e8e948d1-d87f-4778-8813-9b37562ae40f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('ecad53fc-019b-4623-aab8-c3949271931a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63d39dac-2585-4e53-a854-85c14f792f6d'),('fd17c546-c869-42a6-9e7d-cf21fe12815b','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'795683ec-4acc-4a11-8f2d-ea03415bb95c'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9854e077-0e4e-4eaf-b355-d9fcfe77fbee'),('fd90e1ae-69ef-42de-b467-300c3e92c470','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('00676b58-4715-4149-80aa-fb0ec3078149','true','access.token.claim'),('00676b58-4715-4149-80aa-fb0ec3078149','given_name','claim.name'),('00676b58-4715-4149-80aa-fb0ec3078149','true','id.token.claim'),('00676b58-4715-4149-80aa-fb0ec3078149','String','jsonType.label'),('00676b58-4715-4149-80aa-fb0ec3078149','firstName','user.attribute'),('00676b58-4715-4149-80aa-fb0ec3078149','true','userinfo.token.claim'),('08d0fe5d-cb62-4d1f-82e3-5b90fa600e4e','true','access.token.claim'),('08d0fe5d-cb62-4d1f-82e3-5b90fa600e4e','realm_access.roles','claim.name'),('08d0fe5d-cb62-4d1f-82e3-5b90fa600e4e','String','jsonType.label'),('08d0fe5d-cb62-4d1f-82e3-5b90fa600e4e','true','multivalued'),('08d0fe5d-cb62-4d1f-82e3-5b90fa600e4e','foo','user.attribute'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','true','access.token.claim'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','zoneinfo','claim.name'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','true','id.token.claim'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','String','jsonType.label'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','zoneinfo','user.attribute'),('0ad73e7e-c972-4277-9393-c8b41a2796b4','true','userinfo.token.claim'),('0aeceb3d-fcf7-430f-a984-29d557abb501','true','access.token.claim'),('0aeceb3d-fcf7-430f-a984-29d557abb501','gender','claim.name'),('0aeceb3d-fcf7-430f-a984-29d557abb501','true','id.token.claim'),('0aeceb3d-fcf7-430f-a984-29d557abb501','String','jsonType.label'),('0aeceb3d-fcf7-430f-a984-29d557abb501','gender','user.attribute'),('0aeceb3d-fcf7-430f-a984-29d557abb501','true','userinfo.token.claim'),('0da24e9c-71ae-4dbf-9ec9-1a64070e3b51','true','access.token.claim'),('0da24e9c-71ae-4dbf-9ec9-1a64070e3b51','true','id.token.claim'),('0da24e9c-71ae-4dbf-9ec9-1a64070e3b51','true','userinfo.token.claim'),('0db60a01-5271-4263-bcad-20855ead1fc5','true','access.token.claim'),('0db60a01-5271-4263-bcad-20855ead1fc5','zoneinfo','claim.name'),('0db60a01-5271-4263-bcad-20855ead1fc5','true','id.token.claim'),('0db60a01-5271-4263-bcad-20855ead1fc5','String','jsonType.label'),('0db60a01-5271-4263-bcad-20855ead1fc5','zoneinfo','user.attribute'),('0db60a01-5271-4263-bcad-20855ead1fc5','true','userinfo.token.claim'),('0e636c6b-9716-46e8-8750-9a3d3a227088','true','access.token.claim'),('0e636c6b-9716-46e8-8750-9a3d3a227088','preferred_username','claim.name'),('0e636c6b-9716-46e8-8750-9a3d3a227088','true','id.token.claim'),('0e636c6b-9716-46e8-8750-9a3d3a227088','String','jsonType.label'),('0e636c6b-9716-46e8-8750-9a3d3a227088','username','user.attribute'),('0e636c6b-9716-46e8-8750-9a3d3a227088','true','userinfo.token.claim'),('1354467f-c5a9-4b1f-adc4-b38d9bf51514','true','access.token.claim'),('1354467f-c5a9-4b1f-adc4-b38d9bf51514','clientAddress','claim.name'),('1354467f-c5a9-4b1f-adc4-b38d9bf51514','true','id.token.claim'),('1354467f-c5a9-4b1f-adc4-b38d9bf51514','String','jsonType.label'),('1354467f-c5a9-4b1f-adc4-b38d9bf51514','clientAddress','user.session.note'),('14e7d572-534c-463b-9ce8-f3ec6ff77520','true','access.token.claim'),('14e7d572-534c-463b-9ce8-f3ec6ff77520','middle_name','claim.name'),('14e7d572-534c-463b-9ce8-f3ec6ff77520','true','id.token.claim'),('14e7d572-534c-463b-9ce8-f3ec6ff77520','String','jsonType.label'),('14e7d572-534c-463b-9ce8-f3ec6ff77520','middleName','user.attribute'),('14e7d572-534c-463b-9ce8-f3ec6ff77520','true','userinfo.token.claim'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','true','access.token.claim'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','groups','claim.name'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','true','id.token.claim'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','String','jsonType.label'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','true','multivalued'),('16b46a44-ac54-412f-8158-75e7c4a09bbf','foo','user.attribute'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','true','access.token.claim'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','phone_number_verified','claim.name'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','true','id.token.claim'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','boolean','jsonType.label'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','phoneNumberVerified','user.attribute'),('173b8af8-9cf3-4b49-a6e6-0c1a0812b900','true','userinfo.token.claim'),('1c436a45-8d71-41c5-871b-7a36c4031c83','true','access.token.claim'),('1c436a45-8d71-41c5-871b-7a36c4031c83','email_verified','claim.name'),('1c436a45-8d71-41c5-871b-7a36c4031c83','true','id.token.claim'),('1c436a45-8d71-41c5-871b-7a36c4031c83','boolean','jsonType.label'),('1c436a45-8d71-41c5-871b-7a36c4031c83','emailVerified','user.attribute'),('1c436a45-8d71-41c5-871b-7a36c4031c83','true','userinfo.token.claim'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','true','access.token.claim'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','phone_number','claim.name'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','true','id.token.claim'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','String','jsonType.label'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','phoneNumber','user.attribute'),('23eb7c6d-1ace-4c22-bb9b-a018e24629c6','true','userinfo.token.claim'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','true','access.token.claim'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','true','id.token.claim'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','country','user.attribute.country'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','formatted','user.attribute.formatted'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','locality','user.attribute.locality'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','postal_code','user.attribute.postal_code'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','region','user.attribute.region'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','street','user.attribute.street'),('25d7770d-7911-450c-acd4-dd5b4a8fa6bb','true','userinfo.token.claim'),('282bdab8-27e2-45be-9131-067bb45daa42','true','access.token.claim'),('282bdab8-27e2-45be-9131-067bb45daa42','resource_access.${client_id}.roles','claim.name'),('282bdab8-27e2-45be-9131-067bb45daa42','String','jsonType.label'),('282bdab8-27e2-45be-9131-067bb45daa42','true','multivalued'),('282bdab8-27e2-45be-9131-067bb45daa42','foo','user.attribute'),('3164ceef-1959-4568-8995-c8a0c1f66781','true','access.token.claim'),('3164ceef-1959-4568-8995-c8a0c1f66781','email_verified','claim.name'),('3164ceef-1959-4568-8995-c8a0c1f66781','true','id.token.claim'),('3164ceef-1959-4568-8995-c8a0c1f66781','boolean','jsonType.label'),('3164ceef-1959-4568-8995-c8a0c1f66781','emailVerified','user.attribute'),('3164ceef-1959-4568-8995-c8a0c1f66781','true','userinfo.token.claim'),('33aab7ef-48ec-46ad-b560-a83a9497048a','true','access.token.claim'),('33aab7ef-48ec-46ad-b560-a83a9497048a','middle_name','claim.name'),('33aab7ef-48ec-46ad-b560-a83a9497048a','true','id.token.claim'),('33aab7ef-48ec-46ad-b560-a83a9497048a','String','jsonType.label'),('33aab7ef-48ec-46ad-b560-a83a9497048a','middleName','user.attribute'),('33aab7ef-48ec-46ad-b560-a83a9497048a','true','userinfo.token.claim'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','true','access.token.claim'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','given_name','claim.name'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','true','id.token.claim'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','String','jsonType.label'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','firstName','user.attribute'),('3cd0d6b8-fa75-47d1-aef1-d0393c33d3c4','true','userinfo.token.claim'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','true','access.token.claim'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','email','claim.name'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','true','id.token.claim'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','String','jsonType.label'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','email','user.attribute'),('3f38a228-073b-4950-a5bc-0ba71fcd6c3e','true','userinfo.token.claim'),('4598765c-676d-428a-8f89-d9df2497665b','true','access.token.claim'),('4598765c-676d-428a-8f89-d9df2497665b','email','claim.name'),('4598765c-676d-428a-8f89-d9df2497665b','true','id.token.claim'),('4598765c-676d-428a-8f89-d9df2497665b','String','jsonType.label'),('4598765c-676d-428a-8f89-d9df2497665b','email','user.attribute'),('4598765c-676d-428a-8f89-d9df2497665b','true','userinfo.token.claim'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','true','access.token.claim'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','preferred_username','claim.name'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','true','id.token.claim'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','String','jsonType.label'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','username','user.attribute'),('4c50fc3d-b639-40e5-8978-30a1a7c9f630','true','userinfo.token.claim'),('59764514-a037-448c-8ec2-2f11c8aa0e2c','true','access.token.claim'),('59764514-a037-448c-8ec2-2f11c8aa0e2c','realm_access.roles','claim.name'),('59764514-a037-448c-8ec2-2f11c8aa0e2c','String','jsonType.label'),('59764514-a037-448c-8ec2-2f11c8aa0e2c','true','multivalued'),('59764514-a037-448c-8ec2-2f11c8aa0e2c','foo','user.attribute'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','true','access.token.claim'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','true','id.token.claim'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','country','user.attribute.country'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','formatted','user.attribute.formatted'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','locality','user.attribute.locality'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','postal_code','user.attribute.postal_code'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','region','user.attribute.region'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','street','user.attribute.street'),('59f8b4af-35cf-4c61-abfe-59bf8caca791','true','userinfo.token.claim'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','true','access.token.claim'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','website','claim.name'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','true','id.token.claim'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','String','jsonType.label'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','website','user.attribute'),('5e5b0126-2919-4b0f-88db-dab3b9e2b17a','true','userinfo.token.claim'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','true','access.token.claim'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','updated_at','claim.name'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','true','id.token.claim'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','long','jsonType.label'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','updatedAt','user.attribute'),('6329b921-40f6-435b-aa6a-d6354fc5cbec','true','userinfo.token.claim'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','true','access.token.claim'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','gender','claim.name'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','true','id.token.claim'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','String','jsonType.label'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','gender','user.attribute'),('6490165e-c145-4604-9b8b-15ca6ccdb28c','true','userinfo.token.claim'),('6627419f-1a5f-4565-b74c-979e78eaf050','true','access.token.claim'),('6627419f-1a5f-4565-b74c-979e78eaf050','groups','claim.name'),('6627419f-1a5f-4565-b74c-979e78eaf050','true','id.token.claim'),('6627419f-1a5f-4565-b74c-979e78eaf050','String','jsonType.label'),('6627419f-1a5f-4565-b74c-979e78eaf050','true','multivalued'),('6627419f-1a5f-4565-b74c-979e78eaf050','foo','user.attribute'),('808c6884-3cbd-4866-bdd9-b803909c718d','true','access.token.claim'),('808c6884-3cbd-4866-bdd9-b803909c718d','picture','claim.name'),('808c6884-3cbd-4866-bdd9-b803909c718d','true','id.token.claim'),('808c6884-3cbd-4866-bdd9-b803909c718d','String','jsonType.label'),('808c6884-3cbd-4866-bdd9-b803909c718d','picture','user.attribute'),('808c6884-3cbd-4866-bdd9-b803909c718d','true','userinfo.token.claim'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','true','access.token.claim'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','profile','claim.name'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','true','id.token.claim'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','String','jsonType.label'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','profile','user.attribute'),('89b7ac46-f9f0-4076-ace5-7a9983b524bf','true','userinfo.token.claim'),('8fea9703-ecf1-41b0-a21a-0fecb5309146','Role','attribute.name'),('8fea9703-ecf1-41b0-a21a-0fecb5309146','Basic','attribute.nameformat'),('8fea9703-ecf1-41b0-a21a-0fecb5309146','false','single'),('925b9430-a624-474c-a8fe-9911b284ddb1','true','access.token.claim'),('925b9430-a624-474c-a8fe-9911b284ddb1','upn','claim.name'),('925b9430-a624-474c-a8fe-9911b284ddb1','true','id.token.claim'),('925b9430-a624-474c-a8fe-9911b284ddb1','String','jsonType.label'),('925b9430-a624-474c-a8fe-9911b284ddb1','username','user.attribute'),('925b9430-a624-474c-a8fe-9911b284ddb1','true','userinfo.token.claim'),('9445775d-a137-428a-bc3c-201463d304f9','true','access.token.claim'),('9445775d-a137-428a-bc3c-201463d304f9','true','id.token.claim'),('9516c144-2c8d-4705-ae46-3e92061426e1','true','access.token.claim'),('9516c144-2c8d-4705-ae46-3e92061426e1','true','id.token.claim'),('9516c144-2c8d-4705-ae46-3e92061426e1','true','userinfo.token.claim'),('9aadf8b3-413f-46ac-9511-1db638243f55','true','access.token.claim'),('9aadf8b3-413f-46ac-9511-1db638243f55','locale','claim.name'),('9aadf8b3-413f-46ac-9511-1db638243f55','true','id.token.claim'),('9aadf8b3-413f-46ac-9511-1db638243f55','String','jsonType.label'),('9aadf8b3-413f-46ac-9511-1db638243f55','locale','user.attribute'),('9aadf8b3-413f-46ac-9511-1db638243f55','true','userinfo.token.claim'),('9c3529f3-a585-4442-b10e-d240423224df','true','access.token.claim'),('9c3529f3-a585-4442-b10e-d240423224df','birthdate','claim.name'),('9c3529f3-a585-4442-b10e-d240423224df','true','id.token.claim'),('9c3529f3-a585-4442-b10e-d240423224df','String','jsonType.label'),('9c3529f3-a585-4442-b10e-d240423224df','birthdate','user.attribute'),('9c3529f3-a585-4442-b10e-d240423224df','true','userinfo.token.claim'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','true','access.token.claim'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','phone_number_verified','claim.name'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','true','id.token.claim'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','boolean','jsonType.label'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','phoneNumberVerified','user.attribute'),('9cc46ec6-ad76-4c94-b8d7-49de87ba599e','true','userinfo.token.claim'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','true','access.token.claim'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','upn','claim.name'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','true','id.token.claim'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','String','jsonType.label'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','username','user.attribute'),('a64347a5-b4d2-4e39-b28e-6c5ea16b54b0','true','userinfo.token.claim'),('ae6371ae-db15-4da0-aec3-d85c15887289','true','access.token.claim'),('ae6371ae-db15-4da0-aec3-d85c15887289','nickname','claim.name'),('ae6371ae-db15-4da0-aec3-d85c15887289','true','id.token.claim'),('ae6371ae-db15-4da0-aec3-d85c15887289','String','jsonType.label'),('ae6371ae-db15-4da0-aec3-d85c15887289','nickname','user.attribute'),('ae6371ae-db15-4da0-aec3-d85c15887289','true','userinfo.token.claim'),('af31cec0-5613-4e68-ab3b-301b96a65214','Role','attribute.name'),('af31cec0-5613-4e68-ab3b-301b96a65214','Basic','attribute.nameformat'),('af31cec0-5613-4e68-ab3b-301b96a65214','false','single'),('b18ff507-047d-4e9d-9927-50d49020d679','true','access.token.claim'),('b18ff507-047d-4e9d-9927-50d49020d679','family_name','claim.name'),('b18ff507-047d-4e9d-9927-50d49020d679','true','id.token.claim'),('b18ff507-047d-4e9d-9927-50d49020d679','String','jsonType.label'),('b18ff507-047d-4e9d-9927-50d49020d679','lastName','user.attribute'),('b18ff507-047d-4e9d-9927-50d49020d679','true','userinfo.token.claim'),('b66ff348-991d-4074-962e-0849d2839773','true','access.token.claim'),('b66ff348-991d-4074-962e-0849d2839773','true','id.token.claim'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','true','access.token.claim'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','family_name','claim.name'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','true','id.token.claim'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','String','jsonType.label'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','lastName','user.attribute'),('c28c121e-63f1-44d5-bceb-b6f6ff87870e','true','userinfo.token.claim'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','true','access.token.claim'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','locale','claim.name'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','true','id.token.claim'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','String','jsonType.label'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','locale','user.attribute'),('c34353c3-cd80-4c1e-9e00-293f1c9a827e','true','userinfo.token.claim'),('cd0dac0f-396f-4d16-9352-f566dfa9c9a2','true','access.token.claim'),('cd0dac0f-396f-4d16-9352-f566dfa9c9a2','clientId','claim.name'),('cd0dac0f-396f-4d16-9352-f566dfa9c9a2','true','id.token.claim'),('cd0dac0f-396f-4d16-9352-f566dfa9c9a2','String','jsonType.label'),('cd0dac0f-396f-4d16-9352-f566dfa9c9a2','clientId','user.session.note'),('cf33d6a6-351d-4aad-9854-0968340df35f','true','access.token.claim'),('cf33d6a6-351d-4aad-9854-0968340df35f','locale','claim.name'),('cf33d6a6-351d-4aad-9854-0968340df35f','true','id.token.claim'),('cf33d6a6-351d-4aad-9854-0968340df35f','String','jsonType.label'),('cf33d6a6-351d-4aad-9854-0968340df35f','locale','user.attribute'),('cf33d6a6-351d-4aad-9854-0968340df35f','true','userinfo.token.claim'),('daf60e98-a556-4387-9d76-0efe27260123','true','access.token.claim'),('daf60e98-a556-4387-9d76-0efe27260123','phone_number','claim.name'),('daf60e98-a556-4387-9d76-0efe27260123','true','id.token.claim'),('daf60e98-a556-4387-9d76-0efe27260123','String','jsonType.label'),('daf60e98-a556-4387-9d76-0efe27260123','phoneNumber','user.attribute'),('daf60e98-a556-4387-9d76-0efe27260123','true','userinfo.token.claim'),('dd84228f-856e-4f33-8f10-d77771f20046','true','access.token.claim'),('dd84228f-856e-4f33-8f10-d77771f20046','locale','claim.name'),('dd84228f-856e-4f33-8f10-d77771f20046','true','id.token.claim'),('dd84228f-856e-4f33-8f10-d77771f20046','String','jsonType.label'),('dd84228f-856e-4f33-8f10-d77771f20046','locale','user.attribute'),('dd84228f-856e-4f33-8f10-d77771f20046','true','userinfo.token.claim'),('e8e948d1-d87f-4778-8813-9b37562ae40f','true','access.token.claim'),('e8e948d1-d87f-4778-8813-9b37562ae40f','picture','claim.name'),('e8e948d1-d87f-4778-8813-9b37562ae40f','true','id.token.claim'),('e8e948d1-d87f-4778-8813-9b37562ae40f','String','jsonType.label'),('e8e948d1-d87f-4778-8813-9b37562ae40f','picture','user.attribute'),('e8e948d1-d87f-4778-8813-9b37562ae40f','true','userinfo.token.claim'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','true','access.token.claim'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','updated_at','claim.name'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','true','id.token.claim'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','long','jsonType.label'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','updatedAt','user.attribute'),('eb147bdd-5c60-4314-9442-d6a0eee8e7ff','true','userinfo.token.claim'),('ecad53fc-019b-4623-aab8-c3949271931a','true','access.token.claim'),('ecad53fc-019b-4623-aab8-c3949271931a','website','claim.name'),('ecad53fc-019b-4623-aab8-c3949271931a','true','id.token.claim'),('ecad53fc-019b-4623-aab8-c3949271931a','String','jsonType.label'),('ecad53fc-019b-4623-aab8-c3949271931a','website','user.attribute'),('ecad53fc-019b-4623-aab8-c3949271931a','true','userinfo.token.claim'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','true','access.token.claim'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','birthdate','claim.name'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','true','id.token.claim'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','String','jsonType.label'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','birthdate','user.attribute'),('f0fd8c9c-c6cb-4b5b-a40f-669a705be418','true','userinfo.token.claim'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','true','access.token.claim'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','nickname','claim.name'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','true','id.token.claim'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','String','jsonType.label'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','nickname','user.attribute'),('f3b59c7c-1d6c-44a8-800a-8c04f194dc7f','true','userinfo.token.claim'),('fd17c546-c869-42a6-9e7d-cf21fe12815b','true','access.token.claim'),('fd17c546-c869-42a6-9e7d-cf21fe12815b','resource_access.${client_id}.roles','claim.name'),('fd17c546-c869-42a6-9e7d-cf21fe12815b','String','jsonType.label'),('fd17c546-c869-42a6-9e7d-cf21fe12815b','true','multivalued'),('fd17c546-c869-42a6-9e7d-cf21fe12815b','foo','user.attribute'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','true','access.token.claim'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','profile','claim.name'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','true','id.token.claim'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','String','jsonType.label'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','profile','user.attribute'),('fd1a82c8-f15e-411f-9609-a269fd6ff535','true','userinfo.token.claim'),('fd90e1ae-69ef-42de-b467-300c3e92c470','true','access.token.claim'),('fd90e1ae-69ef-42de-b467-300c3e92c470','clientHost','claim.name'),('fd90e1ae-69ef-42de-b467-300c3e92c470','true','id.token.claim'),('fd90e1ae-69ef-42de-b467-300c3e92c470','String','jsonType.label'),('fd90e1ae-69ef-42de-b467-300c3e92c470','clientHost','user.session.note');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('0203963c-b9ab-4f3f-a428-8d6164de047c',60,300,300,'','','',_binary '',_binary '\0',0,'keycloak','eazybank',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','a2a80fc9-229f-4355-901c-b32b5c3bb3b7',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','8dd70ac9-f0b9-46f9-970a-8435515933e4','a841f452-07b2-43a3-a7db-f1ba69e7b101','85780434-1e3d-4959-8f86-96e8608f64e7','01d7e6d5-196d-4a2d-8cd7-14247706c497','6ae32ddf-3ea7-4256-8c0d-15a82c49c4c2',2592000,_binary '\0',900,_binary '',_binary '\0','d9dc7dc0-af84-463d-a064-d2e24d9d550f',0,_binary '\0',0,0,'24b57911-4647-4ef1-b342-bd9618053ebb'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','d9c6150e-b096-409d-8abd-9fee5602be1d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','946c97e3-ff77-4d5a-bb27-cc961813f0a7','73564fa4-0b2b-4d9b-b30f-c719d7dc844b','7daa8364-492f-4a0b-8fa2-53383814fe65','4d6b5c29-cb87-45f7-9f09-f07cfbfd9c20','b8104e9b-812b-4815-b19f-d70b05bc8647',2592000,_binary '\0',900,_binary '',_binary '\0','1f2faeeb-f196-4d53-a2a6-997d5fc22b06',0,_binary '\0',0,0,'e56e2f1c-27eb-4f9e-9547-2c14eda93c7e');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','0203963c-b9ab-4f3f-a428-8d6164de047c','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','e9b256af-8af6-4c2f-aaef-4c6c79cded41','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','0203963c-b9ab-4f3f-a428-8d6164de047c',''),('_browser_header.contentSecurityPolicyReportOnly','e9b256af-8af6-4c2f-aaef-4c6c79cded41',''),('_browser_header.strictTransportSecurity','0203963c-b9ab-4f3f-a428-8d6164de047c','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','e9b256af-8af6-4c2f-aaef-4c6c79cded41','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','0203963c-b9ab-4f3f-a428-8d6164de047c','nosniff'),('_browser_header.xContentTypeOptions','e9b256af-8af6-4c2f-aaef-4c6c79cded41','nosniff'),('_browser_header.xFrameOptions','0203963c-b9ab-4f3f-a428-8d6164de047c','SAMEORIGIN'),('_browser_header.xFrameOptions','e9b256af-8af6-4c2f-aaef-4c6c79cded41','SAMEORIGIN'),('_browser_header.xRobotsTag','0203963c-b9ab-4f3f-a428-8d6164de047c','none'),('_browser_header.xRobotsTag','e9b256af-8af6-4c2f-aaef-4c6c79cded41','none'),('_browser_header.xXSSProtection','0203963c-b9ab-4f3f-a428-8d6164de047c','1; mode=block'),('_browser_header.xXSSProtection','e9b256af-8af6-4c2f-aaef-4c6c79cded41','1; mode=block'),('actionTokenGeneratedByAdminLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','43200'),('actionTokenGeneratedByUserLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','300'),('bruteForceProtected','0203963c-b9ab-4f3f-a428-8d6164de047c','false'),('bruteForceProtected','e9b256af-8af6-4c2f-aaef-4c6c79cded41','false'),('cibaAuthRequestedUserHint','0203963c-b9ab-4f3f-a428-8d6164de047c','login_hint'),('cibaBackchannelTokenDeliveryMode','0203963c-b9ab-4f3f-a428-8d6164de047c','poll'),('cibaExpiresIn','0203963c-b9ab-4f3f-a428-8d6164de047c','120'),('cibaInterval','0203963c-b9ab-4f3f-a428-8d6164de047c','5'),('client-policies.policies','0203963c-b9ab-4f3f-a428-8d6164de047c','{\"policies\":[]}'),('client-policies.profiles','0203963c-b9ab-4f3f-a428-8d6164de047c','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','0203963c-b9ab-4f3f-a428-8d6164de047c','0'),('clientOfflineSessionMaxLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','0'),('clientSessionIdleTimeout','0203963c-b9ab-4f3f-a428-8d6164de047c','0'),('clientSessionMaxLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','0'),('defaultSignatureAlgorithm','0203963c-b9ab-4f3f-a428-8d6164de047c','RS256'),('defaultSignatureAlgorithm','e9b256af-8af6-4c2f-aaef-4c6c79cded41','RS256'),('displayName','e9b256af-8af6-4c2f-aaef-4c6c79cded41','Keycloak'),('displayNameHtml','e9b256af-8af6-4c2f-aaef-4c6c79cded41','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','0203963c-b9ab-4f3f-a428-8d6164de047c','30'),('failureFactor','e9b256af-8af6-4c2f-aaef-4c6c79cded41','30'),('maxDeltaTimeSeconds','0203963c-b9ab-4f3f-a428-8d6164de047c','43200'),('maxDeltaTimeSeconds','e9b256af-8af6-4c2f-aaef-4c6c79cded41','43200'),('maxFailureWaitSeconds','0203963c-b9ab-4f3f-a428-8d6164de047c','900'),('maxFailureWaitSeconds','e9b256af-8af6-4c2f-aaef-4c6c79cded41','900'),('minimumQuickLoginWaitSeconds','0203963c-b9ab-4f3f-a428-8d6164de047c','60'),('minimumQuickLoginWaitSeconds','e9b256af-8af6-4c2f-aaef-4c6c79cded41','60'),('oauth2DeviceCodeLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','600'),('oauth2DevicePollingInterval','0203963c-b9ab-4f3f-a428-8d6164de047c','5'),('offlineSessionMaxLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','5184000'),('offlineSessionMaxLifespan','e9b256af-8af6-4c2f-aaef-4c6c79cded41','5184000'),('offlineSessionMaxLifespanEnabled','0203963c-b9ab-4f3f-a428-8d6164de047c','false'),('offlineSessionMaxLifespanEnabled','e9b256af-8af6-4c2f-aaef-4c6c79cded41','false'),('parRequestUriLifespan','0203963c-b9ab-4f3f-a428-8d6164de047c','60'),('permanentLockout','0203963c-b9ab-4f3f-a428-8d6164de047c','false'),('permanentLockout','e9b256af-8af6-4c2f-aaef-4c6c79cded41','false'),('quickLoginCheckMilliSeconds','0203963c-b9ab-4f3f-a428-8d6164de047c','1000'),('quickLoginCheckMilliSeconds','e9b256af-8af6-4c2f-aaef-4c6c79cded41','1000'),('realmReusableOtpCode','0203963c-b9ab-4f3f-a428-8d6164de047c','false'),('realmReusableOtpCode','e9b256af-8af6-4c2f-aaef-4c6c79cded41','false'),('waitIncrementSeconds','0203963c-b9ab-4f3f-a428-8d6164de047c','60'),('waitIncrementSeconds','e9b256af-8af6-4c2f-aaef-4c6c79cded41','60'),('webAuthnPolicyAttestationConveyancePreference','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyAuthenticatorAttachment','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','0203963c-b9ab-4f3f-a428-8d6164de047c','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','false'),('webAuthnPolicyCreateTimeout','0203963c-b9ab-4f3f-a428-8d6164de047c','0'),('webAuthnPolicyCreateTimeoutPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','0'),('webAuthnPolicyRequireResidentKey','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyRpEntityName','0203963c-b9ab-4f3f-a428-8d6164de047c','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','keycloak'),('webAuthnPolicyRpId','0203963c-b9ab-4f3f-a428-8d6164de047c',''),('webAuthnPolicyRpIdPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c',''),('webAuthnPolicySignatureAlgorithms','0203963c-b9ab-4f3f-a428-8d6164de047c','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','ES256'),('webAuthnPolicyUserVerificationRequirement','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','0203963c-b9ab-4f3f-a428-8d6164de047c','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('0203963c-b9ab-4f3f-a428-8d6164de047c','jboss-logging'),('e9b256af-8af6-4c2f-aaef-4c6c79cded41','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCALE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','0203963c-b9ab-4f3f-a428-8d6164de047c'),('password','password',_binary '',_binary '','e9b256af-8af6-4c2f-aaef-4c6c79cded41');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('0c23c165-5e03-41e7-b014-07e6728dace7','http://localhost:7080/samples'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','/realms/eazybank/account/*'),('14f70388-9ea8-4c1b-9b6b-171e2d37a606','/realms/master/account/*'),('2f1f4c05-57d8-4167-b071-a115132b0dc2','http://localhost:4200/dashboard'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','/admin/master/console/*'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','/realms/master/account/*'),('8ee2ed59-48ca-40ca-bc9f-f0a1c218968b','/realms/eazybank/account/*'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','/admin/eazybank/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('00464835-805e-45e2-8bce-53cf2070859c','UPDATE_PASSWORD','Update Password','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','UPDATE_PASSWORD',30),('21ddcc06-9720-4951-a3b2-0469e72d9267','webauthn-register','Webauthn Register','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','webauthn-register',70),('2269fef1-dc2a-42e8-b8fc-d83f1a087a35','webauthn-register-passwordless','Webauthn Register Passwordless','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','webauthn-register-passwordless',80),('280d6dc4-587e-44a2-984e-397b0f9b16f7','CONFIGURE_TOTP','Configure OTP','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','CONFIGURE_TOTP',10),('29ce3399-c90f-4f33-b579-2284ca8dbe03','UPDATE_PASSWORD','Update Password','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','UPDATE_PASSWORD',30),('2ce11fea-fc0e-47a5-809f-a2a11bbd9d50','webauthn-register','Webauthn Register','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','webauthn-register',70),('35b9448a-52b4-4503-8e12-960e3e86a3f3','UPDATE_PROFILE','Update Profile','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','UPDATE_PROFILE',40),('5063751c-4819-4bd0-af39-b672e93e92ee','update_user_locale','Update User Locale','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','update_user_locale',1000),('5a941f4e-d35f-4dff-a57f-0930f737be8b','webauthn-register-passwordless','Webauthn Register Passwordless','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','webauthn-register-passwordless',80),('6621a91c-59da-4ec2-9822-dd9d455078a0','delete_account','Delete Account','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0',_binary '\0','delete_account',60),('6c508f57-5b6a-4efe-9358-9988d02e4d20','terms_and_conditions','Terms and Conditions','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0',_binary '\0','terms_and_conditions',20),('7e5c2c77-5d22-40c1-b810-73387a1001e2','VERIFY_EMAIL','Verify Email','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','VERIFY_EMAIL',50),('973c478a-5a3e-4e91-b3c1-32b760475a9a','CONFIGURE_TOTP','Configure OTP','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '',_binary '\0','CONFIGURE_TOTP',10),('a14a189a-3498-47cb-8ea4-af50dd707c4c','UPDATE_PROFILE','Update Profile','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','UPDATE_PROFILE',40),('b6023147-76f1-406f-a324-e16fd44e97ce','terms_and_conditions','Terms and Conditions','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '\0',_binary '\0','terms_and_conditions',20),('c2c58709-7373-44c7-8edf-21476a5fa78b','delete_account','Delete Account','0203963c-b9ab-4f3f-a428-8d6164de047c',_binary '\0',_binary '\0','delete_account',60),('cf4c3809-80c8-4492-8b36-85672e16c9a3','update_user_locale','Update User Locale','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','update_user_locale',1000),('f8049c32-b4a8-4d03-b119-52b7bec511bf','VERIFY_EMAIL','Verify Email','e9b256af-8af6-4c2f-aaef-4c6c79cded41',_binary '',_binary '\0','VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','3704115a-a25c-4204-a897-928c4d82aa7e'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','3ccdb226-b07c-49d4-9098-33799a1578cd'),('8d286cb3-8eec-4283-9fc6-e5baf1339798','bd87c3b9-822a-4c8e-b483-dd2803eceeda'),('0e3658fd-b5d2-48e2-80af-bbca2c9de32f','f2433021-56ec-4743-9696-ec803dffc6d0');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('2c28796c-baa3-46f1-9542-42224ffef1ee',NULL,'45552b36-5fdb-4860-9947-6792efdbea33',_binary '\0',_binary '',NULL,NULL,NULL,'e9b256af-8af6-4c2f-aaef-4c6c79cded41','admin',1675347324549,NULL,0),('a592aea8-2c9f-45ec-a8e1-e1af37fcb795','happy@example.com','happy@example.com',_binary '',_binary '',NULL,'Happy','Example','0203963c-b9ab-4f3f-a428-8d6164de047c','happy@example.com',1675695687265,NULL,0),('b11c1647-2836-41f5-b66e-a90cbd3dc5cb','dzmitrykashlach@gmail.com','dzmitrykashlach@gmail.com',_binary '\0',_binary '',NULL,'Dzmitry','Kashlach','0203963c-b9ab-4f3f-a428-8d6164de047c','dzmitrykashlach',1675855753396,NULL,0),('bf983134-e9d7-4a1b-ac5e-13df20fceac2',NULL,'04626d03-beee-4dc3-9884-dc4b54f1848d',_binary '\0',_binary '',NULL,NULL,NULL,'0203963c-b9ab-4f3f-a428-8d6164de047c','service-account-eazybankapi',1675411883037,'6d4c8ba3-2f43-4e26-bf78-8c95c22db0ec',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('061c3cb3-acf4-4145-95cf-56f8b8a5c181','2c28796c-baa3-46f1-9542-42224ffef1ee'),('255fe7e2-4ed4-4784-a85b-1302b26bacd0','2c28796c-baa3-46f1-9542-42224ffef1ee'),('37c9acce-41d5-4a5f-9f97-66f3d74e2b14','2c28796c-baa3-46f1-9542-42224ffef1ee'),('446fbd35-d428-4749-84b6-3f87fb83e78f','2c28796c-baa3-46f1-9542-42224ffef1ee'),('4993227d-8810-4492-a464-a72058c00ed0','2c28796c-baa3-46f1-9542-42224ffef1ee'),('53a01d76-90a9-40a8-85bd-22861a42669b','2c28796c-baa3-46f1-9542-42224ffef1ee'),('57c17200-b0c8-4b80-840d-a02cf6032646','2c28796c-baa3-46f1-9542-42224ffef1ee'),('74901005-cec4-41d7-a84d-0e793c36f46e','2c28796c-baa3-46f1-9542-42224ffef1ee'),('a154a4fd-64f6-4e6e-ae7e-38cde5443625','2c28796c-baa3-46f1-9542-42224ffef1ee'),('a33e4eca-79a9-4c03-96ba-73269bf8014d','2c28796c-baa3-46f1-9542-42224ffef1ee'),('aa68ad8a-08e0-4f19-8b61-02554bd73c29','2c28796c-baa3-46f1-9542-42224ffef1ee'),('b3c57d4d-4117-45dd-8fa7-6d5b48eb4fa5','2c28796c-baa3-46f1-9542-42224ffef1ee'),('bc4ce527-34a1-401e-800a-32f6d374dcc1','2c28796c-baa3-46f1-9542-42224ffef1ee'),('cf9f76c3-f3f6-4d70-b5cc-b6a6845f880b','2c28796c-baa3-46f1-9542-42224ffef1ee'),('d870dee2-55df-4fa2-a562-44819c86aa12','2c28796c-baa3-46f1-9542-42224ffef1ee'),('e56e2f1c-27eb-4f9e-9547-2c14eda93c7e','2c28796c-baa3-46f1-9542-42224ffef1ee'),('ea3e791b-21cc-427c-9232-63ce9d32ff79','2c28796c-baa3-46f1-9542-42224ffef1ee'),('eb80b1b2-cad6-49f8-8539-72d71fc05e89','2c28796c-baa3-46f1-9542-42224ffef1ee'),('fd4f1847-f131-4c91-b852-9dfdcddbb2d8','2c28796c-baa3-46f1-9542-42224ffef1ee'),('00a39eb2-736c-48fe-85c2-b7f47b36e524','a592aea8-2c9f-45ec-a8e1-e1af37fcb795'),('24b57911-4647-4ef1-b342-bd9618053ebb','a592aea8-2c9f-45ec-a8e1-e1af37fcb795'),('410f9a5c-d295-486e-bc9f-9a9652062f68','a592aea8-2c9f-45ec-a8e1-e1af37fcb795'),('24b57911-4647-4ef1-b342-bd9618053ebb','b11c1647-2836-41f5-b66e-a90cbd3dc5cb'),('00a39eb2-736c-48fe-85c2-b7f47b36e524','bf983134-e9d7-4a1b-ac5e-13df20fceac2'),('24b57911-4647-4ef1-b342-bd9618053ebb','bf983134-e9d7-4a1b-ac5e-13df20fceac2'),('410f9a5c-d295-486e-bc9f-9a9652062f68','bf983134-e9d7-4a1b-ac5e-13df20fceac2');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('2f1f4c05-57d8-4167-b071-a115132b0dc2','*'),('399acf14-1ac4-411c-94c3-0b15ef26dfb2','+'),('fe5f8257-594b-4779-a55b-ff2d430aa6cb','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'keycloak'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-09 13:17:11

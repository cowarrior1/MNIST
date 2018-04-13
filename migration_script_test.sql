-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: MultiVender_test
-- Source Schemata: MultiVender_test
-- Created: Fri Apr 13 07:37:45 2018
-- Workbench Version: 6.3.10
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema MultiVender_test
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `MultiVender_test` ;
CREATE SCHEMA IF NOT EXISTS `MultiVender_test` ;

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.mapped_drives
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`mapped_drives`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`mapped_drives` (
  `drive_id` int(11) NOT NULL,
  `drive_name`varchar(10) NULL DEFAULT NULL,
  `real_path` varchar(10) NULL DEFAULT NULL,
  PRIMARY KEY (`drive_id`));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.volume_bodypart
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`volume_bodypart`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_bodypart` (
  `volume_id` varchar(80) NOT NULL,
  `start_slice` int(11) NULL DEFAULT NULL,
  `end_slice` int(11) NULL DEFAULT NULL,
  `tag_time` DATETIME NOT NULL,
  PRIMARY KEY (`volume_id`(255)));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.case_monitor
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`case_monitor`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`case_monitor` (
  `volume_id` varchar(80) NOT NULL,
  `in_memory` BOOLEAN NULL DEFAULT NULL,
  `on_disk` BOOLEAN NULL DEFAULT NULL,
  `is_locked` BOOLEAN NULL DEFAULT NULL,
  `num_loaded` int(11) NULL DEFAULT NULL,
  `last_accessed` DATETIME NOT NULL,
  PRIMARY KEY (`volume_id`(255)));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.annotation
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`annotation`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`annotation` (
  `anno_id` int(11) NOT NULL,
  `annotator_id` varchar(10) NULL DEFAULT NULL,
  `volume_id` varchar(80) NOT NULL,
  `landmark_id` int(11) NOT NULL,
  `world_x` FLOAT(8) NULL DEFAULT NULL,
  `world_y` FLOAT(8) NULL DEFAULT NULL,
  `world_z` FLOAT(8) NULL DEFAULT NULL,
  `voxel_x` FLOAT(8) NULL DEFAULT NULL,
  `voxel_y` FLOAT(8) NULL DEFAULT NULL,
  `voxel_z` FLOAT(8) NULL DEFAULT NULL,
  `rotate_angle` FLOAT(8) NULL DEFAULT NULL,
  `confidence` FLOAT(8) NULL DEFAULT NULL,
  `anno_time` DATETIME NOT NULL,
  PRIMARY KEY (`anno_id`));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.volume_spine
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`volume_spine`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_spine` (
  `volume_id` varchar(80) NOT NULL,
  `cpr` LONGBLOB NULL DEFAULT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  `tag_time` DATETIME NOT NULL,
  PRIMARY KEY (`volume_id`(255)));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.pure_negative
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`pure_negative`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`pure_negative` (
  `pureneg_id` int(11) NOT NULL,
  `annotator_id` LONGTEXT NULL DEFAULT NULL,
  `landmark_id` int(11) NOT NULL,
  `volume_id` varchar(80) NOT NULL,
  `anno_time` DATETIME NOT NULL,
  PRIMARY KEY (`pureneg_id`));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.detection
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`detection`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`detection` (
  `detection_id` int(11) NOT NULL,
  `volume_id` LONGTEXT NOT NULL,
  `landmark_id` int(11) NOT NULL,
  `world_x` FLOAT(8) NULL DEFAULT NULL,
  `world_y` FLOAT(8) NULL DEFAULT NULL,
  `world_z` FLOAT(8) NULL DEFAULT NULL,
  `voxel_x` FLOAT(8) NULL DEFAULT NULL,
  `voxel_y` FLOAT(8) NULL DEFAULT NULL,
  `voxel_z` FLOAT(8) NULL DEFAULT NULL,
  `confidence` FLOAT(8) NULL DEFAULT NULL,
  `detection_time` DATETIME NOT NULL,
  PRIMARY KEY (`detection_id`),
    FOREIGN KEY (`volume_id`)
    REFERENCES `MultiVender_test`.`volume_dicominfo` (`volume_id`));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.volume_filelist
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`volume_filelist`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_filelist` (
  `volume_id` varchar(80)  NOT NULL,
  `filelist` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`volume_id`(255)));

  -- ----------------------------------------------------------------------------
  -- Table MultiVender_test.volume_XR_view
  -- ----------------------------------------------------------------------------
  DROP TABLE IF EXISTS `MultiVender_test`.`volume_XR_view`;
  CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_XR_view` (
    `volume_id` varchar(80) NOT NULL,
    `view_type` int(11) NULL DEFAULT NULL,
    `tag_time` DATETIME NOT NULL,
    PRIMARY KEY (`volume_id`(255)));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.volume_tag
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`volume_tag`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_tag` (
  `volume_id`  varchar(80) NOT NULL,
  `tag_result` varchar(128) NULL DEFAULT NULL,
  `tag_time` DATETIME NOT NULL,
  PRIMARY KEY (`volume_id`(255)));

-- ----------------------------------------------------------------------------
-- Table MultiVender_test.volume_mpr
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`volume_mpr`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_mpr` (
  `volume_id` varchar(80) NOT NULL,
  `axial` LONGBLOB NULL DEFAULT NULL,
  `coronal` LONGBLOB NULL DEFAULT NULL,
  `sagittal` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`volume_id`(255)));
SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------------------------------------------------------
-- Table MultiVender_test.volume_contrast
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `MultiVender_test`.`volume_contrast`;
CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_contrast` (
  `volume_id` varchar(80) NOT NULL,
  `pulmonary_trunk` int(11) DEFAULT NULL,
  `aortic_arch` int(11) DEFAULT NULL,
  `ascending_aorta` int(11) DEFAULT NULL,
  `descending_aorta` int(11) DEFAULT NULL,
  `carotid_arteries` int(11) DEFAULT NULL,
  `iliac_bifurcation` int(11) DEFAULT NULL,
  `LV_of_heart` int(11) DEFAULT NULL,
  `coronary_LM` int(11) DEFAULT NULL,
  `coronary_RCA` int(11) DEFAULT NULL,
  `tag_time`DATETIME NOT NULL,
  PRIMARY KEY (`volume_id`(255)));


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  -- ----------------------------------------------------------------------------
  -- Table MultiVender_test.volume_dicominfo
  -- ----------------------------------------------------------------------------
  DROP TABLE IF EXISTS `MultiVender_test`.`volume_dicominfo`;
  CREATE TABLE IF NOT EXISTS `MultiVender_test`.`volume_dicominfo` (
    `volume_id`  varchar(80) NOT NULL,
    `dicom_path` varchar(256) DEFAULT NULL,
    `series` BOOLEAN,
    `SeriesDescription` varchar(64) DEFAULT NULL,
    `PatientsName` varchar(80) DEFAULT NULL,
    `PatientsAge` int(4) DEFAULT NULL,
    `PatientsSex` varchar(8) DEFAULT NULL,
    `Modality` varchar(10) DEFAULT NULL,
    `BodyPartExamined` varchar(16) DEFAULT NULL,
    `Manufacturer` varchar(32) DEFAULT NULL,
    `ProtocolName` varchar(64) DEFAULT NULL,
    `StudyDescription` varchar(64) DEFAULT NULL,
    `StudyInstanceUID` varchar(64) DEFAULT NULL,
    `FrameOfReferenceUID` varchar(80) DEFAULT NULL,
    `RequestedProcedureDescription` varchar(64) DEFAULT NULL,
    `PixelSpacing` varchar(64) DEFAULT NULL,
    `ImageOrientationPatient` varchar(144) DEFAULT NULL,
    `PatientPosition` varchar(64) DEFAULT NULL,
    `SliceThickness` FLOAT(8) DEFAULT NULL,
    `ConvolutionKernel` varchar(64) DEFAULT NULL,
    `PhotometricInterpretation` varchar(32) DEFAULT NULL,
    `WindowCenter` varchar(64) DEFAULT NULL,
    `WindowWidth` varchar(64) DEFAULT NULL,
    `ImageType` varchar(128) DEFAULT NULL,
    `ImageComments` varchar(128) DEFAULT NULL,
    `num_slices` int(11) DEFAULT NULL,
    `width` int(11) DEFAULT NULL,
    `height` int(11) DEFAULT NULL,
    `depth` int(11) DEFAULT NULL,
    `x_min` FLOAT(8) DEFAULT NULL,
    `y_min` FLOAT(8) DEFAULT NULL,
    `z_min` FLOAT(8) DEFAULT NULL,
    `x_max` FLOAT(8) DEFAULT NULL,
    `y_max` FLOAT(8) DEFAULT NULL,
    `z_max` FLOAT(8) DEFAULT NULL,
    `origin_x` FLOAT(8) DEFAULT NULL,
    `origin_y` FLOAT(8) DEFAULT NULL,
    `origin_z` FLOAT(8) DEFAULT NULL,
    `space_x` FLOAT(8) DEFAULT NULL,
    `space_y` FLOAT(8) DEFAULT NULL,
    `space_z` FLOAT(8) DEFAULT NULL,
    `orientation` varchar(3) DEFAULT NULL,
    `box_str` varchar(256) DEFAULT NULL,
    `last_accessed` DATETIME DEFAULT NULL,
    `comment` varchar(128) DEFAULT NULL,
    `MagneticFieldStrength` FLOAT(8) DEFAULT NULL,
    `FlipAngle`FLOAT(8) DEFAULT NULL,
    `RepetitionTime` FLOAT(8) DEFAULT NULL,
    `EchoTime`FLOAT(8) DEFAULT NULL,
    `ImagingFrequency` FLOAT(8) DEFAULT NULL,
    `EchoTrainLength` FLOAT(8) DEFAULT NULL,
    `SequenceName` varchar(255) DEFAULT NULL,
    `ImagedNucleus` varchar(255) DEFAULT NULL,
    `TransmitCoilName` varchar(255) DEFAULT NULL,
    `InversionTime` varchar(64) DEFAULT NULL,
    `ScanningSequence` varchar(128) DEFAULT NULL,
    `CoilList` varchar(512) DEFAULT NULL,
    PRIMARY KEY (`volume_id`(255)));

INSERT INTO `volume_dicominfo` VALUES ('1.3.6.1.4.1.9328.50.4.489463','cad_r_dColonImagesAnonymizedACRINImagesNewPatient1148038Patient1148038_1.3.6.1.4.1.9328.50.4.489463','1','SUPINE;C MINUS/Vol.//FC13/Q06/','Patient1148038',60,'F','CT','NA','TOSHIBA','SUPINE ACRIN COLON','CT ABD W/CONT  RECONSTRUCTION','1.3.6.1.4.1.9328.50.4.489459','1.3.6.1.4.1.9328.50.4.489461','NA','[\'0.671\', \'0.671\']','[\'1.00000\', \'0.00000\', \'0.00000\', \'0.00000\', \'1.00000\', \'0.00000\']','FFS',1,'FC13','MONOCHROME2','50','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','SUPINEC MINUS',519,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:11:56.832000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.155679','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190619Patient2190619_1.3.6.1.4.1.9328.50.3.155679','1','NA','Patient2190619',-1,'','CT','CHEST','TOSHIBA','NA','NA','1.3.6.1.4.1.9328.50.3.155678','1.3.6.1.4.1.9328.50.3.155679.3','NA','[\'0.628\', \'0.628\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','FFS',3,'FC10','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:11:57.351000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('2.16.840.1.113662.2.1.2432.23327.2030130.2104053.2585033.20','cad_r_dLungImagesAnonymizedMUSCatch2Patient2120340Patient2120340_2.16.840.1.113662.2.1.2432.23327.2030130.2104053.2585033.20','1','NA','Patient2120340',-1,'O','CT','NA','Picker International, Inc.','SPIRAL THORAX','CBC','1.2.840.113745.101000.100100.2.37632.6858.1429480','2.16.840.1.113662.2.1.3432.33327.3030130.3104053','NA','[\'0.5\', \'0.5\']','[\'1\', \'0\', \'0\', \'0\', \'0\', \'-1\']','HFS',2,'NA','MONOCHROME2','550','800','[\'ORIGINAL\', \'PRIMARY\', \'LOCALIZER\']','NA',46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:11:57.977000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2314.1154447552.339','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A6598000TEAAP1.2.840.113619.2.55.1.1762897770.2314.1154447552.339','1','CT Images','98000TEAAP',44,'O','CT','NA','GE MEDICAL SYSTEMS','5.13 PET_CT Body_Head_In','PET DX LYMPHOMA','1.2.840.113619.2.55.1.1762897770.2314.1154447552.335','1.2.840.113619.2.55.1.1762897770.2314.1154447552.336.2208.0.11','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','HFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',239,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:11:58.674000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.111.5908.1100849142.9','cad_r_dColonImagesAnonymizedBelgiumImagesTrainingPatient5520101.2.840.113704.1.111.5908.1100849142.9','1','','Patient552010',76,'M','CT','NA','Philips','Colon/Abdomen/Hx','','1.2.840.113704.1.111.3584.1100848199.2','1.2.840.113704.1.111.5908.1100849023.3','NA','[\'0.833984375\', \'0.833984375\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',1,'B','MONOCHROME2','[\'00060\', \'00060\']','[\'00400\', \'00400\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','',612,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:00.179000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2374.1141662407.550','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A2598000CFN0K1.2.840.113619.2.55.1.1762897770.2374.1141662407.550','1','CT Images','98000CFN0K',86,'O','CT','NA','GE MEDICAL SYSTEMS','5.13 PET_CT Body_Head_In','PET RESG LYMPH','1.2.840.113619.2.55.1.1762897770.2374.1141662407.546','1.2.840.113619.2.55.1.1762897770.2374.1141662407.547.5371.0.11','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','HFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',171,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:00.711000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.111.4904.1101109070.6','cad_r_dColonImagesAnonymizedBelgiumImagesTestingPatient5520091.2.840.113704.1.111.4904.1101109070.6','1','','Patient552009',83,'F','CT','NA','Philips','Colon/Abdomen/Hx','','1.2.840.113704.1.111.3240.1101108916.3','1.2.840.113704.1.111.4904.1101109000.3','NA','[\'0.830078125\', \'0.830078125\']','[\'1.0\', \'0.0\', \'0.0\', \'0.0\', \'-1.0\', \'0.0\']','FFP',1,'B','MONOCHROME2','[\'60.0\', \'60.0\']','[\'400.0\', \'400.0\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','',800,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:02.584000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2392.1136563497.570','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A11980002Z8HB1.2.840.113619.2.55.1.1762897770.2392.1136563497.570','1','CT Images','980002Z8HB',75,'O','CT','NA','GE MEDICAL SYSTEMS','5.13 PET_CT Body_Head_In','PET REG OR WBOD','1.2.840.113619.2.55.1.1762897770.2392.1136563497.566','1.2.840.113619.2.55.1.1762897770.2392.1136563497.567.3568.0.11','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','HFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',205,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:03.291000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.114445','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190484Patient2190484_1.3.6.1.4.1.9328.50.3.114445','1','NA','Patient2190484',-1,'F','CT','NA','Philips','NA','NA','1.3.6.1.4.1.9328.50.3.114446','1.3.6.1.4.1.9328.50.3.114445.3','NA','[\'0.7421875\', \'0.7421875\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',1,'D','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',246,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:04.044000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2374.1115740727.641','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A498000W7EL31.2.840.113619.2.55.1.1762897770.2374.1115740727.641','1','CT Images','98000W7EL3',67,'O','CT','NA','GE MEDICAL SYSTEMS','5.13 PET_CT Body_Head_In','PET RESG LYMPH','1.2.840.113619.2.55.1.1762897770.2374.1115740727.597','1.2.840.113619.2.55.1.1762897770.2374.1115740727.638.2390.0.11','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','HFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',239,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:04.839000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2380.1132246999.969','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A2498000CFN0K1.2.840.113619.2.55.1.1762897770.2380.1132246999.969','1','CT Images','98000CFN0K',85,'O','CT','NA','GE MEDICAL SYSTEMS','5.13 PET_CT Body_Head_In','PET RESG LYMPH','1.2.840.113619.2.55.1.1762897770.2380.1132246999.965','1.2.840.113619.2.55.1.1762897770.2380.1132246999.966.4053.0.11','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','HFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',205,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:05.439000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.111.2084.1098425648.18','cad_r_dColonImagesAnonymizedBelgiumImagesTestingPatient5520151.2.840.113704.1.111.2084.1098425648.18','1','','Patient552015',69,'M','CT','NA','Philips','Colon/Abdomen/Hx','','1.2.840.113704.1.111.3328.1098425037.15','1.2.840.113704.1.111.2084.1098425460.3','NA','[\'0.791015625\', \'0.791015625\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',1,'B','MONOCHROME2','[\'00060\', \'00060\']','[\'00400\', \'00400\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','',880,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:07.658000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('2.16.840.1.113662.2.1.2432.24929.2030521.2094620.254333.20','cad_r_dLungImagesAnonymizedMUSCatch2Patient2120355Patient2120355_2.16.840.1.113662.2.1.2432.24929.2030521.2094620.254333.20','1','NA','Patient2120355',-1,'O','CT','NA','Picker International, Inc.','H/R LUNG','CBC','1.2.840.113745.101000.100100.2.37664.6355.1470182','2.16.840.1.113662.2.1.3432.34929.3030521.3094620','NA','[\'0.5\', \'0.5\']','[\'1\', \'0\', \'0\', \'0\', \'0\', \'-1\']','HFS',2,'NA','MONOCHROME2','550','800','[\'ORIGINAL\', \'PRIMARY\', \'LOCALIZER\']','NA',28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:08.134000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.1762570056.12052.1076428573.6','cad_r_dLungImagesAnonymizedMUSCatch1Patient2120275Patient2120275_1.2.840.113704.1.1762570056.12052.1076428573.6','1','NA','Patient2120275',72,'O','CT','NA','Philips','RAVANEL CHEST/Thorax/Hx','CBC','1.2.840.113745.101000.100100.2.37934.6473.1807996','1.2.840.113704.1.1762570056.12052.1076428499.3','NA','[\'0.6640625\', \'0.6640625\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',7,'C','MONOCHROME2','[\'60\', \'60\']','[\'450\', \'450\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',70,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:08.658000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.206107','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190748Patient2190748_1.3.6.1.4.1.9328.50.3.206107','1','NA','Patient2190748',-1,'','CT','NA','TOSHIBA','NA','NA','1.3.6.1.4.1.9328.50.3.206106','1.3.6.1.4.1.9328.50.3.206107.3','NA','[\'0.644\', \'0.644\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','FFS',3,'FC01','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',105,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:09.105000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.113664','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190474Patient2190474_1.3.6.1.4.1.9328.50.3.113664','1','NA','Patient2190474',-1,'F','CT','NA','Philips','NA','NA','1.3.6.1.4.1.9328.50.3.113663','1.3.6.1.4.1.9328.50.3.113664.3','NA','[\'0.607421875\', \'0.607421875\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',1,'D','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',300,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:09.786000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.123704','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190498Patient2190498_1.3.6.1.4.1.9328.50.3.123704','1','NA','Patient2190498',-1,'F','CT','NA','Philips','NA','NA','1.3.6.1.4.1.9328.50.3.123703','1.3.6.1.4.1.9328.50.3.123704.3','NA','[\'0.64453125\', \'0.64453125\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',2,'B','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',290,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:10.583000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.146694','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190580Patient2190580_1.3.6.1.4.1.9328.50.3.146694','1','NA','Patient2190580',-1,'','CT','NA','TOSHIBA','NA','NA','1.3.6.1.4.1.9328.50.3.146695','1.3.6.1.4.1.9328.50.3.146694.3','NA','[\'0.662\', \'0.662\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','FFS',3,'FC01','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',129,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:10.984000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2366.1122652138.452','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A6798000KN9E61.2.840.113619.2.55.1.1762897770.2366.1122652138.452','1','CT_IMAGES','98000KN9E6',39,'O','CT','NA','GE MEDICAL SYSTEMS','5.8 C/A/P WITH CONTRAST+PETCT','PET RESG LYMPH','1.2.840.113619.2.55.1.1762897770.2366.1122652138.448','1.2.840.113619.2.55.1.1762897770.2366.1122652138.449.13545.0.1','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','FFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',239,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:11.655000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.6.1.4.1.9328.50.3.111836','cad_r_dLungImagesAnonymizedIDRISequencedPatient2190469Patient2190469_1.3.6.1.4.1.9328.50.3.111836','1','NA','Patient2190469',-1,'F','CT','NA','Philips','NA','NA','1.3.6.1.4.1.9328.50.3.111835','1.3.6.1.4.1.9328.50.3.111836.3','NA','[\'0.66796875\', \'0.66796875\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',1,'D','MONOCHROME2','-600','1600','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',266,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:12.444000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('2.16.840.1.113662.2.1.2432.25279.2030620.2110006.254333.20','cad_r_dLungImagesAnonymizedMUSCatch1Patient2120230Patient2120230_2.16.840.1.113662.2.1.2432.25279.2030620.2110006.254333.20','1','NA','Patient2120230',27,'O','CT','NA','Picker International, Inc.','SPIRAL THORAX          ','CBC','1.2.840.113745.101000.100100.2.37780.4696.1607031','2.16.840.1.113662.2.1.3432.35279.3030620.3110006','NA','[\'0.5\', \'0.5\']','[\'1\', \'0\', \'0\', \'0\', \'0\', \'-1\']','HFS',2,'NA','MONOCHROME2','550','800','[\'ORIGINAL\', \'PRIMARY\', \'LOCALIZER\']','NA',40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:12.914000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('2.16.840.1.113662.2.1.2432.26107.2030818.2102521.2585033.20','cad_r_dLungImagesAnonymizedMUSCatch2Patient2120347Patient2120347_2.16.840.1.113662.2.1.2432.26107.2030818.2102521.2585033.20','1','NA','Patient2120347',39,'O','CT','NA','Picker International, Inc.','SPIRAL THORAX','CBC','1.2.840.113745.101000.100100.2.37803.4094.1636503','2.16.840.1.113662.2.1.3432.36107.3030818.3102521','NA','[\'0.5\', \'0.5\']','[\'1\', \'0\', \'0\', \'0\', \'0\', \'-1\']','HFS',2,'NA','MONOCHROME2','550','800','[\'ORIGINAL\', \'PRIMARY\', \'LOCALIZER\']','NA',39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:13.361000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.111.4984.1100244389.14','cad_r_dColonImagesAnonymizedBelgiumImagesTrainingPatient5520121.2.840.113704.1.111.4984.1100244389.14','1','','Patient552012',41,'F','CT','NA','Philips','Colon/Abdomen/Hx','','1.2.840.113704.1.111.4088.1100243792.2','1.2.840.113704.1.111.4984.1100244321.11','NA','[\'0.826171875\', \'0.826171875\']','[\'1\', \'0\', \'0\', \'0\', \'-1\', \'0\']','FFP',1,'B','MONOCHROME2','[\'00060\', \'00060\']','[\'00400\', \'00400\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','',968,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:15.329000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113619.2.55.1.1762897770.2476.1142873688.144','syngo_us_cad_imagingALPHA4PETCTdataFrom_Stanford2012_3_21A1098000XQXD41.2.840.113619.2.55.1.1762897770.2476.1142873688.144','1','CT Images','98000XQXD4',53,'O','CT','NA','GE MEDICAL SYSTEMS','5.13 PET_CT Body_Head_In','PET RESG LYMPH','1.2.840.113619.2.55.1.1762897770.2476.1142873688.140','1.2.840.113619.2.55.1.1762897770.2476.1142873688.141.1490.0.11','NA','[\'0.976562\', \'0.976562\']','[\'1.000000\', \'0.000000\', \'0.000000\', \'0.000000\', \'1.000000\', \'0.000000\']','HFS',5,'STANDARD','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',239,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:16.046000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.1762570056.19912.1057867135.6','cad_r_dLungImagesAnonymizedMUSCatch1Patient2120277Patient2120277_1.2.840.113704.1.1762570056.19912.1057867135.6','1','NA','Patient2120277',85,'O','CT','NA','Philips','RAVANEL CHEST/Thorax/Hx','CBC','1.2.840.113745.101000.100100.2.37809.5777.1643031','1.2.840.113704.1.1762570056.19912.1057867058.3','NA','[\'0.68359375\', \'0.68359375\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',7,'C','MONOCHROME2','[\'60\', \'60\']','[\'450\', \'450\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:16.437000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.111.2632.1101712874.6','cad_r_dColonImagesAnonymizedBelgiumImagesTestingPatient5520051.2.840.113704.1.111.2632.1101712874.6','1','','Patient552005',83,'F','CT','NA','Philips','Colon/Abdomen/Hx','','1.2.840.113704.1.111.2948.1101712606.11','1.2.840.113704.1.111.2632.1101712830.3','NA','[\'0.857421875\', \'0.857421875\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',1,'B','MONOCHROME2','[\'00060\', \'00060\']','[\'00400\', \'00400\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','',842,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:18.170000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.3.12.2.1107.5.6.1.540.30540104012504051167400000450','SYNGO_IMAGE_POOLTrueD98000XT6QA1.3.12.2.1107.5.6.1.540.30540104012504051167400000450','1','CT Atten Cor Head In 3.75 thk','98000XT6QA',52,'O','CT','NA','GE MEDICAL SYSTEMS','8.1 EDWARD WHOLE BODY HEAD FIRST','NA','1.3.12.2.1107.5.6.1.540.30540104012617575856200000002','1.2.840.113619.2.55.1.1762927672.2251.1074888538.395.11.2355.0','NA','[\'0.976562\', \'0.976562\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','HFS',4,'SOFT','MONOCHROME2','40','400','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\']','NA',223,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:18.784000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('1.2.840.113704.1.1762570056.3380.1064948662.6','LungImagesAnonymizedMUSCatch1Patient2120215Patient2120215_1.2.840.113704.1.1762570056.3380.1064948662.6','1','NA','Patient2120215',77,'O','CT','NA','Philips','RAVANEL CHEST/Thorax/Hx','CBC','1.2.840.113745.101000.100100.2.37892.5558.1746689','1.2.840.113704.1.1762570056.3380.1064948355.3','NA','[\'0.62109375\', \'0.62109375\']','[\'1\', \'0\', \'0\', \'0\', \'1\', \'0\']','FFS',7,'C','MONOCHROME2','[\'60\', \'60\']','[\'450\', \'450\']','[\'ORIGINAL\', \'PRIMARY\', \'AXIAL\', \'HELIX\']','NA',64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:19.158000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA',''),('2.16.840.1.113662.2.1.2432.25320.2030624.2132934.2585033.20','cad_r_dLungImagesAnonymizedMUSCatch1Patient2120249Patient2120249_2.16.840.1.113662.2.1.2432.25320.2030624.2132934.2585033.20','1','NA','Patient2120249',70,'O','CT','NA','Picker International, Inc.','SPIRAL THORAX          ','CBC','1.2.840.113745.101000.100100.2.37793.5930.1624293','2.16.840.1.113662.2.1.3432.35320.3030624.3132934','NA','[\'0.5\', \'0.5\']','[\'1\', \'0\', \'0\', \'0\', \'0\', \'-1\']','HFS',2,'NA','MONOCHROME2','550','800','[\'ORIGINAL\', \'PRIMARY\', \'LOCALIZER\']','NA',47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','2016-03-04 12:12:19.709000','',2,-1000000,-1000000,-1000000,-1000000,-1000000,'NA','NA','NA','NA','NA','');

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tourism_company
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Tourism_company` ;

-- -----------------------------------------------------
-- Schema Tourism_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tourism_company` DEFAULT CHARACTER SET utf8 ;
USE `Tourism_company` ;

-- -----------------------------------------------------
-- Table `Tourism_company`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Department` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Department` (
  `DNO` INT NOT NULL,
  `Dname` VARCHAR(45) NULL,
  `Sdate` DATE NULL,
  `Mgr_ssn` INT NULL,
  PRIMARY KEY (`DNO`),
  CONSTRAINT `fk_Department_Employee1`
    FOREIGN KEY (`Mgr_ssn`)
    REFERENCES `Tourism_company`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Employee` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Employee` (
  `SSN` INT NOT NULL,
  `Fname` VARCHAR(45) NULL,
  `Minit` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Salary` FLOAT NULL,
  `Bdate` DATE NULL,
  `Gender` CHAR NULL,
  `Address` VARCHAR(60) NULL,
  `Job_title` VARCHAR(45) NULL,
  `Department_NO` INT NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_Employee_Department1`
    FOREIGN KEY (`Department_NO`)
    REFERENCES `Tourism_company`.`Department` (`DNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Dependents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Dependents` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Dependents` (
  `ESSN` INT NULL,
  `Fname` VARCHAR(45) NOT NULL,
  `Lname` VARCHAR(45) NULL,
  `Gender` CHAR NULL,
  `Relationship` VARCHAR(45) NULL,
  PRIMARY KEY (`ESSN`, `Fname`),
  CONSTRAINT `fk_Dependents_Employee`
    FOREIGN KEY (`ESSN`)
    REFERENCES `Tourism_company`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Customer` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Customer` (
  `ID` INT NOT NULL,
  `Fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Payment_method` VARCHAR(45) NULL,
  `PDate` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Credit_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Credit_info` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Credit_info` (
  `Customer_ID` INT NULL,
  `Credit_no` INT NOT NULL,
  `Bank_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Credit_no`, `Customer_ID`),
  CONSTRAINT `fk_Credit_info_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `Tourism_company`.`Customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Admin` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Admin` (
  `SSN` INT NOT NULL,
  `Rank` FLOAT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_table2_Employee1`
    FOREIGN KEY (`SSN`)
    REFERENCES `Tourism_company`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Reservation_Excutive`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Reservation_Excutive` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Reservation_Excutive` (
  `SSN` INT NOT NULL,
  `Target` FLOAT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_Reservation_Excutive_Employee1`
    FOREIGN KEY (`SSN`)
    REFERENCES `Tourism_company`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Tour_Guide`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Tour_Guide` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Tour_Guide` (
  `Employee_SSN` INT NOT NULL,
  `Nationality` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee_SSN`),
  CONSTRAINT `fk_Tour_Guide_Employee1`
    FOREIGN KEY (`Employee_SSN`)
    REFERENCES `Tourism_company`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`TG_langs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`TG_langs` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`TG_langs` (
  `TGSSN` INT NOT NULL,
  `TLanguage` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TGSSN`, `TLanguage`),
  CONSTRAINT `fk_TG_langs_Tour_Guide1`
    FOREIGN KEY (`TGSSN`)
    REFERENCES `Tourism_company`.`Tour_Guide` (`Employee_SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Driver` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Driver` (
  `SSN` INT NOT NULL,
  `LIC_NO` INT NULL,
  `LIC_DATE` DATE NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_Driver_Employee1`
    FOREIGN KEY (`SSN`)
    REFERENCES `Tourism_company`.`Employee` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Tour` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Tour` (
  `TCODE` INT NOT NULL,
  `Admin_SSN` INT NULL,
  `Price` FLOAT NULL,
  `S_date` DATE NULL,
  `E_date` DATE NULL,
  `Type` VARCHAR(45) NULL,
  `M_loc` VARCHAR(45) NULL,
  `Tour_Guide_Employee_SSN` INT NULL,
  PRIMARY KEY (`TCODE`),
  CONSTRAINT `fk_Tour_Admin1`
    FOREIGN KEY (`Admin_SSN`)
    REFERENCES `Tourism_company`.`Admin` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tour_Tour_Guide1`
    FOREIGN KEY (`Tour_Guide_Employee_SSN`)
    REFERENCES `Tourism_company`.`Tour_Guide` (`Employee_SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Booking` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Booking` (
  `TTCODE` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  `R_E_SSN` INT NOT NULL,
  `No_Of_Tickets` INT NULL,
  `Reservation_date` DATE NULL,
  `R_method` VARCHAR(45) NULL,
  `Amount` FLOAT NULL,
  PRIMARY KEY (`TTCODE`, `Customer_ID`),
  CONSTRAINT `fk_Booking_Tour1`
    FOREIGN KEY (`TTCODE`)
    REFERENCES `Tourism_company`.`Tour` (`TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `Tourism_company`.`Customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Reservation_Excutive1`
    FOREIGN KEY (`R_E_SSN`)
    REFERENCES `Tourism_company`.`Reservation_Excutive` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Abroad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Abroad` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Abroad` (
  `Tour_TCODE` INT NOT NULL,
  `i_Airport` VARCHAR(45) NULL,
  `F_Airport` VARCHAR(45) NULL,
  PRIMARY KEY (`Tour_TCODE`),
  CONSTRAINT `fk_Abroad_Tour1`
    FOREIGN KEY (`Tour_TCODE`)
    REFERENCES `Tourism_company`.`Tour` (`TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`TLocal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`TLocal` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`TLocal` (
  `T_TCODE` INT NOT NULL,
  `Class` VARCHAR(45) NULL,
  PRIMARY KEY (`T_TCODE`),
  CONSTRAINT `fk_Local_Tour1`
    FOREIGN KEY (`T_TCODE`)
    REFERENCES `Tourism_company`.`Tour` (`TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Buses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Buses` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Buses` (
  `Bus_number` INT NOT NULL,
  `Model` VARCHAR(45) NULL,
  PRIMARY KEY (`Bus_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Events` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Events` (
  `E_name` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`E_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Going`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Going` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Going` (
  `Tour_TCODE` INT NULL,
  `Events_E_name` VARCHAR(45) NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`Tour_TCODE`, `Events_E_name`),
  CONSTRAINT `fk_Going_Tour1`
    FOREIGN KEY (`Tour_TCODE`)
    REFERENCES `Tourism_company`.`Tour` (`TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Going_Events1`
    FOREIGN KEY (`Events_E_name`)
    REFERENCES `Tourism_company`.`Events` (`E_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`National_Sites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`National_Sites` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`National_Sites` (
  `S_name` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NULL,
  PRIMARY KEY (`S_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Going_To`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Going_To` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Going_To` (
  `Tour_TCODE` INT NOT NULL,
  `N_name` VARCHAR(45) NULL,
  `DATE` DATE NULL,
  PRIMARY KEY (`Tour_TCODE`, `N_name`),
  CONSTRAINT `fk_Going_To_Tour1`
    FOREIGN KEY (`Tour_TCODE`)
    REFERENCES `Tourism_company`.`Tour` (`TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Going_To_National_Sites1`
    FOREIGN KEY (`N_name`)
    REFERENCES `Tourism_company`.`National_Sites` (`S_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`HotelCamp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`HotelCamp` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`HotelCamp` (
  `Name` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Rate` FLOAT NULL,
  PRIMARY KEY (`Name`, `Location`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Stay`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Stay` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Stay` (
  `HotelCamp_Name` VARCHAR(45) NULL,
  `HotelCamp_Location` VARCHAR(45) NULL,
  `Tour_TCODE` INT NULL,
  `From` DATE NULL,
  `To` DATE NULL,
  PRIMARY KEY (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`),
  CONSTRAINT `fk_Stay_HotelCamp1`
    FOREIGN KEY (`HotelCamp_Name` , `HotelCamp_Location`)
    REFERENCES `Tourism_company`.`HotelCamp` (`Name` , `Location`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stay_Tour1`
    FOREIGN KEY (`Tour_TCODE`)
    REFERENCES `Tourism_company`.`Tour` (`TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tourism_company`.`Transport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tourism_company`.`Transport` ;

CREATE TABLE IF NOT EXISTS `Tourism_company`.`Transport` (
  `Local_T_TCODE` INT NOT NULL,
  `Buses_Bus_number` INT NULL,
  `Driver_SSN` INT NULL,
  PRIMARY KEY (`Local_T_TCODE`),
  CONSTRAINT `fk_Transport_Local1`
    FOREIGN KEY (`Local_T_TCODE`)
    REFERENCES `Tourism_company`.`TLocal` (`T_TCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transport_Buses1`
    FOREIGN KEY (`Buses_Bus_number`)
    REFERENCES `Tourism_company`.`Buses` (`Bus_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transport_Driver1`
    FOREIGN KEY (`Driver_SSN`)
    REFERENCES `Tourism_company`.`Driver` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Department` (`DNO`, `Dname`, `Sdate`, `Mgr_ssn`) VALUES (0001, 'Administration', '2016-01-17', 449665969);
INSERT INTO `Tourism_company`.`Department` (`DNO`, `Dname`, `Sdate`, `Mgr_ssn`) VALUES (0020, 'Transportation', '2018-09-18', 159628431);
INSERT INTO `Tourism_company`.`Department` (`DNO`, `Dname`, `Sdate`, `Mgr_ssn`) VALUES (0300, 'Guidance', '2019-08-27', 303235311);
INSERT INTO `Tourism_company`.`Department` (`DNO`, `Dname`, `Sdate`, `Mgr_ssn`) VALUES (4000, 'Reservation', '2021-08-10', 503091611);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (159628431, 'Jaber', 'M.', 'Ahmed', NULL, 15000, '1966-07-12', 'M', '9 El Barakat St., Form Tanta St., Giza', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (174270100, 'Hosny', 'M.', 'Khaled', NULL, 25000, '1966-07-14', 'M', '121 Ramsis St., Down Town, Cairo', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (440501239, 'Akram', 'H.', 'Esmail', NULL, 18000, '1967-12-28', 'M', 'Modiriat El-Amn, Ataka, Suez', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (430956347, 'Ahmed', 'A.', 'Khaled', NULL, 30000, '1976-07-10', 'M', 'Mokatly Ramadan., Bldgs, Cairo', 'Admin', 0001);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (510764117, 'Mohamed', 'F.', 'Saad', NULL, 17500, '1966-12-22', 'M', '18 Emad El-Din St., Down Town, Cairo', 'Admin', 0001);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (232471316, 'Said', 'S.', 'Mahmoud', NULL, 10000, '1971-09-24', 'M', 'Om Zeghue, Next to El-Bialy Wood Factory, Amreya', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (303235311, 'George', 'A.', 'Ramy', NULL, 29000, '1971-12-25', 'M', '17: El-Mokatam, El-Qalaa, Cairo', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (247309193, 'Micheal', 'M.', 'Meyer', NULL, 14000, '1975-05-16', 'M', '21 El-Maamoun St., Alexandria', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (190858700, 'Aleesha', 'R.', 'Benson', NULL, 18000, '1976-01-31', 'F', '102 Shubra St., SHOUBRA, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (434309289, 'Timothy', 'D.', 'Morgan', NULL, 17000, '1976-07-19', 'F', '127 A Mohamed El Makrif St., NASR CITY, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (503091611, 'Safaa', 'W.', 'Navarro', NULL, 26000, '1977-02-15', 'F', '57 Ibrahim Nawar St., Zone 6, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (509076411, 'Caitlyn', 'K.', 'Santiago', NULL, 16000, '1977-07-28', 'F', '2 Talaat Harb St., Down Town, Cairo', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (518175750, 'Rhonda', 'Y.', 'Fernandez', NULL, 13500, '1978-09-20', 'F', '12 Ali Ibn Radwan St., Ard El-Golf, Heliopolis', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (449665969, 'Samir', 'J.', 'Abdalla', NULL, 41000, '1979-03-02', 'M', ' 49 Abbas El-Akkad St., NASR CITY, Cairo', 'Admin', 0001);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (520104422, 'Ebrahim', 'T.', 'Ayman', NULL, 38000, '1986-08-20', 'M', 'Menahouse Operi Hotel, EL HARAM, Giza', 'Admin', 0001);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (123432166, 'Hatem', 'D.', 'Ali', NULL, 50000, '1997-03-22', 'M', '4 Wessa Wasef St., GIZA', 'Admin', 0001);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (345217894, 'Ramy', 'K.', 'Ibrahem', NULL, 40000, '1995-09-23', 'M', '10 Ismaeil El Mabrouk, Alexandria', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (565488013, 'Nancy', 'A.', 'Willyam', NULL, 60000, '1990-04-21', 'F', '12 Ali Ibn Radwan St., Ard El-Golf, Heliopolis', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (456711188, 'Sarah', 'L.', 'Marco', NULL, 60000, '1998-05-12', 'F', '9 El Barakat St., Form Tanta St., Giza', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (887321099, 'Jenny', 'W.', 'Mikkel', NULL, 60000, '1993-07-08', 'F', '25 Modiriat El-Amn, Ataka, Suez', 'Tour guide ', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (565334200, 'Hany', 'L.', 'Hamdy', NULL, 40000, '1991-04-08', 'M', '20 Modiriat El-Amn, Ataka, Suez', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (678902214, 'Salim', 'M.', 'Ramadan', NULL, 40000, '1990-03-11', 'M', '9 El Barakat St., Form Tanta St., Giza', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (332158730, 'Amira', 'E.', 'Fathy', NULL, 60000, '1993-09-22', 'F', '121 Ramsis St., Down Town, Cairo', 'Admin', 0001);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (777543900, 'Saleh', 'A.', 'Arfaat', NULL, 40000, '1989-12-25', 'M', '18 Emad El-Din St., Down Town, Cairo', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (876400311, 'Talaat', 'H.', 'Hussien', NULL, 40000, '1987-03-17', 'M', 'Om Zeghue, Next to El-Bialy Wood Factory, Amreya', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (800337236, 'Arwa', 'K.', 'Kamal', NULL, 65000, '1983-09-16', 'F', '121 Ramsis St., Down Town, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (590112403, 'Merna', 'A.', 'Wael', NULL, 60000, '1998-08-28', 'F', '17: El-Mokatam, El-Qalaa, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (662187043, 'Ahmed', 'L.', 'Sameh', NULL, 50000, '1999-03-26', 'M', '130 Mokatly Ramadan., Bldgs, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (999567103, 'Karim', 'S.', 'Talal', NULL, 40000, '1987-04-27', 'M', '120 Mokatly Ramadan., Bldgs, Cairo', 'R_E', 4000);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (543218902, 'Amr', 'E.', 'Esmail', NULL, 40000, '1996-05-22', 'M', '40 Mokatly Ramadan., Bldgs, Cairo', 'Driver', 0020);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (900032455, 'Emily', 'F.', 'Chad', NULL, 50000, '1995-03-12', 'F', '106 Shubra St., SHOUBRA, Cairo', 'Tour guide', 0300);
INSERT INTO `Tourism_company`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Phone`, `Salary`, `Bdate`, `Gender`, `Address`, `Job_title`, `Department_NO`) VALUES (366722884, 'Serena', 'S.', 'David', NULL, 60000, '1995-09-15', 'F', '125 Ramsis St., Down Town, Cairo', 'Tour guide', 0300);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Dependents`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (247309193, 'Elaine', 'Worswo', 'F', 'Spouse');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (174270100, 'Marie', 'Sleem', 'F', 'Spouse');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (440501239, 'Reham', 'Ahmed', 'M', 'Spouse');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (190858700, 'David', 'Rony', 'M', 'Son');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (503091611, 'Emilia', 'Carpenter', 'F', 'Daughter');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (509076411, 'Bridget', 'Russell', 'M', 'Son');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (518175750, 'Gareth', 'James', 'F', 'Daughter');
INSERT INTO `Tourism_company`.`Dependents` (`ESSN`, `Fname`, `Lname`, `Gender`, `Relationship`) VALUES (190858700, 'Nabil', 'Jefferson', 'M', 'Spouse');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (516038106, 'Hashim', 'Baldwin', NULL, 'Cash', '2022-05-07');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (487188650, 'Mahdi', 'Mason', NULL, 'Cash', '2022-06-09');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (530135688, 'Leyton', 'Swanson', NULL, 'Cash', '2022-06-13');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (430526109, 'Zaynab', 'Glover', NULL, 'Cash', '2022-06-17');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (531848763, 'Craig ', 'Pollard', NULL, 'Cash', '2022-07-03');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (510564320, 'Sallie ', 'Flores', NULL, 'Cash', '2022-06-22');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (429425998, 'Amira ', 'Clayton', NULL, 'Cash', '2022-06-28');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (449693322, 'Peggy', 'Keith', NULL, 'Credit', '2022-07-05');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (426832758, 'Keiran', 'Finch', NULL, 'Credit', '2022-06-19');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (268053791, 'Tyler', 'Meyers', NULL, 'Credit', '2022-06-27');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (909055680, 'Maram', 'Ahmed', NULL, 'Credit', '2022-07-09');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (444990312, 'Salma', 'Hafez', NULL, 'Cash', '2022-06-04');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (303149100, 'Ramy', 'Salim', NULL, 'Credit', '2022-07-21');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (336781444, 'Youmna', 'Ahmed', NULL, 'Cash', '2022-07-29');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (555890111, 'Sarah', 'Saber', NULL, 'Credit', '2022-07-30');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (358000333, 'Ehab', 'Mahmoud', NULL, 'Cash', '2022-07-01');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (789888000, 'Shrouk', 'Sror', NULL, 'Cash', '2022-07-08');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (101027222, 'Sameh', 'Shawky', NULL, 'Credit', '2022-07-10');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (666443154, 'Saber', 'Samy', NULL, 'Credit', '2022-08-01');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (454566600, 'Hana', 'Lotfy', NULL, 'Cash', '2022-08-02');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (809022238, 'Alaa', 'Ahmed', NULL, 'Cash', '2022-07-16');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (011166699, 'Shahd', 'Hassa', NULL, 'Credit', '2022-07-02');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (020266600, 'Lahfa', 'Basel', NULL, 'Cash', '2022-06-29');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (454578911, 'Sror', 'Hamed', NULL, 'Cash', '2022-07-03');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (209888401, 'Nahed', 'Akmal', NULL, 'Cash', '2022-07-05');
INSERT INTO `Tourism_company`.`Customer` (`ID`, `Fname`, `Lname`, `Phone`, `Payment_method`, `PDate`) VALUES (909044000, 'Habeba', 'Saleh', NULL, NULL, '2022-07-09');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Credit_info`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (449693322, 575017350, 'BANK MASR');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (426832758, 540538924, 'BANK EL QAHIRA');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (268053791, 520289458, 'BANK EL ALEXANDRIA');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (909055680, 908765890, 'CIB');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (303149100, 713143536, 'AL AHLY');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (555890111, 675677901, 'BANK EL QAHIRA');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (101027222, 900765112, 'CIB');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (666443154, 910043789, 'BANK MASR');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (809022238, 765488223, 'BANK EL ALEXANDRIA');
INSERT INTO `Tourism_company`.`Credit_info` (`Customer_ID`, `Credit_no`, `Bank_name`) VALUES (011166099, 321445366, 'CIB');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Admin`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Admin` (`SSN`, `Rank`) VALUES (430956347, 7.5);
INSERT INTO `Tourism_company`.`Admin` (`SSN`, `Rank`) VALUES (510764117, 8.2);
INSERT INTO `Tourism_company`.`Admin` (`SSN`, `Rank`) VALUES (449665969, 9.9);
INSERT INTO `Tourism_company`.`Admin` (`SSN`, `Rank`) VALUES (520104422, 9);
INSERT INTO `Tourism_company`.`Admin` (`SSN`, `Rank`) VALUES (123432166, 8.5);
INSERT INTO `Tourism_company`.`Admin` (`SSN`, `Rank`) VALUES (332158730, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Reservation_Excutive`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (190858700, 550);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (434309289, 400);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (503091611, 320);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (518175750, 530);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (800337236, 500);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (590112403, 550);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (662187043, 400);
INSERT INTO `Tourism_company`.`Reservation_Excutive` (`SSN`, `Target`) VALUES (999567103, 500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Tour_Guide`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (174270100, 'Egyptian');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (440501239, 'Egyptian');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (509076411, 'French');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (303235311, 'Spain');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (565488013, 'American');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (456711188, 'French');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (887321099, 'German');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (900032455, 'Italian');
INSERT INTO `Tourism_company`.`Tour_Guide` (`Employee_SSN`, `Nationality`) VALUES (366722884, 'Italian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`TG_langs`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (174270100, 'Arabic');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (440501239, 'Arabic');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (509076411, 'English');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (174270100, 'English');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (440501239, 'English');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (509076411, 'French');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (174270100, 'Germany');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (440501239, 'Germany');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (509076411, 'Italian');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (565488013, 'French');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (565488013, 'Russian');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (565488013, 'Italian');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (456711188, 'Chinese');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (456711188, 'Korean');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (887321099, 'Suede');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (887321099, 'portugees');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (900032455, 'Arabic');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (900032455, 'Italian');
INSERT INTO `Tourism_company`.`TG_langs` (`TGSSN`, `TLanguage`) VALUES (366722884, 'Turkish');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Driver`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (159628431, 589647, '2022-01-14');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (232471316, 784259, '2021-12-12');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (247309193, 214785, '2022-02-05');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (345217894, 221345, '2023-09-12');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (565334200, 987903, '2024-06-12');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (678902214, 127634, '2022-12-24');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (777543900, 554789, '2022-07-23');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (876400311, 334561, '2022-01-07');
INSERT INTO `Tourism_company`.`Driver` (`SSN`, `LIC_NO`, `LIC_DATE`) VALUES (543218902, 111905, '2021-09-07');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Tour`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (319386445, 430956347, 500, '2022-08-20', '2022-08-27', 'local', 'Station_1 cairo', 440501239);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (363266912, 510764117, 1000, '2022-08-27', '2022-09-05', 'local', 'Station_2 alexandria', NULL);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (522210662, 430956347, 2000, '2022-09-20', '2022-10-05', 'abroad', 'Airort', NULL);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (222188166, 510764117, 1500, '2022-08-15', '2022-08-20', 'abroad', 'Airort', NULL);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (221501276, 520104422, 750, '2022-08-17', '2022-08-20', 'local', 'Staion_1 cairo', NULL);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (434979142, 449665969, 800, '2022-09-18', '2022-09-21', 'local', 'Station_6 dahab', 174270100);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (545967476, 520104422, 650, '2022-09-15', '2022-09-15', 'local', 'station 2 alexandria', 509076411);
INSERT INTO `Tourism_company`.`Tour` (`TCODE`, `Admin_SSN`, `Price`, `S_date`, `E_date`, `Type`, `M_loc`, `Tour_Guide_Employee_SSN`) VALUES (213891827, 449665969, 850, '2022-08-27', '2022-08-27', 'local', 'station 1 cairo', 174270100);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Booking`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (319386445, 531848763, 190858700, 4, '2022-07-12', 'phone', 2000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (363266912, 531848763, 190858700, 2, '2022-07-30', 'inreal', 3000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (522210662, 487188650, 434309289, 3, '2022-07-15', 'phone', 4000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (222188166, 530135688, 434309289, 2, '2022-07-13', 'phone', 3000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (221501276, 430526109, 503091611, 4, '2022-07-28', 'inreal', 1500);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (434979142, 531848763, 503091611, 2, '2022-07-11', 'inreal', 4000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (213891827, 510564320, 518175750, 3, '2022-07-13', 'phone', 3200);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (545967476, 429425998, 518175750, 1, '2022-07-17', 'phone', 1800);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (545967476, 449693322, 518175750, 3, '2022-07-14', 'phone', 2000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (213891827, 426832758, 434309289, 2, '2022-07-26', 'inreal', 1800);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (434979142, 268053791, 434309289, 4, '2022-07-22', 'inreal', 5000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (222188166, 449693322, 503091611, 3, '2022-07-24', 'inreal', 3000);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (319386445, 449693322, 503091611, 2, '2022-07-06', 'phone', 1200);
INSERT INTO `Tourism_company`.`Booking` (`TTCODE`, `Customer_ID`, `R_E_SSN`, `No_Of_Tickets`, `Reservation_date`, `R_method`, `Amount`) VALUES (363266912, 268053791, 518175750, 1, '2022-07-07', 'phone', 700);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Abroad`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Abroad` (`Tour_TCODE`, `i_Airport`, `F_Airport`) VALUES (522210662, 'Cairo airport', 'Paris-Charles-de-Gaulle airport');
INSERT INTO `Tourism_company`.`Abroad` (`Tour_TCODE`, `i_Airport`, `F_Airport`) VALUES (222188166, 'Sphinx airport', 'Orly airport');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`TLocal`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`TLocal` (`T_TCODE`, `Class`) VALUES (319386445, 'H');
INSERT INTO `Tourism_company`.`TLocal` (`T_TCODE`, `Class`) VALUES (363266912, 'M');
INSERT INTO `Tourism_company`.`TLocal` (`T_TCODE`, `Class`) VALUES (221501276, 'H');
INSERT INTO `Tourism_company`.`TLocal` (`T_TCODE`, `Class`) VALUES (434979142, 'H');
INSERT INTO `Tourism_company`.`TLocal` (`T_TCODE`, `Class`) VALUES (545967476, 'M');
INSERT INTO `Tourism_company`.`TLocal` (`T_TCODE`, `Class`) VALUES (213891827, 'M');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Buses`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (144, 'Ikarus, 260');
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (777, 'Skoda, 30Tr SOR');
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (980, 'Skoda, 55');
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (470, 'Ikarus, 66');
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (550, 'Iveco ,130 UA');
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (900, 'MERCEDES, BENZ');
INSERT INTO `Tourism_company`.`Buses` (`Bus_number`, `Model`) VALUES (230, 'MERCEDES, BENZ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Events`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Events` (`E_name`, `Location`, `Date`) VALUES ('Pyramids Half Marathon', 'Giza', '2022-08-25');
INSERT INTO `Tourism_company`.`Events` (`E_name`, `Location`, `Date`) VALUES ('Hauser', 'Hurghada', '2022-08-27');
INSERT INTO `Tourism_company`.`Events` (`E_name`, `Location`, `Date`) VALUES ('Forever Is Now', 'Giza', '2022-09-03');
INSERT INTO `Tourism_company`.`Events` (`E_name`, `Location`, `Date`) VALUES ('Maroon 5 Concert', 'Giza', '2022-08-29');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Going`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Going` (`Tour_TCODE`, `Events_E_name`, `Price`) VALUES (319386445, 'Pyramids Half Marathon', 500);
INSERT INTO `Tourism_company`.`Going` (`Tour_TCODE`, `Events_E_name`, `Price`) VALUES (363266912, 'Maroon 5 Concert', 2500);
INSERT INTO `Tourism_company`.`Going` (`Tour_TCODE`, `Events_E_name`, `Price`) VALUES (363266912, 'Forever Is Now', 1500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`National_Sites`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('Pyramids', 'giza');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('Eiffel tower', 'paris');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('cairo tower', 'cairo');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('blue hole', 'dahab');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('twilat mountain', 'dahab');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('Saint Catherine mountain', 'Saint Catherine');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('louvre', 'paris');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('el karnak', 'luxor');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('abu sumbol', 'Aswan');
INSERT INTO `Tourism_company`.`National_Sites` (`S_name`, `Location`) VALUES ('el mo\'ez', 'cairo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Going_To`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (319386445, 'Pyramids', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (363266912, 'blue hole', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (522210662, 'Eiffel tower', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (222188166, 'louvre', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (221501276, 'Pyramids', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (434979142, 'el mo\'ez', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (545967476, 'el karnak', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (213891827, 'cairo tower', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (319386445, 'el mo\'ez', NULL);
INSERT INTO `Tourism_company`.`Going_To` (`Tour_TCODE`, `N_name`, `DATE`) VALUES (545967476, 'abu sumbol', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`HotelCamp`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`HotelCamp` (`Name`, `Location`, `Address`, `Rate`) VALUES ('Shiraton', 'Somabay', NULL, 5.0);
INSERT INTO `Tourism_company`.`HotelCamp` (`Name`, `Location`, `Address`, `Rate`) VALUES ('Shiraton', 'Elmatar', NULL, 5.0);
INSERT INTO `Tourism_company`.`HotelCamp` (`Name`, `Location`, `Address`, `Rate`) VALUES ('Merdian', 'Dahab', NULL, 4.5);
INSERT INTO `Tourism_company`.`HotelCamp` (`Name`, `Location`, `Address`, `Rate`) VALUES ('Merdian', 'EL-Haram', NULL, 5.0);
INSERT INTO `Tourism_company`.`HotelCamp` (`Name`, `Location`, `Address`, `Rate`) VALUES ('Elwa7a', 'Saint Catherine', NULL, 3.0);
INSERT INTO `Tourism_company`.`HotelCamp` (`Name`, `Location`, `Address`, `Rate`) VALUES ('Les Bulles de Paris', 'Paris', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Stay`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Stay` (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`, `From`, `To`) VALUES ('Shiraton', 'Somabay', 319386445, '2022-08-20', '2022-08-27');
INSERT INTO `Tourism_company`.`Stay` (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`, `From`, `To`) VALUES ('Shiraton', 'Elmatar', 363266912, '2022-08-27', '2022-09-05');
INSERT INTO `Tourism_company`.`Stay` (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`, `From`, `To`) VALUES ('Les Bulles de Paris', 'Paris', 522210662, '2022-09-20', '2022-10-05');
INSERT INTO `Tourism_company`.`Stay` (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`, `From`, `To`) VALUES ('Les Bulles de Paris', 'Paris', 222188166, '2022-08-15', '2022-08-20');
INSERT INTO `Tourism_company`.`Stay` (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`, `From`, `To`) VALUES ('Elwa7a', 'Saint Catherine', 221501276, '2022-08-17', '2022-08-20');
INSERT INTO `Tourism_company`.`Stay` (`HotelCamp_Name`, `HotelCamp_Location`, `Tour_TCODE`, `From`, `To`) VALUES ('Merdian', 'EL-Haram', 434979142, '2022-09-18', '2022-09-21');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tourism_company`.`Transport`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tourism_company`;
INSERT INTO `Tourism_company`.`Transport` (`Local_T_TCODE`, `Buses_Bus_number`, `Driver_SSN`) VALUES (319386445, 144, 159628431);
INSERT INTO `Tourism_company`.`Transport` (`Local_T_TCODE`, `Buses_Bus_number`, `Driver_SSN`) VALUES (363266912, 144, 159628431);
INSERT INTO `Tourism_company`.`Transport` (`Local_T_TCODE`, `Buses_Bus_number`, `Driver_SSN`) VALUES (221501276, 777, 232471316);
INSERT INTO `Tourism_company`.`Transport` (`Local_T_TCODE`, `Buses_Bus_number`, `Driver_SSN`) VALUES (434979142, 470, 247309193);
INSERT INTO `Tourism_company`.`Transport` (`Local_T_TCODE`, `Buses_Bus_number`, `Driver_SSN`) VALUES (545967476, 550, 247309193);
INSERT INTO `Tourism_company`.`Transport` (`Local_T_TCODE`, `Buses_Bus_number`, `Driver_SSN`) VALUES (213891827, 777, 232471316);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

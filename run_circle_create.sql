-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema run_circle
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema run_circle
-- -----------------------------------------------------
drop schema if exists run_circle;
CREATE SCHEMA IF NOT EXISTS `run_circle` DEFAULT CHARACTER SET utf8 ;
USE `run_circle` ;

-- -----------------------------------------------------
-- Table `run_circle`.`user`
-- -----------------------------------------------------
drop table if exists user;
CREATE TABLE IF NOT EXISTS `run_circle`.`user` (
  `user_id` INT NOT NULL,
  `dob` DATE NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NULL,
  `hidden` TINYINT(1) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;

insert into user (user_id, dob, gender, first_name, last_name, phone, hidden) values
(1, '19950410', "M", "fergus", "scott", 8074671453, 0),
(2, '19960214', "M", "kenji", "fujita", 5672895142, 0),
(3, '19940319', "M", "magnus", "frennberg", 5248194675, 0),
(4, '19920201', "F", "kelly", "jones", 7869027564, 1),
(5, '19901102', "F", "anne", "michaels", 1236540978, 1),
(6, '19910808', "F", "kate", "allen", 7569184798, 1),
(7, '19840411', "F", "rashida", "davidoff", 8462678917, 0),
(8, '19860226', "M", "michael", "scott", 6578950723, 0),
(9, '19960322', "F", "oprah", "linkert", 3427580139, 1), 
(10, '19990909', "M", "alex", "daggart", 8291875610, 0),
(11, '19750517', "F", "ayn", "rand", 1973678063, 1), 
(12, '19820123', "M", "donald", "mccollom", 9058969999, 0), 
(13, '19790217', "F", "hillary", "sanders", 6451890265, 0),
(14, '19630915', "M", "bernie", "mulaney", 1873908576, 1), 
(15, '19740619', "F", "judy", "bates", 1638953018, 0),
(16, '19820828', "M", "randolph", "upsalla", 7486274601,1), 
(17, '19911219', "F", "catherine", "providence", 8174561029, 0), 
(18, '19871101', "M", "akash", "bangalore", 9018734992, 1), 
(19, '19821009', "F", "leticia", "duke", 8053007538, 0), 
(20, '19770707', "M", "davis", "davidson", 3547839138, 0), 
(21, '19990216', "F", "jane", "eyre", 5367481029, 1), 
(22, '19870330', "M", "fredrick", "naghstein", 8365883650, 0), 
(23, '19790407', "F", "portia", "woodman", 5128775178, 0), 
(24, '19920909', "M", "sam", "mccaw", 6558779889, 1), 
(25, '19620615', "F", "ashleigh", "timpson", 5348208675, 0), 
(26, '19911207', "M", "ardie", "smith", 1322877690, 1), 
(27, '19890102', "F", "natalie", "kunis", 9875462785, 0), 
(28, '19931126', "M", "ben", "barrett", 8537514235, 1), 
(29, '19821009', "F", "irene", "taylors", 2579871324, 0), 
(30, '19900423', "M", "keanu", "thompson", 8572340192, 1), 
(31, '19850128', "F", "robyn", "wilson", 8562451092, 0), 
(32, '19870715', "M", "brodie", "alchemers", 5346172897, 1), 
(33, '19920427', "F", "madison", "biles", 890981376, 0), 
(34, '19910101', "F", "clementine", "georgison", 7351907815, 1), 
(35, '19781203', "M", "steve", "clooney", 6548910917, 0), 
(37, '19861114', "F", "margaret", "thatchers", 6145389201, 1), 
(39, '19931015', "M", "bradley", "dunlop", 3156728098, 0), 
(40, '19780330', "F", "christie", "somersby", 8695364817, 0), 
(41, '19900814', "M", "charlie", "grofton", 7356718920, 1), 
(42, '19840712', "F", "petunia", "rosewood", 3897562009, 0), 
(43, '19750814', "M", "quintin", "chang", 5467289876, 0), 
(44, '19620108', "F", "fiona", "wollongong", "1998760918", 1), 
(45, '19901030', "M", "carlos", "ramirez", 8679280929, 0), 
(46, '19930419', "F", "zoe", "atkinson", 8465267819, 1), 
(47, '19870629', "M", "frederick", "ardmore", 4526567781, 0), 
(48, '19830912', "F", "harriette", "ponyford", 9889765248, 0), 
(49, '19810705', "M", "boksfull", "ovkandee", 3451890914, 1), 
(50, '19920818', "M", "socrates", "hawking", 5367824578, 0);



-- -----------------------------------------------------
-- Table `run_circle`.`location`
-- -----------------------------------------------------
drop table if exists location;
CREATE TABLE IF NOT EXISTS `run_circle`.`location` (
  `location_id` INT NOT NULL,
  `city_name` VARCHAR(50) NOT NULL,
  `country_name` VARCHAR(50) NOT NULL,
  `latitude` VARCHAR(50) NOT NULL,
  `longitude` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `location_id_UNIQUE` (`location_id` ASC) VISIBLE)
ENGINE = InnoDB;

insert into location (location_id, city_name, country_name, latitude, longitude) values
(1, "London", "Great Britain", "51.5074 N", "0.1278 W"),
(2, "Boston", "United States", "42.3601 N", "71.0589 W"), 
(3, "Chicago", "United States", "41.8781 N", "87.6298 W"), 
(4, "Stockholm", "Sweden", "59.3293 N", "18.0686 E"), 
(5, "Wellington", "New Zealand", "41.2865 N","174.7762 E"); 

-- -----------------------------------------------------
-- Table `run_circle`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`profile` (
  `profile_id` INT NOT NULL,
  `avg_distance_miles` FLOAT NOT NULL,
  `pace_per_mile` FLOAT NOT NULL,
  `avg_duration` FLOAT NOT NULL,
  `runs` INT NOT NULL,
  `preferred_location` INT NOT NULL,
  `handle` VARCHAR(50) NOT NULL,
  `hidden` TINYINT(1) NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE INDEX `handle_UNIQUE` (`handle` ASC) VISIBLE,
  INDEX `preferred_location_idx` (`preferred_location` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `profile_preferred_location`
    FOREIGN KEY (`preferred_location`)
    REFERENCES `run_circle`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profile_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `run_circle`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`account` (
  `account_id` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NULL,
  `profile_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE INDEX `account_id_UNIQUE` (`account_id` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `handle_UNIQUE` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `account_profile_id`
    FOREIGN KEY (`profile_id`)
    REFERENCES `run_circle`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `account_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `run_circle`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`circle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`circle` (
  `circle_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  `avg_duration` FLOAT NOT NULL,
  `avg_speed` FLOAT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `location_id` INT NOT NULL,
  `num_members` INT NOT NULL,
  PRIMARY KEY (`circle_id`),
  UNIQUE INDEX `circle_id_UNIQUE` (`circle_id` ASC) VISIBLE,
  INDEX `profile_id_idx` (`profile_id` ASC) VISIBLE,
  INDEX `location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `circle_profile_id`
    FOREIGN KEY (`profile_id`)
    REFERENCES `run_circle`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `circle_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `run_circle`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`smart_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`smart_data` (
  `smart_data_id` INT NOT NULL,
  PRIMARY KEY (`smart_data_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`run`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`run` (
  `run_id` INT NOT NULL,
  `duration` FLOAT NOT NULL,
  `pace_per_mile` FLOAT NOT NULL,
  `elevation` INT NOT NULL,
  `distance` FLOAT NOT NULL,
  `circle_id` INT NULL,
  `location_id` INT NOT NULL,
  `smart_integration` INT NULL,
  `actual_date` DATETIME NULL,
  `scheduled_date` DATETIME NULL,
  PRIMARY KEY (`run_id`),
  UNIQUE INDEX `run_id_UNIQUE` (`run_id` ASC) VISIBLE,
  INDEX `circle_id_idx` (`circle_id` ASC) VISIBLE,
  INDEX `location_id_idx` (`location_id` ASC) VISIBLE,
  INDEX `smart_integration_idx` (`smart_integration` ASC) VISIBLE,
  CONSTRAINT `run_circle_id`
    FOREIGN KEY (`circle_id`)
    REFERENCES `run_circle`.`circle` (`circle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `run_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `run_circle`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `run_smart_integration`
    FOREIGN KEY (`smart_integration`)
    REFERENCES `run_circle`.`smart_data` (`smart_data_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`circle_memberships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`circle_memberships` (
  `profile_profile_id` INT NOT NULL,
  `circle_circle_id` INT NOT NULL,
  PRIMARY KEY (`profile_profile_id`, `circle_circle_id`),
  INDEX `fk_profile_has_circle_circle1_idx` (`circle_circle_id` ASC) VISIBLE,
  INDEX `fk_profile_has_circle_profile1_idx` (`profile_profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_has_circle_profile1`
    FOREIGN KEY (`profile_profile_id`)
    REFERENCES `run_circle`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_has_circle_circle1`
    FOREIGN KEY (`circle_circle_id`)
    REFERENCES `run_circle`.`circle` (`circle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`friend_connections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`friend_connections` (
  `profile_profile_id` INT NOT NULL,
  `profile_profile_id1` INT NOT NULL,
  PRIMARY KEY (`profile_profile_id`, `profile_profile_id1`),
  INDEX `fk_profile_has_profile_profile2_idx` (`profile_profile_id1` ASC) VISIBLE,
  INDEX `fk_profile_has_profile_profile1_idx` (`profile_profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_has_profile_profile1`
    FOREIGN KEY (`profile_profile_id`)
    REFERENCES `run_circle`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_has_profile_profile2`
    FOREIGN KEY (`profile_profile_id1`)
    REFERENCES `run_circle`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`trophies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`trophies` (
  `trophies_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`trophies_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`circle_has_trophies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`circle_has_trophies` (
  `circle_circle_id` INT NOT NULL,
  `trophies_trophies_id` INT NOT NULL,
  PRIMARY KEY (`circle_circle_id`, `trophies_trophies_id`),
  INDEX `fk_circle_has_trophies_trophies1_idx` (`trophies_trophies_id` ASC) VISIBLE,
  INDEX `fk_circle_has_trophies_circle1_idx` (`circle_circle_id` ASC) VISIBLE,
  CONSTRAINT `fk_circle_has_trophies_circle1`
    FOREIGN KEY (`circle_circle_id`)
    REFERENCES `run_circle`.`circle` (`circle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_circle_has_trophies_trophies1`
    FOREIGN KEY (`trophies_trophies_id`)
    REFERENCES `run_circle`.`trophies` (`trophies_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_circle`.`run_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`run_has_user` (
  `run_run_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`run_run_id`, `user_user_id`),
  INDEX `fk_run_has_user_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_run_has_user_run1_idx` (`run_run_id` ASC) VISIBLE,
  CONSTRAINT `fk_run_has_user_run1`
    FOREIGN KEY (`run_run_id`)
    REFERENCES `run_circle`.`run` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_user_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `run_circle`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

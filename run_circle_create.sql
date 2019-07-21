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
CREATE SCHEMA IF NOT EXISTS `run_circle` DEFAULT CHARACTER SET utf8 ;
USE `run_circle` ;

-- -----------------------------------------------------
-- Table `run_circle`.`user`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `run_circle`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`location` (
  `location_id` INT NOT NULL,
  `city_name` VARCHAR(50) NOT NULL,
  `country_name` VARCHAR(50) NOT NULL,
  `latitude` VARCHAR(50) NOT NULL,
  `longitude` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `location_id_UNIQUE` (`location_id` ASC) VISIBLE)
ENGINE = InnoDB;


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

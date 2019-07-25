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
(36, '19901125', "M", "tom", "chauncey", 3837279487, 0),
(37, '19861114', "F", "margaret", "thatchers", 6145389201, 1),
(38, '19901003', 'F', "alison", "brayford", 8896782536, 0),
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

insert into profile (profile_id, avg_distance_miles, pace_per_mile, avg_duration, runs, preferred_location, 
		handle, hidden, user_id) values
        (1, 5.4, 7.8,42.12, 47, 1, "fergoscotty", 0,1), 
        (2, 7.4, 8.2,60.68, 108, 1, "fujitaruns", 0,2),
        (3, 5.2, 7.5, 39.28,44,1, "swedenrunner", 0,3),
        (4, 7.1, 8.3,58.93,25, 1, "kelly.jones101", 1,4), 
        (5, 4.2, 9.2, 38.64,47, 1, "annerun111", 0, 5), 
        (6, 3.2, 9.8, 31.36,53, 1, "allenallin", 0, 6), 
        (7, 6.6, 6.8, 44.68,24, 1, "rashidainarush", 0,7), 
        (8, 5.6, 5.7, 31.92,4, 1, "michael.scottt", 1, 8), 
        (9, 7.6, 8.2, 62.31,45,1, "oprahoprah11", 0, 9), 
        (10, 6.2, 9.7, 60.14,98, 1, "daggerjogger", 0,10), 
        (11, 5.2, 8.2, 42.64,14, 2, "randerunner", 1, 11), 
        (12, 6.1, 6.8, 41.48,34, 2, "donaldduck", 1,12), 
        (13,7.2, 9.0, 64.80,22, 2, "hillaryhillruns", 0,13), 
        (14, 5.1,10.0, 60.00,65, 2, "feeltheburn", 0,14), 
        (15, 9.8, 7.6, 74.48,10, 2, "judybates999", 0,15), 
        (16, 8.4, 9.2, 77.28,54, 2, "runlover22", 0,16), 
        (17, 6.3, 7.2, 45.36,43, 2, "comerunwithme", 0,17), 
        (18, 4.2, 9.2, 38.64,65, 2, "kashmoneybb", 0,18), 
        (19, 2.0, 12.00, 24,112, 2, "thedukeofboston", 0,19),
        (20, 5.5,7.9, 43.45,54, 2, "sonofdavid", 1, 20), 
        (21, 4.5, 8.5, 38.25,28, 3, "gr8booksjane", 0, 21), 
        (22, 5.6, 6.4, 35.84,34,3, "freddyboiiii", 0,22), 
        (23, 3.2, 9.1, 29.12,45, 3, "portiagohard", 0,23), 
        (24, 4.5, 8.2, 36.90, 44,3, "samslammer", 0,24), 
        (25, 6.4, 8.7, 55.68,38, 3, "assshlleeeeeeigh", 1, 25), 
        (26, 5.6, 8.6, 48.16, 27, 3, "ardieofrunning", 0,26), 
        (27, 4.6, 9.1, 41.85, 53,3, "theblackestswan", 0, 27), 
        (28, 5.7, 8.2, 46.73, 27, 3, "benrunben1", 0,28), 
        (29, 7.4, 6.8, 46.73, 67, 3, "IreneIran", 1, 29), 
        (30, 8.5, 7.5, 63.75,34, 3, "keanurunning", 0, 30), 
        (31, 10, 8.6, 86.00,39, 4, "robbinraces", 1, 31), 
        (32, 4.3, 7.6, 32.68,56, 4, "runningbrodie", 0, 32), 
        (33, 6.6, 8.2, 54.12,12, 4, "gymnastrunning", 0, 33), 
        (34, 5.9, 6.5, 38.35,7, 4, "fruitforall", 0,34), 
        (35, 12.2, 9.4, 114.68,45, 4, "jumpinggeorge", 1, 35), 
        (36, 5.6, 8.3, 46.48,23, 4, "urchance2run", 0,36), 
        (37, 4.9, 5.6, 27.44,29, 4, "margiemarg", 0, 37), 
        (38, 7.8, 8.1, 63.18,62, 4, "allforalice483", 1, 38), 
        (39, 6.7, 8.0, 53.60,65, 4, "dunnersdunlop", 0, 39), 
        (40, 7.5, 7.5, 56.25,45, 4, "somersjoggr888", 0,40), 
        (41, 5.4, 6.2, 33.48,61, 5, "chucker101", 1,41), 
        (42, 9.3, 10.0, 93.00,45, 5, "allforthebeer", 0,42),
        (43, 3.2, 10.1, 32.32,47, 5, "quintuplequintin", 0,43), 
        (44, 5.6, 9.0, 50.4,39, 5, "wobblywollonga", 1, 44), 
        (45, 4.1, 7.6, 31.16,12, 5, "runnerRAMI", 0,45), 
        (46, 6.7, 9.8, 65.66,27, 5, "zippiezoe", 0, 46), 
        (47, 9.0, 6.0, 54.00,29, 5, "fastfreddie", 0,47), 
        (48, 6.3, 8.5, 53.55,30, 5, "horseyharriett", 0, 48), 
        (49, 5.5, 7.9, 43.45,75, 5, "bustinboksa", 1, 49), 
        (50, 7.8, 8.5, 66.30,103, 5, "fastlikehawks", 0,50);
        select * from profile;

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

insert into account (account_id, email, password, profile_id, user_id) values
(1, "fergus.scott05@gmail.com", "tappingowl", 1,1),
(2, "sushi.lover@gmail.com", "gosweden", 2,2), 
(3, "swedishmeatballs@gmail.com", "catsanddogs", 3,3),
(4, "kelly.jones000@gmail.com", "yllek321", 4,4), 
(5, "anne.michaels@outlook.com", "password111", 5,5), 
(6, "kate.c.allen@gmail.com", "katie444", 6,6), 
(7, "rashida.davidoff@gmail.com", "rashid@192", 7,7), 
(8, "michael.from.akron@papermate.com", "identitytheft88",8,8), 
(9, "oprah.linkert4456@gmail.com", "lionking43", 9,9),
(10, "alex.daggart@gmail.com", "gwh616", 10,10), 
(11, "ayn.rand@philosophy.com", "legendofphil", 11,11), 
(12, "donald.mccollom@outlook.com", "hwjwkbd01", 12,12), 
(13, "hillary.sanders@dem.edu.com", "wdukfb10", 13,13), 
(14, "bernie.mulaney@dem.edu.com", "jlsnfks390", 14,14), 
(15, "judy.bates@gmail.com", "bestskool101", 15,15), 
(16, "randolph.upsalla@sweden.govt", "coldallyear", 16,16), 
(17, "catherine.providence@ri.govt", "sjlab21", 17,17), 
(18, "akash.bangalore@bing.com", "jwbkfWK", 18,18), 
(19, "leticia.duke@gmail.com", "somepassword", 19,19), 
(20, "davis.davidson@gmail.com", "davis??!", 20,20), 
(21, "jane.eyre@book.gmail.com", "bookbookbook", 21,21), 
(22, "frederick@ibm.com", "mbwBDQjkn", 22,22), 
(23, "portia.woodman@ibm.com", "wnlsgnkm", 23,23),
(24, "sam.mccaw@allblacks.com", "39u39r3n3n", 24,24), 
(25, "ashleigh.timpson@gmail.com", "kqjbf29", 25,25), 
(26, "ardie.smith@allblacks.com", "wbanm139y1", 26,26),
(27, "natalie.kunis@gmail.com", "blackswan333", 27,27), 
(28, "ben.barrett@gmail.com", "kicker883", 28,28), 
(29, "irene.taylors@hotmail.com", "snkjqf", 29,29), 
(30, "keanu.keanu5@gmail.com", "sh1jnkf93", 30,30), 
(31, "robyn.wilson@ibm.com", "slinkyhours", 31,31), 
(32, "brodie.alchemers@hotmail.com", "JLENFLQFKLN", 32,32), 
(33, "madison.biles44@gmail.com", "jumpjump22", 33,33), 
(34, "clemetine.georgison@fruitfield.com", "fruitytootie", 34,34), 
(35, "steve.clooney@gmail.com", "55rushing57", 35,35), 
(36, "tom.chauncey@outlook.com", "placard66", 36,36), 
(37, "margaret.thatchers@govt.uk", "kjfqfkjf", 37,37),
(38, "alison.brayford@govt.uk", "kingsly774", 38,38),
(39, "dunlop.bradley@gmail.com", "starmarket", 39,39),
(40, "christie.somersby@hotmail.com", "ibehbla88", 40,40), 
(41, "charlie.grofton@gmail.com", "nmbnEKFL", 41,41), 
(42, "petunia.rosewood@gmail.com", "blackdog", 42,42), 
(43, "quintin.chang@outlook.com", "efqbkfh", 43,43), 
(44, "fiona.wollongong@hotmail.com", "password1", 44,44), 
(45, "carlos.ramirez999@gmail.com", "simting88", 45,45), 
(46, "zoe.atkinson@ibm.com", "bwbmduwdwb", 46,46),
(47, "frederick.ardmore@gmail.com", "password144", 47, 47), 
(48, "harrietteponyford@bing.com", "nicemanate", 48,48), 
(49, "kandee.forall@gmail.com", "yumyumyum", 49,49), 
(50, "deephpilosophy@philosophy.com", "hmmmmmmmm", 50,50);

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

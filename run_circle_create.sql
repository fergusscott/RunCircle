DROP DATABASE IF EXISTS run_circle;
CREATE DATABASE IF NOT EXISTS run_circle;
USE run_circle;

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
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `dob` DATE NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NULL,
  `hidden` TINYINT(1) NULL,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;

insert into user (dob, gender, first_name, last_name, phone, hidden) values
('19950410', "M", "fergus", "scott", 8074671453, 0),
('19960214', "M", "kenji", "fujita", 5672895142, 0),
('19940319', "M", "magnus", "frennberg", 5248194675, 0),
('19920201', "F", "kelly", "jones", 7869027564, 1),
('19901102', "F", "anne", "michaels", 1236540978, 1),
('19910808', "F", "kate", "allen", 7569184798, 1),
('19840411', "F", "rashida", "davidoff", 8462678917, 0),
('19860226', "M", "michael", "scott", 6578950723, 0),
('19960322', "F", "oprah", "linkert", 3427580139, 1), 
('19990909', "M", "alex", "daggart", 8291875610, 0),
('19750517', "F", "ayn", "rand", 1973678063, 1), 
('19820123', "M", "donald", "mccollom", 9058969999, 0), 
('19790217', "F", "hillary", "sanders", 6451890265, 0),
('19630915', "M", "bernie", "mulaney", 1873908576, 1), 
('19740619', "F", "judy", "bates", 1638953018, 0),
('19820828', "M", "randolph", "upsalla", 7486274601,1), 
('19911219', "F", "catherine", "providence", 8174561029, 0), 
('19871101', "M", "akash", "bangalore", 9018734992, 1), 
('19821009', "F", "leticia", "duke", 8053007538, 0), 
('19770707', "M", "davis", "davidson", 3547839138, 0), 
('19990216', "F", "jane", "eyre", 5367481029, 1), 
('19870330', "M", "fredrick", "naghstein", 8365883650, 0), 
('19790407', "F", "portia", "woodman", 5128775178, 0), 
('19920909', "M", "sam", "mccaw", 6558779889, 1), 
('19620615', "F", "ashleigh", "timpson", 5348208675, 0), 
('19911207', "M", "ardie", "smith", 1322877690, 1), 
('19890102', "F", "natalie", "kunis", 9875462785, 0), 
('19931126', "M", "ben", "barrett", 8537514235, 1), 
('19821009', "F", "irene", "taylors", 2579871324, 0), 
('19900423', "M", "keanu", "thompson", 8572340192, 1), 
('19850128', "F", "robyn", "wilson", 8562451092, 0), 
('19870715', "M", "brodie", "alchemers", 5346172897, 1), 
('19920427', "F", "madison", "biles", 890981376, 0), 
('19910101', "F", "clementine", "georgison", 7351907815, 1), 
('19781203', "M", "steve", "clooney", 6548910917, 0), 
('19901125', "M", "tom", "chauncey", 3837279487, 0),
('19861114', "F", "margaret", "thatchers", 6145389201, 1),
('19901003', 'F', "alison", "brayford", 8896782536, 0),
('19931015', "M", "bradley", "dunlop", 3156728098, 0), 
('19780330', "F", "christie", "somersby", 8695364817, 0), 
('19900814', "M", "charlie", "grofton", 7356718920, 1), 
('19840712', "F", "petunia", "rosewood", 3897562009, 0), 
('19750814', "M", "quintin", "chang", 5467289876, 0), 
('19620108', "F", "fiona", "wollongong", "1998760918", 1), 
('19901030', "M", "carlos", "ramirez", 8679280929, 0), 
('19930419', "F", "zoe", "atkinson", 8465267819, 1), 
('19870629', "M", "frederick", "ardmore", 4526567781, 0), 
('19830912', "F", "harriette", "ponyford", 9889765248, 0), 
('19810705', "M", "boksfull", "ovkandee", 3451890914, 1), 
('19920818', "M", "socrates", "hawking", 5367824578, 0);



-- -----------------------------------------------------
-- Table `run_circle`.`location`
-- -----------------------------------------------------
drop table if exists location;
CREATE TABLE IF NOT EXISTS `run_circle`.`location` (
  `location_id` INT PRIMARY KEY AUTO_INCREMENT,
  `city_name` VARCHAR(50) NOT NULL,
  `country_name` VARCHAR(50) NOT NULL,
  `latitude` VARCHAR(50) NOT NULL,
  `longitude` VARCHAR(50) NOT NULL,
  UNIQUE INDEX `location_id_UNIQUE` (`location_id` ASC))
ENGINE = InnoDB;

insert into location (city_name, country_name, latitude, longitude) values
("LONDON", "GREAT BRITAIN", "51.5074 N", "0.1278 W"),
("BOSTON", "UNITED STATES", "42.3601 N", "71.0589 W"), 
("CHICAGO", "UNITED STATES", "41.8781 N", "87.6298 W"), 
("STOCKHOLM", "SWEDEN", "59.3293 N", "18.0686 E"), 
("WELLINGTON", "NEW ZEALAND", "41.2865 N","174.7762 E"); 

-- -----------------------------------------------------
-- Table `run_circle`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`profile` (
  `profile_id` INT PRIMARY KEY AUTO_INCREMENT,
  `avg_distance_miles` FLOAT NOT NULL DEFAULT 0,
  `pace_per_mile` TIME NOT NULL DEFAULT '00:00:00',
  `avg_duration` TIME NOT NULL DEFAULT '00:00:00',
  `runs` INT NOT NULL DEFAULT 0,
  `preferred_location` INT NOT NULL,
  `handle` VARCHAR(50) NOT NULL,
  `hidden` TINYINT(1) NULL,
  `user_id` INT NOT NULL,
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

insert into profile (preferred_location, handle, hidden, user_id) values
        (1, "fergoscotty", 0,1), 
        (1, "fujitaruns", 0,2),
        (1, "swedenrunner", 0,3),
        (1, "kelly.jones101", 1,4), 
        (1, "annerun111", 0, 5), 
        (1, "allenallin", 0, 6), 
        (1, "rashidainarush", 0,7), 
        (1, "michael.scottt", 1, 8), 
        (1, "oprahoprah11", 0, 9), 
        (1, "daggerjogger", 0,10), 
        (2, "randerunner", 1, 11), 
        (2, "donaldduck", 1,12), 
        (2, "hillaryhillruns", 0,13), 
        (2, "feeltheburn", 0,14), 
        (2, "judybates999", 0,15), 
        (2, "runlover22", 0,16), 
        (2, "comerunwithme", 0,17), 
        (2, "kashmoneybb", 0,18), 
        (2, "thedukeofboston", 0,19),
        (2, "sonofdavid", 1, 20), 
        (3, "gr8booksjane", 0, 21), 
        (3, "freddyboiiii", 0,22), 
        (3, "portiagohard", 0,23), 
        (3, "samslammer", 0,24), 
        (3, "assshlleeeeeeigh", 1, 25), 
        (3, "ardieofrunning", 0,26), 
        (3, "theblackestswan", 0, 27), 
        (3, "benrunben1", 0,28), 
        (3, "IreneIran", 1, 29), 
        (3, "keanurunning", 0, 30), 
        (4, "robbinraces", 1, 31), 
        (4, "runningbrodie", 0, 32), 
        (4, "gymnastrunning", 0, 33), 
        (4, "fruitforall", 0,34), 
        (4, "jumpinggeorge", 1, 35), 
        (4, "urchance2run", 0,36), 
        (4, "margiemarg", 0, 37), 
        (4, "allforalice483", 1, 38), 
        (4, "dunnersdunlop", 0, 39), 
        (4, "somersjoggr888", 0,40), 
        (5, "chucker101", 1,41), 
        (5, "allforthebeer", 0,42),
        (5, "quintuplequintin", 0,43), 
        (5, "wobblywollonga", 1, 44), 
        (5, "runnerRAMI", 0,45), 
        (5, "zippiezoe", 0, 46), 
        (5, "fastfreddie", 0,47), 
        (5, "horseyharriett", 0, 48), 
        (5, "bustinboksa", 1, 49), 
        (5, "fastlikehawks", 0,50);

-- -----------------------------------------------------
-- Table `run_circle`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`account` (
  `account_id` INT PRIMARY KEY AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NULL,
  `profile_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  UNIQUE INDEX `account_id_UNIQUE` (`account_id` ASC),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  UNIQUE INDEX `handle_UNIQUE` (`profile_id` ASC),
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

insert into account (email, password, profile_id, user_id) values
("fergus.scott05@gmail.com", "tappingowl", 1,1),
("sushi.lover@gmail.com", "gosweden", 2,2), 
("swedishmeatballs@gmail.com", "catsanddogs", 3,3),
("kelly.jones000@gmail.com", "yllek321", 4,4), 
("anne.michaels@outlook.com", "password111", 5,5), 
("kate.c.allen@gmail.com", "katie444", 6,6), 
("rashida.davidoff@gmail.com", "rashid@192", 7,7), 
("michael.from.akron@papermate.com", "identitytheft88",8,8), 
("oprah.linkert4456@gmail.com", "lionking43", 9,9),
("alex.daggart@gmail.com", "gwh616", 10,10), 
("ayn.rand@philosophy.com", "legendofphil", 11,11), 
("donald.mccollom@outlook.com", "hwjwkbd01", 12,12), 
("hillary.sanders@dem.edu.com", "wdukfb10", 13,13), 
("bernie.mulaney@dem.edu.com", "jlsnfks390", 14,14), 
("judy.bates@gmail.com", "bestskool101", 15,15), 
("randolph.upsalla@sweden.govt", "coldallyear", 16,16), 
("catherine.providence@ri.govt", "sjlab21", 17,17), 
("akash.bangalore@bing.com", "jwbkfWK", 18,18), 
("leticia.duke@gmail.com", "somepassword", 19,19), 
("davis.davidson@gmail.com", "davis??!", 20,20), 
("jane.eyre@book.gmail.com", "bookbookbook", 21,21), 
("frederick@ibm.com", "mbwBDQjkn", 22,22), 
("portia.woodman@ibm.com", "wnlsgnkm", 23,23),
("sam.mccaw@allblacks.com", "39u39r3n3n", 24,24), 
("ashleigh.timpson@gmail.com", "kqjbf29", 25,25), 
("ardie.smith@allblacks.com", "wbanm139y1", 26,26),
("natalie.kunis@gmail.com", "blackswan333", 27,27), 
("ben.barrett@gmail.com", "kicker883", 28,28), 
("irene.taylors@hotmail.com", "snkjqf", 29,29), 
("keanu.keanu5@gmail.com", "sh1jnkf93", 30,30), 
("robyn.wilson@ibm.com", "slinkyhours", 31,31), 
("brodie.alchemers@hotmail.com", "JLENFLQFKLN", 32,32), 
("madison.biles44@gmail.com", "jumpjump22", 33,33), 
("clemetine.georgison@fruitfield.com", "fruitytootie", 34,34), 
("steve.clooney@gmail.com", "55rushing57", 35,35), 
("tom.chauncey@outlook.com", "placard66", 36,36), 
("margaret.thatchers@govt.uk", "kjfqfkjf", 37,37),
("alison.brayford@govt.uk", "kingsly774", 38,38),
("dunlop.bradley@gmail.com", "starmarket", 39,39),
("christie.somersby@hotmail.com", "ibehbla88", 40,40), 
("charlie.grofton@gmail.com", "nmbnEKFL", 41,41), 
("petunia.rosewood@gmail.com", "blackdog", 42,42), 
("quintin.chang@outlook.com", "efqbkfh", 43,43), 
("fiona.wollongong@hotmail.com", "password1", 44,44), 
("carlos.ramirez999@gmail.com", "simting88", 45,45), 
("zoe.atkinson@ibm.com", "bwbmduwdwb", 46,46),
("frederick.ardmore@gmail.com", "password144", 47, 47), 
("harrietteponyford@bing.com", "nicemanate", 48,48), 
("kandee.forall@gmail.com", "yumyumyum", 49,49), 
("deephpilosophy@philosophy.com", "hmmmmmmmm", 50,50);

-- -----------------------------------------------------
-- Table `run_circle`.`circle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `run_circle`.`circle` (
  `circle_id` INT PRIMARY KEY AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `avg_duration` TIME NOT NULL,
  `avg_speed` FLOAT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `location_id` INT NOT NULL,
  `num_members` INT NOT NULL,
  UNIQUE INDEX `circle_id_UNIQUE` (`circle_id` ASC),
  INDEX `profile_id_idx` (`profile_id` ASC),
  INDEX `location_id_idx` (`location_id` ASC),
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
  `run_id` INT PRIMARY KEY AUTO_INCREMENT,
  `duration` TIME NOT NULL,
  `pace_per_mile` TIME NOT NULL,
  `elevation` INT NOT NULL,
  `distance` FLOAT NOT NULL,
  `circle_id` INT NULL,
  `location_id` INT NOT NULL,
  `smart_integration` INT NULL,
  `actual_date` DATETIME NULL,
  `scheduled_date` DATETIME NULL,
  UNIQUE INDEX `run_id_UNIQUE` (`run_id` ASC),
  INDEX `circle_id_idx` (`circle_id` ASC),
  INDEX `location_id_idx` (`location_id` ASC),
  INDEX `smart_integration_idx` (`smart_integration` ASC),
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
  INDEX `fk_profile_has_circle_circle1_idx` (`circle_circle_id` ASC),
  INDEX `fk_profile_has_circle_profile1_idx` (`profile_profile_id` ASC),
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
  INDEX `fk_profile_has_profile_profile2_idx` (`profile_profile_id1` ASC),
  INDEX `fk_profile_has_profile_profile1_idx` (`profile_profile_id` ASC),
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
  INDEX `fk_circle_has_trophies_trophies1_idx` (`trophies_trophies_id` ASC),
  INDEX `fk_circle_has_trophies_circle1_idx` (`circle_circle_id` ASC),
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
CREATE TABLE IF NOT EXISTS `run_circle`.`run_has_profile` (
  `run_run_id` INT NOT NULL,
  `profile_profile_id` INT NOT NULL,
  CONSTRAINT FOREIGN KEY (run_run_id) REFERENCES run(run_id),
  CONSTRAINT FOREIGN KEY (profile_profile_id) REFERENCES profile(profile_id),
  CONSTRAINT user_only_has_a_run_once UNIQUE(run_run_id, profile_profile_id))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
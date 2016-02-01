SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA `MathProject` DEFAULT CHARACTER SET latin2 COLLATE latin2_croatian_ci ;


-- -----------------------------------------------------
-- Table `MathProject`.`razred`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MathProject`.`razred` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `ime` VARCHAR(45) NOT NULL ,
  `redoslijed` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `ime_UNIQUE` (`ime` ASC) ,
  UNIQUE INDEX `redoslijed_UNIQUE` (`redoslijed` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MathProject`.`oblast`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MathProject`.`oblast` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `naziv` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `naziv_UNIQUE` (`naziv` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin2
COLLATE = latin2_croatian_ci;


-- -----------------------------------------------------
-- Table `MathProject`.`razred_oblast`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MathProject`.`razred_oblast` (
  `razred_id` INT NOT NULL ,
  `oblast_id` INT NOT NULL ,
  `id` INT NOT NULL AUTO_INCREMENT ,
  INDEX `fk_razred_has_oblast_oblast1` (`oblast_id` ASC) ,
  INDEX `fk_razred_has_oblast_razred1` (`razred_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_razred_has_oblast_razred1`
    FOREIGN KEY (`razred_id` )
    REFERENCES `MathProject`.`razred` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_razred_has_oblast_oblast1`
    FOREIGN KEY (`oblast_id` )
    REFERENCES `MathProject`.`oblast` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MathProject`.`tip_korisnika`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MathProject`.`tip_korisnika` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `ime` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `ime_UNIQUE` (`ime` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MathProject`.`korisnik`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MathProject`.`korisnik` (
  `id` INT NOT NULL ,
  `login` VARCHAR(45) NOT NULL ,
  `pasword` VARCHAR(255) NOT NULL ,
  `rowtimestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `last_login` TIMESTAMP NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `tip_korisnika_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `tip_korisnika_id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `fk_korisnik_tip_korisnika1` (`tip_korisnika_id` ASC) ,
  CONSTRAINT `fk_korisnik_tip_korisnika1`
    FOREIGN KEY (`tip_korisnika_id` )
    REFERENCES `MathProject`.`tip_korisnika` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MathProject`.`zadatak`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MathProject`.`zadatak` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tekst` BLOB NOT NULL ,
  `rjesenje` BLOB NULL ,
  `razred_oblast_id` INT NOT NULL ,
  `korisnik_id` INT NOT NULL ,
  `rowtimestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`, `razred_oblast_id`, `korisnik_id`) ,
  INDEX `fk_zadatak_razred_oblast1` (`razred_oblast_id` ASC) ,
  INDEX `fk_zadatak_korisnik1` (`korisnik_id` ASC) ,
  CONSTRAINT `fk_zadatak_razred_oblast1`
    FOREIGN KEY (`razred_oblast_id` )
    REFERENCES `MathProject`.`razred_oblast` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_zadatak_korisnik1`
    FOREIGN KEY (`korisnik_id` )
    REFERENCES `MathProject`.`korisnik` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = latin2
COLLATE = latin2_croatian_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

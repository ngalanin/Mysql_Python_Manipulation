---
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mieter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mieter` (
  `idMieter` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `Kaltmiete` DECIMAL(2) NULL,
  `Nebenkosten` DECIMAL(2) NULL,
  PRIMARY KEY (`idMieter`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Wohnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Wohnung` (
  `idWohnung` INT NOT NULL,
  `Wohnungsnummer` INT NULL,
  `MIeter` VARCHAR(45) NULL,
  `Mieter_idMieter` INT NOT NULL,
  PRIMARY KEY (`idWohnung`),
  INDEX `fk_Wohnung_Mieter1_idx` (`Mieter_idMieter` ASC) VISIBLE,
  CONSTRAINT `fk_Wohnung_Mieter1`
    FOREIGN KEY (`Mieter_idMieter`)
    REFERENCES `mydb`.`Mieter` (`idMieter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Objekt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Objekt` (
  `id_objekt` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  `strasse` VARCHAR(45) NULL,
  `haus-nr` INT NULL,
  `postleitzahl` VARCHAR(45) CHARACTER SET 'DEFAULT' NULL,
  `stadt` VARCHAR(45) NULL,
  `Wohnung_idWohnung` INT NOT NULL,
  PRIMARY KEY (`id_objekt`),
  INDEX `fk_Objekt_Wohnung1_idx` (`Wohnung_idWohnung` ASC) VISIBLE,
  CONSTRAINT `fk_Objekt_Wohnung1`
    FOREIGN KEY (`Wohnung_idWohnung`)
    REFERENCES `mydb`.`Wohnung` (`idWohnung`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

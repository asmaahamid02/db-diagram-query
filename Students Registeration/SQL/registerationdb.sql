-- -----------------------------------------------------
-- Schema registerationdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `registerationdb` DEFAULT CHARACTER SET utf8 ;
USE `registerationdb` ;

-- -----------------------------------------------------
-- Table `registerationdb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registerationdb`.`Student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registerationdb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registerationdb`.`Department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `office` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registerationdb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registerationdb`.`Room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registerationdb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registerationdb`.`Course` (
  `crn` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`crn`),
  INDEX `fk_courses_rooms1_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_rooms1`
    FOREIGN KEY (`room_id`)
    REFERENCES `registerationdb`.`Room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registerationdb`.`MajorsIn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registerationdb`.`MajorsIn` (
  `student_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  INDEX `fk_majors_in_students1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_majors_in_departments1_idx` (`dept_id` ASC) VISIBLE,
  PRIMARY KEY (`student_id`, `dept_id`),
  CONSTRAINT `fk_majors_in_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `registerationdb`.`Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_majors_in_departments1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `registerationdb`.`Department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `registerationdb`.`Enrolled`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registerationdb`.`Enrolled` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `credit_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  INDEX `fk_Enrolled_Course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Enrolled_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `registerationdb`.`Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrolled_Course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `registerationdb`.`Course` (`crn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

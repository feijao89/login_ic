-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: login_ci
-- Source Schemata: login_ci
-- Created: Thu May 28 00:50:59 2015
-- Workbench Version: 6.3.3
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema login_ci
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `login_ci` ;
CREATE SCHEMA IF NOT EXISTS `login_ci` ;

-- ----------------------------------------------------------------------------
-- Table login_ci.bairo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `login_ci`.`bairo` (
  `id_bairro` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_bairro` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id_bairro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table login_ci.members
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `login_ci`.`members` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `e-mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_bairro` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table login_ci.motorista
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `login_ci`.`motorista` (
  `id_motorista` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `tipo_veiculo` VARCHAR(32) NOT NULL,
  `placa` VARCHAR(8) NOT NULL,
  `num_assentos` INT(10) NOT NULL,
  `faculdade` VARCHAR(60) NOT NULL,
  `telefone` INT(10) NOT NULL,
  `id_bairro` INT(11) NOT NULL,
  `username` VARCHAR(32) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id_motorista`, `id_bairro`),
  UNIQUE INDEX `placa` (`placa` ASC, `username` ASC),
  INDEX `id_bairro` (`id_bairro` ASC),
  CONSTRAINT `motorista_ibfk_1`
    FOREIGN KEY (`id_bairro`)
    REFERENCES `login_ci`.`bairo` (`id_bairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table login_ci.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `login_ci`.`users` (
  `id` INT(11) NOT NULL,
  `username` VARCHAR(32) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `celephone` INT(10) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `last_name` VARCHAR(32) NOT NULL,
  `faculdade` VARCHAR(32) NOT NULL,
  `id_bairro` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`, `id_bairro`),
  UNIQUE INDEX `username` (`username` ASC),
  UNIQUE INDEX `email` (`email` ASC),
  INDEX `id_bairro` (`id_bairro` ASC),
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`id_bairro`)
    REFERENCES `login_ci`.`bairo` (`id_bairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
SET FOREIGN_KEY_CHECKS = 1;

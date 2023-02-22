CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Clients` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(10) NOT NULL,
  `Cognoms` VARCHAR(30) NOT NULL,
  `Adreça` VARCHAR(30) NOT NULL,
  `Codi_Postal` INT NOT NULL,
  `Localitat` VARCHAR(15) NOT NULL,
  `Provincia` VARCHAR(15) NOT NULL,
  `Telèfon` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Botigues` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Adreça` VARCHAR(30) NOT NULL,
  `Codi_Postal` INT NOT NULL,
  `Localitat` VARCHAR(15) NOT NULL,
  `Província` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Treballadors` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Botiga` INT NOT NULL,
  `Nom` VARCHAR(10) NOT NULL,
  `Cognoms` VARCHAR(30) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `Telèfon` INT NOT NULL,
  `Tasca` JSON NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Treballadors_Botigues1_idx` (`Botiga` ASC) VISIBLE,
  CONSTRAINT `fk_Treballadors_Botigues1`
    FOREIGN KEY (`Botiga`)
    REFERENCES `PauGuillenPizzeria`.`Botigues` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Comandes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Client` INT NOT NULL,
  `Botiga` INT NOT NULL,
  `Data/hora` DATETIME NOT NULL,
  `Entrega` JSON NOT NULL,
  `Preu_total` FLOAT NOT NULL,
  `Repartidor` INT NULL,
  `Data/hora_Entrega` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Comandes_Clients1_idx` (`Client` ASC) VISIBLE,
  INDEX `fk_Comandes_Botigues1_idx` (`Botiga` ASC) VISIBLE,
  INDEX `fk_Comandes_Treballadors1_idx` (`Repartidor` ASC) VISIBLE,
  CONSTRAINT `fk_Comandes_Clients1`
    FOREIGN KEY (`Client`)
    REFERENCES `PauGuillenPizzeria`.`Clients` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comandes_Botigues1`
    FOREIGN KEY (`Botiga`)
    REFERENCES `PauGuillenPizzeria`.`Botigues` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comandes_Treballadors1`
    FOREIGN KEY (`Repartidor`)
    REFERENCES `PauGuillenPizzeria`.`Treballadors` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Categories de pizzes` (
  `Id` SMALLINT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Productes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(20) NOT NULL,
  `Descripció` VARCHAR(40) NOT NULL,
  `Imatge` VARBINARY(1) NOT NULL,
  `Preu` FLOAT NOT NULL,
  `Tipus` VARCHAR(12) NOT NULL,
  `Categoria` SMALLINT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Productes_Categories de pizzes1_idx` (`Categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Productes_Categories de pizzes1`
    FOREIGN KEY (`Categoria`)
    REFERENCES `PauGuillenPizzeria`.`Categories de pizzes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `PauGuillenPizzeria`.`Productes demanats` (
  `Comanda` INT NOT NULL,
  `Producte` INT NOT NULL,
  `Quantitat` INT NOT NULL,
  INDEX `fk_Productes demanats_Comandes1_idx` (`Comanda` ASC) VISIBLE,
  INDEX `fk_Productes demanats_Productes1_idx` (`Producte` ASC) VISIBLE,
  CONSTRAINT `fk_Productes demanats_Comandes1`
    FOREIGN KEY (`Comanda`)
    REFERENCES `PauGuillenPizzeria`.`Comandes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Productes demanats_Productes1`
    FOREIGN KEY (`Producte`)
    REFERENCES `PauGuillenPizzeria`.`Productes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB

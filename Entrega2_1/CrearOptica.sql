CREATE TABLE IF NOT EXISTS `PauGuillenOptica`.`Clients` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NOT NULL,
  `Adreça` VARCHAR(60) NOT NULL,
  `Telèfon` INT NOT NULL,
  `Correu` VARCHAR(40) NOT NULL,
  `Data_Registre` DATE NOT NULL,
  `Recomanat_per` INT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Clients_Clients1_idx` (`Recomanat_per` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Clients1`
    FOREIGN KEY (`Recomanat_per`)
    REFERENCES `PauGuillenOptica`.`Clients` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    CREATE TABLE IF NOT EXISTS `PauGuillenOptica`.`Empleats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);
  CREATE TABLE IF NOT EXISTS `PauGuillenOptica`.`Proveïdors` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NOT NULL,
  `Adreça` VARCHAR(60) NOT NULL,
  `Telèfon` INT NOT NULL,
  `Fax` INT NOT NULL,
  `NIF` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `PauGuillenOptica`.`Ulleres` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Proveidor` INT NOT NULL,
  `Marca` VARCHAR(15) NOT NULL,
  `Graduació_Vidre_Esq` FLOAT NOT NULL,
  `Graduació_Vidre_Dret` FLOAT NOT NULL,
  `Color_Muntura` VARCHAR(10) NOT NULL,
  `Color_Vidre_Dret` VARCHAR(10) NOT NULL,
  `Color_Vidre_Esq` VARCHAR(10) NOT NULL,
  `Preu` FLOAT NOT NULL,
  `Muntura` JSON NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Ulleres_Proveïdors_idx` (`Proveidor` ASC) VISIBLE,
  UNIQUE INDEX `Ulleres_id_UNIQUE` (`Id` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Proveïdors`
    FOREIGN KEY (`Proveidor`)
    REFERENCES `PauGuillenOptica`.`Proveïdors` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `PauGuillenOptica`.`Ventes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Ulleres` INT NOT NULL,
  `Comprador` INT NOT NULL,
  `Venedor` INT NOT NULL,
  `Data_Venta` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Ventes_Ulleres1_idx` (`Ulleres` ASC) VISIBLE,
  INDEX `fk_Ventes_Clients1_idx` (`Comprador` ASC) VISIBLE,
  INDEX `fk_Ventes_Empleats1_idx` (`Venedor` ASC) VISIBLE,
  CONSTRAINT `fk_Ventes_Ulleres1`
    FOREIGN KEY (`Ulleres`)
    REFERENCES `PauGuillenOptica`.`Ulleres` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ventes_Clients1`
    FOREIGN KEY (`Comprador`)
    REFERENCES `PauGuillenOptica`.`Clients` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ventes_Empleats1`
    FOREIGN KEY (`Venedor`)
    REFERENCES `PauGuillenOptica`.`Empleats` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
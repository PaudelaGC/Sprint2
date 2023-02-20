CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Usuaris` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Premium` TINYINT NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  `Contrasenya` VARCHAR(15) NOT NULL,
  `Username` VARCHAR(15) NOT NULL,
  `Data_naixement` DATE NOT NULL,
  `Sexe` CHAR NOT NULL,
  `País` VARCHAR(20) NOT NULL,
  `CP` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Suscripcions` (
  `Usuari` INT NOT NULL,
  `Data_inici` DATE NOT NULL,
  `Data_renovació` DATE NOT NULL,
  `Mètode_pagament` SMALLINT NOT NULL,
  INDEX `fk_Suscripcions_Usuaris_idx` (`Usuari` ASC) VISIBLE,
  UNIQUE INDEX `Usuaris_Id_UNIQUE` (`Usuari` ASC) VISIBLE,
  PRIMARY KEY (`Usuari`),
  CONSTRAINT `fk_Suscripcions_Usuaris`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenspotify`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Pagaments` (
  `Suscripció` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Num_ordre` INT NOT NULL,
  INDEX `fk_Pagaments_Suscripcions1_idx` (`Suscripció` ASC) VISIBLE,
  UNIQUE INDEX `Num_ordre_UNIQUE` (`Num_ordre` ASC) VISIBLE,
  CONSTRAINT `fk_Pagaments_Suscripcions1`
    FOREIGN KEY (`Suscripció`)
    REFERENCES `pauguillenspotify`.`Suscripcions` (`Usuari`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Tarjetes` (
  `Suscripcio` INT NOT NULL,
  `Numero` INT NOT NULL,
  `Caducitat` DATE NOT NULL,
  `Codi_seguretat` INT NOT NULL,
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC) VISIBLE,
  UNIQUE INDEX `Suscripcio_UNIQUE` (`Suscripcio` ASC) VISIBLE,
  CONSTRAINT `fk_Tarjetes_Suscripcions1`
    FOREIGN KEY (`Suscripcio`)
    REFERENCES `pauguillenspotify`.`Suscripcions` (`Usuari`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Playlists` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Creador` INT NOT NULL,
  `Títol` VARCHAR(20) NOT NULL,
  `Num_cançons` INT NOT NULL,
  `Data_creació` DATE NOT NULL,
  `Eliminada` TINYINT NOT NULL,
  `Data_eliminació` DATE NULL,
  INDEX `fk_Playlists_Usuaris1_idx` (`Creador` ASC) VISIBLE,
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_Playlists_Usuaris1`
    FOREIGN KEY (`Creador`)
    REFERENCES `pauguillenspotify`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Paypals` (
  `Suscripcio` INT NOT NULL,
  `Usuari_Paypal` VARCHAR(20) NOT NULL,
  UNIQUE INDEX `Usuari_Paypal_UNIQUE` (`Usuari_Paypal` ASC) VISIBLE,
  INDEX `fk_Paypals_Suscripcions1_idx` (`Suscripcio` ASC) VISIBLE,
  UNIQUE INDEX `Suscripcio_UNIQUE` (`Suscripcio` ASC) VISIBLE,
  CONSTRAINT `fk_Paypals_Suscripcions1`
    FOREIGN KEY (`Suscripcio`)
    REFERENCES `pauguillenspotify`.`Suscripcions` (`Usuari`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Artistes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Imatge` VARBINARY(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Relacionats` (
  `Artista` INT NOT NULL,
  `Relacionat` INT NOT NULL,
  INDEX `fk_Relacionats_Artistes1_idx` (`Artista` ASC) VISIBLE,
  INDEX `fk_Relacionats_Artistes2_idx` (`Relacionat` ASC) VISIBLE,
  CONSTRAINT `fk_Relacionats_Artistes1`
    FOREIGN KEY (`Artista`)
    REFERENCES `pauguillenspotify`.`Artistes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Relacionats_Artistes2`
    FOREIGN KEY (`Relacionat`)
    REFERENCES `pauguillenspotify`.`Artistes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Seguiments` (
  `Usuari` INT NOT NULL,
  `Artista` INT NOT NULL,
  INDEX `fk_Seguiments_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Seguiments_Artistes1_idx` (`Artista` ASC) VISIBLE,
  CONSTRAINT `fk_Seguiments_Usuaris1`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenspotify`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Seguiments_Artistes1`
    FOREIGN KEY (`Artista`)
    REFERENCES `pauguillenspotify`.`Artistes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Albums` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Artista` INT NOT NULL,
  `Títol` VARCHAR(30) NOT NULL,
  `Any_publicació` YEAR NOT NULL,
  `Imatge` VARBINARY(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Albums_Artistes1_idx` (`Artista` ASC) VISIBLE,
  CONSTRAINT `fk_Albums_Artistes1`
    FOREIGN KEY (`Artista`)
    REFERENCES `pauguillenspotify`.`Artistes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Cançons` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Album` INT NOT NULL,
  `Títol` VARCHAR(30) NOT NULL,
  `Durada` TIME NOT NULL,
  `Reproduccions` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Cançons_Albums1_idx` (`Album` ASC) VISIBLE,
  CONSTRAINT `fk_Cançons_Albums1`
    FOREIGN KEY (`Album`)
    REFERENCES `pauguillenspotify`.`Albums` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Afegiments` (
  `Usuari` INT NOT NULL,
  `Cançó` INT NOT NULL,
  `Playlist` INT NOT NULL,
  `Data` DATE NOT NULL,
  INDEX `fk_Afegiments_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Afegiments_Playlists1_idx` (`Playlist` ASC) VISIBLE,
  INDEX `fk_Afegiments_Cançons1_idx` (`Cançó` ASC) VISIBLE,
  CONSTRAINT `fk_Afegiments_Usuaris1`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenspotify`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Afegiments_Playlists1`
    FOREIGN KEY (`Playlist`)
    REFERENCES `pauguillenspotify`.`Playlists` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Afegiments_Cançons1`
    FOREIGN KEY (`Cançó`)
    REFERENCES `pauguillenspotify`.`Cançons` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Albums favorits` (
  `Usuari` INT NOT NULL,
  `Album` INT NOT NULL,
  INDEX `fk_Favorits_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Albums favorits_Albums1_idx` (`Album` ASC) VISIBLE,
  CONSTRAINT `fk_Favorits_Usuaris1`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenspotify`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Albums favorits_Albums1`
    FOREIGN KEY (`Album`)
    REFERENCES `pauguillenspotify`.`Albums` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenspotify`.`Cançons favorites` (
  `Usuari` INT NOT NULL,
  `Canço` INT NOT NULL,
  INDEX `fk_Cançons favorites_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Cançons favorites_Cançons1_idx` (`Canço` ASC) VISIBLE,
  CONSTRAINT `fk_Cançons favorites_Usuaris1`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenspotify`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cançons favorites_Cançons1`
    FOREIGN KEY (`Canço`)
    REFERENCES `pauguillenspotify`.`Cançons` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
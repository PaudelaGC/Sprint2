CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Usuaris` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(40) NOT NULL,
  `Contrasenya` VARCHAR(20) NOT NULL,
  `Username` VARCHAR(15) NOT NULL,
  `Data_naixement` DATE NOT NULL,
  `Sexe` CHAR NOT NULL,
  `País` VARCHAR(15) NOT NULL,
  `CP` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Videos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Publicador` INT NOT NULL,
  `Estat` SMALLINT NOT NULL,
  `Títol` VARCHAR(60) NOT NULL,
  `Descripció` VARCHAR(300) NULL,
  `Mida` FLOAT NOT NULL,
  `Arxiu` VARCHAR(30) NOT NULL,
  `Duració` TIME NOT NULL,
  `Miniatura` VARBINARY(1) NOT NULL,
  `Reproduccions` INT NOT NULL,
  `Likes` INT NOT NULL,
  `Dislikes` INT NOT NULL,
  `Data_publicació` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Videos_Usuaris_idx` (`Publicador` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_Usuaris`
    FOREIGN KEY (`Publicador`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Etiquetes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`LListat d'etiquetes` (
  `Video` INT NOT NULL,
  `Etiqueta` INT NOT NULL,
  INDEX `fk_LListat d'etiquetes_Videos1_idx` (`Video` ASC) VISIBLE,
  INDEX `fk_LListat d'etiquetes_Etiquetes1_idx` (`Etiqueta` ASC) VISIBLE,
  CONSTRAINT `fk_LListat d'etiquetes_Videos1`
    FOREIGN KEY (`Video`)
    REFERENCES `pauguillenyoutube`.`Videos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_LListat d'etiquetes_Etiquetes1`
    FOREIGN KEY (`Etiqueta`)
    REFERENCES `pauguillenyoutube`.`Etiquetes` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Canals` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Creador` INT NOT NULL,
  `Nom` VARCHAR(30) NOT NULL,
  `Descripció` VARCHAR(300) NULL,
  `Data_creació` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Canals_Usuaris1_idx` (`Creador` ASC) VISIBLE,
  UNIQUE INDEX `Creador_UNIQUE` (`Creador` ASC) VISIBLE,
  CONSTRAINT `fk_Canals_Usuaris1`
    FOREIGN KEY (`Creador`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Suscripcions` (
  `Usuari` INT NOT NULL,
  `Canal` INT NOT NULL,
  INDEX `fk_Suscripcions_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Suscripcions_Canals1_idx` (`Canal` ASC) VISIBLE,
  CONSTRAINT `fk_Suscripcions_Usuaris1`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Suscripcions_Canals1`
    FOREIGN KEY (`Canal`)
    REFERENCES `pauguillenyoutube`.`Canals` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Likes a videos` (
  `Usuari` INT NOT NULL,
  `Video` INT NOT NULL,
  `Like` TINYINT NULL,
  `Data` DATETIME NOT NULL,
  INDEX `fk_Likes_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Likes_Videos1_idx` (`Video` ASC) VISIBLE,
  CONSTRAINT `fk_Likes_Usuaris1`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Likes_Videos1`
    FOREIGN KEY (`Video`)
    REFERENCES `pauguillenyoutube`.`Videos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Playlists` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Creador` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Data_creació` DATETIME NOT NULL,
  `Estat` TINYINT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Playlists_Usuaris1_idx` (`Creador` ASC) VISIBLE,
  CONSTRAINT `fk_Playlists_Usuaris1`
    FOREIGN KEY (`Creador`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Llistat de videos` (
  `Playlist` INT NOT NULL,
  `Video` INT NOT NULL,
  INDEX `fk_Llistat de videos_Playlists1_idx` (`Playlist` ASC) VISIBLE,
  INDEX `fk_Llistat de videos_Videos1_idx` (`Video` ASC) VISIBLE,
  CONSTRAINT `fk_Llistat de videos_Playlists1`
    FOREIGN KEY (`Playlist`)
    REFERENCES `pauguillenyoutube`.`Playlists` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Llistat de videos_Videos1`
    FOREIGN KEY (`Video`)
    REFERENCES `pauguillenyoutube`.`Videos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Comentaris` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Publicador` INT NOT NULL,
  `Video` INT NOT NULL,
  `Contingut` VARCHAR(300) NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Comentaris_Usuaris1_idx` (`Publicador` ASC) VISIBLE,
  INDEX `fk_Comentaris_Videos1_idx` (`Video` ASC) VISIBLE,
  CONSTRAINT `fk_Comentaris_Usuaris1`
    FOREIGN KEY (`Publicador`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comentaris_Videos1`
    FOREIGN KEY (`Video`)
    REFERENCES `pauguillenyoutube`.`Videos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE IF NOT EXISTS `pauguillenyoutube`.`Likes a comentaris` (
  `Usuari` INT NOT NULL,
  `Comentari` INT NOT NULL,
  `Like` TINYINT NULL,
  `Data` DATETIME NOT NULL,
  INDEX `fk_Likes_Usuaris1_idx` (`Usuari` ASC) VISIBLE,
  INDEX `fk_Likes a videos_copy1_Comentaris1_idx` (`Comentari` ASC) VISIBLE,
  CONSTRAINT `fk_Likes_Usuaris10`
    FOREIGN KEY (`Usuari`)
    REFERENCES `pauguillenyoutube`.`Usuaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Likes a videos_copy1_Comentaris1`
    FOREIGN KEY (`Comentari`)
    REFERENCES `pauguillenyoutube`.`Comentaris` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
create database BD_almace;

use BD_almace;


-- -----------------------------------------------------
-- Table `BD_Almace`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Almace`.`clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nombres` CHAR(60) NOT NULL,
  `Apellidos` VARCHAR(60) NOT NULL,
  `direccion` CHAR(40) NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Almace`.`telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Almace`.`telefonos` (
  `idTelefonos` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(12) NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idTelefonos`),
  INDEX `fk_Telefonos_Clientes_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Telefonos_Clientes`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `BD_Almace`.`clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Almace`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `nombre` CHAR(80) NOT NULL,
  `fecha` DATE NOT NULL,
  `subTotal` DECIMAL(10,2) NOT NULL, -- Corregido: DECIMAL(10,2)
  `iva` DECIMAL(10,2) NOT NULL,
  `descuento` DECIMAL(10,2) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idventas`),
  INDEX `fk_ventas_clientes1_idx` (`clientes_idClientes` ASC),
  CONSTRAINT `fk_ventas_clientes1`
    FOREIGN KEY (`clientes_idClientes`)
    REFERENCES `clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `BD_Almace`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Almace`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` CHAR(80) NOT NULL,
  `precioCompra` DECIMAL(10,2) NOT NULL,
  `precioVenta` VARCHAR(45) NOT NULL,
  `productoscol` DECIMAL(10,2) NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Almace`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Almace`.`proveedores` (
  `idproveedores` INT NOT NULL,
  `nombre` CHAR(80) NOT NULL,
  `direccion` CHAR(80) NOT NULL,
  `telefono` CHAR(40) NOT NULL,
  `correo` CHAR(120) NOT NULL,
  PRIMARY KEY (`idproveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Almace`.`ventas_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Almace`.`ventas_has_productos` (
  `ventas_idventas` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`ventas_idventas`, `productos_idproductos`),
  INDEX `fk_ventas_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_ventas_has_productos_ventas1_idx` (`ventas_idventas` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_has_productos_ventas1`
    FOREIGN KEY (`ventas_idventas`)
    REFERENCES `BD_Almace`.`ventas` (`idventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `BD_Almace`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Almace`.`proveedores_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Almace`.`proveedores_has_productos` (
  `proveedores_idproveedores` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`proveedores_idproveedores`, `productos_idproductos`),
  INDEX `fk_proveedores_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_proveedores_has_productos_proveedores1_idx` (`proveedores_idproveedores` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores_has_productos_proveedores1`
    FOREIGN KEY (`proveedores_idproveedores`)
    REFERENCES `BD_Almace`.`proveedores` (`idproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `BD_Almace`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bd_almace` ;

-- -----------------------------------------------------
-- Table `bd_almace`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_almace`.`clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_almace`.`telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_almace`.`telefonos` (
  `idTelefonos` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(45) NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idTelefonos`),
  INDEX `fk_Telefonos_Clientes_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Telefonos_Clientes`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `bd_almace`.`clientes` (`idClientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

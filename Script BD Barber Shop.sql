-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BarberShop
-- -----------------------------------------------------
-- base de datos proyecto barberia

-- -----------------------------------------------------
-- Schema BarberShop
--
-- base de datos proyecto barberia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BarberShop` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `BarberShop` ;

-- -----------------------------------------------------
-- Table `BarberShop`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Rol` (
  `idRol` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Rol_idRol` INT NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Estado_Inicio_de_Secion` VARCHAR(45) NULL,
  `Fecha_de_Registro` DATE NOT NULL,
  PRIMARY KEY (`idUsuario`, `Rol_idRol`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `Contraseña_UNIQUE` (`Contraseña` ASC) VISIBLE,
  INDEX `fk_Usuario_Rol1_idx` (`Rol_idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `BarberShop`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Cedula` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Correo_Electronico` VARCHAR(45) NOT NULL,
  `Info_T_Credito_o_Debito` VARCHAR(45) NULL,
  `Info_de_Envio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`, `Usuario_idUsuario`),
  UNIQUE INDEX `Cedula_UNIQUE` (`Cedula` ASC) VISIBLE,
  INDEX `fk_Cliente_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `BarberShop`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Forma_de_Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Forma_de_Pago` (
  `idForma_de_Pago` TINYINT NOT NULL,
  `Forma_de_Pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idForma_de_Pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Linea_d_ Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Linea_d_ Catalogo` (
  `idLinea_d_ Producto` SMALLINT NOT NULL,
  `Linea_d_ Producto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLinea_d_ Producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Carrito_de_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Carrito_de_compras` (
  `idCarrito_de_compras` INT NOT NULL,
  `Cantidad` SMALLINT NOT NULL,
  PRIMARY KEY (`idCarrito_de_compras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Productos_de_Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Productos_de_Catalogo` (
  `idProducto` INT NOT NULL,
  `Linea_d_ Catalogo_idLinea_d_ Producto` SMALLINT NOT NULL,
  `Carrito_de_compras_idCarrito_de_compras` INT NOT NULL,
  `Producto` INT NOT NULL,
  `Existenci` VARCHAR(45) NOT NULL DEFAULT 0,
  `Valor_Unitario_venta` VARCHAR(45) NOT NULL,
  `Valor_unitario_compra` FLOAT NOT NULL,
  `Valor_Total` FLOAT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Catalogo_Inventario_Linea_d_ Catalogo1_idx` (`Linea_d_ Catalogo_idLinea_d_ Producto` ASC) VISIBLE,
  INDEX `fk_Catalogo_Inventario_Carrito_de_compras1_idx` (`Carrito_de_compras_idCarrito_de_compras` ASC) VISIBLE,
  CONSTRAINT `fk_Catalogo_Inventario_Linea_d_ Catalogo1`
    FOREIGN KEY (`Linea_d_ Catalogo_idLinea_d_ Producto`)
    REFERENCES `BarberShop`.`Linea_d_ Catalogo` (`idLinea_d_ Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catalogo_Inventario_Carrito_de_compras1`
    FOREIGN KEY (`Carrito_de_compras_idCarrito_de_compras`)
    REFERENCES `BarberShop`.`Carrito_de_compras` (`idCarrito_de_compras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Citas` (
  `idCitas` INT NOT NULL,
  `fecha_servicio` DATE NOT NULL,
  `Hora_Servicio` TIME NOT NULL,
  PRIMARY KEY (`idCitas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Administrador_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Administrador_empleado` (
  `idAdministrador` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `idFactura` BIGINT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdministrador`, `Usuario_idUsuario`),
  INDEX `fk_Administrador_empleado_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Administrador_empleado_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `BarberShop`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Servicio` (
  `idServicio` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Servicio_has_Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Servicio_has_Citas` (
  `idServicio_de_citas` VARCHAR(45) NOT NULL,
  `Servicio_idServicio` INT NOT NULL,
  `Citas_idCitas` INT NOT NULL,
  PRIMARY KEY (`idServicio_de_citas`, `Servicio_idServicio`, `Citas_idCitas`),
  INDEX `fk_Servicio_has_Citas_Citas1_idx` (`Citas_idCitas` ASC) VISIBLE,
  INDEX `fk_Servicio_has_Citas_Servicio1_idx` (`Servicio_idServicio` ASC) VISIBLE,
  CONSTRAINT `fk_Servicio_has_Citas_Servicio1`
    FOREIGN KEY (`Servicio_idServicio`)
    REFERENCES `BarberShop`.`Servicio` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_has_Citas_Citas1`
    FOREIGN KEY (`Citas_idCitas`)
    REFERENCES `BarberShop`.`Citas` (`idCitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Informacion_del_envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Informacion_del_envio` (
  `idInformacion_del_envio` INT NOT NULL,
  `Tipo_de_envio` VARCHAR(45) NOT NULL,
  `Costo_de_envio` VARCHAR(45) NOT NULL,
  `Codigo_postal` VARCHAR(45) NULL,
  PRIMARY KEY (`idInformacion_del_envio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Contacto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Proveedor_has_Productos_de_Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Proveedor_has_Productos_de_Catalogo` (
  `Proveedor_idProveedor` INT NOT NULL,
  `Productos_de_Catalogo_idProducto` INT NOT NULL,
  PRIMARY KEY (`Proveedor_idProveedor`, `Productos_de_Catalogo_idProducto`),
  INDEX `fk_Proveedor_has_Productos_de_Catalogo_Productos_de_Catalog_idx` (`Productos_de_Catalogo_idProducto` ASC) VISIBLE,
  INDEX `fk_Proveedor_has_Productos_de_Catalogo_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_has_Productos_de_Catalogo_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `BarberShop`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_has_Productos_de_Catalogo_Productos_de_Catalogo1`
    FOREIGN KEY (`Productos_de_Catalogo_idProducto`)
    REFERENCES `BarberShop`.`Productos_de_Catalogo` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Galeria_Trabajos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Galeria_Trabajos` (
  `idGaleria_Trabajos` INT NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Servicio_idServicio` INT NOT NULL,
  `Productos_de_Catalogo_idProducto` INT NOT NULL,
  PRIMARY KEY (`idGaleria_Trabajos`),
  INDEX `fk_Galeria_Trabajos_Servicio1_idx` (`Servicio_idServicio` ASC) VISIBLE,
  INDEX `fk_Galeria_Trabajos_Productos_de_Catalogo1_idx` (`Productos_de_Catalogo_idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Galeria_Trabajos_Servicio1`
    FOREIGN KEY (`Servicio_idServicio`)
    REFERENCES `BarberShop`.`Servicio` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Galeria_Trabajos_Productos_de_Catalogo1`
    FOREIGN KEY (`Productos_de_Catalogo_idProducto`)
    REFERENCES `BarberShop`.`Productos_de_Catalogo` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Foto` (
  `idFoto` INT NOT NULL,
  `Galeria_Trabajos_idGaleria_Trabajos` INT NOT NULL,
  `url` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idFoto`),
  INDEX `fk_Foto_Galeria_Trabajos1_idx` (`Galeria_Trabajos_idGaleria_Trabajos` ASC) VISIBLE,
  CONSTRAINT `fk_Foto_Galeria_Trabajos1`
    FOREIGN KEY (`Galeria_Trabajos_idGaleria_Trabajos`)
    REFERENCES `BarberShop`.`Galeria_Trabajos` (`idGaleria_Trabajos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Factura` (
  `idFactura` BIGINT NOT NULL,
  `Fecha_y_hora` DATETIME NOT NULL,
  `Subtotal` FLOAT NOT NULL,
  `Tasa_impuesto` FLOAT NOT NULL,
  `Facturacol` VARCHAR(45) NULL,
  `Administrador_empleado_idAdministrador` INT NOT NULL,
  `Administrador_empleado_Usuario_idUsuario` INT NOT NULL,
  `Forma_de_Pago_idForma_de_Pago` TINYINT NOT NULL,
  PRIMARY KEY (`idFactura`, `Forma_de_Pago_idForma_de_Pago`),
  INDEX `fk_Factura_Administrador_empleado1_idx` (`Administrador_empleado_idAdministrador` ASC, `Administrador_empleado_Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Factura_Forma_de_Pago1_idx` (`Forma_de_Pago_idForma_de_Pago` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Administrador_empleado1`
    FOREIGN KEY (`Administrador_empleado_idAdministrador` , `Administrador_empleado_Usuario_idUsuario`)
    REFERENCES `BarberShop`.`Administrador_empleado` (`idAdministrador` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Forma_de_Pago1`
    FOREIGN KEY (`Forma_de_Pago_idForma_de_Pago`)
    REFERENCES `BarberShop`.`Forma_de_Pago` (`idForma_de_Pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Factura_has_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Factura_has_Cliente` (
  `Factura_idFactura` BIGINT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`Factura_idFactura`, `Cliente_idCliente`, `Cliente_Usuario_idUsuario`),
  INDEX `fk_Factura_has_Cliente_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Factura_has_Cliente_Factura1_idx` (`Factura_idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_has_Cliente_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `BarberShop`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Usuario_idUsuario`)
    REFERENCES `BarberShop`.`Cliente` (`idCliente` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Factura_has_Servicio_has_Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Factura_has_Servicio_has_Citas` (
  `Factura_idFactura` BIGINT NOT NULL,
  `Factura_Forma_de_Pago_idForma_de_Pago` TINYINT NOT NULL,
  `Servicio_has_Citas_idServicio_de_citas` VARCHAR(45) NOT NULL,
  `Servicio_has_Citas_Servicio_idServicio` INT NOT NULL,
  `Servicio_has_Citas_Citas_idCitas` INT NOT NULL,
  PRIMARY KEY (`Factura_idFactura`, `Factura_Forma_de_Pago_idForma_de_Pago`, `Servicio_has_Citas_idServicio_de_citas`, `Servicio_has_Citas_Servicio_idServicio`, `Servicio_has_Citas_Citas_idCitas`),
  INDEX `fk_Factura_has_Servicio_has_Citas_Servicio_has_Citas1_idx` (`Servicio_has_Citas_idServicio_de_citas` ASC, `Servicio_has_Citas_Servicio_idServicio` ASC, `Servicio_has_Citas_Citas_idCitas` ASC) VISIBLE,
  INDEX `fk_Factura_has_Servicio_has_Citas_Factura1_idx` (`Factura_idFactura` ASC, `Factura_Forma_de_Pago_idForma_de_Pago` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_has_Servicio_has_Citas_Factura1`
    FOREIGN KEY (`Factura_idFactura` , `Factura_Forma_de_Pago_idForma_de_Pago`)
    REFERENCES `BarberShop`.`Factura` (`idFactura` , `Forma_de_Pago_idForma_de_Pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Servicio_has_Citas_Servicio_has_Citas1`
    FOREIGN KEY (`Servicio_has_Citas_idServicio_de_citas` , `Servicio_has_Citas_Servicio_idServicio` , `Servicio_has_Citas_Citas_idCitas`)
    REFERENCES `BarberShop`.`Servicio_has_Citas` (`idServicio_de_citas` , `Servicio_idServicio` , `Citas_idCitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BarberShop`.`Factura_has_Productos_de_Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BarberShop`.`Factura_has_Productos_de_Catalogo` (
  `Factura_idFactura` BIGINT NOT NULL,
  `Factura_Forma_de_Pago_idForma_de_Pago` TINYINT NOT NULL,
  `Productos_de_Catalogo_idProducto` INT NOT NULL,
  `Valor_unitario` FLOAT NOT NULL,
  `Informacion_del_envio_idInformacion_del_envio` INT NOT NULL,
  PRIMARY KEY (`Factura_idFactura`, `Factura_Forma_de_Pago_idForma_de_Pago`, `Productos_de_Catalogo_idProducto`),
  INDEX `fk_Factura_has_Productos_de_Catalogo_Productos_de_Catalogo1_idx` (`Productos_de_Catalogo_idProducto` ASC) VISIBLE,
  INDEX `fk_Factura_has_Productos_de_Catalogo_Factura1_idx` (`Factura_idFactura` ASC, `Factura_Forma_de_Pago_idForma_de_Pago` ASC) VISIBLE,
  INDEX `fk_Factura_has_Productos_de_Catalogo_Informacion_del_envio1_idx` (`Informacion_del_envio_idInformacion_del_envio` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_has_Productos_de_Catalogo_Factura1`
    FOREIGN KEY (`Factura_idFactura` , `Factura_Forma_de_Pago_idForma_de_Pago`)
    REFERENCES `BarberShop`.`Factura` (`idFactura` , `Forma_de_Pago_idForma_de_Pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Productos_de_Catalogo_Productos_de_Catalogo1`
    FOREIGN KEY (`Productos_de_Catalogo_idProducto`)
    REFERENCES `BarberShop`.`Productos_de_Catalogo` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Productos_de_Catalogo_Informacion_del_envio1`
    FOREIGN KEY (`Informacion_del_envio_idInformacion_del_envio`)
    REFERENCES `BarberShop`.`Informacion_del_envio` (`idInformacion_del_envio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

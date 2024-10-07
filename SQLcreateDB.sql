CREATE SCHEMA IF NOT EXISTS `sistema_ganadero`;
USE `sistema_ganadero`;

CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuil` VARCHAR(11) NOT NULL UNIQUE,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `activo` BOOLEAN NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `rol_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
);

CREATE TABLE IF NOT EXISTS `establecimientos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL UNIQUE,
  `cantidad_hectareas` INT,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `potreros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `establecimiento_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
);

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL UNIQUE,
  `descripcion` VARCHAR(255),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `subcategorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `categoria_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `movimientos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `establecimiento_id` INT NOT NULL,
  `subcategoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`),
  FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`)
);

CREATE TABLE IF NOT EXISTS `compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `origen` VARCHAR(100),
  `peso` DECIMAL(10,2),
  `numero_dte` VARCHAR(50),
  `numero_trazabilidad` VARCHAR(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
);

CREATE TABLE IF NOT EXISTS `pariciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `descripcion` VARCHAR(255),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
);

CREATE TABLE IF NOT EXISTS `pases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `subcategoria_id_origen` INT,
  `subcategoria_id_destino` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`),
  FOREIGN KEY (`subcategoria_id_origen`) REFERENCES `subcategorias` (`id`),
  FOREIGN KEY (`subcategoria_id_destino`) REFERENCES `subcategorias` (`id`)
);

CREATE TABLE IF NOT EXISTS `diferenciaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `descripcion` VARCHAR(255),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
);

CREATE TABLE IF NOT EXISTS `ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `destino` VARCHAR(100),
  `peso` DECIMAL(10,2),
  `numero_dte` VARCHAR(50),
  `numero_trazabilidad` VARCHAR(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
);

CREATE TABLE IF NOT EXISTS `mortandades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `causa` VARCHAR(255),
  `numero_trazabilidad` VARCHAR(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
);


CREATE TABLE IF NOT EXISTS `consumos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movimiento_id` INT UNIQUE,
  `descripcion` VARCHAR(255),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
);

CREATE TABLE IF NOT EXISTS `usuarios_establecimientos` (
  `usuario_id` INT,
  `establecimiento_id` INT,
  PRIMARY KEY (`usuario_id`, `establecimiento_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
);



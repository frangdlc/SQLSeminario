USE `sistema_ganadero`;

INSERT INTO `roles` (nombre) VALUES ('Dueño'), ('Administrador');

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id)
VALUES ('20123456782', 'francisco@gmail.com', 'contrasenia12345', TRUE, 'M', 'Francisco', 'de la Cruz', '1991-05-30', 1);

INSERT INTO `establecimientos` (nombre, cantidad_hectareas) VALUES ('La Grande del Sud', 6000);

INSERT INTO `categorias` (nombre, descripcion) VALUES ('Toros', 'Categoría de toros necesarios');

INSERT INTO `subcategorias` (nombre, categoria_id) VALUES ('servicio', 1), ('venta', 1), ('toritos', 1);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (10, '2024-10-06', 1, 1);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (5, '2024-10-06', 1, 3);

INSERT INTO `compras` (movimiento_id, origen, peso, numero_dte, numero_trazabilidad)
VALUES (1, 'Cabaña chica SRL', 600.00, 'DTE123456', 'TRAZ123456');

INSERT INTO `compras` (movimiento_id, origen, peso, numero_dte, numero_trazabilidad)
VALUES (2, 'Don Roque', 300.00, 'DTE123455', 'TRAZ123466');

SELECT 
    m.id AS identificador_movimiento,
    e.nombre AS establecimiento,
    s.nombre AS subcategoria,
    c.nombre AS categoria,
    com.origen AS origen,
    com.peso AS peso,
    com.numero_dte AS numero_dte,
    com.numero_trazabilidad AS numero_trazabilidad
FROM 
    movimientos m
JOIN establecimientos e ON m.establecimiento_id = e.id JOIN subcategorias s ON m.subcategoria_id = s.id
JOIN categorias c ON s.categoria_id = c.id LEFT JOIN compras com ON m.id = com.movimiento_id
WHERE m.id = 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM `compras`;
DELETE FROM `movimientos`;
DELETE FROM `subcategorias`;
DELETE FROM `categorias`;
DELETE FROM `usuarios_establecimientos`;
DELETE FROM `establecimientos`;
DELETE FROM `usuarios`;
DELETE FROM `roles`;

SET SQL_SAFE_UPDATES = 1;
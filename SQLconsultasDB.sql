USE `sistema_ganadero`;

INSERT INTO `roles` (nombre) VALUES ('Dueño'), ('Administrador');

/* INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id)
VALUES ('20123456782', 'francisco@gmail.com', 'contrasenia12345', TRUE, 'M', 'Francisco', 'de la Cruz', '1991-05-30', 1); */

-- 3 dueños
INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20123456789', 'duenio1@example.com', '1234', TRUE, 'M', 'Juan', 'Pérez', '1985-03-15', 1);

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20123456788', 'duenio2@example.com', '5678', TRUE, 'F', 'Ana', 'Gomez', '1990-07-22', 1);

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20123456787', 'duenio3@example.com', '9101', TRUE, 'M', 'Carlos', 'Ramirez', '1988-11-30', 1);

-- 5 administradores
INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20876543219', 'admin1@example.com', '4321', TRUE, 'M', 'Jose', 'Lopez', '1982-01-10', 2);

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20876543218', 'admin2@example.com', '5678', TRUE, 'F', 'Maria', 'Fernandez', '1995-05-25', 2);

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20876543217', 'admin3@example.com', '6789', TRUE, 'M', 'Luis', 'Martinez', '1992-09-12', 2);

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20876543216', 'admin4@example.com', '7890', TRUE, 'F', 'Laura','Rodriguez', '1987-04-18', 2);

INSERT INTO `usuarios` (cuil, email, password, activo, sexo, nombre, apellido, fecha_nacimiento, rol_id) 
VALUES ('20876543215', 'admin5@example.com', '8901', TRUE, 'M', 'Pedro','Gonzalez', '1983-12-05', 2);

INSERT INTO `establecimientos` (nombre, cantidad_hectareas) VALUES ('La Grande del Sud', 1000);
INSERT INTO `establecimientos` (nombre, cantidad_hectareas) VALUES ('Los Pirulos', 300);

INSERT INTO `usuarios_establecimientos` (usuario_id, establecimiento_id) VALUES 
(1, 1),  
(2, 2), 
(3, 2),
(4, 1), 
(5, 1),  
(6, 2),  
(7, 2),  
(8, 2), 
(8, 1); 

/* INSERT INTO `categorias` (nombre, descripcion) VALUES ('Toros', 'Categoría de toros necesarios');

INSERT INTO `subcategorias` (nombre, categoria_id) VALUES ('servicio', 1), ('venta', 1), ('toritos', 1);

INSERT INTO `categorias` (nombre, descripcion) VALUES ('Vacas', 'Categoría de toros necesarios');

INSERT INTO `subcategorias` (nombre, categoria_id) VALUES ('servicio', 1), ('venta', 1), ('toritos', 1); */

-- Insertar categorías
INSERT INTO `categorias` (nombre, descripcion) VALUES 
('Toros', 'Se incluyen aquellos en servicio, para la venta y los toritos de 1 a 2 años.'),
('Vacas', 'Divididas en vacas en venta, de cría, en cría del último ternero, vacías en 2° servicio y en venta.'),
('Vaquillas', 'Se distinguen aquellas de crías y las de venta.'),
('Vaquillitas', 'Clasificadas según su edad (1 a 2 años) o venta.'),
('Novillitos', 'Clasificados por edad (1 a 2 años).'),
('Novillos', 'Clasificados por edad (más de 2 años).'),
('Terneros machos MARCADOS', 'Diferenciados en castrados o enteros.'),
('Terneras hembras', 'Clasificadas como hembras.');

-- Insertar subcategorías
-- Asumiendo que las categorías se insertan en el orden dado, asignaremos los IDs correspondientes.
INSERT INTO `subcategorias` (nombre, categoria_id) VALUES 
('Servicio', 1),
('Venta', 1),
('Toritos', 1),
('Venta', 2),
('Cría', 2),
('Cría del último ternero', 2),
('Vacías en 2° servicio', 2),
('Cría', 3),
('Venta', 3),
('1 a 2 años', 4),
('Venta', 4),
('1 a 2 años', 5),
('Más de 2 años', 6),
('Machos castrados', 7),
('Machos enteros', 7),
('Hembras', 8);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (10, '2024-01-01', 1, 1);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (15, '2024-02-01', 1, 3);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (8, '2024-03-15', 1, 6);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (28, '2024-04-10', 1, 1);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (19, '2024-01-11', 2, 3);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (24, '2022-05-19', 2, 7);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (1, '2023-12-19', 2, 12);

INSERT INTO `movimientos` (cantidad, fecha, establecimiento_id, subcategoria_id)
VALUES (15, '2024-04-10', 2, 13);

/* INSERT INTO `mortandades` (movimiento_id, causa, numero_trazabilidad)
VALUES (1, 600.00, 'DTE123456', 'TRAZ123456');

INSERT INTO `mortandades` (movimiento_id, origen, peso, numero_dte, numero_trazabilidad)
VALUES (2, 'Don Roque', 300.00, 'DTE123455', 'TRAZ123466'); */

INSERT INTO `mortandades` (movimiento_id, causa, numero_trazabilidad) VALUES 
(1, 'enfermedad', 'TRAZ123456'),  
(2, 'accidente', 'TRAZ123457'),    
(3, 'fuego', 'TRAZ123458'),      
(4, 'rayo', 'TRAZ123459'),       
(5, 'enfermedad', 'TRAZ123460'),   
(6, 'accidente', 'TRAZ123461'),     
(7, 'fuego', 'TRAZ123462'),         
(8, 'rayo', 'TRAZ123463');        

/*SELECT 
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
 */
 /* -------------- Limpiar todo lo agregado por defecto ------------
SET SQL_SAFE_UPDATES = 0;

DELETE FROM `mortandades`;
DELETE FROM `movimientos`;
DELETE FROM `subcategorias`;
DELETE FROM `categorias`;
DELETE FROM `usuarios_establecimientos`;
DELETE FROM `establecimientos`;
DELETE FROM `usuarios`;
DELETE FROM `roles`;

SET SQL_SAFE_UPDATES = 1; */
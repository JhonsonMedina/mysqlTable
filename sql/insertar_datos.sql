-- Insertar datos de ejemplo

INSERT INTO Productos (nombre, descripcion, precio, cantidad_inventario) VALUES
('Teclado Mecánico', 'Teclado mecánico con retroiluminación', 59.99, 50),
('Mouse Óptico', 'Mouse con sensor óptico de alta precisión', 25.50, 100),
('Monitor 24"', 'Monitor Full HD 24 pulgadas', 150.00, 30);

INSERT INTO Proveedores (nombre, direccion, telefono, email) VALUES
('Proveedor Uno', 'Av. Principal 123', '555-1010', 'contacto1@proveedores.com'),
('Proveedor Dos', 'Calle Secundaria 456', '555-2020', 'contacto2@proveedores.com');

BEGIN;
INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('compra', '2025-07-15', 20, 1, 1);
UPDATE Productos SET cantidad_inventario = cantidad_inventario + 20 WHERE id_producto = 1;

INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('compra', '2025-07-16', 50, 2, 2);
UPDATE Productos SET cantidad_inventario = cantidad_inventario + 50 WHERE id_producto = 2;

COMMIT;

BEGIN;
INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('venta', '2025-07-20', 5, 1, NULL);
UPDATE Productos SET cantidad_inventario = cantidad_inventario - 5 WHERE id_producto = 1;

INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('venta', '2025-07-21', 10, 2, NULL);
UPDATE Productos SET cantidad_inventario = cantidad_inventario - 10 WHERE id_producto = 2;

COMMIT;

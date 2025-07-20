-- Crear tablas de ejemplo para gestión de inventario

CREATE TABLE IF NOT EXISTS Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    cantidad_inventario INT NOT NULL CHECK (cantidad_inventario >= 0)
);

CREATE TABLE IF NOT EXISTS Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('compra', 'venta') NOT NULL,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    id_producto INT,
    id_proveedor INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

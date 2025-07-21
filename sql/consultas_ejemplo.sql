-- Consultas básicas

-- Mostrar todos los productos
SELECT * FROM Productos;

-- Pedidos de un cliente específico (ejemplo)
-- Supón que tienes una tabla Clientes y Pedidos, si aún no la tienes, crea una similar
-- Aquí solo un ejemplo simple
-- SELECT * FROM Pedidos WHERE id_cliente = 1;

-- Total de productos vendidos
SELECT SUM(cantidad) AS TotalVendidos
FROM Transacciones
WHERE tipo = 'venta';

-- Total de compras
SELECT SUM(cantidad * p.precio) AS ValorTotalCompras
FROM Transacciones t
JOIN Productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'compra';

-- Total de ventas en el mes pasado
SELECT SUM(t.cantidad) AS TotalVentasMesPasado
FROM Transacciones t
WHERE t.tipo = 'venta'
  AND t.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Productos no vendidos en un período
SELECT p.*
FROM Productos p
WHERE p.id_producto NOT IN (
    SELECT t.id_producto
    FROM Transacciones t
    WHERE t.tipo = 'venta'
      AND t.fecha BETWEEN '2025-06-01' AND '2025-06-30'
);

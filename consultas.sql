-- ACTIVIDAD: CONSULTAS SQL - TECHSTORE
-- Estudiante: Juan David Lemus Rodriguez
-- Base de datos: TechStore

-- NIVEL 1: BASICO

-- Ejercicio 1: Productos ordenados por precio
SELECT *
FROM productos
ORDER BY precio_venta DESC;

-- Ejercicio 2: Cantidad de clientes por estado
SELECT estado, COUNT(*) AS cantidad_clientes
FROM clientes
GROUP BY estado;

-- Ejercicio 3: Empleados ordenados por salario
SELECT *
FROM empleados
ORDER BY salario DESC;

-- Ejercicio 4: Productos con menor stock
SELECT *
FROM productos
ORDER BY stock ASC
LIMIT 10;

-- Ejercicio 5: Pedidos ordenados por fecha
SELECT *
FROM pedidos
ORDER BY fecha_pedido DESC;

-- NIVEL 2: INTERMEDIO

-- Ejercicio 6: Ventas por método de pago
SELECT metodo_pago, SUM(total) AS total_ventas
FROM pedidos
GROUP BY metodo_pago;

-- Ejercicio 7: Productos por categoría
SELECT categoria_id, COUNT(*) AS cantidad_productos
FROM productos
GROUP BY categoria_id;

-- Ejercicio 8: Promedio del valor de los pedidos
SELECT AVG(total) AS promedio_pedidos
FROM pedidos;

-- Ejercicio 9: Cantidad de pedidos por cliente
SELECT cliente_id, COUNT(*) AS cantidad_pedidos
FROM pedidos
GROUP BY cliente_id;

-- Ejercicio 10: Total de ventas por estado del pedido
SELECT estado, SUM(total) AS total_ventas
FROM pedidos
GROUP BY estado;

-- NIVEL 3: AVANZADO

-- Ejercicio 11: Productos más vendidos
SELECT producto_id, SUM(cantidad) AS unidades_vendidas
FROM detalle_pedidos
GROUP BY producto_id
ORDER BY unidades_vendidas DESC;

-- Ejercicio 12: Clientes con más compras
SELECT cliente_id, COUNT(*) AS cantidad_compras
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(*) > 3;

-- Ejercicio 13: Ventas mensuales
SELECT DATE_TRUNC('month', fecha_pedido) AS mes,
       SUM(total) AS ventas
FROM pedidos
GROUP BY DATE_TRUNC('month', fecha_pedido)
ORDER BY mes;

-- Ejercicio 14: Empleados con mayor cantidad de pedidos
SELECT empleado_id, COUNT(*) AS pedidos_atendidos
FROM pedidos
GROUP BY empleado_id
ORDER BY pedidos_atendidos DESC;

-- Ejercicio 15: Valor total vendido por cliente
SELECT c.cliente_id, c.nombre,
       SUM(p.total) AS total_comprado
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre
ORDER BY total_comprado DESC;

/* 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto). */

CREATE TABLE IF NOT EXISTS Clientes (
    id INT,
    nombre VARCHAR(255))


/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes". */

INSERT into public.clientes
(id,nombre)
Values (1, 'John')


/* 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes". */

UPDATE public.clientes
set nombre ='John Doe'
where id=1

/* 4. Elimina el cliente con id=1 de la tabla "Clientes". */

DELETE FROM public.clientes
where id=1

/* 5. Lee todos los clientes de la tabla "Clientes". */

SELECT * from public.clientes

/* 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero). */

/*La tabla pedidos ya existe por lo que le pongo PEDIDOS2*/

CREATE TABLE IF NOT EXISTs pedidos2
(id int, cliente_id int)

/* 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos". */

INSERT into pedidos2
(id, cliente_id)
Values (1,1)


/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos". */

UPDATE public.pedidos2
SET cliente_id = 2
where cliente_id=1

/* 9. Elimina el pedido con id=1 de la tabla "Pedidos". */

DELETE FROM public.pedidos2
where ID =1


/* 10. Lee todos los pedidos de la tabla "Pedidos". */

SELECT * from public.pedidos2

/* 11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto). */

CREATE TABLE IF NOT EXISTs Productos2
(id int, Nombre varchar (255))

/* 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos". */

INSERT into public.productos2
(id,nombre)
VALUES (1,'Camisa')

/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos". */

UPDATE public.productos2
SET nombre = 'Pantalon'
Where ID= 1

/* 14. Elimina el producto con id=1 de la tabla "Productos". */

DELETE FROM public.productos2
where id =1

/* 15. Lee todos los productos de la tabla "Productos". */

SELECT * from public.productos2

/* 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero). */

CREATE TABLE IF NOT EXISTS DetallesPedido
(pedido_id int, producto_id int)

/* 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido". */
INSERT INTO Public.detallespedido
(pedido_id,producto_id)
VALUES (1,1)

/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido". */

UPDATE public.detallespedido
set producto_id=2
Where pedido_id=1

/* 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido". */

DELETE from public.detallespedido
where pedido_id=1

/* 20. Lee todos los detalles de pedido de la tabla "DetallesPedido". */

select * from public.detallespedido

/* 21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join. */

SELECT
    public.clientes.id AS cliente_id,
    public.clientes.nombre AS nombre_cliente,
    public.pedidos2.id AS pedido_id
FROM public.clientes
INNER JOIN
    public.pedidos2 ON public.clientes.id = public.pedidos2.cliente_id


/* 22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join. */

SELECT
    public.clientes.id AS cliente_id,
    public.clientes.nombre AS nombre_cliente,
    public.pedidos2.id AS pedido_id
FROM public.clientes
left join
    public.pedidos2 ON public.clientes.id = public.pedidos2.cliente_id

/* 23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join. */

SELECT
    public.productos2.id AS producto_id,
    public.productos2.nombre AS nombre_producto,
    public.detallespedido.pedido_id
FROM
    public.productos2
INNER JOIN
    public.detallespedido ON public.productos2.id = public.detallespedido.producto_id


/* 24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join. */

SELECT
    public.productos.id AS producto_id,
    public.productos.nombre AS nombre_producto,
    public.detallespedido.pedido_id
FROM public.productos
LEFT JOIN
    public.detallespedido ON public.productos.id = public.detallespedido.producto_id


/* 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes". */

ALTER TABLE public.clientes
ADD COLUMN telefono VARCHAR(255)

/* 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero. */

ALTER TABLE public.clientes
ALTER COLUMN telefono TYPE INTEGER USING telefono::INTEGER


/* 27. Elimina la columna "telefono" de la tabla "Clientes". */

ALTER TABLE public.clientes
DROP COLUMN telefono

/* 28. Cambia el nombre de la tabla "Clientes" a "Usuarios". */

ALTER TABLE public.clientes
RENAME TO usuarios2

/* 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo". */

ALTER TABLE public.usuarios2
RENAME Column Nombre TO nombre_completo

/* 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios". */

ALTER TABLE public.usuarios2
ADD PRIMARY KEY (id)

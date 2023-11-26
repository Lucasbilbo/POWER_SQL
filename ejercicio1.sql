/*1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).*/

CREATE TABLE IF NOT EXISTS clientes
	( id SERIAL PRIMARY KEY,
	 Nombre Varchar(255),
	 Email Varchar (255)
	)

/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/

INSERT INTO public.clientes 
	(id, nombre, email)
	VALUES (1, 'Juan', 'juan@example.com');


/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */

UPDATE public.clientes
SET email= 'juan@gmail.com'
Where ID=1

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes". */

DELETE FROM PUBLIC.CLIENTES
WHERE ID =1

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero). */

CREATE TABLE IF NOT EXISTS pedidos
	(ID SERIAL PRIMARY KEY,
	cliente_id INT,
	producto VARCHAR (255),
	cantidad INT,
	foreign key (cliente_id) REFERENCES public.clientes
	(id))

/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/

INSERT INTO public.pedidos
	(id,cliente_id,Producto, Cantidad)
	VALUES(1,1,'Camiseta',2)


/*7. Actualizar la cantidad del pedido con id=1 a 3.*/

UPDATE public.pedidos
SET cantidad = 3
Where ID=1

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

DELETE from public.pedidos
where id=1

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal). */

CREATE TABLE IF NOT EXISTS public.productos
	(ID SERIAL PRIMARY KEY,
	 Nombre VARCHAR(255),
	 Precio DECIMAL)


/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */

INSERT into public.productos
	(id,nombre,Precio)
	VALUES 
	(1,'Televisón',300),
	(2,'Radio',50),
	(3,'Monitor',50),
	(4,'Ordenador',500)

/* 11. Consultar todos los clientes de la tabla "Clientes". */

SELECT * from public.clientes

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */

SELECT p.id, c.nombre AS nombre_cliente, p.producto, p.cantidad
FROM public.pedidos p
JOIN public.clientes c ON p.cliente_id = c.id;


/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

SELECT * from public.productos
WHERE PRECIO >50

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/

SELECT * from public.pedidos
WHERE cantidad >=5

/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */

SELECT * from public.clientes 
WHERE nombre ILIKE 'a%'

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/


SELECT c.nombre, COUNT(p.id) AS total_pedidos
FROM public.clientes c
LEFT JOIN public.pedidos p ON c.id = p.cliente_id
GROUP BY c.id;


/*  17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */

SELECT p.producto, SUM(p.cantidad) AS cantidad_total
FROM public.pedidos p
GROUP BY p.producto;


/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

ALTER TABLE public.pedidos
add column fecha Date

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */

ALTER TABLE public.pedidos
ADD CONSTRAINT fk_producto
FOREIGN KEY (ID) REFERENCES public.productos(id);

/* 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/

SELECT 
    public.clientes.nombre AS nombre_cliente,
    public.pedidos.producto AS producto,
    public.pedidos.cantidad AS cantidad
FROM public.clientes
JOIN public.pedidos ON public.clientes.id = public.pedidos.cliente_id
JOIN  public.productos ON public.pedidos.ID = public.productos.id;

/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */

CREATE TABLE IF NOT EXISTS Pedidos
	(id int primary key,
	id_usuario INT,
    id_producto INT,
	foreign key (id_usuario) REFERENCES public.usuarios (id) ,
	foreign key (id_producto) REFERENCES public.productos (id))
	

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */

INSERT INTO public.pedidos
  (id,id_usuario, id_producto) 
  VALUES
    (1,1, 1),
    (2,2, 3),
	(3,3, 4),
	(4,3, 3)


/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */

SELECT 
    Usuarios.nombre AS nombre_usuario,
    COALESCE(Productos.nombre, 'Ningún pedido') AS nombre_producto
	FROM public.Usuarios
LEFT JOIN 
    public.Pedidos ON Usuarios.id = Pedidos.id_usuario
LEFT JOIN 
    public.Productos ON Pedidos.id_producto = Productos.id;


/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN). */

SELECT Usuarios.nombre AS nombre_usuario
FROM public.Usuarios
LEFT JOIN 
    public.Pedidos ON Usuarios.id = Pedidos.id_usuario
WHERE Pedidos.id_usuario IS NOT NULL OR Pedidos.id_usuario IS NULL;


/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE public.Pedidos
ADD COLUMN cantidad INT;

UPDATE public.Pedidos
SET cantidad = 
    CASE 
        WHEN id = 1 THEN 2
        WHEN id = 2 THEN 3
        WHEN id = 3 THEN 1
	ELSE 0 End

    
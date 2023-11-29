
/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS Productos
	(id int primary key,
	 nombre varchar(255),
	 precio numeric)


/* 2. Inserta al menos cinco registros en la tabla "Productos".*/

INSERT INTO public.productos 
	(id,nombre,precio)
	Values
	(1,'ordenador',600),
	(2,'radio',40),
	(3,'television',300),
	(4,'enchufe',30),
	(5,'caset',30),
	(6,'teclado',100),
	(7,'raton',90),
	(8,'alfombra',35),
	(9,'pantalla',400)


/* 3. Actualiza el precio de un producto en la tabla "Productos".*/

UPDATE public.productos 
set precio =450
where id=3


/* 4. Elimina un producto de la tabla "Productos".*/

DELETE  from public.productos 
where id=8


/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/


/*para tener una tabla compras y relacionarla la creo antes*/

CREATE TABLE public.Compras (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    producto_id INT,
    FOREIGN KEY (usuario_id) REFERENCES public.Usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES public.Productos(id))

/*inserto algun dato*/

INSERT INTO public.Compras (usuario_id, producto_id) VALUES
    (1, 1),
    (2, 3)


/*Resuelvo el paso 5 */
SELECT 
    public.Usuarios.nombre AS nombre_usuario,
    public.Productos.nombre AS nombre_producto
FROM public.Usuarios
INNER JOIN 
    public.Compras ON public.Usuarios.id = public.Compras.usuario_id
INNER JOIN 
    public.Productos ON public.Compras.producto_id = public.Productos.id;

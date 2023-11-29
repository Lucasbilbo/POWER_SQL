/* Nivel de dificultad: Fácil*/

/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/

CREATE DATABASE "MiBaseDeDatos"

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */

CREATE TABLE IF NOT EXISTS "Usuarios"
(id INT primary key, nombre varchar(255), edad int)

/* 3. Inserta dos registros en la tabla "Usuarios". */

Insert into public.usuarios
	(id, nombre, edad)
Values (1,'Mario',56),
	(2,'Marisa',57),
	(3,'Lucas', 24),
	(4,'Telmo', 22)


/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */

Update public.usuarios
SET edad =25
Where id = 3
	
	
/* 5. Elimina un usuario de la tabla "Usuarios". */

Delete from public.usuarios
	Where id = 4
	
	
/* Nivel de dificultad: Moderado*/

/* 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE IF NOT EXISTS Ciudades
	(id INT Primary key ,
	 nombre varchar(255),
	 pais varchar (255))
	
/* 2. Inserta al menos tres registros en la tabla "Ciudades".*/

INSERT INTO public.ciudades
	(id,nombre,pais)
Values
	(1,'Bilbao','España'),
	(2,'buenos aires','Argentina'),
	(3,'havana','Cuba'),
	(4,'madrid','España')



/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/

ALTER TABLE Usuarios
ADD COLUMN ciudad_id INT;

ALTER TABLE Usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id);


/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/

SELECT 
    public.Usuarios.nombre AS nombre_usuario,
    public.Ciudades.nombre AS nombre_ciudad,
    public.Ciudades.pais
FROM public.Usuarios
LEFT JOIN 
    public.Ciudades ON public.Usuarios.ciudad_id = public.Ciudades.id;



/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/

SELECT 
    public.Usuarios.nombre AS nombre_usuario,
    public.Ciudades.nombre AS nombre_ciudad,
    public.Ciudades.pais
FROM public.Usuarios
INNER JOIN 
    public.Ciudades ON public.Usuarios.ciudad_id = public.Ciudades.id;


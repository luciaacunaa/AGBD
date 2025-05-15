/*Ejercicio 1*/
/*Nombre y Apellido de todos los empleados, en orden alfabético.*/
SELECT FirstName, LastName FROM employees
ORDER BY  LastName ASC

/*Ejercicio 2*/
/*Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto.*/
SELECT Title, t.name, t.Milliseconds FROM tracks t
INNER JOIN albums a ON t.AlbumId = t.AlbumId 
WHERE Title like "Big Ones"
ORDER BY Milliseconds ASC

/*Ejercicio 3*/
/*Nombre de todos los géneros con la cantidad de canciones de cada uno*/
SELECT g.Name, COUNT(t.TrackId) AS "Cantidad de canciones"
FROM  genres g
INNER JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY  "Cantidad de canciones" DESC;

/*Ejercicio 4*/
/*Nombre de los discos con al menos 5 canciones.*/
SELECT a.Title, count(t.TrackId)
FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId, a.Title
HAVING COUNT(t.TrackId) >= 5;

/*Ejercicio 5*/
/*Nombre y precio total de los 10 discos más baratos.*/
SELECT a.Title AS Albums, SUM(t.UnitPrice) AS Precio total
FROM Albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId
ORDER BY Precio total ASC
LIMIT 10;

/*Ejercicio 6*/
/*Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99*/
SELECT g.Name AS "Género", al.Title AS "Nombre del disco", t.name AS "Nombre de la canción" FROM tracks t
INNER JOIN genres g ON t.GenreId = g.GenreId
INNER JOIN albums al ON t.AlbumId = al.AlbumId
WHERE t.UnitPrice = 0.99;

/*Ejercicio 7*/
/*Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos*/

/*Ejercicio 8*/
/*Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados,
ordenado desde los que atienden más clientes a los que atienden menos*/
SELECT e.LastName AS "Empleado", e.Title AS "Puesto", m.LastName AS "Apellido del jefe",
COUNT(c.CustomerId) AS "Cantidad de clientes" FROM employees e
INNER JOIN employees m ON e.ReportsTo = m.EmployeeId
INNER JOIN customers c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId, e.LastName, e.Title, m.LastName
ORDER BY "Cantidad de Clientes" DESC;

/*Ejercicio 9*/
/*Insertar cuatro (4) canciones que les gusten.*/
INSERT INTO tracks (TrackId,Name, MediaTypeId, Milliseconds, UnitPrice)
VALUES 
(3512,'Agosto' ,1, 354000, 0.99),
(3513,'Despacito' ,1, 354001, 0.99),
(3514,'Llega la noche' ,1, 354002, 0.99),
(3515,'Entre canivales' ,1, 354003, 0.99);

/*Ejercico 10*/
/*Mostrar las cuatro canciones ingresadas.*/
SELECT t.TrackId, t.Name
FROM tracks t
ORDER BY  t.TrackId DESC
LIMIT 4;

/*Ejercicio 11*/
/*Modifiquen dos (2) canciones por otras que se les ocurran.*/
UPDATE tracks
SET Name = 'Entre Nosotros'
WHERE TrackId = 3512;
UPDATE tracks
SET Name = 'Bemaste'
WHERE TrackId = 3513;

/*Ejercicio 12*/
/*Mostrar las dos (2) canciones modificadas.*/
SELECT * FROM tracks
WHERE TrackId IN (3512, 3513);

/*Ejercicio 13*/
/*Borrar dos (2) datos ingresados, realizando un solo delete.*/
DELETE FROM tracks
WHERE TrackId IN (3512, 3513);


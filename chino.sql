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
SELECT count(t.TrackId), g.name FROM genres
INNER JOIN tracks t ON t.TrackId = g.TrackId


/*Sin esperanza a aprobar, gracias.*/
/*Le puse esfuerzo. Lo que cuenta es la intención*/
/*Espero que recompense la primer parte :D*/

/*Ejercicio uno*/
/*Cuántas canciones tiene el álbum unplugged?*/
SELECT COUNT(*) AS canciones FROM tracks t
INNER JOIN albums ON t.AlbumId = albums.AlbumId
WHERE albums.Title like 'Unplugged' /*Me re costó*/

/*Ejercicio dos*/
/*Mostrar los artistas que tienen 30 o más canciones ordenadas del que tiene más al que tiene menos.*/
SELECT artists.Name AS artista, COUNT(tracks.TrackId) AS canciones FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
GROUP BY artists.Name
HAVING canciones >= 30
ORDER BY canciones DESC


/*Ejercicio tres*/
/*Insertar 6 canciones que elijan, con sus respectivos datos.(fijense en la estructura de la tabla que datos tiene que usar)*/
INSERT INTO tracks (Name, MediaTypeId, Milliseconds, UnitPrice)
VALUES ('Peperina', 1, 240000, 100),
('Ese maldito momento', 2, 180000, 00),
('Aparentemente', 3, 2400000, 300),
('Por Mil Noches', 1, 240000, 400),
('Invierno del 92', 3, 240000, 500),
('Es un secreto', 2, 180000, 600);

/*Ejercicio cuatro*/
/*Modificar el nombre de una canción insertada, y al segundo dato ingresado modificar los milisegundos.*/
UPDATE tracks
SET name = 'Jeje modifico', Milliseconds = '170000'
WHERE name = 'jiji'; 

/*Ejercicio cinco*/
/*Borrar dos datos agregados y modificados con una sola sentencia de borrar.*/
DELETE FROM tracks 
WHERE TrackId >=3503 and TrackId <= 3501



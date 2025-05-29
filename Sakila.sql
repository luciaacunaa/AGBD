/*Ejercicio 1*/
SELECT * FROM inventory i
INNER JOIN film f ON f.film_id = i.film_id;
INNER JOIN store s ON s.store_id = i.store_id
INNER JOIN address a ON a.address_id = s.address_id
INNER JOIN city c ON c.city_id = a.city_id
INNER JOIN country y ON y.country_id = c.country_id;

/*Ejercicio 2*/
SELECT title, length, f.rating, c.name, l.name FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN language l ON l.language_id = f.language_id
WHERE length BETWEEN 60 AND 120

/*Ejercicio 3*/
SELECT s.first_name, s.last_name, a.address, c.city, co.country FROM staff s
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id

/*Ejercicio 4*/
SELECT max (return_date), min (return_date), f.title FROM film f
INNER JOIN inventory i ON f.film_id= i.film_id
INNER JOIN rental r ON i.inventory_id= r.inventory_id
 
/*Ejercicio 6*/
SELECT rating, COUNT(*) AS cantidad_peliculas
FROM film f
GROUP BY rating;

/*Ejercicio 7*/
SELECT count(*) as cant_pelicula, ca.name  
FROM film f
INNER JOIN film_category c ON f.film_id = c.film_id
INNER JOIN category ca ON c.category_id = ca.category_id
GROUP BY ca.name

/*Ejercicio 8*/
SELECT a.first_name,a.last_name,count(a.actor_id) as cant_actor, f.title
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id
ORDER by cant_actor desc limit 10

/*Ejercicio 9*/
SELECT a.address, c.city, co.country,count(i.inventory_id)
FROM inventory i
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id  
GROUP by a.address

/*Ejercicio 10*/
 SELECT a.address, c.city, co.country,count(f.film_id)
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id  
GROUP by a.address

/*Ejercicio 11*/
SELECT AVG(f.rental_duration * f.rental_rate ) AS costo_promedio, c.name
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP by c.name

 /*Ejercicio 12*/
SELECT f.title AS "Película", r.rental_date AS "Día que se alquiló", r.return_date AS "Día que se devolvió",
r.return_date - r.rental_date AS "Días de Alquiler", p.amount AS "Costo Total", p.amount / (r.return_date - r.rental_date)
AS "Costo por Día" FROM rental r /* la barra (/) divide. Se podria usar un datadiff o algo asi pero es más largo*/
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN payment p ON r.rental_id = p.rental_id
WHERE f.title = 'ALABAMA DEVIL'
ORDER BY r.rental_date DESC;

/*Ejercicio 13*/
SELECT f.title, f.length, c.name FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
ORDER BY f.length DESC;

/*Ejercicio 14*/
SELECT  film.title FROM film 
INNER JOIN film_actor ON film.film_id = film_actor.film_id WHERE film.title LIKE 'W%' /*Solo los que empiezan con la letra(en este caso W)*/
GROUP BY film.film_id, film.title /*agrupa las filas*/
HAVING COUNT(film_actor.actor_id) >= 5;

/*Ejercicio 15*/
SELECT c.last_name As "Apellido", c.first_name AS "Nombre", SUM(p.amount) AS "Pagos" FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY "Total de Pagos" DESC; /*DESC va del + chico al + grande*/

/*Ejercicio 16*/
SELECT  f.title, f.length, a.first_name, a.last_name FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY f.length ASC
LIMIT 1; /*toma la peli más corta*/

/*Ejercicio 17*/
SELECT c.last_name AS "Apellido", a.address AS "Dirección",  ci.city AS "Ciudad", co.country AS "País",
r.rental_date AS "Fecha de alquiler", p.payment_date AS "Fecha de pago", p.amount AS "Monto del pago" FROM customer c
INNER JOIN address a ON c.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON r.rental_id = p.rental_id
ORDER BY p.amount ASC;

/*Ejercicio 18*/
INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES (201, 'LUCÍA', 'ACUÑA', '2025-05-15 09:47:29');

/*Ejercicio 19*/
INSERT INTO actor (actor_id,first_name, last_name,last_update)
VALUES (202,'MARY LUZ', 'LLUSCO', '2025-05-15 09:46:29'), (203,'ABRIL', 'HERBAS', '2025-05-15 09:47:28');

/*Ejercicio 20*/
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name IN ('LUCÍA', 'MARY LUZ', 'ABRIL');
UPDATE actor SET first_name = 'GUSTAVO', last_name = 'CERATI' WHERE actor_id = 204;
UPDATE actor SET first_name = 'CHARLY', last_name = 'GARCÍA' WHERE actor_id = 205;
UPDATE actor SET first_name = 'FITO', last_name = 'PAEZ' WHERE actor_id = 3; 

/*Ejercicio 21*/
DELETE FROM actor WHERE actor_id IN (201, 202, 203);

INSERT INTO city (city_name)
VALUES ('Buenos Aires');
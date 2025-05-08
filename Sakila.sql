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
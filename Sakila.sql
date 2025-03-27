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


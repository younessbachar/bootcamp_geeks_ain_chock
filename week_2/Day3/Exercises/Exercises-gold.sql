-- Exercise 1: DVD Rentals

-- 1. List all rentals which are out (not returned)
SELECT *
FROM rental
WHERE return_date IS NULL;

-- 2. List all customers who have not returned their rentals, grouped
SELECT customer_id, COUNT(*) AS rentals_not_returned
FROM rental
WHERE return_date IS NULL
GROUP BY customer_id;

-- 3. List all Action films with Joe Swank
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE f.category = 'Action' 
  AND c.first_name='Joe' 
  AND c.last_name='Swank';

-- Optional: Create a view for out rentals
CREATE VIEW out_rentals AS
SELECT r.rental_id, c.customer_id, f.film_id, f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL;


-- Exercise 2: Happy Halloween

-- 1. Stores with city and country
SELECT s.store_id, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 2. Total viewing time per store (excluding unreturned items)
SELECT s.store_id, SUM(f.length) AS total_minutes
FROM inventory i
JOIN film f ON i.film_id = f.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN store s ON i.store_id = s.store_id
WHERE r.return_date IS NOT NULL
GROUP BY s.store_id;

-- 3. List all customers in the cities where stores are located
SELECT DISTINCT c.customer_id, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN store s ON ci.city_id = s.address_id;

-- 4. List all customers in the countries where stores are located
SELECT DISTINCT c.customer_id, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
JOIN store s ON co.country_id = s.address_id;

-- 5. Safe list: movies without 'Horror' or scary words
SELECT title, length
FROM film
WHERE category != 'Horror'
  AND title NOT REGEXP 'beast|monster|ghost|dead|zombie|undead'
  AND description NOT REGEXP 'beast|monster|ghost|dead|zombie|undead';

-- 6. Sum of viewing time for both general and safe lists
SELECT SUM(length) AS total_minutes,
       SUM(length)/60 AS total_hours,
       SUM(length)/1440 AS total_days
FROM film
WHERE category != 'Horror'
  AND title NOT REGEXP 'beast|monster|ghost|dead|zombie|undead'
  AND description NOT REGEXP 'beast|monster|ghost|dead|zombie|undead';

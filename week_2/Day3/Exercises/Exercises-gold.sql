-- ========================================
-- Exercise 1: DVD Rentals
-- ========================================

-- 1. List all rentals that are still out (not returned yet)
SELECT *
FROM rental
WHERE return_date IS NULL;

-- 2. Count how many rentals each customer still has out
SELECT customer_id, COUNT(*) AS rentals_not_returned
FROM rental
WHERE return_date IS NULL
GROUP BY customer_id;

-- 3. List all Action films featuring actor Joe Swank
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat     ON fc.category_id = cat.category_id
JOIN film_actor fa    ON f.film_id = fa.film_id
JOIN actor a          ON fa.actor_id = a.actor_id
WHERE cat.name = 'Action'
  AND a.first_name = 'JOE'
  AND a.last_name  = 'SWANK';

-- 4. Create a view for currently out rentals
CREATE OR REPLACE VIEW out_rentals AS
SELECT r.rental_id, c.customer_id, f.film_id, f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f      ON i.film_id = f.film_id
JOIN customer c  ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL;


-- ========================================
-- Exercise 2: Happy Halloween
-- ========================================

-- 1. List stores with their city and country
SELECT s.store_id, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci   ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 2. Total viewing time per store (include films that were never rented)
SELECT s.store_id, SUM(f.length) AS total_minutes
FROM inventory i
JOIN film f  ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL OR r.rental_id IS NULL
GROUP BY s.store_id;

-- 3. List all customers who live in cities where stores exist
SELECT DISTINCT c.customer_id, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci   ON a.city_id = ci.city_id
WHERE ci.city_id IN (
    SELECT ci2.city_id
    FROM store s
    JOIN address a2 ON s.address_id = a2.address_id
    JOIN city ci2   ON a2.city_id = ci2.city_id
);

-- 4. List all customers who live in countries where stores exist
SELECT DISTINCT c.customer_id, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci   ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country_id IN (
    SELECT co2.country_id
    FROM store s
    JOIN address a2 ON s.address_id = a2.address_id
    JOIN city ci2   ON a2.city_id = ci2.city_id
    JOIN country co2 ON ci2.country_id = co2.country_id
);

-- 5. "Safe list": movies without Horror or scary words in title/description
SELECT f.title, f.length
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c       ON fc.category_id = c.category_id
WHERE c.name != 'Horror'
  AND f.title       !~* '(beast|monster|ghost|dead|zombie|undead)'
  AND f.description !~* '(beast|monster|ghost|dead|zombie|undead)';

-- 6. Sum of total viewing time for safe list (minutes, hours, days)
SELECT SUM(f.length)       AS total_minutes,
       SUM(f.length)/60    AS total_hours,
       SUM(f.length)/1440  AS total_days
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c       ON fc.category_id = c.category_id
WHERE c.name != 'Horror'
  AND f.title       !~* '(beast|monster|ghost|dead|zombie|undead)'
  AND f.description !~* '(beast|monster|ghost|dead|zombie|undead)';

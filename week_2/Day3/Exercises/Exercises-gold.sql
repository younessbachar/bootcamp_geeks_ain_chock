-- ===================================================
-- Exercise 1: DVD Rentals
-- ===================================================

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


-- =

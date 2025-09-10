-- ===================================================
-- Exercise 1: DVD Rentals – Children
-- ===================================================

-- First, let's get all the films that are rated G or PG
-- and are not currently rented out (either returned or never borrowed)
SELECT f.film_id, f.title, f.rating
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id AND r.return_date IS NULL
WHERE f.rating IN ('G', 'PG') 
  AND r.rental_id IS NULL;


-- Now, let's create a waiting list table for children's movies
-- This table will let kids put their names on a list until the DVD is available
CREATE TABLE waiting_list (
    waiting_id INT AUTO_INCREMENT PRIMARY KEY,  -- each row gets a unique ID automatically
    film_id INT NOT NULL,                       -_

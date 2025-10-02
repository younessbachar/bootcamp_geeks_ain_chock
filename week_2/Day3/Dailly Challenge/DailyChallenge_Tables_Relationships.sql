-- ===================================================
-- Part I: Customer and Customer Profile (One-to-One)
-- ===================================================

-- Create the Customer table
CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Create the Customer Profile table
CREATE TABLE CustomerProfile (
    id SERIAL PRIMARY KEY,
    isLoggedIn BOOLEAN DEFAULT FALSE,
    customer_id INT UNIQUE,  -- One-to-One relationship
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

-- Insert customers
INSERT INTO Customer (first_name, last_name) VALUES
('John', 'Doe'),
('Jerome', 'Lalu'),
('Lea', 'Rive');

-- Insert customer profiles using subqueries
INSERT INTO CustomerProfile (isLoggedIn, customer_id)
VALUES
(TRUE, (SELECT id FROM Customer WHERE first_name='John' AND last_name='Doe')),
(FALSE, (SELECT id FROM Customer WHERE first_name='Jerome' AND last_name='Lalu'));

-- Display first_name of logged-in customers
SELECT c.first_name
FROM Customer c
JOIN CustomerProfile p ON c.id = p.customer_id
WHERE p.isLoggedIn = TRUE;

-- Display all customers and their isLoggedIn status
-- Include customers without a profile
SELECT c.first_name, p.isLoggedIn
FROM Customer c
LEFT JOIN CustomerProfile p ON c.id = p.customer_id;

-- Count the number of customers not logged in
SELECT COUNT(*) AS not_logged_in_count
FROM Customer c
LEFT JOIN CustomerProfile p ON c.id = p.customer_id
WHERE p.isLoggedIn = FALSE OR p.isLoggedIn IS NULL;


-- ===================================================
-- Part II: Books, Students, Library (Many-to-Many)
-- ===================================================

-- Create Book table
CREATE TABLE Book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL
);

-- Insert books
INSERT INTO Book (title, author) VALUES
('Alice In Wonderland', 'Lewis Carroll'),
('Harry Potter', 'J.K Rowling'),
('To kill a mockingbird', 'Harper Lee');

-- Create Student table with age constraint
CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    age INT CHECK (age <= 15)  -- age cannot be bigger than 15
);

-- Insert students
INSERT INTO Student (name, age) VALUES
('John', 12),
('Lera', 11),
('Patrick', 10),
('Bob', 14);

-- Create Library junction table for Many-to-Many relationship
CREATE TABLE Library (
    book_fk_id INT,
    student_fk_id INT,
    borrowed_date DATE,
    PRIMARY KEY (book_fk_id, student_fk_id),
    FOREIGN KEY (book_fk_id) REFERENCES Book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (student_fk_id) REFERENCES Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert borrowed books using subqueries
INSERT INTO Library (book_fk_id, student_fk_id, borrowed_date) VALUES
(
    (SELECT book_id FROM Book WHERE title='Alice In Wonderland'),
    (SELECT student_id FROM Student WHERE name='John'),
    '2022-02-15'
),
(
    (SELECT book_id FROM Book WHERE title='To kill a mockingbird'),
    (SELECT student_id FROM Student WHERE name='Bob'),
    '2021-03-03'
),
(
    (SELECT book_id FROM Book WHERE title='Alice In Wonderland'),
    (SELECT student_id FROM Student WHERE name='Lera'),
    '2021-05-23'
),
(
    (SELECT book_id FROM Book WHERE title='Harry Potter'),
    (SELECT student_id FROM Student WHERE name='Bob'),
    '2021-08-12'
);

-- Display all columns from the junction table
SELECT * FROM Library;

-- Display student name and borrowed book title
SELECT s.name AS student_name, b.title AS borrowed_book
FROM Library l
JOIN Student s ON l.student_fk_id = s.student_id
JOIN Book b ON l.book_fk_id = b.book_id;

-- Calculate average age of children who borrowed "Alice In Wonderland"
SELECT AVG(s.age) AS avg_age
FROM Library l
JOIN Student s ON l.student_fk_id = s.student_id
JOIN Book b ON l.book_fk_id = b.book_id
WHERE b.title = 'Alice In Wonderland';

-- Delete a student and see what happens to the junction table
-- For example, delete Bob
DELETE FROM Student WHERE name='Bob';

-- After this, all rows in Library where student_fk_id = Bob's id are automatically deleted due to ON DELETE CASCADE
SELECT * FROM Library;

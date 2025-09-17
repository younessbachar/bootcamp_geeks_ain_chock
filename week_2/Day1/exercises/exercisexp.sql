CREATE DATABASE IF NOT EXISTS students_db;
USE students_db;

CREATE TABLE students (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE
);

INSERT INTO students (id, first_name, last_name, birth_date) VALUES
(1, 'Marc',  'Benichou', '1994-06-17'),
(2, 'Amina', 'Benichou', '2002-03-08'),
(3, 'Sara',  'Elhadad',  '1999-12-05'),
(4, 'Adam',  'Khan',     '2000-12-01'),
(5, 'Laila', 'Hanae',    '1998-11-25'),
(6, 'Younes','Bchar',    '1997-09-10');


select * from students;

select first_name, last_name from students;

select first_name , last_name from students where id = 2;

select first_name , last_name from students where last_name = 'Benichou' and first_name = 'Marc';

select first_name , last_name from students where last_name = 'Benichou' or first_name = 'Marc';

select first_name , last_name from students where first_name like '%a%';

select first_name , last_name from students where first_name like 'a%';

select first_name , last_name from students where first_name like '%a';

select first_name , last_name from students where last_name like '%a_';

select first_name , last_name from students where id in (1,3);

select first_name , last_name from students where birth_date >= '2000-01-01'

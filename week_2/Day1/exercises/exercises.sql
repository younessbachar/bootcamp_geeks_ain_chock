#execrcice 1

#1 create database
create database public;

#2 create tables items and customers
create table items(
product_id int primary key,
product_name varchar(20),
product_price float
);


create table customers(
customer_id int primary key,
first_name varchar(20),
last_name varchar(20)
)


#add items
insert into items (product_id, product_name, product_price)
values(1, 'Small Desk', 100),
(2, 'Large desk', 300),
(3, 'Fan' , 80) ;

#add customers

insert into customers (customer_id, first_name, last_name)
values(1, 'Greg', 'Jones'),
(2 , 'Sandra' , 'Jones'),
(3 , 'Scott' , 'Scott'),
(4, 'Trevor', 'Green'),
(5 , 'Melanie' , 'Johnson');

#3 select all customers
select * from customers;

#4 select all items where price > 80
select * 
from items 
where  product_price > 80

#5 select all items where price between < 300
select *
from items
where product_price < 300

#6 all customers whose last name is ‘Smith’
select *
from customers
where last_name = 'Smith';

#7 all customers whose last name is ‘Jones’
select *
from customers
where last_name = 'Jones';

#8 All customers whose firstname is not ‘Scott’.
select *
from customers
where first_name!='Scott';


# select from basic 
SELECT first_name,last_name,email 
FROM customer;


# 2. select DISTINCT
# how many relaese year your have? 

SELECT DISTINCT release_year FROM film;

## how many rental-rates you have ?

SELECT DISTINCT rental_rate FROM film;

# how many ratings do we have in our film db
SELECT DISTINCT rating FROM film;

# 3. select where lecture 

# what are the conditions and how to build them

SELECT last_name,first_name 
From customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';

SELECT email FROM customer
WHERE first_name = 'Jared';

# 4 count function 
SELECT COUNT(*) FROM payment;

# count distinct rows for amount coloumn
SELECT COUNT(DISTINCT amount) FROM payment;

# 5 Limit query, select first five rows, good for order by
SELECT * FROM customer
LIMIT 5;

#6. Order by statement, default is ASC, order by two columns

SELECT first_name, last_name FROM customer
ORDER BY first_name ASC, 
last_name DESC; 


# postgresSQL allow people to do this, alwasy select the column when u want to order by it
SELECT first_name FROM customer
ORDER BY last_name; 

 
SELECT customer_id,amount FROM payment
ORDER BY amount DESC
LIMIT 10; 

SELECT title,film_id 
FROM film
ORDER BY film_id
LIMIT 5; 

# Between and not between statement 
# between is another way to write ><=
# make it simpler and more readable

# Between value >= low and value <=high
# not between  value < low or value > high
SELECT customer_id, amount FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT customer_id, amount FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

# query through timestaps
SELECT amount,payment_date FROM payment
WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';


# You use IN operator with the WHERE clause to 
# check if a value matches any value in a list of values
# the expression returns true if the value 
# matches any value in the list 
# also can do not IN 
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN (1,2)
ORDER BY return_date DESC;


# same as below, IN makes it easier and simple, faster in postgresSQL
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id = 7 
OR customer_id = 13
OR customer_id =10
ORDER BY return_date DESC;

# Like statement, pattern matching technique, wild cart characters

SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE 'Jen%';

SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE '%er%';

SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE '_her%';

# Ilike case insensitive
SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name ILIKE 'BaR%';

# count transaction amount more than 5
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;

# How many actors have a first name starts with letter pattern
SELECT COUNT(first_name)
FROM actor
WHERE first_name LIKE 'P%';

# How many unique districts are our customers from?
SELECT COUNT(DISTINCT(district))
FROM address;

# retrieve the list of names for those distinct
# district 
SELECT DISTINCT(district)
FROM address;

# How many films have a rating of R and a replacement cost between 5 15

SELECT COUNT(film_id)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

# from teacher
SELECT COUNT(*)
FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND 15;

# how many films have the word Truman somewhere in the title
SELECT COUNT(*)FROM film
WHERE title like '%Truman%';










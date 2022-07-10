-- List all customers who live in Texas (use JOINs)

SELECT district, customer_id, first_name, last_name
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE district = 'Texas';

-- Get all payments above $6.99 with the Customer's Full Name

SELECT customer.first_name, customer.last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);


-- List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, country
FROM country
INNER JOIN city
ON country.country_id = city.country_id
INNER JOIN address
ON address.city_id = city.city_id
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE country = 'Nepal';

-- Which staff member had the most transactions?

SELECT staff_id, COUNT(staff_id) AS transaction_count
FROM payment
GROUP BY staff_id
ORDER BY staff_id desc;

-- How many movies of each rating are there?

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
);

-- How many free rentals did our stores give away

SELECT amount, COUNT(amount) AS free_rentals
FROM payment
WHERE amount = '0'
GROUP BY amount;












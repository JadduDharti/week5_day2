-- INNER JOIN on the actor and film_actor table

SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- INNER JOIN on the actor, film_actor and film table to see which actor are in what film

SELECT first_name, last_name, title
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id;

-- Join that will produce info about a customer
-- From the country of Angola
-- First Name, Last Name, Email, Country


SELECT first_name, last_name, email, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

-- Find a customer id that has a payment amount > 175

SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id in (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);


SELECT store_id, first_name, last_name, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'United State' AND customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);


SELECT * 
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM "language"
	WHERE "name" = 'English'
);



SELECT first_name, last_name, address_id
FROM customer
WHERE address_id IN (
	SELECT address_id
	FROM address
	WHERE city_id IN (
		SELECT city_id
		FROM city
		WHERE city = 'Dallas'
	)
);


SELECT title, film_id
FROM film
WHERE film_id IN (
	SELECT film_id
	FROM film_category 
	WHERE category_id IN (
		SELECT category_id
		FROM category
		WHERE "name" = 'Horror'
	)
);
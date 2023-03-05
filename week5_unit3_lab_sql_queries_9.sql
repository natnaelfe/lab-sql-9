USE sakila;

SELECT*
FROM rental;

# 1. Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE rentals_may AS
	SELECT *
    FROM rental
	WHERE MONTH(rental_date) = 5;
    
SELECT *
FROM rentals_may; # --> Check: it worked!

# 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
# --> already did in 1. Code would have been the following:

#INSERT INTO rentals_may
#SELECT *
#FROM rental
#WHERE MONTH(rental_date) = 5;

# 3. Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june LIKE rental;

# 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june
SELECT *
FROM rental
WHERE MONTH(rental_date) = 6;

SELECT *
FROM rentals_june; # --> Check: it worked!

# 5. Check the number of rentals for each customer for May.
SELECT customer_id, COUNT(*) AS num_rentals
FROM rental
WHERE MONTH(rental_date) = 5
GROUP BY customer_id;

#check the result:
SELECT customer_id, COUNT(*) AS num_rentals
FROM rentals_may
GROUP BY customer_id;

# 6. Check the number of rentals for each customer for June.
SELECT customer_id, COUNT(*) AS num_rentals
FROM rental
WHERE MONTH(rental_date) = 6
GROUP BY customer_id;

#check the result:
SELECT customer_id, COUNT(*) AS num_rentals
FROM rentals_june
GROUP BY customer_id;
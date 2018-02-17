#Count and Group by
# returns the number of titles with a rental rate of .99
SELECT count(title)
FROM film
WHERE rental_rate = .99
;

# returns one row for each different rental_rate, the first film title of each new price
SELECT title, rental_rate
FROM film
GROUP BY rental_rate
;

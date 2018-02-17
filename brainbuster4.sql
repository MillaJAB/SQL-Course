# How many times has each movie been rented out

SELECT
	f.title, count(r.rental_id)
FROM
	film f, rental r, inventory i
WHERE
	f.film_id = i.film_id
AND
	i.inventory_id = r.inventory_id
GROUP BY	
	f.title
;

#payment
# payment_id is a new one for every payment
# rental_id 
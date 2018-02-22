#Number of distinct films rented in a month

SELECT
	left(r.rental_date, 7), count(distinct f.film_id)
FROM
	rental r, inventory i, film f 
WHERE
	r.inventory_id = i.inventory_id
	AND
	i.film_id = f.film_id
GROUP BY
	1
;
#left()

SELECT
	left(r.rental_date, 7), count(r.rental_id)
FROM
	rental r
GROUP BY
	1
ORDER BY
	2 desc
;

#min

SELECT
	f.film_id, f.title as "Film Title", max(rental_date) as "Last rental date", min(r.rental_date) as "First rental date"
FROM
	rental r, inventory i, film f
WHERE
	r.inventory_id = i.inventory_id
	AND
	i.film_id = f.film_id
GROUP BY
	f.film_id
;
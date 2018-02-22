#comparison operators

SELECT
	r.customer_id as Customer, count(r.rental_id) as "Number of Rentals"
FROM
	rental r
GROUP BY
	1
HAVING count(r.rental_id) >= 3
;

#how much revenue store 1 where film is rated R or PG-13

SELECT
	i.store_id, f.rating, SUM(p.amount)
FROM
	film f, rental r, inventory i, payment p
WHERE
	p.rental_id = r.rental_id
	AND
	f.film_id = i.film_id
	AND
	i.inventory_id = r.inventory_id
	AND
	f.rating in ("R", "PG-13")
	AND
	i.store_id = 1
GROUP BY
	1, 2
ORDER BY
	3 desc
;


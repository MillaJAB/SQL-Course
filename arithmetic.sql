# revenu per video title
# revenue = price * number of rentals

SELECT
	f.title as "Film Title", count(r.rental_id) as "Number of Rentals", f.rental_rate as "Rental Rate", count(r.rental_id) * f.rental_rate as Revenue
FROM
	film f, rental r, inventory i
WHERE
	f.film_id = i.film_id
AND
	i.inventory_id = r.inventory_id
GROUP BY	
	f.title
ORDER BY
	Revenue desc
;


SUM()

#What customer has paid the most money

SELECT
	p.customer_id, SUM(p.amount)
FROM
	payment p
GROUP BY
	1
ORDER BY
	2 desc
;
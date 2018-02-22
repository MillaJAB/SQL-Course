#IN function number of rentals in 3 categorys: Comedy, Sports, Family

SELECT
	c.name as Category, count(r.rental_id) as "Number of Rentals"
FROM
	rental r, inventory i, film f, film_category fc, category c
WHERE
	r.inventory_id = i.inventory_id
	AND
	i.film_id = f.film_id
	AND
	f.film_id = fc.film_id
	AND
	fc.category_id = c.category_id
	AND
	c.name in ("Comedy", "Sports", "Family")
GROUP BY
	1
;
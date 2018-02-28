# count the number of copies of each film
SELECT
	f.film_id, f.title, f.rental_rate, count(i.inventory_id) as copies
FROM
	film f, inventory i
WHERE
	f.film_id = i.film_id
GROUP by
	1
ORDER by
	copies desc
;

# revenue of each movie
SELECT
	f.film_id AS "Film ID", f.title AS "Title", f.rental_rate AS "Rental Rate", count(r.rental_id) AS "Number of Rentals", f.rental_rate*count(r.rental_id) AS Revenue
FROM
	film f, inventory i, rental r
WHERE
	f.film_id = i.film_id
	and
	r.inventory_id = i.inventory_id
GROUP by
	1
ORDER by
	Revenue desc
;

 
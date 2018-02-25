#Find revenue by actor/actress
# actor name and revenue that the films they were in produced

drop temporary table if exists actorInFilm;
create temporary table actorInFilm
SELECT
	concat(a.first_name, " ", a.last_name) as Name, f.title as Title
FROM
	actor a, film_actor fa, film f
WHERE
	f.film_id = fa.film_id
	and
	a.actor_id = fa.actor_id
;

SELECT
	aif.Name, aif.Title, count(r.rental_id)
FROM
	actorInFilm aif, inventory i, rental r, payment p
WHERE
	i.inventory_id = r.inventory_id
	and
	p.rental_id = r.rental_id
;


drop temporary table if exists rev_per_film;
create temporary table rev_per_film
SELECT
	f.film_id as film_id, f.rental_rate*count(r.rental_id) as film_revenue
FROM
	film f, rental r, inventory i
WHERE
	r.inventory_id = i.inventory_id
	and
	i.film_id = f.film_id
GROUP BY
	1
;

SELECT
	a.actor_id, concat(a.first_name," ",a.last_name), sum(rpf.film_revenue)
FROM
	rev_per_film rpf, actor a, film_actor fa
WHERE
	a.actor_id = fa.actor_id
	and
	fa.film_id = rpf.film_id
GROUP BY
	1
ORDER BY
	3 desc
;


# Every customers last rental date

SELECT
	c.first_name, c.last_name, max(r.rental_date)
FROM
	rental r, customer c
WHERE
	c.customer_id = r.customer_id
GROUP BY
	r.customer_id
;

#revenue by month

SELECT
	left(r.rental_date, 7) as Month, SUM(p.amount) as Revenue
FROM
	rental r, payment p
WHERE
	r.rental_id = p.rental_id
GROUP BY
	1
ORDER BY
	2 desc
;
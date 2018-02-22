#Distinct renters per month

SELECT
	left(r.rental_date, 7) as Month, count(r.rental_id) as "Total Rentals", count(distinct r.customer_id) as "Unique Renters", count(r.rental_id)/count(distinct r.customer_id) as "Average Rentals per User"
FROM
	rental r
GROUP BY
	1
;
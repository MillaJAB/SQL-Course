#list of users and how many rentals
drop temporary table if exists rentals_per_customer;
create temporary table rentals_per_customer
SELECT
	r.customer_id as customer_id, count(r.rental_id) as num_rentals, sum(p.amount) as customer_revenue
FROM
	rental r, payment p
WHERE
	p.rental_id = r.rental_id 
GROUP by
	1
;


#revenue by users who rented x number of rentals

SELECT
	rpc.num_rentals, sum(rpc.customer_revenue), count(rpc.customer_id)
FROM
	rentals_per_customer rpc
GROUP by
	1
;
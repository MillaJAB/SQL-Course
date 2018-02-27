# Customer's min rental date (first rental)

DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT
	customer_id,
	min(rental_date) as first_date
FROM
	rental
GROUP BY
	1
;

# Cohort size

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size

SELECT
	left(first_date, 7) as month,
	count(customer_id) as amount
FROM
	first_rental
GROUP BY
	1
;

# Revenue per user for each cohort and month

SELECT
	r.*, left(f.first_date, 7) as cohort, cs.amount as cohort_size, p.amount
FROM
	rental r
	JOIN first_rental f ON r.customer_id = f.customer_id
	JOIN cohort_size cs ON cs.month=left(f.first_date, 7)
	JOIN payment p ON p.rental_id = r.rental_id
;

DROP TEMPORARY TABLE IF EXISTS cohort;
CREATE TEMPORARY TABLE cohort

SELECT
	date_format(f.first_date, '%Y%m') as cohort_formatted,
	date_format(r.rental_date, '%Y%m') as rental_date_formatted,
	cs.amount as cohort_size,
	sum(p.amount) as month_revenue,
	sum(p.amount)/cs.amount as RPU
FROM
	rental r
	JOIN first_rental f ON r.customer_id = f.customer_id
	JOIN cohort_size cs ON cs.month=left(f.first_date, 7)
	JOIN payment p ON p.rental_id = r.rental_id
GROUP BY
	1, 2
;

# Make pretty

SELECT
	left(STR_TO_DATE(cohort_formatted, '%Y%m'),7) as "First Rental Month",
	period_diff(rental_date_formatted, cohort_formatted) as "Months After Join",
	cohort_size,
	RPU
FROM
	cohort
GROUP BY 1, 2;

#What store has brought in the most revenue

SELECT
	store.store_id as Store, SUM(payment.amount)
FROM
	store, staff, payment
WHERE
	store.store_id = staff.store_id
AND
	payment.staff_id = staff.staff_id
GROUP BY
	1
;
drop temporary table if exists activeUsers;
create temporary table activeUsers
SELECT
	c.*, a.address, a.phone
from
	customer c JOIN address a ON c.address_id = a.address_id
WHERE
	c.active = 1
;

/*
at least 30 rentals

customer_id, number of rentals, last rental date
*/

drop temporary table if exists rewardUsers;
create temporary table rewardUsers
SELECT
	r.customer_id, count(r.rental_id), max(r.rental_date)
from
	rental r
GROUP BY
	r.customer_id
HAVING count(r.rental_id) >= 30
;

/*
Reward users who are also active users

Include customer_id, email, first_name
*/

SELECT
	r.customer_id, a.email, a.first_name
from
	rewardUsers r JOIN activeUsers a ON r.customer_id = a.customer_id
GROUP BY 1
;

/*
All reward users

Include customer_id, email, phone for those who are also active users
*/

SELECT
	r.customer_id, c.email, a.phone
from
	rewardUsers r JOIN customer c ON r.customer_id = c.customer_id
	LEFT JOIN activeUsers a ON r.customer_id = a.customer_id
GROUP BY 1
;
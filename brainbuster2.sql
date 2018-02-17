# Which rating is most prevalent in each price

SELECT rating, count(rating), rental_rate
FROM film
GROUP BY rental_rate
;
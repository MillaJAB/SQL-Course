# Which rating is most prevalent in each price

SELECT rating, rental_rate, count(film_id)
FROM film
GROUP BY rating, rental_rate
;
# Connect 3 tables, every film, category, and language

SELECT
	film.title, language.name, category.name
FROM
	film, language, category, film_category
WHERE
	film.language_id = language.language_id
	AND
	film_category.film_id = film.film_id
	AND
	film_category.category_id = category.category_id
;

# How to create and use shortcuts for brevity
SELECT
	f.title, l.name, c.name
FROM
	film f, language l, category c, film_category fc
WHERE
	f.language_id = l.language_id
	AND
	fc.film_id = f.film_id
	AND
	fc.category_id = c.category_id
;
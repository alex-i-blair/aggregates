-- the average film length by category
-- include the category name and avg length
SELECT name, AVG(length)
FROM film
LEFT JOIN film_category
ON film.film_id = film_category.film_id
LEFT JOIN category
ON film_category.category_id = category.category_id
GROUP BY name
-- ORDER BY name
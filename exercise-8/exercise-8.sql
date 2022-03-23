-- rank of film category by times rented
-- include the name, count, and rank
SELECT name, COUNT(rental_id), RANK() OVER (
  ORDER BY COUNT(rental_id) DESC
)
FROM category
LEFT JOIN film_category
ON category.category_id = film_category.category_id
LEFT JOIN film
ON film_category.film_id = film.film_id
LEFT JOIN inventory
ON film.film_id = inventory.film_id
LEFT JOIN rental
ON inventory.inventory_id = rental.inventory_id
GROUP BY name
-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
SELECT
  rating,
  SUM(amount),
  EXTRACT (YEAR FROM payment_date) y,
  EXTRACT (MONTH FROM payment_date) m,
  EXTRACT (DAY FROM payment_date) d
FROM
  payment
LEFT JOIN rental
ON payment.rental_id = rental.rental_id
LEFT JOIN inventory
ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film
ON inventory.film_id = film.film_id
GROUP BY CUBE (
  rating, y, m, d
)
ORDER BY rating, y, m, d
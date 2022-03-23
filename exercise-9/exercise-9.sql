-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date
SELECT
  SUM(amount),
  EXTRACT (YEAR FROM payment_date) y,
  EXTRACT (MONTH FROM payment_date) m,
  EXTRACT (DAY FROM payment_date) d
FROM
  payment
GROUP BY ROLLUP (
  y, m, d
)

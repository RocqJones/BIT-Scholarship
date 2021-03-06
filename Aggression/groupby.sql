SELECT account_id, SUM(standard_qty) AS std_sum, SUM(gloss_qty) AS gloss_sum,
       SUM(poster_qty) AS poster_sum
FROM orders
GROUP BY account_id
ORDER BY account_id

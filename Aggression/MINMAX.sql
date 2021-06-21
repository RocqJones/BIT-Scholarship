SELECT MIN(standard_qty) AS std_min, MIN(gloss_qty) AS gloss_min,
       MAX(standard_qty) AS std_max, MAX(gloss_qty) AS gloss_max
FROM orders

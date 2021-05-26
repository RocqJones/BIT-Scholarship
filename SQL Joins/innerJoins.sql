SELECT orders.*, accounts.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- If we want to pull only the account name and the dates in which that account placed an order,
-- but none of the other columns, we can do this with the following query.
SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- Query pulls all the columns from both the accounts and orders table.
SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table,
-- and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

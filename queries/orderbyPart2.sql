-- Write a query that displays the order ID, account ID, and total dollar amount for all the orders,
-- sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order)
select id, account_id, total_amt_usd
from orders
order by account_id, total_amt_usd desc;

-- Now write a query that again displays order ID, account ID, and total dollar amount for each order,
-- but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).
select id, account_id, total_amt_usd
from orders
order by total_amt_usd desc, account_id;

-- MIN, MAX, & AVG
-- 1. When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at) FROM orders;

-- 2. Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at FROM orders
ORDER BY occurred_at LIMIT 1;

-- 3. When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at) FROM web_events;

-- 4. Try to perform the result of the previous query without using an aggregation function.
SELECT occurred_at FROM web_events ORDER BY occurred_at DESC LIMIT 1;

-- 5. Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean
-- amount of each paper type purchased per order. Your final answer should have 6 values -
-- one for each paper type for the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss,
AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;

-- 6. Via the video, you might be interested in how to calculate the MEDIAN. Though this
-- is more advanced than what we have covered so far try finding - what is the MEDIAN
-- total_usd spent on all orders?
SELECT * FROM (SELECT total_amt_usd FROM orders
  ORDER BY total_amt_usd LIMIT 3457) AS Table1
  ORDER BY total_amt_usd DESC
  LIMIT 2;

-- GROUP BY
-- 1. Which account (by name) placed the earliest order? Your solution should have
-- the account name and the date of the order.
SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;

-- 2. Find the total sales in usd for each account. You should include two columns -
-- the total sales for each company's orders in usd and the company name.
SELECT accounts.name AS name, SUM(orders.total_amt_usd) AS total_sales_usd
FROM accounts, orders
WHERE accounts.id = orders.account_id
GROUP BY accounts.name
-- OR
SELECT a.name, SUM(total_amt_usd) total_sales
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name;
-- 3. Via what channel did the most recent (latest) web_event occur, which account was
-- associated with this web_event? Your query should return only three values - the date,
-- channel, and account name.
SELECT w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
ORDER BY w.occurred_at DESC
LIMIT 1;

-- 4. Find the total number of times each type of channel from the web_events was used.
-- Your final table should have two columns - the channel and the number of times the channel was used.
SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel

-- 5. Who was the primary contact associated with the earliest web_event?
SELECT a.primary_poc
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

-- 6. What was the smallest order placed by each account in terms of total usd.
-- Provide only two columns - the account name and the total usd. Order from
-- smallest dollar amounts to largest.
SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;

-- 7. Find the number of sales reps in each region. Your final table should have two columns -
-- the region and the number of sales_reps. Order from fewest reps to most reps.
SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;

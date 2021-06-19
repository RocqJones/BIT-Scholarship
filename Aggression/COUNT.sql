-- COUNT the Number of Rows in a Table
SELECT COUNT(*)
FROM accounts;

-- But we could have just as easily chosen a column to drop into the aggregation functioN
SELECT COUNT(accounts.id)
FROM accounts;


-- COUNT AND NULL
SELECT * FROM accounts WHERE primary_poc IS NULL

-- Example:
FROM tablename AS t1
JOIN tablename2 AS t2

SELECT col1 + col2 AS total, col3

-- The above could be written in the following way instead, and they would still produce the exact same results:
FROM tablename t1
JOIN tablename2 t2

-- and
SELECT col1 + col2 total, col3

-- Aliases for Columns in Resulting Table
Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2

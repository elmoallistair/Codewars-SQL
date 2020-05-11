-- Written: 08-May-2020
-- https://www.codewars.com/kata/5a8d94d3ba1bb569e5000198/train/sql

SELECT
  COUNT(*) AS products,
  country
FROM products
	WHERE country IN ('United States of America', 'Canada')
	GROUP BY country
	ORDER BY products DESC;
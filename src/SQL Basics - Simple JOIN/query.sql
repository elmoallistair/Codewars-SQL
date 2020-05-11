-- Written: 06-May-2020
-- https://www.codewars.com/kata/5802e32dd8c944e562000020/train/sql

SELECT    
  p.*,
  c.name AS company_name
FROM products AS p
	LEFT JOIN companies AS c
	ON p.company_id = c.id;
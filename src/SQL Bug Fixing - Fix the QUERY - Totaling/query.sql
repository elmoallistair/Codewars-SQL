-- Written: 08-May-2020
-- https://www.codewars.com/kata/5a8d94d3ba1bb569e5000198/train/sql

SELECT 
  DATE(s.transaction_date) AS day, 
  d.name AS department, 
  COUNT(s.id) AS sale_count
FROM department d
  INNER JOIN sale s
  ON d.id = s.department_id
	GROUP BY 
  	day, 
  	d.name
	ORDER BY day ASC;
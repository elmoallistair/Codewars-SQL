-- Written: 06-May-2020
-- https://www.codewars.com/kata/58113a64e10b53ec36000293/train/sql

SELECT 
  id, 
  name
FROM departments
WHERE EXISTS (
  SELECT department_id
  FROM sales
  WHERE departments.id = sales.department_id AND price > 98.00
);
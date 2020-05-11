-- Written: 12-May-2020
-- https://www.codewars.com/kata/58112f8004adbbdb500004fe/train/sql

SELECT * FROM (
  SELECT *, 'US' AS location FROM ussales 
  UNION ALL
  SELECT *, 'EU' AS location FROM eusales
) sales
WHERE sales.price > 50.00;u
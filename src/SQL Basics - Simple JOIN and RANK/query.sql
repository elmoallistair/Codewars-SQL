-- Written: 11-May-2020
-- https://www.codewars.com/kata/58094559c47d323ebd000035/train/sql

SELECT
  p.id,
  p.name,
  COUNT(s.sale) as sale_count,
  RANK() OVER (ORDER BY COUNT(s.sale)) as sale_rank
FROM people as p
	JOIN sales as s
  ON p.id = s.people_id
	GROUP BY p.id;

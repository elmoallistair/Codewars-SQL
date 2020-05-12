-- Written: 12-May-2020
-- https://www.codewars.com/kata/5809575e166583acfa000083/train/sql

SELECT
  RANK() OVER (ORDER BY SUM(points) DESC) AS rank,
  COALESCE(NULLIF(clan,''), '[no clan specified]') AS clan,
  SUM(points) AS total_points,
  COUNT(name) AS total_people
FROM people
  GROUP BY clan;
-- Written: 12-May-2020
-- https://www.codewars.com/kata/594257d4db68b6e99200002c/train/sql

SELECT
  project,
  regexp_replace(address,'[0-9]','','g') as letters,
  regexp_replace(address,'[a-zA-Z]','','g') as numbers 
FROM repositories;
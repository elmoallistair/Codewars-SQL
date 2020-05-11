SELECT * FROM (
  SELECT *, 'US' AS location FROM ussales 
  UNION ALL
  SELECT *, 'EU' AS location FROM eusales
) sales
WHERE sales.price > 50.00

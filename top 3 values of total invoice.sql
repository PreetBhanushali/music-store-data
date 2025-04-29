--What are the top 3 values of total invoices ?
WITH cte as(
SELECT
	DISTINCT total,
	dense_rank() OVER(ORDER by total desc) as ranking
FROM
	invoice)
SELECT total 
FROM cte 
WHERE ranking <=3;
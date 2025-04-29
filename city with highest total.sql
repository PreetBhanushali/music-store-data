-- Which city has the best customers? write a query that returns one city that has highest sum of invoice totals.
SELECT
	billing_city,sum(total) as maximum_total
FROM
	invoice
GROUP by billing_city
HAVING sum(total) = (
						SELECT sum(total) 
						from invoice 
						group by billing_city 
						ORDER by sum(total) DESC 
						LIMIT 1
					);
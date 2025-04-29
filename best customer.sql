--Who is the best customer ? The customer who has spent the most money will be declared the best customer.
SELECT
	b.customer_id
	,b.first_name
	,b.last_name
	,sum(total) as total_spent
FROM
	invoice a
	JOIN
	customer b
	on a.customer_id = b.customer_id
GROUP by b.customer_id
HAVING sum(total) = (
						SELECT sum(total)
						FROM invoice
						GROUP by customer_id
						ORDER by sum(total) DESC
						LIMIT 1
);
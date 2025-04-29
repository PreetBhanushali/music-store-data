SELECT country,first_name,last_name,total_spent 
FROM(
SELECT
	billing_country as country
	,first_name
	,last_name
	,sum(total) as total_spent
	,dense_rank() OVER(PARTITION by billing_country ORDER by sum(total) DESC) as ranking
FROM
	invoice a
	JOIN
	customer b
	on a.customer_id = b.customer_id
GROUP by billing_country,first_name,last_name
) 
where ranking = 1;
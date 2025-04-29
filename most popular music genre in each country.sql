SELECT country,genre_name
FROM(
SELECT
	billing_country as country
	,e.name as genre_name
	,count(invoice_line_id) as num_of_sales
	,dense_rank() OVER(PARTITION by billing_country ORDER by count(invoice_line_id)DESC) as ranking
FROM
	invoice b
	JOIN
	invoice_line c
	on b.invoice_id = c.invoice_id
	JOIN
	track d
	on c.track_id = d.track_id 
	JOIN
	genre e
	on d.genre_id = e.genre_id
GROUP by billing_country,e.name
)
WHERE ranking = 1;
	
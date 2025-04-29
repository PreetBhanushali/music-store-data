SELECT
	DISTINCT
	email
	,first_name
	,last_name
	,e.name
FROM
	customer a
	JOIN
	invoice b
	on a.customer_id = b.customer_id
	JOIN
	invoice_line c
	on b.invoice_id = c.invoice_id
	JOIN
	track d 
	on c.track_id = d.track_id
	JOIN
	genre e
	on d.genre_id = e.genre_id
WHERE
	e.name = 'Rock'
ORDER by email ASC;
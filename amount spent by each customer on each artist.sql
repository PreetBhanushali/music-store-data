SELECT
	first_name
	,last_name
	,e.name as artist_name
	,sum(b.unit_price*b.quantity) as total_spent
FROM
	customer x 
	JOIN
	invoice a
	on x.customer_id = a.customer_id
	JOIN
	invoice_line b
	on a.invoice_id = b.invoice_id
	JOIN
	track c
	on b.track_id = c.track_id
	JOIN
	album d
	on c.album_id = d.album_id
	JOIN
	artist e
	on d.artist_id = e.artist_id
GROUP by first_name,last_name,e.name;
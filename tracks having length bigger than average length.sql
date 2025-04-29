SELECT
	name
FROM
	track
WHERE
	milliseconds > (SELECT avg(milliseconds) from track)
ORDER by milliseconds DESC;
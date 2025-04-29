SELECT name,num_of_songs_composed
FROM(
		SELECT
			d.name
			,count(track_id) as num_of_songs_composed
			,dense_rank() OVER(ORDER by count(track_id) desc) as ranking
		FROM
			genre a
			JOIN
			track b
			on a.genre_id = b.genre_id
			JOIN
			album c
			on b.album_id = c.album_id
			JOIN
			artist d
			on c.artist_id = d.artist_id
		WHERE a.name = 'Rock'
		GROUP by d.name
		ORDER by count(track_id) DESC
)
WHERE ranking <=10;
select name, earings_rank from movies 
	inner join oscars on oscars.movie_id = movies.id
where type = 'Best-Picture' and earings_rank = (select min(earings_rank) as earings_rank from movies)    
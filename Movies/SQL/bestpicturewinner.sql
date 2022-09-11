select name, earings_rank from movies, oscars 
where oscars.movie_id = movies.id and type = 'Best-Picture' and earings_rank = (select min(earings_rank) as earings_rank from movies)    
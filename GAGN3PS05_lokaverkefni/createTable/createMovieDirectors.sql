CREATE TABLE MovieDirectors(
    id INTEGER PRIMARY KEY,
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(director_id) REFERENCES Staff(id)
);

DROP TABLE MovieDirectors;
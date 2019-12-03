CREATE TABLE MovieScreenwriters(
    id INTEGER PRIMARY KEY,
    movie_id INT NOT NULL,
    screenwriter_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(screenwriter_id) REFERENCES Staff(id)
);

DROP TABLE Movie Screenwriters;
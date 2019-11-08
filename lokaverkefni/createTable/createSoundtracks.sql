CREATE TABLE Soundtracks(
    id INTEGER PRIMARY KEY,
    title varchar(255) NOT NULL,
    movie_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(song_id) REFERENCES Songs(id)
);

DROP TABLE Soundtracks;
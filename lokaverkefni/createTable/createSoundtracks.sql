CREATE TABLE Soundtracks(
    id INT NOT NULL PRIMARY KEY,
    title varchar(255) NOT NULL,
    movie_id INT NOT NULL FOREIGN KEY,
    song_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(song_id) REFERENCES Songs(id)
);
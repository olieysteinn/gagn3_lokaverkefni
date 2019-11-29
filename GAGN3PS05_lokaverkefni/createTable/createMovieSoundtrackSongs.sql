CREATE TABLE MovieSoundtrackSongs(
    id INTEGER PRIMARY KEY,
    movie_id INT NOT NULL,
    soundtrack_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(soundtrack_id) REFERENCES Soundtracks(id),
    FOREIGN KEY(song_id) REFERENCES Songs(id)
);

DROP TABLE MovieSoundtrackSongs;
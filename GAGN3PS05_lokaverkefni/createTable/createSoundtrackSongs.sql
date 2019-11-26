CREATE TABLE SoundtrackSongs(
    id INTEGER PRIMARY KEY,
    soundtrack_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY(soundtrack_id) REFERENCES Soundtracks(id),
    FOREIGN KEY(song_id) REFERENCES Songs(id)
);

DROP TABLE SoundtrackSongs;
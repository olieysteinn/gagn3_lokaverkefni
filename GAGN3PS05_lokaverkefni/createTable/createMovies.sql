CREATE TABLE Movies(
    id INTEGER PRIMARY KEY,
    title varchar(255) NOT NULL,
    releaseDate DATE NOT NULL,
    budget INT NOT NULL,
    phase SMALLINT NOT NULL,
    summary TEXT NOT NULL,
    soundtrack_id INT NOT NULL,
    FOREIGN KEY(soundtrack_id) REFERENCES Soundtracks(id)
);

DROP TABLE Movies;
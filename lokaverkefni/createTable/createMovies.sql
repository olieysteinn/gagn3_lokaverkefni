CREATE TABLE Movies(
    id INTEGER PRIMARY KEY,
    title varchar(255) NOT NULL,
    releaseDate DATE NOT NULL,
    budget INT NOT NULL,
    phase SMALLINT NOT NULL,
    summary TEXT NOT NULL
);

DROP TABLE Movies;
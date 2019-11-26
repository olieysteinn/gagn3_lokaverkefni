CREATE TABLE Soundtracks(
    id INTEGER PRIMARY KEY,
    title varchar(255) NOT NULL,
    releaseDate DATE NOT NULL,
    length TIME NOT NULL,
    composer_id INT NOT NULL,
    FOREIGN KEY(composer_id) REFERENCES Staff(id)
);

DROP TABLE Soundtracks;
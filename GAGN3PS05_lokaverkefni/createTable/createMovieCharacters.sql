CREATE TABLE MovieCharacters(
    id INTEGER PRIMARY KEY,
    movie_id INT NOT NULL,
    character_id INT NOT NULL,
    actor_id INT NOT NULL,
    alignment_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(actor_id) REFERENCES Staff(id),
    FOREIGN KEY(alignment_id) REFERENCES Alignments(id)
);

DROP TABLE MovieCharacters;
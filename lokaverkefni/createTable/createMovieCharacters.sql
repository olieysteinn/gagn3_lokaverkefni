CREATE TABLE MovieCharacterActor(
    id INTEGER PRIMARY KEY,
    movie_id INT NOT NULL,
    character_id INT NOT NULL,
    staff_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(staff_id) REFERENCES Staff(id)
);

DROP TABLE MovieCharacterActor;
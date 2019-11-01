CREATE TABLE MovieCharacterActor(
    id INT NOT NULL PRIMARY KEY,
    movie_id INT NOT NULL FOREIGN KEY,
    character_id INT NOT NULL FOREIGN KEY,
    staff_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(characters_id) REFERENCES Characters(id),
    FOREIGN KEY(staff_id) REFERENCES Staff(id)
);
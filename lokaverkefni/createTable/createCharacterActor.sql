CREATE TABLE CharacterActor(
    id INTEGER PRIMARY KEY,
    character_id INT NOT NULL,
    staff_id INT NOT NULL,
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(staff_id) REFERENCES Staff(id)
);

DROP TABLE CharacterActor;
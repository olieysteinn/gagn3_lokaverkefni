CREATE TABLE CharacterActor(
    id INT NOT NULL PRIMARY KEY,
    character_id INT NOT NULL FOREIGN KEY,
    staff_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(staff_id) REFERENCES Staff(id)
);
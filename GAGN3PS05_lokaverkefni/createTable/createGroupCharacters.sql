CREATE TABLE GroupCharacters(
    id INTEGER PRIMARY KEY,
    group_id INT NOT NULL,
    character_id INT NOT NULL,
    membership varchar(7) NOT NULL,
    FOREIGN KEY(group_id) REFERENCES Groups(id),
    FOREIGN KEY(character_id) REFERENCES Characters(id)
);

DROP TABLE GroupCharacters;
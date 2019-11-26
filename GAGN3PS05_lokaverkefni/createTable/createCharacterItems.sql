CREATE TABLE CharacterItems(
    id INTEGER PRIMARY KEY,
    character_id INT NOT NULL,
    item_id INT NOT NULL,
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(item_id) REFERENCES Items(id)
);

DROP TABLE CharacterItems;
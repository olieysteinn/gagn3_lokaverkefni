CREATE TABLE CharacterItems(
    id INT NOT NULL PRIMARY KEY,
    character_id INT NOT NULL FOREIGN KEY,
    item_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(item_id) REFERENCES Items(id)
);
CREATE TABLE CharacterAbilities (
    id INTEGER PRIMARY KEY,
    character_id INT NOT NULL,
    ability_id INT NOT NULL,
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(ability_id) REFERENCES Abilities(id)
);

DROP TABLE CharacterAbilities;
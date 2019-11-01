CREATE TABLE CharacterAbilities (
    id INT NOT NULL PRIMARY KEY,
    character_id INT NOT NULL FOREIGN KEY,
    ability_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(character_id) REFERENCES Characters(id),
    FOREIGN KEY(ability_id) REFERENCES Abilities(id)
);
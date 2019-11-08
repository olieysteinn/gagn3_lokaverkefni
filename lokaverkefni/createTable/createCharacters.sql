CREATE TABLE Characters(
    id INTEGER PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    last_name varchar(255),
    date_of_birth DATE NOT NULL,
    place_of_origin varchar(255) NOT NULL,
    alias varchar(255),
    alignment_id INT NOT NULL,
    species_id INT NOT NULL,
    gender_id INT NOT NULL,
    FOREIGN KEY(alignment_id) REFERENCES Alignments(id),
    FOREIGN KEY(species_id) REFERENCES Species(id),
    FOREIGN KEY(gender_id) REFERENCES Genders(id)
);

DROP TABLE Characters;
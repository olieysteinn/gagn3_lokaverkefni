CREATE TABLE Groups(
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL,
    affiliation varchar(255),
    founder varcher(255),
    alignment_id INT NOT NULL,
    FOREIGN KEY(alignment_id) REFERENCES Alignments(id)
);

DROP TABLE Groups;
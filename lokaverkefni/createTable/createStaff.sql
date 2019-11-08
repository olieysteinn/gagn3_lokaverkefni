CREATE TABLE Staff(
    id INTEGER PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    last_name varchar(255) NOT NULL,
    age DATE
);

DROP TABLE Staff;
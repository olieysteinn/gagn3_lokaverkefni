CREATE TABLE Characters(
    id INT NOT NULL PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    last_name varchar(255),
    alias varchar(255) NOT NULL,
    Species varchar(20) NOT NULL,
    gender varchar(10),
    date_of_birth DATE,
    place_of_origin varchar(255),
    description TEXT
);
DROP TABLE Characters;
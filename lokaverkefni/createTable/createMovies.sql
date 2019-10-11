CREATE TABLE Movies(
    id INT NOT NULL PRIMARY KEY,
    title varchar(255) NOT NULL,
    releaseDate DATE NOT NULL,
    director varchar(255) NOT NULL,
    screenwriter varchar(255) NOT NULL,
    producer varchar(255) NOT NULL,
    phase SMALLINT NOT NULL,
    plot TEXT NOT NULL
);
CREATE TABLE Songs(
    id INTEGER PRIMARY KEY,
    title varchar(255) NOT NULL,
    artist varchar(255) NOT NULL,
    length TIME NOT NULL,
    genre varchar(255),
    movie_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id)
);

DROP TABLE Songs;
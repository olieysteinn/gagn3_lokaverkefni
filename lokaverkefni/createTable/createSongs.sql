CREATE TABLE Songs(
    id INT NOT NULL PRIMARY KEY,
    title varchar(255) NOT NULL,
    artist varchar(255) NOT NULL,
    length TIME NOT NULL,
    genre varchar(255),
    movie_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(movie_id) REFERENCES Movies(id)
);
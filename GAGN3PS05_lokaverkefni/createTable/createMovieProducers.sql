CREATE TABLE MovieProducers(
    id INTEGER PRIMARY KEY,
    movie_id INT NOT NULL,
    producer_id INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES Movies(id),
    FOREIGN KEY(producer_id) REFERENCES Staff(id)
);

DROP TABLE MovieProducers;
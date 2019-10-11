CREATE TABLE Staff(
    id INT NOT NULL PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    last_name varchar(255),
    job_id INT NOT NULL,
    age DATE,
    FOREIGN KEY(job) REFERENCES Jobs(id)
);
CREATE TABLE PeopleJobs(
    id INT NOT NULL PRIMARY KEY,
    people_id INT NOT NULL FOREIGN KEY,
    job_id INT NOT NULL FOREIGN KEY,
    FOREIGN KEY(people_id) REFERENCES People(id),
    FOREIGN KEY(job_id) REFERENCES Jobs(id)
);
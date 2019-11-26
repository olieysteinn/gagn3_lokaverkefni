CREATE TABLE StaffJobs(
    id INTEGER PRIMARY KEY,
    staff_id INT NOT NULL,
    job_id INT NOT NULL,
    FOREIGN KEY(staff_id) REFERENCES Staff(id),
    FOREIGN KEY(job_id) REFERENCES Jobs(id)
);

DROP TABLE StaffJobs;
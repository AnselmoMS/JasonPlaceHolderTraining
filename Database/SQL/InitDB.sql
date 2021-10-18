CREATE TABLE post
(
    id SERIAL PRIMARY KEY,
    userid INT,
    title VARCHAR(100),
    body TEXT
);
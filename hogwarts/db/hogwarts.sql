DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses(
id SERIAL PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT REFERENCES houses(id),
  age INT
)

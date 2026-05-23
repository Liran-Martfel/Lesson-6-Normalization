-- the peoblem are:
--1.there are 2 email for ana insted of 2 rows for ana.
--2. TAG3 and TAG 2 shouldn't be exsist.

--id	full_name	emails	tag1	tag2	tag3
--1	Ana Silva	ana@a.com, ana@b.com	VIP	Newsletter	NULL
--2	João Souza	joao@c.com	Newsletter	NULL	NULL
DROP TABLE tags;
DROP TABLE emails;
DROP TABLE students;
CREATE TABLE students
(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	full_name TEXT NOT NULL
); 

CREATE TABLE emails
(
	email_id  INTEGER NOT NULL,
	email_add TEXT NOT NULL,
	PRIMARY KEY (email_id,email_add),
	FOREIGN KEY (email_id) REFERENCES students (id) ON DELETE CASCADE
); 

CREATE TABLE tags
(
	tag_id INTEGER NOT NULL,
	tag TEXT NOT NULL,
	PRIMARY KEY (tag_id,tag),
	FOREIGN KEY (tag_id) REFERENCES students (id) ON DELETE CASCADE

); 
INSERT INTO students (full_name)
VALUES
('Ana Silva'),
('João Souza');

INSERT INTO emails (email_id,email_add)
VALUES
(1,'ana@a.com'),
(1,'ana@b.com'),
(2,'joao@c.com');

INSERT INTO tags (tag_id,tag)
VALUES
(1,'VIP'),
(1,'Newsletter'),
(2,'Newsletter');

SELECT
	s.id AS student_id,
	s.full_name AS students_name,
	e.email_add AS studends_email,
	t.tag AS students_tag
FROM students s
INNER JOIN emails e ON s.id = e.email_id
INNER JOIN tags t ON s.id = t.tag_id;

SELECT
	DISTINCT s.full_name AS Student_name,
	s.id AS students_id
FROM students s
INNER JOIN emails e ON s.id = e.email_id
INNER JOIN tags t ON s.id = t.tag_id
WHERE tag = 'Newsletter';

SELECT
	s.id AS student_id,
	e.email_add AS student_email
FROM students s
INNER JOIN emails e ON s.id = e.email_id;
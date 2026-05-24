--
--isbn (PK)	title	author_id	author_name	publisher_id	publisher_name	publisher_city
--978-1	SQL Mastery	A1	Jane Doe	P1	TechPress	New York
--978-2	Python Pro	A2	John Smith	P1	TechPress	New York
--978-3	Data Viz	A1	Jane Doe	P2	DataBooks	Paris

--there is problem with 1NF with:nothing, but with 2NF and 3NF: publisher city and name,auther_id and publisher_id.

--Identify all transitive dependencies in the table: The column publisher_name is transitively dependent on isbn through publisher_id.
--The column publisher_city is transitively dependent on isbn through publisher_id.
--The column author_name is transitively dependent on isbn through author_id.
DROP TABLE books;
DROP TABLE authors;
DROP TABLE publishers;

CREATE TABLE authors
(
	author_id INTEGER PRIMARY KEY AUTOINCREMENT,
	author_name TEXT NOT NULL
);

CREATE TABLE publishers
(
	publisher_id INTEGER PRIMARY KEY AUTOINCREMENT,
	publisher_name TEXT NOT NULL,
	publisher_city TEXT NOT NULL
);

CREATE TABLE books
(
	isbn INTEGER PRIMARY KEY,
	publisher_id INTEGER NOT NULL,
	author_id INTEGER NOT NULL,
	title TEXT NOT NULL,
	FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE,
	FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id) ON DELETE CASCADE
);

INSERT INTO authors (author_name)
VALUES
('jane Doe'),
('John Doe-Smith');

INSERT INTO publishers (publisher_name,publisher_city)
VALUES
('TechPress','New York'),
('DataBooks','Paris');

INSERT INTO books (isbn,publisher_id,author_id,title)
VALUES
(9781, 1, 1,'SQL Mastery'),
(9782, 1, 2,'Python Pro'),
(9783, 2, 1,'Data Viz');

SELECT *
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN publishers p ON b.publisher_id = p.publisher_id;

--only one row has changed, if there was no normalize rules, in this case, i'll still will be needing to change two rows, 
--one to update the query and one to search for the name 
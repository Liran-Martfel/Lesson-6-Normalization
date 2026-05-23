-- customer_name-order_id,product_name-product_id,unit_price
--order_id (PK)	product_id (PK)	qty	customer_name	product_name	unit_price
--1001	42	2	Alice	Keyboard	49.99
--1001	77	1	Alice	Mouse	29.99
--1002	42	1	Bob	Keyboard	49.99
DROP TABLE orders_item;
DROP TABLE orders;
DROP TABLE product;
DROP TABLE costomers;


CREATE TABLE product
(
	product_number INTEGER PRIMARY KEY AUTOINCREMENT,
	product_name TEXT NOT NULL,
	unit_price REAL NOT NULL
);

CREATE TABLE costomers
(
	costomer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	costomer_name TEXT NOT NULL
);

CREATE TABLE orders
(
	order_number INTEGER PRIMARY KEY AUTOINCREMENT,
	costomer_id INTEGER
);

CREATE TABLE orders_item
(
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	qty INTEGER NOT NULL,
	PRIMARY KEY (product_id,order_id), 
	FOREIGN KEY (product_id) REFERENCES product(product_number),
	FOREIGN KEY (order_id) REFERENCES orders (order_number)
);

INSERT INTO costomers (costomer_name)
VALUES
('Alice'),
('Bob');

INSERT INTO product (product_name,unit_price)
VALUES
('Keyboard',49.99),
('Mouse',29.99);

INSERT INTO orders (costomer_id)
VALUES
(1),
(2);

INSERT INTO orders_item (order_id,product_id,qty)
VALUES
(1,1,2),
(1,2,1),
(2,1,1);

SELECT *
FROM orders_item o
JOIN orders O ON o.order_id = O.order_number
JOIN costomers c ON O.costomer_id = c.costomer_id
JOIN product p ON o.product_id = p.product_number;

--Bonus -- because of the joins and the seperation of all the data in the deffrent tables, all i need to do to change the name for everyone is to change
--the insert name of "Keyboard" to "Mechanical Keyboard". if i were to do it the old way, i would need to change every single row in table orders.


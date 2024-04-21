CREATE DATABASE IF NOT EXISTS 190224_ivencic;
USE 190224_ivencic;
SET sql_safe_updates = 0;

CREATE TABLE IF NOT EXISTS Customer (
	id INT auto_increment primary key,
	first_name VARCHAR(20),
	last_name varchar(20),
	email varchar(255),
	post_index varchar(10),
	country varchar(20),
	city varchar(20),
	street varchar(50),
	created_at DATETIME
);

CREATE TABLE IF NOT EXISTS Orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
	created_at DATETIME,
	item_code VARCHAR(50),
	descript VARCHAR(255),
	img_url VARCHAR(500),
	price DECIMAL(10, 2)
);

-- DROP TABLE Customer;
-- DROP TABLE Orders;

select * from Customer;
select * from Orders;

INSERT INTO Customer (first_name, last_name, email, post_index, country, city, street, created_at) 
VALUES
('John', 'Doe', 'john@gmail.com', '12345', 'USA', 'New York', '123 Main St', '2019-08-13 12:10:11'),
('Alice', 'Smith', 'alice@yahoo.com', '54321', 'UK', 'London', '456 Elm St', '2022-02-01 13:55:00'),
('Bob', 'Johnson', 'bob@mail.com', '98765', 'Canada', 'Toronto', '789 Oak St', '2021-12-31 00:01:00'),
('Emily', 'Brown', 'emily@gmail.com', '67890', 'Australia', 'Sydney', '101 Maple St', '2023-07-25 00:02:00'),
('Michael', 'Didavis', 'michael@yahoo.com', '13579', 'Germany', 'Berlin', '202 Pine St', '2024-02-19 00:03:00');

INSERT INTO Orders (customer_id, created_at, item_code, descript, img_url, price) 
VALUES
(1, '2020-12-01', 'ABC123', 'Desc item 1', 'https://example.com/image1.jpg', 10.99),
(2, '2021-01-11', 'XYZ456', 'Desc item 2', 'https://example.com/image2.jpg', 15.49),
(3, '2022-08-13', 'DEF789', 'Desc item 3', 'https://example.com/image3.jpg', 20.99),
(4, '2023-12-01', 'ABC123', 'Desc item 1', 'https://example.com/image1.jpg', 10.99),
(5, '2023-10-23', 'JKL345', 'Desc item 5', 'https://example.com/image5.jpg', 12.99),
(1, '2022-11-15', 'ABC123', 'Test item 1', 'https://example.com/image1.jpg', 10.99),
(2, '2021-06-04', 'PQR901', 'Test item 7', 'https://example.com/image7.jpg', 18.99);

select * from Customer;
select * from Orders;

ALTER TABLE Customer
	ADD COLUMN last_modified DATETIME DEFAULT NOW();

select * from Customer;

ALTER TABLE Orders
	ADD COLUMN discounter_price DECIMAL (10, 2) DEFAULT 0;

UPDATE Orders
	SET discounter_price = price * 0.9;

select * from Orders;

INSERT INTO Customer (first_name, last_name, email, post_index, country, city, street, created_at, last_modified) 
VALUES
('Vasilii', 'Ivanov', 'vinavo@example.com', '12345', 'BY', 'Minsk', 'Lenina 12', '2024-03-01 10:10:10', NOW()),
('Anton', 'Petrov', 'apetrov@example.com', '54321', 'UA', 'Kiev', 'Pyskina 53', '2024-03-05 11:11:11', NOW()),
('Gheorg', 'Sidorov', 'gsidorov@example.com', '98765', 'KZ', 'Karakanda', 'Almatinskaia 61', '2024-03-10 12:12:12', NOW());

INSERT INTO Orders (customer_id, created_at, item_code, descript, img_url, price) 
VALUES
(6, '2020-02-29 13:13:13', 'AAA234', 'Test item 11', 'https://example.com/image11.jpg', 21.99),
(7, '2024-01-29 13:16:14', 'BBB567', 'Test item 12', 'https://example.com/image12.jpg', 39.00),
(8, '2024-02-29 20:21:22', 'CCC890', 'Test item 13', 'https://example.com/image13.jpg', 99.99);

UPDATE Orders
	SET discounter_price = price * 0.9;

SELECT * FROM Customer;
SELECT * FROM Orders;



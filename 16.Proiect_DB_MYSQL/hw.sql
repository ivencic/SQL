-- DROP database Taxi;

CREATE DATABASE IF NOT EXISTS Taxi;

USE Taxi;

-- Таблица водителей
CREATE TABLE IF NOT EXISTS Driver (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

-- Таблица клиентов
CREATE TABLE IF NOT EXISTS Client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

-- Таблица тарифов
CREATE TABLE IF NOT EXISTS Tariff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(20) UNIQUE
);

-- Таблица машин
CREATE TABLE IF NOT EXISTS Car (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(50),
    tariff INT,
    demand_factor INT
    
);

-- Таблица факторов спроса
CREATE TABLE IF NOT EXISTS Demand_factor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

-- Таблица рабочих смен
CREATE TABLE IF NOT EXISTS Work_shift (
    id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    driver_id INT
);

-- Таблица отзывов
CREATE TABLE IF NOT EXISTS Reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(255),
    last_name_order_id INT
);

-- Таблица типов отзывов
CREATE TABLE IF NOT EXISTS Review_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(20) UNIQUE
);

-- Связующая таблица между отзывами и типами отзывов
CREATE TABLE IF NOT EXISTS Review2Review_type (
    review_id INT,
    review_type_id INT,
    PRIMARY KEY (review_id, review_type_id)
);

-- Таблица заказов
CREATE TABLE IF NOT EXISTS Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT,
    client_id INT,
    tariff_id INT,
    review_id INT,
    demand_fact_id INT
);

ALTER TABLE Car ADD FOREIGN KEY (tariff) REFERENCES Tariff(id);
ALTER TABLE Car ADD FOREIGN KEY (tariff) REFERENCES Tariff(id);
ALTER TABLE Car ADD FOREIGN KEY (demand_factor) REFERENCES Demand_factor(id);
ALTER TABLE Work_shift ADD FOREIGN KEY (car_id) REFERENCES Car(id);
ALTER TABLE Work_shift ADD FOREIGN KEY (driver_id) REFERENCES Driver(id);
ALTER TABLE Reviews ADD FOREIGN KEY (last_name_order_id) REFERENCES Orders(id);
ALTER TABLE Review2Review_type ADD FOREIGN KEY (review_id) REFERENCES Reviews(id);
ALTER TABLE Review2Review_type ADD FOREIGN KEY (review_type_id) REFERENCES Review_type(id);
ALTER TABLE Orders ADD FOREIGN KEY (driver_id) REFERENCES Driver(id);
ALTER TABLE Orders ADD FOREIGN KEY (client_id) REFERENCES Client(id);
ALTER TABLE Orders ADD FOREIGN KEY (tariff_id) REFERENCES Tariff(id);
ALTER TABLE Orders ADD FOREIGN KEY (review_id) REFERENCES Reviews(id);
ALTER TABLE Orders ADD FOREIGN KEY (demand_fact_id) REFERENCES Demand_factor(id);

-- 1. Подключиться к базе данных world (которая находится на удаленном сервере). 
USE world;
DESCRIBE country;
DESCRIBE city;

-- 2.  
/* Посмотреть на таблицы city, country из базы world. 
В каждой таблице есть поле название (Name) и население (Population). 
Поле Name в одной таблице означает название города, а в другой - название страны. 

Написать запрос с помощью UNION, который выводит список названий всех городов и стран с их населением. 
Итоговая выборка должна содержать два столбца: Name, Population. */
SELECT Name, Population from country
UNION
SELECT  Name, Population FROM city;

-- 3. Посмотреть на таблицы в базе world и объяснить ограничения нескольких столбцов - ответить 1 предложением. 

SHOW CREATE TABLE country; --  К примеру поле SurfaceArea - имеет ограничение not null - не может иметь значение Null и 
						   --  стоит значение по умолчянию: 0.00 - если поле не будет заполнено пользователем, оно заполнится автоматически значением 0,00.

--  4. 
/* 	Далее работаем на локальном сервере. Создать новую таблицу citizen, которая содержит следующие поля: 
уникальное автоинкрементное, номер соц страхования, имя, фамилию и емейл. */
USE my_db;
CREATE TABLE citizen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    social_number INT UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);
SELECT * FROM citizen;

--  5.
/* На вашем локальном сервере в любой базе создать таблицу без ограничений (любую, можно взять с урока).  */
CREATE TABLE new_table (
id INT,
first_name varchar (50),
last_name varchar (50),
age INT
);
SELECT * FROM new_table;

--  6. 
/* Добавить в таблицу 5 значений. Добавить 3 человека с одинаковыми именами и 2 человека без lastname */

INSERT INTO new_table (id, first_name, last_name, age) values 
(1, 'Vasea', 'Vasiliev', 20),
(12, 'Vasea', 'Pupkin', 25),
(5, 'Vasea', 'Musk', 31);
INSERT INTO new_table (id, first_name, age) VALUES 
(2, 'Jora', 24),
(3, 'Mona', 18);
SELECT * FROM new_table;

--  7.
/* Использовать оператор alter table … modify , чтобы добавить ограничение not null на поле firstname и lastname.  */

ALTER TABLE new_table
modify first_name varchar (30) NOT NULL;
ALTER TABLE new_table
modify last_name varchar (30) NOT NULL;

--  8.
/* Добавить ограничение unique для пары firstname\lastname. */

ALTER TABLE new_table
ADD constraint unique (first_name, last_name);

-- 9. 
/* Удалить таблицу из базы и пересоздать ее, модифицировав запрос add table так, чтобы он учитывал ограничения (см примеры из класса). */

DROP TABLE new_table;
CREATE TABLE new_table (
id INT,
first_name VARCHAR (30) NOT NULL,
last_name VARCHAR (30) NOT NULL,
age INT,
UNIQUE (first_name, last_name)
);

--  10.
/* Добавить правильные и неправильные данные (нарушающие и не нарушающие ограничения).  */
INSERT INTO new_table (id, first_name, last_name, age) values 
(1, 'Vasea', 'Vasiliev', 20),
(12, 'Vasea', 'Pupkin', 25),
(5, 'Vasea', 'Musk', 31);

INSERT INTO new_table (id, first_name, age) VALUES 
(2, 'Jora', 24),
(3, 'Mona', 18);
SELECT * FROM new_table;
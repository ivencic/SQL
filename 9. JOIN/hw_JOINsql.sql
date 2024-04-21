--  1. Подключитесь к базе данных world (которая находится на удаленном сервере). 
use world;

--  2. Выведите список стран с языками, на которых в них говорят.
-- SELECT * FROM country;
-- SELECT * FROM countrylanguage;

SELECT country.Name, countrylanguage.Language 
FROM country inner join countrylanguage
on country.Code = countrylanguage.CountryCode;

--  3. Выведите список городов с их населением и названием стран

SELECT * FROM city;
SELECT * FROM country;

SELECT city.Name, city.Population, country.Name
FROM city inner join country
on city.CountryCode = country.Code; 

--  4. Выведите список городов в South Africa

SELECT city.Name
FROM city inner join country
on city.CountryCode = country.Code
WHERE country.Code = "ZAF";


--  5.  Выведите список стран с названиями столиц. Подсказка: в таблице country есть поле Capital, которое содержит номер города из таблицы City. 
SELECT country.Name, city.Name
from country inner join city
on country.Capital = city.ID;

--  6. Измените запрос 5 таким образом, чтобы выводилось население в столице. 
SELECT country.Name, city.Name, city.Population
from country inner join city
on country.Capital = city.ID;

--  7. Напишите запрос, который возвращает название столицы United States
SELECT city.Name
FROM city inner join country
on city.ID = country.Capital
WHERE country.Name = "United States";

--  8. Используя базу hr_data.sql, вывести имя, фамилию и город сотрудника.

USE hr;
-- SELECT * FROM employees;
-- SELECT * FROM departments;
-- SELECT * FROM locations;

SELECT employees.first_name, employees.last_name, locations.city
	FROM employees 
		INNER JOIN departments
			ON employees.department_id = departments.department_id
		INNER JOIN locations
			ON departments.location_id = locations.location_id;
            
--  9. Используя базу hr_data.sql, вывести города и соответствующие городам страны.
        
SELECT locations.city, countries.country_name
FROM locations INNER JOIN countries
	ON locations.country_id = countries.country_id;




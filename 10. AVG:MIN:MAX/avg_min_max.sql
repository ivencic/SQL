-- 1. Подключитесь к базе данных hr (которая находится на удаленном сервере). 
USE hr;

-- 2. Выведите количество сотрудников в базе
select count(*) from employees;

-- 3. Выведите количество департаментов (отделов) в базе
select count(*) from departments;

-- 4. Подключитесь к базе данных World (которая находится на удаленном сервере). 
use world;

-- 5. Выведите среднее население в городах Индии (таблица City, код Индии - IND)
	-- select * from city;
	-- select Name, Population from city where CountryCode = 'IND';
	-- select avg(Population) from city;
select avg(Population) as AVG_POPULATION from city where CountryCode = 'IND';

-- 6. Выведите минимальное население в индийском городе и максимальное.
select min(Population) as MIN, max(Population) AS MAX from city where CountryCode = 'IND';


-- 7. Выведите самую большую площадь территории. 
select max(SurfaceArea) from country; 

-- 8. Выведите среднюю продолжительность жизни по странам. 
-- select avg(LifeExpectancy) from country;

SELECT Name, avg(LifeExpectancy) FROM country GROUP BY Name;

-- 9. Найдите самый населенный город (подсказка: использовать подзапросы)
SELECT name, Population FROM city 
WHERE Population = (SELECT max(Population) FROM city);

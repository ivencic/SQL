-- 1.Подключиться к базе данных world
USE world;

-- 2.Вывести население в каждой стране. Результат содержит два поля: CountryCode, sum(Population). Запрос по таблице city.
SELECT city.CountryCode, sum(city.Population)
FROM city
GROUP BY city.CountryCode;

-- 3.Изменить запрос выше так, чтобы выводились только страны с населением более 3 млн человек.
SELECT city.CountryCode, sum(city.Population) as s_pop
FROM city
GROUP BY city.CountryCode
HAVING s_pop > 3000000;

-- 4.Сколько всего записей в результате?
	-- 59 row(s) returned -> 59 записей
    
-- 5.Поменять запрос выше так, чтобы в результате вместо кода страны выводилось ее название. (Подсказка: нужен join таблиц city и country по полю CountryCode)
SELECT country.Name, sum(city.Population) as s_pop
FROM city
INNER JOIN country ON city.CountryCode = country.Code
GROUP BY city.CountryCode
HAVING s_pop > 3000000;

-- 6. Вывести количество городов в каждой стране (CountryCode, amount of cities). (Подсказка: запрос по таблице city и группировка по CountryCode)
SELECT CountryCode, COUNT(*) AS "amount of cities"
FROM city
GROUP BY CountryCode;
 
-- 7.Поменять запрос так, чтобы вместо кодов стран, было названия стран. 
SELECT country.Name, COUNT(*) AS amount_of_cities
FROM city
INNER JOIN country ON city.CountryCode = country.Code
GROUP BY CountryCode;

/* 8.Поменять запрос так, чтобы выводилось среднее количество городов в стране. 
Подсказка: разделите задачу на несколько подзадач. Например, сначала вывести код страны и количество городов в каждой стране.  
Затем сделать join получившегося результата с запросом, где высчитывается среднее от количества городов. 
Потом добавить join, который добавит имена стран, вместо кода. */

--  A: Выводим код страны и количество городов в каждой стране
SELECT city.CountryCode, COUNT(*) AS amount_of_cities
FROM city
GROUP BY CountryCode;

-- B: Делаем соединение с запросом, вычисляющим среднее количество городов
SELECT c.CountryCode, AVG(c.amount_of_cities) AS average_cities
FROM (
    SELECT city.CountryCode, COUNT(*) AS amount_of_cities
    FROM city
    GROUP BY CountryCode
) c
GROUP BY c.CountryCode;

-- C: Добавляем соединение, чтобы получить имена стран
SELECT country.Name, c.average_cities
FROM (
    SELECT c.CountryCode, AVG(c.amount_of_cities) AS average_cities
    FROM (
        SELECT city.CountryCode, COUNT(*) AS amount_of_cities
        FROM city
        GROUP BY CountryCode
    ) c
    GROUP BY c.CountryCode
) c
INNER JOIN country ON c.CountryCode = country.Code;








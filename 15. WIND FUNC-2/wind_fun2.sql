USE world;
/*
1.  Вывести количество городов для каждой страны. Результат должен содержать CountryCode, CityCount (количество городов в стране). 
	Поменяйте запрос с использованием джойнов так, чтобы выводилось название страны вместо CountryCode. */
SELECT 
	CountryCode, 
    COUNT(Name) AS "City count"
FROM city
GROUP BY CountryCode;   
    
SELECT 
	country.Name, 
    COUNT(city.Name) AS "City count"
FROM city   
INNER JOIN country on city.CountryCode = country.Code
GROUP BY CountryCode; 

-- 2. Используя оконные функции, вывести список стран с продолжительностью жизнью и средней продолжительностью жизни. 
SELECT 
	Name, 
	LifeExpectancy, 
	ROUND(AVG(LifeExpectancy) OVER(), 3) AS "AVG life expectancy"
FROM country;

-- 3. Используя ранжирующие функции, вывести страны по убыванию продолжительности жизни.
SELECT 
	Name, 
    LifeExpectancy, 
    DENSE_RANK() OVER (ORDER BY LifeExpectancy DESC) AS LifeRank 
FROM country;

-- 4. Используя ранжирующие функции, вывести третью страну с самой высокой продолжительностью жизни.
SELECT *
FROM (SELECT
			Name, 
            LifeExpectancy,
            DENSE_RANK() OVER (ORDER BY LifeExpectancy DESC) AS LifeRank
	 FROM country) AS t
WHERE LifeRank = 3;

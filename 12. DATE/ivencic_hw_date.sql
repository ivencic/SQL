-- 1. Вывести текущую дату и время.
SELECT NOW();
SELECT CURRENT_TIMESTAMP();

-- 2. Вывести текущий год и месяц
SELECT YEAR(NOW()) AS current_year, MONTH(NOW()) AS current_month;

-- 3. Вывести текущее время
SELECT TIME_FORMAT(NOW(), '%H:%i:%s') AS time_now;

-- 4. Вывести название текущего дня недели
SELECT dayname(NOW()) as Day_name;

-- 5. Вывести номер текущего месяца
SELECT extract(month from NOW()) as num_of_month_now;

-- 6. Вывести номер дня в дате “2020-03-18”
SELECT DAY('2020-03-18') AS day_number;

-- 7. Подключиться к базе данных shop (которая находится на удаленном сервере).
USE shop;

-- 8. Определить какие из покупок были совершены апреле (4-й месяц)
SELECT * FROM ORDERS
WHERE MONTH(ODATE) = 4;

-- 9. Определить количество покупок в 2022-м году
SELECT COUNT(*) as orders_2022 FROM ORDERS
WHERE year(ODATE) = 2022;

-- 10. Определить, сколько покупок было совершено в каждый день. Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - дату и количество покупок

SELECT DATE(ODATE) AS dt, COUNT(*) AS Count_Of_Orders
FROM ORDERS
GROUP BY ODATE
ORDER BY COUNT(*) ASC;

-- 11. Oпределить среднюю стоимость покупок в апреле
SELECT avg(AMT) FROM ORDERS
WHERE MONTH(ODATE) = 4;
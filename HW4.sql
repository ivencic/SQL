USE 190224_ivencic;
SET sql_safe_updates = 0;


-- 1.
SELECT * FROM Orders
ORDER BY price DESC;

-- 2.
SELECT * FROM Customer
WHERE email like '%@gmail.com'; 

-- 3.
SELECT *,
	CASE
		WHEN price < 15.00 THEN "low"
		WHEN price between 15 AND 20 THEN "middle"
		WHEN price > 20 THEN "hight"
	END
    AS status
FROM Orders;

-- 4.
SELECT *,
	CASE
		WHEN price < 15.00 THEN "low"
		WHEN price between 15 AND 20 THEN "middle"
		WHEN price > 20 THEN "hight"
	END
    AS status
FROM Orders
ORDER BY price DESC;

-- 5.
SELECT * FROM Customer
WHERE city = "New York";

-- 6./* Я нашел такое решение */
SELECT item_code
FROM Orders
GROUP BY item_code
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 7.
SELECT *,
price - discounter_price AS discount
FROM Orders
WHERE price - discounter_price = (
		SELECT MAX(price - discounter_price)
        FROM Orders
);

-- 8. 
/* Из первичной цены (price) вычитаем цену со скидкой (discounter_price)*/
SELECT *, price - discounter_price AS sum_discount FROM Orders;

-- 9.
/* Да, может (так это и описанно в ответе на вопрос номер 8)*/

-- 10.
SELECT *,
       ((price - discounter_price) / price) * 100 AS discounter_percent
FROM Orders;
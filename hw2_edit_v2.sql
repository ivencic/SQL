-- 1.
SELECT * 
FROM hr.employees;

-- 2. 
SELECT salary 
FROM hr.employees;

-- 3. 
SELECT
	CASE
		WHEN salary > 10000 THEN 1
        WHEN salary < 10000 THEN 0
	END
	AS SALARY_GROUP
FROM hr.employees;
    
-- 4.
/* Выводится только 1 столбец (SALARY_GROUP), по причине токо что после 
в выборке после команды SELECT ни чего не указанно, а SALARY_GROUP это 
результат оператора CASE, а точнее после команды AS */

-- 5. 
SELECT first_name,
	CASE
		WHEN salary > 10000 THEN 1
		WHEN salary < 10000 THEN 0
    END
	AS SALARY_GROUP
FROM hr.employees;

-- 6.
SELECT 
		AVG(CASE WHEN department_id = 60 or department_id = 90 or department_id = 100 THEN salary 
		ELSE null 
	END) 
	AS avg_dp60_90_100
FROM hr.employees;

-- 7.
/*Разделить уровни (level) сотрудников на junior < 10000,10000<mid<15000, 
senior>15000 в зависимости от их зарплаты.
Вывести список сотрудников (first_name, last_name, level */

SELECT first_name, last_name,
	CASE
		WHEN salary < 10000 THEN 'junior'
		WHEN salary BETWEEN 10000 and 15000 THEN 'mid'
		WHEN salary > 15000 THEN 'senior'
	END
	AS level
FROM hr.employees;        

-- 8. 
/* Посмотреть содержимое таблицы jobs. Написать запрос c использованием оператора case/when/end, который возвращает 2 столбца: job_id, payer_rank, 
где столбец payer_rank формируется по правилу: если максимальная зарплата больше 10000, то “high_payer”, если меньше, то “low payer”. */
SELECT * FROM hr.jobs;

SELECT job_id,
	CASE 
		WHEN max_salary > 10000 THEN 'hight_player'
        WHEN max_salary < 10000 THEN 'low player'
		END AS player_rank
FROM hr.jobs;

-- 9. Переписать этот запрос с использованием оператора IF.

SELECT job_id,
	IF (max_salary > 10000, 'hight_player', IF (max_salary < 10000, "low player", null))
	AS player_rank
FROM hr.jobs;




    
-- 10. 
/*
Поменять предыдущий запрос так, чтобы выводилось 3 столбца, 
к двум существующим добавьте max_salary и отсортировать результат по убыванию.  
*/

SELECT job_id, max_salary , 
	IF (max_salary > 10000, 'hight_player', IF(max_salary < 10000, 'low player', null)) 
    AS player_rank    
FROM hr.jobs
ORDER BY max_salary DESC;

-- Sub Queries


-- Where clause
SELECT *
FROM employee_demographics
WHERE employee_id IN (
	SELECT employee_id
    FROM employee_salary
    WHERE dept_id =1)
;

SELECT *
FROM employee_salary;


SELECT *
FROM employee_demographics
WHERE employee_id IN (
	SELECT employee_id, dept_id
    FROM employee_salary
    WHERE dept_id =1)
;


-- In SELECT subqueries
SELECT 
	first_name, 
    salary, 
	(SELECT AVG(salary)
    FROM employee_salary)
FROM employee_salary;

-- In FROM subqueries
SELECT 
	gender, 
    AVG(age), 
    MAX(age), 
    MIN(age), 
    COUNT(age)
FROM employee_demographics
GROUP BY gender;


SELECT *
FROM 
	(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
    FROM employee_demographics
    GROUP BY gender) AS agg_table
;


SELECT gender, AVG(`MAX(age)`)
FROM 
	(SELECT gender, 
		AVG(age), 
        MAX(age), 
        MIN(age), 
        COUNT(age) 
    FROM employee_demographics
    GROUP BY gender) AS agg_table2
GROUP BY gender
;

SELECT gender, AVG(max_age)
FROM 
	(SELECT gender, 
		AVG(age) AS avg_age, 
        MAX(age) max_age, 
        MIN(age) min_age, 
        COUNT(age) 
    FROM employee_demographics
    GROUP BY gender) AS agg_table2
GROUP BY gender
;

SELECT AVG(max_age) avg_max
FROM
	(SELECT gender,
		AVG(age) AS avg_age,
        MAX(age) AS max_age,
        MIN(age) AS min_age,
        COUNT(age)
	FROM employee_demographics
    GROUP BY gender) AS agg_table3
;

SELECT *,COUNT(age) OVER() AS total_count
FROM employee_demographics;

















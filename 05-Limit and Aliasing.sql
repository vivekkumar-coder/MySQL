-- Limit & Aliasing

SELECT *
FROM employee_demographics
LIMIT 3
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3, 1
;


-- Aliasing
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

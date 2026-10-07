-- Nested subquery
SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT 
    d.gender, 
    AVG(s.salary) AS average_salary
FROM 
    employee_demographics d
INNER JOIN 
    employee_salary s ON d.employee_id = s.employee_id -- Connects the tables using the matching ID
GROUP BY 
    d.gender;
    
    
SELECT * FROM employee_demographics;

SELECT gender, SUM(age) sum_age
FROM employee_demographics
GROUP BY gender;

SELECT gender, SUM(age) sum_age
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(age) sum_age
FROM employee_demographics
GROUP BY gender;

-- SELECT *
-- FROM (SELECT gender, SUM(age) sum_age
-- 	 FROM employee_demographics
--      GROUP BY gender) total_age
-- JOIN (SELECT AVG(age) AS age
-- 	 FROM (SELECT gender, SUM(age) AS sum_age
-- 		   FROM employee_demographics
--            GROUP BY gender) x ) avg_age
-- 	 ON employee_demographics.total_age > avg_age.total_age;
     
WITH GenderAgeTotals AS (
    SELECT 
        gender, 
        SUM(age) AS sum_age
    FROM 
        employee_demographics
    GROUP BY 
        gender
)
SELECT 
    gender, 
    sum_age
FROM 
    GenderAgeTotals
WHERE 
    sum_age > (SELECT AVG(sum_age) FROM GenderAgeTotals);


